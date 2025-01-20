@interface CKDPCSCacheZoneFetchOperation
- (BOOL)_checkAndUpdateZonePCSIfNeeded;
- (BOOL)_createAdditionalPCS;
- (BOOL)_decryptPCS;
- (BOOL)_fetchDependentPCS;
- (BOOL)_fetchPCSDataFromDatabase;
- (BOOL)_fetchPCSDataFromServer;
- (BOOL)_savePCSDataToCache;
- (BOOL)_saveUpdatedPCSToServer;
- (BOOL)hasAllPCSData;
- (BOOL)needsZoneishPCS;
- (BOOL)rolledPCSForZone;
- (BOOL)shouldCreateZoneishPCS;
- (id)itemTypeName;
- (int)operationType;
- (void)_decryptZonePCSInSharedDatabase;
- (void)_decryptZonePCSUsingServiceIdentities;
- (void)_fetchDepedentPCSInSharedDatabase;
- (void)_handleDecryptedZonePCSData:(id)a3 withError:(id)a4;
- (void)_handlePCSDataFetched:(id)a3 withError:(id)a4;
- (void)_saveNewPCSOnZone:(id)a3 completion:(id)a4;
- (void)_saveZoneToServer:(id)a3 completion:(id)a4;
- (void)_saveZoneToServer:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 zoneishPCS:(_OpaquePCSShareProtection *)a5 previousEtag:(id)a6 completion:(id)a7;
- (void)_willRetryFetch;
- (void)setRolledPCSForZone:(BOOL)a3;
- (void)setShouldCreateZoneishPCS:(BOOL)a3;
@end

@implementation CKDPCSCacheZoneFetchOperation

- (int)operationType
{
  return 0;
}

- (id)itemTypeName
{
  return @"zone";
}

- (BOOL)needsZoneishPCS
{
  if ((objc_msgSend_fetchOptions(self, a2, v2) & 8) == 0 || objc_msgSend_databaseScope(self, v4, v5) != 2) {
    return 0;
  }
  v8 = objc_msgSend_zonePCSData(self, v6, v7);
  v11 = objc_msgSend_zoneishPCSData(v8, v9, v10);
  BOOL v12 = v11 == 0;

  return v12;
}

- (BOOL)hasAllPCSData
{
  v4 = objc_msgSend_zonePCSData(self, a2, v2);
  if (objc_msgSend_pcs(v4, v5, v6) && (objc_msgSend_needsZoneishPCS(self, v7, v8) & 1) == 0) {
    int v11 = objc_msgSend_rolledPCSForZone(self, v9, v10) ^ 1;
  }
  else {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)_willRetryFetch
{
  self->_shouldCreateZoneishPCS = 0;
  self->_rolledPCSForZone = 0;
  v2.receiver = self;
  v2.super_class = (Class)CKDPCSCacheZoneFetchOperation;
  [(CKDPCSCacheFetchOperation *)&v2 _willRetryFetch];
}

- (void)_handlePCSDataFetched:(id)a3 withError:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (__CFString *)a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v10 = (id *)MEMORY[0x1E4F1A500];
  int v11 = (id)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v21 = objc_msgSend_operationID(v8, v12, v13);
    v24 = objc_msgSend_pcsKeyID(v6, v22, v23);
    uint64_t v27 = objc_msgSend_zoneishPublicKeyID(v6, v25, v26);
    v28 = (void *)v27;
    v29 = @" and error ";
    *(_DWORD *)v41 = 138544386;
    v30 = &stru_1F2044F30;
    *(void *)&v41[4] = v21;
    *(_WORD *)&v41[12] = 2114;
    if (v7) {
      v30 = v7;
    }
    else {
      v29 = &stru_1F2044F30;
    }
    *(void *)&v41[14] = v24;
    __int16 v42 = 2114;
    uint64_t v43 = v27;
    __int16 v44 = 2114;
    v45 = v29;
    __int16 v46 = 2112;
    v47 = v30;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Zone PCS fetch operation %{public}@ received PCS data (%{public}@/%{public}@)%{public}@%@", v41, 0x34u);
  }
  if (objc_msgSend_didFetchData(v8, v14, v15))
  {
    if (*v9 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v17 = *v10;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v31 = objc_msgSend_operationID(v8, v18, v19);
      v34 = objc_msgSend_zonePCSData(v8, v32, v33);
      v37 = objc_msgSend_pcsKeyID(v34, v35, v36);
      v40 = objc_msgSend_pcsKeyID(v6, v38, v39);
      *(_DWORD *)v41 = 138544130;
      *(void *)&v41[4] = v31;
      *(_WORD *)&v41[12] = 2112;
      *(void *)&v41[14] = v37;
      __int16 v42 = 2112;
      uint64_t v43 = (uint64_t)v40;
      __int16 v44 = 2112;
      v45 = v7;
      _os_log_debug_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_DEBUG, "Zone PCS fetch operation %{public}@ already has PCS data %@. Ignoring the fetch callback with %@/%@", v41, 0x2Au);
    }
  }
  else
  {
    if (v6)
    {
      objc_msgSend_setZonePCSData_(v8, v16, (uint64_t)v6);
      objc_msgSend_setDidFetchData_(v8, v20, 1);
    }
    objc_msgSend_setFetchError_(v8, v16, (uint64_t)v7, *(_OWORD *)v41);
  }
  objc_sync_exit(v8);
}

- (BOOL)_fetchPCSDataFromDatabase
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v5 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    int v11 = v5;
    v14 = objc_msgSend_zoneID(self, v12, v13);
    objc_msgSend_databaseScope(self, v15, v16);
    v17 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138412546;
    v20 = v14;
    __int16 v21 = 2112;
    v22 = v17;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Fetching PCS data for zone %@ from the database with scope %@", buf, 0x16u);
  }
  uint64_t v8 = objc_msgSend_cache(self, v6, v7);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4DA45CC;
  v18[3] = &unk_1E64F0970;
  v18[4] = self;
  objc_msgSend_getSQLCache_(v8, v9, (uint64_t)v18);

  return 1;
}

