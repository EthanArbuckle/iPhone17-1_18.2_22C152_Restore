@interface CKRepairAssetsOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKRepairAssetsOperation)initWithAssets:(id)a3 packages:(id)a4 assetMetadata:(id)a5 packageMetadata:(id)a6 unavailableAssets:(id)a7 unavailablePackages:(id)a8;
- (CKUploadRequestConfiguration)resolvedUploadRequestConfiguration;
- (CKUploadRequestConfiguration)uploadRequestConfiguration;
- (NSArray)assetMetadata;
- (NSArray)assets;
- (NSArray)packageMetadata;
- (NSArray)packages;
- (NSArray)unavailableAssets;
- (NSArray)unavailablePackages;
- (NSMutableDictionary)perItemErrorsByRecordID;
- (id)activityCreate;
- (id)includedMetadata;
- (id)repairAssetsCompletionBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)ckSignpostBegin;
- (void)ckSignpostEndWithError:(id)a3;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleAssetRepairCompletionForRecordID:(id)a3 error:(id)a4;
- (void)performCKOperation;
- (void)setAssetMetadata:(id)a3;
- (void)setAssets:(id)a3;
- (void)setPackageMetadata:(id)a3;
- (void)setPackages:(id)a3;
- (void)setPerItemErrorsByRecordID:(id)a3;
- (void)setRepairAssetsCompletionBlock:(id)a3;
- (void)setUnavailableAssets:(id)a3;
- (void)setUnavailablePackages:(id)a3;
- (void)setUploadRequestConfiguration:(id)a3;
@end

@implementation CKRepairAssetsOperation

- (CKRepairAssetsOperation)initWithAssets:(id)a3 packages:(id)a4 assetMetadata:(id)a5 packageMetadata:(id)a6 unavailableAssets:(id)a7 unavailablePackages:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  uint64_t v24 = objc_msgSend_count(v15, v21, v22, v23);
  if (v24 != objc_msgSend_count(v17, v25, v26, v27))
  {
    v72 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v28, v29, v30);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v72, v73, (uint64_t)a2, (uint64_t)self, @"CKRepairAssetsOperation.m", 44, @"Asset and asset metadata counts need to match");
  }
  uint64_t v31 = objc_msgSend_count(v16, v28, v29, v30);
  if (v31 != objc_msgSend_count(v18, v32, v33, v34))
  {
    v74 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v35, v36, v37);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v74, v75, (uint64_t)a2, (uint64_t)self, @"CKRepairAssetsOperation.m", 45, @"Package and package metadata counts need to match");
  }
  v76.receiver = self;
  v76.super_class = (Class)CKRepairAssetsOperation;
  v41 = [(CKOperation *)&v76 init];
  if (v41)
  {
    uint64_t v42 = objc_msgSend_copy(v15, v38, v39, v40);
    assets = v41->_assets;
    v41->_assets = (NSArray *)v42;

    uint64_t v47 = objc_msgSend_copy(v16, v44, v45, v46);
    packages = v41->_packages;
    v41->_packages = (NSArray *)v47;

    uint64_t v52 = objc_msgSend_copy(v17, v49, v50, v51);
    assetMetadata = v41->_assetMetadata;
    v41->_assetMetadata = (NSArray *)v52;

    uint64_t v57 = objc_msgSend_copy(v18, v54, v55, v56);
    packageMetadata = v41->_packageMetadata;
    v41->_packageMetadata = (NSArray *)v57;

    uint64_t v62 = objc_msgSend_copy(v19, v59, v60, v61);
    unavailableAssets = v41->_unavailableAssets;
    v41->_unavailableAssets = (NSArray *)v62;

    uint64_t v67 = objc_msgSend_copy(v20, v64, v65, v66);
    unavailablePackages = v41->_unavailablePackages;
    v41->_unavailablePackages = (NSArray *)v67;

    uint64_t v69 = objc_opt_new();
    perItemErrorsByRecordID = v41->_perItemErrorsByRecordID;
    v41->_perItemErrorsByRecordID = (NSMutableDictionary *)v69;
  }
  return v41;
}

- (CKUploadRequestConfiguration)resolvedUploadRequestConfiguration
{
  v5 = objc_msgSend_database(self, a2, v2, v3);
  v9 = objc_msgSend_container(v5, v6, v7, v8);
  v13 = objc_msgSend_uploadRequestConfiguration(self, v10, v11, v12);
  id v15 = objc_msgSend_resolvedConfigurationWithBaseContainer_overrides_(CKUploadRequestConfiguration, v14, (uint64_t)v9, (uint64_t)v13);

  return (CKUploadRequestConfiguration *)v15;
}

