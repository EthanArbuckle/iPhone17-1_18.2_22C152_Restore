@interface PHSingleCallParticipantLabelView
- (BOOL)_statusLabelStringWillFit:(id)a3;
- (BOOL)_statusLabelStringWillFit:(id)a3 attributes:(id)a4 padding:(float)a5;
- (BOOL)inBrandedCall;
- (BOOL)inCallDirectoryCall;
- (BOOL)isDisplayStyleAmbient;
- (BOOL)isDisplayStyleBanner;
- (BOOL)isDisplayStyleMiniWindow;
- (BOOL)setUpFirstAndLastNameLabelsIfPossible;
- (BOOL)shouldUseHeroImageLayout;
- (BOOL)showsCallDetailsViewButton;
- (CNContact)contact;
- (CNSharedProfileStateOracle)sharedProfileStateOracle;
- (ICSCallDisplayStyleManager)callDisplayStyleManager;
- (NSArray)avatarViewConstraints;
- (NSArray)heightConstraints;
- (NSArray)labelConstraints;
- (NSArray)statusLabelsArray;
- (NSLayoutConstraint)appIconHeightConstraint;
- (NSLayoutConstraint)appIconLayoutGuideHorizontalAnchor;
- (NSLayoutConstraint)appIconViewLeadingAnchor;
- (NSLayoutConstraint)appIconWidthConstraint;
- (NSLayoutConstraint)businessLogoHeightConstraint;
- (NSLayoutConstraint)businessLogoLayoutGuideHorizontalAnchor;
- (NSLayoutConstraint)businessLogoViewLeadingAnchor;
- (NSLayoutConstraint)businessLogoWidthConstraint;
- (NSLayoutConstraint)participantAndStatusRectangleBottomConstraint;
- (NSLayoutConstraint)participantAndStatusRectangleCenterXConstraint;
- (NSLayoutConstraint)participantAndStatusRectangleCenterYConstraint;
- (NSLayoutConstraint)participantAndStatusRectangleMaxLeadingConstraint;
- (NSLayoutConstraint)participantAndStatusRectangleMinLeadingConstraint;
- (NSLayoutConstraint)participantAndStatusRectangleTopConstraint;
- (NSLayoutConstraint)participantAndStatusRectangleTrailingConstraint;
- (NSLayoutConstraint)participantMarqueeLabelHorizontalConstraint;
- (NSLayoutConstraint)participantMarqueeLabelTrailingConstraint;
- (NSLayoutConstraint)secondaryInfoLabelHorizontalConstraint;
- (NSLayoutConstraint)secondaryInfoLabelTrailingConstraint;
- (NSLayoutConstraint)stackViewHorizontalConstraint;
- (NSLayoutConstraint)stackViewTrailingConstraint;
- (NSLayoutConstraint)statusLabelTopConstraint;
- (NSNumber)previousIsCallRinging;
- (NSTimer)statusLabelTimer;
- (PHBannerButtonsView)bannerButtonsView;
- (PHPosterNameViewModel)posterNameViewModel;
- (PHSingleCallParticipantLabelView)initWithCallDisplayStyleManager:(id)a3;
- (PHSingleCallParticipantLabelView)initWithCallDisplayStyleManager:(id)a3 delegate:(id)a4;
- (TPBadgeView)badgeView;
- (UIButton)callDetailsViewButton;
- (UIButton)conferenceParticipantsButton;
- (UIImageView)businessLogoView;
- (UIImageView)iconView;
- (UILabel)firstNameLabel;
- (UILabel)lastNameLabel;
- (UILabel)secondaryInfoLabel;
- (UILayoutGuide)appIconLayoutGuide;
- (UILayoutGuide)businessLogoLayoutGuide;
- (UILayoutGuide)leadingSideLayoutGuide;
- (UILayoutGuide)participantAndStatusRectangle;
- (UILayoutGuide)trailingSideLayoutGuide;
- (UIStackView)stackView;
- (UITapGestureRecognizer)callDetailsGestureRecognizer;
- (UITapGestureRecognizer)statusLabelTapRecognizer;
- (UIView)avatarView;
- (UIView)posterBadgeView;
- (double)_distanceFromParticipantNameBaseLineToStatus;
- (double)businessLogoCornerRadius;
- (double)businessLogoEdge;
- (double)businessLogoMarginH;
- (double)cachedBannerParticipantLabelWidth;
- (double)getParticipantsMarqueeLabelHeight;
- (double)getParticipantsViewHeight;
- (double)getStatusLabelHeight;
- (double)horizontalPaddingConstantForTrailingConstraints;
- (double)horizontalPaddingForMiniWindow;
- (double)labelsVerticalOffset;
- (double)voipIconEdge;
- (double)voipIconMarginH;
- (id)currentIMNicknameMatchingContact:(id)a3;
- (id)updatedAvatarViewConstraints;
- (id)updatedParticipantMarqueeLabelFont;
- (int64_t)labelLayoutState;
- (int64_t)numberOfLinesInStatusLabel;
- (unint64_t)ambientLayout;
- (unint64_t)bannerButtonsState;
- (unint64_t)currentStatusLabelIndex;
- (unint64_t)initialStateForBannerButtonsView;
- (unint64_t)labelsOrder;
- (void)animateToFirstLabel;
- (void)animateToNextLabel;
- (void)bannerButtonsView:(id)a3 didPerformActionType:(int64_t)a4;
- (void)callDetailsGestureRecognizerTapped:(id)a3;
- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4;
- (void)deactivateLayoutGuideConstraints;
- (void)dealloc;
- (void)fadeStatusLabelToAttributedOrPlainString:(id)a3;
- (void)handleContactStoreDidChangeNotification:(id)a3;
- (void)hideBadgesOnly;
- (void)hideFirstAndLastNameAnimated:(BOOL)a3;
- (void)infoButtonTapped:(id)a3;
- (void)invalidateStatusLabelTimer;
- (void)layoutSubviews;
- (void)scheduleStatusLabelTimer;
- (void)setActivityState:(unsigned __int16)a3;
- (void)setActivityState:(unsigned __int16)a3 animated:(BOOL)a4;
- (void)setAppIconHeightConstraint:(id)a3;
- (void)setAppIconLayoutGuide:(id)a3;
- (void)setAppIconLayoutGuideHorizontalAnchor:(id)a3;
- (void)setAppIconViewLeadingAnchor:(id)a3;
- (void)setAppIconWidthConstraint:(id)a3;
- (void)setAvatarView:(id)a3;
- (void)setAvatarViewConstraints:(id)a3;
- (void)setBadgeView:(id)a3;
- (void)setBannerAudioRouteButtonSelected:(BOOL)a3;
- (void)setBannerButtonsState:(unint64_t)a3;
- (void)setBannerButtonsView:(id)a3;
- (void)setBusinessLogo:(id)a3 isPerson:(BOOL)a4;
- (void)setBusinessLogoHeightConstraint:(id)a3;
- (void)setBusinessLogoLayoutGuide:(id)a3;
- (void)setBusinessLogoLayoutGuideHorizontalAnchor:(id)a3;
- (void)setBusinessLogoView:(id)a3;
- (void)setBusinessLogoViewLeadingAnchor:(id)a3;
- (void)setBusinessLogoWidthConstraint:(id)a3;
- (void)setCachedBannerParticipantLabelWidth:(double)a3;
- (void)setCallDetailsViewButton:(id)a3;
- (void)setConferenceParticipantsButton:(id)a3;
- (void)setContact:(id)a3;
- (void)setCurrentStatusLabelIndex:(unint64_t)a3;
- (void)setCustomAvatar:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstNameLabel:(id)a3;
- (void)setHeightConstraints:(id)a3;
- (void)setHidesLabel:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setLabelConstraints:(id)a3;
- (void)setLabelDescriptor:(id)a3;
- (void)setLabelLayoutState:(int64_t)a3;
- (void)setLabelLayoutState:(int64_t)a3 animated:(BOOL)a4;
- (void)setLabelsOrder:(unint64_t)a3;
- (void)setLastNameLabel:(id)a3;
- (void)setLeadingSideLayoutGuide:(id)a3;
- (void)setParticipantAndStatusRectangle:(id)a3;
- (void)setParticipantAndStatusRectangleBottomConstraint:(id)a3;
- (void)setParticipantAndStatusRectangleCenterXConstraint:(id)a3;
- (void)setParticipantAndStatusRectangleCenterYConstraint:(id)a3;
- (void)setParticipantAndStatusRectangleMaxLeadingConstraint:(id)a3;
- (void)setParticipantAndStatusRectangleMinLeadingConstraint:(id)a3;
- (void)setParticipantAndStatusRectangleTopConstraint:(id)a3;
- (void)setParticipantAndStatusRectangleTrailingConstraint:(id)a3;
- (void)setParticipantMarqueeLabelFont:(id)a3;
- (void)setParticipantMarqueeLabelHorizontalConstraint:(id)a3;
- (void)setParticipantMarqueeLabelTextColor:(id)a3;
- (void)setParticipantMarqueeLabelTrailingConstraint:(id)a3;
- (void)setPosterBadgeView:(id)a3;
- (void)setPosterNameViewModel:(id)a3;
- (void)setPreviousIsCallRinging:(id)a3;
- (void)setSecondaryInfoLabel:(id)a3;
- (void)setSecondaryInfoLabelHorizontalConstraint:(id)a3;
- (void)setSecondaryInfoLabelTrailingConstraint:(id)a3;
- (void)setSharedProfileStateOracle:(id)a3;
- (void)setShowsCallDetailsViewButton:(BOOL)a3;
- (void)setShowsConferenceParticipantsButton:(BOOL)a3;
- (void)setStackViewHorizontalConstraint:(id)a3;
- (void)setStackViewTrailingConstraint:(id)a3;
- (void)setStatusLabelTextColor:(id)a3;
- (void)setStatusLabelTextFont:(id)a3;
- (void)setStatusLabelTimer:(id)a3;
- (void)setStatusLabelTopConstraint:(id)a3;
- (void)setStatusLabelsArray:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTrailingSideLayoutGuide:(id)a3;
- (void)setUpCallDetailsViewButton;
- (void)showFirstAndLastNameAnimated:(BOOL)a3;
- (void)statusLabelTapped:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAvatarViewConstraints;
- (void)updateBannerButtonsViewForCallDisplayStyle:(int64_t)a3;
- (void)updateBusinessLogoSize;
- (void)updateGestureRecognizersEnabled;
- (void)updateHeightConstraints;
- (void)updateIconSize;
- (void)updateLabelAlignmentForCallDisplayStyle:(int64_t)a3;
- (void)updateLabelConstraints;
- (void)updateLabelFonts;
- (void)updateLabelScales;
- (void)updateLabelTextAlignmentForCallDisplayStyle:(int64_t)a3;
- (void)updateLabelTrailingConstraints;
- (void)updateLabelsOrder;
- (void)updateLabelsOrderAndLayout;
- (void)updateLabelsOrderAndText;
- (void)updateLayoutForCallDisplayStyle:(int64_t)a3;
- (void)updateLayoutGuide;
- (void)updateParticipantMarqueeLabelHorizontalConstraint;
- (void)updateParticipantMarqueeLabelNumberOfLines;
- (void)updatePosterBadgeView;
- (void)updateSecondaryLabelHorizontalConstraint;
- (void)updateStackViewHorizontalConstraints;
- (void)updateStackViewHorizontalConstraintsWithBusinessLogo;
- (void)updateStackViewHorizontalConstraintsWithVoIPAppIcon;
- (void)updateStatusLabelText;
- (void)updateViewForCallState;
@end

@implementation PHSingleCallParticipantLabelView

- (PHSingleCallParticipantLabelView)initWithCallDisplayStyleManager:(id)a3
{
  return [(PHSingleCallParticipantLabelView *)self initWithCallDisplayStyleManager:a3 delegate:0];
}

- (PHSingleCallParticipantLabelView)initWithCallDisplayStyleManager:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  v52.receiver = self;
  v52.super_class = (Class)PHSingleCallParticipantLabelView;
  v8 = [(PHAbstractCallParticipantLabelView *)&v52 initWithCallDisplayStyleManager:v7 delegate:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_callDisplayStyleManager, a3);
    v10 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    stackView = v9->_stackView;
    v9->_stackView = v10;

    [(UIStackView *)v9->_stackView setAxis:0];
    [(UIStackView *)v9->_stackView setDistribution:0];
    [(UIStackView *)v9->_stackView setAlignment:3];
    [(UIStackView *)v9->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v9->_stackView setSpacing:6.0];
    [(PHSingleCallParticipantLabelView *)v9 addSubview:v9->_stackView];
    v12 = +[UIColor labelColor];
    v13 = [(PHAbstractCallParticipantLabelView *)v9 participantMarqueeLabel];
    [v13 setTextColor:v12];

    [(PHSingleCallParticipantLabelView *)v9 updateLabelScales];
    id v14 = objc_alloc_init((Class)UILabel);
    [(PHAbstractCallParticipantLabelView *)v9 setStatusLabel:v14];

    v15 = [(PHAbstractCallParticipantLabelView *)v9 statusLabel];
    [v15 setAccessibilityIdentifier:@"PHSingleCallParticipantLabelView_StatusLabel"];

    v16 = [(PHSingleCallParticipantLabelView *)v9 callDisplayStyleManager];
    v17 = +[PHUIConfiguration singleCallStatusLabelFontForCallDisplayStyle:](PHUIConfiguration, "singleCallStatusLabelFontForCallDisplayStyle:", [v16 callDisplayStyle]);
    v18 = [(PHAbstractCallParticipantLabelView *)v9 statusLabel];
    [v18 setFont:v17];

    v19 = [(PHSingleCallParticipantLabelView *)v9 callDisplayStyleManager];
    v20 = +[PHUIConfiguration statusLabelFontColorForCallDisplayStyle:](PHUIConfiguration, "statusLabelFontColorForCallDisplayStyle:", [v19 callDisplayStyle]);
    v21 = [(PHAbstractCallParticipantLabelView *)v9 statusLabel];
    [v21 setTextColor:v20];

    v22 = [(PHAbstractCallParticipantLabelView *)v9 statusLabel];
    [v22 setAdjustsFontSizeToFitWidth:1];

    v23 = [(PHAbstractCallParticipantLabelView *)v9 statusLabel];
    [v23 setMinimumScaleFactor:0.75999999];

    if ([v7 callDisplayStyle] == (id)3) {
      uint64_t v24 = 1;
    }
    else {
      uint64_t v24 = 2;
    }
    v25 = [(PHAbstractCallParticipantLabelView *)v9 statusLabel];
    [v25 setNumberOfLines:v24];

    v26 = [(PHAbstractCallParticipantLabelView *)v9 statusLabel];
    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

    v27 = [(PHAbstractCallParticipantLabelView *)v9 statusLabel];
    LODWORD(v28) = 1144750080;
    [v27 setContentCompressionResistancePriority:0 forAxis:v28];

    v29 = [(PHAbstractCallParticipantLabelView *)v9 statusLabel];
    LODWORD(v30) = 1148846080;
    [v29 setContentCompressionResistancePriority:1 forAxis:v30];

    v31 = [(PHAbstractCallParticipantLabelView *)v9 statusLabel];
    LODWORD(v32) = 1148846080;
    [v31 setContentHuggingPriority:0 forAxis:v32];

    v33 = [(PHAbstractCallParticipantLabelView *)v9 statusLabel];
    LODWORD(v34) = 1148846080;
    [v33 setContentHuggingPriority:1 forAxis:v34];

    v35 = [(PHSingleCallParticipantLabelView *)v9 stackView];
    v36 = [(PHAbstractCallParticipantLabelView *)v9 statusLabel];
    [v35 addArrangedSubview:v36];

    v37 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v9 action:"statusLabelTapped:"];
    statusLabelTapRecognizer = v9->_statusLabelTapRecognizer;
    v9->_statusLabelTapRecognizer = v37;

    [(UITapGestureRecognizer *)v9->_statusLabelTapRecognizer setNumberOfTapsRequired:1];
    v39 = [(PHAbstractCallParticipantLabelView *)v9 statusLabel];
    [v39 addGestureRecognizer:v9->_statusLabelTapRecognizer];

    v40 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v9 action:"callDetailsGestureRecognizerTapped:"];
    callDetailsGestureRecognizer = v9->_callDetailsGestureRecognizer;
    v9->_callDetailsGestureRecognizer = v40;

    [(UITapGestureRecognizer *)v9->_callDetailsGestureRecognizer setNumberOfTapsRequired:1];
    [(PHSingleCallParticipantLabelView *)v9 addGestureRecognizer:v9->_callDetailsGestureRecognizer];
    [(PHSingleCallParticipantLabelView *)v9 updateGestureRecognizersEnabled];
    v42 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
    participantAndStatusRectangle = v9->_participantAndStatusRectangle;
    v9->_participantAndStatusRectangle = v42;

    [(PHSingleCallParticipantLabelView *)v9 addLayoutGuide:v9->_participantAndStatusRectangle];
    v44 = (UILabel *)objc_alloc_init((Class)UILabel);
    secondaryInfoLabel = v9->_secondaryInfoLabel;
    v9->_secondaryInfoLabel = v44;

    [(UILabel *)v9->_secondaryInfoLabel setAccessibilityIdentifier:@"PHSingleCallParticipantLabelView_SecondaryInfoLabel"];
    v46 = [(PHSingleCallParticipantLabelView *)v9 callDisplayStyleManager];
    v47 = +[PHUIConfiguration singleCallStatusLabelFontForCallDisplayStyle:](PHUIConfiguration, "singleCallStatusLabelFontForCallDisplayStyle:", [v46 callDisplayStyle]);
    [(UILabel *)v9->_secondaryInfoLabel setFont:v47];

    v48 = [(PHSingleCallParticipantLabelView *)v9 callDisplayStyleManager];
    v49 = +[PHUIConfiguration statusLabelFontColorForCallDisplayStyle:](PHUIConfiguration, "statusLabelFontColorForCallDisplayStyle:", [v48 callDisplayStyle]);
    [(UILabel *)v9->_secondaryInfoLabel setTextColor:v49];

    [(UILabel *)v9->_secondaryInfoLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v9->_secondaryInfoLabel setAlpha:0.0];
    [(PHSingleCallParticipantLabelView *)v9 addSubview:v9->_secondaryInfoLabel];
    -[PHSingleCallParticipantLabelView updateLayoutForCallDisplayStyle:](v9, "updateLayoutForCallDisplayStyle:", [v7 callDisplayStyle]);
    [(PHSingleCallParticipantLabelView *)v9 updateLabelConstraints];
    [(PHSingleCallParticipantLabelView *)v9 setAccessibilityIdentifier:@"PHSingleCallParticipantLabelView"];
    v50 = +[NSNotificationCenter defaultCenter];
    [v50 addObserver:v9 selector:"handleContactStoreDidChangeNotification:" name:CNContactStoreDidChangeNotification object:0];
  }
  return v9;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(PHSingleCallParticipantLabelView *)self invalidateStatusLabelTimer];
  v4.receiver = self;
  v4.super_class = (Class)PHSingleCallParticipantLabelView;
  [(PHSingleCallParticipantLabelView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PHSingleCallParticipantLabelView;
  [(PHSingleCallParticipantLabelView *)&v14 layoutSubviews];
  v3 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  if (![v3 callDisplayStyle])
  {
    [(PHSingleCallParticipantLabelView *)self cachedBannerParticipantLabelWidth];
    double v5 = v4;
    v6 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    [v6 bounds];
    double v8 = v7;

    if (v5 == v8) {
      goto LABEL_5;
    }
    v9 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    [v9 bounds];
    [(PHSingleCallParticipantLabelView *)self setCachedBannerParticipantLabelWidth:v10];

    v3 = [(PHSingleCallParticipantLabelView *)self updatedParticipantMarqueeLabelFont];
    v11 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    [v11 setFont:v3];
  }
LABEL_5:
  v12 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  id v13 = [v12 callDisplayStyle];

  if (v13 == (id)3)
  {
    [(PHSingleCallParticipantLabelView *)self updateAvatarViewConstraints];
    [(PHSingleCallParticipantLabelView *)self updateLabelAlignmentForCallDisplayStyle:3];
    [(PHSingleCallParticipantLabelView *)self updateHeightConstraints];
    [(PHSingleCallParticipantLabelView *)self updateViewForCallState];
  }
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHSingleCallParticipantLabelView;
  [(PHAbstractCallParticipantLabelView *)&v5 setDelegate:a3];
  double v4 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  -[PHSingleCallParticipantLabelView updateLayoutForCallDisplayStyle:](self, "updateLayoutForCallDisplayStyle:", [v4 callDisplayStyle]);
}

- (double)labelsVerticalOffset
{
  v2 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  id v3 = [v2 callDisplayStyle];

  double result = 2.0;
  if (v3 == (id)3) {
    double result = -2.0;
  }
  if (v3 == (id)1) {
    return 0.0;
  }
  return result;
}

- (void)setLabelLayoutState:(int64_t)a3
{
}

- (void)setLabelLayoutState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_labelLayoutState != a3)
  {
    BOOL v4 = a4;
    self->_labelLayoutState = a3;
    [(PHSingleCallParticipantLabelView *)self updateLayoutGuide];
    [(PHSingleCallParticipantLabelView *)self updateHeightConstraints];
    if (v4)
    {
      if (a3 == 1) {
        double v7 = &stru_1002CD8F0;
      }
      else {
        double v7 = &stru_1002CD8D0;
      }
      objc_initWeak(&location, self);
      double v10 = _NSConcreteStackBlock;
      uint64_t v11 = 3221225472;
      v12 = sub_10001CEA8;
      id v13 = &unk_1002CD7E8;
      objc_copyWeak(&v15, &location);
      objc_super v14 = v7;
      double v8 = objc_retainBlock(&v10);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
      +[UIView transitionWithView:self duration:5243008 options:v8 animations:0 completion:0.300000012];
    }
    else
    {
      if (a3 == 1) {
        v9 = &stru_1002CD8F0;
      }
      else {
        v9 = &stru_1002CD8D0;
      }
      objc_initWeak(&location, self);
      double v10 = _NSConcreteStackBlock;
      uint64_t v11 = 3221225472;
      v12 = sub_10001CEA8;
      id v13 = &unk_1002CD7E8;
      objc_copyWeak(&v15, &location);
      objc_super v14 = v9;
      double v8 = objc_retainBlock(&v10);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
      ((void (*)(void ***))v8[2])(v8);
    }
  }
}

