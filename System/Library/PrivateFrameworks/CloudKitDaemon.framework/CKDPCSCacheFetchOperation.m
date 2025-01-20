@interface CKDPCSCacheFetchOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)_createAdditionalPCS;
- (BOOL)_decryptPCS;
- (BOOL)_fetchDependentPCS;
- (BOOL)_fetchPCSDataFromDatabase;
- (BOOL)_fetchPCSDataFromServer;
- (BOOL)_savePCSDataToCache;
- (BOOL)_saveUpdatedPCSToServer;
- (BOOL)canBeUsedForOperation:(id)a3 withOptions:(unint64_t)a4;
- (BOOL)didFetchData;
- (BOOL)hasAllPCSData;
- (BOOL)isPCSDataInvalidated;
- (BOOL)makeStateTransition;
- (BOOL)needsAdditionalPCSCreation;
- (BOOL)shouldRetry;
- (BOOL)wasFetchedFromCache;
- (CKDPCSCache)cache;
- (CKDPCSCacheFetchOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKDPCSData)pcsData;
- (CKDRecordPCSData)parentPCSData;
- (CKSQLiteItem)itemID;
- (NSError)dependentPCSFetchError;
- (NSError)fetchError;
- (NSString)itemTypeName;
- (OS_dispatch_group)fetchGroup;
- (int)numRetries;
- (unint64_t)fetchOptions;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_willRetryFetch;
- (void)main;
- (void)setCache:(id)a3;
- (void)setDependentPCSFetchError:(id)a3;
- (void)setDidFetchData:(BOOL)a3;
- (void)setFetchError:(id)a3;
- (void)setFetchOptions:(unint64_t)a3;
- (void)setItemID:(id)a3;
- (void)setNumRetries:(int)a3;
- (void)setParentPCSData:(id)a3;
- (void)setPcsData:(id)a3;
- (void)setPcsDataInvalidated:(BOOL)a3;
- (void)setShouldRetry:(BOOL)a3;
- (void)setWasFetchedFromCache:(BOOL)a3;
@end

@implementation CKDPCSCacheFetchOperation

- (CKDPCSCacheFetchOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKDPCSCacheFetchOperation;
  id v9 = [(CKDDatabaseOperation *)&v21 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_itemID(v6, v7, v8);
    v11 = (void *)*((void *)v9 + 60);
    *((void *)v9 + 60) = v10;

    uint64_t v14 = objc_msgSend_cache(v6, v12, v13);
    v15 = (void *)*((void *)v9 + 59);
    *((void *)v9 + 59) = v14;

    *((void *)v9 + 61) = objc_msgSend_options(v6, v16, v17);
    dispatch_group_t v18 = dispatch_group_create();
    v19 = (void *)*((void *)v9 + 58);
    *((void *)v9 + 58) = v18;

    dispatch_group_enter(*((dispatch_group_t *)v9 + 58));
  }

  return (CKDPCSCacheFetchOperation *)v9;
}

- (BOOL)canBeUsedForOperation:(id)a3 withOptions:(unint64_t)a4
{
  int v4 = a4;
  id v6 = a3;
  if (!objc_msgSend_isNetworkingBehaviorEquivalentForOperation_(self, v7, (uint64_t)v6)) {
    goto LABEL_4;
  }
  uint64_t v10 = objc_msgSend_databaseScope(v6, v8, v9);
  if (v10 != objc_msgSend_databaseScope(self, v11, v12)) {
    goto LABEL_4;
  }
  v15 = objc_msgSend_container(v6, v13, v14);
  dispatch_group_t v18 = objc_msgSend_container(self, v16, v17);

  if (v15 != v18 || (v4 & 4) != 0 && (objc_msgSend_fetchOptions(self, v19, v20) & 4) == 0) {
    goto LABEL_4;
  }
  if (((v4 & 8) == 0 || (objc_msgSend_fetchOptions(self, v19, v20) & 8) != 0)
    && ((char Options = objc_msgSend_fetchOptions(self, v19, v20), (v4 & 2) != 0) || (Options & 2) == 0)
    && ((char v26 = objc_msgSend_fetchOptions(self, v24, v25), (v4 & 0x10) != 0) || (v26 & 0x10) == 0))
  {
    BOOL v21 = ((objc_msgSend_fetchOptions(self, v27, v28) ^ v4) & 0x1C00) == 0;
  }
  else
  {
LABEL_4:
    BOOL v21 = 0;
  }

  return v21;
}