- (void)setRepairAssetsCompletionBlock:(id)a3
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
    v14[2] = sub_18B0042A8;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id repairAssetsCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_repairAssetsCompletionBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id repairAssetsCompletionBlock = self->_repairAssetsCompletionBlock;
    self->_id repairAssetsCompletionBlock = v11;
LABEL_9:
  }
}

- (id)repairAssetsCompletionBlock
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
    id v15 = sub_18AF13A4C;
    id v16 = sub_18AF13810;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0044A0;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    uint64_t v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v8 = _Block_copy(self->_repairAssetsCompletionBlock);
  }

  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_assets(self, v5, v6, v7);
  objc_msgSend_setAssets_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_packages(self, v11, v12, v13);
  objc_msgSend_setPackages_(v4, v15, (uint64_t)v14, v16);

  id v20 = objc_msgSend_assetMetadata(self, v17, v18, v19);
  objc_msgSend_setAssetMetadata_(v4, v21, (uint64_t)v20, v22);

  uint64_t v26 = objc_msgSend_packageMetadata(self, v23, v24, v25);
  objc_msgSend_setPackageMetadata_(v4, v27, (uint64_t)v26, v28);

  v32 = objc_msgSend_unavailableAssets(self, v29, v30, v31);
  objc_msgSend_setUnavailableAssets_(v4, v33, (uint64_t)v32, v34);

  v38 = objc_msgSend_unavailablePackages(self, v35, v36, v37);
  objc_msgSend_setUnavailablePackages_(v4, v39, (uint64_t)v38, v40);

  v44 = objc_msgSend_resolvedUploadRequestConfiguration(self, v41, v42, v43);
  objc_msgSend_setUploadRequestConfiguration_(v4, v45, (uint64_t)v44, v46);

  v47.receiver = self;
  v47.super_class = (Class)CKRepairAssetsOperation;
  [(CKDatabaseOperation *)&v47 fillOutOperationInfo:v4];
}

