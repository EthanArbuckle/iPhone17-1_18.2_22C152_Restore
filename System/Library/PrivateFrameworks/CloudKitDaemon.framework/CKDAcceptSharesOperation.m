@interface CKDAcceptSharesOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)_acceptShares;
- (BOOL)_callingParticipantOONForShareMetadata:(id)a3;
- (BOOL)canSynchronizeUserKeyRegistry;
- (BOOL)makeStateTransition;
- (CKDAcceptSharesOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSMutableArray)acceptedShareURLsToFetch;
- (NSMutableArray)anonymousShareTuplesAccepted;
- (NSMutableArray)shareURLsToAccept;
- (NSMutableDictionary)URLsWaitingKRSByServiceType;
- (NSMutableDictionary)anonymousShareTuplesAcceptAttempted;
- (NSMutableDictionary)clientProvidedMetadatasByURL;
- (NSMutableDictionary)shareMetadatasToAcceptByURL;
- (id)_addSelfIdentityToShareMetadataPublicPCS:(id)a3 serviceType:(unint64_t)a4 forShareWithURL:(id)a5 error:(id *)a6;
- (id)_keySwapForOONParticipant:(id)a3;
- (id)acceptCompletionBlock;
- (id)activityCreate;
- (int)operationType;
- (unint64_t)numShareAcceptAttempts;
- (unint64_t)sharingServiceTypeForShareMetadata:(id)a3;
- (void)_decryptShareMetadata;
- (void)_fetchAcceptedShares;
- (void)_fetchMetadataForShares;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleShareURLAccepted:(id)a3 forShare:(id)a4 responseCode:(id)a5;
- (void)_performCallbackForURL:(id)a3 withShare:(id)a4 error:(id)a5;
- (void)_prepareShareMetadata;
- (void)_processAnonymousShares;
- (void)_synchronizeUserKeyRegistryIfNeeded;
- (void)_validateInvitedPCSCanBeDecryptedForShare:(id)a3 completionHandler:(id)a4;
- (void)main;
- (void)setAcceptCompletionBlock:(id)a3;
- (void)setAcceptedShareURLsToFetch:(id)a3;
- (void)setAnonymousShareTuplesAcceptAttempted:(id)a3;
- (void)setAnonymousShareTuplesAccepted:(id)a3;
- (void)setCanSynchronizeUserKeyRegistry:(BOOL)a3;
- (void)setClientProvidedMetadatasByURL:(id)a3;
- (void)setNumShareAcceptAttempts:(unint64_t)a3;
- (void)setShareMetadatasToAcceptByURL:(id)a3;
- (void)setShareURLsToAccept:(id)a3;
- (void)setURLsWaitingKRSByServiceType:(id)a3;
@end

@implementation CKDAcceptSharesOperation

- (CKDAcceptSharesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CKDAcceptSharesOperation;
  v7 = [(CKDDatabaseOperation *)&v47 initWithOperationInfo:v6 container:a4];
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    clientProvidedMetadatasByURL = v7->_clientProvidedMetadatasByURL;
    v7->_clientProvidedMetadatasByURL = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    shareURLsToAccept = v7->_shareURLsToAccept;
    v7->_shareURLsToAccept = (NSMutableArray *)v10;

    uint64_t v12 = objc_opt_new();
    shareMetadatasToAcceptByURL = v7->_shareMetadatasToAcceptByURL;
    v7->_shareMetadatasToAcceptByURL = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    acceptedShareURLsToFetch = v7->_acceptedShareURLsToFetch;
    v7->_acceptedShareURLsToFetch = (NSMutableArray *)v14;

    uint64_t v16 = objc_opt_new();
    anonymousShareTuplesAcceptAttempted = v7->_anonymousShareTuplesAcceptAttempted;
    v7->_anonymousShareTuplesAcceptAttempted = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    anonymousShareTuplesAccepted = v7->_anonymousShareTuplesAccepted;
    v7->_anonymousShareTuplesAccepted = (NSMutableArray *)v18;

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v42 = v6;
    v22 = objc_msgSend_shareMetadatasToAccept(v6, v20, v21);
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v43, v48, 16);
    if (v24)
    {
      uint64_t v27 = v24;
      uint64_t v28 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v44 != v28) {
            objc_enumerationMutation(v22);
          }
          v30 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v31 = v7->_clientProvidedMetadatasByURL;
          v32 = objc_msgSend_invitationURL(v30, v25, v26);
          objc_msgSend_setObject_forKeyedSubscript_(v31, v33, (uint64_t)v30, v32);

          v34 = v7->_shareURLsToAccept;
          v37 = objc_msgSend_invitationURL(v30, v35, v36);
          objc_msgSend_addObject_(v34, v38, (uint64_t)v37);
        }
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v43, v48, 16);
      }
      while (v27);
    }

    v7->_canSynchronizeUserKeyRegistry = 1;
    uint64_t v39 = objc_opt_new();
    URLsWaitingKRSByServiceType = v7->_URLsWaitingKRSByServiceType;
    v7->_URLsWaitingKRSByServiceType = (NSMutableDictionary *)v39;

    id v6 = v42;
  }

  return v7;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/accept-shares", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)makeStateTransition
{
  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      goto LABEL_10;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend__prepareShareMetadata(self, v6, v7);
      return 1;
    case 3:
      objc_msgSend_setState_(self, v4, 5);
      objc_msgSend__fetchAcceptedShares(self, v8, v9);
      return 1;
    case 4:
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend__synchronizeUserKeyRegistryIfNeeded(self, v10, v11);
      return 1;
    case 5:
      objc_msgSend_setState_(self, v4, 6);
      objc_msgSend__decryptShareMetadata(self, v12, v13);
      return 1;
    case 6:
      objc_msgSend_setState_(self, v4, 7);
      return MEMORY[0x1F4181798](self, sel__acceptShares, v14);
    case 7:
      v15 = objc_msgSend_shareURLsToAccept(self, v4, v5);
      uint64_t v18 = objc_msgSend_count(v15, v16, v17);

      if (v18)
      {
LABEL_10:
        objc_msgSend_setState_(self, v4, 2);
        objc_msgSend__fetchMetadataForShares(self, v19, v20);
      }
      else
      {
        objc_msgSend_setState_(self, v4, 8);
        objc_msgSend__processAnonymousShares(self, v25, v26);
      }
      return 1;
    case 8:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      v23 = objc_msgSend_error(self, v21, v22);
      objc_msgSend_finishWithError_(self, v24, (uint64_t)v23);

      return 1;
    default:
      return 1;
  }
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 7)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDAcceptSharesOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F8710[a3 - 2];
  }
  return v3;
}

- (void)_performCallbackForURL:(id)a3 withShare:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v13 = a5;
  if (!v9)
  {
    uint64_t v26 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, self, @"CKDAcceptSharesOperation.m", 177, @"Invalid parameter not satisfying: %@", @"shareURL");
  }
  uint64_t v14 = objc_msgSend_shareURLsToAccept(self, v11, v12);
  objc_msgSend_removeObject_(v14, v15, (uint64_t)v9);

  uint64_t v18 = objc_msgSend_acceptedShareURLsToFetch(self, v16, v17);
  objc_msgSend_removeObject_(v18, v19, (uint64_t)v9);

  uint64_t v22 = objc_msgSend_callbackQueue(self, v20, v21);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4FF36D4;
  block[3] = &unk_1E64F0DF0;
  block[4] = self;
  id v29 = v9;
  id v30 = v10;
  id v31 = v13;
  id v23 = v13;
  id v24 = v10;
  id v25 = v9;
  dispatch_async(v22, block);
}

