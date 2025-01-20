@interface BRFileProviderUIExtension
- (BOOL)didInitializeText;
- (BOOL)tooSmallToFitAnything;
- (BOOL)tooSmallToFitIcon;
- (BRFileProviderUIExtension)initWithNibName:(id)a3 bundle:(id)a4;
- (BRIconView)iconView;
- (NSLayoutConstraint)buttonSpacingConstraint;
- (NSLayoutConstraint)iconToTitleSpacingConstraint;
- (NSLayoutConstraint)iconTopConstraint;
- (NSLayoutConstraint)messageHeightFallbackConstraint;
- (NSLayoutConstraint)titleHeightFallbackConstraint;
- (NSLayoutConstraint)titleTopFallbackConstraint;
- (NSString)buttonText;
- (NSString)message;
- (UIButton)button;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (UIView)contentView;
- (id)_imageForContentConfiguration;
- (id)shortButtonTitle;
- (id)title;
- (int64_t)mode;
- (void)_setButtonTitle:(id)a3 alternativeShortTitle:(id)a4;
- (void)_updateColors_custom;
- (void)_updateColors_system;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)_updateIcon_custom;
- (void)_updateIcon_system;
- (void)_updateText_custom;
- (void)_updateText_system;
- (void)_updateTraitCollectionDependents_custom;
- (void)_updateTraitCollectionDependents_system;
- (void)_viewDidLayoutSubviews_custom;
- (void)_viewDidLoad_custom;
- (void)_viewDidLoad_system;
- (void)_viewSafeAreaInsetsDidChange_custom;
- (void)buttonTapped;
- (void)performLayoutSpecificMethod:(id)a3;
- (void)refreshMode;
- (void)setDidInitializeText:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateButtonSpacing;
- (void)updateColors;
- (void)updateContentLayoutAllowingAnimation:(BOOL)a3;
- (void)updateIcon;
- (void)updateText;
- (void)updateTitleFont;
- (void)updateTraitCollectionDependents;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BRFileProviderUIExtension

- (BRFileProviderUIExtension)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)BRFileProviderUIExtension;
  v4 = [(BRFileProviderUIExtension *)&v12 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v4 selector:"refreshMode" name:NSUbiquityIdentityDidChangeNotification object:0];

    v7 = self;
    v13[0] = v7;
    v8 = self;
    v13[1] = v8;
    v9 = +[NSArray arrayWithObjects:v13 count:2];
    id v10 = [(BRFileProviderUIExtension *)v4 registerForTraitChanges:v9 withAction:"_setNeedsUpdateContentUnavailableConfiguration"];

    if (qword_10000CB60 != -1) {
      dispatch_once(&qword_10000CB60, &stru_1000083D8);
    }
    v4->_layoutType = byte_10000CB68;
  }
  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)BRFileProviderUIExtension;
  [(BRFileProviderUIExtension *)&v3 viewDidLoad];
  -[BRFileProviderUIExtension performLayoutSpecificMethod:](self, "performLayoutSpecificMethod:", "_viewDidLoad_custom", "_viewDidLoad_system");
}

