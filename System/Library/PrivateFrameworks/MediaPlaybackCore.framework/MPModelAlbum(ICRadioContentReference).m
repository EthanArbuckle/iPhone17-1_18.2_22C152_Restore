@interface MPModelAlbum(ICRadioContentReference)
- (id)mpc_radioContentReference;
@end

@implementation MPModelAlbum(ICRadioContentReference)

- (id)mpc_radioContentReference
{
  id v2 = objc_alloc_init(MEMORY[0x263F892A0]);
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__MPModelAlbum_ICRadioContentReference__mpc_radioContentReference__block_invoke;
  v12[3] = &unk_2643C4648;
  v12[5] = v2;
  v12[6] = &v13;
  v12[4] = a1;
  [MEMORY[0x263F11F78] performWithoutEnforcement:v12];
  v3 = [a1 identifiers];
  v4 = [v3 personalizedStore];
  uint64_t v5 = [v4 cloudID];

  if (v5)
  {
    *((unsigned char *)v14 + 24) = 1;
    v6 = [NSNumber numberWithUnsignedLongLong:v5];
    [v2 setRepresentativeCloudIdentifier:v6];
  }
  v7 = [v3 universalStore];
  uint64_t v8 = [v7 adamID];

  if (v8)
  {
    *((unsigned char *)v14 + 24) = 1;
    v9 = [NSNumber numberWithLongLong:v8];
    [v2 setStoreIdentifier:v9];
  }
  if (*((unsigned char *)v14 + 24)) {
    id v10 = v2;
  }
  else {
    id v10 = 0;
  }

  _Block_object_dispose(&v13, 8);

  return v10;
}

@end