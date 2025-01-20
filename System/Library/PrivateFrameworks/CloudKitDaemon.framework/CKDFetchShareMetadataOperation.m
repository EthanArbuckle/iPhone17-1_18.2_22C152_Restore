@interface CKDFetchShareMetadataOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)_currentUserIsOONForShareMetadata:(id)a3;
- (BOOL)clientWillDisplaySystemAcceptPrompt;
- (BOOL)errorOnOON;
- (BOOL)forceDSRefetch;
- (BOOL)makeStateTransition;
- (BOOL)overwriteContainerPCSServiceIfManatee;
- (BOOL)shouldFetchRootRecord;
- (BOOL)skipShareDecryption;
- (CKDFetchShareMetadataOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSDictionary)shareInvitationTokensByShareURL;
- (NSMutableArray)shareURLsToFetch;
- (NSMutableDictionary)shareTokenMetadatasToFetchByURL;
- (NSSet)rootRecordDesiredKeysSet;
- (id)_decodeProtectedFullToken:(id)a3 tokenMetadata:(id)a4;
- (id)activityCreate;
- (id)shareMetadataFetchedBlock;
- (int)operationType;
- (void)_continueHandlingFetchedShareMetadata:(id)a3 shareURL:(id)a4;
- (void)_continueSharePCSPrepForShareMetadata:(id)a3 shareURL:(id)a4;
- (void)_decryptRootRecordsForShareURL:(id)a3 withMetadata:(id)a4 completionHandler:(id)a5;
- (void)_fetchShortTokenMetadata;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleTokenResolveWithLookupInfo:(id)a3 shareMetadata:(id)a4 responseCode:(id)a5 urlByShortTokenLookupInfos:(id)a6 tokensToFetchByURL:(id)a7;
- (void)_performCallbackForURL:(id)a3 withMetadata:(id)a4 error:(id)a5;
- (void)_prepPPPCSDataForDugongShareMetadata:(id)a3 withInvitationToken:(id)a4 completionHandler:(id)a5;
- (void)_prepareShortTokens;
- (void)main;
- (void)setClientWillDisplaySystemAcceptPrompt:(BOOL)a3;
- (void)setErrorOnOON:(BOOL)a3;
- (void)setForceDSRefetch:(BOOL)a3;
- (void)setOverwriteContainerPCSServiceIfManatee:(BOOL)a3;
- (void)setRootRecordDesiredKeysSet:(id)a3;
- (void)setShareInvitationTokensByShareURL:(id)a3;
- (void)setShareMetadataFetchedBlock:(id)a3;
- (void)setShareTokenMetadatasToFetchByURL:(id)a3;
- (void)setShareURLsToFetch:(id)a3;
- (void)setShouldFetchRootRecord:(BOOL)a3;
- (void)setSkipShareDecryption:(BOOL)a3;
@end

@implementation CKDFetchShareMetadataOperation

- (CKDFetchShareMetadataOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CKDFetchShareMetadataOperation;
  v9 = [(CKDOperation *)&v39 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    v10 = objc_msgSend_shareURLsToFetch(v6, v7, v8);
    uint64_t v13 = objc_msgSend_mutableCopy(v10, v11, v12);
    shareURLsToFetch = v9->_shareURLsToFetch;
    v9->_shareURLsToFetch = (NSMutableArray *)v13;

    uint64_t v15 = objc_opt_new();
    shareTokenMetadatasToFetchByURL = v9->_shareTokenMetadatasToFetchByURL;
    v9->_shareTokenMetadatasToFetchByURL = (NSMutableDictionary *)v15;

    v19 = objc_msgSend_rootRecordDesiredKeys(v6, v17, v18);

    if (v19)
    {
      v22 = (void *)MEMORY[0x1E4F1CAD0];
      v23 = objc_msgSend_rootRecordDesiredKeys(v6, v20, v21);
      uint64_t v25 = objc_msgSend_setWithArray_(v22, v24, (uint64_t)v23);
      rootRecordDesiredKeysSet = v9->_rootRecordDesiredKeysSet;
      v9->_rootRecordDesiredKeysSet = (NSSet *)v25;
    }
    v9->_shouldFetchRootRecord = objc_msgSend_shouldFetchRootRecord(v6, v20, v21);
    v9->_overwriteContainerPCSServiceIfManatee = objc_msgSend_overwriteContainerPCSServiceIfManatee(v6, v27, v28);
    v9->_skipShareDecryption = objc_msgSend_skipShareDecryption(v6, v29, v30);
    v33 = objc_msgSend_shareInvitationTokensByShareURL(v6, v31, v32);
    uint64_t v36 = objc_msgSend_copy(v33, v34, v35);
    shareInvitationTokensByShareURL = v9->_shareInvitationTokensByShareURL;
    v9->_shareInvitationTokensByShareURL = (NSDictionary *)v36;
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/fetch-share-metadata", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (int)operationType
{
  return 216;
}

- (BOOL)makeStateTransition
{
  uint64_t v4 = objc_msgSend_state(self, a2, v2);
  switch(v4)
  {
    case 3:
      objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
      v10 = objc_msgSend_error(self, v8, v9);
      objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);

      break;
    case 2:
      objc_msgSend_setState_(self, v5, 3);
      objc_msgSend__fetchShortTokenMetadata(self, v12, v13);
      break;
    case 1:
      objc_msgSend_setState_(self, v5, 2);
      objc_msgSend__prepareShortTokens(self, v6, v7);
      break;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 == 2)
  {
    v5 = @"Preparing Short Tokens";
  }
  else if (a3 == 3)
  {
    v5 = @"Retrieving Share Metadata";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDFetchShareMetadataOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_performCallbackForURL:(id)a3 withMetadata:(id)a4 error:(id)a5
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v13 = a5;
  if (!v9) {
    goto LABEL_29;
  }
  int v14 = objc_msgSend_errorOnOON(self, v11, v12);
  if (!v13 && v14)
  {
    v17 = objc_msgSend_container(self, v15, v16);
    v20 = objc_msgSend_entitlements(v17, v18, v19);
    if ((objc_msgSend_hasDisplaysSystemAcceptPromptEntitlement(v20, v21, v22) & 1) == 0
      && objc_msgSend_participantPermission(v10, v23, v24) == 1)
    {
      v27 = objc_msgSend_outOfNetworkMatches(v10, v25, v26);
      if (objc_msgSend_count(v27, v28, v29))
      {
        uint64_t v32 = objc_msgSend_share(v10, v30, v31);
        uint64_t v35 = objc_msgSend_publicPermission(v32, v33, v34);

        if (v35 <= 1)
        {
          v91 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v15, *MEMORY[0x1E4F19DD8], 8013, @"The user is not able to access this share");

          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v36 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v97 = v91;
            _os_log_debug_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_DEBUG, "Third party process requested OON share metadata, returning error %@", buf, 0xCu);
          }
          id v10 = 0;
          goto LABEL_17;
        }
        goto LABEL_16;
      }
    }
LABEL_16:
    v91 = 0;
    goto LABEL_17;
  }
  v91 = v13;
