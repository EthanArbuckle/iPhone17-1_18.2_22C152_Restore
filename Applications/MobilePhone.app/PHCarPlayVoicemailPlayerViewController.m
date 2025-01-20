@interface PHCarPlayVoicemailPlayerViewController
+ (id)detailStringForVoicemail:(id)a3;
- (BOOL)firstAppearanceEvent;
- (BOOL)hasMarkedAsRead;
- (BOOL)isPlaying;
- (MPMessage)representedVoicemail;
- (NSLayoutConstraint)labelStackViewBaselineConstraint;
- (NSLayoutConstraint)nameLabelBaselineConstraint;
- (PHCarPlayProgressView)progressView;
- (PHCarPlayVoicemailPlayerViewController)init;
- (TPBadgeView)badgeView;
- (UIButton)callBackButton;
- (UIButton)playPauseButton;
- (UIButton)rewindButton;
- (UILabel)detailLabel;
- (UILabel)nameLabel;
- (UIStackView)labelStackView;
- (double)labelStackViewBaselineConstraintConstant;
- (double)nameLabelBaselineConstraintConstant;
- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3;
- (void)_handleVoicemailPlayerDidPlayToEnd:(id)a3;
- (void)_update;
- (void)callBackButtonTapped:(id)a3;
- (void)dealloc;
- (void)hardwareControlEventNotification:(id)a3;
- (void)loadView;
- (void)playPauseButtonTapped:(id)a3;
- (void)rewindButtonTapped:(id)a3;
- (void)setBadgeView:(id)a3;
- (void)setCallBackButton:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setFirstAppearanceEvent:(BOOL)a3;
- (void)setHasMarkedAsRead:(BOOL)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setLabelStackView:(id)a3;
- (void)setLabelStackViewBaselineConstraint:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setNameLabelBaselineConstraint:(id)a3;
- (void)setPlayPauseButton:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setRepresentedVoicemail:(id)a3;
- (void)setRewindButton:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePlayPauseButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PHCarPlayVoicemailPlayerViewController

- (PHCarPlayVoicemailPlayerViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHCarPlayVoicemailPlayerViewController;
  result = [(PHCarPlayVoicemailPlayerViewController *)&v3 init];
  if (result)
  {
    *(&result->super._respondsToEventsWhileInCall + 1) = 1;
    *(&result->super._respondsToEventsWhileInCall + 3) = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayVoicemailPlayerViewController;
  [(PHCarPlayVoicemailPlayerViewController *)&v4 dealloc];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHCarPlayVoicemailPlayerViewController;
  [(PHCarPlayVoicemailPlayerViewController *)&v5 viewWillDisappear:a3];
  objc_super v3 = +[PHVoicemailPlayerController sharedPlayerController];
  [v3 pause];

  objc_super v4 = +[PHVoicemailPlayerController sharedPlayerController];
  [v4 endInterruption];
}

- (void)loadView
{
  if (+[PHDevice isGeminiCapable])
  {
    objc_super v3 = +[PHApplicationServices sharedInstance];
    objc_super v4 = [v3 callProviderManager];

    [v4 addDelegate:self queue:0];
  }
  id v141 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 400.0, 240.0];
  objc_super v5 = +[UIColor tableBackgroundColor];
  [v141 setBackgroundColor:v5];

  [(PHCarPlayVoicemailPlayerViewController *)self setView:v141];
  v6 = -[PHCarPlayProgressView initWithFrame:]([PHCarPlayProgressView alloc], "initWithFrame:", 0.0, 0.0, 50.0, 20.0);
  v7 = *(UILabel **)((char *)&self->_detailLabel + 1);
  *(UILabel **)((char *)&self->_detailLabel + 1) = (UILabel *)v6;

  [*(id *)((char *)&self->_detailLabel + 1) setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(PHCarPlayVoicemailPlayerViewController *)self view];
  [v8 addSubview:*(UILabel **)((char *)&self->_detailLabel + 1)];

  v9 = [[PHCarPlayVoicemailButton alloc] initWithSymbolType:1];
  v10 = *(PHCarPlayProgressView **)((char *)&self->_progressView + 1);
  *(PHCarPlayProgressView **)((char *)&self->_progressView + 1) = (PHCarPlayProgressView *)v9;

  [*(id *)((char *)&self->_progressView + 1) setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)((char *)&self->_progressView + 1) addTarget:self action:"callBackButtonTapped:" forControlEvents:64];
  [*(id *)((char *)&self->_progressView + 1) sizeToFit];
  [*(id *)((char *)&self->_progressView + 1) setNeedsLayout];
  [*(id *)((char *)&self->_progressView + 1) layoutIfNeeded];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"PHONE" value:&stru_100285990 table:@"PHCarPlay"];
  v145[0] = v12;
  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"CALL_BACK" value:&stru_100285990 table:@"PHCarPlay"];
  v145[1] = v14;
  v15 = +[NSArray arrayWithObjects:v145 count:2];
  [*(id *)((char *)&self->_progressView + 1) setAccessibilityUserInputLabels:v15];

  v16 = [(PHCarPlayVoicemailPlayerViewController *)self view];
  v17 = [(PHCarPlayVoicemailPlayerViewController *)self callBackButton];
  [v16 addSubview:v17];

  v18 = [[PHCarPlayVoicemailButton alloc] initWithSymbolType:24];
  v19 = *(UIButton **)((char *)&self->_callBackButton + 1);
  *(UIButton **)((char *)&self->_callBackButton + 1) = &v18->super;

  [*(id *)((char *)&self->_callBackButton + 1) setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)((char *)&self->_callBackButton + 1) addTarget:self action:"rewindButtonTapped:" forControlEvents:64];
  [*(id *)((char *)&self->_callBackButton + 1) sizeToFit];
  [*(id *)((char *)&self->_callBackButton + 1) setNeedsLayout];
  [*(id *)((char *)&self->_callBackButton + 1) layoutIfNeeded];
  v20 = +[NSBundle bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"CARPLAY_VOICEMAIL_REWIND_BUTTON" value:&stru_100285990 table:@"PHCarPlay"];
  v144[0] = v21;
  v22 = +[NSBundle bundleForClass:objc_opt_class()];
  v23 = [v22 localizedStringForKey:@"CARPLAY_VOICEMAIL_JUMP_BACK_BUTTON" value:&stru_100285990 table:@"PHCarPlay"];
  v144[1] = v23;
  v24 = +[NSArray arrayWithObjects:v144 count:2];
  [*(id *)((char *)&self->_callBackButton + 1) setAccessibilityUserInputLabels:v24];

  v25 = [(PHCarPlayVoicemailPlayerViewController *)self view];
  v26 = [(PHCarPlayVoicemailPlayerViewController *)self rewindButton];
  [v25 addSubview:v26];

  v27 = [[PHCarPlayVoicemailButton alloc] initWithSymbolType:25];
  v28 = *(UIButton **)((char *)&self->_rewindButton + 1);
  *(UIButton **)((char *)&self->_rewindButton + 1) = &v27->super;

  [*(id *)((char *)&self->_rewindButton + 1) setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)((char *)&self->_rewindButton + 1) addTarget:self action:"playPauseButtonTapped:" forControlEvents:64];
  [*(id *)((char *)&self->_rewindButton + 1) setNeedsLayout];
  [*(id *)((char *)&self->_rewindButton + 1) layoutIfNeeded];
  v29 = +[NSBundle bundleForClass:objc_opt_class()];
  v30 = [v29 localizedStringForKey:@"CARPLAY_VOICEMAIL_PLAY_BUTTON" value:&stru_100285990 table:@"PHCarPlay"];
  v143 = v30;
  v31 = +[NSArray arrayWithObjects:&v143 count:1];
  [*(id *)((char *)&self->_rewindButton + 1) setAccessibilityUserInputLabels:v31];

  v32 = [(PHCarPlayVoicemailPlayerViewController *)self view];
  [v32 addSubview:*(UIButton **)((char *)&self->_rewindButton + 1)];

  v33 = (MPMessage *)objc_alloc_init((Class)UILabel);
  v34 = *(MPMessage **)((char *)&self->_representedVoicemail + 1);
  *(MPMessage **)((char *)&self->_representedVoicemail + 1) = v33;

  [*(id *)((char *)&self->_representedVoicemail + 1) setTranslatesAutoresizingMaskIntoConstraints:0];
  v35 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
  [*(id *)((char *)&self->_representedVoicemail + 1) setFont:v35];

  v36 = +[UIColor dynamicLabelColor];
  [*(id *)((char *)&self->_representedVoicemail + 1) setTextColor:v36];

  [*(id *)((char *)&self->_representedVoicemail + 1) setText:&stru_100285990];
  [*(id *)((char *)&self->_representedVoicemail + 1) setTextAlignment:1];
  v37 = [(PHCarPlayVoicemailPlayerViewController *)self view];
  [v37 addSubview:*(MPMessage **)((char *)&self->_representedVoicemail + 1)];

  v38 = (UILabel *)objc_alloc_init((Class)UILabel);
  v39 = *(UILabel **)((char *)&self->_nameLabel + 1);
  *(UILabel **)((char *)&self->_nameLabel + 1) = v38;

  [*(id *)((char *)&self->_nameLabel + 1) setTranslatesAutoresizingMaskIntoConstraints:0];
  v40 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
  [*(id *)((char *)&self->_nameLabel + 1) setFont:v40];

  v41 = +[UIColor dynamicLabelColor];
  [*(id *)((char *)&self->_nameLabel + 1) setTextColor:v41];

  [*(id *)((char *)&self->_nameLabel + 1) setText:&stru_100285990];
  [*(id *)((char *)&self->_nameLabel + 1) setTextAlignment:1];
  id v42 = objc_alloc_init((Class)UIStackView);
  [(PHCarPlayVoicemailPlayerViewController *)self setLabelStackView:v42];

  v43 = [(PHCarPlayVoicemailPlayerViewController *)self labelStackView];
  [v43 setAxis:0];

  v44 = [(PHCarPlayVoicemailPlayerViewController *)self labelStackView];
  [v44 setDistribution:0];

  v45 = [(PHCarPlayVoicemailPlayerViewController *)self labelStackView];
  [v45 setAlignment:5];

  v46 = [(PHCarPlayVoicemailPlayerViewController *)self labelStackView];
  [v46 setTranslatesAutoresizingMaskIntoConstraints:0];

  v47 = [(PHCarPlayVoicemailPlayerViewController *)self labelStackView];
  [v47 setSpacing:4.0];

  v48 = [(PHCarPlayVoicemailPlayerViewController *)self view];
  v49 = [(PHCarPlayVoicemailPlayerViewController *)self labelStackView];
  [v48 addSubview:v49];

  v50 = [(PHCarPlayVoicemailPlayerViewController *)self labelStackView];
  [v50 addArrangedSubview:*(UILabel **)((char *)&self->_nameLabel + 1)];

  v51 = [(PHCarPlayVoicemailPlayerViewController *)self nameLabel];
  v52 = [v51 firstBaselineAnchor];
  v53 = [(PHCarPlayVoicemailPlayerViewController *)self view];
  v54 = [v53 safeAreaLayoutGuide];
  v55 = [v54 topAnchor];
  [(PHCarPlayVoicemailPlayerViewController *)self nameLabelBaselineConstraintConstant];
  [v52 constraintEqualToAnchor:v55];
  v56 = (UIButton *)objc_claimAutoreleasedReturnValue();
  v57 = *(UIButton **)((char *)&self->_playPauseButton + 1);
  *(UIButton **)((char *)&self->_playPauseButton + 1) = v56;

  v58 = [(PHCarPlayVoicemailPlayerViewController *)self labelStackView];
  v59 = [v58 firstBaselineAnchor];
  v60 = [(PHCarPlayVoicemailPlayerViewController *)self nameLabel];
  v61 = [v60 lastBaselineAnchor];
  [(PHCarPlayVoicemailPlayerViewController *)self labelStackViewBaselineConstraintConstant];
  [v59 constraintEqualToAnchor:v61];
  v62 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  v63 = *(NSLayoutConstraint **)((char *)&self->_nameLabelBaselineConstraint + 1);
  *(NSLayoutConstraint **)((char *)&self->_nameLabelBaselineConstraint + 1) = v62;

  v140 = [(PHCarPlayVoicemailPlayerViewController *)self nameLabelBaselineConstraint];
  v142[0] = v140;
  v139 = [(PHCarPlayVoicemailPlayerViewController *)self labelStackViewBaselineConstraint];
  v142[1] = v139;
  v138 = [(PHCarPlayVoicemailPlayerViewController *)self playPauseButton];
  v136 = [v138 topAnchor];
  v137 = [(PHCarPlayVoicemailPlayerViewController *)self labelStackView];
  v135 = [v137 lastBaselineAnchor];
  v134 = [v136 constraintEqualToAnchor:v135 constant:20.0];
  v142[2] = v134;
  v133 = [(PHCarPlayVoicemailPlayerViewController *)self progressView];
  v131 = [v133 topAnchor];
  v132 = [(PHCarPlayVoicemailPlayerViewController *)self playPauseButton];
  v130 = [v132 bottomAnchor];
  v129 = [v131 constraintEqualToAnchor:v130 constant:20.0];
  v142[3] = v129;
  v127 = [(PHCarPlayVoicemailPlayerViewController *)self nameLabel];
  v128 = [(PHCarPlayVoicemailPlayerViewController *)self view];
  v126 = [v128 safeAreaLayoutGuide];
  v125 = +[NSLayoutConstraint constraintWithItem:v127 attribute:9 relatedBy:0 toItem:v126 attribute:9 multiplier:1.0 constant:0.0];
  v142[4] = v125;
  v123 = [(PHCarPlayVoicemailPlayerViewController *)self labelStackView];
  v124 = [(PHCarPlayVoicemailPlayerViewController *)self view];
  v122 = [v124 safeAreaLayoutGuide];
  v121 = +[NSLayoutConstraint constraintWithItem:v123 attribute:9 relatedBy:0 toItem:v122 attribute:9 multiplier:1.0 constant:0.0];
  v142[5] = v121;
  v119 = [(PHCarPlayVoicemailPlayerViewController *)self playPauseButton];
  v120 = [(PHCarPlayVoicemailPlayerViewController *)self view];
  v118 = [v120 safeAreaLayoutGuide];
  v117 = +[NSLayoutConstraint constraintWithItem:v119 attribute:9 relatedBy:0 toItem:v118 attribute:9 multiplier:1.0 constant:0.0];
  v142[6] = v117;
  v115 = [(PHCarPlayVoicemailPlayerViewController *)self progressView];
  v116 = [(PHCarPlayVoicemailPlayerViewController *)self view];
  v114 = [v116 safeAreaLayoutGuide];
  v113 = +[NSLayoutConstraint constraintWithItem:v115 attribute:9 relatedBy:0 toItem:v114 attribute:9 multiplier:1.0 constant:0.0];
  v142[7] = v113;
  v112 = [(PHCarPlayVoicemailPlayerViewController *)self callBackButton];
  v111 = [(PHCarPlayVoicemailPlayerViewController *)self playPauseButton];
  v110 = +[NSLayoutConstraint constraintWithItem:v112 attribute:10 relatedBy:0 toItem:v111 attribute:10 multiplier:1.0 constant:0.0];
  v142[8] = v110;
  v109 = [(PHCarPlayVoicemailPlayerViewController *)self rewindButton];
  v108 = [(PHCarPlayVoicemailPlayerViewController *)self playPauseButton];
  v107 = +[NSLayoutConstraint constraintWithItem:v109 attribute:10 relatedBy:0 toItem:v108 attribute:10 multiplier:1.0 constant:0.0];
  v142[9] = v107;
  v106 = [(PHCarPlayVoicemailPlayerViewController *)self callBackButton];
  v105 = [(PHCarPlayVoicemailPlayerViewController *)self playPauseButton];
  v104 = +[NSLayoutConstraint constraintWithItem:v106 attribute:1 relatedBy:0 toItem:v105 attribute:2 multiplier:1.0 constant:12.0];
  v142[10] = v104;
  v103 = [(PHCarPlayVoicemailPlayerViewController *)self rewindButton];
  v102 = [(PHCarPlayVoicemailPlayerViewController *)self playPauseButton];
  v101 = +[NSLayoutConstraint constraintWithItem:v103 attribute:2 relatedBy:0 toItem:v102 attribute:1 multiplier:1.0 constant:-12.0];
  v142[11] = v101;
  v100 = [(PHCarPlayVoicemailPlayerViewController *)self rewindButton];
  v99 = [v100 widthAnchor];
  v98 = [v99 constraintEqualToConstant:84.0];
  v142[12] = v98;
  v97 = [(PHCarPlayVoicemailPlayerViewController *)self rewindButton];
  v96 = [v97 heightAnchor];
  v95 = [v96 constraintEqualToConstant:50.0];
  v142[13] = v95;
  v94 = [(PHCarPlayVoicemailPlayerViewController *)self playPauseButton];
  v92 = [v94 widthAnchor];
  v93 = [(PHCarPlayVoicemailPlayerViewController *)self rewindButton];
  v91 = [v93 widthAnchor];
  v90 = [v92 constraintEqualToAnchor:v91];
  v142[14] = v90;
  v89 = [(PHCarPlayVoicemailPlayerViewController *)self playPauseButton];
  v87 = [v89 heightAnchor];
  v88 = [(PHCarPlayVoicemailPlayerViewController *)self rewindButton];
  v86 = [v88 heightAnchor];
  v85 = [v87 constraintEqualToAnchor:v86];
  v142[15] = v85;
  v84 = [(PHCarPlayVoicemailPlayerViewController *)self callBackButton];
  v82 = [v84 widthAnchor];
  v83 = [(PHCarPlayVoicemailPlayerViewController *)self rewindButton];
  v81 = [v83 widthAnchor];
  v80 = [v82 constraintEqualToAnchor:v81];
  v142[16] = v80;
  v79 = [(PHCarPlayVoicemailPlayerViewController *)self callBackButton];
  v77 = [v79 heightAnchor];
  v78 = [(PHCarPlayVoicemailPlayerViewController *)self rewindButton];
  v76 = [v78 heightAnchor];
  v75 = [v77 constraintEqualToAnchor:v76];
  v142[17] = v75;
  v74 = [(PHCarPlayVoicemailPlayerViewController *)self progressView];
  v64 = [v74 leftAnchor];
  v65 = [(PHCarPlayVoicemailPlayerViewController *)self rewindButton];
  v66 = [v65 leftAnchor];
  v67 = [v64 constraintEqualToAnchor:v66];
  v142[18] = v67;
  v68 = [(PHCarPlayVoicemailPlayerViewController *)self progressView];
  v69 = [v68 rightAnchor];
  v70 = [(PHCarPlayVoicemailPlayerViewController *)self callBackButton];
  v71 = [v70 rightAnchor];
  v72 = [v69 constraintEqualToAnchor:v71];
  v142[19] = v72;
  v73 = +[NSArray arrayWithObjects:v142 count:20];
  +[NSLayoutConstraint activateConstraints:v73];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PHCarPlayVoicemailPlayerViewController;
  [(PHCarPlayVoicemailPlayerViewController *)&v3 viewWillAppear:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHCarPlayVoicemailPlayerViewController;
  [(PHCarPlayGenericViewController *)&v6 viewDidAppear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"hardwareControlEventNotification:" name:TUCarPlayHardwareControlEventNotification object:0];

  if (*(&self->super._respondsToEventsWhileInCall + 1))
  {
    objc_super v5 = +[PHVoicemailPlayerController sharedPlayerController];
    [v5 play];

    *(&self->super._respondsToEventsWhileInCall + 1) = 0;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHCarPlayVoicemailPlayerViewController;
  [(PHCarPlayGenericViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:TUCarPlayHardwareControlEventNotification object:0];
}

- (double)nameLabelBaselineConstraintConstant
{
  v2 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
  [v2 _scaledValueForValue:36.0];
  double v4 = v3;

  return v4;
}

- (double)labelStackViewBaselineConstraintConstant
{
  v2 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
  [v2 _scaledValueForValue:18.0];
  double v4 = v3;

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PHCarPlayVoicemailPlayerViewController;
  id v4 = a3;
  [(PHCarPlayVoicemailPlayerViewController *)&v14 traitCollectionDidChange:v4];
  objc_super v5 = [(PHCarPlayVoicemailPlayerViewController *)self traitCollection];
  objc_super v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7)
  {
    [(PHCarPlayVoicemailPlayerViewController *)self nameLabelBaselineConstraintConstant];
    double v9 = v8;
    v10 = [(PHCarPlayVoicemailPlayerViewController *)self nameLabelBaselineConstraint];
    [v10 setConstant:v9];

    [(PHCarPlayVoicemailPlayerViewController *)self labelStackViewBaselineConstraintConstant];
    double v12 = v11;
    v13 = [(PHCarPlayVoicemailPlayerViewController *)self labelStackViewBaselineConstraint];
    [v13 setConstant:v12];
  }
}

- (void)playPauseButtonTapped:(id)a3
{
  id v4 = +[PHVoicemailPlayerController sharedPlayerController];
  unsigned int v5 = [v4 isPlaying];

  objc_super v6 = +[PHVoicemailPlayerController sharedPlayerController];
  v7 = v6;
  if (v5) {
    [v6 pause];
  }
  else {
    [v6 play];
  }

  [(PHCarPlayVoicemailPlayerViewController *)self updatePlayPauseButton];
}

- (void)callBackButtonTapped:(id)a3
{
  id v4 = +[PHVoicemailPlayerController sharedPlayerController];
  [v4 pause];

  unsigned int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = [(PHCarPlayVoicemailPlayerViewController *)self representedVoicemail];
    int v41 = 138412290;
    id v42 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Call back button tapped in CarPlay for voicemail %@", (uint8_t *)&v41, 0xCu);
  }
  v7 = [(PHCarPlayVoicemailPlayerViewController *)self representedVoicemail];
  double v8 = [v7 senderDestinationID];

  double v9 = [(PHCarPlayVoicemailPlayerViewController *)self representedVoicemail];
  v10 = [v9 callbackDestinationID];
  id v11 = [v10 length];

  if (v11)
  {
    double v12 = [(PHCarPlayVoicemailPlayerViewController *)self representedVoicemail];
    uint64_t v13 = [v12 callbackDestinationID];

    double v8 = (void *)v13;
  }
  objc_super v14 = +[PHApplicationServices sharedInstance];
  v15 = [v14 callProviderManager];

  v16 = [v15 telephonyProvider];
  if (v16)
  {
    v17 = [objc_alloc((Class)TUDialRequest) initWithProvider:v16];
    id v18 = [objc_alloc((Class)TUHandle) initWithType:2 value:v8];
    [v17 setHandle:v18];

    [v17 setOriginatingUIType:48];
    v19 = PHDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = 138412802;
      id v42 = v17;
      __int16 v43 = 2112;
      v44 = v8;
      __int16 v45 = 2112;
      v46 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Created a dial request %@ to callback from voicemail in CarPlay to destinationID %@ with telephonyCallProvider %@", (uint8_t *)&v41, 0x20u);
    }

    v20 = [(PHCarPlayVoicemailPlayerViewController *)self representedVoicemail];
    uint64_t v21 = [v20 receiverDestinationID];
    if (!v21) {
      goto LABEL_19;
    }
    v22 = (void *)v21;
    v23 = [(PHCarPlayVoicemailPlayerViewController *)self representedVoicemail];
    v24 = [v23 receiverDestinationID];
    id v25 = [v24 length];

    if (!v25)
    {
LABEL_20:
      if ([v17 isValid])
      {
        v39 = +[UIApplication sharedApplication];
        v40 = [v17 URL];
        [v39 openURL:v40 withCompletionHandler:0];
      }
      else
      {
        v39 = PHDefaultLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          [(PHCarPlayVoicemailPlayerViewController *)(uint64_t)v8 callBackButtonTapped:v39];
        }
      }

      goto LABEL_25;
    }
    v26 = [(PHCarPlayVoicemailPlayerViewController *)self representedVoicemail];
    v27 = [v26 receiverDestinationID];
    v20 = +[TUHandle handleWithDestinationID:v27];

    v28 = [(PHCarPlayVoicemailPlayerViewController *)self representedVoicemail];
    v29 = [v28 receiverISOCountryCode];
    v30 = [v20 canonicalHandleForISOCountryCode:v29];

    v31 = [v16 senderIdentityForHandle:v30];
    v32 = [v31 accountUUID];
    [v17 setLocalSenderIdentityAccountUUID:v32];

    v33 = [v17 localSenderIdentityAccountUUID];

    v34 = PHDefaultLog();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    if (v33)
    {
      if (v35)
      {
        v36 = [v17 localSenderIdentityAccountUUID];
        int v41 = 138412290;
        id v42 = v36;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "To ensure the correct line is used, setting the dial request's local sender identity UUID to: %@", (uint8_t *)&v41, 0xCu);
LABEL_17:
      }
    }
    else if (v35)
    {
      v36 = [(PHCarPlayVoicemailPlayerViewController *)self representedVoicemail];
      v37 = [v36 receiverDestinationID];
      v38 = [v16 prioritizedSenderIdentities];
      int v41 = 138412546;
      id v42 = v37;
      __int16 v43 = 2112;
      v44 = v38;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "None of the prioritized sender identities matched the voicemail's receiver destination ID: %@. Prioritized sender identities are: %@", (uint8_t *)&v41, 0x16u);

      goto LABEL_17;
    }

