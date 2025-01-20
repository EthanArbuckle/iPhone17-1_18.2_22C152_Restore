@interface NSDictionary(MSASDefinitions)
- (uint64_t)MSASAlbumResetSyncAlbumGUID;
- (uint64_t)MSASEventIsDueToAlbumDeletionAlbumGUID;
- (uint64_t)MSASEventIsDueToAssetCollectionDeletionAssetCollectionGUID;
- (uint64_t)MSASIsErrorRecovery;
- (uint64_t)MSASIsGlobalResetSync;
- (uint64_t)MSASIsLocalChange;
- (uint64_t)MSASIsNotInteresting;
@end

@implementation NSDictionary(MSASDefinitions)

- (uint64_t)MSASIsErrorRecovery
{
  v1 = [a1 objectForKey:@"isErrorRecovery"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)MSASIsNotInteresting
{
  v1 = [a1 objectForKey:@"notInteresting"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)MSASEventIsDueToAssetCollectionDeletionAssetCollectionGUID
{
  return [a1 objectForKey:@"eventIsDueToAssetCollectionDeletion"];
}

- (uint64_t)MSASEventIsDueToAlbumDeletionAlbumGUID
{
  return [a1 objectForKey:@"eventIsDueToAlbumDeletion"];
}

- (uint64_t)MSASIsLocalChange
{
  v1 = [a1 objectForKey:@"isLocalChange"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)MSASAlbumResetSyncAlbumGUID
{
  return [a1 objectForKey:@"isAlbumResetSync"];
}

- (uint64_t)MSASIsGlobalResetSync
{
  v1 = [a1 objectForKey:@"isGlobalResetSync"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end