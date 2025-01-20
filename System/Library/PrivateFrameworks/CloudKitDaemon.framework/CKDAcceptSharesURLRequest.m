@interface CKDAcceptSharesURLRequest
- (BOOL)handlesAnonymousCKUserIDPropagation;
- (BOOL)requiresCKAnonymousUserIDs;
- (CKDAcceptSharesURLRequest)initWithOperation:(id)a3 shareMetadatasToAccept:(id)a4;
- (NSArray)shareMetadatasToAccept;
- (NSMutableDictionary)shareMetadataByRequestID;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)returnVerificationKeyAndSignatureForRequestOperation:(id)a3 dataToBeSigned:(id)a4 error:(id *)a5;
- (id)shareAcceptedBlock;
- (id)zoneIDsToLock;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setShareAcceptedBlock:(id)a3;
- (void)setShareMetadataByRequestID:(id)a3;
- (void)setShareMetadatasToAccept:(id)a3;
@end

@implementation CKDAcceptSharesURLRequest

- (CKDAcceptSharesURLRequest)initWithOperation:(id)a3 shareMetadatasToAccept:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKDAcceptSharesURLRequest;
  v8 = [(CKDURLRequest *)&v13 initWithOperation:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_shareMetadatasToAccept, a4);
    uint64_t v10 = objc_opt_new();
    shareMetadataByRequestID = v9->_shareMetadataByRequestID;
    v9->_shareMetadataByRequestID = (NSMutableDictionary *)v10;
  }
  return v9;
}

- (id)zoneIDsToLock
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v6 = objc_msgSend_shareMetadatasToAccept(self, v4, v5, 0);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v23, v27, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v6);
        }
        v14 = objc_msgSend_shareRecordID(*(void **)(*((void *)&v23 + 1) + 8 * i), v9, v10);
        v17 = objc_msgSend_zoneID(v14, v15, v16);

        if (v17) {
          objc_msgSend_addObject_(v3, v18, (uint64_t)v17);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v23, v27, 16);
    }
    while (v11);
  }

  v21 = objc_msgSend_allObjects(v3, v19, v20);

  return v21;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CKDAcceptSharesURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v17 fillOutEquivalencyPropertiesBuilder:v4];
  id v7 = objc_msgSend_shareMetadatasToAccept(self, v5, v6, v17.receiver, v17.super_class);
  v9 = objc_msgSend_CKMap_(v7, v8, (uint64_t)&unk_1F2044530);

  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  objc_super v13 = objc_msgSend_ckEquivalencyProperties(v9, v11, v12);
  v15 = objc_msgSend_setWithArray_(v10, v14, (uint64_t)v13);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v16, (uint64_t)v15, @"shareMetadatas");
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_shareMetadatasToAccept(self, v5, v6);
  v9 = objc_msgSend_CKMap_(v7, v8, (uint64_t)&unk_1F2044550);

  objc_msgSend_setModifyRecordIDs_(v4, v10, (uint64_t)v9);
  v11.receiver = self;
  v11.super_class = (Class)CKDAcceptSharesURLRequest;
  [(CKDURLRequest *)&v11 fillOutRequestProperties:v4];
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (BOOL)handlesAnonymousCKUserIDPropagation
{
  return 1;
}

- (BOOL)requiresCKAnonymousUserIDs
{
  v3 = objc_msgSend_operation(self, a2, v2);
  uint64_t v6 = objc_msgSend_container(v3, v4, v5);
  v9 = objc_msgSend_options(v6, v7, v8);
  char v12 = objc_msgSend_useAnonymousToServerShareParticipants(v9, v10, v11);

  return v12;
}

