@interface CKDMarkAssetBrokenOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)bypassPCSEncryptionForTouchRepairZone;
- (BOOL)makeStateTransition;
- (BOOL)simulateCorruptAsset;
- (BOOL)touchRepairZone;
- (BOOL)writeRepairRecord;
- (CKDFetchRecordZonesOperation)zoneFetchOperation;
- (CKDFetchRecordsOperation)fetchOperation;
- (CKDMarkAssetBrokenOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKDMarkAssetBrokenURLRequestWrapperOperation)wrapperOperation;
- (CKDModifyRecordZonesOperation)zoneCreateOperation;
- (CKDModifyRecordsOperation)corruptOperation;
- (CKRecord)record;
- (CKRecordID)recordID;
- (CKRecordZone)repairZone;
- (CKUploadRequestConfiguration)uploadRequestConfiguration;
- (NSError)markAssetBrokenError;
- (NSString)field;
- (id)activityCreate;
- (id)assetOrPackageForFetchedRecord;
- (id)assetOrPackageMarkedBrokenBlock;
- (id)checkPreconditions;
- (id)repairContainer;
- (int)operationType;
- (int64_t)listIndex;
- (unint64_t)numMarkAssetBrokenFailures;
- (void)_breakAsset;
- (void)_fetchRecord;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_markAssetBroken;
- (void)_touchCreateRepairZone;
- (void)_touchFetchRepairZone;
- (void)main;
- (void)setAssetOrPackageMarkedBrokenBlock:(id)a3;
- (void)setBypassPCSEncryptionForTouchRepairZone:(BOOL)a3;
- (void)setCorruptOperation:(id)a3;
- (void)setFetchOperation:(id)a3;
- (void)setField:(id)a3;
- (void)setListIndex:(int64_t)a3;
- (void)setMarkAssetBrokenError:(id)a3;
- (void)setNumMarkAssetBrokenFailures:(unint64_t)a3;
- (void)setRecord:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setRepairZone:(id)a3;
- (void)setSimulateCorruptAsset:(BOOL)a3;
- (void)setTouchRepairZone:(BOOL)a3;
- (void)setUploadRequestConfiguration:(id)a3;
- (void)setWrapperOperation:(id)a3;
- (void)setWriteRepairRecord:(BOOL)a3;
- (void)setZoneCreateOperation:(id)a3;
- (void)setZoneFetchOperation:(id)a3;
@end

@implementation CKDMarkAssetBrokenOperation

- (CKDMarkAssetBrokenOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CKDMarkAssetBrokenOperation;
  v9 = [(CKDDatabaseOperation *)&v31 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_recordID(v6, v7, v8);
    recordID = v9->_recordID;
    v9->_recordID = (CKRecordID *)v10;

    uint64_t v14 = objc_msgSend_field(v6, v12, v13);
    field = v9->_field;
    v9->_field = (NSString *)v14;

    v9->_listIndex = objc_msgSend_listIndex(v6, v16, v17);
    v9->_touchRepairZone = objc_msgSend_touchRepairZone(v6, v18, v19);
    v9->_bypassPCSEncryptionForTouchRepairZone = objc_msgSend_bypassPCSEncryptionForTouchRepairZone(v6, v20, v21);
    v9->_simulateCorruptAsset = objc_msgSend_simulateCorruptAsset(v6, v22, v23);
    v9->_writeRepairRecord = objc_msgSend_writeRepairRecord(v6, v24, v25);
    uint64_t v28 = objc_msgSend_uploadRequestConfiguration(v6, v26, v27);
    uploadRequestConfiguration = v9->_uploadRequestConfiguration;
    v9->_uploadRequestConfiguration = (CKUploadRequestConfiguration *)v28;
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/break-assets", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)makeStateTransition
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      id v6 = objc_msgSend_recordID(self, v4, v5);

      if (!v6)
      {
        if (!objc_msgSend_touchRepairZone(self, v7, v8)) {
          goto LABEL_24;
        }
        goto LABEL_21;
      }
      objc_msgSend_setState_(self, v7, 2);
      objc_msgSend__fetchRecord(self, v9, v10);
      return 1;
    case 2:
      if (!objc_msgSend_touchRepairZone(self, v4, v5)) {
        goto LABEL_9;
      }
LABEL_21:
      objc_msgSend_setState_(self, v11, 3);
      objc_msgSend__touchFetchRepairZone(self, v42, v43);
      return 1;
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      v15 = objc_msgSend_repairZone(self, v13, v14);

      if (v15) {
        objc_msgSend_makeStateTransition(self, v16, v17);
      }
      else {
        objc_msgSend__touchCreateRepairZone(self, v16, v17);
      }
      return 1;
    case 4:
      v18 = objc_msgSend_recordID(self, v4, v5);

      if (!v18) {
        goto LABEL_24;
      }
LABEL_9:
      if (!objc_msgSend_simulateCorruptAsset(self, v11, v12)) {
        goto LABEL_11;
      }
      objc_msgSend_setState_(self, v4, 5);
      objc_msgSend__breakAsset(self, v19, v20);
      return 1;
    case 5:
LABEL_11:
      objc_msgSend_setState_(self, v4, 6);
      goto LABEL_12;
    case 6:
      uint64_t v23 = objc_msgSend_markAssetBrokenError(self, v4, v5);

      if (!v23) {
        goto LABEL_24;
      }
      if ((unint64_t)objc_msgSend_numMarkAssetBrokenFailures(self, v11, v24) > 2)
      {
        v44 = objc_msgSend_markAssetBrokenError(self, v25, v26);
        objc_msgSend_setError_(self, v45, (uint64_t)v44);

LABEL_24:
        objc_msgSend_setState_(self, v11, 0xFFFFFFFFLL);
        v48 = objc_msgSend_error(self, v46, v47);
        objc_msgSend_finishWithError_(self, v49, (uint64_t)v48);
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v27 = (void *)*MEMORY[0x1E4F1A508];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A508], OS_LOG_TYPE_INFO))
        {
          v30 = v27;
          objc_super v31 = (objc_class *)objc_opt_class();
          v32 = NSStringFromClass(v31);
          v35 = objc_msgSend_ckShortDescription(self, v33, v34);
          v38 = objc_msgSend_markAssetBrokenError(self, v36, v37);
          int v51 = 138544130;
          v52 = v32;
          __int16 v53 = 2048;
          v54 = self;
          __int16 v55 = 2114;
          v56 = v35;
          __int16 v57 = 2112;
          v58 = v38;
          _os_log_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_INFO, "Retrying markAssetsBroken on <%{public}@: %p; %{public}@> after error %@",
            (uint8_t *)&v51,
            0x2Au);
        }
        uint64_t v39 = objc_msgSend_numMarkAssetBrokenFailures(self, v28, v29);
        objc_msgSend_setNumMarkAssetBrokenFailures_(self, v40, v39 + 1);
        objc_msgSend_setMarkAssetBrokenError_(self, v41, 0);
        sleep(0xAu);
LABEL_12:
        objc_msgSend__markAssetBroken(self, v21, v22);
      }
      return 1;
    default:
      return 1;
  }
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 5)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDMarkAssetBrokenOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F72F0[a3 - 2];
  }
  return v3;
}

- (void)_fetchRecord
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v6 = objc_msgSend_recordID(self, v4, v5);
  v20[0] = v6;
  uint64_t v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v20, 1);
  objc_msgSend_setRecordIDs_(v3, v9, (uint64_t)v8);

  uint64_t v12 = objc_msgSend_simulateCorruptAsset(self, v10, v11);
  objc_msgSend_setShouldFetchAssetContent_(v3, v13, v12);
  v16 = objc_msgSend_stateTransitionGroup(self, v14, v15);
  dispatch_group_enter(v16);

  uint64_t v17 = objc_opt_class();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1C4F77108;
  v19[3] = &unk_1E64F0210;
  v19[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v18, v17, v3, v19);
}

