@interface FLExtensionViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (id)hostInterface;
- (id)syncHostInterface;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)finishProcessing;
- (void)finishProcessingWithUserInfo:(id)a3;
- (void)followUpPerformUpdateWithCompletionHandler:(id)a3;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation FLExtensionViewController

- (void)beginRequestWithExtensionContext:(id)a3
{
  v4 = (NSExtensionContext *)a3;
  v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_221DA3000, v5, OS_LOG_TYPE_DEFAULT, "Follow up extension starting", v7, 2u);
  }

  context = self->_context;
  self->_context = v4;
}

+ (id)_exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D45FCA8];
}

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D4681B0];
}

- (id)hostInterface
{
  return (id)[(NSExtensionContext *)self->_context hostContextWithErrorHandler:&__block_literal_global_0];
}

void __42__FLExtensionViewController_hostInterface__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __42__FLExtensionViewController_hostInterface__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (id)syncHostInterface
{
  return (id)[(NSExtensionContext *)self->_context syncHostContextWithErrorHandler:&__block_literal_global_49];
}

void __46__FLExtensionViewController_syncHostInterface__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __42__FLExtensionViewController_hostInterface__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)finishProcessing
{
}

- (void)finishProcessingWithUserInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221DA3000, v5, OS_LOG_TYPE_DEFAULT, "Extension called finish", buf, 2u);
  }

  uint64_t v6 = [(NSExtensionContext *)self->_context syncHostContextWithErrorHandler:&__block_literal_global_51];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__FLExtensionViewController_finishProcessingWithUserInfo___block_invoke_52;
  v7[3] = &unk_2645F2380;
  v7[4] = self;
  [v6 extensionDidFinishWithUserInfo:v4 completionHandler:v7];
}

void __58__FLExtensionViewController_finishProcessingWithUserInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __42__FLExtensionViewController_hostInterface__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

uint64_t __58__FLExtensionViewController_finishProcessingWithUserInfo___block_invoke_52(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 976))
  {
    uint64_t v1 = result;
    id v2 = _FLLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_221DA3000, v2, OS_LOG_TYPE_DEFAULT, "Running within extension context, terminating... ", v3, 2u);
    }

    return [*(id *)(*(void *)(v1 + 32) + 976) completeRequestReturningItems:0 completionHandler:0];
  }
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FLExtensionViewController;
  [(FLExtensionViewController *)&v6 viewDidAppear:a3];
  uint64_t v4 = [(FLExtensionViewController *)self view];
  uint64_t v5 = [v4 window];
  [v5 makeKeyAndVisible];
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void))a5;
  v10 = _FLLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_221DA3000, v10, OS_LOG_TYPE_DEFAULT, "Extension is processing item: %@ action: %@", (uint8_t *)&v11, 0x16u);
  }

  if (v9) {
    v9[2](v9, 0);
  }
}

- (void)followUpPerformUpdateWithCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

void __42__FLExtensionViewController_hostInterface__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end