- (BOOL)makeStateTransition
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend_hasAllPCSData(self, a2, v2))
  {
LABEL_4:
    switch(objc_msgSend_state(self, v4, v5))
    {
      case 1:
        goto LABEL_5;
      case 2:
        v15 = objc_msgSend_pcsData(self, v7, v8);

        dispatch_group_t v18 = self;
        if (v15) {
          goto LABEL_41;
        }
        if ((objc_msgSend_fetchOptions(self, v16, v17) & 2) == 0)
        {
          objc_msgSend_setState_(self, v19, 3);
          LOBYTE(v109) = MEMORY[0x1F4181798](self, sel__fetchPCSDataFromServer, v20);
          return v109;
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v75 = (void *)*MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
        {
          v102 = v75;
          v105 = objc_msgSend_itemTypeName(self, v103, v104);
          v108 = objc_msgSend_itemID(self, v106, v107);
          *(_DWORD *)buf = 138543618;
          v112 = v105;
          __int16 v113 = 2112;
          v114 = v108;
          _os_log_debug_impl(&dword_1C4CFF000, v102, OS_LOG_TYPE_DEBUG, "Not fetching PCS data for %{public}@ %@ from the network because a local only fetch was requested", buf, 0x16u);
        }
        v78 = objc_msgSend_fetchError(self, v76, v77);
        v81 = objc_msgSend_domain(v78, v79, v80);
        uint64_t v82 = *MEMORY[0x1E4F19DD8];
        if (objc_msgSend_isEqualToString_(v81, v83, *MEMORY[0x1E4F19DD8]))
        {
          v86 = objc_msgSend_fetchError(self, v84, v85);
          uint64_t v89 = objc_msgSend_code(v86, v87, v88);

          if (v89 == 5010) {
            goto LABEL_61;
          }
        }
        else
        {
        }
        v36 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v90, v82, 5007, @"PCS fetch requested local cache only");
        objc_msgSend_setFetchError_(self, v101, (uint64_t)v36);
        goto LABEL_60;
      case 3:
        BOOL v21 = objc_msgSend_fetchError(self, v7, v8);

        dispatch_group_t v18 = self;
        if (v21)
        {
          v23 = objc_msgSend_fetchError(self, v16, v22);

          if (!v23)
          {
            char v26 = (void *)MEMORY[0x1E4F1A280];
            uint64_t v27 = *MEMORY[0x1E4F19DD8];
            uint64_t v28 = objc_msgSend_itemTypeName(self, v24, v25);
            v31 = objc_msgSend_itemID(self, v29, v30);
            v33 = objc_msgSend_errorWithDomain_code_format_(v26, v32, v27, 2003, @"Couldn't get PCS data from the server for %@ %@", v28, v31);
            objc_msgSend_setFetchError_(self, v34, (uint64_t)v33);
          }
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v35 = (void *)*MEMORY[0x1E4F1A528];
          int v109 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG);
          if (v109)
          {
            v36 = v35;
            v39 = objc_msgSend_itemTypeName(self, v37, v38);
            v42 = objc_msgSend_itemID(self, v40, v41);
            v45 = objc_msgSend_fetchError(self, v43, v44);
            *(_DWORD *)buf = 138543874;
            v112 = v39;
            __int16 v113 = 2112;
            v114 = v42;
            __int16 v115 = 2112;
            v116 = v45;
            _os_log_debug_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_DEBUG, "Failed to fetch PCS data from the server for %{public}@ %@: %@", buf, 0x20u);

LABEL_60:
LABEL_61:
            LOBYTE(v109) = 0;
          }
        }
        else
        {
LABEL_41:
          objc_msgSend_setState_(v18, v16, 4);
          LOBYTE(v109) = MEMORY[0x1F4181798](self, sel__createAdditionalPCS, v61);
        }
        return v109;
      case 4:
        objc_msgSend_setState_(self, v7, 5);
        LOBYTE(v109) = MEMORY[0x1F4181798](self, sel__fetchDependentPCS, v46);
        return v109;
      case 5:
        objc_msgSend_setState_(self, v7, 6);
        LOBYTE(v109) = MEMORY[0x1F4181798](self, sel__decryptPCS, v47);
        return v109;
      case 6:
        v48 = objc_msgSend_fetchError(self, v7, v8);

        if (!v48)
        {
          objc_msgSend_setState_(self, v49, 7);
          LOBYTE(v109) = MEMORY[0x1F4181798](self, sel__saveUpdatedPCSToServer, v74);
          return v109;
        }
        if (objc_msgSend_shouldRetry(self, v49, v50))
        {
          int v53 = objc_msgSend_numRetries(self, v51, v52);
          v56 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v54, v55);
          int v59 = objc_msgSend_PCSRetryCount(v56, v57, v58);

          if (v53 < v59)
          {
            objc_msgSend__willRetryFetch(self, v51, v52);
LABEL_5:
            objc_msgSend_setState_(self, v7, 2);
            LOBYTE(v109) = MEMORY[0x1F4181798](self, sel__fetchPCSDataFromDatabase, v9);
            return v109;
          }
        }
        v62 = objc_msgSend_fetchError(self, v51, v52);
        objc_msgSend_setError_(self, v63, (uint64_t)v62);

        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v64 = (void *)*MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v13 = v64;
          v67 = objc_msgSend_itemTypeName(self, v65, v66);
          v70 = objc_msgSend_operationID(self, v68, v69);
          v73 = objc_msgSend_error(self, v71, v72);
          *(_DWORD *)buf = 138543874;
          v112 = v67;
          __int16 v113 = 2114;
          v114 = v70;
          __int16 v115 = 2112;
          v116 = v73;
          _os_log_debug_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ PCS fetch operation %{public}@ has failed too many times. Giving up with error %@", buf, 0x20u);

          goto LABEL_13;
        }
        break;
      case 7:
        objc_msgSend_setState_(self, v7, 8);
        LOBYTE(v109) = MEMORY[0x1F4181798](self, sel__savePCSDataToCache, v60);
        return v109;
      case 8:
        goto LABEL_12;
      default:
        goto LABEL_14;
    }
    goto LABEL_14;
  }
  if ((unint64_t)objc_msgSend_state(self, v4, v5) <= 7)
  {
    objc_msgSend_setState_(self, v6, 7);
    goto LABEL_4;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v10 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    v91 = v10;
    v94 = objc_msgSend_operationID(self, v92, v93);
    v97 = objc_msgSend_itemTypeName(self, v95, v96);
    v100 = objc_msgSend_itemID(self, v98, v99);
    *(_DWORD *)buf = 138543874;
    v112 = v94;
    __int16 v113 = 2114;
    v114 = v97;
    __int16 v115 = 2112;
    v116 = v100;
    _os_log_debug_impl(&dword_1C4CFF000, v91, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has a decrypted PCS blob for %{public}@ %@.", buf, 0x20u);
  }
LABEL_12:
  objc_msgSend_setState_(self, v7, 0xFFFFFFFFLL);
  uint64_t v13 = objc_msgSend_error(self, v11, v12);
  objc_msgSend_finishWithError_(self, v14, (uint64_t)v13);
LABEL_13:

LABEL_14:
  LOBYTE(v109) = 1;
  return v109;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 7)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDPCSCacheFetchOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F78D0[a3 - 2];
  }
  return v3;
}

