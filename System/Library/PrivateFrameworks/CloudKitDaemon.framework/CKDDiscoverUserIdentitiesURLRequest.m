@interface CKDDiscoverUserIdentitiesURLRequest
- (BOOL)adopterProvidedLookupInfos;
- (BOOL)wantsProtectionInfo;
- (CKDDiscoverUserIdentitiesURLRequest)initWithOperation:(id)a3 lookupInfos:(id)a4 adopterProvidedLookupInfos:(BOOL)a5;
- (NSArray)infosToDiscover;
- (NSMutableDictionary)submittedInfos;
- (id)generateRequestOperations;
- (id)progressBlock;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (int64_t)databaseScope;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setProgressBlock:(id)a3;
- (void)setWantsProtectionInfo:(BOOL)a3;
@end

@implementation CKDDiscoverUserIdentitiesURLRequest

- (CKDDiscoverUserIdentitiesURLRequest)initWithOperation:(id)a3 lookupInfos:(id)a4 adopterProvidedLookupInfos:(BOOL)a5
{
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CKDDiscoverUserIdentitiesURLRequest;
  v10 = [(CKDURLRequest *)&v15 initWithOperation:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_infosToDiscover, a4);
    uint64_t v12 = objc_opt_new();
    submittedInfos = v11->_submittedInfos;
    v11->_submittedInfos = (NSMutableDictionary *)v12;

    v11->_adopterProvidedLookupInfos = a5;
  }

  return v11;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKDDiscoverUserIdentitiesURLRequest;
  [(CKDURLRequest *)&v17 fillOutEquivalencyPropertiesBuilder:v4];
  if (objc_msgSend_adopterProvidedLookupInfos(self, v5, v6))
  {
    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    v10 = objc_msgSend_infosToDiscover(self, v7, v8);
    v13 = objc_msgSend_ckEquivalencyProperties(v10, v11, v12);
    objc_super v15 = objc_msgSend_setWithArray_(v9, v14, (uint64_t)v13);

    objc_msgSend_setObject_forKeyedSubscript_(v4, v16, (uint64_t)v15, @"lookupInfos");
  }
}

