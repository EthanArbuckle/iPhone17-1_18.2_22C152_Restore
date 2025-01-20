@interface PHCallParticipantsView
- (BOOL)_statusLabelStringWillFit:(id)a3;
- (BOOL)allowsFieldModeSendButton;
- (BOOL)isCallRinging;
- (BOOL)isShowingInfoButton;
- (BOOL)participantLabelShouldShowLargeAvatar;
- (BOOL)shouldIgnoreUpdates;
- (BOOL)shouldShowParticipantLabel;
- (BOOL)shouldShowSingleDurationLabel;
- (CNKCallParticipantLabelDescriptorFactory)labelDescriptorFactory;
- (ICSCallDisplayStyleManager)callDisplayStyleManager;
- (NSURL)previousURL;
- (PHCallParticipantsView)initWithCallDisplayStyleManager:(id)a3;
- (PHCallParticipantsViewDelegate)delegate;
- (PHMultipleCallParticipantLabelView)bottomMultipleCallLabelView;
- (PHMultipleCallParticipantLabelView)topMultipleCallLabelView;
- (PHSingleCallParticipantLabelView)singleCallLabelView;
- (TUCall)currentCall;
- (UIButton)fieldModeSendButton;
- (UILabel)nameOverrideLabel;
- (UILabel)singleDurationTimerLabel;
- (UILayoutGuide)leadingSideLayoutGuide;
- (UILayoutGuide)trailingSideLayoutGuide;
- (double)multipleCallLabelBaselineOffset;
- (id)compactLabelTextForParticipantLabel:(id)a3;
- (id)customFontForParticipantLabel;
- (id)identificationCategoryDisplayString:(int64_t)a3;
- (unint64_t)bannerButtonsState;
- (unint64_t)indexForParticipantLabel:(id)a3;
- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4;
- (void)callLabelDetailsGestureRecognizerTappedForLabel:(id)a3;
- (void)callLabelInfoLabelWasTappedForLabel:(id)a3;
- (void)dealloc;
- (void)fieldModeButtonTapped:(id)a3;
- (void)participantLabelView:(id)a3 didPerformActionType:(int64_t)a4;
- (void)participantLabelWasTapped:(id)a3;
- (void)setAllowsFieldModeSendButton:(BOOL)a3;
- (void)setBannerAudioRouteButtonSelected:(BOOL)a3;
- (void)setBannerButtonsState:(unint64_t)a3;
- (void)setBottomMultipleCallLabelView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFieldModeSendButton:(id)a3;
- (void)setLeadingSideLayoutGuide:(id)a3;
- (void)setNameOverrideLabel:(id)a3;
- (void)setPreviousURL:(id)a3;
- (void)setShouldShowSingleDurationLabel:(BOOL)a3;
- (void)setSingleCallLabelView:(id)a3;
- (void)setSingleDurationTimerLabel:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTopMultipleCallLabelView:(id)a3;
- (void)setTrailingSideLayoutGuide:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)showSendButtonGestureRecognizer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateParticipantAtIndex:(unint64_t)a3;
- (void)updateParticipantAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)updateParticipants;
- (void)updateParticipantsAnimated:(BOOL)a3;
- (void)updateSingleDurationTimerLabelText;
@end

@implementation PHCallParticipantsView

- (PHCallParticipantsView)initWithCallDisplayStyleManager:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHCallParticipantsView;
  v6 = [(PHCallParticipantsView *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callDisplayStyleManager, a3);
    uint64_t v8 = objc_opt_new();
    labelDescriptorFactory = v7->_labelDescriptorFactory;
    v7->_labelDescriptorFactory = (CNKCallParticipantLabelDescriptorFactory *)v8;

    id v10 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v7 action:"showSendButtonGestureRecognizer:"];
    [v10 setNumberOfTapsRequired:4];
    [(PHCallParticipantsView *)v7 addGestureRecognizer:v10];
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v7 selector:"_metadataCacheDidFinishUpdating:" name:TUMetadataCacheDidFinishUpdatingNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v7 selector:"_isEmergencyCallChanged:" name:TUCallCenterIsEmergencyChangedNotification object:0];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v7 selector:"_lockScreenStatusChanged:" name:@"PHLockScreenStatusChangedNotification" object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHCallParticipantsView;
  [(PHCallParticipantsView *)&v4 dealloc];
}

- (double)multipleCallLabelBaselineOffset
{
  v2 = [(PHCallParticipantsView *)self callDisplayStyleManager];
  id v3 = [v2 callDisplayStyle];

  if (v3 == (id)3) {
    return 60.0;
  }
  if (qword_100325E08 != -1) {
    dispatch_once(&qword_100325E08, &stru_1002CDF70);
  }
  return *(double *)&qword_100325E00;
}

