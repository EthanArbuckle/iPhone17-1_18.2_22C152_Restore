@interface GKLoadableContentViewController
- (GKLoadableContentStateMachine)loadingMachine;
- (GKLoadableContentViewController)init;
- (NSArray)viewsToHideWhileLoading;
- (NSString)loadingState;
- (UIActivityIndicatorView)activityIndicator;
- (double)loadingIndicatorDelay;
- (void)didEnterLoadingState;
- (void)didExitLoadingState;
- (void)setActivityIndicator:(id)a3;
- (void)setLoadingIndicatorDelay:(double)a3;
- (void)setLoadingMachine:(id)a3;
- (void)setLoadingState:(id)a3;
- (void)setViewsToHideWhileLoading:(id)a3;
@end

@implementation GKLoadableContentViewController

- (GKLoadableContentViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)GKLoadableContentViewController;
  v2 = [(GKLoadableContentViewController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(GKLoadableContentStateMachine);
    loadingMachine = v2->_loadingMachine;
    v2->_loadingMachine = v3;

    [(_GKStateMachine *)v2->_loadingMachine setDelegate:v2];
    v2->_loadingIndicatorDelay = 2.0;
  }
  return v2;
}

- (NSString)loadingState
{
  return [(_GKStateMachine *)self->_loadingMachine currentState];
}

- (void)setLoadingState:(id)a3
{
  id v6 = a3;
  id v4 = [(_GKStateMachine *)self->_loadingMachine currentState];

  v5 = v6;
  if (v4 != v6)
  {
    [(_GKStateMachine *)self->_loadingMachine setCurrentState:v6];
    v5 = v6;
  }
}

- (void)setViewsToHideWhileLoading:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_viewsToHideWhileLoading != v5)
  {
    objc_storeStrong((id *)&self->_viewsToHideWhileLoading, a3);
    id v6 = [(GKLoadableContentViewController *)self loadingState];
    if ([v6 isEqualToString:@"LoadingState"]) {
      double v7 = 0.0;
    }
    else {
      double v7 = 1.0;
    }

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__GKLoadableContentViewController_setViewsToHideWhileLoading___block_invoke;
    v8[3] = &__block_descriptor_40_e23_v32__0__UIView_8Q16_B24l;
    *(double *)&v8[4] = v7;
    [(NSArray *)v5 enumerateObjectsUsingBlock:v8];
  }
}

uint64_t __62__GKLoadableContentViewController_setViewsToHideWhileLoading___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAlpha:*(double *)(a1 + 32)];
}

- (void)didEnterLoadingState
{
  uint64_t v3 = ++didEnterLoadingState_globalSeed;
  id v4 = [(GKLoadableContentViewController *)self loadingMachine];
  v5 = [v4 currentState];

  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(self->_loadingIndicatorDelay * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__GKLoadableContentViewController_didEnterLoadingState__block_invoke;
  block[3] = &unk_1E5F63CA8;
  id v10 = v5;
  uint64_t v11 = v3;
  block[4] = self;
  id v7 = v5;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
  v8 = [(GKLoadableContentViewController *)self viewsToHideWhileLoading];
  [v8 enumerateObjectsUsingBlock:&__block_literal_global_6];
}

void __55__GKLoadableContentViewController_didEnterLoadingState__block_invoke(uint64_t a1)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48) == didEnterLoadingState_globalSeed)
  {
    v2 = [*(id *)(a1 + 32) loadingMachine];
    uint64_t v3 = [v2 currentState];
    id v4 = *(void **)(a1 + 40);

    if (v3 == v4)
    {
      v5 = *(void **)(*(void *)(a1 + 32) + 1000);
      if (!v5)
      {
        id v6 = objc_alloc_init(MEMORY[0x1E4FB1400]);
        uint64_t v7 = *(void *)(a1 + 32);
        v8 = *(void **)(v7 + 1000);
        *(void *)(v7 + 1000) = v6;

        [*(id *)(*(void *)(a1 + 32) + 1000) setTranslatesAutoresizingMaskIntoConstraints:0];
        [*(id *)(*(void *)(a1 + 32) + 1000) setActivityIndicatorViewStyle:101];
        v9 = [MEMORY[0x1E4F639B0] sharedPalette];
        id v10 = [v9 activityIndicatorColor];
        [*(id *)(*(void *)(a1 + 32) + 1000) setColor:v10];

        uint64_t v11 = [*(id *)(a1 + 32) view];
        [v11 addSubview:*(void *)(*(void *)(a1 + 32) + 1000)];
        v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(void *)(*(void *)(a1 + 32) + 1000) attribute:9 relatedBy:0 toItem:v11 attribute:9 multiplier:1.0 constant:0.0];
        v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(void *)(*(void *)(a1 + 32) + 1000) attribute:10 relatedBy:0 toItem:v11 attribute:10 multiplier:1.0 constant:0.0];
        v15[0] = v12;
        v15[1] = v13;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
        [v11 addConstraints:v14];

        v5 = *(void **)(*(void *)(a1 + 32) + 1000);
      }
      [v5 setAlpha:1.0];
      [*(id *)(*(void *)(a1 + 32) + 1000) startAnimating];
    }
  }
}

uint64_t __55__GKLoadableContentViewController_didEnterLoadingState__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setAlpha:0.0];
}

- (void)didExitLoadingState
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__GKLoadableContentViewController_didExitLoadingState__block_invoke;
  v3[3] = &unk_1E5F62EB0;
  v3[4] = self;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__GKLoadableContentViewController_didExitLoadingState__block_invoke_3;
  v2[3] = &unk_1E5F63198;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:v2 completion:0.3];
}

uint64_t __54__GKLoadableContentViewController_didExitLoadingState__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) viewsToHideWhileLoading];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_8];

  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1000);

  return [v3 setAlpha:0.0];
}

uint64_t __54__GKLoadableContentViewController_didExitLoadingState__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setAlpha:1.0];
}

uint64_t __54__GKLoadableContentViewController_didExitLoadingState__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1000) stopAnimating];
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (NSArray)viewsToHideWhileLoading
{
  return self->_viewsToHideWhileLoading;
}

- (double)loadingIndicatorDelay
{
  return self->_loadingIndicatorDelay;
}

- (void)setLoadingIndicatorDelay:(double)a3
{
  self->_loadingIndicatorDelay = a3;
}

- (GKLoadableContentStateMachine)loadingMachine
{
  return self->_loadingMachine;
}

- (void)setLoadingMachine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingMachine, 0);
  objc_storeStrong((id *)&self->_viewsToHideWhileLoading, 0);

  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end