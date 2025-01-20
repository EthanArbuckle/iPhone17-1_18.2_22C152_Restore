@interface MPModelLibraryDeleteEntityChangeRequestOperation
- (BOOL)_isCloudLibraryEnabled;
- (MPModelLibraryDeleteEntityChangeRequest)request;
- (id)responseHandler;
- (void)_deleteItems:(id)a3 withLibrary:(id)a4;
- (void)_handlePersistentID:(int64_t)a3 modelClass:(Class)a4 mediaLibrary:(id)a5;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibraryDeleteEntityChangeRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setRequest:(id)a3
{
}

- (MPModelLibraryDeleteEntityChangeRequest)request
{
  return self->_request;
}

- (BOOL)_isCloudLibraryEnabled
{
  v2 = [(MPAsyncOperation *)self userIdentity];
  v3 = +[MPCloudController controllerWithUserIdentity:v2];
  char v4 = [v3 isCloudLibraryEnabled];

  return v4;
}

- (void)_deleteItems:(id)a3 withLibrary:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = [(MPAsyncOperation *)self userIdentity];
    v9 = +[MPCloudController controllerWithUserIdentity:v8];

    v10 = [(MPAsyncOperation *)self userIdentity];
    v11 = +[MPCloudServiceStatusController cloudServiceStatusControllerWithUserIdentity:v10];

    if ([(MPModelLibraryDeleteEntityChangeRequestOperation *)self _isCloudLibraryEnabled])
    {
      v29 = v11;
      v30 = v9;
      v32 = self;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v12 = v6;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        v15 = 0;
        uint64_t v16 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v39 != v16) {
              objc_enumerationMutation(v12);
            }
            v18 = [*(id *)(*((void *)&v38 + 1) + 8 * i) valueForProperty:@"storeSagaID"];
            if ([v18 unsignedLongLongValue])
            {
              if (!v15) {
                v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
              }
              [v15 addObject:v18];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v14);
      }
      else
      {
        v15 = 0;
      }

      if ([v15 count])
      {
        v9 = v30;
        [v30 removeItemsWithSagaIDs:v15 completionHandler:0];
        self = v32;
LABEL_37:

        v11 = v29;
        goto LABEL_38;
      }
      self = v32;
    }
    else
    {
      if (![v11 isPurchaseHistoryEnabled])
      {
LABEL_38:
        [v7 deleteItems:v6];

        goto LABEL_39;
      }
      v29 = v11;
      v30 = v9;
      id v31 = v7;
      v33 = self;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v28 = v6;
      id v19 = v6;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        v15 = 0;
        uint64_t v22 = *(void *)v35;
        uint64_t v23 = MEMORY[0x1E4F1CC38];
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v35 != v22) {
              objc_enumerationMutation(v19);
            }
            v25 = *(void **)(*((void *)&v34 + 1) + 8 * j);
            v26 = [v25 valueForProperty:@"purchaseHistoryID"];
            if ([v26 unsignedLongLongValue])
            {
              if (!v15) {
                v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
              }
              [v15 addObject:v26];
              [v25 setValue:v23 forProperty:@"isHidden"];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v21);
      }
      else
      {
        v15 = 0;
      }

      if ([v15 count])
      {
        v9 = v30;
        [v30 hideItemsWithPurchaseHistoryIDs:v15 completionHandler:0];
        id v6 = v28;
        id v7 = v31;
        self = v33;
        goto LABEL_37;
      }
      id v6 = v28;
      id v7 = v31;
      self = v33;
    }
    v9 = v30;
    goto LABEL_37;
  }
LABEL_39:
  responseHandler = (void (**)(id, void))self->_responseHandler;
  if (responseHandler) {
    responseHandler[2](responseHandler, 0);
  }
  [(MPAsyncOperation *)self finish];
}

