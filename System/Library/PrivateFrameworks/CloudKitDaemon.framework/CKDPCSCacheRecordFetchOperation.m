@interface CKDPCSCacheRecordFetchOperation
- (BOOL)_createAdditionalPCS;
- (BOOL)_decryptPCS;
- (BOOL)_decryptRecordPCSInPrivateDatabase;
- (BOOL)_decryptRecordPCSInSharedDatabase;
- (BOOL)_fetchDependentPCS;
- (BOOL)_fetchDependentPCSInSharedDatabase;
- (BOOL)_fetchPCSDataFromDatabase;
- (BOOL)_fetchPCSDataFromServer;
- (BOOL)_fetchPCSForPrivateZone;
- (BOOL)_savePCSDataToCache;
- (BOOL)hasAllPCSData;
- (BOOL)needsChainPCSCreation;
- (BOOL)serverRecordHasNoProtectionData;
- (NSString)serverRecordType;
- (id)itemTypeName;
- (void)_handlePCSDataFetched:(id)a3 withError:(id)a4;
- (void)setServerRecordHasNoProtectionData:(BOOL)a3;
- (void)setServerRecordType:(id)a3;
@end

@implementation CKDPCSCacheRecordFetchOperation

- (id)itemTypeName
{
  return @"record";
}

- (BOOL)needsChainPCSCreation
{
  if ((objc_msgSend_fetchOptions(self, a2, v2) & 4) == 0) {
    return 0;
  }
  v7 = objc_msgSend_recordPCSData(self, v4, v5);
  v10 = objc_msgSend_chainPCSData(v7, v8, v9);
  BOOL v6 = v10 == 0;

  return v6;
}

- (BOOL)hasAllPCSData
{
  if (objc_msgSend_serverRecordHasNoProtectionData(self, a2, v2)) {
    return 1;
  }
  v7 = objc_msgSend_recordPCSData(self, v4, v5);
  BOOL v6 = objc_msgSend_pcs(v7, v8, v9) != 0;

  return v6;
}

- (void)_handlePCSDataFetched:(id)a3 withError:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (__CFString *)a4;
  v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v10 = (id *)MEMORY[0x1E4F1A500];
  v11 = (id)*MEMORY[0x1E4F1A500];
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
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Record PCS fetch operation %{public}@ received PCS data (%{public}@/%{public}@)%{public}@%@", v41, 0x34u);
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
      v34 = objc_msgSend_recordPCSData(v8, v32, v33);
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
      _os_log_debug_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_DEBUG, "Record PCS fetch operation %{public}@ already has PCS data %@. Ignoring the fetch callback with %@/%@", v41, 0x2Au);
    }
  }
  else
  {
    if (v6)
    {
      objc_msgSend_setRecordPCSData_(v8, v16, (uint64_t)v6);
      objc_msgSend_setDidFetchData_(v8, v20, 1);
    }
    objc_msgSend_setFetchError_(v8, v16, (uint64_t)v7, *(_OWORD *)v41);
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
    v14 = objc_msgSend_recordID(self, v12, v13);
    *(_DWORD *)buf = 138412290;
    v17 = v14;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Fetching PCS data for record %@ from the database", buf, 0xCu);
  }
  v8 = objc_msgSend_cache(self, v6, v7);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1C4F674C0;
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
  uint64_t v13 = objc_msgSend_recordID(self, v11, v12);
  v16 = objc_msgSend_parentOperation(self, v14, v15);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1C4F67AD0;
  v19[3] = &unk_1E64F39A0;
  v19[4] = self;
  objc_msgSend_requestFetchOfRecordWithID_forOperation_withCompletionHandler_(v10, v17, (uint64_t)v13, v16, v19);

  return 1;
}

- (BOOL)_createAdditionalPCS
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_needsChainPCSCreation(self, a2, v2))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v4 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      v35 = v4;
      v38 = objc_msgSend_recordID(self, v36, v37);
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = v38;
      _os_log_debug_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_DEBUG, "PCS data from server for %@ has no PCS chaining blob. Creating it and saving the record to the server", buf, 0xCu);
    }
    uint64_t v7 = objc_msgSend_stateTransitionGroup(self, v5, v6);
    dispatch_group_enter(v7);

    v10 = objc_msgSend_recordPCSData(self, v8, v9);
    uint64_t v13 = objc_msgSend_recordType(v10, v11, v12);
    v16 = v13;
    if (v13)
    {
      id v17 = v13;
    }
    else
    {
      objc_msgSend_serverRecordType(self, v14, v15);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v18 = v17;

    id v19 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    v22 = objc_msgSend_recordID(self, v20, v21);
    v24 = objc_msgSend_initWithRecordType_recordID_(v19, v23, (uint64_t)v18, v22);

    objc_msgSend_setWantsChainPCS_(v24, v25, 1);
    uint64_t v26 = objc_opt_new();
    objc_msgSend_setSavePolicy_(v26, v27, 1);
    v41 = v24;
    v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v28, (uint64_t)&v41, 1);
    objc_msgSend_setRecordsToSave_(v26, v30, (uint64_t)v29);

    uint64_t v31 = objc_opt_class();
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = sub_1C4F67F24;
    v39[3] = &unk_1E64F0260;
    v39[4] = self;
    id v40 = v24;
    id v32 = v24;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v33, v31, v26, v39);
  }
  return 1;
}

