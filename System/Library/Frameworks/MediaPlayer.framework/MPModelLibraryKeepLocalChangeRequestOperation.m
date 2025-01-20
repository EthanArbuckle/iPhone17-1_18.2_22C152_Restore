@interface MPModelLibraryKeepLocalChangeRequestOperation
- (MPModelLibraryKeepLocalChangeRequest)request;
- (id)responseHandler;
- (void)_handleKeepLocalUpdateStatus:(int64_t)a3 forLibraryIdentifier:(int64_t)a4 mediaType:(int64_t)a5 completedWithError:(id)a6;
- (void)_handlePersistentID:(int64_t)a3 modelClass:(Class)a4 keepLocal:(int64_t)a5 keepLocalConstraints:(unint64_t)a6 mediaLibrary:(id)a7;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibraryKeepLocalChangeRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_responseHandler, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)setRequest:(id)a3
{
}

- (MPModelLibraryKeepLocalChangeRequest)request
{
  return self->_request;
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)_handleKeepLocalUpdateStatus:(int64_t)a3 forLibraryIdentifier:(int64_t)a4 mediaType:(int64_t)a5 completedWithError:(id)a6
{
  id v10 = a6;
  v11 = +[MPMediaDownloadManager sharedManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __128__MPModelLibraryKeepLocalChangeRequestOperation__handleKeepLocalUpdateStatus_forLibraryIdentifier_mediaType_completedWithError___block_invoke;
  v13[3] = &unk_1E57FA148;
  id v14 = v10;
  v15 = self;
  id v12 = v10;
  [v11 sendKeepLocalStatusChanged:a3 forLibraryIdentifier:a4 entityType:a5 withCompletionHandler:v13];
}

void __128__MPModelLibraryKeepLocalChangeRequestOperation__handleKeepLocalUpdateStatus_forLibraryIdentifier_mediaType_completedWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v8 = v3;
  if (!v4) {
    v4 = v3;
  }
  id v5 = v4;
  v6 = *(void **)(a1 + 40);
  uint64_t v7 = v6[35];
  if (v7)
  {
    (*(void (**)(void, id))(v7 + 16))(v6[35], v5);
    v6 = *(void **)(a1 + 40);
  }
  [v6 finishWithError:v5];
}

