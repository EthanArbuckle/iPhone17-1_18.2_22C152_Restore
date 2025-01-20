@interface CKDPCSCacheShareFetchOperation
- (BOOL)_decryptPCS;
- (BOOL)_fetchPCSDataFromDatabase;
- (BOOL)_fetchPCSDataFromServer;
- (BOOL)_savePCSDataToCache;
- (BOOL)hasAllPCSData;
- (id)itemTypeName;
- (void)_handlePCSDataFetched:(id)a3 withError:(id)a4;
@end

@implementation CKDPCSCacheShareFetchOperation

- (id)itemTypeName
{
  return @"share";
}

- (BOOL)hasAllPCSData
{
  v3 = objc_msgSend_sharePCSData(self, a2, v2);
  BOOL v6 = objc_msgSend_pcs(v3, v4, v5) != 0;

  return v6;
}

- (void)_handlePCSDataFetched:(id)a3 withError:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (__CFString *)a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v10 = (id *)MEMORY[0x1E4F1A500];
  v11 = (id)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v21 = objc_msgSend_operationID(v8, v12, v13);
    uint64_t v24 = objc_msgSend_pcsKeyID(v6, v22, v23);
    v25 = (void *)v24;
    v26 = @" and error ";
    *(_DWORD *)v38 = 138544130;
    v27 = &stru_1F2044F30;
    *(void *)&v38[4] = v21;
    *(_WORD *)&v38[12] = 2114;
    if (v7) {
      v27 = v7;
    }
    else {
      v26 = &stru_1F2044F30;
    }
    *(void *)&v38[14] = v24;
    __int16 v39 = 2114;
    v40 = v26;
    __int16 v41 = 2112;
    v42 = v27;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Share PCS fetch operation %{public}@ received PCS data (%{public}@)%{public}@%@", v38, 0x2Au);
  }
  if (objc_msgSend_didFetchData(v8, v14, v15))
  {
    if (*v9 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v17 = *v10;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v28 = objc_msgSend_operationID(v8, v18, v19);
      v31 = objc_msgSend_sharePCSData(v8, v29, v30);
      v34 = objc_msgSend_pcsKeyID(v31, v32, v33);
      objc_msgSend_pcsKeyID(v6, v35, v36);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v38 = 138544130;
      *(void *)&v38[4] = v28;
      *(_WORD *)&v38[12] = 2112;
      *(void *)&v38[14] = v34;
      __int16 v39 = 2112;
      v40 = v37;
      __int16 v41 = 2112;
      v42 = v7;
      _os_log_debug_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_DEBUG, "Share PCS fetch operation %{public}@ already has PCS data %@. Ignoring the fetch callback with %@/%@", v38, 0x2Au);
    }
  }
  else
  {
    if (v6)
    {
      objc_msgSend_setSharePCSData_(v8, v16, (uint64_t)v6);
      objc_msgSend_setDidFetchData_(v8, v20, 1);
    }
    objc_msgSend_setFetchError_(v8, v16, (uint64_t)v7, *(_OWORD *)v38);
  }
  objc_sync_exit(v8);
}

- (BOOL)_fetchPCSDataFromDatabase
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v5 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    v11 = v5;
    v14 = objc_msgSend_shareID(self, v12, v13);
    *(_DWORD *)buf = 138412290;
    v17 = v14;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Fetching PCS data for share %@ from the database", buf, 0xCu);
  }
  v8 = objc_msgSend_cache(self, v6, v7);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1C4FB08B0;
  v15[3] = &unk_1E64F0970;
  v15[4] = self;
  objc_msgSend_getSQLCache_(v8, v9, (uint64_t)v15);

  return 1;
}

- (BOOL)_fetchPCSDataFromServer
{
  v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  uint64_t v7 = objc_msgSend_container(self, v5, v6);
  v10 = objc_msgSend_fetchAggregator(v7, v8, v9);
  uint64_t v13 = objc_msgSend_shareID(self, v11, v12);
  v16 = objc_msgSend_parentOperation(self, v14, v15);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1C4FB103C;
  v19[3] = &unk_1E64F7EC0;
  v19[4] = self;
  objc_msgSend_requestFetchOfShareWithID_forOperation_withCompletionHandler_(v10, v17, (uint64_t)v13, v16, v19);

  return 1;
}

- (BOOL)_decryptPCS
{
  return 1;
}

- (BOOL)_savePCSDataToCache
{
  objc_initWeak(&location, self);
  if (objc_msgSend_wasFetchedFromCache(self, v3, v4))
  {
    uint64_t v7 = objc_msgSend_stateTransitionGroup(self, v5, v6);
    dispatch_group_enter(v7);

    v10 = objc_msgSend_cache(self, v8, v9);
    uint64_t v13 = objc_msgSend_sharePCSData(self, v11, v12);
    v16 = objc_msgSend_shareID(self, v14, v15);
    uint64_t v19 = objc_msgSend_databaseScope(self, v17, v18);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = sub_1C4FB1460;
    v34[3] = &unk_1E64F22C0;
    v20 = &v35;
    objc_copyWeak(&v35, &location);
    objc_msgSend_updateMemoryCacheWithSharePCSData_forShareWithID_databaseScope_withCompletionHandler_(v10, v21, (uint64_t)v13, v16, v19, v34);
  }
  else
  {
    v22 = objc_msgSend_stateTransitionGroup(self, v5, v6);
    dispatch_group_enter(v22);

    v10 = objc_msgSend_cache(self, v23, v24);
    uint64_t v13 = objc_msgSend_sharePCSData(self, v25, v26);
    v16 = objc_msgSend_shareID(self, v27, v28);
    uint64_t v31 = objc_msgSend_databaseScope(self, v29, v30);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = sub_1C4FB1408;
    v36[3] = &unk_1E64F22C0;
    v20 = &v37;
    objc_copyWeak(&v37, &location);
    objc_msgSend__setPCSData_forFetchedShareID_withScope_withCompletionHandler_(v10, v32, (uint64_t)v13, v16, v31, v36);
  }

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  return 1;
}

@end