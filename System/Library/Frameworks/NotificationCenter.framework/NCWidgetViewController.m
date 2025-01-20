@interface NCWidgetViewController
@end

@implementation NCWidgetViewController

void __48___NCWidgetViewController__enqueueProxyRequest___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __48___NCWidgetViewController__enqueueProxyRequest___block_invoke_2;
  v2[3] = &unk_264761470;
  id v3 = *(id *)(a1 + 32);
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v4);
}

void __48___NCWidgetViewController__enqueueProxyRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);
}

void __71___NCWidgetViewController__processInputItems_initialActiveDisplayMode___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v33 = a2;
  v6 = [v33 userInfo];
  v7 = v6;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v8 = [v6 objectForKey:@"NCExtensionItemUserInfoWidgetIdentifier"];
    if ([v8 length])
    {
      uint64_t v9 = [v8 copy];
      uint64_t v10 = *(void *)(a1 + 32);
      v11 = *(void **)(v10 + 1064);
      *(void *)(v10 + 1064) = v9;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v12 = [v7 objectForKey:@"NCExtensionItemUserInfoContainerIdentifier"];
    if ([v12 length])
    {
      uint64_t v13 = [v12 copy];
      uint64_t v14 = *(void *)(a1 + 32);
      v15 = *(void **)(v14 + 1072);
      *(void *)(v14 + 1072) = v13;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v16 = [v7 objectForKey:@"NCExtensionItemUserInfoDefaultMargins"];
    if ([(NSString *)v16 length])
    {
      v17 = (UIEdgeInsets *)(*(void *)(a1 + 32) + 1080);
      UIEdgeInsets *v17 = UIEdgeInsetsFromString(v16);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    v18 = [v7 objectForKey:@"NCExtensionItemUserInfoInitialLayoutMargins"];
    if ([(NSString *)v18 length])
    {
      v19 = (UIEdgeInsets *)(*(void *)(a1 + 32) + 1112);
      UIEdgeInsets *v19 = UIEdgeInsetsFromString(v18);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    v20 = [v7 objectForKey:@"NCExtensionItemUserInfoInitialBounds"];
    v21 = v20;
    if (v20)
    {
      v22 = (CGRect *)(*(void *)(a1 + 32) + 1000);
      CGRect *v22 = CGRectFromString(v20);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    v23 = [v7 objectForKey:@"NCExtensionItemUserInfoInitialActiveDisplayMode"];
    v24 = v23;
    if (v23)
    {
      if (*(void *)(a1 + 120)) {
        **(void **)(a1 + 120) = [v23 integerValue];
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    v25 = [v7 objectForKey:@"NCExtensionItemUserInfoInitialMaxLessSize"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v25 != 0;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    v26 = [v7 objectForKey:@"NCExtensionItemUserInfoInitialMaxMoreSize"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v26 != 0;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24))
  {
    v27 = [v7 objectForKey:@"NCExtensionItemUserInfoInitialVisibilityState"];
    v28 = v27;
    if (v27)
    {
      *(void *)(*(void *)(a1 + 32) + 1048) = [v27 integerValue];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24))
  {
    v29 = [v7 objectForKey:@"NCExtensionItemUserInfoSnapshotTimestampsEnabled"];
    v30 = v29;
    if (v29)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 1032) = [v29 BOOLValue];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 1;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)
    || (char v31 = *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24)) != 0)
  {
    v32 = (void *)[v7 mutableCopy];
    [v32 removeObjectForKey:@"NCExtensionItemUserInfoWidgetIdentifier"];
    [v32 removeObjectForKey:@"NCExtensionItemUserInfoContainerIdentifier"];
    [v32 removeObjectForKey:@"NCExtensionItemUserInfoDefaultMargins"];
    [v32 removeObjectForKey:@"NCExtensionItemUserInfoInitialBounds"];
    [v32 removeObjectForKey:@"NCExtensionItemUserInfoInitialActiveDisplayMode"];
    [v32 removeObjectForKey:@"NCExtensionItemUserInfoInitialMaxLessSize"];
    [v32 removeObjectForKey:@"NCExtensionItemUserInfoInitialMaxMoreSize"];
    [v32 removeObjectForKey:@"NCExtensionItemUserInfoInitialVisibilityState"];
    [v32 removeObjectForKey:@"NCExtensionItemUserInfoSnapshotTimestampsEnabled"];
    [v33 setUserInfo:v32];

    char v31 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v31)
    {
      char v31 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (v31)
      {
        char v31 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        if (v31)
        {
          char v31 = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
          if (v31)
          {
            char v31 = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
            if (v31)
            {
              char v31 = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
              if (v31)
              {
                char v31 = *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
                if (v31) {
                  char v31 = *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) != 0;
                }
              }
            }
          }
        }
      }
    }
  }
  *a4 = v31;
}

void __60___NCWidgetViewController_beginRequestWithExtensionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 _remoteViewControllerProxy];
  objc_msgSend(v3, "__setLargestAvailableDisplayMode:", *(void *)(a1 + 32));
}