- (void)_touchFetchRepairZone
{
  v32[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_uploadRequestConfiguration(self, a2, v2);
  uint64_t v8 = objc_msgSend_repairZoneID(v5, v6, v7);

  if (!v8)
  {
    uint64_t v29 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, self, @"CKDMarkAssetBrokenOperation.m", 261, @"Upload request configuration passed to cloudd should have resolved fields");
  }
  uint64_t v11 = objc_opt_new();
  uint64_t v14 = objc_msgSend_uploadRequestConfiguration(self, v12, v13);
  uint64_t v17 = objc_msgSend_repairZoneID(v14, v15, v16);
  v32[0] = v17;
  uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v32, 1);
  objc_msgSend_setRecordZoneIDs_(v11, v20, (uint64_t)v19);

  uint64_t v23 = objc_msgSend_stateTransitionGroup(self, v21, v22);
  dispatch_group_enter(v23);

  uint64_t v24 = objc_opt_class();
  uint64_t v27 = objc_msgSend_repairContainer(self, v25, v26);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1C4F778D0;
  v31[3] = &unk_1E64F0210;
  v31[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_container_operationConfigurationBlock_(self, v28, v24, v11, 0, v27, v31);
}

- (void)_touchCreateRepairZone
{
  v35[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_uploadRequestConfiguration(self, a2, v2);
  uint64_t v8 = objc_msgSend_repairZoneID(v5, v6, v7);

  if (!v8)
  {
    v32 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, self, @"CKDMarkAssetBrokenOperation.m", 314, @"Upload request configuration passed to cloudd should have resolved fields");
  }
  id v11 = objc_alloc(MEMORY[0x1E4F1A310]);
  uint64_t v14 = objc_msgSend_uploadRequestConfiguration(self, v12, v13);
  uint64_t v17 = objc_msgSend_repairZoneID(v14, v15, v16);
  uint64_t v19 = objc_msgSend_initWithZoneID_(v11, v18, (uint64_t)v17);

  uint64_t v20 = objc_opt_new();
  v35[0] = v19;
  uint64_t v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v21, (uint64_t)v35, 1);
  objc_msgSend_setRecordZonesToSave_(v20, v23, (uint64_t)v22);

  uint64_t v26 = objc_msgSend_stateTransitionGroup(self, v24, v25);
  dispatch_group_enter(v26);

  uint64_t v27 = objc_opt_class();
  v30 = objc_msgSend_repairContainer(self, v28, v29);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1C4F780E0;
  v34[3] = &unk_1E64F0210;
  v34[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_container_operationConfigurationBlock_(self, v31, v27, v20, 0, v30, v34);
}

- (void)_breakAsset
{
  v97[1] = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend_checkPreconditions(self, a2, v2);
  if (v6)
  {
    objc_msgSend_setError_(self, v4, (uint64_t)v6);
  }
  else
  {
    uint64_t v7 = objc_msgSend_assetOrPackageForFetchedRecord(self, v4, v5);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v9 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    id v10 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    uint64_t v12 = objc_msgSend_initWithRecordName_(v10, v11, @"FakeName");
    uint64_t v14 = objc_msgSend_initWithRecordType_recordID_(v9, v13, @"FakeRecordType", v12);

    uint64_t v15 = objc_opt_new();
    objc_msgSend_setShouldOnlySaveAssetContent_(v15, v16, 1);
    v97[0] = v14;
    v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v17, (uint64_t)v97, 1);
    objc_msgSend_setRecordsToSave_(v15, v19, (uint64_t)v18);

    objc_msgSend_setOriginatingFromDaemon_(v15, v20, 1);
    v90 = v7;
    if (isKindOfClass)
    {
      uint64_t v21 = NSString;
      uint64_t v22 = (void *)MEMORY[0x1E4F29128];
      id v23 = v7;
      uint64_t v26 = objc_msgSend_UUID(v22, v24, v25);
      uint64_t v29 = objc_msgSend_UUIDString(v26, v27, v28);
      objc_super v31 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v29, v30, @"-", &stru_1F2044F30);
      v33 = objc_msgSend_stringWithFormat_(v21, v32, @"A%@", v31);

      objc_msgSend_setUUID_(v23, v34, (uint64_t)v33);
      objc_msgSend_setRecordID_(v23, v35, 0);
      id v36 = objc_alloc(MEMORY[0x1E4F19E80]);
      uint64_t v39 = objc_msgSend_signature(v23, v37, v38);
      v42 = objc_msgSend_referenceSignature(v23, v40, v41);
      v44 = objc_msgSend_initWithFileSignature_referenceSignature_assetKey_(v36, v43, (uint64_t)v39, v42, 0);

      v95 = v33;
      v96 = v44;
      v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v45, (uint64_t)&v96, &v95, 1);
      objc_msgSend_setAssetUUIDToExpectedProperties_(v15, v47, (uint64_t)v46);

      objc_msgSend_setObject_forKeyedSubscript_(v14, v48, (uint64_t)v23, v33);
    }
    else
    {
      id v49 = v7;
      v52 = objc_msgSend_container(self, v50, v51);
      __int16 v55 = objc_msgSend_directoryContext(v52, v53, v54);
      v58 = objc_msgSend_packageStagingDirectory(v55, v56, v57);
      objc_msgSend_path(v58, v59, v60);
      v61 = v89 = v14;
      id v92 = 0;
      v33 = objc_msgSend_clonedPackageInDaemonWithBasePath_filesDuplicatedIntoDirectory_error_(v49, v62, (uint64_t)v61, 0, &v92);
      id v88 = v92;

      v63 = NSString;
      v66 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v64, v65);
      v69 = objc_msgSend_UUIDString(v66, v67, v68);
      v71 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v69, v70, @"-", &stru_1F2044F30);
      objc_msgSend_stringWithFormat_(v63, v72, @"A%@", v71);
      id v23 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_setUUID_(v33, v73, (uint64_t)v23);
      v76 = objc_msgSend_assets(v49, v74, v75);

      v78 = objc_msgSend_CKMap_(v76, v77, (uint64_t)&unk_1F2044510);

      id v93 = v23;
      v94 = v78;
      v80 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v79, (uint64_t)&v94, &v93, 1);
      objc_msgSend_setPackageUUIDToExpectedProperties_(v15, v81, (uint64_t)v80);

      v44 = v88;
      objc_msgSend_setObject_forKeyedSubscript_(v89, v82, (uint64_t)v33, v23);

      uint64_t v14 = v89;
    }

    v85 = objc_msgSend_stateTransitionGroup(self, v83, v84);
    dispatch_group_enter(v85);

    uint64_t v86 = objc_opt_class();
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = sub_1C4F78C00;
    v91[3] = &unk_1E64F0210;
    v91[4] = self;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v87, v86, v15, v91);
  }
}

