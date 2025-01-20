@interface MPStoreLibraryPersonalizationRequestOperation
+ (__n128)_personalizedArtistResponseForStoreID:modelObject:groupingKey:personalizationStyle:personalizationProperties:libraryView:libraryRequest:matchingStoreIDAndName:;
+ (__n128)personalizedResponseForContentDescriptor:requestedProperties:matchAlbumArtistOnStoreIdAndName:;
+ (id)_personalizedArtistResponseForStoreID:(int64_t)a3 modelObject:(id)a4 groupingKey:(id)a5 personalizationStyle:(int64_t)a6 personalizationProperties:(id)a7 libraryView:(id)a8 libraryRequest:(id)a9 matchingStoreIDAndName:(BOOL)a10;
+ (id)personalizedResponseForContentDescriptor:(id)a3 requestedProperties:(id)a4;
+ (id)personalizedResponseForContentDescriptor:(id)a3 requestedProperties:(id)a4 matchAlbumArtistOnStoreIdAndName:(BOOL)a5;
+ (uint64_t)_personalizedArtistResponseForStoreID:modelObject:groupingKey:personalizationStyle:personalizationProperties:libraryView:libraryRequest:matchingStoreIDAndName:;
+ (uint64_t)personalizedResponseForContentDescriptor:requestedProperties:matchAlbumArtistOnStoreIdAndName:;
+ (void)_personalizedArtistResponseForStoreID:modelObject:groupingKey:personalizationStyle:personalizationProperties:libraryView:libraryRequest:matchingStoreIDAndName:;
+ (void)personalizedResponseForContentDescriptor:requestedProperties:matchAlbumArtistOnStoreIdAndName:;
- (MPStoreLibraryPersonalizationRequest)request;
- (id)responseHandler;
- (void)cancel;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPStoreLibraryPersonalizationRequestOperation

- (void)execute
{
  v3 = self;
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  if (![(MPAsyncOperation *)self isCancelled])
  {
    if (!v3->_operationQueue)
    {
      v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
      operationQueue = v3->_operationQueue;
      v3->_operationQueue = v5;

      [(NSOperationQueue *)v3->_operationQueue setName:@"com.apple.MediaPlayer.MPStoreLibraryPersonalizationRequestOperation.operationQueue"];
      [(NSOperationQueue *)v3->_operationQueue setMaxConcurrentOperationCount:1];
      v7 = v3->_operationQueue;
      v8 = [MEMORY[0x1E4F29060] currentThread];
      -[NSOperationQueue setQualityOfService:](v7, "setQualityOfService:", [v8 qualityOfService]);

      v3 = self;
    }
    v9 = [(MPStoreLibraryPersonalizationRequestOperation *)v3 request];
    uint64_t v10 = [v9 mediaLibraryOverrideForTestingOnly];

    v71 = (void *)v10;
    if (v10)
    {
      v85 = +[MPStoreLibraryPersonalizationRequest libraryViewWithMediaLibraryOverrideForTestingOnly:v10];
    }
    else
    {
      v11 = [(MPAsyncOperation *)self userIdentity];
      v85 = +[MPStoreLibraryPersonalizationRequest libraryViewWithUserIdentity:v11];
    }
    v76 = objc_alloc_init(MPModelLibraryRequest);
    v12 = [v85 library];
    [(MPModelLibraryRequest *)v76 setMediaLibrary:v12];

    -[MPModelLibraryRequest setFilteringOptions:](v76, "setFilteringOptions:", [v85 filteringOptions]);
    v80 = objc_alloc_init(MPStoreLibraryPersonalizationCollectionDataSource);
    v13 = [(MPModelRequest *)self->_request itemProperties];
    [(MPStoreLibraryPersonalizationCollectionDataSource *)v80 setItemProperties:v13];

    v14 = [(MPStoreLibraryPersonalizationRequest *)self->_request itemIndexPathToOverridePropertySet];
    [(MPStoreLibraryPersonalizationCollectionDataSource *)v80 setItemIndexPathToOverridePropertySet:v14];

    v15 = [(MPModelRequest *)self->_request sectionProperties];
    [(MPStoreLibraryPersonalizationCollectionDataSource *)v80 setSectionProperties:v15];

    [(MPStoreLibraryPersonalizationCollectionDataSource *)v80 setLibraryView:v85];
    v74 = [(MPStoreLibraryPersonalizationRequest *)self->_request representedObjects];
    v73 = [(MPStoreLibraryPersonalizationRequest *)self->_request unpersonalizedContentDescriptors];
    id v72 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v141[0] = 0;
    v141[1] = v141;
    v141[2] = 0x3032000000;
    v141[3] = __Block_byref_object_copy__29484;
    v141[4] = __Block_byref_object_dispose__29485;
    id v142 = 0;
    v16 = [MPAsyncBlockOperation alloc];
    v133[0] = MEMORY[0x1E4F143A8];
    v133[1] = 3221225472;
    v133[2] = __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke;
    v133[3] = &unk_1E57F3B98;
    v69 = v80;
    v134 = v69;
    id v75 = v72;
    id v135 = v75;
    v140 = v141;
    id v70 = v74;
    id v136 = v70;
    id v94 = v73;
    id v137 = v94;
    v68 = v76;
    v138 = v68;
    v139 = self;
    val = [(MPAsyncBlockOperation *)v16 initWithStartHandler:v133];
    v92 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:514 valueOptions:0 capacity:1];
    uint64_t v17 = [v94 numberOfSections];
    if (v17 < 1)
    {
      v84 = 0;
    }
    else
    {
      uint64_t v99 = v17;
      v84 = 0;
      for (uint64_t i = 0; i != v99; ++i)
      {
        uint64_t v2 = [v94 numberOfItemsInSection:i];
        if (v2 < 1)
        {
          LOBYTE(v102) = 0;
        }
        else
        {
          uint64_t v19 = 0;
          int v102 = 1;
          do
          {
            v20 = [MEMORY[0x1E4F28D58] indexPathForItem:v19 inSection:i];
            v21 = [v94 itemAtIndexPath:v20];
            uint64_t v22 = objc_opt_class();
            if (v22 == objc_opt_class())
            {
              v23 = [v21 model];
              v24 = [v23 relativeModelObjectForStoreLibraryPersonalization];

              if (v24)
              {
                v25 = [v24 identifiers];
                if (v25)
                {
                  v26 = objc_opt_class();
                  if (([v26 isSubclassOfClass:objc_opt_class()] & 1) == 0) {
                    v102 &= [v26 isSubclassOfClass:objc_opt_class()];
                  }
                  id v27 = [v92 objectForKey:v26];
                  if (!v27)
                  {
                    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    [v92 setObject:v27 forKey:v26];
                  }
                  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v25 forKey:v24];
                  [v27 addObject:v28];
                }
              }
            }
            ++v19;
          }
          while (v2 != v19);
        }
        v29 = [v94 sectionAtIndex:i];
        uint64_t v30 = objc_opt_class();
        if (v30 == objc_opt_class() && [v29 personalizationStyle])
        {
          uint64_t v2 = [v29 model];
          v31 = [(id)v2 relativeModelObjectForStoreLibraryPersonalization];

          if (v31)
          {
            uint64_t v2 = [v31 identifiers];
            if (v2)
            {
              v32 = objc_opt_class();
              if ((v102 & 1) != 0
                && (([v32 isSubclassOfClass:objc_opt_class()] & 1) != 0
                 || ([v32 isSubclassOfClass:objc_opt_class()] & 1) != 0
                 || [v32 isSubclassOfClass:objc_opt_class()]))
              {
                id v33 = v84;
                if (!v84) {
                  id v33 = objc_alloc_init(MEMORY[0x1E4F28E60]);
                }
                v84 = v33;
                [v33 addIndex:i];
              }
              id v34 = [v92 objectForKey:v32];
              if (!v34)
              {
                id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                [v92 setObject:v34 forKey:v32];
              }
              v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v2 forKey:v31];
              [v34 addObject:v35];
            }
          }
        }
      }
    }
    v131[0] = 0;
    v131[1] = v131;
    v131[2] = 0x3812000000;
    v131[3] = __Block_byref_object_copy__29;
    v131[4] = __Block_byref_object_dispose__30;
    v131[5] = &unk_1956C748F;
    int v132 = 0;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    obuint64_t j = v92;
    uint64_t v77 = [obj countByEnumeratingWithState:&v127 objects:v146 count:16];
    if (!v77)
    {
LABEL_112:

      [(NSOperationQueue *)self->_operationQueue addOperation:val];
      _Block_object_dispose(v131, 8);

      _Block_object_dispose(v141, 8);
      return;
    }
    char v78 = 0;
    uint64_t v79 = *(void *)v128;
    uint64_t v96 = *MEMORY[0x1E4F778C8];
