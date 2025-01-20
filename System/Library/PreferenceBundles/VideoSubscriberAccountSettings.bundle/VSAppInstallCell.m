@interface VSAppInstallCell
+ (PSSpecifier)specifier;
- (ASCLockupView)lockupView;
- (BOOL)isAccessibilityElement;
- (BOOL)lockupViewShouldSupportDSIDLessInstalls:(id)a3;
- (BOOL)shouldDisplayPrivacySwitch;
- (BOOL)shouldDisplayPrivacySwitch:(int64_t)a3;
- (NSLayoutConstraint)leadingMargin;
- (NSLayoutConstraint)topMargin;
- (NSLayoutConstraint)trailingMargin;
- (NSString)appState;
- (UISwitch)privacySwitch;
- (VSAppInstallCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)cachedRequest;
- (id)metricsActivityForLockupView:(id)a3 toPerformActionOfOffer:(id)a4;
- (id)presentingViewControllerForLockupView:(id)a3;
- (id)viewModel;
- (int64_t)privacyState;
- (void)_updateSubviewsWithPrivacyState:(int64_t)a3;
- (void)activateConstraints;
- (void)createConstraints;
- (void)dealloc;
- (void)displayPrivacySwitchIfNeeded;
- (void)layoutSubviews;
- (void)lockupView:(id)a3 appStateDidChange:(id)a4;
- (void)lockupViewDidBeginRequest:(id)a3;
- (void)lockupViewDidFinishRequest:(id)a3;
- (void)prepareForReuse;
- (void)setAppState:(id)a3;
- (void)setCellHeight:(double)a3;
- (void)setDisplayPrivacySwitch:(BOOL)a3;
- (void)setLeadingMargin:(id)a3;
- (void)setLockupView:(id)a3;
- (void)setPrivacyState:(int64_t)a3;
- (void)setPrivacySwitch:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setTopMargin:(id)a3;
- (void)setTrailingMargin:(id)a3;
- (void)updateCellHeight;
- (void)updateConstraints;
@end

@implementation VSAppInstallCell