- (BOOL)_fetchPCSForPrivateZone
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_recordPCSData(self, a2, v2);
  uint64_t v7 = objc_msgSend_pcs(v4, v5, v6);

  if (!v7)
  {
    v10 = objc_msgSend_recordPCSData(self, v8, v9);
    uint64_t v13 = objc_msgSend_zoneID(v10, v11, v12);

    v14 = (void *)MEMORY[0x1E4F1A550];
    uint64_t v15 = (os_log_t *)MEMORY[0x1E4F1A528];
    if (!v13)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      os_log_t v16 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_INFO))
      {
        id v19 = v16;
        v22 = objc_msgSend_recordID(self, v20, v21);
        *(_DWORD *)buf = 138412290;
        v52 = v22;
        _os_log_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_INFO, "Warn: We don't have a zone ID in our PCS data for record %@. Using the record's zone ID instead", buf, 0xCu);
      }
      uint64_t v23 = objc_msgSend_recordID(self, v17, v18);
      uint64_t v13 = objc_msgSend_zoneID(v23, v24, v25);
    }
    if (*v14 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v26 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEBUG))
    {
      v45 = v26;
      uint64_t v48 = objc_msgSend_recordID(self, v46, v47);
      *(_DWORD *)buf = 138412546;
      v52 = v13;
      __int16 v53 = 2112;
      v54 = v48;
      _os_log_debug_impl(&dword_1C4CFF000, v45, OS_LOG_TYPE_DEBUG, "Fetching PCS for zone %@ in order to decrypt record %@", buf, 0x16u);
    }
    v29 = objc_msgSend_stateTransitionGroup(self, v27, v28);
    dispatch_group_enter(v29);

    objc_initWeak((id *)buf, self);
    uint64_t Options = objc_msgSend_fetchOptions(self, v30, v31);
    v35 = objc_msgSend_recordPCSData(self, v33, v34);
    v38 = objc_msgSend_zoneishPublicKeyID(v35, v36, v37);

    v41 = objc_msgSend_cache(self, v39, v40);
    if (v38) {
      uint64_t v42 = Options | 8;
    }
    else {
      uint64_t v42 = Options;
    }
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = sub_1C4F68614;
    v49[3] = &unk_1E64F6F98;
    objc_copyWeak(&v50, (id *)buf);
    objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v41, v43, (uint64_t)v13, self, v42, v49);

    objc_destroyWeak(&v50);
    objc_destroyWeak((id *)buf);
  }
  return 1;
}