- (id)generateRequestOperations
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  objc_msgSend_shareMetadatasToAccept(self, v4, v5);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v138, v142, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v137 = *(void *)v139;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v139 != v137) {
          objc_enumerationMutation(obj);
        }
        char v12 = *(void **)(*((void *)&v138 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend_operationType(self, v8, v9);
        v15 = objc_msgSend_operationRequestWithType_(self, v14, v13);
        if (objc_msgSend_requiresCKAnonymousUserIDs(self, v16, v17))
        {
          uint64_t v20 = objc_msgSend_anonymousCKUserID(v12, v18, v19);

          if (!v20)
          {
            v115 = objc_opt_new();
            v116 = NSString;
            v119 = objc_msgSend_shareRecordID(v12, v117, v118);
            v121 = objc_msgSend_stringWithFormat_(v116, v120, @"An anonymousCKUserID is required to accept share %@ when using anonymous to server share participants", v119);

            objc_msgSend_setObject_forKeyedSubscript_(v115, v122, (uint64_t)v121, *MEMORY[0x1E4F28568]);
            v125 = objc_msgSend_operation(self, v123, v124);
            v128 = objc_msgSend_topmostParentOperation(v125, v126, v127);

            v132 = objc_msgSend_operationID(v128, v129, v130);
            if (v132) {
              objc_msgSend_setObject_forKeyedSubscript_(v115, v131, (uint64_t)v132, *MEMORY[0x1E4F19C50]);
            }
            v133 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v131, *MEMORY[0x1E4F19DD8], 5015, v115);
            objc_msgSend_finishWithError_(self, v134, (uint64_t)v133);

            id v114 = 0;
            goto LABEL_23;
          }
          long long v23 = objc_msgSend_anonymousCKUserID(v12, v21, v22);
          long long v26 = objc_msgSend_CKDPIdentifier_User(v23, v24, v25);
          v29 = objc_msgSend_request(v15, v27, v28);
          objc_msgSend_setAnonymousCKUserID_(v29, v30, (uint64_t)v26);
        }
        v31 = v3;
        v32 = objc_opt_new();
        objc_msgSend_setShareAcceptRequest_(v15, v33, (uint64_t)v32);
        v36 = objc_msgSend_translator(self, v34, v35);
        v39 = objc_msgSend_shareRecordID(v12, v37, v38);
        v41 = objc_msgSend_pShareIdentifierFromRecordID_(v36, v40, (uint64_t)v39);
        objc_msgSend_setShareId_(v32, v42, (uint64_t)v41);

        v45 = objc_msgSend_etag(v12, v43, v44);
        objc_msgSend_setEtag_(v32, v46, (uint64_t)v45);

        uint64_t v49 = objc_msgSend_acceptedInProcess(v12, v47, v48);
        objc_msgSend_setAcceptedInProcess_(v32, v50, v49);
        v53 = objc_msgSend_publicPCSData(v12, v51, v52);

        if (v53)
        {
          v56 = objc_opt_new();
          objc_msgSend_setSelfAddedPcs_(v32, v57, (uint64_t)v56);

          v60 = objc_msgSend_publicPCSData(v12, v58, v59);
          v63 = objc_msgSend_selfAddedPcs(v32, v61, v62);
          objc_msgSend_setProtectionInfo_(v63, v64, (uint64_t)v60);

          v67 = objc_msgSend_publicPCSEtag(v12, v65, v66);
          v70 = objc_msgSend_selfAddedPcs(v32, v68, v69);
          objc_msgSend_setProtectionInfoTag_(v70, v71, (uint64_t)v67);
        }
        v72 = objc_msgSend_publicKey(v12, v54, v55);

        if (v72)
        {
          v75 = objc_opt_new();
          objc_msgSend_setPublicKey_(v32, v76, (uint64_t)v75);

          v79 = objc_msgSend_publicKey(v12, v77, v78);
          v82 = objc_msgSend_publicKey(v32, v80, v81);
          objc_msgSend_setProtectionInfo_(v82, v83, (uint64_t)v79);

          uint64_t v86 = objc_msgSend_publicKeyVersion(v12, v84, v85);
          objc_msgSend_setPublicKeyVersion_(v32, v87, v86);
        }
        v88 = objc_msgSend_pppcsProtectionInfo(v12, v73, v74);

        if (v88)
        {
          v91 = objc_opt_new();
          objc_msgSend_setProtectionInfo_(v32, v92, (uint64_t)v91);

          v95 = objc_msgSend_pppcsProtectionInfo(v12, v93, v94);
          v98 = objc_msgSend_protectionInfo(v32, v96, v97);
          objc_msgSend_setProtectionInfo_(v98, v99, (uint64_t)v95);
        }
        v100 = objc_msgSend_participantID(v12, v89, v90);

        if (v100)
        {
          v103 = objc_msgSend_participantID(v12, v101, v102);
          objc_msgSend_setParticipantId_(v32, v104, (uint64_t)v103);
        }
        v105 = objc_msgSend_shareMetadataByRequestID(self, v101, v102);
        v108 = objc_msgSend_request(v15, v106, v107);
        v111 = objc_msgSend_operationUUID(v108, v109, v110);
        objc_msgSend_setObject_forKeyedSubscript_(v105, v112, (uint64_t)v12, v111);

        v3 = v31;
        objc_msgSend_addObject_(v31, v113, (uint64_t)v15);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v138, v142, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v114 = v3;
LABEL_23:

  return v114;
}

