@interface HDSyncIdentityUpdateForAssociationsAndPendingAssociationsEntities
@end

@implementation HDSyncIdentityUpdateForAssociationsAndPendingAssociationsEntities

uint64_t ___HDSyncIdentityUpdateForAssociationsAndPendingAssociationsEntities_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t ___HDSyncIdentityUpdateForAssociationsAndPendingAssociationsEntities_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

@end