LABEL_17:
  v37 = objc_msgSend_container(self, v15, v16);
  v40 = objc_msgSend_entitlements(v37, v38, v39);
  uint64_t hasProtectionDataEntitlement = objc_msgSend_hasProtectionDataEntitlement(v40, v41, v42);
  v46 = objc_msgSend_share(v10, v44, v45);
  objc_msgSend_setSerializeProtectionData_(v46, v47, hasProtectionDataEntitlement);

  v50 = objc_msgSend_container(self, v48, v49);
  v53 = objc_msgSend_entitlements(v50, v51, v52);
  char hasOutOfProcessUIEntitlement = objc_msgSend_hasOutOfProcessUIEntitlement(v53, v54, v55);
  if (hasOutOfProcessUIEntitlement)
  {
    uint64_t hasParticipantPIIEntitlement = 1;
  }
  else
  {
    v46 = objc_msgSend_container(self, v56, v57);
    v5 = objc_msgSend_entitlements(v46, v60, v61);
    uint64_t hasParticipantPIIEntitlement = objc_msgSend_hasParticipantPIIEntitlement(v5, v62, v63);
  }
  v64 = objc_msgSend_share(v10, v56, v57);
  objc_msgSend_setSerializePersonalInfo_(v64, v65, hasParticipantPIIEntitlement);

  if ((hasOutOfProcessUIEntitlement & 1) == 0)
  {
  }
  v68 = objc_msgSend_shareInvitationTokensByShareURL(self, v66, v67);
  v70 = objc_msgSend_objectForKeyedSubscript_(v68, v69, (uint64_t)v9);

  if (v10 && v70 && !v91) {
    objc_msgSend_setInvitationToken_(v10, v71, (uint64_t)v70);
  }
  v73 = objc_msgSend_shareURLsToFetch(self, v71, v72);
  objc_sync_enter(v73);
  v76 = objc_msgSend_shareURLsToFetch(self, v74, v75);
  objc_msgSend_removeObject_(v76, v77, (uint64_t)v9);

  objc_sync_exit(v73);
  v80 = objc_msgSend_shareTokenMetadatasToFetchByURL(self, v78, v79);
  objc_sync_enter(v80);
  v83 = objc_msgSend_shareTokenMetadatasToFetchByURL(self, v81, v82);
  objc_msgSend_removeObjectForKey_(v83, v84, (uint64_t)v9);

  objc_sync_exit(v80);
  v87 = objc_msgSend_shareMetadataFetchedBlock(self, v85, v86);

  if (v87)
  {
    v90 = objc_msgSend_callbackQueue(self, v88, v89);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4DE83CC;
    block[3] = &unk_1E64F0DF0;
    block[4] = self;
    id v93 = v9;
    id v94 = v10;
    id v95 = v91;
    dispatch_async(v90, block);
  }
  id v13 = v91;
LABEL_29:
}

- (id)_decodeProtectedFullToken:(id)a3 tokenMetadata:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = (void *)MEMORY[0x1E4F1A390];
  id v10 = objc_msgSend_shortSharingTokenData(v6, v8, v9);
  uint64_t v12 = objc_msgSend_decryptFullToken_shortSharingTokenData_(v7, v11, (uint64_t)v5, v10);

  id v13 = (uint64_t *)MEMORY[0x1E4F1A550];
  if (v12)
  {
    id v14 = [NSString alloc];
    uint64_t v17 = objc_msgSend_bytes(v12, v15, v16);
    uint64_t v20 = objc_msgSend_length(v12, v18, v19);
    uint64_t v22 = objc_msgSend_initWithBytes_length_encoding_(v14, v21, v17, v20, 4);
    unint64_t v25 = objc_msgSend_length(v22, v23, v24);
    uint64_t v26 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
    v27 = (void *)*MEMORY[0x1E4F1A548];
    uint64_t v28 = *v13;
    if (v25 <= 4)
    {
      if (v28 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v27);
      }
      uint64_t v29 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v77 = (uint64_t)v22;
        _os_log_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_INFO, "Warn: Invalid full token length: %@", buf, 0xCu);
      }
      id v30 = 0;
      goto LABEL_35;
    }
    if (v28 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v27);
    }
    uint64_t v32 = (os_log_t *)MEMORY[0x1E4F1A500];
    v33 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v77 = (uint64_t)v22;
      _os_log_debug_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_DEBUG, "Got a full token of %@", buf, 0xCu);
    }
    uint64_t v35 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v36 = objc_msgSend_substringToIndex_(v22, v34, 4);
    v38 = objc_msgSend_CKDataFromBase64URLSafeString_(v35, v37, (uint64_t)v36);

    if (v38)
    {
      int v43 = *(unsigned __int8 *)objc_msgSend_bytes(v38, v39, v40);
      switch(v43)
      {
        case 32:
          uint64_t v57 = objc_msgSend_substringFromIndex_(v22, v41, 4);
          v59 = objc_msgSend_CKDataFromBase64URLSafeString_(MEMORY[0x1E4F1C9B8], v58, (uint64_t)v57);
          id v60 = objc_alloc(MEMORY[0x1E4F19F18]);
          v62 = objc_msgSend_initWithData_(v60, v61, (uint64_t)v59);
          v56 = objc_msgSend_sharingKeyBytes(v62, v63, v64);

          break;
        case 16:
          uint64_t v57 = objc_msgSend_substringFromIndex_(v22, v41, 4);
          v56 = objc_msgSend_CKDataFromBase64URLSafeString_(MEMORY[0x1E4F1C9B8], v65, (uint64_t)v57);
          break;
        case 3:
          unsigned int v44 = *(unsigned __int16 *)(objc_msgSend_bytes(v38, v41, v42) + 1);
          uint64_t v45 = __rev16(v44);
          if (objc_msgSend_length(v22, v46, v47) <= (unint64_t)(v45 + 4))
          {
            if (*v13 != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], *v26);
            }
            v69 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
            {
              v70 = v69;
              uint64_t v73 = objc_msgSend_length(v22, v71, v72);
              *(_DWORD *)buf = 134218496;
              uint64_t v77 = v73;
              __int16 v78 = 1024;
              int v79 = 3;
              __int16 v80 = 2048;
              uint64_t v81 = v45;
              _os_log_impl(&dword_1C4CFF000, v70, OS_LOG_TYPE_INFO, "Warn: Invalid token header, fullTokenLength:%lu, schemeByte:0x%0x, locatorLength:%lu", buf, 0x1Cu);
            }
            id v30 = 0;
            goto LABEL_34;
          }
          if (v44)
          {
            uint64_t v49 = v45 + 4;
            v50 = objc_msgSend_substringWithRange_(v22, v48, 4, v45);
            uint64_t v52 = objc_msgSend_CKDataFromBase64URLSafeString_(MEMORY[0x1E4F1C9B8], v51, (uint64_t)v50);

            objc_msgSend_substringFromIndex_(v22, v53, v49);
          }
          else
          {
            uint64_t v52 = 0;
            objc_msgSend_substringFromIndex_(v22, v48, v45 + 4);
          v74 = };
          v56 = objc_msgSend_CKDataFromBase64URLSafeString_(MEMORY[0x1E4F1C9B8], v75, (uint64_t)v74);

