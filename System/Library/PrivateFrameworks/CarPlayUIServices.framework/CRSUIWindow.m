@interface CRSUIWindow
+ (id)_stringForStyle:(int64_t)a3;
- (CRSUIApplicationSceneSettingsDiffInspector)settingsDiffInspector;
- (CRSUIWindow)initWithWindowScene:(id)a3;
- (NSLayoutConstraint)heightConstraint;
- (UILayoutGuide)notificationLayoutGuide;
- (double)bannerHeight;
- (id)_mapSettings;
- (id)_settings;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)_setMapStyle:(int64_t)a3;
- (void)_updateMapStyleTrait;
- (void)commonInit;
- (void)setBannerHeight:(double)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setSettingsDiffInspector:(id)a3;
@end

@implementation CRSUIWindow

- (CRSUIWindow)initWithWindowScene:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRSUIWindow;
  v3 = [(CRSUIWindow *)&v6 initWithWindowScene:a3];
  v4 = v3;
  if (v3) {
    [(CRSUIWindow *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  v38[4] = *MEMORY[0x263EF8340];
  v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
  notificationLayoutGuide = self->_notificationLayoutGuide;
  self->_notificationLayoutGuide = v3;

  [(CRSUIWindow *)self addLayoutGuide:self->_notificationLayoutGuide];
  v5 = [(UILayoutGuide *)self->_notificationLayoutGuide heightAnchor];
  id obj = [v5 constraintEqualToConstant:0.0];

  objc_storeStrong((id *)&self->_heightConstraint, obj);
  v25 = (void *)MEMORY[0x263F08938];
  v38[0] = obj;
  v26 = [(CRSUIWindow *)self leftAnchor];
  objc_super v6 = [(UILayoutGuide *)self->_notificationLayoutGuide leftAnchor];
  v7 = [v26 constraintEqualToAnchor:v6];
  v38[1] = v7;
  v8 = [(CRSUIWindow *)self bottomAnchor];
  v9 = [(UILayoutGuide *)self->_notificationLayoutGuide bottomAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v38[2] = v10;
  v11 = [(CRSUIWindow *)self rightAnchor];
  v12 = [(UILayoutGuide *)self->_notificationLayoutGuide rightAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v38[3] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:4];
  [v25 activateConstraints:v14];

  v15 = objc_alloc_init(CRSUIApplicationSceneSettingsDiffInspector);
  settingsDiffInspector = self->_settingsDiffInspector;
  self->_settingsDiffInspector = v15;

  objc_initWeak(&location, self);
  v17 = self->_settingsDiffInspector;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __25__CRSUIWindow_commonInit__block_invoke;
  v30[3] = &unk_264307E00;
  objc_copyWeak(&v31, &location);
  [(CRSUIApplicationSceneSettingsDiffInspector *)v17 observeBannerFrameWithBlock:v30];
  v18 = self->_settingsDiffInspector;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __25__CRSUIWindow_commonInit__block_invoke_2;
  v28[3] = &unk_264307E00;
  objc_copyWeak(&v29, &location);
  [(CRSUIApplicationSceneSettingsDiffInspector *)v18 observeMapStyleWithBlock:v28];
  v19 = [(CRSUIWindow *)self windowScene];
  v37 = self;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
  [v19 _registerSettingsDiffActionArray:v20 forKey:@"bannerFrameObserver"];

  v21 = [(CRSUIWindow *)self _mapSettings];
  uint64_t v22 = [v21 mapStyle];

  v23 = [(id)objc_opt_class() _stringForStyle:v22];
  v24 = CRSUILogForCategory(4uLL);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v34 = self;
    __int16 v35 = 2114;
    v36 = v23;
    _os_log_impl(&dword_21817A000, v24, OS_LOG_TYPE_DEFAULT, "Initial map style for: %{public}@ is: %{public}@", buf, 0x16u);
  }

  [(CRSUIWindow *)self _setMapStyle:v22];
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __25__CRSUIWindow_commonInit__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained _settings];
  [v1 bannerHeight];
  double v3 = v2;
  [WeakRetained bannerHeight];
  if (v4 != v3)
  {
    [WeakRetained setBannerHeight:v3];
    v5 = [WeakRetained heightConstraint];
    [v5 setConstant:v3];

    [WeakRetained notificationLayoutGuideDidChange];
  }
}

void __25__CRSUIWindow_commonInit__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateMapStyleTrait];
}

- (void)_setMapStyle:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = [(id)objc_opt_class() _stringForStyle:a3];
  objc_super v6 = CRSUILogForCategory(4uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    v14 = self;
    __int16 v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_21817A000, v6, OS_LOG_TYPE_DEFAULT, "Updating map style for %{public}@, to style: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  v7 = objc_msgSend(MEMORY[0x263F1CB00], "crsui_traitCollectionWithMapStyle:", a3);
  [(CRSUIWindow *)self _setLocalOverrideTraitCollection:v7];
  v8 = objc_opt_class();
  v9 = [(CRSUIWindow *)self traitCollection];
  v10 = objc_msgSend(v8, "_stringForStyle:", objc_msgSend(v9, "crsui_mapStyle"));

  v11 = CRSUILogForCategory(4uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    v14 = self;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_21817A000, v11, OS_LOG_TYPE_DEFAULT, "Trait collection for %{public}@, is style: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 postNotificationName:@"CRSUIWindowMapStyleChangedNotification" object:self];
}

- (void)_updateMapStyleTrait
{
  double v3 = [(CRSUIWindow *)self _mapSettings];
  uint64_t v4 = [v3 mapStyle];

  [(CRSUIWindow *)self _setMapStyle:v4];
}

- (id)_settings
{
  objc_opt_class();
  double v3 = [(CRSUIWindow *)self windowScene];
  uint64_t v4 = [v3 _FBSScene];
  id v5 = [v4 settings];
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)_mapSettings
{
  double v2 = [(CRSUIWindow *)self windowScene];
  double v3 = [v2 _FBSScene];
  id v4 = [v3 settings];
  if ([v4 conformsToProtocol:&unk_26C941B80]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v9 = a5;
  id v10 = [(CRSUIWindow *)self settingsDiffInspector];
  [v10 inspectDiff:v9 withContext:0];
}

+ (id)_stringForStyle:(int64_t)a3
{
  double v3 = @"unknown";
  if (a3 == 1) {
    double v3 = @"light";
  }
  if (a3 == 2) {
    return @"dark";
  }
  else {
    return v3;
  }
}

- (UILayoutGuide)notificationLayoutGuide
{
  return self->_notificationLayoutGuide;
}

- (CRSUIApplicationSceneSettingsDiffInspector)settingsDiffInspector
{
  return self->_settingsDiffInspector;
}

- (void)setSettingsDiffInspector:(id)a3
{
}

- (double)bannerHeight
{
  return self->_bannerHeight;
}

- (void)setBannerHeight:(double)a3
{
  self->_bannerHeight = a3;
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_settingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_notificationLayoutGuide, 0);
}

@end