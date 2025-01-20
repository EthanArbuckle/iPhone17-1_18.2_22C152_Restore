@interface SKArcadeSubscribeViewController
- (BOOL)prefersStatusBarHidden;
- (NSCopying)extensionRequestIdentifier;
- (NSExtension)extension;
- (NSNumber)itemID;
- (NSString)bundleID;
- (SKArcadeSubscribeViewController)initWithItemID:(id)a3 bundleID:(id)a4;
- (SKArcadeSubscribeViewControllerDelegate)delegate;
- (SKStoreRemoteViewController)remoteViewController;
- (unint64_t)supportedInterfaceOrientations;
- (void)_loadOcelotUpsellExtension;
- (void)_setupRemoteChildViewController;
- (void)dealloc;
- (void)finish;
- (void)finishExtension;
- (void)setBundleID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionRequestIdentifier:(id)a3;
- (void)setItemID:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)storeRemoteViewControllerDidDismiss;
- (void)storeRemoteViewControllerTerminatedWithError:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SKArcadeSubscribeViewController

- (SKArcadeSubscribeViewController)initWithItemID:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SKArcadeSubscribeViewController;
  v8 = [(SKArcadeSubscribeViewController *)&v11 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    [(SKArcadeSubscribeViewController *)v8 setItemID:v6];
    [(SKArcadeSubscribeViewController *)v9 setBundleID:v7];
  }

  return v9;
}

- (void)dealloc
{
  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
  {
    [(SKStoreRemoteViewController *)remoteViewController willMoveToParentViewController:0];
    if ([(SKStoreRemoteViewController *)self->_remoteViewController isViewLoaded])
    {
      v4 = [(SKStoreRemoteViewController *)self->_remoteViewController view];
      [v4 removeFromSuperview];
    }
    [(SKStoreRemoteViewController *)self->_remoteViewController removeFromParentViewController];
  }
  extension = self->_extension;
  if (extension)
  {
    if (self->_extensionRequestIdentifier)
    {
      -[NSExtension cancelExtensionRequestWithIdentifier:](extension, "cancelExtensionRequestWithIdentifier:");
      extension = self->_extension;
    }
    [(NSExtension *)extension _kill:9];
  }
  v6.receiver = self;
  v6.super_class = (Class)SKArcadeSubscribeViewController;
  [(SKArcadeSubscribeViewController *)&v6 dealloc];
}

- (void)finishExtension
{
  extension = self->_extension;
  if (extension)
  {
    if (self->_extensionRequestIdentifier) {
      -[NSExtension cancelExtensionRequestWithIdentifier:](extension, "cancelExtensionRequestWithIdentifier:");
    }
  }
}

- (BOOL)prefersStatusBarHidden
{
  v3 = [(SKArcadeSubscribeViewController *)self remoteViewController];

  if (!v3) {
    return 1;
  }
  v4 = [(SKArcadeSubscribeViewController *)self remoteViewController];
  char v5 = [v4 prefersStatusBarHidden];

  return v5;
}

