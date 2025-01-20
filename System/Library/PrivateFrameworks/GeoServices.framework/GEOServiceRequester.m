@interface GEOServiceRequester
- (BOOL)_shouldTryNextOperation:(id)a3 forError:(id)a4 fromOperation:(id)a5;
- (Class)companionOfflineOperationClass;
- (Class)offlineOperationClass;
- (GEOOfflineStateManager)offlineStateManager;
- (GEOServiceRequester)init;
- (NSArray)networkOperationClasses;
- (id)_currentOperationForRequest:(id)a3;
- (id)_keyForRequest:(id)a3;
- (id)_operationClassForTraits:(id)a3 requestKind:(id)a4 forCohort:(id)a5 config:(id)a6 error:(id *)a7;
- (id)_takeCurrentOperationForRequest:(id)a3;
- (id)_validateResponse:(id)a3;
- (void)_addOperation:(id)a3 forRequest:(id)a4;
- (void)_cancelRequest:(id)a3;
- (void)_removeAllOperationsForRequest:(id)a3;
- (void)_request:(id)a3 completed:(id)a4 error:(id)a5 completion:(id)a6;
- (void)_startWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 completionHandler:(id)a9;
- (void)_startWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 willSendRequestHandler:(id)a9 completionHandler:(id)a10;
- (void)setCompanionOfflineOperationClass:(Class)a3;
- (void)setNetworkOperationClasses:(id)a3;
- (void)setOfflineOperationClass:(Class)a3;
- (void)setOfflineStateManager:(id)a3;
@end

@implementation GEOServiceRequester

