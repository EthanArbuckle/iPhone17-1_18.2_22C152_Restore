@interface MPCModelStorePlaybackItemsRequestOperation
- (MPCModelStorePlaybackItemsRequest)request;
- (MPCModelStorePlaybackItemsRequestOperation)initWithRequest:(id)a3 responseHandler:(id)a4;
- (id)_localStoreAdamIDToEquivalencySourceStoreAdamIDMap:(id)a3;
- (id)responseHandler;
- (void)_handleItemMetadataBatchRequestCompletedWithAccumulator:(id)a3 previousResponse:(id)a4 error:(id)a5 isFinalResponse:(BOOL)a6;
- (void)_runPersonalizationWithSectionCollection:(id)a3 localEquivalencyMapping:(id)a4 expirationDate:(id)a5 error:(id)a6 isFinalResponse:(BOOL)a7 isInvalidForPersonalization:(BOOL)a8 performanceMetrics:(id)a9;
- (void)_runStorePlatformRequestToLoadMetadataWithAccumulator:(id)a3 previousResponse:(id)a4;
- (void)cancel;
- (void)execute;
@end

@implementation MPCModelStorePlaybackItemsRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_previousModelResponse, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_activeProgress, 0);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (MPCModelStorePlaybackItemsRequest)request
{
  return self->_request;
}

- (void)_handleItemMetadataBatchRequestCompletedWithAccumulator:(id)a3 previousResponse:(id)a4 error:(id)a5 isFinalResponse:(BOOL)a6
{
  uint64_t v6 = a6;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v31 = self;
    __int16 v32 = 1024;
    *(_DWORD *)v33 = v6;
    *(_WORD *)&v33[4] = 2048;
    *(void *)&v33[6] = v11;
    *(_WORD *)&v33[14] = 2114;
    *(void *)&v33[16] = v12;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "SPIR: %p: _handleItemMetadataBatchRequestCompletedWithAccumulator [] isFinalResponse=%{BOOL}u previousResponse=%p error=%{public}@", buf, 0x26u);
  }

  v14 = [v10 equivalencyMapping];
  v15 = [(MPCModelStorePlaybackItemsRequestOperation *)self _localStoreAdamIDToEquivalencySourceStoreAdamIDMap:v14];

  v16 = [v10 accumulationError];
  if (!v11 || !v6) {
    goto LABEL_11;
  }
  unsigned int v29 = v6;
  v17 = [v11 _personalizationResponse];
  v18 = [v17 request];
  v19 = [v18 unpersonalizedContentDescriptors];

  uint64_t v20 = [0 totalItemCount];
  uint64_t v21 = [v19 totalItemCount];
  if (v20 >= v21)
  {

    uint64_t v6 = v29;
LABEL_11:
    v19 = [v10 unpersonalizedContentDescriptors];
    goto LABEL_12;
  }
  uint64_t v22 = v21;
  v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    errors = self->_errors;
    *(_DWORD *)buf = 134218754;
    v31 = self;
    __int16 v32 = 2114;
    *(void *)v33 = errors;
    *(_WORD *)&v33[8] = 2048;
    *(void *)&v33[10] = v20;
    *(_WORD *)&v33[18] = 2048;
    *(void *)&v33[20] = v22;
    _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_ERROR, "MPCModelStorePlaybackItemsRequestOperation %p - Falling back to existing previous response from errors: %{public}@, current item count: %li, previous item count: %li", buf, 0x2Au);
  }

  uint64_t v25 = [v11 localStoreAdamIDToEquivalencySourceStoreAdamIDMap];

  v15 = (void *)v25;
  uint64_t v6 = v29;
  if (!v19) {
    goto LABEL_11;
  }
LABEL_12:
  if (v16) {
    v26 = v16;
  }
  else {
    v26 = v12;
  }
  id v27 = v26;
  v28 = [v10 performanceMetrics];
  [(MPCModelStorePlaybackItemsRequestOperation *)self _runPersonalizationWithSectionCollection:v19 localEquivalencyMapping:v15 expirationDate:0 error:v27 isFinalResponse:v6 isInvalidForPersonalization:0 performanceMetrics:v28];
}

- (id)_localStoreAdamIDToEquivalencySourceStoreAdamIDMap:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __97__MPCModelStorePlaybackItemsRequestOperation__localStoreAdamIDToEquivalencySourceStoreAdamIDMap___block_invoke;
  v8[3] = &unk_2643C41D0;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __97__MPCModelStorePlaybackItemsRequestOperation__localStoreAdamIDToEquivalencySourceStoreAdamIDMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a2;
  objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(a3, "longLongValue"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSNumber;
  uint64_t v8 = [v6 longLongValue];

  id v9 = [v7 numberWithLongLong:v8];
  [v4 setObject:v10 forKey:v9];
}

