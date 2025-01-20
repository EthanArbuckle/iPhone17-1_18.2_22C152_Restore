@interface MPModelStoreBrowseRequestOperation
- (double)adjustTimeoutInterval:(double)a3;
- (id)_nestedRequestsOperationQueue;
- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4;
- (void)_produceCarPlayResponseWithParser:(id)a3 withNestedRequestsForEmptyBrickSectionsInOperationQueue:(id)a4 completion:(id)a5;
- (void)_produceRegularResponseWithParser:(id)a3 completion:(id)a4;
- (void)_produceResponseWithParser:(id)a3 results:(id)a4 changeDetails:(id)a5 completion:(id)a6;
- (void)cancel;
- (void)execute;
- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4;
@end

@implementation MPModelStoreBrowseRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionsToPendingNestedRequestOperations, 0);
  objc_storeStrong((id *)&self->_nestedRequestsOperationQueue, 0);
  objc_storeStrong((id *)&self->_nestedRequestOperationsGroup, 0);

  objc_storeStrong((id *)&self->_individualPendingNestedRequestOperation, 0);
}

- (void)_produceResponseWithParser:(id)a3 results:(id)a4 changeDetails:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void *, void *))a6;
  if (!v11) {
    goto LABEL_6;
  }
  v14 = [MPModelStoreBrowseResponse alloc];
  v15 = [(MPStoreModelRequestOperation *)self request];
  v16 = [(MPModelResponse *)v14 initWithRequest:v15];

  [(MPModelStoreBrowseResponse *)v16 setParser:v10];
  if ([v11 numberOfSections] >= 1) {
    [(MPModelResponse *)v16 setResults:v11];
  }
  [(MPModelStoreBrowseResponse *)v16 setChangeDetails:v12];
  if (v16)
  {
    v17 = 0;
  }
  else
  {
LABEL_6:
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __98__MPModelStoreBrowseRequestOperation__produceResponseWithParser_results_changeDetails_completion___block_invoke;
    v20[3] = &unk_1E57F9F20;
    v20[4] = self;
    v20[5] = &v21;
    [(MPStoreModelRequestOperation *)self dispatchSync:v20];
    if (*((unsigned char *)v22 + 24))
    {
      v18 = [MPModelStoreBrowseResponse alloc];
      v19 = [(MPStoreModelRequestOperation *)self request];
      v16 = [(MPModelResponse *)v18 initWithRequest:v19];

      v17 = 0;
    }
    else
    {
      v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB8410] code:-7102 userInfo:0];
      v16 = 0;
    }
    _Block_object_dispose(&v21, 8);
  }
  v13[2](v13, v16, v17);
}

uint64_t __98__MPModelStoreBrowseRequestOperation__produceResponseWithParser_results_changeDetails_completion___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 329);
  return result;
}

- (void)_produceRegularResponseWithParser:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 results];
  v8 = [v7 changeDetails];
  [(MPModelStoreBrowseRequestOperation *)self _produceResponseWithParser:v7 results:v9 changeDetails:v8 completion:v6];
}

