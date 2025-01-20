@interface WLASearchPlayableContentFromWatchList
- (void)performWithCompletion:(id)a3;
@end

@implementation WLASearchPlayableContentFromWatchList

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  NSLog(@"WLASearchPlayableContentFromWatchList: Received search playable content request.");
  +[NSDate date];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = __63__WLASearchPlayableContentFromWatchList_performWithCompletion___block_invoke;
  v34[3] = &unk_8350;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v35 = v5;
  id v6 = v4;
  id v36 = v6;
  v7 = objc_retainBlock(v34);
  if (![(WLASearchPlayableContentFromWatchList *)self onlyReturnNextItem])
  {
    NSLog(@"WLASearchPlayableContentFromWatchList: Generic search.");
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    v10 = [(WLASearchPlayableContentFromWatchList *)self canonicalId];
    id v11 = [v10 length];

    if (v11)
    {
      v12 = [(WLASearchPlayableContentFromWatchList *)self canonicalId];
      [v8 setObject:v12 forKey:WLKSiriSearchRequestOptionCanonicalID];
    }
    v13 = [(WLASearchPlayableContentFromWatchList *)self title];
    id v14 = [v13 length];

    if (v14)
    {
      v15 = [(WLASearchPlayableContentFromWatchList *)self title];
      [v8 setObject:v15 forKey:WLKSiriSearchRequestOptionTitle];

      v16 = [(WLASearchPlayableContentFromWatchList *)self siriLocale];

      if (v16)
      {
        v17 = [(WLASearchPlayableContentFromWatchList *)self siriLocale];
        [v8 setObject:v17 forKey:@"locale"];
      }
    }
    v18 = [(WLASearchPlayableContentFromWatchList *)self contentType];
    unsigned __int8 v19 = [v18 isEqualToString:SAVCSContentTypeMovieValue];

    if (v19)
    {
      v20 = &WLKSiriSearchRequestContentTypeMovie;
    }
    else
    {
      v21 = [(WLASearchPlayableContentFromWatchList *)self contentType];
      unsigned __int8 v22 = [v21 isEqualToString:SAVCSContentTypeShowValue];

      if (v22)
      {
        v20 = &WLKSiriSearchRequestContentTypeShow;
      }
      else
      {
        v23 = [(WLASearchPlayableContentFromWatchList *)self contentType];
        unsigned __int8 v24 = [v23 isEqualToString:SAVCSContentTypeEpisodeValue];

        if (v24)
        {
          v20 = &WLKSiriSearchRequestContentTypeEpisode;
        }
        else
        {
          v25 = [(WLASearchPlayableContentFromWatchList *)self contentType];
          unsigned int v26 = [v25 isEqualToString:SAVCSContentTypeSeasonValue];

          if (!v26)
          {
LABEL_17:
            id v27 = [objc_alloc((Class)WLKSiriSearchRequest) initWithQuery:v8];
            NSLog(@"WLASearchPlayableContentFromWatchList: Will make search request %p with options: %@", v27, v8);
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472;
            v28[2] = __63__WLASearchPlayableContentFromWatchList_performWithCompletion___block_invoke_3;
            v28[3] = &unk_83A0;
            v29 = v7;
            [v27 makeRequestWithCompletion:v28];

            goto LABEL_18;
          }
          v20 = &WLKSiriSearchRequestContentTypeSeason;
        }
      }
    }
    [v8 setObject:*v20 forKey:WLKSiriSearchRequestOptionContentType];
    goto LABEL_17;
  }
  NSLog(@"WLASearchPlayableContentFromWatchList: Play the next x request.");
  id v8 = objc_alloc_init((Class)WLKContinueWatchingRequestOperation);
  objc_initWeak(&location, v8);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = __63__WLASearchPlayableContentFromWatchList_performWithCompletion___block_invoke_2;
  v30[3] = &unk_8378;
  objc_copyWeak(&v32, &location);
  v30[4] = self;
  v31 = v7;
  [v8 setCompletionBlock:v30];
  v9 = +[NSOperationQueue wlkDefaultQueue];
  [v9 addOperation:v8];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
LABEL_18:
}