- (void)_runPersonalizationWithSectionCollection:(id)a3 localEquivalencyMapping:(id)a4 expirationDate:(id)a5 error:(id)a6 isFinalResponse:(BOOL)a7 isInvalidForPersonalization:(BOOL)a8 performanceMetrics:(id)a9
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v38 = a4;
  id v39 = a5;
  id v16 = a6;
  id v40 = a9;
  if (!a8)
  {
    BOOL hasCalledResponseHandler = self->_hasCalledResponseHandler;
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (hasCalledResponseHandler)
    {
      if (v19)
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "SPIR: %p: _runPersonalizationWithSectionCollection invalidating previousModelResponse [_hasCalledResponseHandler]", (uint8_t *)&buf, 0xCu);
      }

      [(MPCModelStorePlaybackItemsResponse *)self->_previousModelResponse _invalidate];
      goto LABEL_19;
    }
    if (v19)
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "SPIR: %p: _runPersonalizationWithSectionCollection setting BOOL hasCalledResponseHandler = YES", (uint8_t *)&buf, 0xCu);
    }

    self->_BOOL hasCalledResponseHandler = 1;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__23808;
  v77 = __Block_byref_object_dispose__23809;
  id v78 = [(MPCModelStorePlaybackItemsRequestOperation *)self responseHandler];
  if (v16)
  {
    uint64_t v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v70 = 134218242;
      *(void *)&v70[4] = self;
      *(_WORD *)&v70[12] = 2114;
      *(void *)&v70[14] = v16;
      _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "SPIR: %p: _runPersonalizationWithSectionCollection finishing with error [non-nil error passed in] error=%{public}@", v70, 0x16u);
    }

    uint64_t v21 = *(void *)(*((void *)&buf + 1) + 40);
    if (v21) {
      (*(void (**)(uint64_t, void, id))(v21 + 16))(v21, 0, v16);
    }
    [(MPAsyncOperation *)self finishWithError:v16];
  }
  else
  {
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x2810000000;
    v60[3] = &unk_21BF4D291;
    int v61 = 0;
    uint64_t v22 = [(MPCModelStorePlaybackItemsRequestOperation *)self request];
    v23 = [MEMORY[0x263F121E8] sharedRestrictionsMonitor];
    char v24 = [v23 allowsExplicitContent];

    uint64_t v25 = (void *)[objc_alloc(MEMORY[0x263F122B0]) initWithUnpersonalizedRequest:v22 unpersonalizedContentDescriptors:v15];
    v26 = [(MPCPlaybackAccount *)self->_account userIdentity];
    [v25 setUserIdentity:v26];

    [v25 setMatchAlbumArtistsOnNameAndStoreID:0];
    id v27 = objc_alloc(MEMORY[0x263F54ED0]);
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __195__MPCModelStorePlaybackItemsRequestOperation__runPersonalizationWithSectionCollection_localEquivalencyMapping_expirationDate_error_isFinalResponse_isInvalidForPersonalization_performanceMetrics___block_invoke;
    v55[3] = &unk_2643C3D88;
    v55[4] = self;
    v58 = v60;
    p_long long buf = &buf;
    id v28 = v25;
    id v56 = v28;
    id v57 = v15;
    unsigned int v29 = (void *)[v27 initWithTimeout:v55 interruptionHandler:60.0];
    *(void *)v70 = 0;
    *(void *)&v70[8] = v70;
    *(void *)&v70[16] = 0x3042000000;
    v71 = __Block_byref_object_copy__86;
    v72 = __Block_byref_object_dispose__87;
    id v73 = 0;
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __195__MPCModelStorePlaybackItemsRequestOperation__runPersonalizationWithSectionCollection_localEquivalencyMapping_expirationDate_error_isFinalResponse_isInvalidForPersonalization_performanceMetrics___block_invoke_88;
    v41[3] = &unk_2643C3DB0;
    v49 = v70;
    id v37 = v29;
    id v42 = v37;
    v43 = self;
    id v36 = v22;
    id v44 = v36;
    id v45 = v40;
    BOOL v52 = a7;
    id v46 = v38;
    BOOL v53 = a8;
    char v54 = v24;
    id v47 = v39;
    id v48 = 0;
    v50 = &buf;
    v51 = v60;
    v30 = (void *)[v28 newOperationWithResponseHandler:v41];
    objc_storeWeak((id *)(*(void *)&v70[8] + 40), v30);
    v31 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = v28;
      NSUInteger v33 = [(NSOperationQueue *)self->_operationQueue operationCount];
      uint64_t v34 = [(NSOperationQueue *)self->_operationQueue operations];
      v35 = objc_msgSend(v34, "msv_compactDescription");
      *(_DWORD *)v62 = 134218754;
      v63 = self;
      __int16 v64 = 2114;
      v65 = v30;
      __int16 v66 = 2048;
      NSUInteger v67 = v33;
      __int16 v68 = 2114;
      v69 = v35;
      _os_log_impl(&dword_21BB87000, v31, OS_LOG_TYPE_DEFAULT, "SPIR: %p: _runPersonalizationWithSectionCollection enqueuing personalization operation [] personalizationOperation=%{public}@ self.operationQueue.operations=(:%ld)[%{public}@]", v62, 0x2Au);

      id v28 = v32;
    }

    [(NSOperationQueue *)self->_operationQueue addOperation:v30];
    _Block_object_dispose(v70, 8);
    objc_destroyWeak(&v73);

    _Block_object_dispose(v60, 8);
  }
  _Block_object_dispose(&buf, 8);

