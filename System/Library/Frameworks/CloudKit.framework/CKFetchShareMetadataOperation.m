@interface CKFetchShareMetadataOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)claimPackagesInRecord:(id)a3 error:(id *)a4;
- (BOOL)hasCKOperationCallbacksSet;
- (BOOL)overwriteContainerPCSServiceIfManatee;
- (BOOL)shouldFetchRootRecord;
- (BOOL)skipShareDecryption;
- (CKFetchShareMetadataOperation)init;
- (CKFetchShareMetadataOperation)initWithShareURLs:(NSArray *)shareURLs;
- (CKFetchShareMetadataOperation)initWithShareURLs:(id)a3 invitationTokensByShareURL:(id)a4;
- (NSArray)rootRecordDesiredKeys;
- (NSArray)shareURLs;
- (NSDictionary)shareInvitationTokensByShareURL;
- (NSMutableDictionary)errorsByURL;
- (NSMutableSet)packagesToDestroy;
- (id)activityCreate;
- (id)fetchShareMetadataCompletionBlock_wrapper;
- (id)perShareMetadataBlock_wrapper;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fetchShareMetadataCompletionBlock;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleShareMetadataFetchForURL:(id)a3 shareMetadata:(id)a4 error:(id)a5;
- (void)perShareMetadataBlock;
- (void)setErrorsByURL:(id)a3;
- (void)setFetchShareMetadataCompletionBlock:(void *)fetchShareMetadataCompletionBlock;
- (void)setFetchShareMetadataCompletionBlockIVar:(id)a3;
- (void)setFetchShareMetadataCompletionBlock_wrapper:(id)a3;
- (void)setOverwriteContainerPCSServiceIfManatee:(BOOL)a3;
- (void)setPackagesToDestroy:(id)a3;
- (void)setPerShareMetadataBlock:(void *)perShareMetadataBlock;
- (void)setPerShareMetadataBlock_wrapper:(id)a3;
- (void)setRootRecordDesiredKeys:(NSArray *)rootRecordDesiredKeys;
- (void)setShareInvitationTokensByShareURL:(id)a3;
- (void)setShareURLs:(NSArray *)shareURLs;
- (void)setShouldFetchRootRecord:(BOOL)shouldFetchRootRecord;
- (void)setSkipShareDecryption:(BOOL)a3;
@end

@implementation CKFetchShareMetadataOperation

- (CKFetchShareMetadataOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKFetchShareMetadataOperation;
  v2 = [(CKOperation *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    errorsByURL = v2->_errorsByURL;
    v2->_errorsByURL = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    packagesToDestroy = v2->_packagesToDestroy;
    v2->_packagesToDestroy = (NSMutableSet *)v5;
  }
  return v2;
}

- (CKFetchShareMetadataOperation)initWithShareURLs:(NSArray *)shareURLs
{
  v4 = shareURLs;
  id v29 = 0;
  char v5 = _CKCheckArgument((uint64_t)"shareURLs", v4, 0, 0, 0, &v29);
  id v6 = v29;
  if ((v5 & 1) == 0)
  {
    v17 = v6;
    v18 = [CKException alloc];
    uint64_t v22 = objc_msgSend_code(v17, v19, v20, v21);
    v26 = objc_msgSend_localizedDescription(v17, v23, v24, v25);
    id v28 = (id)objc_msgSend_initWithCode_format_(v18, v27, v22, @"%@", v26);

    objc_exception_throw(v28);
  }

  v13 = (CKFetchShareMetadataOperation *)objc_msgSend_init(self, v7, v8, v9);
  if (v13)
  {
    uint64_t v14 = objc_msgSend_copy(v4, v10, v11, v12);
    v15 = v13->_shareURLs;
    v13->_shareURLs = (NSArray *)v14;
  }
  return v13;
}

- (CKFetchShareMetadataOperation)initWithShareURLs:(id)a3 invitationTokensByShareURL:(id)a4
{
  id v6 = a4;
  uint64_t v12 = (CKFetchShareMetadataOperation *)objc_msgSend_initWithShareURLs_(self, v7, (uint64_t)a3, v8);
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v6, v9, v10, v11);
    shareInvitationTokensByShareURL = v12->_shareInvitationTokensByShareURL;
    v12->_shareInvitationTokensByShareURL = (NSDictionary *)v13;
  }
  return v12;
}

- (void)setPerShareMetadataBlock:(void *)perShareMetadataBlock
{
  id v7 = perShareMetadataBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B072DE4;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id v12 = v15;
    goto LABEL_9;
  }
  if (self->_perShareMetadataBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id v12 = self->_perShareMetadataBlock;
    self->_perShareMetadataBlock = v11;
LABEL_9:
  }
}