- (BOOL)_fetchDependentPCS
{
  uint64_t v5 = objc_msgSend_zonePCSData(self, a2, v2);

  if (!v5)
  {
    int v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    v14 = objc_msgSend_zoneID(self, v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v15, (uint64_t)a2, self, @"CKDPCSCacheZoneFetchOperation.m", 117, @"We should have PCS data for zone %@ by this point", v14);
  }
  if (objc_msgSend_databaseScope(self, v6, v7) == 3) {
    objc_msgSend__fetchDepedentPCSInSharedDatabase(self, v8, v9);
  }
  return 1;
}

- (void)_fetchDepedentPCSInSharedDatabase
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_zonePCSData(self, a2, v2);
  uint64_t v7 = objc_msgSend_shareID(v4, v5, v6);

  if (v7)
  {
    objc_initWeak(location, self);
    objc_msgSend_zonePCSData(self, v8, v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_pcs(v10, v11, v12))
    {
      if ((objc_msgSend_fetchOptions(self, v13, v14) & 0x10) == 0)
      {
LABEL_12:

        goto LABEL_13;
      }
      v17 = objc_msgSend_zonePCSData(self, v15, v16);
      v20 = objc_msgSend_sharePCSData(v17, v18, v19);
      BOOL v23 = objc_msgSend_myParticipantPCS(v20, v21, v22) == 0;

      if (!v23)
      {
LABEL_13:
        objc_destroyWeak(location);
        return;
      }
    }
    else
    {
    }
    v31 = objc_msgSend_stateTransitionGroup(self, v24, v25);
    dispatch_group_enter(v31);

    id v32 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    v35 = objc_msgSend_zoneID(self, v33, v34);
    v37 = objc_msgSend_initWithRecordName_zoneID_(v32, v36, *MEMORY[0x1E4F19D48], v35);

    v40 = objc_msgSend_cache(self, v38, v39);
    uint64_t Options = objc_msgSend_fetchOptions(self, v41, v42);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = sub_1C4DA4EB4;
    v45[3] = &unk_1E64F2360;
    objc_copyWeak(&v47, location);
    id v10 = v37;
    id v46 = v10;
    objc_msgSend_fetchPCSForShareWithID_forOperation_options_withCompletionHandler_(v40, v44, (uint64_t)v10, self, Options, v45);

    objc_destroyWeak(&v47);
    goto LABEL_12;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v26 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = v26;
    v30 = objc_msgSend_zoneID(self, v28, v29);
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v30;
    _os_log_debug_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_DEBUG, "Not fetching zone-wide share PCS for zone %@ in the shared database since it has no shareID", (uint8_t *)location, 0xCu);
  }
}

- (void)_saveZoneToServer:(id)a3 completion:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_1C4DA526C;
  v23[4] = sub_1C4DA527C;
  id v24 = 0;
  uint64_t v8 = objc_opt_new();
  v25[0] = v6;
  id v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v25, 1);
  objc_msgSend_setRecordZonesToSave_(v8, v11, (uint64_t)v10);

  objc_msgSend_setAllowDefaultZoneSave_(v8, v12, 1);
  objc_msgSend_setMaxZoneSaveAttempts_(v8, v13, 1);
  objc_msgSend_setDontFetchFromServer_(v8, v14, 1);
  uint64_t v15 = objc_opt_class();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1C4DA5284;
  v19[3] = &unk_1E64F23D8;
  uint64_t v22 = v23;
  id v16 = v6;
  id v20 = v16;
  id v17 = v7;
  id v21 = v17;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v18, v15, v8, v19);

  _Block_object_dispose(v23, 8);
}

- (void)_saveZoneToServer:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 zoneishPCS:(_OpaquePCSShareProtection *)a5 previousEtag:(id)a6 completion:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, id))a7;
  id v17 = objc_msgSend_container(self, v15, v16);
  id v20 = objc_msgSend_pcsManager(v17, v18, v19);
  id v42 = 0;
  uint64_t v22 = objc_msgSend_dataFromZonePCS_error_(v20, v21, (uint64_t)a4, &v42);
  id v23 = v42;

  if (!v23 && v22)
  {
    if (!a5) {
      goto LABEL_6;
    }
    uint64_t v26 = objc_msgSend_container(self, v24, v25);
    uint64_t v29 = objc_msgSend_pcsManager(v26, v27, v28);
    id v41 = 0;
    objc_msgSend_dataFromRecordPCS_error_(v29, v30, (uint64_t)a5, &v41);
    a5 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
    id v23 = v41;

    if (!v23)
    {
      if (a5)
      {
LABEL_6:
        objc_msgSend_setProtectionData_(v12, v24, (uint64_t)v22);
        id v32 = objc_msgSend_etagFromPCSData_(CKDPCSManager, v31, (uint64_t)v22);
        objc_msgSend_setProtectionEtag_(v12, v33, (uint64_t)v32);

        objc_msgSend_setZoneishProtectionData_(v12, v34, (uint64_t)a5);
        objc_msgSend_setPreviousProtectionEtag_(v12, v35, (uint64_t)v13);
        objc_msgSend__saveZoneToServer_completion_(self, v36, (uint64_t)v12, v14);
        id v23 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v39 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v23;
      _os_log_error_impl(&dword_1C4CFF000, v39, OS_LOG_TYPE_ERROR, "Couldn't serialize zoneish PCS: %@", buf, 0xCu);
      if (v23) {
        goto LABEL_18;
      }
    }
    else if (v23)
    {
LABEL_18:
      v14[2](v14, v23);
      goto LABEL_19;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v40, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't serialize zoneish PCS");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v37 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v23;
    _os_log_error_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_ERROR, "Couldn't serialize zone PCS: %@", buf, 0xCu);
    if (v23) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!v23)
  {
LABEL_11:
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v38, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't serialize zone PCS");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:
  v14[2](v14, v23);
LABEL_20:
}

- (void)_saveNewPCSOnZone:(id)a3 completion:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void, id))a4;
  int v11 = objc_msgSend_zoneID(v7, v9, v10);
  if ((objc_msgSend_isDefaultRecordZoneID(v11, v12, v13) & 1) == 0)
  {
    uint64_t v16 = objc_msgSend_zoneID(v7, v14, v15);
    char isSystemRecordZoneID = objc_msgSend_isSystemRecordZoneID(v16, v17, v18);

    if (isSystemRecordZoneID) {
      goto LABEL_5;
    }
    int v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v20, v21);
    id v24 = objc_msgSend_zoneID(v7, v22, v23);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v25, (uint64_t)a2, self, @"CKDPCSCacheZoneFetchOperation.m", 229, @"We shouldn't be trying to save a new PCS on anything other than the default zone or system zone: %@", v24);
  }
