@interface CKAcceptSharesOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKAcceptSharesOperation)init;
- (CKAcceptSharesOperation)initWithShareMetadatas:(NSArray *)shareMetadatas;
- (NSArray)shareMetadatas;
- (NSMutableDictionary)errorsByShareURL;
- (NSMutableDictionary)shareMetadatasByShareURL;
- (id)acceptSharesCompletionBlock_wrapper;
- (id)activityCreate;
- (id)perShareCompletionBlock_wrapper;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)acceptSharesCompletionBlock;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleShareAcceptanceForURL:(id)a3 share:(id)a4 error:(id)a5;
- (void)perShareCompletionBlock;
- (void)setAcceptSharesCompletionBlock:(void *)acceptSharesCompletionBlock;
- (void)setAcceptSharesCompletionBlockIVar:(id)a3;
- (void)setAcceptSharesCompletionBlock_wrapper:(id)a3;
- (void)setErrorsByShareURL:(id)a3;
- (void)setPerShareCompletionBlock:(void *)perShareCompletionBlock;
- (void)setPerShareCompletionBlock_wrapper:(id)a3;
- (void)setShareMetadatas:(NSArray *)shareMetadatas;
- (void)setShareMetadatasByShareURL:(id)a3;
@end

@implementation CKAcceptSharesOperation

- (CKAcceptSharesOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKAcceptSharesOperation;
  v2 = [(CKOperation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    errorsByShareURL = v2->_errorsByShareURL;
    v2->_errorsByShareURL = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (CKAcceptSharesOperation)initWithShareMetadatas:(NSArray *)shareMetadatas
{
  v4 = shareMetadatas;
  v8 = (CKAcceptSharesOperation *)objc_msgSend_init(self, v5, v6, v7);
  v11 = v8;
  if (v8) {
    objc_msgSend_setShareMetadatas_(v8, v9, (uint64_t)v4, v10);
  }

  return v11;
}

- (void)setPerShareCompletionBlock:(void *)perShareCompletionBlock
{
  id v7 = perShareCompletionBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B113098;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_perShareCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_perShareCompletionBlock;
    self->_perShareCompletionBlock = v11;
LABEL_9:
  }
}

- (void)perShareCompletionBlock
{
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF13FE0;
    v16 = sub_18AF13960;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B113290;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_perShareCompletionBlock);
  }

  return v8;
}

- (void)setAcceptSharesCompletionBlockIVar:(id)a3
{
  id v7 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B11341C;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id acceptSharesCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_acceptSharesCompletionBlock != v7)
  {
    v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id acceptSharesCompletionBlock = self->_acceptSharesCompletionBlock;
    self->_id acceptSharesCompletionBlock = v11;
LABEL_9:
  }
}

- (void)acceptSharesCompletionBlock
{
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF13FE0;
    v16 = sub_18AF13960;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B113614;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_acceptSharesCompletionBlock);
  }

  return v8;
}

- (void)setAcceptSharesCompletionBlock:(void *)acceptSharesCompletionBlock
{
  BOOL v4 = acceptSharesCompletionBlock == 0;
  id v9 = acceptSharesCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setAcceptSharesCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);
}