- (void)_handleShareURLAccepted:(id)a3 forShare:(id)a4 responseCode:(id)a5
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v124 = a4;
  id v9 = a5;
  uint64_t v130 = 0;
  v131 = &v130;
  uint64_t v132 = 0x3032000000;
  v133 = sub_1C4FF3E84;
  v134 = sub_1C4FF3E94;
  id v135 = 0;
  if (objc_msgSend_code(v9, v10, v11) == 1)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v14 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v137 = v8;
      _os_log_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_INFO, "Share with URL %@ was successfully accepted", buf, 0xCu);
    }
    uint64_t v17 = objc_msgSend_container(self, v15, v16);
    uint64_t v20 = objc_msgSend_options(v17, v18, v19);
    if (objc_msgSend_useAnonymousToServerShareParticipants(v20, v21, v22))
    {
      id v25 = objc_msgSend_anonymousShareTuplesAcceptAttempted(self, v23, v24);
      uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v25, v26, (uint64_t)v8);
      BOOL v28 = v27 == 0;

      if (v28)
      {
LABEL_10:
        uint64_t v36 = objc_msgSend_shareMetadatasToAcceptByURL(self, v29, v30);
        v38 = objc_msgSend_objectForKeyedSubscript_(v36, v37, (uint64_t)v8);

        v41 = objc_msgSend_host(v8, v39, v40);
        objc_msgSend_setDisplayedHostname_(v124, v42, (uint64_t)v41);

        if ((objc_msgSend_isCallingParticipantUsingOTL(v38, v43, v44) & 1) == 0) {
          objc_msgSend_setMutableURL_(v124, v45, (uint64_t)v8);
        }
        objc_super v47 = objc_msgSend_stateTransitionGroup(self, v45, v46);
        dispatch_group_enter(v47);

        v50 = objc_msgSend_container(self, v48, v49);
        v53 = objc_msgSend_topmostParentOperation(self, v51, v52);
        v56 = objc_msgSend_operationID(v53, v54, v55);
        v125[0] = MEMORY[0x1E4F143A8];
        v125[1] = 3221225472;
        v125[2] = sub_1C4FF3E9C;
        v125[3] = &unk_1E64F86C8;
        v129 = &v130;
        id v126 = v124;
        v127 = self;
        id v128 = v8;
        objc_msgSend__prepPCSDataWithContainer_databaseScope_removeServerSpecifiedKeys_requestorOperationID_completionHandler_(v126, v57, (uint64_t)v50, 3, 1, v56, v125);

        goto LABEL_34;
      }
      uint64_t v17 = objc_msgSend_anonymousShareTuplesAccepted(self, v29, v30);
      uint64_t v20 = objc_msgSend_anonymousShareTuplesAcceptAttempted(self, v31, v32);
      v34 = objc_msgSend_objectForKeyedSubscript_(v20, v33, (uint64_t)v8);
      objc_msgSend_addObject_(v17, v35, (uint64_t)v34);
    }
    goto LABEL_10;
  }
  v58 = objc_msgSend_error(v9, v12, v13);
  v61 = objc_msgSend_clientError(v58, v59, v60);
  if (objc_msgSend_type(v61, v62, v63) == 52) {
    goto LABEL_16;
  }
  v66 = objc_msgSend_error(v9, v64, v65);
  v69 = objc_msgSend_clientError(v66, v67, v68);
  if (objc_msgSend_type(v69, v70, v71) == 53)
  {

LABEL_16:
LABEL_17:
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v74 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v137 = v8;
      _os_log_impl(&dword_1C4CFF000, v74, OS_LOG_TYPE_INFO, "PCS oplock failure for share with url %@.", buf, 0xCu);
    }
    goto LABEL_34;
  }
  v75 = objc_msgSend_error(v9, v72, v73);
  v78 = objc_msgSend_clientError(v75, v76, v77);
  BOOL v81 = objc_msgSend_type(v78, v79, v80) == 15;

  if (v81) {
    goto LABEL_17;
  }
  v84 = objc_msgSend_error(v9, v82, v83);
  v87 = objc_msgSend_clientError(v84, v85, v86);
  BOOL v90 = objc_msgSend_type(v87, v88, v89) == 90;

  v91 = (void *)*MEMORY[0x1E4F1A548];
  if (v90)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v91);
    }
    v92 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v137 = v8;
      _os_log_error_impl(&dword_1C4CFF000, v92, OS_LOG_TYPE_ERROR, "Participant can be found on the share, but the participantID sent in request does not belong to the found participant. Share url: %@", buf, 0xCu);
    }
    v93 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v94 = sub_1C4E94D98(v9);
    v97 = objc_msgSend_error(v9, v95, v96);
    v100 = objc_msgSend_errorDescription(v97, v98, v99);
    uint64_t v102 = objc_msgSend_errorWithDomain_code_format_(v93, v101, *MEMORY[0x1E4F19DD8], v94, @"Error accepting share %@: %@", v8, v100);
    v103 = (void *)v131[5];
    v131[5] = v102;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v91);
    }
    v104 = (id)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
    {
      v107 = objc_msgSend_error(v9, v105, v106);
      v110 = objc_msgSend_errorDescription(v107, v108, v109);
      *(_DWORD *)buf = 138412546;
      id v137 = v8;
      __int16 v138 = 2114;
      v139 = v110;
      _os_log_impl(&dword_1C4CFF000, v104, OS_LOG_TYPE_INFO, "Error accepting share with URL %@: %{public}@", buf, 0x16u);
    }
    v111 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v112 = sub_1C4E94D98(v9);
    v97 = objc_msgSend_request(self, v113, v114);
    v100 = sub_1C4E940D0(v97, v9);
    v103 = objc_msgSend_error(v9, v115, v116);
    v119 = objc_msgSend_errorDescription(v103, v117, v118);
    uint64_t v121 = objc_msgSend_errorWithDomain_code_userInfo_format_(v111, v120, *MEMORY[0x1E4F19DD8], v112, v100, @"Error accepting share %@: %@", v8, v119);
    v122 = (void *)v131[5];
    v131[5] = v121;
  }
  objc_msgSend__performCallbackForURL_withShare_error_(self, v123, (uint64_t)v8, v124, v131[5]);
LABEL_34:
  _Block_object_dispose(&v130, 8);
}

- (int)operationType
{
  return 503;
}

- (BOOL)_acceptShares
{
  uint64_t v271 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend_shareURLsToAccept(self, a2, v2);
  uint64_t v6 = objc_msgSend_count(v3, v4, v5);

  if (v6)
  {
    v254 = objc_msgSend_container(self, v7, v8);
    v248 = objc_opt_new();
    long long v264 = 0u;
    long long v265 = 0u;
    long long v266 = 0u;
    long long v267 = 0u;
    objc_msgSend_shareMetadatasToAcceptByURL(self, v9, v10);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v253 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v264, v270, 16);
    if (!v253) {
      goto LABEL_69;
    }
    uint64_t v252 = *(void *)v265;
    uint64_t v249 = *MEMORY[0x1E4F19DD8];
    while (1)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v265 != v252) {
          objc_enumerationMutation(obj);
        }
        uint64_t v255 = *(void *)(*((void *)&v264 + 1) + 8 * v14);
        v15 = objc_msgSend_shareMetadatasToAcceptByURL(self, v12, v13);
        uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v15, v16, v255);

        uint64_t v18 = objc_opt_new();
        objc_msgSend_setShareURL_(v18, v19, v255);
        uint64_t v22 = objc_msgSend_share(v17, v20, v21);
        id v25 = objc_msgSend_recordID(v22, v23, v24);
        objc_msgSend_setShareRecordID_(v18, v26, (uint64_t)v25);

        uint64_t v29 = objc_msgSend_acceptedInProcess(v17, v27, v28);
        objc_msgSend_setAcceptedInProcess_(v18, v30, v29);
        uint64_t v33 = objc_msgSend_participantRole(v17, v31, v32);
        int v35 = objc_msgSend__callingParticipantOONForShareMetadata_(self, v34, (uint64_t)v17);
        v38 = objc_msgSend_pcsManager(v254, v36, v37);
        int IsManatee = objc_msgSend_currentServiceIsManatee(v38, v39, v40);

        uint64_t v44 = objc_msgSend_options(v254, v42, v43);
        int v47 = objc_msgSend_useAnonymousToServerShareParticipants(v44, v45, v46);

        if ((v35 & IsManatee) == 1)
        {
          v218 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v48, v49);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v218, v219, (uint64_t)a2, self, @"CKDAcceptSharesOperation.m", 273, @"OON Participants not supported in manatee");
        }
        if (v33 == 4) {
          int v50 = IsManatee;
        }
        else {
          int v50 = 0;
        }
        if (v50 == 1)
        {
          v220 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v48, v49);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v220, v221, (uint64_t)a2, self, @"CKDAcceptSharesOperation.m", 274, @"Public sharing not supported in manatee");
        }
        if (v33 == 4) {
          int v51 = v47;
        }
        else {
          int v51 = 0;
        }
        if (v51 == 1)
        {
          v222 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v48, v49);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v222, v223, (uint64_t)a2, self, @"CKDAcceptSharesOperation.m", 275, @"Public sharing not supported when using anonymous to server share participants");
        }
        if ((v35 & v47) == 1)
        {
          v224 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v48, v49);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v224, v225, (uint64_t)a2, self, @"CKDAcceptSharesOperation.m", 276, @"OON participants not supported when using anonymous to server share participants");
        }
        if (v33 == 4)
        {
          uint64_t v52 = objc_msgSend_share(v17, v48, v49);
          uint64_t v55 = objc_msgSend_etag(v52, v53, v54);
          objc_msgSend_setEtag_(v18, v56, (uint64_t)v55);

          v59 = objc_msgSend_share(v17, v57, v58);
          v62 = objc_msgSend_publicProtectionData(v59, v60, v61);
          objc_msgSend_setPublicPCSData_(v18, v63, (uint64_t)v62);

          v66 = objc_msgSend_share(v17, v64, v65);
          v69 = objc_msgSend_publicProtectionEtag(v66, v67, v68);
          objc_msgSend_setPublicPCSEtag_(v18, v70, (uint64_t)v69);
LABEL_26:

          goto LABEL_27;
        }
        if ((IsManatee | v47) == 1 || v35)
        {
          v66 = objc_msgSend_callingParticipant(v17, v48, v49);
          v69 = objc_msgSend_protectionInfo(v66, v71, v72);
          objc_msgSend_setPppcsProtectionInfo_(v18, v73, (uint64_t)v69);
          goto LABEL_26;
        }