LABEL_50:
    uint64_t v87 = 0;
    while (1)
    {
      if (*(void *)v128 != v79) {
        objc_enumerationMutation(obj);
      }
      v36 = *(void **)(*((void *)&v127 + 1) + 8 * v87);
      if (+[MPStoreLibraryMappingRequestOperation supportsModelClass:v36])
      {
        break;
      }
LABEL_110:
      if (++v87 == v77)
      {
        uint64_t v77 = [obj countByEnumeratingWithState:&v127 objects:v146 count:16];
        if (!v77) {
          goto LABEL_112;
        }
        goto LABEL_50;
      }
    }
    v95 = [MEMORY[0x1E4F1CA48] array];
    v83 = [obj objectForKey:v36];
    if ([v36 isSubclassOfClass:objc_opt_class()]
      && [(MPStoreLibraryPersonalizationRequest *)self->_request matchAlbumArtistsOnNameAndStoreID])
    {
      int v37 = 0;
    }
    else
    {
      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      id v38 = v83;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v123 objects:v145 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v124;
        do
        {
          for (uint64_t j = 0; j != v39; ++j)
          {
            if (*(void *)v124 != v40) {
              objc_enumerationMutation(v38);
            }
            v42 = [*(id *)(*((void *)&v123 + 1) + 8 * j) allValues];
            [v95 addObjectsFromArray:v42];
          }
          uint64_t v39 = [v38 countByEnumeratingWithState:&v123 objects:v145 count:16];
        }
        while (v39);
      }

      int v37 = 1;
    }
    v43 = objc_alloc_init(MPStoreLibraryMappingRequestOperation);
    [(MPStoreLibraryMappingRequestOperation *)v43 setLibraryView:v85];
    [(MPStoreLibraryMappingRequestOperation *)v43 setModelClass:v36];
    if (v37) {
      v44 = v95;
    }
    else {
      v44 = 0;
    }
    [(MPStoreLibraryMappingRequestOperation *)v43 setIdentifierSets:v44];
    v86 = v43;
    if (v78)
    {
      char v45 = 0;
      char v78 = 1;
    }
    else if ([v84 count] {
           && (([v36 isSubclassOfClass:objc_opt_class()] & 1) != 0
    }
            || [v36 isSubclassOfClass:objc_opt_class()]))
    {
      char v78 = 1;
      char v45 = 1;
    }
    else
    {
      char v78 = 0;
      char v45 = 0;
    }
    objc_initWeak(&location, val);
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_53;
    v112[3] = &unk_1E57F3C38;
    v118 = v131;
    v119 = v141;
    v120[1] = v36;
    char v121 = v45;
    id v113 = v84;
    id v114 = v94;
    id v115 = v75;
    id v116 = v85;
    objc_copyWeak(v120, &location);
    v117 = self;
    [(MPStoreLibraryMappingRequestOperation *)v86 setResponseHandler:v112];
    if (v37)
    {
      [(MPAsyncBlockOperation *)val addDependency:v86];
      [(NSOperationQueue *)self->_operationQueue addOperation:v86];
LABEL_109:
      objc_destroyWeak(v120);

      objc_destroyWeak(&location);
      goto LABEL_110;
    }
    v98 = [MEMORY[0x1E4F1CA60] dictionary];
    id v103 = [MEMORY[0x1E4F1CA48] array];
    int v46 = [MEMORY[0x1E4FB87C0] canAccessAccountStore];
    v47 = (void *)MEMORY[0x1E4F79AF8];
    if (v46)
    {
      v48 = [MEMORY[0x1E4FB87B8] activeAccount];
      v100 = [v47 musicLibraryForUserAccount:v48];
    }
    else
    {
      v100 = [MEMORY[0x1E4F79AF8] autoupdatingSharedLibrary];
    }
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v89 = v83;
    uint64_t v91 = [v89 countByEnumeratingWithState:&v108 objects:v144 count:16];
    if (!v91)
    {
LABEL_108:

      [(MPStoreLibraryMappingRequestOperation *)v86 setAlbumArtistNamesToIdentifierSets:v103];
      [(MPAsyncBlockOperation *)val addDependency:v86];
      [(NSOperationQueue *)self->_operationQueue addOperation:v86];

      goto LABEL_109;
    }
    uint64_t v90 = *(void *)v109;
LABEL_82:
    uint64_t v93 = 0;
    while (1)
    {
      if (*(void *)v109 != v90) {
        objc_enumerationMutation(v89);
      }
      v49 = *(void **)(*((void *)&v108 + 1) + 8 * v93);
      long long v104 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      v50 = [v49 allKeys];
      uint64_t v51 = [v50 countByEnumeratingWithState:&v104 objects:v143 count:16];
      if (v51) {
        break;
      }
LABEL_106:

      if (++v93 == v91)
      {
        uint64_t v91 = [v89 countByEnumeratingWithState:&v108 objects:v144 count:16];
        if (!v91) {
          goto LABEL_108;
        }
        goto LABEL_82;
      }
    }
    uint64_t v52 = *(void *)v105;
    id v97 = v50;
LABEL_87:
    uint64_t v53 = 0;
    while (1)
    {
      if (*(void *)v105 != v52) {
        objc_enumerationMutation(v97);
      }
      id v54 = *(id *)(*((void *)&v104 + 1) + 8 * v53);
      v55 = [v49 objectForKey:v54];
      v56 = [v55 universalStore];
      uint64_t v57 = [v56 adamID];

      v58 = [v54 name];
      v59 = v58;
      if (v58)
      {
        if ([v58 length]) {
          BOOL v60 = 1;
        }
        else {
          BOOL v60 = v57 == 0;
        }
        if (!v60)
        {
LABEL_98:
          v61 = [NSNumber numberWithLongLong:v57];
          v62 = [v98 objectForKey:v61];
          BOOL v63 = v62 == 0;

          if (v63) {
            [MEMORY[0x1E4F77950] snapshotWithDomain:v96 type:@"Bug" subType:@"Album Artist With No Name" context:@"Request to personalize album artist with missing name" triggerThresholdValues:0 events:&unk_1EE6EDFA0 completion:0];
          }
        }
      }
      else if (v57)
      {
        goto LABEL_98;
      }
      v64 = [v100 groupingKeyForString:v59];
      v65 = (void *)MEMORY[0x1E4F1C9E8];
      v66 = v64;
      if (!v64)
      {
        uint64_t v2 = [MEMORY[0x1E4F1CA98] null];
        v66 = (void *)v2;
      }
      v67 = [v65 dictionaryWithObject:v66 forKey:v55];
      if (!v64) {

      }
      [v103 addObject:v67];
      if (v51 == ++v53)
      {
        v50 = v97;
        uint64_t v51 = [v97 countByEnumeratingWithState:&v104 objects:v143 count:16];
        if (!v51) {
          goto LABEL_106;
        }
        goto LABEL_87;
      }
    }
  }
  id v101 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:6 userInfo:0];
  responseHandler = (void (**)(id, void, id))self->_responseHandler;
  if (responseHandler) {
    responseHandler[2](responseHandler, 0, v101);
  }
  [(MPAsyncOperation *)self finishWithError:v101];
}