- (unint64_t)supportedInterfaceOrientations
{
  v3 = [(SKArcadeSubscribeViewController *)self remoteViewController];

  if (v3) {
    [(SKArcadeSubscribeViewController *)self remoteViewController];
  }
  else {
  v4 = [(SKArcadeSubscribeViewController *)self parentViewController];
  }
  unint64_t v5 = [v4 supportedInterfaceOrientations];

  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKArcadeSubscribeViewController;
  [(SKArcadeSubscribeViewController *)&v5 viewDidAppear:a3];
  v4 = [(SKArcadeSubscribeViewController *)self extension];

  if (!v4) {
    [(SKArcadeSubscribeViewController *)self _loadOcelotUpsellExtension];
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SKArcadeSubscribeViewController;
  id v6 = a4;
  id v7 = a3;
  [(SKArcadeSubscribeViewController *)&v8 willTransitionToTraitCollection:v7 withTransitionCoordinator:v6];
  -[_UIRemoteViewController willTransitionToTraitCollection:withTransitionCoordinator:](self->_remoteViewController, "willTransitionToTraitCollection:withTransitionCoordinator:", v7, v6, v8.receiver, v8.super_class);
}

- (void)finish
{
  id v2 = [(SKArcadeSubscribeViewController *)self delegate];
  [v2 didFinishWithError:0];
}

- (void)_loadOcelotUpsellExtension
{
  v12[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v10 = 0;
  v3 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:@"com.apple.AppStore.SubscribePageExtension" error:&v10];
  id v4 = v10;
  objc_super v5 = v4;
  if (v4)
  {
    NSLog(&cfstr_ErrorInstantia.isa, v4);
    id v6 = [(SKArcadeSubscribeViewController *)self delegate];
    [v6 didFinishWithError:v5];
  }
  else if (v3)
  {
    [(SKArcadeSubscribeViewController *)self setExtension:v3];
    id v6 = objc_opt_new();
    v12[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__SKArcadeSubscribeViewController__loadOcelotUpsellExtension__block_invoke;
    v8[3] = &unk_1E5FA99E0;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    [v3 instantiateViewControllerWithInputItems:v7 connectionHandler:v8];

    objc_destroyWeak(&v9);
  }
  else
  {
    NSLog(&cfstr_ErrorNoExtensi.isa);
    id v6 = [(SKArcadeSubscribeViewController *)self delegate];
    [v6 didFinishWithError:0];
  }

  objc_destroyWeak(&location);
}

void __61__SKArcadeSubscribeViewController__loadOcelotUpsellExtension__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v9) {
    NSLog(&cfstr_ErrorInstantia_0.isa, v9);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SKArcadeSubscribeViewController__loadOcelotUpsellExtension__block_invoke_2;
  block[3] = &unk_1E5FA99B8;
  block[4] = WeakRetained;
  id v16 = v7;
  uint64_t v11 = *(void *)(a1 + 32);
  id v17 = v8;
  uint64_t v18 = v11;
  id v19 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __61__SKArcadeSubscribeViewController__loadOcelotUpsellExtension__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setExtensionRequestIdentifier:*(void *)(a1 + 40)];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = *(void *)(a1 + 56);
    id v4 = *(id *)(a1 + 48);
    [v4 setDelegate:v2];
    [*(id *)(a1 + 32) setRemoteViewController:v4];
    [*(id *)(a1 + 32) _setupRemoteChildViewController];
  }
  else
  {
    uint64_t v3 = objc_opt_class();
    NSLog(&cfstr_ErrorLoadingRe.isa, v3);
    id v4 = [*(id *)(a1 + 56) delegate];
    [v4 didFinishWithError:*(void *)(a1 + 64)];
  }
}

- (void)_setupRemoteChildViewController
{
  uint64_t v3 = [(SKArcadeSubscribeViewController *)self remoteViewController];
  id v15 = [v3 serviceViewControllerProxy];

  id v4 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  objc_super v5 = [(SKArcadeSubscribeViewController *)self itemID];
  id v6 = [v5 stringValue];

  if (v6)
  {
    id v7 = [(SKArcadeSubscribeViewController *)self itemID];
    id v8 = [v7 stringValue];
    [v4 setObject:v8 forKeyedSubscript:@"itemID"];
  }
  [v15 setupWithParameters:v4];
  id v9 = [(SKArcadeSubscribeViewController *)self remoteViewController];
  [(SKArcadeSubscribeViewController *)self addChildViewController:v9];

  id v10 = [(SKArcadeSubscribeViewController *)self remoteViewController];
  uint64_t v11 = [v10 view];

  id v12 = [(SKArcadeSubscribeViewController *)self view];
  [v12 bounds];
  objc_msgSend(v11, "setFrame:");

  [v11 setAutoresizingMask:18];
  id v13 = [(SKArcadeSubscribeViewController *)self view];
  [v13 addSubview:v11];

  id v14 = [(SKArcadeSubscribeViewController *)self remoteViewController];
  [v14 didMoveToParentViewController:self];
}

- (void)storeRemoteViewControllerDidDismiss
{
  id v2 = [(SKArcadeSubscribeViewController *)self delegate];
  [v2 didFinishWithError:0];
}

- (void)storeRemoteViewControllerTerminatedWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(SKArcadeSubscribeViewController *)self delegate];
  [v5 didFinishWithError:v4];
}

- (SKArcadeSubscribeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKArcadeSubscribeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKStoreRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (NSCopying)extensionRequestIdentifier
{
  return self->_extensionRequestIdentifier;
}

- (void)setExtensionRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end