- (void)setShareMetadatas:(NSArray *)shareMetadatas
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v4 = shareMetadatas;
  uint64_t v8 = (NSArray *)objc_msgSend_copy(v4, v5, v6, v7);
  id v9 = self->_shareMetadatas;
  self->_shareMetadatas = v8;

  uint64_t v10 = (NSMutableDictionary *)objc_opt_new();
  shareMetadatasByShareURL = self->_shareMetadatasByShareURL;
  self->_shareMetadatasByShareURL = v10;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = v4;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v14)
  {
    uint64_t v18 = v14;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v12);
        }
        v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v23 = objc_msgSend_invitationURL(v21, v15, v16, v17, (void)v24);
        if (v23) {
          objc_msgSend_setObject_forKeyedSubscript_(self->_shareMetadatasByShareURL, v22, (uint64_t)v21, (uint64_t)v23);
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v18);
  }
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_shareMetadatas(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
  objc_msgSend_setShareMetadatasToAccept_(v4, v13, (uint64_t)v12, v14);

  v15.receiver = self;
  v15.super_class = (Class)CKAcceptSharesOperation;
  [(CKOperation *)&v15 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKAcceptSharesOperation;
  id v4 = a3;
  [(CKOperation *)&v15 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_shareMetadatasToAccept(v4, v5, v6, v7, v15.receiver, v15.super_class);

  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
  objc_msgSend_setShareMetadatas_(self, v13, (uint64_t)v12, v14);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v13.receiver = self;
  v13.super_class = (Class)CKAcceptSharesOperation;
  if ([(CKOperation *)&v13 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_perShareCompletionBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v11 = objc_msgSend_acceptSharesCompletionBlock(self, v7, v8, v9);
    BOOL v6 = v11 != 0;
  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  BOOL v6 = objc_msgSend_shareMetadatas(self, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v30, (uint64_t)v34, 16);
  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v31;
  while (2)
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v31 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a3)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v13, @"CKErrorDomain", 12, @"Unexpected shareMetadata in shares to accept: %@", v12);
LABEL_16:
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_17:

        return 0;
      }
      uint64_t v16 = objc_msgSend_invitationURL(v12, v13, v14, v15);

      if (!v16)
      {
        if (a3)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v17, @"CKErrorDomain", 12, @"shareMetadata lacks share URL: %@", v12);
          goto LABEL_16;
        }
        goto LABEL_17;
      }
      ++v11;
    }
    while (v9 != v11);
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v17, (uint64_t)&v30, (uint64_t)v34, 16);
    if (v9) {
      continue;
    }
    break;
  }
LABEL_10:

  v21 = objc_msgSend_shareMetadatas(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_count(v21, v22, v23, v24);

  if (v25)
  {
    v29.receiver = self;
    v29.super_class = (Class)CKAcceptSharesOperation;
    return [(CKOperation *)&v29 CKOperationShouldRun:a3];
  }
  else if (a3)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, @"CKErrorDomain", 12, @"You must specify some share metadatas to accept");
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a3 = v28;
  }
  else
  {
    return 0;
  }
  return result;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performAcceptSharesOperation_withBlock_;
}