- (void)_produceCarPlayResponseWithParser:(id)a3 withNestedRequestsForEmptyBrickSectionsInOperationQueue:(id)a4 completion:(id)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v38 = a4;
  v29 = v7;
  id v30 = a5;
  v8 = [v7 results];
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__25375;
  v77 = __Block_byref_object_dispose__25376;
  id v78 = 0;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke;
  v70[3] = &unk_1E57F2848;
  id v71 = v8;
  v72 = &v73;
  id v28 = v71;
  [v71 enumerateSectionsUsingBlock:v70];
  if ([(id)v74[5] count])
  {
    v35 = +[MPModelStoreBrowseSectionBuilder allSupportedPropertiesIncludingInternalOnlyProperties:1];
    v34 = +[MPModelStoreBrowseContentItemBuilder allSupportedProperties];
    [(MPStoreModelRequestOperation *)self remainingTimeInterval];
    double v10 = v9;
    id v11 = dispatch_group_create();
    v33 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x3032000000;
    v68[3] = __Block_byref_object_copy__25375;
    v68[4] = __Block_byref_object_dispose__25376;
    id v69 = 0;
    queue = dispatch_queue_create("com.apple.MediaPlayer.MPModelStoreBrowseRequestOperation.sectionsToNestedResponseAccessQueue", 0);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    obuint64_t j = (id)v74[5];
    uint64_t v12 = [obj countByEnumeratingWithState:&v64 objects:v80 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v65 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          dispatch_group_enter(v11);
          v16 = objc_alloc_init(MPModelStoreBrowseRequest);
          [(MPModelStoreBrowseRequest *)v16 setDomain:0];
          [(MPModelStoreBrowseRequest *)v16 setFilteringPolicy:1];
          v17 = [v15 loadAdditionalContentURL];
          [(MPModelStoreBrowseRequest *)v16 setLoadAdditionalContentURL:v17];

          [(MPModelRequest *)v16 setSectionProperties:v35];
          [(MPModelRequest *)v16 setItemProperties:v34];
          [(MPStoreModelRequest *)v16 setTimeoutInterval:v10];
          uint64_t v58 = 0;
          v59 = &v58;
          uint64_t v60 = 0x3032000000;
          v61 = __Block_byref_object_copy__25375;
          v62 = __Block_byref_object_dispose__25376;
          id v63 = 0;
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_2;
          v52[3] = &unk_1E57F2898;
          v52[4] = self;
          v52[5] = v15;
          v55 = &v58;
          v53 = queue;
          v56 = v68;
          uint64_t v57 = 0;
          v54 = v11;
          uint64_t v18 = [(MPModelStoreBrowseRequest *)v16 newOperationWithResponseHandler:v52];
          v19 = (void *)v59[5];
          v59[5] = v18;

          uint64_t v20 = v59[5];
          if (v20)
          {
            *(unsigned char *)(v20 + 329) = 1;
            uint64_t v21 = v59[5];
          }
          else
          {
            uint64_t v21 = 0;
          }
          [v33 setObject:v21 forKey:v15];
          [v32 addObject:v59[5]];
          _Block_object_dispose(&v58, 8);
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v64 objects:v80 count:16];
      }
      while (v12);
    }

    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_5;
    v49[3] = &unk_1E57FA038;
    v49[4] = self;
    v22 = v11;
    v50 = v22;
    id v23 = v33;
    id v51 = v23;
    [(MPStoreModelRequestOperation *)self dispatchSync:v49];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v24 = v32;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v79 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v46 != v26) {
            objc_enumerationMutation(v24);
          }
          [v38 addOperation:*(void *)(*((void *)&v45 + 1) + 8 * j)];
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v79 count:16];
      }
      while (v25);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_6;
    block[3] = &unk_1E57F28E8;
    block[4] = self;
    id v40 = v28;
    v43 = &v73;
    v44 = v68;
    id v41 = v29;
    id v42 = v30;
    dispatch_group_notify(v22, queue, block);

    _Block_object_dispose(v68, 8);
  }
  else
  {
    [(MPModelStoreBrowseRequestOperation *)self _produceRegularResponseWithParser:v7 completion:v30];
  }

  _Block_object_dispose(&v73, 8);
}

void __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if ([v9 isBrick] && !objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", a3))
  {
    v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v5 addObject:v9];
  }
}

void __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_3;
  v18[3] = &unk_1E57F2870;
  long long v19 = *(_OWORD *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v20 = &v22;
  uint64_t v21 = v7;
  [(id)v19 dispatchSync:v18];
  if (*((unsigned char *)v23 + 24))
  {
    v8 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_4;
    block[3] = &unk_1E57F4338;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 80);
    uint64_t v16 = *(void *)(a1 + 72);
    uint64_t v17 = v10;
    uint64_t v11 = *(void *)(a1 + 40);
    id v13 = v9;
    uint64_t v14 = v11;
    id v15 = *(id *)(a1 + 56);
    dispatch_async(v8, block);
  }
  _Block_object_dispose(&v22, 8);
}

void __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_5(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 344), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  v3 = (id *)(*(void *)(a1 + 32) + 368);

  objc_storeStrong(v3, v2);
}

void __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_6(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    v2 = objc_alloc_init(MPMutableSectionedCollection);
    v3 = *(void **)(a1 + 40);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_7;
    uint64_t v10 = &unk_1E57F28C0;
    uint64_t v13 = *(void *)(a1 + 64);
    uint64_t v11 = v2;
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 72);
    id v12 = v4;
    uint64_t v14 = v5;
    id v6 = v2;
    [v4 enumerateSectionsUsingBlock:&v7];
    objc_msgSend(*(id *)(a1 + 32), "_produceResponseWithParser:results:changeDetails:completion:", *(void *)(a1 + 48), v6, 0, *(void *)(a1 + 56), v7, v8, v9, v10);
  }
}