- (BOOL)_fetchDependentPCSInSharedDatabase
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  uint64_t v5 = objc_msgSend_recordPCSData(self, v3, v4);
  if (!objc_msgSend_pcs(v5, v6, v7))
  {

    goto LABEL_6;
  }
  if ((objc_msgSend_fetchOptions(self, v8, v9) & 0x10) == 0)
  {
LABEL_37:

    goto LABEL_38;
  }
  uint64_t v12 = objc_msgSend_recordPCSData(self, v10, v11);
  BOOL v15 = objc_msgSend_signingPCS(v12, v13, v14) == 0;

  if (v15)
  {
LABEL_6:
    uint64_t v5 = dispatch_group_create();
    uint64_t v18 = objc_msgSend_stateTransitionGroup(self, v16, v17);
    dispatch_group_enter(v18);

    v145[0] = 0;
    v145[1] = v145;
    v145[2] = 0x2020000000;
    char v146 = 0;
    uint64_t v21 = objc_msgSend_recordPCSData(self, v19, v20);
    v24 = objc_msgSend_shareID(v21, v22, v23);

    uint64_t v27 = objc_msgSend_recordPCSData(self, v25, v26);
    v30 = objc_msgSend_parentID(v27, v28, v29);

    uint64_t v33 = (void *)MEMORY[0x1E4F1A550];
    uint64_t v34 = (id *)MEMORY[0x1E4F1A528];
    if (v24)
    {
      v35 = objc_msgSend_container(self, v31, v32);
      v38 = objc_msgSend_containerID(v35, v36, v37);
      BOOL v41 = objc_msgSend_specialContainerType(v38, v39, v40) == 21;

      if (v41 || v30 == 0) {
        goto LABEL_15;
      }
    }
    else if (!v30)
    {
LABEL_20:
      v70 = objc_msgSend_recordPCSData(self, v31, v32);
      v73 = objc_msgSend_parentID(v70, v71, v72);
      BOOL v74 = v73 == 0;

      if (!v74)
      {
        v24 = 0;
LABEL_22:
        v75 = objc_msgSend_recordPCSData(self, v68, v69);
        objc_msgSend_zoneID(v75, v76, v77);
        id v78 = (id)objc_claimAutoreleasedReturnValue();

        if (v78) {
          goto LABEL_28;
        }
        if (*v33 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v79 = *v34;
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          v82 = objc_msgSend_recordID(self, v80, v81);
          *(_DWORD *)buf = 138412290;
          id v149 = v82;
          _os_log_impl(&dword_1C4CFF000, v79, OS_LOG_TYPE_INFO, "Warn: We don't have a zone ID in our PCS data for record %@. Using the record's zone ID instead", buf, 0xCu);
        }
        v85 = objc_msgSend_recordID(self, v83, v84);
        objc_msgSend_zoneID(v85, v86, v87);
        id v78 = (id)objc_claimAutoreleasedReturnValue();

        if (v78)
        {
LABEL_28:
          if (*v33 != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v90 = *v34;
          if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
          {
            v117 = objc_msgSend_recordID(self, v91, v92);
            *(_DWORD *)buf = 138412546;
            id v149 = v78;
            __int16 v150 = 2112;
            v151 = v117;
            _os_log_debug_impl(&dword_1C4CFF000, v90, OS_LOG_TYPE_DEBUG, "Fetching PCS for zone %@ in order to decrypt record %@", buf, 0x16u);
          }
          dispatch_group_enter(v5);
          uint64_t Options = objc_msgSend_fetchOptions(self, v93, v94);
          v98 = objc_msgSend_recordPCSData(self, v96, v97);
          v101 = objc_msgSend_zoneishPublicKeyID(v98, v99, v100);

          v104 = objc_msgSend_cache(self, v102, v103);
          if (v101) {
            uint64_t v105 = Options | 8;
          }
          else {
            uint64_t v105 = Options;
          }
          v132[0] = MEMORY[0x1E4F143A8];
          v132[1] = 3221225472;
          v132[2] = sub_1C4F693CC;
          v132[3] = &unk_1E64F7010;
          objc_copyWeak(&v136, &location);
          v132[4] = self;
          id v78 = v78;
          id v133 = v78;
          v135 = v145;
          v134 = v5;
          objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v104, v106, (uint64_t)v78, self, v105, v132);

          objc_destroyWeak(&v136);
        }
        v107 = objc_msgSend_callbackQueue(self, v88, v89);
        v127[0] = MEMORY[0x1E4F143A8];
        v127[1] = 3221225472;
        v127[2] = sub_1C4F69680;
        v127[3] = &unk_1E64F7038;
        objc_copyWeak(&v131, &location);
        id v129 = v78;
        v130 = v145;
        id v128 = v24;
        id v108 = v78;
        id v109 = v24;
        dispatch_group_notify(v5, v107, v127);

        objc_destroyWeak(&v131);
        _Block_object_dispose(v145, 8);
        goto LABEL_37;
      }
      if (*v33 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v111 = *v34;
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
      {
        v126 = objc_msgSend_recordID(self, v112, v113);
        *(_DWORD *)buf = 138412290;
        id v149 = v126;
        _os_log_debug_impl(&dword_1C4CFF000, v111, OS_LOG_TYPE_DEBUG, "Assuming %@ is a share since we have no share or parent ID set", buf, 0xCu);
      }
      uint64_t v116 = objc_msgSend_recordID(self, v114, v115);

      v24 = (void *)v116;
      if (!v116) {
        goto LABEL_22;
      }
LABEL_15:
      if (*v33 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v58 = *v34;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        v118 = objc_msgSend_recordID(self, v59, v60);
        *(_DWORD *)buf = 138412546;
        id v149 = v24;
        __int16 v150 = 2112;
        v151 = v118;
        _os_log_debug_impl(&dword_1C4CFF000, v58, OS_LOG_TYPE_DEBUG, "Fetching PCS for share %@ in order to decrypt record %@", buf, 0x16u);
      }
      dispatch_group_enter(v5);
      v63 = objc_msgSend_cache(self, v61, v62);
      uint64_t v66 = objc_msgSend_fetchOptions(self, v64, v65);
      v137[0] = MEMORY[0x1E4F143A8];
      v137[1] = 3221225472;
      v137[2] = sub_1C4F692C0;
      v137[3] = &unk_1E64F6FE8;
      objc_copyWeak(&v140, &location);
      v139 = v145;
      v138 = v5;
      objc_msgSend_fetchPCSForShareWithID_forOperation_options_withCompletionHandler_(v63, v67, (uint64_t)v24, self, v66, v137);

      objc_destroyWeak(&v140);
      goto LABEL_22;
    }
    if (*v33 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v42 = *v34;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      v119 = objc_msgSend_recordPCSData(self, v43, v44);
      v122 = objc_msgSend_parentID(v119, v120, v121);
      v125 = objc_msgSend_recordID(self, v123, v124);
      *(_DWORD *)buf = 138412546;
      id v149 = v122;
      __int16 v150 = 2112;
      v151 = v125;
      _os_log_debug_impl(&dword_1C4CFF000, v42, OS_LOG_TYPE_DEBUG, "Fetching parent PCS from record %@ for child record %@", buf, 0x16u);
    }
    uint64_t v47 = objc_msgSend_fetchOptions(self, v45, v46);
    dispatch_group_enter(v5);
    id v50 = objc_msgSend_cache(self, v48, v49);
    __int16 v53 = objc_msgSend_recordPCSData(self, v51, v52);
    v56 = objc_msgSend_parentID(v53, v54, v55);
    v141[0] = MEMORY[0x1E4F143A8];
    v141[1] = 3221225472;
    v141[2] = sub_1C4F691B4;
    v141[3] = &unk_1E64F6FC0;
    objc_copyWeak(&v144, &location);
    v143 = v145;
    v142 = v5;
    objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v50, v57, (uint64_t)v56, self, v47 | 4, v141);

    objc_destroyWeak(&v144);
    if (v24) {
      goto LABEL_15;
    }
    goto LABEL_20;
  }