- (void)_viewDidLoad_custom
{
  objc_super v3 = [(BRFileProviderUIExtension *)self view];
  v4 = +[UIColor systemBackgroundColor];
  v5 = v3;
  [v3 setBackgroundColor:v4];

  v6 = (UIView *)objc_alloc_init((Class)UIView);
  [(UIView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v7) = 1144750080;
  [(UIView *)v6 setContentHuggingPriority:1 forAxis:v7];
  contentView = self->_contentView;
  self->_contentView = v6;
  v9 = v6;

  id v10 = objc_alloc_init(BRIconView);
  iconView = self->_iconView;
  self->_iconView = v10;

  [(BRIconView *)self->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v12 = [(BRIconView *)self->_iconView layer];
  [v12 setBorderWidth:0.5];

  [(BRIconView *)self->_iconView setClipsToBounds:1];
  LODWORD(v13) = 1148846080;
  [(BRIconView *)self->_iconView setContentCompressionResistancePriority:1 forAxis:v13];
  LODWORD(v14) = 1148846080;
  [(BRIconView *)self->_iconView setContentHuggingPriority:1 forAxis:v14];
  v15 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v15;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  v17 = [(BRFileProviderUIExtension *)self title];
  [(UILabel *)self->_titleLabel setText:v17];

  LODWORD(v18) = 1148846080;
  [(UILabel *)self->_titleLabel setContentHuggingPriority:1 forAxis:v18];
  LODWORD(v19) = 1144913920;
  [(UILabel *)self->_titleLabel setContentCompressionResistancePriority:1 forAxis:v19];
  [(BRFileProviderUIExtension *)self updateTitleFont];
  v20 = (UILabel *)objc_alloc_init((Class)UILabel);
  messageLabel = self->_messageLabel;
  self->_messageLabel = v20;

  [(UILabel *)self->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_messageLabel setAdjustsFontForContentSizeCategory:1];
  v22 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_messageLabel setFont:v22];

  [(UILabel *)self->_messageLabel setTextAlignment:1];
  [(UILabel *)self->_messageLabel setNumberOfLines:0];
  LODWORD(v23) = 1148846080;
  [(UILabel *)self->_messageLabel setContentHuggingPriority:1 forAxis:v23];
  LODWORD(v24) = 1144750080;
  [(UILabel *)self->_messageLabel setContentCompressionResistancePriority:1 forAxis:v24];
  v25 = +[UIButton buttonWithType:1];
  button = self->_button;
  self->_button = v25;

  [(UIButton *)self->_button setTranslatesAutoresizingMaskIntoConstraints:0];
  -[UIButton setContentEdgeInsets:](self->_button, "setContentEdgeInsets:", 14.0, 16.0, 14.0, 16.0);
  [(UIButton *)self->_button _setContinuousCornerRadius:8.0];
  v27 = +[UIColor linkColor];
  [(UIButton *)self->_button setBackgroundColor:v27];

  v28 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  v29 = [(UIButton *)self->_button titleLabel];
  [v29 setFont:v28];

  v30 = [(UIButton *)self->_button titleLabel];
  [v30 setAdjustsFontForContentSizeCategory:1];

  LODWORD(v31) = 1148846080;
  [(UIButton *)self->_button setContentHuggingPriority:1 forAxis:v31];
  LODWORD(v32) = 1148846080;
  [(UIButton *)self->_button setContentCompressionResistancePriority:1 forAxis:v32];
  LODWORD(v33) = 1143930880;
  [(UIButton *)self->_button setContentHuggingPriority:0 forAxis:v33];
  [(UIButton *)self->_button addTarget:self action:"buttonTapped" forControlEvents:64];
  v34 = self->_button;
  v35 = +[UIColor whiteColor];
  [(UIButton *)v34 setTitleColor:v35 forState:0];

  v131 = v5;
  [v5 addSubview:v9];
  v36 = [(BRFileProviderUIExtension *)self iconView];
  [(UIView *)v9 addSubview:v36];

  v37 = [(BRFileProviderUIExtension *)self titleLabel];
  [(UIView *)v9 addSubview:v37];

  v38 = [(BRFileProviderUIExtension *)self messageLabel];
  [(UIView *)v9 addSubview:v38];

  v39 = [(BRFileProviderUIExtension *)self button];
  [(UIView *)v9 addSubview:v39];

  v40 = [(UIView *)v9 centerYAnchor];
  v41 = [v5 centerYAnchor];
  v132 = [v40 constraintEqualToAnchor:v41];

  LODWORD(v42) = 1144586240;
  [v132 setPriority:v42];
  v43 = [(UIView *)v9 topAnchor];
  v44 = [(BRIconView *)self->_iconView topAnchor];
  v45 = [v43 constraintEqualToAnchor:v44 constant:-16.0];
  iconTopConstraint = self->_iconTopConstraint;
  self->_iconTopConstraint = v45;

  LODWORD(v47) = 1144586240;
  [(NSLayoutConstraint *)self->_iconTopConstraint setPriority:v47];
  v48 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  v49 = [(BRIconView *)self->_iconView bottomAnchor];
  v50 = [v48 constraintEqualToSystemSpacingBelowAnchor:v49 multiplier:1.44262295];
  iconToTitleSpacingConstraint = self->_iconToTitleSpacingConstraint;
  self->_iconToTitleSpacingConstraint = v50;

  v52 = [(UIView *)v9 topAnchor];
  v53 = [(UILabel *)self->_titleLabel topAnchor];
  v54 = [v52 constraintEqualToAnchor:v53 constant:-16.0];
  titleTopFallbackConstraint = self->_titleTopFallbackConstraint;
  self->_titleTopFallbackConstraint = v54;

  v56 = [(UILabel *)self->_titleLabel heightAnchor];
  v57 = [v56 constraintEqualToConstant:0.0];
  titleHeightFallbackConstraint = self->_titleHeightFallbackConstraint;
  self->_titleHeightFallbackConstraint = v57;

  v59 = [(UILabel *)self->_messageLabel heightAnchor];
  v60 = [v59 constraintEqualToConstant:0.0];
  messageHeightFallbackConstraint = self->_messageHeightFallbackConstraint;
  self->_messageHeightFallbackConstraint = v60;

  v62 = [(UIButton *)self->_button widthAnchor];
  v133 = [v62 constraintGreaterThanOrEqualToConstant:327.0];

  LODWORD(v63) = 1144586240;
  [v133 setPriority:v63];
  v64 = [(UILabel *)self->_messageLabel lastBaselineAnchor];
  v65 = [(UIButton *)self->_button topAnchor];
  v66 = [v64 constraintEqualToAnchor:v65];
  buttonSpacingConstraint = self->_buttonSpacingConstraint;
  self->_buttonSpacingConstraint = v66;

  [v132 priority];
  *(float *)&double v69 = v68 + -1.0;
  [(NSLayoutConstraint *)self->_buttonSpacingConstraint setPriority:v69];
  v130 = [(UIView *)v9 widthAnchor];
  v129 = [v130 constraintLessThanOrEqualToConstant:450.0];
  v134[0] = v129;
  v128 = [(UIView *)v9 centerXAnchor];
  v127 = [v5 centerXAnchor];
  v126 = [v128 constraintEqualToAnchor:v127];
  v134[1] = v126;
  v124 = [(UIView *)v9 topAnchor];
  v125 = [v5 layoutMarginsGuide];
  v123 = [v125 topAnchor];
  v122 = [v124 constraintGreaterThanOrEqualToAnchor:v123];
  v134[2] = v122;
  v120 = [(UIView *)v9 leadingAnchor];
  v121 = [v5 layoutMarginsGuide];
  v119 = [v121 leadingAnchor];
  v118 = [v120 constraintGreaterThanOrEqualToAnchor:v119];
  v134[3] = v118;
  v116 = [(UIView *)v9 bottomAnchor];
  v117 = [v5 safeAreaLayoutGuide];
  v115 = [v117 bottomAnchor];
  v114 = [v116 constraintLessThanOrEqualToAnchor:v115];
  v134[4] = v114;
  v112 = [(UIView *)v9 trailingAnchor];
  v113 = [v5 layoutMarginsGuide];
  v111 = [v113 trailingAnchor];
  v110 = [v112 constraintLessThanOrEqualToAnchor:v111];
  v134[5] = v110;
  v134[6] = v132;
  v109 = [(BRIconView *)self->_iconView centerXAnchor];
  v108 = [(UIView *)v9 centerXAnchor];
  v107 = [v109 constraintEqualToAnchor:v108];
  v134[7] = v107;
  v106 = [(UILabel *)self->_titleLabel leadingAnchor];
  v105 = [(UIView *)v9 leadingAnchor];
  v104 = [v106 constraintEqualToAnchor:v105];
  v134[8] = v104;
  v103 = [(UILabel *)self->_titleLabel trailingAnchor];
  v102 = [(UIView *)v9 trailingAnchor];
  v101 = [v103 constraintEqualToAnchor:v102];
  v70 = self->_iconToTitleSpacingConstraint;
  v134[9] = v101;
  v134[10] = v70;
  v100 = [(UILabel *)self->_messageLabel leadingAnchor];
  v99 = [(UIView *)v9 leadingAnchor];
  v98 = [v100 constraintEqualToAnchor:v99];
  v134[11] = v98;
  v97 = [(UILabel *)self->_messageLabel trailingAnchor];
  v96 = [(UIView *)v9 trailingAnchor];
  v95 = [v97 constraintEqualToAnchor:v96];
  v134[12] = v95;
  v94 = [(UILabel *)self->_messageLabel firstBaselineAnchor];
  v93 = [(UILabel *)self->_titleLabel lastBaselineAnchor];
  v92 = [v94 constraintEqualToSystemSpacingBelowAnchor:v93 multiplier:1.33333333];
  v134[13] = v92;
  v91 = [(UIButton *)self->_button centerXAnchor];
  v90 = [(UIView *)v9 centerXAnchor];
  v89 = [v91 constraintEqualToAnchor:v90];
  v134[14] = v89;
  v87 = [(UIButton *)self->_button leadingAnchor];
  v88 = [v5 layoutMarginsGuide];
  v86 = [v88 leadingAnchor];
  v85 = [v87 constraintGreaterThanOrEqualToAnchor:v86];
  v134[15] = v85;
  v83 = [(UIButton *)self->_button trailingAnchor];
  v84 = [v5 layoutMarginsGuide];
  v82 = [v84 trailingAnchor];
  v81 = [v83 constraintLessThanOrEqualToAnchor:v82];
  v134[16] = v81;
  v71 = [(UIButton *)self->_button heightAnchor];
  v72 = [v71 constraintGreaterThanOrEqualToConstant:50.0];
  v134[17] = v72;
  v73 = [(UIButton *)self->_button bottomAnchor];
  v74 = [(UIView *)v9 bottomAnchor];
  v75 = [v73 constraintEqualToAnchor:v74 constant:-16.0];
  v134[18] = v75;
  v134[19] = v133;
  v76 = [(UIButton *)self->_button topAnchor];
  v77 = [(UILabel *)self->_messageLabel bottomAnchor];
  v78 = [v76 constraintGreaterThanOrEqualToAnchor:v77 constant:16.0];
  v79 = self->_buttonSpacingConstraint;
  v134[20] = v78;
  v134[21] = v79;
  v134[22] = self->_iconTopConstraint;
  v80 = +[NSArray arrayWithObjects:v134 count:23];
  +[NSLayoutConstraint activateConstraints:v80];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BRFileProviderUIExtension;
  [(BRFileProviderUIExtension *)&v4 viewWillAppear:a3];
  [(BRFileProviderUIExtension *)self refreshMode];
  if ([(BRFileProviderUIExtension *)self didInitializeText]) {
    [(BRFileProviderUIExtension *)self updateText];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BRFileProviderUIExtension;
  [(BRFileProviderUIExtension *)&v3 viewDidLayoutSubviews];
  -[BRFileProviderUIExtension performLayoutSpecificMethod:](self, "performLayoutSpecificMethod:", "_viewDidLayoutSubviews_custom", "_viewDidLayoutSubviews_system");
}

- (void)_viewDidLayoutSubviews_custom
{
  [(BRFileProviderUIExtension *)self updateText];

  [(BRFileProviderUIExtension *)self updateColors];
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)BRFileProviderUIExtension;
  [(BRFileProviderUIExtension *)&v3 viewSafeAreaInsetsDidChange];
  -[BRFileProviderUIExtension performLayoutSpecificMethod:](self, "performLayoutSpecificMethod:", "_viewSafeAreaInsetsDidChange_custom", "_viewSafeAreaInsetsDidChange_system");
}

- (void)_viewSafeAreaInsetsDidChange_custom
{
  [(BRFileProviderUIExtension *)self updateText];

  [(BRFileProviderUIExtension *)self updateContentLayoutAllowingAnimation:0];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BRFileProviderUIExtension;
  [(BRFileProviderUIExtension *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3) {
    [(BRFileProviderUIExtension *)self updateTraitCollectionDependents];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRFileProviderUIExtension;
  [(BRFileProviderUIExtension *)&v15 traitCollectionDidChange:v4];
  v5 = [v4 preferredContentSizeCategory];
  objc_super v6 = [(BRFileProviderUIExtension *)self traitCollection];
  double v7 = [v6 preferredContentSizeCategory];
  if (v5 == v7)
  {
    id v8 = [v4 horizontalSizeClass];
    v9 = [(BRFileProviderUIExtension *)self traitCollection];
    if (v8 == [v9 horizontalSizeClass])
    {
      id v10 = [v4 verticalSizeClass];
      v11 = [(BRFileProviderUIExtension *)self traitCollection];
      if (v10 == [v11 verticalSizeClass])
      {
        id v12 = [v4 userInterfaceStyle];
        double v13 = [(BRFileProviderUIExtension *)self traitCollection];
        id v14 = [v13 userInterfaceStyle];

        if (v12 == v14) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
    double v7 = v5;
  }

LABEL_9:
  [(BRFileProviderUIExtension *)self updateTraitCollectionDependents];
LABEL_10:
}

- (void)updateTraitCollectionDependents
{
  -[BRFileProviderUIExtension performLayoutSpecificMethod:](self, "performLayoutSpecificMethod:", "_updateTraitCollectionDependents_custom", "_updateTraitCollectionDependents_system");

  [(BRFileProviderUIExtension *)self _setNeedsUpdateContentUnavailableConfiguration];
}

- (void)_updateTraitCollectionDependents_custom
{
  [(BRFileProviderUIExtension *)self updateIcon];
  [(BRFileProviderUIExtension *)self updateButtonSpacing];
  [(BRFileProviderUIExtension *)self updateTitleFont];
  objc_super v3 = [(BRFileProviderUIExtension *)self messageLabel];
  [v3 forceDisplayIfNeeded];

  id v4 = [(BRFileProviderUIExtension *)self titleLabel];
  [v4 forceDisplayIfNeeded];
}

- (void)buttonTapped
{
  +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Ubiquity"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    [(BRFileProviderUIExtension *)self updateText];
  }
}

- (id)title
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"iCloud Drive" value:&stru_100008458 table:0];

  return v3;
}

- (NSString)message
{
  int64_t v3 = [(BRFileProviderUIExtension *)self mode];
  if (v3 == 2)
  {
    id v4 = +[NSBundle mainBundle];
    v5 = v4;
    CFStringRef v6 = @"iCloud Drive is loading...";
  }
  else if (v3 == 1)
  {
    id v4 = +[NSBundle mainBundle];
    v5 = v4;
    CFStringRef v6 = @"Turn on iCloud Drive to keep your documents safely stored in iCloud.";
  }
  else
  {
    if (v3) {
      goto LABEL_8;
    }
    id v4 = +[NSBundle mainBundle];
    v5 = v4;
    CFStringRef v6 = @"Sign in to iCloud to keep your documents safely stored in iCloud Drive.";
  }
  v2 = [v4 localizedStringForKey:v6 value:&stru_100008458 table:0];

LABEL_8:

  return (NSString *)v2;
}

- (NSString)buttonText
{
  int64_t v2 = [(BRFileProviderUIExtension *)self mode];
  if (v2 == 1)
  {
    int64_t v3 = +[NSBundle mainBundle];
    id v4 = v3;
    CFStringRef v5 = @"Turn on iCloud Drive";
    goto LABEL_5;
  }
  if (!v2)
  {
    int64_t v3 = +[NSBundle mainBundle];
    id v4 = v3;
    CFStringRef v5 = @"Sign in to iCloud";
LABEL_5:
    CFStringRef v6 = [v3 localizedStringForKey:v5 value:&stru_100008458 table:0];

    goto LABEL_7;
  }
  CFStringRef v6 = 0;
LABEL_7:

  return (NSString *)v6;
}

- (id)shortButtonTitle
{
  int64_t v2 = [(BRFileProviderUIExtension *)self mode];
  if (v2 == 1)
  {
    int64_t v3 = +[NSBundle mainBundle];
    id v4 = v3;
    CFStringRef v5 = @"Turn on iCloud Drive (Short)";
    goto LABEL_5;
  }
  if (!v2)
  {
    int64_t v3 = +[NSBundle mainBundle];
    id v4 = v3;
    CFStringRef v5 = @"Sign in to iCloud (Short)";
LABEL_5:
    CFStringRef v6 = [v3 localizedStringForKey:v5 value:&stru_100008458 table:0];

    goto LABEL_7;
  }
  CFStringRef v6 = 0;
LABEL_7:

  return v6;
}

- (void)refreshMode
{
  if ([(NSString *)self->_personaID isEqualToString:@"__defaultPersonaID__"]
    || (int64_t v3 = self->_personaID) == 0)
  {
    if (qword_10000CB40 != -1) {
      dispatch_once(&qword_10000CB40, &stru_1000082F8);
    }
    id v4 = (NSString *)(id)qword_10000CB48;
    int v5 = 1;
  }
  else
  {
    id v4 = v3;
    int v5 = 0;
  }
  CFStringRef v6 = +[UMUserManager sharedManager];
  double v7 = [v6 currentPersona];

  id v47 = 0;
  id v8 = [v7 userPersonaUniqueString];
  v9 = v8;
  if (v8 == v4 || [(NSString *)v8 isEqualToString:v4]) {
    goto LABEL_9;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v46 = 0;
    id v31 = [v7 copyCurrentPersonaContextWithError:&v46];
    id v32 = v46;
    id v47 = v31;
    if (v32)
    {
      double v33 = brc_bread_crumbs();
      v34 = brc_default_log();
      if (os_log_type_enabled(v34, (os_log_type_t)0x90u)) {
        sub_1000049C8((uint64_t)v32, (uint64_t)v33, v34);
      }
    }
    id v10 = [v7 generateAndRestorePersonaContextWithPersonaUniqueString:v4];

    if (v10)
    {
      v35 = brc_bread_crumbs();
      v36 = brc_default_log();
      if (os_log_type_enabled(v36, (os_log_type_t)0x90u))
      {
        personaID = self->_personaID;
        *(_DWORD *)buf = 138412802;
        v49 = personaID;
        __int16 v50 = 2112;
        v51 = v10;
        __int16 v52 = 2112;
        v53 = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v36, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
    }
  }
  else
  {
    if (v5 && ([v7 isDataSeparatedPersona] & 1) == 0)
    {
      v40 = brc_bread_crumbs();
      v41 = brc_default_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        sub_100004AC8((uint64_t)v40, v41);
      }

LABEL_9:
      id v10 = 0;
      goto LABEL_10;
    }
    v37 = brc_bread_crumbs();
    v38 = brc_default_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      sub_100004A50((uint64_t)v37, v38);
    }

    id v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
LABEL_10:
  brc_bread_crumbs();
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] refreshing iCloud status%@", buf, 0xCu);
  }

  double v13 = +[ACAccountStore defaultStore];
  id v14 = objc_msgSend(v13, "aa_primaryAppleAccount");
  objc_super v15 = v14;
  if (v14)
  {
    if ([v14 isEnabledForDataclass:kAccountDataclassUbiquity])
    {
      v45 = v10;
      v16 = BRPrimaryiCloudAccountCopyStatus();
      v17 = (NSString *)0;
      double v18 = [v16 objectForKey:BRAccountIsSessionLoaded];
      unsigned __int8 v19 = [v18 BOOLValue];

      if (v19)
      {
        uint64_t v20 = [v16 objectForKey:BRAccountMigrationStatusKey];
        v44 = (void *)v20;
        if (v17 || (v21 = (void *)v20) == 0)
        {
          v22 = brc_bread_crumbs();
          double v23 = brc_default_log();
          if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            v49 = v17;
            __int16 v50 = 2112;
            v51 = v44;
            __int16 v52 = 2112;
            v53 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v23, (os_log_type_t)0x90u, "[ERROR] Error fetching account status %@ or migration status %@%@", buf, 0x20u);
          }

          v21 = v44;
          if (!v44) {
            goto LABEL_44;
          }
        }
        if (((unint64_t)[v21 integerValue] & 0xFE) == 2)
        {
          double v24 = +[NSFileManager defaultManager];
          v25 = [v24 ubiquityIdentityToken];

          if (v25)
          {
            brc_bread_crumbs();
            v26 = (NSString *)objc_claimAutoreleasedReturnValue();
            v27 = brc_default_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v49 = v26;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[INFO] token returned: dismiss%@", buf, 0xCu);
            }

            v28 = [(BRFileProviderUIExtension *)self extensionContext];
            [v28 completeRequest];
          }
          else
          {
            [(BRFileProviderUIExtension *)self setMode:2];
            v28 = brc_bread_crumbs();
            double v42 = brc_default_log();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v49 = (NSString *)v28;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "[INFO] no token returned: wait for token%@", buf, 0xCu);
            }
          }
          v21 = v44;
          id v10 = v45;
        }
        else
        {
LABEL_44:
          [(BRFileProviderUIExtension *)self setMode:1];
          v28 = brc_bread_crumbs();
          v39 = brc_default_log();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v49 = (NSString *)v28;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "[INFO] not migrated: turn on mode%@", buf, 0xCu);
          }

          id v10 = v45;
        }
      }
      else
      {
        [(BRFileProviderUIExtension *)self setMode:1];
        id v10 = v45;
      }
    }
    else
    {
      [(BRFileProviderUIExtension *)self setMode:1];
    }
  }
  else
  {
    [(BRFileProviderUIExtension *)self setMode:0];
    brc_bread_crumbs();
    v29 = (NSString *)objc_claimAutoreleasedReturnValue();
    v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v29;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[INFO] no account found: sign in mode%@", buf, 0xCu);
    }
  }
  _BRRestorePersona();
}

