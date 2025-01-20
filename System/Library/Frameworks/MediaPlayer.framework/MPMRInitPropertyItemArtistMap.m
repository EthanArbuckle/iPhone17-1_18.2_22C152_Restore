@interface MPMRInitPropertyItemArtistMap
@end

@implementation MPMRInitPropertyItemArtistMap

void ___MPMRInitPropertyItemArtistMap_block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 deviceSpecificUserInfo];
  v4 = [v5 objectForKeyedSubscript:@"arpid"];
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v4, "longLongValue"));
}

id ___MPMRInitPropertyItemArtistMap_block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"phold"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    v7 = [v2 trackArtistName];
    v8 = [v6 localizedStringForKey:v7 value:&stru_1EE680640 table:@"MediaPlayer"];
  }
  else
  {
    v8 = [v2 trackArtistName];
  }

  return v8;
}

void ___MPMRInitPropertyItemArtistMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 deviceSpecificUserInfo];
  v7 = [v6 objectForKeyedSubscript:@"did"];

  if ([v7 length])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = ___MPMRInitPropertyItemArtistMap_block_invoke_2;
    v11[3] = &unk_1E57F96A0;
    id v12 = v4;
    [v5 setLibraryIdentifiersWithDatabaseID:v7 block:v11];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___MPMRInitPropertyItemArtistMap_block_invoke_3;
  v9[3] = &unk_1E57FA390;
  id v10 = v4;
  id v8 = v4;
  [v5 setUniversalStoreIdentifiersWithBlock:v9];
}

void ___MPMRInitPropertyItemArtistMap_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v2, "storeArtistID"));
}

@end