LABEL_27:
        v74 = objc_msgSend_callingParticipant(v17, v48, v49);
        uint64_t v77 = objc_msgSend_participantID(v74, v75, v76);
        objc_msgSend_setParticipantID_(v18, v78, (uint64_t)v77);

        if (*MEMORY[0x1E4F1A4E0])
        {
          BOOL v81 = objc_msgSend_unitTestOverrides(self, v79, v80);
          uint64_t v83 = objc_msgSend_objectForKeyedSubscript_(v81, v82, @"OverwriteParticipantID");

          if (v83)
          {
            v84 = objc_msgSend_unitTestOverrides(self, v79, v80);
            uint64_t v86 = objc_msgSend_objectForKeyedSubscript_(v84, v85, @"OverwriteParticipantID");
            objc_msgSend_setParticipantID_(v18, v87, (uint64_t)v86);
          }
        }
        if (!v47)
        {
          uint64_t v92 = objc_msgSend_sharingServiceTypeForShareMetadata_(self, v79, (uint64_t)v17);
          v95 = objc_msgSend_pcsManager(v254, v93, v94);
          uint64_t v97 = objc_msgSend_publicKeyVersionForServiceType_(v95, v96, v92);
          objc_msgSend_setPublicKeyVersion_(v18, v98, v97);

          v101 = objc_msgSend_pcsManager(v254, v99, v100);
          id v263 = 0;
          v103 = objc_msgSend_participantPublicKeyForServiceType_error_(v101, v102, v92, &v263);
          id v104 = v263;
          objc_msgSend_setPublicKey_(v18, v105, (uint64_t)v103);

          v108 = objc_msgSend_publicKey(v18, v106, v107);
          if (v108) {
            BOOL v109 = v104 == 0;
          }
          else {
            BOOL v109 = 0;
          }
          char v110 = v109;

          if ((v110 & 1) == 0)
          {
            objc_msgSend__performCallbackForURL_withShare_error_(self, v111, v255, 0, v104);

            goto LABEL_67;
          }
          goto LABEL_52;
        }
        if (*MEMORY[0x1E4F1A4E0])
        {
          v88 = objc_msgSend_unitTestOverrides(self, v79, v80);
          BOOL v90 = objc_msgSend_objectForKeyedSubscript_(v88, v89, @"AcceptA2AShareUsingVersionOneAnonymousIdentifier");
          BOOL v91 = v90 != 0;
        }
        else
        {
          BOOL v91 = 0;
        }
        uint64_t v112 = objc_msgSend_pcsManager(v254, v79, v80);
        v115 = objc_msgSend_share(v17, v113, v114);
        uint64_t v118 = objc_msgSend_recordID(v115, v116, v117);
        uint64_t v121 = objc_msgSend_containerID(v254, v119, v120);
        v123 = objc_msgSend_generateAnonymousCKUserIDForCurrentUserInShare_containerID_acceptA2AShareUsingVersionOneAnonymousIdentifier_(v112, v122, (uint64_t)v118, v121, v91);

        if (v123)
        {
          id v126 = objc_msgSend_share(v17, v124, v125);
          v129 = objc_msgSend_recordID(v126, v127, v128);
          v251 = objc_msgSend_copyWithAnonymousCKUserID_(v129, v130, (uint64_t)v123);

          v133 = objc_msgSend_share(v17, v131, v132);
          objc_msgSend_replaceRecordIDWith_(v133, v134, (uint64_t)v251);

          id v137 = objc_msgSend_share(v17, v135, v136);
          uint64_t v140 = objc_msgSend_recordID(v137, v138, v139);
          objc_msgSend_setShareRecordID_(v18, v141, (uint64_t)v140);

          objc_msgSend_setAnonymousCKUserID_(v18, v142, (uint64_t)v123);
          v143 = [CKDAnonymousShareTuple alloc];
          v146 = objc_msgSend_share(v17, v144, v145);
          v149 = objc_msgSend_recordID(v146, v147, v148);
          v152 = objc_msgSend_zoneID(v149, v150, v151);
          v155 = objc_msgSend_share(v17, v153, v154);
          v158 = objc_msgSend_recordID(v155, v156, v157);
          v160 = objc_msgSend_initWithZoneID_shareID_(v143, v159, (uint64_t)v152, v158);

          if (v160)
          {
            v163 = objc_msgSend_anonymousShareTuplesAcceptAttempted(self, v161, v162);
            objc_msgSend_setObject_forKey_(v163, v164, (uint64_t)v160, v255);
          }
          v165 = objc_msgSend_share(v17, v161, v162);
          BOOL v168 = objc_msgSend_myParticipantPCS(v165, v166, v167) == 0;

          if (v168)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v182 = (void *)*MEMORY[0x1E4F1A500];
            BOOL v183 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR);
            v185 = @"Share does not have the per-participant PCS to generate a signature for accepting share at %@";
            if (v183)
            {
              v186 = v182;
              v189 = objc_msgSend_share(v17, v187, v188);
              v192 = objc_msgSend_recordID(v189, v190, v191);
              *(_DWORD *)buf = 138412290;
              v269 = v192;
              _os_log_error_impl(&dword_1C4CFF000, v186, OS_LOG_TYPE_ERROR, "Share does not have the per-participant PCS to generate a signature. Failing to accept share %@.", buf, 0xCu);

              v185 = @"Share does not have the per-participant PCS to generate a signature for accepting share at %@";
            }
          }
          else
          {
            v171 = objc_msgSend_share(v17, v169, v170);
            objc_msgSend_myParticipantPCS(v171, v172, v173);
            v174 = (const void *)PCSFPCopyCurrentPrivateKey();

            v175 = (void *)*MEMORY[0x1E4F1A548];
            if (v174)
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], v175);
              }
              v176 = (void *)*MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
              {
                v204 = v176;
                v207 = objc_msgSend_share(v17, v205, v206);
                v210 = objc_msgSend_recordID(v207, v208, v209);
                *(_DWORD *)buf = 138412290;
                v269 = v210;
                _os_log_error_impl(&dword_1C4CFF000, v204, OS_LOG_TYPE_ERROR, "Setting per-participant PCS for signing ShareAcceptRequest for share %@.", buf, 0xCu);
              }
              objc_msgSend_setSigningPCSIdentity_(v18, v177, (uint64_t)v174);
              CFRelease(v174);

LABEL_52:
              objc_msgSend_addObject_(v248, v111, (uint64_t)v18);
              goto LABEL_67;
            }
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], v175);
            }
            v193 = (void *)*MEMORY[0x1E4F1A500];
            BOOL v194 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR);
            v185 = @"Share does not have the per-participant to generate a signature for accepting share at %@";
            if (v194)
            {
              v211 = v193;
              v214 = objc_msgSend_share(v17, v212, v213);
              v217 = objc_msgSend_recordID(v214, v215, v216);
              *(_DWORD *)buf = 138412290;
              v269 = v217;
              _os_log_error_impl(&dword_1C4CFF000, v211, OS_LOG_TYPE_ERROR, "Failed to get private key from per-participant PCS to generate a signature. Failing to accept share %@.", buf, 0xCu);

              v185 = @"Share does not have the per-participant to generate a signature for accepting share at %@";
            }
          }
          v195 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v184, v249, 5005, v185, v255);
          objc_msgSend__performCallbackForURL_withShare_error_(self, v196, v255, 0, v195);
        }
        else
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v178 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            v197 = v178;
            v200 = objc_msgSend_share(v17, v198, v199);
            v203 = objc_msgSend_recordID(v200, v201, v202);
            *(_DWORD *)buf = 138412290;
            v269 = v203;
            _os_log_error_impl(&dword_1C4CFF000, v197, OS_LOG_TYPE_ERROR, "Could not generate anonymous CK userID to accept share %@. Failing to accept share.", buf, 0xCu);
          }
          v180 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v179, v249, 5005, @"Couldn't generate an anonymous userID to accept share at %@", v255);
          objc_msgSend__performCallbackForURL_withShare_error_(self, v181, v255, 0, v180);
        }
LABEL_67:

        ++v14;
      }
      while (v253 != v14);
      uint64_t v253 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v264, v270, 16);
      if (!v253)
      {
LABEL_69:

        uint64_t v228 = objc_msgSend_count(v248, v226, v227);
        BOOL v231 = v228 != 0;
        if (v228)
        {
          uint64_t v232 = objc_msgSend_numShareAcceptAttempts(self, v229, v230);
          objc_msgSend_setNumShareAcceptAttempts_(self, v233, v232 + 1);
          v234 = [CKDAcceptSharesURLRequest alloc];
          v236 = objc_msgSend_initWithOperation_shareMetadatasToAccept_(v234, v235, (uint64_t)self, v248);
          objc_initWeak((id *)buf, self);
          objc_initWeak(&location, v236);
          v239 = objc_msgSend_stateTransitionGroup(self, v237, v238);
          dispatch_group_enter(v239);

          v260[0] = MEMORY[0x1E4F143A8];
          v260[1] = 3221225472;
          v260[2] = sub_1C4FF50C8;
          v260[3] = &unk_1E64F8650;
          objc_copyWeak(&v261, (id *)buf);
          objc_msgSend_setShareAcceptedBlock_(v236, v240, (uint64_t)v260);
          v257[0] = MEMORY[0x1E4F143A8];
          v257[1] = 3221225472;
          v257[2] = sub_1C4FF5154;
          v257[3] = &unk_1E64F0170;
          objc_copyWeak(&v258, (id *)buf);
          objc_copyWeak(&v259, &location);
          objc_msgSend_setCompletionBlock_(v236, v241, (uint64_t)v257);
          objc_msgSend_setRequest_(self, v242, (uint64_t)v236);
          objc_msgSend_performRequest_(v254, v243, (uint64_t)v236);
          objc_destroyWeak(&v259);
          objc_destroyWeak(&v258);
          objc_destroyWeak(&v261);
          objc_destroyWeak(&location);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v245 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C4CFF000, v245, OS_LOG_TYPE_INFO, "No shares to accept", buf, 2u);
          }
        }

        return v231;
      }
    }
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v244 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C4CFF000, v244, OS_LOG_TYPE_INFO, "No shares to accept", buf, 2u);
  }
  return 0;
}

- (unint64_t)sharingServiceTypeForShareMetadata:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_containerID(v3, v4, v5);
  uint64_t v9 = objc_msgSend_specialContainerType(v6, v7, v8);

  uint64_t v12 = objc_msgSend_participantRole(v3, v10, v11);
  v15 = objc_msgSend_callingParticipant(v3, v13, v14);

  uint64_t v18 = objc_msgSend_userIdentity(v15, v16, v17);
  BOOL v21 = (unint64_t)objc_msgSend_publicKeyVersion(v18, v19, v20) < 3;

  unint64_t v22 = 1;
  if (v9 != 4) {
    unint64_t v22 = 2;
  }
  if (v12 == 4) {
    return v22;
  }
  else {
    return 2 * v21;
  }
}

