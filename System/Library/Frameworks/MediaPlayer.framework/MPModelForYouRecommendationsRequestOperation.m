@interface MPModelForYouRecommendationsRequestOperation
- (id)_missingContentIdentifiersInRecommendationsArray:(id)a3 storeItemMetadataResults:(id)a4;
- (id)_personalizeRecommendationGroup:(id)a3 flatPersonalizedSectionedItems:(id)a4;
- (id)_responseWithResults:(id)a3 personalizationResponse:(id)a4;
- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4;
- (void)_produceResponseWithRecommendationsArray:(id)a3 storeItemMetadataResults:(id)a4 completion:(id)a5;
- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4;
@end

@implementation MPModelForYouRecommendationsRequestOperation

- (id)_responseWithResults:(id)a3 personalizationResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(MPMutableSectionedCollection);
  v9 = [v6 results];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__MPModelForYouRecommendationsRequestOperation__responseWithResults_personalizationResponse___block_invoke;
  v16[3] = &unk_1E57F27D0;
  v16[4] = self;
  id v17 = v9;
  v18 = v8;
  v10 = v8;
  id v11 = v9;
  [v7 enumerateSectionsUsingBlock:v16];

  v12 = [MPModelForYouRecommendationsResponse alloc];
  v13 = [(MPStoreModelRequestOperation *)self request];
  v14 = [(MPModelResponse *)v12 initWithRequest:v13];

  [(MPModelResponse *)v14 setResults:v10];

  return v14;
}

void __93__MPModelForYouRecommendationsRequestOperation__responseWithResults_personalizationResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) _personalizeRecommendationGroup:a2 flatPersonalizedSectionedItems:*(void *)(a1 + 40)];
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 48) appendSection:v3];
    v3 = v4;
  }
}

- (id)_personalizeRecommendationGroup:(id)a3 flatPersonalizedSectionedItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 identifiers];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __111__MPModelForYouRecommendationsRequestOperation__personalizeRecommendationGroup_flatPersonalizedSectionedItems___block_invoke;
  v13[3] = &unk_1E57F69A0;
  id v14 = v7;
  id v15 = v6;
  v16 = self;
  id v9 = v6;
  id v10 = v7;
  id v11 = (void *)[v9 copyWithIdentifiers:v8 block:v13];

  return v11;
}

void __111__MPModelForYouRecommendationsRequestOperation__personalizeRecommendationGroup_flatPersonalizedSectionedItems___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setSectionedItems:*(void *)(a1 + 32)];
  v4 = [*(id *)(a1 + 40) subgroups];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(*(id *)(a1 + 48), "_personalizeRecommendationGroup:flatPersonalizedSectionedItems:", *(void *)(*((void *)&v12 + 1) + 8 * v10), *(void *)(a1 + 32), (void)v12);
          if (v11) {
            [v5 addObject:v11];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    [v3 setSubgroups:v5];
  }
}

- (void)_produceResponseWithRecommendationsArray:(id)a3 storeItemMetadataResults:(id)a4 completion:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v41 = a5;
  v48 = objc_alloc_init(MPMutableSectionedCollection);
  v46 = objc_alloc_init(MPMutableSectionedCollection);
  uint64_t v10 = [(MPStoreModelRequestOperation *)self request];
  uint64_t v11 = [v10 sectionProperties];
  uint64_t v12 = [v10 filteringPolicy];
  v44 = v10;
  long long v13 = [v10 itemProperties];
  long long v14 = [MPMutablePropertySet alloc];
  long long v15 = [(MPMutablePropertySet *)v14 initWithProperties:MEMORY[0x1E4F1CBF0] relationships:0];
  [(MPMutablePropertySet *)v15 addProperty:@"MPModelForYouRecommendationItemPropertyBackedByStoreItemMetadata"];
  v16 = [v13 relationships];
  uint64_t v17 = [v16 objectForKey:@"MPModelForYouRecommendationItemRelationshipSubgroup"];

  if (v17)
  {
    [(MPMutablePropertySet *)v15 addProperty:@"MPModelForYouRecommendationItemPropertySubgroupIndex"];
    [(MPMutablePropertySet *)v15 addProperty:@"MPModelForYouRecommendationItemPropertyParentGroup"];
  }
  v42 = v15;
  uint64_t v18 = [v13 propertySetByCombiningWithPropertySet:v15];

  v43 = (void *)v11;
  v40 = (void *)v18;
  v45 = v9;
  v19 = [[MPModelForYouRecommendationGroupBuilder alloc] initWithRequestedGroupPropertySet:v11 requestedItemPropertySet:v18 storeItemMetadataResults:v9 flatSectionedItems:v46];
  id v20 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v20 addIndex:3];
  v47 = v20;
  [v20 addIndex:0];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v21 = v8;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v56;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v56 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v55 + 1) + 8 * v25);
        if (_NSIsNSDictionary())
        {
          id v27 = v26;
          v28 = [(MPAsyncOperation *)self userIdentity];
          v29 = [(MPModelForYouRecommendationGroupBuilder *)v19 modelObjectForRecommendationDictionary:v27 userIdentity:v28];

          if (v29 && (v12 != 1 || (objc_msgSend(v47, "containsIndex:", objc_msgSend(v29, "groupType")) & 1) == 0)) {
            [(MPMutableSectionedCollection *)v48 appendSection:v29];
          }
        }
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v23);
  }

  v30 = objc_alloc_init(MPModelRequest);
  v31 = +[MPModelKind kindWithModelClass:objc_opt_class()];
  [(MPModelRequest *)v30 setSectionKind:v31];

  v32 = +[MPPropertySet emptyPropertySet];
  [(MPModelRequest *)v30 setSectionProperties:v32];

  v33 = +[MPModelKind kindWithModelClass:objc_opt_class()];
  [(MPModelRequest *)v30 setItemKind:v33];

  [(MPModelRequest *)v30 setItemProperties:v40];
  v34 = objc_alloc_init(MPMutableSectionedCollection);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __125__MPModelForYouRecommendationsRequestOperation__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion___block_invoke;
  v52[3] = &unk_1E57F2780;
  v53 = v34;
  v54 = v46;
  v35 = v46;
  v36 = v34;
  [(MPSectionedCollection *)v35 enumerateSectionsUsingBlock:v52];
  v37 = [[MPStoreLibraryPersonalizationRequest alloc] initWithUnpersonalizedRequest:v30 unpersonalizedContentDescriptors:v36];
  [(MPStoreLibraryPersonalizationRequest *)v37 setRepresentedObjects:v35];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __125__MPModelForYouRecommendationsRequestOperation__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion___block_invoke_3;
  v49[3] = &unk_1E57F27A8;
  v49[4] = self;
  v50 = v48;
  id v51 = v41;
  id v38 = v41;
  v39 = v48;
  [(MPModelRequest *)v37 performWithResponseHandler:v49];
}

