@interface CKDRepairAssetsOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)makeStateTransition;
- (CKDOperation)fetchOperation;
- (CKDOperation)updateOperation;
- (CKDOperation)uploadOperation;
- (CKDRepairAssetsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKUploadRequestConfiguration)uploadRequestConfiguration;
- (NSArray)unavailableAssetsAndPackages;
- (NSDictionary)UUIDToAssetOrPackage;
- (NSDictionary)assetOrPackageUUIDToMetadata;
- (NSDictionary)assetOrPackageUUIDToUploadError;
- (NSMutableDictionary)assetOrPackageUUIDToOriginalRecord;
- (NSSet)uploadedAssetOrPackageUUIDs;
- (id)activityCreate;
- (id)assetOrPackageForMetadata:(id)a3 inRecord:(id)a4;
- (id)assetOrPackageRepairedBlock;
- (id)repairContainer;
- (void)_fetchAssetMetadata;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_updateMissingAssetServerStatus;
- (void)_uploadAssetsModify;
- (void)main;
- (void)setAssetOrPackageRepairedBlock:(id)a3;
- (void)setAssetOrPackageUUIDToMetadata:(id)a3;
- (void)setAssetOrPackageUUIDToOriginalRecord:(id)a3;
- (void)setAssetOrPackageUUIDToUploadError:(id)a3;
- (void)setFetchOperation:(id)a3;
- (void)setUUIDToAssetOrPackage:(id)a3;
- (void)setUnavailableAssetsAndPackages:(id)a3;
- (void)setUpdateOperation:(id)a3;
- (void)setUploadOperation:(id)a3;
- (void)setUploadRequestConfiguration:(id)a3;
- (void)setUploadedAssetOrPackageUUIDs:(id)a3;
@end

@implementation CKDRepairAssetsOperation