LABEL_5:
  uint64_t v26 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v27 = (os_log_t *)MEMORY[0x1E4F1A528];
  uint64_t v28 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    v31 = v28;
    uint64_t v34 = objc_msgSend_zoneID(v7, v32, v33);
    *(_DWORD *)buf = 138412290;
    id v65 = v34;
    _os_log_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_INFO, "Saving new PCS on zone %@", buf, 0xCu);
  }
  v35 = objc_msgSend_container(self, v29, v30);
  v38 = objc_msgSend_pcsManager(v35, v36, v37);
  id v63 = 0;
  ZonePCSWithError = (const void *)objc_msgSend_createZonePCSWithError_(v38, v39, (uint64_t)&v63);
  id v41 = v63;

  if (v41 || !ZonePCSWithError)
  {
    if (*v26 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v47 = *v27;
    if (os_log_type_enabled(*v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v65 = v41;
      _os_log_error_impl(&dword_1C4CFF000, v47, OS_LOG_TYPE_ERROR, "Couldn't create new zone PCS: %@", buf, 0xCu);
      if (v41)
      {
LABEL_17:
        if (!ZonePCSWithError) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
    }
    else if (v41)
    {
      goto LABEL_17;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v48, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't create a new zone PCS");
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    if (!ZonePCSWithError)
    {
LABEL_35:
      v8[2](v8, 0, v41);

      goto LABEL_36;
    }
LABEL_34:
    CFRelease(ZonePCSWithError);
    goto LABEL_35;
  }
  if ((objc_msgSend_fetchOptions(self, v42, v43) & 8) == 0)
  {
    id v46 = 0;
LABEL_21:
    objc_initWeak((id *)buf, self);
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = sub_1C4DA60D4;
    v58[3] = &unk_1E64F2428;
    id v59 = v7;
    v60 = v8;
    objc_copyWeak(&v61, (id *)buf);
    objc_msgSend__saveZoneToServer_withPCS_zoneishPCS_previousEtag_completion_(self, v55, (uint64_t)v59, ZonePCSWithError, v46, 0, v58);
    CFRelease(ZonePCSWithError);
    if (v46) {
      CFRelease(v46);
    }
    objc_destroyWeak(&v61);

    objc_destroyWeak((id *)buf);
    goto LABEL_36;
  }
  v49 = objc_msgSend_container(self, v44, v45);
  v52 = objc_msgSend_pcsManager(v49, v50, v51);
  id v62 = 0;
  id v46 = (const void *)objc_msgSend_createRecordPCSWithZonePCS_sharePCS_createLite_error_(v52, v53, (uint64_t)ZonePCSWithError, 0, 0, &v62);
  id v54 = v62;

  if (!v54 && v46) {
    goto LABEL_21;
  }
  if (*v26 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v56 = *v27;
  if (os_log_type_enabled(*v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v65 = v54;
    _os_log_error_impl(&dword_1C4CFF000, v56, OS_LOG_TYPE_ERROR, "Couldn't create new zoneish PCS: %@", buf, 0xCu);
    if (v54) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (!v54)
  {
LABEL_28:
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v57, *MEMORY[0x1E4F19DD8], 5005, @"Couldn't create a new zoneish PCS");
    id v54 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_29:
  if (v46) {
    CFRelease(v46);
  }
  CFRelease(ZonePCSWithError);
  v8[2](v8, 0, v54);

LABEL_36:
}

- (BOOL)_fetchPCSDataFromServer
{
  v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  id v7 = objc_msgSend_container(self, v5, v6);
  uint64_t v10 = objc_msgSend_fetchAggregator(v7, v8, v9);
  uint64_t v13 = objc_msgSend_zoneID(self, v11, v12);
  uint64_t v16 = objc_msgSend_parentOperation(self, v14, v15);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1C4DA6870;
  v19[3] = &unk_1E64F21A8;
  void v19[4] = self;
  objc_msgSend_requestFetchOfZoneWithID_forOperation_withCompletionHandler_(v10, v17, (uint64_t)v13, v16, v19);

  return 1;
}

- (BOOL)_createAdditionalPCS
{
  if (objc_msgSend_needsZoneishPCS(self, a2, v2)) {
    objc_msgSend_setShouldCreateZoneishPCS_(self, v4, 1);
  }
  return 1;
}

- (BOOL)_decryptPCS
{
  v4 = objc_msgSend_zonePCSData(self, a2, v2);
  id v7 = objc_msgSend_pcsData(v4, v5, v6);

  if (v7)
  {
    uint64_t v10 = objc_msgSend_zonePCSData(self, v8, v9);
    uint64_t v13 = objc_msgSend_pcs(v10, v11, v12);

    if (!v13)
    {
      if (objc_msgSend_databaseScope(self, v14, v15) == 3) {
        objc_msgSend__decryptZonePCSInSharedDatabase(self, v16, v17);
      }
      else {
        objc_msgSend__decryptZonePCSUsingServiceIdentities(self, v16, v17);
      }
    }
  }
  else
  {
    uint64_t v18 = objc_msgSend_fetchError(self, v8, v9);

    if (!v18)
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v22 = *MEMORY[0x1E4F19DD8];
      uint64_t v23 = objc_msgSend_zoneID(self, v19, v20);
      uint64_t v25 = objc_msgSend_errorWithDomain_code_format_(v21, v24, v22, 5004, @"We don't have zone PCS data for zone %@", v23);
      objc_msgSend_setFetchError_(self, v26, (uint64_t)v25);
    }
  }
  return v7 != 0;
}

- (void)_decryptZonePCSInSharedDatabase
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_zonePCSData(self, a2, v2);
  id v7 = objc_msgSend_shareID(v4, v5, v6);

  if (v7)
  {
    uint64_t v10 = objc_msgSend_zonePCSData(self, v8, v9);
    uint64_t v13 = objc_msgSend_sharePCSData(v10, v11, v12);
    uint64_t v16 = objc_msgSend_pcs(v13, v14, v15);

    if (v16)
    {
      uint64_t v19 = objc_msgSend_container(self, v17, v18);
      uint64_t v22 = objc_msgSend_pcsManager(v19, v20, v21);
      uint64_t v25 = objc_msgSend_zonePCSData(self, v23, v24);
      uint64_t v28 = objc_msgSend_pcsData(v25, v26, v27);
      v31 = objc_msgSend_zonePCSData(self, v29, v30);
      uint64_t v34 = objc_msgSend_sharePCSData(v31, v32, v33);
      uint64_t v37 = objc_msgSend_pcs(v34, v35, v36);
      id v62 = 0;
      uint64_t v39 = (const void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v22, v38, (uint64_t)v28, 3, v37, &v62);
      id v40 = v62;

      if (!v39 || v40)
      {
        id v42 = 0;
        v60 = 0;
        if (!v39)
        {
LABEL_16:
          objc_msgSend__handleDecryptedZonePCSData_withError_(self, v41, (uint64_t)v60, v40);

          return;
        }
      }
      else
      {
        id v42 = objc_alloc_init(CKDZonePCSData);
        objc_msgSend_setPcs_(v42, v43, (uint64_t)v39);
      }
      CFRelease(v39);
      v60 = v42;
      goto LABEL_16;
    }
    v49 = objc_msgSend_fetchError(self, v17, v18);

    if (!v49)
    {
      v52 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v53 = *MEMORY[0x1E4F19DD8];
      objc_msgSend_dependentPCSFetchError(self, v50, v51);
      id v61 = (id)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend_zoneID(self, v54, v55);
      v58 = objc_msgSend_errorWithDomain_code_error_format_(v52, v57, v53, 5004, v61, @"We don't have share PCS to decrypt zone PCS data for zone %@", v56);
      objc_msgSend_setFetchError_(self, v59, (uint64_t)v58);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v44 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v45 = v44;
      uint64_t v48 = objc_msgSend_zoneID(self, v46, v47);
      *(_DWORD *)buf = 138412290;
      v64 = v48;
      _os_log_debug_impl(&dword_1C4CFF000, v45, OS_LOG_TYPE_DEBUG, "Zone %@ in the shared database has no shareID, skipping decryption", buf, 0xCu);
    }
  }
}

- (void)_decryptZonePCSUsingServiceIdentities
{
  v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  objc_msgSend_noteOperationWillWaitOnPCS(self, v5, v6);
  uint64_t v9 = objc_msgSend_container(self, v7, v8);
  uint64_t v12 = objc_msgSend_pcsManager(v9, v10, v11);
  uint64_t v15 = objc_msgSend_zonePCSData(self, v13, v14);
  uint64_t v18 = objc_msgSend_pcsData(v15, v16, v17);
  uint64_t v21 = objc_msgSend_zonePCSData(self, v19, v20);
  uint64_t v24 = objc_msgSend_zonePCSModificationDate(v21, v22, v23);
  uint64_t v27 = objc_msgSend_topmostParentOperation(self, v25, v26);
  uint64_t v30 = objc_msgSend_operationID(v27, v28, v29);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = sub_1C4DA73D8;
  v32[3] = &unk_1E64F2338;
  v32[4] = self;
  objc_msgSend_createZonePCSFromData_usingServiceIdentityWithType_zonePCSModificationDate_requestorOperationID_completionHandler_(v12, v31, (uint64_t)v18, 0, v24, v30, v32);
}

- (void)_handleDecryptedZonePCSData:(id)a3 withError:(id)a4
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v9 = objc_msgSend_pcs(a3, v7, v8);
  id v12 = v6;
  uint64_t v13 = (os_log_t *)MEMORY[0x1E4F1A528];
  uint64_t v14 = (uint64_t *)MEMORY[0x1E4F1A550];
  if (v12)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v15 = *v13;
    if (!os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = 0;
      id v17 = v12;
LABEL_33:
      os_log_t v71 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      {
        v99 = v71;
        v102 = objc_msgSend_zoneID(self, v100, v101);
        *(_DWORD *)buf = 138412546;
        id v119 = v102;
        __int16 v120 = 2112;
        id v121 = v17;
        _os_log_error_impl(&dword_1C4CFF000, v99, OS_LOG_TYPE_ERROR, "Error decrypting PCS for zone %@: %@", buf, 0x16u);
      }
      objc_msgSend_setFetchError_(self, v72, (uint64_t)v17);
      goto LABEL_36;
    }
    *(_DWORD *)buf = 138412290;
    id v119 = v12;
    _os_log_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_INFO, "Warn: Error with PCS data for zone: %@", buf, 0xCu);
    uint64_t v16 = 0;
    id v17 = v12;
LABEL_31:
    if (*v14 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    goto LABEL_33;
  }
  uint64_t v18 = objc_msgSend_zonePCSData(self, v10, v11);
  objc_msgSend_setPcs_(v18, v19, v9);

  if (!objc_msgSend_shouldCreateZoneishPCS(self, v20, v21))
  {
    uint64_t v16 = 0;
    goto LABEL_17;
  }
  uint64_t v24 = objc_msgSend_zonePCSData(self, v22, v23);
  uint64_t v27 = objc_msgSend_pcs(v24, v25, v26);

  if (!v27)
  {
    if (*v14 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v58 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
    {
      v104 = v58;
      v107 = objc_msgSend_zoneID(self, v105, v106);
      *(_DWORD *)buf = 138412290;
      id v119 = v107;
      _os_log_error_impl(&dword_1C4CFF000, v104, OS_LOG_TYPE_ERROR, "We need to create a zoneish PCS but we don't have the zone PCS for zone %@", buf, 0xCu);
    }
    id v61 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v62 = *MEMORY[0x1E4F19DD8];
    id v63 = objc_msgSend_zoneID(self, v59, v60);
    objc_msgSend_errorWithDomain_code_format_(v61, v64, v62, 5004, @"Couldn't decrypt zone PCS for zone in order to create a zoneish PCS for zone %@", v63);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = 0;
LABEL_30:

    if (!v17) {
      goto LABEL_37;
    }
    goto LABEL_31;
  }
  uint64_t v30 = objc_msgSend_container(self, v28, v29);
  uint64_t v33 = objc_msgSend_pcsManager(v30, v31, v32);
  uint64_t v36 = objc_msgSend_zonePCSData(self, v34, v35);
  uint64_t v39 = objc_msgSend_pcs(v36, v37, v38);
  id v117 = 0;
  uint64_t v16 = objc_msgSend_createRecordPCSWithZonePCS_sharePCS_createLite_error_(v33, v40, v39, 0, 0, &v117);
  id v41 = v117;

  id v42 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v43 = *v14;
  if (v41 || !v16)
  {
    if (v43 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v42);
    }
    os_log_t v65 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
    {
      v112 = v65;
      v115 = objc_msgSend_zoneID(self, v113, v114);
      *(_DWORD *)buf = 138412290;
      id v119 = v115;
      _os_log_error_impl(&dword_1C4CFF000, v112, OS_LOG_TYPE_ERROR, "We need to create a zoneish PCS but we don't have the zone PCS for zone %@", buf, 0xCu);
    }
    v68 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v69 = *MEMORY[0x1E4F19DD8];
    id v63 = objc_msgSend_zoneID(self, v66, v67);
    objc_msgSend_errorWithDomain_code_format_(v68, v70, v69, 5004, @"Couldn't create a zoneish PCS for zone %@", v63);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_30;
  }
  if (v43 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v42);
  }
  os_log_t v44 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEBUG))
  {
    v108 = v44;
    v111 = objc_msgSend_zoneID(self, v109, v110);
    *(_DWORD *)buf = 138412546;
    id v119 = v111;
    __int16 v120 = 2112;
    id v121 = v16;
    _os_log_debug_impl(&dword_1C4CFF000, v108, OS_LOG_TYPE_DEBUG, "Created a new zoneish PCS for zone %@: %@", buf, 0x16u);
  }
  uint64_t v47 = objc_msgSend_zonePCSData(self, v45, v46);
  objc_msgSend_setZoneishPCS_(v47, v48, (uint64_t)v16);

