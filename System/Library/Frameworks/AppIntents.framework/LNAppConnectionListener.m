@interface LNAppConnectionListener
+ (id)sharedListener;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (void)handleAction:(id)a3 completionHandler:(id)a4;
- (void)performOneShotAction:(id)a3 executorOptions:(id)a4 completionHandler:(id)a5;
@end

@implementation LNAppConnectionListener

+ (id)sharedListener
{
  if (sharedListener_onceToken[0] != -1) {
    dispatch_once(sharedListener_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedListener_value;

  return v2;
}

- (void)handleAction:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  v8 = (void *)getUILinkConnectionActionClass_softClass;
  uint64_t v25 = getUILinkConnectionActionClass_softClass;
  if (!getUILinkConnectionActionClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v27 = __getUILinkConnectionActionClass_block_invoke;
    v28 = &unk_264CA92D0;
    v29 = &v22;
    __getUILinkConnectionActionClass_block_invoke((uint64_t)&buf);
    v8 = (void *)v23[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v22, 8);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"This method can only handle UILinkConnectionAction objects" userInfo:0];
    objc_exception_throw(v18);
  }
  v10 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_23624D000, v10, OS_LOG_TYPE_INFO, "Received UILinkConnectionAction: %{public}@)", (uint8_t *)&buf, 0xCu);
  }

  v11 = [v6 action];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__LNAppConnectionListener_handleAction_completionHandler___block_invoke;
  aBlock[3] = &unk_264CA9208;
  aBlock[4] = self;
  id v12 = v11;
  id v20 = v12;
  id v13 = v7;
  id v21 = v13;
  v14 = (void (**)(void))_Block_copy(aBlock);
  id v15 = v12;
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16 = [v15 action];
    v17 = [v15 executorOptions];
    [(LNAppConnectionListener *)self performOneShotAction:v16 executorOptions:v17 completionHandler:v14];
  }
  else
  {

    v14[2](v14);
  }
}

void __58__LNAppConnectionListener_handleAction_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F51FA8]);
  v3 = [*(id *)(a1 + 32) xpcListener];
  v4 = [v3 endpoint];
  v5 = [MEMORY[0x263F08AB0] processInfo];
  id v6 = v5;
  if (v5) {
    objc_msgSend(v5, "if_auditToken");
  }
  else {
    memset(v16, 0, sizeof(v16));
  }
  id v7 = (void *)[v2 initWithXPCListenerEndpoint:v4 auditToken:v16];

  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v8 = (void *)getUILinkConnectionActionResponseClass_softClass;
  uint64_t v20 = getUILinkConnectionActionResponseClass_softClass;
  if (!getUILinkConnectionActionResponseClass_softClass)
  {
    *(void *)long long buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getUILinkConnectionActionResponseClass_block_invoke;
    uint64_t v22 = &unk_264CA92D0;
    v23 = &v17;
    __getUILinkConnectionActionResponseClass_block_invoke((uint64_t)buf);
    v8 = (void *)v18[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v17, 8);
  v10 = (void *)[[v9 alloc] initWithActionResponse:v7];
  v11 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138543618;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v12;
    _os_log_impl(&dword_23624D000, v11, OS_LOG_TYPE_INFO, "Sending UILinkConnectionActionResponse: %{public}@ for %{public}@", buf, 0x16u);
  }

  (*(void (**)(void, void *, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v10, v13, v14, v15);
}

- (void)performOneShotAction:(id)a3 executorOptions:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    id v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"LNAppConnectionListener.m", 79, @"Invalid parameter not satisfying: %@", @"executorOptions" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"LNAppConnectionListener.m", 80, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_4;
  }
  uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"LNAppConnectionListener.m", 78, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v12 = [LNOneShotActionExecutor alloc];
  uint64_t v13 = [(LNConnectionListener *)self appContext];
  uint64_t v14 = [(LNOneShotActionExecutor *)v12 initWithAction:v9 executorOptions:v10 appContext:v13];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __82__LNAppConnectionListener_performOneShotAction_executorOptions_completionHandler___block_invoke;
  v20[3] = &unk_264CA91B8;
  id v21 = v14;
  id v22 = v11;
  id v15 = v11;
  v16 = v14;
  [(LNOneShotActionExecutor *)v16 performWithCompletionHandler:v20];
}

uint64_t __82__LNAppConnectionListener_performOneShotAction_executorOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  id v2 = [(LNConnectionListener *)self xpcListener];
  v3 = [v2 endpoint];

  return (NSXPCListenerEndpoint *)v3;
}

void __41__LNAppConnectionListener_sharedListener__block_invoke()
{
  v0 = [LNAppConnectionListener alloc];
  id v3 = [MEMORY[0x263F08D88] anonymousListener];
  uint64_t v1 = [(LNConnectionListener *)v0 initWithListener:v3];
  id v2 = (void *)sharedListener_value;
  sharedListener_value = v1;
}

@end