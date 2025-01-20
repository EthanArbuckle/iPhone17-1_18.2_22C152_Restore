@interface LNKoaClient
- (NSOrderedSet)currentVocabularySet;
- (NSString)bundleIdentifier;
- (OS_dispatch_queue)queue;
- (id)buildKVItemFrom:(id)a3;
- (id)buildKVItemListWithIncrementalIDs:(id)a3;
- (id)getKVItemBuilderFor:(id)a3 itemId:(id)a4;
- (id)initForBundleIdentifier:(id)a3;
- (void)completeSuccessfully:(id)a3;
- (void)completeWithError:(id)a3 completion:(id)a4;
- (void)donateFullVocabularySet:(id)a3 completionHandler:(id)a4;
- (void)setCurrentVocabularySet:(id)a3;
@end

@implementation LNKoaClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentVocabularySet, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)setCurrentVocabularySet:(id)a3
{
}

- (NSOrderedSet)currentVocabularySet
{
  return self->_currentVocabularySet;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)completeSuccessfully:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)completeWithError:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, id))a4 + 2))(a4, a3);
  }
}

- (id)buildKVItemFrom:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = 0;
    v3 = [a3 buildItemWithError:&v7];
    id v4 = v7;
    if (!v3)
    {
      v5 = getLNLogCategoryVocabulary();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v9 = v4;
        _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_ERROR, "Failed to build a KVItem. Error: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)getKVItemBuilderFor:(id)a3 itemId:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2050000000;
  id v7 = (void *)getKVItemBuilderClass_softClass;
  uint64_t v34 = getKVItemBuilderClass_softClass;
  if (!getKVItemBuilderClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v36 = __getKVItemBuilderClass_block_invoke;
    v37 = &unk_1E5B39E50;
    v38 = &v31;
    __getKVItemBuilderClass_block_invoke((uint64_t)&buf);
    id v7 = (void *)v32[3];
  }
  v8 = v7;
  _Block_object_dispose(&v31, 8);
  id v9 = objc_alloc_init(v8);
  uint64_t v10 = [v5 term];
  v11 = [v5 entityIdentifier];
  v12 = [v11 typeIdentifier];

  v13 = [v5 entityIdentifier];
  v14 = [v13 instanceIdentifier];

  id v30 = 0;
  v15 = [v9 setItemType:7 itemId:v6 error:&v30];
  id v16 = v30;

  if (!v15)
  {
    v22 = getLNLogCategoryVocabulary();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_1A4419000, v22, OS_LOG_TYPE_ERROR, "Failed to create a KVItemBuilder. Error: %@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_17;
  }
  id v29 = v16;
  v17 = [v9 addFieldWithType:275 value:v10 error:&v29];
  id v18 = v29;

  if (!v17)
  {
    v23 = getLNLogCategoryVocabulary();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_1A4419000, v23, OS_LOG_TYPE_ERROR, "Failed to add a app entity name field. Error: %@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_21;
  }
  id v28 = v18;
  v19 = [v9 addFieldWithType:276 value:v12 error:&v28];
  id v16 = v28;

  if (!v19)
  {
    v24 = getLNLogCategoryVocabulary();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_1A4419000, v24, OS_LOG_TYPE_ERROR, "Failed to add a app entity type class name field. Error: %@", (uint8_t *)&buf, 0xCu);
    }

LABEL_17:
    id v21 = 0;
    goto LABEL_23;
  }
  id v27 = v16;
  v20 = [v9 addFieldWithType:277 value:v14 error:&v27];
  id v18 = v27;

  if (!v20)
  {
    v25 = getLNLogCategoryVocabulary();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_1A4419000, v25, OS_LOG_TYPE_ERROR, "Failed to add a app entity id field. Error: %@", (uint8_t *)&buf, 0xCu);
    }

LABEL_21:
    id v21 = 0;
    goto LABEL_22;
  }
  id v21 = v9;
LABEL_22:
  id v16 = v18;
LABEL_23:

  return v21;
}