LABEL_17:
  objc_msgSend_zonePCSData(self, v22, v23);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_pcs(v17, v49, v50)) {
    goto LABEL_36;
  }
  uint64_t v53 = objc_msgSend_zonePCSData(self, v51, v52);
  if (objc_msgSend_zoneishPCS(v53, v54, v55))
  {

    goto LABEL_36;
  }
  v73 = objc_msgSend_zonePCSData(self, v56, v57);
  v76 = objc_msgSend_zoneishPCSData(v73, v74, v75);

  if (v76)
  {
    v79 = objc_msgSend_container(self, v77, v78);
    v82 = objc_msgSend_pcsManager(v79, v80, v81);
    v85 = objc_msgSend_zonePCSData(self, v83, v84);
    v88 = objc_msgSend_zoneishPCSData(v85, v86, v87);
    v91 = objc_msgSend_zonePCSData(self, v89, v90);
    uint64_t v94 = objc_msgSend_pcs(v91, v92, v93);
    id v116 = 0;
    uint64_t v16 = objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v82, v95, (uint64_t)v88, 1, v94, &v116);
    id v17 = v116;

    if (v17)
    {
      uint64_t v14 = (uint64_t *)MEMORY[0x1E4F1A550];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v98 = *v13;
      if (!os_log_type_enabled(*v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 138412290;
      id v119 = v17;
      _os_log_impl(&dword_1C4CFF000, v98, OS_LOG_TYPE_INFO, "Warn: Error with zoneish PCS data for zone: %@", buf, 0xCu);
      goto LABEL_31;
    }
    objc_msgSend_zonePCSData(self, v96, v97);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setZoneishPCS_(v17, v103, (uint64_t)v16);
LABEL_36:
  }
LABEL_37:
  if (v16) {
    CFRelease(v16);
  }
}