- (int)operationType
{
  return 901;
}

- (void)_markAssetBroken
{
  uint64_t v176 = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend_checkPreconditions(self, a2, v2);
  if (v6)
  {
    objc_msgSend_setError_(self, v4, (uint64_t)v6);
    goto LABEL_28;
  }
  uint64_t v7 = objc_msgSend_record(self, v4, v5);
  id v10 = objc_msgSend_field(self, v8, v9);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v7, v11, (uint64_t)v10);

  if (objc_msgSend_listIndex(self, v13, v14) < 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v55 = (objc_class *)MEMORY[0x1E4F19E90];
      id v56 = v12;
      id v160 = [v55 alloc];
      v153 = objc_msgSend_record(self, v57, v58);
      v61 = objc_msgSend_recordID(v153, v59, v60);
      v150 = objc_msgSend_record(self, v62, v63);
      v66 = objc_msgSend_recordID(v150, v64, v65);
      v69 = objc_msgSend_record(self, v67, v68);
      v72 = objc_msgSend_recordType(v69, v70, v71);
      uint64_t v75 = objc_msgSend_field(self, v73, v74);
      objc_msgSend_signature(v56, v76, v77);
      v78 = v156 = v12;
      v81 = objc_msgSend_referenceSignature(v56, v79, v80);

      uint64_t v84 = objc_msgSend_listIndex(self, v82, v83);
      v159 = objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignature_referenceSignature_listIndex_(v160, v85, (uint64_t)v61, 2, v66, v72, v75, v78, v81, v84);

      uint64_t v12 = v156;
      goto LABEL_22;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v157 = v12;
      id v86 = v12;
      v87 = objc_opt_new();
      id v88 = objc_opt_new();
      long long v165 = 0u;
      long long v166 = 0u;
      long long v167 = 0u;
      long long v168 = 0u;
      v154 = v86;
      v91 = objc_msgSend_assets(v86, v89, v90);
      uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v91, v92, (uint64_t)&v165, v175, 16);
      if (v93)
      {
        uint64_t v96 = v93;
        uint64_t v97 = *(void *)v166;
        do
        {
          for (uint64_t i = 0; i != v96; ++i)
          {
            if (*(void *)v166 != v97) {
              objc_enumerationMutation(v91);
            }
            v99 = *(void **)(*((void *)&v165 + 1) + 8 * i);
            v100 = objc_msgSend_signature(v99, v94, v95);
            objc_msgSend_addObject_(v87, v101, (uint64_t)v100);

            v104 = objc_msgSend_referenceSignature(v99, v102, v103);
            objc_msgSend_addObject_(v88, v105, (uint64_t)v104);
          }
          uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v91, v94, (uint64_t)&v165, v175, 16);
        }
        while (v96);
      }

      id v161 = objc_alloc(MEMORY[0x1E4F1A268]);
      v151 = objc_msgSend_record(self, v106, v107);
      v110 = objc_msgSend_recordID(v151, v108, v109);
      v113 = objc_msgSend_record(self, v111, v112);
      v116 = objc_msgSend_recordID(v113, v114, v115);
      v119 = objc_msgSend_record(self, v117, v118);
      v122 = objc_msgSend_recordType(v119, v120, v121);
      v125 = objc_msgSend_field(self, v123, v124);
      v159 = objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignatures_referenceSignatures_(v161, v126, (uint64_t)v110, 2, v116, v122, v125, v87, v88);

      uint64_t v12 = v157;
