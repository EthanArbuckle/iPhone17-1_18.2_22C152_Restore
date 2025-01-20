@interface CKMapShareURLsToInstalledBundleIDsOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (BOOL)returnLocalBundlesOnly;
- (CKMapShareURLsToInstalledBundleIDsOperation)init;
- (CKMapShareURLsToInstalledBundleIDsOperation)initWithShareURLs:(id)a3 returnLocalBundlesOnly:(BOOL)a4;
- (NSArray)shareURLs;
- (NSMutableArray)genericURLs;
- (NSMutableArray)specialURLs;
- (NSMutableDictionary)errorsByURL;
- (id)activityCreate;
- (id)getStaticBundleIDsForURLSlug:(id)a3 withKey:(id)a4;
- (id)mapBundleIDsCompletionBlock;
- (id)perShareURLBlock;
- (id)selectLocalBundleIDs:(id)a3;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleBundleIDsFetchedForURL:(id)a3 appBundleIDs:(id)a4 daemonBundleIDs:(id)a5 error:(id)a6;
- (void)performCKOperation;
- (void)setErrorsByURL:(id)a3;
- (void)setGenericURLs:(id)a3;
- (void)setMapBundleIDsCompletionBlock:(id)a3;
- (void)setPerShareURLBlock:(id)a3;
- (void)setReturnLocalBundlesOnly:(BOOL)a3;
- (void)setShareURLs:(id)a3;
- (void)setSpecialURLs:(id)a3;
@end

@implementation CKMapShareURLsToInstalledBundleIDsOperation

- (CKMapShareURLsToInstalledBundleIDsOperation)init
{
  v10.receiver = self;
  v10.super_class = (Class)CKMapShareURLsToInstalledBundleIDsOperation;
  v2 = [(CKOperation *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    specialURLs = v2->_specialURLs;
    v2->_specialURLs = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    genericURLs = v2->_genericURLs;
    v2->_genericURLs = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    errorsByURL = v2->_errorsByURL;
    v2->_errorsByURL = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (CKMapShareURLsToInstalledBundleIDsOperation)initWithShareURLs:(id)a3 returnLocalBundlesOnly:(BOOL)a4
{
  id v6 = a3;
  id v31 = 0;
  char v7 = _CKCheckArgument((uint64_t)"shareURLs", v6, 0, 0, 0, &v31);
  id v8 = v31;
  if ((v7 & 1) == 0)
  {
    v19 = v8;
    v20 = [CKException alloc];
    uint64_t v24 = objc_msgSend_code(v19, v21, v22, v23);
    v28 = objc_msgSend_localizedDescription(v19, v25, v26, v27);
    id v30 = (id)objc_msgSend_initWithCode_format_(v20, v29, v24, @"%@", v28);

    objc_exception_throw(v30);
  }

  v15 = (CKMapShareURLsToInstalledBundleIDsOperation *)objc_msgSend_init(self, v9, v10, v11);
  if (v15)
  {
    uint64_t v16 = objc_msgSend_copy(v6, v12, v13, v14);
    shareURLs = v15->_shareURLs;
    v15->_shareURLs = (NSArray *)v16;

    v15->_returnLocalBundlesOnly = a4;
  }

  return v15;
}

- (void)setPerShareURLBlock:(id)a3
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
    v14[2] = sub_18B143A98;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id perShareURLBlock = v15;
    goto LABEL_9;
  }
  if (self->_perShareURLBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id perShareURLBlock = self->_perShareURLBlock;
    self->_id perShareURLBlock = v11;
LABEL_9:
  }
}

- (id)perShareURLBlock
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
    id v15 = sub_18AF140DC;
    uint64_t v16 = sub_18AF13998;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B143C90;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    id v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = _Block_copy(self->_perShareURLBlock);
  }

  return v8;
}

- (void)setMapBundleIDsCompletionBlock:(id)a3
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
    v14[2] = sub_18B143E1C;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id mapBundleIDsCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_mapBundleIDsCompletionBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id mapBundleIDsCompletionBlock = self->_mapBundleIDsCompletionBlock;
    self->_id mapBundleIDsCompletionBlock = v11;