- (BOOL)_checkAndUpdateZonePCSIfNeeded
{
  SEL v3 = a2;
  uint64_t v236 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_fetchError(self, a2, v2);

  if (v5) {
    return 0;
  }
  uint64_t v9 = objc_msgSend_container(self, v6, v7);
  id v12 = objc_msgSend_options(v9, v10, v11);
  if ((objc_msgSend_useAnonymousToServerShareParticipants(v12, v13, v14) & 1) == 0)
  {

    goto LABEL_7;
  }
  id v17 = objc_msgSend_zoneID(self, v15, v16);
  uint64_t v20 = objc_msgSend_zoneName(v17, v18, v19);
  char isEqualToString = objc_msgSend_isEqualToString_(v20, v21, *MEMORY[0x1E4F19D90]);

  if ((isEqualToString & 1) == 0)
  {
LABEL_7:
    uint64_t v25 = objc_msgSend_container(self, v23, v24);
    uint64_t v28 = objc_msgSend_zonePCSData(self, v26, v27);
    uint64_t v31 = objc_msgSend_pcs(v28, v29, v30);

    uint64_t v34 = objc_msgSend_zonePCSData(self, v32, v33);
    uint64_t v37 = objc_msgSend_zoneishPCS(v34, v35, v36);

    if (!v31)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      os_log_t v71 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C4CFF000, v71, OS_LOG_TYPE_ERROR, "Missing zonePCS when checking for zone key roll requirements, returning", buf, 2u);
      }
      BOOL v8 = 0;
      goto LABEL_106;
    }
    id v40 = objc_msgSend_pcsManager(v25, v38, v39);
    int isZoneishZone_bypassAllowlistedContainers = objc_msgSend_zonePCSNeedsKeyRolled_isZoneishZone_bypassAllowlistedContainers_(v40, v41, v31, v37 != 0, 0);

    if (*MEMORY[0x1E4F1A4E0])
    {
      uint64_t v45 = objc_msgSend_unitTestOverrides(self, v43, v44);
      uint64_t v47 = objc_msgSend_objectForKeyedSubscript_(v45, v46, @"ForceKeyRollWhenFetchedFromCache");
      int v50 = objc_msgSend_BOOLValue(v47, v48, v49);

      if (v50)
      {
        int isZoneishZone_bypassAllowlistedContainers = 1;
        _PCSFPSetShouldRoll();
      }
    }
    uint64_t v51 = objc_msgSend_container(self, v43, v44);
    id v54 = objc_msgSend_containerID(v51, v52, v53);
    uint64_t v57 = objc_msgSend_specialContainerType(v54, v55, v56);

    if (v57 == 25)
    {
      uint64_t v60 = objc_msgSend_container(self, v58, v59);
      id v63 = objc_msgSend_pcsManager(v60, v61, v62);
      id v231 = 0;
      os_log_t v65 = objc_msgSend_dataFromZonePCS_error_(v63, v64, v31, &v231);
      id v66 = v231;

      if (v66)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v69 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v233 = v66;
          _os_log_impl(&dword_1C4CFF000, v69, OS_LOG_TYPE_INFO, "Warn: Couldn't export protection data for decrypting with Reminders identity: %@", buf, 0xCu);
        }
        v70 = 0;
