@interface HPRFApplicationLinkCell
+ (id)_cachedInstallStateByAppID;
+ (id)_cachedInstalledProgressByAppID;
+ (id)_iconCache;
+ (id)reuseIdentifierForClassAndType:(int64_t)a3;
- (HKWatchAppAvailability)watchAppAvailability;
- (HPRFApplicationLinkCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (HPRFInstallSpinnerButton)installSpinnerButton;
- (UIButton)installButton;
- (UIColor)disabledColor;
- (UIColor)enabledColor;
- (id)activePairedDevice;
- (id)blankIcon;
- (id)getLazyIcon;
- (int64_t)appInstallStateForAppBundleID:(id)a3;
- (void)dealloc;
- (void)installApp;
- (void)installNanoBundle:(id)a3 forDevice:(id)a4;
- (void)layoutSubviews;
- (void)performInstall;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setDisabledColor:(id)a3;
- (void)setEnabledColor:(id)a3;
- (void)setInstallButton:(id)a3;
- (void)setInstallSpinnerButton:(id)a3;
- (void)setUpWatchAppAvailabilityForAppBundleID:(id)a3 device:(id)a4;
- (void)setWatchAppAvailability:(id)a3;
- (void)updateProgressUIForBundleID:(id)a3;
- (void)updateUIWithInstallState:(int64_t)a3 forBundleID:(id)a4;
- (void)watchAppAvailability:(id)a3 appInstallProgressDidUpdate:(id)a4;
- (void)watchAppAvailability:(id)a3 appInstallStateDidChange:(int64_t)a4;
@end

@implementation HPRFApplicationLinkCell

- (HPRFApplicationLinkCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v9 = a5;
  v48.receiver = self;
  v48.super_class = (Class)HPRFApplicationLinkCell;
  v10 = [(HPRFApplicationLinkCell *)&v48 initWithStyle:a3 reuseIdentifier:a4 specifier:v9];
  v11 = v10;
  if (v10)
  {
    [(HPRFApplicationLinkCell *)v10 setSelectionStyle:0];
    v12 = [(HPRFApplicationLinkCell *)v11 titleLabel];
    [v12 setNumberOfLines:0];

    uint64_t v13 = +[UIColor systemOrangeColor];
    enabledColor = v11->_enabledColor;
    v11->_enabledColor = (UIColor *)v13;

    double v46 = 0.0;
    double v47 = 0.0;
    double v45 = 0.0;
    v15 = +[UIColor systemOrangeColor];
    [v15 getRed:&v47 green:&v46 blue:&v45 alpha:0];

    double v17 = v46;
    double v16 = v47;
    double v18 = v45;
    UIInterfaceGetContentDisabledAlpha();
    uint64_t v20 = +[UIColor colorWithRed:v16 green:v17 blue:v18 alpha:v19];
    disabledColor = v11->_disabledColor;
    v11->_disabledColor = (UIColor *)v20;

    uint64_t v22 = +[UIButton buttonWithType:1];
    installButton = v11->_installButton;
    v11->_installButton = (UIButton *)v22;

    v24 = [(UIButton *)v11->_installButton layer];
    [v24 setBorderWidth:1.0];

    v25 = [(UIButton *)v11->_installButton layer];
    [v25 setCornerRadius:3.0];

    v26 = v11->_installButton;
    v27 = HKHeartRateLocalizedString();
    [(UIButton *)v26 setTitle:v27 forState:0];

    v28 = v11->_installButton;
    v29 = HKHeartRateLocalizedString();
    [(UIButton *)v28 setTitle:v29 forState:2];

    v30 = v11->_installButton;
    v31 = [(HPRFApplicationLinkCell *)v11 _accessibilityHigherContrastTintColorForColor:v11->_enabledColor];
    [(UIButton *)v30 setTitleColor:v31 forState:0];

    v32 = v11->_installButton;
    v33 = [(HPRFApplicationLinkCell *)v11 _accessibilityHigherContrastTintColorForColor:v11->_disabledColor];
    [(UIButton *)v32 setTitleColor:v33 forState:2];

    -[UIButton setContentEdgeInsets:](v11->_installButton, "setContentEdgeInsets:", 5.0, 5.0, 5.0, 5.0);
    [(UIButton *)v11->_installButton setAlpha:1.0];
    v34 = [(UIButton *)v11->_installButton titleLabel];
    v35 = +[UIFont systemFontOfSize:14.0];
    [v34 setFont:v35];

    [(UIButton *)v11->_installButton setEnabled:1];
    [(UIButton *)v11->_installButton addTarget:v11 action:"performInstall" forControlEvents:64];
    v36 = -[HPRFInstallSpinnerButton initWithFrame:showSquare:]([HPRFInstallSpinnerButton alloc], "initWithFrame:showSquare:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    installSpinnerButton = v11->_installSpinnerButton;
    v11->_installSpinnerButton = v36;

    v38 = [v9 propertyForKey:@"HPRFAppBundleID"];
    uint64_t v39 = [(HPRFApplicationLinkCell *)v11 activePairedDevice];
    v40 = (void *)v39;
    if (v38 && v39)
    {
      [(HPRFApplicationLinkCell *)v11 setUpWatchAppAvailabilityForAppBundleID:v38 device:v39];
    }
    else
    {
      _HKInitializeLogging();
      v41 = (void *)HKLogDefault;
      if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR))
      {
        v43 = v41;
        v44 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138544130;
        v50 = v11;
        __int16 v51 = 2114;
        v52 = v44;
        __int16 v53 = 2112;
        v54 = v38;
        __int16 v55 = 2112;
        v56 = v40;
        _os_log_error_impl(&dword_0, v43, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Failed to setup watch app availability for app bundle identifier(%@) on watch(%@)", buf, 0x2Au);
      }
    }
  }
  return v11;
}

- (void)dealloc
{
  [(HKWatchAppAvailability *)self->_watchAppAvailability removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)HPRFApplicationLinkCell;
  [(HPRFApplicationLinkCell *)&v3 dealloc];
}

- (void)setUpWatchAppAvailabilityForAppBundleID:(id)a3 device:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  watchAppAvailability = self->_watchAppAvailability;
  if (watchAppAvailability)
  {
    v10 = [(HKWatchAppAvailability *)watchAppAvailability bundleID];
    unsigned __int8 v11 = [v10 isEqualToString:v7];

    if (v11) {
      goto LABEL_7;
    }
    [(HKWatchAppAvailability *)self->_watchAppAvailability removeObserver:self];
  }
  _HKInitializeLogging();
  v12 = (void *)HKLogDefault;
  if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v12;
    v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138544130;
    uint64_t v22 = self;
    __int16 v23 = 2114;
    v24 = v14;
    __int16 v25 = 2112;
    id v26 = v7;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Setting up watch app availability for app bundle identifier(%@) on watch(%@)", buf, 0x2Au);
  }
  v15 = (HKWatchAppAvailability *)[objc_alloc((Class)HKWatchAppAvailability) initWithBundleID:v7];
  double v16 = self->_watchAppAvailability;
  self->_watchAppAvailability = v15;

  [(HKWatchAppAvailability *)self->_watchAppAvailability addObserver:self queue:&_dispatch_main_q];
  objc_initWeak((id *)buf, self);
  double v17 = self->_watchAppAvailability;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_C1DC;
  v18[3] = &unk_18880;
  objc_copyWeak(&v20, (id *)buf);
  id v19 = v7;
  [(HKWatchAppAvailability *)v17 appInstallStateOnWatch:v8 completion:v18];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
