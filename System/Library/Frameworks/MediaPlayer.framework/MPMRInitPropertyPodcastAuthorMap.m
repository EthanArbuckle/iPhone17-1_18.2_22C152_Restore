@interface MPMRInitPropertyPodcastAuthorMap
@end

@implementation MPMRInitPropertyPodcastAuthorMap

void ___MPMRInitPropertyPodcastAuthorMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 deviceSpecificUserInfo];
  v7 = [v6 objectForKeyedSubscript:@"did"];

  if ([v7 length])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = ___MPMRInitPropertyPodcastAuthorMap_block_invoke_2;
    v8[3] = &unk_1E57F96A0;
    id v9 = v4;
    [v5 setLibraryIdentifiersWithDatabaseID:v7 block:v8];
  }
}

void ___MPMRInitPropertyPodcastAuthorMap_block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 deviceSpecificUserInfo];
  id v4 = [v5 objectForKeyedSubscript:@"aarpid"];
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v4, "longLongValue"));
}

@end