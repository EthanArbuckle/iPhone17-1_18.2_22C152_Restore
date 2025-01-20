@interface NSManagedObjectContext(VSAdditions)
- (uint64_t)vs_removeAllPersistentStores;
@end

@implementation NSManagedObjectContext(VSAdditions)

- (uint64_t)vs_removeAllPersistentStores
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __67__NSManagedObjectContext_VSAdditions__vs_removeAllPersistentStores__block_invoke;
  v2[3] = &unk_1E6BD29A8;
  v2[4] = a1;
  return [a1 performBlockAndWait:v2];
}

@end