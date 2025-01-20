@interface NSCharacterSet(_HKXMLExtractorCharacterSets)
+ (id)hk_equalCharacterSet;
+ (id)hk_forwardSlashCharacterSet;
+ (id)hk_percentCharacterSet;
@end

@implementation NSCharacterSet(_HKXMLExtractorCharacterSets)

+ (id)hk_forwardSlashCharacterSet
{
  if (hk_forwardSlashCharacterSet_once != -1) {
    dispatch_once(&hk_forwardSlashCharacterSet_once, &__block_literal_global_114);
  }
  v0 = (void *)hk_forwardSlashCharacterSet_sharedForwardSlashSet;

  return v0;
}

+ (id)hk_percentCharacterSet
{
  if (hk_percentCharacterSet_once != -1) {
    dispatch_once(&hk_percentCharacterSet_once, &__block_literal_global_155);
  }
  v0 = (void *)hk_percentCharacterSet_sharedPercentSet;

  return v0;
}

+ (id)hk_equalCharacterSet
{
  if (hk_equalCharacterSet_once != -1) {
    dispatch_once(&hk_equalCharacterSet_once, &__block_literal_global_160);
  }
  v0 = (void *)hk_equalCharacterSet_sharedEqualSet;

  return v0;
}

@end