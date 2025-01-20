@interface MPMRInitPropertyPlaylistMap
@end

@implementation MPMRInitPropertyPlaylistMap

id ___MPMRInitPropertyPlaylistMap_block_invoke_2_96(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = [a2 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"pclbStatus"];
  v5 = objc_msgSend(v2, "numberWithInt:", objc_msgSend(v4, "intValue"));

  return v5;
}

id ___MPMRInitPropertyPlaylistMap_block_invoke_93(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = [a2 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"piclb"];
  v5 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));

  return v5;
}

void *___MPMRInitPropertyPlaylistMap_block_invoke_7()
{
  return &unk_1EE6ECF80;
}

id ___MPMRInitPropertyPlaylistMap_block_invoke_6(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = [a2 deviceSpecificUserInfo];
  v4 = [v3 objectForKeyedSubscript:@"colLibAdded"];
  v5 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));

  return v5;
}

id ___MPMRInitPropertyPlaylistMap_block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 collectionInfo];
  v3 = [v2 objectForKeyedSubscript:@"_MPNowPlayingCollectionInfoKeyTitle"];

  return v3;
}

void ___MPMRInitPropertyPlaylistMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 deviceSpecificUserInfo];
  v7 = [v6 objectForKeyedSubscript:@"did"];

  if ([v7 length])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = ___MPMRInitPropertyPlaylistMap_block_invoke_2;
    v15[3] = &unk_1E57F96A0;
    id v16 = v4;
    [v5 setLibraryIdentifiersWithDatabaseID:v7 block:v15];
  }
  v8 = [v4 deviceSpecificUserInfo];
  v9 = [v8 objectForKeyedSubscript:@"prid"];

  if ([v9 length])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = ___MPMRInitPropertyPlaylistMap_block_invoke_3;
    v13[3] = &unk_1E57F96C8;
    id v14 = v4;
    [v5 setPersonalStoreIdentifiersWithPersonID:v9 block:v13];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___MPMRInitPropertyPlaylistMap_block_invoke_4;
  v11[3] = &unk_1E57FA390;
  id v12 = v4;
  id v10 = v4;
  [v5 setUniversalStoreIdentifiersWithBlock:v11];
}

void ___MPMRInitPropertyPlaylistMap_block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 deviceSpecificUserInfo];
  id v4 = [v5 objectForKeyedSubscript:@"ppid"];
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v4, "longLongValue"));
}

void ___MPMRInitPropertyPlaylistMap_block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 deviceSpecificUserInfo];
  id v4 = [v5 objectForKeyedSubscript:@"pclid"];
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v4, "longLongValue"));
}

void ___MPMRInitPropertyPlaylistMap_block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v2 collectionInfo];
  id v4 = [v6 objectForKeyedSubscript:@"_MPNowPlayingCollectionInfoKeyIdentifiers"];
  id v5 = [v4 objectForKeyedSubscript:@"_MPNowPlayingInfoPropertyPlaylistGlobalIdentifier"];
  [v3 setGlobalPlaylistID:v5];
}

@end