LABEL_19:
}

void __195__MPCModelStorePlaybackItemsRequestOperation__runPersonalizationWithSectionCollection_localEquivalencyMapping_expirationDate_error_isFinalResponse_isInvalidForPersonalization_performanceMetrics___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_FAULT);
  if (a2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 134217984;
      uint64_t v49 = v6;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_FAULT, "SPIR: %p: _runPersonalizationWithSectionCollection failed [personalization request dealloc'd responseHandler]", buf, 0xCu);
    }
    v7 = @"personalization request dealloc'd responseHandler";
    uint64_t v8 = @"BlockGuard-Dealloc";
  }
  else
  {
    if (v5)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 134217984;
      uint64_t v49 = v9;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_FAULT, "SPIR: %p: _runPersonalizationWithSectionCollection failed [personalization request timed out]", buf, 0xCu);
    }
    v7 = @"personalization request timed out";
    uint64_t v8 = @"BlockGuard-Timeout";
  }
  id v38 = v8;

  uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 70, @"Block guard interrupted [%@]", v7);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v11)
  {
    (*(void (**)(uint64_t, void, uint64_t))(v11 + 16))(v11, 0, v10);
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  id v39 = (void *)v10;
  [*(id *)(a1 + 32) finishWithError:v10];
  v14 = [MEMORY[0x263EFF9A0] dictionary];
  id v15 = (void *)MEMORY[0x263F11E40];
  id v16 = [*(id *)(a1 + 40) userIdentity];
  v17 = [v15 deviceMediaLibraryWithUserIdentity:v16];

  id v37 = v17;
  v18 = [v17 msvDatabase];
  BOOL v19 = [v18 statementWithString:@"SELECT media_type, COUNT() FROM item GROUP BY media_type", 0 error];
  uint64_t v20 = [v18 resultsForStatement:v19];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v41 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v26 = [v25 objectValueAtColumnIndex:0];
        id v27 = [v25 objectValueAtColumnIndex:1];
        [v14 setObject:v27 forKeyedSubscript:v26];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v22);
  }
  id v28 = (void *)MEMORY[0x263F54EC8];
  uint64_t v29 = *MEMORY[0x263F54E80];
  v44[0] = @"request";
  v30 = [*(id *)(a1 + 32) request];
  uint64_t v31 = [v30 description];
  id v32 = (void *)v31;
  NSUInteger v33 = @"@";
  if (v31) {
    NSUInteger v33 = (__CFString *)v31;
  }
  uint64_t v34 = *(void *)(a1 + 48);
  v45[0] = v33;
  v45[1] = v34;
  v44[1] = @"unpersonalizedContentDescriptors";
  v44[2] = @"library-stats";
  v45[2] = v14;
  v35 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];
  id v46 = v35;
  id v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
  [v28 snapshotWithDomain:v29 type:@"Bug" subType:@"StorePlaybackItemsRequest-Personalization" context:v38 triggerThresholdValues:0 events:v36 completion:0];
}