- (int64_t)databaseScope
{
  return 1;
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (id)generateRequestOperations
{
  id v4 = objc_msgSend_infosToDiscover(self, a2, v2);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4F58364;
  v8[3] = &unk_1E64F6CF8;
  v8[4] = self;
  uint64_t v6 = objc_msgSend_CKMap_(v4, v5, (uint64_t)v8);

  return v6;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v171 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_hasUserQueryResponse(v4, v5, v6)
    && (objc_msgSend_userQueryResponse(v4, v7, v8),
        id v9 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_user(v9, v10, v11),
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v9,
        v12))
  {
    if (objc_msgSend_hasIdentifier(v12, v7, v8))
    {
      objc_super v15 = objc_msgSend_identifier(v12, v13, v14);
      if (objc_msgSend_hasName(v15, v16, v17))
      {
        v20 = objc_msgSend_identifier(v12, v18, v19);
        v166 = objc_msgSend_name(v20, v21, v22);
      }
      else
      {
        v166 = 0;
      }
    }
    else
    {
      v166 = 0;
    }
    if (objc_msgSend_hasFirstName(v12, v13, v14))
    {
      uint64_t v23 = objc_msgSend_firstName(v12, v27, v28);
    }
    else
    {
      uint64_t v23 = 0;
    }
    if (objc_msgSend_hasLastName(v12, v27, v28))
    {
      v24 = objc_msgSend_lastName(v12, v7, v8);
    }
    else
    {
      v24 = 0;
    }
    p_wantsProtectionInfo = &self->_wantsProtectionInfo;
    if (self->_wantsProtectionInfo && objc_msgSend_hasProtectionInfo(v12, v7, v8))
    {
      v25 = objc_msgSend_protectionInfo(v12, v7, v8);
    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    v166 = 0;
    uint64_t v12 = 0;
    uint64_t v23 = 0;
    v24 = 0;
    v25 = 0;
    p_wantsProtectionInfo = &self->_wantsProtectionInfo;
  }
  submittedInfos = self->_submittedInfos;
  v30 = objc_msgSend_response(v4, v7, v8);
  v33 = objc_msgSend_operationUUID(v30, v31, v32);
  v35 = objc_msgSend_objectForKeyedSubscript_(submittedInfos, v34, (uint64_t)v33);

  v38 = objc_msgSend_fakeResponseOperationResultByItemID(self, v36, v37);

  if (v38)
  {
    v41 = objc_msgSend_fakeResponseOperationResultByItemID(self, v39, v40);
    inited = objc_msgSend_objectForKeyedSubscript_(v41, v42, (uint64_t)v35);

    if (inited)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v44 = (void *)v23;
      v45 = (void *)*MEMORY[0x1E4F1A530];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
      {
        v153 = v45;
        v156 = objc_msgSend_requestUUID(self, v154, v155);
        *(_DWORD *)buf = 138543618;
        v168 = v156;
        __int16 v169 = 2112;
        v170 = v35;
        _os_log_error_impl(&dword_1C4CFF000, v153, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Inlining fake response operation result for item id %@\"", buf, 0x16u);
      }
      objc_msgSend_setResult_(v4, v46, (uint64_t)inited);
      v49 = objc_msgSend_progressBlock(self, v47, v48);

      if (!v49) {
        goto LABEL_56;
      }
      objc_msgSend_progressBlock(self, v50, v51);
      v52 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend_result(v4, v53, v54);
      ((void (**)(void, void *, void, void *))v52)[2](v52, v35, 0, v55);
      goto LABEL_55;
    }
  }
  v56 = objc_msgSend_alias(v12, v39, v40);
  int v59 = objc_msgSend_type(v56, v57, v58);

  if (v59 == 1)
  {
    BOOL v62 = (int)v166;
    if (!v166) {
      goto LABEL_38;
    }
    uint64_t v63 = 1;
    goto LABEL_37;
  }
  v64 = objc_msgSend_alias(v12, v60, v61);
  int v67 = objc_msgSend_type(v64, v65, v66);

  if (v67 == 2)
  {
    BOOL v62 = (int)v166;
    if (!v166) {
      goto LABEL_38;
    }
    uint64_t v63 = 2;
    goto LABEL_37;
  }
  v68 = objc_msgSend_alias(v12, v60, v61);
  int v71 = objc_msgSend_type(v68, v69, v70);

  BOOL v62 = 0;
  if (v71 == 3 && v166)
  {
    uint64_t v63 = 3;
LABEL_37:
    BOOL v62 = objc_msgSend_lookupField(v35, v60, v61) == v63;
  }
LABEL_38:
  if (v25)
  {
    v44 = (void *)v23;
    if (v62)
    {
      id v72 = objc_alloc(MEMORY[0x1E4F1A2F8]);
      v74 = objc_msgSend_initWithRecordName_(v72, v73, (uint64_t)v166);
      id v75 = objc_alloc(MEMORY[0x1E4F1A480]);
      inited = objc_msgSend_initWithUserRecordID_(v75, v76, (uint64_t)v74);
    }
    else
    {
      id v99 = objc_alloc(MEMORY[0x1E4F1A480]);
      inited = objc_msgSend_initInternal(v99, v100, v101);
    }
    objc_msgSend_setLookupInfo_(inited, v77, (uint64_t)v35);
    v104 = objc_msgSend_nameComponents(inited, v102, v103);
    objc_msgSend_setGivenName_(v104, v105, v23);

    v108 = objc_msgSend_nameComponents(inited, v106, v107);
    objc_msgSend_setFamilyName_(v108, v109, (uint64_t)v24);

    v112 = objc_msgSend_protectionInfo(v25, v110, v111);
    objc_msgSend_setPublicSharingKey_(inited, v113, (uint64_t)v112);

LABEL_53:
    v114 = objc_msgSend_progressBlock(self, v97, v98);

    if (!v114)
    {
LABEL_56:

      goto LABEL_57;
    }
    objc_msgSend_progressBlock(self, v115, v116);
    v52 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend_result(v4, v117, v118);
    ((void (**)(void, void *, void *, void *))v52)[2](v52, v35, inited, v55);
LABEL_55:

    goto LABEL_56;
  }
  if (*p_wantsProtectionInfo)
  {
    v78 = (void *)MEMORY[0x1E4F1A550];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v79 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG))
    {
      v157 = v79;
      v160 = objc_msgSend_requestUUID(self, v158, v159);
      *(_DWORD *)buf = 138543362;
      v168 = v160;
      _os_log_debug_impl(&dword_1C4CFF000, v157, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Received no public key when discovering user identity, though it was requested, this is an OON case\"", buf, 0xCu);
    }
    id v80 = objc_alloc(MEMORY[0x1E4F1A480]);
    inited = objc_msgSend_initInternal(v80, v81, v82);
    objc_msgSend_setLookupInfo_(inited, v83, (uint64_t)v35);
    v86 = objc_msgSend_nameComponents(inited, v84, v85);
    objc_msgSend_setGivenName_(v86, v87, v23);

    v90 = objc_msgSend_nameComponents(inited, v88, v89);
    objc_msgSend_setFamilyName_(v90, v91, (uint64_t)v24);

    if (*v78 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v92 = (void *)*MEMORY[0x1E4F1A530];
    v44 = (void *)v23;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG))
    {
      v161 = v92;
      v164 = objc_msgSend_requestUUID(self, v162, v163);
      *(_DWORD *)buf = 138543618;
      v168 = v164;
      __int16 v169 = 2112;
      v170 = inited;
      _os_log_debug_impl(&dword_1C4CFF000, v161, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"OON user identity detected: %@\"", buf, 0x16u);
    }
    uint64_t v95 = objc_msgSend_isInNetwork(v12, v93, v94);
    objc_msgSend_setHasiCloudAccount_(inited, v96, v95);
    goto LABEL_53;
  }
  if (v62)
  {
    id v120 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    uint64_t v122 = objc_msgSend_initWithRecordName_(v120, v121, (uint64_t)v166);
    id v123 = objc_alloc(MEMORY[0x1E4F1A480]);
    v165 = (void *)v122;
    v125 = objc_msgSend_initWithUserRecordID_(v123, v124, v122);
    objc_msgSend_setLookupInfo_(v125, v126, (uint64_t)v35);
    v129 = objc_msgSend_nameComponents(v125, v127, v128);
    v44 = (void *)v23;
    objc_msgSend_setGivenName_(v129, v130, v23);

    v133 = objc_msgSend_nameComponents(v125, v131, v132);
    objc_msgSend_setFamilyName_(v133, v134, (uint64_t)v24);

    v137 = objc_msgSend_progressBlock(self, v135, v136);

    if (v137)
    {
      objc_msgSend_progressBlock(self, v138, v139);
      v140 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      v143 = objc_msgSend_result(v4, v141, v142);
      ((void (**)(void, void *, void *, void *))v140)[2](v140, v35, v125, v143);
    }
  }
  else
  {
    v44 = (void *)v23;
    if (objc_msgSend_shouldReportMissingIdentity(v35, v60, v61))
    {
      v146 = objc_msgSend_progressBlock(self, v144, v145);

      if (v146)
      {
        objc_msgSend_progressBlock(self, v147, v148);
        v149 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
        v152 = objc_msgSend_result(v4, v150, v151);
        ((void (**)(void, void *, void, void *))v149)[2](v149, v35, 0, v152);
      }
    }
  }
