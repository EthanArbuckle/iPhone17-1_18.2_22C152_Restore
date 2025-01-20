@interface CKSyncEngineBatch
+ (void)initialize;
- (BOOL)isAtomic;
- (BOOL)isCustomBatch;
- (CKSyncEngineBatch)initWithRecordsToSave:(id)a3 recordIDsToDelete:(id)a4;
- (NSArray)deletedRecordIDs;
- (NSArray)recordIDsToDelete;
- (NSArray)recordsToSave;
- (NSArray)savedRecords;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)description;
- (void)setAtomic:(BOOL)a3;
- (void)setCustomBatch:(BOOL)a3;
- (void)setDeletedRecordIDs:(id)a3;
- (void)setSavedRecords:(id)a3;
@end

@implementation CKSyncEngineBatch

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKSyncEngineBatch)initWithRecordsToSave:(id)a3 recordIDsToDelete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CKSyncEngineBatch;
  v8 = [(CKSyncEngineBatch *)&v23 init];
  v12 = v8;
  if (v8)
  {
    v8->_atomic = 1;
    uint64_t v13 = objc_msgSend_copy(v6, v9, v10, v11);
    recordsToSave = v12->_recordsToSave;
    v12->_recordsToSave = (NSArray *)v13;

    uint64_t v18 = objc_msgSend_copy(v7, v15, v16, v17);
    recordIDsToDelete = v12->_recordIDsToDelete;
    v12->_recordIDsToDelete = (NSArray *)v18;

    savedRecords = v12->_savedRecords;
    v12->_savedRecords = 0;

    deletedRecordIDs = v12->_deletedRecordIDs;
    v12->_deletedRecordIDs = 0;

    v12->_customBatch = 0;
  }

  return v12;
}

- (id)description
{
  return (id)((uint64_t (*)(CKSyncEngineBatch *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = objc_msgSend_recordsToSave(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_count(v10, v11, v12, v13);

  if (v14)
  {
    uint64_t v18 = objc_msgSend_recordsToSave(self, v15, v16, v17);
    v21 = objc_msgSend_CKMap_(v18, v19, (uint64_t)&unk_1ED7EEF38, v20);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v22, (uint64_t)v21, @"recordIDsToSave");
  }
  objc_super v23 = objc_msgSend_recordIDsToDelete(self, v15, v16, v17);
  uint64_t v27 = objc_msgSend_count(v23, v24, v25, v26);

  if (v27)
  {
    v31 = objc_msgSend_recordIDsToDelete(self, v28, v29, v30);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v32, (uint64_t)v31, @"recordIDsToDelete");
  }
  v33 = objc_msgSend_savedRecords(self, v28, v29, v30);
  uint64_t v37 = objc_msgSend_count(v33, v34, v35, v36);

  if (v37)
  {
    v41 = objc_msgSend_savedRecords(self, v38, v39, v40);
    v44 = objc_msgSend_CKMap_(v41, v42, (uint64_t)&unk_1ED7F0758, v43);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v45, (uint64_t)v44, @"savedRecordIDs");
  }
  v46 = objc_msgSend_deletedRecordIDs(self, v38, v39, v40);
  uint64_t v50 = objc_msgSend_count(v46, v47, v48, v49);

  if (v50)
  {
    v54 = objc_msgSend_deletedRecordIDs(self, v51, v52, v53);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v55, (uint64_t)v54, @"deletedRecordIDs");
  }
  v56 = NSNumber;
  uint64_t isAtomic = objc_msgSend_isAtomic(self, v51, v52, v53);
  v60 = objc_msgSend_numberWithBool_(v56, v58, isAtomic, v59);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v61, (uint64_t)v60, @"atomicByZone");

  return v6;
}

- (NSArray)recordsToSave
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)recordIDsToDelete
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)savedRecords
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSavedRecords:(id)a3
{
}

- (NSArray)deletedRecordIDs
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeletedRecordIDs:(id)a3
{
}

- (BOOL)isAtomic
{
  return self->_atomic;
}

- (void)setAtomic:(BOOL)a3
{
  self->_atomic = a3;
}

- (BOOL)isCustomBatch
{
  return self->_customBatch;
}

- (void)setCustomBatch:(BOOL)a3
{
  self->_customBatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_savedRecords, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);

  objc_storeStrong((id *)&self->_recordsToSave, 0);
}

@end