@interface HDSyncIdentityUpdateForProtectedKeyValueEntity
@end

@implementation HDSyncIdentityUpdateForProtectedKeyValueEntity

uint64_t ___HDSyncIdentityUpdateForProtectedKeyValueEntity_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

@end