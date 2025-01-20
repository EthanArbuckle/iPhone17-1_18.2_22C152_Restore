@interface MPMRInitPropertySongMap
@end

@implementation MPMRInitPropertySongMap

uint64_t ___MPMRInitPropertySongMap_block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"libEligible"];
  unsigned int v5 = [v4 BOOLValue];

  uint64_t v6 = [v2 storeID];
  uint64_t v7 = [v2 storeSubscriptionID];

  v8 = NSNumber;
  if (v6 | v7) {
    uint64_t v9 = v5;
  }
  else {
    uint64_t v9 = 0;
  }

  return [v8 numberWithInt:v9];
}

uint64_t ___MPMRInitPropertySongMap_block_invoke_7(uint64_t a1, void *a2)
{
  BOOL v2 = ([a2 mediaType] & 0xFF00) != 0;
  v3 = NSNumber;

  return [v3 numberWithBool:v2];
}

id ___MPMRInitPropertySongMap_block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 title];
  v4 = [v2 userInfo];
  unsigned int v5 = [v4 objectForKeyedSubscript:@"phold"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    v8 = [v7 localizedStringForKey:v3 value:&stru_1EE680640 table:@"MediaPlayer"];

    goto LABEL_11;
  }
  if (![v3 length])
  {
    uint64_t v9 = [v2 collectionInfo];
    v10 = [v9 objectForKeyedSubscript:@"_MPNowPlayingCollectionInfoKeyCollectionType"];
    if (v10 == @"_MPNowPlayingCollectionInfoCollectionTypeRadio")
    {
    }
    else
    {
      v11 = v10;
      int v12 = [@"_MPNowPlayingCollectionInfoCollectionTypeRadio" isEqual:v10];

      if (!v12) {
        goto LABEL_9;
      }
    }
    uint64_t v13 = [v9 objectForKeyedSubscript:@"_MPNowPlayingCollectionInfoKeyTitle"];

    id v3 = (id)v13;
LABEL_9:
  }
  id v3 = v3;
  v8 = v3;
LABEL_11:

  return v8;
}

void ___MPMRInitPropertySongMap_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 deviceSpecificUserInfo];
  v4 = [v5 objectForKeyedSubscript:@"pid"];
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v4, "longLongValue"));
}

void ___MPMRInitPropertySongMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 deviceSpecificUserInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"did"];

  if ([v7 length])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = ___MPMRInitPropertySongMap_block_invoke_2;
    v20[3] = &unk_1E57F96A0;
    id v21 = v4;
    [v5 setLibraryIdentifiersWithDatabaseID:v7 block:v20];
  }
  v8 = [v4 deviceSpecificUserInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"prid"];

  if ([v9 length])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = ___MPMRInitPropertySongMap_block_invoke_3;
    v18[3] = &unk_1E57F96C8;
    id v19 = v4;
    [v5 setPersonalStoreIdentifiersWithPersonID:v9 block:v18];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = ___MPMRInitPropertySongMap_block_invoke_4;
  v16[3] = &unk_1E57FA390;
  id v17 = v4;
  id v10 = v4;
  [v5 setUniversalStoreIdentifiersWithBlock:v16];
  v11 = [v10 identifier];
  [v5 setContentItemID:v11];

  int v12 = [v10 userInfo];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"cntrUID"];
  [v5 setContainerUniqueID:v13];

  v14 = [v10 nowPlayingInfo];
  v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F774F8]];
  [v5 setVendorID:v15];
}

void ___MPMRInitPropertySongMap_block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v8 = a2;
  objc_msgSend(v8, "setAdamID:", objc_msgSend(v3, "storeID"));
  objc_msgSend(v8, "setSubscriptionAdamID:", objc_msgSend(*(id *)(a1 + 32), "storeSubscriptionID"));
  id v4 = [*(id *)(a1 + 32) deviceSpecificUserInfo];
  id v5 = [v4 objectForKeyedSubscript:@"purID"];
  objc_msgSend(v8, "setPurchasedAdamID:", objc_msgSend(v5, "longLongValue"));

  int v6 = [*(id *)(a1 + 32) deviceSpecificUserInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"ulid"];
  [v8 setUniversalCloudLibraryID:v7];

  objc_msgSend(v8, "setReportingAdamID:", objc_msgSend(*(id *)(a1 + 32), "reportingAdamID"));
  objc_msgSend(v8, "setLyricsAdamID:", objc_msgSend(*(id *)(a1 + 32), "lyricsAdamID"));
}

uint64_t ___MPMRInitPropertySongMap_block_invoke_6()
{
  return MEMORY[0x1E4F1CC28];
}

void ___MPMRInitPropertySongMap_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 deviceSpecificUserInfo];
  int v6 = [v5 objectForKeyedSubscript:@"clid"];
  objc_msgSend(v4, "setCloudID:", objc_msgSend(v6, "longLongValue"));

  id v8 = [*(id *)(a1 + 32) deviceSpecificUserInfo];
  uint64_t v7 = [v8 objectForKeyedSubscript:@"claid"];
  [v4 setCloudAlbumID:v7];
}

@end