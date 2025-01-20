@interface SFAddToHomeScreenServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (void)dataProvider:(id)a3 didFinishWithResult:(BOOL)a4;
- (void)didCopyStagedCookiesToURL:(id)a3 sandboxExtensionToken:(id)a4;
- (void)didFetchManifestData:(id)a3;
- (void)didFetchWebClipMetadata:(id)a3;
- (void)didReceiveWebClipIcon:(id)a3;
- (void)prepareForDisplayWithCompletionHandler:(id)a3;
- (void)viewDidLoad;
@end

@implementation SFAddToHomeScreenServiceViewController

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC60080];
}

+ (id)_exportedInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC70078];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_didFetchManifestData_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v11 forSelector:sel_didFetchWebClipMetadata_ argumentIndex:0 ofReply:0];

  return v2;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)SFAddToHomeScreenServiceViewController;
  [(SFAddToHomeScreenServiceViewController *)&v10 viewDidLoad];
  provider = self->_provider;
  if (!provider)
  {
    uint64_t v4 = objc_alloc_init(SFWebAppDataProvider);
    uint64_t v5 = self->_provider;
    self->_provider = v4;

    [(SFWebAppDataProvider *)self->_provider setDelegate:self];
    provider = self->_provider;
  }
  uint64_t v6 = [(SFWebAppDataProvider *)provider activityViewController];
  [(SFAddToHomeScreenServiceViewController *)self addChildViewController:v6];
  uint64_t v7 = [v6 view];
  uint64_t v8 = [(SFAddToHomeScreenServiceViewController *)self view];
  [v8 addSubview:v7];

  uint64_t v9 = [(SFAddToHomeScreenServiceViewController *)self view];
  [v9 bounds];
  objc_msgSend(v7, "setFrame:");

  [v7 setAutoresizingMask:18];
  [v6 didMoveToParentViewController:self];
}

- (void)prepareForDisplayWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  [(SFAddToHomeScreenServiceViewController *)self _hostAuditToken];
  if (WBSAuditTokenHasEntitlement())
  {
    [(SFWebAppDataProvider *)self->_provider setContentReadyForDisplay];
    v4[2](v4);
  }
  else
  {
    uint64_t v5 = [(SFAddToHomeScreenServiceViewController *)self _remoteViewControllerProxy];
    [v5 serviceViewControllerDidFinishWithResult:0];
  }
}

- (void)didFetchManifestData:(id)a3
{
  id v4 = a3;
  [(SFAddToHomeScreenServiceViewController *)self _hostAuditToken];
  if (WBSAuditTokenHasEntitlement())
  {
    -[SFWebAppDataProvider prepareWithManifestData:](self->_provider, "prepareWithManifestData:", v4, 0, 0, 0, 0);
  }
  else
  {
    uint64_t v5 = [(SFAddToHomeScreenServiceViewController *)self _remoteViewControllerProxy];
    [v5 serviceViewControllerDidFinishWithResult:0];
  }
}

- (void)didFetchWebClipMetadata:(id)a3
{
  id v4 = a3;
  [(SFAddToHomeScreenServiceViewController *)self _hostAuditToken];
  if (WBSAuditTokenHasEntitlement())
  {
    -[SFWebAppDataProvider updateWithWebClipMetadata:](self->_provider, "updateWithWebClipMetadata:", v4, 0, 0, 0, 0);
  }
  else
  {
    uint64_t v5 = [(SFAddToHomeScreenServiceViewController *)self _remoteViewControllerProxy];
    [v5 serviceViewControllerDidFinishWithResult:0];
  }
}

- (void)didReceiveWebClipIcon:(id)a3
{
}

- (void)didCopyStagedCookiesToURL:(id)a3 sandboxExtensionToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SFAddToHomeScreenServiceViewController *)self _hostAuditToken];
  if (WBSAuditTokenHasEntitlement())
  {
    -[SFWebAppDataProvider updateWithStagedCookiesDirectoryURL:sandboxExtensionToken:](self->_provider, "updateWithStagedCookiesDirectoryURL:sandboxExtensionToken:", v6, v7, 0, 0, 0, 0);
  }
  else
  {
    uint64_t v8 = [(SFAddToHomeScreenServiceViewController *)self _remoteViewControllerProxy];
    [v8 serviceViewControllerDidFinishWithResult:0];

    [v7 UTF8String];
    sandbox_extension_consume();
    sandbox_extension_release();
  }
}

- (void)dataProvider:(id)a3 didFinishWithResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(SFAddToHomeScreenServiceViewController *)self _remoteViewControllerProxy];
  [v5 serviceViewControllerDidFinishWithResult:v4];
}

- (void).cxx_destruct
{
}

@end