LABEL_22:

      if (v159)
      {
        v129 = objc_msgSend_stateTransitionGroup(self, v127, v128);
        dispatch_group_enter(v129);

        uint64_t v130 = objc_opt_class();
        v131 = objc_opt_new();
        v134 = objc_msgSend_repairContainer(self, v132, v133);
        v162[0] = MEMORY[0x1E4F143A8];
        v162[1] = 3221225472;
        v162[2] = sub_1C4F79910;
        v162[3] = &unk_1E64F0260;
        id v163 = v159;
        v164 = self;
        id v135 = v159;
        objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_container_operationConfigurationBlock_(self, v136, v130, v131, 0, v134, v162);

        goto LABEL_28;
      }
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v17 = objc_msgSend_count(v12, v15, v16);
    if (objc_msgSend_listIndex(self, v18, v19) < v17)
    {
      uint64_t v22 = objc_msgSend_listIndex(self, v20, v21);
      uint64_t v24 = objc_msgSend_objectAtIndex_(v12, v23, v22);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v155 = v12;
        uint64_t v25 = (objc_class *)MEMORY[0x1E4F19E90];
        id v26 = v24;
        id v158 = [v25 alloc];
        v152 = objc_msgSend_record(self, v27, v28);
        v148 = objc_msgSend_recordID(v152, v29, v30);
        v149 = objc_msgSend_record(self, v31, v32);
        v35 = objc_msgSend_recordID(v149, v33, v34);
        uint64_t v38 = objc_msgSend_record(self, v36, v37);
        uint64_t v41 = objc_msgSend_recordType(v38, v39, v40);
        v44 = objc_msgSend_field(self, v42, v43);
        uint64_t v47 = objc_msgSend_signature(v26, v45, v46);
        v50 = objc_msgSend_referenceSignature(v26, v48, v49);

        uint64_t v53 = objc_msgSend_listIndex(self, v51, v52);
        v159 = objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignature_referenceSignature_listIndex_(v158, v54, (uint64_t)v148, 2, v35, v41, v44, v47, v50, v53);

        uint64_t v12 = v155;
      }
      else
      {
        v159 = 0;
      }

      goto LABEL_22;
    }
  }

LABEL_24:
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v137 = (void *)*MEMORY[0x1E4F1A508];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A508], OS_LOG_TYPE_ERROR))
  {
    v138 = v137;
    v141 = objc_msgSend_field(self, v139, v140);
    uint64_t v144 = objc_msgSend_listIndex(self, v142, v143);
    v147 = objc_msgSend_record(self, v145, v146);
    *(_DWORD *)buf = 138543874;
    v170 = v141;
    __int16 v171 = 2048;
    uint64_t v172 = v144;
    __int16 v173 = 2112;
    v174 = v147;
    _os_log_error_impl(&dword_1C4CFF000, v138, OS_LOG_TYPE_ERROR, "Could not find asset or package in field %{public}@ and index %ld of record %@", buf, 0x20u);
  }
LABEL_28:
}