LABEL_33:
          objc_msgSend_setPrivateTokenData_(v6, v55, (uint64_t)v56);
          objc_msgSend_setPublicTokenData_(v6, v66, (uint64_t)v52);
          id v30 = v6;

LABEL_34:
LABEL_35:

          goto LABEL_36;
        default:
          if (*v13 != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], *v26);
          }
          v68 = *v32;
          if (os_log_type_enabled(*v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v77) = v43;
            _os_log_impl(&dword_1C4CFF000, v68, OS_LOG_TYPE_INFO, "Warn: Unknown scheme byte: 0x%0x", buf, 8u);
          }
          goto LABEL_28;
      }

      goto LABEL_32;
    }
    if (*v13 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], *v26);
    }
    v54 = *v32;
    if (os_log_type_enabled(*v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v77 = (uint64_t)v22;
      _os_log_error_impl(&dword_1C4CFF000, v54, OS_LOG_TYPE_ERROR, "Couldn't decode full token header: %@", buf, 0xCu);
    }
LABEL_28:
    v56 = 0;
LABEL_32:
    uint64_t v52 = 0;
    goto LABEL_33;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v31 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v77 = (uint64_t)v5;
    _os_log_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_INFO, "Warn: Couldn't decrypt the protected full token: %@", buf, 0xCu);
  }
  id v30 = 0;
LABEL_36:

  return v30;
}

- (void)_fetchShortTokenMetadata
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  uint64_t v82 = objc_opt_new();
  id v5 = objc_msgSend_shareTokenMetadatasToFetchByURL(self, v3, v4);
  uint64_t v8 = objc_msgSend_copy(v5, v6, v7);

  if (objc_msgSend_count(v8, v9, v10))
  {
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v13 = objc_msgSend_allKeys(v8, v11, v12);
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v93, v100, 16);
    if (v16)
    {
      uint64_t v17 = *(void *)v94;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v94 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void *)(*((void *)&v93 + 1) + 8 * i);
          uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v8, v15, v19);
          uint64_t v21 = objc_opt_new();
          uint64_t v24 = objc_msgSend_routingKey(v20, v22, v23);
          objc_msgSend_setRoutingKey_(v21, v25, (uint64_t)v24);

          uint64_t v28 = objc_msgSend_shortSharingTokenHashData(v20, v26, v27);
          objc_msgSend_setShortSharingTokenHashData_(v21, v29, (uint64_t)v28);

          uint64_t RootRecord = objc_msgSend_shouldFetchRootRecord(self, v30, v31);
          objc_msgSend_setShouldFetchRootRecord_(v21, v33, RootRecord);
          uint64_t v36 = objc_msgSend_forceDSRefetch(v20, v34, v35);
          objc_msgSend_setForceDSRefetch_(v21, v37, v36);
          uint64_t v40 = objc_msgSend_participantID(v20, v38, v39);

          if (v40)
          {
            int v43 = objc_msgSend_participantID(v20, v41, v42);
            objc_msgSend_setParticipantID_(v21, v44, (uint64_t)v43);
          }
          objc_msgSend_setObject_forKeyedSubscript_(v82, v41, v19, v21);
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v93, v100, 16);
      }
      while (v16);
    }

    uint64_t v47 = objc_msgSend_stateTransitionGroup(self, v45, v46);
    dispatch_group_enter(v47);

    v48 = [CKDRecordResolveTokenURLRequest alloc];
    v51 = objc_msgSend_allKeys(v82, v49, v50);
    v53 = objc_msgSend_initWithOperation_shortTokenLookupInfos_(v48, v52, (uint64_t)self, v51);

    uint64_t v56 = objc_msgSend_shouldFetchRootRecord(self, v54, v55);
    objc_msgSend_setShouldFetchRootRecord_(v53, v57, v56);
    v58 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v99 = *MEMORY[0x1E4F19D58];
    id v60 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v59, (uint64_t)&v99, 1);
    v62 = objc_msgSend_setWithArray_(v58, v61, (uint64_t)v60);

    if (objc_msgSend_shouldFetchRootRecord(self, v63, v64))
    {
      uint64_t v67 = objc_msgSend_rootRecordDesiredKeysSet(self, v65, v66);

      v62 = (void *)v67;
    }
    objc_msgSend_setRootRecordDesiredKeySet_(v53, v65, (uint64_t)v62);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v53);
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = sub_1C4DE9008;
    v87[3] = &unk_1E64F3230;
    objc_copyWeak(&v90, &location);
    id v88 = v82;
    id v68 = v8;
    id v89 = v68;
    objc_msgSend_setTokenResolveBlock_(v53, v69, (uint64_t)v87);
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = sub_1C4DE90A4;
    v83[3] = &unk_1E64F24C8;
    objc_copyWeak(&v85, &location);
    objc_copyWeak(&v86, &from);
    v83[4] = self;
    id v70 = v68;
    id v84 = v70;
    objc_msgSend_setCompletionBlock_(v53, v71, (uint64_t)v83);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v72 = (id)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      uint64_t v75 = objc_msgSend_count(v70, v73, v74);
      *(_DWORD *)buf = 134217984;
      uint64_t v98 = v75;
      _os_log_impl(&dword_1C4CFF000, v72, OS_LOG_TYPE_INFO, "Fetching short share token metadata from the server for %ld URLs", buf, 0xCu);
    }

    objc_msgSend_setRequest_(self, v76, (uint64_t)v53);
    int v79 = objc_msgSend_container(self, v77, v78);
    objc_msgSend_performRequest_(v79, v80, (uint64_t)v53);

    objc_destroyWeak(&v86);
    objc_destroyWeak(&v85);

    objc_destroyWeak(&v90);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v81 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v81, OS_LOG_TYPE_INFO, "We have no tokens to fetch short token metadata for. Giving up now", buf, 2u);
    }
  }
}

