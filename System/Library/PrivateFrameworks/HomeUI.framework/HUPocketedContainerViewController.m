@interface HUPocketedContainerViewController
- (CGSize)preferredContentSize;
- (HUPocketedContainerViewController)initWithCoder:(id)a3;
- (HUPocketedContainerViewController)initWithContentViewController:(id)a3;
- (HUPocketedContainerViewController)initWithContentViewController:(id)a3 pocketViewController:(id)a4;
- (HUPocketedContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIViewController)contentViewController;
- (UIViewController)pocketViewController;
- (UIVisualEffectView)pocketBackgroundView;
- (id)_installPocket;
- (id)_tearDownPocket;
- (id)hu_preloadContent;
- (void)_installContentViewController;
- (void)setPocketBackgroundView:(id)a3;
- (void)setPocketViewController:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUPocketedContainerViewController

- (HUPocketedContainerViewController)initWithContentViewController:(id)a3 pocketViewController:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HUPocketedContainerViewController.m", 21, @"Invalid parameter not satisfying: %@", @"contentViewController" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)HUPocketedContainerViewController;
  v10 = [(HUPocketedContainerViewController *)&v14 initWithNibName:0 bundle:0];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_contentViewController, a3);
    objc_storeStrong((id *)&v11->_pocketViewController, a4);
  }

  return v11;
}

- (HUPocketedContainerViewController)initWithContentViewController:(id)a3
{
  return [(HUPocketedContainerViewController *)self initWithContentViewController:a3 pocketViewController:0];
}

- (HUPocketedContainerViewController)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithContentViewController_pocketViewController_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPocketedContainerViewController.m", 37, @"%s is unavailable; use %@ instead",
    "-[HUPocketedContainerViewController initWithCoder:]",
    v6);

  return 0;
}

- (HUPocketedContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithContentViewController_pocketViewController_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPocketedContainerViewController.m", 42, @"%s is unavailable; use %@ instead",
    "-[HUPocketedContainerViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HUPocketedContainerViewController;
  [(HUPocketedContainerViewController *)&v4 viewDidLoad];
  [(HUPocketedContainerViewController *)self _installContentViewController];
  id v3 = [(HUPocketedContainerViewController *)self _installPocket];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUPocketedContainerViewController;
  [(HUPocketedContainerViewController *)&v5 viewWillAppear:a3];
  id v4 = [(HUPocketedContainerViewController *)self _installPocket];
}

- (CGSize)preferredContentSize
{
  v2 = [(HUPocketedContainerViewController *)self contentViewController];
  [v2 preferredContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(HUPocketedContainerViewController *)self contentViewController];
  objc_msgSend(v5, "setPreferredContentSize:", width, height);
}

- (void)setPocketViewController:(id)a3
{
  double v4 = (UIViewController *)a3;
  if (self->_pocketViewController != v4)
  {
    objc_initWeak(&location, self);
    id v5 = [(HUPocketedContainerViewController *)self _tearDownPocket];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__HUPocketedContainerViewController_setPocketViewController___block_invoke;
    v9[3] = &unk_1E638B0E0;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    double v6 = [v5 flatMap:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__HUPocketedContainerViewController_setPocketViewController___block_invoke_2;
    v8[3] = &unk_1E6388A88;
    v8[4] = self;
    id v7 = (id)[v6 flatMap:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

id __61__HUPocketedContainerViewController_setPocketViewController___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 123, *(id *)(a1 + 32));
  }
  double v4 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v4;
}

uint64_t __61__HUPocketedContainerViewController_setPocketViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _installPocket];
}

- (id)hu_preloadContent
{
  double v3 = objc_opt_new();
  double v4 = [(HUPocketedContainerViewController *)self contentViewController];
  objc_msgSend(v3, "na_safeAddObject:", v4);

  id v5 = [(HUPocketedContainerViewController *)self pocketViewController];
  objc_msgSend(v3, "na_safeAddObject:", v5);

  double v6 = objc_msgSend(v3, "na_map:", &__block_literal_global_184);
  if ([v6 count])
  {
    id v7 = [MEMORY[0x1E4F7A0D8] combineAllFutures:v6];
    double v8 = [v7 flatMap:&__block_literal_global_66_4];
  }
  else
  {
    double v8 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v8;
}

id __54__HUPocketedContainerViewController_hu_preloadContent__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1F19C09F0]) {
    double v3 = v2;
  }
  else {
    double v3 = 0;
  }
  id v4 = v3;
  id v5 = objc_msgSend(v4, "hu_preloadContent");

  return v5;
}