- (void)_handlePersistentID:(int64_t)a3 modelClass:(Class)a4 keepLocal:(int64_t)a5 keepLocalConstraints:(unint64_t)a6 mediaLibrary:(id)a7
{
  id v12 = a7;
  if (([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || [(objc_class *)a4 isSubclassOfClass:objc_opt_class()])
  {
    v13 = [v12 itemWithPersistentID:a3 verifyExistence:0];
    if (v13)
    {
      id v14 = [NSNumber numberWithUnsignedInteger:a6];
      [(MPMediaQuery *)v13 setValue:v14 forProperty:@"keepLocalConstraints"];

      v15 = [NSNumber numberWithInteger:a5];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke;
      v43[3] = &unk_1E57F8DC8;
      v43[4] = self;
      v43[5] = a5;
      v43[6] = a3;
      [(MPMediaQuery *)v13 setValue:v15 forProperty:@"keepLocal" withCompletionBlock:v43];

LABEL_20:
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  if (([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || [(objc_class *)a4 isSubclassOfClass:objc_opt_class()])
  {
    v16 = [MPMediaQuery alloc];
    v17 = (void *)MEMORY[0x1E4F1CAD0];
    v18 = [NSNumber numberWithLongLong:a3];
    v19 = +[MPMediaPropertyPredicate predicateWithValue:v18 forProperty:@"albumPID"];
    v20 = [v17 setWithObject:v19];
    v13 = [(MPMediaQuery *)v16 initWithFilterPredicates:v20];

    [(MPMediaQuery *)v13 setMediaLibrary:v12];
    [(MPMediaQuery *)v13 setIgnoreRestrictionsPredicates:1];
    [(MPMediaQuery *)v13 setShouldIncludeNonLibraryEntities:1];
    [(MPMediaQuery *)v13 setGroupingType:1];
    [(MPMediaQuery *)v13 setEntityLimit:1];
    v21 = [(MPMediaQuery *)v13 collections];
    v22 = [v21 firstObject];

    if (v22)
    {
      id v23 = v22;
      v24 = [NSNumber numberWithUnsignedInteger:a6];
      [v23 setValue:v24 forProperty:@"keepLocalConstraints"];

      v25 = [NSNumber numberWithInteger:a5];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke_2;
      v39[3] = &unk_1E57F8E20;
      int64_t v41 = a5;
      int64_t v42 = a3;
      v39[4] = self;
      id v40 = v23;
      id v26 = v23;
      [v26 setValue:v25 forProperty:@"keepLocal" withCompletionBlock:v39];
    }
    else
    {
      responseHandler = (void (**)(id, void))self->_responseHandler;
      if (responseHandler) {
        responseHandler[2](responseHandler, 0);
      }
      [(MPAsyncOperation *)self finish];
    }

    goto LABEL_20;
  }
  if ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()])
  {
    v28 = [v12 playlistWithPersistentID:a3];
    v13 = v28;
    if (v28)
    {
      v29 = v28;
      v30 = [NSNumber numberWithUnsignedInteger:a6];
      [(MPMediaQuery *)v29 setValue:v30 forProperty:@"keepLocalConstraints"];

      v31 = [NSNumber numberWithInteger:a5];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke_26;
      v35[3] = &unk_1E57F8E20;
      int64_t v37 = a5;
      int64_t v38 = a3;
      v35[4] = self;
      v36 = v29;
      v32 = v29;
      [(MPMediaQuery *)v32 setValue:v31 forProperty:@"keepLocal" withCompletionBlock:v35];

      goto LABEL_20;
    }
LABEL_17:
    v33 = (void (**)(id, void))self->_responseHandler;
    if (v33) {
      v33[2](v33, 0);
    }
    [(MPAsyncOperation *)self finish];
    goto LABEL_20;
  }
  v34 = (void (**)(id, void))self->_responseHandler;
  if (v34) {
    v34[2](v34, 0);
  }
  [(MPAsyncOperation *)self finish];
LABEL_21:
}

uint64_t __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleKeepLocalUpdateStatus:*(void *)(a1 + 40) forLibraryIdentifier:*(void *)(a1 + 48) mediaType:0 completedWithError:a3];
}

void __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6 == 1)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28B48];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke_3;
    v29[3] = &unk_1E57F8DF8;
    v29[4] = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v31 = 1;
    uint64_t v32 = v8;
    id v30 = v4;
    v9 = [v7 blockOperationWithBlock:v29];
    id v10 = [*(id *)(a1 + 40) itemsQuery];
    v11 = (void *)[v10 copy];

    [v11 setIgnoreRestrictionsPredicates:1];
    [v11 setShouldIncludeNonLibraryEntities:0];
    [v11 setIgnoreSystemFilterPredicates:1];
    id v12 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ED478 forProperty:@"keepLocal" comparisonType:100];
    v34[0] = v12;
    v13 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ED490 forProperty:@"keepLocalConstraints" comparisonType:100];
    v34[1] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    v15 = +[MPMediaCompoundPredicate predicateMatchingPredicates:v14];

    [v11 addFilterPredicate:v15];
    v16 = [v11 items];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      id v23 = v11;
      v24 = v5;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          v22 = objc_alloc_init(_MPModelLibraryKeepLocalChangeRequestUpdateItemOperation);
          [(_MPModelLibraryKeepLocalChangeRequestUpdateItemOperation *)v22 setMediaItem:v21];
          [(_MPModelLibraryKeepLocalChangeRequestUpdateItemOperation *)v22 setKeepLocal:0];
          [(_MPModelLibraryKeepLocalChangeRequestUpdateItemOperation *)v22 setKeepLocalConstraints:0];
          [v9 addDependency:v22];
          [*(id *)(*(void *)(a1 + 32) + 272) addOperation:v22];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v18);
      v11 = v23;
      id v5 = v24;
    }
    [*(id *)(*(void *)(a1 + 32) + 272) addOperation:v9];
  }
  else
  {
    [*(id *)(a1 + 32) _handleKeepLocalUpdateStatus:v6 forLibraryIdentifier:*(void *)(a1 + 56) mediaType:4 completedWithError:v4];
  }
}

void __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke_26(uint64_t a1, uint64_t a2, void *a3)
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6 == 1)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28B48];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke_2_27;
    v29[3] = &unk_1E57F8DF8;
    v29[4] = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v31 = 1;
    uint64_t v32 = v8;
    id v30 = v4;
    v9 = [v7 blockOperationWithBlock:v29];
    id v10 = [*(id *)(a1 + 40) itemsQuery];
    v11 = (void *)[v10 copy];

    [v11 setIgnoreRestrictionsPredicates:1];
    [v11 setShouldIncludeNonLibraryEntities:1];
    [v11 setIgnoreSystemFilterPredicates:1];
    id v12 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ED478 forProperty:@"keepLocal" comparisonType:100];
    v34[0] = v12;
    v13 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ED490 forProperty:@"keepLocalConstraints" comparisonType:100];
    v34[1] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    v15 = +[MPMediaCompoundPredicate predicateMatchingPredicates:v14];

    [v11 addFilterPredicate:v15];
    v16 = [v11 items];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      id v23 = v11;
      v24 = v5;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          v22 = objc_alloc_init(_MPModelLibraryKeepLocalChangeRequestUpdateItemOperation);
          [(_MPModelLibraryKeepLocalChangeRequestUpdateItemOperation *)v22 setMediaItem:v21];
          [(_MPModelLibraryKeepLocalChangeRequestUpdateItemOperation *)v22 setKeepLocal:0];
          [(_MPModelLibraryKeepLocalChangeRequestUpdateItemOperation *)v22 setKeepLocalConstraints:0];
          [v9 addDependency:v22];
          [*(id *)(*(void *)(a1 + 32) + 272) addOperation:v22];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v18);
      v11 = v23;
      id v5 = v24;
    }
    [*(id *)(*(void *)(a1 + 32) + 272) addOperation:v9];
  }
  else
  {
    [*(id *)(a1 + 32) _handleKeepLocalUpdateStatus:v6 forLibraryIdentifier:*(void *)(a1 + 56) mediaType:1 completedWithError:v4];
  }
}