- (CKDRepairAssetsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v121.receiver = self;
  v121.super_class = (Class)CKDRepairAssetsOperation;
  v9 = [(CKDDatabaseOperation *)&v121 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8);
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v11, v12);
    v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_assets(v6, v14, v15);
    uint64_t v19 = objc_msgSend_count(v16, v17, v18);

    if (v19)
    {
      unint64_t v22 = 0;
      do
      {
        v23 = objc_msgSend_assetMetadata(v6, v20, v21);
        v25 = objc_msgSend_objectAtIndexedSubscript_(v23, v24, v22);
        v28 = objc_msgSend_assets(v6, v26, v27);
        v30 = objc_msgSend_objectAtIndexedSubscript_(v28, v29, v22);
        v33 = objc_msgSend_UUID(v30, v31, v32);
        objc_msgSend_setObject_forKeyedSubscript_(v13, v34, (uint64_t)v25, v33);

        v37 = objc_msgSend_assets(v6, v35, v36);
        v39 = objc_msgSend_objectAtIndexedSubscript_(v37, v38, v22);
        v42 = objc_msgSend_assets(v6, v40, v41);
        v44 = objc_msgSend_objectAtIndexedSubscript_(v42, v43, v22);
        v47 = objc_msgSend_UUID(v44, v45, v46);
        objc_msgSend_setObject_forKeyedSubscript_(v10, v48, (uint64_t)v39, v47);

        ++v22;
        v51 = objc_msgSend_assets(v6, v49, v50);
        unint64_t v54 = objc_msgSend_count(v51, v52, v53);
      }
      while (v22 < v54);
    }
    v55 = objc_msgSend_packages(v6, v20, v21);
    uint64_t v58 = objc_msgSend_count(v55, v56, v57);

    if (v58)
    {
      unint64_t v61 = 0;
      do
      {
        v62 = objc_msgSend_packageMetadata(v6, v59, v60);
        v64 = objc_msgSend_objectAtIndexedSubscript_(v62, v63, v61);
        v67 = objc_msgSend_packages(v6, v65, v66);
        v69 = objc_msgSend_objectAtIndexedSubscript_(v67, v68, v61);
        v72 = objc_msgSend_UUID(v69, v70, v71);
        objc_msgSend_setObject_forKeyedSubscript_(v13, v73, (uint64_t)v64, v72);

        v76 = objc_msgSend_packages(v6, v74, v75);
        v78 = objc_msgSend_objectAtIndexedSubscript_(v76, v77, v61);
        v81 = objc_msgSend_packages(v6, v79, v80);
        v83 = objc_msgSend_objectAtIndexedSubscript_(v81, v82, v61);
        v86 = objc_msgSend_UUID(v83, v84, v85);
        objc_msgSend_setObject_forKeyedSubscript_(v10, v87, (uint64_t)v78, v86);

        ++v61;
        v90 = objc_msgSend_packages(v6, v88, v89);
        unint64_t v93 = objc_msgSend_count(v90, v91, v92);
      }
      while (v61 < v93);
    }
    assetOrPackageUUIDToMetadata = v9->_assetOrPackageUUIDToMetadata;
    v9->_assetOrPackageUUIDToMetadata = v13;
    v95 = v13;

    UUIDToAssetOrPackage = v9->_UUIDToAssetOrPackage;
    v9->_UUIDToAssetOrPackage = v10;
    v97 = v10;

    v100 = objc_msgSend_unavailableAssets(v6, v98, v99);
    v103 = objc_msgSend_unavailablePackages(v6, v101, v102);
    objc_msgSend_arrayByAddingObjectsFromArray_(v100, v104, (uint64_t)v103);
    v105 = (NSArray *)objc_claimAutoreleasedReturnValue();

    unavailableAssetsAndPackages = v9->_unavailableAssetsAndPackages;
    v9->_unavailableAssetsAndPackages = v105;
    v107 = v105;

    uint64_t v110 = objc_msgSend_uploadRequestConfiguration(v6, v108, v109);
    uploadRequestConfiguration = v9->_uploadRequestConfiguration;
    v9->_uploadRequestConfiguration = (CKUploadRequestConfiguration *)v110;

    uint64_t v114 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v112, v113);
    assetOrPackageUUIDToOriginalRecord = v9->_assetOrPackageUUIDToOriginalRecord;
    v9->_assetOrPackageUUIDToOriginalRecord = (NSMutableDictionary *)v114;

    uint64_t v118 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v116, v117);
    uploadedAssetOrPackageUUIDs = v9->_uploadedAssetOrPackageUUIDs;
    v9->_uploadedAssetOrPackageUUIDs = (NSSet *)v118;
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/repair-assets", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)makeStateTransition
{
  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend__fetchAssetMetadata(self, v5, v6);
      break;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend__uploadAssetsModify(self, v7, v8);
      break;
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend__updateMissingAssetServerStatus(self, v9, v10);
      break;
    case 4:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      v13 = objc_msgSend_error(self, v11, v12);
      objc_msgSend_finishWithError_(self, v14, (uint64_t)v13);

      break;
    default:
      return 1;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 3)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDRepairAssetsOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F8A30[a3 - 2];
  }
  return v3;
}

- (void)_fetchAssetMetadata
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = sub_1C502C174;
  v43 = sub_1C502C184;
  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v6 = objc_msgSend_assetOrPackageUUIDToMetadata(self, v4, v5);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v35, v45, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v36;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v35 + 1) + 8 * v12);
        v14 = (void *)v40[5];
        uint64_t v15 = objc_msgSend_assetOrPackageUUIDToMetadata(self, v8, v9);
        v17 = objc_msgSend_objectForKeyedSubscript_(v15, v16, v13);
        v20 = objc_msgSend_recordID(v17, v18, v19);
        objc_msgSend_setObject_forKeyedSubscript_(v14, v21, v13, v20);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v35, v45, 16);
    }
    while (v10);
  }

  unint64_t v22 = objc_opt_new();
  v25 = objc_msgSend_allKeys((void *)v40[5], v23, v24);
  objc_msgSend_setRecordIDs_(v22, v26, (uint64_t)v25);

  objc_msgSend_setShouldFetchAssetContent_(v22, v27, 0);
  v30 = objc_msgSend_stateTransitionGroup(self, v28, v29);
  dispatch_group_enter(v30);

  uint64_t v31 = objc_opt_class();
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1C502C18C;
  v34[3] = &unk_1E64F89C0;
  v34[4] = self;
  v34[5] = &v39;
  v34[6] = a2;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v32, v31, v22, v34);

  _Block_object_dispose(&v39, 8);
}

