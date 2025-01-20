@interface NSArray(GKGuestPlayerFilters)
- (uint64_t)_gkGuestPlayersFromPlayers;
- (uint64_t)_gkNonGuestPlayersFromPlayers;
@end

@implementation NSArray(GKGuestPlayerFilters)

- (uint64_t)_gkNonGuestPlayersFromPlayers
{
  return [a1 _gkFilterWithBlock:&__block_literal_global_412];
}

- (uint64_t)_gkGuestPlayersFromPlayers
{
  return [a1 _gkFilterWithBlock:&__block_literal_global_414_0];
}

@end