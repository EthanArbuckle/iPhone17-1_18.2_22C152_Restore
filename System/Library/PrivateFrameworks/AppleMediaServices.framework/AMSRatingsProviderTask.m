@interface AMSRatingsProviderTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
+ (id)ratingWithValue:(id)a3 mediaType:(unint64_t)a4 storeFront:(id)a5 clientIdentifier:(id)a6 bag:(id)a7;
- (AMSBagProtocol)bag;
- (AMSRatingsProviderTask)initWithMediaType:(unint64_t)a3 clientIdentifier:(id)a4 bag:(id)a5;
- (AMSRatingsProviderTask)initWithMediaType:(unint64_t)a3 storeFront:(id)a4 clientIdentifier:(id)a5 bag:(id)a6;
- (NSString)clientIdentifier;
- (NSString)storeFront;
- (id)_appQueryItems;
- (id)_commonQueryItems;
- (id)_unratedRatingQueryItem;
- (id)_urlForMediaType:(unint64_t)a3 error:(id *)a4;
- (id)initForAllMediaWithClientIdentifier:(id)a3 useCase:(unint64_t)a4 bag:(id)a5;
- (id)initForAllMediaWithStoreFront:(id)a3 clientIdentifier:(id)a4 useCase:(unint64_t)a5 bag:(id)a6;
- (id)initForAllMediaWithUnratedRatingsForStoreFront:(id)a3 clientIdentifier:(id)a4 useCase:(unint64_t)a5 bag:(id)a6;
- (id)performTask;
- (id)resultWithCachedData:(id)a3;
- (unint64_t)mediaType;
- (unint64_t)useCase;
@end

@implementation AMSRatingsProviderTask

- (id)initForAllMediaWithStoreFront:(id)a3 clientIdentifier:(id)a4 useCase:(unint64_t)a5 bag:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AMSRatingsProviderTask;
  v14 = [(AMSTask *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_mediaType = 5;
    objc_storeStrong((id *)&v14->_storeFront, a3);
    objc_storeStrong((id *)&v15->_clientIdentifier, a4);
    v15->_useCase = a5;
    objc_storeStrong((id *)&v15->_bag, a6);
  }

  return v15;
}

- (id)initForAllMediaWithUnratedRatingsForStoreFront:(id)a3 clientIdentifier:(id)a4 useCase:(unint64_t)a5 bag:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AMSRatingsProviderTask;
  v14 = [(AMSTask *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_mediaType = 6;
    objc_storeStrong((id *)&v14->_storeFront, a3);
    objc_storeStrong((id *)&v15->_clientIdentifier, a4);
    v15->_useCase = a5;
    objc_storeStrong((id *)&v15->_bag, a6);
  }

  return v15;
}

- (id)initForAllMediaWithClientIdentifier:(id)a3 useCase:(unint64_t)a4 bag:(id)a5
{
  return [(AMSRatingsProviderTask *)self initForAllMediaWithStoreFront:0 clientIdentifier:a3 useCase:a4 bag:a5];
}

- (AMSRatingsProviderTask)initWithMediaType:(unint64_t)a3 clientIdentifier:(id)a4 bag:(id)a5
{
  return [(AMSRatingsProviderTask *)self initWithMediaType:a3 storeFront:0 clientIdentifier:a4 bag:a5];
}

- (AMSRatingsProviderTask)initWithMediaType:(unint64_t)a3 storeFront:(id)a4 clientIdentifier:(id)a5 bag:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AMSRatingsProviderTask;
  v14 = [(AMSTask *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_storeFront, a4);
    v15->_mediaType = a3;
    objc_storeStrong((id *)&v15->_clientIdentifier, a5);
    objc_storeStrong((id *)&v15->_bag, a6);
  }

  return v15;
}

- (id)resultWithCachedData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [AMSRatingsProviderResult alloc];
    unint64_t v6 = [(AMSRatingsProviderTask *)self mediaType];
    v7 = [(AMSRatingsProviderTask *)self storeFront];
    v8 = [(AMSRatingsProviderResult *)v5 initWithData:v4 mediaType:v6 andStoreFront:v7];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)performTask
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AMSRatingsProviderTask_performTask__block_invoke;
  v5[3] = &unk_1E55A6140;
  v5[4] = self;
  v4.receiver = self;
  v4.super_class = (Class)AMSRatingsProviderTask;
  v2 = [(AMSTask *)&v4 performTaskWithBlock:v5];
  return v2;
}

