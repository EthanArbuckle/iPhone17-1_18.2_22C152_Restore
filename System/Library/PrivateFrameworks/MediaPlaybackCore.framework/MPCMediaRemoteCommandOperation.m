@interface MPCMediaRemoteCommandOperation
- (BOOL)_checkDependenciesForFailures:(id)a3;
- (BOOL)_handleLibraryManipulationCommandsForRequestID:(id)a3;
- (MPCMediaRemoteCommandOperation)initWithCommandRequest:(id)a3 options:(unint64_t)a4 sendDate:(id)a5;
- (MPCPlayerCommandRequest)request;
- (MPCPlayerCommandStatus)status;
- (NSData)tokenB;
- (NSDate)sendDate;
- (id)_wrapUnderlyingErrorsIfNeeded:(id)a3;
- (unint64_t)options;
- (void)_completeRequestID:(id)a3 withStatus:(id)a4;
- (void)execute;
- (void)performLibraryFavoriteEntityChangeRequestFor:(id)a3 withFavoriteEntityChangeRequestAction:(int64_t)a4 completion:(id)a5;
@end

@implementation MPCMediaRemoteCommandOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenB, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_sendDate, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (NSData)tokenB
{
  return self->_tokenB;
}

- (MPCPlayerCommandStatus)status
{
  return self->_status;
}

- (NSDate)sendDate
{
  return self->_sendDate;
}

- (unint64_t)options
{
  return self->_options;
}

- (MPCPlayerCommandRequest)request
{
  return self->_request;
}

- (void)performLibraryFavoriteEntityChangeRequestFor:(id)a3 withFavoriteEntityChangeRequestAction:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  v8 = (objc_class *)MEMORY[0x263F11F28];
  id v9 = a3;
  v10 = (void *)[[v8 alloc] initWithChangeAction:a4];
  id v11 = objc_alloc_init(MEMORY[0x263F11F20]);
  [v11 setModelObject:v9];

  [v11 setRequestAction:v10];
  v12 = [MEMORY[0x263F11F58] sharedDeviceLibraryController];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __128__MPCMediaRemoteCommandOperation_performLibraryFavoriteEntityChangeRequestFor_withFavoriteEntityChangeRequestAction_completion___block_invoke;
  v14[3] = &unk_2643C5830;
  id v15 = v7;
  id v13 = v7;
  [v12 performFavoriteStateChangeRequest:v11 withRelatedModelObjects:0 completion:v14];
}