- (void)setLabelDescriptor:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 strings];
  v6 = [(PHSingleCallParticipantLabelView *)self statusLabelsArray];
  unsigned __int8 v7 = [v5 isEqualToArray:v6];

  if (v7) {
    goto LABEL_20;
  }
  [(PHSingleCallParticipantLabelView *)self setStatusLabelsArray:v5];
  if ((unint64_t)[v5 count] < 2)
  {
    id v13 = +[CNKFeatures sharedInstance];
    unsigned __int8 v14 = [v13 isHeroImageEnabled];

    if ((v14 & 1) == 0)
    {
      id v15 = [(PHSingleCallParticipantLabelView *)self traitCollection];
      id v16 = [v15 _backlightLuminance];

      if (v16 == (id)1) {
        double v17 = 0.0;
      }
      else {
        double v17 = 1.0;
      }
      v18 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
      [v18 setAlpha:v17];
    }
    [(PHSingleCallParticipantLabelView *)self invalidateStatusLabelTimer];
    [(PHSingleCallParticipantLabelView *)self setCurrentStatusLabelIndex:0];
    v19 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
    v20 = [v4 strings];
    v21 = [v20 firstObject];
    [v19 setAttributedOrPlainText:v21];

    v22 = [(PHSingleCallParticipantLabelView *)self posterNameViewModel];
    v23 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
    uint64_t v24 = [v23 text];
    [v22 updateStatus:v24];

    v25 = [v4 strings];
    v26 = [v25 firstObject];
    objc_opt_class();
    LOBYTE(v24) = objc_opt_isKindOfClass();

    if ((v24 & 1) == 0) {
      goto LABEL_16;
    }
    v27 = [v4 strings];
    double v28 = [v27 firstObject];

    v29 = +[NSBundle mainBundle];
    double v30 = [v29 localizedStringForKey:@"ALERT_ERROR_LABEL" value:&stru_1002D6110 table:@"Localizable-Stewie"];
    if ([v28 isEqualToString:v30])
    {
      uint64_t v31 = [(PHSingleCallParticipantLabelView *)self numberOfLinesInStatusLabel];

      if (v31 < 3)
      {
LABEL_15:

LABEL_16:
        if ([v4 layoutState] == (id)1) {
          v36 = &stru_1002CD8F0;
        }
        else {
          v36 = &stru_1002CD8D0;
        }
        objc_initWeak(&location, self);
        v62 = _NSConcreteStackBlock;
        uint64_t v63 = 3221225472;
        v64 = sub_10001CEA8;
        v65 = &unk_1002CD7E8;
        objc_copyWeak(&v67, &location);
        v66 = v36;
        v37 = objc_retainBlock(&v62);

        objc_destroyWeak(&v67);
        objc_destroyWeak(&location);
        ((void (*)(void ***))v37[2])(v37);

        goto LABEL_20;
      }
      double v32 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
      v33 = +[NSBundle mainBundle];
      double v34 = [v33 localizedStringForKey:@"ALERT_ERROR_LABEL_NO_LINE_BREAK" value:&stru_1002D6110 table:@"Localizable-Stewie"];
      [v32 setAttributedOrPlainText:v34];

      v29 = [(PHSingleCallParticipantLabelView *)self posterNameViewModel];
      double v30 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
      v35 = [v30 text];
      [v29 updateStatus:v35];
    }
    goto LABEL_15;
  }
  double v8 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
  v9 = [v5 firstObject];
  [v8 setAttributedOrPlainText:v9];

  double v10 = [(PHSingleCallParticipantLabelView *)self posterNameViewModel];
  uint64_t v11 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
  v12 = [v11 text];
  [v10 updateStatus:v12];

  [(PHSingleCallParticipantLabelView *)self setCurrentStatusLabelIndex:0];
  [(PHSingleCallParticipantLabelView *)self invalidateStatusLabelTimer];
  if ((unint64_t)[v5 count] >= 2) {
    [(PHSingleCallParticipantLabelView *)self scheduleStatusLabelTimer];
  }
LABEL_20:
  v38 = [v4 secondaryString];

  if (v38)
  {
    v39 = [v4 secondaryString];
    v40 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
    v41 = [v40 text];
    v42 = v39;
  }
  else
  {
    v43 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
    v44 = [v43 text];

    if (!v44)
    {
      [v5 count];
      goto LABEL_31;
    }
    v39 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
    v40 = [v39 text];
    v41 = [v4 secondaryString];
    v42 = v40;
  }
  unsigned __int8 v45 = [v42 isEqualToString:v41];

  if ((unint64_t)[v5 count] <= 1 && (v45 & 1) == 0)
  {
    v46 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
    v47 = [v4 secondaryString];
    [v46 setText:v47];

    if ([v4 layoutState] == (id)1) {
      v48 = &stru_1002CD8F0;
    }
    else {
      v48 = &stru_1002CD8D0;
    }
    objc_initWeak(&location, self);
    v62 = _NSConcreteStackBlock;
    uint64_t v63 = 3221225472;
    v64 = sub_10001CEA8;
    v65 = &unk_1002CD7E8;
    objc_copyWeak(&v67, &location);
    v66 = v48;
    v49 = objc_retainBlock(&v62);

    objc_destroyWeak(&v67);
    objc_destroyWeak(&location);
    ((void (*)(void ***))v49[2])(v49);
  }
LABEL_31:
  v50 = [v4 localizedSenderIdentity];
  id v51 = [v50 length];

  if (v51)
  {
    objc_super v52 = [(PHSingleCallParticipantLabelView *)self badgeView];

    if (v52)
    {
      id v53 = [v4 localizedSenderIdentity];
      v54 = [(PHSingleCallParticipantLabelView *)self badgeView];
      [v54 setTitle:v53];
    }
    else
    {
      id v55 = objc_alloc((Class)TPBadgeView);
      v56 = [v4 localizedSenderIdentity];
      id v53 = [v55 initWithTitle:v56 theme:1];

      [v53 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v53 setHidden:[self hidesLabel]];
      v57 = [(PHSingleCallParticipantLabelView *)self stackView];
      v58 = [v57 arrangedSubviews];
      v59 = [v58 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v61 = [(PHSingleCallParticipantLabelView *)self stackView];
        [v61 insertArrangedSubview:v53 atIndex:0];
      }
      [(PHSingleCallParticipantLabelView *)self setBadgeView:v53];
    }

    [(PHSingleCallParticipantLabelView *)self updatePosterBadgeView];
  }
  -[PHSingleCallParticipantLabelView setLabelLayoutState:animated:](self, "setLabelLayoutState:animated:", [v4 layoutState], 1);
}

- (int64_t)numberOfLinesInStatusLabel
{
  [(PHSingleCallParticipantLabelView *)self frame];
  double v4 = v3 + -48.0;
  objc_super v5 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
  v6 = [v5 font];
  [v6 lineHeight];
  double v8 = v7;

  v9 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
  double v10 = [v9 text];

  NSAttributedStringKey v17 = NSFontAttributeName;
  uint64_t v11 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
  v12 = [v11 font];
  v18 = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v10 boundingRectWithSize:1 options:v13 attributes:0 context:v4];
  double v15 = v14;

  return (uint64_t)(v15 / v8);
}

- (double)getParticipantsViewHeight
{
  [(PHSingleCallParticipantLabelView *)self getStatusLabelHeight];
  double v4 = v3;
  [(PHSingleCallParticipantLabelView *)self getParticipantsMarqueeLabelHeight];
  return v4 + v5;
}

- (double)getStatusLabelHeight
{
  double v3 = [(PHAbstractCallParticipantLabelView *)self statusLabel];

  if (!v3) {
    return 0.0;
  }
  double v4 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
  [v4 intrinsicContentSize];
  double v6 = v5;

  return v6;
}

- (double)getParticipantsMarqueeLabelHeight
{
  double v3 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];

  if (!v3) {
    return 0.0;
  }
  double v4 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
  [v4 intrinsicContentSize];
  double v6 = v5;

  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)PHSingleCallParticipantLabelView;
  id v4 = a3;
  [(PHSingleCallParticipantLabelView *)&v21 traitCollectionDidChange:v4];
  id v5 = [v4 _backlightLuminance];

  double v6 = [(PHSingleCallParticipantLabelView *)self traitCollection];
  id v7 = [v6 _backlightLuminance];

  if (v5 != v7)
  {
    double v8 = [(PHSingleCallParticipantLabelView *)self traitCollection];
    id v9 = [v8 _backlightLuminance];

    double v10 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
    uint64_t v11 = v10;
    if (v9 == (id)1)
    {
      double v12 = 0.0;
    }
    else
    {
      id v13 = [v10 text];
      double v14 = +[NSBundle mainBundle];
      double v15 = [v14 localizedStringForKey:@"ALERT_ERROR_LABEL" value:&stru_1002D6110 table:@"Localizable-Stewie"];
      if ([v13 isEqualToString:v15])
      {

LABEL_9:
        return;
      }
      id v16 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
      NSAttributedStringKey v17 = [v16 text];
      v18 = +[NSBundle mainBundle];
      v19 = [v18 localizedStringForKey:@"ALERT_ERROR_LABEL_NO_LINE_BREAK" value:&stru_1002D6110 table:@"Localizable-Stewie"];
      unsigned __int8 v20 = [v17 isEqualToString:v19];

      if (v20) {
        return;
      }
      double v10 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
      uint64_t v11 = v10;
      double v12 = 1.0;
    }
    [v10 setAlpha:v12];
    goto LABEL_9;
  }
}

- (void)setHidesLabel:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PHAbstractCallParticipantLabelView *)self hidesLabel] != a3)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000142EC;
    v6[3] = &unk_1002CD918;
    v6[4] = self;
    BOOL v7 = v3;
    +[UIView performWithoutAnimation:v6];
    v5.receiver = self;
    v5.super_class = (Class)PHSingleCallParticipantLabelView;
    [(PHAbstractCallParticipantLabelView *)&v5 setHidesLabel:v3];
  }
}

- (void)hideBadgesOnly
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100014404;
  v2[3] = &unk_1002CD518;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)setActivityState:(unsigned __int16)a3
{
}

- (void)setActivityState:(unsigned __int16)a3 animated:(BOOL)a4
{
  uint64_t v4 = a3;
  if ([(PHAbstractCallParticipantLabelView *)self activityState] != a3)
  {
    [(PHAbstractCallParticipantLabelView *)self setUserInteractionEnabled:v4 > 1];
    v6.receiver = self;
    v6.super_class = (Class)PHSingleCallParticipantLabelView;
    [(PHAbstractCallParticipantLabelView *)&v6 setActivityState:v4];
  }
}

- (void)setShowsConferenceParticipantsButton:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(PHSingleCallParticipantLabelView *)self shouldUseHeroImageLayout];
  objc_super v6 = [(PHSingleCallParticipantLabelView *)self conferenceParticipantsButton];

  if (v5 || !v3)
  {
    if (v6)
    {
      v26 = [(PHSingleCallParticipantLabelView *)self conferenceParticipantsButton];
      [v26 removeFromSuperview];

      [(PHSingleCallParticipantLabelView *)self setConferenceParticipantsButton:0];
    }
  }
  else if (!v6)
  {
    BOOL v7 = +[UIButton buttonWithType:3];
    [(PHSingleCallParticipantLabelView *)self setConferenceParticipantsButton:v7];

    double v8 = +[UIColor systemTealColor];
    id v9 = [(PHSingleCallParticipantLabelView *)self conferenceParticipantsButton];
    [v9 setTintColor:v8];

    double v10 = [(PHSingleCallParticipantLabelView *)self conferenceParticipantsButton];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v11 = [(PHSingleCallParticipantLabelView *)self conferenceParticipantsButton];
    LODWORD(v12) = 1148846080;
    [v11 setContentCompressionResistancePriority:0 forAxis:v12];

    id v13 = [(PHSingleCallParticipantLabelView *)self conferenceParticipantsButton];
    LODWORD(v14) = 1148846080;
    [v13 setContentCompressionResistancePriority:1 forAxis:v14];

    double v15 = [(PHSingleCallParticipantLabelView *)self conferenceParticipantsButton];
    [v15 addTarget:self action:"infoButtonTapped:" forControlEvents:64];

    id v16 = [(PHSingleCallParticipantLabelView *)self conferenceParticipantsButton];
    [(PHSingleCallParticipantLabelView *)self addSubview:v16];

    double v32 = [(PHSingleCallParticipantLabelView *)self conferenceParticipantsButton];
    double v30 = [v32 bottomAnchor];
    uint64_t v31 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    v29 = [v31 firstBaselineAnchor];
    double v28 = [v30 constraintEqualToAnchor:v29];
    v33[0] = v28;
    v27 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    NSAttributedStringKey v17 = [v27 trailingAnchor];
    v18 = [(PHSingleCallParticipantLabelView *)self conferenceParticipantsButton];
    v19 = [v18 leadingAnchor];
    unsigned __int8 v20 = [v17 constraintEqualToAnchor:v19 constant:-10.0];
    v33[1] = v20;
    objc_super v21 = [(PHSingleCallParticipantLabelView *)self conferenceParticipantsButton];
    v22 = [v21 trailingAnchor];
    v23 = [(PHSingleCallParticipantLabelView *)self trailingAnchor];
    uint64_t v24 = [v22 constraintLessThanOrEqualToAnchor:v23 constant:-24.0];
    v33[2] = v24;
    v25 = +[NSArray arrayWithObjects:v33 count:3];
    [(PHSingleCallParticipantLabelView *)self addConstraints:v25];
  }
  [(PHSingleCallParticipantLabelView *)self updateLabelTrailingConstraints];
}

- (void)infoButtonTapped:(id)a3
{
  id v4 = [(PHAbstractCallParticipantLabelView *)self delegate];
  [v4 callLabelInfoLabelWasTappedForLabel:self];
}