void __195__MPCModelStorePlaybackItemsRequestOperation__runPersonalizationWithSectionCollection_localEquivalencyMapping_expirationDate_error_isFinalResponse_isInvalidForPersonalization_performanceMetrics___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) disarm];
  WeakRetained = (MPCModelStorePlaybackItemsResponse *)objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 88)
                                                                                              + 8)
                                                                                  + 40));
  BOOL v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v31 = 134218242;
    uint64_t v32 = v6;
    __int16 v33 = 2114;
    uint64_t v34 = WeakRetained;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "SPIR: %p: _runPersonalizationWithSectionCollection personalization operation response handler called [] personalizationOperation=%{public}@ ", (uint8_t *)&v31, 0x16u);
  }

  v7 = [v3 results];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 _disableMissingIdentifiersFaults];
  }
  uint64_t v8 = [[MPCModelStorePlaybackItemsResponse alloc] initWithRequest:*(void *)(a1 + 48) personalizationResponse:v3 results:0 performanceMetrics:*(void *)(a1 + 56)];
  [(MPCModelStorePlaybackItemsResponse *)v8 setFinalResponse:*(unsigned __int8 *)(a1 + 112)];
  [(MPCModelStorePlaybackItemsResponse *)v8 setLocalStoreAdamIDToEquivalencySourceStoreAdamIDMap:*(void *)(a1 + 64)];
  if (*(unsigned char *)(*(void *)(a1 + 40) + 306))
  {
    uint64_t v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v31 = 134217984;
      uint64_t v32 = v10;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "SPIR: %p: producing an invalid response [_requiresFollowupRequest]", (uint8_t *)&v31, 0xCu);
    }

    [(MPCModelStorePlaybackItemsResponse *)v8 _invalidate];
  }
  uint64_t v11 = *(void *)(a1 + 72);
  if (*(unsigned char *)(a1 + 113))
  {
    [(MPCModelStorePlaybackItemsResponse *)v8 setInvalidationDate:v11];
  }
  else
  {
    if (v11)
    {
      [*(id *)(a1 + 72) timeIntervalSinceNow];
      if (v12 >= 60.0)
      {
        [(MPCModelStorePlaybackItemsResponse *)v8 setInvalidationDate:*(void *)(a1 + 72)];
      }
      else
      {
        v13 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:60.0];
        [(MPCModelStorePlaybackItemsResponse *)v8 setInvalidationDate:v13];
      }
    }
    v14 = [MEMORY[0x263F121E8] sharedRestrictionsMonitor];
    int v15 = [v14 allowsExplicitContent];
    int v16 = *(unsigned __int8 *)(a1 + 114);

    if (v16 != v15)
    {
      v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        int v31 = 134217984;
        uint64_t v32 = v18;
        _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "SPIR: %p: producing an invalid response [allowsExplicitContent mismatch]", (uint8_t *)&v31, 0xCu);
      }

      [(MPCModelStorePlaybackItemsResponse *)v8 _invalidate];
    }
  }
  if (*(unsigned char *)(a1 + 112))
  {
    BOOL v19 = [*(id *)(*(void *)(a1 + 40) + 320) firstObject];
    uint64_t v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(a1 + 40);
      int v31 = 134218498;
      uint64_t v32 = v21;
      __int16 v33 = 2114;
      uint64_t v34 = v8;
      __int16 v35 = 2114;
      id v36 = v19;
      _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "SPIR: %p: _runPersonalizationWithSectionCollection finishing [isFinalResponse] currentModelResponse=%{public}@ error=%{public}@", (uint8_t *)&v31, 0x20u);
    }

    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    if (v22) {
      (*(void (**)(uint64_t, MPCModelStorePlaybackItemsResponse *, void *))(v22 + 16))(v22, v8, v19);
    }
    [*(id *)(a1 + 40) finishWithError:v19];
  }
  else
  {
    uint64_t v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(void *)(a1 + 40);
      uint64_t v25 = *(void **)(a1 + 80);
      int v31 = 134218498;
      uint64_t v32 = v24;
      __int16 v33 = 2114;
      uint64_t v34 = v8;
      __int16 v35 = 2114;
      id v36 = v25;
      _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "SPIR: %p: _runPersonalizationWithSectionCollection finishing [non-finalResponse] currentModelResponse=%{public}@ error=%{public}@", (uint8_t *)&v31, 0x20u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 104) + 8) + 32));
    uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    if (v26)
    {
      (*(void (**)(uint64_t, MPCModelStorePlaybackItemsResponse *, void))(v26 + 16))(v26, v8, *(void *)(a1 + 80));
      uint64_t v27 = *(void *)(*(void *)(a1 + 96) + 8);
      id v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 104) + 8) + 32));
    [*(id *)(a1 + 40) finishWithError:*(void *)(a1 + 80)];
    uint64_t v29 = *(void *)(a1 + 40);
    v30 = v8;
    BOOL v19 = *(void **)(v29 + 296);
    *(void *)(v29 + 296) = v30;
  }
}