LABEL_38:
  objc_destroyWeak(&location);
  return 1;
}

- (BOOL)_fetchDependentPCS
{
  uint64_t v5 = objc_msgSend_recordPCSData(self, a2, v2);

  if (!v5)
  {
    uint64_t v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    uint64_t v14 = objc_msgSend_recordID(self, v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v15, (uint64_t)a2, self, @"CKDPCSCacheRecordFetchOperation.m", 343, @"We should have PCS data for record %@ by this point", v14);
  }
  if (objc_msgSend_databaseScope(self, v6, v7) == 2)
  {
    return MEMORY[0x1F4181798](self, sel__fetchPCSForPrivateZone, v9);
  }
  else if (objc_msgSend_databaseScope(self, v8, v9) == 3)
  {
    return MEMORY[0x1F4181798](self, sel__fetchDependentPCSInSharedDatabase, v10);
  }
  else
  {
    return 1;
  }
}

- (BOOL)_decryptRecordPCSInPrivateDatabase
{
  uint64_t v4 = objc_msgSend_recordPCSData(self, a2, v2);
  uint64_t v7 = objc_msgSend_zonePCSData(v4, v5, v6);
  uint64_t v10 = objc_msgSend_pcs(v7, v8, v9);

  if (v10)
  {
    uint64_t v13 = objc_msgSend_recordPCSData(self, v11, v12);
    os_log_t v16 = objc_msgSend_zoneishPublicKeyID(v13, v14, v15);

    if (v16)
    {
      id v19 = objc_msgSend_recordPCSData(self, v17, v18);
      v22 = objc_msgSend_zonePCSData(v19, v20, v21);
      uint64_t v25 = objc_msgSend_zoneishPCS(v22, v23, v24);

      if (v25)
      {
        uint64_t v28 = objc_msgSend_recordPCSData(self, v26, v27);
        uint64_t v31 = objc_msgSend_zonePCSData(v28, v29, v30);
        uint64_t v34 = (const void *)objc_msgSend_zoneishPCS(v31, v32, v33);

        CFRetain(v34);
        if (v34)
        {
          id v35 = 0;
          goto LABEL_14;
        }
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v46 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_ERROR, "Record has a zoneish public key set, but we didn't fetch a zoneish PCS on this zone. We'll try decrypting the record PCS anyway, but this might fail.", buf, 2u);
        }
      }
    }
    uint64_t v47 = objc_msgSend_container(self, v17, v18);
    id v50 = objc_msgSend_pcsManager(v47, v48, v49);
    __int16 v53 = objc_msgSend_recordPCSData(self, v51, v52);
    v56 = objc_msgSend_pcsData(v53, v54, v55);
    v59 = objc_msgSend_recordPCSData(self, v57, v58);
    uint64_t v62 = objc_msgSend_zonePCSData(v59, v60, v61);
    uint64_t v65 = objc_msgSend_pcs(v62, v63, v64);
    id v77 = 0;
    uint64_t v34 = (const void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v50, v66, (uint64_t)v56, 1, v65, &v77);
    id v35 = v77;

    if (!v34)
    {
      uint64_t v69 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v70 = *MEMORY[0x1E4F19DD8];
      v71 = objc_msgSend_recordID(self, v17, v18);
      v73 = objc_msgSend_errorWithDomain_code_error_format_(v69, v72, v70, 5004, v35, @"Failed to decrypt PCS data for record %@", v71);
      objc_msgSend_setFetchError_(self, v74, (uint64_t)v73);

      objc_msgSend_setShouldRetry_(self, v75, 1);
      BOOL v45 = 0;
      goto LABEL_16;
    }
LABEL_14:
    v67 = objc_msgSend_recordPCSData(self, v17, v18);
    objc_msgSend_setPcs_(v67, v68, (uint64_t)v34);

    CFRelease(v34);
    BOOL v45 = 1;
LABEL_16:

    return v45;
  }
  uint64_t v36 = objc_msgSend_fetchError(self, v11, v12);

  if (!v36)
  {
    uint64_t v39 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v40 = *MEMORY[0x1E4F19DD8];
    BOOL v41 = objc_msgSend_recordID(self, v37, v38);
    uint64_t v43 = objc_msgSend_errorWithDomain_code_format_(v39, v42, v40, 5004, @"We couldn't get zone PCS data for record %@", v41);
    objc_msgSend_setFetchError_(self, v44, (uint64_t)v43);
  }
  return 0;
}

