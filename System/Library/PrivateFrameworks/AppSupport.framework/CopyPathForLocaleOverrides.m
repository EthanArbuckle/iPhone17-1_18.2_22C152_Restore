@interface CopyPathForLocaleOverrides
@end

@implementation CopyPathForLocaleOverrides

id ___CopyPathForLocaleOverrides_block_invoke()
{
  id result = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  _CopyPathForLocaleOverrides_appSupportBundle = (uint64_t)result;
  return result;
}

@end