- (void)updateText
{
  [(BRFileProviderUIExtension *)self setDidInitializeText:1];

  -[BRFileProviderUIExtension performLayoutSpecificMethod:](self, "performLayoutSpecificMethod:", "_updateText_custom", "_updateText_system");
}

- (void)_updateText_custom
{
  int64_t v3 = [(BRFileProviderUIExtension *)self message];
  id v4 = [(BRFileProviderUIExtension *)self messageLabel];
  [v4 setText:v3];

  id v9 = [(BRFileProviderUIExtension *)self buttonText];
  if (v9)
  {
    int v5 = [(BRFileProviderUIExtension *)self shortButtonTitle];
    [(BRFileProviderUIExtension *)self _setButtonTitle:v9 alternativeShortTitle:v5];

    CFStringRef v6 = [(BRFileProviderUIExtension *)self button];
    double v7 = v6;
    uint64_t v8 = 0;
  }
  else
  {
    CFStringRef v6 = [(BRFileProviderUIExtension *)self button];
    double v7 = v6;
    uint64_t v8 = 1;
  }
  [v6 setHidden:v8];
}

- (void)_setButtonTitle:(id)a3 alternativeShortTitle:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000034C8;
  v7[3] = &unk_100008320;
  v7[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  +[UIView performWithoutAnimation:v7];
}