- (id)returnVerificationKeyAndSignatureForRequestOperation:(id)a3 dataToBeSigned:(id)a4 error:(id *)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a3;
  if ((objc_msgSend_requiresCKAnonymousUserIDs(self, v11, v12) & 1) == 0)
  {
    uint64_t v52 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v52, v53, (uint64_t)a2, self, @"CKDAcceptSharesURLRequest.m", 142, @"Signature is only required for anonymous to server requests");
  }
  v15 = objc_msgSend_shareMetadataByRequestID(self, v13, v14);
  v18 = objc_msgSend_request(v10, v16, v17);

  v21 = objc_msgSend_operationUUID(v18, v19, v20);
  long long v23 = objc_msgSend_objectForKeyedSubscript_(v15, v22, (uint64_t)v21);

  if (!objc_msgSend_signingPCSIdentity(v23, v24, v25))
  {
    v54 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v26, v27);
    v57 = objc_msgSend_shareRecordID(v23, v55, v56);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v54, v58, (uint64_t)a2, self, @"CKDAcceptSharesURLRequest.m", 146, @"A signing identity is required to accept share %@ when using anonymous to server share participants.", v57);
  }
  uint64_t v28 = objc_msgSend_container(self, v26, v27);
  v31 = objc_msgSend_pcsManager(v28, v29, v30);
  uint64_t v34 = objc_msgSend_signingPCSIdentity(v23, v32, v33);
  id v59 = 0;
  v36 = objc_msgSend_createSignatureWithIdentity_dataToBeSigned_forScope_error_(v31, v35, v34, v9, 5, &v59);

  id v37 = v59;
  if (objc_msgSend_length(v36, v38, v39) && !v37)
  {
    id v40 = objc_alloc(MEMORY[0x1E4F1A470]);
    objc_msgSend_signingPCSIdentity(v23, v41, v42);
    v43 = (void *)PCSIdentityCopyExportedPublicKey();
    v45 = objc_msgSend_initWithObject1_object2_(v40, v44, (uint64_t)v43, v36);

    if (!a5) {
      goto LABEL_15;
    }
LABEL_14:
    *a5 = v37;
    goto LABEL_15;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v46 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v48 = v46;
    uint64_t v51 = objc_msgSend_signingPCSIdentity(v23, v49, v50);
    *(_DWORD *)buf = 138543618;
    uint64_t v61 = v51;
    __int16 v62 = 2112;
    id v63 = v37;
    _os_log_error_impl(&dword_1C4CFF000, v48, OS_LOG_TYPE_ERROR, "Couldn't generate a request signature with signing identity %{public}@ because we got an error from PCS: %@", buf, 0x16u);
  }
  v45 = 0;
  if (a5) {
    goto LABEL_14;
  }