- (void)_uploadAssetsModify
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  v128 = objc_opt_new();
  v135 = objc_opt_new();
  v130 = objc_opt_new();
  v138 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v3, v4);
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  v7 = objc_msgSend_assetOrPackageUUIDToMetadata(self, v5, v6);
  uint64_t v10 = objc_msgSend_keyEnumerator(v7, v8, v9);

  id obj = v10;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v147, v153, 16);
  if (v12)
  {
    uint64_t v15 = v12;
    v16 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
    uint64_t v17 = *(void *)v148;
    uint64_t v18 = (os_log_t *)MEMORY[0x1E4F1A508];
    uint64_t v136 = *(void *)v148;
    v137 = self;
    do
    {
      uint64_t v19 = 0;
      uint64_t v139 = v15;
      do
      {
        if (*(void *)v148 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v147 + 1) + 8 * v19);
        uint64_t v21 = objc_msgSend_UUIDToAssetOrPackage(self, v13, v14, v128);
        v23 = objc_msgSend_objectForKeyedSubscript_(v21, v22, v20);

        v26 = objc_msgSend_assetOrPackageUUIDToMetadata(self, v24, v25);
        v28 = objc_msgSend_objectForKeyedSubscript_(v26, v27, v20);

        uint64_t v31 = objc_msgSend_assetOrPackageUUIDToOriginalRecord(self, v29, v30);
        uint64_t v142 = v20;
        uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v31, v32, v20);

        v143 = (void *)v33;
        if (v33)
        {
          long long v35 = objc_msgSend_assetOrPackageForMetadata_inRecord_(self, v34, (uint64_t)v28, v33);
          if (v35)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v36 = (objc_class *)MEMORY[0x1E4F19E80];
              id v37 = v28;
              id v38 = v35;
              id v39 = v23;
              id v40 = [v36 alloc];
              v43 = objc_msgSend_fileSignature(v37, v41, v42);
              objc_msgSend_referenceSignature(v37, v44, v45);
              v47 = uint64_t v46 = v35;

              uint64_t v50 = objc_msgSend_assetKey(v38, v48, v49);

              v52 = objc_msgSend_initWithFileSignature_referenceSignature_assetKey_(v40, v51, (uint64_t)v43, v47, v50);
              long long v35 = v46;
              self = v137;

              uint64_t v15 = v139;
              v55 = objc_msgSend_UUID(v39, v53, v54);
              objc_msgSend_setObject_forKeyedSubscript_(v135, v56, (uint64_t)v52, v55);

              objc_msgSend_setRecordID_(v39, v57, 0);
              id v58 = objc_alloc(MEMORY[0x1E4F1A2D8]);
              id v59 = objc_alloc(MEMORY[0x1E4F1A2F8]);
              unint64_t v61 = objc_msgSend_initWithRecordName_(v59, v60, v142);
              v63 = objc_msgSend_initWithRecordType_recordID_(v58, v62, @"asset", v61);

              v16 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
              objc_msgSend_setObject_forKeyedSubscript_(v63, v64, (uint64_t)v39, @"payload");

              uint64_t v17 = v136;
              objc_msgSend_addObject_(v138, v65, (uint64_t)v63);

              uint64_t v18 = (os_log_t *)MEMORY[0x1E4F1A508];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v133 = v23;
                uint64_t v134 = v19;
                id v131 = v23;
                v132 = v35;
                id v68 = v35;
                v141 = v28;
                id v69 = v28;
                v70 = objc_opt_new();
                v73 = objc_msgSend_assets(v68, v71, v72);
                uint64_t v76 = objc_msgSend_count(v73, v74, v75);

                unint64_t v79 = 0x1E4F19000uLL;
                if (v76)
                {
                  unint64_t v80 = 0;
                  id v144 = v69;
                  do
                  {
                    id v81 = objc_alloc(*(Class *)(v79 + 3712));
                    v145 = objc_msgSend_fileSignatures(v69, v82, v83);
                    uint64_t v85 = objc_msgSend_objectAtIndexedSubscript_(v145, v84, v80);
                    v88 = objc_msgSend_referenceSignatures(v69, v86, v87);
                    v90 = objc_msgSend_objectAtIndexedSubscript_(v88, v89, v80);
                    objc_msgSend_assets(v68, v91, v92);
                    v94 = unint64_t v93 = v70;
                    v96 = objc_msgSend_objectAtIndexedSubscript_(v94, v95, v80);
                    uint64_t v99 = objc_msgSend_assetKey(v96, v97, v98);
                    v101 = objc_msgSend_initWithFileSignature_referenceSignature_assetKey_(v81, v100, (uint64_t)v85, v90, v99);

                    v70 = v93;
                    id v69 = v144;

                    objc_msgSend_addObject_(v93, v102, (uint64_t)v101);
                    ++v80;
                    v105 = objc_msgSend_assets(v68, v103, v104);
                    unint64_t v108 = objc_msgSend_count(v105, v106, v107);

                    unint64_t v79 = 0x1E4F19000;
                  }
                  while (v80 < v108);
                }
                uint64_t v109 = objc_msgSend_UUID(v131, v77, v78);
                objc_msgSend_setObject_forKey_(v130, v110, (uint64_t)v70, v109);

                id v111 = objc_alloc(MEMORY[0x1E4F1A2D8]);
                id v112 = objc_alloc(MEMORY[0x1E4F1A2F8]);
                uint64_t v114 = objc_msgSend_initWithRecordName_(v112, v113, v142);
                v116 = objc_msgSend_initWithRecordType_recordID_(v111, v115, @"package", v114);

                objc_msgSend_setObject_forKeyedSubscript_(v116, v117, (uint64_t)v131, @"payload");
                objc_msgSend_addObject_(v138, v118, (uint64_t)v116);

                uint64_t v17 = v136;
                self = v137;
                v16 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
                uint64_t v18 = (os_log_t *)MEMORY[0x1E4F1A508];
                uint64_t v15 = v139;
                v23 = v133;
                uint64_t v19 = v134;
                v28 = v141;
                long long v35 = v132;
              }
            }
          }
          else
          {
            if (*v16 != -1) {
              dispatch_once(v16, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v67 = *v18;
            if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v152 = v23;
              _os_log_error_impl(&dword_1C4CFF000, v67, OS_LOG_TYPE_ERROR, "Could not find original asset or package for asset or package %@", buf, 0xCu);
            }
          }
        }
        else
        {
          if (*v16 != -1) {
            dispatch_once(v16, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v66 = *v18;
          if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v152 = v23;
            _os_log_error_impl(&dword_1C4CFF000, v66, OS_LOG_TYPE_ERROR, "Could not find original record for asset or package %@", buf, 0xCu);
          }
        }

        ++v19;
      }
      while (v19 != v15);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v147, v153, 16);
    }
    while (v15);
  }

  objc_msgSend_setAssetUUIDToExpectedProperties_(v128, v119, (uint64_t)v135);
  objc_msgSend_setPackageUUIDToExpectedProperties_(v128, v120, (uint64_t)v130);
  objc_msgSend_setShouldOnlySaveAssetContent_(v128, v121, 1);
  objc_msgSend_setRecordsToSave_(v128, v122, (uint64_t)v138);

  v125 = objc_msgSend_stateTransitionGroup(self, v123, v124);
  dispatch_group_enter(v125);

  uint64_t v126 = objc_opt_class();
  v146[0] = MEMORY[0x1E4F143A8];
  v146[1] = 3221225472;
  v146[2] = sub_1C502D0A0;
  v146[3] = &unk_1E64F7850;
  v146[4] = self;
  v146[5] = a2;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v127, v126, v128, v146);
}