LABEL_7:
}

- (id)activePairedDevice
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  objc_super v3 = [v2 getActivePairedDevice];

  return v3;
}

- (void)installNanoBundle:(id)a3 forDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(id)objc_opt_class() _cachedInstallStateByAppID];
  [v9 setObject:&off_19338 forKey:v7];

  id v10 = [objc_alloc((Class)ASDSystemAppMetadata) initWithBundleID:v7];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_C498;
  v13[3] = &unk_188D0;
  v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  SEL v16 = a2;
  id v11 = v8;
  id v12 = v7;
  +[ASDInstallApps installApp:v10 onPairedDevice:v11 withCompletionHandler:v13];
}

- (void)performInstall
{
  objc_super v3 = (id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier];
  id WeakRetained = objc_loadWeakRetained(v3);
  aSelectorName = [WeakRetained propertyForKey:@"HPRFAppInstallAction"];

  if (aSelectorName)
  {
    id v5 = objc_loadWeakRetained(v3);
    v6 = [v5 target];

    if (v6)
    {
      SEL v7 = NSSelectorFromString(aSelectorName);
      id v8 = objc_loadWeakRetained(v3);
      id v9 = [v8 target];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        id v11 = objc_loadWeakRetained(v3);
        id v12 = [v11 target];
        id v13 = objc_loadWeakRetained(v3);
        [v12 performSelectorOnMainThread:v7 withObject:v13 waitUntilDone:1];
      }
    }
  }
  [(HPRFApplicationLinkCell *)self installApp];
}

