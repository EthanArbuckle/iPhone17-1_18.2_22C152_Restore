@interface LNSpotlightCascadeHandler
+ (id)_getSearchQuery:(id)a3 context:(id)a4;
+ (void)handleDeletionStream:(id)a3 items:(id)a4 bundleId:(id)a5 completionHandler:(id)a6;
+ (void)handleFullSetStream:(id)a3 items:(id)a4 bundleId:(id)a5 quota:(unint64_t)a6 indexName:(id)a7 serialNumber:(unint64_t)a8 completionHandler:(id)a9;
+ (void)handleIncrementalStream:(id)a3 items:(id)a4 bundleId:(id)a5 existingItemCount:(unint64_t)a6 quota:(unint64_t)a7 completionHandler:(id)a8;
@end

@implementation LNSpotlightCascadeHandler

+ (void)handleFullSetStream:(id)a3 items:(id)a4 bundleId:(id)a5 quota:(unint64_t)a6 indexName:(id)a7 serialNumber:(unint64_t)a8 completionHandler:(id)a9
{
  v94[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v64 = a5;
  id v60 = a7;
  v65 = (void (**)(id, void *))a9;
  v66 = v16;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    v56 = [MEMORY[0x1E4F28B00] currentHandler];
    [v56 handleFailureInMethod:a2, a1, @"LNSpotlightCascadeHandler.m", 145, @"Invalid parameter not satisfying: %@", @"stream" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
  }
  v57 = [MEMORY[0x1E4F28B00] currentHandler];
  [v57 handleFailureInMethod:a2, a1, @"LNSpotlightCascadeHandler.m", 146, @"Invalid parameter not satisfying: %@", @"items" object file lineNumber description];

LABEL_3:
  if (!v64)
  {
    v58 = [MEMORY[0x1E4F28B00] currentHandler];
    [v58 handleFailureInMethod:a2, a1, @"LNSpotlightCascadeHandler.m", 147, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];
  }
  if (!v65)
  {
    v59 = [MEMORY[0x1E4F28B00] currentHandler];
    [v59 handleFailureInMethod:a2, a1, @"LNSpotlightCascadeHandler.m", 148, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v18 = getLNLogCategoryVocabulary();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v64;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v17 count];
    _os_log_impl(&dword_1A4419000, v18, OS_LOG_TYPE_DEBUG, "Making full set donation for %@. %ld items provided in this request.", buf, 0x16u);
  }

  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2050000000;
  v19 = (void *)getCSSearchQueryContextClass_softClass;
  v76 = (uint64_t (*)(uint64_t, uint64_t))getCSSearchQueryContextClass_softClass;
  if (!getCSSearchQueryContextClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCSSearchQueryContextClass_block_invoke;
    v89 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5B39E50;
    v90 = (void (*)(uint64_t))&v73;
    __getCSSearchQueryContextClass_block_invoke((uint64_t)buf);
    v19 = (void *)v74[3];
  }
  v20 = v19;
  _Block_object_dispose(&v73, 8);
  id v67 = objc_alloc_init(v20);
  v62 = objc_msgSend(NSString, "stringWithFormat:", @"_kMDItemSerialNumber < %llu", a8);
  v94[0] = v62;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:1];
  [v67 setFilterQueries:v21];

  id v93 = v64;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
  [v67 setBundleIDs:v22];

  v92[0] = @"_kMDItemAppEntityPriority";
  v92[1] = @"kMDItemAppEntityDisplayRepresentationSynonyms";
  v92[2] = @"_kMDItemAppEntityTypeDisplayRepresentationSynonyms";
  v92[3] = @"_kMDItemAppEntityTypeDisplayRepresentationName";
  v92[4] = @"_kMDItemAppEntityTypeIdentifier";
  v92[5] = @"_kMDItemAppEntityInstanceIdentifier";
  v92[6] = @"kMDItemAppEntityTitle";
  v92[7] = @"kMDItemAppEntitySubtitle";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:8];
  [v67 setFetchAttributes:v23];

  v61 = [NSString stringWithFormat:@"%@=*", @"_kMDItemAppEntityInstanceIdentifier"];
  v63 = [a1 _getSearchQuery:v61 context:v67];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v89 = __Block_byref_object_copy__11154;
  v90 = __Block_byref_object_dispose__11155;
  v91 = [[LNBinaryHeap alloc] initWithCapacity:(unint64_t)(float)((float)a6 * 0.8) comparator:&__block_literal_global_11157 admissionPolicy:&__block_literal_global_34];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v24 = v17;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v80 objects:v87 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v81 != v26) {
          objc_enumerationMutation(v24);
        }
        [*(id *)(*(void *)&buf[8] + 40) insertObject:*(void *)(*((void *)&v80 + 1) + 8 * i)];
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v80 objects:v87 count:16];
    }
    while (v25);
  }

  dispatch_group_t v28 = dispatch_group_create();
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __111__LNSpotlightCascadeHandler_handleFullSetStream_items_bundleId_quota_indexName_serialNumber_completionHandler___block_invoke_2;
  v79[3] = &unk_1E5B39C18;
  v79[4] = buf;
  [v63 setFoundItemsHandler:v79];
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__11154;
  v77 = __Block_byref_object_dispose__11155;
  id v78 = 0;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __111__LNSpotlightCascadeHandler_handleFullSetStream_items_bundleId_quota_indexName_serialNumber_completionHandler___block_invoke_36;
  v70[3] = &unk_1E5B39C40;
  v72 = &v73;
  v29 = v28;
  v71 = v29;
  [v63 setCompletionHandler:v70];
  dispatch_group_enter(v29);
  v30 = getLNLogCategoryVocabulary();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v84 = 0;
    _os_log_impl(&dword_1A4419000, v30, OS_LOG_TYPE_DEBUG, "Starting Spotlight query", v84, 2u);
  }

  [v63 start];
  dispatch_time_t v31 = dispatch_time(0, 120000000000);
  if (dispatch_group_wait(v29, v31))
  {
    v32 = getLNLogCategoryVocabulary();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v84 = 0;
      _os_log_impl(&dword_1A4419000, v32, OS_LOG_TYPE_INFO, "Exceeded Spotlight timeout for fullset donation query. Bailing on this donation.", v84, 2u);
    }

    v33 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = 0;

    [v63 cancel];
    [v16 cancel];
    v34 = [MEMORY[0x1E4F28C58] errorWithDomain:@"LNCascadeBridgeErrorDomain" code:1004 userInfo:0];
    v65[2](v65, v34);
  }
  else
  {
    if (v74[5])
    {
      ((void (*)(void))v65[2])();
      goto LABEL_27;
    }
    v35 = getLNLogCategoryVocabulary();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v36 = [*(id *)(*(void *)&buf[8] + 40) count];
      *(_DWORD *)v84 = 134217984;
      *(void *)v85 = v36;
      _os_log_impl(&dword_1A4419000, v35, OS_LOG_TYPE_DEBUG, "Start pushing %ld items from the heap into Cascade", v84, 0xCu);
    }

    int v37 = 0;
    int v38 = 0;
    v39 = 0;
    v40 = 0;
    while (1)
    {
      v34 = [*(id *)(*(void *)&buf[8] + 40) popObject];

      if (!v34) {
        break;
      }
      v41 = (void *)MEMORY[0x1A625CB60]();
      v42 = +[LNSpotlightCascadeTranslator translateItem:v34];
      if (v42)
      {
        id v69 = v39;
        char v43 = [v66 registerItem:v42 error:&v69];
        id v44 = v69;

        if (v43)
        {
          int v45 = 0;
          ++v37;
        }
        else
        {
          v48 = getLNLogCategoryVocabulary();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v84 = 0;
            _os_log_impl(&dword_1A4419000, v48, OS_LOG_TYPE_ERROR, "Error registering an item with Cascade, aborting Cascade stream.", v84, 2u);
          }

          [v66 cancel];
          v65[2](v65, v44);
          int v45 = 1;
        }
        v39 = v44;
      }
      else
      {
        if (!v38)
        {
          v46 = getLNLogCategoryVocabulary();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v47 = [v34 uniqueIdentifier];
            *(_DWORD *)v84 = 138412546;
            *(void *)v85 = v47;
            *(_WORD *)&v85[8] = 2112;
            id v86 = v64;
            _os_log_impl(&dword_1A4419000, v46, OS_LOG_TYPE_ERROR, "Skipping item with unique id %@ from %@ due to translation failure. Subsequent translation errors are silenced for this request.", v84, 0x16u);
          }
        }
        ++v38;
        int v45 = 12;
      }

      v40 = v34;
      if (v45)
      {
        v40 = v34;
        if (v45 != 12) {
          goto LABEL_62;
        }
      }
    }
    v49 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = 0;

    if (v37 || !v38)
    {
      v51 = getLNLogCategoryVocabulary();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v84 = 67109376;
        *(_DWORD *)v85 = v37;
        *(_WORD *)&v85[4] = 1024;
        *(_DWORD *)&v85[6] = v38;
        _os_log_impl(&dword_1A4419000, v51, OS_LOG_TYPE_DEBUG, "Finishing Cascade stream with %d registered items and %d translation errors.", v84, 0xEu);
      }

      id v68 = v39;
      char v52 = [v66 finish:&v68];
      id v53 = v68;

      if (v52)
      {
        v54 = getLNLogCategoryVocabulary();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v84 = 0;
          _os_log_impl(&dword_1A4419000, v54, OS_LOG_TYPE_DEBUG, "Finished Cascade donation.", v84, 2u);
        }
        id v55 = 0;
      }
      else
      {
        v54 = getLNLogCategoryVocabulary();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v84 = 138412290;
          *(void *)v85 = v53;
          _os_log_impl(&dword_1A4419000, v54, OS_LOG_TYPE_ERROR, "Cannot finish Cascade donation. Error: %@", v84, 0xCu);
        }
        id v55 = v53;
      }

      v65[2](v65, v55);
      v34 = 0;
      v39 = v53;
    }
    else
    {
      v50 = getLNLogCategoryVocabulary();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v84 = 67109120;
        *(_DWORD *)v85 = v38;
        _os_log_impl(&dword_1A4419000, v50, OS_LOG_TYPE_INFO, "Nothing was registered with Cascade. Translation error count: %d", v84, 8u);
      }

      [v66 cancel];
      v65[2](v65, 0);
      v34 = 0;
    }
