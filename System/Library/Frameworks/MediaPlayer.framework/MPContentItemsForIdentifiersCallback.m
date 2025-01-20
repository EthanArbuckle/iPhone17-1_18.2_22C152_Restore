@interface MPContentItemsForIdentifiersCallback
@end

@implementation MPContentItemsForIdentifiersCallback

uint64_t ___MPContentItemsForIdentifiersCallback_block_invoke_2(uint64_t a1)
{
  uint64_t v3 = a1 + 40;
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(*(void *)(*(void *)(v3 + 8) + 8) + 40)) {
    return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 32));
  }
}

void ___MPContentItemsForIdentifiersCallback_block_invoke(uint64_t a1, uint64_t a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (a2 == 1)
    {
      if (dyld_program_sdk_at_least())
      {
        v9 = [MEMORY[0x1E4F28B00] currentHandler];
        v10 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MPContentItemsForIdentifiersCallback(CFArrayRef, void *, void (^__strong)(CFArrayRef, CFErrorRef))_block_invoke");
        [v9 handleFailureInFunction:v10 file:@"MPPlayableContentManager.m" lineNumber:744 description:@"-contentItemForIdentifier:completionHandler: completion handler was released without being called."];
      }
      uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "-contentItemForIdentifier:completionHandler: completion handler was released without being called", v11, 2u);
      }
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28228];
    v13[0] = @"MPPlayableContentManager.datasource did not respond to contentItemForIdentifier: before timeout.";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v6 = [v4 errorWithDomain:@"MPErrorDomain" code:7 userInfo:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void ___MPContentItemsForIdentifiersCallback_block_invoke_249(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) disarm])
  {
    if (v5)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
    }
    else if (v7)
    {
      uint64_t v6 = [v7 _mediaRemoteContentItem];
      [*(id *)(a1 + 40) lock];
      [*(id *)(a1 + 48) addObject:v6];
      [*(id *)(a1 + 40) unlock];
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
}

@end