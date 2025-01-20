@interface LACUIContainerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)resignFirstResponder;
- (LACUIContainerViewController)init;
- (LACUIContainerViewControllerDelegate)delegate;
- (UIViewController)currentViewController;
- (id)navigationItem;
- (void)_performWithoutAnimations:(id)a3;
- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3;
- (void)_setup;
- (void)_transitionFromVC:(id)a3 toVC:(id)a4 transitionStyle:(int64_t)a5;
- (void)presentViewController:(id)a3 transitionStyle:(int64_t)a4;
- (void)setCurrentViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation LACUIContainerViewController

- (LACUIContainerViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)LACUIContainerViewController;
  v2 = [(LACUIContainerViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(LACUIContainerViewController *)v2 _setup];
  }
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  v2 = [(LACUIContainerViewController *)self currentViewController];
  char v3 = [v2 canBecomeFirstResponder];

  return v3;
}

- (BOOL)becomeFirstResponder
{
  v2 = [(LACUIContainerViewController *)self currentViewController];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (BOOL)resignFirstResponder
{
  v2 = [(LACUIContainerViewController *)self currentViewController];
  char v3 = [v2 resignFirstResponder];

  return v3;
}

- (id)navigationItem
{
  char v3 = [(LACUIContainerViewController *)self parentViewController];
  v4 = [v3 navigationItem];
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)LACUIContainerViewController;
    id v6 = [(LACUIContainerViewController *)&v9 navigationItem];
  }
  v7 = v6;

  return v7;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)LACUIContainerViewController;
  [(LACUIContainerViewController *)&v9 viewDidDisappear:a3];
  uint64_t v4 = [(LACUIContainerViewController *)self delegate];
  if (v4)
  {
    objc_super v5 = (void *)v4;
    id v6 = [(LACUIContainerViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(LACUIContainerViewController *)self delegate];
      [v8 containerViewControllerViewDidDisappear:self];
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)LACUIContainerViewController;
  id v4 = a3;
  [(LACUIContainerViewController *)&v9 _preferredContentSizeDidChangeForChildViewController:v4];
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  double v6 = v5;
  double v8 = v7;

  -[LACUIContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)presentViewController:(id)a3 transitionStyle:(int64_t)a4
{
  id v6 = a3;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __70__LACUIContainerViewController_presentViewController_transitionStyle___block_invoke;
  v12 = &unk_2653BCB68;
  v13 = self;
  id v14 = v6;
  id v7 = v6;
  [(LACUIContainerViewController *)self _performWithoutAnimations:&v9];
  double v8 = [(LACUIContainerViewController *)self currentViewController];
  [(LACUIContainerViewController *)self _transitionFromVC:v8 toVC:v7 transitionStyle:a4];

  [(LACUIContainerViewController *)self setCurrentViewController:v7];
}

uint64_t __70__LACUIContainerViewController_presentViewController_transitionStyle___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addChildViewController:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 976));
  char v3 = [*(id *)(a1 + 40) view];
  [WeakRetained addSubview:v3];

  id v4 = [*(id *)(a1 + 40) view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v5 = [*(id *)(a1 + 40) view];
  id v6 = [v5 topAnchor];
  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 976));
  double v8 = [v7 topAnchor];
  uint64_t v9 = [v6 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  uint64_t v10 = [*(id *)(a1 + 40) view];
  v11 = [v10 bottomAnchor];
  id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 976));
  v13 = [v12 bottomAnchor];
  id v14 = [v11 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  v15 = [*(id *)(a1 + 40) view];
  v16 = [v15 leadingAnchor];
  id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 976));
  v18 = [v17 leadingAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  v20 = [*(id *)(a1 + 40) view];
  v21 = [v20 trailingAnchor];
  id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 976));
  v23 = [v22 trailingAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  uint64_t v26 = *(void *)(a1 + 32);
  v25 = *(void **)(a1 + 40);
  return [v25 didMoveToParentViewController:v26];
}

