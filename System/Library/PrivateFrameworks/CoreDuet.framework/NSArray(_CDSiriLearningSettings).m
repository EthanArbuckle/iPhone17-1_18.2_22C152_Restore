@interface NSArray(_CDSiriLearningSettings)
- (BOOL)_cd_containsSiriLearningBundleId:()_CDSiriLearningSettings;
@end

@implementation NSArray(_CDSiriLearningSettings)

- (BOOL)_cd_containsSiriLearningBundleId:()_CDSiriLearningSettings
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(a1, "count"), 0, &__block_literal_global_36);

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

@end