- (BOOL)showsCallDetailsViewButton
{
  v2 = [(PHSingleCallParticipantLabelView *)self callDetailsViewButton];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setShowsCallDetailsViewButton:(BOOL)a3
{
  if (!a3 || [(PHSingleCallParticipantLabelView *)self shouldUseHeroImageLayout])
  {
    id v4 = [(PHSingleCallParticipantLabelView *)self callDetailsViewButton];
    [v4 removeFromSuperview];

    [(PHSingleCallParticipantLabelView *)self setCallDetailsViewButton:0];
LABEL_4:
    [(PHSingleCallParticipantLabelView *)self updateGestureRecognizersEnabled];
    goto LABEL_5;
  }
  unsigned int v5 = [(PHSingleCallParticipantLabelView *)self callDetailsViewButton];

  if (!v5)
  {
    [(PHSingleCallParticipantLabelView *)self setUpCallDetailsViewButton];
    goto LABEL_4;
  }
LABEL_5:

  [(PHSingleCallParticipantLabelView *)self updateLabelTrailingConstraints];
}

- (void)setUpCallDetailsViewButton
{
  BOOL v3 = +[UIButton buttonWithType:4];
  [(PHSingleCallParticipantLabelView *)self setCallDetailsViewButton:v3];

  id v4 = +[UIColor secondaryLabelColor];
  unsigned int v5 = [(PHSingleCallParticipantLabelView *)self callDetailsViewButton];
  [v5 setTintColor:v4];

  objc_super v6 = [(PHSingleCallParticipantLabelView *)self callDetailsViewButton];
  [v6 setUserInteractionEnabled:0];

  BOOL v7 = [(PHSingleCallParticipantLabelView *)self callDetailsViewButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v8 = [(PHSingleCallParticipantLabelView *)self callDetailsViewButton];
  LODWORD(v9) = 1148846080;
  [v8 setContentCompressionResistancePriority:0 forAxis:v9];

  double v10 = [(PHSingleCallParticipantLabelView *)self callDetailsViewButton];
  LODWORD(v11) = 1148846080;
  [v10 setContentCompressionResistancePriority:1 forAxis:v11];

  double v12 = [(PHSingleCallParticipantLabelView *)self callDetailsViewButton];
  [(PHSingleCallParticipantLabelView *)self addSubview:v12];

  id v13 = [(PHSingleCallParticipantLabelView *)self callDetailsViewButton];
  double v14 = [v13 centerYAnchor];
  double v15 = [(PHSingleCallParticipantLabelView *)self centerYAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];
  v22[0] = v16;
  NSAttributedStringKey v17 = [(PHSingleCallParticipantLabelView *)self callDetailsViewButton];
  v18 = [v17 trailingAnchor];
  v19 = [(PHSingleCallParticipantLabelView *)self trailingAnchor];
  unsigned __int8 v20 = [v18 constraintEqualToAnchor:v19 constant:-20.0];
  v22[1] = v20;
  objc_super v21 = +[NSArray arrayWithObjects:v22 count:2];
  [(PHSingleCallParticipantLabelView *)self addConstraints:v21];
}

- (BOOL)setUpFirstAndLastNameLabelsIfPossible
{
  if ((id)[(PHSingleCallParticipantLabelView *)self ambientLayout] == (id)1)
  {
    BOOL v3 = [(PHSingleCallParticipantLabelView *)self trailingSideLayoutGuide];

    if (v3)
    {
      id v4 = [(PHSingleCallParticipantLabelView *)self contact];
      unsigned int v5 = +[CNContactFormatter posterNameComponentsForContact:v4];

      objc_super v6 = [v5 secondNameComponent];
      LOBYTE(v3) = v6 != 0;

      if (v6)
      {
        firstNameLabel = self->_firstNameLabel;
        if (!firstNameLabel)
        {
          if (self->_lastNameLabel)
          {
            firstNameLabel = 0;
          }
          else
          {
            double v8 = (UILabel *)objc_alloc_init((Class)UILabel);
            double v9 = self->_firstNameLabel;
            self->_firstNameLabel = v8;

            [(UILabel *)self->_firstNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
            [(UILabel *)self->_firstNameLabel setTextAlignment:1];
            [(UILabel *)self->_firstNameLabel setNumberOfLines:1];
            [(UILabel *)self->_firstNameLabel setAdjustsFontSizeToFitWidth:1];
            [(UILabel *)self->_firstNameLabel _setExtremeSizingEnabled:1];
            [(UILabel *)self->_firstNameLabel setAlpha:0.0];
            [(PHSingleCallParticipantLabelView *)self addSubview:self->_firstNameLabel];
            double v10 = (UILabel *)objc_alloc_init((Class)UILabel);
            lastNameLabel = self->_lastNameLabel;
            self->_lastNameLabel = v10;

            [(UILabel *)self->_lastNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
            [(UILabel *)self->_lastNameLabel setTextAlignment:1];
            [(UILabel *)self->_lastNameLabel setNumberOfLines:1];
            [(UILabel *)self->_lastNameLabel setAdjustsFontSizeToFitWidth:1];
            [(UILabel *)self->_lastNameLabel _setExtremeSizingEnabled:1];
            [(UILabel *)self->_lastNameLabel setAlpha:0.0];
            [(PHSingleCallParticipantLabelView *)self addSubview:self->_lastNameLabel];
            v74 = [(UILabel *)self->_firstNameLabel topAnchor];
            v73 = [(PHSingleCallParticipantLabelView *)self topAnchor];
            v72 = [v74 constraintGreaterThanOrEqualToAnchor:v73];
            v77[0] = v72;
            v70 = [(UILabel *)self->_firstNameLabel leadingAnchor];
            v71 = [(PHSingleCallParticipantLabelView *)self trailingSideLayoutGuide];
            v69 = [v71 leadingAnchor];
            v68 = [v70 constraintGreaterThanOrEqualToAnchor:v69];
            v77[1] = v68;
            v66 = [(UILabel *)self->_firstNameLabel centerXAnchor];
            id v67 = [(PHSingleCallParticipantLabelView *)self trailingSideLayoutGuide];
            v65 = [v67 centerXAnchor];
            v64 = [v66 constraintEqualToAnchor:v65];
            v77[2] = v64;
            v62 = [(UILabel *)self->_firstNameLabel trailingAnchor];
            uint64_t v63 = [(PHSingleCallParticipantLabelView *)self trailingSideLayoutGuide];
            v61 = [v63 trailingAnchor];
            v60 = [v62 constraintLessThanOrEqualToAnchor:v61];
            v77[3] = v60;
            v59 = [(UILabel *)self->_firstNameLabel trailingAnchor];
            v58 = [(PHSingleCallParticipantLabelView *)self trailingAnchor];
            v57 = [v59 constraintEqualToAnchor:v58];
            v77[4] = v57;
            v56 = [(UILabel *)self->_firstNameLabel bottomAnchor];
            id v55 = [(UILabel *)self->_lastNameLabel topAnchor];
            v54 = [v56 constraintEqualToAnchor:v55 constant:16.0];
            v77[5] = v54;
            objc_super v52 = [(UILabel *)self->_lastNameLabel leadingAnchor];
            id v53 = [(PHSingleCallParticipantLabelView *)self trailingSideLayoutGuide];
            id v51 = [v53 leadingAnchor];
            v50 = [v52 constraintGreaterThanOrEqualToAnchor:v51];
            v77[6] = v50;
            v48 = [(UILabel *)self->_lastNameLabel centerXAnchor];
            v49 = [(PHSingleCallParticipantLabelView *)self trailingSideLayoutGuide];
            v47 = [v49 centerXAnchor];
            v46 = [v48 constraintEqualToAnchor:v47];
            v77[7] = v46;
            v44 = [(UILabel *)self->_lastNameLabel trailingAnchor];
            unsigned __int8 v45 = [(PHSingleCallParticipantLabelView *)self trailingSideLayoutGuide];
            v43 = [v45 trailingAnchor];
            v42 = [v44 constraintLessThanOrEqualToAnchor:v43];
            v77[8] = v42;
            v40 = [(UILabel *)self->_lastNameLabel firstBaselineAnchor];
            v41 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
            v39 = [v41 firstBaselineAnchor];
            double v12 = [v40 constraintEqualToAnchor:v39];
            v77[9] = v12;
            id v13 = [(UILabel *)self->_lastNameLabel bottomAnchor];
            double v14 = [(PHSingleCallParticipantLabelView *)self trailingSideLayoutGuide];
            double v15 = [v14 bottomAnchor];
            id v16 = [v13 constraintLessThanOrEqualToAnchor:v15];
            v77[10] = v16;
            NSAttributedStringKey v17 = +[NSArray arrayWithObjects:v77 count:11];
            +[NSLayoutConstraint activateConstraints:v17];

            firstNameLabel = self->_firstNameLabel;
          }
        }
        v18 = self->_lastNameLabel;
        v76[0] = firstNameLabel;
        v76[1] = v18;
        v19 = +[NSArray arrayWithObjects:v76 count:2];
        objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v5, "emphasizedNameComponentIndex"));
        unsigned __int8 v20 = (UILabel *)objc_claimAutoreleasedReturnValue();

        objc_super v21 = self->_firstNameLabel;
        if (v20 == v21) {
          objc_super v21 = self->_lastNameLabel;
        }
        v22 = v21;
        v23 = [(PHSingleCallParticipantLabelView *)self updatedParticipantMarqueeLabelFont];
        uint64_t v24 = [v23 fontWithSize:48.0];
        [(UILabel *)v22 setFont:v24];

        [(UILabel *)v22 setMinimumFontSize:25.0];
        v25 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
        v26 = [v25 textColor];
        [(UILabel *)v22 setTextColor:v26];

        LODWORD(v27) = 1132134400;
        [(UILabel *)v22 setContentCompressionResistancePriority:1 forAxis:v27];
        [(UILabel *)v20 setFont:v23];
        [(UILabel *)v20 setMinimumFontSize:38.0];
        double v28 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
        v29 = [v28 textColor];
        [(UILabel *)v20 setTextColor:v29];

        LODWORD(v30) = 1132068864;
        [(UILabel *)v20 setContentCompressionResistancePriority:1 forAxis:v30];
        uint64_t v31 = [v5 firstNameComponent];
        [(UILabel *)self->_firstNameLabel setText:v31];

        double v32 = [v5 secondNameComponent];
        [(UILabel *)self->_lastNameLabel setText:v32];

        v33 = [v5 firstNameComponent];
        v75[0] = v33;
        double v34 = [v5 secondNameComponent];
        v75[1] = v34;
        v35 = +[NSArray arrayWithObjects:v75 count:2];
        v36 = objc_msgSend(v35, "objectAtIndexedSubscript:", objc_msgSend(v5, "singleNameComponentIndex"));
        v37 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
        [v37 setText:v36];
      }
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (void)showFirstAndLastNameAnimated:(BOOL)a3
{
  if (self->_firstNameLabel && self->_lastNameLabel)
  {
    if (a3)
    {
      CGAffineTransformMakeScale(&v17, 0.9, 0.9);
      id v4 = [(PHSingleCallParticipantLabelView *)self firstNameLabel];
      CGAffineTransform v16 = v17;
      [v4 setTransform:&v16];

      CGAffineTransformMakeScale(&v15, 0.9, 0.9);
      unsigned int v5 = [(PHSingleCallParticipantLabelView *)self lastNameLabel];
      CGAffineTransform v14 = v15;
      [v5 setTransform:&v14];

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100015720;
      v13[3] = &unk_1002CD518;
      v13[4] = self;
      +[UIView _animateUsingSpringWithDuration:4 delay:v13 options:&stru_1002CD958 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001578C;
      v12[3] = &unk_1002CD518;
      v12[4] = self;
      +[UIView _animateUsingSpringWithDuration:4 delay:v12 options:&stru_1002CD978 mass:0.5 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10001581C;
      v11[3] = &unk_1002CD518;
      v11[4] = self;
      +[UIView _animateUsingSpringWithDuration:4 delay:v11 options:&stru_1002CD998 mass:0.8 stiffness:0.25 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
    }
    else
    {
      objc_super v6 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
      [v6 setAlpha:0.0];

      BOOL v7 = [(PHSingleCallParticipantLabelView *)self badgeView];
      [v7 setAlpha:0.0];

      double v8 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
      [v8 setAlpha:0.0];

      double v9 = [(PHSingleCallParticipantLabelView *)self firstNameLabel];
      [v9 setAlpha:1.0];

      id v10 = [(PHSingleCallParticipantLabelView *)self lastNameLabel];
      [v10 setAlpha:1.0];
    }
  }
}

- (void)hideFirstAndLastNameAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PHSingleCallParticipantLabelView *)self firstNameLabel];
  if (v5)
  {
    objc_super v6 = (void *)v5;
    BOOL v7 = [(PHSingleCallParticipantLabelView *)self lastNameLabel];

    if (v7)
    {
      if (v3)
      {
        CGAffineTransformMakeScale(&v20, 0.9, 0.9);
        double v8 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
        CGAffineTransform v19 = v20;
        [v8 setTransform:&v19];

        double v9 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
        [v9 setAlpha:0.0];

        id v10 = [(PHSingleCallParticipantLabelView *)self badgeView];
        [v10 setAlpha:0.0];

        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100015C04;
        v18[3] = &unk_1002CD518;
        v18[4] = self;
        +[UIView _animateUsingSpringWithDuration:4 delay:v18 options:&stru_1002CD9B8 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100015CB8;
        v17[3] = &unk_1002CD518;
        v17[4] = self;
        +[UIView _animateUsingSpringWithDuration:4 delay:v17 options:&stru_1002CD9D8 mass:0.5 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100015D2C;
        v16[3] = &unk_1002CD518;
        v16[4] = self;
        +[UIView _animateUsingSpringWithDuration:4 delay:v16 options:&stru_1002CD9F8 mass:0.8 stiffness:0.25 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
      }
      else
      {
        double v11 = [(PHSingleCallParticipantLabelView *)self firstNameLabel];
        [v11 setAlpha:0.0];

        double v12 = [(PHSingleCallParticipantLabelView *)self lastNameLabel];
        [v12 setAlpha:0.0];

        id v13 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
        [v13 setAlpha:1.0];

        CGAffineTransform v14 = [(PHSingleCallParticipantLabelView *)self badgeView];
        [v14 setAlpha:1.0];

        id v15 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
        [v15 setAlpha:1.0];
      }
    }
  }
}

- (void)callDetailsGestureRecognizerTapped:(id)a3
{
  id v4 = [(PHAbstractCallParticipantLabelView *)self delegate];
  [v4 callLabelDetailsGestureRecognizerTappedForLabel:self];
}

- (void)setTextColor:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PHSingleCallParticipantLabelView;
  id v4 = a3;
  [(PHAbstractCallParticipantLabelView *)&v8 setTextColor:v4];
  uint64_t v5 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
  [v5 setTextColor:v4];

  objc_super v6 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
  [v6 setTextColor:v4];

  BOOL v7 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
  [v7 setTextColor:v4];
}

- (void)setStatusLabelTextColor:(id)a3
{
  id v6 = a3;
  id v4 = [(PHSingleCallParticipantLabelView *)self posterNameViewModel];

  if (!v4)
  {
    uint64_t v5 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
    [v5 setTextColor:v6];
  }
}

- (void)setParticipantMarqueeLabelTextColor:(id)a3
{
  id v4 = a3;
  id v5 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
  [v5 setTextColor:v4];
}

- (void)setStatusLabelTextFont:(id)a3
{
  id v4 = a3;
  id v5 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
  [v5 setFont:v4];
}

- (void)setParticipantMarqueeLabelFont:(id)a3
{
  id v4 = a3;
  id v5 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
  [v5 setFont:v4];
}

- (CNContact)contact
{
  BOOL v3 = [(PHSingleCallParticipantLabelView *)self avatarView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = [(PHSingleCallParticipantLabelView *)self avatarView];
  if (isKindOfClass) {
    goto LABEL_4;
  }
  objc_opt_class();
  char v6 = objc_opt_isKindOfClass();

  if (v6)
  {
    id v5 = [(PHSingleCallParticipantLabelView *)self avatarView];
LABEL_4:
    BOOL v7 = [v5 contact];

    goto LABEL_6;
  }
  BOOL v7 = 0;
LABEL_6:

  return (CNContact *)v7;
}

- (void)setContact:(id)a3
{
  id v4 = a3;
  id v5 = [(PHSingleCallParticipantLabelView *)self avatarView];
  char v6 = v5;
  if (!v4)
  {
    if (!v5) {
      goto LABEL_26;
    }
    BOOL v7 = [(PHSingleCallParticipantLabelView *)self avatarView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
    }
    else
    {
      CGAffineTransform v16 = [(PHSingleCallParticipantLabelView *)self avatarView];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_26;
      }
    }
    v18 = [(PHSingleCallParticipantLabelView *)self avatarView];
    [v18 removeFromSuperview];

    [(PHSingleCallParticipantLabelView *)self setAvatarView:0];
    [(PHSingleCallParticipantLabelView *)self updateLayoutGuide];
    goto LABEL_24;
  }
  if (!v5)
  {
    if (![v4 imageDataAvailable]) {
      goto LABEL_10;
    }
    objc_super v8 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
    id v9 = [v8 callDisplayStyle];

    if (v9 == (id)3)
    {
      id v10 = [[_TtC13InCallService17AmbientAvatarView alloc] initWithContact:v4];
      [(PHSingleCallParticipantLabelView *)self setAvatarView:v10];
    }
    else
    {
      id v10 = [(PHSingleCallParticipantLabelView *)self currentIMNicknameMatchingContact:v4];
      if (+[SensitivityFeatureFlags isSensitivityAvatarTreatmentEnabled])
      {
        CGAffineTransform v19 = [(AmbientAvatarView *)v10 avatar];
        unsigned int v20 = [v19 contentIsSensitive];

        objc_super v21 = sub_1000D5130();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v62[0]) = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SNAP: IMNicknameAvatarImage.contentIsSensitive for currentNickname returning %d", buf, 8u);
        }
      }
      else
      {
        objc_super v21 = sub_1000D5130();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SNAP: IMNicknameAvatarImage.contentIsSensitive for currentNickname not performing check", buf, 2u);
        }
        unsigned int v20 = 0;
      }

      v22 = +[ICSPreferences sharedPreferences];
      unsigned int v23 = [v22 forceBlurCurrentPoster];

      uint64_t v24 = [[_TtC13InCallService19BlurrableAvatarView alloc] initWithContact:v4 wantsBlur:v23 | v20 isCommunicationSafetyEnabled:+[SensitivityFeatureFlags isCommunicationSafetyEnabled]];
      [(PHSingleCallParticipantLabelView *)self setAvatarView:v24];
    }
    v25 = [(PHSingleCallParticipantLabelView *)self avatarView];
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

    v26 = [(PHSingleCallParticipantLabelView *)self avatarView];
    [(PHSingleCallParticipantLabelView *)self addSubview:v26];

    [(PHSingleCallParticipantLabelView *)self updateLayoutGuide];
    [(PHSingleCallParticipantLabelView *)self updateAvatarViewConstraints];
LABEL_24:
    CGAffineTransform v14 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
    -[PHSingleCallParticipantLabelView updateLabelAlignmentForCallDisplayStyle:](self, "updateLabelAlignmentForCallDisplayStyle:", [v14 callDisplayStyle]);
    goto LABEL_25;
  }

LABEL_10:
  double v11 = [(PHSingleCallParticipantLabelView *)self avatarView];
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();

  id v13 = [(PHSingleCallParticipantLabelView *)self avatarView];
  CGAffineTransform v14 = v13;
  if (v12)
  {
LABEL_13:
    [v13 setContact:v4];
LABEL_25:

    goto LABEL_26;
  }
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  if (v15)
  {
    id v13 = [(PHSingleCallParticipantLabelView *)self avatarView];
    CGAffineTransform v14 = v13;
    goto LABEL_13;
  }
LABEL_26:
  [(PHSingleCallParticipantLabelView *)self setUpFirstAndLastNameLabelsIfPossible];
  if ([(PHSingleCallParticipantLabelView *)self shouldUseHeroImageLayout])
  {
    double v27 = +[CNKFeatures sharedInstance];
    unsigned int v28 = [v27 isNameAndPhotoC3Enabled];

    if (v28)
    {
      v29 = +[TUCallCenter sharedInstance];
      double v30 = [v29 frontmostCall];

      if (!v4) {
        goto LABEL_56;
      }
      if (!v30) {
        goto LABEL_56;
      }
      if ([v30 status] != 1) {
        goto LABEL_56;
      }
      uint64_t v31 = [(PHSingleCallParticipantLabelView *)self avatarView];
      if (!v31) {
        goto LABEL_56;
      }
      double v32 = (void *)v31;
      id v33 = [(PHSingleCallParticipantLabelView *)self avatarView];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_55;
      }
      double v34 = +[TUCallCenter sharedInstance];
      id v35 = [v34 currentCallCount];

      if (v35 != (id)1)
      {
LABEL_56:

        goto LABEL_57;
      }
      v36 = [(PHSingleCallParticipantLabelView *)self sharedProfileStateOracle];

      if (!v36)
      {
        v37 = sub_1000D5130();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = [v30 contactIdentifier];
          *(_DWORD *)buf = 138412290;
          v62[0] = v38;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "SNAP: creating a new oracle for contactIdentifier: %@", buf, 0xCu);
        }
        v39 = +[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:v30];
        id v40 = [objc_alloc((Class)CNContactStore) initWithConfiguration:v39];
        id v41 = [objc_alloc((Class)CNSharedProfileStateOracle) initWithContact:v4 contactStore:v40];
        [(PHSingleCallParticipantLabelView *)self setSharedProfileStateOracle:v41];
      }
      v42 = [(PHSingleCallParticipantLabelView *)self avatarView];
      v43 = [v42 cnAvatarView];
      v44 = [(PHSingleCallParticipantLabelView *)self sharedProfileStateOracle];
      [v43 setSharedProfileStateOracle:v44];

      unsigned __int8 v45 = [(PHSingleCallParticipantLabelView *)self sharedProfileStateOracle];
      v46 = [v45 pendingNickname];
      double v32 = [v46 avatar];

      if (+[SensitivityFeatureFlags isSensitivityAvatarTreatmentEnabled])
      {
        unsigned int v47 = [v32 contentIsSensitive];
        v48 = sub_1000D5130();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v49 = [v42 wantsBlur];
          *(_DWORD *)buf = 67109376;
          LODWORD(v62[0]) = v47;
          WORD2(v62[0]) = 1024;
          *(_DWORD *)((char *)v62 + 6) = v49;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "SNAP: IMNicknameAvatarImage.contentIsSensitive for pendingNickname returning %d currentlyBlurred=%d", buf, 0xEu);
        }
      }
      else
      {
        v48 = sub_1000D5130();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "SNAP: IMNicknameAvatarImage.contentIsSensitive for pendingNickname not performing checks", buf, 2u);
        }
        unsigned int v47 = 0;
      }

      v50 = +[ICSPreferences sharedPreferences];
      unsigned int v51 = [v50 forceBlurNewPoster];

      char v52 = 0;
      if (v32 && v51 | v47)
      {
        if (([v42 wantsBlur] & 1) == 0)
        {
          id v53 = [(PHSingleCallParticipantLabelView *)self sharedProfileStateOracle];
          id v54 = [v53 avatarViewAnimationTypeForEffectiveState];

          char v52 = 0;
          if (v54)
          {
            if (v54 != (id)1) {
              goto LABEL_52;
            }
            char v52 = 1;
          }
          [v42 setWantsBlur:1];
          goto LABEL_52;
        }
        char v52 = 0;
      }