AMSRatingsProviderResult *__37__AMSRatingsProviderTask_performTask__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [AMSRatingsCache alloc];
  uint64_t v5 = [*(id *)(a1 + 32) mediaType];
  unint64_t v6 = [*(id *)(a1 + 32) storeFront];
  v7 = [(AMSRatingsCache *)v4 initWithMediaType:v5 storeFront:v6];

  uint64_t v8 = [(AMSRatingsCache *)v7 getCacheData];
  [(AMSRatingsCache *)v7 clearCacheIfNeeded];
  v54 = AMSLogKey();
  v9 = *(void **)(a1 + 32);
  id v57 = 0;
  v10 = objc_msgSend(v9, "_urlForMediaType:error:", objc_msgSend(v9, "mediaType"), &v57);
  id v11 = v57;
  id v12 = v11;
  v53 = (void *)v8;
  if (!v10 || v11)
  {
    AMSError(7, @"Ratings URL not found", @"Could not load a ratings URL for this media type.", v11);
    id v28 = (id)objc_claimAutoreleasedReturnValue();

    v27 = 0;
    v18 = 0;
LABEL_20:
    uint64_t v32 = AMSError(3, @"Failed to create media request from ratings URL", @"An error occurred when attempting to encode the media request.", v28);
LABEL_21:

    v36 = v53;
LABEL_22:
    v37 = [*(id *)(a1 + 32) resultWithCachedData:v36];
    v38 = (void *)v32;
    goto LABEL_23;
  }
  id v13 = +[AMSLogConfig sharedRatingsProviderConfig];
  if (!v13)
  {
    id v13 = +[AMSLogConfig sharedConfig];
  }
  v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_opt_class();
    v16 = [v10 absoluteString];
    *(_DWORD *)buf = 138543874;
    uint64_t v59 = v15;
    __int16 v60 = 2114;
    v61 = v54;
    __int16 v62 = 2112;
    uint64_t v63 = (uint64_t)v16;
    _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] URL for Ratings: %@.", buf, 0x20u);
  }
  objc_super v17 = [MEMORY[0x1E4F18DA8] requestWithURL:v10];
  v18 = +[AMSMediaSharedProperties propertiesForRatingsTask:*(void *)(a1 + 32)];
  v19 = [AMSMediaRequestEncoder alloc];
  v20 = [v18 tokenService];
  v21 = [*(id *)(a1 + 32) bag];
  v22 = [(AMSMediaRequestEncoder *)v19 initWithTokenService:v20 bag:v21];

  [(AMSMediaRequestEncoder *)v22 setLogKey:v54];
  v23 = [(AMSMediaRequestEncoder *)v22 requestByEncodingRequest:v17 parameters:0];
  v24 = +[AMSLogConfig sharedRatingsProviderConfig];
  if (!v24)
  {
    v24 = +[AMSLogConfig sharedConfig];
  }
  v25 = [v24 OSLogObject];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    uint64_t v59 = v26;
    __int16 v60 = 2114;
    v61 = v54;
    __int16 v62 = 2112;
    uint64_t v63 = (uint64_t)v17;
    _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Request generated: %@.", buf, 0x20u);
  }

  id v56 = 0;
  v27 = [v23 resultWithTimeout:&v56 error:60.0];
  id v28 = v56;

  if (!v27 || v28) {
    goto LABEL_20;
  }
  v29 = [v18 session];
  id v28 = [v29 dataTaskPromiseWithRequest:v27];

  id v55 = 0;
  uint64_t v30 = [v28 resultWithTimeout:&v55 error:60.0];
  id v31 = v55;
  v52 = (void *)v30;
  if (v31)
  {
    uint64_t v32 = (uint64_t)v31;
    v33 = +[AMSLogConfig sharedRatingsProviderConfig];
    if (!v33)
    {
      v33 = +[AMSLogConfig sharedConfig];
    }
    v34 = [v33 OSLogObject];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v59 = v35;
      __int16 v60 = 2114;
      v61 = v54;
      __int16 v62 = 2112;
      uint64_t v63 = v32;
      _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Request completed with error: %@.", buf, 0x20u);
    }

    goto LABEL_21;
  }
  v51 = a2;
  v40 = [AMSRatingsProviderResult alloc];
  uint64_t v41 = [*(id *)(a1 + 32) mediaType];
  v42 = [*(id *)(a1 + 32) storeFront];
  v37 = [(AMSRatingsProviderResult *)v40 initWithURLResult:v30 mediaType:v41 andStoreFront:v42];

  v43 = +[AMSLogConfig sharedRatingsProviderConfig];
  if (!v43)
  {
    v43 = +[AMSLogConfig sharedConfig];
  }
  v44 = [v43 OSLogObject];
  a2 = v51;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v45 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    uint64_t v59 = v45;
    __int16 v60 = 2114;
    v61 = v54;
    __int16 v62 = 2112;
    uint64_t v63 = (uint64_t)v52;
    _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Request completed: %@.", buf, 0x20u);
  }

  v46 = [v52 data];
  BOOL v47 = [(AMSRatingsCache *)v7 addCacheData:v46];

  if (!v47)
  {
    v48 = +[AMSLogConfig sharedRatingsProviderConfig];
    if (!v48)
    {
      v48 = +[AMSLogConfig sharedConfig];
    }
    v49 = [v48 OSLogObject];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      uint64_t v50 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v59 = v50;
      __int16 v60 = 2114;
      v61 = v54;
      _os_log_impl(&dword_18D554000, v49, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to cache data", buf, 0x16u);
    }
  }
  uint64_t v32 = 0;
  v38 = 0;
  v36 = v53;
  if (!v37) {
    goto LABEL_22;
  }
