@interface FPUIActionViewController
+ (id)actionControllerForActionIdentifier:(id)a3 actionTitle:(id)a4 items:(id)a5 providerIdentifier:(id)a6 domainIdentifier:(id)a7;
+ (id)actionControllerForAuthenticationUsingURL:(id)a3 providerIdentifier:(id)a4;
+ (id)actionControllerForConnectingToServerURL:(id)a3 actionTitle:(id)a4 providerIdentifier:(id)a5;
+ (id)actionControllerForError:(id)a3 extensionIdentifier:(id)a4 providerDomainIdentifier:(id)a5;
+ (id)actionControllerForError:(id)a3 providerIdentifier:(id)a4;
+ (id)actionControllerForInlineError:(id)a3 providerIdentifier:(id)a4;
+ (id)actionControllerForInlineError:(id)a3 providerIdentifier:(id)a4 providerDomainIdentifier:(id)a5;
- (BOOL)displayInline;
- (FPUIActionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (FPUIActionViewControllerDelegate)delegate;
- (NSArray)items;
- (NSError)error;
- (NSString)actionIdentifier;
- (NSString)actionTitle;
- (NSString)domainIdentifier;
- (NSString)providerIdentifier;
- (NSURL)authenticationURL;
- (NSURL)serverConnectionURL;
- (id)_getExtensionWithError:(id *)a3;
- (id)didLoadRemoteViewControllerCompletionHandler;
- (unint64_t)browserUserInterfaceStyle;
- (void)_delegateDidFinishWithUserInfo:(id)a3 error:(id)a4;
- (void)_delegateError:(id)a3;
- (void)_dismissViewController;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)embedViewController:(id)a3;
- (void)remoteActionContext:(id)a3 didEncounterError:(id)a4 completionHandler:(id)a5;
- (void)remoteActionContextDidFinishAction:(id)a3 userInfo:(id)a4 error:(id)a5;
- (void)remoteActionControllerDidFinishAction:(id)a3 error:(id)a4;
- (void)setActionIdentifier:(id)a3;
- (void)setActionTitle:(id)a3;
- (void)setAuthenticationURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidLoadRemoteViewControllerCompletionHandler:(id)a3;
- (void)setDisplayInline:(BOOL)a3;
- (void)setDomainIdentifier:(id)a3;
- (void)setError:(id)a3;
- (void)setItems:(id)a3;
- (void)setProviderIdentifier:(id)a3;
- (void)setServerConnectionURL:(id)a3;
- (void)viewDidLoad;
@end

@implementation FPUIActionViewController

- (void)effectiveAppearanceDidChange:(id)a3
{
  id v6 = a3;
  if ([(FPUIActionViewController *)self displayInline])
  {
    unint64_t browserUserInterfaceStyle = self->_browserUserInterfaceStyle;
    if (browserUserInterfaceStyle != [v6 browserUserInterfaceStyle])
    {
      unint64_t v5 = [v6 browserUserInterfaceStyle];
      self->_unint64_t browserUserInterfaceStyle = v5;
      [(FPUIActionExtensionViewControllerProtocol *)self->_extensionViewController _setBrowserUserInterfaceStyle:v5];
    }
  }
}

- (unint64_t)browserUserInterfaceStyle
{
  return self->_browserUserInterfaceStyle;
}

+ (id)actionControllerForInlineError:(id)a3 providerIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[FPUIActionViewController alloc] initWithNibName:0 bundle:0];
  [(FPUIActionViewController *)v7 setProviderIdentifier:v5];

  [(FPUIActionViewController *)v7 setActionIdentifier:@"com.apple.FileProviderUI.authenticate"];
  [(FPUIActionViewController *)v7 setItems:MEMORY[0x263EFFA68]];
  [(FPUIActionViewController *)v7 setError:v6];

  [(FPUIActionViewController *)v7 setDisplayInline:1];

  return v7;
}

- (void)setItems:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (FPUIActionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)FPUIActionViewController;
  v4 = [(FPUIActionViewController *)&v8 initWithNibName:a3 bundle:a4];
  id v5 = v4;
  if (v4)
  {
    [(FPUIActionViewController *)v4 setModalPresentationStyle:2];
    id v6 = v5;
  }

  return v5;
}

+ (id)actionControllerForActionIdentifier:(id)a3 actionTitle:(id)a4 items:(id)a5 providerIdentifier:(id)a6 domainIdentifier:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [[FPUIActionViewController alloc] initWithNibName:0 bundle:0];
  [(FPUIActionViewController *)v16 setProviderIdentifier:v12];

  [(FPUIActionViewController *)v16 setActionIdentifier:v15];
  [(FPUIActionViewController *)v16 setItems:v13];

  [(FPUIActionViewController *)v16 setActionTitle:v14];
  [(FPUIActionViewController *)v16 setDomainIdentifier:v11];

  [(FPUIActionViewController *)v16 setModalPresentationStyle:2];

  return v16;
}