- (id)repairContainer
{
  uint64_t v5 = objc_msgSend_uploadRequestConfiguration(self, a2, v2);
  uint64_t v8 = objc_msgSend_containerIdentifier(v5, v6, v7);
  if (v8)
  {
    id v11 = (void *)v8;
    uint64_t v12 = objc_msgSend_uploadRequestConfiguration(self, v9, v10);
    uint64_t v15 = objc_msgSend_applicationBundleIdentifierOverride(v12, v13, v14);

    if (v15) {
      goto LABEL_4;
    }
  }
  else
  {
  }
  v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, @"CKDMarkAssetBrokenOperation.m", 603, @"Upload request configuration passed to cloudd should have resolved fields");

LABEL_4:
  uint64_t v20 = objc_msgSend_uploadRequestConfiguration(self, v16, v17);
  v81 = objc_msgSend_containerIdentifier(v20, v21, v22);

  uint64_t v25 = objc_msgSend_container(self, v23, v24);
  id v26 = objc_alloc(MEMORY[0x1E4F19ED8]);
  uint64_t v29 = objc_msgSend_containerID(v25, v27, v28);
  uint64_t v32 = objc_msgSend_environment(v29, v30, v31);
  uint64_t v80 = objc_msgSend_initWithContainerIdentifier_environment_(v26, v33, (uint64_t)v81, v32);

  id v36 = objc_msgSend_uploadRequestConfiguration(self, v34, v35);
  uint64_t v39 = objc_msgSend_applicationBundleIdentifierOverride(v36, v37, v38);

  uint64_t v40 = [CKDApplicationID alloc];
  uint64_t v43 = objc_msgSend_applicationBundleID(v25, v41, v42);
  v79 = objc_msgSend_initWithApplicationBundleIdentifier_applicationBundleIdentifierOverrideForContainerAccess_applicationBundleIdentifierOverrideForNetworkAttribution_applicationBundleIdentifierOverrideForPushTopicGeneration_applicationBundleIdentifierOverrideForTCC_(v40, v44, (uint64_t)v43, v39, v39, v39, v39);

  v45 = [CKDAppContainerTuple alloc];
  v78 = v25;
  v48 = objc_msgSend_personaID(v25, v46, v47);
  v76 = objc_msgSend_initWithApplicationID_containerID_personaID_(v45, v49, (uint64_t)v79, v80, v48);

  uint64_t v52 = objc_msgSend_processScopedClientProxy(v25, v50, v51);
  __int16 v55 = objc_msgSend_container(self, v53, v54);
  uint64_t v58 = objc_msgSend_logicalDeviceScopedClientProxy(v55, v56, v57);
  v61 = objc_msgSend_container(self, v59, v60);
  v64 = objc_msgSend_entitlements(v61, v62, v63);
  v67 = objc_msgSend_container(self, v65, v66);
  v70 = objc_msgSend_options(v67, v68, v69);
  v73 = objc_msgSend_sharedInternalUseContainers(CKDContainer, v71, v72);
  objc_msgSend_containerWithAppContainerTuple_processScopedClientProxy_logicalDeviceScopedClientProxy_containerEntitlements_containerOptions_sharedContainerTable_(CKDContainer, v74, (uint64_t)v76, v52, v58, v64, v70, v73);
  id v77 = (id)objc_claimAutoreleasedReturnValue();

  return v77;
}

- (id)assetOrPackageForFetchedRecord
{
  v4 = objc_msgSend_record(self, a2, v2);
  uint64_t v7 = objc_msgSend_field(self, v5, v6);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v4, v8, (uint64_t)v7);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    if (objc_msgSend_listIndex(self, v11, v12) != -1)
    {
      uint64_t v15 = objc_msgSend_listIndex(self, v13, v14);
      uint64_t v17 = objc_msgSend_objectAtIndexedSubscript_(v10, v16, v15);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v21 = objc_msgSend_listIndex(self, v19, v20);
        objc_msgSend_objectAtIndexedSubscript_(v10, v22, v21);
        id v23 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v23 = v9;
      goto LABEL_10;
    }
  }
  id v23 = 0;
LABEL_10:

  return v23;
}

- (id)checkPreconditions
{
  v4 = objc_msgSend_record(self, a2, v2);

  if (v4)
  {
    uint64_t v8 = objc_msgSend_assetOrPackageForFetchedRecord(self, v5, v6);
    if (v8)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v7, *MEMORY[0x1E4F19DD8], 3011, @"Could not find referenced asset");
    }
  }
  else
  {
    uint64_t v9 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v5, *MEMORY[0x1E4F19DD8], 1000, @"Attempting to break asset with missing base record");
  }
  return v9;
}