- (void)_handleTokenResolveWithLookupInfo:(id)a3 shareMetadata:(id)a4 responseCode:(id)a5 urlByShortTokenLookupInfos:(id)a6 tokensToFetchByURL:(id)a7
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v97 = v12;
  id v98 = a7;
  long long v96 = v15;
  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v15, v16, (uint64_t)v12);
  uint64_t v20 = objc_msgSend_share(v13, v18, v19);
  objc_msgSend_setMutableURL_(v20, v21, (uint64_t)v17);

  uint64_t v24 = objc_msgSend_host(v17, v22, v23);
  uint64_t v27 = objc_msgSend_share(v13, v25, v26);
  objc_msgSend_setDisplayedHostname_(v27, v28, (uint64_t)v24);

  uint64_t v99 = objc_msgSend_objectForKeyedSubscript_(v98, v29, (uint64_t)v17);
  if (v99)
  {
    if (objc_msgSend_code(v14, v30, v31) == 1)
    {
      if (objc_msgSend_skipShareDecryption(self, v32, v33))
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v36 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v112 = v17;
          _os_log_debug_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_DEBUG, "Skipping share decryption after getting share metadata for shareURL %@", buf, 0xCu);
        }
        objc_msgSend__performCallbackForURL_withMetadata_error_(self, v37, (uint64_t)v17, v13, 0);
        goto LABEL_31;
      }
      v58 = objc_msgSend_protectedFullToken(v13, v34, v35);
      id v60 = objc_msgSend__decodeProtectedFullToken_tokenMetadata_(self, v59, (uint64_t)v58, v99);

      if (v60)
      {
        uint64_t v63 = objc_msgSend_shareInvitationTokensByShareURL(self, v61, v62);
        v65 = objc_msgSend_objectForKeyedSubscript_(v63, v64, (uint64_t)v17);

        objc_initWeak((id *)buf, self);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = sub_1C4DE9AE0;
        aBlock[3] = &unk_1E64F3280;
        objc_copyWeak(&v110, (id *)buf);
        id v66 = v13;
        id v106 = v66;
        id v107 = v99;
        id v67 = v65;
        id v108 = v67;
        id v95 = v17;
        id v109 = v95;
        id v68 = (void (**)(void))_Block_copy(aBlock);
        v71 = objc_msgSend_container(self, v69, v70);
        uint64_t v74 = objc_msgSend_options(v71, v72, v73);
        if (objc_msgSend_useAnonymousToServerShareParticipants(v74, v75, v76))
        {
          int v79 = objc_msgSend_callingParticipant(v66, v77, v78);
          BOOL v80 = v79 == 0;

          if (v80)
          {
            v83 = objc_msgSend_stateTransitionGroup(self, v81, v82);
            dispatch_group_enter(v83);

            id v86 = objc_msgSend_container(self, v84, v85);
            id v89 = objc_msgSend_pcsManager(v86, v87, v88);
            v100[0] = MEMORY[0x1E4F143A8];
            v100[1] = 3221225472;
            v100[2] = sub_1C4DEA1BC;
            v100[3] = &unk_1E64F32A8;
            objc_copyWeak(&v104, (id *)buf);
            id v101 = v95;
            id v102 = v66;
            v103 = v68;
            objc_msgSend_findSelfParticipantOnShareMetadata_invitationToken_completionHandler_(v89, v90, (uint64_t)v102, v67, v100);

            objc_destroyWeak(&v104);
LABEL_30:

            objc_destroyWeak(&v110);
            objc_destroyWeak((id *)buf);

            goto LABEL_31;
          }
        }
        else
        {
        }
        v68[2](v68);
        goto LABEL_30;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v91 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C4CFF000, v91, OS_LOG_TYPE_INFO, "Warn: Couldn't decode the protected full token", buf, 2u);
      }
      long long v93 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v92, *MEMORY[0x1E4F19DD8], 5004, @"Couldn't decode the protected full token for %@", v17);
      objc_msgSend__performCallbackForURL_withMetadata_error_(self, v94, (uint64_t)v17, 0, v93);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v42 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v112 = v14;
        __int16 v113 = 2112;
        id v114 = v17;
        _os_log_debug_impl(&dword_1C4CFF000, v42, OS_LOG_TYPE_DEBUG, "Error %@ when fetching short token metadata for %@", buf, 0x16u);
      }
      int v43 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v44 = sub_1C4E94D98(v14);
      uint64_t v47 = objc_msgSend_request(self, v45, v46);
      v48 = sub_1C4E940D0(v47, v14);
      v51 = objc_msgSend_error(v14, v49, v50);
      v54 = objc_msgSend_errorDescription(v51, v52, v53);
      uint64_t v56 = objc_msgSend_errorWithDomain_code_userInfo_format_(v43, v55, *MEMORY[0x1E4F19DD8], v44, v48, @"Error %@ when fetching short token metadata for %@: %@", v14, v17, v54);

      objc_msgSend__performCallbackForURL_withMetadata_error_(self, v57, (uint64_t)v17, 0, v56);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v38 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v112 = v17;
      __int16 v113 = 2112;
      id v114 = v12;
      _os_log_impl(&dword_1C4CFF000, v38, OS_LOG_TYPE_INFO, "Warn: Couldn't get token metadata for URL %@ and token lookup info %@", buf, 0x16u);
    }
    uint64_t v40 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v39, *MEMORY[0x1E4F19DD8], 1000, @"Internal error when fetching short token metadata for %@", v17);
    objc_msgSend__performCallbackForURL_withMetadata_error_(self, v41, (uint64_t)v17, 0, v40);
  }