- (id)buildKVItemListWithIncrementalIDs:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v32 = objc_msgSend(NSString, "stringWithFormat:", @"%%0%du", 3);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v12 = [v11 entityIdentifier];
        v13 = [v5 objectForKey:v12];

        if (v13)
        {
          v14 = [v11 term];
          id v39 = 0;
          v15 = [v13 addFieldWithType:275 value:v14 error:&v39];
          id v16 = v39;

          if (!v15)
          {
            v17 = getLNLogCategoryVocabulary();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              id v46 = v16;
              _os_log_impl(&dword_1A4419000, v17, OS_LOG_TYPE_ERROR, "Failed to add a app entity name field. Error: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", v32, v8);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = [(LNKoaClient *)self getKVItemBuilderFor:v11 itemId:v16];
          if (v18)
          {
            v13 = (void *)v18;
            v19 = [v11 entityIdentifier];
            [v5 setObject:v13 forKey:v19];

            uint64_t v8 = (v8 + 1);
          }
          else
          {
            v20 = getLNLogCategoryVocabulary();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_1A4419000, v20, OS_LOG_TYPE_INFO, "Could not create KVItemBuilder for term, skipping", buf, 2u);
            }

            v13 = 0;
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v7);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v21 = obj;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = [*(id *)(*((void *)&v35 + 1) + 8 * j) entityIdentifier];
        id v27 = [v5 objectForKey:v26];
        if (v27)
        {
          id v28 = [(LNKoaClient *)self buildKVItemFrom:v27];
          if (v28)
          {
            [v33 addObject:v28];
            [v5 removeObjectForKey:v26];
          }
          else
          {
            id v29 = getLNLogCategoryVocabulary();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              id v46 = v26;
              _os_log_impl(&dword_1A4419000, v29, OS_LOG_TYPE_ERROR, "Failed to build a KVItem for %@, skipping", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v23);
  }

  id v30 = v33;
  return v30;
}

- (void)donateFullVocabularySet:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__LNKoaClient_donateFullVocabularySet_completionHandler___block_invoke;
  block[3] = &unk_1E5B3A318;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __57__LNKoaClient_donateFullVocabularySet_completionHandler___block_invoke(id *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([*((id *)a1[4] + 3) isEqualToOrderedSet:a1[5]])
  {
    v2 = getLNLogCategoryVocabulary();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A4419000, v2, OS_LOG_TYPE_INFO, "Vocabulary set did not change, exiting early from donation method.", (uint8_t *)&buf, 2u);
    }

    [a1[4] completeSuccessfully:a1[6]];
  }
  else
  {
    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x2050000000;
    v3 = (void *)getKVDonatorClass_softClass;
    uint64_t v31 = getKVDonatorClass_softClass;
    if (!getKVDonatorClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      id v33 = __getKVDonatorClass_block_invoke;
      uint64_t v34 = &unk_1E5B39E50;
      long long v35 = &v28;
      __getKVDonatorClass_block_invoke((uint64_t)&buf);
      v3 = (void *)v29[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v28, 8);
    if (!v4) {
      [a1[4] completeSuccessfully:a1[6]];
    }
    uint64_t v5 = [a1[5] copy];
    id v6 = a1[4];
    id v7 = (void *)v6[3];
    v6[3] = v5;

    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    id v9 = dispatch_group_create();
    id v10 = getLNLogCategoryVocabulary();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [a1[5] count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1A4419000, v10, OS_LOG_TYPE_INFO, "Making a full vocabulary donation to SiriVocabulary (%lu terms)", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v12 = *((void *)a1[4] + 1);
    id v27 = 0;
    id v13 = [v4 donatorWithItemType:7 originAppId:v12 error:&v27];
    id v14 = v27;
    if (v13)
    {
      dispatch_group_enter(v9);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __57__LNKoaClient_donateFullVocabularySet_completionHandler___block_invoke_15;
      v22[3] = &unk_1E5B392C8;
      v15 = v9;
      id v16 = a1[4];
      uint64_t v23 = v15;
      id v24 = v16;
      id v26 = a1[6];
      id v25 = a1[5];
      [v13 donateWithOptions:0 usingStream:v22];
      dispatch_time_t v17 = dispatch_time(0, 300000000000);
      if (dispatch_group_wait(v15, v17))
      {
        uint64_t v18 = getLNLogCategoryVocabulary();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = 0x4072C00000000000;
          _os_log_impl(&dword_1A4419000, v18, OS_LOG_TYPE_ERROR, "Timed out waiting for stream after %f seconds", (uint8_t *)&buf, 0xCu);
        }
      }
      v19 = getLNLogCategoryVocabulary();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        [v8 timeIntervalSinceNow];
        LODWORD(buf) = 134217984;
        *(double *)((char *)&buf + 4) = -v20;
        _os_log_impl(&dword_1A4419000, v19, OS_LOG_TYPE_DEBUG, "Koa donation took %f", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      id v21 = getLNLogCategoryVocabulary();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_1A4419000, v21, OS_LOG_TYPE_ERROR, "Cannot create a KVDonator. Error: %@", (uint8_t *)&buf, 0xCu);
      }

      [a1[4] completeWithError:v14 completion:a1[6]];
    }
  }
}