- (void)updateParticipantsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PHCallParticipantsView *)self shouldIgnoreUpdates])
  {
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ignoring request to update participants because updates to the call participants view are disabled", buf, 2u);
    }

    return;
  }
  v6 = [(PHCallParticipantsView *)self delegate];
  id v7 = [v6 numberOfParticipantsForParticipantsView:self];

  uint64_t v8 = [(PHCallParticipantsView *)self delegate];
  v9 = [v8 overrideStringForParticipantsView:self];

  if (v9)
  {
    id v10 = [(PHCallParticipantsView *)self singleCallLabelView];
    [v10 removeFromSuperview];

    v11 = [(PHCallParticipantsView *)self topMultipleCallLabelView];
    [v11 removeFromSuperview];

    v12 = [(PHCallParticipantsView *)self bottomMultipleCallLabelView];
    [v12 removeFromSuperview];

    v13 = [(PHCallParticipantsView *)self singleCallLabelView];
    v14 = [v13 posterNameViewModel];
    [v14 updateStatus:&stru_1002D6110];

    [(PHCallParticipantsView *)self setSingleCallLabelView:0];
    [(PHCallParticipantsView *)self setTopMultipleCallLabelView:0];
    [(PHCallParticipantsView *)self setBottomMultipleCallLabelView:0];
    [(PHCallParticipantsView *)self setShouldShowSingleDurationLabel:0];
    if (!self->_nameOverrideLabel)
    {
      objc_super v15 = (UILabel *)objc_alloc_init((Class)UILabel);
      nameOverrideLabel = self->_nameOverrideLabel;
      self->_nameOverrideLabel = v15;

      [(UILabel *)self->_nameOverrideLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v17 = [(PHCallParticipantsView *)self callDisplayStyleManager];
      v18 = +[PHUIConfiguration singleCallParticipantLabelFontForCallDisplayStyle:](PHUIConfiguration, "singleCallParticipantLabelFontForCallDisplayStyle:", [v17 callDisplayStyle]);
      [(UILabel *)self->_nameOverrideLabel setFont:v18];

      v19 = +[UIColor colorWithWhite:1.0 alpha:1.0];
      [(UILabel *)self->_nameOverrideLabel setTextColor:v19];

      [(UILabel *)self->_nameOverrideLabel setTextAlignment:1];
      [(UILabel *)self->_nameOverrideLabel setLineBreakMode:3];
      [(UILabel *)self->_nameOverrideLabel setAdjustsFontSizeToFitWidth:1];
      [(UILabel *)self->_nameOverrideLabel setMinimumScaleFactor:0.699999988];
      [(PHCallParticipantsView *)self addSubview:self->_nameOverrideLabel];
      v159 = [(UILabel *)self->_nameOverrideLabel leadingAnchor];
      v157 = [(PHCallParticipantsView *)self leadingAnchor];
      v154 = [v159 constraintEqualToAnchor:v157 constant:24.0];
      v185[0] = v154;
      v152 = [(UILabel *)self->_nameOverrideLabel trailingAnchor];
      v150 = [(PHCallParticipantsView *)self trailingAnchor];
      v20 = [v152 constraintEqualToAnchor:v150 constant:-24.0];
      v185[1] = v20;
      v21 = [(UILabel *)self->_nameOverrideLabel centerYAnchor];
      v22 = [(PHCallParticipantsView *)self centerYAnchor];
      v23 = [v21 constraintEqualToAnchor:v22];
      v185[2] = v23;
      v24 = [(UILabel *)self->_nameOverrideLabel bottomAnchor];
      v25 = [(PHCallParticipantsView *)self bottomAnchor];
      v26 = [v24 constraintEqualToAnchor:v25];
      v185[3] = v26;
      v27 = +[NSArray arrayWithObjects:v185 count:4];
      +[NSLayoutConstraint activateConstraints:v27];
    }
    v28 = [(PHCallParticipantsView *)self delegate];
    v29 = [v28 overrideStringForParticipantsView:self];
    [(UILabel *)self->_nameOverrideLabel setText:v29];

    goto LABEL_9;
  }
  if (v7 == (id)2)
  {
    v62 = sub_1000D5130();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Configuring the call participants view for multiple participants", buf, 2u);
    }

    v63 = [(PHCallParticipantsView *)self callDisplayStyleManager];
    id v64 = [v63 callDisplayStyle];

    if (!v64)
    {
      v65 = +[UIApplication sharedApplication];
      v66 = [v65 delegate];
      v67 = [v66 currentInCallScene];
      [v67 requestTransitionToPresentationMode:2 shouldDismissCMASAlerts:0];
    }
    id v68 = objc_alloc_init((Class)UILayoutGuide);
    [(PHCallParticipantsView *)self addLayoutGuide:v68];
    v69 = [v68 centerYAnchor];
    v70 = [(PHCallParticipantsView *)self centerYAnchor];
    v71 = [v69 constraintEqualToAnchor:v70];
    [v71 setActive:1];

    if (!self->_bottomMultipleCallLabelView)
    {
      v160 = v68;
      v72 = [PHMultipleCallParticipantLabelView alloc];
      v73 = [(PHCallParticipantsView *)self callDisplayStyleManager];
      v74 = [(PHMultipleCallParticipantLabelView *)v72 initWithCallDisplayStyleManager:v73];
      bottomMultipleCallLabelView = self->_bottomMultipleCallLabelView;
      self->_bottomMultipleCallLabelView = v74;

      [(PHMultipleCallParticipantLabelView *)self->_bottomMultipleCallLabelView setAccessibilityIdentifier:@"PHMultipleCallParticipantLabelView_Bottom"];
      [(PHMultipleCallParticipantLabelView *)self->_bottomMultipleCallLabelView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PHMultipleCallParticipantLabelView *)self->_bottomMultipleCallLabelView setOverrideUserInterfaceStyle:2];
      [(PHAbstractCallParticipantLabelView *)self->_bottomMultipleCallLabelView setDelegate:self];
      [(PHCallParticipantsView *)self addSubview:self->_bottomMultipleCallLabelView];
      v76 = [(PHMultipleCallParticipantLabelView *)self->_bottomMultipleCallLabelView leadingAnchor];
      v77 = [(PHCallParticipantsView *)self leadingAnchor];
      v78 = [v76 constraintEqualToAnchor:v77];
      v182[0] = v78;
      v79 = [(PHMultipleCallParticipantLabelView *)self->_bottomMultipleCallLabelView trailingAnchor];
      v80 = [(PHCallParticipantsView *)self trailingAnchor];
      v81 = [v79 constraintEqualToAnchor:v80];
      v182[1] = v81;
      v82 = +[NSArray arrayWithObjects:v182 count:2];
      id v155 = [v82 mutableCopy];

      v83 = [(PHCallParticipantsView *)self callDisplayStyleManager];
      id v84 = [v83 callDisplayStyle];

      if (v84 == (id)1)
      {
        id v68 = v160;
        v85 = [v160 bottomAnchor];
        v86 = [(PHAbstractCallParticipantLabelView *)self->_bottomMultipleCallLabelView participantMarqueeLabel];
        v87 = [v86 bottomAnchor];
        v88 = [v85 constraintEqualToAnchor:v87];
        [v155 addObject:v88];
      }
      else
      {
        v85 = [(PHAbstractCallParticipantLabelView *)self->_bottomMultipleCallLabelView participantMarqueeLabel];
        v86 = [v85 firstBaselineAnchor];
        v87 = [(PHCallParticipantsView *)self bottomAnchor];
        v88 = [v86 constraintLessThanOrEqualToAnchor:v87];
        v181[0] = v88;
        v104 = [(PHMultipleCallParticipantLabelView *)self->_bottomMultipleCallLabelView bottomAnchor];
        v105 = [(PHCallParticipantsView *)self bottomAnchor];
        v106 = [v104 constraintLessThanOrEqualToAnchor:v105];
        v181[1] = v106;
        v107 = +[NSArray arrayWithObjects:v181 count:2];
        [v155 addObjectsFromArray:v107];

        id v68 = v160;
      }

      +[NSLayoutConstraint activateConstraints:v155];
      id v108 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"participantLabelWasTapped:"];
      [(PHMultipleCallParticipantLabelView *)self->_bottomMultipleCallLabelView addGestureRecognizer:v108];
    }
    if (!self->_topMultipleCallLabelView)
    {
      v161 = v68;
      v109 = [PHMultipleCallParticipantLabelView alloc];
      v110 = [(PHCallParticipantsView *)self callDisplayStyleManager];
      v111 = [(PHMultipleCallParticipantLabelView *)v109 initWithCallDisplayStyleManager:v110];
      topMultipleCallLabelView = self->_topMultipleCallLabelView;
      self->_topMultipleCallLabelView = v111;

      [(PHMultipleCallParticipantLabelView *)self->_topMultipleCallLabelView setAccessibilityIdentifier:@"PHMultipleCallParticipantLabelView_Top"];
      [(PHMultipleCallParticipantLabelView *)self->_topMultipleCallLabelView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PHMultipleCallParticipantLabelView *)self->_topMultipleCallLabelView setOverrideUserInterfaceStyle:2];
      [(PHAbstractCallParticipantLabelView *)self->_topMultipleCallLabelView setDelegate:self];
      [(PHCallParticipantsView *)self addSubview:self->_topMultipleCallLabelView];
      v113 = [(PHMultipleCallParticipantLabelView *)self->_topMultipleCallLabelView leadingAnchor];
      v114 = [(PHCallParticipantsView *)self leadingAnchor];
      v115 = [v113 constraintEqualToAnchor:v114];
      v180[0] = v115;
      v116 = [(PHMultipleCallParticipantLabelView *)self->_topMultipleCallLabelView trailingAnchor];
      v117 = [(PHCallParticipantsView *)self trailingAnchor];
      v118 = [v116 constraintEqualToAnchor:v117];
      v180[1] = v118;
      v119 = +[NSArray arrayWithObjects:v180 count:2];
      id v156 = [v119 mutableCopy];

      v120 = [(PHCallParticipantsView *)self callDisplayStyleManager];
      id v121 = [v120 callDisplayStyle];

      if (v121 == (id)1)
      {
        id v68 = v161;
        v122 = [v161 topAnchor];
        v123 = [(PHAbstractCallParticipantLabelView *)self->_topMultipleCallLabelView participantMarqueeLabel];
        v153 = [v123 topAnchor];
        v151 = [v122 constraintEqualToAnchor:];
        v179[0] = v151;
        v149 = [(PHAbstractCallParticipantLabelView *)self->_topMultipleCallLabelView participantMarqueeLabel];
        v124 = [v149 bottomAnchor];
        v125 = [(PHAbstractCallParticipantLabelView *)self->_bottomMultipleCallLabelView participantMarqueeLabel];
        v126 = [v125 topAnchor];
        v158 = v124;
        v127 = [v124 constraintEqualToAnchor:v126];
        v179[1] = v127;
        v128 = +[NSArray arrayWithObjects:v179 count:2];
        [v156 addObjectsFromArray:v128];
      }
      else
      {
        v148 = [(PHAbstractCallParticipantLabelView *)self->_topMultipleCallLabelView participantMarqueeLabel];
        v147 = [v148 firstBaselineAnchor];
        v153 = [(PHAbstractCallParticipantLabelView *)self->_bottomMultipleCallLabelView participantMarqueeLabel];
        uint64_t v129 = [v153 firstBaselineAnchor];
        [(PHCallParticipantsView *)self multipleCallLabelBaselineOffset];
        v151 = (void *)v129;
        v149 = [v147 constraintEqualToAnchor:v129 constant:-v130];
        v178[0] = v149;
        v131 = [(PHMultipleCallParticipantLabelView *)self->_topMultipleCallLabelView topAnchor];
        v125 = [(PHCallParticipantsView *)self topAnchor];
        v158 = v131;
        v126 = [v131 constraintEqualToAnchor:v125];
        v178[1] = v126;
        v127 = [(PHMultipleCallParticipantLabelView *)self->_topMultipleCallLabelView bottomAnchor];
        v128 = [(PHAbstractCallParticipantLabelView *)self->_topMultipleCallLabelView participantMarqueeLabel];
        v132 = [v128 lastBaselineAnchor];
        v133 = [v127 constraintEqualToAnchor:v132];
        v178[2] = v133;
        v134 = +[NSArray arrayWithObjects:v178 count:3];
        [v156 addObjectsFromArray:v134];

        v123 = v147;
        v122 = v148;
        id v68 = v161;
      }

      +[NSLayoutConstraint activateConstraints:v156];
      id v135 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"participantLabelWasTapped:"];
      [(PHMultipleCallParticipantLabelView *)self->_topMultipleCallLabelView addGestureRecognizer:v135];
    }
    [(PHCallParticipantsView *)self updateParticipantAtIndex:0 animated:v3];
    [(PHCallParticipantsView *)self updateParticipantAtIndex:1 animated:v3];
    v136 = [(PHCallParticipantsView *)self singleCallLabelView];
    if (v136)
    {
    }
    else
    {
      v137 = [(PHCallParticipantsView *)self nameOverrideLabel];

      if (!v137)
      {
LABEL_57:
        v145 = [(PHCallParticipantsView *)self delegate];
        -[PHCallParticipantsView setShouldShowSingleDurationLabel:](self, "setShouldShowSingleDurationLabel:", [v145 shouldShowSingleDurationLabelInParticipantsView:self]);

        goto LABEL_9;
      }
    }
    if (v3)
    {
      v138 = [(PHCallParticipantsView *)self topMultipleCallLabelView];
      [v138 setAlpha:0.0];

      v139 = [(PHCallParticipantsView *)self bottomMultipleCallLabelView];
      [v139 setAlpha:0.0];

      v140 = [(PHCallParticipantsView *)self singleCallLabelView];
      v141 = [(PHCallParticipantsView *)self nameOverrideLabel];
      v165[0] = _NSConcreteStackBlock;
      v165[1] = 3221225472;
      v165[2] = sub_100032FE8;
      v165[3] = &unk_1002CDFE8;
      id v166 = v140;
      id v167 = v141;
      v168 = self;
      v162[0] = _NSConcreteStackBlock;
      v162[1] = 3221225472;
      v162[2] = sub_100033070;
      v162[3] = &unk_1002CDA70;
      id v163 = v166;
      id v164 = v167;
      id v142 = v167;
      id v143 = v166;
      +[UIView animateWithDuration:v165 animations:v162 completion:0.5];
    }
    else
    {
      v144 = [(PHCallParticipantsView *)self singleCallLabelView];
      [v144 removeFromSuperview];

      id v143 = [(PHCallParticipantsView *)self nameOverrideLabel];
      [v143 removeFromSuperview];
    }

    [(PHCallParticipantsView *)self setSingleCallLabelView:0];
    [(PHCallParticipantsView *)self setNameOverrideLabel:0];
    goto LABEL_57;
  }
  if (v7 != (id)1) {
    goto LABEL_9;
  }
  v31 = sub_1000D5130();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Configuring the call participants view for a single participant", buf, 2u);
  }

  v32 = [(PHCallParticipantsView *)self singleCallLabelView];

  if (!v32)
  {
    v33 = [PHSingleCallParticipantLabelView alloc];
    v34 = [(PHCallParticipantsView *)self callDisplayStyleManager];
    v35 = [(PHSingleCallParticipantLabelView *)v33 initWithCallDisplayStyleManager:v34 delegate:self];
    singleCallLabelView = self->_singleCallLabelView;
    self->_singleCallLabelView = v35;

    [(PHSingleCallParticipantLabelView *)self->_singleCallLabelView setPreservesSuperviewLayoutMargins:1];
    [(PHSingleCallParticipantLabelView *)self->_singleCallLabelView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PHSingleCallParticipantLabelView *)self->_singleCallLabelView setOverrideUserInterfaceStyle:2];
    v37 = sub_1000D5130();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = self->_singleCallLabelView;
      *(_DWORD *)buf = 138412290;
      v184 = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Adding a new single-participant view to the view hierarchy: %@", buf, 0xCu);
    }

    [(PHCallParticipantsView *)self addSubview:self->_singleCallLabelView];
    v39 = [(PHCallParticipantsView *)self leadingSideLayoutGuide];
    [(PHSingleCallParticipantLabelView *)self->_singleCallLabelView setLeadingSideLayoutGuide:v39];

    v40 = [(PHCallParticipantsView *)self trailingSideLayoutGuide];
    [(PHSingleCallParticipantLabelView *)self->_singleCallLabelView setTrailingSideLayoutGuide:v40];

    v41 = +[NSLayoutConstraint constraintWithItem:self->_singleCallLabelView attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:0.0];
    [(PHCallParticipantsView *)self addConstraint:v41];

    v42 = +[NSLayoutConstraint constraintWithItem:self->_singleCallLabelView attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:0.0];
    [(PHCallParticipantsView *)self addConstraint:v42];

    v43 = +[NSLayoutConstraint constraintWithItem:self->_singleCallLabelView attribute:4 relatedBy:-1 toItem:self attribute:4 multiplier:1.0 constant:0.0];
    [(PHCallParticipantsView *)self addConstraint:v43];

    LODWORD(v44) = 1132068864;
    v45 = +[NSLayoutConstraint constraintWithItem:self->_singleCallLabelView attribute:4 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:0.0 priority:v44];
    [(PHCallParticipantsView *)self addConstraint:v45];

    v46 = +[NSLayoutConstraint constraintWithItem:self->_singleCallLabelView attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:0.0];
    [(PHCallParticipantsView *)self addConstraint:v46];
  }
  v47 = [(PHCallParticipantsView *)self delegate];
  char v48 = objc_opt_respondsToSelector();

  if (v48)
  {
    v49 = self->_singleCallLabelView;
    v50 = [(PHCallParticipantsView *)self delegate];
    v51 = [v50 colorForStatusLabelForParticipantAtIndex:0 inParticipantsView:self];
    [(PHSingleCallParticipantLabelView *)v49 setStatusLabelTextColor:v51];
  }
  v52 = [(PHCallParticipantsView *)self delegate];
  char v53 = objc_opt_respondsToSelector();

  if (v53)
  {
    v54 = self->_singleCallLabelView;
    v55 = [(PHCallParticipantsView *)self delegate];
    v56 = [v55 colorForParticipantLabelView:self->_singleCallLabelView];
    [(PHSingleCallParticipantLabelView *)v54 setParticipantMarqueeLabelTextColor:v56];
  }
  v57 = [(PHCallParticipantsView *)self delegate];
  char v58 = objc_opt_respondsToSelector();

  v59 = self->_singleCallLabelView;
  if (v58)
  {
    v60 = [(PHCallParticipantsView *)self delegate];
    v61 = [v60 fontForParticipantLabelView:self->_singleCallLabelView];
    [(PHSingleCallParticipantLabelView *)v59 setParticipantMarqueeLabelFont:v61];
  }
  else
  {
    v60 = [(PHSingleCallParticipantLabelView *)self->_singleCallLabelView updatedParticipantMarqueeLabelFont];
    [(PHSingleCallParticipantLabelView *)v59 setParticipantMarqueeLabelFont:v60];
  }

  [(PHCallParticipantsView *)self updateParticipantAtIndex:0 animated:v3];
  v89 = [(PHCallParticipantsView *)self delegate];
  char v90 = objc_opt_respondsToSelector();

  if (v90)
  {
    v91 = self->_singleCallLabelView;
    v92 = [(PHCallParticipantsView *)self delegate];
    v93 = [v92 fontForParticipantLabelViewStatusLabel:self->_singleCallLabelView];
    [(PHSingleCallParticipantLabelView *)v91 setStatusLabelTextFont:v93];
  }
  v94 = [(PHCallParticipantsView *)self topMultipleCallLabelView];
  if (v94
    || ([(PHCallParticipantsView *)self bottomMultipleCallLabelView],
        (v94 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v146 = [(PHCallParticipantsView *)self nameOverrideLabel];

    if (!v146) {
      goto LABEL_9;
    }
  }
  v95 = [(PHCallParticipantsView *)self topMultipleCallLabelView];
  v96 = v95;
  if (v3)
  {
    v97 = [(PHCallParticipantsView *)self bottomMultipleCallLabelView];
    v98 = [(PHCallParticipantsView *)self nameOverrideLabel];
    v99 = [(PHCallParticipantsView *)self singleCallLabelView];
    [v99 setAlpha:0.0];

    v173[0] = _NSConcreteStackBlock;
    v173[1] = 3221225472;
    v173[2] = sub_100032F2C;
    v173[3] = &unk_1002CDF98;
    id v174 = v96;
    id v175 = v97;
    id v176 = v98;
    v177 = self;
    v169[0] = _NSConcreteStackBlock;
    v169[1] = 3221225472;
    v169[2] = sub_100032FA4;
    v169[3] = &unk_1002CDFC0;
    id v170 = v174;
    id v171 = v175;
    id v172 = v176;
    id v100 = v176;
    id v101 = v175;
    id v102 = v174;
    +[UIView animateWithDuration:v173 animations:v169 completion:0.5];
  }
  else
  {
    [v95 removeFromSuperview];

    v103 = [(PHCallParticipantsView *)self bottomMultipleCallLabelView];
    [v103 removeFromSuperview];

    id v102 = [(PHCallParticipantsView *)self nameOverrideLabel];
    [v102 removeFromSuperview];
  }

  [(PHCallParticipantsView *)self setShouldShowSingleDurationLabel:0];
  [(PHCallParticipantsView *)self setTopMultipleCallLabelView:0];
  [(PHCallParticipantsView *)self setBottomMultipleCallLabelView:0];
  [(PHCallParticipantsView *)self setNameOverrideLabel:0];
LABEL_9:
  v30 = [(PHCallParticipantsView *)self singleDurationTimerLabel];

  if (v30) {
    [(PHCallParticipantsView *)self updateSingleDurationTimerLabelText];
  }
}

- (void)updateParticipants
{
}

- (void)updateParticipantAtIndex:(unint64_t)a3
{
}

- (void)updateParticipantAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  uint64_t v4 = a4;
  if (![(PHCallParticipantsView *)self shouldIgnoreUpdates])
  {
    uint64_t v8 = [(PHCallParticipantsView *)self delegate];
    id v9 = [v8 numberOfParticipantsForParticipantsView:self];

    id v10 = [(PHCallParticipantsView *)self delegate];
    v11 = [v10 callForParticipantAtIndex:a3 inParticipantsView:self];

    objc_storeStrong((id *)&self->_currentCall, v11);
    if (v9 == (id)2)
    {
      v29 = &OBJC_IVAR___PHCallParticipantsView__bottomMultipleCallLabelView;
      if (!a3) {
        v29 = &OBJC_IVAR___PHCallParticipantsView__topMultipleCallLabelView;
      }
      id v7 = (PHSingleCallParticipantLabelView *)*(id *)((char *)&self->super.super.super.isa + *v29);
      previousURL = self->_previousURL;
      self->_previousURL = 0;

      if (v7)
      {
LABEL_7:
        v12 = [(PHCallParticipantsView *)self delegate];
        v13 = [v12 nameForParticipantAtIndex:a3 inParticipantsView:self];

        v14 = [(PHCallParticipantsView *)self delegate];
        objc_super v15 = [v14 labelForParticipantAtIndex:a3 inParticipantsView:self allowsDuration:1];

        v16 = [(PHCallParticipantsView *)self delegate];
        v17 = [v16 supplementalParticipantLabelFormatStringAtIndex:a3 inParticipantsView:self];

        v18 = +[CNKFeatures sharedInstance];
        unsigned __int8 v19 = [v18 isHeroImageEnabled];

        objc_opt_class();
        v89 = v17;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ([v17 length])
          {
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v13);
            v13 = v31 = v13;
          }
          else
          {
            v32 = [(PHCallParticipantsView *)self delegate];
            char v33 = objc_opt_respondsToSelector();

            if ((v33 & 1) == 0) {
              goto LABEL_73;
            }
            v34 = [(PHCallParticipantsView *)self delegate];
            v31 = [v34 localizedSenderIdentityForParticipantAtIndex:a3 inParticipantsView:self];

            if ([v31 length]) {
              [v15 setLocalizedSenderIdentity:v31];
            }
          }

LABEL_73:
          [(PHAbstractCallParticipantLabelView *)v7 setParticipantName:v13];
          [(PHSingleCallParticipantLabelView *)v7 setLabelDescriptor:v15];
          goto LABEL_74;
        }
        v20 = [(PHCallParticipantsView *)self delegate];
        char v21 = objc_opt_respondsToSelector();

        if (v21)
        {
          v22 = [(PHCallParticipantsView *)self delegate];
          v23 = [v22 iconInParticipantsView:self];
          [(PHSingleCallParticipantLabelView *)v7 setIcon:v23];
        }
        v24 = [(PHCallParticipantsView *)self delegate];
        char v25 = objc_opt_respondsToSelector();

        if (v25)
        {
          v26 = [(PHCallParticipantsView *)self delegate];
          v27 = [v26 linkNameForCall:v11];

          if (v27)
          {
            v28 = v27;

            unsigned int v87 = 1;
            v13 = v28;
          }
          else
          {
            unsigned int v87 = 0;
          }
        }
        else
        {
          unsigned int v87 = 0;
        }
        v35 = v7;
        v88 = v35;
        unsigned int v86 = v4;
        if (![v11 isIncoming])
        {
LABEL_35:
          v39 = v15;
          if ((v19 & 1) != 0
            || ([(PHCallParticipantsView *)self callDisplayStyleManager],
                v47 = objc_claimAutoreleasedReturnValue(),
                id v48 = [v47 callDisplayStyle],
                v47,
                v48 == (id)3))
          {
            v49 = [(PHCallParticipantsView *)self delegate];
            v50 = [v49 contactForParticipantAtIndex:0 inParticipantsView:self];
            [(PHSingleCallParticipantLabelView *)v88 setContact:v50];
          }
          v46 = v89;
          if (v89) {
            goto LABEL_39;
          }
          goto LABEL_66;
        }
        v36 = [(PHSingleCallParticipantLabelView *)v35 contact];
        if (v36)
        {

          goto LABEL_35;
        }
        v37 = [(PHCallParticipantsView *)self delegate];
        unsigned int v38 = [v37 shouldShowParticipantImageAtIndex:0 inParticipantsView:self];

        if (!v38) {
          goto LABEL_35;
        }
        v39 = v15;
        v40 = [(PHCallParticipantsView *)self delegate];
        v41 = [v40 contactForParticipantAtIndex:0 inParticipantsView:self];
        [(PHSingleCallParticipantLabelView *)v88 setContact:v41];

        v42 = v88;
        uint64_t v43 = [(PHSingleCallParticipantLabelView *)v88 contact];
        if (v43)
        {
          double v44 = (void *)v43;
          v45 = [(PHSingleCallParticipantLabelView *)v88 contact];
          v46 = v89;
          if ([v45 imageDataAvailable])
          {

            goto LABEL_65;
          }

          if (!v11)
          {
LABEL_65:
            [(PHSingleCallParticipantLabelView *)v42 updateLabelsOrderAndText];
            if (v46)
            {
LABEL_39:
              v51 = [v39 strings];
              v52 = [v51 firstObject];
              char v53 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v46, v52);

              objc_super v15 = [(CNKCallParticipantLabelDescriptorFactory *)self->_labelDescriptorFactory makeLabelWithString:v53];

              goto LABEL_67;
            }
LABEL_66:
            objc_super v15 = v39;
LABEL_67:
            v73 = [(PHCallParticipantsView *)self delegate];
            char v74 = objc_opt_respondsToSelector();

            uint64_t v4 = v86;
            if (v74)
            {
              v75 = [(PHCallParticipantsView *)self delegate];
              v76 = [v75 localizedSenderIdentityForParticipantAtIndex:a3 inParticipantsView:self];

              if ([v76 length]) {
                [v15 setLocalizedSenderIdentity:v76];
              }
            }
            if (v87)
            {
              v77 = [v15 strings];
              v78 = [v77 firstObject];
              [(PHAbstractCallParticipantLabelView *)v88 setParticipantName:v78];

              labelDescriptorFactory = self->_labelDescriptorFactory;
              v80 = [v15 secondaryString];
              v81 = -[CNKCallParticipantLabelDescriptorFactory makeLabelWithString:secondaryString:layoutState:](labelDescriptorFactory, "makeLabelWithString:secondaryString:layoutState:", v13, v80, [v15 layoutState]);
              [(PHSingleCallParticipantLabelView *)v88 setLabelDescriptor:v81];

LABEL_74:
              v82 = [(PHCallParticipantsView *)self delegate];
              -[PHSingleCallParticipantLabelView setActivityState:animated:](v7, "setActivityState:animated:", [v82 activityStateForParticipantAtIndex:a3 inParticipantsView:self], v4);

              v83 = [(PHCallParticipantsView *)self delegate];
              id v84 = [v83 shouldShowInfoButtonForParticipantAtIndex:a3 inParticipantsView:self];

              [(PHSingleCallParticipantLabelView *)v7 setShowsConferenceParticipantsButton:v84];
              if (v84)
              {
                [(PHSingleCallParticipantLabelView *)v7 setShowsCallDetailsViewButton:0];
              }
              else
              {
                v85 = [(PHCallParticipantsView *)self delegate];
                -[PHSingleCallParticipantLabelView setShowsCallDetailsViewButton:](v7, "setShowsCallDetailsViewButton:", [v85 shouldShowCallDetailsViewButton]);
              }
LABEL_78:

              goto LABEL_79;
            }
            goto LABEL_73;
          }
        }
        else
        {
          v46 = v89;
          if (!v11) {
            goto LABEL_65;
          }
        }
        v54 = [v11 callDirectoryName];
        if (v54 || ([v11 imageURL], (v46 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v55 = [v11 provider];
          unsigned int v87 = [v55 isTelephonyProvider];

          if (v54)
          {
LABEL_49:

            v56 = [v11 imageURL];

            if (v56)
            {
              v57 = [v11 imageURL];
              char v58 = [v57 relativePath];
              unsigned int v59 = [v58 isEqualToString:@"/stock"];

              v60 = sub_1000D5130();
              BOOL v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT);
              if (v59)
              {
                if (v61)
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Attempting to display generic business logo", buf, 2u);
                }

                id v62 = +[UIImage genericBusinessLogo];
              }
              else
              {
                if (v61)
                {
                  id v64 = [v11 imageURL];
                  v65 = [v64 relativePath];
                  *(_DWORD *)buf = 138412290;
                  unint64_t v91 = (unint64_t)v65;
                  _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Attempting to display call imageURL: %@", buf, 0xCu);
                }
                id v66 = objc_alloc((Class)UIImage);
                v67 = [v11 imageURL];
                id v68 = [v67 relativePath];
                id v62 = [v66 initWithContentsOfFile:v68];
              }
              if (v62)
              {
                v69 = self->_previousURL;
                v70 = [v11 imageURL];
                LOBYTE(v69) = [(NSURL *)v69 isEqual:v70];

                if ((v69 & 1) == 0) {
                  -[PHSingleCallParticipantLabelView setBusinessLogo:isPerson:](v88, "setBusinessLogo:isPerson:", v62, [v11 callDirectoryIdentityType] == (id)1);
                }
              }

              v42 = v88;
              v46 = v89;
            }
            else
            {
              v63 = sub_1000D5130();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
                sub_1001E9828(v63);
              }

              v42 = v88;
              [(PHSingleCallParticipantLabelView *)v88 setBusinessLogo:0 isPerson:0];
              v46 = v89;
            }
            v71 = [v11 imageURL];
            v72 = self->_previousURL;
            self->_previousURL = v71;

            goto LABEL_65;
          }
        }
        else
        {
          unsigned int v87 = 0;
        }

        goto LABEL_49;
      }
    }
    else if (v9 == (id)1)
    {
      id v7 = self->_singleCallLabelView;
      if (v7) {
        goto LABEL_7;
      }
    }
    v13 = sub_1000D5130();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Ignoring request to update participants because there's no participantLabelView", buf, 2u);
    }
    id v7 = 0;
    goto LABEL_78;
  }
  sub_1000D5130();
  id v7 = (PHSingleCallParticipantLabelView *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v7->super.super.super.super, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v91 = a3;
    _os_log_impl((void *)&_mh_execute_header, &v7->super.super.super.super, OS_LOG_TYPE_DEFAULT, "Ignoring request to update participant at index %lu because updates to the call participants view are disabled", buf, 0xCu);
  }