LABEL_62:
  }
LABEL_27:

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(buf, 8);
}

void __111__LNSpotlightCascadeHandler_handleFullSetStream_items_bundleId_quota_indexName_serialNumber_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = getLNLogCategoryVocabulary();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = [v3 count];
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_DEBUG, "Got %ld items from Spotlight in the foundItemsHandler.", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "insertObject:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void __111__LNSpotlightCascadeHandler_handleFullSetStream_items_bundleId_quota_indexName_serialNumber_completionHandler___block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v5 = [v4 code];
    uint64_t v6 = getLNLogCategoryVocabulary();
    uint64_t v7 = v6;
    if (v5 == -2003)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v12) = 0;
        uint64_t v8 = "Spotlight query was cancelled.";
LABEL_7:
        uint64_t v9 = v7;
        os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
        uint32_t v11 = 2;
LABEL_10:
        _os_log_impl(&dword_1A4419000, v9, v10, v8, (uint8_t *)&v12, v11);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v4;
      uint64_t v8 = "Spotlight query completed with error: %@";
      uint64_t v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 12;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v7 = getLNLogCategoryVocabulary();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      uint64_t v8 = "Spotlight query completed.";
      goto LABEL_7;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

BOOL __111__LNSpotlightCascadeHandler_handleFullSetStream_items_bundleId_quota_indexName_serialNumber_completionHandler___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 attributeSet];
  uint64_t v6 = [v5 attributeForKey:@"_kMDItemAppEntityPriority"];
  uint64_t v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  else {
    uint64_t v8 = &unk_1EF7F4190;
  }
  id v9 = v8;

  os_log_type_t v10 = [v4 attributeSet];

  uint64_t v11 = [v10 attributeForKey:@"_kMDItemAppEntityPriority"];
  int v12 = (void *)v11;
  if (v11) {
    id v13 = (void *)v11;
  }
  else {
    id v13 = &unk_1EF7F4190;
  }
  id v14 = v13;

  uint64_t v15 = [v9 compare:v14];
  return v15 == -1;
}