LABEL_52:
      id v55 = sub_1000D5130();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "SNAP: asking avatarView to do a coin flip", buf, 2u);
      }

      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_100016964;
      v57[3] = &unk_1002CDA20;
      char v60 = v52;
      id v58 = v42;
      id v59 = v43;
      id v56 = v43;
      id v33 = v42;
      [v56 performTransitionAnimationWithCompletion:v57];

LABEL_55:
      goto LABEL_56;
    }
  }
LABEL_57:
}

- (void)handleContactStoreDidChangeNotification:(id)a3
{
}

- (unint64_t)ambientLayout
{
  v2 = [(PHAbstractCallParticipantLabelView *)self delegate];
  unsigned int v3 = [v2 participantLabelShouldShowLargeAvatar];

  return v3;
}

- (void)updateLabelsOrderAndLayout
{
  [(PHSingleCallParticipantLabelView *)self updateLabelsOrder];
  [(PHSingleCallParticipantLabelView *)self updateLayoutGuide];

  [(PHSingleCallParticipantLabelView *)self updateHeightConstraints];
}

- (void)updateLabelsOrder
{
  unsigned int v3 = [(PHSingleCallParticipantLabelView *)self labelsOrder];
  if ([(PHSingleCallParticipantLabelView *)self isDisplayStyleAmbient])
  {
    BOOL v4 = (id)[(PHSingleCallParticipantLabelView *)self ambientLayout] == (id)1;
  }
  else if ([(PHSingleCallParticipantLabelView *)self shouldUseHeroImageLayout])
  {
    if ([(PHSingleCallParticipantLabelView *)self inBrandedCall]
      || [(PHSingleCallParticipantLabelView *)self inCallDirectoryCall])
    {
      id v5 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
      [v5 setMarqueeEnabled:1];

      char v6 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
      [v6 setMarqueeRunning:1];

      BOOL v7 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
      [v7 setMarqueeEnabled:1];

      objc_super v8 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
      id v9 = v8;
      uint64_t v10 = 1;
    }
    else
    {
      double v11 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
      [v11 setMarqueeEnabled:0];

      char v12 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
      [v12 setMarqueeRunning:0];

      id v13 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
      [v13 setMarqueeEnabled:0];

      objc_super v8 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
      id v9 = v8;
      uint64_t v10 = 0;
    }
    [v8 setMarqueeRunning:v10];

    BOOL v4 = 1;
  }
  else
  {
    BOOL v4 = 0;
  }
  [(PHSingleCallParticipantLabelView *)self setLabelsOrder:v4];
  if (v3 != (void *)[(PHSingleCallParticipantLabelView *)self labelsOrder])
  {
    [(PHSingleCallParticipantLabelView *)self updateLabelConstraints];
  }
}

- (double)_distanceFromParticipantNameBaseLineToStatus
{
  v2 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  id v3 = [v2 callDisplayStyle];

  if (!v3) {
    return -24.0;
  }
  unint64_t v4 = +[PHUIConfiguration screenSize];
  double result = -34.0;
  if (!v4) {
    return -26.0;
  }
  return result;
}

- (BOOL)_statusLabelStringWillFit:(id)a3
{
  NSAttributedStringKey v10 = NSFontAttributeName;
  id v4 = a3;
  id v5 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  char v6 = +[PHUIConfiguration singleCallStatusLabelFontForCallDisplayStyle:](PHUIConfiguration, "singleCallStatusLabelFontForCallDisplayStyle:", [v5 callDisplayStyle]);
  double v11 = v6;
  BOOL v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  LODWORD(v8) = 15.0;
  LOBYTE(self) = [(PHSingleCallParticipantLabelView *)self _statusLabelStringWillFit:v4 attributes:v7 padding:v8];

  return (char)self;
}

- (BOOL)_statusLabelStringWillFit:(id)a3 attributes:(id)a4 padding:(float)a5
{
  [a3 sizeWithAttributes:a4];
  double v8 = v7;
  [(PHSingleCallParticipantLabelView *)self intrinsicContentSize];
  double v10 = v9 + -48.0;
  double v11 = [(PHSingleCallParticipantLabelView *)self avatarView];
  [v11 bounds];
  double v13 = v10 - (v12 + a5);

  return v13 > v8;
}

- (void)setIcon:(id)a3
{
  id v4 = a3;
  iconView = self->_iconView;
  id v20 = v4;
  if (v4 && !iconView)
  {
    char v6 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    double v7 = self->_iconView;
    self->_iconView = v6;

    [(UIImageView *)self->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PHSingleCallParticipantLabelView *)self addSubview:self->_iconView];
    double v8 = [(PHSingleCallParticipantLabelView *)self iconView];
    double v9 = [v8 heightAnchor];
    [(PHSingleCallParticipantLabelView *)self voipIconEdge];
    double v10 = [v9 constraintEqualToConstant:];
    [(PHSingleCallParticipantLabelView *)self setAppIconHeightConstraint:v10];

    double v11 = [(PHSingleCallParticipantLabelView *)self appIconHeightConstraint];
    [v11 setActive:1];

    double v12 = [(PHSingleCallParticipantLabelView *)self iconView];
    double v13 = [v12 widthAnchor];
    [(PHSingleCallParticipantLabelView *)self voipIconEdge];
    CGAffineTransform v14 = [v13 constraintEqualToConstant:];
    [(PHSingleCallParticipantLabelView *)self setAppIconWidthConstraint:v14];

    char v15 = [(PHSingleCallParticipantLabelView *)self appIconWidthConstraint];
    [v15 setActive:1];

    CGAffineTransform v16 = [(UIImageView *)self->_iconView centerYAnchor];
    CGAffineTransform v17 = [(UIStackView *)self->_stackView centerYAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    [v18 setActive:1];

    [(PHSingleCallParticipantLabelView *)self updateStackViewHorizontalConstraintsWithVoIPAppIcon];
    iconView = self->_iconView;
  }
  if (iconView)
  {
    [(UIImageView *)iconView setImage:v20];
    [(PHSingleCallParticipantLabelView *)self updateStackViewHorizontalConstraintsWithVoIPAppIcon];
  }
  [(PHSingleCallParticipantLabelView *)self updatePosterBadgeView];
  CGAffineTransform v19 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  -[PHSingleCallParticipantLabelView updateLabelTextAlignmentForCallDisplayStyle:](self, "updateLabelTextAlignmentForCallDisplayStyle:", [v19 callDisplayStyle]);
}

- (void)updateIconSize
{
  id v3 = [(PHSingleCallParticipantLabelView *)self iconView];

  if (v3)
  {
    [(PHSingleCallParticipantLabelView *)self voipIconEdge];
    double v5 = v4;
    char v6 = [(PHSingleCallParticipantLabelView *)self appIconHeightConstraint];
    [v6 setConstant:v5];

    [(PHSingleCallParticipantLabelView *)self voipIconEdge];
    double v8 = v7;
    id v9 = [(PHSingleCallParticipantLabelView *)self appIconWidthConstraint];
    [v9 setConstant:v8];
  }
}

- (double)voipIconEdge
{
  v2 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  id v3 = [v2 callDisplayStyle];

  double result = 16.0;
  if (v3 == (id)3) {
    double result = 26.0;
  }
  if (!v3) {
    return 13.0;
  }
  return result;
}

- (double)voipIconMarginH
{
  v2 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  id v3 = [v2 callDisplayStyle];

  double result = 5.0;
  if (v3 == (id)3) {
    double result = 8.0;
  }
  if (!v3) {
    return 4.0;
  }
  return result;
}

- (void)setBusinessLogo:(id)a3 isPerson:(BOOL)a4
{
  BOOL v4 = a4;
  id v37 = a3;
  if (![(PHSingleCallParticipantLabelView *)self shouldUseHeroImageLayout])
  {
    char v6 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
    id v7 = [v6 callDisplayStyle];

    if (v7 != (id)3)
    {
      businessLogoView = self->_businessLogoView;
      if (v37 && !businessLogoView)
      {
        CGAffineTransform v17 = (UIImageView *)objc_alloc_init((Class)UIImageView);
        v18 = self->_businessLogoView;
        self->_businessLogoView = v17;

        [(UIImageView *)self->_businessLogoView setTranslatesAutoresizingMaskIntoConstraints:0];
        [(PHSingleCallParticipantLabelView *)self addSubview:self->_businessLogoView];
        CGAffineTransform v19 = [(PHSingleCallParticipantLabelView *)self businessLogoView];
        id v20 = [v19 heightAnchor];
        [(PHSingleCallParticipantLabelView *)self businessLogoEdge];
        objc_super v21 = [v20 constraintEqualToConstant:];
        [(PHSingleCallParticipantLabelView *)self setBusinessLogoHeightConstraint:v21];

        v22 = [(PHSingleCallParticipantLabelView *)self businessLogoHeightConstraint];
        [v22 setActive:1];

        unsigned int v23 = [(PHSingleCallParticipantLabelView *)self businessLogoView];
        uint64_t v24 = [v23 widthAnchor];
        [(PHSingleCallParticipantLabelView *)self businessLogoEdge];
        v25 = [v24 constraintEqualToConstant:];
        [(PHSingleCallParticipantLabelView *)self setBusinessLogoWidthConstraint:v25];

        v26 = [(PHSingleCallParticipantLabelView *)self businessLogoWidthConstraint];
        [v26 setActive:1];

        double v27 = [(UIImageView *)self->_businessLogoView centerYAnchor];
        unsigned int v28 = [(UIStackView *)self->_stackView centerYAnchor];
        v29 = [v27 constraintEqualToAnchor:v28];
        [v29 setActive:1];

        [(PHSingleCallParticipantLabelView *)self updateStackViewHorizontalConstraintsWithBusinessLogo];
        businessLogoView = self->_businessLogoView;
      }
      if (businessLogoView)
      {
        if (v37)
        {
          -[UIImageView setImage:](businessLogoView, "setImage:");
          [(PHSingleCallParticipantLabelView *)self businessLogoCornerRadius];
          double v31 = v30;
          double v32 = [(UIImageView *)self->_businessLogoView layer];
          [v32 setCornerRadius:v31];

          id v33 = [(UIImageView *)self->_businessLogoView layer];
          [v33 setMasksToBounds:1];

          [(PHSingleCallParticipantLabelView *)self updateStackViewHorizontalConstraintsWithBusinessLogo];
        }
        else
        {
          double v34 = [(PHSingleCallParticipantLabelView *)self businessLogoHeightConstraint];
          [v34 setActive:0];

          id v35 = [(PHSingleCallParticipantLabelView *)self businessLogoWidthConstraint];
          [v35 setActive:0];

          [(UIImageView *)self->_businessLogoView removeFromSuperview];
          v36 = self->_businessLogoView;
          self->_businessLogoView = 0;
        }
      }
      double v12 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
      -[PHSingleCallParticipantLabelView updateLabelTextAlignmentForCallDisplayStyle:](self, "updateLabelTextAlignmentForCallDisplayStyle:", [v12 callDisplayStyle]);
      goto LABEL_20;
    }
  }
  double v8 = [(PHSingleCallParticipantLabelView *)self avatarView];

  if (v37 && !v8)
  {
    id v9 = [[_TtC13InCallService13LogoImageView alloc] initWithImage:v37 style:!v4];
    [(PHSingleCallParticipantLabelView *)self setAvatarView:v9];

    double v10 = [(PHSingleCallParticipantLabelView *)self avatarView];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v11 = [(PHSingleCallParticipantLabelView *)self avatarView];
    [(PHSingleCallParticipantLabelView *)self addSubview:v11];

    [(PHSingleCallParticipantLabelView *)self updateLayoutGuide];
    [(PHSingleCallParticipantLabelView *)self updateAvatarViewConstraints];
LABEL_6:
    double v12 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
    -[PHSingleCallParticipantLabelView updateLabelAlignmentForCallDisplayStyle:](self, "updateLabelAlignmentForCallDisplayStyle:", [v12 callDisplayStyle]);
    goto LABEL_20;
  }
  double v13 = [(PHSingleCallParticipantLabelView *)self avatarView];

  if (!v13) {
    goto LABEL_21;
  }
  CGAffineTransform v14 = [(PHSingleCallParticipantLabelView *)self avatarView];
  if (!v37)
  {
    [v14 removeFromSuperview];

    [(PHSingleCallParticipantLabelView *)self setAvatarView:0];
    [(PHSingleCallParticipantLabelView *)self updateLayoutGuide];
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_21;
  }
  double v12 = [(PHSingleCallParticipantLabelView *)self avatarView];
  [v12 setImage:v37];
LABEL_20:

LABEL_21:
}

- (void)updateBusinessLogoSize
{
  id v3 = [(PHSingleCallParticipantLabelView *)self businessLogoView];

  if (v3)
  {
    [(PHSingleCallParticipantLabelView *)self businessLogoEdge];
    double v5 = v4;
    char v6 = [(PHSingleCallParticipantLabelView *)self businessLogoHeightConstraint];
    [v6 setConstant:v5];

    [(PHSingleCallParticipantLabelView *)self businessLogoEdge];
    double v8 = v7;
    id v9 = [(PHSingleCallParticipantLabelView *)self businessLogoWidthConstraint];
    [v9 setConstant:v8];
  }
}

- (double)businessLogoEdge
{
  v2 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  id v3 = [v2 callDisplayStyle];

  double result = 22.0;
  if (v3 == (id)3) {
    double result = 26.0;
  }
  if (!v3) {
    return 16.0;
  }
  return result;
}

- (double)businessLogoMarginH
{
  v2 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  id v3 = [v2 callDisplayStyle];

  double result = 8.0;
  if (!v3) {
    return 6.0;
  }
  return result;
}

- (double)businessLogoCornerRadius
{
  v2 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  id v3 = [v2 callDisplayStyle];

  double result = 4.0;
  if (v3 == (id)3) {
    double result = 6.0;
  }
  if (!v3) {
    return 3.0;
  }
  return result;
}

- (void)setBannerButtonsState:(unint64_t)a3
{
  id v4 = [(PHSingleCallParticipantLabelView *)self bannerButtonsView];
  [v4 setState:a3];
}

- (void)setBannerAudioRouteButtonSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PHSingleCallParticipantLabelView *)self bannerButtonsView];
  [v4 setAudioRouteButtonSelected:v3];
}

- (void)setTrailingSideLayoutGuide:(id)a3
{
  objc_storeWeak((id *)&self->_trailingSideLayoutGuide, a3);
  id v4 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  -[PHSingleCallParticipantLabelView updateLayoutForCallDisplayStyle:](self, "updateLayoutForCallDisplayStyle:", [v4 callDisplayStyle]);
}