- (void)_runStorePlatformRequestToLoadMetadataWithAccumulator:(id)a3 previousResponse:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[v6 newStoreItemMetadataRequest];
  [v8 setShouldIgnoreExpiration:1];
  uint64_t v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v8 itemIdentifiers];
    uint64_t v11 = [v10 count];
    double v12 = [v8 itemIdentifiers];
    v13 = objc_msgSend(v12, "msv_compactDescription");
    *(_DWORD *)long long buf = 134218498;
    v30 = self;
    __int16 v31 = 2048;
    uint64_t v32 = v11;
    __int16 v33 = 2114;
    uint64_t v34 = v13;
    _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "SPIR: %p: requesting store metadata for %ld items itemIDs=%{public}@", buf, 0x20u);
  }
  v14 = [MEMORY[0x263F122A0] sharedStoreItemMetadataRequestController];
  [v14 beginTransaction];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __117__MPCModelStorePlaybackItemsRequestOperation__runStorePlatformRequestToLoadMetadataWithAccumulator_previousResponse___block_invoke;
  v24[3] = &unk_2643C3D60;
  v24[4] = self;
  id v25 = v8;
  id v26 = v6;
  id v27 = v14;
  id v28 = v7;
  id v15 = v7;
  id v16 = v14;
  id v17 = v6;
  id v18 = v8;
  BOOL v19 = [v16 getStoreItemMetadataForRequest:v18 includeBatchResponseError:1 responseHandler:v24];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __117__MPCModelStorePlaybackItemsRequestOperation__runStorePlatformRequestToLoadMetadataWithAccumulator_previousResponse___block_invoke_52;
  block[3] = &unk_2643C5EE8;
  block[4] = self;
  id v23 = v19;
  id v21 = v19;
  dispatch_sync(accessQueue, block);
}

void __117__MPCModelStorePlaybackItemsRequestOperation__runStorePlatformRequestToLoadMetadataWithAccumulator_previousResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 134218754;
      uint64_t v32 = v8;
      __int16 v33 = 2048;
      uint64_t v34 = (uint64_t)v5;
      __int16 v35 = 2048;
      uint64_t v36 = v9;
      __int16 v37 = 2114;
      id v38 = v6;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "SPIR: %p: SP request=%p got response=%p with error=%{public}@ ", buf, 0x2Au);
    }

    uint64_t v11 = (uint64_t *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v10 + 304)) {
      goto LABEL_20;
    }
    [*(id *)(v10 + 320) addObject:v6];
  }
  else
  {
    uint64_t v11 = (uint64_t *)(a1 + 32);
    if (*(unsigned char *)(*(void *)(a1 + 32) + 304)) {
      goto LABEL_20;
    }
    double v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = *v11;
      uint64_t v29 = [v5 lastBatchStoreItemDictionaries];
      uint64_t v27 = [v29 count];
      v13 = [v5 itemIdentifiers];
      uint64_t v14 = [v13 count];
      id v15 = [v5 lastBatchItemIdentifiers];
      id v16 = objc_msgSend(v15, "msv_compactDescription");
      *(_DWORD *)long long buf = 134218754;
      uint64_t v32 = v28;
      __int16 v33 = 2048;
      uint64_t v34 = v27;
      __int16 v35 = 2048;
      uint64_t v36 = v14;
      __int16 v37 = 2114;
      id v38 = v16;
      _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "SPIR: %p: got store metadata for %ld items (accumulatedItemCount=%ld) lastBatchItemIDs=%{public}@", buf, 0x2Au);
    }
  }
  __int16 v17 = [*(id *)(a1 + 48) handleResponse:v5 error:v6];
  if (v17)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 304) = 1;
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v24 = *(NSObject **)(v23 + 288);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __117__MPCModelStorePlaybackItemsRequestOperation__runStorePlatformRequestToLoadMetadataWithAccumulator_previousResponse___block_invoke_50;
    block[3] = &unk_2643C5FC8;
    block[4] = v23;
    dispatch_sync(v24, block);
    *(unsigned char *)(*(void *)(a1 + 32) + 306) = 0;
    [*(id *)(a1 + 56) endTransaction];
    id v18 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 64);
    id v21 = v6;
    uint64_t v22 = 1;
    goto LABEL_15;
  }
  if ((v17 & 0x100) != 0 && [*(id *)(*v11 + 328) shouldBatchResultsWithPlaceholderObjects])
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 306) = 1;
    id v18 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 64);
    id v21 = v6;
    uint64_t v22 = 0;
LABEL_15:
    [v18 _handleItemMetadataBatchRequestCompletedWithAccumulator:v19 previousResponse:v20 error:v21 isFinalResponse:v22];
    goto LABEL_20;
  }
  if ([v5 isFinalResponse])
  {
    id v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *v11;
      *(_DWORD *)long long buf = 134217984;
      uint64_t v32 = v26;
      _os_log_impl(&dword_21BB87000, v25, OS_LOG_TYPE_DEFAULT, "SPIR: %p: metadataResponse is final, but we don't have enough items, recursing", buf, 0xCu);
    }

    [*(id *)(a1 + 32) _runStorePlatformRequestToLoadMetadataWithAccumulator:*(void *)(a1 + 48) previousResponse:*(void *)(a1 + 64)];
  }
LABEL_20:
}

void __117__MPCModelStorePlaybackItemsRequestOperation__runStorePlatformRequestToLoadMetadataWithAccumulator_previousResponse___block_invoke_52(uint64_t a1)
{
}

void __117__MPCModelStorePlaybackItemsRequestOperation__runStorePlatformRequestToLoadMetadataWithAccumulator_previousResponse___block_invoke_50(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 272);
  *(void *)(v1 + 272) = 0;
}

