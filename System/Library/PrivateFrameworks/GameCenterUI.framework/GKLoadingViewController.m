@interface GKLoadingViewController
- (GKLoadableContentStateMachine)loadingMachine;
- (GKLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4;
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
- (void)setViewsToHideHidden:(BOOL)a3;
- (void)setViewsToHideWhileLoading:(id)a3;
- (void)showLoadingIndicator;
@end

@implementation GKLoadingViewController

- (GKLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GKLoadingViewController;
  v4 = [(GKLoadingViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = objc_alloc_init(GKLoadableContentStateMachine);
    loadingMachine = v4->_loadingMachine;
    v4->_loadingMachine = v5;

    [(_GKStateMachine *)v4->_loadingMachine setDelegate:v4];
    v4->_loadingIndicatorDelay = 2.0;
  }
  return v4;
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
  p_viewsToHideWhileLoading = &self->_viewsToHideWhileLoading;
  if (self->_viewsToHideWhileLoading != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)p_viewsToHideWhileLoading, a3);
    v7 = [(GKLoadingViewController *)self loadingState];
    if (v7 == @"LoadingState")
    {
      BOOL v10 = 1;
    }
    else
    {
      objc_super v8 = [(GKLoadingViewController *)self loadingState];
      if (v8 == @"Initial")
      {
        BOOL v10 = 1;
      }
      else
      {
        v9 = [(GKLoadingViewController *)self loadingState];
        BOOL v10 = v9 == @"RefreshingState";
      }
    }

    p_viewsToHideWhileLoading = (NSArray **)[(GKLoadingViewController *)self setViewsToHideHidden:v10];
    v5 = v11;
  }

  MEMORY[0x1F41817F8](p_viewsToHideWhileLoading, v5);
}

- (void)setViewsToHideHidden:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_viewsToHideWhileLoading;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setAlpha:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)showLoadingIndicator
{
  v12[2] = *MEMORY[0x1E4F143B8];
  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    id v4 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x1E4FB1400]);
    uint64_t v5 = self->_activityIndicator;
    self->_activityIndicator = v4;

    [(UIActivityIndicatorView *)self->_activityIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)self->_activityIndicator setActivityIndicatorViewStyle:101];
    uint64_t v6 = [MEMORY[0x1E4F639B0] sharedPalette];
    uint64_t v7 = [v6 activityIndicatorColor];
    [(UIActivityIndicatorView *)self->_activityIndicator setColor:v7];

    uint64_t v8 = [(GKLoadingViewController *)self view];
    [v8 addSubview:self->_activityIndicator];
    long long v9 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_activityIndicator attribute:9 relatedBy:0 toItem:v8 attribute:9 multiplier:1.0 constant:0.0];
    long long v10 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_activityIndicator attribute:10 relatedBy:0 toItem:v8 attribute:10 multiplier:1.0 constant:0.0];
    v12[0] = v9;
    v12[1] = v10;
    long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    [v8 addConstraints:v11];

    activityIndicator = self->_activityIndicator;
  }
  [(UIActivityIndicatorView *)activityIndicator setAlpha:1.0];
  [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
}

- (void)didEnterLoadingState
{
  uint64_t v3 = ++didEnterLoadingState_globalSeed_0;
  id v4 = [(GKLoadingViewController *)self loadingMachine];
  uint64_t v5 = [v4 currentState];

  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(self->_loadingIndicatorDelay * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__GKLoadingViewController_didEnterLoadingState__block_invoke;
  block[3] = &unk_1E5F63CA8;
  id v9 = v5;
  uint64_t v10 = v3;
  block[4] = self;
  id v7 = v5;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
}

void __47__GKLoadingViewController_didEnterLoadingState__block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48) == didEnterLoadingState_globalSeed_0)
  {
    v2 = [*(id *)(a1 + 32) loadingMachine];
    uint64_t v3 = [v2 currentState];
    id v4 = *(void **)(a1 + 40);

    if (v3 == v4)
    {
      [*(id *)(a1 + 32) setViewsToHideHidden:1];
      uint64_t v5 = *(void **)(a1 + 32);
      [v5 showLoadingIndicator];
    }
  }
}

- (void)didExitLoadingState
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__GKLoadingViewController_didExitLoadingState__block_invoke;
  v3[3] = &unk_1E5F62EB0;
  v3[4] = self;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__GKLoadingViewController_didExitLoadingState__block_invoke_2;
  v2[3] = &unk_1E5F63198;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:v2 completion:0.3];
}

uint64_t __46__GKLoadingViewController_didExitLoadingState__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setViewsToHideHidden:0];
  v2 = *(void **)(*(void *)(a1 + 32) + 1000);

  return [v2 setAlpha:0.0];
}

uint64_t __46__GKLoadingViewController_didExitLoadingState__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1000) stopAnimating];
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

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_loadingMachine, 0);

  objc_storeStrong((id *)&self->_viewsToHideWhileLoading, 0);
}

@end