- (void)installApp
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier]);
  id v5 = [WeakRetained propertyForKey:@"HPRFAppBundleID"];

  if (v5)
  {
    v6 = [(HPRFApplicationLinkCell *)self activePairedDevice];
    if (v6)
    {
      [(HPRFApplicationLinkCell *)self installNanoBundle:v5 forDevice:v6];
    }
    else
    {
      _HKInitializeLogging();
      id v8 = (void *)HKLogDefault;
      if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR))
      {
        id v9 = v8;
        char v10 = NSStringFromSelector(a2);
        int v11 = 138543874;
        id v12 = self;
        __int16 v13 = 2114;
        id v14 = v10;
        __int16 v15 = 2112;
        SEL v16 = v5;
        _os_log_error_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Failed to schedule installation of app with bundle identifier(%@) on watch(nil)", (uint8_t *)&v11, 0x20u);
      }
    }
    [(HPRFApplicationLinkCell *)self updateUIWithInstallState:[(HPRFApplicationLinkCell *)self appInstallStateForAppBundleID:v5] forBundleID:v5];
    [(HPRFApplicationLinkCell *)self setNeedsLayout];
  }
  else
  {
    _HKInitializeLogging();
    SEL v7 = (void *)HKLogDefault;
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR)) {
      sub_ECE4((uint64_t)self, v7, a2);
    }
  }
}

- (int64_t)appInstallStateForAppBundleID:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() _cachedInstallStateByAppID];
  uint64_t v5 = [v4 objectForKey:v3];

  if (v5) {
    v6 = (_UNKNOWN **)v5;
  }
  else {
    v6 = &off_19368;
  }
  id v7 = [v6 integerValue];

  return (int64_t)v7;
}