- (void)perShareMetadataBlock
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
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF13C58;
    v16 = sub_18AF13898;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B072FDC;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    uint64_t v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v8 = _Block_copy(self->_perShareMetadataBlock);
  }

  return v8;
}

- (void)setFetchShareMetadataCompletionBlockIVar:(id)a3
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
    uint64_t v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B073168;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id fetchShareMetadataCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_fetchShareMetadataCompletionBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id fetchShareMetadataCompletionBlock = self->_fetchShareMetadataCompletionBlock;
    self->_id fetchShareMetadataCompletionBlock = v11;
LABEL_9:
  }
}

- (void)fetchShareMetadataCompletionBlock
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
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF13C58;
    v16 = sub_18AF13898;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B073360;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    uint64_t v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v8 = _Block_copy(self->_fetchShareMetadataCompletionBlock);
  }

  return v8;
}

- (void)setFetchShareMetadataCompletionBlock:(void *)fetchShareMetadataCompletionBlock
{
  BOOL v4 = fetchShareMetadataCompletionBlock == 0;
  id v9 = fetchShareMetadataCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setFetchShareMetadataCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_shareURLs(self, v5, v6, v7);
  objc_msgSend_setShareURLsToFetch_(v4, v9, (uint64_t)v8, v10);

  uint64_t RootRecord = objc_msgSend_shouldFetchRootRecord(self, v11, v12, v13);
  objc_msgSend_setShouldFetchRootRecord_(v4, v15, RootRecord, v16);
  uint64_t v20 = objc_msgSend_rootRecordDesiredKeys(self, v17, v18, v19);
  objc_msgSend_setRootRecordDesiredKeys_(v4, v21, (uint64_t)v20, v22);

  v26 = objc_msgSend_shareInvitationTokensByShareURL(self, v23, v24, v25);
  objc_msgSend_setShareInvitationTokensByShareURL_(v4, v27, (uint64_t)v26, v28);

  uint64_t v32 = objc_msgSend_overwriteContainerPCSServiceIfManatee(self, v29, v30, v31);
  objc_msgSend_setOverwriteContainerPCSServiceIfManatee_(v4, v33, v32, v34);
  uint64_t v38 = objc_msgSend_skipShareDecryption(self, v35, v36, v37);
  objc_msgSend_setSkipShareDecryption_(v4, v39, v38, v40);
  v41.receiver = self;
  v41.super_class = (Class)CKFetchShareMetadataOperation;
  [(CKOperation *)&v41 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v41.receiver = self;
  v41.super_class = (Class)CKFetchShareMetadataOperation;
  id v4 = a3;
  [(CKOperation *)&v41 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_shareURLsToFetch(v4, v5, v6, v7, v41.receiver, v41.super_class);
  objc_msgSend_setShareURLs_(self, v9, (uint64_t)v8, v10);

  uint64_t RootRecord = objc_msgSend_shouldFetchRootRecord(v4, v11, v12, v13);
  objc_msgSend_setShouldFetchRootRecord_(self, v15, RootRecord, v16);
  uint64_t v20 = objc_msgSend_rootRecordDesiredKeys(v4, v17, v18, v19);
  objc_msgSend_setRootRecordDesiredKeys_(self, v21, (uint64_t)v20, v22);

  v26 = objc_msgSend_shareInvitationTokensByShareURL(v4, v23, v24, v25);
  objc_msgSend_setShareInvitationTokensByShareURL_(self, v27, (uint64_t)v26, v28);

  uint64_t v32 = objc_msgSend_overwriteContainerPCSServiceIfManatee(v4, v29, v30, v31);
  objc_msgSend_setOverwriteContainerPCSServiceIfManatee_(self, v33, v32, v34);
  uint64_t v38 = objc_msgSend_skipShareDecryption(v4, v35, v36, v37);

  objc_msgSend_setSkipShareDecryption_(self, v39, v38, v40);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v13.receiver = self;
  v13.super_class = (Class)CKFetchShareMetadataOperation;
  if ([(CKOperation *)&v13 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_perShareMetadataBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v11 = objc_msgSend_fetchShareMetadataCompletionBlock(self, v7, v8, v9);
    BOOL v6 = v11 != 0;
  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v4 = a3;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend_shareURLs(self, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_count(v6, v7, v8, v9);

  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    objc_msgSend_shareURLs(self, v12, v13, v14);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v53, (uint64_t)v57, 16);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v54;
LABEL_4:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v54 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v53 + 1) + 8 * v19);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v4)
          {
            v43 = (objc_class *)objc_opt_class();
            v44 = NSStringFromClass(v43);
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v45, @"CKErrorDomain", 12, @"Unexpected share URL passed to %@: %@", v44, v20);
            goto LABEL_24;
          }
          goto LABEL_25;
        }
        if (objc_msgSend_containsObject_(v11, v21, v20, v22)) {
          break;
        }
        objc_msgSend_addObject_(v11, v23, v20, v24);
        uint64_t v28 = objc_msgSend_shareInvitationTokensByShareURL(self, v25, v26, v27);
        if (objc_msgSend_count(v28, v29, v30, v31))
        {
          v35 = objc_msgSend_shareInvitationTokensByShareURL(self, v32, v33, v34);
          uint64_t v38 = objc_msgSend_objectForKeyedSubscript_(v35, v36, v20, v37);

          if (!v38)
          {
            if (v4)
            {
              v48 = (objc_class *)objc_opt_class();
              v44 = NSStringFromClass(v48);
              objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v49, @"CKErrorDomain", 12, @"No sharing invitation token for URL \"%@\" was passed to %@", v20, v44);
LABEL_24:
              id *v4 = (id)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_25;
          }
        }
        else
        {
        }
        if (v17 == ++v19)
        {
          uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v53, (uint64_t)v57, 16);
          if (v17) {
            goto LABEL_4;
          }
          goto LABEL_15;
        }
      }
      if (v4)
      {
        v46 = (objc_class *)objc_opt_class();
        v44 = NSStringFromClass(v46);
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v47, @"CKErrorDomain", 12, @"URL \"%@\" was passed to %@ twice", v20, v44);
        goto LABEL_24;
      }