void __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) containsObject:v5])
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKey:v5];
    uint64_t v7 = [v6 parser];
    uint64_t v8 = [v7 results];
    if ([v8 numberOfSections] == 1)
    {
      id v9 = [v8 firstSection];
      uint64_t v10 = [v9 uniformContentItemType];
      if ((unint64_t)(v10 - 3) <= 1)
      {
        uint64_t v11 = v10;
        id v12 = [v7 sectionBuilder];
        uint64_t v13 = [v5 title];
        uint64_t v14 = [v5 loadAdditionalContentURL];
        uint64_t v20 = v9;
        uint64_t v15 = [v9 isMemberOfChartSet];
        uint64_t v16 = [v5 isBrick];
        uint64_t v17 = v15;
        id v9 = v20;
        uint64_t v18 = [v12 modelObjectWithTitle:v13 loadAdditionalContentURL:v14 uniformContentItemType:v11 isMemberOfChartSet:v17 isBrick:v16 previouslyRetrievedNestedResponse:v6];

        [*(id *)(a1 + 32) appendSection:v18];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_9;
        v21[3] = &unk_1E57F7770;
        id v22 = *(id *)(a1 + 32);
        [v8 enumerateItemsInSectionAtIndex:0 usingBlock:v21];
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) appendSection:v5];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_8;
    v23[3] = &unk_1E57F7770;
    long long v19 = *(void **)(a1 + 40);
    id v24 = *(id *)(a1 + 32);
    [v19 enumerateItemsInSectionAtIndex:a3 usingBlock:v23];
    id v6 = v24;
  }
}

uint64_t __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendItem:a2];
}

uint64_t __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendItem:a2];
}

void __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_3(void *a1)
{
  v2 = [*(id *)(a1[4] + 368) objectForKey:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 == *(void **)(*(void *)(a1[7] + 8) + 40);

  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    [*(id *)(a1[4] + 368) removeObjectForKey:a1[5]];
    if (![*(id *)(a1[4] + 368) count])
    {
      uint64_t v3 = a1[4];
      id v4 = *(void **)(v3 + 368);
      *(void *)(v3 + 368) = 0;

      uint64_t v5 = a1[4];
      id v6 = *(void **)(v5 + 344);
      *(void *)(v5 + 344) = 0;
    }
  }
}

void __139__MPModelStoreBrowseRequestOperation__produceCarPlayResponseWithParser_withNestedRequestsForEmptyBrickSectionsInOperationQueue_completion___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2)
  {
    uint64_t v3 = *(void **)(*(void *)(a1[7] + 8) + 40);
    if (!v3)
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:a1[8] valueOptions:a1[8] capacity:0];
      uint64_t v5 = *(void *)(a1[7] + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      uint64_t v3 = *(void **)(*(void *)(a1[7] + 8) + 40);
      uint64_t v2 = a1[4];
    }
    [v3 setObject:v2 forKey:a1[5]];
  }
  uint64_t v7 = a1[6];

  dispatch_group_leave(v7);
}

- (id)_nestedRequestsOperationQueue
{
  nestedRequestsOperationQueue = self->_nestedRequestsOperationQueue;
  if (!nestedRequestsOperationQueue)
  {
    uint64_t v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    uint64_t v5 = self->_nestedRequestsOperationQueue;
    self->_nestedRequestsOperationQueue = v4;

    [(NSOperationQueue *)self->_nestedRequestsOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)self->_nestedRequestsOperationQueue setName:@"com.apple.MediaPlayer.MPModelStoreBrowseRequestOperation.nestedRequestsOperationQueue"];
    [(NSOperationQueue *)self->_nestedRequestsOperationQueue setQualityOfService:25];
    nestedRequestsOperationQueue = self->_nestedRequestsOperationQueue;
  }

  return nestedRequestsOperationQueue;
}

