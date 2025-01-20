@interface CKDFetchRecordPCSDiagnosticsOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)makeStateTransition;
- (CKDFetchRecordPCSDiagnosticsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)corruptRecords;
- (NSArray)zoneIDs;
- (NSMutableArray)fetchedZones;
- (NSMutableArray)mutableCorruptRecords;
- (id)activityCreate;
- (void)_checkRecordPCSForAllZones;
- (void)_fetchZones;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)main;
- (void)setFetchedZones:(id)a3;
- (void)setMutableCorruptRecords:(id)a3;
- (void)setZoneIDs:(id)a3;
@end

@implementation CKDFetchRecordPCSDiagnosticsOperation

- (CKDFetchRecordPCSDiagnosticsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKDFetchRecordPCSDiagnosticsOperation;
  v9 = [(CKDDatabaseOperation *)&v17 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_recordZoneIDs(v6, v7, v8);
    zoneIDs = v9->_zoneIDs;
    v9->_zoneIDs = (NSArray *)v10;

    uint64_t v12 = objc_opt_new();
    fetchedZones = v9->_fetchedZones;
    v9->_fetchedZones = (NSMutableArray *)v12;

    uint64_t v14 = objc_opt_new();
    mutableCorruptRecords = v9->_mutableCorruptRecords;
    v9->_mutableCorruptRecords = (NSMutableArray *)v14;
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/fetch-record-pcs-diagnostics", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)makeStateTransition
{
  uint64_t v4 = objc_msgSend_state(self, a2, v2);
  switch(v4)
  {
    case 3:
      objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
      uint64_t v10 = objc_msgSend_error(self, v8, v9);
      objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);

      break;
    case 2:
      objc_msgSend_setState_(self, v5, 3);
      objc_msgSend__checkRecordPCSForAllZones(self, v12, v13);
      break;
    case 1:
      objc_msgSend_setState_(self, v5, 2);
      objc_msgSend__fetchZones(self, v6, v7);
      break;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 == 2)
  {
    v5 = @"Fetching Zones";
  }
  else if (a3 == 3)
  {
    v5 = @"Checking Record PCS";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDFetchRecordPCSDiagnosticsOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_checkRecordPCSForAllZones
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = v3;
    objc_super v7 = objc_msgSend_fetchedZones(self, v5, v6);
    uint64_t v10 = objc_msgSend_count(v7, v8, v9);
    uint64_t v13 = objc_msgSend_fetchedZones(self, v11, v12);
    *(_DWORD *)buf = 134218242;
    uint64_t v47 = v10;
    __int16 v48 = 2112;
    v49 = v13;
    _os_log_impl(&dword_1C4CFF000, v4, OS_LOG_TYPE_INFO, "Checking Record PCS for %ld zones: %@", buf, 0x16u);
  }
  uint64_t v14 = objc_opt_new();
  objc_msgSend_setFetchAllChanges_(v14, v15, 1);
  v39 = self;
  v18 = objc_msgSend_fetchedZones(self, v16, v17);
  v20 = objc_msgSend_valueForKeyPath_(v18, v19, @"zoneID");

  v21 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v22 = v20;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v41, v45, 16);
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v42;
    uint64_t v27 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(v22);
        }
        uint64_t v29 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        v30 = objc_opt_new();
        objc_msgSend_setDesiredKeys_(v30, v31, v27);
        objc_msgSend_setObject_forKeyedSubscript_(v21, v32, (uint64_t)v30, v29);
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v33, (uint64_t)&v41, v45, 16);
    }
    while (v25);
  }

  objc_msgSend_setRecordZoneIDs_(v14, v34, (uint64_t)v22);
  objc_msgSend_setConfigurationsByRecordZoneID_(v14, v35, (uint64_t)v21);
  objc_msgSend_setForcePCSDecryptionAttempt_(v14, v36, 1);
  uint64_t v37 = objc_opt_class();
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = sub_1C4D9E6D8;
  v40[3] = &unk_1E64F0210;
  v40[4] = v39;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(v39, v38, v37, v14, v40);
}

- (void)_fetchZones
{
  uint64_t v3 = objc_opt_new();
  uint64_t v6 = objc_msgSend_zoneIDs(self, v4, v5);
  BOOL v9 = objc_msgSend_count(v6, v7, v8) == 0;
  objc_msgSend_setIsFetchAllRecordZonesOperation_(v3, v10, v9);

  uint64_t v13 = objc_msgSend_zoneIDs(self, v11, v12);
  objc_msgSend_setRecordZoneIDs_(v3, v14, (uint64_t)v13);

  objc_msgSend_setIgnorePCSFailures_(v3, v15, 1);
  uint64_t v16 = objc_opt_class();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4D9EAAC;
  v18[3] = &unk_1E64F0210;
  v18[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v17, v16, v3, v18);
}

- (NSArray)corruptRecords
{
  uint64_t v3 = objc_msgSend_mutableCorruptRecords(self, a2, v2);
  uint64_t v6 = objc_msgSend_copy(v3, v4, v5);

  return (NSArray *)v6;
}

- (void)main
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    objc_super v7 = NSStringFromClass(v6);
    BOOL v9 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v8, 1, 0, 0);
    uint64_t v12 = objc_msgSend_CKPropertiesStyleString(v9, v10, v11);
    uint64_t v14 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v13, 0, 1, 0);
    uint64_t v17 = objc_msgSend_CKPropertiesStyleString(v14, v15, v16);
    int v18 = 138544130;
    v19 = v7;
    __int16 v20 = 2048;
    v21 = self;
    __int16 v22 = 2114;
    v23 = v12;
    __int16 v24 = 2112;
    uint64_t v25 = v17;
    _os_log_debug_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_DEBUG, "Starting fetch record PCS diagnostics operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v18,
      0x2Au);
  }
  objc_msgSend_makeStateTransition_(self, v4, 0);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_msgSend_zoneIDs(self, v6, v7);
  uint64_t v10 = objc_msgSend_setWithArray_(v5, v9, (uint64_t)v8);

  if (objc_msgSend_count(v10, v11, v12))
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1C4D9F0F8;
    v15[3] = &unk_1E64F1D18;
    id v16 = v10;
    objc_msgSend_updateCloudKitMetrics_(self, v13, (uint64_t)v15);
  }
  v14.receiver = self;
  v14.super_class = (Class)CKDFetchRecordPCSDiagnosticsOperation;
  [(CKDOperation *)&v14 _finishOnCallbackQueueWithError:v4];
}

- (NSArray)zoneIDs
{
  return self->_zoneIDs;
}

- (void)setZoneIDs:(id)a3
{
}

- (NSMutableArray)fetchedZones
{
  return self->_fetchedZones;
}

- (void)setFetchedZones:(id)a3
{
}

- (NSMutableArray)mutableCorruptRecords
{
  return self->_mutableCorruptRecords;
}

- (void)setMutableCorruptRecords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableCorruptRecords, 0);
  objc_storeStrong((id *)&self->_fetchedZones, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
}

@end