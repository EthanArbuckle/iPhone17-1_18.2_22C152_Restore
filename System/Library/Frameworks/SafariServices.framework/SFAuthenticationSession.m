@interface SFAuthenticationSession
- (BOOL)_startRequestingFromWebAuthenticationSession:(BOOL)a3 inWindow:(id)a4 dryRun:(BOOL)a5;
- (BOOL)isSessionStarted;
- (BOOL)jitEnabled;
- (BOOL)start;
- (BOOL)startASWebAuthenticationSessionInWindow:(id)a3 dryRun:(BOOL)a4;
- (NSArray)proxiedAssociatedDomains;
- (NSDictionary)additionalHeaderFields;
- (SFAuthenticationSession)initWithURL:(NSURL *)URL callbackURLScheme:(NSString *)callbackURLScheme completionHandler:(SFAuthenticationCompletionHandler)completionHandler;
- (SFAuthenticationSession)initWithURL:(id)a3 callback:(id)a4 storageMode:(unint64_t)a5 jitEnabled:(BOOL)a6 completionHandler:(id)a7;
- (SFAuthenticationSession)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 completionHandler:(id)a6;
- (SFAuthenticationSession)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 jitEnabled:(BOOL)a6 completionHandler:(id)a7;
- (_SFAuthenticationSessionDelegate)_delegate;
- (id)_authenticationSessionErrorWithCode:(int64_t)a3;
- (id)presentingViewControllerForAuthenticationViewController:(id)a3;
- (unint64_t)storageMode;
- (void)cancel;
- (void)dealloc;
- (void)safariViewController:(id)a3 didDecideCookieSharingForURL:(id)a4 shouldCancel:(BOOL)a5 withError:(id)a6;
- (void)safariViewController:(id)a3 hostApplicationOpenURL:(id)a4;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)setAdditionalHeaderFields:(id)a3;
- (void)setJitEnabled:(BOOL)a3;
- (void)setProxiedAssociatedDomains:(id)a3;
- (void)setSessionStarted:(BOOL)a3;
- (void)setStorageMode:(unint64_t)a3;
- (void)set_delegate:(id)a3;
@end

@implementation SFAuthenticationSession

- (SFAuthenticationSession)initWithURL:(NSURL *)URL callbackURLScheme:(NSString *)callbackURLScheme completionHandler:(SFAuthenticationCompletionHandler)completionHandler
{
  return [(SFAuthenticationSession *)self initWithURL:URL callbackURLScheme:callbackURLScheme usingEphemeralSession:0 completionHandler:completionHandler];
}

- (SFAuthenticationSession)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 completionHandler:(id)a6
{
  return [(SFAuthenticationSession *)self initWithURL:a3 callbackURLScheme:a4 usingEphemeralSession:a5 jitEnabled:1 completionHandler:a6];
}

- (SFAuthenticationSession)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 jitEnabled:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  v12 = (void *)MEMORY[0x1E4F18AE8];
  id v13 = a7;
  id v14 = a3;
  v15 = [v12 callbackWithCustomScheme:a4];
  v16 = [(SFAuthenticationSession *)self initWithURL:v14 callback:v15 storageMode:v8 jitEnabled:v7 completionHandler:v13];

  return v16;
}

- (SFAuthenticationSession)initWithURL:(id)a3 callback:(id)a4 storageMode:(unint64_t)a5 jitEnabled:(BOOL)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SFAuthenticationSession;
  v15 = [(SFAuthenticationSession *)&v22 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    initialURL = v15->_initialURL;
    v15->_initialURL = (NSURL *)v16;

    objc_storeStrong((id *)&v15->_callback, a4);
    uint64_t v18 = MEMORY[0x1AD0C36A0](v14);
    id completionHandler = v15->_completionHandler;
    v15->_id completionHandler = (id)v18;

    v15->_storageMode = a5;
    v15->_jitEnabled = a6;
    v20 = v15;
  }

  return v15;
}

- (void)dealloc
{
  [(SFAuthenticationSession *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)SFAuthenticationSession;
  [(SFAuthenticationSession *)&v3 dealloc];
}

- (BOOL)start
{
  return [(SFAuthenticationSession *)self _startRequestingFromWebAuthenticationSession:0 inWindow:0 dryRun:0];
}

- (BOOL)startASWebAuthenticationSessionInWindow:(id)a3 dryRun:(BOOL)a4
{
  return [(SFAuthenticationSession *)self _startRequestingFromWebAuthenticationSession:1 inWindow:a3 dryRun:a4];
}

- (BOOL)_startRequestingFromWebAuthenticationSession:(BOOL)a3 inWindow:(id)a4 dryRun:(BOOL)a5
{
  id v7 = a4;
  if (self->_authViewController || self->_sessionStarted)
  {
    BOOL v8 = 0;
  }
  else
  {
    v10 = [(NSURL *)self->_initialURL scheme];
    int v11 = objc_msgSend(v10, "safari_isCaseInsensitiveEqualToString:", @"http");

    if (v11)
    {
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      id v14 = WBS_LOG_CHANNEL_PREFIXAuthenticationSession();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SFAuthenticationSession _startRequestingFromWebAuthenticationSession:inWindow:dryRun:]((uint64_t)v13, v14);
      }
    }
    BOOL v8 = 1;
    if (!a5)
    {
      v15 = [[SFAuthenticationViewController alloc] initWithURL:self->_initialURL callback:self->_callback storageMode:self->_storageMode jitEnabled:self->_jitEnabled presentationContextWindow:v7 additionalHeaderFields:self->_additionalHeaderFields proxiedAssociatedDomains:self->_proxiedAssociatedDomains];
      authViewController = self->_authViewController;
      self->_authViewController = v15;

      [(SFSafariViewController *)self->_authViewController setDelegate:self];
      [(SFAuthenticationViewController *)self->_authViewController setPresentationDelegate:self];
      [(SFSafariViewController *)self->_authViewController setModalPresentationStyle:2];
      self->_sessionStarted = 1;
    }
  }

  return v8;
}