+ (PSSpecifier)specifier
{
  VSRequireMainThread();
  v2 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  [v2 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v2 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

  return (PSSpecifier *)v2;
}

- (VSAppInstallCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VSAppInstallCell;
  v9 = [(VSAppInstallCell *)&v19 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    id v10 = objc_msgSend(objc_alloc((Class)ASCLockupView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [v10 setDelegate:v9];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [v8 propertyForKey:@"VSAppInstallCellLockupGroupKey"];
    [v10 setGroup:v11];
    lockupView = v9->_lockupView;
    v9->_lockupView = (ASCLockupView *)v10;
    id v13 = v10;

    v14 = (UISwitch *)objc_alloc_init((Class)VSBindableSwitch);
    privacySwitch = v9->_privacySwitch;
    v9->_privacySwitch = v14;
    v16 = v14;

    v17 = [(VSAppInstallCell *)v9 contentView];
    [v17 addSubview:v9->_lockupView];

    [(VSAppInstallCell *)v9 setNeedsUpdateConstraints];
    [(VSAppInstallCell *)v9 updateConstraintsIfNeeded];
    [(VSAppInstallCell *)v9 _updateSubviewsWithPrivacyState:0];
    [(VSAppInstallCell *)v9 setSelectionStyle:0];
  }
  return v9;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)VSAppInstallCell;
  [(VSAppInstallCell *)&v4 prepareForReuse];
  v3 = [(VSAppInstallCell *)self lockupView];
  [v3 setLockup:0];
}

- (void)dealloc
{
  VSRequireMainThread();
  v3.receiver = self;
  v3.super_class = (Class)VSAppInstallCell;
  [(VSAppInstallCell *)&v3 dealloc];
}

- (void)setPrivacyState:(int64_t)a3
{
  self->_privacyState = a3;
  -[VSAppInstallCell _updateSubviewsWithPrivacyState:](self, "_updateSubviewsWithPrivacyState:");
}

- (void)setSpecifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VSAppInstallCell;
  [(VSAppInstallCell *)&v9 setSpecifier:a3];
  objc_super v4 = [(VSAppInstallCell *)self viewModel];
  v5 = [(VSAppInstallCell *)self privacySwitch];
  if (v4)
  {
    v6 = VSMainConcurrencyBindingOptions();
    [(VSAppInstallCell *)self vs_bind:@"privacyState" toObject:v4 withKeyPath:@"privacyState" options:v6];

    v7 = VSMainConcurrencyBindingOptions();
    objc_msgSend(v5, "vs_bind:toObject:withKeyPath:options:", @"enabled", v4, @"canChangePrivacyAccess", v7);

    id v8 = VSMainConcurrencyBindingOptions();
    objc_msgSend(v5, "vs_bind:toObject:withKeyPath:options:", @"on", v4, @"accessGranted", v8);
  }
  else
  {
    [(VSAppInstallCell *)self vs_unbind:@"privacyState"];
    objc_msgSend(v5, "vs_unbind:", @"enabled");
    objc_msgSend(v5, "vs_unbind:", @"on");
  }
}

- (id)viewModel
{
  v2 = [(VSAppInstallCell *)self specifier];
  objc_super v3 = [v2 propertyForKey:@"VSAppSettingsViewModel"];

  return v3;
}

- (id)cachedRequest
{
  v2 = [(VSAppInstallCell *)self specifier];
  objc_super v3 = [v2 propertyForKey:@"VSAppInstallCellCachedRequestKey"];

  return v3;
}

- (void)_updateSubviewsWithPrivacyState:(int64_t)a3
{
  id v16 = [(VSAppInstallCell *)self lockupView];
  objc_super v4 = [(VSAppInstallCell *)self viewModel];
  v5 = v4;
  if (v4)
  {
    if ([v4 isDecided])
    {
      id v6 = objc_alloc((Class)ASCArtwork);
      v7 = [v5 icon];
      id v8 = [v6 initWithImage:v7 decoration:ASCArtworkDecorationRoundedRect];

      id v9 = [objc_alloc((Class)ASCAdamID) initWithInt64:-1];
      id v10 = objc_alloc((Class)ASCLockup);
      uint64_t v11 = ASCLockupKindApp;
      v12 = [v5 displayName];
      id v13 = [v5 decidedLockupSubtitle];
      id v14 = [v10 initWithID:v9 kind:v11 metrics:0 icon:v8 heading:0 title:v12 subtitle:v13 ageRating:0 offer:0];

      [v16 setAutomaticallyPresentsProductDetails:0];
      [v16 setLockup:v14];
      [(VSAppInstallCell *)self displayPrivacySwitchIfNeeded];
    }
    else
    {
      id v8 = [(VSAppInstallCell *)self cachedRequest];
      if (!v8)
      {
        v15 = [v5 adamID];
        id v8 = +[ASCLockupRequest tvProviderLockupRequestWithAdamID:v15];
      }
      [v16 setRequest:v8];
    }
  }
  [(VSAppInstallCell *)self updateCellHeight];
}

- (BOOL)shouldDisplayPrivacySwitch:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

- (void)setDisplayPrivacySwitch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(VSAppInstallCell *)self privacySwitch];
  id v14 = (id)v5;
  if (v3) {
    id v6 = (void *)v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  [(VSAppInstallCell *)self setAccessoryView:v7];
  [(VSAppInstallCell *)self setNeedsUpdateConstraints];
  id v8 = [(VSAppInstallCell *)self lockupView];
  [v8 setAutomaticallyPresentsProductDetails:!v3];
  id v9 = +[NSBundle vs_frameworkBundle];
  id v10 = [v9 localizedStringForKey:@"ACCOUNT_ACCESS_FOR_APP_FORMAT" value:0 table:0];

  uint64_t v11 = [v8 lockup];
  v12 = [v11 title];
  id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v12);
  [v14 setAccessibilityHint:v13];
}

- (void)layoutSubviews
{
  [(VSAppInstallCell *)self _updateSubviewsWithPrivacyState:[(VSAppInstallCell *)self privacyState]];
  v3.receiver = self;
  v3.super_class = (Class)VSAppInstallCell;
  [(VSAppInstallCell *)&v3 layoutSubviews];
}