- (NSString)itemTypeName
{
  return (NSString *)@"item";
}

- (BOOL)hasAllPCSData
{
  v3 = objc_msgSend_pcsData(self, a2, v2);
  BOOL v6 = objc_msgSend_pcs(v3, v4, v5) != 0;

  return v6;
}

- (BOOL)needsAdditionalPCSCreation
{
  return 0;
}

- (BOOL)_fetchPCSDataFromDatabase
{
  return 1;
}

- (BOOL)_fetchPCSDataFromServer
{
  return 1;
}

- (BOOL)_createAdditionalPCS
{
  return 1;
}

- (BOOL)_fetchDependentPCS
{
  return 1;
}

- (BOOL)_decryptPCS
{
  return 1;
}

- (BOOL)_saveUpdatedPCSToServer
{
  return 1;
}

- (BOOL)_savePCSDataToCache
{
  return 1;
}

- (void)_willRetryFetch
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v4 = objc_msgSend_numRetries(self, a2, v2);
  objc_msgSend_setNumRetries_(self, v5, (v4 + 1));
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  BOOL v6 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = v6;
    v16 = objc_msgSend_operationID(self, v14, v15);
    int v19 = objc_msgSend_numRetries(self, v17, v18);
    uint64_t v22 = objc_msgSend_fetchError(self, v20, v21);
    uint64_t v25 = objc_msgSend_dependentPCSFetchError(self, v23, v24);
    int v26 = 138544130;
    uint64_t v27 = v16;
    __int16 v28 = 1024;
    int v29 = v19;
    __int16 v30 = 2112;
    v31 = v22;
    __int16 v32 = 2112;
    v33 = v25;
    _os_log_debug_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEBUG, "Retrying PCS fetch operation %{public}@ after failure %d with error %@, dependent PCS fetch error %@", (uint8_t *)&v26, 0x26u);
  }
  objc_msgSend_setFetchError_(self, v7, 0);
  objc_msgSend_setDependentPCSFetchError_(self, v8, 0);
  objc_msgSend_setPcsData_(self, v9, 0);
  objc_msgSend_setDidFetchData_(self, v10, 0);
  objc_msgSend_setWasFetchedFromCache_(self, v11, 0);
  objc_msgSend_setShouldRetry_(self, v12, 0);
}

