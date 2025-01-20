@interface MPModelStoreGroupingsMusicKitRequestOperation
- (id)_produceResponseWithParser:(id)a3 results:(id)a4 error:(id *)a5;
- (id)additionalCatalogURLQueryItems;
- (id)additionalURLRequestsWithStoreURLBag:(id)a3;
- (id)catalogURLWithStoreURLBag:(id)a3;
- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4;
- (id)groupingNameBagKey;
- (id)groupingNameWithMusicSubscriptionDictionary:(id)a3;
- (id)rootObjectIdentifierWithSubscriptionStatus:(int64_t)a3;
- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4;
@end

@implementation MPModelStoreGroupingsMusicKitRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeURLBag, 0);

  objc_storeStrong((id *)&self->_allowedFCKinds, 0);
}

- (id)rootObjectIdentifierWithSubscriptionStatus:(int64_t)a3
{
  return 0;
}

- (id)catalogURLWithStoreURLBag:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 stringForBagKey:*MEMORY[0x1E4FB8530]];
  if (_NSIsNSString())
  {
    v6 = [v4 dictionaryForBagKey:*MEMORY[0x1E4FB8560]];
    if (_NSIsNSDictionary())
    {
      v7 = [(MPModelStoreGroupingsMusicKitRequestOperation *)self groupingNameWithMusicSubscriptionDictionary:v6];
      if (_NSIsNSString())
      {
        v8 = MusicURLComponentsWithURLBag(v4, 0);
        v9 = NSString;
        v29[0] = @"/v1/editorial";
        v29[1] = v5;
        v29[2] = @"groupings";
        v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
        v11 = [v9 pathWithComponents:v10];
        [v8 setPath:v11];

        v27 = [MEMORY[0x1E4F290C8] queryItemWithName:@"name" value:v7];
        v28[0] = v27;
        v12 = (void *)MEMORY[0x1E4F290C8];
        v26 = [(MPStoreModelRequestOperation *)self request];
        uint64_t v13 = [v26 clientPlatformIdentifier];
        v14 = (void *)v13;
        if (v13) {
          v15 = (__CFString *)v13;
        }
        else {
          v15 = @"iphone";
        }
        v25 = [v12 queryItemWithName:@"platform" value:v15];
        v28[1] = v25;
        v16 = [MEMORY[0x1E4F290C8] queryItemWithName:@"with" value:@"personalization"];
        v28[2] = v16;
        v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
        v18 = [(MPModelStoreGroupingsMusicKitRequestOperation *)self additionalCatalogURLQueryItems];
        v19 = [v17 arrayByAddingObjectsFromArray:v18];
        [v8 setQueryItems:v19];

        v20 = MusicURLQueryItemLanguageWithURLBag(v4);
        if (v20)
        {
          v21 = [v8 queryItems];
          v22 = [v21 arrayByAddingObject:v20];
          [v8 setQueryItems:v22];
        }
        v23 = [v8 URL];
      }
      else
      {
        v8 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v31 = v6;
          _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "No grouping name in music subscription dictionary of bag, can't generate URL pointing to right grouping: %{public}@", buf, 0xCu);
        }
        v23 = 0;
      }
    }
    else
    {
      v7 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "No music subscription dictionary in bag, can't get subscription properties to generate URL", buf, 2u);
      }
      v23 = 0;
    }
  }
  else
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_ERROR, "No country code found in bag, can't create storefront endpoint URL", buf, 2u);
    }
    v23 = 0;
  }

  return v23;
}

- (id)additionalCatalogURLQueryItems
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)groupingNameWithMusicSubscriptionDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(MPModelStoreGroupingsMusicKitRequestOperation *)self groupingNameBagKey];
  v6 = [v4 objectForKey:v5];

  return v6;
}

- (id)groupingNameBagKey
{
  return 0;
}

- (id)_produceResponseWithParser:(id)a3 results:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v12 = 0;
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  v10 = [MPModelStoreBrowseResponse alloc];
  v11 = [(MPStoreModelRequestOperation *)self request];
  v12 = [(MPModelResponse *)v10 initWithRequest:v11];

  [(MPModelStoreBrowseResponse *)v12 setParser:v8];
  if ([v9 numberOfSections] >= 1) {
    [(MPModelResponse *)v12 setResults:v9];
  }
  if (a5)
  {
LABEL_7:
    if (!v12)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB8410] code:-7102 userInfo:0];
    }
  }