- (void)updateColors
{
}

- (void)_updateColors_custom
{
  id v5 = +[UIColor separatorColor];
  id v3 = [v5 CGColor];
  id v4 = [(BRIconView *)self->_iconView layer];
  [v4 setBorderColor:v3];
}

- (void)updateContentLayoutAllowingAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100003764;
  v9[3] = &unk_100008348;
  v9[4] = self;
  id v5 = objc_retainBlock(v9);
  id v6 = v5;
  if (v3)
  {
    ((void (*)(void *))v5[2])(v5);
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000037FC;
    v7[3] = &unk_100008370;
    v7[4] = self;
    id v8 = v5;
    +[UIView performWithoutAnimation:v7];
  }
}

- (void)updateIcon
{
}

- (void)_updateIcon_custom
{
  BOOL v3 = [(BRFileProviderUIExtension *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  id v6 = [(BRFileProviderUIExtension *)self traitCollection];
  id v7 = [v6 verticalSizeClass];

  int v8 = v7 == (id)1 || IsAccessibilityCategory;
  if (v8)
  {
    id v9 = [(BRFileProviderUIExtension *)self traitCollection];
    uint64_t v10 = sub_100003B24(v9);
    v11 = [(BRFileProviderUIExtension *)self iconView];
    [v11 setIconVariant:v10];
  }
  else
  {
    unsigned __int8 v12 = [(BRFileProviderUIExtension *)self tooSmallToFitIcon];
    double v13 = [(BRFileProviderUIExtension *)self traitCollection];
    uint64_t v14 = sub_100003B24(v13);
    objc_super v15 = [(BRFileProviderUIExtension *)self iconView];
    [v15 setIconVariant:v14];

    if ((v12 & 1) == 0)
    {
      double v23 = [(BRFileProviderUIExtension *)self iconView];
      [v23 setHidden:0];

      double v24 = [(BRFileProviderUIExtension *)self iconTopConstraint];
      [v24 setActive:1];

      v25 = [(BRFileProviderUIExtension *)self titleTopFallbackConstraint];
      [v25 setActive:0];

      v26 = [(BRFileProviderUIExtension *)self messageLabel];
      [v26 setHidden:0];

      uint64_t v20 = [(BRFileProviderUIExtension *)self messageHeightFallbackConstraint];
      v21 = v20;
      uint64_t v22 = 0;
      goto LABEL_10;
    }
  }
  v16 = [(BRFileProviderUIExtension *)self iconView];
  [v16 setHidden:1];

  v17 = [(BRFileProviderUIExtension *)self iconTopConstraint];
  [v17 setActive:0];

  double v18 = [(BRFileProviderUIExtension *)self titleTopFallbackConstraint];
  [v18 setActive:1];

  if (!v8) {
    goto LABEL_11;
  }
  unsigned __int8 v19 = [(BRFileProviderUIExtension *)self messageLabel];
  [v19 setHidden:1];

  uint64_t v20 = [(BRFileProviderUIExtension *)self messageHeightFallbackConstraint];
  v21 = v20;
  uint64_t v22 = 1;
LABEL_10:
  [v20 setActive:v22];

LABEL_11:
  v27 = [(BRFileProviderUIExtension *)self traitCollection];
  v28 = [v27 preferredContentSizeCategory];
  NSComparisonResult v29 = UIContentSizeCategoryCompareToCategory(v28, UIContentSizeCategoryAccessibilityExtraLarge);

  BOOL v31 = v7 == (id)1 && v29 == NSOrderedDescending;
  id v32 = [(BRFileProviderUIExtension *)self titleLabel];
  [v32 setHidden:v31];

  id v33 = [(BRFileProviderUIExtension *)self titleHeightFallbackConstraint];
  [v33 setActive:v31];
}

- (BOOL)tooSmallToFitAnything
{
  if (self->_layoutType == 1) {
    return 1;
  }
  id v4 = [(BRFileProviderUIExtension *)self view];
  id v5 = [v4 safeAreaLayoutGuide];
  [v5 layoutFrame];
  double v7 = v6;

  int v8 = [(BRFileProviderUIExtension *)self view];
  [v8 bounds];
  double v10 = v9;

  v11 = [(BRFileProviderUIExtension *)self button];
  objc_msgSend(v11, "systemLayoutSizeFittingSize:", v10, 0.0);
  BOOL v2 = v12 > v7;

  return v2;
}

- (BOOL)tooSmallToFitIcon
{
  BOOL v3 = [(BRFileProviderUIExtension *)self view];
  id v4 = [v3 safeAreaLayoutGuide];
  [v4 layoutFrame];
  double v6 = v5;

  double v7 = [(BRFileProviderUIExtension *)self view];
  [v7 bounds];
  double v9 = v8;

  double v10 = [(BRFileProviderUIExtension *)self contentView];
  objc_msgSend(v10, "systemLayoutSizeFittingSize:", v9, 0.0);
  double v12 = v11;

  if ([(BRIconView *)self->_iconView isHidden])
  {
    double v13 = [(BRFileProviderUIExtension *)self iconTopConstraint];
    [v13 constant];
    double v15 = v12 + v14;

    v16 = [(BRFileProviderUIExtension *)self iconView];
    objc_msgSend(v16, "systemLayoutSizeFittingSize:", v9, 0.0);
    double v18 = v15 + v17;

    unsigned __int8 v19 = [(BRFileProviderUIExtension *)self iconToTitleSpacingConstraint];
    [v19 constant];
    double v12 = v18 + v20;
  }
  return v12 > v6;
}

- (void)updateButtonSpacing
{
  id v5 = [(BRFileProviderUIExtension *)self traitCollection];
  if ([v5 horizontalSizeClass] == (id)2) {
    double v3 = -72.0;
  }
  else {
    double v3 = -56.0;
  }
  id v4 = [(BRFileProviderUIExtension *)self buttonSpacingConstraint];
  [v4 setConstant:v3];
}

- (void)updateTitleFont
{
  id v6 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle2];
  double v3 = [v6 fontDescriptorWithSymbolicTraits:2];
  id v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
  id v5 = [(BRFileProviderUIExtension *)self titleLabel];
  [v5 setFont:v4];
}

- (void)_viewDidLoad_system
{
}

- (void)_updateTraitCollectionDependents_system
{
}

- (void)_updateText_system
{
}

- (void)_updateColors_system
{
}

- (void)_updateIcon_system
{
}

- (id)_imageForContentConfiguration
{
  cachedImage_system = self->_cachedImage_system;
  if (!cachedImage_system)
  {
    if (qword_10000CB70 != -1) {
      dispatch_once(&qword_10000CB70, &stru_1000083F8);
    }
    if (byte_10000CB78)
    {
      id v4 = +[UIImage imageNamed:@"HeaderIcon-Circular"];
      id v5 = self->_cachedImage_system;
      self->_cachedImage_system = v4;
    }
    else
    {
      id v5 = +[ISImageDescriptor imageDescriptorNamed:kISImageDescriptorHomeScreen];
      [v5 setDrawBorder:1];
      id v6 = [objc_alloc((Class)ISIcon) initWithBundleIdentifier:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];
      double v7 = [v6 prepareImageForDescriptor:v5];
      double v8 = +[UIScreen mainScreen];
      double v9 = [v8 traitCollection];
      [v9 displayScale];
      double v11 = v10;

      +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", [v7 CGImage], 0, v11);
      double v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
      double v13 = self->_cachedImage_system;
      self->_cachedImage_system = v12;
    }
    cachedImage_system = self->_cachedImage_system;
  }
  double v14 = cachedImage_system;

  return v14;
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if (self->_layoutType == 1)
  {
    id v5 = +[UIContentUnavailableConfiguration emptyProminentConfiguration];
    id v6 = [v5 updatedConfigurationForState:v4];

    if (qword_10000CB70 != -1) {
      dispatch_once(&qword_10000CB70, &stru_1000083F8);
    }
    int v7 = byte_10000CB78;
    double v8 = [v6 imageProperties];
    double v9 = v8;
    double v10 = 88.0;
    if (!v7) {
      double v10 = 64.0;
    }
    objc_msgSend(v8, "setMaximumSize:", v10, v10);

    double v11 = [(BRFileProviderUIExtension *)self _imageForContentConfiguration];
    [v6 setImage:v11];

    double v12 = [(BRFileProviderUIExtension *)self title];
    [v6 setText:v12];

    double v13 = [(BRFileProviderUIExtension *)self message];
    [v6 setSecondaryText:v13];

    double v14 = +[UIButtonConfiguration borderedProminentButtonConfiguration];
    double v15 = [(BRFileProviderUIExtension *)self buttonText];
    [v14 setTitle:v15];

    if (qword_10000CB70 != -1) {
      dispatch_once(&qword_10000CB70, &stru_1000083F8);
    }
    if (byte_10000CB78)
    {
      objc_msgSend(v14, "setContentInsets:", 10.0, 20.0, 10.0, 20.0);
    }
    else
    {
      v16 = +[UIColor linkColor];
      [v14 setBaseBackgroundColor:v16];
    }
    double v17 = [v6 buttonProperties];
    [v17 setConfiguration:v14];
    [v17 setRole:1];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100004478;
    v32[3] = &unk_100008398;
    objc_copyWeak(&v33, &location);
    double v18 = +[UIAction actionWithHandler:v32];
    [v17 setPrimaryAction:v18];

    unsigned __int8 v19 = [(BRFileProviderUIExtension *)self traitCollection];
    double v20 = [v19 preferredContentSizeCategory];

    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v20);
    NSComparisonResult v22 = UIContentSizeCategoryCompareToCategory(v20, UIContentSizeCategoryAccessibilityExtraLarge);
    if (IsAccessibilityCategory)
    {
      NSComparisonResult v23 = v22;
      id v31 = v4;
      double v24 = [(BRFileProviderUIExtension *)self traitCollection];
      id v25 = [v24 verticalSizeClass];

      v26 = [(BRFileProviderUIExtension *)self traitCollection];
      id v27 = [v26 horizontalSizeClass];

      BOOL v28 = (char *)[(BRFileProviderUIExtension *)self interfaceOrientation] - 1 >= (char *)2
         && [(BRFileProviderUIExtension *)self interfaceOrientation] != 0;
      if (v25 == (id)1)
      {
        [v6 setSecondaryText:0];
        if (v23 == NSOrderedDescending) {
          [v6 setText:0];
        }
      }
      char v29 = v27 != (id)1 || v28;
      id v4 = v31;
      if ((v29 & 1) == 0)
      {
        v30 = [(BRFileProviderUIExtension *)self shortButtonTitle];
        [v14 setTitle:v30];
      }
    }
    [(BRFileProviderUIExtension *)self _setContentUnavailableConfiguration:v6];

    objc_destroyWeak(&v33);
  }
  objc_destroyWeak(&location);
}

