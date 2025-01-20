@interface CKPublishAssetsOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKPublishAssetsOperation)initWithRecordIDs:(id)a3;
- (NSArray)recordIDs;
- (NSDictionary)fileNamesByAssetFieldNames;
- (NSMutableDictionary)perItemErrorsByRecordID;
- (id)activityCreate;
- (id)assetPublishedBlock;
- (id)publishAssetCompletionBlock;
- (unint64_t)URLOptions;
- (unint64_t)requestedTTL;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleAssetPublishCompletionForRecordID:(id)a3 publishedAsset:(id)a4 recordKey:(id)a5 error:(id)a6;
- (void)setAssetPublishedBlock:(id)a3;
- (void)setFileNamesByAssetFieldNames:(id)a3;
- (void)setPerItemErrorsByRecordID:(id)a3;
- (void)setPublishAssetCompletionBlock:(id)a3;
- (void)setRecordIDs:(id)a3;
- (void)setRequestedTTL:(unint64_t)a3;
- (void)setURLOptions:(unint64_t)a3;
@end

@implementation CKPublishAssetsOperation

- (CKPublishAssetsOperation)initWithRecordIDs:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKPublishAssetsOperation;
  v8 = [(CKOperation *)&v14 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
    recordIDs = v8->_recordIDs;
    v8->_recordIDs = (NSArray *)v9;

    uint64_t v11 = objc_opt_new();
    perItemErrorsByRecordID = v8->_perItemErrorsByRecordID;
    v8->_perItemErrorsByRecordID = (NSMutableDictionary *)v11;
  }
  return v8;
}

- (void)setAssetPublishedBlock:(id)a3
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
    v14[2] = sub_18B083CE0;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id assetPublishedBlock = v15;
    goto LABEL_9;
  }
  if (self->_assetPublishedBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id assetPublishedBlock = self->_assetPublishedBlock;
    self->_id assetPublishedBlock = v11;
LABEL_9:
  }
}

- (id)assetPublishedBlock
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
    id v15 = sub_18AF13CFC;
    v16 = sub_18AF138C0;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B083ED8;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_assetPublishedBlock);
  }

  return v8;
}

- (void)setPublishAssetCompletionBlock:(id)a3
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
    v14[2] = sub_18B084064;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id publishAssetCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_publishAssetCompletionBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id publishAssetCompletionBlock = self->_publishAssetCompletionBlock;
    self->_id publishAssetCompletionBlock = v11;
LABEL_9:
  }
}

