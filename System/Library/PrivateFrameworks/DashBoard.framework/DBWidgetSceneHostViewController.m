@interface DBWidgetSceneHostViewController
- (BOOL)isActive;
- (BOOL)isForeground;
- (BOOL)usesHostContextSnapshotting;
- (BOOL)widgetSceneIsPersistent;
- (CGRect)sceneFrame;
- (DBWidgetSceneHostViewController)initWithApplication:(id)a3 proxyApplication:(id)a4 environment:(id)a5;
- (DBWidgetSceneHostViewControllerDelegate)delegate;
- (NSString)sceneIdentifierSuffix;
- (OS_xpc_object)widgetWindowServiceEndpoint;
- (UIEdgeInsets)sceneSafeAreaInsets;
- (id)sceneIdentifier;
- (id)sceneSpecification;
- (id)workspaceIdentifier;
- (unint64_t)widgetStyle;
- (void)_performSceneUpdateForeground:(BOOL)a3;
- (void)initializeSceneForeground:(BOOL)a3 active:(BOOL)a4;
- (void)processMonitor:(id)a3 didHandleDeathOfBundleIdentifier:(id)a4;
- (void)processMonitor:(id)a3 shouldHandleDeathOfBundleIdentifier:(id)a4 isCrash:(BOOL)a5;
- (void)sceneContentStateDidUpdate:(int64_t)a3;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setForeground:(BOOL)a3;
- (void)setSceneIdentifierSuffix:(id)a3;
- (void)setWidgetSceneIsPersistent:(BOOL)a3;
- (void)setWidgetStyle:(unint64_t)a3;
- (void)setWidgetWindowServiceEndpoint:(id)a3;
- (void)updateSceneFrame:(CGRect)a3 animationSettings:(id)a4 fenceHandle:(id)a5;
@end

@implementation DBWidgetSceneHostViewController

- (DBWidgetSceneHostViewController)initWithApplication:(id)a3 proxyApplication:(id)a4 environment:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)DBWidgetSceneHostViewController;
  result = [(DBSceneHostViewController *)&v6 initWithApplication:a3 proxyApplication:a4 environment:a5];
  if (result) {
    result->_widgetSceneIsPersistent = 1;
  }
  return result;
}

- (void)setForeground:(BOOL)a3
{
  if (self->_foreground != a3)
  {
    self->_foreground = a3;
    -[DBWidgetSceneHostViewController _performSceneUpdateForeground:](self, "_performSceneUpdateForeground:");
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    uint64_t v3 = 128;
    if (a3) {
      uint64_t v3 = 0;
    }
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __45__DBWidgetSceneHostViewController_setActive___block_invoke;
    v4[3] = &__block_descriptor_40_e50_v16__0__UIMutableCarPlayApplicationSceneSettings_8l;
    v4[4] = v3;
    [(DBSceneHostViewController *)self updateSceneSettingsWithBlock:v4];
  }
}

uint64_t __45__DBWidgetSceneHostViewController_setActive___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDeactivationReasons:*(void *)(a1 + 32)];
}

- (void)setWidgetStyle:(unint64_t)a3
{
  if (self->_widgetStyle != a3)
  {
    self->_widgetStyle = a3;
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __50__DBWidgetSceneHostViewController_setWidgetStyle___block_invoke;
    v3[3] = &__block_descriptor_40_e50_v16__0__UIMutableCarPlayApplicationSceneSettings_8l;
    v3[4] = a3;
    [(DBSceneHostViewController *)self updateSceneSettingsWithBlock:v3];
  }
}

void __50__DBWidgetSceneHostViewController_setWidgetStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v5 = v3;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v5;
  }
  else {
    id v4 = 0;
  }

  [v4 setWidgetStyle:*(void *)(a1 + 32)];
}

- (void)initializeSceneForeground:(BOOL)a3 active:(BOOL)a4
{
  self->_foreground = a3;
  self->_active = a4;
  -[DBWidgetSceneHostViewController _performSceneUpdateForeground:](self, "_performSceneUpdateForeground:");
}

