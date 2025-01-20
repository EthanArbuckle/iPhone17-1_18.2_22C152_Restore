@interface AFGetNowPlayingMediaContentItmes
@end

@implementation AFGetNowPlayingMediaContentItmes

uint64_t ___AFGetNowPlayingMediaContentItmes_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___AFGetNowPlayingMediaContentItmes_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal) {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  }
  if (a2)
  {
    id v6 = a3;
    id v9 = (id)MRPlaybackQueueCopyContentItems();
    MRPlaybackQueueGetRange();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    v8 = *(void (**)(uint64_t, void, uint64_t, void))(v7 + 16);
    id v9 = a3;
    v8(v7, 0, -1, 0);
  }
}

@end