LABEL_31:
}

- (void)_continueSharePCSPrepForShareMetadata:(id)a3 shareURL:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v8 = (id)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = objc_msgSend_share(v6, v9, v10);
    id v14 = objc_msgSend_recordID(v11, v12, v13);
    uint64_t v17 = objc_msgSend_container(self, v15, v16);
    *(_DWORD *)buf = 138412546;
    uint64_t v62 = v14;
    __int16 v63 = 2112;
    uint64_t v64 = v17;
    _os_log_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_INFO, "Attempting to prep PCS data for share %@ with container %@", buf, 0x16u);
  }
  uint64_t v20 = objc_msgSend_stateTransitionGroup(self, v18, v19);
  dispatch_group_enter(v20);

  uint64_t v23 = objc_msgSend_participantRole(v6, v21, v22);
  uint64_t v26 = 2;
  if (v23 != 1) {
    uint64_t v26 = 3;
  }
  uint64_t v52 = v26;
  uint64_t v55 = objc_msgSend_share(v6, v24, v25);
  v54 = objc_msgSend_container(self, v27, v28);
  uint64_t v53 = objc_msgSend_privateToken(v6, v29, v30);
  uint64_t v33 = objc_msgSend_callingParticipant(v6, v31, v32);
  uint64_t v36 = objc_msgSend_userIdentity(v33, v34, v35);
  uint64_t v39 = objc_msgSend_outOfNetworkPrivateKey(v36, v37, v38);
  uint64_t v42 = objc_msgSend_sharedZone(v6, v40, v41);
  uint64_t v45 = objc_msgSend_topmostParentOperation(self, v43, v44);
  v48 = objc_msgSend_operationID(v45, v46, v47);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = sub_1C4DEA688;
  v56[3] = &unk_1E64F32D0;
  objc_copyWeak(&v59, &location);
  id v49 = v6;
  id v57 = v49;
  id v50 = v7;
  id v58 = v50;
  objc_msgSend__prepPCSDataWithContainer_databaseScope_publicSharingKey_oonPrivateKey_removeServerSpecifiedKeys_sharedRecordZone_requestorOperationID_completionHandler_(v55, v51, (uint64_t)v54, v52, v53, v39, 0, v42, v48, v56);

  objc_destroyWeak(&v59);
  objc_destroyWeak(&location);
}

- (void)_prepPPPCSDataForDugongShareMetadata:(id)a3 withInvitationToken:(id)a4 completionHandler:(id)a5
{
  id v37 = a3;
  id v8 = a4;
  v11 = (void (**)(id, void, void *))a5;
  if (v8) {
    goto LABEL_2;
  }
  uint64_t v30 = (void *)MEMORY[0x1E4F1A280];
  uint64_t v31 = *MEMORY[0x1E4F19DD8];
  uint64_t v32 = objc_msgSend_share(v37, v9, v10);
  uint64_t v35 = objc_msgSend_URL(v32, v33, v34);
  uint64_t v29 = objc_msgSend_errorWithDomain_code_format_(v30, v36, v31, 1017, @"No sharing invitation token provided for device-to-device encrypted share %@", v35);

  if (!v29)
  {
LABEL_2:
    id v12 = objc_msgSend_share(v37, v9, v10);
    id v15 = objc_msgSend_share(v37, v13, v14);
    uint64_t v18 = objc_msgSend_modificationDate(v15, v16, v17);
    uint64_t v21 = objc_msgSend_container(self, v19, v20);
    uint64_t v24 = objc_msgSend_topmostParentOperation(self, v22, v23);
    uint64_t v27 = objc_msgSend_operationID(v24, v25, v26);
    objc_msgSend__ingestAndExportPPPCSFromShareInvitationToken_shareModificationDate_container_requestorOperationID_completionHandler_(v12, v28, (uint64_t)v8, v18, v21, v27, v11);

    uint64_t v29 = 0;
  }
  else if (v11)
  {
    v11[2](v11, 0, v29);
  }
}

