@interface MPInitiatePlaybackCallback
@end

@implementation MPInitiatePlaybackCallback

void ___MPInitiatePlaybackCallback_block_invoke(uint64_t a1, uint64_t a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (a2 != 1) {
      return;
    }
    if (dyld_program_sdk_at_least())
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MPInitiatePlaybackCallback(MRMediaRemoteIndexPath, void *)_block_invoke");
      [v6 handleFailureInFunction:v7 file:@"MPPlayableContentManager.m" lineNumber:703 description:@"-playableContentManager:initiatePlaybackOfContentItemAtIndexPath:completionHandler: completion handler was released without being called."];
    }
    v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "-playableContentManager:initiatePlaybackOfContentItemAtIndexPath:completionHandler: completion handler was released without being called", v8, 2u);
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28228];
    v10[0] = @"MPPlayableContentManager.datasource did not respond to playableContentManager:initiatePlaybackOfContentItemAtIndexPath: before timeout.";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    v2 = [v4 errorWithDomain:@"MPErrorDomain" code:7 userInfo:v5];

    [*(id *)(a1 + 32) _handlePlaybackInitializationCompletedWithContext:*(void *)(a1 + 40) error:v2];
  }
}

void ___MPInitiatePlaybackCallback_block_invoke_239(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) disarm]) {
    [*(id *)(a1 + 40) _handlePlaybackInitializationCompletedWithContext:*(void *)(a1 + 48) error:v3];
  }
}

@end