LABEL_15:

  return v45;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_shareMetadataByRequestID(self, v5, v6);
  id v10 = objc_msgSend_response(v4, v8, v9);
  uint64_t v13 = objc_msgSend_operationUUID(v10, v11, v12);
  v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

  if (!objc_msgSend_hasShareAcceptResponse(v4, v16, v17))
  {
    long long v23 = 0;
    goto LABEL_11;
  }
  uint64_t v20 = objc_msgSend_shareAcceptResponse(v4, v18, v19);
  long long v23 = objc_msgSend_share(v20, v21, v22);

  if (!v23)
  {
LABEL_11:
    v29 = 0;
    id v30 = 0;
    goto LABEL_15;
  }
  long long v24 = objc_msgSend_translator(self, v18, v19);
  uint64_t v27 = objc_msgSend_anonymousCKUserID(v15, v25, v26);
  id v109 = 0;
  v29 = objc_msgSend_shareFromPShare_asAnonymousCKUserID_error_(v24, v28, (uint64_t)v23, v27, &v109);
  id v30 = v109;

  if (v29 || !v30)
  {
    if (!v29) {
      goto LABEL_15;
    }
    id v108 = v30;
    v79 = objc_msgSend_container(self, v18, v19);
    uint64_t v107 = objc_msgSend_cacheForContainer_(CKDShareIDCache, v80, (uint64_t)v79);

    objc_msgSend_addShare_(v107, v81, (uint64_t)v29);
    v71 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v82, v83);
    uint64_t v74 = objc_msgSend_sharedManager(CKDDeviceCapabilityManager, v84, v85);
    v77 = objc_msgSend_recordID(v29, v86, v87);
    uint64_t v90 = objc_msgSend_container(self, v88, v89);
    v93 = objc_msgSend_operation(self, v91, v92);
    objc_msgSend_recordShareUsageForShareID_at_container_operation_(v74, v94, (uint64_t)v77, v71, v90, v93);

    uint64_t v69 = v107;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v31 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v111 = v30;
      _os_log_error_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_ERROR, "Failed to convert share: %@", buf, 0xCu);
    }
    uint64_t v34 = objc_msgSend_result(v4, v32, v33);
    objc_msgSend_setCode_(v34, v35, 3);

    v36 = objc_opt_new();
    uint64_t v39 = objc_msgSend_result(v4, v37, v38);
    objc_msgSend_setError_(v39, v40, (uint64_t)v36);

    v41 = objc_opt_new();
    uint64_t v44 = objc_msgSend_result(v4, v42, v43);
    v47 = objc_msgSend_error(v44, v45, v46);
    objc_msgSend_setClientError_(v47, v48, (uint64_t)v41);

    uint64_t v51 = objc_msgSend_result(v4, v49, v50);
    v54 = objc_msgSend_error(v51, v52, v53);
    v57 = objc_msgSend_clientError(v54, v55, v56);
    objc_msgSend_setType_(v57, v58, 7);

    uint64_t v61 = objc_msgSend_result(v4, v59, v60);
    uint64_t v64 = objc_msgSend_error(v61, v62, v63);
    objc_msgSend_setErrorKey_(v64, v65, @"Invalid share");

    uint64_t v66 = NSString;
    id v108 = v30;
    uint64_t v69 = objc_msgSend_localizedDescription(v30, v67, v68);
    v71 = objc_msgSend_stringWithFormat_(v66, v70, @"The share could not be converted because it is invalid: %@", v69);
    uint64_t v74 = objc_msgSend_result(v4, v72, v73);
    v77 = objc_msgSend_error(v74, v75, v76);
    objc_msgSend_setErrorDescription_(v77, v78, (uint64_t)v71);
    v29 = 0;
  }

  id v30 = v108;
LABEL_15:
  v95 = objc_msgSend_shareAcceptedBlock(self, v18, v19);

  if (v95)
  {
    objc_msgSend_shareAcceptedBlock(self, v96, v97);
    v98 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend_shareURL(v15, v99, v100);
    v104 = objc_msgSend_result(v4, v102, v103);
    ((void (**)(void, void *, void *, void *))v98)[2](v98, v101, v29, v104);
  }
  id v105 = v30;

  return v105;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v27 = a3;
  uint64_t v6 = objc_msgSend_shareMetadataByRequestID(self, v4, v5);
  uint64_t v9 = objc_msgSend_response(v27, v7, v8);
  uint64_t v12 = objc_msgSend_operationUUID(v9, v10, v11);
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)v12);

  uint64_t v17 = objc_msgSend_shareAcceptedBlock(self, v15, v16);

  if (v17)
  {
    objc_msgSend_shareAcceptedBlock(self, v18, v19);
    uint64_t v20 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    long long v23 = objc_msgSend_shareURL(v14, v21, v22);
    uint64_t v26 = objc_msgSend_result(v27, v24, v25);
    ((void (**)(void, void *, void, void *))v20)[2](v20, v23, 0, v26);
  }
}

- (id)shareAcceptedBlock
{
  return self->_shareAcceptedBlock;
}

- (void)setShareAcceptedBlock:(id)a3
{
}

- (NSArray)shareMetadatasToAccept
{
  return self->_shareMetadatasToAccept;
}

- (void)setShareMetadatasToAccept:(id)a3
{
}

- (NSMutableDictionary)shareMetadataByRequestID
{
  return self->_shareMetadataByRequestID;
}

- (void)setShareMetadataByRequestID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareMetadataByRequestID, 0);
  objc_storeStrong((id *)&self->_shareMetadatasToAccept, 0);
  objc_storeStrong(&self->_shareAcceptedBlock, 0);
}

@end