@interface NCWidgetExtensionContext
@end

@implementation NCWidgetExtensionContext

void __77___NCWidgetExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v6 = [a2 userInfo];
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    id v14 = v6;
    v7 = [v6 objectForKey:@"NCExtensionItemUserInfoInitialMaxLessSize"];
    v8 = v7;
    if (v7)
    {
      v9 = (CGSize *)(a1[4] + 24);
      CGSize *v9 = CGSizeFromString(v7);
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    }

    v6 = v14;
  }
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v15 = v6;
    v10 = [v6 objectForKey:@"NCExtensionItemUserInfoInitialMaxMoreSize"];
    v11 = v10;
    if (v10)
    {
      v12 = (CGSize *)(a1[4] + 40);
      CGSize *v12 = CGSizeFromString(v10);
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    }

    v6 = v15;
  }
  char v13 = *(unsigned char *)(*(void *)(a1[5] + 8) + 24);
  if (v13) {
    char v13 = *(unsigned char *)(*(void *)(a1[6] + 8) + 24) != 0;
  }
  *a4 = v13;
}

void __55___NCWidgetExtensionContext_openURL_completionHandler___block_invoke(uint64_t a1)
{
  v15[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F3F608];
  v14[0] = *MEMORY[0x263F3F5E8];
  v14[1] = v2;
  v15[0] = MEMORY[0x263EFFA88];
  v15[1] = MEMORY[0x263EFFA88];
  v14[2] = *MEMORY[0x263F3F5C0];
  v15[2] = @"NCAppLaunchOriginWidget";
  v3 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  v4 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v5 = *(void *)(a1 + 32);
  id v13 = 0;
  char v6 = [v4 openSensitiveURL:v5 withOptions:v3 error:&v13];
  id v7 = v13;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    NSLog(&cfstr_SFailed.isa, "-[_NCWidgetExtensionContext openURL:completionHandler:]_block_invoke", v7);
  }
  if (*(void *)(a1 + 40))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55___NCWidgetExtensionContext_openURL_completionHandler___block_invoke_2;
    block[3] = &unk_264761638;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    id v11 = v8;
    uint64_t v12 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __55___NCWidgetExtensionContext_openURL_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

@end