- (void)execute
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(MPCModelStorePlaybackItemsRequestOperation *)self responseHandler];
  if ([(MPAsyncOperation *)self isCancelled])
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:28 userInfo:0];
    if (v3) {
      ((void (**)(void, void, void *))v3)[2](v3, 0, v4);
    }
    [(MPAsyncOperation *)self finishWithError:v4];
  }
  else
  {
    id v4 = [(MPCModelStorePlaybackItemsRequestOperation *)self request];
    if ([v4 isValid])
    {
      id v5 = +[MPCPlaybackAccountManager sharedManager];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __53__MPCModelStorePlaybackItemsRequestOperation_execute__block_invoke;
      v8[3] = &unk_2643C3D38;
      void v8[4] = self;
      id v9 = v5;
      uint64_t v11 = v3;
      id v10 = v4;
      id v6 = v5;
      [v6 performAfterLoadingAccounts:v8];
    }
    else
    {
      id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 134217984;
        v13 = self;
        _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "SPIR: %p: Request doesn't contain any storeIDs nor sectionedModelObjects, completing with an empty response.", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 1, @"Request must contain either storeIDs or sectionedModelObjects");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v3) {
        ((void (**)(void, void, id))v3)[2](v3, 0, v6);
      }
      [(MPAsyncOperation *)self finishWithError:v6];
    }
  }
}

void __53__MPCModelStorePlaybackItemsRequestOperation_execute__block_invoke(uint64_t a1)
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 328) playbackRequestEnvironment];
  id v3 = [v2 userIdentity];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263F893C0] activeAccount];
  }
  id v6 = v5;

  uint64_t v7 = [*(id *)(a1 + 40) accountForUserIdentity:v6];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 312);
  *(void *)(v8 + 312) = v7;

  id v10 = *(void **)(*(void *)(a1 + 32) + 312);
  if (v10)
  {
    if ([v10 hasCatalogPlaybackCapability])
    {
      int v11 = 1;
    }
    else
    {
      id v16 = [*(id *)(a1 + 32) request];
      int v11 = [v16 isInGroupSession];
    }
    __int16 v17 = [MEMORY[0x263F89270] sharedPrivacyInfo];
    int v18 = [v17 privacyAcknowledgementRequiredForMusic];

    if (v18)
    {
      uint64_t v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 134217984;
        uint64_t v82 = v20;
        _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_ERROR, "SPIR: %p: Declining to use StorePlatform due to required privacy acknowledgement.", buf, 0xCu);
      }

      int v11 = 0;
    }
    if (!*(void *)(*(void *)(a1 + 32) + 280))
    {
      id v21 = objc_alloc_init(MEMORY[0x263F08A48]);
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v23 = *(void **)(v22 + 280);
      *(void *)(v22 + 280) = v21;

      [*(id *)(*(void *)(a1 + 32) + 280) setName:@"com.apple.MediaPlayer.MPCModelStorePlaybackItemsRequestOperation.operationQueue"];
      [*(id *)(*(void *)(a1 + 32) + 280) setMaxConcurrentOperationCount:1];
      uint64_t v24 = *(void **)(*(void *)(a1 + 32) + 280);
      id v25 = [MEMORY[0x263F08B88] currentThread];
      objc_msgSend(v24, "setQualityOfService:", objc_msgSend(v25, "qualityOfService"));
    }
    uint64_t v14 = [*(id *)(a1 + 48) previousResponse];
    if ([v14 isInvalidForPersonalization])
    {
      uint64_t v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 134218240;
        uint64_t v82 = v27;
        __int16 v83 = 2048;
        *(void *)v84 = v14;
        _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "SPIR: %p: re-running personalization [previousResponse.isInvalidForPersonalization] previousResponse=%p", buf, 0x16u);
      }

      uint64_t v28 = [v14 _personalizationResponse];
      uint64_t v29 = [v28 request];
      v30 = [v29 unpersonalizedContentDescriptors];

      __int16 v31 = [v14 localStoreAdamIDToEquivalencySourceStoreAdamIDMap];
      uint64_t v32 = [v14 invalidationDate];
      objc_msgSend(*(id *)(a1 + 32), "_runPersonalizationWithSectionCollection:localEquivalencyMapping:expirationDate:error:isFinalResponse:isInvalidForPersonalization:performanceMetrics:", v30, v31, v32, 0, objc_msgSend(v14, "isFinalResponse"), 1, 0);

      goto LABEL_58;
    }
    __int16 v33 = [*(id *)(a1 + 48) storeIDs];
    uint64_t v34 = [v33 count];

    __int16 v35 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (!v36) {
        goto LABEL_29;
      }
      uint64_t v37 = *(void *)(a1 + 32);
      id v38 = [*(id *)(a1 + 48) storeIDs];
      uint64_t v39 = objc_msgSend(v38, "msv_compactDescription");
      *(_DWORD *)long long buf = 134218242;
      uint64_t v82 = v37;
      __int16 v83 = 2114;
      *(void *)v84 = v39;
      long long v40 = "SPIR: %p: starting requestedStoreIDs=%{public}@";
    }
    else
    {
      if (!v36) {
        goto LABEL_29;
      }
      uint64_t v41 = *(void *)(a1 + 32);
      id v38 = [*(id *)(a1 + 48) identifiers];
      uint64_t v39 = [v38 debugDescription];
      *(_DWORD *)long long buf = 134218242;
      uint64_t v82 = v41;
      __int16 v83 = 2114;
      *(void *)v84 = v39;
      long long v40 = "SPIR: %p: starting identifiers=%{public}@";
    }
    _os_log_impl(&dword_21BB87000, v35, OS_LOG_TYPE_DEFAULT, v40, buf, 0x16u);