- (void)_decryptShareMetadata
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_shareURLsToAccept(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    objc_msgSend_shareMetadatasToAcceptByURL(self, v8, v9);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v53, v57, 16);
    if (v48)
    {
      uint64_t v47 = *(void *)v54;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v54 != v47) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v53 + 1) + 8 * v13);
          v15 = objc_msgSend_shareMetadatasToAcceptByURL(self, v11, v12);
          uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v15, v16, v14);

          uint64_t v20 = objc_msgSend_clientProvidedMetadatasByURL(self, v18, v19);
          unint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v20, v21, v14);

          uint64_t v24 = objc_msgSend_sharingServiceTypeForShareMetadata_(self, v23, (uint64_t)v17);
          uint64_t v27 = objc_msgSend_stateTransitionGroup(self, v25, v26);
          dispatch_group_enter(v27);

          uint64_t v30 = objc_msgSend_container(self, v28, v29);
          uint64_t v33 = objc_msgSend_pcsManager(v30, v31, v32);
          uint64_t v36 = objc_msgSend_share(v17, v34, v35);
          uint64_t v39 = objc_msgSend_topmostParentOperation(self, v37, v38);
          id v42 = objc_msgSend_operationID(v39, v40, v41);
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = sub_1C4FF55F8;
          v49[3] = &unk_1E64F84E8;
          id v50 = v22;
          int v51 = self;
          id v52 = v17;
          id v43 = v17;
          id v44 = v22;
          objc_msgSend_pcsDataFromFetchedShare_withServiceType_requestorOperationID_completionHandler_(v33, v45, (uint64_t)v36, v24, v42, v49);

          ++v13;
        }
        while (v48 != v13);
        uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v53, v57, 16);
      }
      while (v48);
    }
  }
}

- (void)_fetchAcceptedShares
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_acceptedShareURLsToFetch(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    uint64_t v49 = objc_opt_new();
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v11 = objc_msgSend_acceptedShareURLsToFetch(self, v9, v10);
    uint64_t v14 = objc_msgSend_copy(v11, v12, v13);

    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v52, v58, 16);
    if (v16)
    {
      uint64_t v19 = v16;
      uint64_t v20 = *(void *)v53;
      uint64_t v48 = *MEMORY[0x1E4F19DD8];
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v53 != v20) {
            objc_enumerationMutation(v14);
          }
          uint64_t v22 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          id v23 = objc_msgSend_shareMetadatasToAcceptByURL(self, v17, v18, v48);
          id v25 = objc_msgSend_objectForKeyedSubscript_(v23, v24, v22);

          uint64_t v28 = objc_msgSend_share(v25, v26, v27);
          id v31 = objc_msgSend_recordID(v28, v29, v30);

          if (v31)
          {
            objc_msgSend_addObject_(v8, v32, (uint64_t)v31);
            objc_msgSend_setObject_forKeyedSubscript_(v49, v33, v22, v31);
          }
          else
          {
            v34 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v32, v48, 2003, @"Fetched share metadata didn't have a share ID");
            objc_msgSend__performCallbackForURL_withShare_error_(self, v35, v22, 0, v34);
          }
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v52, v58, 16);
      }
      while (v19);
    }

    uint64_t v36 = v8;
    if (objc_msgSend_count(v8, v37, v38))
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v39 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v8;
        _os_log_impl(&dword_1C4CFF000, v39, OS_LOG_TYPE_INFO, "Fetching shares for already accepted share IDs: %@", buf, 0xCu);
      }
      id v42 = objc_msgSend_stateTransitionGroup(self, v40, v41);
      dispatch_group_enter(v42);

      id v43 = objc_opt_new();
      objc_msgSend_setRecordIDs_(v43, v44, (uint64_t)v8);
      objc_msgSend_setDatabaseScope_(v43, v45, 3);
      uint64_t v46 = objc_opt_class();
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = sub_1C4FF5E60;
      v50[3] = &unk_1E64F0260;
      v50[4] = self;
      id v51 = v49;
      objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v47, v46, v43, v50);
    }
  }
}

- (id)_addSelfIdentityToShareMetadataPublicPCS:(id)a3 serviceType:(unint64_t)a4 forShareWithURL:(id)a5 error:(id *)a6
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  uint64_t v14 = objc_msgSend_container(self, v12, v13);
  uint64_t v17 = objc_msgSend_share(v10, v15, v16);
  uint64_t v20 = objc_msgSend_publicProtectionData(v17, v18, v19);
  id v23 = (void *)MEMORY[0x1E4F1A550];
  uint64_t v24 = (os_log_t *)MEMORY[0x1E4F1A500];
  if (!v20)
  {

    goto LABEL_20;
  }
  id v25 = (void *)v20;
  uint64_t v26 = objc_msgSend_privateToken(v10, v21, v22);

  if (!v26)
  {
LABEL_20:
    if (*v23 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v69 = *v24;
    if (os_log_type_enabled(*v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v124 = v11;
      _os_log_impl(&dword_1C4CFF000, v69, OS_LOG_TYPE_INFO, "Share metadata for the share at URL %@ doesn't have protection data on it, skipping", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v70, *MEMORY[0x1E4F19DD8], 5001, @"Share metadata for the share at URL %@ doesn't have protection data on it", v11);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (*v23 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v27 = *v24;
  if (os_log_type_enabled(*v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v30 = v27;
    uint64_t v33 = objc_msgSend_privateToken(v10, v31, v32);
    *(_DWORD *)buf = 138412546;
    id v124 = v11;
    __int16 v125 = 2112;
    id v126 = v33;
    _os_log_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_INFO, "Preparing public PCS metadata for share at URL %@ using public sharing token %@", buf, 0x16u);
  }
  v34 = objc_msgSend_pcsManager(v14, v28, v29);
  uint64_t v37 = objc_msgSend_privateToken(v10, v35, v36);
  id v122 = 0;
  uint64_t v39 = (const void *)objc_msgSend_createSharingIdentityFromData_error_(v34, v38, (uint64_t)v37, &v122);
  id v40 = v122;

  if (!v39 || v40)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v71 = *v24;
    if (os_log_type_enabled(*v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v94 = v71;
      uint64_t v97 = objc_msgSend_privateToken(v10, v95, v96);
      *(_DWORD *)buf = 138412546;
      id v124 = v97;
      __int16 v125 = 2112;
      id v126 = v40;
      _os_log_error_impl(&dword_1C4CFF000, v94, OS_LOG_TYPE_ERROR, "Couldn't create a sharing public identity from %@: %@", buf, 0x16u);
    }
    if (!v39) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  v115 = a6;
  id v43 = objc_msgSend_pcsManager(v14, v41, v42);
  uint64_t v46 = objc_msgSend_share(v10, v44, v45);
  uint64_t v49 = objc_msgSend_publicProtectionData(v46, v47, v48);
  id v121 = 0;
  id v50 = v39;
  uint64_t v52 = objc_msgSend_createSharePCSFromData_sharingIdentity_error_(v43, v51, (uint64_t)v49, v39, &v121);
  id v40 = v121;

  CFTypeRef cf = (CFTypeRef)v52;
  if (!v52 || v40)
  {
    uint64_t v72 = (os_log_t *)MEMORY[0x1E4F1A500];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v39 = v50;
    os_log_t v73 = *v72;
    a6 = v115;
    if (os_log_type_enabled(*v72, OS_LOG_TYPE_ERROR))
    {
      v98 = v73;
      v101 = objc_msgSend_share(v10, v99, v100);
      id v104 = objc_msgSend_publicProtectionData(v101, v102, v103);
      *(_DWORD *)buf = 138543618;
      id v124 = v104;
      __int16 v125 = 2112;
      id v126 = (id)v39;
      _os_log_error_impl(&dword_1C4CFF000, v98, OS_LOG_TYPE_ERROR, "Couldn't create a public PCS from the PCS data %{public}@ for identity %@", buf, 0x16u);
    }
    if (cf) {
      goto LABEL_51;
    }
LABEL_36:
    CFRelease(v39);
LABEL_37:
    v74 = 0;
    v75 = 0;
    goto LABEL_38;
  }
  long long v55 = objc_msgSend_pcsManager(v14, v53, v54);
  v57 = v55;
  if (a4 == 2)
  {
    id v120 = 0;
    uint64_t v58 = (const void *)objc_msgSend_copyDiversifiedPublicIdentityForService_withError_(v55, v56, 2, &v120);
    id v40 = v120;

    uint64_t v61 = (os_log_t *)MEMORY[0x1E4F1A500];
    uint64_t v39 = v50;
    if (!v58 || v40)
    {
      a6 = v115;
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      os_log_t v81 = *v61;
      if (os_log_type_enabled(*v61, OS_LOG_TYPE_ERROR))
      {
        uint64_t v107 = v81;
        v108 = sub_1C4DC6110(2);
        *(_DWORD *)buf = 138543874;
        id v124 = v108;
        __int16 v125 = 2112;
        id v126 = v11;
        __int16 v127 = 2112;
        id v128 = v40;
        _os_log_error_impl(&dword_1C4CFF000, v107, OS_LOG_TYPE_ERROR, "Couldn't get a diversified %{public}@ identity to the public PCS for share at URL %@: %@", buf, 0x20u);

        if (v40) {
          goto LABEL_72;
        }
      }
      else if (v40)
      {
LABEL_72:
        v75 = 0;
        v74 = 0;
        goto LABEL_73;
      }
      v82 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v83 = *MEMORY[0x1E4F19DD8];
      v75 = sub_1C4DC6110(2);
      objc_msgSend_errorWithDomain_code_format_(v82, v84, v83, 5000, @"Couldn't get a diversified %@ identity to accept share at %@", v75, v11);
      id v40 = (id)objc_claimAutoreleasedReturnValue();
LABEL_71:

      goto LABEL_72;
    }
    v62 = objc_msgSend_pcsManager(v14, v59, v60);
    objc_msgSend_addPublicIdentity_toSharePCS_permission_(v62, v63, (uint64_t)v58, cf, 0);
    id v40 = (id)objc_claimAutoreleasedReturnValue();

    a6 = v115;
    if (v40)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      os_log_t v66 = *v61;
      if (os_log_type_enabled(*v61, OS_LOG_TYPE_ERROR))
      {
        v67 = v66;
        uint64_t v68 = sub_1C4DC6110(2);
        *(_DWORD *)buf = 138543874;
        id v124 = v68;
        __int16 v125 = 2112;
        id v126 = v11;
        __int16 v127 = 2112;
        id v128 = v40;
        _os_log_error_impl(&dword_1C4CFF000, v67, OS_LOG_TYPE_ERROR, "Couldn't add our %{public}@ identity to the public PCS for share at URL %@: %@", buf, 0x20u);
      }
      goto LABEL_72;
    }
LABEL_58:
    v85 = objc_msgSend_pcsManager(v14, v64, v65);
    id v119 = 0;
    v75 = objc_msgSend_dataFromSharePCS_pcsBlobType_error_(v85, v86, (uint64_t)cf, 0, &v119);
    id v40 = v119;

    if (v75 && !v40)
    {
      uint64_t v89 = objc_msgSend_pcsManager(v14, v87, v88);
      id v118 = 0;
      v74 = objc_msgSend_etagFromSharePCS_error_(v89, v90, (uint64_t)cf, &v118);
      id v40 = v118;

      if (v74 && !v40) {
        goto LABEL_73;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      BOOL v91 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        BOOL v109 = v91;
        uint64_t v116 = objc_msgSend_share(v10, v110, v111);
        uint64_t v114 = objc_msgSend_recordID(v116, v112, v113);
        *(_DWORD *)buf = 138412290;
        id v124 = v114;
        _os_log_error_impl(&dword_1C4CFF000, v109, OS_LOG_TYPE_ERROR, "Couldn't get an etag for public PCS data on share %@", buf, 0xCu);
      }
      goto LABEL_72;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v92 = *v61;
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v124 = v11;
      __int16 v125 = 2112;
      id v126 = v40;
      _os_log_error_impl(&dword_1C4CFF000, v92, OS_LOG_TYPE_ERROR, "Couldn't serialize share public PCS for share at URL %@: %@", buf, 0x16u);
    }
    goto LABEL_71;
  }
  objc_msgSend_addIdentityForService_toPCS_(v55, v56, a4, v52);
  id v40 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v61 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v39 = v50;
  if (!v40)
  {
    uint64_t v58 = 0;
    a6 = v115;
    goto LABEL_58;
  }
  a6 = v115;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v80 = *v61;
  if (os_log_type_enabled(*v61, OS_LOG_TYPE_ERROR))
  {
    v105 = v80;
    uint64_t v106 = sub_1C4DC6110(a4);
    *(_DWORD *)buf = 138543874;
    id v124 = v106;
    __int16 v125 = 2112;
    id v126 = v11;
    __int16 v127 = 2112;
    id v128 = v40;
    _os_log_error_impl(&dword_1C4CFF000, v105, OS_LOG_TYPE_ERROR, "Couldn't add our %{public}@ identity to the public PCS for share at URL %@: %@", buf, 0x20u);
  }
LABEL_51:
  v75 = 0;
  v74 = 0;
  uint64_t v58 = 0;
LABEL_73:
  CFRelease(cf);
  CFRelease(v39);
  if (v58) {
    CFRelease(v58);
  }
  if (v75)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v93 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v124 = v11;
      _os_log_impl(&dword_1C4CFF000, v93, OS_LOG_TYPE_INFO, "Successfully added our public identity to the share's public PCS at %@", buf, 0xCu);
    }
  }
LABEL_38:
  if (a6) {
    *a6 = v40;
  }
  if (v75)
  {
    uint64_t v76 = objc_opt_new();
    objc_msgSend_setPublicPCSData_(v76, v77, (uint64_t)v75);
    objc_msgSend_setPublicPCSEtag_(v76, v78, (uint64_t)v74);
  }
  else
  {
    uint64_t v76 = 0;
  }

  return v76;
}

- (void)_validateInvitedPCSCanBeDecryptedForShare:(id)a3 completionHandler:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v8 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v32 = v8;
    uint64_t v35 = objc_msgSend_callingParticipant(v6, v33, v34);
    *(_DWORD *)buf = 138412290;
    id v40 = v35;
    _os_log_debug_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_DEBUG, "Decrypting the per-participant PCS for calling participant %@", buf, 0xCu);
  }
  uint64_t v10 = objc_msgSend_sharingServiceTypeForShareMetadata_(self, v9, (uint64_t)v6);
  uint64_t v13 = objc_msgSend_container(self, v11, v12);
  uint64_t v16 = objc_msgSend_pcsManager(v13, v14, v15);
  uint64_t v19 = objc_msgSend_share(v6, v17, v18);
  uint64_t v22 = objc_msgSend_invitedProtectionData(v19, v20, v21);
  id v25 = objc_msgSend_callingParticipant(v6, v23, v24);
  uint64_t v28 = objc_msgSend_protectionInfo(v25, v26, v27);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = sub_1C4FF70F8;
  v36[3] = &unk_1E64F86A0;
  id v37 = v6;
  id v38 = v7;
  id v29 = v7;
  id v30 = v6;
  objc_msgSend_canDecryptInvitedProtectionData_participantProtectionInfo_serviceType_completionHandler_(v16, v31, (uint64_t)v22, v28, v10, v36);
}