LABEL_23:
  if (a2) {
    *a2 = v38;
  }

  return v37;
}

+ (id)ratingWithValue:(id)a3 mediaType:(unint64_t)a4 storeFront:(id)a5 clientIdentifier:(id)a6 bag:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  uint64_t v15 = [[AMSRatingsProviderTask alloc] initWithMediaType:a4 storeFront:v14 clientIdentifier:v13 bag:v12];

  v16 = [(AMSRatingsProviderTask *)v15 performTask];
  objc_super v17 = objc_alloc_init(AMSMutablePromise);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __84__AMSRatingsProviderTask_ratingWithValue_mediaType_storeFront_clientIdentifier_bag___block_invoke;
  v23[3] = &unk_1E55A6168;
  id v24 = v11;
  v18 = v17;
  v25 = v18;
  id v19 = v11;
  [v16 addFinishBlock:v23];
  v20 = v25;
  v21 = v18;

  return v21;
}

void __84__AMSRatingsProviderTask_ratingWithValue_mediaType_storeFront_clientIdentifier_bag___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5)
  {
    [*(id *)(a1 + 40) finishWithError:v6];
    goto LABEL_39;
  }
  id v33 = v6;
  v38 = [MEMORY[0x1E4F1CA48] array];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = [v5 ratingsStoreFronts];
  uint64_t v36 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (!v36) {
    goto LABEL_37;
  }
  uint64_t v35 = *(void *)v55;
  id v40 = v5;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v55 != v35)
      {
        uint64_t v9 = v8;
        objc_enumerationMutation(obj);
        uint64_t v8 = v9;
      }
      uint64_t v37 = v8;
      v10 = *(void **)(*((void *)&v54 + 1) + 8 * v8);
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v39 = [v10 ratingSystems];
      uint64_t v42 = [v39 countByEnumeratingWithState:&v50 objects:v59 count:16];
      if (v42)
      {
        uint64_t v41 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v51 != v41) {
              objc_enumerationMutation(v39);
            }
            uint64_t v43 = i;
            id v12 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v13 = [v12 contentRatings];
            uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v58 count:16];
            if (!v14)
            {
              id v16 = v13;
              goto LABEL_32;
            }
            uint64_t v15 = v14;
            id v16 = 0;
            uint64_t v17 = *(void *)v47;
            uint64_t v44 = *(void *)v47;
            do
            {
              uint64_t v18 = 0;
              uint64_t v45 = v15;
              do
              {
                if (*(void *)v47 != v17) {
                  objc_enumerationMutation(v13);
                }
                id v19 = *(void **)(*((void *)&v46 + 1) + 8 * v18);
                if (*(void *)(a1 + 32)
                  && ([*(id *)(*((void *)&v46 + 1) + 8 * v18) value],
                      v20 = objc_claimAutoreleasedReturnValue(),
                      int v21 = [v20 isEqualToNumber:*(void *)(a1 + 32)],
                      v20,
                      v21))
                {
                  id v22 = v19;

                  id v16 = v22;
                }
                else if (v16)
                {
                  v23 = [v19 value];
                  int v24 = [v23 intValue];
                  if (v24 >= (int)[*(id *)(a1 + 32) intValue])
                  {
                  }
                  else
                  {
                    v25 = v13;
                    uint64_t v26 = [v19 value];
                    int v27 = [v26 intValue];
                    id v28 = [v16 value];
                    int v29 = [v28 intValue];

                    if (v27 > v29)
                    {
                      id v30 = v19;

                      id v16 = v30;
                    }
                    id v13 = v25;
                    uint64_t v17 = v44;
                    uint64_t v15 = v45;
                  }
                }
                else
                {
                  id v16 = v19;
                }
                ++v18;
              }
              while (v15 != v18);
              uint64_t v15 = [v13 countByEnumeratingWithState:&v46 objects:v58 count:16];
            }
            while (v15);

            id v5 = v40;
            uint64_t i = v43;
            if (v16)
            {
              [v38 addObject:v16];
LABEL_32:

              continue;
            }
          }
          uint64_t v42 = [v39 countByEnumeratingWithState:&v50 objects:v59 count:16];
        }
        while (v42);
      }

      uint64_t v8 = v37 + 1;
    }
    while (v37 + 1 != v36);
    uint64_t v36 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  }
  while (v36);