void __125__MPModelForYouRecommendationsRequestOperation__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) appendSection:a2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __125__MPModelForYouRecommendationsRequestOperation__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion___block_invoke_2;
  v6[3] = &unk_1E57F2758;
  id v5 = *(void **)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  [v5 enumerateItemsInSectionAtIndex:a3 usingBlock:v6];
}

void __125__MPModelForYouRecommendationsRequestOperation__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) _responseWithResults:*(void *)(a1 + 40) personalizationResponse:a2];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __125__MPModelForYouRecommendationsRequestOperation__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[MPStoreLibraryPersonalizationContentDescriptor alloc] initWithModel:v3 personalizationStyle:4];

  [*(id *)(a1 + 32) appendItem:v4];
}

- (id)_missingContentIdentifiersInRecommendationsArray:(id)a3 storeItemMetadataResults:(id)a4
{
  id v5 = a3;
  id v17 = a4;
  long long v15 = v5;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = (void *)[v5 mutableCopy];
  while ([v6 count])
  {
    id v7 = [v6 objectAtIndex:0];
    [v6 removeObjectAtIndex:0];
    if (_NSIsNSDictionary())
    {
      id v8 = v7;
      id v9 = [v8 objectForKey:@"children"];
      if (_NSIsNSArray())
      {
        [v6 addObjectsFromArray:v9];
      }
      else
      {
        uint64_t v10 = [v8 objectForKey:@"contentId"];
        if (_NSIsNSString())
        {
          id v11 = v10;
          uint64_t v12 = [v8 objectForKey:@"isUnavailableInAppleMusic"];
          if ((objc_opt_respondsToSelector() & 1) == 0 || ([v12 BOOLValue] & 1) == 0)
          {
            long long v13 = [v17 objectForKey:v11];

            if (!v13) {
              [v16 addObject:v11];
            }
          }
        }
      }
    }
  }

  return v16;
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (!_NSIsNSDictionary()) {
    goto LABEL_12;
  }
  id v8 = [v6 objectForKey:@"recommendations"];
  if (!_NSIsNSArray())
  {
LABEL_11:

LABEL_12:
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB8410] code:-7102 userInfo:0];
    v7[2](v7, 0, v8);
    goto LABEL_13;
  }
  id v9 = [v6 objectForKey:@"storePlatformData"];
  if (!_NSIsNSDictionary())
  {
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v10 = [v9 allValues];
  id v11 = [v10 firstObject];

  if (!_NSIsNSDictionary())
  {
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v12 = [v11 objectForKey:@"results"];
  if (!_NSIsNSDictionary())
  {

    goto LABEL_9;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __91__MPModelForYouRecommendationsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke;
  v23[3] = &unk_1E57F5410;
  id v14 = v13;
  id v24 = v14;
  [v12 enumerateKeysAndObjectsUsingBlock:v23];
  long long v15 = [(MPModelForYouRecommendationsRequestOperation *)self _missingContentIdentifiersInRecommendationsArray:v8 storeItemMetadataResults:v14];
  if ([v15 count])
  {
    id v16 = +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __91__MPModelForYouRecommendationsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke_2;
    v17[3] = &unk_1E57F2730;
    id v18 = v15;
    id v19 = v14;
    id v20 = self;
    id v21 = v8;
    uint64_t v22 = v7;
    [v16 requestStoreItemMetadataForReason:1 withItemIdentifiers:v18 responseHandler:v17];
  }
  else
  {
    [(MPModelForYouRecommendationsRequestOperation *)self _produceResponseWithRecommendationsArray:v8 storeItemMetadataResults:v14 completion:v7];
  }

LABEL_13:
}

void __91__MPModelForYouRecommendationsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (_NSIsNSString() && _NSIsNSDictionary())
  {
    id v6 = v9;
    id v7 = v5;
    id v8 = [[MPStoreItemMetadata alloc] initWithStorePlatformDictionary:v7];
    if (v8) {
      [*(id *)(a1 + 32) setObject:v8 forKey:v6];
    }
  }
}

void __91__MPModelForYouRecommendationsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isFinalResponse])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(v3, "storeItemMetadataForItemIdentifier:", v9, (void)v11);
          if (v10) {
            [*(id *)(a1 + 40) setObject:v10 forKey:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    [*(id *)(a1 + 48) _produceResponseWithRecommendationsArray:*(void *)(a1 + 56) storeItemMetadataResults:*(void *)(a1 + 40) completion:*(void *)(a1 + 64)];
  }
}

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MPStoreModelRequestOperation *)self request];
  id v8 = [v7 customForYouURL];

  if (v8) {
    goto LABEL_2;
  }
  uint64_t v23 = [v6 dictionaryForBagKey:*MEMORY[0x1E4FB8560]];
  if (!v23) {
    goto LABEL_19;
  }
  id v24 = v23;
  uint64_t v25 = [v23 objectForKey:*MEMORY[0x1E4FB8538]];
  if ((_NSIsNSString() & 1) == 0)
  {

    goto LABEL_19;
  }
  id v8 = [MEMORY[0x1E4F1CB10] URLWithString:v25];

  if (!v8)
  {
LABEL_19:
    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB8410] code:-7201 userInfo:0];
      id v20 = 0;
      uint64_t v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v20 = 0;
      uint64_t v22 = 0;
    }
    goto LABEL_22;
  }
