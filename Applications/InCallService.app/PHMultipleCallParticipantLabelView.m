@interface PHMultipleCallParticipantLabelView
- (BOOL)isDisplayStyleAmbient;
- (BOOL)isDisplayStyleMiniWindow;
- (ICSCallDisplayStyleManager)callDisplayStyleManager;
- (NSArray)badgeViewHiddenLayoutConstraints;
- (NSArray)badgeViewVisibleLayoutConstraints;
- (NSLayoutConstraint)participantMarqueeLabelRightConstraint;
- (NSLayoutConstraint)statusLabelRightConstraint;
- (PHMultipleCallParticipantLabelView)initWithCallDisplayStyleManager:(id)a3;
- (TPBadgeView)badgeView;
- (UIActivityIndicatorView)progressSpinner;
- (UIButton)conferenceParticipantsButton;
- (double)labelAlphaValueForActivityState:(unsigned __int16)a3;
- (double)leadingTrailingLabelSpacing;
- (double)spacingBetweenLabels;
- (id)marqueeLabelFont;
- (id)statusLabelFont;
- (void)dealloc;
- (void)infoButtonTapped:(id)a3;
- (void)setActivityState:(unsigned __int16)a3;
- (void)setActivityState:(unsigned __int16)a3 animated:(BOOL)a4;
- (void)setBadgeView:(id)a3;
- (void)setConferenceParticipantsButton:(id)a3;
- (void)setHidesLabel:(BOOL)a3;
- (void)setLabelDescriptor:(id)a3;
- (void)setParticipantMarqueeLabelRightConstraint:(id)a3;
- (void)setProgressSpinner:(id)a3;
- (void)setShowsActivitySpinner:(BOOL)a3;
- (void)setShowsCallDetailsViewButton:(BOOL)a3;
- (void)setShowsConferenceParticipantsButton:(BOOL)a3;
- (void)setStatusLabelRightConstraint:(id)a3;
- (void)setTextColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PHMultipleCallParticipantLabelView

