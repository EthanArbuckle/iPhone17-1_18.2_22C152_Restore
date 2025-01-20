@interface INUIEditVoiceShortcutViewController
+ (void)initialize;
- (INUIEditVoiceShortcutViewController)initWithVoiceShortcut:(INVoiceShortcut *)voiceShortcut;
- (INUIVoiceShortcutHostViewController)_remoteHostViewController;
- (UIViewController)currentChildViewController;
- (_UIRemoteViewController)_containedRemoteViewController;
- (id)delegate;
- (void)_setRemoteHostViewController:(id)a3;
- (void)loadView;
- (void)remoteViewControllerDidCancel;
- (void)remoteViewControllerDidDeleteVoiceShortcutWithIdentifier:(id)a3;
- (void)remoteViewControllerDidUpdateVoiceShortcut:(id)a3 error:(id)a4;
- (void)setChildViewController:(id)a3;
- (void)setCurrentChildViewController:(id)a3;
- (void)setDelegate:(id)delegate;
@end

@implementation INUIEditVoiceShortcutViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentChildViewController, 0);
  objc_storeStrong((id *)&self->_remoteHostViewController, 0);

  objc_destroyWeak((id *)&self->_delegate);
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

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_remoteHostViewController;
}

- (void)remoteViewControllerDidCancel
{
  id v3 = [(INUIEditVoiceShortcutViewController *)self delegate];
  [v3 editVoiceShortcutViewControllerDidCancel:self];
}

- (void)remoteViewControllerDidDeleteVoiceShortcutWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(INUIEditVoiceShortcutViewController *)self delegate];
  [v5 editVoiceShortcutViewController:self didDeleteVoiceShortcutWithIdentifier:v4];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"com.apple.IntentsUI.INUIEditVoiceShortcutViewController.didDeleteVoiceShortcut" object:0];
}

- (void)remoteViewControllerDidUpdateVoiceShortcut:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(INUIEditVoiceShortcutViewController *)self delegate];
  [v8 editVoiceShortcutViewController:self didUpdateVoiceShortcut:v7 error:v6];

  id v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotificationName:@"com.apple.IntentsUI.INUIEditVoiceShortcutViewController.didUpdateVoiceShortcut" object:v7];
}

- (void)setChildViewController:(id)a3
{
  id v4 = a3;
  id v11 = [(INUIEditVoiceShortcutViewController *)self currentChildViewController];
  if (v11)
  {
    [v11 willMoveToParentViewController:0];
    v5 = [v11 view];
    [v5 removeFromSuperview];

    [v11 removeFromParentViewController];
  }
  [v4 willMoveToParentViewController:self];
  [(INUIEditVoiceShortcutViewController *)self addChildViewController:v4];
  id v6 = [v4 view];
  id v7 = [(INUIEditVoiceShortcutViewController *)self view];
  [v7 bounds];
  objc_msgSend(v6, "setFrame:");

  v8 = [v4 view];
  [v8 setAutoresizingMask:18];

  id v9 = [(INUIEditVoiceShortcutViewController *)self view];
  v10 = [v4 view];
  [v9 addSubview:v10];

  [v4 didMoveToParentViewController:self];
  [(INUIEditVoiceShortcutViewController *)self setCurrentChildViewController:v4];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)INUIEditVoiceShortcutViewController;
  [(INUIEditVoiceShortcutViewController *)&v4 loadView];
  id v3 = objc_alloc_init(INUILoadingVoiceShortcutViewController);
  [(INUIEditVoiceShortcutViewController *)self setChildViewController:v3];
}

- (INUIEditVoiceShortcutViewController)initWithVoiceShortcut:(INVoiceShortcut *)voiceShortcut
{
  objc_super v4 = voiceShortcut;
  v10.receiver = self;
  v10.super_class = (Class)INUIEditVoiceShortcutViewController;
  v5 = [(INUIEditVoiceShortcutViewController *)&v10 initWithNibName:0 bundle:0];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __61__INUIEditVoiceShortcutViewController_initWithVoiceShortcut___block_invoke;
    v7[3] = &unk_263FD6E30;
    objc_copyWeak(&v8, &location);
    +[INUIVoiceShortcutHostViewController getViewControllerForEditingVoiceShortcut:v4 completion:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __61__INUIEditVoiceShortcutViewController_initWithVoiceShortcut___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      [WeakRetained _setRemoteHostViewController:v5];
      [v5 setDelegate:v8];
      id v9 = (id *)v12;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __61__INUIEditVoiceShortcutViewController_initWithVoiceShortcut___block_invoke_2;
      v12[3] = &unk_263FD6E08;
      v12[4] = v8;
      objc_super v10 = v5;
    }
    else
    {
      id v11 = *MEMORY[0x263F0F810];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[INUIEditVoiceShortcutViewController initWithVoiceShortcut:]_block_invoke";
        __int16 v16 = 2114;
        id v17 = v6;
        _os_log_error_impl(&dword_20A3EB000, v11, OS_LOG_TYPE_ERROR, "%s Failed to get view controller for editing: %{public}@", buf, 0x16u);
      }
      id v9 = (id *)v13;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __61__INUIEditVoiceShortcutViewController_initWithVoiceShortcut___block_invoke_5;
      v13[3] = &unk_263FD6E08;
      v13[4] = v8;
      objc_super v10 = v6;
    }
    v9[5] = v10;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

void __61__INUIEditVoiceShortcutViewController_initWithVoiceShortcut___block_invoke_5(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = INIntentError();
  [v4 editVoiceShortcutViewController:v2 didUpdateVoiceShortcut:0 error:v3];
}

uint64_t __61__INUIEditVoiceShortcutViewController_initWithVoiceShortcut___block_invoke_2(uint64_t a1)
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