- (double)adjustTimeoutInterval:(double)a3
{
  [(MPStoreModelRequestOperation *)self assertRunningInAccessQueue];
  if (!self->_didInitializeTimeoutIntervalAdditions)
  {
    uint64_t v5 = [(MPStoreModelRequestOperation *)self request];
    double v6 = 0.0;
    if (![v5 domain] && objc_msgSend(v5, "filteringPolicy") == 1)
    {
      uint64_t v7 = [v5 loadAdditionalContentURL];

      if (v7) {
        double v6 = 0.0;
      }
      else {
        double v6 = a3 + a3;
      }
    }
    self->_timeoutIntervalAdditions = v6;
    self->_didInitializeTimeoutIntervalAdditions = 1;
  }
  return self->_timeoutIntervalAdditions + a3;
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  v57[2] = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v37 = a4;
  double v6 = [(MPStoreModelRequestOperation *)self request];
  id v41 = [v6 previousResponse];
  uint64_t v7 = [v6 domain];
  uint64_t v8 = [v6 filteringPolicy];
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  long long v46 = __Block_byref_object_copy__25375;
  long long v47 = __Block_byref_object_dispose__25376;
  id v48 = 0;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __81__MPModelStoreBrowseRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke;
  v42[3] = &unk_1E57F2820;
  v42[4] = self;
  v42[5] = &v53;
  v42[8] = v7;
  v42[9] = v8;
  v42[6] = &v49;
  v42[7] = &v43;
  [(MPStoreModelRequestOperation *)self dispatchSync:v42];
  BOOL v9 = 0;
  if (v8 == 1 && !v7) {
    BOOL v9 = v54[3] == 0;
  }
  uint64_t v10 = [v6 previousResponse];
  uint64_t v11 = [v10 request];
  id v12 = [v11 sectionProperties];
  uint64_t v13 = v12;
  if (v12)
  {
    id v39 = v12;
  }
  else
  {
    id v39 = [v6 sectionProperties];
  }

  uint64_t v14 = +[MPModelStoreBrowseSectionBuilder allSupportedInternalOnlyProperties];
  id v38 = [v14 propertySetByCombiningWithPropertySet:v39];

  v36 = [[MPModelStoreBrowseSectionBuilder alloc] initWithRequestedPropertySet:v38];
  uint64_t v15 = [v41 request];
  uint64_t v16 = [v15 itemProperties];
  uint64_t v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [v6 itemProperties];
  }
  long long v19 = v18;

  v57[0] = @"MPModelStoreBrowseContentItemPropertyItemType";
  v57[1] = @"MPModelStoreBrowseContentItemPropertyDetailedItemType";
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
  uint64_t v21 = +[MPPropertySet propertySetWithProperties:v20];

  id v22 = [MPModelStoreBrowseContentItemBuilder alloc];
  id v23 = [v19 propertySetByCombiningWithPropertySet:v21];
  id v24 = [(MPModelStoreBrowseContentItemBuilder *)v22 initWithRequestedPropertySet:v23];

  BOOL v26 = v8 != 1 || v7 == 1;
  [(MPModelStoreBrowseContentItemBuilder *)v24 setAllowsRadioStations:v26];
  [(MPModelStoreBrowseContentItemBuilder *)v24 setAllowsVideoContent:v8 != 1];
  if (v54[3] != 2)
  {
    v33 = [MPModelStoreBrowseResponseParser alloc];
    v34 = [(MPAsyncOperation *)self userIdentity];
    uint64_t v35 = 256;
    if (!v9) {
      uint64_t v35 = 0;
    }
    v27 = [(MPModelStoreBrowseResponseParser *)v33 initWithRawResponseOutput:v40 options:v35 | v9 sectionBuilder:v36 contentItemBuilder:v24 userIdentity:v34];

    if (*((unsigned char *)v50 + 24)) {
      [(MPModelStoreBrowseRequestOperation *)self _produceCarPlayResponseWithParser:v27 withNestedRequestsForEmptyBrickSectionsInOperationQueue:v44[5] completion:v37];
    }
    else {
      [(MPModelStoreBrowseRequestOperation *)self _produceRegularResponseWithParser:v27 completion:v37];
    }
    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = (MPModelStoreBrowseResponseParser *)v40;
    id v28 = [MPModelStoreBrowseResponseParser alloc];
    v29 = [v41 parser];
    id v30 = [(MPAsyncOperation *)self userIdentity];
    uint64_t v31 = 256;
    if (!v9) {
      uint64_t v31 = 0;
    }
    id v32 = [(MPModelStoreBrowseResponseParser *)v28 initWithPreviousParser:v29 additionalStoreItemMetadataResponse:v27 options:v31 | v9 sectionBuilder:v36 contentItemBuilder:v24 userIdentity:v30];

    [(MPModelStoreBrowseRequestOperation *)self _produceRegularResponseWithParser:v32 completion:v37];
LABEL_26:
  }
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
}

