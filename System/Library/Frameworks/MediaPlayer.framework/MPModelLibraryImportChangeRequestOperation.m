@interface MPModelLibraryImportChangeRequestOperation
- (MPModelLibraryImportChangeRequest)request;
- (id)responseHandler;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibraryImportChangeRequestOperation

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

- (MPModelLibraryImportChangeRequest)request
{
  return self->_request;
}

- (void)execute
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v24 = self;
  if (!self->_operationQueue)
  {
    v2 = self;
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:3];
    [(NSOperationQueue *)v2->_operationQueue setName:@"com.apple.MediaPlayer.MPModelLibraryImportChangeRequestOperation.operationQueue"];
    v5 = v2->_operationQueue;
    v6 = [MEMORY[0x1E4F29060] currentThread];
    -[NSOperationQueue setQualityOfService:](v5, "setQualityOfService:", [v6 qualityOfService]);

    self = v24;
  }
  v7 = [(MPAsyncOperation *)self userIdentity];
  v8 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v7];

  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__12782;
  v59[4] = __Block_byref_object_dispose__12783;
  id v60 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__12782;
  v57[4] = __Block_byref_object_dispose__12783;
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9 = [(MPModelLibraryImportChangeRequestOperation *)v24 responseHandler];
  v10 = (void *)MEMORY[0x1E4F28B48];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke;
  v53[3] = &unk_1E57F7860;
  v55 = v57;
  v56 = v59;
  id v17 = v9;
  v53[4] = v24;
  id v54 = v17;
  v23 = [v10 blockOperationWithBlock:v53];
  v18 = [(MPModelLibraryImportChangeRequest *)v24->_request referralObject];
  v19 = [(MPModelLibraryImportChangeRequest *)v24->_request modelObjects];
  BOOL v21 = [(MPModelLibraryImportChangeRequest *)v24->_request shouldLibraryAdd];
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__12782;
  v51 = __Block_byref_object_dispose__12783;
  id v52 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__12782;
  v45 = __Block_byref_object_dispose__12783;
  id v46 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_2;
  v40[3] = &unk_1E57EF9B0;
  v40[4] = &v41;
  v40[5] = &v47;
  [v19 enumerateItemIdentifiersUsingBlock:v40];
  dispatch_queue_t v22 = dispatch_queue_create("com.apple.MediaPlayer.MPModelLibraryImportChangeRequestOperation.accessQueue", 0);
  if ([(id)v48[5] count])
  {
    v11 = objc_alloc_init(MPModelLibraryStoreIDsImportChangeRequestOperation);
    [(MPModelLibraryStoreIDsImportChangeRequestOperation *)v11 setShouldLibraryAdd:v21];
    [(MPModelLibraryStoreIDsImportChangeRequestOperation *)v11 setMediaLibrary:v8];
    [(MPModelLibraryStoreIDsImportChangeRequestOperation *)v11 setStoreIDs:v48[5]];
    [(MPModelLibraryStoreIDsImportChangeRequestOperation *)v11 setReferralObject:v18];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_3;
    v34[3] = &unk_1E57EFA28;
    v38 = v59;
    v35 = v22;
    v36 = v24;
    id v37 = v8;
    v39 = v57;
    [(MPModelLibraryStoreIDsImportChangeRequestOperation *)v11 setResponseHandler:v34];
    [v23 addDependency:v11];
    [(NSOperationQueue *)v24->_operationQueue addOperation:v11];
  }
  if ([(id)v42[5] count])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = (id)v42[5];
    uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v61 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v16 = objc_alloc_init(MPModelLibraryGlobalPlaylistImportChangeRequestOperation);
          [(MPModelLibraryGlobalPlaylistImportChangeRequestOperation *)v16 setShouldLibraryAdd:v21];
          [(MPModelLibraryGlobalPlaylistImportChangeRequestOperation *)v16 setMediaLibrary:v8];
          [(MPModelLibraryGlobalPlaylistImportChangeRequestOperation *)v16 setGlobalPlaylistID:v15];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_10;
          v25[3] = &unk_1E57EFA78;
          v26 = v22;
          v28 = v59;
          id v27 = v8;
          v29 = v57;
          [(MPModelLibraryGlobalPlaylistImportChangeRequestOperation *)v16 setResponseHandler:v25];
          [v23 addDependency:v16];
          [(NSOperationQueue *)v24->_operationQueue addOperation:v16];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v61 count:16];
      }
      while (v12);
    }
  }
  [(NSOperationQueue *)v24->_operationQueue addOperation:v23];

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v59, 8);
}

uint64_t __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2)
  {
    if ([*(id *)(*(void *)(a1[6] + 8) + 40) count]) {
      uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
    }
    else {
      uint64_t v3 = 0;
    }
    (*(void (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, v3, *(void *)(*(void *)(a1[7] + 8) + 40));
  }
  v4 = (void *)a1[4];
  uint64_t v5 = *(void *)(*(void *)(a1[7] + 8) + 40);

  return [v4 finishWithError:v5];
}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v19 = a3;
  v4 = [v19 universalStore];
  uint64_t v5 = [v4 globalPlaylistID];

  if ([v5 length])
  {
    v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v6 addObject:v5];
  }
  else
  {
    v10 = [v19 universalStore];
    uint64_t v11 = [v10 subscriptionAdamID];
    if (v11)
    {
      uint64_t v12 = v11;
    }
    else
    {
      uint64_t v13 = [v19 universalStore];
      uint64_t v12 = [v13 adamID];

      if (!v12) {
        goto LABEL_11;
      }
    }
    v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v14)
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
      id v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    v18 = [NSNumber numberWithLongLong:v12];
    [v14 addObject:v18];
  }