- (id)_operationClassForTraits:(id)a3 requestKind:(id)a4 forCohort:(id)a5 config:(id)a6 error:(id *)a7
{
  v80[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v13 = (__CFString *)a5;
  id v14 = a6;
  if (!+[GEOPlatform isRunningInGeod]) {
    goto LABEL_43;
  }
  if (![v12 requestMode])
  {
    if ([v14 supportsOffline])
    {
      if (+[GEOOfflineStateManager isOfflineAvailable])
      {
        v15 = +[GEOOfflineStateManager shared];
        int v16 = [v15 cohortId:v13 shouldAttemptFailoverForRequest:a4];

        if (v16)
        {
          v17 = GEOGetServiceRequesterLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            GEODataRequestKindAsString(*(void *)&a4);
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v71 = v18;
            _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_INFO, "Opting request %@ into ONLINE_OFFLINE_FAILOVER to check connectivity", buf, 0xCu);
          }
          [v12 setRequestMode:1];
        }
      }
    }
  }
  if ([(__CFString *)v13 length]
    && (_getValue(GeoOfflineConfig_CohortAllowList, (uint64_t)off_1E9115618, 1, 0, 0, 0),
        v19 = objc_claimAutoreleasedReturnValue(),
        char v20 = [v19 containsObject:v13],
        v19,
        (v20 & 1) != 0))
  {
    BOOL v21 = +[GEOOfflineStateManager isOfflineAvailable];
    unsigned int v22 = [v12 requestMode];
    if (v21)
    {
      if (v22 >= 5) {
        unsigned int v23 = 0;
      }
      else {
        unsigned int v23 = v22;
      }
      switch(v23)
      {
        case 0u:
          v24 = [(GEOServiceRequester *)self offlineStateManager];
          unsigned int v25 = [v24 activeStateForCohortId:v13];

          if (v25 < 2u) {
            goto LABEL_43;
          }
          if (v25 == 2)
          {
            v26 = [(GEOServiceRequester *)self _offlineOperationClassForState:v25];
            if ([v14 supportsOffline] && v26)
            {
              v76 = v26;
              v27 = (void *)MEMORY[0x1E4F1C978];
              v28 = &v76;
              goto LABEL_64;
            }
            v65 = (void *)MEMORY[0x1E4F28C58];
            v77 = @"GEODataRequestKind";
            v35 = GEODataRequestKindAsString(*(void *)&a4);
            v78 = v35;
            v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
            *a7 = [v65 GEOErrorWithCode:-6 reason:@"Request type is not supported offline" userInfo:v66];

            goto LABEL_29;
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v71) = v25;
            goto LABEL_77;
          }
          goto LABEL_43;
        case 1u:
          v47 = [(GEOServiceRequester *)self offlineStateManager];
          unsigned int v48 = [v47 activeStateForCohortId:v13];

          v49 = [(GEOServiceRequester *)self _offlineOperationClassForState:v48];
          if ([v14 supportsOffline] && v49)
          {
            v50 = [(GEOServiceRequester *)self networkOperationClasses];
            v36 = [v50 arrayByAddingObject:v49];

            goto LABEL_45;
          }
          v30 = GEOGetServiceRequesterLog();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            goto LABEL_42;
          }
          GEODataRequestKindAsString(*(void *)&a4);
          v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v71 = v39;
          v43 = "Request %@ does not support offline and/or no offline operation types are available, return online operations only";
          goto LABEL_41;
        case 2u:
          v51 = [(GEOServiceRequester *)self offlineStateManager];
          unsigned int v52 = [v51 activeStateForCohortId:v13];

          if (v52 < 2u) {
            goto LABEL_43;
          }
          if (v52 == 2)
          {
            v53 = GEOGetServiceRequesterLog();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              v54 = GEOOfflineStateAsString(v52);
              *(_DWORD *)buf = 138543874;
              v71 = v13;
              __int16 v72 = 2114;
              v73 = v54;
              __int16 v74 = 2114;
              v75 = @"ONLINE_FAST_FAIL";
              _os_log_impl(&dword_188D96000, v53, OS_LOG_TYPE_ERROR, "Cohort \"%{public}@\" mode is %{public}@ but request explicitly set to %{public}@, failing", buf, 0x20u);
            }
            v40 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v42 = -9;
            v41 = 0;
            goto LABEL_60;
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v71) = v52;
LABEL_77:
            _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
          }
          goto LABEL_43;
        case 3u:
          goto LABEL_43;
        case 4u:
          v55 = [(GEOServiceRequester *)self offlineStateManager];
          unsigned int v56 = [v55 activeStateForCohortId:v13];

          v57 = [(GEOServiceRequester *)self _offlineOperationClassForState:v56];
          if (![v14 supportsOffline] || !v57)
          {
            v60 = (void *)MEMORY[0x1E4F28C58];
            v67 = @"GEODataRequestKind";
            v61 = GEODataRequestKindAsString(*(void *)&a4);
            v68 = v61;
            v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
            *a7 = [v60 GEOErrorWithCode:-6 reason:@"Request type is not supported offline" userInfo:v62];

            v36 = (void *)MEMORY[0x1E4F1CBF0];
            goto LABEL_45;
          }
          v69 = v57;
          v27 = (void *)MEMORY[0x1E4F1C978];
          v28 = &v69;
LABEL_64:
          uint64_t v44 = [v27 arrayWithObjects:v28 count:1];
          break;
        default:
          v30 = GEOGetServiceRequesterLog();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            goto LABEL_42;
          }
          uint64_t v46 = [v12 requestMode];
          if (v46 >= 5)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v46);
            v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v39 = off_1E53F5980[(int)v46];
          }
          *(_DWORD *)buf = 138412290;
          v71 = v39;
          v43 = "Unsupported request mode %@, returning online operations only";
          goto LABEL_41;
      }
      goto LABEL_44;
    }
    if (v22 < 4)
    {
      v30 = GEOGetServiceRequesterLog();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_42;
      }
      *(_WORD *)buf = 0;
      v31 = "Returning online-only operations, offline is not available";
      v32 = v30;
      uint32_t v33 = 2;
      goto LABEL_25;
    }
    if (v22 != 4)
    {
      v30 = GEOGetServiceRequesterLog();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_42;
      }
      uint64_t v59 = [v12 requestMode];
      if (v59 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v59);
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = off_1E53F5980[(int)v59];
      }
      *(_DWORD *)buf = 138412290;
      v71 = v39;
      v43 = "Invalid request mode %@, returning online-only operations";
      goto LABEL_41;
    }
    v40 = (void *)MEMORY[0x1E4F28C58];
    v41 = @"Offline Maps is not available";
    uint64_t v42 = -6;