+ (id)actionControllerForAuthenticationUsingURL:(id)a3 providerIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[FPUIActionViewController alloc] initWithNibName:0 bundle:0];
  [(FPUIActionViewController *)v7 setProviderIdentifier:v5];

  [(FPUIActionViewController *)v7 setActionIdentifier:@"com.apple.FileProviderUI.authenticate"];
  [(FPUIActionViewController *)v7 setItems:MEMORY[0x263EFFA68]];
  [(FPUIActionViewController *)v7 setAuthenticationURL:v6];

  [(FPUIActionViewController *)v7 setActionTitle:@"Authenticate"];

  return v7;
}

+ (id)actionControllerForConnectingToServerURL:(id)a3 actionTitle:(id)a4 providerIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[FPUIActionViewController alloc] initWithNibName:0 bundle:0];
  [(FPUIActionViewController *)v10 setProviderIdentifier:v7];

  [(FPUIActionViewController *)v10 setActionIdentifier:@"com.apple.FileProviderUI.authenticate"];
  [(FPUIActionViewController *)v10 setItems:MEMORY[0x263EFFA68]];
  [(FPUIActionViewController *)v10 setActionTitle:v8];

  [(FPUIActionViewController *)v10 setDomainIdentifier:0];
  [(FPUIActionViewController *)v10 setServerConnectionURL:v9];

  [(FPUIActionViewController *)v10 setModalPresentationStyle:2];

  return v10;
}

+ (id)actionControllerForError:(id)a3 providerIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[FPUIActionViewController alloc] initWithNibName:0 bundle:0];
  [(FPUIActionViewController *)v7 setProviderIdentifier:v5];

  [(FPUIActionViewController *)v7 setActionIdentifier:@"com.apple.FileProviderUI.authenticate"];
  [(FPUIActionViewController *)v7 setItems:MEMORY[0x263EFFA68]];
  [(FPUIActionViewController *)v7 setError:v6];

  [(FPUIActionViewController *)v7 setActionTitle:@"Authenticate"];

  return v7;
}

+ (id)actionControllerForError:(id)a3 extensionIdentifier:(id)a4 providerDomainIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[FPUIActionViewController alloc] initWithNibName:0 bundle:0];
  [(FPUIActionViewController *)v10 setProviderIdentifier:v8];

  [(FPUIActionViewController *)v10 setDomainIdentifier:v7];
  [(FPUIActionViewController *)v10 setActionIdentifier:@"com.apple.FileProviderUI.authenticate"];
  [(FPUIActionViewController *)v10 setItems:MEMORY[0x263EFFA68]];
  [(FPUIActionViewController *)v10 setError:v9];

  [(FPUIActionViewController *)v10 setActionTitle:@"Authenticate"];

  return v10;
}

+ (id)actionControllerForInlineError:(id)a3 providerIdentifier:(id)a4 providerDomainIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[FPUIActionViewController alloc] initWithNibName:0 bundle:0];
  [(FPUIActionViewController *)v10 setProviderIdentifier:v8];

  [(FPUIActionViewController *)v10 setActionIdentifier:@"com.apple.FileProviderUI.authenticate"];
  [(FPUIActionViewController *)v10 setDomainIdentifier:v7];

  [(FPUIActionViewController *)v10 setItems:MEMORY[0x263EFFA68]];
  [(FPUIActionViewController *)v10 setError:v9];

  [(FPUIActionViewController *)v10 setDisplayInline:1];

  return v10;
}