- (id)_keySwapForOONParticipant:(id)a3
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_privateToken(v5, v6, v7);
  if (v8)
  {
    id v11 = (void *)v8;
    uint64_t v12 = objc_msgSend_callingParticipant(v5, v9, v10);
    uint64_t v15 = objc_msgSend_userIdentity(v12, v13, v14);
    uint64_t v18 = objc_msgSend_outOfNetworkPrivateKey(v15, v16, v17);

    if (v18)
    {
      uint64_t v21 = objc_msgSend_callingParticipant(v5, v19, v20);
      uint64_t v24 = objc_msgSend_container(self, v22, v23);
      uint64_t v27 = objc_msgSend_pcsManager(v24, v25, v26);
      id v120 = 0;
      id v29 = objc_msgSend_copyDiversifiedPublicKeyForService_withError_(v27, v28, 2, &v120);
      id v30 = (char *)v120;

      if (*MEMORY[0x1E4F1A4E0]
        && objc_msgSend_checkAndClearUnitTestOverrides_(self, v31, @"ForceUserKeyRegistrySyncRetryDuringShareAccept"))
      {

        id v29 = 0;
        BOOL v33 = v30 == 0;
      }
      else
      {
        BOOL v33 = v30 == 0;
        if (!v30 && v29)
        {
          SEL v114 = a2;
          uint64_t v116 = (uint64_t)v29;
          uint64_t v117 = v21;
          id v118 = objc_msgSend_container(self, v31, v32);
          id v44 = objc_msgSend_pcsManager(v118, v42, v43);
          uint64_t v47 = objc_msgSend_callingParticipant(v5, v45, v46);
          id v50 = objc_msgSend_userIdentity(v47, v48, v49);
          long long v53 = objc_msgSend_outOfNetworkPrivateKey(v50, v51, v52);
          long long v56 = objc_msgSend_privateToken(v5, v54, v55);
          uint64_t v59 = objc_msgSend_callingParticipant(v5, v57, v58);
          v62 = objc_msgSend_protectionInfo(v59, v60, v61);
          id v119 = 0;
          v64 = objc_msgSend_createProtectionInfoFromOONPrivateKey_privateToken_OONProtectionInfo_error_(v44, v63, (uint64_t)v53, v56, v62, &v119);
          v115 = (char *)v119;

          if (v64)
          {
            v67 = v115;
            uint64_t v21 = v117;
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            id v29 = (void *)v116;
            uint64_t v68 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
            {
              os_log_t v71 = v68;
              objc_msgSend_participantID(v117, v72, v73);
              v74 = (char *)objc_claimAutoreleasedReturnValue();
              uint64_t v77 = objc_msgSend_share(v5, v75, v76);
              os_log_t v80 = objc_msgSend_recordID(v77, v78, v79);
              *(_DWORD *)buf = 138412546;
              id v122 = v74;
              __int16 v123 = 2112;
              id v124 = v80;
              _os_log_impl(&dword_1C4CFF000, v71, OS_LOG_TYPE_INFO, "Create protection info in OON key-swap for participantID: %@, recordID: %@", buf, 0x16u);
            }
            os_log_t v81 = objc_msgSend_callingParticipant(v5, v69, v70);
            objc_msgSend_setProtectionInfo_(v81, v82, (uint64_t)v64);

            v85 = objc_msgSend_callingParticipant(v5, v83, v84);
            uint64_t v88 = objc_msgSend_userIdentity(v85, v86, v87);
            objc_msgSend_setPublicSharingKey_(v88, v89, v116);

            uint64_t v92 = objc_msgSend_callingParticipant(v5, v90, v91);
            v95 = objc_msgSend_userIdentity(v92, v93, v94);
            objc_msgSend_setPublicKeyVersion_(v95, v96, 2);

            uint64_t v41 = 0;
            goto LABEL_28;
          }
          if (!v115)
          {
            uint64_t v112 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v65, v66);
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v112, v113, (uint64_t)v114, self, @"CKDAcceptSharesOperation.m", 673, @"OON key-swap failed, but without error");
          }
          id v29 = (void *)v116;
          uint64_t v21 = v117;
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v101 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v102 = v101;
            objc_msgSend_participantID(v117, v103, v104);
            v105 = (char *)objc_claimAutoreleasedReturnValue();
            v108 = objc_msgSend_share(v5, v106, v107);
            uint64_t v111 = objc_msgSend_recordID(v108, v109, v110);
            *(_DWORD *)buf = 138412802;
            id v122 = v105;
            __int16 v123 = 2112;
            id v124 = v111;
            __int16 v125 = 2112;
            id v126 = v115;
            _os_log_error_impl(&dword_1C4CFF000, v102, OS_LOG_TYPE_ERROR, "Failed to create protection info in OON key-swap for participantID: %@, recordID: %@, error: %@", buf, 0x20u);
          }
          uint64_t v99 = v115;
LABEL_27:
          v67 = v99;
          uint64_t v41 = v99;
LABEL_28:

          goto LABEL_29;
        }
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v97 = *MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v122 = v30;
        _os_log_error_impl(&dword_1C4CFF000, v97, OS_LOG_TYPE_ERROR, "Couldn't create a diversified public key for the owner participant: %@", buf, 0xCu);
        if (!v33) {
          goto LABEL_26;
        }
      }
      else if (!v33)
      {
LABEL_26:
        uint64_t v99 = v30;
        goto LABEL_27;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v98, *MEMORY[0x1E4F19DD8], 5000, @"Couldn't create a diversified public key for the owner participant");
      id v30 = (char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v34 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    uint64_t v36 = v34;
    uint64_t v39 = objc_msgSend_privateToken(v5, v37, v38);
    id v40 = "outOfNetworkPrivateKey";
    if (!v39) {
      id v40 = "privateToken";
    }
    *(_DWORD *)buf = 136315138;
    id v122 = v40;
    _os_log_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_INFO, "OON keyswap: Not swapping OON keys as %s is missing", buf, 0xCu);
  }
  uint64_t v41 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v35, *MEMORY[0x1E4F19DD8], 5000, @"We don't have the necessary keys to perform an OON key swap");
