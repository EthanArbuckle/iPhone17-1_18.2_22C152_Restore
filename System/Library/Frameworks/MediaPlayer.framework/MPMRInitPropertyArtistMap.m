@interface MPMRInitPropertyArtistMap
@end

@implementation MPMRInitPropertyArtistMap

void ___MPMRInitPropertyArtistMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 deviceSpecificUserInfo];
  v7 = [v6 objectForKeyedSubscript:@"did"];

  if ([v7 length])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = ___MPMRInitPropertyArtistMap_block_invoke_2;
    v8[3] = &unk_1E57F96A0;
    id v9 = v4;
    [v5 setLibraryIdentifiersWithDatabaseID:v7 block:v8];
  }
}

id ___MPMRInitPropertyArtistMap_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"phold"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    v7 = [v2 albumArtistName];
    v8 = [v6 localizedStringForKey:v7 value:&stru_1EE680640 table:@"MediaPlayer"];
  }
  else
  {
    v8 = [v2 albumArtistName];
  }

  return v8;
}

void ___MPMRInitPropertyArtistMap_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 deviceSpecificUserInfo];
  id v4 = [v5 objectForKeyedSubscript:@"aarpid"];
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v4, "longLongValue"));
}

@end