void __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 64) + 16))())
  {
    [*(id *)(a1 + 32) appendSection:v5];
    v6 = *(void **)(a1 + 40);
    v7 = [*(id *)(a1 + 48) sectionAtIndex:a3];
    [v6 appendSection:v7];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_4;
    v9[3] = &unk_1E57F3B48;
    v8 = *(void **)(a1 + 56);
    id v13 = *(id *)(a1 + 64);
    uint64_t v14 = a3;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    [v8 enumerateItemsInSectionAtIndex:a3 usingBlock:v9];
  }
}

- (MPStoreLibraryPersonalizationRequest)request
{
  return self->_request;
}

void __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
  {
    id v5 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:*(void *)(a1 + 64)];
    [*(id *)(a1 + 32) appendItem:v8];
    v6 = *(void **)(a1 + 40);
    v7 = [*(id *)(a1 + 48) itemAtIndexPath:v5];
    [v6 appendItem:v7];
  }
}

BOOL __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    id v6 = v3;
    if ([v6 personalizationStyle] == 4)
    {
      v7 = [v6 model];
      id v8 = [v7 relativeModelObjectForStoreLibraryPersonalization];

      if (v8)
      {
        v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:objc_opt_class()];
        id v10 = [v8 identifiers];
        id v11 = [v9 libraryIdentifierSetForIdentifierSet:v10];
        BOOL v5 = v11 != 0;
      }
      else
      {
        BOOL v5 = 0;
      }
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)setResponseHandler:(id)a3
{
}

- (void)setRequest:(id)a3
{
}

void __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if ([*(id *)(a1 + 40) count]) {
    uint64_t v5 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v5 = 0;
  }
  [v4 setSectionToLibraryAddedOverride:v5];
  [*(id *)(a1 + 32) setRelativeModelClassToMappingResponse:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_2;
  v27[3] = &unk_1E57F3B20;
  v27[4] = *(void *)(a1 + 80);
  id v6 = (void *)MEMORY[0x19971E0F0](v27);
  if (*(void *)(a1 + 48)) {
    v7 = objc_alloc_init(MPMutableSectionedCollection);
  }
  else {
    v7 = 0;
  }
  id v8 = objc_alloc_init(MPMutableSectionedCollection);
  v9 = *(void **)(a1 + 56);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_3;
  v21 = &unk_1E57F3B70;
  id v10 = v6;
  id v26 = v10;
  id v11 = v8;
  uint64_t v22 = v11;
  id v12 = v7;
  v23 = v12;
  id v24 = *(id *)(a1 + 48);
  id v25 = *(id *)(a1 + 56);
  [v9 enumerateSectionsUsingBlock:&v18];
  objc_msgSend(*(id *)(a1 + 32), "setUnpersonalizedContentDescriptors:", v11, v18, v19, v20, v21);
  id v13 = [[MPModelLibraryResponse alloc] initWithRequest:*(void *)(a1 + 64)];
  uint64_t v14 = [(MPModelResponse *)[MPStoreLibraryPersonalizationResponse alloc] initWithRequest:*(void *)(*(void *)(a1 + 72) + 280)];
  [(MPStoreLibraryPersonalizationResponse *)v14 setLibraryResponse:v13];
  [(MPStoreLibraryPersonalizationResponse *)v14 setRepresentedObjectResults:v12];
  v15 = [[MPLazySectionedCollection alloc] initWithDataSource:*(void *)(a1 + 32)];
  [(MPModelResponse *)v14 setResults:v15];

  v16 = *(void **)(a1 + 72);
  uint64_t v17 = v16[36];
  if (v17)
  {
    (*(void (**)(void, MPStoreLibraryPersonalizationResponse *, void))(v17 + 16))(v16[36], v14, 0);
    v16 = *(void **)(a1 + 72);
  }
  [v16 finishWithError:0];
  [v3 finish];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

void __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_53(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 72) + 8) + 48));
  if (v3)
  {
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (!v4)
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:514 valueOptions:0 capacity:1];
      uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8);
      v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    }
    [v4 setObject:v3 forKey:*(void *)(a1 + 96)];
  }
  if (*(unsigned char *)(a1 + 104))
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_2_54;
    v11[3] = &unk_1E57F3C10;
    id v8 = *(void **)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v13 = v3;
    id v14 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 72);
    id v15 = v9;
    uint64_t v17 = v10;
    objc_copyWeak(&v18, (id *)(a1 + 88));
    uint64_t v16 = *(void *)(a1 + 64);
    [v8 enumerateIndexesUsingBlock:v11];
    objc_destroyWeak(&v18);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 72) + 8) + 48));
}