LABEL_19:
    goto LABEL_20;
  }
  v17 = PHDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[PHCarPlayVoicemailPlayerViewController callBackButtonTapped:](v17);
  }
LABEL_25:
}

- (void)rewindButtonTapped:(id)a3
{
  double v3 = +[PHVoicemailPlayerController sharedPlayerController];
  id v4 = v3;
  if (v3) {
    [v3 currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  float Seconds = CMTimeGetSeconds(&time);

  objc_super v6 = +[PHVoicemailPlayerController sharedPlayerController];
  float v7 = Seconds + -15.0;
  if ((float)(Seconds + -15.0) < 0.0) {
    float v7 = 0.0;
  }
  CMTimeMake(&v8, (uint64_t)v7, 1);
  [v6 seekToTime:&v8];
}

- (void)hardwareControlEventNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHCarPlaykVoicemailPlayerController received hardware control event notification: %@", (uint8_t *)&v11, 0xCu);
  }

  if ([(PHCarPlayVoicemailPlayerViewController *)self isViewLoaded])
  {
    objc_super v6 = +[UIApplication sharedApplication];
    unsigned __int8 v7 = [v6 isSuspended];

    if ((v7 & 1) == 0)
    {
      CMTime v8 = [v4 userInfo];
      double v9 = [v8 valueForKey:kTUCarPlayHardwareControlButtonKey];

      if (v9 == (void *)kTUCarPlayHardwareControlButtonGreenTelephone
        || v9 == (void *)kTUCarPlayHardwareControlButtonWhiteTelephone)
      {
        [(PHCarPlayVoicemailPlayerViewController *)self callBackButtonTapped:0];
      }
    }
  }
}

