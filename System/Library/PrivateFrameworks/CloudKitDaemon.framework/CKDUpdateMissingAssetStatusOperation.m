@interface CKDUpdateMissingAssetStatusOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)isPackage;
- (BOOL)makeStateTransition;
- (BOOL)recovered;
- (CKDFetchRecordsOperation)fetchOperation;
- (CKDModifyRecordsOperation)modifyOperation;
- (CKDUpdateMissingAssetStatusOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKRecord)record;
- (CKRecordID)repairRecordID;
- (NSArray)assetPutReceipts;
- (NSArray)assetSizes;
- (id)activityCreate;
- (int)operationType;
- (void)_updateMissingAssetStatus;
- (void)main;
- (void)setAssetPutReceipts:(id)a3;
- (void)setAssetSizes:(id)a3;
- (void)setFetchOperation:(id)a3;
- (void)setIsPackage:(BOOL)a3;
- (void)setModifyOperation:(id)a3;
- (void)setRecord:(id)a3;
- (void)setRecovered:(BOOL)a3;
- (void)setRepairRecordID:(id)a3;
@end

@implementation CKDUpdateMissingAssetStatusOperation

- (CKDUpdateMissingAssetStatusOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CKDUpdateMissingAssetStatusOperation;
  v9 = [(CKDDatabaseOperation *)&v25 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_repairRecordID(v6, v7, v8);
    repairRecordID = v9->_repairRecordID;
    v9->_repairRecordID = (CKRecordID *)v10;

    v9->_recovered = objc_msgSend_recovered(v6, v12, v13);
    v9->_isPackage = objc_msgSend_isPackage(v6, v14, v15);
    uint64_t v18 = objc_msgSend_assetSizes(v6, v16, v17);
    assetSizes = v9->_assetSizes;
    v9->_assetSizes = (NSArray *)v18;

    uint64_t v22 = objc_msgSend_assetPutReceipts(v6, v20, v21);
    assetPutReceipts = v9->_assetPutReceipts;
    v9->_assetPutReceipts = (NSArray *)v22;
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/update-missing-assets", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)makeStateTransition
{
  uint64_t v4 = objc_msgSend_state(self, a2, v2);
  if (v4 == 2)
  {
    objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
    uint64_t v10 = objc_msgSend_error(self, v8, v9);
    objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);
  }
  else if (v4 == 1)
  {
    objc_msgSend_setState_(self, v5, 2);
    objc_msgSend__updateMissingAssetStatus(self, v6, v7);
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 == 2)
  {
    v5 = @"Call UpdateMissingAssetStatus";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDUpdateMissingAssetStatusOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int)operationType
{
  return 260;
}

- (void)_updateMissingAssetStatus
{
  if (objc_msgSend_recovered(self, a2, v2))
  {
    char isPackage = objc_msgSend_isPackage(self, v4, v5);
    objc_super v7 = [CKDUpdateMissingAssetStatusURLRequest alloc];
    uint64_t v10 = objc_msgSend_repairRecordID(self, v8, v9);
    uint64_t v13 = objc_msgSend_assetSizes(self, v11, v12);
    v16 = v13;
    if (isPackage)
    {
      uint64_t v17 = objc_msgSend_assetPutReceipts(self, v14, v15);
      v19 = objc_msgSend_initWithOperation_recoveredPackageRepairRecordID_sizes_putReceipts_(v7, v18, (uint64_t)self, v10, v16, v17);
    }
    else
    {
      uint64_t v17 = objc_msgSend_firstObject(v13, v14, v15);
      uint64_t v26 = objc_msgSend_unsignedIntegerValue(v17, v24, v25);
      v29 = objc_msgSend_assetPutReceipts(self, v27, v28);
      v32 = objc_msgSend_firstObject(v29, v30, v31);
      v19 = objc_msgSend_initWithOperation_recoveredAssetRepairRecordID_size_putReceipt_(v7, v33, (uint64_t)self, v10, v26, v32);
    }
  }
  else
  {
    v20 = [CKDUpdateMissingAssetStatusURLRequest alloc];
    uint64_t v10 = objc_msgSend_repairRecordID(self, v21, v22);
    v19 = objc_msgSend_initWithOperation_unrecoveredRepairRecordID_(v20, v23, (uint64_t)self, v10);
  }

  objc_initWeak(&location, self);
  objc_initWeak(&from, v19);
  v36 = objc_msgSend_stateTransitionGroup(self, v34, v35);
  dispatch_group_enter(v36);

  uint64_t v43 = MEMORY[0x1E4F143A8];
  uint64_t v44 = 3221225472;
  v45 = sub_1C4EFD180;
  v46 = &unk_1E64F0170;
  objc_copyWeak(&v47, &location);
  objc_copyWeak(&v48, &from);
  objc_msgSend_setCompletionBlock_(v19, v37, (uint64_t)&v43);
  objc_msgSend_setRequest_(self, v38, (uint64_t)v19, v43, v44, v45, v46);
  v41 = objc_msgSend_container(self, v39, v40);
  objc_msgSend_performRequest_(v41, v42, (uint64_t)v19);

  objc_destroyWeak(&v48);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)main
{
}

- (CKRecordID)repairRecordID
{
  return self->_repairRecordID;
}

- (void)setRepairRecordID:(id)a3
{
}

- (BOOL)recovered
{
  return self->_recovered;
}

- (void)setRecovered:(BOOL)a3
{
  self->_recovered = a3;
}

- (BOOL)isPackage
{
  return self->_isPackage;
}

- (void)setIsPackage:(BOOL)a3
{
  self->_char isPackage = a3;
}

- (NSArray)assetSizes
{
  return self->_assetSizes;
}

- (void)setAssetSizes:(id)a3
{
}

- (NSArray)assetPutReceipts
{
  return self->_assetPutReceipts;
}

- (void)setAssetPutReceipts:(id)a3
{
}

- (CKDFetchRecordsOperation)fetchOperation
{
  return self->_fetchOperation;
}

- (void)setFetchOperation:(id)a3
{
}

- (CKDModifyRecordsOperation)modifyOperation
{
  return self->_modifyOperation;
}

- (void)setModifyOperation:(id)a3
{
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_modifyOperation, 0);
  objc_storeStrong((id *)&self->_fetchOperation, 0);
  objc_storeStrong((id *)&self->_assetPutReceipts, 0);
  objc_storeStrong((id *)&self->_assetSizes, 0);
  objc_storeStrong((id *)&self->_repairRecordID, 0);
}

@end