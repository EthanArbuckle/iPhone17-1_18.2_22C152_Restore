@interface QLPreviewExtensionServiceContext_iOS
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (QLPreviewingController)previewProvider;
- (id)protocolHost;
- (void)_startObservingPreviewControllerAttributeChanges;
- (void)_stopObservingPreviewControllerAttributeChanges;
- (void)dealloc;
- (void)generatePreviewForURL:(id)a3 completion:(id)a4;
- (void)getARQLInlineProxy2WithCompletionHandler:(id)a3;
- (void)getARQLInlineProxy3WithCompletionHandler:(id)a3;
- (void)getARQLInlineProxyWithCompletionHandler:(id)a3;
- (void)getPrinterProxyWithCompletionHandler:(id)a3;
- (void)invalidateServiceWithCompletionHandler:(id)a3;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)previewControllerDidUpdatePreferredContentSize:(id)a3;
- (void)previewControllerDidUpdateTitle:(id)a3;
- (void)previewControllerWantsFullScreen:(BOOL)a3;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)previewWillAppear:(BOOL)a3;
- (void)previewWillDisappear:(BOOL)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setHostViewControllerProxy:(id)a3;
- (void)setPreviewProvider:(id)a3;
@end

@implementation QLPreviewExtensionServiceContext_iOS

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_0 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_0, &__block_literal_global_15);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface_0;

  return v2;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_0 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_0, &__block_literal_global_217);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface_0;

  return v2;
}

- (id)protocolHost
{
  v2 = [(QLPreviewExtensionServiceContext_iOS *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_219];

  return v3;
}

- (void)previewControllerWantsFullScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(QLPreviewExtensionServiceContext_iOS *)self protocolHost];
  [v4 previewControllerWantsFullScreen:v3];
}

- (void)previewControllerDidUpdateTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewExtensionServiceContext_iOS *)self protocolHost];
  [v5 previewControllerDidUpdateTitle:v4];
}

- (void)previewControllerDidUpdatePreferredContentSize:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewExtensionServiceContext_iOS *)self protocolHost];
  [v5 previewControllerDidUpdatePreferredContentSize:v4];
}

- (void)previewWillAppear:(BOOL)a3
{
  BOOL v3 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4) {
    QLRunInMainThread();
  }
}

- (void)previewDidAppear:(BOOL)a3
{
  BOOL v3 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4) {
    QLRunInMainThread();
  }
}

- (void)previewWillDisappear:(BOOL)a3
{
  BOOL v3 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4) {
    QLRunInMainThread();
  }
}

- (void)previewDidDisappear:(BOOL)a3
{
  BOOL v3 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4) {
    QLRunInMainThread();
  }
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  v6 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = v5;
    QLRunInMainThread();
  }
}

- (void)getPrinterProxyWithCompletionHandler:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  char v4 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
    char v7 = [v6 printer];
    v8[2](v8, v7);
  }
  else
  {
    v8[2](v8, 0);
  }
}