uint64_t __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke_2_27(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleKeepLocalUpdateStatus:*(void *)(a1 + 48) forLibraryIdentifier:*(void *)(a1 + 56) mediaType:1 completedWithError:*(void *)(a1 + 40)];
}

uint64_t __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleKeepLocalUpdateStatus:*(void *)(a1 + 48) forLibraryIdentifier:*(void *)(a1 + 56) mediaType:4 completedWithError:*(void *)(a1 + 40)];
}

- (void)execute
{
  v30[1] = *MEMORY[0x1E4F143B8];
  if (!self->_operationQueue)
  {
    id v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = self->_operationQueue;
    self->_operationQueue = v3;

    [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)self->_operationQueue setName:@"com.apple.MediaPlayer.MPModelLibraryKeepLocalChangeRequestOperation.operationQueue"];
    id v5 = self->_operationQueue;
    uint64_t v6 = [MEMORY[0x1E4F29060] currentThread];
    -[NSOperationQueue setQualityOfService:](v5, "setQualityOfService:", [v6 qualityOfService]);
  }
  uint64_t v7 = [(MPModelLibraryKeepLocalChangeRequest *)self->_request modelObject];
  unint64_t v8 = [(MPModelLibraryKeepLocalChangeRequest *)self->_request enableState] + 1;
  if (v8 > 4) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = qword_19568D008[v8];
  }
  unint64_t v10 = [(MPModelLibraryKeepLocalChangeRequest *)self->_request constraints];
  v11 = [(MPAsyncOperation *)self userIdentity];
  id v12 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v11];

  v13 = [v7 identifiers];
  id v14 = [v13 library];
  uint64_t v15 = [v14 persistentID];

  if (v15)
  {
    [(MPModelLibraryKeepLocalChangeRequestOperation *)self _handlePersistentID:v15 modelClass:objc_opt_class() keepLocal:v9 keepLocalConstraints:v10 mediaLibrary:v12];
  }
  else
  {
    v16 = [(MPAsyncOperation *)self userIdentity];
    uint64_t v17 = +[MPStoreLibraryPersonalizationRequest libraryViewWithUserIdentity:v16];

    uint64_t v18 = objc_alloc_init(MPStoreLibraryMappingRequestOperation);
    [(MPStoreLibraryMappingRequestOperation *)v18 setLibraryView:v17];
    [(MPStoreLibraryMappingRequestOperation *)v18 setModelClass:objc_opt_class()];
    v30[0] = v13;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    [(MPStoreLibraryMappingRequestOperation *)v18 setIdentifierSets:v19];

    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __56__MPModelLibraryKeepLocalChangeRequestOperation_execute__block_invoke;
    id v23 = &unk_1E57F8D90;
    id v24 = v13;
    long long v25 = self;
    id v26 = v7;
    uint64_t v28 = v9;
    unint64_t v29 = v10;
    id v27 = v12;
    [(MPStoreLibraryMappingRequestOperation *)v18 setResponseHandler:&v20];
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v18, v20, v21, v22, v23);
  }
}

void __56__MPModelLibraryKeepLocalChangeRequestOperation_execute__block_invoke(void *a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (!v13 || v5)
  {
    unint64_t v10 = (void *)a1[5];
    uint64_t v11 = v10[35];
    if (v11)
    {
      (*(void (**)(void, id))(v11 + 16))(v10[35], v5);
      unint64_t v10 = (void *)a1[5];
    }
    [v10 finish];
  }
  else
  {
    uint64_t v6 = [v13 libraryIdentifierSetForIdentifierSet:a1[4]];
    uint64_t v7 = [v6 library];
    uint64_t v8 = [v7 persistentID];

    uint64_t v9 = (void *)a1[5];
    if (v8)
    {
      [v9 _handlePersistentID:v8 modelClass:objc_opt_class() keepLocal:a1[8] keepLocalConstraints:a1[9] mediaLibrary:a1[7]];
    }
    else
    {
      uint64_t v12 = v9[35];
      if (v12)
      {
        (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
        uint64_t v9 = (void *)a1[5];
      }
      [v9 finish];
    }
  }
}

@end