- (BOOL)_decryptRecordPCSInSharedDatabase
{
  uint64_t v161 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_recordPCSData(self, a2, v2);
  v8 = objc_msgSend_parentPCSData(v5, v6, v7);
  uint64_t v11 = objc_msgSend_chainPCSData(v8, v9, v10);
  uint64_t v14 = objc_msgSend_pcs(v11, v12, v13);

  if (v14)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v17 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v121 = v17;
      uint64_t v124 = objc_msgSend_recordID(self, v122, v123);
      v127 = objc_msgSend_recordPCSData(self, v125, v126);
      v130 = objc_msgSend_parentID(v127, v128, v129);
      *(_DWORD *)buf = 138412546;
      v158 = v124;
      __int16 v159 = 2112;
      v160 = v130;
      _os_log_debug_impl(&dword_1C4CFF000, v121, OS_LOG_TYPE_DEBUG, "Attempting a decrypt of record %@ via its parent PCS (record %@)", buf, 0x16u);
    }
    uint64_t v20 = objc_msgSend_recordPCSData(self, v18, v19);
    uint64_t v23 = objc_msgSend_parentPCSData(v20, v21, v22);
    uint64_t v26 = objc_msgSend_chainPCSData(v23, v24, v25);
    uint64_t v29 = objc_msgSend_pcs(v26, v27, v28);

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v34 = objc_msgSend_recordPCSData(self, v15, v16);
  uint64_t v37 = objc_msgSend_zonePCSData(v34, v35, v36);
  uint64_t v40 = objc_msgSend_pcs(v37, v38, v39);

  if (!v40)
  {
    v88 = objc_msgSend_recordPCSData(self, v41, v42);
    v91 = objc_msgSend_sharePCSData(v88, v89, v90);
    uint64_t v94 = objc_msgSend_pcs(v91, v92, v93);

    if (!v94) {
      goto LABEL_27;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v95 = (id)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
    {
      id v144 = objc_msgSend_recordID(self, v96, v97);
      v147 = objc_msgSend_recordPCSData(self, v145, v146);
      uint64_t v152 = objc_msgSend_shareID(v147, v148, v149);
      v153 = v152;
      if (!v152)
      {
        v3 = objc_msgSend_recordPCSData(self, v150, v151);
        v153 = objc_msgSend_sharePCSData(v3, v154, v155);
      }
      *(_DWORD *)buf = 138412546;
      v158 = v144;
      __int16 v159 = 2112;
      v160 = v153;
      _os_log_debug_impl(&dword_1C4CFF000, v95, OS_LOG_TYPE_DEBUG, "Attempting a decrypt of record %@ via its share PCS (record %@)", buf, 0x16u);
      if (!v152)
      {
      }
    }

    uint64_t v20 = objc_msgSend_recordPCSData(self, v98, v99);
    uint64_t v23 = objc_msgSend_sharePCSData(v20, v100, v101);
    uint64_t v29 = objc_msgSend_pcs(v23, v102, v103);
    goto LABEL_7;
  }
  uint64_t v43 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v44 = (void *)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    id v131 = v44;
    v134 = objc_msgSend_recordID(self, v132, v133);
    v137 = objc_msgSend_recordPCSData(self, v135, v136);
    id v140 = objc_msgSend_zonePCSData(v137, v138, v139);
    v143 = objc_msgSend_zoneID(v140, v141, v142);
    *(_DWORD *)buf = 138412546;
    v158 = v134;
    __int16 v159 = 2112;
    v160 = v143;
    _os_log_debug_impl(&dword_1C4CFF000, v131, OS_LOG_TYPE_DEBUG, "Attempting a decrypt of record %@ via its shared zone PCS (zone %@)", buf, 0x16u);
  }
  uint64_t v47 = objc_msgSend_recordPCSData(self, v45, v46);
  id v50 = objc_msgSend_zonePCSData(v47, v48, v49);
  uint64_t v29 = objc_msgSend_pcs(v50, v51, v52);

  uint64_t v55 = objc_msgSend_recordPCSData(self, v53, v54);
  uint64_t v58 = objc_msgSend_zoneishPublicKeyID(v55, v56, v57);

  if (v58)
  {
    v59 = objc_msgSend_recordPCSData(self, v30, v31);
    uint64_t v62 = objc_msgSend_zonePCSData(v59, v60, v61);
    uint64_t v65 = objc_msgSend_zoneishPCS(v62, v63, v64);

    if (v65)
    {
      v68 = objc_msgSend_recordPCSData(self, v66, v67);
      v71 = objc_msgSend_zonePCSData(v68, v69, v70);
      uint64_t v32 = (const void *)objc_msgSend_zoneishPCS(v71, v72, v73);

      CFRetain(v32);
      if (v29) {
        goto LABEL_9;
      }
      goto LABEL_27;
    }
    if (*v43 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v120 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C4CFF000, v120, OS_LOG_TYPE_ERROR, "Record has a zoneish public key set, but we didn't fetch a zoneish PCS on this zone. We'll try decrypting the record PCS anyway, but this might fail.", buf, 2u);
    }
  }
LABEL_8:
  uint64_t v32 = 0;
  if (v29)
  {
LABEL_9:
    if (v32)
    {
      id v33 = 0;
LABEL_21:
      v85 = objc_msgSend_recordPCSData(self, v30, v31);
      objc_msgSend_setPcs_(v85, v86, (uint64_t)v32);

      CFRelease(v32);
      BOOL v87 = 1;
LABEL_32:

      return v87;
    }
    BOOL v74 = objc_msgSend_container(self, v30, v31);
    id v77 = objc_msgSend_pcsManager(v74, v75, v76);
    v80 = objc_msgSend_recordPCSData(self, v78, v79);
    v83 = objc_msgSend_pcsData(v80, v81, v82);
    id v156 = 0;
    uint64_t v32 = (const void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v77, v84, (uint64_t)v83, 1, v29, &v156);
    id v33 = v156;

    if (v32) {
      goto LABEL_21;
    }
    v112 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v113 = *MEMORY[0x1E4F19DD8];
    v114 = objc_msgSend_recordID(self, v30, v31);
    uint64_t v116 = objc_msgSend_errorWithDomain_code_error_format_(v112, v115, v113, 5004, v33, @"Failed to decrypt PCS data for record %@", v114);
    objc_msgSend_setFetchError_(self, v117, (uint64_t)v116);

    objc_msgSend_setShouldRetry_(self, v118, 1);
LABEL_31:
    BOOL v87 = 0;
    goto LABEL_32;
  }
