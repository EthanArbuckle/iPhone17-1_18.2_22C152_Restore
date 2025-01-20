@interface INUIAddVoiceShortcutViewController
+ (void)initialize;
- (INShortcut)_shortcut;
- (INUIAddVoiceShortcutViewController)initWithShortcut:(INShortcut *)shortcut;
- (INUIVoiceShortcutHostViewController)_remoteHostViewController;
- (UIViewController)currentChildViewController;
- (_UIRemoteViewController)_containedRemoteViewController;
- (id)delegate;
- (void)_setRemoteHostViewController:(id)a3;
- (void)loadView;
- (void)remoteViewControllerDidCancel;
- (void)remoteViewControllerDidCreateVoiceShortcut:(id)a3 error:(id)a4;
- (void)setChildViewController:(id)a3;
- (void)setCurrentChildViewController:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)set_shortcut:(id)a3;
@end

@implementation INUIAddVoiceShortcutViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentChildViewController, 0);
  objc_storeStrong((id *)&self->_remoteHostViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_shortcut, 0);
}

- (void)setCurrentChildViewController:(id)a3
{
}

- (UIViewController)currentChildViewController
{
  return self->_currentChildViewController;
}

- (void)_setRemoteHostViewController:(id)a3
{
}

- (INUIVoiceShortcutHostViewController)_remoteHostViewController
{
  return self->_remoteHostViewController;
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)set_shortcut:(id)a3
{
}

- (INShortcut)_shortcut
{
  return self->_shortcut;
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_remoteHostViewController;
}

- (void)remoteViewControllerDidCancel
{
  id v3 = [(INUIAddVoiceShortcutViewController *)self delegate];
  [v3 addVoiceShortcutViewControllerDidCancel:self];
}

- (void)remoteViewControllerDidCreateVoiceShortcut:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(INUIAddVoiceShortcutViewController *)self delegate];
  [v8 addVoiceShortcutViewController:self didFinishWithVoiceShortcut:v7 error:v6];

  id v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotificationName:@"com.apple.IntentsUI.INUIAddVoiceShortcutViewController.didAddVoiceShortcut" object:v7];
}

- (void)setChildViewController:(id)a3
{
  id v4 = a3;
  id v11 = [(INUIAddVoiceShortcutViewController *)self currentChildViewController];
  if (v11)
  {
    [v11 willMoveToParentViewController:0];
    v5 = [v11 view];
    [v5 removeFromSuperview];

    [v11 removeFromParentViewController];
  }
  [v4 willMoveToParentViewController:self];
  [(INUIAddVoiceShortcutViewController *)self addChildViewController:v4];
  id v6 = [v4 view];
  id v7 = [(INUIAddVoiceShortcutViewController *)self view];
  [v7 bounds];
  objc_msgSend(v6, "setFrame:");

  v8 = [v4 view];
  [v8 setAutoresizingMask:18];

  id v9 = [(INUIAddVoiceShortcutViewController *)self view];
  v10 = [v4 view];
  [v9 addSubview:v10];

  [v4 didMoveToParentViewController:self];
  [(INUIAddVoiceShortcutViewController *)self setCurrentChildViewController:v4];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)INUIAddVoiceShortcutViewController;
  [(INUIAddVoiceShortcutViewController *)&v4 loadView];
  id v3 = objc_alloc_init(INUILoadingVoiceShortcutViewController);
  [(INUIAddVoiceShortcutViewController *)self setChildViewController:v3];
}

- (INUIAddVoiceShortcutViewController)initWithShortcut:(INShortcut *)shortcut
{
  v5 = shortcut;
  id v6 = [(INShortcut *)v5 intent];
  id v7 = [(INShortcut *)v5 userActivity];
  BOOL v8 = v7 != 0;

  if ((v6 == 0) != v8)
  {
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"INshortcut must have either intent xor userActivity" userInfo:0];
    [v9 raise];
  }
  v16.receiver = self;
  v16.super_class = (Class)INUIAddVoiceShortcutViewController;
  v10 = [(INUIAddVoiceShortcutViewController *)&v16 initWithNibName:0 bundle:0];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_shortcut, shortcut);
    objc_initWeak(&location, v11);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__INUIAddVoiceShortcutViewController_initWithShortcut___block_invoke;
    v13[3] = &unk_263FD6E30;
    objc_copyWeak(&v14, &location);
    +[INUIVoiceShortcutHostViewController getViewControllerForAddingShortcut:v5 completion:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __55__INUIAddVoiceShortcutViewController_initWithShortcut___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      [WeakRetained _setRemoteHostViewController:v5];
      [v5 setDelegate:v8];
      id v9 = (id *)v12;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __55__INUIAddVoiceShortcutViewController_initWithShortcut___block_invoke_2;
      v12[3] = &unk_263FD6E08;
      v12[4] = v8;
      v10 = v5;
    }
    else
    {
      id v11 = *MEMORY[0x263F0F810];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[INUIAddVoiceShortcutViewController initWithShortcut:]_block_invoke";
        __int16 v16 = 2114;
        id v17 = v6;
        _os_log_error_impl(&dword_20A3EB000, v11, OS_LOG_TYPE_ERROR, "%s Failed to get view controller for adding: %{public}@", buf, 0x16u);
      }
      id v9 = (id *)v13;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __55__INUIAddVoiceShortcutViewController_initWithShortcut___block_invoke_6;
      v13[3] = &unk_263FD6E08;
      void v13[4] = v8;
      v10 = v6;
    }
    v9[5] = v10;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

void __55__INUIAddVoiceShortcutViewController_initWithShortcut___block_invoke_6(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = INIntentError();
  [v4 addVoiceShortcutViewController:v2 didFinishWithVoiceShortcut:0 error:v3];
}

uint64_t __55__INUIAddVoiceShortcutViewController_initWithShortcut___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChildViewController:*(void *)(a1 + 40)];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    MEMORY[0x270EF5260]();
  }
}

@end