- (PHMultipleCallParticipantLabelView)initWithCallDisplayStyleManager:(id)a3
{
  id v5 = a3;
  v61.receiver = self;
  v61.super_class = (Class)PHMultipleCallParticipantLabelView;
  v6 = [(PHAbstractCallParticipantLabelView *)&v61 initWithCallDisplayStyleManager:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callDisplayStyleManager, a3);
    v8 = [(PHMultipleCallParticipantLabelView *)v7 marqueeLabelFont];
    v9 = [(PHAbstractCallParticipantLabelView *)v7 participantMarqueeLabel];
    [v9 setFont:v8];

    v10 = [(PHAbstractCallParticipantLabelView *)v7 participantMarqueeLabel];
    v11 = [v10 leadingAnchor];
    v12 = [(PHMultipleCallParticipantLabelView *)v7 leadingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12 constant:24.0];

    [v13 setActive:1];
    id v14 = [objc_alloc((Class)TPBadgeView) initWithTitle:&stru_1002D6110 theme:1];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v14 setHidden:1];
    [(PHMultipleCallParticipantLabelView *)v7 addSubview:v14];
    [(PHMultipleCallParticipantLabelView *)v7 setBadgeView:v14];
    [(PHMultipleCallParticipantLabelView *)v7 leadingTrailingLabelSpacing];
    double v16 = v15;
    v17 = [v14 centerYAnchor];
    v18 = [(PHAbstractCallParticipantLabelView *)v7 participantMarqueeLabel];
    v19 = [v18 centerYAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    [(PHMultipleCallParticipantLabelView *)v7 addConstraint:v20];

    v21 = [v14 leadingAnchor];
    v22 = [(PHMultipleCallParticipantLabelView *)v7 leadingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:v16];
    [(PHMultipleCallParticipantLabelView *)v7 addConstraint:v23];

    v24 = [(PHAbstractCallParticipantLabelView *)v7 participantMarqueeLabel];
    v25 = [v24 leadingAnchor];
    v26 = [(PHMultipleCallParticipantLabelView *)v7 badgeView];
    v27 = [v26 trailingAnchor];
    v28 = [v25 constraintEqualToAnchor:v27 constant:6.0];

    [v28 setActive:0];
    v63 = v13;
    uint64_t v29 = +[NSArray arrayWithObjects:&v63 count:1];
    badgeViewHiddenLayoutConstraints = v7->_badgeViewHiddenLayoutConstraints;
    v7->_badgeViewHiddenLayoutConstraints = (NSArray *)v29;

    v62 = v28;
    uint64_t v31 = +[NSArray arrayWithObjects:&v62 count:1];
    badgeViewVisibleLayoutConstraints = v7->_badgeViewVisibleLayoutConstraints;
    v7->_badgeViewVisibleLayoutConstraints = (NSArray *)v31;

    [(PHMultipleCallParticipantLabelView *)v7 addConstraints:v7->_badgeViewHiddenLayoutConstraints];
    [(PHMultipleCallParticipantLabelView *)v7 addConstraints:v7->_badgeViewVisibleLayoutConstraints];
    v33 = [(PHAbstractCallParticipantLabelView *)v7 participantMarqueeLabel];
    v34 = +[NSLayoutConstraint constraintWithItem:v33 attribute:3 relatedBy:0 toItem:v7 attribute:3 multiplier:1.0 constant:0.0];
    [(PHMultipleCallParticipantLabelView *)v7 addConstraint:v34];

    id v35 = objc_alloc_init((Class)UILabel);
    [(PHAbstractCallParticipantLabelView *)v7 setStatusLabel:v35];

    v36 = [(PHAbstractCallParticipantLabelView *)v7 statusLabel];
    [v36 setAccessibilityIdentifier:@"PHMultipleCallParticipantLabelView_StatusLabel"];

    v37 = [(PHMultipleCallParticipantLabelView *)v7 statusLabelFont];
    v38 = [(PHAbstractCallParticipantLabelView *)v7 statusLabel];
    [v38 setFont:v37];

    v39 = +[UIColor secondaryLabelColor];
    v40 = [(PHAbstractCallParticipantLabelView *)v7 statusLabel];
    [v40 setTextColor:v39];

    v41 = [(PHAbstractCallParticipantLabelView *)v7 statusLabel];
    [v41 setTextAlignment:1];

    v42 = [(PHAbstractCallParticipantLabelView *)v7 statusLabel];
    [v42 setTranslatesAutoresizingMaskIntoConstraints:0];

    v43 = [(PHAbstractCallParticipantLabelView *)v7 statusLabel];
    [(PHMultipleCallParticipantLabelView *)v7 addSubview:v43];

    v44 = [(PHAbstractCallParticipantLabelView *)v7 statusLabel];
    v45 = [(PHAbstractCallParticipantLabelView *)v7 participantMarqueeLabel];
    v46 = +[NSLayoutConstraint constraintWithItem:v44 attribute:10 relatedBy:0 toItem:v45 attribute:10 multiplier:1.0 constant:0.0];
    [(PHMultipleCallParticipantLabelView *)v7 addConstraint:v46];

    v47 = [(PHAbstractCallParticipantLabelView *)v7 statusLabel];
    v48 = +[NSLayoutConstraint constraintWithItem:v47 attribute:6 relatedBy:0 toItem:v7 attribute:6 multiplier:1.0 constant:-v16];
    [(PHMultipleCallParticipantLabelView *)v7 setStatusLabelRightConstraint:v48];

    [(PHMultipleCallParticipantLabelView *)v7 addConstraint:v7->_statusLabelRightConstraint];
    v49 = [(PHAbstractCallParticipantLabelView *)v7 statusLabel];
    v50 = [(PHAbstractCallParticipantLabelView *)v7 participantMarqueeLabel];
    v51 = +[NSLayoutConstraint constraintWithItem:v49 attribute:3 relatedBy:0 toItem:v50 attribute:3 multiplier:1.0 constant:0.0];
    [(PHMultipleCallParticipantLabelView *)v7 addConstraint:v51];

    v52 = [(PHAbstractCallParticipantLabelView *)v7 statusLabel];
    v53 = [(PHAbstractCallParticipantLabelView *)v7 participantMarqueeLabel];
    [(PHMultipleCallParticipantLabelView *)v7 spacingBetweenLabels];
    v55 = +[NSLayoutConstraint constraintWithItem:v52 attribute:5 relatedBy:1 toItem:v53 attribute:6 multiplier:1.0 constant:v54];
    [(PHMultipleCallParticipantLabelView *)v7 setParticipantMarqueeLabelRightConstraint:v55];

    [(PHMultipleCallParticipantLabelView *)v7 addConstraint:v7->_participantMarqueeLabelRightConstraint];
    v56 = [(PHAbstractCallParticipantLabelView *)v7 participantMarqueeLabel];
    LODWORD(v57) = 1132068864;
    [v56 setContentCompressionResistancePriority:0 forAxis:v57];

    v58 = [(PHAbstractCallParticipantLabelView *)v7 statusLabel];
    LODWORD(v59) = 1148846080;
    [v58 setContentCompressionResistancePriority:0 forAxis:v59];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHMultipleCallParticipantLabelView;
  [(PHMultipleCallParticipantLabelView *)&v4 dealloc];
}