void __128__MPCMediaRemoteCommandOperation_performLibraryFavoriteEntityChangeRequestFor_withFavoriteEntityChangeRequestAction_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = 200;
    uint64_t v4 = a2;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  id v5 = [MEMORY[0x263F121D0] statusWithCode:v3 error:v4];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)execute
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(MPCMediaRemoteCommandOperation *)self request];
  id v5 = [v4 options];
  v6 = (void *)[v5 mutableCopy];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v9 = v8;

  uint64_t v10 = *MEMORY[0x263F54C88];
  id v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F54C88]];
  if (!v11)
  {
    v12 = [MEMORY[0x263F08C38] UUID];
    id v11 = [v12 UUIDString];

    [v9 setObject:v11 forKeyedSubscript:v10];
  }
  if (self->_tokenB)
  {
    uint64_t v13 = [v11 stringByAppendingString:@"-tokenE"];

    [v9 setObject:v13 forKeyedSubscript:v10];
    [v9 setObject:self->_tokenB forKeyedSubscript:@"MPCPlayerCommandRequestMediaRemoteOptionDelegationTokenB"];
    id v11 = (void *)v13;
  }
  if ([(MPAsyncOperation *)self isCancelled])
  {
    v14 = [MPCPlayerCommandStatus alloc];
    id v15 = (void *)MEMORY[0x263F121D0];
    v16 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 1000, @"Command was cancelled before it was performed.");
    v17 = [v15 statusWithCode:200 error:v16];
    v18 = [(MPCPlayerCommandStatus *)v14 initWithMPStatus:v17 request:self->_request];
    status = self->_status;
    self->_status = v18;

    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = MPCRemoteCommandDescriptionCopy([(MPCPlayerCommandRequest *)self->_request command]);
      v22 = self->_status;
      *(_DWORD *)buf = 138543874;
      v66 = v21;
      __int16 v67 = 2114;
      v68 = v11;
      __int16 v69 = 2114;
      v70 = v22;
      _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_ERROR, "[PCR:%{public}@:%{public}@] performWithExtendedStatusCompletion: | failed to perform command [canceled before sending] status=%{public}@", buf, 0x20u);
    }
    [(MPAsyncOperation *)self finish];
    goto LABEL_36;
  }
  if (([(MPCMediaRemoteCommandOperation *)self options] & 1) == 0
    && [(MPCMediaRemoteCommandOperation *)self _checkDependenciesForFailures:v11])
  {
    goto LABEL_36;
  }
  uint64_t v23 = *MEMORY[0x263F54C68];
  v24 = [v9 objectForKeyedSubscript:*MEMORY[0x263F54C68]];

  if (!v24)
  {
    v25 = NSNumber;
    [(NSDate *)self->_sendDate timeIntervalSinceReferenceDate];
    v26 = objc_msgSend(v25, "numberWithDouble:");
    [v9 setObject:v26 forKeyedSubscript:v23];
  }
  v27 = [(MPCMediaRemoteCommandOperation *)self request];
  v28 = [v27 label];

  if ([v28 length]) {
    [v9 setObject:v28 forKeyedSubscript:*MEMORY[0x263F54D60]];
  }
  if (([(MPCMediaRemoteCommandOperation *)self options] & 0x10000) != 0)
  {
    v29 = [(MPCMediaRemoteCommandOperation *)self request];
    v30 = [v29 userInitiatedOptions];

    if ([v30 count]) {
      [v9 addEntriesFromDictionary:v30];
    }
    [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F54CC0]];
  }
  v31 = [(MPCMediaRemoteCommandOperation *)self request];
  v32 = [v31 controller];
  if (v32)
  {
  }
  else
  {
    v33 = [(MPCMediaRemoteCommandOperation *)self request];
    v34 = [v33 playerPath];

    if (v34) {
      goto LABEL_26;
    }
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"MPCPlayerChangeRequest.m" lineNumber:429 description:@"Either Controller or PlayerPath is required to perform a change request."];
  }

LABEL_26:
  v35 = [(MPCMediaRemoteCommandOperation *)self request];
  uint64_t v36 = [v35 command];

  if (![(MPCMediaRemoteCommandOperation *)self _handleLibraryManipulationCommandsForRequestID:v11])
  {
    v37 = [(MPCMediaRemoteCommandOperation *)self request];
    v38 = [v37 controller];

    if (v38)
    {
      v39 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = MPCRemoteCommandDescriptionCopy([(MPCPlayerCommandRequest *)self->_request command]);
        *(_DWORD *)buf = 138543618;
        v66 = v40;
        __int16 v67 = 2114;
        v68 = v11;
        _os_log_impl(&dword_21BB87000, v39, OS_LOG_TYPE_DEFAULT, "[PCR:%{public}@:%{public}@] performWithExtendedStatusCompletion: | sending command []", buf, 0x16u);
      }
      v41 = [(MPCMediaRemoteCommandOperation *)self request];
      v42 = [v41 controller];
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v63[2] = __41__MPCMediaRemoteCommandOperation_execute__block_invoke;
      v63[3] = &unk_2643C07B0;
      v63[4] = self;
      id v64 = v11;
      [v42 sendCommand:v36 options:v9 completion:v63];

      id v43 = v64;
    }
    else
    {
      id v44 = objc_alloc(MEMORY[0x263F54ED0]);
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __41__MPCMediaRemoteCommandOperation_execute__block_invoke_2;
      v62[3] = &unk_2643C4F28;
      v62[4] = self;
      v62[5] = a2;
      v45 = (void *)[v44 initWithDeallocHandler:v62];
      v46 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = MPCRemoteCommandDescriptionCopy([(MPCPlayerCommandRequest *)self->_request command]);
        v48 = [(MPCMediaRemoteCommandOperation *)self request];
        v49 = [v48 playerPath];
        *(_DWORD *)buf = 138543874;
        v66 = v47;
        __int16 v67 = 2114;
        v68 = v11;
        __int16 v69 = 2114;
        v70 = v49;
        _os_log_impl(&dword_21BB87000, v46, OS_LOG_TYPE_DEFAULT, "[PCR:%{public}@:%{public}@] performWithExtendedStatusCompletion: | resolving player path [] playerPath=%{public}@", buf, 0x20u);
      }
      v50 = [(MPCMediaRemoteCommandOperation *)self request];
      v51 = [v50 playerPath];
      v56[0] = MEMORY[0x263EF8330];
      v56[1] = 3221225472;
      v56[2] = __41__MPCMediaRemoteCommandOperation_execute__block_invoke_200;
      v56[3] = &unk_2643C07D8;
      id v57 = v45;
      v58 = self;
      id v59 = v11;
      int v61 = v36;
      id v60 = v9;
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __41__MPCMediaRemoteCommandOperation_execute__block_invoke_2_204;
      v52[3] = &unk_2643C0800;
      id v53 = v57;
      v54 = self;
      id v55 = v59;
      id v43 = v57;
      [v51 resolveWithRouteResolvedHandler:v56 completion:v52];
    }
  }