- (void)_continueHandlingFetchedShareMetadata:(id)a3 shareURL:(id)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_share(v6, v8, v9);
  if (objc_msgSend_publicPCS(v10, v11, v12))
  {
    uint64_t v15 = objc_msgSend_publicPCS(v10, v13, v14);
    uint64_t v18 = objc_msgSend_container(self, v16, v17);
    uint64_t v21 = objc_msgSend_pcsManager(v18, v19, v20);
    objc_msgSend__encryptDataWithPCSBlob_pcsManager_(v6, v22, v15, v21);

    uint64_t v25 = objc_msgSend_container(self, v23, v24);
    uint64_t v28 = objc_msgSend_pcsManager(v25, v26, v27);
    uint64_t v31 = objc_msgSend_publicPCS(v10, v29, v30);
    id v82 = 0;
    uint64_t v33 = objc_msgSend_sharingIdentityDataFromPCS_error_(v28, v32, v31, &v82);
    id v34 = v82;

    id v35 = objc_alloc(MEMORY[0x1E4F19FA0]);
    id v37 = objc_msgSend_initWithData_(v35, v36, (uint64_t)v33);
    objc_msgSend_setMutableEncryptedPSK_(v10, v38, (uint64_t)v37);

    uint64_t v39 = (void *)*MEMORY[0x1E4F1A548];
    if (v34)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v39);
      }
      uint64_t v40 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        uint64_t v41 = v40;
        uint64_t v44 = objc_msgSend_recordID(v10, v42, v43);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v44;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v34;
        _os_log_impl(&dword_1C4CFF000, v41, OS_LOG_TYPE_INFO, "Warn: Couldn't get a public sharing identity for share %@: %@", buf, 0x16u);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v39);
      }
      uint64_t v45 = (void *)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
      {
        uint64_t v46 = v45;
        id v49 = objc_msgSend_recordID(v10, v47, v48);
        uint64_t v52 = objc_msgSend_mutableEncryptedPSK(v10, v50, v51);
        uint64_t v55 = objc_msgSend_data(v52, v53, v54);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v49;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v55;
        _os_log_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_INFO, "Public sharing identity for share %@ is %@", buf, 0x16u);
      }
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v86 = sub_1C4DEAFB0;
  v87 = sub_1C4DEAFC0;
  id v88 = 0;
  uint64_t v56 = dispatch_group_create();
  if (objc_msgSend_containsAssetValues(v10, v57, v58)) {
    int hasEncryptedData = 1;
  }
  else {
    int hasEncryptedData = objc_msgSend_hasEncryptedData(v10, v59, v60);
  }
  if (!objc_msgSend_shouldFetchRootRecord(self, v59, v60))
  {
    if (!hasEncryptedData) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  uint64_t v64 = objc_msgSend_rootRecord(v6, v62, v63);
  if (objc_msgSend_containsAssetValues(v64, v65, v66))
  {
    int v69 = 1;
    if (v64) {
      goto LABEL_26;
    }
  }
  else
  {
    int v69 = objc_msgSend_hasEncryptedData(v64, v67, v68);
    if (v64) {
      goto LABEL_26;
    }
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v70 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v83 = 138412290;
    id v84 = v6;
    _os_log_error_impl(&dword_1C4CFF000, v70, OS_LOG_TYPE_ERROR, "No root record received when fetching share metadata %@", v83, 0xCu);
  }
LABEL_26:

  if ((hasEncryptedData | v69))
  {
LABEL_27:
    dispatch_group_enter(v56);
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = sub_1C4DEAFC8;
    v79[3] = &unk_1E64F06A8;
    uint64_t v81 = buf;
    BOOL v80 = v56;
    objc_msgSend__decryptRootRecordsForShareURL_withMetadata_completionHandler_(self, v71, (uint64_t)v7, v6, v79);
  }
LABEL_28:
  uint64_t v72 = objc_msgSend_callbackQueue(self, v62, v63);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4DEB034;
  block[3] = &unk_1E64F2158;
  block[4] = self;
  id v76 = v7;
  id v77 = v6;
  uint64_t v78 = buf;
  id v73 = v6;
  id v74 = v7;
  dispatch_group_notify(v56, v72, block);

  _Block_object_dispose(buf, 8);
}

- (void)_decryptRootRecordsForShareURL:(id)a3 withMetadata:(id)a4 completionHandler:(id)a5
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v102 = a3;
  id v8 = a4;
  id v104 = a5;
  val = self;
  __int16 v113 = objc_msgSend_container(self, v9, v10);
  v111 = objc_msgSend_processScopedClientProxy(v113, v11, v12);
  id v109 = objc_msgSend_logicalDeviceScopedClientProxy(v113, v13, v14);
  id v110 = objc_opt_new();
  uint64_t v17 = objc_msgSend_share(v8, v15, v16);

  if (v17)
  {
    uint64_t v20 = objc_msgSend_share(v8, v18, v19);
    objc_msgSend_addObject_(v110, v21, (uint64_t)v20);
  }
  uint64_t v22 = objc_msgSend_rootRecord(v8, v18, v19);

  if (v22)
  {
    uint64_t v25 = objc_msgSend_rootRecord(v8, v23, v24);
    objc_msgSend_addObject_(v110, v26, (uint64_t)v25);
  }
  uint64_t v27 = objc_opt_new();
  if (objc_msgSend_participantRole(v8, v28, v29) == 1) {
    uint64_t v31 = 2;
  }
  else {
    uint64_t v31 = 3;
  }
  uint64_t v103 = v31;
  objc_msgSend_setDatabaseScope_(v27, v30, v31);
  objc_msgSend_setShouldFetchAssetContent_(v27, v32, 1);
  id v35 = objc_msgSend_rootRecordDesiredKeysSet(self, v33, v34);
  uint64_t v38 = objc_msgSend_allObjects(v35, v36, v37);
  objc_msgSend_setDesiredKeys_(v27, v39, (uint64_t)v38);

  uint64_t v40 = [CKDAppContainerTuple alloc];
  uint64_t v43 = objc_msgSend_applicationID(v113, v41, v42);
  uint64_t v46 = objc_msgSend_containerID(v8, v44, v45);
  id v49 = objc_msgSend_personaID(v113, v47, v48);
  id v108 = objc_msgSend_initWithApplicationID_containerID_personaID_(v40, v50, (uint64_t)v43, v46, v49);

  uint64_t v53 = objc_msgSend_entitlements(v113, v51, v52);
  uint64_t v56 = objc_msgSend_options(v113, v54, v55);
  id v59 = objc_msgSend_clientConnection(v111, v57, v58);
  uint64_t v62 = objc_msgSend_sharedContainers(v59, v60, v61);
  uint64_t v64 = objc_msgSend_containerWithAppContainerTuple_processScopedClientProxy_logicalDeviceScopedClientProxy_containerEntitlements_containerOptions_sharedContainerTable_(CKDContainer, v63, (uint64_t)v108, v111, v109, v53, v56, v62);

  id v67 = objc_msgSend_stateTransitionGroup(val, v65, v66);
  dispatch_group_enter(v67);

  objc_initWeak(&location, val);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v68 = (id)*MEMORY[0x1E4F1A528];
  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    v71 = objc_msgSend_share(v8, v69, v70);
    id v74 = objc_msgSend_recordID(v71, v72, v73);
    *(_DWORD *)buf = 138412546;
    v124 = v74;
    __int16 v125 = 2112;
    v126 = v64;
    _os_log_impl(&dword_1C4CFF000, v68, OS_LOG_TYPE_INFO, "Attempting to prep PCS data for share %@ with container %@", buf, 0x16u);
  }
  id v107 = objc_msgSend_share(v8, v75, v76);
  id v106 = objc_msgSend_privateToken(v8, v77, v78);
  uint64_t v81 = objc_msgSend_callingParticipant(v8, v79, v80);
  id v84 = objc_msgSend_userIdentity(v81, v82, v83);
  v87 = objc_msgSend_outOfNetworkPrivateKey(v84, v85, v86);
  id v90 = objc_msgSend_sharedZone(v8, v88, v89);
  long long v93 = objc_msgSend_topmostParentOperation(val, v91, v92);
  long long v96 = objc_msgSend_operationID(v93, v94, v95);
  v114[0] = MEMORY[0x1E4F143A8];
  v114[1] = 3221225472;
  v114[2] = sub_1C4DEB5BC;
  v114[3] = &unk_1E64F3370;
  objc_copyWeak(&v121, &location);
  id v101 = v8;
  id v115 = v101;
  id v97 = v64;
  id v116 = v97;
  id v105 = v104;
  id v120 = v105;
  id v98 = v27;
  id v117 = v98;
  id v99 = v110;
  id v118 = v99;
  v119 = val;
  objc_msgSend__prepPCSDataWithContainer_databaseScope_publicSharingKey_oonPrivateKey_removeServerSpecifiedKeys_sharedRecordZone_requestorOperationID_completionHandler_(v107, v100, (uint64_t)v97, v103, v106, v87, 0, v90, v96, v114);

  objc_destroyWeak(&v121);
  objc_destroyWeak(&location);
}