- (id)publishAssetCompletionBlock
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
    id v15 = sub_18AF13CFC;
    v16 = sub_18AF138C0;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B08425C;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = _Block_copy(self->_publishAssetCompletionBlock);
  }

  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_recordIDs(self, v5, v6, v7);
  objc_msgSend_setRecordIDs_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_fileNamesByAssetFieldNames(self, v11, v12, v13);
  objc_msgSend_setFileNamesByAssetFieldNames_(v4, v15, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_requestedTTL(self, v17, v18, v19);
  objc_msgSend_setRequestedTTL_(v4, v21, v20, v22);
  uint64_t v26 = objc_msgSend_URLOptions(self, v23, v24, v25);
  objc_msgSend_setURLOptions_(v4, v27, v26, v28);
  v29.receiver = self;
  v29.super_class = (Class)CKPublishAssetsOperation;
  [(CKDatabaseOperation *)&v29 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)CKPublishAssetsOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v29 fillFromOperationInfo:v4];
  v8 = objc_msgSend_recordIDs(v4, v5, v6, v7, v29.receiver, v29.super_class);
  objc_msgSend_setRecordIDs_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_fileNamesByAssetFieldNames(v4, v11, v12, v13);
  objc_msgSend_setFileNamesByAssetFieldNames_(self, v15, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_requestedTTL(v4, v17, v18, v19);
  objc_msgSend_setRequestedTTL_(self, v21, v20, v22);
  uint64_t v26 = objc_msgSend_URLOptions(v4, v23, v24, v25);

  objc_msgSend_setURLOptions_(self, v27, v26, v28);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v13.receiver = self;
  v13.super_class = (Class)CKPublishAssetsOperation;
  if ([(CKOperation *)&v13 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_assetPublishedBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v11 = objc_msgSend_publishAssetCompletionBlock(self, v7, v8, v9);
    BOOL v6 = v11 != 0;
  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend_recordIDs(self, a2, (uint64_t)a3, v3);
  if (!objc_msgSend_count(v6, v7, v8, v9))
  {
LABEL_12:

    return 0;
  }
  objc_super v13 = objc_msgSend_fileNamesByAssetFieldNames(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_count(v13, v14, v15, v16);

  if (v17)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    BOOL v6 = objc_msgSend_recordIDs(self, v18, v19, v20);
    uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v21, (uint64_t)&v34, (uint64_t)v38, 16);
    if (!v22)
    {
LABEL_11:

      v33.receiver = self;
      v33.super_class = (Class)CKPublishAssetsOperation;
      return [(CKDatabaseOperation *)&v33 CKOperationShouldRun:a3];
    }
    uint64_t v26 = v22;
    uint64_t v27 = *(void *)v35;
LABEL_5:
    uint64_t v28 = 0;
    while (1)
    {
      if (*(void *)v35 != v27) {
        objc_enumerationMutation(v6);
      }
      objc_super v29 = objc_msgSend_zoneID(*(void **)(*((void *)&v34 + 1) + 8 * v28), v23, v24, v25);
      int v31 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v30, (uint64_t)v29, (uint64_t)a3);

      if (!v31) {
        goto LABEL_12;
      }
      if (v26 == ++v28)
      {
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v23, (uint64_t)&v34, (uint64_t)v38, 16);
        if (v26) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }
  return 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performPublishAssetsOperation_withBlock_;
}

- (void)handleAssetPublishCompletionForRecordID:(id)a3 publishedAsset:(id)a4 recordKey:(id)a5 error:(id)a6
{
  uint64_t v177 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v16 = objc_msgSend_CKClientSuitableError(a6, v13, v14, v15);
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  uint64_t v18 = signpost;

  if (v16)
  {
    if (!v18) {
      goto LABEL_22;
    }
    if (self) {
      uint64_t v19 = self->super.super._signpost;
    }
    else {
      uint64_t v19 = 0;
    }
    uint64_t v20 = v19;
    uint64_t v24 = objc_msgSend_log(v20, v21, v22, v23);

    if (self) {
      uint64_t v25 = self->super.super._signpost;
    }
    else {
      uint64_t v25 = 0;
    }
    uint64_t v26 = v25;
    uint64_t v30 = objc_msgSend_identifier(v26, v27, v28, v29);

    if ((unint64_t)(v30 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 138412802;
    id v168 = v10;
    __int16 v169 = 2112;
    id v170 = v12;
    __int16 v171 = 2112;
    id v172 = v16;
    int v31 = "Record %@ published asset for %@ with error: %@";
    v32 = v24;
    os_signpost_id_t v33 = v30;
    uint32_t v34 = 32;
    goto LABEL_20;
  }
  if (!v18) {
    goto LABEL_22;
  }
  if (self) {
    long long v35 = self->super.super._signpost;
  }
  else {
    long long v35 = 0;
  }
  long long v36 = v35;
  uint64_t v24 = objc_msgSend_log(v36, v37, v38, v39);

  if (self) {
    v40 = self->super.super._signpost;
  }
  else {
    v40 = 0;
  }
  v41 = v40;
  uint64_t v45 = objc_msgSend_identifier(v41, v42, v43, v44);

  if ((unint64_t)(v45 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_DWORD *)buf = 138412546;
    id v168 = v10;
    __int16 v169 = 2112;
    id v170 = v12;
    int v31 = "Record %@ published asset for %@";
    v32 = v24;
    os_signpost_id_t v33 = v45;
    uint32_t v34 = 22;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18AF10000, v32, OS_SIGNPOST_EVENT, v33, "CKPublishAssetsOperation", v31, buf, v34);
  }
LABEL_21:

LABEL_22:
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v46 = (void *)ck_log_facility_ck;
  if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    if (!v16) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  v142 = v46;
  v146 = objc_msgSend_operationID(self, v143, v144, v145);
  *(_DWORD *)buf = 138544386;
  id v168 = v146;
  __int16 v169 = 2112;
  id v170 = v10;
  __int16 v171 = 2112;
  id v172 = v11;
  __int16 v173 = 2114;
  id v174 = v12;
  __int16 v175 = 2112;
  v176 = v16;
  _os_log_debug_impl(&dword_18AF10000, v142, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received callback: %@ %@ %{public}@ %@", buf, 0x34u);

  if (v16)
  {
LABEL_26:
    v50 = objc_msgSend_perItemErrorsByRecordID(self, v47, v48, v49);
    objc_msgSend_setObject_forKeyedSubscript_(v50, v51, (uint64_t)v16, (uint64_t)v10);
  }
LABEL_27:
  if ((objc_msgSend_URLOptions(self, v47, v48, v49) & 2) != 0)
  {
    v60 = objc_msgSend_fileNamesByAssetFieldNames(self, v52, v53, v54);
    objc_msgSend_objectForKeyedSubscript_(v60, v61, (uint64_t)v12, v62);
    v59 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();

    v66 = objc_msgSend_downloadBaseURL(v11, v63, v64, v65);
    v68 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v66, v67, @"${f}", (uint64_t)v59);

    v71 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v69, (uint64_t)v68, v70);
    uint64_t v75 = objc_msgSend_assetPublishedBlock(self, v72, v73, v74);
    v77 = (void (**)(void, void, void, void, void))v75;
    if (v71)
    {
      v157 = (void (**)(void, void, void, void, void))v75;
      uint64_t v158 = (uint64_t)v71;
      v159 = v68;
      if (_os_feature_enabled_impl())
      {
        v147 = v16;
        id v148 = v12;
        id v149 = v10;
        v156 = objc_msgSend_contentBaseURL(v11, v78, v79, v80);
        v155 = objc_msgSend_owner(v11, v81, v82, v83);
        v154 = objc_msgSend_authToken(v11, v84, v85, v86);
        v153 = objc_msgSend_requestor(v11, v87, v88, v89);
        v152 = objc_msgSend_signature(v11, v90, v91, v92);
        v96 = objc_msgSend_referenceSignature(v11, v93, v94, v95);
        uint64_t v100 = objc_msgSend_size(v11, v97, v98, v99);
        v151 = objc_msgSend_assetKey(v11, v101, v102, v103);
        v150 = objc_msgSend_pathExtension(v59, v104, v105, v106);
        v110 = objc_msgSend_configuration(self, v107, v108, v109);
        v114 = objc_msgSend_container(v110, v111, v112, v113);
        v118 = objc_msgSend_containerIdentifier(v114, v115, v116, v117);
        id v160 = 0;
        v120 = objc_msgSend_makeAssetStreamHandleWithPartition_owner_accessToken_requestorID_signature_referenceSignature_size_assetKey_filenameExtension_applicationID_error_(_TtC8CloudKit28CloudAssetsAssetStreamHandle, v119, (uint64_t)v156, (uint64_t)v155, v154, v153, v152, v96, v100, v151, v150, v118, &v160);
        v121 = v160;

        v122 = [CKMediaItemMaker alloc];
        v125 = objc_msgSend_initWithCloudAssetsAssetStreamHandle_(v122, v123, (uint64_t)v120, v124);
        objc_msgSend_setMediaItemMaker_(v11, v126, (uint64_t)v125, v127);

        v77 = v157;
        id v12 = v148;
        id v10 = v149;
        if (v157) {
          ((void (**)(void, id, id, id, NSObject *))v157)[2](v157, v149, v148, v11, v121);
        }
        v68 = v159;
        uint64_t v16 = v147;
      }
      else
      {
        dispatch_semaphore_t v132 = dispatch_semaphore_create(0);
        v136 = objc_msgSend_assetKey(v11, v133, v134, v135);
        v140 = objc_msgSend_pathExtension(v59, v137, v138, v139);
        v161[0] = MEMORY[0x1E4F143A8];
        v161[1] = 3221225472;
        v161[2] = sub_18B084E00;
        v161[3] = &unk_1E5463008;
        id v162 = v11;
        v77 = v157;
        v166 = v157;
        id v163 = v10;
        id v164 = v12;
        dispatch_semaphore_t v165 = v132;
        v121 = v132;
        v71 = (void *)v158;
        objc_msgSend_makeAssetStreamHandleFrom_with_for_completionHandler_(_TtC8CloudKit17AssetStreamHandle, v141, v158, (uint64_t)v136, v140, v161);

        dispatch_semaphore_wait(v121, 0xFFFFFFFFFFFFFFFFLL);
        v120 = v162;
        v68 = v159;
      }
    }
    else
    {
      v128 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v76, @"CKInternalErrorDomain", 2000, @"server returned an invalid nil url for metadata of the asset");
      v121 = v128;
      if (!self->_assetPublishedBlock)
      {
LABEL_41:

        goto LABEL_42;
      }
      v120 = objc_msgSend_CKClientSuitableError(v128, v129, v130, v131);
      ((void (**)(void, void, void, void, void *))v77)[2](v77, 0, 0, 0, v120);
    }

    goto LABEL_41;
  }
  v55 = objc_msgSend_assetPublishedBlock(self, v52, v53, v54);

  if (v55)
  {
    objc_msgSend_assetPublishedBlock(self, v56, v57, v58);
    v59 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, id, id, void *))v59)[2](v59, v10, v12, v11, v16);
