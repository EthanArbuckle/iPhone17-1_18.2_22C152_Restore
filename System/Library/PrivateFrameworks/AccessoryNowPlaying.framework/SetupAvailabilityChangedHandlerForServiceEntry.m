@interface SetupAvailabilityChangedHandlerForServiceEntry
@end

@implementation SetupAvailabilityChangedHandlerForServiceEntry

void ___SetupAvailabilityChangedHandlerForServiceEntry_block_invoke(uint64_t a1, int token)
{
  uint64_t state64 = 0xAAAAAAAAAAAAAAAALL;
  notify_get_state(token, &state64);
  pthread_rwlock_wrlock(&_gServerAvailableTokenLock);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  _gServerAvailable[v3] = state64 != 0;
  v4 = (void (**)(void *, BOOL))_Block_copy(*((const void **)&_gServerAvailabilityChangedHandler + v3));
  pthread_rwlock_unlock(&_gServerAvailableTokenLock);
  if (v4)
  {
    v4[2](v4, state64 != 0);
    _Block_release(v4);
  }
}

@end