- (void)setRepresentedVoicemail:(id)a3
{
  id v4 = a3;
  if (([(PHCarPlayVoicemailPlayerViewController *)self isViewLoaded] & 1) == 0) {
    [(PHCarPlayVoicemailPlayerViewController *)self loadView];
  }
  unsigned int v5 = *(void **)&self->_isPlaying;
  *(void *)&self->_isPlaying = v4;
  id v6 = v4;

  [(PHCarPlayVoicemailPlayerViewController *)self _update];
  unsigned __int8 v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_handleVoicemailPlayerDidStartPlaying:" name:@"kPHVoicemailPlayerControllerDidStartPlayingNotification" object:0];

  CMTime v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"_handleVoicemailPlayerRateChanged:" name:@"kPHVoicemailPlayerControllerRateChangedNotification" object:0];

  double v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"_handleVoicemailPlayerDidPlayToEnd:" name:@"kPHVoicemailPlayerControllerDidPlayToEndNotification" object:0];

  id v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"_handleApplicationDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];
}

- (void)_update
{
  double v3 = +[PHApplicationServices sharedInstance];
  id v4 = [v3 suggestedContactStore];

  if (v4)
  {
    unsigned int v5 = [(PHCarPlayVoicemailPlayerViewController *)self representedVoicemail];
    id v6 = [v5 displayNameUsingContactStore:v4];
  }
  else
  {
    id v6 = 0;
  }
  if (![v6 length])
  {
    unsigned __int8 v7 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"UNKNOWN" value:&stru_100285990 table:@"PHCarPlay"];

    id v6 = (void *)v8;
  }
  double v9 = [(PHCarPlayVoicemailPlayerViewController *)self nameLabel];
  [v9 setText:v6];

  id v10 = [(PHCarPlayVoicemailPlayerViewController *)self representedVoicemail];
  int v11 = +[PHCarPlayVoicemailPlayerViewController detailStringForVoicemail:v10];
  id v12 = [(PHCarPlayVoicemailPlayerViewController *)self detailLabel];
  [v12 setText:v11];

  if (+[PHDevice isGeminiCapable])
  {
    uint64_t v13 = +[PHApplicationServices sharedInstance];
    objc_super v14 = [v13 callProviderManager];

    v15 = [v14 telephonyProvider];
    v16 = [v15 prioritizedSenderIdentities];
    if ((unint64_t)[v16 count] > 1)
    {
      v17 = [(PHCarPlayVoicemailPlayerViewController *)self representedVoicemail];
      id v18 = [v17 receiverDestinationID];
      id v19 = [v18 length];

      if (!v19)
      {
LABEL_17:

        goto LABEL_18;
      }
      v20 = [v14 telephonyProvider];
      uint64_t v21 = [(PHCarPlayVoicemailPlayerViewController *)self representedVoicemail];
      v22 = [v21 receiverDestinationID];
      v23 = +[TUHandle handleWithDestinationID:v22];
      v24 = [v20 senderIdentityForHandle:v23];
      v15 = [v24 localizedShortName];

      if (![v15 length])
      {
        id v25 = [(PHCarPlayVoicemailPlayerViewController *)self representedVoicemail];
        uint64_t v26 = [v25 receiverDestinationID];

        v15 = (void *)v26;
      }
      v27 = [(PHCarPlayVoicemailPlayerViewController *)self badgeView];
      v28 = v27;
      if (!v15)
      {
        [v27 removeFromSuperview];

        [(PHCarPlayVoicemailPlayerViewController *)self setBadgeView:0];
        goto LABEL_16;
      }

      if (!v28)
      {
        id v29 = [objc_alloc((Class)TPBadgeView) initWithTitle:v15 theme:5];
        [v29 setSizeCategory:4];
        v30 = [(PHCarPlayVoicemailPlayerViewController *)self labelStackView];
        [v30 insertArrangedSubview:v29 atIndex:0];

        [(PHCarPlayVoicemailPlayerViewController *)self setBadgeView:v29];
      }
      v16 = [(PHCarPlayVoicemailPlayerViewController *)self badgeView];
      [v16 setTitle:v15];
    }

LABEL_16:
    goto LABEL_17;
  }
