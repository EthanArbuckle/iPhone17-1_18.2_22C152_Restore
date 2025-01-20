@interface DDFallbackController
- (BOOL)shouldAutorotate;
- (DDFallbackController)initWithWindow:(id)a3 interactionDelegate:(id)a4;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)loadView;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation DDFallbackController

- (DDFallbackController)initWithWindow:(id)a3 interactionDelegate:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DDFallbackController;
  id v7 = a3;
  v8 = [(DDFallbackController *)&v11 init];
  objc_storeWeak((id *)&v8->_baseWindow, v7);

  id interactionDelegate = v8->_interactionDelegate;
  v8->_id interactionDelegate = v6;

  return v8;
}

- (void)loadView
{
  id v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  [v3 setOpaque:0];
  [v3 setBackgroundColor:0];
  [(DDFallbackController *)self setView:v3];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v8 = (objc_class *)MEMORY[0x1E4F43058];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 alloc];
  v12 = [MEMORY[0x1E4F42D90] mainScreen];
  [v12 bounds];
  v13 = (UIWindow *)objc_msgSend(v11, "initWithFrame:");
  ourWindow = self->_ourWindow;
  self->_ourWindow = v13;

  v15 = self->_ourWindow;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_baseWindow);
  [WeakRetained windowLevel];
  [(UIWindow *)v15 setWindowLevel:v17 + 1.0];

  [(UIWindow *)v15 setOpaque:0];
  [(UIWindow *)v15 setBackgroundColor:0];
  [(UIWindow *)v15 bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = [(DDFallbackController *)self view];
  objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

  v27 = [(DDFallbackController *)self view];
  [(UIWindow *)v15 addSubview:v27];

  [(UIWindow *)v15 makeKeyAndOrderFront:0];
  [(UIWindow *)v15 beginDisablingInterfaceAutorotation];
  v28.receiver = self;
  v28.super_class = (Class)DDFallbackController;
  [(DDFallbackController *)&v28 presentViewController:v10 animated:v5 completion:v9];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__DDFallbackController_dismissViewControllerAnimated_completion___block_invoke;
  v9[3] = &unk_1E5A857E8;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)DDFallbackController;
  id v7 = v6;
  [(DDFallbackController *)&v8 dismissViewControllerAnimated:v4 completion:v9];
}

void __65__DDFallbackController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  id v6 = *(id *)(*(void *)(a1 + 32) + 984);
  [v6 setDelegate:0];
  [v6 orderOut:0];
  [v6 endDisablingInterfaceAutorotation];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 984);
  *(void *)(v3 + 984) = 0;

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interactionDelegate, 0);
  objc_storeStrong((id *)&self->_ourWindow, 0);
  objc_destroyWeak((id *)&self->_baseWindow);
}

@end