- (id)marqueeLabelFont
{
  if ([(PHMultipleCallParticipantLabelView *)self isDisplayStyleMiniWindow])
  {
    uint64_t v3 = +[PHUIConfiguration multipleCallParticipantLabelFontMiniWindow];
  }
  else
  {
    if ([(PHMultipleCallParticipantLabelView *)self isDisplayStyleAmbient])
    {
      objc_super v4 = +[UIFont systemFontOfSize:50.0 weight:UIFontWeightMedium];
      id v5 = [v4 withCaseSensitiveAttribute];

      goto LABEL_7;
    }
    uint64_t v3 = +[PHUIConfiguration multipleCallParticipantLabelFont];
  }
  id v5 = (void *)v3;
LABEL_7:

  return v5;
}

- (id)statusLabelFont
{
  if ([(PHMultipleCallParticipantLabelView *)self isDisplayStyleMiniWindow])
  {
    uint64_t v3 = +[PHUIConfiguration multipleCallStatusLabelFontMiniWindow];
  }
  else
  {
    if ([(PHMultipleCallParticipantLabelView *)self isDisplayStyleAmbient])
    {
      objc_super v4 = +[UIFont systemFontOfSize:50.0 weight:UIFontWeightMedium];
      id v5 = [v4 withCaseSensitiveAttribute];

      goto LABEL_7;
    }
    uint64_t v3 = +[PHUIConfiguration multipleCallStatusLabelFont];
  }
  id v5 = (void *)v3;
LABEL_7:

  return v5;
}

- (double)leadingTrailingLabelSpacing
{
  v2 = [(PHMultipleCallParticipantLabelView *)self callDisplayStyleManager];
  id v3 = [v2 callDisplayStyle];

  double v4 = 24.0;
  if (v3 == (id)1)
  {
    unint64_t v5 = +[PHUIConfiguration screenSize];
    if (v5 - 10 <= 5) {
      return dbl_1002842E8[v5 - 10];
    }
  }
  return v4;
}

- (double)spacingBetweenLabels
{
  v2 = [(PHMultipleCallParticipantLabelView *)self callDisplayStyleManager];
  id v3 = [v2 callDisplayStyle];

  double v4 = 15.0;
  if (v3 == (id)1)
  {
    unint64_t v5 = +[PHUIConfiguration screenSize];
    if (v5 - 10 <= 5) {
      return dbl_100284318[v5 - 10];
    }
  }
  return v4;
}

- (BOOL)isDisplayStyleMiniWindow
{
  v2 = [(PHMultipleCallParticipantLabelView *)self callDisplayStyleManager];
  BOOL v3 = [v2 callDisplayStyle] == (id)1;

  return v3;
}

- (BOOL)isDisplayStyleAmbient
{
  v2 = [(PHMultipleCallParticipantLabelView *)self callDisplayStyleManager];
  BOOL v3 = [v2 callDisplayStyle] == (id)3;

  return v3;
}

- (void)setLabelDescriptor:(id)a3
{
  id v16 = a3;
  double v4 = [v16 strings];
  unint64_t v5 = [v4 firstObject];

  v6 = [v16 localizedSenderIdentity];
  id v7 = [v6 length];

  v8 = [(PHMultipleCallParticipantLabelView *)self badgeView];
  v9 = v8;
  if (v7)
  {
    [v8 setHidden:0];

    v10 = [v16 localizedSenderIdentity];
    v11 = [(PHMultipleCallParticipantLabelView *)self badgeView];
    [v11 setTitle:v10];

    v12 = [(PHMultipleCallParticipantLabelView *)self badgeViewVisibleLayoutConstraints];
    +[NSLayoutConstraint activateConstraints:v12];

    [(PHMultipleCallParticipantLabelView *)self badgeViewHiddenLayoutConstraints];
  }
  else
  {
    [v8 setHidden:1];

    v13 = [(PHMultipleCallParticipantLabelView *)self badgeViewHiddenLayoutConstraints];
    +[NSLayoutConstraint activateConstraints:v13];

    [(PHMultipleCallParticipantLabelView *)self badgeViewVisibleLayoutConstraints];
  id v14 = };
  +[NSLayoutConstraint deactivateConstraints:v14];

  double v15 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
  [v15 setAttributedOrPlainText:v5];
}