LABEL_18:
  v31 = [*(id *)&self->_isPlaying dataURL];
  v32 = +[AVAsset assetWithURL:v31];

  v33 = +[PHVoicemailPlayerController sharedPlayerController];
  CMTimeMake(&v35, 1, 100);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = __49__PHCarPlayVoicemailPlayerViewController__update__block_invoke;
  v34[3] = &unk_10027E0D0;
  v34[4] = self;
  [v33 loadAudio:v32 withObserverForInterval:&v35 usingBlock:v34];
}

void __49__PHCarPlayVoicemailPlayerViewController__update__block_invoke(uint64_t a1, long long *a2)
{
  id v4 = +[PHVoicemailPlayerController sharedPlayerController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __49__PHCarPlayVoicemailPlayerViewController__update__block_invoke_2;
  v5[3] = &unk_10027E668;
  long long v6 = *a2;
  uint64_t v7 = *((void *)a2 + 2);
  v5[4] = *(void *)(a1 + 32);
  [v4 currentAssetDurationWithBlock:v5];
}

void __49__PHCarPlayVoicemailPlayerViewController__update__block_invoke_2(uint64_t a1, long long *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__PHCarPlayVoicemailPlayerViewController__update__block_invoke_3;
  block[3] = &unk_10027E640;
  long long v3 = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  long long v5 = *a2;
  uint64_t v6 = *((void *)a2 + 2);
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __49__PHCarPlayVoicemailPlayerViewController__update__block_invoke_3(uint64_t a1)
{
  CMTime time = *(CMTime *)(a1 + 40);
  float Seconds = CMTimeGetSeconds(&time);
  CMTime time = *(CMTime *)(a1 + 64);
  float v3 = CMTimeGetSeconds(&time);
  uint64_t v4 = [*(id *)(a1 + 32) progressView];
  [v4 setProgress:(float)(Seconds / v3)];

  long long v5 = +[NSString stringWithFormat:@"%02d:%02d", ((int)Seconds / 60), ((int)Seconds % 60)];
  uint64_t v6 = [*(id *)(a1 + 32) progressView];
  uint64_t v7 = [v6 elapsedLabel];
  [v7 setText:v5];

  uint64_t v8 = +[NSString stringWithFormat:@"-%02d:%02d", ((int)(float)(v3 - Seconds) / 60), ((int)(float)(v3 - Seconds) % 60)];
  double v9 = [*(id *)(a1 + 32) progressView];
  id v10 = [v9 remainingLabel];
  [v10 setText:v8];

  id result = [*(id *)(a1 + 32) hasMarkedAsRead];
  if ((result & 1) == 0 && (float)(Seconds / v3) > 0.75)
  {
    id v12 = +[PHApplicationServices sharedInstance];
    uint64_t v13 = [v12 voicemailManager];
    objc_super v14 = [*(id *)(a1 + 32) representedVoicemail];
    v17 = v14;
    v15 = +[NSArray arrayWithObjects:&v17 count:1];
    [v13 markVoicemailsAsRead:v15];

    return [*(id *)(a1 + 32) setHasMarkedAsRead:1];
  }
  return result;
}

- (void)updatePlayPauseButton
{
  float v3 = +[PHVoicemailPlayerController sharedPlayerController];
  unsigned int v4 = [v3 isPlaying];

  long long v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 localizedStringForKey:@"CARPLAY_VOICEMAIL_PAUSE_BUTTON" value:&stru_100285990 table:@"PHCarPlay"];
    objc_super v14 = v7;
    uint64_t v8 = &v14;
    uint64_t v9 = 26;
  }
  else
  {
    uint64_t v7 = [v5 localizedStringForKey:@"CARPLAY_VOICEMAIL_PLAY_BUTTON" value:&stru_100285990 table:@"PHCarPlay"];
    uint64_t v13 = v7;
    uint64_t v8 = &v13;
    uint64_t v9 = 25;
  }
  id v10 = +[NSArray arrayWithObjects:v8 count:1];
  [*(id *)((char *)&self->_rewindButton + 1) setAccessibilityUserInputLabels:v10];

  int v11 = *(UIButton **)((char *)&self->_rewindButton + 1);
  id v12 = +[UIImage tpImageForSymbolType:v9 textStyle:UIFontTextStyleTitle1 scale:2 isStaticSize:1];
  [v11 setImage:v12 forState:0];
}

