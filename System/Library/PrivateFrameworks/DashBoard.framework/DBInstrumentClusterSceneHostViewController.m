@interface DBInstrumentClusterSceneHostViewController
- (BOOL)isVisible;
- (BOOL)usesHostContextSnapshotting;
- (CGRect)_scaleFrameIfNecessary:(CGRect)a3;
- (CGRect)layoutFrame;
- (CGRect)sceneFrame;
- (DBInstrumentClusterSceneHostViewController)initWithApplication:(id)a3 proxyApplication:(id)a4 environment:(id)a5 layoutFrame:(CGRect)a6 safeAreaInsets:(UIEdgeInsets)a7;
- (UIEdgeInsets)_scaleSafeAreaInsetsIfNecessary:(UIEdgeInsets)a3;
- (UIEdgeInsets)safeAreaInsets;
- (UIEdgeInsets)sceneSafeAreaInsets;
- (id)sceneIdentifier;
- (id)sceneSpecification;
- (id)workspaceIdentifier;
- (int64_t)sceneInterfaceStyle;
- (int64_t)sceneMapInterfaceStyle;
- (void)backgroundScene;
- (void)backgroundSceneWithFence:(id)a3;
- (void)foregroundSceneWithURL:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)stopHostingScene;
- (void)updateSceneWithAnimationSettings:(id)a3;
@end

@implementation DBInstrumentClusterSceneHostViewController

- (DBInstrumentClusterSceneHostViewController)initWithApplication:(id)a3 proxyApplication:(id)a4 environment:(id)a5 layoutFrame:(CGRect)a6 safeAreaInsets:(UIEdgeInsets)a7
{
  CGFloat right = a7.right;
  CGFloat bottom = a7.bottom;
  CGFloat left = a7.left;
  CGFloat top = a7.top;
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)DBInstrumentClusterSceneHostViewController;
  result = [(DBSceneHostViewController *)&v16 initWithApplication:a3 proxyApplication:a4 environment:a5];
  if (result)
  {
    result->_layoutFrame.origin.CGFloat x = x;
    result->_layoutFrame.origin.CGFloat y = y;
    result->_layoutFrame.size.CGFloat width = width;
    result->_layoutFrame.size.CGFloat height = height;
    result->_safeAreaInsets.CGFloat top = top;
    result->_safeAreaInsets.CGFloat left = left;
    result->_safeAreaInsets.CGFloat bottom = bottom;
    result->_safeAreaInsets.CGFloat right = right;
  }
  return result;
}

- (void)foregroundSceneWithURL:(id)a3
{
  id v4 = a3;
  [(DBInstrumentClusterSceneHostViewController *)self setVisible:1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__DBInstrumentClusterSceneHostViewController_foregroundSceneWithURL___block_invoke;
  v6[3] = &unk_2649B5628;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [(DBSceneHostViewController *)self performSceneUpdateWithBlock:v6 completion:0];
}

uint64_t __69__DBInstrumentClusterSceneHostViewController_foregroundSceneWithURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = DBLogForCategory(8uLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = [*(id *)(a1 + 40) sceneIdentifier];
      uint64_t v12 = *(void *)(a1 + 32);
      int v22 = 138543874;
      v23 = v10;
      __int16 v24 = 2114;
      v25 = v11;
      __int16 v26 = 2112;
      uint64_t v27 = v12;
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Foregrounding instrument cluster scene (%{public}@) with URL: %@", (uint8_t *)&v22, 0x20u);
    }
    +[DBInstrumentClusterURLHandler applySettingsForClusterURL:*(void *)(a1 + 32) toSceneSettings:v5];
  }
  else
  {
    if (v8)
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = [*(id *)(a1 + 40) sceneIdentifier];
      int v22 = 138543618;
      v23 = v14;
      __int16 v24 = 2114;
      v25 = v15;
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Foregrounding instrument cluster scene (%{public}@) without URL", (uint8_t *)&v22, 0x16u);
    }
  }
  objc_super v16 = [*(id *)(a1 + 40) proxyApplication];

  if (v16)
  {
    objc_opt_class();
    id v17 = v5;
    if (v17 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    v19 = [*(id *)(a1 + 40) application];
    v20 = [v19 bundleIdentifier];
    [v18 setProxiedApplicationBundleIdentifier:v20];
  }
  return 1;
}

- (void)updateSceneWithAnimationSettings:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__DBInstrumentClusterSceneHostViewController_updateSceneWithAnimationSettings___block_invoke;
  v6[3] = &unk_2649B5650;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(DBSceneHostViewController *)self updateSceneSettingsWithTransitionBlock:v6];
}

void __79__DBInstrumentClusterSceneHostViewController_updateSceneWithAnimationSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v8 = a3;
  id v6 = a2;
  [v5 sceneFrame];
  objc_msgSend(v6, "setFrame:");
  [*(id *)(a1 + 32) sceneSafeAreaInsets];
  objc_msgSend(v6, "setSafeAreaInsetsPortrait:");

  id v7 = [MEMORY[0x263F82E90] _synchronizedDrawingFence];
  [v8 setAnimationFence:v7];

  [v8 setAnimationSettings:*(void *)(a1 + 40)];
}