- (void)_updateMissingAssetServerStatus
{
  uint64_t v216 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  v184 = objc_opt_new();
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  v7 = objc_msgSend_uploadedAssetOrPackageUUIDs(self, v5, v6);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v198, v215, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v199;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v199 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void *)(*((void *)&v198 + 1) + 8 * i);
        v16 = objc_msgSend_assetOrPackageUUIDToMetadata(self, v10, v11);
        uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v16, v17, v15);

        uint64_t v21 = objc_msgSend_repairZoneRecordID(v18, v19, v20);
        objc_msgSend_addObject_(v3, v22, (uint64_t)v21);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v198, v215, 16);
    }
    while (v12);
  }
  v182 = v3;

  long long v196 = 0u;
  long long v197 = 0u;
  long long v194 = 0u;
  long long v195 = 0u;
  uint64_t v25 = objc_msgSend_assetOrPackageUUIDToUploadError(self, v23, v24);
  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v194, v214, 16);
  if (v27)
  {
    uint64_t v30 = v27;
    uint64_t v31 = *(void *)v195;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v195 != v31) {
          objc_enumerationMutation(v25);
        }
        uint64_t v33 = *(void *)(*((void *)&v194 + 1) + 8 * v32);
        v34 = objc_msgSend_assetOrPackageUUIDToUploadError(self, v28, v29);
        long long v36 = objc_msgSend_objectForKeyedSubscript_(v34, v35, v33);

        if (objc_msgSend_repairErrorShouldBeMarkedAsBroken_(MEMORY[0x1E4F19E78], v37, (uint64_t)v36))
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          id v39 = (void *)*MEMORY[0x1E4F1A508];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A508], OS_LOG_TYPE_INFO))
          {
            uint64_t v42 = v39;
            uint64_t v45 = objc_msgSend_code(v36, v43, v44);
            *(_DWORD *)buf = 134217984;
            uint64_t v206 = v45;
            _os_log_impl(&dword_1C4CFF000, v42, OS_LOG_TYPE_INFO, "Received error code %ld for repair, so treating as not available", buf, 0xCu);
          }
          uint64_t v46 = objc_msgSend_assetOrPackageUUIDToMetadata(self, v40, v41);
          v48 = objc_msgSend_objectForKeyedSubscript_(v46, v47, v33);

          v51 = objc_msgSend_repairZoneRecordID(v48, v49, v50);
          objc_msgSend_addObject_(v4, v52, (uint64_t)v51);
        }
        else
        {
          objc_msgSend_addObject_(v184, v38, (uint64_t)v36);
        }

        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v194, v214, 16);
    }
    while (v30);
  }

  long long v192 = 0u;
  long long v193 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  v55 = objc_msgSend_unavailableAssetsAndPackages(self, v53, v54);
  uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v190, v213, 16);
  uint64_t v60 = v182;
  if (v57)
  {
    uint64_t v61 = v57;
    uint64_t v62 = *(void *)v191;
    do
    {
      for (uint64_t j = 0; j != v61; ++j)
      {
        if (*(void *)v191 != v62) {
          objc_enumerationMutation(v55);
        }
        v64 = objc_msgSend_repairZoneRecordID(*(void **)(*((void *)&v190 + 1) + 8 * j), v58, v59);
        objc_msgSend_addObject_(v4, v65, (uint64_t)v64);
      }
      uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v58, (uint64_t)&v190, v213, 16);
    }
    while (v61);
  }

  uint64_t v68 = objc_msgSend_count(v182, v66, v67);
  if (objc_msgSend_count(v4, v69, v70) + v68 == 1)
  {
    uint64_t v73 = objc_msgSend_count(v4, v71, v72);
    v74 = objc_opt_new();
    if (objc_msgSend_count(v4, v75, v76)) {
      objc_msgSend_anyObject(v4, v77, v78);
    }
    else {
    unint64_t v79 = objc_msgSend_anyObject(v182, v77, v78);
    }
    objc_msgSend_setRepairRecordID_(v74, v80, (uint64_t)v79);

    objc_msgSend_setRecovered_(v74, v81, v73 == 0);
    if (v73) {
      goto LABEL_59;
    }
    v84 = objc_msgSend_assetOrPackageUUIDToMetadata(self, v82, v83);
    uint64_t v87 = objc_msgSend_allKeys(v84, v85, v86);
    v90 = objc_msgSend_firstObject(v87, v88, v89);

    uint64_t v93 = objc_msgSend_UUIDToAssetOrPackage(self, v91, v92);
    v95 = objc_msgSend_objectForKeyedSubscript_((void *)v93, v94, (uint64_t)v90);

    objc_opt_class();
    LOBYTE(v93) = objc_opt_isKindOfClass();
    objc_msgSend_setRecovered_(v74, v96, 1);
    id v98 = v95;
    if (v93)
    {
      v181 = v90;
      uint64_t v99 = objc_opt_new();
      v100 = objc_opt_new();
      long long v186 = 0u;
      long long v187 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      id v180 = v98;
      id obj = objc_msgSend_assets(v98, v101, v102);
      uint64_t v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v103, (uint64_t)&v186, v202, 16);
      if (v104)
      {
        uint64_t v107 = v104;
        uint64_t v108 = *(void *)v187;
        do
        {
          for (uint64_t k = 0; k != v107; ++k)
          {
            if (*(void *)v187 != v108) {
              objc_enumerationMutation(obj);
            }
            uint64_t v110 = *(void **)(*((void *)&v186 + 1) + 8 * k);
            id v111 = (void *)MEMORY[0x1E4F28ED0];
            uint64_t v112 = objc_msgSend_size(v110, v105, v106);
            uint64_t v114 = objc_msgSend_numberWithUnsignedLongLong_(v111, v113, v112);
            objc_msgSend_addObject_(v99, v115, (uint64_t)v114);

            uint64_t v118 = objc_msgSend_uploadReceipt(v110, v116, v117);
            objc_msgSend_addObject_(v100, v119, (uint64_t)v118);
          }
          uint64_t v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v105, (uint64_t)&v186, v202, 16);
        }
        while (v107);
      }

      objc_msgSend_setIsPackage_(v74, v120, 1);
      objc_msgSend_setAssetSizes_(v74, v121, (uint64_t)v99);
      uint64_t v60 = v182;
      id v98 = v180;
      v90 = v181;
    }
    else
    {
      objc_msgSend_setIsPackage_(v74, v97, 0);
      v146 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v149 = objc_msgSend_size(v98, v147, v148);
      v151 = objc_msgSend_numberWithUnsignedLongLong_(v146, v150, v149);
      v204 = v151;
      v153 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v152, (uint64_t)&v204, 1);
      objc_msgSend_setAssetSizes_(v74, v154, (uint64_t)v153);

      v157 = objc_msgSend_uploadReceipt(v98, v155, v156);

      if (!v157)
      {
LABEL_58:

LABEL_59:
        v161 = objc_msgSend_stateTransitionGroup(self, v82, v83);
        dispatch_group_enter(v161);

        uint64_t v162 = objc_opt_class();
        v165 = objc_msgSend_repairContainer(self, v163, v164);
        v185[0] = MEMORY[0x1E4F143A8];
        v185[1] = 3221225472;
        v185[2] = sub_1C502E6EC;
        v185[3] = &unk_1E64F0210;
        v185[4] = self;
        objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_container_operationConfigurationBlock_(self, v166, v162, v74, 0, v165, v185);

        goto LABEL_60;
      }
      uint64_t v99 = objc_msgSend_uploadReceipt(v98, v158, v159);
      v203 = v99;
      v100 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v160, (uint64_t)&v203, 1);
    }
    objc_msgSend_setAssetPutReceipts_(v74, v122, (uint64_t)v100);

    goto LABEL_58;
  }
  uint64_t v123 = objc_msgSend_count(v182, v71, v72);
  if (v123 + objc_msgSend_count(v4, v124, v125) || !objc_msgSend_count(v184, v126, v127))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v135 = (void *)*MEMORY[0x1E4F1A508];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A508], OS_LOG_TYPE_ERROR))
    {
      v167 = v135;
      uint64_t v170 = objc_msgSend_count(v182, v168, v169);
      uint64_t v173 = objc_msgSend_count(v4, v171, v172);
      *(_DWORD *)buf = 134217984;
      uint64_t v206 = v173 + v170;
      _os_log_error_impl(&dword_1C4CFF000, v167, OS_LOG_TYPE_ERROR, "Wrong amount of repair records to update: %ld", buf, 0xCu);
    }
    v138 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v139 = *MEMORY[0x1E4F19C40];
    uint64_t v140 = objc_msgSend_count(v182, v136, v137);
    uint64_t v143 = objc_msgSend_count(v4, v141, v142);
    v74 = objc_msgSend_errorWithDomain_code_format_(v138, v144, v139, 1001, @"Wrong amount of repair records to update: %ld", v143 + v140);
    objc_msgSend_setError_(self, v145, (uint64_t)v74);
  }
  else
  {
    v74 = objc_msgSend_anyObject(v184, v128, v129);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v130 = (void *)*MEMORY[0x1E4F1A508];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A508], OS_LOG_TYPE_ERROR))
    {
      v174 = v130;
      v175 = (objc_class *)objc_opt_class();
      v176 = NSStringFromClass(v175);
      v179 = objc_msgSend_ckShortDescription(self, v177, v178);
      *(_DWORD *)buf = 138544130;
      uint64_t v206 = (uint64_t)v176;
      __int16 v207 = 2048;
      v208 = self;
      __int16 v209 = 2114;
      v210 = v179;
      __int16 v211 = 2112;
      v212 = v74;
      _os_log_error_impl(&dword_1C4CFF000, v174, OS_LOG_TYPE_ERROR, "Repair records operation <%{public}@: %p; %{public}@> finished with error %@",
        buf,
        0x2Au);
    }
    v133 = objc_msgSend_anyObject(v184, v131, v132);
    objc_msgSend_setError_(self, v134, (uint64_t)v133);
  }