LABEL_9:
  }
}

- (id)mapBundleIDsCompletionBlock
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
    id v15 = sub_18AF140DC;
    uint64_t v16 = sub_18AF13998;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B144014;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    id v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = _Block_copy(self->_mapBundleIDsCompletionBlock);
  }

  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_shareURLs(self, v5, v6, v7);
  objc_msgSend_setShareURLs_(v4, v9, (uint64_t)v8, v10);

  v11.receiver = self;
  v11.super_class = (Class)CKMapShareURLsToInstalledBundleIDsOperation;
  [(CKOperation *)&v11 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKMapShareURLsToInstalledBundleIDsOperation;
  id v4 = a3;
  [(CKOperation *)&v11 fillFromOperationInfo:v4];
  id v8 = objc_msgSend_shareURLs(v4, v5, v6, v7, v11.receiver, v11.super_class);

  objc_msgSend_setShareURLs_(self, v9, (uint64_t)v8, v10);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v13.receiver = self;
  v13.super_class = (Class)CKMapShareURLsToInstalledBundleIDsOperation;
  if ([(CKOperation *)&v13 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_perShareURLBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_super v11 = objc_msgSend_mapBundleIDsCompletionBlock(self, v7, v8, v9);
    BOOL v6 = v11 != 0;
  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend_shareURLs(self, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_count(v6, v7, v8, v9);

  if (v10)
  {
    v60 = a3;
    objc_super v11 = objc_opt_new();
    v62 = CKURLSlugsToBundleIDsMap();
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    objc_msgSend_shareURLs(self, v12, v13, v14);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v64, (uint64_t)v68, 16);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v65;
LABEL_4:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v65 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v64 + 1) + 8 * v19);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v52 = v60;
          if (!v60) {
            goto LABEL_28;
          }
          v53 = (objc_class *)objc_opt_class();
          v32 = NSStringFromClass(v53);
          v58 = v32;
          v59 = v20;
          v55 = @"Unexpected share URL passed to %@: %@";
LABEL_25:
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v54, @"CKErrorDomain", 12, v55, v58, v59);
          goto LABEL_26;
        }
        if (objc_msgSend_containsObject_(v11, v21, (uint64_t)v20, v22))
        {
          v52 = v60;
          if (!v60) {
            goto LABEL_28;
          }
          v56 = (objc_class *)objc_opt_class();
          v32 = NSStringFromClass(v56);
          v58 = v20;
          v59 = v32;
          v55 = @"URL \"%@\" was passed to %@ twice";
          goto LABEL_25;
        }
        objc_msgSend_addObject_(v11, v23, (uint64_t)v20, v24);
        v28 = objc_msgSend_CKURLSlug(v20, v25, v26, v27);
        v32 = objc_msgSend_lowercaseString(v28, v29, v30, v31);

        v38 = objc_msgSend_objectForKeyedSubscript_(v62, v33, (uint64_t)v32, v34);
        if (!v38) {
          break;
        }
        if (__sTestOverridesAvailable)
        {
          v39 = objc_msgSend_unitTestOverrides(self, v35, v36, v37);
          v42 = objc_msgSend_objectForKeyedSubscript_(v39, v40, @"forceFetchAllshareURLs", v41);

          if (v42) {
            goto LABEL_14;
          }
        }
        v43 = objc_msgSend_specialURLs(self, v35, v36, v37);
LABEL_15:
        v46 = v43;
        objc_msgSend_addObject_(v43, v44, (uint64_t)v20, v45);

        if (v17 == ++v19)
        {
          uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v64, (uint64_t)v68, 16);
          if (v17) {
            goto LABEL_4;
          }
          goto LABEL_17;
        }
      }
      if (!objc_msgSend_isEqualToString_(v32, v35, @"share", v37))
      {
        v52 = v60;
        if (v60)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v35, @"CKErrorDomain", 12, @"URL %@ has unknown format", v20);
LABEL_26:
          id *v52 = (id)objc_claimAutoreleasedReturnValue();
        }

LABEL_28:
        BOOL v48 = 0;
        goto LABEL_29;
      }
