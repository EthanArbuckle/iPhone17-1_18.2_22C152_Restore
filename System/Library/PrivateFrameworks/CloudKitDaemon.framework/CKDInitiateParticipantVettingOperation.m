@interface CKDInitiateParticipantVettingOperation
- (CKDInitiateParticipantVettingOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKShareMetadata)shareMetadata;
- (NSData)encryptedKey;
- (NSString)address;
- (NSString)participantID;
- (id)_addSelfIdentityToShareMetadataPublicPCS:(id)a3 forShareWithURL:(id)a4 error:(id *)a5;
- (id)_encryptedKeyDataWithShareMetadata:(id)a3 error:(id *)a4;
- (id)activityCreate;
- (id)participantVettingProgressBlock;
- (int)operationType;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleVettingInitiationProgress:(id)a3;
- (void)_sendRequest:(BOOL)a3;
- (void)main;
- (void)setAddress:(id)a3;
- (void)setEncryptedKey:(id)a3;
- (void)setParticipantID:(id)a3;
- (void)setParticipantVettingProgressBlock:(id)a3;
- (void)setShareMetadata:(id)a3;
@end

@implementation CKDInitiateParticipantVettingOperation

- (CKDInitiateParticipantVettingOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKDInitiateParticipantVettingOperation;
  v9 = [(CKDOperation *)&v21 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_shareMetadata(v6, v7, v8);
    shareMetadata = v9->_shareMetadata;
    v9->_shareMetadata = (CKShareMetadata *)v10;

    uint64_t v14 = objc_msgSend_participantID(v6, v12, v13);
    participantID = v9->_participantID;
    v9->_participantID = (NSString *)v14;

    uint64_t v18 = objc_msgSend_address(v6, v16, v17);
    address = v9->_address;
    v9->_address = (NSString *)v18;
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/vetting-initiate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_handleVettingInitiationProgress:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_callbackQueue(self, v5, v6);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = sub_1C4E78B68;
  uint64_t v13 = &unk_1E64F0948;
  uint64_t v14 = self;
  id v15 = v4;
  id v8 = v4;
  dispatch_async(v7, &v10);

  objc_msgSend_setError_(self, v9, (uint64_t)v8, v10, v11, v12, v13, v14);
}

- (id)_encryptedKeyDataWithShareMetadata:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v8 = (os_log_t *)MEMORY[0x1E4F1A500];
  v9 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    v12 = v9;
    id v15 = objc_msgSend_share(v6, v13, v14);
    uint64_t v18 = objc_msgSend_recordID(v15, v16, v17);
    int v31 = 138412290;
    id v32 = v18;
    _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "Preparing encrypted key for vetting: adding ourselves to the public PCS for share %@", (uint8_t *)&v31, 0xCu);
  }
  v19 = objc_msgSend_share(v6, v10, v11);
  v22 = objc_msgSend_URL(v19, v20, v21);
  v24 = objc_msgSend__addSelfIdentityToShareMetadataPublicPCS_forShareWithURL_error_(self, v23, (uint64_t)v6, v22, a4);

  if (*a4)
  {
    if (*v7 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v27 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      id v30 = *a4;
      int v31 = 138412290;
      id v32 = v30;
      _os_log_error_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_ERROR, "Unable to generate encrypted key to initiate share vetting: %@", (uint8_t *)&v31, 0xCu);
    }
    v28 = 0;
  }
  else
  {
    v28 = objc_msgSend_publicPCSData(v24, v25, v26);
  }

  return v28;
}