- (void)setCustomAvatar:(id)a3
{
  id v11 = a3;
  id v4 = [(PHSingleCallParticipantLabelView *)self avatarView];

  if (v4)
  {
    double v5 = [(PHSingleCallParticipantLabelView *)self avatarView];
    [v5 removeFromSuperview];

    [(PHSingleCallParticipantLabelView *)self setAvatarView:0];
  }
  if (v11)
  {
    id v6 = [objc_alloc((Class)UIImageView) initWithImage:v11];
    [(PHSingleCallParticipantLabelView *)self setAvatarView:v6];

    double v7 = [(PHSingleCallParticipantLabelView *)self avatarView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v8 = [(PHSingleCallParticipantLabelView *)self avatarView];
    [(PHSingleCallParticipantLabelView *)self addSubview:v8];

    [(PHSingleCallParticipantLabelView *)self updateLayoutGuide];
    [(PHSingleCallParticipantLabelView *)self updateAvatarViewConstraints];
  }
  else
  {
    id v9 = [(PHSingleCallParticipantLabelView *)self avatarView];
    [v9 removeFromSuperview];

    [(PHSingleCallParticipantLabelView *)self setAvatarView:0];
    [(PHSingleCallParticipantLabelView *)self updateLayoutGuide];
  }
  double v10 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  -[PHSingleCallParticipantLabelView updateLabelAlignmentForCallDisplayStyle:](self, "updateLabelAlignmentForCallDisplayStyle:", [v10 callDisplayStyle]);
}

- (void)setPosterNameViewModel:(id)a3
{
  p_posterNameViewModel = &self->_posterNameViewModel;
  id v8 = a3;
  id v5 = objc_storeWeak((id *)p_posterNameViewModel, v8);
  id v6 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
  double v7 = [v6 text];
  [v8 updateStatus:v7];
}

- (void)setPosterBadgeView:(id)a3
{
  objc_storeWeak((id *)&self->_posterBadgeView, a3);

  [(PHSingleCallParticipantLabelView *)self updatePosterBadgeView];
}

- (void)updatePosterBadgeView
{
  BOOL v3 = [(PHSingleCallParticipantLabelView *)self posterBadgeView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v8 = [(PHSingleCallParticipantLabelView *)self posterBadgeView];
  if (isKindOfClass)
  {
    id v5 = [(PHSingleCallParticipantLabelView *)self badgeView];
    id v6 = [v5 title];
    [v8 setTitle:v6];
  }
  else
  {
    objc_opt_class();
    char v7 = objc_opt_isKindOfClass();

    if ((v7 & 1) == 0) {
      return;
    }
    id v8 = [(PHSingleCallParticipantLabelView *)self posterBadgeView];
    id v5 = [(PHSingleCallParticipantLabelView *)self iconView];
    id v6 = [v5 image];
    [v8 setImage:v6];
  }
}

- (void)statusLabelTapped:(id)a3
{
  uint64_t v4 = [(PHSingleCallParticipantLabelView *)self statusLabelsArray];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(PHSingleCallParticipantLabelView *)self statusLabelsArray];
    id v7 = [v6 count];

    if ((unint64_t)v7 >= 2)
    {
      [(PHSingleCallParticipantLabelView *)self invalidateStatusLabelTimer];
      [(PHSingleCallParticipantLabelView *)self animateToNextLabel];
    }
  }
}

- (void)animateToFirstLabel
{
  [(PHSingleCallParticipantLabelView *)self animateToNextLabel];

  [(PHSingleCallParticipantLabelView *)self scheduleStatusLabelTimer];
}

- (void)animateToNextLabel
{
  uint64_t v3 = [(PHSingleCallParticipantLabelView *)self statusLabelsArray];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    id v5 = [(PHSingleCallParticipantLabelView *)self statusLabelsArray];
    id v6 = [v5 count];

    if ((unint64_t)v6 >= 2)
    {
      [(PHSingleCallParticipantLabelView *)self setCurrentStatusLabelIndex:(char *)[(PHSingleCallParticipantLabelView *)self currentStatusLabelIndex] + 1];
      unint64_t v7 = [(PHSingleCallParticipantLabelView *)self currentStatusLabelIndex];
      id v8 = [(PHSingleCallParticipantLabelView *)self statusLabelsArray];
      id v9 = [v8 count];

      if (v7 >= (unint64_t)v9) {
        [(PHSingleCallParticipantLabelView *)self setCurrentStatusLabelIndex:0];
      }
      id v11 = [(PHSingleCallParticipantLabelView *)self statusLabelsArray];
      double v10 = [v11 objectAtIndex:[self currentStatusLabelIndex]];
      [(PHSingleCallParticipantLabelView *)self fadeStatusLabelToAttributedOrPlainString:v10];
    }
  }
}

- (void)scheduleStatusLabelTimer
{
  [(PHSingleCallParticipantLabelView *)self invalidateStatusLabelTimer];
  objc_initWeak(&location, self);
  uint64_t v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = sub_100017E98;
  unint64_t v7 = &unk_1002CDA48;
  objc_copyWeak(&v8, &location);
  uint64_t v3 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v4 block:2.5];
  -[PHSingleCallParticipantLabelView setStatusLabelTimer:](self, "setStatusLabelTimer:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)invalidateStatusLabelTimer
{
  uint64_t v3 = [(PHSingleCallParticipantLabelView *)self statusLabelTimer];

  if (v3)
  {
    uint64_t v4 = [(PHSingleCallParticipantLabelView *)self statusLabelTimer];
    [v4 invalidate];

    [(PHSingleCallParticipantLabelView *)self setStatusLabelTimer:0];
  }
}

- (void)fadeStatusLabelToAttributedOrPlainString:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100018034;
  v6[3] = &unk_1002CD518;
  v6[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000180A4;
  v4[3] = &unk_1002CDA70;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  +[UIView animateWithDuration:v6 animations:v4 completion:0.200000003];
}

- (void)updateLayoutForCallDisplayStyle:(int64_t)a3
{
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v6 = [(ICSCallDisplayStyleManager *)self->_callDisplayStyleManager callDisplayStyle];
    int v10 = 134217984;
    int64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating single-participant label for presentation mode %ld", (uint8_t *)&v10, 0xCu);
  }

  [(PHSingleCallParticipantLabelView *)self updateParticipantMarqueeLabelNumberOfLines];
  [(PHSingleCallParticipantLabelView *)self updateLabelsOrderAndLayout];
  [(PHSingleCallParticipantLabelView *)self updateBannerButtonsViewForCallDisplayStyle:a3];
  [(PHSingleCallParticipantLabelView *)self updateAvatarViewConstraints];
  [(PHSingleCallParticipantLabelView *)self updateLabelAlignmentForCallDisplayStyle:a3];
  [(PHSingleCallParticipantLabelView *)self updateLabelScales];
  [(PHSingleCallParticipantLabelView *)self updateLabelFonts];
  unint64_t v7 = [(PHAbstractCallParticipantLabelView *)self delegate];
  if (v7)
  {
    id v5 = [(PHAbstractCallParticipantLabelView *)self delegate];
    double v8 = (double)[v5 shouldShowParticipantLabel];
  }
  else
  {
    double v8 = 1.0;
  }
  id v9 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
  [v9 setAlpha:v8];

  if (v7) {
}
  }

- (void)deactivateLayoutGuideConstraints
{
  id v3 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangleMinLeadingConstraint];
  [v3 setActive:0];

  uint64_t v4 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangleMaxLeadingConstraint];
  [v4 setActive:0];

  id v5 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangleTrailingConstraint];
  [v5 setActive:0];

  int64_t v6 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangleCenterXConstraint];
  [v6 setActive:0];

  unint64_t v7 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangleCenterYConstraint];
  [v7 setActive:0];

  double v8 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangleTopConstraint];
  [v8 setActive:0];

  id v9 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangleBottomConstraint];
  [v9 setActive:0];
}

- (void)updateLayoutGuide
{
  [(PHSingleCallParticipantLabelView *)self deactivateLayoutGuideConstraints];
  id v3 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangle];
  uint64_t v4 = [v3 centerYAnchor];
  id v5 = [(PHSingleCallParticipantLabelView *)self centerYAnchor];
  int64_t v6 = [v4 constraintEqualToAnchor:v5];
  [(PHSingleCallParticipantLabelView *)self setParticipantAndStatusRectangleCenterYConstraint:v6];

  unint64_t v7 = [(PHSingleCallParticipantLabelView *)self labelsOrder];
  double v8 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangle];
  id v9 = [v8 topAnchor];
  if (v7 == 1)
  {
    int v10 = [(PHSingleCallParticipantLabelView *)self stackView];
    int64_t v11 = [v10 topAnchor];
    double v12 = [v9 constraintEqualToAnchor:v11];
    [(PHSingleCallParticipantLabelView *)self setParticipantAndStatusRectangleTopConstraint:v12];

    double v13 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
    if (!v13
      || ([(PHSingleCallParticipantLabelView *)self secondaryInfoLabel],
          int v10 = objc_claimAutoreleasedReturnValue(),
          [v10 text],
          int64_t v11 = objc_claimAutoreleasedReturnValue(),
          ![v11 length]))
    {
      uint64_t v16 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
      goto LABEL_10;
    }
  }
  else
  {
    int v10 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    int64_t v11 = [v10 topAnchor];
    CGAffineTransform v14 = [v9 constraintEqualToAnchor:v11];
    [(PHSingleCallParticipantLabelView *)self setParticipantAndStatusRectangleTopConstraint:v14];

    double v13 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
    if (!v13
      || ([(PHSingleCallParticipantLabelView *)self secondaryInfoLabel],
          int v10 = objc_claimAutoreleasedReturnValue(),
          [v10 text],
          int64_t v11 = objc_claimAutoreleasedReturnValue(),
          ![v11 length]))
    {
      uint64_t v16 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
LABEL_10:
      char v15 = (void *)v16;
      if (!v13) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  char v15 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
LABEL_11:

LABEL_12:
  CGAffineTransform v17 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangle];
  v18 = [v17 bottomAnchor];
  CGAffineTransform v19 = [v15 bottomAnchor];
  id v20 = [v18 constraintEqualToAnchor:v19];
  [(PHSingleCallParticipantLabelView *)self setParticipantAndStatusRectangleBottomConstraint:v20];

  BOOL v21 = [(PHSingleCallParticipantLabelView *)self ambientLayout] == 0;
  v22 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangleCenterYConstraint];
  [v22 setActive:v21];

  unsigned int v23 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangleTopConstraint];
  [v23 setActive:1];

  uint64_t v24 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangleBottomConstraint];
  [v24 setActive:1];

  v25 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  v26 = (char *)[v25 callDisplayStyle];

  if ((unint64_t)(v26 - 1) <= 3)
  {
    double v27 = +[UIDevice currentDevice];
    unint64_t v28 = (unint64_t)[v27 userInterfaceIdiom];

    unint64_t v29 = v28 & 0xFFFFFFFFFFFFFFFBLL;
    double v30 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangle];
    double v31 = [v30 leadingAnchor];
    double v32 = [(PHSingleCallParticipantLabelView *)self leadingAnchor];
    if (v29 == 1)
    {
      id v33 = [v31 constraintGreaterThanOrEqualToAnchor:v32];
      [(PHSingleCallParticipantLabelView *)self setParticipantAndStatusRectangleMinLeadingConstraint:v33];

      double v34 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangle];
      id v35 = [v34 leadingAnchor];
      v36 = [(PHSingleCallParticipantLabelView *)self centerXAnchor];
      id v37 = [v35 constraintLessThanOrEqualToAnchor:v36 constant:-130.0];
      [(PHSingleCallParticipantLabelView *)self setParticipantAndStatusRectangleMaxLeadingConstraint:v37];

      v38 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangle];
      v39 = [v38 centerXAnchor];
      id v40 = [(PHSingleCallParticipantLabelView *)self centerXAnchor];
      id v41 = [v39 constraintEqualToAnchor:v40];
      [(PHSingleCallParticipantLabelView *)self setParticipantAndStatusRectangleCenterXConstraint:v41];

      v42 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
      [v42 intrinsicContentSize];
      double v44 = v43;
      unsigned __int8 v45 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
      [v45 intrinsicContentSize];
      if (v44 > v46) {
        [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
      }
      else {
      double v30 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
      }

      v48 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangle];
      unsigned int v49 = [v48 trailingAnchor];
      v50 = [v30 trailingAnchor];
      unsigned int v51 = [v49 constraintEqualToAnchor:v50];
      [(PHSingleCallParticipantLabelView *)self setParticipantAndStatusRectangleTrailingConstraint:v51];

      char v52 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangleMaxLeadingConstraint];
      LODWORD(v53) = 1148846080;
      [v52 setPriority:v53];

      id v54 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangleMaxLeadingConstraint];
      [v54 setActive:1];

      id v55 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangleCenterXConstraint];
      [v55 setActive:1];

      double v31 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangleTrailingConstraint];
      [v31 setActive:1];
    }
    else
    {
      unsigned int v47 = [v31 constraintEqualToAnchor:v32 constant:20.0];
      [(PHSingleCallParticipantLabelView *)self setParticipantAndStatusRectangleMinLeadingConstraint:v47];
    }
    id v56 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangleMinLeadingConstraint];
    [v56 setActive:1];
  }
}

- (void)updateBannerButtonsViewForCallDisplayStyle:(int64_t)a3
{
  if (!a3)
  {
    id v5 = [(PHSingleCallParticipantLabelView *)self bannerButtonsView];
    int64_t v6 = [v5 superview];

    if (!v6)
    {
      unint64_t v7 = [[PHBannerButtonsView alloc] initWithState:[(PHSingleCallParticipantLabelView *)self initialStateForBannerButtonsView]];
      [(PHSingleCallParticipantLabelView *)self setBannerButtonsView:v7];

      double v8 = [(PHSingleCallParticipantLabelView *)self bannerButtonsView];
      [v8 setDelegate:self];

      id v9 = [(PHSingleCallParticipantLabelView *)self bannerButtonsView];
      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

      int v10 = [(PHSingleCallParticipantLabelView *)self bannerButtonsView];
      [(PHSingleCallParticipantLabelView *)self addSubview:v10];

      BOOL v21 = [(PHSingleCallParticipantLabelView *)self bannerButtonsView];
      id v20 = [v21 centerYAnchor];
      int64_t v11 = [(PHSingleCallParticipantLabelView *)self centerYAnchor];
      double v12 = [v20 constraintEqualToAnchor:v11];
      v22[0] = v12;
      double v13 = [(PHSingleCallParticipantLabelView *)self bannerButtonsView];
      CGAffineTransform v14 = [v13 trailingAnchor];
      char v15 = [(PHSingleCallParticipantLabelView *)self layoutMarginsGuide];
      uint64_t v16 = [v15 trailingAnchor];
      CGAffineTransform v17 = [v14 constraintEqualToAnchor:v16];
      v22[1] = v17;
      v18 = +[NSArray arrayWithObjects:v22 count:2];
      [(PHSingleCallParticipantLabelView *)self addConstraints:v18];
    }
  }
  CGAffineTransform v19 = [(PHSingleCallParticipantLabelView *)self bannerButtonsView];
  [v19 setHidden:a3 != 0];
}

- (unint64_t)initialStateForBannerButtonsView
{
  v2 = +[TUCallCenter sharedInstance];
  id v3 = [v2 incomingVideoCall];

  uint64_t v4 = +[TUCallCenter sharedInstance];
  id v5 = v4;
  if (v3)
  {
    int64_t v6 = [v4 incomingVideoCall];
    unsigned int v7 = [v6 isConversation];

    if (!v7) {
      return 2;
    }
    double v8 = +[TUCallCenter sharedInstance];
    id v9 = +[TUCallCenter sharedInstance];
    int v10 = [v9 incomingVideoCall];
    int64_t v11 = [v8 activeConversationForCall:v10];

    id v12 = [v11 resolvedAudioVideoMode];
    if (v12 == (id)1) {
      return 0;
    }
    else {
      return 2;
    }
  }
  else
  {
    CGAffineTransform v14 = [v4 incomingCall];
    unint64_t v13 = v14 == 0;
  }
  return v13;
}

- (void)updateViewForCallState
{
  if ([(PHSingleCallParticipantLabelView *)self isDisplayStyleAmbient])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000190CC;
    v18[3] = &unk_1002CD518;
    v18[4] = self;
    id v3 = objc_retainBlock(v18);
    uint64_t v4 = [(PHSingleCallParticipantLabelView *)self previousIsCallRinging];

    id v5 = [(PHAbstractCallParticipantLabelView *)self delegate];
    unsigned int v6 = [v5 isCallRinging];
    if (v4)
    {
      unsigned int v7 = [(PHSingleCallParticipantLabelView *)self previousIsCallRinging];
      unsigned int v8 = [v7 BOOLValue];

      if (v6 != v8)
      {
        unint64_t v13 = _NSConcreteStackBlock;
        uint64_t v14 = 3221225472;
        char v15 = sub_10001919C;
        uint64_t v16 = &unk_1002CDA98;
        CGAffineTransform v17 = v3;
        +[UIView _animateUsingSpringWithDuration:4 delay:&v13 options:&stru_1002CDAB8 mass:0.5 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:37.0 completion:0.0];
        id v9 = [(PHAbstractCallParticipantLabelView *)self delegate];
        unsigned __int8 v10 = [v9 isCallRinging];

        if ((v10 & 1) == 0) {
          [(PHSingleCallParticipantLabelView *)self hideFirstAndLastNameAnimated:1];
        }
      }
    }
    else
    {

      if (v6)
      {
        ((void (*)(void *))v3[2])(v3);
        [(PHSingleCallParticipantLabelView *)self showFirstAndLastNameAnimated:0];
      }
    }
    int64_t v11 = [(PHAbstractCallParticipantLabelView *)self delegate];
    id v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isCallRinging]);
    [(PHSingleCallParticipantLabelView *)self setPreviousIsCallRinging:v12];
  }
}

- (void)updateGestureRecognizersEnabled
{
  id v3 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  id v4 = [v3 callDisplayStyle];

  if ((unint64_t)v4 < 2)
  {
    unsigned int v8 = [(PHSingleCallParticipantLabelView *)self callDetailsGestureRecognizer];
    [v8 setEnabled:0];

    uint64_t v7 = 0;
  }
  else
  {
    BOOL v5 = [(PHSingleCallParticipantLabelView *)self showsCallDetailsViewButton];
    unsigned int v6 = [(PHSingleCallParticipantLabelView *)self callDetailsGestureRecognizer];
    [v6 setEnabled:v5];

    uint64_t v7 = [(PHSingleCallParticipantLabelView *)self showsCallDetailsViewButton] ^ 1;
  }
  id v9 = [(PHSingleCallParticipantLabelView *)self statusLabelTapRecognizer];
  [v9 setEnabled:v7];

  id v12 = [(PHSingleCallParticipantLabelView *)self statusLabelTapRecognizer];
  id v10 = [v12 isEnabled];
  int64_t v11 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
  [v11 setUserInteractionEnabled:v10];
}

- (void)updateLabelAlignmentForCallDisplayStyle:(int64_t)a3
{
  [(PHSingleCallParticipantLabelView *)self updateStackViewHorizontalConstraints];
  [(PHSingleCallParticipantLabelView *)self updateParticipantMarqueeLabelHorizontalConstraint];
  [(PHSingleCallParticipantLabelView *)self updateSecondaryLabelHorizontalConstraint];
  [(PHSingleCallParticipantLabelView *)self updateLabelTrailingConstraints];

  [(PHSingleCallParticipantLabelView *)self updateLabelTextAlignmentForCallDisplayStyle:a3];
}

