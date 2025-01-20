@interface CKSyncEngineRecordZoneChangeBatch
- (BOOL)atomicByZone;
- (CKSyncEngineRecordZoneChangeBatch)init;
- (CKSyncEngineRecordZoneChangeBatch)initWithPendingChanges:(NSArray *)pendingChanges recordProvider:(void *)recordProvider;
- (CKSyncEngineRecordZoneChangeBatch)initWithRecordsToSave:(NSArray *)recordsToSave recordIDsToDelete:(NSArray *)recordIDsToDelete atomicByZone:(BOOL)atomicByZone;
- (CKSyncEngineRecordZoneChangeBatch)initWith__pendingChanges:(id)a3 recordProvider:(id)a4;
- (NSArray)recordIDsToDelete;
- (NSArray)recordsToSave;
- (NSString)description;
- (id)redactedDescription;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)setAtomicByZone:(BOOL)atomicByZone;
@end

@implementation CKSyncEngineRecordZoneChangeBatch

- (CKSyncEngineRecordZoneChangeBatch)initWith__pendingChanges:(id)a3 recordProvider:(id)a4
{
  v5 = _Block_copy(a4);
  sub_18AF34EA0(0, (unint64_t *)&unk_1E9125200);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  sub_18AF47A7C(v6, self, v5);
  return result;
}

- (CKSyncEngineRecordZoneChangeBatch)initWithPendingChanges:(NSArray *)pendingChanges recordProvider:(void *)recordProvider
{
  return (CKSyncEngineRecordZoneChangeBatch *)MEMORY[0x1F4181798](self, sel_initWith__pendingChanges_recordProvider_, pendingChanges, recordProvider);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);

  objc_storeStrong((id *)&self->_recordsToSave, 0);
}

- (CKSyncEngineRecordZoneChangeBatch)initWithRecordsToSave:(NSArray *)recordsToSave recordIDsToDelete:(NSArray *)recordIDsToDelete atomicByZone:(BOOL)atomicByZone
{
  v8 = recordsToSave;
  v9 = recordIDsToDelete;
  v25.receiver = self;
  v25.super_class = (Class)CKSyncEngineRecordZoneChangeBatch;
  v13 = [(CKSyncEngineRecordZoneChangeBatch *)&v25 init];
  if (v13)
  {
    uint64_t v14 = objc_msgSend_copy(v8, v10, v11, v12);
    v15 = (void *)v14;
    v16 = (void *)MEMORY[0x1E4F1CBF0];
    if (v14) {
      v17 = (void *)v14;
    }
    else {
      v17 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v13->_recordsToSave, v17);

    uint64_t v21 = objc_msgSend_copy(v9, v18, v19, v20);
    v22 = (void *)v21;
    if (v21) {
      v23 = (void *)v21;
    }
    else {
      v23 = v16;
    }
    objc_storeStrong((id *)&v13->_recordIDsToDelete, v23);

    v13->_atomicByZone = atomicByZone;
  }

  return v13;
}

- (CKSyncEngineRecordZoneChangeBatch)init
{
  v2 = [CKException alloc];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, @"-[%@ init] is unavailable", v5);

  objc_exception_throw(v7);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineRecordZoneChangeBatch *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineRecordZoneChangeBatch *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v36 = a3;
  id v7 = objc_msgSend_recordsToSave(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_count(v7, v8, v9, v10);

  if (v11)
  {
    v15 = objc_msgSend_recordsToSave(self, v12, v13, v14);
    v18 = objc_msgSend_CKMap_(v15, v16, (uint64_t)&unk_1ED7EF078, v17);

    objc_msgSend_addProperty_value_shouldRedact_(v36, v19, @"recordIDsToSave", (uint64_t)v18, 0);
  }
  uint64_t v20 = objc_msgSend_recordIDsToDelete(self, v12, v13, v14);
  uint64_t v24 = objc_msgSend_count(v20, v21, v22, v23);

  if (v24)
  {
    v28 = objc_msgSend_recordIDsToDelete(self, v25, v26, v27);
    objc_msgSend_addProperty_value_shouldRedact_(v36, v29, @"recordIDsToDelete", (uint64_t)v28, 0);
  }
  v30 = NSNumber;
  uint64_t v31 = objc_msgSend_atomicByZone(self, v25, v26, v27);
  v34 = objc_msgSend_numberWithBool_(v30, v32, v31, v33);
  objc_msgSend_addProperty_value_shouldRedact_(v36, v35, @"atomicByZone", (uint64_t)v34, 0);
}

- (NSArray)recordsToSave
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)recordIDsToDelete
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)atomicByZone
{
  return self->_atomicByZone;
}

- (void)setAtomicByZone:(BOOL)atomicByZone
{
  self->_atomicByZone = atomicByZone;
}

@end