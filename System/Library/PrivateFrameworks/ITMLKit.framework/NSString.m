@interface NSString
@end

@implementation NSString

uint64_t __38__NSString_ITMLKit__ik_sharedInstance__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  uint64_t v1 = sSharedStrings;
  sSharedStrings = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __55__NSString_ITMLKit__ik_sharedInstanceForDataKeysDomain__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)sSharedDataKeys;
  sSharedDataKeys = v0;

  v2 = (void *)sSharedDataKeys;
  return [v2 setCountLimit:500];
}

@end