- (id)responseHandler
{
  return self->_responseHandler;
}

void __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_2_54(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x4812000000;
  int v37 = __Block_byref_object_copy__55;
  id v38 = __Block_byref_object_dispose__56;
  uint64_t v39 = &unk_1956C748F;
  v41 = 0;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__29484;
  v32 = __Block_byref_object_dispose__29485;
  id v33 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_58;
  v24[3] = &unk_1E57F3BC0;
  uint64_t v4 = *(void **)(a1 + 32);
  id v25 = *(id *)(a1 + 40);
  id v26 = &v28;
  id v27 = &v34;
  [v4 enumerateItemsInSectionAtIndex:a2 usingBlock:v24];
  uint64_t v5 = v29;
  if (!v29[5])
  {
    uint64_t v7 = v35[6];
    uint64_t v6 = v35[7];
    unint64_t v8 = [*(id *)(a1 + 32) numberOfItemsInSection:a2];
    uint64_t v5 = v29;
    if (v8 > (v6 - v7) >> 3)
    {
      id v9 = (void *)v29[5];
      v29[5] = MEMORY[0x1E4F1CC28];

      uint64_t v5 = v29;
    }
  }
  uint64_t v10 = v5[5];
  if (v10)
  {
    id v11 = *(void **)(a1 + 48);
    id v12 = [NSNumber numberWithUnsignedInteger:a2];
    [v11 setObject:v10 forKey:v12];
  }
  else
  {
    id v12 = objc_alloc_init(_MPStoreLibraryPersonalizationAggregateLibraryAddedOperation);
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    __p = 0;
    std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, (const void *)v35[6], v35[7], (v35[7] - v35[6]) >> 3);
    [(_MPStoreLibraryPersonalizationAggregateLibraryAddedOperation *)v12 setPersistentIDs:&__p];
    if (__p)
    {
      uint64_t v22 = __p;
      operator delete(__p);
    }
    [(_MPStoreLibraryPersonalizationAggregateLibraryAddedOperation *)v12 setLibraryView:*(void *)(a1 + 56)];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_2_61;
    uint64_t v17 = &unk_1E57F3BE8;
    uint64_t v19 = *(void *)(a1 + 72);
    id v18 = *(id *)(a1 + 48);
    uint64_t v20 = a2;
    [(_MPStoreLibraryPersonalizationAggregateLibraryAddedOperation *)v12 setResponseHandler:&v14];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(WeakRetained, "addDependency:", v12, v14, v15, v16, v17);

    [*(id *)(*(void *)(a1 + 64) + 272) addOperation:v12];
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
  if (v40)
  {
    v41 = v40;
    operator delete(v40);
  }
}

void __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_58(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v30 = a2;
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    id v7 = v30;
    unint64_t v8 = [v7 model];
    id v9 = [v8 relativeModelObjectForStoreLibraryPersonalization];

    if (v9)
    {
      uint64_t v10 = [v9 identifiers];
      id v11 = [*(id *)(a1 + 32) libraryIdentifierSetForIdentifierSet:v10];
      id v12 = [v11 library];
      uint64_t v13 = [v12 persistentID];

      if (v13)
      {
        uint64_t v14 = *(void **)(*(void *)(a1 + 48) + 8);
        uint64_t v16 = (uint64_t *)v14[7];
        unint64_t v15 = v14[8];
        if ((unint64_t)v16 >= v15)
        {
          uint64_t v20 = (uint64_t *)v14[6];
          uint64_t v21 = v16 - v20;
          unint64_t v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 61) {
            std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v23 = v15 - (void)v20;
          if (v23 >> 2 > v22) {
            unint64_t v22 = v23 >> 2;
          }
          BOOL v24 = (unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8;
          unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
          if (!v24) {
            unint64_t v25 = v22;
          }
          if (v25)
          {
            unint64_t v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v25);
            uint64_t v20 = (uint64_t *)v14[6];
            uint64_t v16 = (uint64_t *)v14[7];
          }
          else
          {
            uint64_t v26 = 0;
          }
          id v27 = (uint64_t *)(v25 + 8 * v21);
          unint64_t v28 = v25 + 8 * v26;
          *id v27 = v13;
          uint64_t v17 = v27 + 1;
          while (v16 != v20)
          {
            uint64_t v29 = *--v16;
            *--id v27 = v29;
          }
          v14[6] = v27;
          v14[7] = v17;
          v14[8] = v28;
          if (v20) {
            operator delete(v20);
          }
        }
        else
        {
          uint64_t *v16 = v13;
          uint64_t v17 = v16 + 1;
        }
        v14[7] = v17;
      }
      else
      {
        uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = MEMORY[0x1E4F1CC28];
      }
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      *a4 = 1;
    }
  }
}