- (void)performLayoutSpecificMethod:(id)a3
{
  int64_t layoutType = self->_layoutType;
  if (layoutType == 1)
  {
    SEL var1 = a3.var1;
  }
  else if (layoutType)
  {
    SEL var1 = 0;
  }
  else
  {
    SEL var1 = a3.var0;
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    id v6 = (void (*)(BRFileProviderUIExtension *, SEL))[(BRFileProviderUIExtension *)self methodForSelector:var1];
    if (v6)
    {
      v6(self, var1);
    }
  }
}

- (int64_t)mode
{
  return self->_mode;
}

- (BOOL)didInitializeText
{
  return self->_didInitializeText;
}

- (void)setDidInitializeText:(BOOL)a3
{
  self->_didInitializeText = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (UIButton)button
{
  return self->_button;
}

- (BRIconView)iconView
{
  return self->_iconView;
}

- (NSLayoutConstraint)buttonSpacingConstraint
{
  return self->_buttonSpacingConstraint;
}

- (NSLayoutConstraint)iconTopConstraint
{
  return self->_iconTopConstraint;
}

- (NSLayoutConstraint)iconToTitleSpacingConstraint
{
  return self->_iconToTitleSpacingConstraint;
}

- (NSLayoutConstraint)titleTopFallbackConstraint
{
  return self->_titleTopFallbackConstraint;
}

- (NSLayoutConstraint)titleHeightFallbackConstraint
{
  return self->_titleHeightFallbackConstraint;
}

- (NSLayoutConstraint)messageHeightFallbackConstraint
{
  return self->_messageHeightFallbackConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHeightFallbackConstraint, 0);
  objc_storeStrong((id *)&self->_titleHeightFallbackConstraint, 0);
  objc_storeStrong((id *)&self->_titleTopFallbackConstraint, 0);
  objc_storeStrong((id *)&self->_iconToTitleSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_iconTopConstraint, 0);
  objc_storeStrong((id *)&self->_buttonSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_cachedImage_system, 0);

  objc_storeStrong((id *)&self->_personaID, 0);
}

@end