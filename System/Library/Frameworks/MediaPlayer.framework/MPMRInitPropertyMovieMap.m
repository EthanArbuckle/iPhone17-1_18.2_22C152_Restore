@interface MPMRInitPropertyMovieMap
@end

@implementation MPMRInitPropertyMovieMap

uint64_t ___MPMRInitPropertyMovieMap_block_invoke_10()
{
  return MEMORY[0x1E4F1CC28];
}

id ___MPMRInitPropertyMovieMap_block_invoke_9(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = [a2 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"libEligible"];
  v5 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));

  return v5;
}

id ___MPMRInitPropertyMovieMap_block_invoke_8(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = [a2 deviceSpecificUserInfo];
  v4 = [v3 objectForKeyedSubscript:@"libAdded"];
  v5 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));

  return v5;
}

id ___MPMRInitPropertyMovieMap_block_invoke_7(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = [a2 deviceSpecificUserInfo];
  v4 = [v3 objectForKeyedSubscript:@"klStatus"];
  v5 = objc_msgSend(v2, "numberWithInt:", objc_msgSend(v4, "intValue"));

  return v5;
}

id ___MPMRInitPropertyMovieMap_block_invoke_6(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = [a2 deviceSpecificUserInfo];
  v4 = [v3 objectForKeyedSubscript:@"klEnable"];
  v5 = objc_msgSend(v2, "numberWithInt:", objc_msgSend(v4, "intValue"));

  return v5;
}

id ___MPMRInitPropertyMovieMap_block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"phold"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    v7 = [v2 title];
    v8 = [v6 localizedStringForKey:v7 value:&stru_1EE680640 table:@"MediaPlayer"];
  }
  else
  {
    v8 = [v2 title];
  }

  return v8;
}

void ___MPMRInitPropertyMovieMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 deviceSpecificUserInfo];
  v7 = [v6 objectForKeyedSubscript:@"did"];

  if ([v7 length])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = ___MPMRInitPropertyMovieMap_block_invoke_2;
    v18[3] = &unk_1E57F96A0;
    id v19 = v4;
    [v5 setLibraryIdentifiersWithDatabaseID:v7 block:v18];
  }
  v8 = [v4 deviceSpecificUserInfo];
  v9 = [v8 objectForKeyedSubscript:@"prid"];

  if ([v9 length])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = ___MPMRInitPropertyMovieMap_block_invoke_3;
    v16[3] = &unk_1E57F96C8;
    id v17 = v4;
    [v5 setPersonalStoreIdentifiersWithPersonID:v9 block:v16];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = ___MPMRInitPropertyMovieMap_block_invoke_4;
  v14[3] = &unk_1E57FA390;
  id v15 = v4;
  id v10 = v4;
  [v5 setUniversalStoreIdentifiersWithBlock:v14];
  v11 = [v10 identifier];
  [v5 setContentItemID:v11];

  v12 = [v10 userInfo];
  v13 = [v12 objectForKeyedSubscript:@"cntrUID"];
  [v5 setContainerUniqueID:v13];
}

void ___MPMRInitPropertyMovieMap_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 deviceSpecificUserInfo];
  id v4 = [v5 objectForKeyedSubscript:@"pid"];
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v4, "longLongValue"));
}

void ___MPMRInitPropertyMovieMap_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 deviceSpecificUserInfo];
  v6 = [v5 objectForKeyedSubscript:@"clid"];
  objc_msgSend(v4, "setCloudID:", objc_msgSend(v6, "longLongValue"));

  id v8 = [*(id *)(a1 + 32) deviceSpecificUserInfo];
  v7 = [v8 objectForKeyedSubscript:@"claid"];
  [v4 setCloudAlbumID:v7];
}

void ___MPMRInitPropertyMovieMap_block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v8 = a2;
  objc_msgSend(v8, "setAdamID:", objc_msgSend(v3, "storeID"));
  objc_msgSend(v8, "setSubscriptionAdamID:", objc_msgSend(*(id *)(a1 + 32), "storeSubscriptionID"));
  id v4 = [*(id *)(a1 + 32) deviceSpecificUserInfo];
  id v5 = [v4 objectForKeyedSubscript:@"purID"];
  objc_msgSend(v8, "setPurchasedAdamID:", objc_msgSend(v5, "longLongValue"));

  v6 = [*(id *)(a1 + 32) deviceSpecificUserInfo];
  v7 = [v6 objectForKeyedSubscript:@"ulid"];
  [v8 setUniversalCloudLibraryID:v7];

  objc_msgSend(v8, "setReportingAdamID:", objc_msgSend(*(id *)(a1 + 32), "reportingAdamID"));
}

@end