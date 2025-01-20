@interface _MXExtensionHostContext
- (_MXExtensionURLHandling)URLHandlingDelegate;
- (void)openURL:(id)a3 completionHandler:(id)a4;
- (void)setURLHandlingDelegate:(id)a3;
@end

@implementation _MXExtensionHostContext

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(_MXExtensionHostContext *)self URLHandlingDelegate];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53___MXExtensionHostContext_openURL_completionHandler___block_invoke;
  v10[3] = &unk_1E54B89C0;
  id v11 = v6;
  id v9 = v6;
  [v8 openURL:v7 completionHandler:v10];
}

- (_MXExtensionURLHandling)URLHandlingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_URLHandlingDelegate);

  return (_MXExtensionURLHandling *)WeakRetained;
}

- (void)setURLHandlingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end