LABEL_51:

        goto LABEL_52;
      }
      uint64_t v224 = v37;
      id v119 = objc_msgSend_container(self, v67, v68);
      uint64_t v122 = objc_msgSend_pcsManager(v119, v120, v121);
      id v230 = 0;
      uint64_t v124 = objc_msgSend_createSharePCSFromData_ofType_withService_error_(v122, v123, (uint64_t)v65, 3, 4, &v230);
      id v66 = v230;

      uint64_t v225 = v124;
      if (!v124 || v66)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v70 = (const void *)v124;
        v129 = (void *)*MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
        {
          v188 = v129;
          v191 = objc_msgSend_zoneID(self, v189, v190);
          *(_DWORD *)buf = 138412546;
          id v233 = v191;
          __int16 v234 = 2112;
          id v235 = v66;
          _os_log_error_impl(&dword_1C4CFF000, v188, OS_LOG_TYPE_ERROR, "Couldn't decrypt zone %@ with Reminders identity: %@", buf, 0x16u);
        }
        goto LABEL_51;
      }
      uint64_t v37 = v224;
      v226 = v25;
      v127 = objc_msgSend_pcsManager(v25, v125, v126);
      int v72 = objc_msgSend_zonePCSNeedsKeyRolled_isZoneishZone_bypassAllowlistedContainers_(v127, v128, v225, v224 != 0, 0);
    }
    else
    {
      uint64_t v225 = 0;
      v226 = v25;
      int v72 = 0;
    }
    uint64_t v223 = v37;
    int v73 = isZoneishZone_bypassAllowlistedContainers | v72;
    if (v37) {
      int v74 = isZoneishZone_bypassAllowlistedContainers | v72;
    }
    else {
      int v74 = 0;
    }
    if (((isZoneishZone_bypassAllowlistedContainers | v74) & 1) != 0 || v72)
    {
      objc_msgSend_container(self, v58, v59);
      uint64_t v75 = v221 = v72;
      uint64_t v78 = objc_msgSend_pcsManager(v75, v76, v77);
      uint64_t v80 = objc_msgSend_sizeOfPCS_(v78, v79, v31);
      int v222 = v74;
      uint64_t v81 = v31;
      v82 = v3;
      int v83 = v73;
      uint64_t v84 = v80;
      uint64_t v87 = objc_msgSend_container(self, v85, v86);
      uint64_t v90 = objc_msgSend_pcsManager(v87, v88, v89);
      uint64_t v92 = objc_msgSend_sizeOfPCS_(v90, v91, v223) + v84;

      v95 = objc_msgSend_container(self, v93, v94);
      v98 = objc_msgSend_pcsManager(v95, v96, v97);
      uint64_t v99 = v92;
      int v73 = v83;
      SEL v3 = v82;
      uint64_t v31 = v81;
      int v74 = v222;
      LODWORD(v78) = objc_msgSend_isPCSSizeTooBigForKeyRoll_(v98, v100, v99);

      int v72 = v221;
      if (v78)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v70 = (const void *)v225;
        uint64_t v101 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C4CFF000, v101, OS_LOG_TYPE_INFO, "Skipping zone identity key rolling because the combined PCS size is too big.", buf, 2u);
        }
        objc_msgSend_updateCloudKitMetrics_(self, v102, (uint64_t)&unk_1F2042E70);
        BOOL v8 = 0;
        id v66 = 0;