- (void)_handlePersistentID:(int64_t)a3 modelClass:(Class)a4 mediaLibrary:(id)a5
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || [(objc_class *)a4 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v9 = [v8 itemWithPersistentID:a3 verifyExistence:0];
    v10 = (void *)v9;
    if (v9)
    {
      v56[0] = v9;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
      [(MPModelLibraryDeleteEntityChangeRequestOperation *)self _deleteItems:v11 withLibrary:v8];
    }
    else
    {
      [(MPModelLibraryDeleteEntityChangeRequestOperation *)self _deleteItems:0 withLibrary:v8];
    }
LABEL_7:

    goto LABEL_8;
  }
  if ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()])
  {
    id v12 = objc_alloc_init(MPModelLibraryRequest);
    [(MPModelLibraryRequest *)v12 setMediaLibrary:v8];
    id v13 = [a4 alloc];
    uint64_t v14 = [MPIdentifierSet alloc];
    v15 = +[MPModelAlbumKind identityKind];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke;
    v50[3] = &unk_1E57F7AD0;
    id v16 = v8;
    id v51 = v16;
    int64_t v52 = a3;
    v17 = [(MPIdentifierSet *)v14 initWithSource:@"LibraryEdit" modelKind:v15 block:v50];
    v18 = (void *)[v13 initWithIdentifiers:v17 block:&__block_literal_global_1051];

    id v19 = +[MPModelSong kindWithVariants:3];
    [(MPModelRequest *)v12 setItemKind:v19];

    v55 = v18;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
    [(MPModelLibraryRequest *)v12 setScopedContainers:v20];

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_4;
    v47[3] = &unk_1E57F9770;
    id v48 = v16;
    v49 = self;
    id v21 = [(MPModelLibraryRequest *)v12 newOperationWithResponseHandler:v47];
    [(NSOperationQueue *)self->_operationQueue addOperation:v21];

    uint64_t v22 = v51;
LABEL_13:

    goto LABEL_8;
  }
  if ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()])
  {
    id v12 = objc_alloc_init(MPModelLibraryRequest);
    [(MPModelLibraryRequest *)v12 setMediaLibrary:v8];
    id v23 = [a4 alloc];
    v24 = [MPIdentifierSet alloc];
    v25 = +[MPModelTVSeasonKind identityKind];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_6;
    v44[3] = &unk_1E57F7AD0;
    id v26 = v8;
    id v45 = v26;
    int64_t v46 = a3;
    v27 = [(MPIdentifierSet *)v24 initWithSource:@"LibraryEdit" modelKind:v25 block:v44];
    id v28 = (void *)[v23 initWithIdentifiers:v27 block:&__block_literal_global_29];

    v29 = +[MPModelTVEpisode kindWithVariants:3];
    [(MPModelRequest *)v12 setItemKind:v29];

    v54 = v28;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
    [(MPModelLibraryRequest *)v12 setScopedContainers:v30];

    uint64_t v38 = MEMORY[0x1E4F143A8];
    uint64_t v39 = 3221225472;
    long long v40 = __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_9;
    long long v41 = &unk_1E57F9770;
    id v42 = v26;
    v43 = self;
    id v31 = [(MPModelLibraryRequest *)v12 newOperationWithResponseHandler:&v38];
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v31, v38, v39, v40, v41);

    uint64_t v22 = v45;
    goto LABEL_13;
  }
  if ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()])
  {
    v10 = [v8 playlistWithPersistentID:a3];
    if (v10)
    {
      if ([(MPModelLibraryDeleteEntityChangeRequestOperation *)self _isCloudLibraryEnabled])
      {
        v32 = [v10 valueForProperty:@"storeCloudID"];
        if ([v32 unsignedLongLongValue])
        {
          v33 = [(MPAsyncOperation *)self userIdentity];
          long long v34 = +[MPCloudController controllerWithUserIdentity:v33];
          v53 = v32;
          long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
          [v34 removePlaylistsWithSagaIDs:v35 completionHandler:0];
        }
      }
      [v8 removePlaylist:v10];
    }
    responseHandler = (void (**)(id, void))self->_responseHandler;
    if (responseHandler) {
      responseHandler[2](responseHandler, 0);
    }
    [(MPAsyncOperation *)self finish];
    goto LABEL_7;
  }
  long long v37 = (void (**)(id, void))self->_responseHandler;
  if (v37) {
    v37[2](v37, 0);
  }
  [(MPAsyncOperation *)self finish];
LABEL_8:
}

void __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 uniqueIdentifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_2;
  v6[3] = &__block_descriptor_40_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v6[4] = *(void *)(a1 + 40);
  [v4 setLibraryIdentifiersWithDatabaseID:v5 block:v6];
}

void __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 results];

  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_5;
  v11 = &unk_1E57EDE10;
  id v12 = *(id *)(a1 + 32);
  id v13 = v5;
  id v7 = v5;
  [v6 enumerateItemIdentifiersUsingBlock:&v8];

  objc_msgSend(*(id *)(a1 + 40), "_deleteItems:withLibrary:", v7, *(void *)(a1 + 32), v8, v9, v10, v11);
}