void __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_2_61(void *a1, uint64_t a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 48));
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = [NSNumber numberWithBool:a2];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a1[6]];
  [v4 setObject:v5 forKey:v6];

  id v7 = (os_unfair_lock_s *)(*(void *)(a1[5] + 8) + 48);

  os_unfair_lock_unlock(v7);
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)MPStoreLibraryPersonalizationRequestOperation;
  [(MPAsyncOperation *)&v3 cancel];
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
}

+ (id)_personalizedArtistResponseForStoreID:(int64_t)a3 modelObject:(id)a4 groupingKey:(id)a5 personalizationStyle:(int64_t)a6 personalizationProperties:(id)a7 libraryView:(id)a8 libraryRequest:(id)a9 matchingStoreIDAndName:(BOOL)a10
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int64_t v19 = a3;
  id v18 = a4;
  id v17 = a5;
  id v16 = a7;
  id v15 = a8;
  BOOL v14 = a10;
  [[MPModelLibraryResponse alloc] initWithRequest:a9];
  mlcore::ArtistPropertyStoreID((mlcore *)objc_alloc_init(MPMutableSectionedCollection));
  std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>();
}

+ (void)_personalizedArtistResponseForStoreID:modelObject:groupingKey:personalizationStyle:personalizationProperties:libraryView:libraryRequest:matchingStoreIDAndName:
{
}

+ (uint64_t)_personalizedArtistResponseForStoreID:modelObject:groupingKey:personalizationStyle:personalizationProperties:libraryView:libraryRequest:matchingStoreIDAndName:
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"Z208+[MPStoreLibraryPersonalizationRequestOperation _personalizedArtistResponseForStoreID:modelObject:groupingKey:personalizationStyle:personalizationProperties:libraryView:libraryRequest:matchingStoreIDAndName:]E3$_2"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

+ (__n128)_personalizedArtistResponseForStoreID:modelObject:groupingKey:personalizationStyle:personalizationProperties:libraryView:libraryRequest:matchingStoreIDAndName:
{
  uint64_t v2 = (char *)operator new(0x40uLL);
  *(void *)uint64_t v2 = &unk_1EE6727C0;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(a1 + 24);
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(v2 + 40) = result;
  *((void *)v2 + 7) = *(void *)(a1 + 56);
  return result;
}