LABEL_42:
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  BOOL v6 = signpost;

  if (v6)
  {
    if (self) {
      id v10 = self->super.super._signpost;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
    uint64_t v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      uint64_t v16 = self->super.super._signpost;
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKPublishAssetsOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    uint64_t v22 = objc_msgSend_perItemErrorsByRecordID(self, v7, v8, v9);
    uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      uint64_t v27 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
      int v31 = objc_msgSend_perItemErrorsByRecordID(self, v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, @"CKPartialErrors");

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, @"CKInternalErrorDomain", 1011, v27, @"Failed to publish assets for some records");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  uint32_t v34 = objc_msgSend_publishAssetCompletionBlock(self, v7, v8, v9);

  if (v34)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    long long v37 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v48 = v37;
      uint64_t v49 = (objc_class *)objc_opt_class();
      v50 = NSStringFromClass(v49);
      uint64_t v54 = objc_msgSend_ckShortDescription(self, v51, v52, v53);
      *(_DWORD *)buf = 138544130;
      uint64_t v57 = v50;
      __int16 v58 = 2048;
      v59 = self;
      __int16 v60 = 2114;
      v61 = v54;
      __int16 v62 = 2112;
      id v63 = v4;
      _os_log_debug_impl(&dword_18AF10000, v48, OS_LOG_TYPE_DEBUG, "Calling publishAssetCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);
    }
    objc_msgSend_publishAssetCompletionBlock(self, v38, v39, v40);
    v41 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v45 = objc_msgSend_CKClientSuitableError(v4, v42, v43, v44);
    ((void (**)(void, void *))v41)[2](v41, v45);

    objc_msgSend_setPublishAssetCompletionBlock_(self, v46, 0, v47);
  }
  objc_msgSend_setAssetPublishedBlock_(self, v35, 0, v36);
  v55.receiver = self;
  v55.super_class = (Class)CKPublishAssetsOperation;
  [(CKOperation *)&v55 _finishOnCallbackQueueWithError:v4];
}

