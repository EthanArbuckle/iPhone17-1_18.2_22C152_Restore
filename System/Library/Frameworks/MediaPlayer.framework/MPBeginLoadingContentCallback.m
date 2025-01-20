@interface MPBeginLoadingContentCallback
@end

@implementation MPBeginLoadingContentCallback

void ___MPBeginLoadingContentCallback_block_invoke(uint64_t a1, uint64_t a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (a2 != 1) {
      return;
    }
    if (dyld_program_sdk_at_least())
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MPBeginLoadingContentCallback(MRMediaRemoteIndexPath, void *, void (^__strong)(CFErrorRef))_block_invoke");
      [v5 handleFailureInFunction:v6 file:@"MPPlayableContentManager.m" lineNumber:598 description:@"-beginLoadingChildItemsAtIndexPath:completionHandler: completion handler was released without being called."];
    }
    v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "-beginLoadingChildItemsAtIndexPath:completionHandler: completion handler was released without being called", v7, 2u);
    }
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28228];
    v9[0] = @"MPPlayableContentManager.datasource did not respond to beginLoadingChildItemsAtIndexPath: before timeout.";
    v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, [v4 errorWithDomain:@"MPErrorDomain" code:7 userInfo:v2]);
  }
}

void ___MPBeginLoadingContentCallback_block_invoke_226(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "Loading operation at completed at index path: %{public}@, error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  if ([*(id *)(a1 + 40) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

@end