LABEL_60:
    [v40 GEOErrorWithCode:v42 reason:v41];
    v36 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned int v29 = [v12 requestMode];
    if (v29 < 4)
    {
      v30 = GEOGetServiceRequesterLog();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
LABEL_42:

LABEL_43:
        uint64_t v44 = [(GEOServiceRequester *)self networkOperationClasses];
LABEL_44:
        v36 = (void *)v44;
        goto LABEL_45;
      }
      *(_DWORD *)buf = 138412290;
      v71 = v13;
      v31 = "Returning online-only operations, unsupported offline cohort \"%@\"";
      v32 = v30;
      uint32_t v33 = 12;
LABEL_25:
      _os_log_impl(&dword_188D96000, v32, OS_LOG_TYPE_DEBUG, v31, buf, v33);
      goto LABEL_42;
    }
    if (v29 != 4)
    {
      v30 = GEOGetServiceRequesterLog();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_42;
      }
      uint64_t v38 = [v12 requestMode];
      if (v38 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v38);
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = off_1E53F5980[(int)v38];
      }
      *(_DWORD *)buf = 138412290;
      v71 = v39;
      v43 = "Invalid request mode %@, returning online-only operations";
LABEL_41:
      _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_ERROR, v43, buf, 0xCu);

      goto LABEL_42;
    }
    v34 = (void *)MEMORY[0x1E4F28C58];
    v79 = @"GEOCohortId";
    v80[0] = v13;
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:&v79 count:1];
    *a7 = [v34 GEOErrorWithCode:-6 reason:@"Unsupported offline cohort" userInfo:v35];
LABEL_29:

    v36 = 0;
  }
LABEL_45:

  return v36;
}

- (NSArray)networkOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_networkOperationClasses count])
  {
    v3 = self->_networkOperationClasses;
  }
  else
  {
    v5[0] = objc_opt_class();
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }

  return v3;
}

void __129__GEOServiceRequester__startWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v5 = (id *)(a1 + 48);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v10 = WeakRetained;
  if (v6) {
    id v9 = 0;
  }
  else {
    id v9 = v7;
  }
  [WeakRetained _request:*(void *)(a1 + 32) completed:v9 error:v6 completion:*(void *)(a1 + 40)];
}

- (void)_request:(id)a3 completed:(id)a4 error:(id)a5 completion:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, id, id))a6;
  id v14 = [(GEOServiceRequester *)self _takeCurrentOperationForRequest:v10];
  v15 = [(GEOServiceRequester *)self _currentOperationForRequest:v10];
  if (!v15)
  {
    v17 = GEOGetServiceRequesterLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v22) = 0;
      v19 = "No more operations to try";
      char v20 = v17;
      uint32_t v21 = 2;
LABEL_10:
      _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_DEBUG, v19, (uint8_t *)&v22, v21);
    }
LABEL_11:

    [(GEOServiceRequester *)self _removeAllOperationsForRequest:v10];
    v13[2](v13, v11, v12);
    goto LABEL_12;
  }
  BOOL v16 = [(GEOServiceRequester *)self _shouldTryNextOperation:v15 forError:v12 fromOperation:v14];
  v17 = GEOGetServiceRequesterLog();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (!v16)
  {
    if (v18)
    {
      int v22 = 138412290;
      id v23 = v12;
      v19 = "NOT trying next operation. Error was: %@";
      char v20 = v17;
      uint32_t v21 = 12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v18)
  {
    int v22 = 138412290;
    id v23 = v12;
    _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_DEBUG, "Trying next operation due to error: %@", (uint8_t *)&v22, 0xCu);
  }

  [v15 start];
LABEL_12:
}

- (id)_takeCurrentOperationForRequest:(id)a3
{
  v4 = [(GEOServiceRequester *)self _keyForRequest:a3];
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    v5 = [(NSMapTable *)self->_pendingRequests objectForKey:v4];
    id v6 = [v5 firstObject];
    [v5 removeObjectAtIndex:0];
    if (![v5 count]) {
      [(NSMapTable *)self->_pendingRequests removeObjectForKey:v4];
    }
    os_unfair_lock_unlock(&self->_pendingRequestsLock);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: requestKey != ((void *)0)", v8, 2u);
    }
    id v6 = 0;
  }

  return v6;
}