LABEL_27:
  v104 = objc_msgSend_fetchError(self, v30, v31);

  if (!v104)
  {
    v107 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v108 = *MEMORY[0x1E4F19DD8];
    objc_msgSend_recordID(self, v105, v106);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend_errorWithDomain_code_format_(v107, v109, v108, 5004, @"We couldn't get any dependent PCS data to decrypt shared record %@", v33);
    objc_msgSend_setFetchError_(self, v111, (uint64_t)v110);

    goto LABEL_31;
  }
  return 0;
}

- (BOOL)_decryptPCS
{
  uint64_t v236 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_recordPCSData(self, a2, v2);
  uint64_t v7 = objc_msgSend_pcsData(v4, v5, v6);
  if (v7)
  {
  }
  else
  {
    uint64_t v12 = objc_msgSend_recordPCSData(self, v8, v9);
    uint64_t v15 = objc_msgSend_zoneishPublicKeyID(v12, v13, v14);

    if (!v15)
    {
      uint64_t v54 = objc_msgSend_fetchError(self, v10, v11);

      if (!v54)
      {
        uint64_t v57 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v58 = objc_msgSend_recordID(self, v55, v56);
        uint64_t v60 = objc_msgSend_errorWithDomain_code_format_(v57, v59, *MEMORY[0x1E4F19DD8], 5004, @"We don't have record PCS data for record %@", v58);
        objc_msgSend_setFetchError_(self, v61, (uint64_t)v60);
      }
      LOBYTE(shouldRetry) = 0;
      return shouldRetry;
    }
  }
  if (objc_msgSend_databaseScope(self, v10, v11) == 2)
  {
    char v18 = objc_msgSend__decryptRecordPCSInPrivateDatabase(self, v16, v17);
LABEL_8:
    char v21 = v18;
    goto LABEL_10;
  }
  if (objc_msgSend_databaseScope(self, v16, v17) == 3)
  {
    char v18 = objc_msgSend__decryptRecordPCSInSharedDatabase(self, v19, v20);
    goto LABEL_8;
  }
  char v21 = 1;
LABEL_10:
  if ((objc_msgSend_fetchOptions(self, v19, v20) & 4) != 0)
  {
    uint64_t v24 = objc_msgSend_recordPCSData(self, v22, v23);
    uint64_t v27 = objc_msgSend_chainPCSData(v24, v25, v26);

    if (v27)
    {
      uint64_t v30 = objc_msgSend_container(self, v28, v29);
      id v33 = objc_msgSend_pcsManager(v30, v31, v32);
      uint64_t v36 = objc_msgSend_recordPCSData(self, v34, v35);
      uint64_t v38 = objc_msgSend_decryptChainPCSForRecordPCS_(v33, v37, (uint64_t)v36);

      if (v38
        || (objc_msgSend_recordPCSData(self, v39, v40),
            v63 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_chainPCSData(v63, v64, v65),
            uint64_t v66 = objc_claimAutoreleasedReturnValue(),
            uint64_t v69 = objc_msgSend_pcs(v66, v67, v68),
            v66,
            v63,
            !v69))
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        BOOL v41 = (void *)*MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
        {
          v207 = v41;
          v210 = objc_msgSend_recordID(self, v208, v209);
          *(_DWORD *)buf = 138412546;
          v233 = v210;
          __int16 v234 = 2112;
          v235 = v38;
          _os_log_debug_impl(&dword_1C4CFF000, v207, OS_LOG_TYPE_DEBUG, "Error decrypting chain PCS on record %@: %@", buf, 0x16u);
        }
        uint64_t v44 = (void *)MEMORY[0x1E4F1A280];
        BOOL v45 = objc_msgSend_recordID(self, v42, v43);
        uint64_t v47 = objc_msgSend_errorWithDomain_code_error_format_(v44, v46, *MEMORY[0x1E4F19DD8], 5004, v38, @"Couldn't decrypt chain PCS on record %@", v45);
        objc_msgSend_setFetchError_(self, v48, (uint64_t)v47);
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v70 = (void *)*MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
        {
          v215 = v70;
          v218 = objc_msgSend_recordID(self, v216, v217);
          *(_DWORD *)buf = 138412290;
          v233 = v218;
          _os_log_debug_impl(&dword_1C4CFF000, v215, OS_LOG_TYPE_DEBUG, "Successfully decrypted chain PCS data on record %@", buf, 0xCu);
        }
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v49 = (void *)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        id v50 = v49;
        __int16 v53 = objc_msgSend_recordID(self, v51, v52);
        *(_DWORD *)buf = 138412290;
        v233 = v53;
        _os_log_debug_impl(&dword_1C4CFF000, v50, OS_LOG_TYPE_DEBUG, "Didn't get any chain PCS data on record %@, but the client requested it. This might be ok since the client might want to create it", buf, 0xCu);
      }
    }
  }
  if (*MEMORY[0x1E4F1A4E0])
  {
    v71 = objc_msgSend_unitTestOverrides(self, v22, v23);
    uint64_t v73 = objc_msgSend_objectForKeyedSubscript_(v71, v72, @"ReturnWrappedEPSKForRecordPCS");

    if (v73)
    {
      BOOL v74 = objc_msgSend_recordPCSData(self, v22, v23);
      id v77 = objc_msgSend_encryptedPublicSharingKey(v74, v75, v76);
      objc_msgSend_setData_(v77, v78, 0);
    }
  }
  uint64_t v79 = objc_msgSend_recordPCSData(self, v22, v23);
  uint64_t v84 = objc_msgSend_encryptedPublicSharingKey(v79, v80, v81);
  if (!v84) {
    goto LABEL_50;
  }
  v85 = objc_msgSend_recordPCSData(self, v82, v83);
  v88 = objc_msgSend_encryptedPublicSharingKey(v85, v86, v87);
  v91 = objc_msgSend_data(v88, v89, v90);
  if (v91)
  {

LABEL_49:
LABEL_50:

    goto LABEL_51;
  }
  uint64_t v94 = objc_msgSend_recordPCSData(self, v92, v93);
  BOOL v97 = objc_msgSend_pcs(v94, v95, v96) == 0;

  if (!v97)
  {
    uint64_t v100 = [CKDWrappingContext alloc];
    uint64_t v103 = objc_msgSend_recordID(self, v101, v102);
    uint64_t v79 = objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v100, v104, (uint64_t)v103, *MEMORY[0x1E4F1A5D0], 0, 0, 0);

    v107 = objc_msgSend_container(self, v105, v106);
    v110 = objc_msgSend_pcsManager(v107, v108, v109);
    uint64_t v113 = objc_msgSend_recordPCSData(self, v111, v112);
    uint64_t v116 = objc_msgSend_encryptedPublicSharingKey(v113, v114, v115);
    v119 = objc_msgSend_recordPCSData(self, v117, v118);
    uint64_t v122 = objc_msgSend_pcs(v119, v120, v121);
    uint64_t v84 = objc_msgSend_unwrapEncryptedData_withPCS_inContext_(v110, v123, (uint64_t)v116, v122, v79);

    if (v84) {
      goto LABEL_39;
    }
    v134 = objc_msgSend_recordPCSData(self, v124, v125);
    v137 = objc_msgSend_encryptedPublicSharingKey(v134, v135, v136);
    id v140 = objc_msgSend_data(v137, v138, v139);
    BOOL v141 = v140 == 0;

    if (v141)
    {
LABEL_39:
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v126 = (void *)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        v211 = v126;
        v214 = objc_msgSend_recordID(self, v212, v213);
        *(_DWORD *)buf = 138412546;
        v233 = v214;
        __int16 v234 = 2112;
        v235 = v84;
        _os_log_debug_impl(&dword_1C4CFF000, v211, OS_LOG_TYPE_DEBUG, "Error decrypting public sharing key on record %@: %@", buf, 0x16u);
      }
      uint64_t v129 = (void *)MEMORY[0x1E4F1A280];
      v130 = objc_msgSend_recordID(self, v127, v128);
      v132 = objc_msgSend_errorWithDomain_code_error_format_(v129, v131, *MEMORY[0x1E4F19DD8], 5004, v84, @"Couldn't decrypt public sharing key on record %@", v130);
      objc_msgSend_setFetchError_(self, v133, (uint64_t)v132);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v142 = (void *)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
      {
        v219 = v142;
        v222 = objc_msgSend_recordID(self, v220, v221);
        *(_DWORD *)buf = 138412290;
        v233 = v222;
        _os_log_debug_impl(&dword_1C4CFF000, v219, OS_LOG_TYPE_DEBUG, "Successfully decrypted public sharing key on record %@", buf, 0xCu);
      }
    }
    goto LABEL_49;
  }
