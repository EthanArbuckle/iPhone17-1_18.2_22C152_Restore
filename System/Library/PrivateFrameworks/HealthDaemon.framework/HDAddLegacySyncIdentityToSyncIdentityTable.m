@interface HDAddLegacySyncIdentityToSyncIdentityTable
@end

@implementation HDAddLegacySyncIdentityToSyncIdentityTable

uint64_t ___HDAddLegacySyncIdentityToSyncIdentityTable_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

@end