LABEL_60:
}

- (id)repairContainer
{
  uint64_t v5 = objc_msgSend_uploadRequestConfiguration(self, a2, v2);
  uint64_t v8 = objc_msgSend_containerIdentifier(v5, v6, v7);
  if (v8)
  {
    uint64_t v11 = (void *)v8;
    uint64_t v12 = objc_msgSend_uploadRequestConfiguration(self, v9, v10);
    uint64_t v15 = objc_msgSend_applicationBundleIdentifierOverride(v12, v13, v14);

    if (v15) {
      goto LABEL_4;
    }
  }
  else
  {
  }
  uint64_t v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, @"CKDRepairAssetsOperation.m", 443, @"Upload request configuration passed to cloudd should have resolved fields");

LABEL_4:
  uint64_t v20 = objc_msgSend_uploadRequestConfiguration(self, v16, v17);
  uint64_t v68 = objc_msgSend_containerIdentifier(v20, v21, v22);

  uint64_t v25 = objc_msgSend_container(self, v23, v24);
  id v26 = objc_alloc(MEMORY[0x1E4F19ED8]);
  uint64_t v29 = objc_msgSend_containerID(v25, v27, v28);
  uint64_t v32 = objc_msgSend_environment(v29, v30, v31);
  uint64_t v67 = objc_msgSend_initWithContainerIdentifier_environment_(v26, v33, (uint64_t)v68, v32);

  long long v36 = objc_msgSend_uploadRequestConfiguration(self, v34, v35);
  id v39 = objc_msgSend_applicationBundleIdentifierOverride(v36, v37, v38);

  id v40 = [CKDApplicationID alloc];
  v43 = objc_msgSend_applicationBundleID(v25, v41, v42);
  uint64_t v45 = objc_msgSend_initWithApplicationBundleIdentifier_applicationBundleIdentifierOverrideForContainerAccess_applicationBundleIdentifierOverrideForNetworkAttribution_applicationBundleIdentifierOverrideForPushTopicGeneration_applicationBundleIdentifierOverrideForTCC_(v40, v44, (uint64_t)v43, v39, v39, v39, v39);

  uint64_t v46 = [CKDAppContainerTuple alloc];
  v48 = objc_msgSend_initWithApplicationID_containerID_personaID_(v46, v47, (uint64_t)v45, v67, 0);
  v51 = objc_msgSend_processScopedClientProxy(v25, v49, v50);
  uint64_t v54 = objc_msgSend_logicalDeviceScopedClientProxy(v25, v52, v53);
  uint64_t v57 = objc_msgSend_entitlements(v25, v55, v56);
  uint64_t v60 = objc_msgSend_options(v25, v58, v59);
  v63 = objc_msgSend_sharedInternalUseContainers(CKDContainer, v61, v62);
  v65 = objc_msgSend_containerWithAppContainerTuple_processScopedClientProxy_logicalDeviceScopedClientProxy_containerEntitlements_containerOptions_sharedContainerTable_(CKDContainer, v64, (uint64_t)v48, v51, v54, v57, v60, v63);

  return v65;
}