- (void)setShowsActivitySpinner:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(PHMultipleCallParticipantLabelView *)self progressSpinner];

  if (v3)
  {
    if (!v5)
    {
      v6 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:3];
      progressSpinner = self->_progressSpinner;
      self->_progressSpinner = v6;

      [(UIActivityIndicatorView *)self->_progressSpinner startAnimating];
      [(PHMultipleCallParticipantLabelView *)self addSubview:self->_progressSpinner];
      v8 = [(PHMultipleCallParticipantLabelView *)self progressSpinner];
      [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

      v9 = self->_progressSpinner;
      v10 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
      v11 = +[NSLayoutConstraint constraintWithItem:v9 attribute:6 relatedBy:0 toItem:v10 attribute:5 multiplier:1.0 constant:-5.0];
      [(PHMultipleCallParticipantLabelView *)self addConstraint:v11];

      v12 = self->_progressSpinner;
      v13 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
      id v14 = +[NSLayoutConstraint constraintWithItem:v12 attribute:10 relatedBy:0 toItem:v13 attribute:10 multiplier:1.0 constant:0.0];
      [(PHMultipleCallParticipantLabelView *)self addConstraint:v14];

      [(UIActivityIndicatorView *)self->_progressSpinner intrinsicContentSize];
      double v16 = v15 + 10.0;
      id v19 = [(PHMultipleCallParticipantLabelView *)self participantMarqueeLabelRightConstraint];
      [v19 setConstant:v16];
    }
  }
  else if (v5)
  {
    v17 = [(PHMultipleCallParticipantLabelView *)self participantMarqueeLabelRightConstraint];
    [v17 setConstant:15.0];

    v18 = [(PHMultipleCallParticipantLabelView *)self progressSpinner];
    [v18 removeFromSuperview];

    [(PHMultipleCallParticipantLabelView *)self setProgressSpinner:0];
  }
}

- (void)setTextColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHMultipleCallParticipantLabelView;
  id v4 = a3;
  [(PHAbstractCallParticipantLabelView *)&v6 setTextColor:v4];
  unint64_t v5 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
  [v5 setTextColor:v4];
}

- (void)setActivityState:(unsigned __int16)a3
{
}

- (void)setActivityState:(unsigned __int16)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  if ([(PHAbstractCallParticipantLabelView *)self activityState] != a3)
  {
    id v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v14 = v5;
      __int16 v15 = 1024;
      unsigned int v16 = [(PHAbstractCallParticipantLabelView *)self activityState];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Participant label setting selection state to %d (current is %d)", buf, 0xEu);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000EF84;
    v11[3] = &unk_1002CD778;
    v11[4] = self;
    __int16 v12 = v5;
    v8 = objc_retainBlock(v11);
    v9 = v8;
    if (v4) {
      +[UIView animateWithDuration:v8 animations:0 completion:0.5];
    }
    else {
      ((void (*)(void *))v8[2])(v8);
    }
    [(PHMultipleCallParticipantLabelView *)self setShowsActivitySpinner:v5 == 2];
    v10.receiver = self;
    v10.super_class = (Class)PHMultipleCallParticipantLabelView;
    [(PHAbstractCallParticipantLabelView *)&v10 setActivityState:v5];
  }
}

- (double)labelAlphaValueForActivityState:(unsigned __int16)a3
{
  double result = 1.0;
  if (a3 < 2u) {
    return 0.5;
  }
  return result;
}

- (void)setHidesLabel:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PHAbstractCallParticipantLabelView *)self hidesLabel] != a3)
  {
    uint64_t v5 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
    [v5 setHidden:v3];

    v6.receiver = self;
    v6.super_class = (Class)PHMultipleCallParticipantLabelView;
    [(PHAbstractCallParticipantLabelView *)&v6 setHidesLabel:v3];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PHMultipleCallParticipantLabelView;
  id v4 = a3;
  [(PHMultipleCallParticipantLabelView *)&v14 traitCollectionDidChange:v4];
  id v5 = [v4 _backlightLuminance];

  objc_super v6 = [(PHMultipleCallParticipantLabelView *)self traitCollection];
  id v7 = [v6 _backlightLuminance];

  if (v5 != v7)
  {
    v8 = [(PHMultipleCallParticipantLabelView *)self traitCollection];
    id v9 = [v8 _backlightLuminance];

    objc_super v10 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
    v11 = [v10 text];

    BOOL v13 = 0;
    if (v11)
    {
      if ([v11 length])
      {
        unsigned int v12 = [v11 characterAtIndex:0];
        if (v9 == (id)1 && v12 - 58 > 0xFFFFFFF5) {
          BOOL v13 = 1;
        }
      }
    }
    [(PHMultipleCallParticipantLabelView *)self setHidesLabel:v13];
  }
}

- (void)setShowsConferenceParticipantsButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[CNKFeatures sharedInstance];
  unsigned __int8 v6 = [v5 isHeroImageEnabled];

  if ((v6 & 1) == 0)
  {
    id v7 = [(PHMultipleCallParticipantLabelView *)self conferenceParticipantsButton];

    if (v3)
    {
      if (v7) {
        return;
      }
      v8 = +[UIButton buttonWithType:3];
      [(PHMultipleCallParticipantLabelView *)self setConferenceParticipantsButton:v8];

      id v9 = +[UIColor systemTealColor];
      objc_super v10 = [(PHMultipleCallParticipantLabelView *)self conferenceParticipantsButton];
      [v10 setTintColor:v9];

      [(PHMultipleCallParticipantLabelView *)self addSubview:self->_conferenceParticipantsButton];
      v11 = [(PHMultipleCallParticipantLabelView *)self conferenceParticipantsButton];
      [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

      [(UIButton *)self->_conferenceParticipantsButton addTarget:self action:"infoButtonTapped:" forControlEvents:64];
      conferenceParticipantsButton = self->_conferenceParticipantsButton;
      BOOL v13 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
      objc_super v14 = +[NSLayoutConstraint constraintWithItem:conferenceParticipantsButton attribute:5 relatedBy:0 toItem:v13 attribute:6 multiplier:1.0 constant:9.0];
      [(PHMultipleCallParticipantLabelView *)self addConstraint:v14];

      __int16 v15 = self->_conferenceParticipantsButton;
      unsigned int v16 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
      v17 = +[NSLayoutConstraint constraintWithItem:v15 attribute:10 relatedBy:0 toItem:v16 attribute:10 multiplier:1.0 constant:0.0];
      [(PHMultipleCallParticipantLabelView *)self addConstraint:v17];

      [(UIButton *)self->_conferenceParticipantsButton bounds];
      double v19 = -24.0 - v18 + -9.0;
      v20 = [(PHMultipleCallParticipantLabelView *)self statusLabelRightConstraint];
      id v23 = v20;
      double v21 = v19;
    }
    else
    {
      if (!v7) {
        return;
      }
      v22 = [(PHMultipleCallParticipantLabelView *)self conferenceParticipantsButton];
      [v22 removeFromSuperview];

      [(PHMultipleCallParticipantLabelView *)self setConferenceParticipantsButton:0];
      v20 = [(PHMultipleCallParticipantLabelView *)self statusLabelRightConstraint];
      double v21 = -24.0;
      id v23 = v20;
    }
    [v20 setConstant:v21];
  }
}

- (void)infoButtonTapped:(id)a3
{
  id v4 = [(PHAbstractCallParticipantLabelView *)self delegate];
  [v4 callLabelInfoLabelWasTappedForLabel:self];
}

- (void)setShowsCallDetailsViewButton:(BOOL)a3
{
  BOOL v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[WARN] Multi-call participant label unexpectedly configured to show details disclosure button", v4, 2u);
  }
}

- (NSLayoutConstraint)participantMarqueeLabelRightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 64, 1);
}

- (void)setParticipantMarqueeLabelRightConstraint:(id)a3
{
}

- (NSLayoutConstraint)statusLabelRightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStatusLabelRightConstraint:(id)a3
{
}

- (UIActivityIndicatorView)progressSpinner
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 80, 1);
}

- (void)setProgressSpinner:(id)a3
{
}

- (UIButton)conferenceParticipantsButton
{
  return (UIButton *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConferenceParticipantsButton:(id)a3
{
}

- (TPBadgeView)badgeView
{
  return (TPBadgeView *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBadgeView:(id)a3
{
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return (ICSCallDisplayStyleManager *)objc_getProperty(self, a2, 104, 1);
}

- (NSArray)badgeViewHiddenLayoutConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (NSArray)badgeViewVisibleLayoutConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeViewVisibleLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_badgeViewHiddenLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_conferenceParticipantsButton, 0);
  objc_storeStrong((id *)&self->_progressSpinner, 0);
  objc_storeStrong((id *)&self->_statusLabelRightConstraint, 0);

  objc_storeStrong((id *)&self->_participantMarqueeLabelRightConstraint, 0);
}

@end