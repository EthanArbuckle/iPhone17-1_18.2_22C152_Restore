@interface SFAuthenticationViewController
+ (BOOL)_supportsPrewarming;
- (SFAuthenticationViewController)initWithURL:(id)a3 callback:(id)a4 storageMode:(unint64_t)a5 jitEnabled:(BOOL)a6 presentationContextWindow:(id)a7 additionalHeaderFields:(id)a8 proxiedAssociatedDomains:(id)a9;
- (SFAuthenticationViewController)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 jitEnabled:(BOOL)a6 presentationContextWindow:(id)a7;
- (SFAuthenticationViewController)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 presentationContextWindow:(id)a6;
- (SFAuthenticationViewControllerPresentationDelegate)presentationDelegate;
- (id)dismissCompletionHandler;
- (void)_presentViewController;
- (void)_restartServiceViewController;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)remoteViewController:(id)a3 didDecideCookieSharingForURL:(id)a4 shouldCancel:(BOOL)a5 withError:(id)a6;
- (void)remoteViewController:(id)a3 hostApplicationOpenURL:(id)a4;
- (void)setDefersAddingRemoteViewController:(BOOL)a3;
- (void)setDismissCompletionHandler:(id)a3;
- (void)setPresentationDelegate:(id)a3;
@end

@implementation SFAuthenticationViewController

- (SFAuthenticationViewController)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 presentationContextWindow:(id)a6
{
  return [(SFAuthenticationViewController *)self initWithURL:a3 callbackURLScheme:a4 usingEphemeralSession:a5 jitEnabled:1 presentationContextWindow:a6];
}

- (SFAuthenticationViewController)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 jitEnabled:(BOOL)a6 presentationContextWindow:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  v12 = (void *)MEMORY[0x1E4F18AE8];
  id v13 = a7;
  id v14 = a3;
  v15 = [v12 callbackWithCustomScheme:a4];
  v16 = [(SFAuthenticationViewController *)self initWithURL:v14 callback:v15 storageMode:v8 jitEnabled:v7 presentationContextWindow:v13 additionalHeaderFields:0 proxiedAssociatedDomains:0];

  return v16;
}

- (SFAuthenticationViewController)initWithURL:(id)a3 callback:(id)a4 storageMode:(unint64_t)a5 jitEnabled:(BOOL)a6 presentationContextWindow:(id)a7 additionalHeaderFields:(id)a8 proxiedAssociatedDomains:(id)a9
{
  BOOL v11 = a6;
  id v15 = a4;
  id v29 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = a3;
  v19 = objc_alloc_init(SFSafariViewControllerConfiguration);
  [(SFSafariViewControllerConfiguration *)v19 setEntersReaderIfAvailable:0];
  [(SFSafariViewControllerConfiguration *)v19 setBarCollapsingEnabled:0];
  [(SFSafariViewControllerConfiguration *)v19 set_storageModeForAuthenticationSession:a5];
  [(SFSafariViewControllerConfiguration *)v19 _setJITEnabled:v11];
  v30.receiver = self;
  v30.super_class = (Class)SFAuthenticationViewController;
  v20 = [(SFSafariViewController *)&v30 initWithURL:v18 configuration:v19];

  if (v20)
  {
    objc_storeStrong((id *)&v20->_presentationContextWindow, a7);
    objc_storeStrong((id *)&v20->_callback, a4);
    uint64_t v21 = [v17 copy];
    proxiedAssociatedDomains = v20->_proxiedAssociatedDomains;
    v20->_proxiedAssociatedDomains = (NSArray *)v21;

    v23 = [(SFSafariViewController *)v20 serviceProxy];
    v24 = [(SFSafariViewController *)v20 initialURL];
    [v23 decideCookieSharingForURL:v24 callback:v15 proxiedAssociatedDomains:v20->_proxiedAssociatedDomains];

    if ([v16 count])
    {
      v25 = [(SFSafariViewController *)v20 serviceProxy];
      [v25 setAdditionalHeaderFieldsForInitialLoad:v16];
    }
    -[SFSafariViewController setDismissButtonStyle:](v20, "setDismissButtonStyle:", 2, a4, v29);
    [(SFSafariViewController *)v20 setTransitioningDelegate:v20];
    [(SFAuthenticationViewController *)v20 setDefersAddingRemoteViewController:1];
    [(SFAuthenticationViewController *)v20 setModalInPresentation:1];
    v26 = v20;
  }

  return v20;
}

