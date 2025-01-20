@interface DDMessageCacheStringForMessage
@end

@implementation DDMessageCacheStringForMessage

uint64_t ___DDMessageCacheStringForMessage_block_invoke()
{
  v0 = objc_alloc_init(DDMessageCache);
  uint64_t v1 = _DDMessageCacheStringForMessage__cache;
  _DDMessageCacheStringForMessage__cache = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end