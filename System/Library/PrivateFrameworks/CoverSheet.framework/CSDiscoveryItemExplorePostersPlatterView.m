@interface CSDiscoveryItemExplorePostersPlatterView
- (BOOL)isAnimationPaused;
- (CALayer)rootAnimationLayer;
- (CAStateController)graphicStateController;
- (CSDiscoveryItemExplorePostersPlatterView)init;
- (CSDiscoveryItemExplorePostersPlatterViewDelegate)delegate;
- (void)_configureGraphicViewIfNecessary;
- (void)_pauseLayer:(id)a3;
- (void)_reconfigureGraphicView;
- (void)_resumeLayer:(id)a3;
- (void)layoutSubviews;
- (void)pauseAnimations;
- (void)resumeAnimations;
- (void)setAnimationPaused:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setGraphicStateController:(id)a3;
- (void)setRootAnimationLayer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CSDiscoveryItemExplorePostersPlatterView

- (CSDiscoveryItemExplorePostersPlatterView)init
{
  v20.receiver = self;
  v20.super_class = (Class)CSDiscoveryItemExplorePostersPlatterView;
  v2 = [(PLPlatterDiscoveryView *)&v20 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v4 = [v3 localizedStringForKey:@"DISCOVERY_LIST_ITEM_PLATTER_EXPLORE_POSTERS_TITLE" value:&stru_1F3020248 table:@"CoverSheet"];
    v5 = [v3 localizedStringForKey:@"DISCOVERY_LIST_ITEM_PLATTER_EXPLORE_POSTERS_BODY" value:&stru_1F3020248 table:@"CoverSheet"];
    [(PLPlatterDiscoveryView *)v2 setTitleText:v4];
    [(PLPlatterDiscoveryView *)v2 setBodyText:v5];
    v6 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Wallpaper"];
    objc_initWeak(&location, v2);
    v7 = (void *)MEMORY[0x1E4F426E8];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __48__CSDiscoveryItemExplorePostersPlatterView_init__block_invoke;
    v15 = &unk_1E6AD9B30;
    objc_copyWeak(&v18, &location);
    id v8 = v6;
    id v16 = v8;
    v9 = v2;
    v17 = v9;
    v10 = [v7 actionWithHandler:&v12];
    -[PLPlatterDiscoveryView setDefaultAction:](v9, "setDefaultAction:", v10, v12, v13, v14, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __48__CSDiscoveryItemExplorePostersPlatterView_init__block_invoke(id *a1)
{
  v2 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CSDiscoveryItemExplorePostersPlatterView_init__block_invoke_2;
  block[3] = &unk_1E6AD9368;
  objc_copyWeak(&v6, a1 + 6);
  id v4 = a1[4];
  id v5 = a1[5];
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __48__CSDiscoveryItemExplorePostersPlatterView_init__block_invoke_2(uint64_t a1)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *MEMORY[0x1E4F623A0];
  v14[0] = *MEMORY[0x1E4F62398];
  v14[1] = v5;
  v15[0] = MEMORY[0x1E4F1CC38];
  v15[1] = MEMORY[0x1E4F1CC38];
  v14[2] = *MEMORY[0x1E4F62390];
  v15[2] = @"CSDiscoveryItemAppLaunchOriginExplorePostersPlatterView";
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  id v13 = 0;
  int v7 = [v3 openSensitiveURL:v4 withOptions:v6 error:&v13];
  id v8 = v13;

  v9 = SBLogDashBoard();
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1D839D000, v10, OS_LOG_TYPE_DEFAULT, "ExplorePosters Launched URL", v12, 2u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __48__CSDiscoveryItemExplorePostersPlatterView_init__block_invoke_2_cold_1((uint64_t)v8, v10);
  }

  v11 = [*(id *)(a1 + 40) delegate];
  [v11 explorePostersPlatterViewWasTapped:WeakRetained];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CSDiscoveryItemExplorePostersPlatterView;
  [(PLPlatterDiscoveryView *)&v5 layoutSubviews];
  [(CSDiscoveryItemExplorePostersPlatterView *)self _configureGraphicViewIfNecessary];
  v3 = [(CSDiscoveryItemExplorePostersPlatterView *)self rootAnimationLayer];
  uint64_t v4 = [(PLPlatterDiscoveryView *)self graphicView];
  [v4 center];
  objc_msgSend(v3, "setPosition:");
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4 = [a3 userInterfaceStyle];
  objc_super v5 = [(CSDiscoveryItemExplorePostersPlatterView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  if (v4 != v6)
  {
    [(CSDiscoveryItemExplorePostersPlatterView *)self _reconfigureGraphicView];
  }
}

- (void)_reconfigureGraphicView
{
  [(PLPlatterDiscoveryView *)self setGraphicView:0];
  graphicStateController = self->_graphicStateController;
  self->_graphicStateController = 0;

  rootAnimationLayer = self->_rootAnimationLayer;
  self->_rootAnimationLayer = 0;

  [(CSDiscoveryItemExplorePostersPlatterView *)self _configureGraphicViewIfNecessary];
}

- (void)_configureGraphicViewIfNecessary
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_1D839D000, v0, v1, "ExplorePosters graphic view already configured", v2, v3, v4, v5, v6);
}

- (void)pauseAnimations
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_1D839D000, v0, v1, "ExplorePosters graphic view pausing animations", v2, v3, v4, v5, v6);
}

- (void)resumeAnimations
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_1D839D000, v0, v1, "ExplorePosters graphic view resuming animations", v2, v3, v4, v5, v6);
}

- (void)_pauseLayer:(id)a3
{
  id v5 = a3;
  [v5 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v4 = v3;
  [v5 setSpeed:0.0];
  [v5 setTimeOffset:v4];
}

- (void)_resumeLayer:(id)a3
{
  id v6 = a3;
  [v6 timeOffset];
  double v4 = v3;
  LODWORD(v3) = 1.0;
  [v6 setSpeed:v3];
  [v6 setTimeOffset:0.0];
  [v6 setBeginTime:0.0];
  [v6 convertTime:0 fromLayer:CACurrentMediaTime()];
  [v6 setBeginTime:v5 - v4];
}

- (CSDiscoveryItemExplorePostersPlatterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDiscoveryItemExplorePostersPlatterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CAStateController)graphicStateController
{
  return self->_graphicStateController;
}

- (void)setGraphicStateController:(id)a3
{
}

- (CALayer)rootAnimationLayer
{
  return self->_rootAnimationLayer;
}

- (void)setRootAnimationLayer:(id)a3
{
}

- (BOOL)isAnimationPaused
{
  return self->_animationPaused;
}

- (void)setAnimationPaused:(BOOL)a3
{
  self->_animationPaused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootAnimationLayer, 0);
  objc_storeStrong((id *)&self->_graphicStateController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __48__CSDiscoveryItemExplorePostersPlatterView_init__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D839D000, a2, OS_LOG_TYPE_ERROR, "ExplorePosters Failed to launch URL: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end