uint64_t __111__LNSpotlightCascadeHandler_handleFullSetStream_items_bundleId_quota_indexName_serialNumber_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 attributeSet];
  uint64_t v6 = [v5 attributeForKey:@"_kMDItemAppEntityPriority"];
  uint64_t v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  else {
    uint64_t v8 = &unk_1EF7F4190;
  }
  id v9 = v8;

  os_log_type_t v10 = [v4 attributeSet];

  uint64_t v11 = [v10 attributeForKey:@"_kMDItemAppEntityPriority"];
  int v12 = (void *)v11;
  if (v11) {
    id v13 = (void *)v11;
  }
  else {
    id v13 = &unk_1EF7F4190;
  }
  id v14 = v13;

  uint64_t v15 = [v9 compare:v14];
  return v15;
}

+ (id)_getSearchQuery:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2050000000;
  uint64_t v7 = (void *)getCSSearchQueryClass_softClass;
  uint64_t v15 = getCSSearchQueryClass_softClass;
  if (!getCSSearchQueryClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getCSSearchQueryClass_block_invoke;
    v11[3] = &unk_1E5B39E50;
    v11[4] = &v12;
    __getCSSearchQueryClass_block_invoke((uint64_t)v11);
    uint64_t v7 = (void *)v13[3];
  }
  uint64_t v8 = v7;
  _Block_object_dispose(&v12, 8);
  id v9 = (void *)[[v8 alloc] initWithQueryString:v5 context:v6];

  return v9;
}