- (void)updateConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)VSAppInstallCell;
  [(VSAppInstallCell *)&v4 updateConstraints];
  objc_super v3 = [(VSAppInstallCell *)self trailingMargin];
  [v3 setActive:0];

  [(VSAppInstallCell *)self createConstraints];
  [(VSAppInstallCell *)self activateConstraints];
}

- (void)createConstraints
{
  id v14 = [(VSAppInstallCell *)self lockupView];
  objc_super v3 = [(VSAppInstallCell *)self accessoryView];
  objc_super v4 = [v3 superview];
  if (v4) {
    [v3 leadingAnchor];
  }
  else {
  uint64_t v5 = [(VSAppInstallCell *)self trailingAnchor];
  }

  id v6 = [v14 leadingAnchor];
  id v7 = [(VSAppInstallCell *)self leadingAnchor];
  id v8 = [v6 constraintEqualToSystemSpacingAfterAnchor:v7 multiplier:1.0];

  [(VSAppInstallCell *)self setLeadingMargin:v8];
  id v9 = [v14 topAnchor];
  id v10 = [(VSAppInstallCell *)self topAnchor];
  uint64_t v11 = [v9 constraintEqualToSystemSpacingBelowAnchor:v10 multiplier:1.0];

  [(VSAppInstallCell *)self setTopMargin:v11];
  v12 = [v14 trailingAnchor];
  id v13 = [v5 constraintEqualToSystemSpacingAfterAnchor:v12 multiplier:1.0];

  [(VSAppInstallCell *)self setTrailingMargin:v13];
}

- (void)activateConstraints
{
  objc_super v3 = [(VSAppInstallCell *)self leadingMargin];
  objc_super v4 = [(VSAppInstallCell *)self topMargin];
  v7[1] = v4;
  uint64_t v5 = [(VSAppInstallCell *)self trailingMargin];
  v7[2] = v5;
  id v6 = +[NSArray arrayWithObjects:v7 count:3];
  +[NSLayoutConstraint activateConstraints:v6];
}

- (void)setCellHeight:(double)a3
{
  id v5 = [(VSAppInstallCell *)self specifier];
  objc_super v4 = +[NSNumber numberWithDouble:a3];
  [v5 setProperty:v4 forKey:PSTableCellHeightKey];
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
}

- (id)metricsActivityForLockupView:(id)a3 toPerformActionOfOffer:(id)a4
{
  uint64_t v5 = ASCAppStateDownloadable;
  id v6 = +[NSNull null];
  id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, 0);

  id v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", ASCAppStateOpenable, 0);
  id v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", ASCAppStateUpdatable, 0);
  id v10 = [(VSAppInstallCell *)self appState];
  if (v10) {
    [(VSAppInstallCell *)self appState];
  }
  else {
  uint64_t v11 = +[NSNull null];
  }

  if ([v7 containsObject:v11])
  {
    v12 = (id *)&VSMetricClickTargetInstallApp;
    goto LABEL_10;
  }
  if ([v8 containsObject:v11])
  {
    v12 = (id *)&VSMetricClickTargetOpenApp;
    goto LABEL_10;
  }
  if ([v9 containsObject:v11])
  {
    v12 = (id *)&VSMetricClickTargetUpdateApp;
LABEL_10:
    id v13 = *v12;
    id v14 = v13;
    if (v13) {
      BOOL v15 = v13 == (id)VSMetricClickTargetUpdateApp;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15) {
      +[VSMetricsManagerObjC recordClickEventWithPage:VSMetricPageSettingsAccountInfo pageType:VSMetricPageTypeSettings target:v13];
    }
    goto LABEL_18;
  }
  id v16 = VSErrorLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_BED0((uint64_t)v11, v16);
  }

  id v14 = 0;
LABEL_18:
  id v17 = objc_alloc_init((Class)ASCMetricsActivity);

  return v17;
}

- (void)lockupViewDidBeginRequest:(id)a3
{
}

