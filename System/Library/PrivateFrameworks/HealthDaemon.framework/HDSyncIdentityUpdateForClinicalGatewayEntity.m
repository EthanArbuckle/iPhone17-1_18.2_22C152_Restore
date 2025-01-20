@interface HDSyncIdentityUpdateForClinicalGatewayEntity
@end

@implementation HDSyncIdentityUpdateForClinicalGatewayEntity

uint64_t ___HDSyncIdentityUpdateForClinicalGatewayEntity_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

@end