LABEL_36:
}

uint64_t __41__MPCMediaRemoteCommandOperation_execute__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completeRequestID:*(void *)(a1 + 40) withStatus:a2];
}

void __41__MPCMediaRemoteCommandOperation_execute__block_invoke_2(uint64_t a1)
{
  if (MSVDeviceOSIsInternalInstall())
  {
    id v2 = [MEMORY[0x263F08690] currentHandler];
    [v2 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"MPCPlayerChangeRequest.m" lineNumber:444 description:@"MPCPlayerCommandRequest player path resolution completion not called"];
  }
}

void __41__MPCMediaRemoteCommandOperation_execute__block_invoke_200(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([*(id *)(a1 + 32) disarm])
  {
    uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = MPCRemoteCommandDescriptionCopy([*(id *)(*(void *)(a1 + 40) + 272) command]);
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      __int16 v16 = 2114;
      id v17 = v3;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[PCR:%{public}@:%{public}@] performWithExtendedStatusCompletion: | resolved player path route [] playerPath=%{public}@", buf, 0x20u);
    }
    uint64_t v7 = *(unsigned int *)(a1 + 64);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __41__MPCMediaRemoteCommandOperation_execute__block_invoke_202;
    v10[3] = &unk_2643C07B0;
    id v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    v10[4] = *(void *)(a1 + 40);
    id v11 = v8;
    +[MPCMediaRemoteController sendCommand:v7 options:v9 toPlayerPath:v3 completion:v10];
  }
}

void __41__MPCMediaRemoteCommandOperation_execute__block_invoke_2_204(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) disarm])
  {
    uint64_t v7 = (void *)MEMORY[0x263F087E8];
    id v8 = [*(id *)(a1 + 40) request];
    uint64_t v9 = [v8 playerPath];
    uint64_t v10 = objc_msgSend(v7, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCError", 1000, v6, @"PlayerPath did not resolve route to origin: %@", v9);

    id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = MPCRemoteCommandDescriptionCopy([*(id *)(*(void *)(a1 + 40) + 272) command]);
      uint64_t v13 = *(void *)(a1 + 48);
      __int16 v14 = objc_msgSend(v10, "msv_description");
      *(_DWORD *)buf = 138544130;
      id v17 = v12;
      __int16 v18 = 2114;
      uint64_t v19 = v13;
      __int16 v20 = 2114;
      id v21 = v5;
      __int16 v22 = 2114;
      uint64_t v23 = v14;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_ERROR, "[PCR:%{public}@:%{public}@] performWithExtendedStatusCompletion: | failed to resolve player path route [] playerPath=%{public}@ error=%{public}@", buf, 0x2Au);
    }
    uint64_t v15 = [MEMORY[0x263F121D0] statusWithCode:200 error:v10];
    [*(id *)(a1 + 40) _completeRequestID:*(void *)(a1 + 48) withStatus:v15];
  }
}

uint64_t __41__MPCMediaRemoteCommandOperation_execute__block_invoke_202(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completeRequestID:*(void *)(a1 + 40) withStatus:a2];
}