LABEL_29:

  return v41;
}

- (BOOL)_callingParticipantOONForShareMetadata:(id)a3
{
  id v3 = a3;
  id v6 = objc_msgSend_callingParticipant(v3, v4, v5);
  uint64_t v9 = objc_msgSend_userIdentity(v6, v7, v8);
  if (objc_msgSend_hasiCloudAccount(v9, v10, v11))
  {
    LOBYTE(v14) = 0;
  }
  else
  {
    uint64_t v15 = objc_msgSend_callingParticipant(v3, v12, v13);
    int v14 = objc_msgSend_isAnonymousInvitedParticipant(v15, v16, v17) ^ 1;
  }
  return v14;
}

- (void)_prepareShareMetadata
{
  uint64_t v207 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_shareURLsToAccept(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    long long v200 = 0u;
    long long v201 = 0u;
    long long v199 = 0u;
    long long v198 = 0u;
    uint64_t v10 = objc_msgSend_shareMetadatasToAcceptByURL(self, v8, v9);
    objc_msgSend_allKeys(v10, v11, v12);
    id obj = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v185 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v198, v206, 16);
    if (!v185) {
      goto LABEL_72;
    }
    uint64_t v184 = *(void *)v199;
    BOOL v183 = (void *)*MEMORY[0x1E4F19DD8];
    while (1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v199 != v184) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v198 + 1) + 8 * v16);
        uint64_t v18 = objc_msgSend_shareMetadatasToAcceptByURL(self, v14, v15);
        uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v18, v19, v17);

        uint64_t v192 = 0;
        v193 = &v192;
        uint64_t v194 = 0x3032000000;
        v195 = sub_1C4FF3E84;
        v196 = sub_1C4FF3E94;
        id v197 = 0;
        uint64_t v23 = objc_msgSend_participantStatus(v20, v21, v22);
        uint64_t v26 = objc_msgSend_callingParticipant(v20, v24, v25);
        int isAnonymousInvitedParticipant = objc_msgSend_isAnonymousInvitedParticipant(v26, v27, v28);

        if (isAnonymousInvitedParticipant & 1 | (v23 != 2))
        {
          if (v23 == 2) {
            int v32 = isAnonymousInvitedParticipant;
          }
          else {
            int v32 = 0;
          }
          if (v32 != 1) {
            goto LABEL_15;
          }
        }
        else if (objc_msgSend__callingParticipantOONForShareMetadata_(self, v30, (uint64_t)v20))
        {
          goto LABEL_15;
        }
        BOOL v33 = objc_msgSend_acceptedShareURLsToFetch(self, v30, v31);
        char v35 = objc_msgSend_containsObject_(v33, v34, v17);

        if ((v35 & 1) == 0)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v85 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v203 = v17;
            _os_log_impl(&dword_1C4CFF000, v85, OS_LOG_TYPE_INFO, "Share at URL %@ has already been accepted by an in-network user. Fetching the share instead of re-accepting it", buf, 0xCu);
          }
          objc_msgSend_acceptedShareURLsToFetch(self, v86, v87);
          id v50 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v50, v88, v17);
          goto LABEL_69;
        }
LABEL_15:
        uint64_t v36 = objc_msgSend_sharingServiceTypeForShareMetadata_(self, v30, (uint64_t)v20);
        if (objc_msgSend_participantRole(v20, v37, v38) == 4)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v41 = (id)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            id v44 = objc_msgSend_share(v20, v42, v43);
            uint64_t v47 = objc_msgSend_recordID(v44, v45, v46);
            *(_DWORD *)buf = 138412290;
            uint64_t v203 = (uint64_t)v47;
            _os_log_impl(&dword_1C4CFF000, v41, OS_LOG_TYPE_INFO, "Adding ourselves to the public PCS for share %@", buf, 0xCu);
          }
          uint64_t v48 = (id *)(v193 + 5);
          id v191 = (id)v193[5];
          objc_msgSend__addSelfIdentityToShareMetadataPublicPCS_serviceType_forShareWithURL_error_(self, v49, (uint64_t)v20, v36, v17, &v191);
          id v50 = (id)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v48, v191);
          if (*MEMORY[0x1E4F1A4E0]
            && objc_msgSend_checkAndClearUnitTestOverrides_(self, v51, @"ForceUserKeyRegistrySyncRetryDuringShareAccept"))
          {
            uint64_t v53 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v51, (uint64_t)v183, 5000, @"Forcing no public identity error");
            uint64_t v54 = (void *)v193[5];
            v193[5] = v53;
          }
          uint64_t v55 = (void *)v193[5];
          if (v55 || !v50)
          {
            uint64_t v91 = objc_msgSend_domain(v55, v51, v52);
            if (v91 == v183 && objc_msgSend_code((void *)v193[5], v89, v90) == 5000)
            {
              int canSynchronizeUserKeyRegistry = objc_msgSend_canSynchronizeUserKeyRegistry(self, v92, v93);

              if (canSynchronizeUserKeyRegistry)
              {
                uint64_t v97 = objc_msgSend_URLsWaitingKRSByServiceType(self, v95, v96);
                uint64_t v99 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v98, v36);
                v101 = objc_msgSend_objectForKeyedSubscript_(v97, v100, (uint64_t)v99);
                BOOL v102 = v101 == 0;

                if (v102)
                {
                  v105 = objc_opt_new();
                  v108 = objc_msgSend_URLsWaitingKRSByServiceType(self, v106, v107);
                  uint64_t v110 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v109, v36);
                  objc_msgSend_setObject_forKeyedSubscript_(v108, v111, (uint64_t)v105, v110);
                }
                uint64_t v112 = objc_msgSend_URLsWaitingKRSByServiceType(self, v103, v104);
                SEL v114 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v113, v36);
                uint64_t v116 = objc_msgSend_objectForKeyedSubscript_(v112, v115, (uint64_t)v114);
                objc_msgSend_addObject_(v116, v117, v17);

                objc_msgSend_setState_(self, v118, 4);
                goto LABEL_69;
              }
            }
            else
            {
            }
            objc_msgSend__performCallbackForURL_withShare_error_(self, v95, v17, 0, v193[5]);
            uint64_t v66 = objc_msgSend_shareMetadatasToAcceptByURL(self, v119, v120);
            objc_msgSend_removeObjectForKey_(v66, v121, v17);
          }
          else
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            long long v56 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v203 = v17;
              __int16 v204 = 2112;
              id v205 = v50;
              _os_log_impl(&dword_1C4CFF000, v56, OS_LOG_TYPE_INFO, "Updated share public PCS for share at URL %@ is %@", buf, 0x16u);
            }
            uint64_t v59 = objc_msgSend_publicPCSData(v50, v57, v58);
            v62 = objc_msgSend_share(v20, v60, v61);
            objc_msgSend_setPublicProtectionData_(v62, v63, (uint64_t)v59);

            uint64_t v66 = objc_msgSend_publicPCSEtag(v50, v64, v65);
            v69 = objc_msgSend_share(v20, v67, v68);
            objc_msgSend_setPublicProtectionEtag_(v69, v70, (uint64_t)v66);
          }