LABEL_51:
  if (v21)
  {
LABEL_61:
    LOBYTE(shouldRetry) = 1;
    return shouldRetry;
  }
  if ((objc_msgSend_wasFetchedFromCache(self, v98, v99) & 1) != 0
    || (int shouldRetry = objc_msgSend_shouldRetry(self, v143, v144)) != 0)
  {
    objc_initWeak((id *)buf, self);
    v147 = objc_msgSend_stateTransitionGroup(self, v145, v146);
    dispatch_group_enter(v147);

    __int16 v150 = objc_msgSend_cache(self, v148, v149);
    v153 = objc_msgSend_recordID(self, v151, v152);
    uint64_t v156 = objc_msgSend_databaseScope(self, v154, v155);
    v230[0] = MEMORY[0x1E4F143A8];
    v230[1] = 3221225472;
    v230[2] = sub_1C4F6B19C;
    v230[3] = &unk_1E64F22C0;
    objc_copyWeak(&v231, (id *)buf);
    objc_msgSend__setPCSData_forFetchedRecordID_withScope_withCompletionHandler_(v150, v157, 0, v153, v156, v230);

    v160 = objc_msgSend_recordPCSData(self, v158, v159);
    v163 = objc_msgSend_zoneID(v160, v161, v162);

    if (!v163)
    {
      v166 = objc_msgSend_recordID(self, v164, v165);
      v163 = objc_msgSend_zoneID(v166, v167, v168);
    }
    v169 = objc_msgSend_stateTransitionGroup(self, v164, v165);
    dispatch_group_enter(v169);

    v172 = objc_msgSend_cache(self, v170, v171);
    uint64_t v175 = objc_msgSend_databaseScope(self, v173, v174);
    v228[0] = MEMORY[0x1E4F143A8];
    v228[1] = 3221225472;
    v228[2] = sub_1C4F6B1F4;
    v228[3] = &unk_1E64F22C0;
    objc_copyWeak(&v229, (id *)buf);
    objc_msgSend__setPCSData_forFetchedZoneID_withScope_withCompletionHandler_(v172, v176, 0, v163, v175, v228);

    v179 = objc_msgSend_recordPCSData(self, v177, v178);
    v182 = objc_msgSend_shareID(v179, v180, v181);

    if (v182)
    {
      v185 = objc_msgSend_stateTransitionGroup(self, v183, v184);
      dispatch_group_enter(v185);

      v188 = objc_msgSend_cache(self, v186, v187);
      uint64_t v191 = objc_msgSend_databaseScope(self, v189, v190);
      v226[0] = MEMORY[0x1E4F143A8];
      v226[1] = 3221225472;
      v226[2] = sub_1C4F6B24C;
      v226[3] = &unk_1E64F22C0;
      objc_copyWeak(&v227, (id *)buf);
      objc_msgSend__setPCSData_forFetchedShareID_withScope_withCompletionHandler_(v188, v192, 0, v182, v191, v226);

      objc_destroyWeak(&v227);
    }
    v193 = objc_msgSend_recordPCSData(self, v183, v184);
    v196 = objc_msgSend_parentID(v193, v194, v195);

    if (v196)
    {
      v199 = objc_msgSend_stateTransitionGroup(self, v197, v198);
      dispatch_group_enter(v199);

      v202 = objc_msgSend_cache(self, v200, v201);
      uint64_t v205 = objc_msgSend_databaseScope(self, v203, v204);
      v224[0] = MEMORY[0x1E4F143A8];
      v224[1] = 3221225472;
      v224[2] = sub_1C4F6B2A4;
      v224[3] = &unk_1E64F22C0;
      objc_copyWeak(&v225, (id *)buf);
      objc_msgSend__setPCSData_forFetchedRecordID_withScope_withCompletionHandler_(v202, v206, 0, v196, v205, v224);

      objc_destroyWeak(&v225);
    }

    objc_destroyWeak(&v229);
    objc_destroyWeak(&v231);
    objc_destroyWeak((id *)buf);
    goto LABEL_61;
  }
  return shouldRetry;
}