void __60___NCWidgetViewController__closeTransactionWithAppearState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 _remoteViewControllerProxy];
  objc_msgSend(v3, "__closeTransactionForAppearanceCallWithState:withIdentifier:", *(unsigned int *)(a1 + 40), *(void *)(a1 + 32));
}

void __42___NCWidgetViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _closeTransactionWithAppearState:1];
}

void __55___NCWidgetViewController__requestPreferredViewHeight___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 _remoteViewControllerProxy];
  objc_msgSend(v3, "__requestPreferredViewHeight:", *(double *)(a1 + 32));
}

void __55___NCWidgetViewController__requestPreferredViewHeight___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained _contentProvidingViewController];
  v2 = [v1 view];
  [v2 layoutBelowIfNeeded];
}

void __78___NCWidgetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained _contentProvidingViewController];
  v2 = [v1 view];
  [v2 layoutBelowIfNeeded];
}

uint64_t __63___NCWidgetViewController__performUpdateWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, 1);
  }
  return result;
}

void __70___NCWidgetViewController__clientLargestSupportedDisplayModeDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 _remoteViewControllerProxy];
  objc_msgSend(v3, "__setLargestAvailableDisplayMode:", *(void *)(a1 + 32));
}

void __88___NCWidgetViewController__encodeLayerTreeToURL_withCodingImageFormat_withReplyHandler___block_invoke(id *a1)
{
  v20[2] = *MEMORY[0x263EF8340];
  v2 = [a1[4] context];

  if (v2)
  {
    [MEMORY[0x263F158F8] begin];
    if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
      [MEMORY[0x263F158F8] activateBackground:1];
    }
    id v3 = [a1[5] path];
    id v4 = objc_alloc(MEMORY[0x263EFF9A0]);
    v5 = objc_msgSend(v4, "initWithObjectsAndKeys:", MEMORY[0x263EFFA88], *MEMORY[0x263F159A8], 0);
    if ([a1[6] isEqualToString:@"com.apple.atx"])
    {
      [v5 setObject:@"com.apple.atx" forKey:*MEMORY[0x263F15998]];
      uint64_t v6 = *MEMORY[0x263F0F080];
      uint64_t v7 = *MEMORY[0x263F0F078];
      v19[0] = *MEMORY[0x263F0F1B0];
      v19[1] = v7;
      v20[0] = v6;
      v20[1] = &unk_26D928400;
      v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
      [v5 setObject:v8 forKey:*MEMORY[0x263F159A0]];
    }
    CAMLEncodeLayerTreeToPathWithOptions();
    CFRelease(v3);
    [MEMORY[0x263F158F8] commit];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88___NCWidgetViewController__encodeLayerTreeToURL_withCodingImageFormat_withReplyHandler___block_invoke_128;
    block[3] = &unk_264761580;
    id v15 = a1[7];
    id v16 = 0;
    id v17 = a1[8];
    id v9 = 0;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    uint64_t v10 = NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_ERROR)) {
      __88___NCWidgetViewController__encodeLayerTreeToURL_withCodingImageFormat_withReplyHandler___block_invoke_cold_1(v10);
    }
    v11 = NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225AA6000, v11, OS_LOG_TYPE_DEFAULT, "Attempt to snapshot a layer not attached to a context", buf, 2u);
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __88___NCWidgetViewController__encodeLayerTreeToURL_withCodingImageFormat_withReplyHandler___block_invoke_130;
    v12[3] = &unk_2647615A8;
    id v13 = a1[8];
    dispatch_async(MEMORY[0x263EF83A0], v12);
    id v9 = v13;
  }
}

void __88___NCWidgetViewController__encodeLayerTreeToURL_withCodingImageFormat_withReplyHandler___block_invoke_128(void *a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  if (v2) {
    [v2 removeFromSuperview];
  }
  id v3 = (void *)a1[5];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08320];
    v5 = [v3 description];
    v9[0] = v5;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v7 = [v4 errorWithDomain:@"NCWidgetErrorDomain" code:1 userInfo:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __88___NCWidgetViewController__encodeLayerTreeToURL_withCodingImageFormat_withReplyHandler___block_invoke_130(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F08320];
  v6[0] = @"The layer being encoded isn't attached to a context";
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = [v2 errorWithDomain:@"NCWidgetErrorDomain" code:2 userInfo:v3];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);
}

void __88___NCWidgetViewController__encodeLayerTreeToURL_withCodingImageFormat_withReplyHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_225AA6000, log, OS_LOG_TYPE_ERROR, "The layer being encoded must be attached to a context", v1, 2u);
}

@end