uint64_t __54__HUPocketedContainerViewController_hu_preloadContent__block_invoke_2()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (id)_installPocket
{
  v46[4] = *MEMORY[0x1E4F143B8];
  double v3 = [(HUPocketedContainerViewController *)self pocketViewController];

  if (v3)
  {
    id v4 = [(HUPocketedContainerViewController *)self pocketViewController];
    [(HUPocketedContainerViewController *)self addChildViewController:v4];

    id v5 = [(HUPocketedContainerViewController *)self pocketViewController];
    double v6 = [v5 view];

    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v7 = [(HUPocketedContainerViewController *)self view];
    [v7 addSubview:v6];

    v33 = (void *)MEMORY[0x1E4F28DC8];
    v39 = [v6 bottomAnchor];
    v40 = [(HUPocketedContainerViewController *)self view];
    v38 = [v40 safeAreaLayoutGuide];
    v37 = [v38 bottomAnchor];
    v36 = [v39 constraintEqualToAnchor:v37];
    v46[0] = v36;
    v34 = [v6 leftAnchor];
    v35 = [(HUPocketedContainerViewController *)self view];
    v32 = [v35 leftAnchor];
    v31 = [v34 constraintEqualToAnchor:v32];
    v46[1] = v31;
    double v8 = [v6 rightAnchor];
    id v9 = [(HUPocketedContainerViewController *)self view];
    v10 = [v9 rightAnchor];
    id v11 = [v8 constraintEqualToAnchor:v10];
    v46[2] = v11;
    v12 = [v6 heightAnchor];
    v13 = [(HUPocketedContainerViewController *)self pocketViewController];
    [v13 preferredContentSize];
    v15 = [v12 constraintEqualToConstant:v14];
    v46[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
    [v33 activateConstraints:v16];

    id v17 = objc_alloc(MEMORY[0x1E4F43028]);
    v18 = [MEMORY[0x1E4F427D8] effectWithStyle:1];
    v19 = (void *)[v17 initWithEffect:v18];

    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    v20 = [(HUPocketedContainerViewController *)self view];
    [v20 insertSubview:v19 belowSubview:v6];

    v21 = (void *)MEMORY[0x1E4F28DC8];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __51__HUPocketedContainerViewController__installPocket__block_invoke;
    v43[3] = &unk_1E638E568;
    id v22 = v19;
    id v44 = v22;
    v45 = self;
    v23 = __51__HUPocketedContainerViewController__installPocket__block_invoke((uint64_t)v43);
    [v21 activateConstraints:v23];

    [(HUPocketedContainerViewController *)self setPocketBackgroundView:v22];
    v24 = [(HUPocketedContainerViewController *)self pocketViewController];
    v25 = &unk_1F19C09F0;
    if ([v24 conformsToProtocol:v25]) {
      v26 = v24;
    }
    else {
      v26 = 0;
    }
    id v27 = v26;

    v28 = (void *)MEMORY[0x1E4F7A0D8];
    if (v27)
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __51__HUPocketedContainerViewController__installPocket__block_invoke_2;
      v41[3] = &unk_1E6385108;
      id v42 = v27;
      v29 = [v28 lazyFutureWithBlock:v41];
    }
    else
    {
      v29 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    }
  }
  else
  {
    v29 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v29;
}

id __51__HUPocketedContainerViewController__installPocket__block_invoke(uint64_t a1)
{
  id v2 = objc_opt_new();
  double v3 = [*(id *)(a1 + 32) leadingAnchor];
  id v4 = [*(id *)(a1 + 40) view];
  id v5 = [v4 leadingAnchor];
  double v6 = [v3 constraintEqualToAnchor:v5];
  [v2 addObject:v6];

  id v7 = [*(id *)(a1 + 32) trailingAnchor];
  double v8 = [*(id *)(a1 + 40) view];
  id v9 = [v8 trailingAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  [v2 addObject:v10];

  id v11 = [*(id *)(a1 + 32) bottomAnchor];
  v12 = [*(id *)(a1 + 40) view];
  v13 = [v12 bottomAnchor];
  double v14 = [v11 constraintEqualToAnchor:v13];
  [v2 addObject:v14];

  v15 = [*(id *)(a1 + 32) topAnchor];
  v16 = [*(id *)(a1 + 40) pocketViewController];
  id v17 = [v16 view];
  v18 = [v17 topAnchor];
  v19 = [v15 constraintEqualToAnchor:v18];
  [v2 addObject:v19];

  return v2;
}

void __51__HUPocketedContainerViewController__installPocket__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v2, "hu_preloadContent");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 completionHandlerAdapter];

  id v5 = (id)[v6 addCompletionBlock:v4];
}