LABEL_79:
}

- (BOOL)_statusLabelStringWillFit:(id)a3
{
  id v4 = a3;
  id v5 = [(PHCallParticipantsView *)self singleCallLabelView];

  if (v5)
  {
    v6 = [(PHCallParticipantsView *)self singleCallLabelView];
    unsigned __int8 v7 = [v6 _statusLabelStringWillFit:v4];
  }
  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (void)setLeadingSideLayoutGuide:(id)a3
{
  id v6 = a3;
  objc_storeWeak((id *)&self->_leadingSideLayoutGuide, v6);
  singleCallLabelView = self->_singleCallLabelView;
  if (singleCallLabelView)
  {
    id v5 = [(PHSingleCallParticipantLabelView *)singleCallLabelView superview];

    if (v5) {
      [(PHSingleCallParticipantLabelView *)self->_singleCallLabelView setLeadingSideLayoutGuide:v6];
    }
  }
}

- (void)setTrailingSideLayoutGuide:(id)a3
{
  id v6 = a3;
  objc_storeWeak((id *)&self->_trailingSideLayoutGuide, v6);
  singleCallLabelView = self->_singleCallLabelView;
  if (singleCallLabelView)
  {
    id v5 = [(PHSingleCallParticipantLabelView *)singleCallLabelView superview];

    if (v5) {
      [(PHSingleCallParticipantLabelView *)self->_singleCallLabelView setTrailingSideLayoutGuide:v6];
    }
  }
}

- (void)setTextColor:(id)a3
{
  singleCallLabelView = self->_singleCallLabelView;
  id v5 = a3;
  [(PHSingleCallParticipantLabelView *)singleCallLabelView setTextColor:v5];
  [(PHMultipleCallParticipantLabelView *)self->_topMultipleCallLabelView setTextColor:v5];
  [(PHMultipleCallParticipantLabelView *)self->_bottomMultipleCallLabelView setTextColor:v5];
}

- (void)participantLabelWasTapped:(id)a3
{
  id v11 = a3;
  id v4 = [(PHCallParticipantsView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  id v6 = v11;
  if (v5)
  {
    unsigned __int8 v7 = [v11 view];
    unint64_t v8 = [(PHCallParticipantsView *)self indexForParticipantLabel:v7];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v9 = v8;
      id v10 = [(PHCallParticipantsView *)self delegate];
      [v10 participantTappedAtIndex:v9 inParticipantsView:self];
    }
    id v6 = v11;
  }
}

- (void)setShouldShowSingleDurationLabel:(BOOL)a3
{
  if (self->_shouldShowSingleDurationLabel != a3)
  {
    BOOL v3 = a3;
    char v5 = [(PHCallParticipantsView *)self topMultipleCallLabelView];
    [v5 setHidesLabel:v3];

    id v6 = [(PHCallParticipantsView *)self bottomMultipleCallLabelView];
    [v6 setHidesLabel:v3];

    if (v3)
    {
      unsigned __int8 v7 = (UILabel *)objc_alloc_init((Class)UILabel);
      singleDurationTimerLabel = self->_singleDurationTimerLabel;
      self->_singleDurationTimerLabel = v7;

      unint64_t v9 = +[PHUIConfiguration multipleCallStatusLabelFont];
      [(UILabel *)self->_singleDurationTimerLabel setFont:v9];

      id v10 = +[UIColor colorWithWhite:1.0 alpha:1.0];
      [(UILabel *)self->_singleDurationTimerLabel setTextColor:v10];

      [(UILabel *)self->_singleDurationTimerLabel setTextAlignment:2];
      [(UILabel *)self->_singleDurationTimerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PHCallParticipantsView *)self updateSingleDurationTimerLabelText];
      [(PHCallParticipantsView *)self addSubview:self->_singleDurationTimerLabel];
      id v11 = +[NSLayoutConstraint constraintWithItem:self->_singleDurationTimerLabel attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:-24.0];
      [(PHCallParticipantsView *)self addConstraint:v11];

      topMultipleCallLabelView = self->_topMultipleCallLabelView;
      if (topMultipleCallLabelView)
      {
        v13 = +[NSLayoutConstraint constraintWithItem:self->_singleDurationTimerLabel attribute:10 relatedBy:0 toItem:topMultipleCallLabelView attribute:4 multiplier:1.0 constant:3.0];
        [(PHCallParticipantsView *)self addConstraint:v13];
      }
    }
    else
    {
      v14 = [(PHCallParticipantsView *)self singleDurationTimerLabel];
      [v14 removeFromSuperview];

      [(PHCallParticipantsView *)self setSingleDurationTimerLabel:0];
    }
    self->_shouldShowSingleDurationLabel = v3;
    [(PHCallParticipantsView *)self updateParticipants];
  }
}

- (id)identificationCategoryDisplayString:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      BOOL v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"MAYBE_BUSINESS";
      break;
    case 4:
      BOOL v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"MAYBE_COLLECTION";
      break;
    case 5:
      BOOL v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"MAYBE_EMERGENCY";
      break;
    case 6:
      BOOL v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"MAYBE_FRAUD";
      break;
    case 7:
      BOOL v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"MAYBE_GOVERNMENT";
      break;
    case 8:
      BOOL v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"MAYBE_HEALTH";
      break;
    case 9:
      BOOL v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"MAYBE_INFORMATIONAL";
      break;
    case 10:
      BOOL v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"MAYBE_NONPROFIT";
      break;
    case 11:
      BOOL v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"MAYBE_PERSONAL";
      break;
    case 12:
      BOOL v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"MAYBE_POLITICAL";
      break;
    case 13:
      BOOL v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"MAYBE_PUBLICSERVICE";
      break;
    case 14:
      BOOL v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"MAYBE_PRISON";
      break;
    case 16:
      BOOL v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"MAYBE_SPOOFED";
      break;
    case 17:
      BOOL v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"MAYBE_SURVEY";
      break;
    case 18:
      BOOL v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"MAYBE_TELEMARKETING";
      break;
    case 19:
      BOOL v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"MAYBE_TRUSTED";
      break;
    default:
      BOOL v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"MAYBE_JUNK";
      break;
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_1002D6110 table:@"InCallService"];

  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PHCallParticipantsView;
  id v4 = a3;
  [(PHCallParticipantsView *)&v8 traitCollectionDidChange:v4];
  id v5 = [v4 _backlightLuminance];

  id v6 = [(PHCallParticipantsView *)self traitCollection];
  id v7 = [v6 _backlightLuminance];

  if (v5 != v7) {
    [(PHCallParticipantsView *)self updateParticipants];
  }
}