- (void)handleShareAcceptanceForURL:(id)a3 share:(id)a4 error:(id)a5
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v14 = objc_msgSend_CKClientSuitableError(a5, v11, v12, v13);
  if (self) {
    signpost = self->super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v16 = signpost;

  if (v14)
  {
    if (!v16) {
      goto LABEL_22;
    }
    if (self) {
      uint64_t v20 = self->super._signpost;
    }
    else {
      uint64_t v20 = 0;
    }
    v21 = v20;
    uint64_t v25 = objc_msgSend_log(v21, v22, v23, v24);

    if (self) {
      long long v26 = self->super._signpost;
    }
    else {
      long long v26 = 0;
    }
    long long v27 = v26;
    uint64_t v31 = objc_msgSend_identifier(v27, v28, v29, v30);

    if ((unint64_t)(v31 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v25)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 138412546;
    id v152 = v9;
    __int16 v153 = 2112;
    v154 = v14;
    long long v32 = "Share %@ accepted with error: %@";
    long long v33 = v25;
    os_signpost_id_t v34 = v31;
    uint32_t v35 = 22;
    goto LABEL_20;
  }
  if (!v16) {
    goto LABEL_22;
  }
  if (self) {
    v36 = self->super._signpost;
  }
  else {
    v36 = 0;
  }
  v37 = v36;
  uint64_t v25 = objc_msgSend_log(v37, v38, v39, v40);

  if (self) {
    v41 = self->super._signpost;
  }
  else {
    v41 = 0;
  }
  v42 = v41;
  uint64_t v46 = objc_msgSend_identifier(v42, v43, v44, v45);

  if ((unint64_t)(v46 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_DWORD *)buf = 138412290;
    id v152 = v9;
    long long v32 = "Share %@ accepted";
    long long v33 = v25;
    os_signpost_id_t v34 = v46;
    uint32_t v35 = 12;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18AF10000, v33, OS_SIGNPOST_EVENT, v34, "CKAcceptSharesOperation", v32, buf, v35);
  }
LABEL_21:

LABEL_22:
  v47 = objc_msgSend_shareMetadatasByShareURL(self, v17, v18, v19);
  v50 = objc_msgSend_objectForKeyedSubscript_(v47, v48, (uint64_t)v9, v49);

  if (v50)
  {
    if (v14)
    {
      if (objc_msgSend_canDropItemResultsEarly(self, v51, v52, v53))
      {
LABEL_37:
        v116 = objc_msgSend_perShareCompletionBlock_wrapper(self, v54, v55, v56);
        v120 = v116;
        if (v116)
        {
          v64 = (void (**)(id, void *, id, void *))_Block_copy(v116);
        }
        else
        {
          v121 = objc_msgSend_perShareCompletionBlock(self, v117, v118, v119);
          v64 = (void (**)(id, void *, id, void *))_Block_copy(v121);
        }
        if (v64)
        {
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v125 = (void *)ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
          {
            v136 = v125;
            v140 = objc_msgSend_operationID(self, v137, v138, v139);
            v144 = objc_msgSend_recordID(v10, v141, v142, v143);
            *(_DWORD *)buf = 138543874;
            id v152 = v140;
            __int16 v153 = 2112;
            v154 = v144;
            __int16 v155 = 2112;
            v156 = v14;
            _os_log_debug_impl(&dword_18AF10000, v136, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about accepted share with ID %@: %@", buf, 0x20u);
          }
          v64[2](v64, v50, v10, v14);
        }
        if (v10)
        {
          v126 = objc_msgSend_configuration(self, v122, v123, v124);
          v130 = objc_msgSend_container(v126, v127, v128, v129);
          v134 = objc_msgSend_recordID(v10, v131, v132, v133);
          objc_msgSend_handleRecordChanged_changeType_record_error_(v130, v135, (uint64_t)v134, 2, v10, v14);
        }
        goto LABEL_48;
      }
      v57 = objc_msgSend_errorsByShareURL(self, v54, v55, v56);
      v61 = objc_msgSend_invitationURL(v50, v58, v59, v60);
      objc_msgSend_setObject_forKeyedSubscript_(v57, v62, (uint64_t)v14, (uint64_t)v61);
    }
    else
    {
      if (v10)
      {
        v73 = objc_msgSend_resolvedConfiguration(self, v51, v52, v53);
        v77 = objc_msgSend_container(v73, v74, v75, v76);
        v81 = objc_msgSend_options(v77, v78, v79, v80);
        int v85 = objc_msgSend_useAnonymousToServerShareParticipants(v81, v82, v83, v84);

        if (v85)
        {
          v86 = objc_msgSend_recordID(v10, v51, v52, v53);
          v90 = objc_msgSend_zoneID(v86, v87, v88, v89);
          v94 = objc_msgSend_anonymousCKUserID(v90, v91, v92, v93);

          if (!objc_msgSend_length(v94, v95, v96, v97))
          {
            v145 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v98, v99, v100);
            v149 = objc_msgSend_recordID(v10, v146, v147, v148);
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v145, v150, (uint64_t)a2, (uint64_t)self, @"CKAcceptSharesOperation.m", 135, @"Should have generated an anonymous userID for share %@", v149);
          }
          v101 = objc_msgSend_share(v50, v98, v99, v100);
          v105 = objc_msgSend_recordID(v101, v102, v103, v104);
          v108 = objc_msgSend_copyWithAnonymousCKUserID_(v105, v106, (uint64_t)v94, v107);

          v112 = objc_msgSend_share(v50, v109, v110, v111);
          objc_msgSend_replaceRecordIDWith_(v112, v113, (uint64_t)v108, v114);
        }
      }
      v57 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v51, v52, v53);
      objc_msgSend_postNotificationName_object_userInfo_(v57, v115, @"CKAcceptSharesOperationDidAcceptShareNotification", (uint64_t)self, 0);
    }

    goto LABEL_37;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v63 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    v64 = v63;
    v68 = objc_msgSend_shareMetadatasByShareURL(self, v65, v66, v67);
    v72 = objc_msgSend_allKeys(v68, v69, v70, v71);
    *(_DWORD *)buf = 138412546;
    id v152 = v9;
    __int16 v153 = 2112;
    v154 = v72;
    _os_log_error_impl(&dword_18AF10000, (os_log_t)v64, OS_LOG_TYPE_ERROR, "Received callback for URL I don't know about: %@ %@", buf, 0x16u);