- (void)updateSceneFrame:(CGRect)a3 animationSettings:(id)a4 fenceHandle:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  v13 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = [(DBWidgetSceneHostViewController *)self sceneIdentifier];
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    v17 = NSStringFromCGRect(v36);
    *(_DWORD *)buf = 138544130;
    v28 = v15;
    __int16 v29 = 2114;
    v30 = v16;
    __int16 v31 = 2112;
    v32 = v17;
    __int16 v33 = 2112;
    id v34 = v11;
    _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating frame for widget scene: %{public}@, to %@, with animation settings: %@", buf, 0x2Au);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __82__DBWidgetSceneHostViewController_updateSceneFrame_animationSettings_fenceHandle___block_invoke;
  v20[3] = &unk_2649B4438;
  CGFloat v23 = x;
  CGFloat v24 = y;
  CGFloat v25 = width;
  CGFloat v26 = height;
  id v21 = v12;
  id v22 = v11;
  id v18 = v11;
  id v19 = v12;
  [(DBSceneHostViewController *)self updateSceneSettingsWithTransitionBlock:v20];
}

void __82__DBWidgetSceneHostViewController_updateSceneFrame_animationSettings_fenceHandle___block_invoke(double *a1, void *a2, void *a3)
{
  double v5 = a1[6];
  double v6 = a1[7];
  double v7 = a1[8];
  double v8 = a1[9];
  id v9 = a3;
  objc_msgSend(a2, "setFrame:", v5, v6, v7, v8);
  [v9 setAnimationFence:*((void *)a1 + 4)];
  [v9 setAnimationSettings:*((void *)a1 + 5)];
}

- (id)sceneIdentifier
{
  id v3 = [(DBSceneHostViewController *)self environment];
  id v4 = [v3 environmentConfiguration];
  double v5 = [v4 displayIdentity];

  double v6 = [(DBSceneHostViewController *)self proxyApplication];

  double v7 = NSString;
  if (v6)
  {
    double v8 = [(DBSceneHostViewController *)self proxyApplication];
    id v9 = [v8 bundleIdentifier];
    v10 = [(DBSceneHostViewController *)self application];
    id v11 = [v10 bundleIdentifier];
    id v12 = [(DBWidgetSceneHostViewController *)self sceneIdentifierSuffix];
    v13 = [v7 stringWithFormat:@"%@:%@:%@%@", v5, v9, v11, v12];
  }
  else
  {
    double v8 = [(DBSceneHostViewController *)self application];
    id v9 = [v8 bundleIdentifier];
    v10 = [(DBWidgetSceneHostViewController *)self sceneIdentifierSuffix];
    v13 = [v7 stringWithFormat:@"%@:%@%@", v5, v9, v10];
  }

  return v13;
}

- (id)workspaceIdentifier
{
  return @"com.apple.DashBoard.scene-workspace.widget";
}

- (id)sceneSpecification
{
  v2 = [(DBSceneHostViewController *)self proxyApplication];

  id v3 = (Class *)0x263F314E8;
  if (v2) {
    id v3 = (Class *)0x263F315A0;
  }
  id v4 = objc_alloc_init(*v3);
  return v4;
}

- (BOOL)usesHostContextSnapshotting
{
  return 1;
}