- (void)_setup
{
  id obj = (id)objc_opt_new();
  char v3 = [(LACUIContainerViewController *)self view];
  [v3 addSubview:obj];

  [obj setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [obj topAnchor];
  double v5 = [(LACUIContainerViewController *)self view];
  id v6 = [v5 topAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  double v8 = [obj bottomAnchor];
  uint64_t v9 = [(LACUIContainerViewController *)self view];
  uint64_t v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  id v12 = [obj leadingAnchor];
  v13 = [(LACUIContainerViewController *)self view];
  id v14 = [v13 leadingAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  v16 = [obj trailingAnchor];
  id v17 = [(LACUIContainerViewController *)self view];
  v18 = [v17 trailingAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  objc_storeWeak((id *)&self->_containerView, obj);
}

- (void)_transitionFromVC:(id)a3 toVC:(id)a4 transitionStyle:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = *MEMORY[0x263F000D0];
  long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v12 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v38.c = v11;
  *(_OWORD *)&v38.tx = v12;
  *(_OWORD *)&v37.a = v10;
  *(_OWORD *)&v37.c = v11;
  *(_OWORD *)&v37.tx = v12;
  *(_OWORD *)&v38.a = v10;
  if (a5 == 2)
  {
    p_containerView = &self->_containerView;
    *(_OWORD *)&v29.a = v10;
    *(_OWORD *)&v29.c = v11;
    *(_OWORD *)&v29.tx = v12;
    id WeakRetained = objc_loadWeakRetained((id *)p_containerView);
    [WeakRetained bounds];
    CGAffineTransform v36 = v29;
    CGAffineTransformTranslate(&v38, &v36, -v21, 0.0);

    id v16 = objc_loadWeakRetained((id *)p_containerView);
    [v16 bounds];
    double v18 = v22;
  }
  else
  {
    if (a5 != 1) {
      goto LABEL_6;
    }
    v13 = &self->_containerView;
    *(_OWORD *)&v29.a = v10;
    *(_OWORD *)&v29.c = v11;
    *(_OWORD *)&v29.tx = v12;
    id v14 = objc_loadWeakRetained((id *)v13);
    [v14 bounds];
    CGAffineTransform v36 = v29;
    CGAffineTransformTranslate(&v38, &v36, v15, 0.0);

    id v16 = objc_loadWeakRetained((id *)v13);
    [v16 bounds];
    double v18 = -v17;
  }
  CGAffineTransform v36 = v29;
  CGAffineTransformTranslate(&v37, &v36, v18, 0.0);

LABEL_6:
  if (a5) {
    double v23 = 0.3;
  }
  else {
    double v23 = 0.0;
  }
  objc_msgSend(v8, "willMoveToParentViewController:", 0, *(_OWORD *)&v29.a, *(_OWORD *)&v29.c, *(_OWORD *)&v29.tx);
  v24 = [v9 view];
  CGAffineTransform v36 = v38;
  [v24 setTransform:&v36];

  v25 = (void *)MEMORY[0x263F82E00];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __71__LACUIContainerViewController__transitionFromVC_toVC_transitionStyle___block_invoke;
  v32[3] = &unk_2653BCCC8;
  id v26 = v8;
  CGAffineTransform v35 = v37;
  id v33 = v26;
  id v34 = v9;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __71__LACUIContainerViewController__transitionFromVC_toVC_transitionStyle___block_invoke_2;
  v30[3] = &unk_2653BCCF0;
  id v31 = v26;
  id v27 = v26;
  id v28 = v9;
  [v25 animateWithDuration:v32 animations:v30 completion:v23];
}

void __71__LACUIContainerViewController__transitionFromVC_toVC_transitionStyle___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  long long v3 = *(_OWORD *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 48);
  long long v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 80);
  [v2 setTransform:&v6];

  id v4 = [*(id *)(a1 + 40) view];
  long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v6 = *MEMORY[0x263F000D0];
  long long v7 = v5;
  long long v8 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v4 setTransform:&v6];
}

uint64_t __71__LACUIContainerViewController__transitionFromVC_toVC_transitionStyle___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  long long v3 = *(void **)(a1 + 32);
  return [v3 removeFromParentViewController];
}

- (void)_performWithoutAnimations:(id)a3
{
  long long v3 = (void *)MEMORY[0x263F158F8];
  id v4 = (void (**)(void))a3;
  uint64_t v5 = [v3 disableActions];
  [MEMORY[0x263F158F8] setDisableActions:1];
  v4[2](v4);

  long long v6 = (void *)MEMORY[0x263F158F8];
  [v6 setDisableActions:v5];
}

- (UIViewController)currentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setCurrentViewController:(id)a3
{
}

- (LACUIContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LACUIContainerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_currentViewController);
  objc_destroyWeak((id *)&self->_containerView);
}

@end