@interface SKStoreReviewController
+ (BOOL)_isValidScene:(id)a3;
+ (unint64_t)convertInterfaceOrientation:(int64_t)a3;
+ (void)requestReview;
+ (void)requestReviewInScene:(UIWindowScene *)windowScene;
+ (void)requestReviewViaDirectInjectionFlowInScene:(id)a3 requestToken:(id)a4;
@end

@implementation SKStoreReviewController

+ (void)requestReview
{
  if (!+[SKEntitlementChecker checkForEntitlement:@"com.apple.developer.on-demand-install-capable"])
  {
    id v4 = [MEMORY[0x1E4FB1F48] keyWindow];
    v3 = [v4 windowScene];
    [a1 requestReviewInScene:v3];
  }
}

+ (void)requestReviewInScene:(UIWindowScene *)windowScene
{
  id v4 = windowScene;
  v5 = [[SKXPCConnection alloc] initWithServiceName:0x1F08AA200];
  v6 = (void *)SSXPCCreateMessageDictionary();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__SKStoreReviewController_requestReviewInScene___block_invoke;
  v8[3] = &unk_1E5FAA918;
  v9 = v4;
  id v10 = a1;
  v7 = v4;
  [(SKXPCConnection *)v5 sendMessage:v6 withReply:v8];
}

void __48__SKStoreReviewController_requestReviewInScene___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  BOOL v5 = v3 == (id)MEMORY[0x1E4F14528] || v3 == (id)MEMORY[0x1E4F14520];
  if (!v5 && v3 && MEMORY[0x1B3E927C0](v3) == MEMORY[0x1E4F14590])
  {
    objc_opt_class();
    v13 = (void *)SSXPCDictionaryCopyCFObjectWithClass();
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    v15 = xpc_dictionary_get_value(v4, "2");
    v7 = (void *)[v14 initWithXPCEncoding:v15];

    if (v13)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__SKStoreReviewController_requestReviewInScene___block_invoke_2;
      block[3] = &unk_1E5FA9C08;
      v16 = *(void **)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 40);
      id v19 = v16;
      id v20 = v13;
      id v6 = v13;
      dispatch_async(MEMORY[0x1E4F14428], block);

      goto LABEL_19;
    }
    id v6 = v7;
    if (!v7) {
      goto LABEL_20;
    }
LABEL_10:
    v7 = [MEMORY[0x1E4FA81D8] sharedConfig];
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v22 = 138412546;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2112;
      id v25 = v6;
      id v11 = v23;
      LODWORD(v17) = 22;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_19:

        goto LABEL_20;
      }
      id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v22, v17);
      free(v12);
      SSFileLog();
    }

    goto LABEL_19;
  }
  SSError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6) {
    goto LABEL_10;
  }
LABEL_20:
}

void __48__SKStoreReviewController_requestReviewInScene___block_invoke_2(id *a1)
{
  uint64_t v2 = objc_msgSend(a1[6], "convertInterfaceOrientation:", objc_msgSend(a1[4], "interfaceOrientation"));
  id v3 = +[SKServiceBroker defaultBroker];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__SKStoreReviewController_requestReviewInScene___block_invoke_3;
  v12[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v12[4] = a1[6];
  id v4 = [v3 storeKitServiceWithErrorHandler:v12];

  BOOL v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v5 bundleIdentifier];
  v7 = [a1[4] _sceneIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__SKStoreReviewController_requestReviewInScene___block_invoke_23;
  v8[3] = &unk_1E5FAA8F0;
  id v11 = a1[6];
  id v9 = a1[4];
  id v10 = a1[5];
  [v4 requestProductReviewWithInterfaceOrientation:v2 bundleIdentifier:v6 sceneID:v7 replyBlock:v8];
}

void __48__SKStoreReviewController_requestReviewInScene___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_9;
  }
  *(_DWORD *)id v10 = 138412546;
  *(void *)&v10[4] = objc_opt_class();
  *(_WORD *)&v10[12] = 2112;
  *(void *)&v10[14] = v2;
  id v7 = *(id *)&v10[4];
  LODWORD(v9) = 22;
  int v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, v10, v9, *(_OWORD *)v10, *(void *)&v10[16], v11);
    free(v8);
    SSFileLog();
LABEL_9:
  }
}

uint64_t __48__SKStoreReviewController_requestReviewInScene___block_invoke_23(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 48) requestReviewViaDirectInjectionFlowInScene:*(void *)(result + 32) requestToken:*(void *)(result + 40)];
  }
  return result;
}

+ (void)requestReviewViaDirectInjectionFlowInScene:(id)a3 requestToken:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  uint64_t v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_9;
  }
  int v21 = 138412290;
  id v22 = (id)objc_opt_class();
  id v12 = v22;
  LODWORD(v16) = 12;
  v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v21, v16);
    free(v13);
    SSFileLog();
LABEL_9:
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__SKStoreReviewController_requestReviewViaDirectInjectionFlowInScene_requestToken___block_invoke;
  block[3] = &unk_1E5FA9C08;
  id v19 = v7;
  id v20 = a1;
  id v18 = v6;
  id v14 = v7;
  id v15 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __83__SKStoreReviewController_requestReviewViaDirectInjectionFlowInScene_requestToken___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 48) _isValidScene:*(void *)(a1 + 32)] & 1) == 0)
  {
    int v4 = [MEMORY[0x1E4FA81D8] sharedConfig];
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    id v7 = [v4 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      int v8 = v6;
    }
    else {
      int v8 = v6 & 2;
    }
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v13 = 138412290;
      uint64_t v14 = v9;
      LODWORD(v11) = 12;
      int v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        return;
      }
      id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v13, v11);
      free(v10);
      SSFileLog();
    }

    goto LABEL_15;
  }
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 sendAction:sel_resignFirstResponder to:0 from:0 forEvent:0];

  id v12 = [[SKStoreReviewViewController alloc] initWithReviewRequestToken:*(void *)(a1 + 40)];
  id v3 = [(UIApplicationRotationFollowingWindow *)[SKStoreReviewPresentationWindow alloc] initWithWindowScene:*(void *)(a1 + 32)];
  [(SKStoreReviewPresentationWindow *)v3 setHidden:0];
  [(SKStoreReviewViewController *)v12 setPresentationWindow:v3];
  [(SKStoreReviewPresentationWindow *)v3 presentViewController:v12 animated:1 completion:0];
}

+ (BOOL)_isValidScene:(id)a3
{
  id v3 = a3;
  if ([v3 activationState] != -1
    || ([MEMORY[0x1E4FB1438] sharedApplication],
        int v4 = objc_claimAutoreleasedReturnValue(),
        [v4 connectedScenes],
        int v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        int v6 = [v5 containsObject:v3],
        v5,
        v6))
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

+ (unint64_t)convertInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

@end