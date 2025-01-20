@interface GKExtensionContext
- (int64_t)sandboxToken;
- (void)dealloc;
- (void)hostApp:(id)a3 grantingAccessExtensionSandbox:(id)a4 replyWithEndpoint:(id)a5;
- (void)messageFromClient:(id)a3;
- (void)openURL:(id)a3 completionHandler:(id)a4;
- (void)setInitialState:(id)a3 withReply:(id)a4;
- (void)setSandboxToken:(int64_t)a3;
- (void)tearDownExtensionWithReply:(id)a3;
@end

@implementation GKExtensionContext

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F63698];
  v8 = (void (**)(id, uint64_t))a4;
  id v6 = a3;
  v7 = [v5 defaultWorkspace];
  [v7 openURL:v6];

  v8[2](v8, 1);
}

- (void)dealloc
{
  if (self->_sandboxToken >= 1) {
    sandbox_extension_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)GKExtensionContext;
  [(GKExtensionContext *)&v3 dealloc];
}

- (void)messageFromClient:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__GKExtensionContext_messageFromClient___block_invoke;
  v6[3] = &unk_1E5F63350;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __40__GKExtensionContext_messageFromClient___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _principalObject];
  [v2 messageFromClient:*(void *)(a1 + 40)];
}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(GKExtensionContext *)self _principalObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v10 = (id)GKOSLoggers();
    }
    v11 = (void *)*MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      -[GKExtensionContext setInitialState:withReply:](v11, self);
    }
  }
  v12 = [(GKExtensionContext *)self _principalObject];
  [v12 setInitialState:v7 withReply:v6];
}

- (void)tearDownExtensionWithReply:(id)a3
{
  id v5 = a3;
  id v4 = [(GKExtensionContext *)self _principalObject];
  if (objc_opt_respondsToSelector()) {
    [v4 tearDownExtensionWithReply:v5];
  }
}

- (void)hostApp:(id)a3 grantingAccessExtensionSandbox:(id)a4 replyWithEndpoint:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void *))a5;
  [a4 UTF8String];
  int64_t v10 = sandbox_extension_consume();
  self->_sandboxToken = v10;
  if (v10 < 0)
  {
    int v16 = *__error();
    if (!*MEMORY[0x1E4F63860]) {
      id v17 = (id)GKOSLoggers();
    }
    v18 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      -[GKExtensionContext hostApp:grantingAccessExtensionSandbox:replyWithEndpoint:](v16, v18);
    }
    v15 = 0;
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F63698] defaultWorkspace];
    v12 = [v11 applicationProxyForBundleID:v8];
    v13 = (void *)MEMORY[0x1E4F28B60];
    v14 = [v12 bundle];
    v15 = [v13 _extensionEndpointForMainBundleOfHostApplication:v14];

    if (v9) {
LABEL_3:
    }
      v9[2](v9, v15);
  }
}

- (int64_t)sandboxToken
{
  return self->_sandboxToken;
}

- (void)setSandboxToken:(int64_t)a3
{
  self->_sandboxToken = a3;
}

- (void)setInitialState:(void *)a1 withReply:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a1;
  id v4 = [a2 _principalObject];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1AF250000, v3, OS_LOG_TYPE_ERROR, "_principalObject contains instance of Unexpected class: %@", v7, 0xCu);
}

- (void)hostApp:(int)a1 grantingAccessExtensionSandbox:(NSObject *)a2 replyWithEndpoint:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "NSBundleResourceRequest encountered a sandboxing error (sandbox_extension_consume): %d", (uint8_t *)v2, 8u);
}

@end