- (void)_handleVoicemailPlayerDidPlayToEnd:(id)a3
{
  unsigned int v4 = +[PHVoicemailPlayerController sharedPlayerController];
  [v4 pause];

  long long v5 = +[PHVoicemailPlayerController sharedPlayerController];
  long long v6 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  [v5 seekToTime:&v6];

  [(PHCarPlayVoicemailPlayerViewController *)self updatePlayPauseButton];
}

- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3
{
  id v4 = a3;
  long long v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2112;
    id v14 = v4;
    id v6 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v11, 0x16u);
  }
  if ([(PHCarPlayVoicemailPlayerViewController *)self isViewLoaded])
  {
    uint64_t v7 = [(PHCarPlayVoicemailPlayerViewController *)self view];
    uint64_t v8 = [v7 window];

    if (v8)
    {
      uint64_t v9 = +[PHVoicemailPlayerController sharedPlayerController];
      [v9 pause];

      id v10 = +[PHVoicemailPlayerController sharedPlayerController];
      [v10 endInterruption];
    }
  }
}

+ (id)detailStringForVoicemail:(id)a3
{
  id v3 = a3;
  id v4 = +[PHApplicationServices sharedInstance];
  long long v5 = [v4 suggestedContactStore];

  if (v5)
  {
    id v6 = [v3 displayNameUsingContactStore:v5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_alloc_init((Class)NSDateFormatter);
  [v7 setTimeStyle:0];
  [v7 setDateStyle:1];
  [v7 setDoesRelativeDateFormatting:1];
  uint64_t v8 = [v3 date];
  uint64_t v9 = [v7 stringFromDate:v8];

  if ([v6 length])
  {
    CFStringRef v10 = +[NSString stringWithFormat:@"%@%@", v6, @" — "];

    id v6 = (void *)v10;
  }
  else
  {
    CFStringRef v10 = &stru_100285990;
  }
  int v11 = +[NSString stringWithFormat:@"%@%@", v10, v9];

  return v11;
}

- (MPMessage)representedVoicemail
{
  return *(MPMessage **)&self->_isPlaying;
}

- (UILabel)nameLabel
{
  return (UILabel *)objc_getProperty(self, a2, 25, 1);
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)detailLabel
{
  return (UILabel *)objc_getProperty(self, a2, 33, 1);
}

- (void)setDetailLabel:(id)a3
{
}

- (PHCarPlayProgressView)progressView
{
  return (PHCarPlayProgressView *)objc_getProperty(self, a2, 41, 1);
}

- (void)setProgressView:(id)a3
{
}

- (UIButton)callBackButton
{
  return (UIButton *)objc_getProperty(self, a2, 49, 1);
}

- (void)setCallBackButton:(id)a3
{
}

- (UIButton)rewindButton
{
  return (UIButton *)objc_getProperty(self, a2, 57, 1);
}

- (void)setRewindButton:(id)a3
{
}

- (UIButton)playPauseButton
{
  return (UIButton *)objc_getProperty(self, a2, 65, 1);
}

- (void)setPlayPauseButton:(id)a3
{
}

- (BOOL)firstAppearanceEvent
{
  return *(&self->super._respondsToEventsWhileInCall + 1);
}

- (void)setFirstAppearanceEvent:(BOOL)a3
{
  *(&self->super._respondsToEventsWhileInCall + 1) = a3;
}

- (BOOL)isPlaying
{
  return *(&self->super._respondsToEventsWhileInCall + 2);
}

- (void)setIsPlaying:(BOOL)a3
{
  *(&self->super._respondsToEventsWhileInCall + 2) = a3;
}

- (BOOL)hasMarkedAsRead
{
  return *(&self->super._respondsToEventsWhileInCall + 3);
}

- (void)setHasMarkedAsRead:(BOOL)a3
{
  *(&self->super._respondsToEventsWhileInCall + 3) = a3;
}

- (NSLayoutConstraint)nameLabelBaselineConstraint
{
  return *(NSLayoutConstraint **)((char *)&self->_playPauseButton + 1);
}

- (void)setNameLabelBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelStackViewBaselineConstraint
{
  return *(NSLayoutConstraint **)((char *)&self->_nameLabelBaselineConstraint + 1);
}

- (void)setLabelStackViewBaselineConstraint:(id)a3
{
}

- (TPBadgeView)badgeView
{
  return *(TPBadgeView **)((char *)&self->_labelStackViewBaselineConstraint + 1);
}

- (void)setBadgeView:(id)a3
{
}

- (UIStackView)labelStackView
{
  return *(UIStackView **)((char *)&self->_badgeView + 1);
}

- (void)setLabelStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_badgeView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_labelStackViewBaselineConstraint + 1), 0);
  objc_storeStrong((id *)((char *)&self->_nameLabelBaselineConstraint + 1), 0);
  objc_storeStrong((id *)((char *)&self->_playPauseButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_rewindButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_callBackButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_detailLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_nameLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_representedVoicemail + 1), 0);

  objc_storeStrong((id *)&self->_isPlaying, 0);
}

- (void)callBackButtonTapped:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not initiate dial request, the telephone call provider is nil.", v1, 2u);
}

- (void)callBackButtonTapped:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not dial the specified telephone number (%@), invalid dial request (%@)", (uint8_t *)&v3, 0x16u);
}

@end