- (id)assetOrPackageForMetadata:(id)a3 inRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_fieldName(v5, v7, v8);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v6, v10, (uint64_t)v9);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v19 = objc_msgSend_fieldName(v5, v21, v22);
        objc_msgSend_objectForKeyedSubscript_(v6, v23, (uint64_t)v19);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    goto LABEL_13;
  }
  uint64_t v14 = objc_msgSend_listIndex(v5, v12, v13);
  if (v14 < 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v11;
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  uint64_t v15 = v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || v15 >= objc_msgSend_count(v11, v16, v17))
  {
LABEL_13:
    id v24 = 0;
    goto LABEL_16;
  }
  uint64_t v19 = objc_msgSend_objectAtIndex_(v11, v18, v15);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v24 = 0;
    goto LABEL_15;
  }
  id v20 = v19;
LABEL_10:
  id v24 = v20;
LABEL_15:

LABEL_16:
  return v24;
}

- (void)main
{
  uint64_t v4 = objc_msgSend_UUIDToAssetOrPackage(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);
  uint64_t v10 = objc_msgSend_unavailableAssetsAndPackages(self, v8, v9);
  unint64_t v13 = objc_msgSend_count(v10, v11, v12) + v7;

  if (v13 >= 2)
  {
    uint64_t v15 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v14, *MEMORY[0x1E4F19DD8], 1001, @"Updating multiple records currently not supported");
    objc_msgSend_setError_(self, v16, (uint64_t)v15);
  }
  objc_msgSend_makeStateTransition_(self, v14, v13 != 1);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setAssetOrPackageRepairedBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDRepairAssetsOperation;
  [(CKDOperation *)&v6 _finishOnCallbackQueueWithError:v4];
}

