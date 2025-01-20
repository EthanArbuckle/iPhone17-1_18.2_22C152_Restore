@interface FriendTimeZonesFromNewActivitySnapshots
@end

@implementation FriendTimeZonesFromNewActivitySnapshots

uint64_t ___FriendTimeZonesFromNewActivitySnapshots_block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 friendUUID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

@end