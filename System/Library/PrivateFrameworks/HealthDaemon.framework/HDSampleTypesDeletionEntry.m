@interface HDSampleTypesDeletionEntry
@end

@implementation HDSampleTypesDeletionEntry

HDSourceEntity *__56___HDSampleTypesDeletionEntry_applyEntries_withProfile___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [HDSourceEntity alloc];
  uint64_t v4 = [v2 longLongValue];

  v5 = [(HDSQLiteEntity *)v3 initWithPersistentID:v4];

  return v5;
}

@end