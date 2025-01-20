@interface NSOrderedCollectionDifference(AppleMediaServices)
- (id)ams_insertedObjects;
- (id)ams_removedObjects;
@end

@implementation NSOrderedCollectionDifference(AppleMediaServices)

- (id)ams_insertedObjects
{
  v1 = [a1 insertions];
  v2 = objc_msgSend(v1, "ams_mapWithTransform:", &__block_literal_global_150);

  return v2;
}

- (id)ams_removedObjects
{
  v1 = [a1 removals];
  v2 = objc_msgSend(v1, "ams_mapWithTransform:", &__block_literal_global_2_0);

  return v2;
}

@end