void __81__MPModelStoreBrowseRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 360);
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && !*(void *)(a1 + 64)
    && *(void *)(a1 + 72) == 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v2 = [*(id *)(a1 + 32) _nestedRequestsOperationQueue];
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MPStoreModelRequestOperation *)self request];
  uint64_t v8 = [v7 loadAdditionalContentURL];
  if (v8)
  {
    BOOL v9 = (void *)v8;
    uint64_t v10 = 1;
LABEL_3:
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v9];
    [v11 setHTTPMethod:@"GET"];
    [(MPStoreModelRequestOperation *)self remainingTimeInterval];
    objc_msgSend(v11, "setTimeoutInterval:");
    id v12 = [[MPStoreModelRequestConfiguration alloc] initWithURLRequest:v11];

    goto LABEL_4;
  }
  uint64_t v15 = [v7 previousResponse];
  uint64_t v16 = [v15 parser];
  uint64_t v17 = [v16 allAdditionalContentIdentifiersNeedingLookup];

  uint64_t v18 = [v17 count];
  if (v18)
  {
    unint64_t v19 = v18;
    id v20 = v17;
    unint64_t v21 = +[MPStoreItemMetadataRequestController optimalBatchSize];
    id v22 = v20;
    if (v19 > v21)
    {
      id v22 = objc_msgSend(v20, "subarrayWithRange:", 0, v21);
    }
    id v12 = [[MPStoreModelRequestConfiguration alloc] initWithRequestedItemIdentifiers:v22 reason:1];

    if (v12)
    {
      BOOL v9 = 0;
      uint64_t v10 = 2;
      goto LABEL_4;
    }
  }
  else
  {
  }
  uint64_t v23 = [v7 domain];
  if (v23 == 1)
  {
    id v24 = [v6 dictionaryForBagKey:*MEMORY[0x1E4FB8570]];
    if (!_NSIsNSDictionary())
    {
LABEL_21:

      goto LABEL_22;
    }
    char v25 = (void *)MEMORY[0x1E4FB8568];
  }
  else
  {
    if (v23) {
      goto LABEL_22;
    }
    id v24 = [v6 dictionaryForBagKey:*MEMORY[0x1E4FB8560]];
    if (!_NSIsNSDictionary()) {
      goto LABEL_21;
    }
    char v25 = (void *)MEMORY[0x1E4FB8528];
  }
  BOOL v26 = [v24 objectForKey:*v25];
  if ((_NSIsNSString() & 1) == 0)
  {

    goto LABEL_21;
  }
  BOOL v9 = [MEMORY[0x1E4F1CB10] URLWithString:v26];

  if (v9)
  {
    uint64_t v10 = 0;
    goto LABEL_3;
  }
LABEL_22:
  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB8410] code:-7201 userInfo:0];
    BOOL v9 = 0;
    uint64_t v10 = 0;
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = 0;
    uint64_t v10 = 0;
    id v12 = 0;
  }
LABEL_4:
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __92__MPModelStoreBrowseRequestOperation_configurationForLoadingModelDataWithStoreURLBag_error___block_invoke;
  v27[3] = &unk_1E57F8328;
  v27[4] = self;
  v27[5] = v10;
  [(MPStoreModelRequestOperation *)self dispatchSync:v27];
  uint64_t v13 = v12;

  return v13;
}

uint64_t __92__MPModelStoreBrowseRequestOperation_configurationForLoadingModelDataWithStoreURLBag_error___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 360) = *(void *)(result + 40);
  return result;
}