- (void)updateLabelScales
{
  id v3 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  if ([v3 callDisplayStyle])
  {
    id v4 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
    id v5 = [v4 callDisplayStyle];

    if (v5 != (id)1)
    {
      unsigned int v6 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
      [v6 setAdjustsFontSizeToFitWidth:1];

      if ([(PHSingleCallParticipantLabelView *)self isDisplayStyleAmbient]) {
        double v7 = 0.37;
      }
      else {
        double v7 = 0.9;
      }
      id v8 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
      [v8 setMinimumScaleFactor:v7];
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v8 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
  [v8 setAdjustsFontSizeToFitWidth:0];
LABEL_9:
}

- (void)updateLabelFonts
{
  id v3 = [(PHSingleCallParticipantLabelView *)self updatedParticipantMarqueeLabelFont];
  id v4 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
  [v4 setFont:v3];

  id v5 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  unsigned int v6 = +[PHUIConfiguration singleCallStatusLabelFontForCallDisplayStyle:](PHUIConfiguration, "singleCallStatusLabelFontForCallDisplayStyle:", [v5 callDisplayStyle]);
  double v7 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
  [v7 setFont:v6];

  id v10 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  id v8 = +[PHUIConfiguration singleCallStatusLabelFontForCallDisplayStyle:](PHUIConfiguration, "singleCallStatusLabelFontForCallDisplayStyle:", [v10 callDisplayStyle]);
  id v9 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
  [v9 setFont:v8];
}

- (void)updateLabelsOrderAndText
{
  [(PHSingleCallParticipantLabelView *)self updateLabelsOrder];

  [(PHSingleCallParticipantLabelView *)self updateStatusLabelText];
}

- (void)updateStatusLabelText
{
  if ([(PHSingleCallParticipantLabelView *)self inBrandedCall])
  {
    id v5 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
    [v5 setNumberOfLines:1];
  }
  else
  {
    id v5 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
    if ([v5 callDisplayStyle] == (id)3) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    id v4 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
    [v4 setNumberOfLines:v3];
  }
}

- (BOOL)inBrandedCall
{
  v2 = +[TUCallCenter sharedInstance];
  uint64_t v3 = [v2 frontmostCall];

  LOBYTE(v2) = [v3 isBranded];
  return (char)v2;
}

- (BOOL)inCallDirectoryCall
{
  v2 = +[TUCallCenter sharedInstance];
  uint64_t v3 = [v2 frontmostCall];

  id v4 = [v3 callDirectoryName];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (id)updatedParticipantMarqueeLabelFont
{
  uint64_t v3 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  id v4 = [v3 callDisplayStyle];

  if (v4 == (id)3)
  {
    int64_t v11 = +[PHUIConfiguration singleCallParticipantLabelAmbientFont];
    id v12 = [(PHAbstractCallParticipantLabelView *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v14 = [(PHAbstractCallParticipantLabelView *)self delegate];
      uint64_t v15 = [v14 customFontForParticipantLabel];
      uint64_t v16 = (void *)v15;
      if (v15) {
        CGAffineTransform v17 = (void *)v15;
      }
      else {
        CGAffineTransform v17 = v11;
      }
      id v18 = v17;

      int64_t v11 = v18;
    }
    unint64_t v19 = [(PHSingleCallParticipantLabelView *)self ambientLayout];
    double v20 = 60.0;
    if (v19 == 1) {
      double v20 = 90.0;
    }
    id v9 = [v11 fontWithSize:v20];
  }
  else
  {
    if (v4 == (id)1)
    {
      uint64_t v10 = +[PHUIConfiguration singleCallParticipantLabelMiniWindowFont];
    }
    else
    {
      if (!v4)
      {
        id v5 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
        unsigned int v6 = [v5 text];
        double v7 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
        [v7 bounds];
        id v9 = +[PHUIConfiguration singleCallParticipantLabelBannerFontForText:v6 availableWidth:v8];

        goto LABEL_16;
      }
      uint64_t v10 = +[PHUIConfiguration singleCallParticipantLabelFullscreenFont];
    }
    id v9 = (void *)v10;
  }
LABEL_16:

  return v9;
}

- (void)updateLabelTextAlignmentForCallDisplayStyle:(int64_t)a3
{
  if ((id)[(PHSingleCallParticipantLabelView *)self ambientLayout] == (id)1) {
    goto LABEL_2;
  }
  if (a3)
  {
    unsigned int v6 = [(PHSingleCallParticipantLabelView *)self avatarView];
    if (v6)
    {
    }
    else
    {
      double v7 = [(PHSingleCallParticipantLabelView *)self iconView];

      if (!v7)
      {
LABEL_2:
        uint64_t v5 = 1;
        goto LABEL_8;
      }
    }
  }
  uint64_t v5 = 4;
LABEL_8:
  double v8 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
  [v8 setTextAlignment:v5];

  id v9 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
  [v9 setTextAlignment:v5];

  id v10 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
  [v10 setTextAlignment:v5];
}

- (void)updateStackViewHorizontalConstraints
{
  uint64_t v3 = [(PHSingleCallParticipantLabelView *)self stackViewHorizontalConstraint];
  [v3 setActive:0];

  if ([(PHSingleCallParticipantLabelView *)self isDisplayStyleAmbient]
    && (id)[(PHSingleCallParticipantLabelView *)self ambientLayout] == (id)1)
  {
    id v4 = [(PHSingleCallParticipantLabelView *)self stackView];
    uint64_t v5 = [v4 centerXAnchor];
    unsigned int v6 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    uint64_t v7 = [v6 centerXAnchor];
LABEL_8:
    id v9 = (void *)v7;
    id v10 = [v5 constraintEqualToAnchor:v7];
    [(PHSingleCallParticipantLabelView *)self setStackViewHorizontalConstraint:v10];

    goto LABEL_9;
  }
  double v8 = [(PHSingleCallParticipantLabelView *)self avatarView];
  if (v8 || [(PHSingleCallParticipantLabelView *)self isDisplayStyleBanner])
  {

LABEL_7:
    id v4 = [(PHSingleCallParticipantLabelView *)self stackView];
    uint64_t v5 = [v4 leadingAnchor];
    unsigned int v6 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    uint64_t v7 = [v6 leadingAnchor];
    goto LABEL_8;
  }
  if ([(PHSingleCallParticipantLabelView *)self isDisplayStyleAmbient]) {
    goto LABEL_7;
  }
  id v4 = [(PHSingleCallParticipantLabelView *)self stackView];
  uint64_t v5 = [v4 centerXAnchor];
  unsigned int v6 = [(PHSingleCallParticipantLabelView *)self centerXAnchor];
  id v9 = [v5 constraintEqualToAnchor:v6];
  [(PHSingleCallParticipantLabelView *)self setStackViewHorizontalConstraint:v9];
LABEL_9:

  int64_t v11 = [(PHSingleCallParticipantLabelView *)self stackViewHorizontalConstraint];
  [v11 setActive:1];

  id v12 = [(PHSingleCallParticipantLabelView *)self iconView];

  if (v12)
  {
    [(PHSingleCallParticipantLabelView *)self updateIconSize];
    [(PHSingleCallParticipantLabelView *)self updateStackViewHorizontalConstraintsWithVoIPAppIcon];
  }
  char v13 = [(PHSingleCallParticipantLabelView *)self businessLogoView];

  if (v13)
  {
    [(PHSingleCallParticipantLabelView *)self updateBusinessLogoSize];
    [(PHSingleCallParticipantLabelView *)self updateStackViewHorizontalConstraintsWithBusinessLogo];
  }
}

- (void)updateStackViewHorizontalConstraintsWithVoIPAppIcon
{
  uint64_t v3 = [(PHSingleCallParticipantLabelView *)self appIconViewLeadingAnchor];
  [v3 setActive:0];

  id v4 = [(PHSingleCallParticipantLabelView *)self appIconLayoutGuide];

  if (v4)
  {
    uint64_t v5 = [(PHSingleCallParticipantLabelView *)self appIconLayoutGuide];
    [(PHSingleCallParticipantLabelView *)self removeLayoutGuide:v5];
  }
  unsigned int v6 = [(PHSingleCallParticipantLabelView *)self appIconLayoutGuideHorizontalAnchor];
  [v6 setActive:0];

  uint64_t v7 = [(UIImageView *)self->_iconView image];
  if (v7)
  {
    [(PHSingleCallParticipantLabelView *)self voipIconEdge];
    double v9 = v8;
    [(PHSingleCallParticipantLabelView *)self voipIconMarginH];
    double v11 = v9 + v10;
  }
  else
  {
    double v11 = 0.0;
  }

  id v12 = [(PHSingleCallParticipantLabelView *)self avatarView];
  if (v12)
  {
  }
  else
  {
    id v18 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
    id v19 = [v18 callDisplayStyle];

    if (v19)
    {
      id v20 = objc_alloc_init((Class)UILayoutGuide);
      [(PHSingleCallParticipantLabelView *)self setAppIconLayoutGuide:v20];

      BOOL v21 = [(PHSingleCallParticipantLabelView *)self appIconLayoutGuide];
      [(PHSingleCallParticipantLabelView *)self addLayoutGuide:v21];

      v22 = [(UIImageView *)self->_iconView leadingAnchor];
      unsigned int v23 = [(PHSingleCallParticipantLabelView *)self appIconLayoutGuide];
      uint64_t v24 = [v23 leadingAnchor];
      v25 = [v22 constraintEqualToAnchor:v24];
      [(PHSingleCallParticipantLabelView *)self setAppIconViewLeadingAnchor:v25];

      v26 = [(PHSingleCallParticipantLabelView *)self stackViewHorizontalConstraint];
      [v26 setActive:0];

      double v27 = [(PHSingleCallParticipantLabelView *)self stackView];
      unint64_t v28 = [v27 leadingAnchor];
      unint64_t v29 = [(UIImageView *)self->_iconView leadingAnchor];
      double v30 = [v28 constraintEqualToAnchor:v29 constant:v11];
      [(PHSingleCallParticipantLabelView *)self setStackViewHorizontalConstraint:v30];

      double v31 = [(PHSingleCallParticipantLabelView *)self stackViewHorizontalConstraint];
      [v31 setActive:1];

      LODWORD(v28) = [(PHSingleCallParticipantLabelView *)self isDisplayStyleAmbient];
      double v32 = [(PHSingleCallParticipantLabelView *)self appIconLayoutGuide];
      id v33 = v32;
      if (v28)
      {
        double v34 = [v32 leadingAnchor];
        [(PHSingleCallParticipantLabelView *)self leadingAnchor];
      }
      else
      {
        double v34 = [v32 centerXAnchor];
        [(PHSingleCallParticipantLabelView *)self centerXAnchor];
      id v35 = };
      v36 = [v34 constraintEqualToAnchor:v35];
      [(PHSingleCallParticipantLabelView *)self setAppIconLayoutGuideHorizontalAnchor:v36];

      id v37 = [(PHSingleCallParticipantLabelView *)self appIconLayoutGuideHorizontalAnchor];
      [v37 setActive:1];

      CGAffineTransform v17 = [(PHSingleCallParticipantLabelView *)self appIconLayoutGuide];
      v38 = [v17 trailingAnchor];
      v39 = [(PHSingleCallParticipantLabelView *)self stackView];
      id v40 = [v39 trailingAnchor];
      id v41 = [v38 constraintEqualToAnchor:v40];
      [v41 setActive:1];

      goto LABEL_14;
    }
  }
  char v13 = [(UIImageView *)self->_iconView leadingAnchor];
  uint64_t v14 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
  uint64_t v15 = [v14 leadingAnchor];
  uint64_t v16 = [v13 constraintEqualToAnchor:v15];
  [(PHSingleCallParticipantLabelView *)self setAppIconViewLeadingAnchor:v16];

  CGAffineTransform v17 = [(PHSingleCallParticipantLabelView *)self stackViewHorizontalConstraint];
  [v17 setConstant:v11];
LABEL_14:

  id v42 = [(PHSingleCallParticipantLabelView *)self appIconViewLeadingAnchor];
  [v42 setActive:1];
}

- (void)updateStackViewHorizontalConstraintsWithBusinessLogo
{
  uint64_t v3 = [(PHSingleCallParticipantLabelView *)self businessLogoViewLeadingAnchor];
  [v3 setActive:0];

  id v4 = [(PHSingleCallParticipantLabelView *)self businessLogoLayoutGuide];

  if (v4)
  {
    uint64_t v5 = [(PHSingleCallParticipantLabelView *)self businessLogoLayoutGuide];
    [(PHSingleCallParticipantLabelView *)self removeLayoutGuide:v5];
  }
  unsigned int v6 = [(PHSingleCallParticipantLabelView *)self businessLogoLayoutGuideHorizontalAnchor];
  [v6 setActive:0];

  uint64_t v7 = [(UIImageView *)self->_businessLogoView image];
  if (v7)
  {
    [(PHSingleCallParticipantLabelView *)self businessLogoEdge];
    double v9 = v8;
    [(PHSingleCallParticipantLabelView *)self businessLogoMarginH];
    double v11 = v9 + v10;
  }
  else
  {
    double v11 = 0.0;
  }

  id v12 = [(PHSingleCallParticipantLabelView *)self avatarView];
  if (v12)
  {
  }
  else
  {
    id v18 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
    id v19 = [v18 callDisplayStyle];

    if (v19)
    {
      id v20 = objc_alloc_init((Class)UILayoutGuide);
      [(PHSingleCallParticipantLabelView *)self setBusinessLogoLayoutGuide:v20];

      BOOL v21 = [(PHSingleCallParticipantLabelView *)self businessLogoLayoutGuide];
      [(PHSingleCallParticipantLabelView *)self addLayoutGuide:v21];

      v22 = [(UIImageView *)self->_businessLogoView leadingAnchor];
      unsigned int v23 = [(PHSingleCallParticipantLabelView *)self businessLogoLayoutGuide];
      uint64_t v24 = [v23 leadingAnchor];
      v25 = [v22 constraintEqualToAnchor:v24];
      [(PHSingleCallParticipantLabelView *)self setBusinessLogoViewLeadingAnchor:v25];

      v26 = [(PHSingleCallParticipantLabelView *)self stackViewHorizontalConstraint];
      [v26 setActive:0];

      double v27 = [(PHSingleCallParticipantLabelView *)self stackView];
      unint64_t v28 = [v27 leadingAnchor];
      unint64_t v29 = [(UIImageView *)self->_businessLogoView leadingAnchor];
      double v30 = [v28 constraintEqualToAnchor:v29 constant:v11];
      [(PHSingleCallParticipantLabelView *)self setStackViewHorizontalConstraint:v30];

      double v31 = [(PHSingleCallParticipantLabelView *)self stackViewHorizontalConstraint];
      [v31 setActive:1];

      LODWORD(v28) = [(PHSingleCallParticipantLabelView *)self isDisplayStyleAmbient];
      double v32 = [(PHSingleCallParticipantLabelView *)self businessLogoLayoutGuide];
      id v33 = v32;
      if (v28)
      {
        double v34 = [v32 leadingAnchor];
        [(PHSingleCallParticipantLabelView *)self leadingAnchor];
      }
      else
      {
        double v34 = [v32 centerXAnchor];
        [(PHSingleCallParticipantLabelView *)self centerXAnchor];
      id v35 = };
      v36 = [v34 constraintEqualToAnchor:v35];
      [(PHSingleCallParticipantLabelView *)self setBusinessLogoLayoutGuideHorizontalAnchor:v36];

      id v37 = [(PHSingleCallParticipantLabelView *)self businessLogoLayoutGuideHorizontalAnchor];
      [v37 setActive:1];

      CGAffineTransform v17 = [(PHSingleCallParticipantLabelView *)self businessLogoLayoutGuide];
      v38 = [v17 trailingAnchor];
      v39 = [(PHSingleCallParticipantLabelView *)self stackView];
      id v40 = [v39 trailingAnchor];
      id v41 = [v38 constraintEqualToAnchor:v40];
      [v41 setActive:1];

      goto LABEL_14;
    }
  }
  char v13 = [(UIImageView *)self->_businessLogoView leadingAnchor];
  uint64_t v14 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
  uint64_t v15 = [v14 leadingAnchor];
  uint64_t v16 = [v13 constraintEqualToAnchor:v15];
  [(PHSingleCallParticipantLabelView *)self setBusinessLogoViewLeadingAnchor:v16];

  CGAffineTransform v17 = [(PHSingleCallParticipantLabelView *)self stackViewHorizontalConstraint];
  [v17 setConstant:v11];
LABEL_14:

  id v42 = [(PHSingleCallParticipantLabelView *)self businessLogoViewLeadingAnchor];
  [v42 setActive:1];
}

- (void)updateParticipantMarqueeLabelNumberOfLines
{
  if ([(PHSingleCallParticipantLabelView *)self isDisplayStyleBanner])
  {
    uint64_t v3 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    [v3 setNumberOfLines:2];

    id v4 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    [v4 setMarqueeEnabled:0];

    uint64_t v5 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    unsigned int v6 = v5;
    uint64_t v7 = 0;
  }
  else
  {
    unsigned int v8 = [(PHSingleCallParticipantLabelView *)self isDisplayStyleAmbient];
    double v9 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    [v9 setNumberOfLines:1];

    double v10 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    double v11 = v10;
    if (v8)
    {
      [v10 setMarqueeEnabled:0];

      id v12 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
      [v12 setMarqueeRunning:0];

      char v13 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
      [v13 setLineBreakMode:4];

      unsigned int v6 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
      [v6 _setExtremeSizingEnabled:1];
      goto LABEL_7;
    }
    [v10 setMarqueeEnabled:1];

    uint64_t v5 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    unsigned int v6 = v5;
    uint64_t v7 = 1;
  }
  [v5 setMarqueeRunning:v7];
LABEL_7:

  uint64_t v14 = sub_1000D5130();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    if ([v15 marqueeEnabled]) {
      CFStringRef v16 = @"YES";
    }
    else {
      CFStringRef v16 = @"NO";
    }
    CGAffineTransform v17 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    int v18 = 138412546;
    CFStringRef v19 = v16;
    __int16 v20 = 2048;
    id v21 = [v17 numberOfLines];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Marquee enabled = %@, number of lines for particpant name = %ld", (uint8_t *)&v18, 0x16u);
  }
}

- (void)updateParticipantMarqueeLabelHorizontalConstraint
{
  uint64_t v3 = [(PHSingleCallParticipantLabelView *)self participantMarqueeLabelHorizontalConstraint];
  [v3 setActive:0];

  if ((id)[(PHSingleCallParticipantLabelView *)self ambientLayout] == (id)1)
  {
    id v4 = [(PHSingleCallParticipantLabelView *)self trailingSideLayoutGuide];

    if (v4)
    {
      uint64_t v5 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
      unsigned int v6 = [v5 centerXAnchor];
      uint64_t v7 = [(PHSingleCallParticipantLabelView *)self trailingSideLayoutGuide];
      uint64_t v8 = [v7 centerXAnchor];
LABEL_14:
      double v11 = (void *)v8;
      uint64_t v12 = [v6 constraintEqualToAnchor:v8];
LABEL_15:
      uint64_t v15 = (void *)v12;
      [(PHSingleCallParticipantLabelView *)self setParticipantMarqueeLabelHorizontalConstraint:v12];

      goto LABEL_16;
    }
  }
  double v9 = [(PHSingleCallParticipantLabelView *)self avatarView];

  if (v9)
  {
    double v10 = 10.0;
    if (![(PHSingleCallParticipantLabelView *)self isDisplayStyleBanner])
    {
      if ([(PHSingleCallParticipantLabelView *)self isDisplayStyleAmbient]) {
        double v10 = 28.0;
      }
      else {
        double v10 = 12.0;
      }
    }
    uint64_t v5 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    unsigned int v6 = [v5 leadingAnchor];
    uint64_t v7 = [(PHSingleCallParticipantLabelView *)self avatarView];
    double v11 = [v7 trailingAnchor];
    uint64_t v12 = [v6 constraintEqualToAnchor:v11 constant:v10];
    goto LABEL_15;
  }
  char v13 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  unint64_t v14 = (unint64_t)[v13 callDisplayStyle];

  if (v14 > 4) {
    goto LABEL_17;
  }
  if (((1 << v14) & 0x16) == 0)
  {
    uint64_t v5 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    unsigned int v6 = [v5 leadingAnchor];
    uint64_t v7 = [(PHSingleCallParticipantLabelView *)self layoutMarginsGuide];
    uint64_t v8 = [v7 leadingAnchor];
    goto LABEL_14;
  }
  uint64_t v5 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
  unsigned int v6 = [v5 centerXAnchor];
  uint64_t v7 = [(PHSingleCallParticipantLabelView *)self centerXAnchor];
  double v11 = [v6 constraintEqualToAnchor:v7];
  [(PHSingleCallParticipantLabelView *)self setParticipantMarqueeLabelHorizontalConstraint:v11];
LABEL_16:

LABEL_17:
  id v16 = [(PHSingleCallParticipantLabelView *)self participantMarqueeLabelHorizontalConstraint];
  [v16 setActive:1];
}

- (void)updateSecondaryLabelHorizontalConstraint
{
  uint64_t v3 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabelHorizontalConstraint];
  [v3 setActive:0];

  if ((id)[(PHSingleCallParticipantLabelView *)self ambientLayout] == (id)1)
  {
    id v4 = [(PHSingleCallParticipantLabelView *)self trailingSideLayoutGuide];

    if (v4)
    {
      uint64_t v5 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
      unsigned int v6 = [v5 centerXAnchor];
      uint64_t v7 = [(PHSingleCallParticipantLabelView *)self trailingSideLayoutGuide];
      uint64_t v8 = [v7 centerXAnchor];
LABEL_7:
      double v11 = (void *)v8;
      uint64_t v12 = [v6 constraintEqualToAnchor:v8];
      [(PHSingleCallParticipantLabelView *)self setSecondaryInfoLabelHorizontalConstraint:v12];

LABEL_8:
      goto LABEL_9;
    }
  }
  double v9 = [(PHSingleCallParticipantLabelView *)self avatarView];

  if (v9)
  {
    uint64_t v5 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
    unsigned int v6 = [v5 leadingAnchor];
    double v10 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
LABEL_6:
    uint64_t v7 = v10;
    uint64_t v8 = [v10 leadingAnchor];
    goto LABEL_7;
  }
  char v13 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  unint64_t v14 = (unint64_t)[v13 callDisplayStyle];

  if (v14 <= 4)
  {
    if (((1 << v14) & 0x16) != 0)
    {
      uint64_t v5 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
      unsigned int v6 = [v5 centerXAnchor];
      uint64_t v7 = [(PHSingleCallParticipantLabelView *)self centerXAnchor];
      double v11 = [v6 constraintEqualToAnchor:v7];
      [(PHSingleCallParticipantLabelView *)self setSecondaryInfoLabelHorizontalConstraint:v11];
      goto LABEL_8;
    }
    uint64_t v5 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
    unsigned int v6 = [v5 leadingAnchor];
    double v10 = [(PHSingleCallParticipantLabelView *)self layoutMarginsGuide];
    goto LABEL_6;
  }
LABEL_9:
  id v15 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabelHorizontalConstraint];
  [v15 setActive:1];
}

- (void)updateLabelTrailingConstraints
{
  uint64_t v3 = [(PHSingleCallParticipantLabelView *)self participantMarqueeLabelTrailingConstraint];
  [v3 setActive:0];

  id v4 = [(PHSingleCallParticipantLabelView *)self stackViewTrailingConstraint];
  [v4 setActive:0];

  uint64_t v5 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabelTrailingConstraint];
  [v5 setActive:0];

  unsigned int v6 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  if ([v6 callDisplayStyle])
  {
  }
  else
  {
    __int16 v20 = [(PHSingleCallParticipantLabelView *)self bannerButtonsView];

    if (v20)
    {
      id v21 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
      v22 = [v21 trailingAnchor];
      unsigned int v23 = [(PHSingleCallParticipantLabelView *)self bannerButtonsView];
      uint64_t v24 = [v23 leadingAnchor];
      v25 = [v22 constraintEqualToAnchor:v24 constant:-10.0];
      [(PHSingleCallParticipantLabelView *)self setParticipantMarqueeLabelTrailingConstraint:v25];

      v26 = [(PHSingleCallParticipantLabelView *)self stackView];
      double v27 = [v26 trailingAnchor];
      unint64_t v28 = [(PHSingleCallParticipantLabelView *)self bannerButtonsView];
      unint64_t v29 = [v28 leadingAnchor];
      double v30 = [v27 constraintLessThanOrEqualToAnchor:v29 constant:-10.0];
      [(PHSingleCallParticipantLabelView *)self setStackViewTrailingConstraint:v30];

      double v31 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
      double v32 = [v31 trailingAnchor];
      id v33 = [(PHSingleCallParticipantLabelView *)self bannerButtonsView];
      double v34 = [v33 leadingAnchor];
      id v35 = [v32 constraintLessThanOrEqualToAnchor:v34 constant:-10.0];
      [(PHSingleCallParticipantLabelView *)self setSecondaryInfoLabelTrailingConstraint:v35];

      goto LABEL_12;
    }
  }
  [(PHSingleCallParticipantLabelView *)self horizontalPaddingConstantForTrailingConstraints];
  double v8 = -v7;
  double v9 = [(PHSingleCallParticipantLabelView *)self conferenceParticipantsButton];
  if (v9
    || ([(PHSingleCallParticipantLabelView *)self callDetailsViewButton],
        (double v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v10 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    double v11 = [v10 trailingAnchor];
    uint64_t v12 = [v9 leadingAnchor];
    char v13 = [v11 constraintLessThanOrEqualToAnchor:v12 constant:-10.0];
    [(PHSingleCallParticipantLabelView *)self setParticipantMarqueeLabelTrailingConstraint:v13];
  }
  else
  {
    double v9 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    double v10 = [v9 trailingAnchor];
    double v11 = [(PHSingleCallParticipantLabelView *)self trailingAnchor];
    uint64_t v12 = [v10 constraintLessThanOrEqualToAnchor:v11 constant:v8];
    [(PHSingleCallParticipantLabelView *)self setParticipantMarqueeLabelTrailingConstraint:v12];
  }

  unint64_t v14 = [(PHSingleCallParticipantLabelView *)self callDetailsViewButton];

  id v15 = [(PHSingleCallParticipantLabelView *)self stackView];
  id v16 = [v15 trailingAnchor];
  if (v14)
  {
    CGAffineTransform v17 = [(PHSingleCallParticipantLabelView *)self callDetailsViewButton];
    int v18 = [v17 leadingAnchor];
    CFStringRef v19 = [v16 constraintLessThanOrEqualToAnchor:v18 constant:-10.0];
    [(PHSingleCallParticipantLabelView *)self setStackViewTrailingConstraint:v19];
  }
  else
  {
    CGAffineTransform v17 = [(PHSingleCallParticipantLabelView *)self trailingAnchor];
    int v18 = [v16 constraintLessThanOrEqualToAnchor:v17 constant:v8];
    [(PHSingleCallParticipantLabelView *)self setStackViewTrailingConstraint:v18];
  }

  double v31 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
  double v32 = [v31 trailingAnchor];
  id v33 = [(PHSingleCallParticipantLabelView *)self trailingAnchor];
  double v34 = [v32 constraintLessThanOrEqualToAnchor:v33 constant:v8];
  [(PHSingleCallParticipantLabelView *)self setSecondaryInfoLabelTrailingConstraint:v34];
LABEL_12:

  v36 = [(PHSingleCallParticipantLabelView *)self participantMarqueeLabelTrailingConstraint];
  [v36 setActive:1];

  id v37 = [(PHSingleCallParticipantLabelView *)self stackViewTrailingConstraint];
  [v37 setActive:1];

  id v38 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabelTrailingConstraint];
  [v38 setActive:1];
}

- (double)horizontalPaddingConstantForTrailingConstraints
{
  if ([(PHSingleCallParticipantLabelView *)self isDisplayStyleMiniWindow])
  {
    [(PHSingleCallParticipantLabelView *)self horizontalPaddingForMiniWindow];
  }
  else
  {
    id v4 = +[UIDevice currentDevice];
    unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom];

    double result = 20.0;
    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      return 0.0;
    }
  }
  return result;
}

