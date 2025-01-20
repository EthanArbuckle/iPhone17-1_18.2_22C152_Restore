@interface INIntent(_CDSpotlightRecorderAdditions)
- (uint64_t)cd_saveToKnowledgeStore;
- (uint64_t)cd_saveToPeopleStore;
@end

@implementation INIntent(_CDSpotlightRecorderAdditions)

- (uint64_t)cd_saveToPeopleStore
{
  return 0;
}

- (uint64_t)cd_saveToKnowledgeStore
{
  return 1;
}

@end