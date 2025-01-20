@interface NSArray(GKPlayerCanonicalization)
- (uint64_t)_gkIncompletePlayersFromPlayerIDs;
- (uint64_t)_gkInternalsFromPlayers;
- (uint64_t)_gkInternalsFromUncheckedPlayers;
- (uint64_t)_gkPlayersFromInternals;
- (uint64_t)_gkPlayersIDsFromInternals;
- (uint64_t)_gkPlayersIDsFromPlayers;
- (uint64_t)_gkValidatePlayersForReturnFromAPI;
@end

@implementation NSArray(GKPlayerCanonicalization)

- (uint64_t)_gkIncompletePlayersFromPlayerIDs
{
  return [a1 _gkMapWithBlock:&__block_literal_global_360];
}

- (uint64_t)_gkPlayersIDsFromPlayers
{
  return [a1 _gkMapWithBlock:&__block_literal_global_369];
}

- (uint64_t)_gkPlayersIDsFromInternals
{
  return [a1 _gkMapWithBlock:&__block_literal_global_377];
}

- (uint64_t)_gkPlayersFromInternals
{
  return [a1 _gkMapWithBlock:&__block_literal_global_385_0];
}

- (uint64_t)_gkInternalsFromPlayers
{
  return [a1 _gkFilterWithBlock:&__block_literal_global_387];
}

- (uint64_t)_gkInternalsFromUncheckedPlayers
{
  return [a1 _gkMapWithBlock:&__block_literal_global_390];
}

- (uint64_t)_gkValidatePlayersForReturnFromAPI
{
  return [a1 enumerateObjectsUsingBlock:&__block_literal_global_393];
}

@end