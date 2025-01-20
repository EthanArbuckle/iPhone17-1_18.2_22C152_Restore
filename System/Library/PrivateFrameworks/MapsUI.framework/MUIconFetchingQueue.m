@interface MUIconFetchingQueue
@end

@implementation MUIconFetchingQueue

uint64_t ___MUIconFetchingQueue_block_invoke()
{
  uint64_t v0 = geo_dispatch_queue_create_with_qos();
  uint64_t v1 = _MergedGlobals_131;
  _MergedGlobals_131 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end