- (void)_removeAllOperationsForRequest:(id)a3
{
  v4 = [(GEOServiceRequester *)self _keyForRequest:a3];
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    [(NSMapTable *)self->_pendingRequests removeObjectForKey:v4];
    os_unfair_lock_unlock(&self->_pendingRequestsLock);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: requestKey != ((void *)0)", v5, 2u);
  }
}

- (void)_startWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 completionHandler:(id)a9
{
}

- (void)_startWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 willSendRequestHandler:(id)a9 completionHandler:(id)a10
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v44 = a7;
  id v43 = a9;
  id v46 = a10;
  v47 = v14;
  unsigned int v48 = v17;
  v49 = v15;
  uint64_t v18 = [v17 dataRequestKindForRequest:v14 traits:v15];
  v45 = v16;
  v19 = [v16 offlineCohortId];
  id v63 = 0;
  v40 = [(GEOServiceRequester *)self _operationClassForTraits:v15 requestKind:v18 forCohort:v19 config:v17 error:&v63];
  id v20 = v63;

  uint64_t v21 = [v40 count];
  int v22 = GEOGetServiceRequesterLog();
  id v23 = v22;
  if (v21)
  {
    BOOL v24 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);

    if (v24)
    {
      unsigned int v25 = objc_msgSend(v40, "_geo_map:", &__block_literal_global_194);
      v26 = GEOGetServiceRequesterLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        GEODataRequestKindAsString(v18);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = [v15 requestMode];
        if (v28 >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v28);
          unsigned int v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          unsigned int v29 = off_1E53F5980[(int)v28];
        }
        v30 = [v25 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412802;
        id v66 = v27;
        __int16 v67 = 2112;
        v68 = v29;
        __int16 v69 = 2112;
        v70 = v30;
        _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_DEBUG, "Request %@ mode was %@, will use operations: %@", buf, 0x20u);
      }
    }

    objc_initWeak((id *)buf, self);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id obj = v40;
    uint64_t v31 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v60 != v32) {
            objc_enumerationMutation(obj);
          }
          id v34 = objc_alloc(*(Class *)(*((void *)&v59 + 1) + 8 * i));
          v57[0] = MEMORY[0x1E4F143A8];
          v57[1] = 3221225472;
          v57[2] = __129__GEOServiceRequester__startWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_completionHandler___block_invoke_67;
          v57[3] = &unk_1E53F5938;
          objc_copyWeak(&v58, (id *)buf);
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __129__GEOServiceRequester__startWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_completionHandler___block_invoke_2;
          v53[3] = &unk_1E53F5960;
          objc_copyWeak(&v56, (id *)buf);
          id v35 = v47;
          id v54 = v35;
          id v55 = v46;
          v36 = (void *)[v34 initWithRequest:v35 traits:v49 auditToken:v45 config:v48 throttleToken:v44 options:a8 willSendRequestHandler:v43 validationHandler:v57 completionHandler:v53];
          [(GEOServiceRequester *)self _addOperation:v36 forRequest:v35];

          objc_destroyWeak(&v56);
          objc_destroyWeak(&v58);
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v31);
    }

    v37 = [(GEOServiceRequester *)self _currentOperationForRequest:v47];
    uint64_t v38 = v37;
    if (v37)
    {
      [v37 start];
    }
    else
    {
      global_queue = geo_get_global_queue();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __129__GEOServiceRequester__startWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_completionHandler___block_invoke_3;
      block[3] = &unk_1E53DA028;
      id v52 = v46;
      dispatch_async(global_queue, block);
    }
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v66 = v20;
      _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_ERROR, "No operations created: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, id))v46 + 2))(v46, 0, v20);
  }
}