- (BOOL)_currentUserIsOONForShareMetadata:(id)a3
{
  id v3 = a3;
  id v6 = objc_msgSend_callingParticipant(v3, v4, v5);
  uint64_t v9 = objc_msgSend_userIdentity(v6, v7, v8);
  if (objc_msgSend_hasiCloudAccount(v9, v10, v11))
  {
    uint64_t v14 = objc_msgSend_callingParticipant(v3, v12, v13);
    uint64_t v17 = objc_msgSend_userIdentity(v14, v15, v16);
    uint64_t v22 = objc_msgSend_outOfNetworkPrivateKey(v17, v18, v19);
    if (v22)
    {
      BOOL v23 = 1;
    }
    else
    {
      uint64_t v24 = objc_msgSend_share(v3, v20, v21);
      uint64_t v29 = objc_msgSend_currentUserParticipant(v24, v25, v26);
      if (v29)
      {
        BOOL v23 = 0;
      }
      else
      {
        uint64_t v30 = objc_msgSend_outOfNetworkMatches(v3, v27, v28);
        BOOL v23 = objc_msgSend_count(v30, v31, v32) != 0;
      }
    }
  }
  else
  {
    BOOL v23 = 1;
  }

  return v23;
}

- (void)_prepareShortTokens
{
  id v3 = self;
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_shareURLsToFetch(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    uint64_t v10 = objc_msgSend_shareURLsToFetch(v3, v8, v9);
    uint64_t v13 = objc_msgSend_copy(v10, v11, v12);

    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v95, v105, 16);
    if (!v15) {
      goto LABEL_48;
    }
    uint64_t v16 = v15;
    uint64_t v17 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
    uint64_t v92 = *(void *)v96;
    uint64_t v91 = *MEMORY[0x1E4F19DD8];
    id v88 = v13;
    uint64_t v89 = v3;
    while (1)
    {
      uint64_t v18 = 0;
      uint64_t v90 = v16;
      do
      {
        if (*(void *)v96 != v92) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v95 + 1) + 8 * v18);
        if (*v17 != -1) {
          dispatch_once(v17, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v20 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v100 = v19;
          _os_log_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_INFO, "Extracting short token from URL %@", buf, 0xCu);
        }
        id v21 = objc_alloc(MEMORY[0x1E4F29088]);
        BOOL v23 = objc_msgSend_initWithURL_resolvingAgainstBaseURL_(v21, v22, v19, 0);
        uint64_t v26 = objc_msgSend_path(v23, v24, v25);
        uint64_t v29 = objc_msgSend_lastPathComponent(v26, v27, v28);

        if ((unint64_t)objc_msgSend_length(v29, v30, v31) > 3)
        {
          uint64_t v37 = v17;
          uint64_t v38 = objc_msgSend_substringWithRange_(v29, v32, 0, 3);
          long long v93 = objc_msgSend_substringFromIndex_(v29, v39, 3);
          uint64_t v41 = objc_msgSend_CKDataFromBase64URLSafeString_(MEMORY[0x1E4F1C9B8], v40, (uint64_t)v93);
          long long v94 = (void *)v38;
          if (v41)
          {
            uint64_t v44 = v41;
            if (objc_msgSend_length(v41, v42, v43) == 16)
            {
              uint64_t v45 = objc_opt_new();
              objc_msgSend_setRoutingKey_(v45, v46, v38);
              objc_msgSend_setShortSharingTokenData_(v45, v47, (uint64_t)v44);
              uint64_t v50 = objc_msgSend_forceDSRefetch(v3, v48, v49);
              objc_msgSend_setForceDSRefetch_(v45, v51, v50);
              uint64_t v54 = objc_msgSend_shareInvitationTokensByShareURL(v3, v52, v53);
              uint64_t v56 = objc_msgSend_objectForKeyedSubscript_(v54, v55, v19);

              if (v56)
              {
                if (*v37 != -1) {
                  dispatch_once(v37, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                }
                id v59 = (void *)*MEMORY[0x1E4F1A500];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
                {
                  uint64_t v60 = v59;
                  uint64_t v63 = objc_msgSend_operationID(v3, v61, v62);
                  *(_DWORD *)buf = 138543618;
                  uint64_t v100 = (uint64_t)v56;
                  __int16 v101 = 2114;
                  uint64_t v102 = (uint64_t)v63;
                  _os_log_impl(&dword_1C4CFF000, v60, OS_LOG_TYPE_INFO, "Received invitation token %{public}@ for CKFetchShareMetadatOperation %{public}@", buf, 0x16u);
                }
              }
              uint64_t v64 = objc_msgSend_participantID(v56, v57, v58);
              uint64_t v67 = objc_msgSend_length(v64, v65, v66);

              if (v67)
              {
                if (*v37 != -1) {
                  dispatch_once(v37, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                }
                uint64_t v68 = *MEMORY[0x1E4F1A500];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v100 = (uint64_t)v56;
                  _os_log_impl(&dword_1C4CFF000, v68, OS_LOG_TYPE_INFO, "Found participantID on invitationToken %@", buf, 0xCu);
                }
                v71 = objc_msgSend_participantID(v56, v69, v70);
                objc_msgSend_setParticipantID_(v45, v72, (uint64_t)v71);
              }
              if (*v37 != -1) {
                dispatch_once(v37, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              uint64_t v73 = *MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                uint64_t v100 = (uint64_t)v93;
                __int16 v101 = 2114;
                uint64_t v102 = (uint64_t)v94;
                __int16 v103 = 2112;
                uint64_t v104 = v19;
                _os_log_impl(&dword_1C4CFF000, v73, OS_LOG_TYPE_INFO, "Extracted short token %@ and routing key %{public}@ from URL %@", buf, 0x20u);
              }
              uint64_t v76 = objc_msgSend_shareTokenMetadatasToFetchByURL(v89, v74, v75);
              objc_msgSend_setObject_forKeyedSubscript_(v76, v77, (uint64_t)v45, v19);

              id v3 = v89;
              id v35 = 0;
              uint64_t v13 = v88;
              uint64_t v17 = v37;
              goto LABEL_45;
            }
            if (*v37 != -1) {
              dispatch_once(v37, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v80 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
            {
              uint64_t v83 = v80;
              uint64_t v86 = objc_msgSend_length(v44, v84, v85);
              *(_DWORD *)buf = 134218242;
              uint64_t v100 = v86;
              __int16 v101 = 2112;
              uint64_t v102 = v19;
              _os_log_debug_impl(&dword_1C4CFF000, v83, OS_LOG_TYPE_DEBUG, "Invalid shortSharingTokenData length(%lu) for the URL %@", buf, 0x16u);
            }
            uint64_t v17 = v37;
          }
          else
          {
            if (*v17 != -1) {
              dispatch_once(v17, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v78 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v100 = v19;
              _os_log_impl(&dword_1C4CFF000, v78, OS_LOG_TYPE_INFO, "Warn: Couldn't decode the short sharing token for the URL %@", buf, 0xCu);
            }
          }
          id v35 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v79, v91, 1017, @"Couldn't parse iCloud Share URL %@", v19);
          objc_msgSend__performCallbackForURL_withMetadata_error_(v3, v81, v19, 0, v35);
LABEL_45:

          uint64_t v16 = v90;
          goto LABEL_46;
        }
        if (*v17 != -1) {
          dispatch_once(v17, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v33 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v100 = v19;
          _os_log_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_INFO, "Warn: Couldn't get a short token for the URL %@", buf, 0xCu);
        }
        id v35 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v34, v91, 1017, @"Couldn't parse iCloud Share URL %@", v19);
        objc_msgSend__performCallbackForURL_withMetadata_error_(v3, v36, v19, 0, v35);
LABEL_46:

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v82, (uint64_t)&v95, v105, 16);
      if (!v16)
      {
LABEL_48:

        return;
      }
    }
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v87 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C4CFF000, v87, OS_LOG_TYPE_INFO, "We have no share URLs to fetch. Giving up.", buf, 2u);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setShareMetadataFetchedBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDFetchShareMetadataOperation;
  [(CKDOperation *)&v6 _finishOnCallbackQueueWithError:v4];
}