LABEL_14:
      v43 = objc_msgSend_genericURLs(self, v35, v36, v37);
      goto LABEL_15;
    }
LABEL_17:

    v63.receiver = self;
    v63.super_class = (Class)CKMapShareURLsToInstalledBundleIDsOperation;
    BOOL v48 = [(CKOperation *)&v63 CKOperationShouldRun:v60];
LABEL_29:
  }
  else
  {
    if (a3)
    {
      v49 = (objc_class *)objc_opt_class();
      v50 = NSStringFromClass(v49);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v51, @"CKErrorDomain", 12, @"No share URLs were passed to %@", v50);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  return v48;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performMapShareURLsToInstalledBundleIDsOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  objc_msgSend_specialURLs(self, a2, v2, v3);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v48, (uint64_t)v52, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend_CKURLSlug(v13, v7, v8, v9);
        uint64_t v18 = objc_msgSend_lowercaseString(v14, v15, v16, v17);

        v20 = objc_msgSend_getStaticBundleIDsForURLSlug_withKey_(self, v19, (uint64_t)v18, @"apps");
        uint64_t v22 = objc_msgSend_getStaticBundleIDsForURLSlug_withKey_(self, v21, (uint64_t)v18, @"daemons");
        objc_msgSend_handleBundleIDsFetchedForURL_appBundleIDs_daemonBundleIDs_error_(self, v23, (uint64_t)v13, (uint64_t)v20, v22, 0);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v48, (uint64_t)v52, 16);
    }
    while (v10);
  }

  uint64_t v27 = objc_msgSend_genericURLs(self, v24, v25, v26);
  uint64_t v31 = objc_msgSend_count(v27, v28, v29, v30);

  if (v31)
  {
    v35 = objc_msgSend_operationInfo(self, v32, v33, v34);
    v39 = objc_msgSend_copy(v35, v36, v37, v38);

    v43 = objc_msgSend_genericURLs(self, v40, v41, v42);
    objc_msgSend_setShareURLs_(v39, v44, (uint64_t)v43, v45);

    v47.receiver = self;
    v47.super_class = (Class)CKMapShareURLsToInstalledBundleIDsOperation;
    [(CKOperation *)&v47 performCKOperation];
  }
  else
  {
    objc_msgSend__finishOnCallbackQueueWithError_(self, v32, 0, v34);
  }
}