- (void)fillFromOperationInfo:(id)a3
{
  v47.receiver = self;
  v47.super_class = (Class)CKRepairAssetsOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v47 fillFromOperationInfo:v4];
  uint64_t v8 = objc_msgSend_assets(v4, v5, v6, v7, v47.receiver, v47.super_class);
  objc_msgSend_setAssets_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_packages(v4, v11, v12, v13);
  objc_msgSend_setPackages_(self, v15, (uint64_t)v14, v16);

  id v20 = objc_msgSend_assetMetadata(v4, v17, v18, v19);
  objc_msgSend_setAssetMetadata_(self, v21, (uint64_t)v20, v22);

  uint64_t v26 = objc_msgSend_packageMetadata(v4, v23, v24, v25);
  objc_msgSend_setPackageMetadata_(self, v27, (uint64_t)v26, v28);

  v32 = objc_msgSend_unavailableAssets(v4, v29, v30, v31);
  objc_msgSend_setUnavailableAssets_(self, v33, (uint64_t)v32, v34);

  v38 = objc_msgSend_unavailablePackages(v4, v35, v36, v37);
  objc_msgSend_setUnavailablePackages_(self, v39, (uint64_t)v38, v40);

  v44 = objc_msgSend_uploadRequestConfiguration(v4, v41, v42, v43);

  objc_msgSend_setUploadRequestConfiguration_(self, v45, (uint64_t)v44, v46);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v9.receiver = self;
  v9.super_class = (Class)CKRepairAssetsOperation;
  if ([(CKOperation *)&v9 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v7 = objc_msgSend_repairAssetsCompletionBlock(self, v3, v4, v5);
  BOOL v6 = v7 != 0;

  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend_assets(self, a2, (uint64_t)a3, v3);
  if (objc_msgSend_count(v6, v7, v8, v9)) {
    goto LABEL_6;
  }
  uint64_t v13 = objc_msgSend_packages(self, v10, v11, v12);
  if (objc_msgSend_count(v13, v14, v15, v16))
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  id v20 = objc_msgSend_unavailableAssets(self, v17, v18, v19);
  if (objc_msgSend_count(v20, v21, v22, v23))
  {

    goto LABEL_5;
  }
  v125 = objc_msgSend_unavailablePackages(self, v24, v25, v26);
  uint64_t v129 = objc_msgSend_count(v125, v126, v127, v128);

  if (!v129) {
    return 0;
  }
LABEL_7:
  uint64_t v30 = objc_msgSend_database(self, v27, v28, v29);
  uint64_t v34 = objc_msgSend_scope(v30, v31, v32, v33);

  if (v34 != 2)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v35, @"CKInternalErrorDomain", 1019, @"This operation should only be called on the private database");
      id v67 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a3 = v67;
      return result;
    }
    return 0;
  }
  v38 = objc_msgSend_assets(self, v35, v36, v37);
  uint64_t v39 = (objc_class *)objc_opt_class();
  uint64_t v40 = sub_18B004E70(v38, v39);

  if (!v40)
  {
    v44 = objc_msgSend_packages(self, v41, v42, v43);
    uint64_t v45 = (objc_class *)objc_opt_class();
    uint64_t v40 = sub_18B004E70(v44, v45);

    if (!v40)
    {
      v49 = objc_msgSend_assetMetadata(self, v46, v47, v48);
      uint64_t v50 = (objc_class *)objc_opt_class();
      uint64_t v40 = sub_18B004E70(v49, v50);

      if (!v40)
      {
        v54 = objc_msgSend_packageMetadata(self, v51, v52, v53);
        uint64_t v55 = (objc_class *)objc_opt_class();
        uint64_t v40 = sub_18B004E70(v54, v55);

        if (!v40)
        {
          v59 = objc_msgSend_unavailableAssets(self, v56, v57, v58);
          uint64_t v60 = (objc_class *)objc_opt_class();
          uint64_t v40 = sub_18B004E70(v59, v60);

          if (!v40)
          {
            v64 = objc_msgSend_unavailablePackages(self, v61, v62, v63);
            uint64_t v65 = (objc_class *)objc_opt_class();
            uint64_t v40 = sub_18B004E70(v64, v65);
          }
        }
      }
    }
  }
  if (a3 && v40)
  {
    id v66 = v40;
    *a3 = v66;

    return 0;
  }

  if (v40) {
    return 0;
  }
  uint64_t v69 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18B004FF8;
  aBlock[3] = &unk_1E545FFE8;
  id v145 = v69;
  id v70 = v69;
  v71 = (void (**)(void *, void *))_Block_copy(aBlock);
  v75 = objc_msgSend_assetMetadata(self, v72, v73, v74);
  objc_super v76 = v71[2](v71, v75);

  if (!v76)
  {
    v80 = objc_msgSend_packageMetadata(self, v77, v78, v79);
    objc_super v76 = v71[2](v71, v80);

    if (!v76)
    {
      v84 = objc_msgSend_unavailableAssets(self, v81, v82, v83);
      objc_super v76 = v71[2](v71, v84);

      if (!v76)
      {
        v88 = objc_msgSend_unavailablePackages(self, v85, v86, v87);
        objc_super v76 = v71[2](v71, v88);
      }
    }
  }
  if (a3 && v76) {
    *a3 = v76;
  }

  if (v76) {
    return 0;
  }
  uint64_t v140 = 0;
  v141 = &v140;
  uint64_t v142 = 0x2020000000;
  char v143 = 0;
  v92 = objc_msgSend_assets(self, v89, v90, v91);
  v137[0] = MEMORY[0x1E4F143A8];
  v137[1] = 3221225472;
  v137[2] = sub_18B0054F8;
  v137[3] = &unk_1E5460030;
  id v138 = &unk_1ED7F0098;
  v139 = &v140;
  objc_msgSend_enumerateObjectsUsingBlock_(v92, v93, (uint64_t)v137, v94);

  int v96 = *((unsigned __int8 *)v141 + 24);
  if (*((unsigned char *)v141 + 24)) {
    BOOL v97 = a3 == 0;
  }
  else {
    BOOL v97 = 1;
  }
  if (!v97)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v95, @"CKInternalErrorDomain", 10005, @"Cannot repair asset with zero-length replacement");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v140, 8);
  if (v96) {
    return 0;
  }
  v101 = objc_msgSend_packages(self, v98, v99, v100);

  if (v101)
  {
    v105 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v102, v103, v104);
    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    v109 = objc_msgSend_packages(self, v106, v107, v108);
    uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v109, v110, (uint64_t)&v133, (uint64_t)v146, 16);
    if (v112)
    {
      uint64_t v113 = *(void *)v134;
      while (2)
      {
        for (uint64_t i = 0; i != v112; ++i)
        {
          if (*(void *)v134 != v113) {
            objc_enumerationMutation(v109);
          }
          uint64_t v115 = *(void *)(*((void *)&v133 + 1) + 8 * i);
          id v132 = 0;
          v116 = objc_msgSend_packageWithPackage_error_(CKPackage, v111, v115, (uint64_t)&v132);
          id v117 = v132;
          if (v117)
          {
            v130 = v117;
            objc_msgSend_removeDB(v116, v118, v119, v120);
            if (a3) {
              *a3 = v130;
            }

            return 0;
          }
          objc_msgSend_close(v116, v118, v119, v120);
          objc_msgSend_addObject_(v105, v121, (uint64_t)v116, v122);
        }
        uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v109, v111, (uint64_t)&v133, (uint64_t)v146, 16);
        if (v112) {
          continue;
        }
        break;
      }
    }

    objc_msgSend_setPackages_(self, v123, (uint64_t)v105, v124);
  }
  v131.receiver = self;
  v131.super_class = (Class)CKRepairAssetsOperation;
  return [(CKDatabaseOperation *)&v131 CKOperationShouldRun:a3];
}