LABEL_29:
    v30 = [[MPCModelStorePlaybackItemsRequestAccumulator alloc] initWithRequest:*(void *)(a1 + 48)];
    unsigned int v42 = [(MPCModelStorePlaybackItemsRequestAccumulator *)v30 accumulatorResult];
    *(unsigned char *)(*(void *)(a1 + 32) + 306) = BYTE2(v42) & 1;
    __int16 v31 = [(MPCModelStorePlaybackItemsRequestAccumulator *)v30 accumulationError];
    long long v43 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v44 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 134219010;
      uint64_t v82 = v44;
      __int16 v83 = 1024;
      *(_DWORD *)v84 = (v42 >> 8) & 1;
      *(_WORD *)&v84[4] = 1024;
      *(_DWORD *)&v84[6] = v42 & 1;
      __int16 v85 = 1024;
      int v86 = HIWORD(v42) & 1;
      __int16 v87 = 2114;
      v88 = v31;
      _os_log_impl(&dword_21BB87000, v43, OS_LOG_TYPE_DEFAULT, "SPIR: %p: initial accumulator result: didFinishPrioritizedBatch=%{BOOL}u didFinishEntireRequest=%{BOOL}u hasPrioritizedItemsToLoad=%{BOOL}u accumulationError=%{public}@", buf, 0x28u);
    }

    if (v31)
    {
      id v45 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v46 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 134218242;
        uint64_t v82 = v46;
        __int16 v83 = 2114;
        *(void *)v84 = v31;
        _os_log_impl(&dword_21BB87000, v45, OS_LOG_TYPE_DEFAULT, "SPIR: %p: completing without requests [has accumulationError] accumulationError=%{public}@", buf, 0x16u);
      }

      uint64_t v47 = *(void *)(a1 + 56);
      if (v47) {
        (*(void (**)(uint64_t, void, void *))(v47 + 16))(v47, 0, v31);
      }
      [*(id *)(a1 + 32) finishWithError:v31];
      goto LABEL_58;
    }
    id v48 = objc_msgSend(*(id *)(a1 + 48), "abc_siriAssetInfo");
    uint64_t v49 = [v48 length];

    if (!v49 || (v42 & 0x100) != 0)
    {
      if ((v42 & 0x100) == 0
        || (v42 & 1) == 0 && ![*(id *)(a1 + 48) shouldBatchResultsWithPlaceholderObjects])
      {
LABEL_50:
        if (v11)
        {
          __int16 v64 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v65 = *(void *)(a1 + 32);
            *(_DWORD *)long long buf = 134217984;
            uint64_t v82 = v65;
            _os_log_impl(&dword_21BB87000, v64, OS_LOG_TYPE_DEFAULT, "SPIR: %p: performing remaining lookups via StorePlatform", buf, 0xCu);
          }

          [*(id *)(a1 + 32) _runStorePlatformRequestToLoadMetadataWithAccumulator:v30 previousResponse:v14];
        }
        else
        {
          __int16 v66 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 57, @"Cannot make remaining requests for content because the user identity does not support it: %@", *(void *)(*(void *)(a1 + 32) + 312));
          uint64_t v67 = *(void *)(a1 + 56);
          if (v67) {
            (*(void (**)(uint64_t, void, void *))(v67 + 16))(v67, 0, v66);
          }
          [*(id *)(a1 + 32) finishWithError:v66];
        }
LABEL_57:
        __int16 v31 = 0;
