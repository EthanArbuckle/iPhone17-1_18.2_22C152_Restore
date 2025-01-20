@interface MPCPlaybackRequestEnvironmentFromProtoAccountInfo
@end

@implementation MPCPlaybackRequestEnvironmentFromProtoAccountInfo

void ____MPCPlaybackRequestEnvironmentFromProtoAccountInfo_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (*(unsigned char *)(a1 + 64))
    {
      v6 = (void *)MEMORY[0x263EFFA88];
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7 && (*(unsigned char *)(v7 + 116) & 8) != 0)
      {
        v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(v7 + 112)];
      }
      else
      {
        v6 = 0;
      }
    }
    v8 = (MPCPlaybackRequestEnvironment *)*(id *)(a1 + 40);
    if (!v8)
    {
      if (*(void *)(a1 + 48))
      {
        v9 = [MPCPlaybackRequestEnvironment alloc];
        v10 = [*(id *)(a1 + 48) userIdentity];
        v8 = [(MPCPlaybackRequestEnvironment *)v9 initWithUserIdentity:v10];
      }
      else
      {
        v8 = 0;
      }
    }
    if (!*(void *)(a1 + 40))
    {
      v11 = [MEMORY[0x263F08690] currentHandler];
      v12 = objc_msgSend(NSString, "stringWithUTF8String:", "void __MPCPlaybackRequestEnvironmentFromProtoAccountInfo(_MPCProtoDelegateInfo *__strong, MPRemotePlaybackQueuePlaybackContextOptions, void (^__strong)(MPCPlaybackRequestEnvironment * _Nullable __strong, NSNumber * _Nullable __strong, NSError * _Nullable __strong))_block_invoke");
      [v11 handleFailureInFunction:v12, @"MPRemotePlaybackQueue+MPCAdditions.m", 350, @"Failed to produce playback request environment for accountInfo: %@, desiredAccount: %@", *(void *)(a1 + 32), *(void *)(a1 + 48) file lineNumber description];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

@end