LABEL_2:
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v9 setObject:@"1" forKey:@"v"];
  if (MGGetBoolAnswer()) {
    [v9 setObject:@"true" forKey:@"isInternalInstall"];
  }
  uint64_t v10 = [(MPAsyncOperation *)self userIdentity];
  long long v11 = +[MPCloudController controllerWithUserIdentity:v10];
  int v12 = [v11 isCloudLibraryEnabled];

  if (v12) {
    [v9 setObject:@"true" forKey:@"isIcloudLibraryEnabled"];
  }
  long long v13 = [v6 dictionaryForBagKey:*MEMORY[0x1E4FB8558]];
  long long v14 = v13;
  if (v13)
  {
    long long v15 = [v13 objectForKey:@"isEnabled"];
    if (_NSIsNSNumber() && [v15 BOOLValue]) {
      [v9 setObject:@"true" forKey:@"isSocialEnabled"];
    }
  }
  [v9 setObject:@"trackBadging" forKey:@"include"];
  uint64_t v16 = [MEMORY[0x1E4F29088] componentsWithURL:v8 resolvingAgainstBaseURL:0];
  id v17 = [v16 queryItems];
  id v18 = (id)[v17 mutableCopy];

  if (!v18) {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __102__MPModelForYouRecommendationsRequestOperation_configurationForLoadingModelDataWithStoreURLBag_error___block_invoke;
  v27[3] = &unk_1E57F76F0;
  id v28 = v18;
  id v19 = v18;
  [v9 enumerateKeysAndObjectsUsingBlock:v27];
  [v16 setQueryItems:v19];
  id v20 = [v16 URL];

  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v20];
  [v21 setHTTPMethod:@"GET"];
  [(MPStoreModelRequestOperation *)self remainingTimeInterval];
  objc_msgSend(v21, "setTimeoutInterval:");
  uint64_t v22 = [[MPStoreModelRequestConfiguration alloc] initWithURLRequest:v21];

LABEL_22:

  return v22;
}

void __102__MPModelForYouRecommendationsRequestOperation_configurationForLoadingModelDataWithStoreURLBag_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (objc_class *)MEMORY[0x1E4F290C8];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithName:v5 value:v7];

  if (v8)
  {
    id v9 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __102__MPModelForYouRecommendationsRequestOperation_configurationForLoadingModelDataWithStoreURLBag_error___block_invoke_2;
    v12[3] = &unk_1E57F76C8;
    id v13 = v5;
    uint64_t v10 = [v9 indexOfObjectPassingTest:v12];
    long long v11 = *(void **)(a1 + 32);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      [v11 addObject:v8];
    }
    else {
      [v11 replaceObjectAtIndex:v10 withObject:v8];
    }
  }
}

uint64_t __102__MPModelForYouRecommendationsRequestOperation_configurationForLoadingModelDataWithStoreURLBag_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

@end