LABEL_58:

        goto LABEL_59;
      }
      __int16 v68 = *(void **)(a1 + 32);
      v69 = [(MPCModelStorePlaybackItemsRequestAccumulator *)v30 equivalencyMapping];
      v63 = [v68 _localStoreAdamIDToEquivalencySourceStoreAdamIDMap:v69];

      int v61 = [(MPCModelStorePlaybackItemsRequestAccumulator *)v30 unpersonalizedContentDescriptors];
      [*(id *)(a1 + 32) _runPersonalizationWithSectionCollection:v61 localEquivalencyMapping:v63 expirationDate:0 error:0 isFinalResponse:v42 & 1 isInvalidForPersonalization:0 performanceMetrics:0];
      v62 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      BOOL v70 = os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
      if (v42)
      {
        if (v70)
        {
          uint64_t v71 = *(void *)(a1 + 32);
          *(_DWORD *)long long buf = 134218242;
          uint64_t v82 = v71;
          __int16 v83 = 2114;
          *(void *)v84 = v61;
          _os_log_impl(&dword_21BB87000, v62, OS_LOG_TYPE_DEFAULT, "SPIR: %p: completing without requests [no remaining IDs to request] unpersonalizedContentDescriptors=%{public}@", buf, 0x16u);
        }

        goto LABEL_57;
      }
      if (v70)
      {
        uint64_t v72 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 134217984;
        uint64_t v82 = v72;
        _os_log_impl(&dword_21BB87000, v62, OS_LOG_TYPE_DEFAULT, "SPIR: %p: first batch complete without requests [prioritized IDs initially loaded], will continue to request remaining items", buf, 0xCu);
      }
    }
    else
    {
      int v77 = v11;
      uint64_t v50 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        uint64_t v51 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 134217984;
        uint64_t v82 = v51;
        _os_log_impl(&dword_21BB87000, v50, OS_LOG_TYPE_ERROR, "SPIR: %p: generating ABC [siriAssetInfo provided, but prioritizedBatch not finished]", buf, 0xCu);
      }

      v74 = (void *)MEMORY[0x263F54EC8];
      uint64_t v75 = *MEMORY[0x263F54E80];
      v78[0] = @"request";
      v76 = [*(id *)(a1 + 32) request];
      uint64_t v52 = [v76 description];
      BOOL v53 = (void *)v52;
      if (v52) {
        char v54 = (__CFString *)v52;
      }
      else {
        char v54 = @"@";
      }
      v79[0] = v54;
      v78[1] = @"siriAssetInfo";
      uint64_t v73 = objc_msgSend(*(id *)(a1 + 48), "abc_siriAssetInfo");
      v79[1] = v73;
      v78[2] = @"preferredShuffleStartIdentifiers";
      uint64_t v55 = objc_msgSend(*(id *)(a1 + 48), "abc_preferredShuffleStartIdentifiers");
      id v56 = (void *)v55;
      if (v55) {
        id v57 = (__CFString *)v55;
      }
      else {
        id v57 = @"@";
      }
      v79[2] = v57;
      v78[3] = @"accumulator.stateDump";
      v58 = [(MPCModelStorePlaybackItemsRequestAccumulator *)v30 abc_stateDump];
      v79[3] = v58;
      v59 = [NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:4];
      v80 = v59;
      v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v80 count:1];
      [v74 snapshotWithDomain:v75 type:@"Bug" subType:@"StorePlaybackItemsRequest-SiriAssetInfo" context:@"InitialAccumulation" triggerThresholdValues:0 events:v60 completion:0];

      int v61 = v53;
      v62 = v73;

      v63 = v76;
      int v11 = v77;
    }

    goto LABEL_50;
  }
  double v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 134218242;
    uint64_t v82 = v13;
    __int16 v83 = 2114;
    *(void *)v84 = v6;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_ERROR, "SPIR: %p: Unable to find user for identity: %{public}@", buf, 0x16u);
  }

  uint64_t v14 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 57, @"Unable to find account for identity: %@", v6);
  uint64_t v15 = *(void *)(a1 + 56);
  if (v15) {
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v14);
  }
  [*(id *)(a1 + 32) finishWithError:v14];
LABEL_59:
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)MPCModelStorePlaybackItemsRequestOperation;
  [(MPAsyncOperation *)&v5 cancel];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__MPCModelStorePlaybackItemsRequestOperation_cancel__block_invoke;
  block[3] = &unk_2643C5FC8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
}

uint64_t __52__MPCModelStorePlaybackItemsRequestOperation_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 272) cancel];
}

- (MPCModelStorePlaybackItemsRequestOperation)initWithRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MPAsyncOperation *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    request = v8->_request;
    v8->_request = (MPCModelStorePlaybackItemsRequest *)v9;

    uint64_t v11 = [v7 copy];
    id responseHandler = v8->_responseHandler;
    v8->_id responseHandler = (id)v11;

    uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelStorePlaybackItemsRequestOperation.accessQueue", v13);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [MEMORY[0x263EFF980] array];
    errors = v8->_errors;
    v8->_errors = (NSMutableArray *)v16;
  }
  return v8;
}

@end