- (id)_addSelfIdentityToShareMetadataPublicPCS:(id)a3 forShareWithURL:(id)a4 error:(id *)a5
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v12 = objc_msgSend_container(self, v10, v11);
  id v15 = objc_msgSend_share(v8, v13, v14);
  uint64_t v18 = objc_msgSend_publicProtectionData(v15, v16, v17);
  uint64_t v21 = (void *)MEMORY[0x1E4F1A550];
  v22 = (os_log_t *)MEMORY[0x1E4F1A500];
  if (!v18)
  {

    goto LABEL_17;
  }
  v23 = (void *)v18;
  v24 = objc_msgSend_privateToken(v8, v19, v20);

  if (!v24)
  {
LABEL_17:
    if (*v21 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v59 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v105 = v9;
      _os_log_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_INFO, "Share metadata for the share at URL %@ doesn't have protection data on it, skipping", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v60, *MEMORY[0x1E4F19DD8], 5001, @"Share metadata for the share at URL %@ doesn't have protection data on it", v9);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  if (*v21 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v25 = *v22;
  if (os_log_type_enabled(*v22, OS_LOG_TYPE_INFO))
  {
    v28 = v25;
    int v31 = objc_msgSend_privateToken(v8, v29, v30);
    *(_DWORD *)buf = 138412546;
    id v105 = v9;
    __int16 v106 = 2112;
    id v107 = v31;
    _os_log_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_INFO, "Preparing public PCS metadata for share at URL %@ using public sharing token %@", buf, 0x16u);
  }
  id v32 = objc_msgSend_pcsManager(v12, v26, v27);
  v35 = objc_msgSend_privateToken(v8, v33, v34);
  id v103 = 0;
  v37 = (const void *)objc_msgSend_createSharingIdentityFromData_error_(v32, v36, (uint64_t)v35, &v103);
  id v38 = v103;

  if (!v37 || v38)
  {
    if (*v21 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v61 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
    {
      v82 = v61;
      v85 = objc_msgSend_privateToken(v8, v83, v84);
      *(_DWORD *)buf = 138412546;
      id v105 = v85;
      __int16 v106 = 2112;
      id v107 = v38;
      _os_log_error_impl(&dword_1C4CFF000, v82, OS_LOG_TYPE_ERROR, "Couldn't create a sharing public identity from %@: %@", buf, 0x16u);

      if (!v37) {
        goto LABEL_34;
      }
    }
    else if (!v37)
    {
LABEL_34:
      v65 = 0;
      v66 = 0;
      goto LABEL_35;
    }
    v62 = v37;
LABEL_33:
    CFRelease(v62);
    goto LABEL_34;
  }
  v41 = objc_msgSend_pcsManager(v12, v39, v40);
  v44 = objc_msgSend_share(v8, v42, v43);
  v47 = objc_msgSend_publicProtectionData(v44, v45, v46);
  id v102 = 0;
  v49 = (const void *)objc_msgSend_createSharePCSFromData_sharingIdentity_error_(v41, v48, (uint64_t)v47, v37, &v102);
  id v38 = v102;

  if (!v49 || v38)
  {
    v63 = (NSObject **)MEMORY[0x1E4F1A500];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v64 = *v63;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      v86 = v64;
      v89 = objc_msgSend_share(v8, v87, v88);
      v92 = objc_msgSend_publicProtectionData(v89, v90, v91);
      *(_DWORD *)buf = 138543618;
      id v105 = v92;
      __int16 v106 = 2112;
      id v107 = (id)v37;
      _os_log_error_impl(&dword_1C4CFF000, v86, OS_LOG_TYPE_ERROR, "Couldn't create a public PCS from the PCS data %{public}@ for identity %@", buf, 0x16u);
    }
    CFRelease(v37);
    if (!v49) {
      goto LABEL_34;
    }
    v62 = v49;
    goto LABEL_33;
  }
  v52 = objc_msgSend_pcsManager(v12, v50, v51);
  objc_msgSend_addIdentityForService_toPCS_(v52, v53, 2, v49);
  id v38 = (id)objc_claimAutoreleasedReturnValue();

  v56 = (void *)MEMORY[0x1E4F1A550];
  if (v38)
  {
    v57 = (os_log_t *)MEMORY[0x1E4F1A500];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v58 = *v57;
    if (os_log_type_enabled(*v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v105 = v9;
      __int16 v106 = 2112;
      id v107 = v38;
      _os_log_error_impl(&dword_1C4CFF000, v58, OS_LOG_TYPE_ERROR, "Couldn't add our self identity to the public PCS for share at URL %@: %@", buf, 0x16u);
    }
  }
  else
  {
    v71 = objc_msgSend_pcsManager(v12, v54, v55);
    id v101 = 0;
    v66 = objc_msgSend_dataFromSharePCS_pcsBlobType_error_(v71, v72, (uint64_t)v49, 0, &v101);
    id v38 = v101;

    if (v66 && !v38)
    {
      v75 = objc_msgSend_pcsManager(v12, v73, v74);
      id v100 = 0;
      v65 = objc_msgSend_etagFromSharePCS_error_(v75, v76, (uint64_t)v49, &v100);
      id v38 = v100;

      if (!v65 || v38)
      {
        v77 = (NSObject **)MEMORY[0x1E4F1A500];
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v78 = *v77;
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        {
          v93 = v78;
          v99 = objc_msgSend_share(v8, v94, v95);
          v98 = objc_msgSend_recordID(v99, v96, v97);
          *(_DWORD *)buf = 138412290;
          id v105 = v98;
          _os_log_error_impl(&dword_1C4CFF000, v93, OS_LOG_TYPE_ERROR, "Couldn't get an etag for public PCS data on share %@", buf, 0xCu);
        }
        v65 = 0;
        v66 = 0;
      }
      v57 = (os_log_t *)MEMORY[0x1E4F1A500];
      goto LABEL_59;
    }
    BOOL v79 = *v56 == -1;
    v57 = (os_log_t *)MEMORY[0x1E4F1A500];
    if (!v79) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v80 = *v57;
    if (os_log_type_enabled(*v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v105 = v9;
      __int16 v106 = 2112;
      id v107 = v38;
      _os_log_error_impl(&dword_1C4CFF000, v80, OS_LOG_TYPE_ERROR, "Couldn't serialize share public PCS for share at URL %@: %@", buf, 0x16u);
    }
  }
  v65 = 0;
  v66 = 0;
LABEL_59:
  CFRelease(v37);
  CFRelease(v49);
  if (v66)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v81 = *v57;
    if (os_log_type_enabled(*v57, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v105 = v9;
      _os_log_impl(&dword_1C4CFF000, v81, OS_LOG_TYPE_INFO, "Successfully added our public identity to the share's public PCS at %@", buf, 0xCu);
    }
  }
LABEL_35:
  if (a5) {
    *a5 = v38;
  }
  if (v66)
  {
    v67 = objc_opt_new();
    objc_msgSend_setPublicPCSData_(v67, v68, (uint64_t)v66);
    objc_msgSend_setPublicPCSEtag_(v67, v69, (uint64_t)v65);
  }
  else
  {
    v67 = 0;
  }

  return v67;
}

- (void)main
{
  v51[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_shareMetadata(self, a2, v2);
  if (v4
    && (v7 = (void *)v4,
        objc_msgSend_participantID(self, v5, v6),
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = objc_msgSend_length(v8, v9, v10),
        v8,
        v7,
        v11))
  {
    uint64_t v13 = objc_msgSend_encryptedKey(self, v5, v12);

    if (!v13)
    {
      v16 = objc_msgSend_shareMetadata(self, v14, v15);
      id v49 = 0;
      uint64_t v18 = objc_msgSend__encryptedKeyDataWithShareMetadata_error_(self, v17, (uint64_t)v16, &v49);
      id v19 = v49;
      objc_msgSend_setEncryptedKey_(self, v20, (uint64_t)v18);

      v23 = objc_msgSend_encryptedKey(self, v21, v22);

      if (!v23)
      {
        v48 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v25 = *MEMORY[0x1E4F19DD8];
        uint64_t v50 = *MEMORY[0x1E4F28A50];
        v51[0] = v19;
        uint64_t v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v24, (uint64_t)v51, &v50, 1);
        v29 = objc_msgSend_shareMetadata(self, v27, v28);
        id v32 = objc_msgSend_shareMetadata(self, v30, v31);
        v35 = objc_msgSend_privateToken(v32, v33, v34);
        id v38 = objc_msgSend_shareMetadata(self, v36, v37);
        v41 = objc_msgSend_share(v38, v39, v40);
        v44 = objc_msgSend_publicProtectionData(v41, v42, v43);
        uint64_t v46 = objc_msgSend_errorWithDomain_code_userInfo_format_(v48, v45, v25, 5005, v26, @"Unable to create public PCS blob using metadata %@ (private token was: %@, share's public PCS blob was %@)", v29, v35, v44);
        objc_msgSend_finishWithError_(self, v47, (uint64_t)v46);

        return;
      }
    }
    objc_msgSend__sendRequest_(self, v14, 0);
  }
  else
  {
    objc_msgSend_finishWithError_(self, v5, 0);
  }
}

- (int)operationType
{
  return 513;
}

- (void)_sendRequest:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v5 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v37 = @"first";
    if (v3) {
      uint64_t v37 = @"second";
    }
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v37;
    _os_log_debug_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_DEBUG, "Sending initiate vetting request, this is a %{public}@ attempt", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v47 = 0x2020000000;
  char v48 = 1;
  uint64_t v6 = [CKDInitiateParticipantVettingURLRequest alloc];
  id v9 = objc_msgSend_shareMetadata(self, v7, v8);
  uint64_t v12 = objc_msgSend_share(v9, v10, v11);
  uint64_t v15 = objc_msgSend_recordID(v12, v13, v14);
  uint64_t v18 = objc_msgSend_encryptedKey(self, v16, v17);
  uint64_t v21 = objc_msgSend_participantID(self, v19, v20);
  v24 = objc_msgSend_shareMetadata(self, v22, v23);
  uint64_t v27 = objc_msgSend_baseToken(v24, v25, v26);
  v29 = objc_msgSend_initWithOperation_shareRecordID_encryptedKey_participantID_baseToken_(v6, v28, (uint64_t)self, v15, v18, v21, v27);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v29);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = sub_1C4E79C44;
  v41[3] = &unk_1E64F4550;
  objc_copyWeak(&v42, &location);
  BOOL v43 = v3;
  v41[4] = self;
  v41[5] = &buf;
  objc_msgSend_setVettingInitiationRequestCompletionBlock_(v29, v30, (uint64_t)v41);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_1C4E7A1C4;
  v38[3] = &unk_1E64F4578;
  v38[4] = &buf;
  objc_copyWeak(&v39, &location);
  objc_copyWeak(&v40, &from);
  objc_msgSend_setCompletionBlock_(v29, v31, (uint64_t)v38);
  objc_msgSend_setRequest_(self, v32, (uint64_t)v29);
  v35 = objc_msgSend_container(self, v33, v34);
  objc_msgSend_performRequest_(v35, v36, (uint64_t)v29);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setParticipantVettingProgressBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDInitiateParticipantVettingOperation;
  [(CKDOperation *)&v6 _finishOnCallbackQueueWithError:v4];
}

- (id)participantVettingProgressBlock
{
  return self->_participantVettingProgressBlock;
}

- (void)setParticipantVettingProgressBlock:(id)a3
{
}

- (CKShareMetadata)shareMetadata
{
  return self->_shareMetadata;
}

- (void)setShareMetadata:(id)a3
{
}

- (NSData)encryptedKey
{
  return self->_encryptedKey;
}

- (void)setEncryptedKey:(id)a3
{
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_encryptedKey, 0);
  objc_storeStrong((id *)&self->_shareMetadata, 0);
  objc_storeStrong(&self->_participantVettingProgressBlock, 0);
}

@end