+ (SEL)daemonInvocationSelector
{
  return sel_performRepairAssetsOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v5 = objc_msgSend_assets(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_packages(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_arrayByAddingObjectsFromArray_(v5, v10, (uint64_t)v9, v11);

  uint64_t v16 = objc_msgSend_deviceContext(self, v13, v14, v15);
  id v20 = objc_msgSend_deviceScopedStateManager(v16, v17, v18, v19);
  objc_msgSend_trackAssets_(v20, v21, (uint64_t)v12, v22);

  v23.receiver = self;
  v23.super_class = (Class)CKRepairAssetsOperation;
  [(CKOperation *)&v23 performCKOperation];
}

- (void)handleAssetRepairCompletionForRecordID:(id)a3 error:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v11 = (void *)ck_log_facility_data_repair;
  if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
  {
    id v17 = v11;
    v21 = objc_msgSend_operationID(self, v18, v19, v20);
    int v22 = 138543874;
    objc_super v23 = v21;
    __int16 v24 = 2112;
    id v25 = v6;
    __int16 v26 = 2112;
    uint64_t v27 = v10;
    _os_log_debug_impl(&dword_18AF10000, v17, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received progress callback for recordID %@ error %@", (uint8_t *)&v22, 0x20u);

    if (!v10) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v10)
  {
LABEL_5:
    uint64_t v15 = objc_msgSend_perItemErrorsByRecordID(self, v12, v13, v14);
    objc_msgSend_setObject_forKeyedSubscript_(v15, v16, (uint64_t)v10, (uint64_t)v6);
  }
LABEL_6:
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    signpost = self->super.super._signpost;
  }
  else {
    signpost = 0;
  }
  id v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v10 = self->super.super._signpost;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = v10;
    uint64_t v15 = objc_msgSend_log(v11, v12, v13, v14);

    if (self) {
      uint64_t v16 = self->super.super._signpost;
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = v16;
    os_signpost_id_t v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v15, OS_SIGNPOST_EVENT, v21, "CKRepairAssetsOperation", "Finishing", buf, 2u);
    }
  }
  if (!v4)
  {
    int v22 = objc_msgSend_perItemErrorsByRecordID(self, v7, v8, v9);
    uint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      uint64_t v27 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
      uint64_t v31 = objc_msgSend_perItemErrorsByRecordID(self, v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, @"CKPartialErrors");

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, @"CKInternalErrorDomain", 1011, v27, @"Failed to repair some assets");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }
  uint64_t v34 = objc_msgSend_repairAssetsCompletionBlock(self, v7, v8, v9);

  if (v34)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v35 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v46 = v35;
      uint64_t v47 = (objc_class *)objc_opt_class();
      uint64_t v48 = NSStringFromClass(v47);
      uint64_t v52 = objc_msgSend_ckShortDescription(self, v49, v50, v51);
      *(_DWORD *)buf = 138544130;
      uint64_t v55 = v48;
      __int16 v56 = 2048;
      uint64_t v57 = self;
      __int16 v58 = 2114;
      v59 = v52;
      __int16 v60 = 2112;
      id v61 = v4;
      _os_log_debug_impl(&dword_18AF10000, v46, OS_LOG_TYPE_DEBUG, "Calling repairAssetsCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);
    }
    objc_msgSend_repairAssetsCompletionBlock(self, v36, v37, v38);
    uint64_t v39 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v43 = objc_msgSend_CKClientSuitableError(v4, v40, v41, v42);
    ((void (**)(void, void *))v39)[2](v39, v43);

    objc_msgSend_setRepairAssetsCompletionBlock_(self, v44, 0, v45);
  }
  v53.receiver = self;
  v53.super_class = (Class)CKRepairAssetsOperation;
  [(CKOperation *)&v53 _finishOnCallbackQueueWithError:v4];
}

