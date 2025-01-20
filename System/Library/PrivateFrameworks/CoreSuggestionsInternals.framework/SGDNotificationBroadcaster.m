@interface SGDNotificationBroadcaster
+ (unint64_t)notificationCount;
+ (void)emitURLChanged;
@end

@implementation SGDNotificationBroadcaster

+ (unint64_t)notificationCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = getQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SGDNotificationBroadcaster_notificationCount__block_invoke;
  block[3] = &unk_1E65C0148;
  block[4] = &v6;
  dispatch_sync(v2, block);

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SGDNotificationBroadcaster_notificationCount__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = _notificationCount;
  return result;
}

+ (void)emitURLChanged
{
  if ((atomic_exchange(_notifyURLs_pending, 1u) & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1E4F93B18];
    getQueue();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 runAsyncOnQueue:v3 afterDelaySeconds:&__block_literal_global_26 block:0.3];
  }
}

@end