LABEL_9:

  return v12;
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  v39[2] = *MEMORY[0x1E4F143B8];
  uint64_t v32 = (void (**)(id, void *, id))a4;
  id v6 = a3;
  v7 = [(MPStoreModelRequestOperation *)self request];
  uint64_t v8 = [v7 domain];
  uint64_t v9 = [v7 filteringPolicy];
  v10 = +[MPModelStoreBrowseSectionBuilder allSupportedInternalOnlyProperties];
  v11 = [v7 sectionProperties];
  uint64_t v12 = [v10 propertySetByCombiningWithPropertySet:v11];

  v33 = (void *)v12;
  uint64_t v13 = [[MPModelStoreBrowseSectionBuilder alloc] initWithRequestedPropertySet:v12];
  v39[0] = @"MPModelStoreBrowseContentItemPropertyItemType";
  v39[1] = @"MPModelStoreBrowseContentItemPropertyDetailedItemType";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  uint64_t v15 = +[MPPropertySet propertySetWithProperties:v14];

  v16 = [MPModelStoreBrowseContentItemBuilder alloc];
  v17 = [v7 itemProperties];
  v31 = (void *)v15;
  v18 = [v17 propertySetByCombiningWithPropertySet:v15];
  v19 = [(MPModelStoreBrowseContentItemBuilder *)v16 initWithRequestedPropertySet:v18];

  BOOL v20 = v8 == 1 || v9 != 1;
  [(MPModelStoreBrowseContentItemBuilder *)v19 setAllowsRadioStations:v20];
  [(MPModelStoreBrowseContentItemBuilder *)v19 setAllowsVideoContent:v9 != 1];
  v21 = self->_allowedFCKinds;
  v22 = -[MPModelStoreGroupingsMusicKitRequestOperation rootObjectIdentifierWithSubscriptionStatus:](self, "rootObjectIdentifierWithSubscriptionStatus:", [v7 subscriptionStatus]);
  v23 = [MPModelStoreGroupingsMusicKitResponseParser alloc];
  v24 = [(MPAsyncOperation *)self userIdentity];
  v25 = -[MPModelStoreGroupingsMusicKitResponseParser initWithRawResponseOutput:sectionBuilder:contentItemBuilder:filteredFCKinds:userIdentity:rootObjectIdentifier:options:storeURLBag:](v23, "initWithRawResponseOutput:sectionBuilder:contentItemBuilder:filteredFCKinds:userIdentity:rootObjectIdentifier:options:storeURLBag:", v6, v13, v19, v21, v24, v22, [v7 options], self->_storeURLBag);

  v26 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v36 = self;
    __int16 v37 = 2114;
    v38 = v25;
    _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ instantiated parser: %{public}@.", buf, 0x16u);
  }

  v27 = [(MPModelStoreGroupingsMusicKitResponseParser *)v25 results];
  id v34 = 0;
  v28 = [(MPModelStoreGroupingsMusicKitRequestOperation *)self _produceResponseWithParser:v25 results:v27 error:&v34];
  id v29 = v34;

  if (!v28)
  {
    uint64_t v30 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB8410] code:-7102 userInfo:0];

    id v29 = (id)v30;
  }
  v32[2](v32, v28, v29);
}

- (id)additionalURLRequestsWithStoreURLBag:(id)a3
{
  return 0;
}

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  objc_storeStrong((id *)&self->_storeURLBag, a3);
  uint64_t v8 = [(MPStoreModelRequestOperation *)self request];
  if ([v8 filteringPolicy] == 1)
  {
    uint64_t v9 = [v7 dictionaryForBagKey:*MEMORY[0x1E4FB8560]];
    v10 = v9;
    if (v9)
    {
      v11 = [v9 objectForKeyedSubscript:@"carPlayFCKindAllowList"];
      if (_NSIsNSString())
      {
        v43 = v10;
        v44 = a4;
        v45 = self;
        v46 = v8;
        id v47 = v7;
        id v12 = [v11 copy];
        uint64_t v13 = objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", @"("), &stru_1EE680640;

        v14 = objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", @""), &stru_1EE680640);

        uint64_t v15 = [v14 stringByReplacingOccurrencesOfString:@"\"" withString:&stru_1EE680640];

        v16 = [v15 stringByReplacingOccurrencesOfString:@" " withString:&stru_1EE680640];

        v42 = v16;
        v17 = [v16 componentsSeparatedByString:@","];
        v18 = objc_opt_new();
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v19 = v17;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v52 objects:v59 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v53;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v53 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v52 + 1) + 8 * i);
              uint64_t v25 = [v24 integerValue];
              if (v25 < 0)
              {
                v26 = os_log_create("com.apple.amp.mediaplayer", "Default");
                if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543362;
                  v58 = v24;
                  _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_INFO, "Encountered negative FCKind in CarPlay FCKinds allow list in bag, dropping it: %{public}@", buf, 0xCu);
                }
              }
              else
              {
                [v18 addIndex:v25];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v52 objects:v59 count:16];
          }
          while (v21);
        }

        v27 = (NSIndexSet *)[v18 copy];
        uint64_t v8 = v46;
        id v7 = v47;
        a4 = v44;
        self = v45;
        v10 = v43;
        v28 = v42;
      }
      else
      {
        v28 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v59 = 138543362;
          v60 = v10;
          _os_log_impl(&dword_1952E8000, v28, OS_LOG_TYPE_INFO, "CarPlay FCKinds allow list not found in musicSubscription dictionary, wrongly typed or empty: %{public}@", v59, 0xCu);
        }
        v27 = 0;
      }
    }
    else
    {
      v11 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v59 = 0;
        _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_INFO, "No music subscription dictionary in bag, can't get allowed FCKinds for CarPlay", v59, 2u);
      }
      v27 = 0;
    }

    allowedFCKinds = self->_allowedFCKinds;
    self->_allowedFCKinds = v27;
  }
  uint64_t v30 = [v8 loadAdditionalContentURL];
  if (v30
    || ([(MPModelStoreGroupingsMusicKitRequestOperation *)self catalogURLWithStoreURLBag:v7], (uint64_t v30 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v31 = objc_opt_new();
    uint64_t v32 = [MEMORY[0x1E4F28E88] requestWithURL:v30];
    [v32 setHTTPMethod:@"GET"];
    [(MPStoreModelRequestOperation *)self remainingTimeInterval];
    objc_msgSend(v32, "setTimeoutInterval:");
    v33 = (void *)[v32 copy];
    [v31 addObject:v33];

    id v34 = [(MPModelStoreGroupingsMusicKitRequestOperation *)self additionalURLRequestsWithStoreURLBag:v7];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v49 != v37) {
            objc_enumerationMutation(v34);
          }
          [v31 addObject:*(void *)(*((void *)&v48 + 1) + 8 * j)];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v36);
    }
    v39 = [[MPStoreModelRequestConfiguration alloc] initWithURLRequests:v31];
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB8410] code:-7201 userInfo:0];
    uint64_t v30 = 0;
    v39 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v30 = 0;
    v39 = 0;
  }
  v40 = v39;

  return v40;
}

@end