- (void)getARQLInlineProxyWithCompletionHandler:(id)a3
{
  char v7 = (void (**)(id, void *))a3;
  char v4 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
  int v5 = [v4 conformsToProtocol:&unk_26C9691A0];

  if (v5)
  {
    v6 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
    v7[2](v7, v6);
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (void)getARQLInlineProxy2WithCompletionHandler:(id)a3
{
  char v7 = (void (**)(id, void *))a3;
  char v4 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
  int v5 = [v4 conformsToProtocol:&unk_26C971FF0];

  if (v5)
  {
    v6 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
    v7[2](v7, v6);
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (void)getARQLInlineProxy3WithCompletionHandler:(id)a3
{
  char v7 = (void (**)(id, void *))a3;
  char v4 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
  int v5 = [v4 conformsToProtocol:&unk_26C972368];

  if (v5)
  {
    v6 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
    v7[2](v7, v6);
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (void)setHostViewControllerProxy:(id)a3
{
  id v4 = a3;
  int v5 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = v4;
      QLRunInMainThread();
    }
  }
  else
  {
  }
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v13 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
    uint64_t v14 = [v9 canBeShared];
    if (v14 != [v13 isShareEnabled]) {
      [v13 setIsShareEnabled:v14];
    }
    v15 = [v9 clientPreviewOptions];
    if (v15)
    {
      v16 = [v13 previewOptions];
      char v17 = [v16 isEqual:v15];

      if ((v17 & 1) == 0) {
        [v13 setPreviewOptions:v15];
      }
    }
  }
  v18 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
  v19 = [v9 clientPreviewItemDisplayState];
  if (v19)
  {
    v20 = [v18 previewItemDisplayState];
    char v21 = [v20 isEqual:v19];

    if ((v21 & 1) == 0) {
      [v18 setPreviewItemDisplayState:v19];
    }
  }
  v24 = v8;
  id v22 = v10;
  id v23 = v8;
  QLRunInMainThread();
}

- (void)generatePreviewForURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  char v7 = (void (**)(id, void, void *))a4;
  id v8 = [(QLPreviewExtensionServiceContext_iOS *)self previewProvider];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_5;
  }
  id v9 = [(QLPreviewExtensionServiceContext_iOS *)self previewProvider];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_5:
    v16 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.quicklook.QLRemoteItemViewController" code:3 userInfo:0];
    v7[2](v7, 0, v16);

    goto LABEL_6;
  }
  id v11 = objc_alloc(MEMORY[0x263F62900]);
  v12 = [v6 fileURL];
  v13 = (void *)[v11 initWithURL:v12];

  uint64_t v14 = [(QLPreviewExtensionServiceContext_iOS *)self previewProvider];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke;
  v17[3] = &unk_2642F7190;
  v20 = v7;
  id v18 = v13;
  id v19 = v6;
  id v15 = v13;
  [v14 providePreviewForFileRequest:v15 completionHandler:v17];

LABEL_6:
}

- (void)invalidateServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(QLPreviewExtensionServiceContext_iOS *)self inputItems];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__QLPreviewExtensionServiceContext_iOS_invalidateServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_2642F5E08;
  id v8 = v4;
  id v6 = v4;
  [(QLPreviewExtensionServiceContext_iOS *)self completeRequestReturningItems:v5 completionHandler:v7];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a6 == &QLRemoteItemViewControllerContext)
  {
    if ([v10 isEqualToString:@"title"])
    {
      v12 = [v11 title];
      [(QLPreviewExtensionServiceContext_iOS *)self previewControllerDidUpdateTitle:v12];
    }
    else
    {
      if (![v10 isEqualToString:@"preferredContentSize"]) {
        goto LABEL_8;
      }
      v13 = (void *)MEMORY[0x263F08D40];
      [v11 preferredContentSize];
      v12 = objc_msgSend(v13, "valueWithCGSize:");
      [(QLPreviewExtensionServiceContext_iOS *)self previewControllerDidUpdatePreferredContentSize:v12];
    }

    goto LABEL_8;
  }
  v14.receiver = self;
  v14.super_class = (Class)QLPreviewExtensionServiceContext_iOS;
  [(QLPreviewExtensionServiceContext_iOS *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:a5 context:a6];
LABEL_8:
}

- (void)_startObservingPreviewControllerAttributeChanges
{
  BOOL v3 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
  [v3 addObserver:self forKeyPath:@"title" options:0 context:&QLRemoteItemViewControllerContext];

  id v4 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
  [v4 addObserver:self forKeyPath:@"preferredContentSize" options:0 context:&QLRemoteItemViewControllerContext];

  self->_isObservingPreviewController = 1;
}

- (void)_stopObservingPreviewControllerAttributeChanges
{
  BOOL v3 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
  [v3 removeObserver:self forKeyPath:@"title" context:&QLRemoteItemViewControllerContext];

  id v4 = [(QLPreviewExtensionServiceContext_iOS *)self previewViewController];
  [v4 removeObserver:self forKeyPath:@"preferredContentSize" context:&QLRemoteItemViewControllerContext];

  self->_isObservingPreviewController = 0;
}

- (void)dealloc
{
  if (self->_isObservingPreviewController) {
    [(QLPreviewExtensionServiceContext_iOS *)self _stopObservingPreviewControllerAttributeChanges];
  }
  v3.receiver = self;
  v3.super_class = (Class)QLPreviewExtensionServiceContext_iOS;
  [(QLPreviewExtensionServiceContext_iOS *)&v3 dealloc];
}

- (QLPreviewingController)previewProvider
{
  return self->_previewProvider;
}

- (void)setPreviewProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewProvider, 0);

  objc_storeStrong(&self->_contents, 0);
}

@end