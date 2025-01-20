@interface GSStorageManager(SwiftWorkaround)
+ (uint64_t)fp_defaultManager;
@end

@implementation GSStorageManager(SwiftWorkaround)

+ (uint64_t)fp_defaultManager
{
  return [MEMORY[0x263F406B8] manager];
}

@end