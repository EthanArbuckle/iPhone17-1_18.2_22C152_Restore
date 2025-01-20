@interface DKEventStatsCollection
@end

@implementation DKEventStatsCollection

uint64_t __46___DKEventStatsCollection_collectionWithName___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = _DKEventStatsCollections;
  _DKEventStatsCollections = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end