- (id)assetOrPackageRepairedBlock
{
  return self->_assetOrPackageRepairedBlock;
}

- (void)setAssetOrPackageRepairedBlock:(id)a3
{
}

- (CKUploadRequestConfiguration)uploadRequestConfiguration
{
  return self->_uploadRequestConfiguration;
}

- (void)setUploadRequestConfiguration:(id)a3
{
}

- (NSDictionary)UUIDToAssetOrPackage
{
  return self->_UUIDToAssetOrPackage;
}

- (void)setUUIDToAssetOrPackage:(id)a3
{
}

- (NSDictionary)assetOrPackageUUIDToMetadata
{
  return self->_assetOrPackageUUIDToMetadata;
}

- (void)setAssetOrPackageUUIDToMetadata:(id)a3
{
}

- (NSArray)unavailableAssetsAndPackages
{
  return self->_unavailableAssetsAndPackages;
}

- (void)setUnavailableAssetsAndPackages:(id)a3
{
}

- (CKDOperation)fetchOperation
{
  return self->_fetchOperation;
}

- (void)setFetchOperation:(id)a3
{
}

- (CKDOperation)uploadOperation
{
  return self->_uploadOperation;
}

- (void)setUploadOperation:(id)a3
{
}

- (CKDOperation)updateOperation
{
  return self->_updateOperation;
}