- (void)viewDidLoad
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v30.receiver = self;
  v30.super_class = (Class)FPUIActionViewController;
  [(FPUIActionViewController *)&v30 viewDidLoad];
  id v29 = 0;
  v3 = [(FPUIActionViewController *)self _getExtensionWithError:&v29];
  id v4 = v29;
  id v5 = v4;
  if (v3)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __39__FPUIActionViewController_viewDidLoad__block_invoke;
    v27[3] = &unk_264C6CC48;
    v27[4] = self;
    id v6 = v3;
    id v28 = v6;
    id v7 = (void *)MEMORY[0x237DF0A80](v27);
    id v8 = (void *)MEMORY[0x263F1CD20];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __39__FPUIActionViewController_viewDidLoad__block_invoke_4;
    v25[3] = &unk_264C6CC70;
    id v9 = v7;
    v25[4] = self;
    id v26 = v9;
    v10 = [v8 instantiateWithExtension:v6 completion:v25];
    placeholderVC = self->_placeholderVC;
    self->_placeholderVC = v10;

    [(_UIResilientRemoteViewContainerViewController *)self->_placeholderVC delayDisplayOfRemoteController];
    [(FPUIActionViewController *)self embedViewController:self->_placeholderVC];
    id v12 = [MEMORY[0x263F1C550] systemBackgroundColor];
    id v13 = [(FPUIActionViewController *)self view];
    [v13 setBackgroundColor:v12];

    if ([(FPUIActionViewController *)self displayInline])
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v14 = [(_UIResilientRemoteViewContainerViewController *)self->_placeholderVC view];
      id v15 = [v14 subviews];

      uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v31 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v22 != v18) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v21 + 1) + 8 * i) setBackgroundColor:0];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v31 count:16];
        }
        while (v17);
      }
    }
  }
  else if (v4)
  {
    [(FPUIActionViewController *)self _delegateError:v4];
  }
  else
  {
    v20 = [MEMORY[0x263F087E8] errorWithDomain:@"FPUIActionViewControllerErrorDomain" code:1000 userInfo:0];
    [(FPUIActionViewController *)self _delegateError:v20];
  }
}

void __39__FPUIActionViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (a4)
  {
    [*(id *)(a1 + 32) _delegateError:a4];
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) _extensionContextForUUID:a3];
    [v8 setDelegate:*(void *)(a1 + 32)];
    [v7 setDelegate:*(void *)(a1 + 32)];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __39__FPUIActionViewController_viewDidLoad__block_invoke_2;
    v28[3] = &unk_264C6CC20;
    v28[4] = *(void *)(a1 + 32);
    uint64_t v9 = [v7 serviceViewControllerProxyWithErrorHandler:v28];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 976);
    *(void *)(v10 + 976) = v9;

    if ([*(id *)(a1 + 32) displayInline]) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "_setBrowserUserInterfaceStyle:", objc_msgSend(*(id *)(a1 + 32), "browserUserInterfaceStyle"));
    }
    id v12 = [*(id *)(a1 + 32) domainIdentifier];

    if (v12)
    {
      int v13 = dyld_program_sdk_at_least();
      id v14 = *(void **)(a1 + 32);
      if (v13)
      {
        id v15 = [v14 domainIdentifier];
        uint64_t v16 = FPProviderDomainIDToDomainIdentifier(v15);

        uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 976);
      }
      else
      {
        uint64_t v18 = (void *)v14[122];
        uint64_t v16 = [v14 domainIdentifier];
        uint64_t v17 = v18;
      }
      [v17 _configureWithDomainIdentifier:v16];
    }
    v19 = [*(id *)(a1 + 32) actionIdentifier];
    int v20 = [v19 isEqualToString:@"com.apple.FileProviderUI.authenticate"];

    long long v21 = *(void **)(a1 + 32);
    if (v20)
    {
      long long v22 = [v21 authenticationURL];
      long long v23 = [*(id *)(a1 + 32) serverConnectionURL];
      if (v22)
      {
        [*(id *)(*(void *)(a1 + 32) + 976) _prepareAuthenticationUsingURL:v22];
      }
      else
      {
        v25 = *(id **)(a1 + 32);
        id v26 = v25[122];
        if (v23)
        {
          [v25[122] _prepareAuthenticationUsingServerURL:v23];
        }
        else
        {
          v27 = [v25 error];
          [v26 _prepareForError:v27];
        }
      }
    }
    else
    {
      long long v24 = (void *)v21[122];
      long long v22 = [v21 actionIdentifier];
      long long v23 = [*(id *)(a1 + 32) items];
      [v24 _prepareForActionWithIdentifier:v22 items:v23];
    }
  }
}

void __39__FPUIActionViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__FPUIActionViewController_viewDidLoad__block_invoke_3;
  v5[3] = &unk_264C6CBF8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __39__FPUIActionViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _delegateError:*(void *)(a1 + 40)];
}

void __39__FPUIActionViewController_viewDidLoad__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v5 = [*(id *)(a1 + 32) view];
  [v5 setBackgroundColor:0];

  id v6 = *(id **)(a1 + 32);
  if (v7) {
    objc_msgSend(v6, "_delegateError:");
  }
  else {
    [v6[123] endDelayingDisplayOfRemoteController];
  }
}