void __63__WLASearchPlayableContentFromWatchList_performWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = +[NSDate date];
  [v3 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v5 = v4;

  NSLog(@"WLASearchPlayableContentFromWatchList: Elapsed Time: %.4f", v5);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

void __63__WLASearchPlayableContentFromWatchList_performWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = [WeakRetained response];

  if (v3)
  {
    uint64_t v4 = [WeakRetained response];
    NSLog(@"WLASearchPlayableContentFromWatchList: Continue watching response received: %@", v4);

    id v5 = objc_alloc_init((Class)SAWLWatchListSearchResults);
    uint64_t v6 = [*(id *)(a1 + 32) contentType];
    unsigned int v7 = [v6 isEqualToString:SAVCSContentTypeMovieValue];

    if (v7)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v8 = [WeakRetained response];
      v9 = [v8 items];

      id v10 = [v9 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v38;
LABEL_5:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v37 + 1) + 8 * v12);
          id v14 = [v13 movieOrShowContent];
          v15 = (char *)[v14 contentType];

          if (v15 == (unsigned char *)&dword_0 + 1) {
            break;
          }
          if (v10 == (id)++v12)
          {
            id v10 = [v9 countByEnumeratingWithState:&v37 objects:v43 count:16];
            if (v10) {
              goto LABEL_5;
            }
            goto LABEL_27;
          }
        }
LABEL_26:
        id v10 = v13;
        goto LABEL_27;
      }
      goto LABEL_27;
    }
    v18 = [*(id *)(a1 + 32) contentType];
    if (([v18 isEqualToString:SAVCSContentTypeEpisodeValue] & 1) == 0)
    {
      unsigned __int8 v19 = [*(id *)(a1 + 32) contentType];
      if (![v19 isEqualToString:SAVCSContentTypeShowValue])
      {
        v30 = [*(id *)(a1 + 32) contentType];
        unsigned __int8 v31 = [v30 isEqualToString:SAVCSContentTypeSeasonValue];

        if ((v31 & 1) == 0)
        {
          v9 = [WeakRetained response];
          id v32 = [v9 items];
          id v10 = [v32 firstObject];

          goto LABEL_27;
        }
LABEL_17:
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v20 = [WeakRetained response];
        v9 = [v20 items];

        id v10 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v10)
        {
          uint64_t v21 = *(void *)v34;
LABEL_19:
          uint64_t v22 = 0;
          while (1)
          {
            if (*(void *)v34 != v21) {
              objc_enumerationMutation(v9);
            }
            v13 = *(void **)(*((void *)&v33 + 1) + 8 * v22);
            v23 = [v13 movieOrShowContent];
            unsigned __int8 v24 = (int *)[v23 contentType];

            if (v24 == &dword_4) {
              goto LABEL_26;
            }
            if (v10 == (id)++v22)
            {
              id v10 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
              if (v10) {
                goto LABEL_19;
              }
              break;
            }
          }
        }
LABEL_27:

        v25 = [v10 movieOrShowContent];
        id v26 = objc_alloc_init((Class)SAWLWatchListSearchResult);
        +[WLASearchUtilities populateSearchResult:v26 withMetadata:v25];
        id v41 = v26;
        id v27 = +[NSArray arrayWithObjects:&v41 count:1];
        [v5 setMatchedResults:v27];

        NSLog(@"WLASearchPlayableContentFromWatchList: Returning results: %@", v5);
        uint64_t v28 = *(void *)(a1 + 40);
        v29 = [v5 dictionary];
        (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v29);

        goto LABEL_28;
      }
    }
    goto LABEL_17;
  }
  v16 = [WeakRetained error];
  NSLog(@"WLASearchPlayableContentFromWatchList: Continue watching request operation failed: %@", v16);

  uint64_t v17 = *(void *)(a1 + 40);
  id v5 = objc_alloc_init((Class)SACommandFailed);
  id v10 = [v5 dictionary];
  (*(void (**)(uint64_t, id))(v17 + 16))(v17, v10);
LABEL_28:
}

void __63__WLASearchPlayableContentFromWatchList_performWithCompletion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v20 = a1;
    NSLog(@"WLASearchPlayableContentFromWatchList: Search response received: %@", v5);
    id v7 = objc_alloc_init((Class)NSMutableArray);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = [v6 items];
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          id v14 = objc_alloc_init((Class)SAWLWatchListSearchResult);
          +[WLASearchUtilities populateSearchResult:v14 withMetadata:v13];
          [v7 addObject:v14];
        }
        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    id v15 = objc_alloc_init((Class)SAWLWatchListSearchResults);
    id v16 = [v7 copy];
    [v15 setMatchedResults:v16];

    NSLog(@"WLASearchPlayableContentFromWatchList: Returning results: %@", v15);
    uint64_t v17 = *(void *)(v20 + 32);
    v18 = [v15 dictionary];
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
  }
  else
  {
    NSLog(@"WLASearchPlayableContentFromWatchList: Search request failed: %@", a3);
    uint64_t v19 = *(void *)(a1 + 32);
    id v7 = objc_alloc_init((Class)SACommandFailed);
    id v15 = [v7 dictionary];
    (*(void (**)(uint64_t, id))(v19 + 16))(v19, v15);
  }
}

@end