- (BOOL)_savePCSDataToCache
{
  objc_initWeak(&location, self);
  if (objc_msgSend_wasFetchedFromCache(self, v3, v4))
  {
    uint64_t v7 = objc_msgSend_stateTransitionGroup(self, v5, v6);
    dispatch_group_enter(v7);

    uint64_t v10 = objc_msgSend_cache(self, v8, v9);
    uint64_t v13 = objc_msgSend_recordPCSData(self, v11, v12);
    uint64_t v16 = objc_msgSend_recordID(self, v14, v15);
    uint64_t v19 = objc_msgSend_databaseScope(self, v17, v18);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = sub_1C4F6B570;
    v34[3] = &unk_1E64F22C0;
    uint64_t v20 = &v35;
    objc_copyWeak(&v35, &location);
    objc_msgSend_updateMemoryCacheWithRecordPCSData_forRecordWithID_databaseScope_withCompletionHandler_(v10, v21, (uint64_t)v13, v16, v19, v34);
  }
  else
  {
    uint64_t v22 = objc_msgSend_stateTransitionGroup(self, v5, v6);
    dispatch_group_enter(v22);

    uint64_t v10 = objc_msgSend_cache(self, v23, v24);
    uint64_t v13 = objc_msgSend_recordPCSData(self, v25, v26);
    uint64_t v16 = objc_msgSend_recordID(self, v27, v28);
    uint64_t v31 = objc_msgSend_databaseScope(self, v29, v30);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = sub_1C4F6B518;
    v36[3] = &unk_1E64F22C0;
    uint64_t v20 = &v37;
    objc_copyWeak(&v37, &location);
    objc_msgSend__setPCSData_forFetchedRecordID_withScope_withCompletionHandler_(v10, v32, (uint64_t)v13, v16, v31, v36);
  }

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  return 1;
}

- (BOOL)serverRecordHasNoProtectionData
{
  return self->_serverRecordHasNoProtectionData;
}

- (void)setServerRecordHasNoProtectionData:(BOOL)a3
{
  self->_serverRecordHasNoProtectionData = a3;
}

- (NSString)serverRecordType
{
  return self->_serverRecordType;
}

- (void)setServerRecordType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end