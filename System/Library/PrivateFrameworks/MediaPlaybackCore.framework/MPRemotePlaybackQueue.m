@interface MPRemotePlaybackQueue
@end

@implementation MPRemotePlaybackQueue

void __87__MPRemotePlaybackQueue_MPCAdditions__getRemoteRepresentationForPlayerPath_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v8)
  {
    [v8 getRemotePlaybackQueueRepresentationWithCompletion:*(void *)(a1 + 40)];
  }
  else if (v6)
  {
    if (*(void *)(a1 + 32))
    {
      (*(void (**)(void, void))(v6 + 16))(*(void *)(a1 + 40), 0);
    }
    else
    {
      v7 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:0 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
  }
}

@end