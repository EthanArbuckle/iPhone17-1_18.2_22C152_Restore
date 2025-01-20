@interface CalStoreDelegateToggled
@end

@implementation CalStoreDelegateToggled

uint64_t ___CalStoreDelegateToggled_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("delegateDataCleanupQueue", 0);
  v1 = (void *)_CalStoreDelegateToggled_delegateDataCleanupQueue;
  _CalStoreDelegateToggled_delegateDataCleanupQueue = (uint64_t)v0;

  uint64_t v2 = objc_opt_new();
  uint64_t v3 = _CalStoreDelegateToggled_storeIDsPendingCleanup;
  _CalStoreDelegateToggled_storeIDsPendingCleanup = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

void ___CalStoreDelegateToggled_block_invoke_2(uint64_t a1)
{
  id obj = (id)_CalStoreDelegateToggled_storeIDsPendingCleanup;
  objc_sync_enter(obj);
  if ([(id)_CalStoreDelegateToggled_storeIDsPendingCleanup containsObject:*(void *)(a1 + 32)])
  {
    [(id)_CalStoreDelegateToggled_storeIDsPendingCleanup removeObject:*(void *)(a1 + 32)];
    objc_sync_exit(obj);

    [*(id *)(a1 + 32) intValue];
    _CalStoreDeleteDisabledDelegateData();
  }
  else
  {
    objc_sync_exit(obj);
  }
}

@end