LABEL_37:

  id v31 = *(void **)(a1 + 40);
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithArray:v38];
  [v31 finishWithResult:v32];

  v7 = v33;
LABEL_39:
}

- (id)_urlForMediaType:(unint64_t)a3 error:(id *)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v7 = [(AMSRatingsProviderTask *)self _commonQueryItems];
  switch(a3)
  {
    case 0uLL:
      uint64_t v8 = [(AMSRatingsProviderTask *)self storeFront];
      uint64_t v9 = (void *)v8;
      v10 = @"AMSRatingsProviderVideoURL";
      id v11 = @"AMSRatingsProviderVideoAllURL";
      goto LABEL_10;
    case 1uLL:
      uint64_t v8 = [(AMSRatingsProviderTask *)self storeFront];
      uint64_t v9 = (void *)v8;
      v10 = @"AMSRatingsProviderMusicURL";
      id v11 = @"AMSRatingsProviderMusicAllURL";
      goto LABEL_10;
    case 2uLL:
      id v12 = [(AMSRatingsProviderTask *)self storeFront];
      id v13 = @"AMSRatingsProviderAppsURL";
      if (!v12) {
        id v13 = @"AMSRatingsProviderAppsAllURL";
      }
      uint64_t v14 = v13;

      uint64_t v15 = [(AMSRatingsProviderTask *)self _appQueryItems];
      goto LABEL_16;
    case 3uLL:
      uint64_t v8 = [(AMSRatingsProviderTask *)self storeFront];
      uint64_t v9 = (void *)v8;
      v10 = @"AMSRatingsProviderPodcastsURL";
      id v11 = @"AMSRatingsProviderPodcastsAllURL";
      goto LABEL_10;
    case 4uLL:
      uint64_t v8 = [(AMSRatingsProviderTask *)self storeFront];
      uint64_t v9 = (void *)v8;
      v10 = @"AMSRatingsProviderBooksURL";
      id v11 = @"AMSRatingsProviderBooksAllURL";
      goto LABEL_10;
    case 6uLL:
      id v16 = [(AMSRatingsProviderTask *)self storeFront];
      uint64_t v17 = @"AMSRatingsProviderMediaURL";
      if (!v16) {
        uint64_t v17 = @"AMSRatingsProviderMediaAllURL";
      }
      uint64_t v14 = v17;

      uint64_t v15 = [(AMSRatingsProviderTask *)self _unratedRatingQueryItem];
LABEL_16:
      uint64_t v9 = (void *)v15;
      uint64_t v18 = [v7 arrayByAddingObjectsFromArray:v15];

      v7 = (void *)v18;
      break;
    default:
      uint64_t v8 = [(AMSRatingsProviderTask *)self storeFront];
      uint64_t v9 = (void *)v8;
      v10 = @"AMSRatingsProviderMediaURL";
      id v11 = @"AMSRatingsProviderMediaAllURL";
LABEL_10:
      if (!v8) {
        v10 = v11;
      }
      uint64_t v14 = v10;
      break;
  }

  id v19 = [(AMSRatingsProviderTask *)self bag];
  v20 = [v19 stringForKey:v14];
  id v52 = 0;
  int v21 = [v20 valueWithError:&v52];
  id v22 = v52;

  if (v21)
  {
    if ([(AMSRatingsProviderTask *)self useCase] == 1)
    {
      v23 = [NSString stringWithFormat:@"useCase=%@", @"screenTime"];
      uint64_t v24 = [v21 stringByReplacingOccurrencesOfString:@"useCase=%@" withString:v23];

      int v21 = (void *)v24;
    }
    uint64_t v25 = [(AMSRatingsProviderTask *)self storeFront];
    if (v25)
    {
      uint64_t v26 = (void *)v25;
      int v27 = [(AMSRatingsProviderTask *)self storeFront];
      uint64_t v28 = [v27 length];

      if (v28)
      {
        int v29 = NSString;
        id v51 = v22;
        id v30 = [(AMSRatingsProviderTask *)self storeFront];
        uint64_t v31 = [v29 stringWithValidatedFormat:v21, @"%@", &v51, v30 validFormatSpecifiers error];
        id v32 = v51;

        int v21 = (void *)v31;
        id v22 = v32;
      }
    }
    uint64_t v33 = [MEMORY[0x1E4F1CB10] URLWithString:v21];
    if (v33)
    {
      v34 = (void *)v33;
      if (!v7) {
        goto LABEL_39;
      }
      uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v33 resolvingAgainstBaseURL:0];
      uint64_t v36 = [v35 queryItems];
      uint64_t v37 = (void *)v36;
      v38 = (void *)MEMORY[0x1E4F1CBF0];
      if (v36) {
        v38 = (void *)v36;
      }
      id v39 = v38;

      id v40 = [v39 arrayByAddingObjectsFromArray:v7];

      [v35 setQueryItems:v40];
      uint64_t v41 = [v35 URL];

      v34 = (void *)v41;
    }
    else
    {
      uint64_t v45 = +[AMSLogConfig sharedRatingsProviderConfig];
      if (!v45)
      {
        uint64_t v45 = +[AMSLogConfig sharedConfig];
      }
      long long v46 = [v45 OSLogObject];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        uint64_t v47 = objc_opt_class();
        long long v48 = AMSLogKey();
        long long v49 = AMSHashIfNeeded(v21);
        *(_DWORD *)buf = 138543874;
        uint64_t v54 = v47;
        __int16 v55 = 2114;
        long long v56 = v48;
        __int16 v57 = 2112;
        id v58 = v49;
        _os_log_impl(&dword_18D554000, v46, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error creating URL from string: %@.", buf, 0x20u);
      }
      AMSError(200, @"Ratings URL string malformed", @"Failed to create URL from bag-provided URL string", 0);
      v34 = 0;
      uint64_t v35 = v22;
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v35 = +[AMSLogConfig sharedRatingsProviderConfig];
    if (!v35)
    {
      uint64_t v35 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v42 = [v35 OSLogObject];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = objc_opt_class();
      uint64_t v44 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v54 = v43;
      __int16 v55 = 2114;
      long long v56 = v44;
      __int16 v57 = 2112;
      id v58 = v22;
      _os_log_impl(&dword_18D554000, v42, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error loading URL from bag: %@.", buf, 0x20u);
    }
    int v21 = 0;
    v34 = 0;
  }

LABEL_39:
  if (a4) {
    *a4 = v22;
  }

  return v34;
}

- (id)_appQueryItems
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = +[AMSMediaURLBuilderUtility devicePlatform];
  if (v3)
  {
    objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"platform" value:v3];
    [v2 addObject:v4];
  }
  return v2;
}

- (id)_unratedRatingQueryItem
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"with" value:@"unratedRating"];
  [v2 addObject:v3];

  return v2;
}

- (id)_commonQueryItems
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v4 = [(AMSRatingsProviderTask *)self bag];
  id v5 = [v4 stringForKey:@"language-tag"];
  id v6 = [v5 valueWithError:0];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[AMSDevice language];
  }
  uint64_t v9 = v8;

  if (v9)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"l" value:v9];
    [v3 addObject:v10];
  }
  return v3;
}

+ (NSString)bagSubProfile
{
  return (NSString *)@"AMSRatingsProvider";
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)@"1";
}

+ (id)createBagForSubProfile
{
  id v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  objc_super v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  id v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (NSString)storeFront
{
  return self->_storeFront;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (unint64_t)useCase
{
  return self->_useCase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
}

@end