LABEL_25:

      LOBYTE(v4) = 0;
      goto LABEL_26;
    }
LABEL_15:

    v52.receiver = self;
    v52.super_class = (Class)CKFetchShareMetadataOperation;
    LOBYTE(v4) = [(CKOperation *)&v52 CKOperationShouldRun:v4];
LABEL_26:
  }
  else if (v4)
  {
    uint64_t v40 = (objc_class *)objc_opt_class();
    objc_super v41 = NSStringFromClass(v40);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v42, @"CKErrorDomain", 12, @"No share URLs were passed to %@", v41);
    id *v4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchShareMetadataOperation_withBlock_;
}

- (BOOL)claimPackagesInRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_18B073BE8;
  v23[4] = sub_18B073BF8;
  uint64_t v24 = self;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_18B073BE8;
  uint64_t v17 = sub_18B073BF8;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B073C00;
  v12[3] = &unk_1E5462958;
  v12[4] = v23;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B073C54;
  v11[3] = &unk_1E5462980;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend_claimPackagesWithSuccessBlock_failureBlock_completionBlock_(v6, v7, (uint64_t)v12, (uint64_t)v11, 0);
  if (a4)
  {
    uint64_t v8 = (void *)v14[5];
    if (v8) {
      *a4 = v8;
    }
  }
  char v9 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

  return v9;
}