LABEL_57:

  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  submittedInfos = self->_submittedInfos;
  uint64_t v8 = objc_msgSend_response(v4, v6, v7);
  uint64_t v11 = objc_msgSend_operationUUID(v8, v9, v10);
  v13 = objc_msgSend_objectForKeyedSubscript_(submittedInfos, v12, (uint64_t)v11);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v14 = (void *)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = v14;
    v20 = objc_msgSend_requestUUID(self, v18, v19);
    uint64_t v23 = objc_msgSend_result(v4, v21, v22);
    int v31 = 138543874;
    uint64_t v32 = v20;
    __int16 v33 = 2112;
    v34 = v13;
    __int16 v35 = 2112;
    v36 = v23;
    _os_log_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_INFO, "req: %{public}@, \"Node level failure for info %@: %@\"", (uint8_t *)&v31, 0x20u);
  }
  v24 = objc_msgSend_progressBlock(self, v15, v16);

  if (v24)
  {
    objc_msgSend_progressBlock(self, v25, v26);
    v27 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_result(v4, v28, v29);
    ((void (**)(void, void *, void, void *))v27)[2](v27, v13, 0, v30);
  }
}

- (BOOL)wantsProtectionInfo
{
  return self->_wantsProtectionInfo;
}

- (void)setWantsProtectionInfo:(BOOL)a3
{
  self->_wantsProtectionInfo = a3;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
}

- (NSArray)infosToDiscover
{
  return self->_infosToDiscover;
}

- (NSMutableDictionary)submittedInfos
{
  return self->_submittedInfos;
}

- (BOOL)adopterProvidedLookupInfos
{
  return self->_adopterProvidedLookupInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submittedInfos, 0);
  objc_storeStrong((id *)&self->_infosToDiscover, 0);
  objc_storeStrong(&self->_progressBlock, 0);
}

@end