- (void)setDefersAddingRemoteViewController:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SFSafariViewController *)self defersAddingRemoteViewController] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SFAuthenticationViewController;
    [(SFSafariViewController *)&v7 setDefersAddingRemoteViewController:v3];
    if (!v3)
    {
      [(SFSafariViewController *)self _addRemoteViewControllerIfNeeded];
      v5 = [(SFSafariViewController *)self serviceProxy];
      v6 = [(SFSafariViewController *)self initialURL];
      [v5 loadURL:v6];
    }
  }
}

- (void)_presentViewController
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A690B000, a2, OS_LOG_TYPE_FAULT, "Attempted to present SFAuthenticationViewController from a view controller that is being dismissed: %@", (uint8_t *)&v2, 0xCu);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__SFAuthenticationViewController_dismissViewControllerAnimated_completion___block_invoke;
  v9[3] = &unk_1E5C73300;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)SFAuthenticationViewController;
  id v7 = v6;
  [(SFAuthenticationViewController *)&v8 dismissViewControllerAnimated:v4 completion:v9];
}

void __75__SFAuthenticationViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 1256))
  {
    uint64_t v4 = *(void *)(v3 + 1296);
    if (v4)
    {
      (*(void (**)(void))(v4 + 16))();
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 1256);
      *(void *)(v5 + 1256) = 0;
    }
  }
}

- (void)_restartServiceViewController
{
  id v5 = [(SFSafariViewController *)self serviceProxy];
  uint64_t v3 = [(SFSafariViewController *)self configuration];
  [v5 setConfiguration:v3];

  objc_msgSend(v5, "setDismissButtonStyle:", -[SFSafariViewController dismissButtonStyle](self, "dismissButtonStyle"));
  uint64_t v4 = [(SFSafariViewController *)self initialURL];
  [v5 decideCookieSharingForURL:v4 callback:self->_callback proxiedAssociatedDomains:self->_proxiedAssociatedDomains];

  [(SFAuthenticationViewController *)self setDefersAddingRemoteViewController:1];
}

+ (BOOL)_supportsPrewarming
{
  return 0;
}

- (void)remoteViewController:(id)a3 hostApplicationOpenURL:(id)a4
{
  id v6 = a4;
  id v5 = [(SFSafariViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 safariViewController:self hostApplicationOpenURL:v6];
  }
}

- (void)remoteViewController:(id)a3 didDecideCookieSharingForURL:(id)a4 shouldCancel:(BOOL)a5 withError:(id)a6
{
  BOOL v7 = a5;
  id v12 = a4;
  id v9 = a6;
  id v10 = [(SFSafariViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 safariViewController:self didDecideCookieSharingForURL:v12 shouldCancel:v7 withError:v9];
  }
  BOOL v11 = [(SFAuthenticationViewController *)self presentingViewController];

  if (v7)
  {
    if (v11) {
      [(SFAuthenticationViewController *)self dismissViewControllerAnimated:1 completion:0];
    }
  }
  else
  {
    if (!v11) {
      [(SFAuthenticationViewController *)self _presentViewController];
    }
    [(SFAuthenticationViewController *)self setDefersAddingRemoteViewController:0];
  }
}

- (SFAuthenticationViewControllerPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (SFAuthenticationViewControllerPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (id)dismissCompletionHandler
{
  return self->_dismissCompletionHandler;
}

- (void)setDismissCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissCompletionHandler, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_presentationContextWindow, 0);
  objc_storeStrong((id *)&self->_proxiedAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_callback, 0);

  objc_storeStrong((id *)&self->_fallbackPresentationViewController, 0);
}

@end