- (void)handleBundleIDsFetchedForURL:(id)a3 appBundleIDs:(id)a4 daemonBundleIDs:(id)a5 error:(id)a6
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v11;
  v21 = v14;
  if (objc_msgSend_count(v14, v15, v16, v17))
  {
    v21 = v14;
    if (objc_msgSend_returnLocalBundlesOnly(self, v18, v19, v20))
    {
      v21 = objc_msgSend_selectLocalBundleIDs_(self, v18, (uint64_t)v14, v20);
    }
  }
  if (!objc_msgSend_count(v21, v18, v19, v20))
  {

    v21 = 0;
  }
  if (!objc_msgSend_count(v12, v22, v23, v24))
  {

    id v12 = 0;
  }
  uint64_t v31 = objc_msgSend_CKClientSuitableError(v13, v25, v26, v27);
  if (v31)
  {
    v32 = objc_msgSend_errorsByURL(self, v28, v29, v30);
    objc_msgSend_setObject_forKeyedSubscript_(v32, v33, (uint64_t)v31, (uint64_t)v10);

    if (self) {
      signpost = self->super._signpost;
    }
    else {
      signpost = 0;
    }
    v35 = signpost;

    if (v35)
    {
      if (self) {
        v39 = self->super._signpost;
      }
      else {
        v39 = 0;
      }
      v40 = v39;
      v44 = objc_msgSend_log(v40, v41, v42, v43);

      if (self) {
        uint64_t v45 = self->super._signpost;
      }
      else {
        uint64_t v45 = 0;
      }
      v46 = v45;
      uint64_t v50 = objc_msgSend_identifier(v46, v47, v48, v49);

      if ((unint64_t)(v50 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v44)) {
        goto LABEL_30;
      }
      *(_DWORD *)v88 = 138412546;
      *(void *)&v88[4] = v10;
      *(_WORD *)&v88[12] = 2112;
      *(void *)&v88[14] = v31;
      long long v51 = "BundleIDs fetched for shareURL %@ with error: %@";
      v52 = v44;
      os_signpost_id_t v53 = v50;
      uint32_t v54 = 22;
LABEL_29:
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v52, OS_SIGNPOST_EVENT, v53, "CKMapShareURLsToInstalledBundleIDsOperation", v51, v88, v54);
LABEL_30:
    }
  }
  else
  {
    if (self) {
      v55 = self->super._signpost;
    }
    else {
      v55 = 0;
    }
    v56 = v55;

    if (v56)
    {
      if (self) {
        v57 = self->super._signpost;
      }
      else {
        v57 = 0;
      }
      v58 = v57;
      v44 = objc_msgSend_log(v58, v59, v60, v61);

      if (self) {
        v62 = self->super._signpost;
      }
      else {
        v62 = 0;
      }
      objc_super v63 = v62;
      uint64_t v67 = objc_msgSend_identifier(v63, v64, v65, v66);

      if ((unint64_t)(v67 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v44)) {
        goto LABEL_30;
      }
      *(_DWORD *)v88 = 138412290;
      *(void *)&v88[4] = v10;
      long long v51 = "BundleIDs fetched for shareURL %@";
      v52 = v44;
      os_signpost_id_t v53 = v67;
      uint32_t v54 = 12;
      goto LABEL_29;
    }
  }
  v68 = objc_msgSend_perShareURLBlock(self, v36, v37, v38, *(_OWORD *)v88, *(void *)&v88[16]);

  if (v68)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v69 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v78 = v69;
      v82 = objc_msgSend_operationID(self, v79, v80, v81);
      *(_DWORD *)v88 = 138543874;
      *(void *)&v88[4] = v82;
      *(_WORD *)&v88[12] = 2112;
      *(void *)&v88[14] = v10;
      *(_WORD *)&v88[22] = 2112;
      v89 = v31;
      _os_log_debug_impl(&dword_18AF10000, v78, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about fetched bundleIDs for URL %@ : %@", v88, 0x20u);
    }
    uint64_t v73 = objc_msgSend_perShareURLBlock(self, v70, v71, v72);
    v74 = (void *)v73;
    if (v31) {
      v75 = 0;
    }
    else {
      v75 = v21;
    }
    if (v31) {
      id v76 = 0;
    }
    else {
      id v76 = v12;
    }
    (*(void (**)(uint64_t, id, void *, id, void *))(v73 + 16))(v73, v10, v75, v76, v31);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v77 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v83 = v77;
      v87 = objc_msgSend_operationID(self, v84, v85, v86);
      *(_DWORD *)v88 = 138543874;
      *(void *)&v88[4] = v87;
      *(_WORD *)&v88[12] = 2112;
      *(void *)&v88[14] = v10;
      *(_WORD *)&v88[22] = 2112;
      v89 = v31;
      _os_log_debug_impl(&dword_18AF10000, v83, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received fetched bundleIDs for URL %@: %@", v88, 0x20u);
    }
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    signpost = self->super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v6 = signpost;

  if (v6)
  {
    if (self) {
      id v10 = self->super._signpost;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
    id v15 = objc_msgSend_log(v11, v12, v13, v14);

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKMapShareURLsToInstalledBundleIDsOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    uint64_t v22 = objc_msgSend_errorsByURL(self, v7, v8, v9);
    uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      uint64_t v27 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
      uint64_t v31 = objc_msgSend_errorsByURL(self, v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, @"CKPartialErrors");

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, @"CKInternalErrorDomain", 1011, v27, @"Failed to fetch bundleIDs for some URLs");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  uint64_t v34 = objc_msgSend_mapBundleIDsCompletionBlock(self, v7, v8, v9);

  if (v34)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v37 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v52 = v37;
      os_signpost_id_t v53 = (objc_class *)objc_opt_class();
      uint32_t v54 = NSStringFromClass(v53);
      v58 = objc_msgSend_ckShortDescription(self, v55, v56, v57);
      *(_DWORD *)buf = 138544130;
      uint64_t v61 = v54;
      __int16 v62 = 2048;
      objc_super v63 = self;
      __int16 v64 = 2114;
      uint64_t v65 = v58;
      __int16 v66 = 2112;
      id v67 = v4;
      _os_log_debug_impl(&dword_18AF10000, v52, OS_LOG_TYPE_DEBUG, "Calling mapBundleIDsCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);
    }
    objc_msgSend_mapBundleIDsCompletionBlock(self, v38, v39, v40);
    uint64_t v41 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v45 = objc_msgSend_CKClientSuitableError(v4, v42, v43, v44);
    ((void (**)(void, void *))v41)[2](v41, v45);

    objc_msgSend_setMapBundleIDsCompletionBlock_(self, v46, 0, v47);
  }
  objc_msgSend_setPerShareURLBlock_(self, v35, 0, v36);
  objc_msgSend_setGenericURLs_(self, v48, 0, v49);
  objc_msgSend_setSpecialURLs_(self, v50, 0, v51);
  v59.receiver = self;
  v59.super_class = (Class)CKMapShareURLsToInstalledBundleIDsOperation;
  [(CKOperation *)&v59 _finishOnCallbackQueueWithError:v4];
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
    uint64_t v6 = v5;
    id v10 = objc_msgSend_log(v6, v7, v8, v9);

    if (self) {
      id v11 = self->super._signpost;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;
    os_signpost_id_t v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      uint64_t v20 = objc_msgSend_operationID(self, v17, v18, v19);
      uint64_t v24 = objc_msgSend_containerID(self, v21, v22, v23);
      v28 = objc_msgSend_group(self, v25, v26, v27);
      v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      uint64_t v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      os_signpost_id_t v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      v55 = v20;
      __int16 v56 = 2112;
      uint64_t v57 = v24;
      __int16 v58 = 2112;
      objc_super v59 = v32;
      __int16 v60 = 2114;
      uint64_t v61 = v36;
      __int16 v62 = 2114;
      objc_super v63 = v45;
      __int16 v64 = 2114;
      uint64_t v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKMapShareURLsToInstalledBundleIDsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
  uint64_t v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v7 = self->super._signpost;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = v7;
    id v12 = objc_msgSend_log(v8, v9, v10, v11);

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKMapShareURLsToInstalledBundleIDsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/map-share-urls-to-bundle-ids", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleBundleIDsFetchedForURL_appBundleIDs_daemonBundleIDs_error_, 3, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKMapShareURLsToInstalledBundleIDsOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (id)selectLocalBundleIDs:(id)a3
{
  uint64_t v3 = CKSelectLocalAppNamesByBundleIDs(a3);
  objc_super v7 = objc_msgSend_allKeys(v3, v4, v5, v6);

  return v7;
}

- (id)getStaticBundleIDsForURLSlug:(id)a3 withKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = CKURLSlugsToBundleIDsMap();
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)v6, v9);

  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v5, v12);

  return v13;
}

- (NSArray)shareURLs
{
  return self->_shareURLs;
}

- (void)setShareURLs:(id)a3
{
}

- (NSMutableArray)specialURLs
{
  return self->_specialURLs;
}

- (void)setSpecialURLs:(id)a3
{
}

- (NSMutableArray)genericURLs
{
  return self->_genericURLs;
}

- (void)setGenericURLs:(id)a3
{
}

- (NSMutableDictionary)errorsByURL
{
  return self->_errorsByURL;
}

- (void)setErrorsByURL:(id)a3
{
}

- (BOOL)returnLocalBundlesOnly
{
  return self->_returnLocalBundlesOnly;
}

- (void)setReturnLocalBundlesOnly:(BOOL)a3
{
  self->_returnLocalBundlesOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsByURL, 0);
  objc_storeStrong((id *)&self->_genericURLs, 0);
  objc_storeStrong((id *)&self->_specialURLs, 0);
  objc_storeStrong((id *)&self->_shareURLs, 0);
  objc_storeStrong(&self->_mapBundleIDsCompletionBlock, 0);

  objc_storeStrong(&self->_perShareURLBlock, 0);
}

@end