+ (void)handleIncrementalStream:(id)a3 items:(id)a4 bundleId:(id)a5 existingItemCount:(unint64_t)a6 quota:(unint64_t)a7 completionHandler:(id)a8
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v41 = a5;
  uint64_t v16 = (void (**)(id, void))a8;
  char v43 = v14;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, a1, @"LNSpotlightCascadeHandler.m", 86, @"Invalid parameter not satisfying: %@", @"stream" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  int v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2, a1, @"LNSpotlightCascadeHandler.m", 87, @"Invalid parameter not satisfying: %@", @"items" object file lineNumber description];

LABEL_3:
  if (v41)
  {
    if (v16) {
      goto LABEL_5;
    }
  }
  else
  {
    int v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, a1, @"LNSpotlightCascadeHandler.m", 88, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

    if (v16) {
      goto LABEL_5;
    }
  }
  v39 = [MEMORY[0x1E4F28B00] currentHandler];
  [v39 handleFailureInMethod:a2, a1, @"LNSpotlightCascadeHandler.m", 89, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_5:
  uint64_t v17 = getLNLogCategoryVocabulary();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v52 = [v15 count];
    _os_log_impl(&dword_1A4419000, v17, OS_LOG_TYPE_DEBUG, "Making incremental donation for %ld items", buf, 0xCu);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v15;
  uint64_t v18 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    int v20 = 0;
    uint64_t v21 = 0;
    v22 = 0;
    uint64_t v23 = *(void *)v48;
    v40 = (void (**)(void, id))v16;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v48 != v23) {
          objc_enumerationMutation(obj);
        }
        if (v21 + a6 >= a7)
        {
          dispatch_time_t v31 = getLNLogCategoryVocabulary();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v52 = (uint64_t)v41;
            _os_log_impl(&dword_1A4419000, v31, OS_LOG_TYPE_INFO, "Exhausted allowed Cascade quota for %@.", buf, 0xCu);
          }

          uint64_t v16 = (void (**)(id, void))v40;
          goto LABEL_28;
        }
        uint64_t v25 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v26 = +[LNSpotlightCascadeTranslator translateItem:v25];
        if (v26)
        {
          id v46 = v22;
          char v27 = [v43 addOrUpdateItem:v26 error:&v46];
          id v28 = v46;

          if ((v27 & 1) == 0)
          {
            v35 = getLNLogCategoryVocabulary();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v52 = (uint64_t)v26;
              __int16 v53 = 2112;
              id v54 = v28;
              _os_log_impl(&dword_1A4419000, v35, OS_LOG_TYPE_ERROR, "Cannot add or update item: %@. Error: %@", buf, 0x16u);
            }

            [v43 cancel];
            uint64_t v16 = (void (**)(id, void))v40;
            v40[2](v40, v28);

            goto LABEL_38;
          }
          ++v21;
          v22 = v28;
        }
        else
        {
          if (!v20)
          {
            v29 = getLNLogCategoryVocabulary();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v30 = [v25 uniqueIdentifier];
              *(_DWORD *)buf = 138412546;
              uint64_t v52 = (uint64_t)v30;
              __int16 v53 = 2112;
              id v54 = v41;
              _os_log_impl(&dword_1A4419000, v29, OS_LOG_TYPE_ERROR, "Skipping item with unique id %@ from %@ due to translation failure.Subsequent translation errors are silenced for this request.", buf, 0x16u);
            }
          }
          ++v20;
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
      uint64_t v16 = (void (**)(id, void))v40;
      if (v19) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v20 = 0;
    uint64_t v21 = 0;
    v22 = 0;
  }