LABEL_11:
}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_4;
  block[3] = &unk_1E57EFA00;
  uint64_t v8 = *(NSObject **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v14 = v6;
  uint64_t v15 = v7;
  id v16 = v5;
  long long v12 = *(_OWORD *)(a1 + 48);
  id v9 = (id)v12;
  long long v17 = v12;
  uint64_t v18 = *(void *)(a1 + 64);
  id v10 = v5;
  id v11 = v6;
  dispatch_sync(v8, block);
}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_11;
  block[3] = &unk_1E57EFA50;
  id v13 = v6;
  id v14 = v5;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  uint64_t v16 = *(void *)(a1 + 56);
  id v9 = v5;
  id v10 = v6;
  dispatch_sync(v7, block);
}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_11(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v5 = *(void *)(v3 + 40);
    v4 = (id *)(v3 + 40);
    if (!v5) {
      objc_storeStrong(v4, v2);
    }
  }
  if (*(void *)(a1 + 40))
  {
    id v6 = [MPModelPlaylist alloc];
    uint64_t v7 = [MPIdentifierSet alloc];
    id v8 = +[MPModelPlaylistKind identityKind];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_12;
    id v14 = &unk_1E57F95D0;
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 40);
    id v9 = [(MPIdentifierSet *)v7 initWithSource:@"LibraryImport" modelKind:v8 block:&v11];
    id v10 = -[MPModelObject initWithIdentifiers:block:](v6, "initWithIdentifiers:block:", v9, &__block_literal_global_29_12795, v11, v12, v13, v14);

    if (v10) {
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v10];
    }
  }
}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 uniqueIdentifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_13;
  v6[3] = &unk_1E57F96A0;
  id v7 = *(id *)(a1 + 40);
  [v4 setLibraryIdentifiersWithDatabaseID:v5 block:v6];
}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v2, "persistentID"));
}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_4(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v5 = *(void *)(v3 + 40);
    id v4 = (id *)(v3 + 40);
    if (!v5) {
      objc_storeStrong(v4, v2);
    }
  }
  id v6 = [*(id *)(a1 + 40) userIdentity];
  dispatch_queue_t v22 = [v6 accountDSID];

  id v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeItemAdamID", @"subscriptionStoreItemAdamID", @"storeCloudAlbumID", @"storeSagaID", @"persistentID", @"mediaType", 0);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = *(id *)(a1 + 48);
  uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = [*(id *)(*((void *)&v27 + 1) + 8 * v11) valuesForProperties:v7];
        id v13 = [v12 objectForKey:@"mediaType"];
        [v13 integerValue];

        id v14 = (objc_class *)objc_opt_class();
        id v15 = [v14 alloc];
        id v16 = [MPIdentifierSet alloc];
        long long v17 = +[MPModelKind kindWithModelClass:v14];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_5;
        v23[3] = &unk_1E57EF9D8;
        id v24 = *(id *)(a1 + 56);
        id v18 = v12;
        id v25 = v18;
        id v26 = v22;
        id v19 = [(MPIdentifierSet *)v16 initWithSource:@"LibraryImport" modelKind:v17 block:v23];
        v20 = (void *)[v15 initWithIdentifiers:v19 block:&__block_literal_global_12806];

        if (v20) {
          [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v20];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }
}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_5(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] uniqueIdentifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_6;
  v10[3] = &unk_1E57F96A0;
  id v11 = a1[5];
  [v3 setLibraryIdentifiersWithDatabaseID:v4 block:v10];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_7;
  v8[3] = &unk_1E57FA390;
  id v9 = a1[5];
  [v3 setUniversalStoreIdentifiersWithBlock:v8];
  if ([a1[6] length])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_8;
    v6[3] = &unk_1E57F96C8;
    id v5 = a1[6];
    id v7 = a1[5];
    [v3 setPersonalStoreIdentifiersWithPersonID:v5 block:v6];
  }
}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 objectForKey:@"persistentID"];
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v4, "longLongValue"));
}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKey:@"storeItemAdamID"];
  objc_msgSend(v4, "setAdamID:", objc_msgSend(v5, "longLongValue"));

  id v6 = [*(id *)(a1 + 32) objectForKey:@"subscriptionStoreItemAdamID"];
  objc_msgSend(v4, "setSubscriptionAdamID:", objc_msgSend(v6, "longLongValue"));
}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_8(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) objectForKey:@"storeCloudAlbumID"];
  if ([v3 length]) {
    [v5 setCloudAlbumID:v3];
  }
  id v4 = [*(id *)(a1 + 32) objectForKey:@"storeSagaID"];
  objc_msgSend(v5, "setCloudID:", objc_msgSend(v4, "unsignedLongLongValue"));
}

@end