void __57__LNKoaClient_donateFullVocabularySet_completionHandler___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v25 = a3;
  id v22 = v4;
  if (v25)
  {
    uint64_t v5 = getLNLogCategoryVocabulary();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_ERROR, "Cannot initiate donation stream. Error: %@", (uint8_t *)&buf, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "completeWithError:completion:", v25, *(void *)(a1 + 56), v4);
  }
  else
  {
    uint64_t v35 = 0;
    uint64_t v36 = &v35;
    uint64_t v37 = 0x2050000000;
    id v6 = (void *)getKVFullDatasetStreamClass_softClass;
    uint64_t v38 = getKVFullDatasetStreamClass_softClass;
    if (!getKVFullDatasetStreamClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      long long v41 = __getKVFullDatasetStreamClass_block_invoke;
      long long v42 = &unk_1E5B39E50;
      long long v43 = &v35;
      __getKVFullDatasetStreamClass_block_invoke((uint64_t)&buf);
      id v6 = (void *)v36[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v35, 8);
    if (objc_opt_isKindOfClass())
    {
      id v8 = v4;
      id v9 = [*(id *)(a1 + 40) buildKVItemListWithIncrementalIDs:*(void *)(a1 + 48)];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v10 = 0;
      int v11 = 0;
      uint64_t v12 = [v9 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v32 != v13) {
              objc_enumerationMutation(v9);
            }
            uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            id v30 = v10;
            objc_msgSend(v8, "registerItem:error:", v15, &v30, v22);
            id v16 = v30;

            id v10 = v16;
            if (v16)
            {
              dispatch_time_t v17 = getLNLogCategoryVocabulary();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                LOWORD(buf) = 0;
                _os_log_impl(&dword_1A4419000, v17, OS_LOG_TYPE_INFO, "Could not register KVItem with stream, skipping", (uint8_t *)&buf, 2u);
              }

              ++v11;
            }
          }
          uint64_t v12 = [v9 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v12);
      }
      int v18 = objc_msgSend(v9, "count", v22);
      v19 = getLNLogCategoryVocabulary();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 67109376;
        DWORD1(buf) = v18 - v11;
        WORD4(buf) = 1024;
        *(_DWORD *)((char *)&buf + 10) = v11;
        _os_log_impl(&dword_1A4419000, v19, OS_LOG_TYPE_DEBUG, "Stream registered %d and rejected %d items", (uint8_t *)&buf, 0xEu);
      }

      if (v11 && v18 == v11)
      {
        double v20 = getLNLogCategoryVocabulary();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1A4419000, v20, OS_LOG_TYPE_INFO, "No items were registered with some items rejected, cancelling stream", (uint8_t *)&buf, 2u);
        }

        [v8 cancel];
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
        [*(id *)(a1 + 40) completeSuccessfully:*(void *)(a1 + 56)];
      }
      else
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __57__LNKoaClient_donateFullVocabularySet_completionHandler___block_invoke_16;
        v26[3] = &unk_1E5B392A0;
        v26[4] = *(void *)(a1 + 40);
        id v28 = *(id *)(a1 + 56);
        int v29 = v18 - v11;
        id v27 = *(id *)(a1 + 32);
        [v8 finish:v26];
      }
    }
    else
    {
      id v21 = getLNLogCategoryVocabulary();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A4419000, v21, OS_LOG_TYPE_ERROR, "Received unexpected donation stream type", (uint8_t *)&buf, 2u);
      }

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "completeWithError:completion:", 0, *(void *)(a1 + 56), v4);
    }
  }
}

void __57__LNKoaClient_donateFullVocabularySet_completionHandler___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = getLNLogCategoryVocabulary();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_ERROR, "Cannot finish stream. Error: %@", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) completeWithError:v3 completion:*(void *)(a1 + 48)];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = *(_DWORD *)(a1 + 56);
      int v7 = 67109120;
      LODWORD(v8) = v6;
      _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_INFO, "Successfully donated %d terms to SiriVocabulary", (uint8_t *)&v7, 8u);
    }

    [*(id *)(a1 + 32) completeSuccessfully:*(void *)(a1 + 48)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)initForBundleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"LNKoaClient.m", 36, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)LNKoaClient;
  int v6 = [(LNKoaClient *)&v17 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.link.vocabularyDonationQueue", v10);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    currentVocabularySet = v6->_currentVocabularySet;
    v6->_currentVocabularySet = 0;

    id v14 = v6;
  }

  return v6;
}

@end