- (void)updateAvatarViewConstraints
{
  uint64_t v3 = [(PHSingleCallParticipantLabelView *)self avatarView];

  if (v3)
  {
    id v4 = [(PHSingleCallParticipantLabelView *)self avatarViewConstraints];
    +[NSLayoutConstraint deactivateConstraints:v4];

    unint64_t v5 = [(PHSingleCallParticipantLabelView *)self updatedAvatarViewConstraints];
    [(PHSingleCallParticipantLabelView *)self setAvatarViewConstraints:v5];

    id v6 = [(PHSingleCallParticipantLabelView *)self avatarViewConstraints];
    +[NSLayoutConstraint activateConstraints:v6];
  }
}

- (id)updatedAvatarViewConstraints
{
  id v4 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  id v5 = [v4 callDisplayStyle];

  switch((unint64_t)v5)
  {
    case 0uLL:
      v88 = [(PHSingleCallParticipantLabelView *)self avatarView];
      v84 = [v88 leadingAnchor];
      v75 = [(PHSingleCallParticipantLabelView *)self layoutMarginsGuide];
      uint64_t v79 = [v75 leadingAnchor];
      CGAffineTransform v17 = [v84 constraintEqualToAnchor:v79];
      v93[0] = v17;
      v73 = [(PHSingleCallParticipantLabelView *)self avatarView];
      v71 = [v73 centerYAnchor];
      int v18 = [(PHSingleCallParticipantLabelView *)self centerYAnchor];
      CFStringRef v19 = [v71 constraintEqualToAnchor:v18];
      v93[1] = v19;
      __int16 v20 = [(PHSingleCallParticipantLabelView *)self avatarView];
      id v21 = [v20 widthAnchor];
      v22 = [v21 constraintEqualToConstant:48.0];
      v93[2] = v22;
      unsigned int v23 = [(PHSingleCallParticipantLabelView *)self avatarView];
      uint64_t v24 = [v23 heightAnchor];
      v25 = [v24 constraintEqualToConstant:48.0];
      v93[3] = v25;
      v2 = +[NSArray arrayWithObjects:v93 count:4];

      goto LABEL_6;
    case 1uLL:
      v88 = [(PHSingleCallParticipantLabelView *)self avatarView];
      v84 = [v88 leadingAnchor];
      v75 = [(PHSingleCallParticipantLabelView *)self layoutMarginsGuide];
      uint64_t v79 = [v75 leadingAnchor];
      [(PHSingleCallParticipantLabelView *)self horizontalPaddingForMiniWindow];
      CGAffineTransform v17 = [v84 constraintEqualToAnchor:v79];
      v92[0] = v17;
      v73 = [(PHSingleCallParticipantLabelView *)self avatarView];
      v71 = [v73 centerYAnchor];
      int v18 = [(PHSingleCallParticipantLabelView *)self centerYAnchor];
      CFStringRef v19 = [v71 constraintEqualToAnchor:v18];
      v92[1] = v19;
      __int16 v20 = [(PHSingleCallParticipantLabelView *)self avatarView];
      id v21 = [v20 widthAnchor];
      v22 = [v21 constraintEqualToConstant:40.0];
      v92[2] = v22;
      v26 = [(PHSingleCallParticipantLabelView *)self avatarView];
      double v27 = [v26 heightAnchor];
      unint64_t v28 = [v27 constraintEqualToConstant:40.0];
      v92[3] = v28;
      v2 = +[NSArray arrayWithObjects:v92 count:4];

LABEL_6:
      unint64_t v29 = (void *)v79;

      id v16 = v75;
      id v15 = v84;

      goto LABEL_7;
    case 2uLL:
    case 4uLL:
      id v82 = objc_alloc((Class)NSMutableArray);
      v87 = [(PHSingleCallParticipantLabelView *)self avatarView];
      v74 = [v87 leadingAnchor];
      v78 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangle];
      id v6 = [v78 leadingAnchor];
      double v7 = [v74 constraintEqualToAnchor:v6];
      v91[0] = v7;
      double v8 = [(PHSingleCallParticipantLabelView *)self avatarView];
      double v9 = [v8 widthAnchor];
      double v10 = [v9 constraintEqualToConstant:60.0];
      v91[1] = v10;
      double v11 = [(PHSingleCallParticipantLabelView *)self avatarView];
      uint64_t v12 = [v11 heightAnchor];
      char v13 = [v12 constraintEqualToConstant:60.0];
      v91[2] = v13;
      unint64_t v14 = +[NSArray arrayWithObjects:v91 count:3];
      id v83 = [v82 initWithArray:v14];

      LODWORD(v12) = [(PHSingleCallParticipantLabelView *)self inBrandedCall];
      v88 = [(PHSingleCallParticipantLabelView *)self avatarView];
      if (v12)
      {
        id v15 = [v88 topAnchor];
        id v16 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangle];
        [v16 topAnchor];
      }
      else
      {
        id v15 = [v88 centerYAnchor];
        id v16 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangle];
        [v16 centerYAnchor];
      unint64_t v29 = };
      CGAffineTransform v17 = [v15 constraintEqualToAnchor:v29];
      v2 = v83;
      [v83 addObject:v17];
      goto LABEL_15;
    case 3uLL:
      if ((id)[(PHSingleCallParticipantLabelView *)self ambientLayout] == (id)1
        && ([(PHSingleCallParticipantLabelView *)self trailingSideLayoutGuide],
            double v31 = objc_claimAutoreleasedReturnValue(),
            v31,
            v31))
      {
        double v32 = [(PHSingleCallParticipantLabelView *)self avatarView];
        id v33 = [v32 heightAnchor];
        v88 = [v33 constraintEqualToConstant:1.79769313e308];

        LODWORD(v34) = 1144733696;
        [v88 setPriority:v34];
        v85 = [(PHSingleCallParticipantLabelView *)self avatarView];
        v76 = [v85 leadingAnchor];
        v80 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangle];
        uint64_t v62 = [v80 leadingAnchor];
        v73 = [v76 constraintEqualToAnchor:v62];
        v90[0] = v73;
        v71 = [(PHSingleCallParticipantLabelView *)self avatarView];
        v69 = [v71 leadingAnchor];
        v68 = [(PHSingleCallParticipantLabelView *)self leadingAnchor];
        id v67 = [v69 constraintEqualToAnchor:v68];
        v90[1] = v67;
        v66 = [(PHSingleCallParticipantLabelView *)self avatarView];
        v64 = [v66 trailingAnchor];
        v65 = [(PHSingleCallParticipantLabelView *)self trailingSideLayoutGuide];
        uint64_t v63 = [v65 leadingAnchor];
        v61 = [v64 constraintLessThanOrEqualToAnchor:v63 constant:-32.0];
        v90[2] = v61;
        char v60 = [(PHSingleCallParticipantLabelView *)self avatarView];
        id v59 = [v60 centerYAnchor];
        id v58 = [(PHSingleCallParticipantLabelView *)self centerYAnchor];
        v57 = [v59 constraintEqualToAnchor:v58];
        v90[3] = v57;
        id v56 = [(PHSingleCallParticipantLabelView *)self avatarView];
        id v54 = [v56 widthAnchor];
        id v55 = [(PHSingleCallParticipantLabelView *)self avatarView];
        double v53 = [v55 heightAnchor];
        id v35 = [v54 constraintEqualToAnchor:v53];
        v90[4] = v35;
        v36 = [(PHSingleCallParticipantLabelView *)self avatarView];
        id v37 = [v36 topAnchor];
        id v38 = [(PHSingleCallParticipantLabelView *)self topAnchor];
        v39 = [v37 constraintGreaterThanOrEqualToAnchor:v38];
        v90[5] = v39;
        id v40 = [(PHSingleCallParticipantLabelView *)self avatarView];
        id v41 = [v40 bottomAnchor];
        id v42 = [(PHSingleCallParticipantLabelView *)self bottomAnchor];
        double v43 = [v41 constraintLessThanOrEqualToAnchor:v42];
        v90[6] = v43;
        v90[7] = v88;
        v2 = +[NSArray arrayWithObjects:v90 count:8];

        CGAffineTransform v17 = (void *)v62;
        unint64_t v29 = v80;

        id v16 = v76;
        id v15 = v85;

LABEL_7:
        double v30 = v71;
      }
      else
      {
        v88 = [(PHSingleCallParticipantLabelView *)self avatarView];
        v86 = [v88 leadingAnchor];
        v77 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangle];
        uint64_t v81 = [v77 leadingAnchor];
        CGAffineTransform v17 = [v86 constraintEqualToAnchor:v81];
        v89[0] = v17;
        v73 = [(PHSingleCallParticipantLabelView *)self avatarView];
        v70 = [v73 centerYAnchor];
        v72 = [(PHSingleCallParticipantLabelView *)self participantAndStatusRectangle];
        double v44 = [v72 centerYAnchor];
        unsigned __int8 v45 = [v70 constraintEqualToAnchor:v44];
        v89[1] = v45;
        double v46 = [(PHSingleCallParticipantLabelView *)self avatarView];
        unsigned int v47 = [v46 widthAnchor];
        v48 = [v47 constraintEqualToConstant:80.0];
        v89[2] = v48;
        unsigned int v49 = [(PHSingleCallParticipantLabelView *)self avatarView];
        v50 = [v49 heightAnchor];
        unsigned int v51 = [v50 constraintEqualToConstant:80.0];
        v89[3] = v51;
        v2 = +[NSArray arrayWithObjects:v89 count:4];

        unint64_t v29 = (void *)v81;
        id v16 = v77;

        id v15 = v86;
        double v30 = v70;
      }

LABEL_15:
LABEL_16:
      return v2;
    default:
      goto LABEL_16;
  }
}

- (double)horizontalPaddingForMiniWindow
{
  unint64_t v2 = +[PHUIConfiguration screenSize];
  double result = 0.0;
  if (v2 - 10 <= 5) {
    return dbl_1002843D0[v2 - 10];
  }
  return result;
}