- (void)execute
{
  uint64_t v3 = [(MPStoreModelRequestOperation *)self request];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__25375;
  unint64_t v21 = __Block_byref_object_dispose__25376;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__25375;
  uint64_t v15 = __Block_byref_object_dispose__25376;
  id v16 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__MPModelStoreBrowseRequestOperation_execute__block_invoke;
  v6[3] = &unk_1E57F2870;
  id v4 = v3;
  id v7 = v4;
  uint64_t v8 = self;
  BOOL v9 = &v17;
  uint64_t v10 = &v11;
  [(MPStoreModelRequestOperation *)self dispatchSync:v6];
  if (v18[5])
  {
    objc_msgSend((id)v12[5], "addOperation:");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MPModelStoreBrowseRequestOperation;
    [(MPStoreModelRequestOperation *)&v5 execute];
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
}

void __45__MPModelStoreBrowseRequestOperation_execute__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) previousRetrievedNestedResponse];
  if (v2)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) copy];
    [v3 configureWithParentSection:0];
    [v3 setPreviousResponse:v2];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__MPModelStoreBrowseRequestOperation_execute__block_invoke_2;
    v12[3] = &unk_1E57F27F8;
    uint64_t v14 = *(void *)(a1 + 48);
    int8x16_t v11 = *(int8x16_t *)(a1 + 32);
    id v4 = (id)v11.i64[0];
    int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
    uint64_t v5 = [v3 newOperationWithResponseHandler:v12];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    objc_storeStrong((id *)(*(void *)(a1 + 40) + 336), *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    uint64_t v8 = [*(id *)(a1 + 40) _nestedRequestsOperationQueue];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

void __45__MPModelStoreBrowseRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__MPModelStoreBrowseRequestOperation_execute__block_invoke_3;
  v15[3] = &unk_1E57F9F20;
  uint64_t v8 = *(void *)(a1 + 48);
  v15[4] = v7;
  v15[5] = v8;
  [v7 dispatchSync:v15];
  char v9 = [*(id *)(a1 + 32) isCancelled];
  uint64_t v10 = 0;
  if (v5 && (v9 & 1) == 0)
  {
    uint64_t v10 = [(MPModelResponse *)[MPModelStoreBrowseResponse alloc] initWithRequest:*(void *)(a1 + 40)];
    int8x16_t v11 = [v5 parser];
    [(MPModelStoreBrowseResponse *)v10 setParser:v11];

    id v12 = [v5 results];
    [(MPModelResponse *)v10 setResults:v12];

    int8x16_t v13 = [v5 deferredSectionProperties];
    [(MPModelResponse *)v10 setDeferredSectionProperties:v13];

    uint64_t v14 = [v5 deferredItemProperties];
    [(MPModelResponse *)v10 setDeferredItemProperties:v14];
  }
  [*(id *)(a1 + 32) _finishWithResponse:v10 error:v6];
}

void __45__MPModelStoreBrowseRequestOperation_execute__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(v1 + 336);
  if (v3 == *(void **)(*(void *)(v2 + 8) + 40))
  {
    *(void *)(v1 + 336) = 0;
  }
}

- (void)cancel
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__25375;
  id v30 = __Block_byref_object_dispose__25376;
  id v31 = 0;
  uint64_t v20 = 0;
  unint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__25375;
  id v24 = __Block_byref_object_dispose__25376;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__25375;
  uint64_t v18 = __Block_byref_object_dispose__25376;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__MPModelStoreBrowseRequestOperation_cancel__block_invoke;
  v13[3] = &unk_1E57F9A80;
  v13[4] = self;
  v13[5] = &v26;
  v13[6] = &v20;
  v13[7] = &v14;
  [(MPStoreModelRequestOperation *)self dispatchSync:v13];
  [(id)v27[5] cancel];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = (id)v21[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v6) cancel];
        id v7 = v15[5];
        if (v7) {
          dispatch_group_leave(v7);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v32 count:16];
    }
    while (v4);
  }

  v8.receiver = self;
  v8.super_class = (Class)MPModelStoreBrowseRequestOperation;
  [(MPStoreModelRequestOperation *)&v8 cancel];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
}

void __44__MPModelStoreBrowseRequestOperation_cancel__block_invoke(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 336));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1[4] + 368);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(a1[4] + 368), "objectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * v6), (void)v18);
        objc_super v8 = *(void **)(*(void *)(a1[6] + 8) + 40);
        if (!v8)
        {
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v10 = *(void *)(a1[6] + 8);
          long long v11 = *(void **)(v10 + 40);
          *(void *)(v10 + 40) = v9;

          objc_super v8 = *(void **)(*(void *)(a1[6] + 8) + 40);
        }
        [v8 addObject:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[4] + 344));
  uint64_t v12 = a1[4];
  int8x16_t v13 = *(void **)(v12 + 336);
  *(void *)(v12 + 336) = 0;

  uint64_t v14 = a1[4];
  uint64_t v15 = *(void **)(v14 + 368);
  *(void *)(v14 + 368) = 0;

  uint64_t v16 = a1[4];
  uint64_t v17 = *(void **)(v16 + 344);
  *(void *)(v16 + 344) = 0;
}

@end