- (void)embedViewController:(id)a3
{
  id v18 = a3;
  id v4 = [v18 view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:1];

  id v5 = [v18 view];
  [v5 setAutoresizingMask:18];

  id v6 = [(FPUIActionViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = [v18 view];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  [(FPUIActionViewController *)self addChildViewController:v18];
  uint64_t v16 = [(FPUIActionViewController *)self view];
  uint64_t v17 = [v18 view];
  [v16 addSubview:v17];

  [v18 didMoveToParentViewController:self];
}

- (id)_getExtensionWithError:(id *)a3
{
  id v5 = (void *)MEMORY[0x263F08800];
  id v6 = [(FPUIActionViewController *)self providerIdentifier];
  id v11 = 0;
  double v7 = [v5 extensionWithIdentifier:v6 error:&v11];
  id v8 = v11;

  if (!v7)
  {
    double v9 = fpuiLogHandle;
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      double v9 = fpuiLogHandle;
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (!a3) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    -[FPUIActionViewController _getExtensionWithError:](v9, self);
    if (a3) {
LABEL_6:
    }
      *a3 = v8;
  }
LABEL_7:

  return v7;
}

- (void)_dismissViewController
{
  if ([(FPUIActionViewController *)self isBeingPresented])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__FPUIActionViewController__dismissViewController__block_invoke;
    block[3] = &unk_264C6CC98;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    [(FPUIActionViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

uint64_t __50__FPUIActionViewController__dismissViewController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)_delegateDidFinishWithUserInfo:(id)a3 error:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = fpuiLogHandle;
  if (v7)
  {
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      id v8 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FPUIActionViewController _delegateDidFinishWithUserInfo:error:](v8, self);
    }
  }
  else
  {
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      id v8 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      double v9 = v8;
      double v10 = [(FPUIActionViewController *)self actionIdentifier];
      int v15 = 138412290;
      uint64_t v16 = v10;
      _os_log_impl(&dword_235BE4000, v9, OS_LOG_TYPE_INFO, "Action with identifier (%@) did finish.", (uint8_t *)&v15, 0xCu);
    }
  }
  id v11 = [(FPUIActionViewController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  double v13 = [(FPUIActionViewController *)self delegate];
  double v14 = v13;
  if (v12) {
    [v13 actionControllerDidFinishAction:self userInfo:v6 error:v7];
  }
  else {
    [v13 actionControllerDidFinishAction:self error:v7];
  }

  [(FPUIActionViewController *)self _dismissViewController];
}

- (void)_delegateError:(id)a3
{
}

- (void)remoteActionControllerDidFinishAction:(id)a3 error:(id)a4
{
}

- (void)remoteActionContextDidFinishAction:(id)a3 userInfo:(id)a4 error:(id)a5
{
}

- (void)remoteActionContext:(id)a3 didEncounterError:(id)a4 completionHandler:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  double v9 = [(FPUIActionViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__FPUIActionViewController_remoteActionContext_didEncounterError_completionHandler___block_invoke;
    block[3] = &unk_264C6CCC0;
    block[4] = self;
    id v13 = v7;
    double v14 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v11 = fpuiLogHandle;
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      id v11 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_235BE4000, v11, OS_LOG_TYPE_INFO, "An error occurred on the service side, but the client won't present it: %@", buf, 0xCu);
    }
    v8[2](v8);
  }
}

void __84__FPUIActionViewController_remoteActionContext_didEncounterError_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 actionController:*(void *)(a1 + 32) presentError:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (FPUIActionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FPUIActionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSURL)authenticationURL
{
  return self->_authenticationURL;
}

- (void)setAuthenticationURL:(id)a3
{
}

- (BOOL)displayInline
{
  return self->_displayInline;
}

- (void)setDisplayInline:(BOOL)a3
{
  self->_displayInline = a3;
}

- (id)didLoadRemoteViewControllerCompletionHandler
{
  return self->_didLoadRemoteViewControllerCompletionHandler;
}

- (void)setDidLoadRemoteViewControllerCompletionHandler:(id)a3
{
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSURL)serverConnectionURL
{
  return self->_serverConnectionURL;
}

- (void)setServerConnectionURL:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_serverConnectionURL, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong(&self->_didLoadRemoteViewControllerCompletionHandler, 0);
  objc_storeStrong((id *)&self->_authenticationURL, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderVC, 0);

  objc_storeStrong((id *)&self->_extensionViewController, 0);
}

- (void)_getExtensionWithError:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 providerIdentifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_235BE4000, v5, v6, "nil extension for provider ID (%@), error: %@", v7, v8, v9, v10, v11);
}

- (void)_delegateDidFinishWithUserInfo:(void *)a1 error:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 actionIdentifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_235BE4000, v5, v6, "Action with identifier (%@) did finish with error (%@).", v7, v8, v9, v10, v11);
}

@end