- (void)layoutSubviews
{
  v67.receiver = self;
  v67.super_class = (Class)HPRFApplicationLinkCell;
  [(HPRFApplicationLinkCell *)&v67 layoutSubviews];
  [(HPRFApplicationLinkCell *)self bounds];
  CGFloat v64 = v4;
  CGFloat v65 = v3;
  double v6 = v5;
  double v8 = v7;
  id v9 = [(HPRFApplicationLinkCell *)self textLabel];
  char v10 = [(HPRFApplicationLinkCell *)self detailTextLabel];
  [v9 frame];
  CGFloat v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double rect = v17;
  unsigned int v18 = [(HPRFApplicationLinkCell *)self _shouldReverseLayoutDirection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier]);
  id v20 = [WeakRetained propertyForKey:@"HPRFAppBundleID"];
  int64_t v21 = [(HPRFApplicationLinkCell *)self appInstallStateForAppBundleID:v20];

  p_installButton = (id *)&self->_installButton;
  CGFloat v62 = v8;
  CGFloat v63 = v6;
  -[UIButton sizeThatFits:](self->_installButton, "sizeThatFits:", v6, v8);
  double v24 = v23;
  double v26 = v25;
  __int16 v27 = [(HPRFApplicationLinkCell *)self accessoryView];
  [v27 frame];
  double MinY = CGRectGetMinY(v68);

  v29 = [(HPRFApplicationLinkCell *)self accessoryView];
  [v29 frame];
  CGFloat v30 = CGRectGetMaxX(v69) - v24;

  -[UIButton setFrame:](self->_installButton, "setFrame:", v30, MinY, v24, v26);
  v31 = [(HPRFApplicationLinkCell *)self iconImageView];
  [v31 bounds];
  double v33 = v32;
  v34 = [(HPRFApplicationLinkCell *)self iconImageView];
  [v34 bounds];
  -[HPRFInstallSpinnerButton setBounds:](self->_installSpinnerButton, "setBounds:", 0.0, 0.0, v33);

  v35 = [(HPRFApplicationLinkCell *)self accessoryView];
  [v35 center];
  -[HPRFInstallSpinnerButton setCenter:](self->_installSpinnerButton, "setCenter:");

  if (v21 == 1) {
    p_installButton = (id *)&self->_installSpinnerButton;
  }
  id v36 = *p_installButton;
  [(HPRFApplicationLinkCell *)self setAccessoryView:v36];
  if (v36)
  {
    [v36 bounds];
    double v38 = v37;
    double v39 = 15.0;
  }
  else
  {
    id v36 = v10;
    objc_msgSend(v36, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
    double v38 = v40;
    double v39 = 35.0;
  }
  double v61 = v39;
  [v36 frame];
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  v49 = [(HPRFApplicationLinkCell *)self traitCollection];
  v50 = [v49 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v50);

  if (!v36) {
    goto LABEL_17;
  }
  v70.origin.x = v42;
  v70.origin.CGFloat y = v44;
  v70.size.width = v46;
  v70.size.height = v48;
  char v52 = CGRectGetWidth(v70) <= 0.0 || IsAccessibilityCategory;
  if (v52) {
    goto LABEL_17;
  }
  if (!v18)
  {
    v73.origin.x = v42;
    v73.origin.CGFloat y = v44;
    v73.size.width = v46;
    v73.size.height = v48;
    CGFloat MaxX = CGRectGetMaxX(v73);
    v74.origin.CGFloat y = v14;
    CGFloat v58 = MaxX - v38;
    v74.origin.x = v12;
    CGFloat y = v74.origin.y;
    v74.size.width = v16;
    v74.size.height = rect;
    double v59 = v58 - (CGRectGetMaxX(v74) + 6.0);
    if (v59 < 0.0)
    {
      double v16 = v16 + v59;
      v75.origin.CGFloat y = v64;
      v75.origin.x = v65;
      v75.size.height = v62;
      v75.size.width = v63;
      double v42 = CGRectGetWidth(v75) - (v61 + v38);
      double v46 = v38;
    }
    double v14 = y;
LABEL_17:
    double v53 = v12;
    goto LABEL_18;
  }
  double v53 = v12;
  v71.origin.x = v12;
  v71.origin.CGFloat y = v14;
  v71.size.width = v16;
  v71.size.height = rect;
  double MinX = CGRectGetMinX(v71);
  v72.origin.x = v42;
  v72.origin.CGFloat y = v44;
  v72.size.width = v46;
  v72.size.height = v48;
  double v55 = MinX - CGRectGetMaxX(v72);
  if (v55 < 0.0)
  {
    double v56 = v55 + -6.0;
    double v16 = v16 + v56;
    double v53 = v53 - v56;
  }
LABEL_18:
  objc_msgSend(v36, "setFrame:", v42, v44, v46, v48);
  objc_msgSend(v9, "setFrame:", v53, v14, v16, rect);
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HPRFApplicationLinkCell;
  id v5 = a3;
  [(HPRFApplicationLinkCell *)&v12 refreshCellContentsWithSpecifier:v5];
  double v6 = objc_msgSend(v5, "propertyForKey:", @"HPRFAppBundleID", v12.receiver, v12.super_class);

  uint64_t v7 = [(HPRFApplicationLinkCell *)self activePairedDevice];
  double v8 = (void *)v7;
  if (v6 && v7)
  {
    [(HPRFApplicationLinkCell *)self setUpWatchAppAvailabilityForAppBundleID:v6 device:v7];
  }
  else
  {
    _HKInitializeLogging();
    id v9 = (void *)HKLogDefault;
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR))
    {
      char v10 = v9;
      double v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138544130;
      double v14 = self;
      __int16 v15 = 2114;
      double v16 = v11;
      __int16 v17 = 2112;
      unsigned int v18 = v6;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Failed to setup watch app availability for app bundle identifier(%@) on watch(%@)", buf, 0x2Au);
    }
  }
  [(HPRFApplicationLinkCell *)self updateUIWithInstallState:[(HPRFApplicationLinkCell *)self appInstallStateForAppBundleID:v6] forBundleID:v6];
  [(HPRFApplicationLinkCell *)self setNeedsLayout];
}