- (void)main
{
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setAssetOrPackageMarkedBrokenBlock_(self, v5, 0);
  uint64_t v8 = objc_msgSend_record(self, v6, v7);
  objc_msgSend_removePackages(v8, v9, v10);

  objc_msgSend_setRecord_(self, v11, 0);
  v12.receiver = self;
  v12.super_class = (Class)CKDMarkAssetBrokenOperation;
  [(CKDOperation *)&v12 _finishOnCallbackQueueWithError:v4];
}

- (id)assetOrPackageMarkedBrokenBlock
{
  return self->_assetOrPackageMarkedBrokenBlock;
}

- (void)setAssetOrPackageMarkedBrokenBlock:(id)a3
{
}

- (CKUploadRequestConfiguration)uploadRequestConfiguration
{
  return self->_uploadRequestConfiguration;
}

- (void)setUploadRequestConfiguration:(id)a3
{
}

- (BOOL)touchRepairZone
{
  return self->_touchRepairZone;
}

- (void)setTouchRepairZone:(BOOL)a3
{
  self->_touchRepairZone = a3;
}

- (BOOL)bypassPCSEncryptionForTouchRepairZone
{
  return self->_bypassPCSEncryptionForTouchRepairZone;
}

- (void)setBypassPCSEncryptionForTouchRepairZone:(BOOL)a3
{
  self->_bypassPCSEncryptionForTouchRepairZone = a3;
}

- (BOOL)simulateCorruptAsset
{
  return self->_simulateCorruptAsset;
}

- (void)setSimulateCorruptAsset:(BOOL)a3
{
  self->_simulateCorruptAsset = a3;
}

- (BOOL)writeRepairRecord
{
  return self->_writeRepairRecord;
}

- (void)setWriteRepairRecord:(BOOL)a3
{
  self->_writeRepairRecord = a3;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSString)field
{
  return self->_field;
}

- (void)setField:(id)a3
{
}

- (int64_t)listIndex
{
  return self->_listIndex;
}

- (void)setListIndex:(int64_t)a3
{
  self->_listIndex = a3;
}

- (CKDFetchRecordsOperation)fetchOperation
{
  return self->_fetchOperation;
}

- (void)setFetchOperation:(id)a3
{
}

- (CKDFetchRecordZonesOperation)zoneFetchOperation
{
  return self->_zoneFetchOperation;
}

- (void)setZoneFetchOperation:(id)a3
{
}

- (CKDModifyRecordZonesOperation)zoneCreateOperation
{
  return self->_zoneCreateOperation;
}

- (void)setZoneCreateOperation:(id)a3
{
}

- (CKDModifyRecordsOperation)corruptOperation
{
  return self->_corruptOperation;
}

- (void)setCorruptOperation:(id)a3
{
}

- (CKDMarkAssetBrokenURLRequestWrapperOperation)wrapperOperation
{
  return self->_wrapperOperation;
}

- (void)setWrapperOperation:(id)a3
{
}

- (CKRecordZone)repairZone
{
  return self->_repairZone;
}

- (void)setRepairZone:(id)a3
{
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (unint64_t)numMarkAssetBrokenFailures
{
  return self->_numMarkAssetBrokenFailures;
}

- (void)setNumMarkAssetBrokenFailures:(unint64_t)a3
{
  self->_numMarkAssetBrokenFailures = a3;
}

- (NSError)markAssetBrokenError
{
  return self->_markAssetBrokenError;
}

- (void)setMarkAssetBrokenError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markAssetBrokenError, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_repairZone, 0);
  objc_storeStrong((id *)&self->_wrapperOperation, 0);
  objc_storeStrong((id *)&self->_corruptOperation, 0);
  objc_storeStrong((id *)&self->_zoneCreateOperation, 0);
  objc_storeStrong((id *)&self->_zoneFetchOperation, 0);
  objc_storeStrong((id *)&self->_fetchOperation, 0);
  objc_storeStrong((id *)&self->_field, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_uploadRequestConfiguration, 0);
  objc_storeStrong(&self->_assetOrPackageMarkedBrokenBlock, 0);
}

@end