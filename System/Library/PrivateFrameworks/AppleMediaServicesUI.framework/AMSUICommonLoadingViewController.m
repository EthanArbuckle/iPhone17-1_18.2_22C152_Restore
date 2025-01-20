@interface AMSUICommonLoadingViewController
- (AMSUILoadingView)loadingView;
- (void)_setup;
- (void)loadView;
- (void)setLoadingView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation AMSUICommonLoadingViewController

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUICommonLoadingViewController;
  [(AMSUICommonViewController *)&v5 loadView];
  v3 = objc_msgSend(MEMORY[0x263F825C8], "ams_defaultPlatformBackgroundColor");
  v4 = [(AMSUICommonViewController *)self view];
  objc_msgSend(v4, "ams_setBackgroundColor:", v3);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUICommonLoadingViewController;
  [(AMSUICommonLoadingViewController *)&v3 viewDidLoad];
  [(AMSUICommonLoadingViewController *)self _setup];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)AMSUICommonLoadingViewController;
  [(AMSUICommonLoadingViewController *)&v13 viewWillLayoutSubviews];
  objc_super v3 = [(AMSUICommonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(AMSUICommonLoadingViewController *)self loadingView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUICommonLoadingViewController;
  [(AMSUICommonLoadingViewController *)&v5 viewDidDisappear:a3];
  double v4 = [(AMSUICommonLoadingViewController *)self loadingView];
  [v4 stopAnimating];
}

- (void)_setup
{
  objc_super v3 = [AMSUILoadingView alloc];
  double v4 = -[AMSUILoadingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AMSUICommonLoadingViewController *)self setLoadingView:v4];

  objc_super v5 = objc_msgSend(MEMORY[0x263F825C8], "ams_defaultPlatformBackgroundColor");
  double v6 = [(AMSUICommonLoadingViewController *)self loadingView];
  [v6 setBackgroundColor:v5];

  double v7 = [(AMSUICommonLoadingViewController *)self loadingView];
  [v7 startAnimating];

  objc_initWeak(&location, self);
  id v8 = MEMORY[0x263EF83A0];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__AMSUICommonLoadingViewController__setup__block_invoke;
  v14[3] = &unk_2643E37D0;
  objc_copyWeak(&v15, &location);
  double v9 = v14;
  double v10 = AMSLogKey();
  dispatch_time_t v11 = dispatch_time(0, 1500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAfter_block_invoke;
  block[3] = &unk_2643E33B0;
  id v18 = v10;
  id v19 = v9;
  id v12 = v10;
  objc_super v13 = (void *)MEMORY[0x263EF83A0];
  dispatch_after(v11, MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __42__AMSUICommonLoadingViewController__setup__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained view];
  objc_super v3 = [WeakRetained loadingView];
  [v2 addSubview:v3];

  double v4 = [WeakRetained view];
  [v4 setAlpha:0.0];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__AMSUICommonLoadingViewController__setup__block_invoke_2;
  v5[3] = &unk_2643E3118;
  v5[4] = WeakRetained;
  [MEMORY[0x263F82E00] animateWithDuration:0 delay:v5 options:0 animations:0.5 completion:0.0];
}

void __42__AMSUICommonLoadingViewController__setup__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

- (AMSUILoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end