- (void)main
{
  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
  objc_msgSend_makeStateTransition_(self, v4, 0);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_hash(self, v5, v6);
  kdebug_trace();
  uint64_t v9 = objc_msgSend_error(self, v7, v8);

  if (!v9)
  {
    uint64_t v12 = objc_msgSend_fetchError(self, v10, v11);
    objc_msgSend_setError_(self, v13, (uint64_t)v12);
  }
  uint64_t v14 = objc_msgSend_error(self, v10, v11);

  if (v14) {
    objc_msgSend_setPcsData_(self, v15, 0);
  }
  v19.receiver = self;
  v19.super_class = (Class)CKDPCSCacheFetchOperation;
  [(CKDOperation *)&v19 _finishOnCallbackQueueWithError:v4];
  uint64_t v18 = objc_msgSend_fetchGroup(self, v16, v17);
  dispatch_group_leave(v18);
}

- (OS_dispatch_group)fetchGroup
{
  return self->_fetchGroup;
}

- (CKDPCSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (CKSQLiteItem)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (unint64_t)fetchOptions
{
  return self->_fetchOptions;
}

- (void)setFetchOptions:(unint64_t)a3
{
  self->_fetchchar Options = a3;
}

- (CKDPCSData)pcsData
{
  return self->_pcsData;
}

- (void)setPcsData:(id)a3
{
}

- (BOOL)didFetchData
{
  return self->_didFetchData;
}

- (void)setDidFetchData:(BOOL)a3
{
  self->_didFetchData = a3;
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (void)setFetchError:(id)a3
{
}

- (NSError)dependentPCSFetchError
{
  return self->_dependentPCSFetchError;
}

- (void)setDependentPCSFetchError:(id)a3
{
}

- (BOOL)wasFetchedFromCache
{
  return self->_wasFetchedFromCache;
}

- (void)setWasFetchedFromCache:(BOOL)a3
{
  self->_wasFetchedFromCache = a3;
}

- (int)numRetries
{
  return self->_numRetries;
}

- (void)setNumRetries:(int)a3
{
  self->_numRetries = a3;
}

- (BOOL)shouldRetry
{
  return self->_shouldRetry;
}

- (void)setShouldRetry:(BOOL)a3
{
  self->_shouldRetry = a3;
}

- (CKDRecordPCSData)parentPCSData
{
  return self->_parentPCSData;
}

- (void)setParentPCSData:(id)a3
{
}

- (BOOL)isPCSDataInvalidated
{
  return self->_pcsDataInvalidated;
}

- (void)setPcsDataInvalidated:(BOOL)a3
{
  self->_pcsDataInvalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentPCSData, 0);
  objc_storeStrong((id *)&self->_dependentPCSFetchError, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_pcsData, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_fetchGroup, 0);
}

@end