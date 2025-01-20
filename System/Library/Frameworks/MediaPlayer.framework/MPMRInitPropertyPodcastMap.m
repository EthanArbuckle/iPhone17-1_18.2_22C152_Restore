@interface MPMRInitPropertyPodcastMap
@end

@implementation MPMRInitPropertyPodcastMap

id ___MPMRInitPropertyPodcastMap_block_invoke_7(uint64_t a1, void *a2)
{
  v2 = [a2 userInfo];
  v3 = [v2 objectForKeyedSubscript:@"podSort"];

  if (v3)
  {
    v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "integerValue"));
  }
  else
  {
    v4 = &unk_1EE6ECFB0;
  }

  return v4;
}

id ___MPMRInitPropertyPodcastMap_block_invoke_6(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = [a2 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"podSupSub"];
  v5 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));

  return v5;
}

id ___MPMRInitPropertyPodcastMap_block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 userInfo];
  v3 = [v2 objectForKeyedSubscript:@"podShURL"];

  if ([v3 length])
  {
    v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id ___MPMRInitPropertyPodcastMap_block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 userInfo];
  v3 = [v2 objectForKeyedSubscript:@"podURL"];

  if ([v3 length])
  {
    v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void ___MPMRInitPropertyPodcastMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 deviceSpecificUserInfo];
  v7 = [v6 objectForKeyedSubscript:@"pdid"];

  if ([v7 length])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = ___MPMRInitPropertyPodcastMap_block_invoke_2;
    v11[3] = &unk_1E57F96A0;
    id v12 = v4;
    [v5 setLibraryIdentifiersWithDatabaseID:v7 block:v11];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___MPMRInitPropertyPodcastMap_block_invoke_3;
  v9[3] = &unk_1E57FA390;
  id v10 = v4;
  id v8 = v4;
  [v5 setUniversalStoreIdentifiersWithBlock:v9];
}

void ___MPMRInitPropertyPodcastMap_block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 deviceSpecificUserInfo];
  id v4 = [v5 objectForKeyedSubscript:@"apid"];
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v4, "longLongValue"));
}

void ___MPMRInitPropertyPodcastMap_block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v2, "storeAlbumID"));
}

@end