LABEL_48:
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  if (self) {
    signpost = self->super._signpost;
  }
  else {
    signpost = 0;
  }
  BOOL v6 = signpost;

  if (v6)
  {
    if (self) {
      id v10 = self->super._signpost;
    }
    else {
      id v10 = 0;
    }
    uint64_t v11 = v10;
    uint64_t v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      uint64_t v16 = self->super._signpost;
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKAcceptSharesOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    v22 = objc_msgSend_errorsByShareURL(self, v7, v8, v9);
    uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      long long v27 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
      uint64_t v31 = objc_msgSend_errorsByShareURL(self, v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, @"CKPartialErrors");

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, @"CKInternalErrorDomain", 1011, v27, @"Failed to accept some shares");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  os_signpost_id_t v34 = objc_msgSend_acceptSharesCompletionBlock_wrapper(self, v7, v8, v9);
  v38 = v34;
  if (v34)
  {
    uint64_t v39 = (void (**)(void *, void *))_Block_copy(v34);
  }
  else
  {
    uint64_t v40 = objc_msgSend_acceptSharesCompletionBlock(self, v35, v36, v37);
    uint64_t v39 = (void (**)(void *, void *))_Block_copy(v40);
  }
  if (v39)
  {
    uint64_t v44 = objc_msgSend_CKClientSuitableError(v4, v41, v42, v43);
    v39[2](v39, v44);

    objc_msgSend_setAcceptSharesCompletionBlock_(self, v45, 0, v46);
  }
  objc_msgSend_setPerShareCompletionBlock_(self, v41, 0, v43);
  v47.receiver = self;
  v47.super_class = (Class)CKAcceptSharesOperation;
  [(CKOperation *)&v47 _finishOnCallbackQueueWithError:v4];
}

- (void)ckSignpostBegin
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (self) {
    signpost = self->super._signpost;
  }
  else {
    signpost = 0;
  }
  id v4 = signpost;

  if (v4)
  {
    if (self) {
      uint64_t v5 = self->super._signpost;
    }
    else {
      uint64_t v5 = 0;
    }
    BOOL v6 = v5;
    id v10 = objc_msgSend_log(v6, v7, v8, v9);

    if (self) {
      uint64_t v11 = self->super._signpost;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = v11;
    os_signpost_id_t v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      uint64_t v20 = objc_msgSend_operationID(self, v17, v18, v19);
      uint64_t v24 = objc_msgSend_containerID(self, v21, v22, v23);
      id v28 = objc_msgSend_group(self, v25, v26, v27);
      long long v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      uint64_t v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      uint64_t v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      uint64_t v55 = v20;
      __int16 v56 = 2112;
      v57 = v24;
      __int16 v58 = 2112;
      uint64_t v59 = v32;
      __int16 v60 = 2114;
      v61 = v36;
      __int16 v62 = 2114;
      v63 = v45;
      __int16 v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKAcceptSharesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
    }
  }
}

- (void)ckSignpostEndWithError:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    signpost = self->super._signpost;
  }
  else {
    signpost = 0;
  }
  BOOL v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v7 = self->super._signpost;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = v7;
    uint64_t v12 = objc_msgSend_log(v8, v9, v10, v11);

    if (self) {
      uint64_t v13 = self->super._signpost;
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = v13;
    os_signpost_id_t v18 = objc_msgSend_identifier(v14, v15, v16, v17);

    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      int v19 = 138412290;
      id v20 = v4;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKAcceptSharesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/accept-shares", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleShareAcceptanceForURL_share_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKAcceptSharesOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSArray)shareMetadatas
{
  return self->_shareMetadatas;
}

- (NSMutableDictionary)errorsByShareURL
{
  return self->_errorsByShareURL;
}

- (void)setErrorsByShareURL:(id)a3
{
}

- (NSMutableDictionary)shareMetadatasByShareURL
{
  return self->_shareMetadatasByShareURL;
}

- (void)setShareMetadatasByShareURL:(id)a3
{
}

- (id)perShareCompletionBlock_wrapper
{
  return self->_perShareCompletionBlock_wrapper;
}

- (void)setPerShareCompletionBlock_wrapper:(id)a3
{
}

- (id)acceptSharesCompletionBlock_wrapper
{
  return self->_acceptSharesCompletionBlock_wrapper;
}

- (void)setAcceptSharesCompletionBlock_wrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_acceptSharesCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perShareCompletionBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_shareMetadatasByShareURL, 0);
  objc_storeStrong((id *)&self->_errorsByShareURL, 0);
  objc_storeStrong((id *)&self->_shareMetadatas, 0);
  objc_storeStrong(&self->_acceptSharesCompletionBlock, 0);

  objc_storeStrong(&self->_perShareCompletionBlock, 0);
}

@end