- (void)updateProgressUIForBundleID:(id)a3
{
  installButton = self->_installButton;
  id v5 = a3;
  [(UIButton *)installButton setHidden:1];
  [(HPRFInstallSpinnerButton *)self->_installSpinnerButton setHidden:0];
  [(HPRFInstallSpinnerButton *)self->_installSpinnerButton showProgressAnimation];
  double v6 = [(id)objc_opt_class() _cachedInstalledProgressByAppID];
  uint64_t v7 = [v6 objectForKey:v5];

  [v7 floatValue];
  double v9 = v8;

  installSpinnerButton = self->_installSpinnerButton;

  [(HPRFInstallSpinnerButton *)installSpinnerButton setProgress:0 animated:v9];
}

- (void)updateUIWithInstallState:(int64_t)a3 forBundleID:(id)a4
{
  id v6 = a4;
  id v12 = v6;
  if (a3 == 2)
  {
    [(UIButton *)self->_installButton setHidden:0];
    [(UIButton *)self->_installButton setEnabled:0];
    [(HPRFInstallSpinnerButton *)self->_installSpinnerButton setHidden:1];
  }
  else if (a3 == 1)
  {
    [(HPRFApplicationLinkCell *)self updateProgressUIForBundleID:v6];
  }
  else
  {
    if (a3) {
      [(UIButton *)self->_installButton setEnabled:0];
    }
    [(UIButton *)self->_installButton setHidden:0];
    [(UIButton *)self->_installButton setEnabled:1];
    [(HPRFInstallSpinnerButton *)self->_installSpinnerButton setHidden:1];
    [(HPRFInstallSpinnerButton *)self->_installSpinnerButton stopProgressAnimation];
  }
  unsigned int v7 = [(UIButton *)self->_installButton isEnabled];
  float v8 = &OBJC_IVAR___HPRFApplicationLinkCell__disabledColor;
  if (v7) {
    float v8 = &OBJC_IVAR___HPRFApplicationLinkCell__enabledColor;
  }
  id v9 = [(HPRFApplicationLinkCell *)self _accessibilityHigherContrastTintColorForColor:*(void *)&self->PSTableCell_opaque[*v8]];
  id v10 = [v9 CGColor];
  double v11 = [(UIButton *)self->_installButton layer];
  [v11 setBorderColor:v10];
}

+ (id)_cachedInstalledProgressByAppID
{
  if (qword_1E778 != -1) {
    dispatch_once(&qword_1E778, &stru_188F0);
  }
  v2 = (void *)qword_1E770;

  return v2;
}

+ (id)_cachedInstallStateByAppID
{
  if (qword_1E788 != -1) {
    dispatch_once(&qword_1E788, &stru_18910);
  }
  v2 = (void *)qword_1E780;

  return v2;
}

+ (id)_iconCache
{
  if (qword_1E798 != -1) {
    dispatch_once(&qword_1E798, &stru_18930);
  }
  v2 = (void *)qword_1E790;

  return v2;
}

- (void)watchAppAvailability:(id)a3 appInstallStateDidChange:(int64_t)a4
{
  id v7 = a3;
  _HKInitializeLogging();
  float v8 = (void *)HKLogDefault;
  if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = NSStringFromSelector(a2);
    double v11 = +[NSNumber numberWithInteger:a4];
    id v12 = [v7 bundleID];
    int v19 = 138544130;
    id v20 = self;
    __int16 v21 = 2114;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    double v24 = v11;
    __int16 v25 = 2112;
    double v26 = v12;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> App install state did change(%@) for app with bundle identifier(%@)", (uint8_t *)&v19, 0x2Au);
  }
  double v13 = [(id)objc_opt_class() _cachedInstallStateByAppID];
  double v14 = +[NSNumber numberWithInteger:a4];
  __int16 v15 = [v7 bundleID];
  [v13 setObject:v14 forKey:v15];

  if (a4 != 1)
  {
    double v16 = [(id)objc_opt_class() _cachedInstalledProgressByAppID];
    __int16 v17 = [v7 bundleID];
    [v16 removeObjectForKey:v17];
  }
  unsigned int v18 = [v7 bundleID];
  [(HPRFApplicationLinkCell *)self updateUIWithInstallState:a4 forBundleID:v18];

  [(HPRFApplicationLinkCell *)self setNeedsLayout];
}