- (void)setUpdateOperation:(id)a3
{
}

- (NSMutableDictionary)assetOrPackageUUIDToOriginalRecord
{
  return self->_assetOrPackageUUIDToOriginalRecord;
}

- (void)setAssetOrPackageUUIDToOriginalRecord:(id)a3
{
}

- (NSDictionary)assetOrPackageUUIDToUploadError
{
  return self->_assetOrPackageUUIDToUploadError;
}

- (void)setAssetOrPackageUUIDToUploadError:(id)a3
{
}

- (NSSet)uploadedAssetOrPackageUUIDs
{
  return self->_uploadedAssetOrPackageUUIDs;
}

- (void)setUploadedAssetOrPackageUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadedAssetOrPackageUUIDs, 0);
  objc_storeStrong((id *)&self->_assetOrPackageUUIDToUploadError, 0);
  objc_storeStrong((id *)&self->_assetOrPackageUUIDToOriginalRecord, 0);
  objc_storeStrong((id *)&self->_updateOperation, 0);
  objc_storeStrong((id *)&self->_uploadOperation, 0);
  objc_storeStrong((id *)&self->_fetchOperation, 0);
  objc_storeStrong((id *)&self->_unavailableAssetsAndPackages, 0);
  objc_storeStrong((id *)&self->_assetOrPackageUUIDToMetadata, 0);
  objc_storeStrong((id *)&self->_UUIDToAssetOrPackage, 0);
  objc_storeStrong((id *)&self->_uploadRequestConfiguration, 0);
  objc_storeStrong(&self->_assetOrPackageRepairedBlock, 0);
}

@end