- (void)updateSingleDurationTimerLabelText
{
  BOOL v3 = [(PHCallParticipantsView *)self traitCollection];
  BOOL v4 = [v3 _backlightLuminance] != (id)1;

  id v5 = [(PHCallParticipantsView *)self delegate];
  id v9 = [v5 labelForParticipantAtIndex:0 inParticipantsView:self allowsDuration:v4];

  id v6 = [(PHCallParticipantsView *)self singleDurationTimerLabel];
  id v7 = [v9 strings];
  objc_super v8 = [v7 firstObject];
  [v6 setAttributedOrPlainText:v8];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PHCallParticipantsView;
  -[PHCallParticipantsView setUserInteractionEnabled:](&v5, "setUserInteractionEnabled:");
  [(PHAbstractCallParticipantLabelView *)self->_singleCallLabelView setUserInteractionEnabled:v3];
  [(PHAbstractCallParticipantLabelView *)self->_topMultipleCallLabelView setUserInteractionEnabled:v3];
  [(PHAbstractCallParticipantLabelView *)self->_bottomMultipleCallLabelView setUserInteractionEnabled:v3];
}

- (void)setBannerButtonsState:(unint64_t)a3
{
  id v4 = [(PHCallParticipantsView *)self singleCallLabelView];
  [v4 setBannerButtonsState:a3];
}

- (void)setBannerAudioRouteButtonSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PHCallParticipantsView *)self singleCallLabelView];
  [v4 setBannerAudioRouteButtonSelected:v3];
}

- (unint64_t)indexForParticipantLabel:(id)a3
{
  id v4 = (PHMultipleCallParticipantLabelView *)a3;
  if ((PHMultipleCallParticipantLabelView *)self->_singleCallLabelView == v4 || self->_topMultipleCallLabelView == v4)
  {
    unint64_t v5 = 0;
  }
  else if (self->_bottomMultipleCallLabelView == v4)
  {
    unint64_t v5 = 1;
  }
  else
  {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)callLabelInfoLabelWasTappedForLabel:(id)a3
{
  id v9 = a3;
  id v4 = [(PHCallParticipantsView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    unint64_t v6 = [(PHCallParticipantsView *)self indexForParticipantLabel:v9];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v7 = v6;
      objc_super v8 = [(PHCallParticipantsView *)self delegate];
      [v8 participantViewInfoButtonTappedAtIndex:v7 inParticipantsView:self];
    }
  }
}

- (void)callLabelDetailsGestureRecognizerTappedForLabel:(id)a3
{
  id v4 = [(PHCallParticipantsView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(PHCallParticipantsView *)self delegate];
    [v6 participantViewCallDetailsGestureRecognizerTapped];
  }
}

- (id)compactLabelTextForParticipantLabel:(id)a3
{
  id v4 = a3;
  char v5 = [(PHCallParticipantsView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0
    && (unint64_t v7 = [(PHCallParticipantsView *)self indexForParticipantLabel:v4],
        v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v9 = v7;
    id v10 = [(PHCallParticipantsView *)self delegate];
    objc_super v8 = [v10 compactLabelTextForParticipantAtIndex:v9 inParticipantsView:self];
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

- (void)participantLabelView:(id)a3 didPerformActionType:(int64_t)a4
{
  id v6 = [(PHCallParticipantsView *)self delegate];
  [v6 participantsView:self didPerformActionType:a4];
}

- (BOOL)participantLabelShouldShowLargeAvatar
{
  v2 = [(PHCallParticipantsView *)self delegate];
  unsigned __int8 v3 = [v2 shouldShowLargeAvatar];

  return v3;
}

- (BOOL)isCallRinging
{
  v2 = [(PHCallParticipantsView *)self delegate];
  unsigned __int8 v3 = [v2 isCallRinging];

  return v3;
}

- (BOOL)shouldShowParticipantLabel
{
  v2 = [(PHCallParticipantsView *)self delegate];
  unsigned __int8 v3 = [v2 shouldShowParticipantLabel];

  return v3;
}

- (id)customFontForParticipantLabel
{
  unsigned __int8 v3 = [(PHCallParticipantsView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(PHCallParticipantsView *)self delegate];
    id v6 = [v5 customFontForParticipantLabel];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setAllowsFieldModeSendButton:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v15 = 138412290;
    CFStringRef v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHCallParticipantsView: setAllowsFieldModeSendButton:%@", (uint8_t *)&v15, 0xCu);
  }

  if (self->_allowsFieldModeSendButton != v3)
  {
    if (v3)
    {
      unint64_t v7 = [(PHCallParticipantsView *)self fieldModeSendButton];

      if (!v7)
      {
        objc_super v8 = +[UIButton buttonWithType:1];
        fieldModeSendButton = self->_fieldModeSendButton;
        self->_fieldModeSendButton = v8;

        [(UIButton *)self->_fieldModeSendButton setTranslatesAutoresizingMaskIntoConstraints:0];
        id v10 = self->_fieldModeSendButton;
        id v11 = +[NSBundle conversationKit];
        v12 = [v11 localizedStringForKey:@"FIELD_MODE_SEND" value:&stru_1002D6110 table:@"CallStatus"];
        [(UIButton *)v10 setTitle:v12 forState:0];

        [(UIButton *)self->_fieldModeSendButton sizeToFit];
        [(UIButton *)self->_fieldModeSendButton addTarget:self action:"fieldModeButtonTapped:" forControlEvents:64];
        [(PHCallParticipantsView *)self addSubview:self->_fieldModeSendButton];
        [(UIButton *)self->_fieldModeSendButton setHidden:1];
        v13 = +[NSLayoutConstraint constraintWithItem:self->_fieldModeSendButton attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:-24.0];
        [(PHCallParticipantsView *)self addConstraint:v13];

        v14 = +[NSLayoutConstraint constraintWithItem:self->_fieldModeSendButton attribute:4 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:3.0];
        [(PHCallParticipantsView *)self addConstraint:v14];
      }
    }
    else
    {
      [(UIButton *)self->_fieldModeSendButton removeFromSuperview];
      [(PHCallParticipantsView *)self setFieldModeSendButton:0];
    }
    self->_allowsFieldModeSendButton = v3;
  }
}

- (void)fieldModeButtonTapped:(id)a3
{
  char v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Field mode button tapped", v8, 2u);
  }

  char v5 = [(PHCallParticipantsView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    unint64_t v7 = [(PHCallParticipantsView *)self delegate];
    [v7 fieldModeSendButtonTappedInParticipantsView:self];
  }
}

- (void)showSendButtonGestureRecognizer:(id)a3
{
  char v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Showing send button", v6, 2u);
  }

  char v5 = [(PHCallParticipantsView *)self fieldModeSendButton];
  [v5 setHidden:0];
}

- (BOOL)shouldIgnoreUpdates
{
  BOOL v3 = [(PHCallParticipantsView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  char v5 = [(PHCallParticipantsView *)self delegate];
  unsigned __int8 v6 = [v5 shouldIgnoreUpdatesInParticipantsView:self];

  return v6;
}

- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  [(PHCallParticipantsView *)self invalidateIntrinsicContentSize];
  uint64_t v7 = [(PHCallParticipantsView *)self singleCallLabelView];
  if (v7)
  {
    objc_super v8 = (void *)v7;
    unint64_t v9 = [(PHCallParticipantsView *)self singleCallLabelView];
    unsigned int v10 = [v9 conformsToProtocol:&OBJC_PROTOCOL___ICSCallDisplayStyleHandler];

    if (v10)
    {
      id v11 = [(PHCallParticipantsView *)self singleCallLabelView];
      [v11 callDisplayStyleDidChangeFromStyle:a3 toStyle:a4];
    }
  }
}

- (PHCallParticipantsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHCallParticipantsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldShowSingleDurationLabel
{
  return self->_shouldShowSingleDurationLabel;
}

- (BOOL)allowsFieldModeSendButton
{
  return self->_allowsFieldModeSendButton;
}

- (unint64_t)bannerButtonsState
{
  return self->_bannerButtonsState;
}

- (BOOL)isShowingInfoButton
{
  return self->_isShowingInfoButton;
}

- (PHSingleCallParticipantLabelView)singleCallLabelView
{
  return (PHSingleCallParticipantLabelView *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSingleCallLabelView:(id)a3
{
}

- (UILayoutGuide)leadingSideLayoutGuide
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_leadingSideLayoutGuide);

  return (UILayoutGuide *)WeakRetained;
}

- (UILayoutGuide)trailingSideLayoutGuide
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trailingSideLayoutGuide);

  return (UILayoutGuide *)WeakRetained;
}

- (TUCall)currentCall
{
  return self->_currentCall;
}

- (PHMultipleCallParticipantLabelView)topMultipleCallLabelView
{
  return (PHMultipleCallParticipantLabelView *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTopMultipleCallLabelView:(id)a3
{
}

- (PHMultipleCallParticipantLabelView)bottomMultipleCallLabelView
{
  return (PHMultipleCallParticipantLabelView *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBottomMultipleCallLabelView:(id)a3
{
}

- (UILabel)nameOverrideLabel
{
  return (UILabel *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNameOverrideLabel:(id)a3
{
}

- (UILabel)singleDurationTimerLabel
{
  return (UILabel *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSingleDurationTimerLabel:(id)a3
{
}

- (UIButton)fieldModeSendButton
{
  return (UIButton *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFieldModeSendButton:(id)a3
{
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return (ICSCallDisplayStyleManager *)objc_getProperty(self, a2, 104, 1);
}

- (CNKCallParticipantLabelDescriptorFactory)labelDescriptorFactory
{
  return self->_labelDescriptorFactory;
}

- (NSURL)previousURL
{
  return (NSURL *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPreviousURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousURL, 0);
  objc_storeStrong((id *)&self->_labelDescriptorFactory, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
  objc_storeStrong((id *)&self->_fieldModeSendButton, 0);
  objc_storeStrong((id *)&self->_singleDurationTimerLabel, 0);
  objc_storeStrong((id *)&self->_nameOverrideLabel, 0);
  objc_storeStrong((id *)&self->_bottomMultipleCallLabelView, 0);
  objc_storeStrong((id *)&self->_topMultipleCallLabelView, 0);
  objc_storeStrong((id *)&self->_currentCall, 0);
  objc_destroyWeak((id *)&self->_trailingSideLayoutGuide);
  objc_destroyWeak((id *)&self->_leadingSideLayoutGuide);
  objc_storeStrong((id *)&self->_singleCallLabelView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end