- (void)backgroundScene
{
}

- (void)backgroundSceneWithFence:(id)a3
{
  id v4 = a3;
  [(DBInstrumentClusterSceneHostViewController *)self setVisible:0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__DBInstrumentClusterSceneHostViewController_backgroundSceneWithFence___block_invoke;
  v6[3] = &unk_2649B4598;
  id v7 = v4;
  id v5 = v4;
  [(DBSceneHostViewController *)self performSceneUpdateWithBlock:v6 completion:0];
}

uint64_t __71__DBInstrumentClusterSceneHostViewController_backgroundSceneWithFence___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return 0;
}

- (void)stopHostingScene
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  [(DBInstrumentClusterSceneHostViewController *)self setVisible:0];
  id v3 = DBLogForCategory(8uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    id v6 = [(DBInstrumentClusterSceneHostViewController *)self sceneIdentifier];
    int v7 = 138543618;
    id v8 = v5;
    __int16 v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_INFO, "[%{public}@] Will stop hosting instrument cluster scene: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(DBSceneHostViewController *)self invalidateScenePresenter];
}

- (id)sceneIdentifier
{
  id v3 = [(DBSceneHostViewController *)self environment];
  id v4 = [v3 environmentConfiguration];
  id v5 = [v4 displayIdentity];

  id v6 = [(DBSceneHostViewController *)self proxyApplication];

  int v7 = NSString;
  if (v6)
  {
    id v8 = [(DBSceneHostViewController *)self proxyApplication];
    __int16 v9 = [v8 bundleIdentifier];
    v10 = [(DBSceneHostViewController *)self application];
    uint64_t v11 = [v10 bundleIdentifier];
    uint64_t v12 = [v7 stringWithFormat:@"%@:%@:%@:cluster", v5, v9, v11];
  }
  else
  {
    id v8 = [(DBSceneHostViewController *)self application];
    __int16 v9 = [v8 bundleIdentifier];
    uint64_t v12 = [v7 stringWithFormat:@"%@:%@:cluster", v5, v9];
  }

  return v12;
}

- (id)workspaceIdentifier
{
  return @"com.apple.DashBoard.scene-workspace.cluster";
}

