@interface CKSyncEngineSentRecordZoneChangesEvent
- (CKSyncEngineSentRecordZoneChangesEvent)initWithSavedRecords:(id)a3 failedRecordSaves:(id)a4 deletedRecordIDs:(id)a5 failedRecordDeletes:(id)a6;
- (NSArray)deletedRecordIDs;
- (NSArray)failedRecordSaves;
- (NSArray)savedRecords;
- (NSDictionary)failedRecordDeletes;
- (int64_t)type;
- (void)CKDescribePropertiesUsing:(id)a3;
@end

@implementation CKSyncEngineSentRecordZoneChangesEvent

- (CKSyncEngineSentRecordZoneChangesEvent)initWithSavedRecords:(id)a3 failedRecordSaves:(id)a4 deletedRecordIDs:(id)a5 failedRecordDeletes:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v57 = 0;
  char v14 = _CKCheckArgument((uint64_t)"savedRecords", v10, 0, 0, 0, &v57);
  id v15 = v57;
  if ((v14 & 1) == 0) {
    goto LABEL_8;
  }

  id v56 = 0;
  char v16 = _CKCheckArgument((uint64_t)"failedRecordSaves", v11, 0, 0, 0, &v56);
  id v15 = v56;
  if ((v16 & 1) == 0) {
    goto LABEL_8;
  }

  id v55 = 0;
  char v17 = _CKCheckArgument((uint64_t)"deletedRecordIDs", v12, 0, 0, 0, &v55);
  id v15 = v55;
  if ((v17 & 1) == 0
    || (v15,
        id v54 = 0,
        char v18 = _CKCheckArgument((uint64_t)"failedRecordDeletes", v13, 0, 0, 0, &v54),
        id v15 = v54,
        (v18 & 1) == 0))
  {
LABEL_8:
    v41 = v15;
    v42 = [CKException alloc];
    uint64_t v46 = objc_msgSend_code(v41, v43, v44, v45);
    v50 = objc_msgSend_localizedDescription(v41, v47, v48, v49);
    id v52 = (id)objc_msgSend_initWithCode_format_(v42, v51, v46, @"%@", v50);

    objc_exception_throw(v52);
  }

  v53.receiver = self;
  v53.super_class = (Class)CKSyncEngineSentRecordZoneChangesEvent;
  v22 = [(CKSyncEngineEvent *)&v53 initInternal];
  if (v22)
  {
    uint64_t v23 = objc_msgSend_copy(v10, v19, v20, v21);
    savedRecords = v22->_savedRecords;
    v22->_savedRecords = (NSArray *)v23;

    uint64_t v28 = objc_msgSend_copy(v11, v25, v26, v27);
    failedRecordSaves = v22->_failedRecordSaves;
    v22->_failedRecordSaves = (NSArray *)v28;

    uint64_t v33 = objc_msgSend_copy(v12, v30, v31, v32);
    deletedRecordIDs = v22->_deletedRecordIDs;
    v22->_deletedRecordIDs = (NSArray *)v33;

    uint64_t v38 = objc_msgSend_copy(v13, v35, v36, v37);
    failedRecordDeletes = v22->_failedRecordDeletes;
    v22->_failedRecordDeletes = (NSDictionary *)v38;
  }
  return v22;
}

- (int64_t)type
{
  return 5;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)CKSyncEngineSentRecordZoneChangesEvent;
  id v4 = a3;
  [(CKSyncEngineEvent *)&v28 CKDescribePropertiesUsing:v4];
  v8 = objc_msgSend_savedRecords(self, v5, v6, v7, v28.receiver, v28.super_class);
  id v11 = objc_msgSend_CKMap_(v8, v9, (uint64_t)&unk_1ED7EFBF8, v10);

  objc_msgSend_addProperty_value_shouldRedact_(v4, v12, @"savedRecords", (uint64_t)v11, 0);
  char v16 = objc_msgSend_failedRecordSaves(self, v13, v14, v15);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v17, @"failedRecordSaves", (uint64_t)v16, 0);

  uint64_t v21 = objc_msgSend_deletedRecordIDs(self, v18, v19, v20);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v22, @"deletedRecordIDs", (uint64_t)v21, 0);

  uint64_t v26 = objc_msgSend_failedRecordDeletes(self, v23, v24, v25);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v27, @"failedRecordDeletes", (uint64_t)v26, 0);
}

- (NSArray)savedRecords
{
  return self->_savedRecords;
}

- (NSArray)failedRecordSaves
{
  return self->_failedRecordSaves;
}

- (NSArray)deletedRecordIDs
{
  return self->_deletedRecordIDs;
}

- (NSDictionary)failedRecordDeletes
{
  return self->_failedRecordDeletes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedRecordDeletes, 0);
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_failedRecordSaves, 0);

  objc_storeStrong((id *)&self->_savedRecords, 0);
}

@end