- (void)updateLabelConstraints
{
  uint64_t v3 = [(PHSingleCallParticipantLabelView *)self labelConstraints];

  if (v3)
  {
    id v4 = [(PHSingleCallParticipantLabelView *)self labelConstraints];
    [(PHSingleCallParticipantLabelView *)self removeConstraints:v4];
  }
  id v28 = objc_alloc_init((Class)NSMutableArray);
  if ((id)[(PHSingleCallParticipantLabelView *)self labelsOrder] == (id)1)
  {
    id v5 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    id v6 = [v5 topAnchor];
    double v7 = [(UIStackView *)self->_stackView bottomAnchor];
    [(PHSingleCallParticipantLabelView *)self labelsVerticalOffset];
    double v8 = [v6 constraintEqualToAnchor:v7];
    [v28 addObject:v8];

    double v9 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    double v10 = [v9 topAnchor];
    double v11 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
    uint64_t v12 = [v11 bottomAnchor];
    [(PHSingleCallParticipantLabelView *)self labelsVerticalOffset];
    char v13 = [v10 constraintEqualToAnchor:v12];
    [v28 addObject:v13];

    unint64_t v14 = [(UILabel *)self->_secondaryInfoLabel topAnchor];
    [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
  }
  else
  {
    id v15 = [(PHAbstractCallParticipantLabelView *)self statusLabel];
    id v16 = [v15 topAnchor];
    CGAffineTransform v17 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    int v18 = [v17 bottomAnchor];
    [(PHSingleCallParticipantLabelView *)self labelsVerticalOffset];
    CFStringRef v19 = [v16 constraintEqualToAnchor:v18];
    [v28 addObject:v19];

    __int16 v20 = [(UIStackView *)self->_stackView topAnchor];
    id v21 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    v22 = [v21 bottomAnchor];
    [(PHSingleCallParticipantLabelView *)self labelsVerticalOffset];
    unsigned int v23 = [v20 constraintEqualToAnchor:v22];
    [v28 addObject:v23];

    unint64_t v14 = [(UILabel *)self->_secondaryInfoLabel topAnchor];
    [(PHAbstractCallParticipantLabelView *)self statusLabel];
  uint64_t v24 = };
  v25 = [v24 bottomAnchor];
  [(PHSingleCallParticipantLabelView *)self labelsVerticalOffset];
  v26 = [v14 constraintEqualToAnchor:v25];
  [v28 addObject:v26];

  [(PHSingleCallParticipantLabelView *)self setLabelConstraints:v28];
  double v27 = [(PHSingleCallParticipantLabelView *)self labelConstraints];
  +[NSLayoutConstraint activateConstraints:v27];
}

- (void)updateHeightConstraints
{
  uint64_t v3 = [(PHSingleCallParticipantLabelView *)self heightConstraints];

  if (v3)
  {
    id v4 = [(PHSingleCallParticipantLabelView *)self heightConstraints];
    [(PHSingleCallParticipantLabelView *)self removeConstraints:v4];
  }
  double v5 = 0.0;
  if ([(PHSingleCallParticipantLabelView *)self isDisplayStyleAmbient])
  {
    if ((id)[(PHSingleCallParticipantLabelView *)self ambientLayout] == (id)1) {
      double v5 = 18.0;
    }
    else {
      double v5 = 0.0;
    }
  }
  if ([(PHSingleCallParticipantLabelView *)self isDisplayStyleBanner])
  {
    id v6 = [(PHSingleCallParticipantLabelView *)self heightAnchor];
    double v7 = [v6 constraintEqualToConstant:100.0];
    id v54 = v7;
    double v8 = +[NSArray arrayWithObjects:&v54 count:1];
    double v9 = +[NSMutableArray arrayWithArray:v8];
  }
  else if ([(PHSingleCallParticipantLabelView *)self isDisplayStyleMiniWindow])
  {
    double v9 = +[NSMutableArray array];
  }
  else
  {
    uint64_t v10 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
    if (!v10) {
      goto LABEL_15;
    }
    double v11 = (void *)v10;
    uint64_t v12 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
    char v13 = [v12 text];
    id v14 = [v13 length];

    if (v14)
    {
      unint64_t v15 = [(PHSingleCallParticipantLabelView *)self labelsOrder];
      id v16 = [(PHSingleCallParticipantLabelView *)self topAnchor];
      if (v15)
      {
        CGAffineTransform v17 = [(PHSingleCallParticipantLabelView *)self stackView];
        int v18 = [v17 topAnchor];
        [v16 constraintEqualToAnchor:v18 constant:-v5];
      }
      else
      {
        CGAffineTransform v17 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
        int v18 = [v17 topAnchor];
        [v16 constraintEqualToAnchor:v18];
      unsigned int v23 = };

      unint64_t v35 = [(PHSingleCallParticipantLabelView *)self ambientLayout];
      v36 = [(PHSingleCallParticipantLabelView *)self bottomAnchor];
      id v37 = [(PHSingleCallParticipantLabelView *)self secondaryInfoLabel];
      id v38 = [v37 bottomAnchor];
      if (v35 == 1) {
        [v36 constraintGreaterThanOrEqualToAnchor:v38];
      }
      else {
      unint64_t v29 = [v36 constraintEqualToAnchor:v38];
      }

      char v52 = v23;
      double v53 = v29;
      double v34 = &v52;
    }
    else
    {
LABEL_15:
      unint64_t v19 = [(PHSingleCallParticipantLabelView *)self labelsOrder];
      __int16 v20 = [(PHSingleCallParticipantLabelView *)self topAnchor];
      if (v19)
      {
        id v21 = [(PHSingleCallParticipantLabelView *)self stackView];
        v22 = [v21 topAnchor];
        unsigned int v23 = [v20 constraintEqualToAnchor:v22 constant:-v5];

        uint64_t v24 = [(PHSingleCallParticipantLabelView *)self bottomAnchor];
        [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
      }
      else
      {
        v25 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
        v26 = [v25 topAnchor];
        unsigned int v23 = [v20 constraintEqualToAnchor:v26];

        uint64_t v24 = [(PHSingleCallParticipantLabelView *)self bottomAnchor];
        [(PHAbstractCallParticipantLabelView *)self statusLabel];
      double v27 = };
      id v28 = [v27 bottomAnchor];
      unint64_t v29 = [v24 constraintEqualToAnchor:v28];

      if ((id)[(PHSingleCallParticipantLabelView *)self ambientLayout] == (id)1)
      {
        double v30 = [(PHSingleCallParticipantLabelView *)self bottomAnchor];
        double v31 = [(PHSingleCallParticipantLabelView *)self stackView];
        double v32 = [v31 bottomAnchor];
        uint64_t v33 = [v30 constraintGreaterThanOrEqualToAnchor:v32];

        unint64_t v29 = (void *)v33;
      }
      v50 = v23;
      unsigned int v51 = v29;
      double v34 = &v50;
    }
    v39 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2, v50, v51, v52, v53);
    double v9 = +[NSMutableArray arrayWithArray:v39];
  }
  if ((id)[(PHSingleCallParticipantLabelView *)self ambientLayout] == (id)1
    && ([(PHSingleCallParticipantLabelView *)self trailingSideLayoutGuide],
        id v40 = objc_claimAutoreleasedReturnValue(),
        v40,
        v40))
  {
    id v41 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    id v42 = [v41 bottomAnchor];
    double v43 = [(PHSingleCallParticipantLabelView *)self trailingSideLayoutGuide];
    double v44 = [v43 bottomAnchor];
    unsigned __int8 v45 = [v42 constraintLessThanOrEqualToAnchor:v44];
    [v9 addObject:v45];

    double v46 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    unsigned int v47 = v46;
    LODWORD(v48) = 1132068864;
  }
  else
  {
    double v46 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    unsigned int v47 = v46;
    LODWORD(v48) = 1144750080;
  }
  [v46 setContentCompressionResistancePriority:1 forAxis:v48];

  [(PHSingleCallParticipantLabelView *)self setHeightConstraints:v9];
  unsigned int v49 = [(PHSingleCallParticipantLabelView *)self heightConstraints];
  +[NSLayoutConstraint activateConstraints:v49];
}

- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  if ((unint64_t)a3 <= 1)
  {
    [(PHSingleCallParticipantLabelView *)self updateLayoutForCallDisplayStyle:a4];
    [(PHSingleCallParticipantLabelView *)self updateGestureRecognizersEnabled];
  }
}

- (BOOL)isDisplayStyleBanner
{
  unint64_t v2 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  BOOL v3 = [v2 callDisplayStyle] == 0;

  return v3;
}

- (BOOL)isDisplayStyleMiniWindow
{
  unint64_t v2 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  BOOL v3 = [v2 callDisplayStyle] == (id)1;

  return v3;
}

- (BOOL)isDisplayStyleAmbient
{
  unint64_t v2 = [(PHSingleCallParticipantLabelView *)self callDisplayStyleManager];
  BOOL v3 = [v2 callDisplayStyle] == (id)3;

  return v3;
}

- (void)bannerButtonsView:(id)a3 didPerformActionType:(int64_t)a4
{
  id v6 = [(PHAbstractCallParticipantLabelView *)self delegate];
  [v6 participantLabelView:self didPerformActionType:a4];
}

- (BOOL)shouldUseHeroImageLayout
{
  unint64_t v2 = +[CNKFeatures sharedInstance];
  unsigned __int8 v3 = [v2 isHeroImageEnabled];

  return v3;
}

- (unint64_t)bannerButtonsState
{
  return self->_bannerButtonsState;
}

- (UILayoutGuide)leadingSideLayoutGuide
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_leadingSideLayoutGuide);

  return (UILayoutGuide *)WeakRetained;
}

- (void)setLeadingSideLayoutGuide:(id)a3
{
}

- (UILayoutGuide)trailingSideLayoutGuide
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trailingSideLayoutGuide);

  return (UILayoutGuide *)WeakRetained;
}

- (PHPosterNameViewModel)posterNameViewModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_posterNameViewModel);

  return (PHPosterNameViewModel *)WeakRetained;
}

- (UIView)posterBadgeView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_posterBadgeView);

  return (UIView *)WeakRetained;
}

- (TPBadgeView)badgeView
{
  return (TPBadgeView *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBadgeView:(id)a3
{
}

- (UIImageView)iconView
{
  return (UIImageView *)objc_getProperty(self, a2, 112, 1);
}

- (UIView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (void)setSharedProfileStateOracle:(id)a3
{
}

- (NSLayoutConstraint)participantMarqueeLabelHorizontalConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 136, 1);
}

- (void)setParticipantMarqueeLabelHorizontalConstraint:(id)a3
{
}

- (NSLayoutConstraint)participantMarqueeLabelTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 144, 1);
}

- (void)setParticipantMarqueeLabelTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewHorizontalConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 152, 1);
}

- (void)setStackViewHorizontalConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 160, 1);
}

- (void)setStackViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)statusLabelTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 168, 1);
}

- (void)setStatusLabelTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)appIconViewLeadingAnchor
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAppIconViewLeadingAnchor:(id)a3
{
}

- (NSLayoutConstraint)appIconLayoutGuideHorizontalAnchor
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAppIconLayoutGuideHorizontalAnchor:(id)a3
{
}

- (NSLayoutConstraint)businessLogoViewLeadingAnchor
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 192, 1);
}

- (void)setBusinessLogoViewLeadingAnchor:(id)a3
{
}

- (NSLayoutConstraint)businessLogoLayoutGuideHorizontalAnchor
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 200, 1);
}

- (void)setBusinessLogoLayoutGuideHorizontalAnchor:(id)a3
{
}

- (NSArray)heightConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setHeightConstraints:(id)a3
{
}

- (NSArray)labelConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLabelConstraints:(id)a3
{
}

- (UILayoutGuide)appIconLayoutGuide
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 224, 1);
}

- (void)setAppIconLayoutGuide:(id)a3
{
}

- (UILayoutGuide)businessLogoLayoutGuide
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 232, 1);
}

- (void)setBusinessLogoLayoutGuide:(id)a3
{
}

- (NSArray)avatarViewConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAvatarViewConstraints:(id)a3
{
}

- (NSLayoutConstraint)secondaryInfoLabelHorizontalConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSecondaryInfoLabelHorizontalConstraint:(id)a3
{
}

- (NSLayoutConstraint)secondaryInfoLabelTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 256, 1);
}

- (void)setSecondaryInfoLabelTrailingConstraint:(id)a3
{
}

- (UILayoutGuide)participantAndStatusRectangle
{
  return (UILayoutGuide *)objc_getProperty(self, a2, 264, 1);
}

- (void)setParticipantAndStatusRectangle:(id)a3
{
}

- (NSLayoutConstraint)participantAndStatusRectangleMinLeadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 272, 1);
}

- (void)setParticipantAndStatusRectangleMinLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)participantAndStatusRectangleMaxLeadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 280, 1);
}

- (void)setParticipantAndStatusRectangleMaxLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)participantAndStatusRectangleCenterXConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 288, 1);
}

- (void)setParticipantAndStatusRectangleCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)participantAndStatusRectangleCenterYConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 296, 1);
}

- (void)setParticipantAndStatusRectangleCenterYConstraint:(id)a3
{
}

- (NSLayoutConstraint)participantAndStatusRectangleTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 304, 1);
}

- (void)setParticipantAndStatusRectangleTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)participantAndStatusRectangleTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 312, 1);
}

- (void)setParticipantAndStatusRectangleTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)participantAndStatusRectangleBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 320, 1);
}

- (void)setParticipantAndStatusRectangleBottomConstraint:(id)a3
{
}

- (unint64_t)labelsOrder
{
  return self->_labelsOrder;
}

- (void)setLabelsOrder:(unint64_t)a3
{
  self->_labelsOrder = a3;
}

- (UILabel)firstNameLabel
{
  return (UILabel *)objc_getProperty(self, a2, 336, 1);
}

- (void)setFirstNameLabel:(id)a3
{
}

- (UILabel)lastNameLabel
{
  return (UILabel *)objc_getProperty(self, a2, 344, 1);
}

- (void)setLastNameLabel:(id)a3
{
}

- (UILabel)secondaryInfoLabel
{
  return (UILabel *)objc_getProperty(self, a2, 352, 1);
}

- (void)setSecondaryInfoLabel:(id)a3
{
}

- (NSArray)statusLabelsArray
{
  return (NSArray *)objc_getProperty(self, a2, 360, 1);
}

- (void)setStatusLabelsArray:(id)a3
{
}

- (NSTimer)statusLabelTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 368, 1);
}

- (void)setStatusLabelTimer:(id)a3
{
}

- (unint64_t)currentStatusLabelIndex
{
  return self->_currentStatusLabelIndex;
}

- (void)setCurrentStatusLabelIndex:(unint64_t)a3
{
  self->_currentStatusLabelIndex = a3;
}

- (UIButton)conferenceParticipantsButton
{
  return (UIButton *)objc_getProperty(self, a2, 384, 1);
}

- (void)setConferenceParticipantsButton:(id)a3
{
}

- (UIButton)callDetailsViewButton
{
  return (UIButton *)objc_getProperty(self, a2, 392, 1);
}

- (void)setCallDetailsViewButton:(id)a3
{
}

- (NSLayoutConstraint)appIconHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 400, 1);
}

- (void)setAppIconHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)appIconWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 408, 1);
}

- (void)setAppIconWidthConstraint:(id)a3
{
}

- (UIImageView)businessLogoView
{
  return (UIImageView *)objc_getProperty(self, a2, 416, 1);
}

- (void)setBusinessLogoView:(id)a3
{
}

- (NSLayoutConstraint)businessLogoHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 424, 1);
}

- (void)setBusinessLogoHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)businessLogoWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 432, 1);
}

- (void)setBusinessLogoWidthConstraint:(id)a3
{
}

- (UIStackView)stackView
{
  return (UIStackView *)objc_getProperty(self, a2, 440, 1);
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return (ICSCallDisplayStyleManager *)objc_getProperty(self, a2, 448, 1);
}

- (PHBannerButtonsView)bannerButtonsView
{
  return self->_bannerButtonsView;
}

- (void)setBannerButtonsView:(id)a3
{
}

- (int64_t)labelLayoutState
{
  return self->_labelLayoutState;
}

- (UITapGestureRecognizer)statusLabelTapRecognizer
{
  return self->_statusLabelTapRecognizer;
}

- (UITapGestureRecognizer)callDetailsGestureRecognizer
{
  return self->_callDetailsGestureRecognizer;
}

- (double)cachedBannerParticipantLabelWidth
{
  return self->_cachedBannerParticipantLabelWidth;
}

- (void)setCachedBannerParticipantLabelWidth:(double)a3
{
  self->_cachedBannerParticipantLabelWidth = a3;
}

- (NSNumber)previousIsCallRinging
{
  return self->_previousIsCallRinging;
}

- (void)setPreviousIsCallRinging:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousIsCallRinging, 0);
  objc_storeStrong((id *)&self->_callDetailsGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_statusLabelTapRecognizer, 0);
  objc_storeStrong((id *)&self->_bannerButtonsView, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_businessLogoWidthConstraint, 0);
  objc_storeStrong((id *)&self->_businessLogoHeightConstraint, 0);
  objc_storeStrong((id *)&self->_businessLogoView, 0);
  objc_storeStrong((id *)&self->_appIconWidthConstraint, 0);
  objc_storeStrong((id *)&self->_appIconHeightConstraint, 0);
  objc_storeStrong((id *)&self->_callDetailsViewButton, 0);
  objc_storeStrong((id *)&self->_conferenceParticipantsButton, 0);
  objc_storeStrong((id *)&self->_statusLabelTimer, 0);
  objc_storeStrong((id *)&self->_statusLabelsArray, 0);
  objc_storeStrong((id *)&self->_secondaryInfoLabel, 0);
  objc_storeStrong((id *)&self->_lastNameLabel, 0);
  objc_storeStrong((id *)&self->_firstNameLabel, 0);
  objc_storeStrong((id *)&self->_participantAndStatusRectangleBottomConstraint, 0);
  objc_storeStrong((id *)&self->_participantAndStatusRectangleTopConstraint, 0);
  objc_storeStrong((id *)&self->_participantAndStatusRectangleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_participantAndStatusRectangleCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_participantAndStatusRectangleCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_participantAndStatusRectangleMaxLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_participantAndStatusRectangleMinLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_participantAndStatusRectangle, 0);
  objc_storeStrong((id *)&self->_secondaryInfoLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryInfoLabelHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_avatarViewConstraints, 0);
  objc_storeStrong((id *)&self->_businessLogoLayoutGuide, 0);
  objc_storeStrong((id *)&self->_appIconLayoutGuide, 0);
  objc_storeStrong((id *)&self->_labelConstraints, 0);
  objc_storeStrong((id *)&self->_heightConstraints, 0);
  objc_storeStrong((id *)&self->_businessLogoLayoutGuideHorizontalAnchor, 0);
  objc_storeStrong((id *)&self->_businessLogoViewLeadingAnchor, 0);
  objc_storeStrong((id *)&self->_appIconLayoutGuideHorizontalAnchor, 0);
  objc_storeStrong((id *)&self->_appIconViewLeadingAnchor, 0);
  objc_storeStrong((id *)&self->_statusLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_participantMarqueeLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_participantMarqueeLabelHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_destroyWeak((id *)&self->_posterBadgeView);
  objc_destroyWeak((id *)&self->_posterNameViewModel);
  objc_destroyWeak((id *)&self->_trailingSideLayoutGuide);

  objc_destroyWeak((id *)&self->_leadingSideLayoutGuide);
}

- (id)currentIMNicknameMatchingContact:(id)a3
{
  id v4 = a3;
  double v5 = self;
  id v6 = (void *)sub_1001CFF7C();

  return v6;
}

@end