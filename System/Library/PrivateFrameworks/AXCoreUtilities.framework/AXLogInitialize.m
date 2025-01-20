@interface AXLogInitialize
@end

@implementation AXLogInitialize

uint64_t ___AXLogInitialize_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("_AXLogThresholdQueue", 0);
  v1 = (void *)_AXLogThresholdQueue;
  _AXLogThresholdQueue = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = (void *)_AXLogThresholdMap;
  _AXLogThresholdMap = (uint64_t)v2;

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v5 = (void *)_OSLogCache;
  _OSLogCache = (uint64_t)v4;

  v6 = [AXDispatchTimer alloc];
  _AXLogThresholdCleanupTimer = [(AXDispatchTimer *)v6 initWithTargetSerialQueue:_AXLogThresholdQueue];
  return MEMORY[0x1F41817F8]();
}

@end