+ (id)personalizedResponseForContentDescriptor:(id)a3 requestedProperties:(id)a4 matchAlbumArtistOnStoreIdAndName:(BOOL)a5
{
  BOOL v5 = a5;
  v107[7] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v92 = a4;
  id v89 = v7;
  long long v104 = [v7 model];
  id v103 = +[MPMediaLibraryEntityTranslator translatorForMPModelClass:objc_opt_class()];
  uint64_t v8 = [v7 personalizationStyle];
  uint64_t v9 = v8;
  if ((unint64_t)(v8 - 1) < 2)
  {
    uint64_t v10 = +[MPStoreLibraryPersonalizationContentDescriptor lightweightPersonalizationPropertiesForModelClass:objc_opt_class()];
    id v11 = [v92 propertySetByIntersectingWithPropertySet:v10];
    id v12 = +[MPStoreLibraryPersonalizationContentDescriptor requiredLightweightPersonalizationPropertiesForModelClass:objc_opt_class() requestedProperties:v92];
    uint64_t v13 = [v11 propertySetByCombiningWithPropertySet:v12];
    goto LABEL_5;
  }
  if ((unint64_t)(v8 - 3) < 2)
  {
    uint64_t v10 = +[MPStoreLibraryPersonalizationContentDescriptor lightweightPersonalizationPropertiesForModelClass:objc_opt_class()];
    id v11 = [v92 propertySetByCombiningWithPropertySet:v10];
    id v12 = +[MPStoreLibraryPersonalizationContentDescriptor requiredLightweightPersonalizationPropertiesForModelClass:objc_opt_class() requestedProperties:v92];
    uint64_t v13 = [v11 propertySetByCombiningWithPropertySet:v12];
LABEL_5:
    int v102 = (void *)v13;

    goto LABEL_6;
  }
  int v102 = +[MPPropertySet emptyPropertySet];

  if (!v9)
  {
    unint64_t v22 = objc_alloc_init(MPModelRequest);
    id v17 = [[MPModelResponse alloc] initWithRequest:v22];
    uint64_t v23 = objc_alloc_init(MPMutableSectionedCollection);
    [(MPMutableSectionedCollection *)v23 appendSection:&stru_1EE680640];
    [(MPMutableSectionedCollection *)v23 appendItem:v104];
    [(MPModelResponse *)v17 setResults:v23];

    goto LABEL_40;
  }
LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v14 = [MEMORY[0x1E4FB87B8] activeAccount];
    id v15 = +[MPStoreLibraryPersonalizationRequest libraryViewWithUserIdentity:v14];

    v100 = objc_alloc_init(MPModelLibraryRequest);
    id v16 = [v15 library];
    [(MPModelLibraryRequest *)v100 setMediaLibrary:v16];

    -[MPModelLibraryRequest setFilteringOptions:](v100, "setFilteringOptions:", [v15 filteringOptions]);
    id v17 = [[MPModelLibraryResponse alloc] initWithRequest:v100];
    uint64_t v90 = objc_alloc_init(MPMutableSectionedCollection);
    __p = 0;
    uint64_t v96 = 0;
    v98 = 0;
    id v18 = [v104 identifiers];
    int64_t v19 = [v18 universalStore];
    uint64_t v20 = [v19 adamID];

    if (v20)
    {
      uint64_t v21 = (uint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(1uLL);
      uint64_t *v21 = v20;
      __p = v21;
      v98 = &v21[v30];
      uint64_t v96 = v21 + 1;
    }
    v31 = [v18 universalStore];
    uint64_t v32 = [v31 subscriptionAdamID];

    uint64_t v34 = v96;
    if (v32)
    {
      if (v96 >= v98)
      {
        id v33 = __p;
        uint64_t v36 = v96 - __p;
        unint64_t v37 = v36 + 1;
        if ((unint64_t)(v36 + 1) >> 61) {
          std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v38 = (char *)v98 - (char *)__p;
        if (((char *)v98 - (char *)__p) >> 2 > v37) {
          unint64_t v37 = v38 >> 2;
        }
        BOOL v39 = (unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8;
        unint64_t v40 = 0x1FFFFFFFFFFFFFFFLL;
        if (!v39) {
          unint64_t v40 = v37;
        }
        if (v40)
        {
          unint64_t v40 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v40);
          id v33 = __p;
          uint64_t v34 = v96;
        }
        v41 = (uint64_t *)(v40 + 8 * v36);
        uint64_t *v41 = v32;
        v35 = v41 + 1;
        while (v34 != v33)
        {
          uint64_t v42 = *--v34;
          *--v41 = v42;
        }
        __p = v41;
        if (v33) {
          operator delete(v33);
        }
      }
      else
      {
        *uint64_t v96 = v32;
        v35 = v96 + 1;
      }
      uint64_t v34 = v35;
    }
    if (v34 != __p)
    {
      if ((unint64_t)((char *)v34 - (char *)__p) >= 9)
      {
        mlcore::ItemPropertyStoreID((mlcore *)v33);
        std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>();
      }
      v43 = (mlcore *)mlcore::ItemPropertyStoreID((mlcore *)v33);
      uint64_t v44 = mlcore::ItemPropertySubscriptionStoreItemID(v43);
      char v45 = operator new(0x10uLL);
      *char v45 = v43;
      v45[1] = v44;
      int v46 = operator new(0x50uLL);
      v46[1] = 0;
      v46[2] = 0;
      *int v46 = &unk_1EE6731D0;
      mlcore::AnyInPredicate<long long>::AnyInPredicate();
    }
    [(MPModelResponse *)v17 setResults:v90];

    if (__p) {
      operator delete(__p);
    }

    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v58 = [MPModelResponse alloc];
        v59 = objc_alloc_init(MPModelRequest);
        id v17 = [(MPModelResponse *)v58 initWithRequest:v59];

        BOOL v60 = objc_alloc_init(MPMutableSectionedCollection);
        [(MPModelResponse *)v17 setResults:v60];

        goto LABEL_40;
      }
      v49 = [MEMORY[0x1E4FB87B8] activeAccount];
      uint64_t v91 = +[MPStoreLibraryPersonalizationRequest libraryViewWithUserIdentity:v49];

      v50 = objc_alloc_init(MPModelLibraryRequest);
      uint64_t v51 = [v91 library];
      [(MPModelLibraryRequest *)v50 setMediaLibrary:v51];

      -[MPModelLibraryRequest setFilteringOptions:](v50, "setFilteringOptions:", [v91 filteringOptions]);
      v88 = v104;
      v85 = [(__CFString *)v88 identifiers];
      uint64_t v52 = [v85 universalStore];
      uint64_t v53 = [v52 adamID];

      uint64_t v87 = [(__CFString *)v88 name];
      int v54 = [MEMORY[0x1E4FB87C0] canAccessAccountStore];
      v55 = (void *)MEMORY[0x1E4F79AF8];
      if (v54)
      {
        v56 = [MEMORY[0x1E4FB87B8] activeAccount];
        v86 = [v55 musicLibraryForUserAccount:v56];
      }
      else
      {
        v86 = [MEMORY[0x1E4F79AF8] autoupdatingSharedLibrary];
      }
      v73 = [[MPModelLibraryResponse alloc] initWithRequest:v50];
      v74 = objc_alloc_init(MPMutableSectionedCollection);
      [(MPModelResponse *)v73 setResults:v74];
      if (v53)
      {
        if (!v5) {
          goto LABEL_79;
        }
        if (v87 && [v87 length])
        {
          id v75 = [v86 groupingKeyForString:v87];
LABEL_80:
          LOBYTE(v83) = v5;
          id v17 = +[MPStoreLibraryPersonalizationRequestOperation _personalizedArtistResponseForStoreID:v53 modelObject:v104 groupingKey:v75 personalizationStyle:v9 personalizationProperties:v102 libraryView:v91 libraryRequest:v50 matchingStoreIDAndName:v83];

          v76 = 0;
          goto LABEL_81;
        }
        v84 = (void *)MEMORY[0x1E4F77950];
        uint64_t v77 = v88;
        if (!v88) {
          uint64_t v77 = @"<nil>";
        }
        long long v105 = @"modelObject";
        long long v106 = v77;
        char v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
        v107[0] = v78;
        uint64_t v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:1];
        [v84 snapshotWithDomain:*MEMORY[0x1E4F778C8] type:@"Bug" subType:@"Album Artist With No Name" context:@"Request to personalize album artist with missing name" triggerThresholdValues:0 events:v79 completion:0];

        v76 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPStoreLibraryPersonalizationRequestOperationErrorDomain", 1, @"No album artist name to favorite.");
        if (!v76)
        {
LABEL_79:
          id v75 = 0;
          goto LABEL_80;
        }
        v80 = [MPModelResponse alloc];
        v81 = objc_alloc_init(MPModelRequest);
        id v17 = [(MPModelResponse *)v80 initWithRequest:v81];

        v82 = objc_alloc_init(MPMutableSectionedCollection);
        id v75 = 0;
        v74 = v82;
        [(MPModelResponse *)v17 setResults:v82];
      }
      else
      {
        id v75 = 0;
        v76 = 0;
        id v17 = v73;
      }
LABEL_81:

      goto LABEL_40;
    }
  }
  BOOL v24 = [MEMORY[0x1E4FB87B8] activeAccount];
  uint64_t v93 = +[MPStoreLibraryPersonalizationRequest libraryViewWithUserIdentity:v24];

  id v101 = objc_alloc_init(MPModelLibraryRequest);
  unint64_t v25 = [v93 library];
  [(MPModelLibraryRequest *)v101 setMediaLibrary:v25];

  -[MPModelLibraryRequest setFilteringOptions:](v101, "setFilteringOptions:", [v93 filteringOptions]);
  id v17 = [[MPModelLibraryResponse alloc] initWithRequest:v101];
  uint64_t v26 = objc_alloc_init(MPMutableSectionedCollection);
  __pa = 0;
  id v97 = 0;
  uint64_t v99 = 0;
  id v27 = [v104 identifiers];
  unint64_t v28 = [v27 universalStore];
  uint64_t v29 = [v28 adamID];

  if (v29)
  {
    uint64_t v57 = (uint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(1uLL);
    *uint64_t v57 = v29;
    __pa = v57;
    uint64_t v99 = &v57[v61];
    id v97 = v57 + 1;
  }
  v62 = [v27 universalStore];
  uint64_t v63 = [v62 subscriptionAdamID];

  v65 = v97;
  if (v63)
  {
    if (v97 >= v99)
    {
      v64 = __pa;
      uint64_t v67 = v97 - __pa;
      unint64_t v68 = v67 + 1;
      if ((unint64_t)(v67 + 1) >> 61) {
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v69 = (char *)v99 - (char *)__pa;
      if (((char *)v99 - (char *)__pa) >> 2 > v68) {
        unint64_t v68 = v69 >> 2;
      }
      BOOL v39 = (unint64_t)v69 >= 0x7FFFFFFFFFFFFFF8;
      unint64_t v70 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v39) {
        unint64_t v70 = v68;
      }
      if (v70)
      {
        unint64_t v70 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v70);
        v64 = __pa;
        v65 = v97;
      }
      v71 = (uint64_t *)(v70 + 8 * v67);
      uint64_t *v71 = v63;
      v66 = v71 + 1;
      while (v65 != v64)
      {
        uint64_t v72 = *--v65;
        *--v71 = v72;
      }
      __pa = v71;
      if (v64) {
        operator delete(v64);
      }
    }
    else
    {
      *id v97 = v63;
      v66 = v97 + 1;
    }
    v65 = v66;
  }
  if (v65 != __pa)
  {
    mlcore::ItemPropertyStorePlaylistID((mlcore *)v64);
    std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>();
  }
  [(MPModelResponse *)v17 setResults:v26];

  if (__pa) {
    operator delete(__pa);
  }

LABEL_40:
  v47 = v17;

  return v47;
}

+ (void)personalizedResponseForContentDescriptor:requestedProperties:matchAlbumArtistOnStoreIdAndName:
{
}

+ (uint64_t)personalizedResponseForContentDescriptor:requestedProperties:matchAlbumArtistOnStoreIdAndName:
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"Z143+[MPStoreLibraryPersonalizationRequestOperation personalizedResponseForContentDescriptor:requestedProperties:matchAlbumArtistOnStoreIdAndName:]E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

+ (__n128)personalizedResponseForContentDescriptor:requestedProperties:matchAlbumArtistOnStoreIdAndName:
{
  uint64_t v2 = (char *)operator new(0x38uLL);
  *(void *)uint64_t v2 = &unk_1EE672710;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(a1 + 24);
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(v2 + 40) = result;
  return result;
}

+ (id)personalizedResponseForContentDescriptor:(id)a3 requestedProperties:(id)a4
{
  uint64_t v4 = +[MPStoreLibraryPersonalizationRequestOperation personalizedResponseForContentDescriptor:a3 requestedProperties:a4 matchAlbumArtistOnStoreIdAndName:1];

  return v4;
}

@end