- (void)watchAppAvailability:(id)a3 appInstallProgressDidUpdate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  _HKInitializeLogging();
  id v9 = (void *)HKLogDefault;
  if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    double v11 = NSStringFromSelector(a2);
    id v12 = [v7 bundleID];
    int v16 = 138544130;
    __int16 v17 = self;
    __int16 v18 = 2114;
    int v19 = v11;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    __int16 v23 = v12;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> App install progress did change(%@) for app with bundle identifier(%@)", (uint8_t *)&v16, 0x2Au);
  }
  double v13 = [(id)objc_opt_class() _cachedInstalledProgressByAppID];
  double v14 = [v7 bundleID];
  [v13 setObject:v8 forKey:v14];

  __int16 v15 = [v7 bundleID];
  [(HPRFApplicationLinkCell *)self updateProgressUIForBundleID:v15];

  [(HPRFApplicationLinkCell *)self setNeedsLayout];
}

- (id)blankIcon
{
  double v3 = [(HPRFApplicationLinkCell *)self getLazyIconID];
  double v4 = [(id)objc_opt_class() _iconCache];
  id v5 = [v4 objectForKey:v3];

  if (!v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)HPRFApplicationLinkCell;
    id v5 = [(HPRFApplicationLinkCell *)&v11 blankIcon];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier]);
  id v7 = [WeakRetained propertyForKey:PSIconImageShouldFlipForRightToLeftKey];
  unsigned int v8 = [v7 BOOLValue];

  if (v8)
  {
    uint64_t v9 = [v5 imageFlippedForRightToLeftLayoutDirection];

    id v5 = (void *)v9;
  }

  return v5;
}

- (id)getLazyIcon
{
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x3032000000;
  double v26 = sub_DAC4;
  __int16 v27 = sub_DAD4;
  id v28 = 0;
  v2 = [(HPRFApplicationLinkCell *)self getLazyIconID];
  if (v2)
  {
    double v3 = [(id)objc_opt_class() _iconCache];
    uint64_t v4 = [v3 objectForKey:v2];
    id v5 = (void *)v24[5];
    v24[5] = v4;

    id v6 = (void *)v24[5];
    if (!v6)
    {
      dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
      unsigned int v8 = +[NanoResourceGrabber sharedInstance];
      uint64_t v9 = +[UIScreen mainScreen];
      id v10 = [v9 traitCollection];
      [v10 displayScale];
      if (v11 <= 2.0) {
        uint64_t v12 = 47;
      }
      else {
        uint64_t v12 = 48;
      }
      __int16 v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      int v19 = sub_DADC;
      __int16 v20 = &unk_18958;
      __int16 v22 = &v23;
      double v13 = v7;
      id v21 = v13;
      [v8 getIconForBundleID:v2 iconVariant:v12 block:&v17 timeout:60.0];

      dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
      if (v24[5])
      {
        double v14 = objc_msgSend((id)objc_opt_class(), "_iconCache", v17, v18, v19, v20);
        [v14 setObject:v24[5] forKey:v2];
      }
      id v6 = (void *)v24[5];
    }
    id v15 = v6;
  }
  else
  {
    id v15 = 0;
  }

  _Block_object_dispose(&v23, 8);

  return v15;
}

+ (id)reuseIdentifierForClassAndType:(int64_t)a3
{
  double v3 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v3);
}

- (UIButton)installButton
{
  return self->_installButton;
}

- (void)setInstallButton:(id)a3
{
}

- (HPRFInstallSpinnerButton)installSpinnerButton
{
  return self->_installSpinnerButton;
}

- (void)setInstallSpinnerButton:(id)a3
{
}

- (UIColor)enabledColor
{
  return self->_enabledColor;
}

- (void)setEnabledColor:(id)a3
{
}

- (UIColor)disabledColor
{
  return self->_disabledColor;
}

- (void)setDisabledColor:(id)a3
{
}

- (HKWatchAppAvailability)watchAppAvailability
{
  return self->_watchAppAvailability;
}

- (void)setWatchAppAvailability:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchAppAvailability, 0);
  objc_storeStrong((id *)&self->_disabledColor, 0);
  objc_storeStrong((id *)&self->_enabledColor, 0);
  objc_storeStrong((id *)&self->_installSpinnerButton, 0);

  objc_storeStrong((id *)&self->_installButton, 0);
}

@end