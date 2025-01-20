@interface MPAVItem(MPUContentItemIdentifierCollectionAdditions)
- (uint64_t)MPU_contentItemIdentifierCollection;
@end

@implementation MPAVItem(MPUContentItemIdentifierCollectionAdditions)

- (uint64_t)MPU_contentItemIdentifierCollection
{
  return 0;
}

@end