- (id)includedMetadata
{
  uint64_t v5 = objc_msgSend_assetMetadata(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_packageMetadata(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_arrayByAddingObjectsFromArray_(v5, v10, (uint64_t)v9, v11);
  uint64_t v16 = objc_msgSend_unavailableAssets(self, v13, v14, v15);
  uint64_t v19 = objc_msgSend_arrayByAddingObjectsFromArray_(v12, v17, (uint64_t)v16, v18);
  objc_super v23 = objc_msgSend_unavailablePackages(self, v20, v21, v22);
  uint64_t v26 = objc_msgSend_arrayByAddingObjectsFromArray_(v19, v24, (uint64_t)v23, v25);

  uint64_t v29 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v27, (uint64_t)v26, v28);

  return v29;
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
    id v6 = v5;
    uint64_t v10 = objc_msgSend_log(v6, v7, v8, v9);

    if (self) {
      uint64_t v11 = self->super.super._signpost;
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
      uint64_t v28 = objc_msgSend_group(self, v25, v26, v27);
      uint64_t v32 = objc_msgSend_operationGroupID(v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_operationGroupName(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_operationInfo(self, v37, v38, v39);
      unint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      uint64_t v45 = CKStringForDiscretionaryNetworkBehavior(v44);
      uint64_t v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      objc_super v53 = CKStringForQOS(v49, v50, v51, v52);
      int v54 = 138413570;
      uint64_t v55 = v20;
      __int16 v56 = 2112;
      uint64_t v57 = v24;
      __int16 v58 = 2112;
      v59 = v32;
      __int16 v60 = 2114;
      id v61 = v36;
      __int16 v62 = 2114;
      uint64_t v63 = v45;
      __int16 v64 = 2114;
      uint64_t v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKRepairAssetsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);
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
  id v6 = signpost;

  if (v6)
  {
    if (self) {
      uint64_t v7 = self->super.super._signpost;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = v7;
    uint64_t v12 = objc_msgSend_log(v8, v9, v10, v11);

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
      _os_signpost_emit_with_name_impl(&dword_18AF10000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKRepairAssetsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/repair-assets", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleAssetRepairCompletionForRecordID_error_, 1, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKRepairAssetsOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
}

- (NSArray)packages
{
  return self->_packages;
}

- (void)setPackages:(id)a3
{
}

- (NSArray)assetMetadata
{
  return self->_assetMetadata;
}

- (void)setAssetMetadata:(id)a3
{
}

- (NSArray)packageMetadata
{
  return self->_packageMetadata;
}

- (void)setPackageMetadata:(id)a3
{
}

- (NSArray)unavailableAssets
{
  return self->_unavailableAssets;
}

- (void)setUnavailableAssets:(id)a3
{
}

- (NSArray)unavailablePackages
{
  return self->_unavailablePackages;
}

- (void)setUnavailablePackages:(id)a3
{
}

- (NSMutableDictionary)perItemErrorsByRecordID
{
  return self->_perItemErrorsByRecordID;
}

- (void)setPerItemErrorsByRecordID:(id)a3
{
}

- (CKUploadRequestConfiguration)uploadRequestConfiguration
{
  return self->_uploadRequestConfiguration;
}

- (void)setUploadRequestConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadRequestConfiguration, 0);
  objc_storeStrong((id *)&self->_perItemErrorsByRecordID, 0);
  objc_storeStrong((id *)&self->_unavailablePackages, 0);
  objc_storeStrong((id *)&self->_unavailableAssets, 0);
  objc_storeStrong((id *)&self->_packageMetadata, 0);
  objc_storeStrong((id *)&self->_assetMetadata, 0);
  objc_storeStrong((id *)&self->_packages, 0);
  objc_storeStrong((id *)&self->_assets, 0);

  objc_storeStrong(&self->_repairAssetsCompletionBlock, 0);
}

@end