- (void)_completeRequestID:(id)a3 withStatus:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MPCMediaRemoteCommandOperation *)self request];
  int v9 = [v8 command];

  if (v9 != 125 && v9 != 122
    || [v7 type] != 999
    || ([v7 customDataType],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 isEqual:@"com.apple.music/wha-delegation/b"],
        v10,
        !v11))
  {
    __int16 v14 = [(MPCMediaRemoteCommandOperation *)self _wrapUnderlyingErrorsIfNeeded:v7];

    uint64_t v15 = [(MPCMediaRemoteCommandOperation *)self request];
    __int16 v16 = [v15 statusTransformer];

    if (v16)
    {
      id v17 = [(MPCMediaRemoteCommandOperation *)self request];
      __int16 v18 = [v17 statusTransformer];
      ((void (**)(void, void *))v18)[2](v18, v14);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = v14;
    }
    uint64_t v19 = [[MPCPlayerCommandStatus alloc] initWithMPStatus:v7 request:self->_request];
    status = self->_status;
    self->_status = v19;

    id v21 = [(MPCPlayerCommandStatus *)self->_status error];

    __int16 v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    uint64_t v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = MPCRemoteCommandDescriptionCopy([(MPCPlayerCommandRequest *)self->_request command]);
        v25 = self->_status;
        int v31 = 138543874;
        v32 = v24;
        __int16 v33 = 2114;
        id v34 = v6;
        __int16 v35 = 2114;
        uint64_t v36 = v25;
        v26 = "[PCR:%{public}@:%{public}@] performWithExtendedStatusCompletion: | failed to perform command [failed statu"
              "s] status=%{public}@";
        v27 = v23;
        os_log_type_t v28 = OS_LOG_TYPE_ERROR;
LABEL_14:
        _os_log_impl(&dword_21BB87000, v27, v28, v26, (uint8_t *)&v31, 0x20u);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = MPCRemoteCommandDescriptionCopy([(MPCPlayerCommandRequest *)self->_request command]);
      v29 = self->_status;
      int v31 = 138543874;
      v32 = v24;
      __int16 v33 = 2114;
      id v34 = v6;
      __int16 v35 = 2114;
      uint64_t v36 = v29;
      v26 = "[PCR:%{public}@:%{public}@] performWithExtendedStatusCompletion: | finished command [] status=%{public}@";
      v27 = v23;
      os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_14;
    }

    v30 = [v7 error];
    [(MPAsyncOperation *)self finishWithError:v30];

    goto LABEL_16;
  }
  v12 = [v7 customData];
  tokenB = self->_tokenB;
  self->_tokenB = v12;

  [(MPCMediaRemoteCommandOperation *)self execute];
LABEL_16:
}

- (BOOL)_handleLibraryManipulationCommandsForRequestID:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCMediaRemoteCommandOperation *)self request];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v7 = [(MPCMediaRemoteCommandOperation *)self request];
  id v8 = v7;
  if (isKindOfClass)
  {
    if ([v7 value]) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 3;
    }
    uint64_t v10 = [v8 modelObject];
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __81__MPCMediaRemoteCommandOperation__handleLibraryManipulationCommandsForRequestID___block_invoke;
    v25 = &unk_2643C07B0;
    v26 = self;
    int v11 = &v27;
    id v27 = v4;
    v12 = &v22;
  }
  else
  {
    objc_opt_class();
    char v13 = objc_opt_isKindOfClass();

    if ((v13 & 1) == 0)
    {
      BOOL v14 = 0;
      goto LABEL_10;
    }
    id v8 = [(MPCMediaRemoteCommandOperation *)self request];
    uint64_t v9 = [v8 value] ^ 1;
    uint64_t v10 = [v8 modelObject];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    __int16 v18 = __81__MPCMediaRemoteCommandOperation__handleLibraryManipulationCommandsForRequestID___block_invoke_2;
    uint64_t v19 = &unk_2643C07B0;
    __int16 v20 = self;
    int v11 = &v21;
    id v21 = v4;
    v12 = &v16;
  }
  -[MPCMediaRemoteCommandOperation performLibraryFavoriteEntityChangeRequestFor:withFavoriteEntityChangeRequestAction:completion:](self, "performLibraryFavoriteEntityChangeRequestFor:withFavoriteEntityChangeRequestAction:completion:", v10, v9, v12, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);

  BOOL v14 = 1;
LABEL_10:

  return v14;
}

uint64_t __81__MPCMediaRemoteCommandOperation__handleLibraryManipulationCommandsForRequestID___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completeRequestID:*(void *)(a1 + 40) withStatus:a2];
}

uint64_t __81__MPCMediaRemoteCommandOperation__handleLibraryManipulationCommandsForRequestID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completeRequestID:*(void *)(a1 + 40) withStatus:a2];
}

- (id)_wrapUnderlyingErrorsIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [v4 error];
  uint64_t v6 = [v4 statusCode];
  if (!v6) {
    goto LABEL_11;
  }
  uint64_t v7 = v6;
  if (v6 == 1004)
  {
    v12 = (void *)MEMORY[0x263F121D0];
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlayerEnqueueError", 2, v5, @"Feature requires active subscription");
    uint64_t v10 = v12;
    uint64_t v11 = 1004;
    goto LABEL_6;
  }
  if (v6 == 1001)
  {
    id v8 = (void *)MEMORY[0x263F121D0];
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlayerEnqueueError", 1, v5, @"Queue is user curated and requires override");
    uint64_t v10 = v8;
    uint64_t v11 = 1001;
LABEL_6:
    id v13 = [v10 statusWithCode:v11 error:v9];

    goto LABEL_17;
  }
  if ([v4 type] != 1 && objc_msgSend(v4, "type") != 3)
  {
LABEL_11:
    id v13 = v4;
    goto LABEL_17;
  }
  BOOL v14 = objc_msgSend(v5, "msv_errorByUnwrappingDomain:code:", @"MPCMusicSharePlayBehaviorError", 10);
  uint64_t v15 = objc_msgSend(v5, "msv_errorByUnwrappingDomain:code:", @"MPCMusicBehaviorError", 3);
  uint64_t v16 = objc_msgSend(v5, "msv_errorByUnwrappingDomain:code:", @"MPCMusicBehaviorError", 9);
  if (v14)
  {
    uint64_t v17 = (void *)MEMORY[0x263F121D0];
    __int16 v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = @"Attempted to add unsupported content to Share Play";
LABEL_14:
    uint64_t v20 = 3;
    goto LABEL_15;
  }
  if (v15)
  {
    uint64_t v17 = (void *)MEMORY[0x263F121D0];
    __int16 v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = @"Attempted to convert queue with unsupported content to Share Play";
    goto LABEL_14;
  }
  uint64_t v17 = (void *)MEMORY[0x263F121D0];
  __int16 v18 = (void *)MEMORY[0x263F087E8];
  if (!v16)
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlayerRequestError", 1001, v5, @"Failed to perform command %@", self->_request);
    goto LABEL_16;
  }
  uint64_t v19 = @"Radio station requires subscription";
  uint64_t v20 = 5;
LABEL_15:
  objc_msgSend(v18, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlayerEnqueueError", v20, v5, v19, v23);
  id v21 = LABEL_16:;
  id v13 = [v17 statusWithCode:v7 error:v21];

LABEL_17:

  return v13;
}

- (BOOL)_checkDependenciesForFailures:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = [(MPCMediaRemoteCommandOperation *)self dependencies];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          v12 = [v11 status];
          uint64_t v13 = [v12 statusCode];

          if (v13)
          {
            [(MPAsyncOperation *)self cancel];
            uint64_t v15 = [MPCPlayerCommandStatus alloc];
            uint64_t v16 = (void *)MEMORY[0x263F121D0];
            uint64_t v17 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 1000, @"Did not attempt command because dependent command failed.");
            __int16 v18 = [v16 statusWithCode:200 error:v17];
            uint64_t v19 = [(MPCPlayerCommandStatus *)v15 initWithMPStatus:v18 request:self->_request];
            status = self->_status;
            self->_status = v19;

            id v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              uint64_t v22 = MPCRemoteCommandDescriptionCopy([(MPCPlayerCommandRequest *)self->_request command]);
              uint64_t v23 = self->_status;
              *(_DWORD *)buf = 138543874;
              v32 = v22;
              __int16 v33 = 2114;
              id v34 = v4;
              __int16 v35 = 2114;
              uint64_t v36 = v23;
              _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_ERROR, "[PCR:%{public}@:%{public}@] performWithExtendedStatusCompletion: | failed to perform command [dependent command failed] status=%{public}@", buf, 0x20u);
            }
            uint64_t v24 = [v11 status];
            v25 = [v24 error];
            [(MPAsyncOperation *)self finishWithError:v25];

            BOOL v14 = 1;
            goto LABEL_15;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_15:

  return v14;
}

- (MPCMediaRemoteCommandOperation)initWithCommandRequest:(id)a3 options:(unint64_t)a4 sendDate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MPCMediaRemoteCommandOperation;
  id v11 = [(MPAsyncOperation *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_request, a3);
    v12->_options = a4;
    objc_storeStrong((id *)&v12->_sendDate, a5);
  }

  return v12;
}

@end