- (void)_addOperation:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    __int16 v16 = 0;
    id v11 = MEMORY[0x1E4F14500];
    id v12 = "Assertion failed: operation != ((void *)0)";
    v13 = (uint8_t *)&v16;
LABEL_13:
    _os_log_fault_impl(&dword_188D96000, v11, OS_LOG_TYPE_FAULT, v12, v13, 2u);
    goto LABEL_8;
  }
  if (!v7)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    id v11 = MEMORY[0x1E4F14500];
    id v12 = "Assertion failed: request != ((void *)0)";
    v13 = buf;
    goto LABEL_13;
  }
  id v9 = [(GEOServiceRequester *)self _keyForRequest:v7];
  if (v9)
  {
    os_unfair_lock_lock_with_options();
    id v10 = [(NSMapTable *)self->_pendingRequests objectForKey:v9];
    if (!v10)
    {
      id v10 = [MEMORY[0x1E4F1CA48] array];
      [(NSMapTable *)self->_pendingRequests setObject:v10 forKey:v9];
    }
    [v10 addObject:v6];
    os_unfair_lock_unlock(&self->_pendingRequestsLock);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: requestKey != ((void *)0)", v14, 2u);
  }

LABEL_8:
}

- (id)_currentOperationForRequest:(id)a3
{
  v4 = [(GEOServiceRequester *)self _keyForRequest:a3];
  if (v4)
  {
    p_pendingRequestsLock = &self->_pendingRequestsLock;
    os_unfair_lock_lock_with_options();
    id v6 = [(NSMapTable *)self->_pendingRequests objectForKey:v4];
    id v7 = [v6 firstObject];
    os_unfair_lock_unlock(p_pendingRequestsLock);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: requestKey != ((void *)0)", v9, 2u);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)_keyForRequest:(id)a3
{
  return a3;
}

- (void)_cancelRequest:(id)a3
{
  id v3 = [(GEOServiceRequester *)self _currentOperationForRequest:a3];
  [v3 cancel];
}

id __129__GEOServiceRequester__startWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_completionHandler___block_invoke_67(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained _validateResponse:v3];

  return v5;
}

- (GEOServiceRequester)init
{
  v7.receiver = self;
  v7.super_class = (Class)GEOServiceRequester;
  v2 = [(GEOServiceRequester *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:5];
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = (NSMapTable *)v3;

    v2->_pendingRequestsLock._os_unfair_lock_opaque = 0;
    v5 = v2;
  }

  return v2;
}

NSString *__129__GEOServiceRequester__startWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_completionHandler___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

void __129__GEOServiceRequester__startWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"no operations to run"];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (BOOL)_shouldTryNextOperation:(id)a3 forError:(id)a4 fromOperation:(id)a5
{
  return objc_msgSend(a4, "_geo_isNetworkError", a3);
}

- (id)_validateResponse:(id)a3
{
  return 0;
}

- (void)setNetworkOperationClasses:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  networkOperationClasses = self->_networkOperationClasses;
  self->_networkOperationClasses = v4;
}

- (Class)offlineOperationClass
{
  Class offlineOperationClass = self->_offlineOperationClass;
  if (offlineOperationClass)
  {
    uint64_t v3 = offlineOperationClass;
  }
  else
  {
    objc_opt_class();
    uint64_t v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)setOfflineOperationClass:(Class)a3
{
  self->_Class offlineOperationClass = a3;
}

- (GEOOfflineStateManager)offlineStateManager
{
  stateManagerOverride = self->_stateManagerOverride;
  if (stateManagerOverride)
  {
    uint64_t v3 = stateManagerOverride;
  }
  else
  {
    uint64_t v3 = +[GEOOfflineStateManager shared];
  }

  return v3;
}

- (void)setOfflineStateManager:(id)a3
{
}

- (Class)companionOfflineOperationClass
{
  return self->_companionOfflineOperationClass;
}

- (void)setCompanionOfflineOperationClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionOfflineOperationClass, 0);
  objc_storeStrong((id *)&self->_stateManagerOverride, 0);
  objc_storeStrong((id *)&self->_networkOperationClasses, 0);

  objc_storeStrong((id *)&self->_pendingRequests, 0);
}

@end