LABEL_69:

          goto LABEL_70;
        }
        if (objc_msgSend_participantRole(v20, v39, v40) != 3 && objc_msgSend_participantRole(v20, v71, v72) != 2)
        {
          uint64_t v122 = v193[5];
          if (!v122)
          {
            __int16 v123 = objc_msgSend_outOfNetworkMatches(v20, v71, v73);
            BOOL v126 = objc_msgSend_count(v123, v124, v125) == 0;

            uint64_t v129 = (void *)MEMORY[0x1E4F1A280];
            if (v126)
            {
              uint64_t v176 = objc_msgSend_participantRole(v20, v127, v128);
              objc_msgSend_errorWithDomain_code_format_(v129, v177, (uint64_t)v183, 2007, @"Can not accept share at URL %@ because participant type %ld is unsupported", v17, v176);
            }
            else
            {
              objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v127, (uint64_t)v183, 8000, @"Can not accept share at URL %@: vetting of the invited email is needed", v17);
            uint64_t v130 = };
            v178 = (void *)v193[5];
            v193[5] = v130;

            uint64_t v122 = v193[5];
          }
          objc_msgSend__performCallbackForURL_withShare_error_(self, v71, v17, 0, v122);
          objc_msgSend_shareMetadatasToAcceptByURL(self, v179, v180);
          id v50 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectForKey_(v50, v181, v17);
          goto LABEL_69;
        }
        if (objc_msgSend__callingParticipantOONForShareMetadata_(self, v71, (uint64_t)v20))
        {
          uint64_t v76 = objc_msgSend_container(self, v74, v75);
          uint64_t v79 = objc_msgSend_pcsManager(v76, v77, v78);
          if (objc_msgSend_currentServiceIsManatee(v79, v80, v81))
          {

            goto LABEL_53;
          }
          v131 = objc_msgSend_container(self, v82, v83);
          v134 = objc_msgSend_options(v131, v132, v133);
          int v137 = objc_msgSend_useAnonymousToServerShareParticipants(v134, v135, v136);

          if (v137)
          {
LABEL_53:
            uint64_t v138 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v84, (uint64_t)v183, 8014, @"Cannot accept share %@ as an out-of-network participant", v17);
          }
          else
          {
            uint64_t v138 = objc_msgSend__keySwapForOONParticipant_(self, v84, (uint64_t)v20);
          }
          uint64_t v139 = (void *)v193[5];
          v193[5] = v138;
        }
        uint64_t v140 = (void *)v193[5];
        if (!v140)
        {
          v174 = objc_msgSend_stateTransitionGroup(self, v74, v75);
          dispatch_group_enter(v174);

          v186[0] = MEMORY[0x1E4F143A8];
          v186[1] = 3221225472;
          v186[2] = sub_1C4FF84F8;
          v186[3] = &unk_1E64F86C8;
          id v187 = v20;
          uint64_t v188 = v17;
          v189 = self;
          v190 = &v192;
          objc_msgSend__validateInvitedPCSCanBeDecryptedForShare_completionHandler_(self, v175, (uint64_t)v187, v186);
          id v50 = v187;
          goto LABEL_69;
        }
        v143 = objc_msgSend_domain(v140, v74, v75);
        if (v143 != v183 || objc_msgSend_code((void *)v193[5], v141, v142) != 5000)
        {

LABEL_64:
          objc_msgSend__performCallbackForURL_withShare_error_(self, v147, v17, 0, v193[5]);
          objc_msgSend_shareMetadatasToAcceptByURL(self, v171, v172);
          id v50 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectForKey_(v50, v173, v17);
          goto LABEL_69;
        }
        int v146 = objc_msgSend_canSynchronizeUserKeyRegistry(self, v144, v145);

        if (!v146) {
          goto LABEL_64;
        }
        v149 = objc_msgSend_URLsWaitingKRSByServiceType(self, v147, v148);
        uint64_t v151 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v150, v36);
        v153 = objc_msgSend_objectForKeyedSubscript_(v149, v152, (uint64_t)v151);
        BOOL v154 = v153 == 0;

        if (v154)
        {
          uint64_t v157 = objc_opt_new();
          v160 = objc_msgSend_URLsWaitingKRSByServiceType(self, v158, v159);
          uint64_t v162 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v161, v36);
          objc_msgSend_setObject_forKeyedSubscript_(v160, v163, (uint64_t)v157, v162);
        }
        v164 = objc_msgSend_URLsWaitingKRSByServiceType(self, v155, v156);
        v166 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v165, v36);
        BOOL v168 = objc_msgSend_objectForKeyedSubscript_(v164, v167, (uint64_t)v166);
        objc_msgSend_addObject_(v168, v169, v17);

        objc_msgSend_setState_(self, v170, 4);
LABEL_70:
        _Block_object_dispose(&v192, 8);

        ++v16;
      }
      while (v185 != v16);
      uint64_t v185 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v198, v206, 16);
      if (!v185)
      {
LABEL_72:

        return;
      }
    }
  }
}

- (void)_synchronizeUserKeyRegistryIfNeeded
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_canSynchronizeUserKeyRegistry(self, a2, v2))
  {
    uint64_t v6 = objc_msgSend_URLsWaitingKRSByServiceType(self, v4, v5);
    uint64_t v9 = objc_msgSend_allKeys(v6, v7, v8);
    uint64_t v12 = objc_msgSend_count(v9, v10, v11);

    if (v12)
    {
      objc_msgSend_setCanSynchronizeUserKeyRegistry_(self, v13, 0);
      uint64_t v16 = objc_msgSend_topmostParentOperation(self, v14, v15);
      uint64_t v47 = objc_msgSend_operationID(v16, v17, v18);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v19 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v59 = v47;
        _os_log_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_INFO, "Will attempt user key sync for operation %{public}@.", buf, 0xCu);
      }
      uint64_t v22 = objc_msgSend_URLsWaitingKRSByServiceType(self, v20, v21);
      uint64_t v25 = objc_msgSend_allKeys(v22, v23, v24);

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id obj = v25;
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v53, v57, 16);
      if (v29)
      {
        uint64_t v46 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v54 != v46) {
              objc_enumerationMutation(obj);
            }
            uint64_t v31 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            int v32 = objc_msgSend_intValue(v31, v27, v28);
            objc_initWeak((id *)buf, self);
            objc_msgSend_noteOperationWillWaitOnPCS(self, v33, v34);
            id v37 = objc_msgSend_stateTransitionGroup(self, v35, v36);
            dispatch_group_enter(v37);

            uint64_t v40 = objc_msgSend_container(self, v38, v39);
            uint64_t v43 = objc_msgSend_pcsManager(v40, v41, v42);
            v48[0] = MEMORY[0x1E4F143A8];
            v48[1] = 3221225472;
            v48[2] = sub_1C4FF8AD8;
            v48[3] = &unk_1E64F86F0;
            objc_copyWeak(&v52, (id *)buf);
            id v49 = v47;
            id v50 = self;
            id v51 = v31;
            objc_msgSend_synchronizeUserKeyRegistryForServiceType_shouldThrottle_context_requestorOperationID_completionHandler_(v43, v44, v32, 1, 0x1F2058790, v49, v48);

            objc_destroyWeak(&v52);
            objc_destroyWeak((id *)buf);
          }
          uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v53, v57, 16);
        }
        while (v29);
      }
    }
  }
}

- (void)_fetchMetadataForShares
{
  uint64_t v176 = *MEMORY[0x1E4F143B8];
  uint64_t v145 = objc_opt_new();
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  id obj = objc_msgSend_shareURLsToAccept(self, v3, v4);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v163, v175, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v164;
    uint64_t v11 = *MEMORY[0x1E4F19DD8];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v164 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v163 + 1) + 8 * v12);
        int v14 = objc_msgSend_clientProvidedMetadatasByURL(self, v7, v8);
        uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v14, v15, v13);

        uint64_t v19 = objc_msgSend_container(self, v17, v18);
        uint64_t v22 = objc_msgSend_pcsManager(v19, v20, v21);
        if (objc_msgSend_currentServiceIsManatee(v22, v23, v24))
        {
          uint64_t v27 = objc_msgSend_invitationToken(v16, v25, v26);

          if (!v27)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            id v30 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v169 = v13;
              _os_log_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_INFO, "Failing to accept manatee share with URL %@ since we were not given a sharing invitation blob by the client", buf, 0xCu);
            }
            int v32 = objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E4F1A280], v31, v11, 2006, 0, @"Error accepting share at URL %@: No manatee sharing invitation blob provided", v13);
            char v35 = objc_msgSend_callbackQueue(self, v33, v34);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = sub_1C4FF9770;
            block[3] = &unk_1E64F0120;
            block[4] = self;
            void block[5] = v13;
            uint64_t v162 = v32;
            id v36 = v32;
            dispatch_async(v35, block);

            id v37 = v162;
            goto LABEL_22;
          }
        }
        else
        {
        }
        if (objc_msgSend_participantRole(v16, v28, v29) != 1 && objc_msgSend_participantRole(v16, v38, v39))
        {
          objc_msgSend_addObject_(v145, v40, v13);
          goto LABEL_23;
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v41 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          id v44 = v41;
          objc_msgSend_participantRole(v16, v45, v46);
          uint64_t v47 = CKStringFromParticipantRole();
          *(_DWORD *)buf = 138412546;
          uint64_t v169 = v13;
          __int16 v170 = 2114;
          uint64_t v171 = (uint64_t)v47;
          _os_log_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_INFO, "Failing to accept share with URL %@ since we are ineligible to accept as role %{public}@", buf, 0x16u);
        }
        uint64_t v48 = (void *)MEMORY[0x1E4F1A280];
        objc_msgSend_participantRole(v16, v42, v43);
        id v49 = CKStringFromParticipantRole();
        id v51 = objc_msgSend_errorWithDomain_code_userInfo_format_(v48, v50, v11, 2006, 0, @"Error accepting share at URL %@: %@ participant tried to accept share", v13, v49);

        long long v54 = objc_msgSend_callbackQueue(self, v52, v53);
        v159[0] = MEMORY[0x1E4F143A8];
        v159[1] = 3221225472;
        v159[2] = sub_1C4FF97F8;
        v159[3] = &unk_1E64F0120;
        v159[4] = self;
        v159[5] = v13;
        v160 = v51;
        id v36 = v51;
        dispatch_async(v54, v159);

        id v37 = v160;
LABEL_22:

LABEL_23:
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v163, v175, 16);
    }
    while (v9);
  }

  objc_msgSend_setShareURLsToAccept_(self, v55, (uint64_t)v145);
  uint64_t v58 = objc_msgSend_shareURLsToAccept(self, v56, v57);
  uint64_t v61 = objc_msgSend_count(v58, v59, v60);

  if (v61)
  {
    if (objc_msgSend_numShareAcceptAttempts(self, v62, v63)
      && (unint64_t)objc_msgSend_numShareAcceptAttempts(self, v64, v65) >= 5)
    {
      long long v157 = 0u;
      long long v158 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      objc_msgSend_shareURLsToAccept(self, v64, v65);
      id v147 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v147, v66, (uint64_t)&v155, v174, 16);
      if (v67)
      {
        uint64_t v68 = v67;
        uint64_t v69 = *(void *)v156;
        uint64_t v70 = *MEMORY[0x1E4F19DD8];
        do
        {
          uint64_t v71 = 0;
          do
          {
            if (*(void *)v156 != v69) {
              objc_enumerationMutation(v147);
            }
            uint64_t v72 = *(void *)(*((void *)&v155 + 1) + 8 * v71);
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v73 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
            {
              uint64_t v75 = v73;
              uint64_t v78 = objc_msgSend_numShareAcceptAttempts(self, v76, v77);
              *(_DWORD *)buf = 138412546;
              uint64_t v169 = v72;
              __int16 v170 = 2048;
              uint64_t v171 = v78;
              _os_log_impl(&dword_1C4CFF000, v75, OS_LOG_TYPE_INFO, "Failed to accept share with URL %@ %lu times with a PCS oplock error", buf, 0x16u);
            }
            uint64_t v79 = objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E4F1A280], v74, v70, 2037, 0, @"Error accepting share at URL %@: Protection data didn't match", v72);
            v82 = objc_msgSend_callbackQueue(self, v80, v81);
            v153[0] = MEMORY[0x1E4F143A8];
            v153[1] = 3221225472;
            v153[2] = sub_1C4FF9880;
            v153[3] = &unk_1E64F0120;
            v153[4] = self;
            v153[5] = v72;
            id v154 = v79;
            id v83 = v79;
            dispatch_async(v82, v153);

            ++v71;
          }
          while (v68 != v71);
          uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v147, v84, (uint64_t)&v155, v174, 16);
        }
        while (v68);
      }

      objc_msgSend_shareURLsToAccept(self, v85, v86);
      id v87 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeAllObjects(v87, v88, v89);
    }
    else
    {
      uint64_t v90 = objc_msgSend_shareMetadatasToAcceptByURL(self, v64, v65);
      objc_msgSend_removeAllObjects(v90, v91, v92);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v93 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        uint64_t v96 = v93;
        uint64_t v99 = objc_msgSend_shareURLsToAccept(self, v97, v98);
        uint64_t v102 = objc_msgSend_count(v99, v100, v101);
        v105 = objc_msgSend_shareURLsToAccept(self, v103, v104);
        if ((unint64_t)objc_msgSend_count(v105, v106, v107) <= 1) {
          uint64_t v110 = &stru_1F2044F30;
        }
        else {
          uint64_t v110 = @"s";
        }
        uint64_t v111 = objc_msgSend_shareURLsToAccept(self, v108, v109);
        *(_DWORD *)buf = 134218498;
        uint64_t v169 = v102;
        __int16 v170 = 2114;
        uint64_t v171 = (uint64_t)v110;
        __int16 v172 = 2112;
        uint64_t v173 = v111;
        _os_log_impl(&dword_1C4CFF000, v96, OS_LOG_TYPE_INFO, "Fetching share metadata for %ld URL%{public}@: %@", buf, 0x20u);
      }
      uint64_t v112 = objc_msgSend_container(self, v94, v95);
      v115 = objc_msgSend_pcsManager(v112, v113, v114);
      int IsManatee = objc_msgSend_currentServiceIsManatee(v115, v116, v117);

      if (IsManatee)
      {
        id v87 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v149 = 0u;
        long long v150 = 0u;
        long long v151 = 0u;
        long long v152 = 0u;
        id v121 = objc_msgSend_shareURLsToAccept(self, v119, v120);
        uint64_t v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v122, (uint64_t)&v149, v167, 16);
        if (v123)
        {
          uint64_t v126 = v123;
          uint64_t v127 = *(void *)v150;
          do
          {
            for (uint64_t i = 0; i != v126; ++i)
            {
              if (*(void *)v150 != v127) {
                objc_enumerationMutation(v121);
              }
              uint64_t v129 = *(void *)(*((void *)&v149 + 1) + 8 * i);
              uint64_t v130 = objc_msgSend_clientProvidedMetadatasByURL(self, v124, v125);
              uint64_t v132 = objc_msgSend_objectForKeyedSubscript_(v130, v131, v129);

              id v135 = objc_msgSend_invitationToken(v132, v133, v134);
              objc_msgSend_setObject_forKeyedSubscript_(v87, v136, (uint64_t)v135, v129);
            }
            uint64_t v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v124, (uint64_t)&v149, v167, 16);
          }
          while (v126);
        }
      }
      else
      {
        id v87 = 0;
      }
      int v137 = objc_opt_new();
      uint64_t v140 = objc_msgSend_shareURLsToAccept(self, v138, v139);
      objc_msgSend_setShareURLsToFetch_(v137, v141, (uint64_t)v140);

      objc_msgSend_setShareInvitationTokensByShareURL_(v137, v142, (uint64_t)v87);
      uint64_t v143 = objc_opt_class();
      v148[0] = MEMORY[0x1E4F143A8];
      v148[1] = 3221225472;
      v148[2] = sub_1C4FF9908;
      v148[3] = &unk_1E64F0210;
      v148[4] = self;
      objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v144, v143, v137, v148);
    }
  }
}

- (void)_processAnonymousShares
{
  uint64_t v4 = objc_msgSend_anonymousShareTuplesAccepted(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    objc_initWeak(&location, self);
    uint64_t v10 = objc_msgSend_stateTransitionGroup(self, v8, v9);
    dispatch_group_enter(v10);

    uint64_t v13 = objc_msgSend_container(self, v11, v12);
    uint64_t v16 = objc_msgSend_anonymousSharingManager(v13, v14, v15);
    uint64_t v19 = objc_msgSend_anonymousShareTuplesAccepted(self, v17, v18);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1C4FF9E60;
    v21[3] = &unk_1E64F22C0;
    objc_copyWeak(&v22, &location);
    objc_msgSend_addAnonymousSharesToSharedDB_operation_withCompletionBlock_(v16, v20, (uint64_t)v19, self, v21);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (void)main
{
  uint64_t v4 = objc_msgSend_shareURLsToAccept(self, a2, v2);
  BOOL v7 = objc_msgSend_count(v4, v5, v6) == 0;

  objc_msgSend_makeStateTransition_(self, v8, v7);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setAcceptCompletionBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDAcceptSharesOperation;
  [(CKDOperation *)&v6 _finishOnCallbackQueueWithError:v4];
}

- (id)acceptCompletionBlock
{
  return self->_acceptCompletionBlock;
}

- (void)setAcceptCompletionBlock:(id)a3
{
}

- (NSMutableDictionary)clientProvidedMetadatasByURL
{
  return self->_clientProvidedMetadatasByURL;
}

- (void)setClientProvidedMetadatasByURL:(id)a3
{
}

- (NSMutableArray)shareURLsToAccept
{
  return self->_shareURLsToAccept;
}

- (void)setShareURLsToAccept:(id)a3
{
}

- (NSMutableArray)acceptedShareURLsToFetch
{
  return self->_acceptedShareURLsToFetch;
}

- (void)setAcceptedShareURLsToFetch:(id)a3
{
}

- (NSMutableDictionary)shareMetadatasToAcceptByURL
{
  return self->_shareMetadatasToAcceptByURL;
}

- (void)setShareMetadatasToAcceptByURL:(id)a3
{
}

- (unint64_t)numShareAcceptAttempts
{
  return self->_numShareAcceptAttempts;
}

- (void)setNumShareAcceptAttempts:(unint64_t)a3
{
  self->_numShareAcceptAttempts = a3;
}

- (BOOL)canSynchronizeUserKeyRegistry
{
  return self->_canSynchronizeUserKeyRegistry;
}

- (void)setCanSynchronizeUserKeyRegistry:(BOOL)a3
{
  self->_int canSynchronizeUserKeyRegistry = a3;
}

- (NSMutableDictionary)URLsWaitingKRSByServiceType
{
  return self->_URLsWaitingKRSByServiceType;
}

- (void)setURLsWaitingKRSByServiceType:(id)a3
{
}

- (NSMutableDictionary)anonymousShareTuplesAcceptAttempted
{
  return self->_anonymousShareTuplesAcceptAttempted;
}

- (void)setAnonymousShareTuplesAcceptAttempted:(id)a3
{
}

- (NSMutableArray)anonymousShareTuplesAccepted
{
  return self->_anonymousShareTuplesAccepted;
}

- (void)setAnonymousShareTuplesAccepted:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymousShareTuplesAccepted, 0);
  objc_storeStrong((id *)&self->_anonymousShareTuplesAcceptAttempted, 0);
  objc_storeStrong((id *)&self->_URLsWaitingKRSByServiceType, 0);
  objc_storeStrong((id *)&self->_shareMetadatasToAcceptByURL, 0);
  objc_storeStrong((id *)&self->_acceptedShareURLsToFetch, 0);
  objc_storeStrong((id *)&self->_shareURLsToAccept, 0);
  objc_storeStrong((id *)&self->_clientProvidedMetadatasByURL, 0);
  objc_storeStrong(&self->_acceptCompletionBlock, 0);
}

@end