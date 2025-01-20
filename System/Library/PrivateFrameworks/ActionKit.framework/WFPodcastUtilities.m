@interface WFPodcastUtilities
+ (_MRSystemAppPlaybackQueue)createPlaybackQueueWithURLs:(id)a3 setImmediatePlayback:(BOOL)a4;
+ (id)generatePlaybackQueueURL:(id)a3 withQueryDictionary:(id)a4;
+ (void)createLocalPlayerPath;
+ (void)createLocalPlayerPathWithPlayerID:(id)a3;
+ (void)createPlayerPathForOrigin:(void *)a3;
+ (void)createPlayerPathForOrigin:(void *)a3 playerID:(id)a4;
+ (void)createPreferredPlayerPathWithCompletion:(id)a3;
+ (void)getPodcastsFromLibraryFetchingDetailsFromServer:(BOOL)a3 withCompletion:(id)a4;
@end

@implementation WFPodcastUtilities

+ (void)getPodcastsFromLibraryFetchingDetailsFromServer:(BOOL)a3 withCompletion:(id)a4
{
  id v5 = a4;
  v6 = [MEMORY[0x263F85128] standardClient];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__WFPodcastUtilities_getPodcastsFromLibraryFetchingDetailsFromServer_withCompletion___block_invoke;
  v8[3] = &unk_264E5BB10;
  id v9 = v5;
  BOOL v10 = a3;
  id v7 = v5;
  [v6 getSiriPodcastsDatabaseURLWithCompletion:v8];
}

void __85__WFPodcastUtilities_getPodcastsFromLibraryFetchingDetailsFromServer_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v20 = v6;
    id v7 = [MEMORY[0x263F86840] modelsOfClass:objc_opt_class() fromJSONArray:v5 error:&v20];
    id v8 = v20;

    id v9 = [v7 firstObject];
    BOOL v10 = [v9 children];
    v11 = [v10 firstObject];
    v12 = [v11 children];

    v13 = objc_msgSend(v12, "if_compactMap:", &__block_literal_global_42675);
    if (*(unsigned char *)(a1 + 40))
    {
      v14 = objc_opt_new();
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __85__WFPodcastUtilities_getPodcastsFromLibraryFetchingDetailsFromServer_withCompletion___block_invoke_3;
      v17[3] = &unk_264E5E4B8;
      id v19 = *(id *)(a1 + 32);
      id v18 = v12;
      [v14 lookupMediaWithIdentifiers:v13 countryCode:0 completion:v17];

      v15 = v19;
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 32);
      v15 = WFiTunesPodcastObjectsFromDatabaseShows(v12, 0);
      (*(void (**)(uint64_t, void *, id))(v16 + 16))(v16, v15, v8);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v8 = v6;
  }
}

void __85__WFPodcastUtilities_getPodcastsFromLibraryFetchingDetailsFromServer_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  WFiTunesPodcastObjectsFromDatabaseShows(v5, a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

uint64_t __85__WFPodcastUtilities_getPodcastsFromLibraryFetchingDetailsFromServer_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 storeId];
}

+ (void)createPreferredPlayerPathWithCompletion:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, uint64_t))a3 + 2))(v5, [a1 createLocalPlayerPath]);
}

+ (void)createLocalPlayerPathWithPlayerID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[a1 createPlayerPathForOrigin:MRMediaRemoteGetLocalOrigin() playerID:v4];

  return v5;
}

+ (void)createLocalPlayerPath
{
  uint64_t LocalOrigin = MRMediaRemoteGetLocalOrigin();
  return (void *)[a1 createPlayerPathForOrigin:LocalOrigin];
}

+ (void)createPlayerPathForOrigin:(void *)a3 playerID:(id)a4
{
  id v4 = a4;
  id v5 = (const void *)MRNowPlayingClientCreate();
  id v6 = (const void *)MRNowPlayingPlayerCreate();

  id v7 = (void *)MRNowPlayingPlayerPathCreate();
  if (v5) {
    CFRelease(v5);
  }
  if (v6) {
    CFRelease(v6);
  }
  return v7;
}

+ (void)createPlayerPathForOrigin:(void *)a3
{
  return (void *)[a1 createPlayerPathForOrigin:a3 playerID:@"Podcasts"];
}

+ (_MRSystemAppPlaybackQueue)createPlaybackQueueWithURLs:(id)a3 setImmediatePlayback:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();

  if (v4) {
    MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  }
  return v6;
}

+ (id)generatePlaybackQueueURL:(id)a3 withQueryDictionary:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x263F08BA0];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithString:@"podcasts://"];
  [v8 setHost:v7];

  id v9 = [v5 allKeys];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__WFPodcastUtilities_generatePlaybackQueueURL_withQueryDictionary___block_invoke;
  v15[3] = &unk_264E5BAC8;
  id v16 = v5;
  id v10 = v5;
  v11 = objc_msgSend(v9, "if_map:", v15);
  [v8 setQueryItems:v11];

  v12 = [v8 URL];
  v13 = [v12 absoluteString];

  return v13;
}

id __67__WFPodcastUtilities_generatePlaybackQueueURL_withQueryDictionary___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08BD0];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = [v2 queryItemWithName:v4 value:v5];

  return v6;
}

@end