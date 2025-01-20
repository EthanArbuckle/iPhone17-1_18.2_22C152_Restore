@interface MPModelSong(ICRadioContentReference)
- (id)mpc_radioContentReference;
@end

@implementation MPModelSong(ICRadioContentReference)

- (id)mpc_radioContentReference
{
  id v2 = objc_alloc_init(MEMORY[0x263F892B0]);
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  [v2 setKind:*MEMORY[0x263F88F88]];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__MPModelSong_ICRadioContentReference__mpc_radioContentReference__block_invoke;
  v15[3] = &unk_2643C4648;
  v15[5] = v2;
  v15[6] = &v16;
  v15[4] = a1;
  [MEMORY[0x263F11F78] performWithoutEnforcement:v15];
  v3 = [a1 identifiers];
  v4 = [v3 universalStore];
  uint64_t v5 = [v4 subscriptionAdamID];

  if (v5
    || ([v3 universalStore],
        v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v6 adamID],
        v6,
        v5))
  {
    *((unsigned char *)v17 + 24) = 1;
    v7 = [NSNumber numberWithLongLong:v5];
    [v2 setStoreAdamIdentifier:v7];
  }
  v8 = [v3 personalizedStore];
  uint64_t v9 = [v8 cloudID];

  if (v9)
  {
    *((unsigned char *)v17 + 24) = 1;
    v10 = [NSNumber numberWithUnsignedLongLong:v9];
    [v2 setStoreCloudIdentifier:v10];
  }
  v11 = [v3 universalStore];
  v12 = [v11 universalCloudLibraryID];

  if ([v12 length])
  {
    *((unsigned char *)v17 + 24) = 1;
    [v2 setUniversalCloudLibraryID:v12];
  }

  if (*((unsigned char *)v17 + 24)) {
    id v13 = v2;
  }
  else {
    id v13 = 0;
  }

  _Block_object_dispose(&v16, 8);

  return v13;
}

@end