LABEL_28:

  id v45 = v22;
  char v32 = [v43 finish:&v45];
  id v28 = v45;

  v33 = getLNLogCategoryVocabulary();
  v34 = v33;
  if (v32)
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v52 = v21;
      __int16 v53 = 1024;
      LODWORD(v54) = v20;
      _os_log_impl(&dword_1A4419000, v34, OS_LOG_TYPE_DEBUG, "Completed incremental donation. Added/Updated %ld items. %d translation errors", buf, 0x12u);
    }

    v16[2](v16, 0);
  }
  else
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v52 = (uint64_t)v28;
      _os_log_impl(&dword_1A4419000, v34, OS_LOG_TYPE_ERROR, "Cannot finish Cascade donation. Error: %@", buf, 0xCu);
    }

    ((void (**)(id, id))v16)[2](v16, v28);
  }
LABEL_38:
}

+ (void)handleDeletionStream:(id)a3 items:(id)a4 bundleId:(id)a5 completionHandler:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(void, id))a6;
  id v44 = v11;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_38:
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, a1, @"LNSpotlightCascadeHandler.m", 41, @"Invalid parameter not satisfying: %@", @"items" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_39;
  }
  int v38 = [MEMORY[0x1E4F28B00] currentHandler];
  [v38 handleFailureInMethod:a2, a1, @"LNSpotlightCascadeHandler.m", 40, @"Invalid parameter not satisfying: %@", @"stream" object file lineNumber description];

  if (!v12) {
    goto LABEL_38;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_39:
  v40 = [MEMORY[0x1E4F28B00] currentHandler];
  [v40 handleFailureInMethod:a2, a1, @"LNSpotlightCascadeHandler.m", 42, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

LABEL_4:
  v42 = v14;
  id v43 = v13;
  if (!v14)
  {
    id v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, a1, @"LNSpotlightCascadeHandler.m", 43, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v48;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v15);
        }
        int v20 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v21 = [v20 attributeSet];
        v22 = [v21 attributeForKey:@"_kMDItemAppEntityInstanceIdentifier"];

        if (v22)
        {
          uint64_t v23 = [v20 attributeSet];
          id v24 = [v23 attributeForKey:@"_kMDItemAppEntityTypeIdentifier"];

          if (v24)
          {
            uint64_t v25 = +[LNSpotlightCascadeTranslator sourceItemIdentifierFromInstanceIdentifier:v22 typeIdentifier:v24];
            id v46 = 0;
            int v26 = [v44 removeItemWithSourceItemIdentifier:v25 error:&v46];
            id v27 = v46;
            if (v26) {
              BOOL v28 = v27 == 0;
            }
            else {
              BOOL v28 = 0;
            }
            if (!v28)
            {
              id v35 = v27;
              uint64_t v36 = getLNLogCategoryVocabulary();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v52 = (uint64_t)v35;
                _os_log_impl(&dword_1A4419000, v36, OS_LOG_TYPE_ERROR, "Could not delete item. Error: %@", buf, 0xCu);
              }

              v33 = v42;
              v42[2](v42, v35);

              char v32 = v43;
              goto LABEL_36;
            }
          }
          else
          {
            id v24 = getLNLogCategoryVocabulary();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A4419000, v24, OS_LOG_TYPE_ERROR, "Missing type id in deletion request, skipping", buf, 2u);
            }
          }
        }
        else
        {
          v22 = getLNLogCategoryVocabulary();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4419000, v22, OS_LOG_TYPE_ERROR, "Missing instance id in deletion request, skipping", buf, 2u);
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  id v45 = 0;
  char v29 = [v44 finish:&v45];
  id v35 = v45;
  v30 = getLNLogCategoryVocabulary();
  dispatch_time_t v31 = v30;
  if (v29)
  {
    v33 = v42;
    char v32 = v43;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = [v15 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v52 = v34;
      _os_log_impl(&dword_1A4419000, v31, OS_LOG_TYPE_INFO, "Deletion request for %ld items completed.", buf, 0xCu);
    }

    v42[2](v42, 0);
  }
  else
  {
    v33 = v42;
    char v32 = v43;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v52 = (uint64_t)v35;
      _os_log_impl(&dword_1A4419000, v31, OS_LOG_TYPE_ERROR, "Cannot finish Cascade donation. Error: %@", buf, 0xCu);
    }

    v42[2](v42, v35);
  }
LABEL_36:
}

@end