void __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_6(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 uniqueIdentifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_7;
  v6[3] = &__block_descriptor_40_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v6[4] = *(void *)(a1 + 40);
  [v4 setLibraryIdentifiersWithDatabaseID:v5 block:v6];
}

void __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_9(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 results];

  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_10;
  v11 = &unk_1E57EDE10;
  id v12 = *(id *)(a1 + 32);
  id v13 = v5;
  id v7 = v5;
  [v6 enumerateItemIdentifiersUsingBlock:&v8];

  objc_msgSend(*(id *)(a1 + 40), "_deleteItems:withLibrary:", v7, *(void *)(a1 + 32), v8, v9, v10, v11);
}

void __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 library];
  uint64_t v5 = [v4 persistentID];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) itemWithPersistentID:v5 verifyExistence:0];
    if (v6)
    {
      id v7 = v6;
      [*(id *)(a1 + 40) addObject:v6];
      id v6 = v7;
    }
  }
}

uint64_t __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 setPersistentID:*(void *)(a1 + 32)];
}

void __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 library];
  uint64_t v5 = [v4 persistentID];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) itemWithPersistentID:v5 verifyExistence:0];
    if (v6)
    {
      id v7 = v6;
      [*(id *)(a1 + 40) addObject:v6];
      id v6 = v7;
    }
  }
}

uint64_t __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setPersistentID:*(void *)(a1 + 32)];
}

- (void)execute
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if (!self->_operationQueue)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = self->_operationQueue;
    self->_operationQueue = v3;

    [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)self->_operationQueue setName:@"com.apple.MediaPlayer.MPModelLibraryKeepLocalChangeRequestOperation.operationQueue"];
    uint64_t v5 = self->_operationQueue;
    id v6 = [MEMORY[0x1E4F29060] currentThread];
    -[NSOperationQueue setQualityOfService:](v5, "setQualityOfService:", [v6 qualityOfService]);
  }
  id v7 = [(MPModelLibraryDeleteEntityChangeRequest *)self->_request modelObject];
  uint64_t v8 = [(MPAsyncOperation *)self userIdentity];
  uint64_t v9 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v8];

  v10 = [v7 identifiers];
  v11 = [v10 library];
  uint64_t v12 = [v11 persistentID];

  uint64_t v13 = objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v7 anyObject];
    uint64_t v13 = objc_opt_class();
  }
  if (v12)
  {
    [(MPModelLibraryDeleteEntityChangeRequestOperation *)self _handlePersistentID:v12 modelClass:v13 mediaLibrary:v9];
  }
  else
  {
    v15 = [(MPAsyncOperation *)self userIdentity];
    id v16 = +[MPStoreLibraryPersonalizationRequest libraryViewWithUserIdentity:v15];

    v17 = objc_alloc_init(MPStoreLibraryMappingRequestOperation);
    [(MPStoreLibraryMappingRequestOperation *)v17 setLibraryView:v16];
    [(MPStoreLibraryMappingRequestOperation *)v17 setModelClass:objc_opt_class()];
    v27[0] = v10;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [(MPStoreLibraryMappingRequestOperation *)v17 setIdentifierSets:v18];

    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    id v21 = __59__MPModelLibraryDeleteEntityChangeRequestOperation_execute__block_invoke;
    uint64_t v22 = &unk_1E57EDDE8;
    id v23 = v10;
    v24 = self;
    uint64_t v26 = v13;
    id v25 = v9;
    [(MPStoreLibraryMappingRequestOperation *)v17 setResponseHandler:&v19];
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v17, v19, v20, v21, v22);
  }
}

void __59__MPModelLibraryDeleteEntityChangeRequestOperation_execute__block_invoke(void *a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (!v13 || v5)
  {
    v10 = (void *)a1[5];
    uint64_t v11 = v10[36];
    if (v11)
    {
      (*(void (**)(void, id))(v11 + 16))(v10[36], v5);
      v10 = (void *)a1[5];
    }
    [v10 finishWithError:v5];
  }
  else
  {
    id v6 = [v13 libraryIdentifierSetForIdentifierSet:a1[4]];
    id v7 = [v6 library];
    uint64_t v8 = [v7 persistentID];

    uint64_t v9 = (void *)a1[5];
    if (v8)
    {
      [v9 _handlePersistentID:v8 modelClass:a1[7] mediaLibrary:a1[6]];
    }
    else
    {
      uint64_t v12 = v9[36];
      if (v12)
      {
        (*(void (**)(void, void))(v12 + 16))(v9[36], 0);
        uint64_t v9 = (void *)a1[5];
      }
      [v9 finish];
    }
  }
}

@end