LABEL_102:
        uint64_t v25 = v226;
        if (!v70) {
          goto LABEL_104;
        }
        goto LABEL_103;
      }
    }
    if (isZoneishZone_bypassAllowlistedContainers)
    {
      v103 = (void *)MEMORY[0x1E4F1A550];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v104 = (os_log_t *)MEMORY[0x1E4F1A528];
      v105 = (void *)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
      {
        v108 = v105;
        objc_msgSend_zoneID(self, v109, v110);
        v112 = int v111 = v72;
        *(_DWORD *)buf = 138412290;
        id v233 = v112;
        _os_log_impl(&dword_1C4CFF000, v108, OS_LOG_TYPE_INFO, "Updating identity on zone PCS for zone %@", buf, 0xCu);

        int v72 = v111;
      }
      if (*MEMORY[0x1E4F1A4E0])
      {
        v113 = objc_msgSend_unitTestOverrides(self, v106, v107);
        objc_msgSend_objectForKeyedSubscript_(v113, v114, @"testUpdatingZonePCSAfterIdentityRoll");
        id v116 = v115 = v72;

        BOOL v117 = v116 == 0;
        int v72 = v115;
        uint64_t v118 = v117 ? 0 : 3;
      }
      else
      {
        uint64_t v118 = 0;
      }
      v130 = objc_msgSend_pcsManager(v226, v106, v107);
      objc_msgSend_updateIdentityAndRollKeyForZonePCS_usingServiceIdentityWithType_forOperation_(v130, v131, v31, v118, self);
      id v66 = (id)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        if (*v103 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v25 = v226;
        os_log_t v132 = *v104;
        if (os_log_type_enabled(*v104, OS_LOG_TYPE_ERROR))
        {
          v180 = v132;
          v183 = objc_msgSend_zoneID(self, v181, v182);
          *(_DWORD *)buf = 138412546;
          id v233 = v183;
          __int16 v234 = 2112;
          id v235 = v66;
          _os_log_error_impl(&dword_1C4CFF000, v180, OS_LOG_TYPE_ERROR, "Couldn't update identity on zone PCS for zone %@: %@", buf, 0x16u);
        }
        BOOL v8 = 0;
        v70 = (const void *)v225;
        if (!v225) {
          goto LABEL_104;
        }
        goto LABEL_103;
      }
    }
    v70 = (const void *)v225;
    if (v72)
    {
      v133 = (void *)MEMORY[0x1E4F1A550];
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v134 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        v137 = v134;
        v140 = objc_msgSend_zoneID(self, v138, v139);
        *(_DWORD *)buf = 138412290;
        id v233 = v140;
        _os_log_impl(&dword_1C4CFF000, v137, OS_LOG_TYPE_INFO, "Reminders zone %@ needs to be rolled for the Reminders identity", buf, 0xCu);
      }
      v141 = objc_msgSend_pcsManager(v226, v135, v136);
      objc_msgSend_updateIdentityAndRollKeyForZonePCS_usingServiceIdentityWithType_forOperation_(v141, v142, v225, 4, self);
      id v66 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v31 = v225;
      if (v66)
      {
        if (*v133 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v25 = v226;
        v143 = (void *)*MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
        {
          v144 = v143;
          v147 = objc_msgSend_zoneID(self, v145, v146);
          *(_DWORD *)buf = 138412546;
          id v233 = v147;
          __int16 v234 = 2112;
          id v235 = v66;
          _os_log_error_impl(&dword_1C4CFF000, v144, OS_LOG_TYPE_ERROR, "Couldn't roll Reminders identity on zone PCS for zone %@: %@", buf, 0x16u);
        }
        goto LABEL_52;
      }
    }
    if (v74)
    {
      v148 = (void *)MEMORY[0x1E4F1A550];
      uint64_t v25 = v226;
      int v220 = v73;
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v149 = (os_log_t *)MEMORY[0x1E4F1A528];
      v150 = (void *)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        v184 = v150;
        v187 = objc_msgSend_zoneID(self, v185, v186);
        *(_DWORD *)buf = 138412290;
        id v233 = v187;
        _os_log_debug_impl(&dword_1C4CFF000, v184, OS_LOG_TYPE_DEBUG, "Updating zoneish PCS on zone %@", buf, 0xCu);
      }
      v153 = objc_msgSend_pcsManager(v226, v151, v152);
      objc_msgSend_rollMasterKeyForRecordPCS_isZoneishRecord_bypassAllowlistedContainers_forOperation_(v153, v154, v223, 1, 0, self);
      id v66 = (id)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        if (*v148 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v157 = *v149;
        if (os_log_type_enabled(*v149, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v233 = v66;
          _os_log_error_impl(&dword_1C4CFF000, v157, OS_LOG_TYPE_ERROR, "Couldn't roll master key for zoneish PCS: %@", buf, 0xCu);
        }
LABEL_52:
        BOOL v8 = 0;
        if (!v70)
        {
LABEL_104:
          if (v66)
          {
            objc_msgSend_setFetchError_(self, v58, (uint64_t)v66);
          }
LABEL_106:

          return v8;
        }
LABEL_103:
        CFRelease(v70);
        goto LABEL_104;
      }
      v158 = objc_msgSend_pcsManager(v226, v155, v156);
      id v229 = 0;
      v160 = objc_msgSend_dataFromRecordPCS_error_(v158, v159, v223, &v229);
      id v66 = v229;

      if (v66 || !v160)
      {
        if (*v148 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v177 = *v149;
        if (os_log_type_enabled(*v149, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v233 = v66;
          _os_log_error_impl(&dword_1C4CFF000, v177, OS_LOG_TYPE_ERROR, "Couldn't serialize zoneish PCS: %@", buf, 0xCu);
        }
        goto LABEL_101;
      }
      v163 = objc_msgSend_pcsManager(v226, v161, v162);
      id v228 = 0;
      v165 = (const void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v163, v164, (uint64_t)v160, 1, v31, &v228);
      id v66 = v228;

      if (v66 || !v165)
      {
        if (*v148 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v178 = *v149;
        if (os_log_type_enabled(*v149, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v233 = v66;
          _os_log_error_impl(&dword_1C4CFF000, v178, OS_LOG_TYPE_ERROR, "Couldn't decode zoneishPCS data: %@", buf, 0xCu);
          if (!v165) {
            goto LABEL_100;
          }
        }
        else if (!v165)
        {
LABEL_100:
          v70 = (const void *)v225;
LABEL_101:

          BOOL v8 = 0;
          goto LABEL_102;
        }
LABEL_99:
        CFRelease(v165);
        goto LABEL_100;
      }
      v168 = objc_msgSend_pcsManager(v226, v166, v167);
      objc_msgSend_updateZoneIdentityForRecordPCS_usingZonePCS_isZoneishRecord_bypassAllowlistedContainers_(v168, v169, (uint64_t)v165, v31, 1, 0);
      id v66 = (id)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        if (*v148 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        os_log_t v172 = *v149;
        if (os_log_type_enabled(*v149, OS_LOG_TYPE_ERROR))
        {
          v173 = v172;
          v176 = objc_msgSend_zoneID(self, v174, v175);
          *(_DWORD *)buf = 138412546;
          id v233 = v176;
          __int16 v234 = 2112;
          id v235 = v66;
          _os_log_error_impl(&dword_1C4CFF000, v173, OS_LOG_TYPE_ERROR, "Couldn't update identity on zoneish PCS for zone %@: %@", buf, 0x16u);
        }
        goto LABEL_99;
      }
      v192 = objc_msgSend_zonePCSData(self, v170, v171);
      objc_msgSend_setZoneishPCS_(v192, v193, (uint64_t)v165);

      CFRelease(v165);
      v196 = objc_msgSend_zonePCSData(self, v194, v195);
      uint64_t v199 = objc_msgSend_zoneishPCS(v196, v197, v198);

      v202 = objc_msgSend_pcsManager(v226, v200, v201);
      id v227 = 0;
      v204 = objc_msgSend_dataFromRecordPCS_error_(v202, v203, v199, &v227);
      id v66 = v227;

      if (v66 || !v204)
      {
        if (*v148 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v217 = *v149;
        if (os_log_type_enabled(*v149, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v233 = v66;
          _os_log_error_impl(&dword_1C4CFF000, v217, OS_LOG_TYPE_ERROR, "Couldn't serialize zoneish PCS: %@", buf, 0xCu);
        }
        v160 = v204;
        goto LABEL_100;
      }
      v207 = objc_msgSend_zonePCSData(self, v205, v206);
      objc_msgSend_setZoneishPCSData_(v207, v208, (uint64_t)v204);

      v70 = (const void *)v225;
      int v73 = v220;
    }
    uint64_t v25 = v226;
    if (v73)
    {
      if (*MEMORY[0x1E4F1A4E0])
      {
        v209 = objc_msgSend_unitTestOverrides(self, v58, v59);
        v211 = objc_msgSend_objectForKeyedSubscript_(v209, v210, @"ShouldNotKeyRollWhenFetchedFromCache");

        if (v211)
        {
          v218 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v58, v212);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v218, v219, (uint64_t)v3, self, @"CKDPCSCacheZoneFetchOperation.m", 627, @"Did not expect a key roll");
        }
      }
      BOOL v8 = 1;
      objc_msgSend_setRolledPCSForZone_(self, v58, 1);
      v215 = objc_msgSend_zonePCSData(self, v213, v214);
      objc_msgSend_setPcs_(v215, v216, v31);
    }
    else
    {
      BOOL v8 = 0;
    }
    id v66 = 0;
    if (!v70) {
      goto LABEL_104;
    }
    goto LABEL_103;
  }
  return 0;
}

- (BOOL)_saveUpdatedPCSToServer
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend_shouldCreateZoneishPCS(self, a2, v2) & 1) != 0
    || objc_msgSend_rolledPCSForZone(self, v4, v5))
  {
    id v6 = objc_msgSend_stateTransitionGroup(self, v4, v5);
    dispatch_group_enter(v6);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v7 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v34 = v7;
      uint64_t v37 = objc_msgSend_zoneID(self, v35, v36);
      if (objc_msgSend_shouldCreateZoneishPCS(self, v38, v39)) {
        id v42 = @"YES";
      }
      else {
        id v42 = @"NO";
      }
      *(_DWORD *)location = 138543874;
      if (objc_msgSend_rolledPCSForZone(self, v40, v41)) {
        uint64_t v43 = @"YES";
      }
      else {
        uint64_t v43 = @"NO";
      }
      *(void *)&id location[4] = v37;
      __int16 v47 = 2114;
      uint64_t v48 = v42;
      __int16 v49 = 2114;
      int v50 = v43;
      _os_log_debug_impl(&dword_1C4CFF000, v34, OS_LOG_TYPE_DEBUG, "Saving the new Zone PCS to the server for zone %{public}@ due to shouldCreateZoneishPCS: %{public}@, rolledPCSForZone: %{public}@", location, 0x20u);
    }
    id v8 = objc_alloc(MEMORY[0x1E4F1A310]);
    uint64_t v11 = objc_msgSend_zoneID(self, v9, v10);
    uint64_t v13 = objc_msgSend_initWithZoneID_(v8, v12, (uint64_t)v11);

    objc_initWeak((id *)location, self);
    uint64_t v16 = objc_msgSend_zonePCSData(self, v14, v15);
    uint64_t v19 = objc_msgSend_pcs(v16, v17, v18);
    uint64_t v22 = objc_msgSend_zonePCSData(self, v20, v21);
    uint64_t v25 = objc_msgSend_zoneishPCS(v22, v23, v24);
    uint64_t v28 = objc_msgSend_zonePCSData(self, v26, v27);
    uint64_t v31 = objc_msgSend_etag(v28, v29, v30);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = sub_1C4DA8E94;
    v44[3] = &unk_1E64F20B8;
    objc_copyWeak(&v45, (id *)location);
    v44[4] = self;
    objc_msgSend__saveZoneToServer_withPCS_zoneishPCS_previousEtag_completion_(self, v32, (uint64_t)v13, v19, v25, v31, v44);

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)location);
  }
  return 1;
}