- (id)sceneSpecification
{
  v2 = [(DBSceneHostViewController *)self proxyApplication];

  id v3 = (Class *)0x263F31500;
  if (v2) {
    id v3 = (Class *)0x263F315B0;
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
  [(DBInstrumentClusterSceneHostViewController *)self layoutFrame];
  if (CGRectEqualToRect(v26, *MEMORY[0x263F001A8]))
  {
    id v3 = [(DBSceneHostViewController *)self application];
    int v4 = [v3 presentsFullScreen];

    id v5 = [(DBSceneHostViewController *)self environment];
    id v6 = [v5 environmentConfiguration];
    int v7 = v6;
    if (v4)
    {
      id v8 = [v6 displayConfiguration];
      [v8 bounds];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
    }
    else
    {
      [v6 currentViewAreaFrame];
      double v14 = v19;
      double v16 = v20;

      double v10 = *MEMORY[0x263F00148];
      double v12 = *(double *)(MEMORY[0x263F00148] + 8);
    }
  }
  else
  {
    double v10 = *MEMORY[0x263F00148];
    double v12 = *(double *)(MEMORY[0x263F00148] + 8);
    [(DBInstrumentClusterSceneHostViewController *)self layoutFrame];
    double v14 = v17;
    double v16 = v18;
  }
  -[DBInstrumentClusterSceneHostViewController _scaleFrameIfNecessary:](self, "_scaleFrameIfNecessary:", v10, v12, v14, v16);
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (UIEdgeInsets)sceneSafeAreaInsets
{
  [(DBInstrumentClusterSceneHostViewController *)self safeAreaInsets];
  if (v6 == *(double *)(MEMORY[0x263F834E8] + 8)
    && v3 == *MEMORY[0x263F834E8]
    && v5 == *(double *)(MEMORY[0x263F834E8] + 24)
    && v4 == *(double *)(MEMORY[0x263F834E8] + 16))
  {
    double v14 = [(DBSceneHostViewController *)self environment];
    double v15 = [v14 environmentConfiguration];
    [v15 currentViewAreaSafeAreaInsets];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    double v10 = v17;
    double v11 = v19;
    double v12 = v21;
    double v13 = v23;
  }
  else
  {
    [(DBInstrumentClusterSceneHostViewController *)self safeAreaInsets];
    -[DBInstrumentClusterSceneHostViewController _scaleSafeAreaInsetsIfNecessary:](self, "_scaleSafeAreaInsetsIfNecessary:");
  }
  result.CGFloat right = v13;
  result.CGFloat bottom = v12;
  result.CGFloat left = v11;
  result.CGFloat top = v10;
  return result;
}

- (int64_t)sceneInterfaceStyle
{
  double v3 = [(DBSceneHostViewController *)self environment];
  double v4 = [v3 environmentConfiguration];
  char v5 = [v4 supportsDisplayPlugin];

  if (v5) {
    return 2;
  }
  int v7 = [(DBSceneHostViewController *)self environment];
  id v8 = [v7 environmentConfiguration];
  int64_t v9 = [v8 carUserInterfaceStyle];

  return v9;
}

- (int64_t)sceneMapInterfaceStyle
{
  double v3 = [(DBSceneHostViewController *)self environment];
  double v4 = [v3 environmentConfiguration];
  char v5 = [v4 supportsDisplayPlugin];

  if (v5) {
    return 2;
  }
  int v7 = [(DBSceneHostViewController *)self environment];
  id v8 = [v7 environmentConfiguration];
  int64_t v9 = [v8 effectiveMapsUserInterfaceStyle];

  return v9;
}

- (CGRect)_scaleFrameIfNecessary:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = [(DBSceneHostViewController *)self environment];
  int64_t v9 = [v8 environmentConfiguration];
  if ([v9 supportsDisplayPlugin])
  {
    double v10 = [(DBSceneHostViewController *)self application];
    if ([v10 supportsInstrumentClusterNavigation])
    {
    }
    else
    {
      double v11 = [(DBSceneHostViewController *)self application];
      double v12 = [v11 bundleIdentifier];
      int v13 = [v12 isEqualToString:@"com.apple.CarRadio"];

      if (!v13) {
        goto LABEL_9;
      }
    }
    double v14 = DBLogForCategory(8uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = (objc_class *)objc_opt_class();
      double v16 = NSStringFromClass(v15);
      double v17 = [(DBInstrumentClusterSceneHostViewController *)self sceneIdentifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v16;
      __int16 v29 = 2112;
      v30 = v17;
      _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] scaling frame for cluster navigation app with scene ID: %@", buf, 0x16u);
    }
    double v18 = [(DBSceneHostViewController *)self environment];
    double v19 = [v18 environmentConfiguration];
    [v19 screenScale];
    CGFloat v21 = 1.0 / v20;

    CGAffineTransformMakeScale(&v26, v21, v21);
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    CGRect v33 = CGRectApplyAffineTransform(v32, &v26);
    CGFloat x = v33.origin.x;
    CGFloat y = v33.origin.y;
    CGFloat width = v33.size.width;
    CGFloat height = v33.size.height;
  }
  else
  {
  }
LABEL_9:
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (UIEdgeInsets)_scaleSafeAreaInsetsIfNecessary:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = [(DBSceneHostViewController *)self environment];
  int64_t v9 = [v8 environmentConfiguration];
  if ([v9 supportsDisplayPlugin])
  {
    double v10 = [(DBSceneHostViewController *)self application];
    if ([v10 supportsInstrumentClusterNavigation])
    {
    }
    else
    {
      double v11 = [(DBSceneHostViewController *)self application];
      double v12 = [v11 bundleIdentifier];
      int v13 = [v12 isEqualToString:@"com.apple.CarRadio"];

      if (!v13) {
        goto LABEL_9;
      }
    }
    double v14 = DBLogForCategory(8uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = (objc_class *)objc_opt_class();
      double v16 = NSStringFromClass(v15);
      double v17 = [(DBInstrumentClusterSceneHostViewController *)self sceneIdentifier];
      int v30 = 138543618;
      uint64_t v31 = v16;
      __int16 v32 = 2112;
      CGRect v33 = v17;
      _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] scaling safe area insets for cluster navigation app with scene ID ID: %@", (uint8_t *)&v30, 0x16u);
    }
    double v18 = [(DBSceneHostViewController *)self environment];
    double v19 = [v18 environmentConfiguration];
    [v19 screenScale];
    double v21 = 1.0 / v20;

    [(DBInstrumentClusterSceneHostViewController *)self safeAreaInsets];
    double top = v21 * v22;
    [(DBInstrumentClusterSceneHostViewController *)self safeAreaInsets];
    double left = v21 * v23;
    [(DBInstrumentClusterSceneHostViewController *)self safeAreaInsets];
    double bottom = v21 * v24;
    [(DBInstrumentClusterSceneHostViewController *)self safeAreaInsets];
    double right = v21 * v25;
  }
  else
  {
  }
LABEL_9:
  double v26 = top;
  double v27 = left;
  double v28 = bottom;
  double v29 = right;
  result.double right = v29;
  result.double bottom = v28;
  result.double left = v27;
  result.double top = v26;
  return result;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (CGRect)layoutFrame
{
  double x = self->_layoutFrame.origin.x;
  double y = self->_layoutFrame.origin.y;
  double width = self->_layoutFrame.size.width;
  double height = self->_layoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top = self->_safeAreaInsets.top;
  double left = self->_safeAreaInsets.left;
  double bottom = self->_safeAreaInsets.bottom;
  double right = self->_safeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

@end