- (CGRect)sceneFrame
{
  v2 = [(DBWidgetSceneHostViewController *)self view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (UIEdgeInsets)sceneSafeAreaInsets
{
  double v2 = *MEMORY[0x263F834E8];
  double v3 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v4 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v5 = *(double *)(MEMORY[0x263F834E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)sceneContentStateDidUpdate:(int64_t)a3
{
  id v5 = [(DBWidgetSceneHostViewController *)self delegate];
  [v5 widgetSceneHostViewController:self sceneContentStateDidUpdate:a3];
}

- (void)processMonitor:(id)a3 shouldHandleDeathOfBundleIdentifier:(id)a4 isCrash:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DBWidgetSceneHostViewController;
  [(DBSceneHostViewController *)&v18 processMonitor:a3 shouldHandleDeathOfBundleIdentifier:v8 isCrash:v5];
  double v9 = [(DBSceneHostViewController *)self application];
  double v10 = [v9 bundleIdentifier];
  if ([v8 isEqualToString:v10])
  {
  }
  else
  {
    double v11 = [(DBSceneHostViewController *)self proxyApplication];
    double v12 = [v11 bundleIdentifier];
    int v13 = [v8 isEqualToString:v12];

    if (!v13) {
      goto LABEL_7;
    }
  }
  double v14 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543362;
    v20 = v16;
    _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dead process is current widget target identifier, pausing persistence.", buf, 0xCu);
  }
  [(DBWidgetSceneHostViewController *)self setWidgetSceneIsPersistent:0];
  v17 = [(DBWidgetSceneHostViewController *)self delegate];
  [v17 widgetSceneHostViewControllerSceneWillInvalidate:self];

  [(DBSceneHostViewController *)self invalidateScene];
LABEL_7:
}

- (void)processMonitor:(id)a3 didHandleDeathOfBundleIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DBWidgetSceneHostViewController;
  [(DBSceneHostViewController *)&v15 processMonitor:a3 didHandleDeathOfBundleIdentifier:v6];
  double v7 = [(DBSceneHostViewController *)self application];
  id v8 = [v7 bundleIdentifier];
  if ([v6 isEqualToString:v8])
  {
  }
  else
  {
    double v9 = [(DBSceneHostViewController *)self proxyApplication];
    double v10 = [v9 bundleIdentifier];
    int v11 = [v6 isEqualToString:v10];

    if (!v11) {
      goto LABEL_7;
    }
  }
  double v12 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = (objc_class *)objc_opt_class();
    double v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543362;
    v17 = v14;
    _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dead process was current widget target identifier, resuming persistence.", buf, 0xCu);
  }
  [(DBWidgetSceneHostViewController *)self setWidgetSceneIsPersistent:1];
  [(DBWidgetSceneHostViewController *)self _performSceneUpdateForeground:[(DBWidgetSceneHostViewController *)self isForeground]];
LABEL_7:
}

- (void)_performSceneUpdateForeground:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__DBWidgetSceneHostViewController__performSceneUpdateForeground___block_invoke;
  v3[3] = &unk_2649B4460;
  v3[4] = self;
  BOOL v4 = a3;
  [(DBSceneHostViewController *)self performSceneUpdateWithBlock:v3 completion:0];
}

uint64_t __65__DBWidgetSceneHostViewController__performSceneUpdateForeground___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isActive]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 128;
  }
  [v3 setDeactivationReasons:v4];
  objc_opt_class();
  id v5 = v3;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  objc_msgSend(v6, "setWidgetStyle:", objc_msgSend(*(id *)(a1 + 32), "widgetStyle"));
  double v7 = [*(id *)(a1 + 32) widgetWindowServiceEndpoint];
  [v6 setEndpoint:v7];

  id v8 = [*(id *)(a1 + 32) proxyApplication];

  if (v8)
  {
    objc_opt_class();
    id v9 = v6;
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    int v11 = [*(id *)(a1 + 32) application];
    double v12 = [v11 bundleIdentifier];
    [v10 setProxiedApplicationBundleIdentifier:v12];
  }
  uint64_t v13 = *(unsigned __int8 *)(a1 + 40);

  return v13;
}

- (DBWidgetSceneHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DBWidgetSceneHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isForeground
{
  return self->_foreground;
}

- (BOOL)isActive
{
  return self->_active;
}

- (unint64_t)widgetStyle
{
  return self->_widgetStyle;
}

- (NSString)sceneIdentifierSuffix
{
  return self->_sceneIdentifierSuffix;
}

- (void)setSceneIdentifierSuffix:(id)a3
{
}

- (OS_xpc_object)widgetWindowServiceEndpoint
{
  return self->_widgetWindowServiceEndpoint;
}

- (void)setWidgetWindowServiceEndpoint:(id)a3
{
}

- (BOOL)widgetSceneIsPersistent
{
  return self->_widgetSceneIsPersistent;
}

- (void)setWidgetSceneIsPersistent:(BOOL)a3
{
  self->_widgetSceneIsPersistent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetWindowServiceEndpoint, 0);
  objc_storeStrong((id *)&self->_sceneIdentifierSuffix, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end