- (void)handleShareMetadataFetchForURL:(id)a3 shareMetadata:(id)a4 error:(id)a5
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v15 = objc_msgSend_CKClientSuitableError(v11, v12, v13, v14);
  if (self) {
    signpost = self->super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v17 = signpost;

  if (v15)
  {
    if (v17)
    {
      if (self) {
        uint64_t v21 = self->super._signpost;
      }
      else {
        uint64_t v21 = 0;
      }
      char v22 = v21;
      uint64_t v26 = objc_msgSend_log(v22, v23, v24, v25);

      if (self) {
        uint64_t v27 = self->super._signpost;
      }
      else {
        uint64_t v27 = 0;
      }
      uint64_t v28 = v27;
      uint64_t v32 = objc_msgSend_identifier(v28, v29, v30, v31);

      if ((unint64_t)(v32 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v26)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 138412546;
      id v90 = v9;
      __int16 v91 = 2112;
      id v92 = v15;
      uint64_t v33 = "Shared %@ fetched metadata with error: %@";
      uint64_t v34 = v26;
      os_signpost_id_t v35 = v32;
      uint32_t v36 = 22;
LABEL_20:
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v34, OS_SIGNPOST_EVENT, v35, "CKFetchShareMetadataOperation", v33, buf, v36);
LABEL_21:
    }
  }
  else if (v17)
  {
    if (self) {
      uint64_t v37 = self->super._signpost;
    }
    else {
      uint64_t v37 = 0;
    }
    uint64_t v38 = v37;
    uint64_t v26 = objc_msgSend_log(v38, v39, v40, v41);

    if (self) {
      v42 = self->super._signpost;
    }
    else {
      v42 = 0;
    }
    v43 = v42;
    uint64_t v47 = objc_msgSend_identifier(v43, v44, v45, v46);

    if ((unint64_t)(v47 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v26)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 138412290;
    id v90 = v9;
    uint64_t v33 = "Shared %@ fetched metadata";
    uint64_t v34 = v26;
    os_signpost_id_t v35 = v47;
    uint32_t v36 = 12;
    goto LABEL_20;
  }
  if (!v11)
  {
    objc_msgSend_rootRecord(v10, v18, v19, v20);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v48 = objc_msgSend_rootRecord(v10, v18, v19, v20);
      id v88 = 0;
      int v50 = objc_msgSend_claimPackagesInRecord_error_(self, v49, (uint64_t)v48, (uint64_t)&v88);
      id v51 = v88;

      if (v50 == (v51 == 0))
      {
        if (v50)
        {
LABEL_26:
          id v11 = 0;
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
        long long v55 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v52, v53, v54);
        v57 = v55;
        if (v50) {
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v55, v56, (uint64_t)a2, (uint64_t)self, @"CKFetchShareMetadataOperation.m", 164, @"Expecting packageClaimError(%@) only on failure (%s)", v51, "succeeded");
        }
        else {
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v55, v56, (uint64_t)a2, (uint64_t)self, @"CKFetchShareMetadataOperation.m", 164, @"Expecting packageClaimError(%@) only on failure (%s)", v51, "failed");
        }

        if (v50) {
          goto LABEL_26;
        }
      }
      id v11 = v51;
      objc_msgSend_setRootRecord_(v10, v58, 0, v59);
      goto LABEL_32;
    }
  }
LABEL_33:
  v60 = objc_msgSend_CKClientSuitableError(v11, v18, v19, v20);

  if (v60 && (objc_msgSend_canDropItemResultsEarly(self, v61, v62, v63) & 1) == 0)
  {
    v64 = objc_msgSend_errorsByURL(self, v61, v62, v63);
    objc_msgSend_setObject_forKeyedSubscript_(v64, v65, (uint64_t)v60, (uint64_t)v9);
  }
  v66 = objc_msgSend_perShareMetadataBlock_wrapper(self, v61, v62, v63);
  v70 = v66;
  if (v66)
  {
    v71 = (void (**)(void *, id, void, void *))_Block_copy(v66);
  }
  else
  {
    v72 = objc_msgSend_perShareMetadataBlock(self, v67, v68, v69);
    v71 = (void (**)(void *, id, void, void *))_Block_copy(v72);
  }
  if (v71)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v73 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v75 = v73;
      v79 = objc_msgSend_operationID(self, v76, v77, v78);
      v83 = objc_msgSend_share(v10, v80, v81, v82);
      v87 = objc_msgSend_recordID(v83, v84, v85, v86);
      *(_DWORD *)buf = 138544130;
      id v90 = v79;
      __int16 v91 = 2112;
      id v92 = v9;
      __int16 v93 = 2112;
      v94 = v87;
      __int16 v95 = 2112;
      v96 = v60;
      _os_log_debug_impl(&dword_18AF10000, v75, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about fetched share metadata for URL %@ with ID %@: %@", buf, 0x2Au);
    }
    if (v60) {
      id v74 = 0;
    }
    else {
      id v74 = v10;
    }
    ((void (**)(void *, id, id, void *))v71)[2](v71, v9, v74, v60);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    signpost = self->super._signpost;
  }
  else {
    signpost = 0;
  }
  id v6 = signpost;

  if (v6)
  {
    if (self) {
      id v10 = self->super._signpost;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchShareMetadataOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    char v22 = objc_msgSend_errorsByURL(self, v7, v8, v9);
    uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      uint64_t v27 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
      uint64_t v31 = objc_msgSend_errorsByURL(self, v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, @"CKPartialErrors");

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, @"CKInternalErrorDomain", 1011, v27, @"Failed to fetch some share info");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  uint64_t v34 = objc_msgSend_fetchShareMetadataCompletionBlock_wrapper(self, v7, v8, v9);
  uint64_t v38 = v34;
  if (v34)
  {
    v39 = (void (**)(void *, void *))_Block_copy(v34);
  }
  else
  {
    uint64_t v40 = objc_msgSend_fetchShareMetadataCompletionBlock(self, v35, v36, v37);
    v39 = (void (**)(void *, void *))_Block_copy(v40);
  }
  if (v39)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v44 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v62 = v44;
      uint64_t v63 = (objc_class *)objc_opt_class();
      v64 = NSStringFromClass(v63);
      uint64_t v68 = objc_msgSend_ckShortDescription(self, v65, v66, v67);
      *(_DWORD *)buf = 138544130;
      v76 = v64;
      __int16 v77 = 2048;
      uint64_t v78 = self;
      __int16 v79 = 2114;
      v80 = v68;
      __int16 v81 = 2112;
      id v82 = v4;
      _os_log_debug_impl(&dword_18AF10000, v62, OS_LOG_TYPE_DEBUG, "Calling fetchShareMetadataCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);
    }
    v48 = objc_msgSend_CKClientSuitableError(v4, v45, v46, v47);
    v39[2](v39, v48);

    objc_msgSend_setFetchShareMetadataCompletionBlock_(self, v49, 0, v50);
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v51 = objc_msgSend_packagesToDestroy(self, v41, v42, v43);
  uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v70, (uint64_t)v74, 16);
  if (v53)
  {
    uint64_t v57 = v53;
    uint64_t v58 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v71 != v58) {
          objc_enumerationMutation(v51);
        }
        objc_msgSend_removeDB(*(void **)(*((void *)&v70 + 1) + 8 * i), v54, v55, v56);
      }
      uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v54, (uint64_t)&v70, (uint64_t)v74, 16);
    }
    while (v57);
  }

  objc_msgSend_setPerShareMetadataBlock_(self, v60, 0, v61);
  v69.receiver = self;
  v69.super_class = (Class)CKFetchShareMetadataOperation;
  [(CKOperation *)&v69 _finishOnCallbackQueueWithError:v4];
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
    id v6 = v5;
    id v10 = objc_msgSend_log(v6, v7, v8, v9);

    if (self) {
      id v11 = self->super._signpost;
    }
    else {
      id v11 = 0;
    }
    uint64_t v12 = v11;
    os_signpost_id_t v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      uint64_t v20 = objc_msgSend_operationID(self, v17, v18, v19);
      uint64_t v24 = objc_msgSend_containerID(self, v21, v22, v23);
      uint64_t v28 = objc_msgSend_group(self, v25, v26, v27);
      uint64_t v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      uint64_t v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      uint64_t v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      uint64_t v55 = v20;
      __int16 v56 = 2112;
      uint64_t v57 = v24;
      __int16 v58 = 2112;
      uint64_t v59 = v32;
      __int16 v60 = 2114;
      uint64_t v61 = v36;
      __int16 v62 = 2114;
      uint64_t v63 = v45;
      __int16 v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchShareMetadataOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
  id v6 = signpost;

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchShareMetadataOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/fetch-share-metadatas", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleShareMetadataFetchForURL_shareMetadata_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKFetchShareMetadataOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSArray)shareURLs
{
  return self->_shareURLs;
}

