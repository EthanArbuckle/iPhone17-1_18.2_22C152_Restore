@interface MPCCreateDelegateAccountPlaybackRequestEnvironment
@end

@implementation MPCCreateDelegateAccountPlaybackRequestEnvironment

void ____MPCCreateDelegateAccountPlaybackRequestEnvironment_block_invoke_226(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t ____MPCCreateDelegateAccountPlaybackRequestEnvironment_block_invoke(uint64_t a1, void *a2, int a3)
{
  if (a3) {
    return [a2 setDelegated:1];
  }
  return result;
}

@end