- (BOOL)shouldDisplayPrivacySwitch
{
  int64_t v3 = [(VSAppInstallCell *)self privacyState];

  return [(VSAppInstallCell *)self shouldDisplayPrivacySwitch:v3];
}

- (void)displayPrivacySwitchIfNeeded
{
  BOOL v3 = [(VSAppInstallCell *)self shouldDisplayPrivacySwitch];

  [(VSAppInstallCell *)self setDisplayPrivacySwitch:v3];
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v6 = a3;
  if ([(VSAppInstallCell *)self shouldDisplayPrivacySwitch])
  {
    objc_super v4 = [v6 lockup];
    uint64_t v5 = [v4 lockupWithOffer:0];
    [v6 setLockup:v5];
  }
  [(VSAppInstallCell *)self displayPrivacySwitchIfNeeded];
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  return 0;
}

- (void)updateCellHeight
{
  id v7 = [(VSAppInstallCell *)self lockupView];
  [v7 intrinsicContentSize];
  double v4 = v3;
  uint64_t v5 = [(VSAppInstallCell *)self topMargin];
  [v5 constant];
  [(VSAppInstallCell *)self setCellHeight:v4 + v6 * 2.0];
}

- (BOOL)lockupViewShouldSupportDSIDLessInstalls:(id)a3
{
  double v3 = [(VSAppInstallCell *)self viewModel];
  unsigned __int8 v4 = [v3 forceDSIDlessInstall];

  return v4;
}

- (BOOL)isAccessibilityElement
{
  int64_t v3 = [(VSAppInstallCell *)self privacyState];

  return [(VSAppInstallCell *)self shouldDisplayPrivacySwitch:v3];
}

- (id)accessibilityLabel
{
  v2 = [(VSAppInstallCell *)self lockupView];
  int64_t v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(VSAppInstallCell *)self lockupView];
  int64_t v3 = [v2 accessibilityValue];

  return v3;
}

- (id)accessibilityHint
{
  if ([(VSAppInstallCell *)self shouldDisplayPrivacySwitch:[(VSAppInstallCell *)self privacyState]])
  {
    int64_t v3 = +[NSBundle vs_frameworkBundle];
    unsigned __int8 v4 = [v3 localizedStringForKey:@"ACCOUNT_ACCESS_FOR_APP_FORMAT" value:0 table:0];

    uint64_t v5 = [(VSAppInstallCell *)self lockupView];
    double v6 = [v5 lockup];
    id v7 = [v6 title];

    if (v7)
    {
      id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v7);
    }
    else
    {
      id v9 = [(VSAppInstallCell *)self lockupView];
      id v8 = [v9 accessibilityHint];
    }
  }
  else
  {
    unsigned __int8 v4 = [(VSAppInstallCell *)self lockupView];
    id v8 = [v4 accessibilityHint];
  }

  return v8;
}

- (id)accessibilityElements
{
  int64_t v3 = +[NSMutableArray array];
  unsigned __int8 v4 = [(VSAppInstallCell *)self lockupView];
  [v3 addObject:v4];

  id v5 = [v3 copy];

  return v5;
}

- (int64_t)privacyState
{
  return self->_privacyState;
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
}

- (UISwitch)privacySwitch
{
  return self->_privacySwitch;
}

- (void)setPrivacySwitch:(id)a3
{
}

- (NSLayoutConstraint)leadingMargin
{
  return self->_leadingMargin;
}

- (void)setLeadingMargin:(id)a3
{
}

- (NSLayoutConstraint)topMargin
{
  return self->_topMargin;
}

- (void)setTopMargin:(id)a3
{
}

- (NSLayoutConstraint)trailingMargin
{
  return self->_trailingMargin;
}

- (void)setTrailingMargin:(id)a3
{
}

- (NSString)appState
{
  return self->_appState;
}

- (void)setAppState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appState, 0);
  objc_storeStrong((id *)&self->_trailingMargin, 0);
  objc_storeStrong((id *)&self->_topMargin, 0);
  objc_storeStrong((id *)&self->_leadingMargin, 0);
  objc_storeStrong((id *)&self->_privacySwitch, 0);

  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end