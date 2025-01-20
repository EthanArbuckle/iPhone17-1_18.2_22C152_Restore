@interface BLSMemoryByteCountFormatter
+ (id)sharedFormatter;
@end

@implementation BLSMemoryByteCountFormatter

+ (id)sharedFormatter
{
  if (sharedFormatter_onceToken != -1) {
    dispatch_once(&sharedFormatter_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)sharedFormatter_byteCountFormatter;

  return v2;
}

uint64_t __46__BLSMemoryByteCountFormatter_sharedFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28B68]);
  v1 = (void *)sharedFormatter_byteCountFormatter;
  sharedFormatter_byteCountFormatter = (uint64_t)v0;

  v2 = (void *)sharedFormatter_byteCountFormatter;

  return [v2 setCountStyle:1];
}

@end