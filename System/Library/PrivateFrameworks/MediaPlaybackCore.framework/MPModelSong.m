@interface MPModelSong
@end

@implementation MPModelSong

void __121__MPModelSong_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) identifiers];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __121__MPModelSong_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_2;
  v11[3] = &unk_2643C4988;
  id v5 = v4;
  id v12 = v5;
  [v3 setUniversalStoreIdentifiersWithBlock:v11];
  v6 = [v5 personalizedStore];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 personID];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __121__MPModelSong_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_3;
    v9[3] = &unk_2643C4960;
    id v10 = v5;
    [v3 setPersonalStoreIdentifiersWithPersonID:v8 block:v9];
  }
}

void __121__MPModelSong_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 hasLoadedValueForKey:*MEMORY[0x263F11860]]) {
    objc_msgSend(v7, "setLibraryAddEligible:", objc_msgSend(*(id *)(a1 + 32), "isLibraryAddEligible"));
  }
  if ([v7 hasLoadedValueForKey:*MEMORY[0x263F11AD8]])
  {
    id v3 = [*(id *)(a1 + 32) storeAsset];
    [v7 setStoreAsset:v3];
  }
  if ([v7 hasLoadedValueForKey:*MEMORY[0x263F11A98]])
  {
    v4 = [v7 album];
    id v5 = [*(id *)(a1 + 32) album];
    v6 = objc_msgSend(v4, "MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:", v5);
    [v7 setAlbum:v6];
  }
}

void __121__MPModelSong_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 universalStore];
  objc_msgSend(v4, "setAdamID:", objc_msgSend(v5, "adamID"));

  v6 = [*(id *)(a1 + 32) universalStore];
  objc_msgSend(v4, "setSubscriptionAdamID:", objc_msgSend(v6, "subscriptionAdamID"));

  id v7 = [*(id *)(a1 + 32) universalStore];
  objc_msgSend(v4, "setPurchasedAdamID:", objc_msgSend(v7, "purchasedAdamID"));
}

void __121__MPModelSong_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 personalizedStore];
  id v4 = [v5 cloudAlbumID];
  [v3 setCloudAlbumID:v4];
}

void __65__MPModelSong_ICRadioContentReference__mpc_radioContentReference__block_invoke(uint64_t a1)
{
  id v37 = [*(id *)(a1 + 32) album];
  v2 = [v37 artist];
  id v3 = [v2 name];

  if ([v3 length])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(a1 + 40) setAlbumArtistName:v3];
  }
  id v4 = [v37 title];
  if ([v4 length])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(a1 + 40) setAlbumName:v4];
  }
  uint64_t v5 = [v37 discCount];
  if (v5 >= 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v6 = *(void **)(a1 + 40);
    id v7 = [NSNumber numberWithInteger:v5];
    [v6 setDiscCount:v7];
  }
  if ([v37 isCompilation])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v8 = *(void **)(a1 + 40);
    v9 = [NSNumber numberWithBool:1];
    [v8 setCompilation:v9];
  }
  uint64_t v10 = [v37 trackCount];
  if (v10 >= 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v11 = *(void **)(a1 + 40);
    id v12 = [NSNumber numberWithInteger:v10];
    [v11 setTrackCount:v12];
  }
  uint64_t v13 = [v37 year];
  if (v13 >= 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v14 = *(void **)(a1 + 40);
    v15 = [NSNumber numberWithInteger:v13];
    [v14 setYear:v15];
  }
  v16 = [*(id *)(a1 + 32) artist];
  v17 = [v16 name];

  if ([v17 length])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(a1 + 40) setArtistName:v17];
  }
  v18 = [*(id *)(a1 + 32) composer];
  v19 = [v18 name];

  if ([v19 length])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(a1 + 40) setComposerName:v19];
  }
  v20 = [*(id *)(a1 + 32) copyrightText];
  if ([v20 length])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(a1 + 40) setCopyright:v20];
  }
  uint64_t v21 = [*(id *)(a1 + 32) discNumber];
  if (v21 >= 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v22 = *(void **)(a1 + 40);
    v23 = [NSNumber numberWithInteger:v21];
    [v22 setDiscNumber:v23];
  }
  v24 = [*(id *)(a1 + 32) localFileAsset];
  uint64_t v25 = [v24 fileSize];

  if (v25)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v26 = *(void **)(a1 + 40);
    v27 = [NSNumber numberWithUnsignedLongLong:v25];
    [v26 setFileSize:v27];
  }
  v28 = [*(id *)(a1 + 32) genre];
  v29 = [v28 name];

  if ([v29 length])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(a1 + 40) setGenreName:v29];
  }
  [*(id *)(a1 + 32) duration];
  if (v30 > 2.22044605e-16)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v31 = *(void **)(a1 + 40);
    v32 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v31 setDuration:v32];
  }
  v33 = [*(id *)(a1 + 32) title];
  if ([v33 length])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(a1 + 40) setName:v33];
  }
  uint64_t v34 = [*(id *)(a1 + 32) trackNumber];
  if (v34 >= 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v35 = *(void **)(a1 + 40);
    v36 = [NSNumber numberWithInteger:v34];
    [v35 setTrackNumber:v36];
  }
}

void __68__MPModelSong_BehaviorMusicSharePlayAdditions__msp_shortDescription__block_invoke(uint64_t a1)
{
  v2 = NSString;
  id v3 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) title];
  id v4 = [v2 stringWithFormat:@" title='%@'", v5];
  objc_msgSend(v3, "insertString:atIndex:", v4, objc_msgSend(*(id *)(a1 + 32), "length") - 1);
}

@end