- (BOOL)_savePCSDataToCache
{
  objc_initWeak(&location, self);
  if (objc_msgSend_wasFetchedFromCache(self, v3, v4))
  {
    uint64_t v7 = objc_msgSend_stateTransitionGroup(self, v5, v6);
    dispatch_group_enter(v7);

    uint64_t v10 = objc_msgSend_cache(self, v8, v9);
    uint64_t v13 = objc_msgSend_zonePCSData(self, v11, v12);
    uint64_t v16 = objc_msgSend_zoneID(self, v14, v15);
    uint64_t v19 = objc_msgSend_databaseScope(self, v17, v18);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = sub_1C4DA92F4;
    v34[3] = &unk_1E64F22C0;
    uint64_t v20 = &v35;
    objc_copyWeak(&v35, &location);
    objc_msgSend_updateMemoryCacheWithZonePCSData_forZoneWithID_databaseScope_withCompletionHandler_(v10, v21, (uint64_t)v13, v16, v19, v34);
  }
  else
  {
    uint64_t v22 = objc_msgSend_stateTransitionGroup(self, v5, v6);
    dispatch_group_enter(v22);

    uint64_t v10 = objc_msgSend_cache(self, v23, v24);
    uint64_t v13 = objc_msgSend_zonePCSData(self, v25, v26);
    uint64_t v16 = objc_msgSend_zoneID(self, v27, v28);
    uint64_t v31 = objc_msgSend_databaseScope(self, v29, v30);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = sub_1C4DA929C;
    v36[3] = &unk_1E64F22C0;
    uint64_t v20 = &v37;
    objc_copyWeak(&v37, &location);
    objc_msgSend__setPCSData_forFetchedZoneID_withScope_withCompletionHandler_(v10, v32, (uint64_t)v13, v16, v31, v36);
  }

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  return 1;
}

- (BOOL)shouldCreateZoneishPCS
{
  return self->_shouldCreateZoneishPCS;
}

- (void)setShouldCreateZoneishPCS:(BOOL)a3
{
  self->_shouldCreateZoneishPCS = a3;
}

- (BOOL)rolledPCSForZone
{
  return self->_rolledPCSForZone;
}

- (void)setRolledPCSForZone:(BOOL)a3
{
  self->_rolledPCSForZone = a3;
}

@end