- (void)main
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = v3;
    uint64_t v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    uint64_t v15 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v14, 1, 0, 0);
    uint64_t v18 = objc_msgSend_CKPropertiesStyleString(v15, v16, v17);
    uint64_t v20 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v19, 0, 1, 0);
    BOOL v23 = objc_msgSend_CKPropertiesStyleString(v20, v21, v22);
    int v24 = 138544130;
    uint64_t v25 = v13;
    __int16 v26 = 2048;
    uint64_t v27 = self;
    __int16 v28 = 2114;
    uint64_t v29 = v18;
    __int16 v30 = 2112;
    uint64_t v31 = v23;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Starting fetch share metadata operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v24,
      0x2Au);
  }
  objc_super v6 = objc_msgSend_shareURLsToFetch(self, v4, v5);
  BOOL v9 = objc_msgSend_count(v6, v7, v8) == 0;

  objc_msgSend_makeStateTransition_(self, v10, v9);
}

- (BOOL)forceDSRefetch
{
  return self->_forceDSRefetch;
}

- (void)setForceDSRefetch:(BOOL)a3
{
  self->_forceDSRefetch = a3;
}

- (BOOL)errorOnOON
{
  return self->_errorOnOON;
}

- (void)setErrorOnOON:(BOOL)a3
{
  self->_errorOnOON = a3;
}

- (id)shareMetadataFetchedBlock
{
  return self->_shareMetadataFetchedBlock;
}

- (void)setShareMetadataFetchedBlock:(id)a3
{
}

- (NSMutableArray)shareURLsToFetch
{
  return self->_shareURLsToFetch;
}

- (void)setShareURLsToFetch:(id)a3
{
}

- (NSMutableDictionary)shareTokenMetadatasToFetchByURL
{
  return self->_shareTokenMetadatasToFetchByURL;
}

- (void)setShareTokenMetadatasToFetchByURL:(id)a3
{
}

- (BOOL)shouldFetchRootRecord
{
  return self->_shouldFetchRootRecord;
}

- (void)setShouldFetchRootRecord:(BOOL)a3
{
  self->_shouldFetchuint64_t RootRecord = a3;
}

- (NSSet)rootRecordDesiredKeysSet
{
  return self->_rootRecordDesiredKeysSet;
}

- (void)setRootRecordDesiredKeysSet:(id)a3
{
}

- (BOOL)clientWillDisplaySystemAcceptPrompt
{
  return self->_clientWillDisplaySystemAcceptPrompt;
}

- (void)setClientWillDisplaySystemAcceptPrompt:(BOOL)a3
{
  self->_clientWillDisplaySystemAcceptPrompt = a3;
}

- (NSDictionary)shareInvitationTokensByShareURL
{
  return self->_shareInvitationTokensByShareURL;
}

- (void)setShareInvitationTokensByShareURL:(id)a3
{
}

- (BOOL)overwriteContainerPCSServiceIfManatee
{
  return self->_overwriteContainerPCSServiceIfManatee;
}

- (void)setOverwriteContainerPCSServiceIfManatee:(BOOL)a3
{
  self->_overwriteContainerPCSServiceIfManatee = a3;
}

- (BOOL)skipShareDecryption
{
  return self->_skipShareDecryption;
}

- (void)setSkipShareDecryption:(BOOL)a3
{
  self->_skipShareDecryption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareInvitationTokensByShareURL, 0);
  objc_storeStrong((id *)&self->_rootRecordDesiredKeysSet, 0);
  objc_storeStrong((id *)&self->_shareTokenMetadatasToFetchByURL, 0);
  objc_storeStrong((id *)&self->_shareURLsToFetch, 0);
  objc_storeStrong(&self->_shareMetadataFetchedBlock, 0);
}

@end