- (void)ckSignpostBegin
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  id v4 = signpost;

  if (v4)
  {
    if (self) {
      uint64_t v5 = self->super.super._signpost;
    }
    else {
      uint64_t v5 = 0;
    }
    BOOL v6 = v5;
    id v10 = objc_msgSend_log(v6, v7, v8, v9);

    if (self) {
      id v11 = self->super.super._signpost;
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
      uint64_t v28 = objc_msgSend_group(self, v25, v26, v27);
      v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      uint64_t v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      uint64_t v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      objc_super v55 = v20;
      __int16 v56 = 2112;
      uint64_t v57 = v24;
      __int16 v58 = 2112;
      v59 = v32;
      __int16 v60 = 2114;
      v61 = v36;
      __int16 v62 = 2114;
      id v63 = v45;
      __int16 v64 = 2114;
      uint64_t v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKPublishAssetsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
    }
  }
}

- (void)ckSignpostEndWithError:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  BOOL v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v7 = self->super.super._signpost;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = v7;
    id v12 = objc_msgSend_log(v8, v9, v10, v11);

    if (self) {
      uint64_t v13 = self->super.super._signpost;
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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKPublishAssetsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/publish-assets", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleAssetPublishCompletionForRecordID_publishedAsset_recordKey_error_, 3, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKPublishAssetsOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSDictionary)fileNamesByAssetFieldNames
{
  return self->_fileNamesByAssetFieldNames;
}

- (void)setFileNamesByAssetFieldNames:(id)a3
{
}

- (unint64_t)requestedTTL
{
  return self->_requestedTTL;
}

- (void)setRequestedTTL:(unint64_t)a3
{
  self->_requestedTTL = a3;
}

- (unint64_t)URLOptions
{
  return self->_URLOptions;
}

- (void)setURLOptions:(unint64_t)a3
{
  self->_URLOptions = a3;
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
}

- (NSMutableDictionary)perItemErrorsByRecordID
{
  return self->_perItemErrorsByRecordID;
}

- (void)setPerItemErrorsByRecordID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perItemErrorsByRecordID, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_fileNamesByAssetFieldNames, 0);
  objc_storeStrong(&self->_publishAssetCompletionBlock, 0);

  objc_storeStrong(&self->_assetPublishedBlock, 0);
}

@end