- (void)cancel
{
  authViewController = self->_authViewController;
  if (authViewController)
  {
    v4 = [(SFAuthenticationViewController *)authViewController presentingViewController];

    v5 = self->_authViewController;
    if (v4)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __33__SFAuthenticationSession_cancel__block_invoke;
      v6[3] = &unk_1E5C724D8;
      v6[4] = self;
      [(SFAuthenticationViewController *)v5 dismissViewControllerAnimated:1 completion:v6];
    }
    else
    {
      self->_authViewController = 0;
    }
  }
}

void __33__SFAuthenticationSession_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (id)_authenticationSessionErrorWithCode:(int64_t)a3
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SafariServices.Authentication" code:a3 userInfo:0];
}

- (id)presentingViewControllerForAuthenticationViewController:(id)a3
{
  v4 = [(SFAuthenticationSession *)self _delegate];
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 _presentingViewControllerForAuthenticationSession:self];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)safariViewControllerDidFinish:(id)a3
{
  authViewController = self->_authViewController;
  self->_authViewController = 0;

  id completionHandler = (void (**)(id, void, id))self->_completionHandler;
  if (completionHandler)
  {
    id v6 = [(SFAuthenticationSession *)self _authenticationSessionErrorWithCode:1];
    completionHandler[2](completionHandler, 0, v6);
  }
}

- (void)safariViewController:(id)a3 hostApplicationOpenURL:(id)a4
{
  id v5 = a4;
  authViewController = self->_authViewController;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__SFAuthenticationSession_safariViewController_hostApplicationOpenURL___block_invoke;
  v8[3] = &unk_1E5C724D8;
  v8[4] = self;
  [(SFAuthenticationViewController *)authViewController dismissViewControllerAnimated:1 completion:v8];
  id completionHandler = (void (**)(id, id, void))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, v5, 0);
  }
}

void __71__SFAuthenticationSession_safariViewController_hostApplicationOpenURL___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (void)safariViewController:(id)a3 didDecideCookieSharingForURL:(id)a4 shouldCancel:(BOOL)a5 withError:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (self->_authViewController)
  {
    if (v7)
    {
      id v13 = WBS_LOG_CHANNEL_PREFIXSVCPrivacy();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v17[0] = 0;
        _os_log_impl(&dword_1A690B000, v13, OS_LOG_TYPE_DEFAULT, "SFAuthenticationSession was cancelled by user.", (uint8_t *)v17, 2u);
      }
      id completionHandler = (void (**)(id, void, id))self->_completionHandler;
      if (completionHandler)
      {
        if (v12)
        {
          completionHandler[2](self->_completionHandler, 0, v12);
        }
        else
        {
          uint64_t v16 = [(SFAuthenticationSession *)self _authenticationSessionErrorWithCode:1];
          completionHandler[2](completionHandler, 0, v16);
        }
      }
    }
  }
  else
  {
    v15 = WBS_LOG_CHANNEL_PREFIXSVCPrivacy();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SFAuthenticationSession safariViewController:didDecideCookieSharingForURL:shouldCancel:withError:](v15);
    }
  }
}

- (_SFAuthenticationSessionDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__delegate);

  return (_SFAuthenticationSessionDelegate *)WeakRetained;
}

- (void)set_delegate:(id)a3
{
}

- (unint64_t)storageMode
{
  return self->_storageMode;
}

- (void)setStorageMode:(unint64_t)a3
{
  self->_storageMode = a3;
}

- (BOOL)isSessionStarted
{
  return self->_sessionStarted;
}

- (void)setSessionStarted:(BOOL)a3
{
  self->_sessionStarted = a3;
}

- (BOOL)jitEnabled
{
  return self->_jitEnabled;
}

- (void)setJitEnabled:(BOOL)a3
{
  self->_jitEnabled = a3;
}

- (NSDictionary)additionalHeaderFields
{
  return self->_additionalHeaderFields;
}

- (void)setAdditionalHeaderFields:(id)a3
{
}

- (NSArray)proxiedAssociatedDomains
{
  return self->_proxiedAssociatedDomains;
}

- (void)setProxiedAssociatedDomains:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalHeaderFields, 0);
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong((id *)&self->_proxiedAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_callback, 0);
  objc_storeStrong((id *)&self->_authViewController, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_initialURL, 0);
}

- (void)_startRequestingFromWebAuthenticationSession:(uint64_t)a1 inWindow:(NSObject *)a2 dryRun:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A690B000, a2, OS_LOG_TYPE_ERROR, "%{public}@ support for http scheme is deprecated and will be removed in a future version of iOS. Use https scheme instead.", (uint8_t *)&v2, 0xCu);
}

- (void)safariViewController:(os_log_t)log didDecideCookieSharingForURL:shouldCancel:withError:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "SFAuthenticationSession has already been cancelled but we still got a privacy alert callback from view service.", v1, 2u);
}

@end