- (id)_tearDownPocket
{
  id v3 = [(HUPocketedContainerViewController *)self pocketViewController];

  if (v3)
  {
    id v4 = [(HUPocketedContainerViewController *)self pocketViewController];
    [v4 willMoveToParentViewController:0];

    id v5 = [(HUPocketedContainerViewController *)self pocketViewController];
    id v6 = [v5 view];
    [v6 removeFromSuperview];

    id v7 = [(HUPocketedContainerViewController *)self pocketViewController];
    [v7 removeFromParentViewController];

    pocketViewController = self->_pocketViewController;
    self->_pocketViewController = 0;

    id v9 = [(HUPocketedContainerViewController *)self contentViewController];
    objc_opt_class();
    id v10 = v9;
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      v13 = [v12 tableView];
      objc_msgSend(v13, "setContentInset:", 0.0, 0.0, 0.0, 0.0);
    }
    double v14 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    double v14 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v14;
}

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)HUPocketedContainerViewController;
  [(HUPocketedContainerViewController *)&v11 viewDidLayoutSubviews];
  id v3 = [(HUPocketedContainerViewController *)self contentViewController];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [(HUPocketedContainerViewController *)self pocketBackgroundView];
    [v7 frame];
    double v9 = v8 + 10.0;
    id v10 = [v6 tableView];
    objc_msgSend(v10, "setContentInset:", 0.0, 0.0, v9, 0.0);
  }
}

- (void)_installContentViewController
{
  v26[4] = *MEMORY[0x1E4F143B8];
  if ([(HUPocketedContainerViewController *)self isViewLoaded])
  {
    id v3 = [(HUPocketedContainerViewController *)self contentViewController];
    [(HUPocketedContainerViewController *)self addChildViewController:v3];

    id v4 = [(HUPocketedContainerViewController *)self contentViewController];
    id v5 = [v4 view];

    id v6 = [(HUPocketedContainerViewController *)self view];
    [v6 addSubview:v5];

    v18 = (void *)MEMORY[0x1E4F28DC8];
    v24 = [v5 leadingAnchor];
    v25 = [(HUPocketedContainerViewController *)self view];
    v23 = [v25 leadingAnchor];
    id v22 = [v24 constraintEqualToAnchor:v23];
    v26[0] = v22;
    v20 = [v5 trailingAnchor];
    v21 = [(HUPocketedContainerViewController *)self view];
    v19 = [v21 trailingAnchor];
    id v17 = [v20 constraintEqualToAnchor:v19];
    v26[1] = v17;
    v16 = [v5 topAnchor];
    id v7 = [(HUPocketedContainerViewController *)self view];
    double v8 = [v7 topAnchor];
    double v9 = [v16 constraintEqualToAnchor:v8];
    v26[2] = v9;
    id v10 = [v5 bottomAnchor];
    objc_super v11 = [(HUPocketedContainerViewController *)self view];
    id v12 = [v11 bottomAnchor];
    v13 = [v10 constraintEqualToAnchor:v12];
    v26[3] = v13;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
    [v18 activateConstraints:v14];

    v15 = [(HUPocketedContainerViewController *)self contentViewController];
    [v15 didMoveToParentViewController:self];
  }
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (UIViewController)pocketViewController
{
  return self->_pocketViewController;
}

- (UIVisualEffectView)pocketBackgroundView
{
  return self->_pocketBackgroundView;
}

- (void)setPocketBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pocketBackgroundView, 0);
  objc_storeStrong((id *)&self->_pocketViewController, 0);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end