- (void)setShareURLs:(NSArray *)shareURLs
{
}

- (BOOL)shouldFetchRootRecord
{
  return self->_shouldFetchRootRecord;
}

- (void)setShouldFetchRootRecord:(BOOL)shouldFetchRootRecord
{
  self->_shouldFetchuint64_t RootRecord = shouldFetchRootRecord;
}

- (NSArray)rootRecordDesiredKeys
{
  return self->_rootRecordDesiredKeys;
}

- (void)setRootRecordDesiredKeys:(NSArray *)rootRecordDesiredKeys
{
}

- (NSMutableDictionary)errorsByURL
{
  return self->_errorsByURL;
}

- (void)setErrorsByURL:(id)a3
{
}

- (NSMutableSet)packagesToDestroy
{
  return self->_packagesToDestroy;
}

- (void)setPackagesToDestroy:(id)a3
{
}

- (id)perShareMetadataBlock_wrapper
{
  return self->_perShareMetadataBlock_wrapper;
}

- (void)setPerShareMetadataBlock_wrapper:(id)a3
{
}

- (id)fetchShareMetadataCompletionBlock_wrapper
{
  return self->_fetchShareMetadataCompletionBlock_wrapper;
}

- (void)setFetchShareMetadataCompletionBlock_wrapper:(id)a3
{
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
  objc_storeStrong(&self->_fetchShareMetadataCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perShareMetadataBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_packagesToDestroy, 0);
  objc_storeStrong((id *)&self->_errorsByURL, 0);
  objc_storeStrong((id *)&self->_rootRecordDesiredKeys, 0);
  objc_storeStrong((id *)&self->_shareURLs, 0);
  objc_storeStrong(&self->_fetchShareMetadataCompletionBlock, 0);

  objc_storeStrong(&self->_perShareMetadataBlock, 0);
}

@end