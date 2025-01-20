@interface IDSCloudKitKeyValueStore
- (IDSCKContainer)container;
- (IDSCloudKitKeyValueStore)initWithContainer:(id)a3 queue:(id)a4;
- (OS_dispatch_queue)queue;
- (void)fetchDataForKey:(id)a3 completion:(id)a4;
- (void)fetchObjectForKey:(id)a3 completion:(id)a4;
- (void)setContainer:(id)a3;
- (void)setData:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setObject:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setQueue:(id)a3;
@end

@implementation IDSCloudKitKeyValueStore

- (IDSCloudKitKeyValueStore)initWithContainer:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSCloudKitKeyValueStore;
  v9 = [(IDSCloudKitKeyValueStore *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_container, a3);
  }

  return v10;
}

- (void)fetchDataForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [IDSCKRecordID alloc];
  v11 = objc_msgSend_initWithRecordName_(v8, v9, (uint64_t)v7, v10);

  v15 = objc_msgSend_container(self, v12, v13, v14);
  v19 = objc_msgSend_privateCloudDatabase(v15, v16, v17, v18);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_19DA272BC;
  v23[3] = &unk_1E5973D98;
  v23[4] = self;
  id v24 = v6;
  id v20 = v6;
  objc_msgSend_fetchRecordWithID_completionHandler_(v19, v21, (uint64_t)v11, v22, v23);
}

- (void)setData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [IDSCKRecordID alloc];
  double v14 = objc_msgSend_initWithRecordName_(v11, v12, (uint64_t)v9, v13);

  v15 = [IDSCKRecord alloc];
  double v18 = objc_msgSend_initWithRecordType_recordID_(v15, v16, @"IDSKeyValueStore", v17, v14);
  objc_msgSend_setObject_forKey_(v18, v19, (uint64_t)v10, v20, @"kPayloadKey");

  v21 = [IDSCKModifyRecordsOperation alloc];
  v49[0] = v18;
  id v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v22, (uint64_t)v49, v23, 1);
  v27 = objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(v21, v25, (uint64_t)v24, v26, 0);

  objc_msgSend_setSavePolicy_(v27, v28, 1, v29);
  uint64_t v43 = MEMORY[0x1E4F143A8];
  uint64_t v44 = 3221225472;
  v45 = sub_19DA27630;
  v46 = &unk_1E5973DC0;
  v47 = self;
  id v48 = v8;
  id v30 = v8;
  objc_msgSend_setModifyRecordsCompletionBlock_(v27, v31, (uint64_t)&v43, v32);
  v36 = objc_msgSend_container(self, v33, v34, v35, v43, v44, v45, v46, v47);
  v40 = objc_msgSend_privateCloudDatabase(v36, v37, v38, v39);
  objc_msgSend_addOperation_(v40, v41, (uint64_t)v27, v42);
}

- (void)fetchObjectForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_19DA277AC;
  v10[3] = &unk_1E5973E10;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  objc_msgSend_fetchDataForKey_completion_(self, v8, (uint64_t)a3, v9, v10);
}

- (void)setObject:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  double v9 = (void *)MEMORY[0x1E4F28DB0];
  id v10 = a4;
  double v13 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v9, v11, (uint64_t)a3, v12, 0, 0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_19DA279A0;
  v18[3] = &unk_1E5973E38;
  v18[4] = self;
  id v19 = v8;
  id v14 = v8;
  v15 = self;
  objc_msgSend_setData_forKey_completion_(v15, v16, (uint64_t)v13, v17, v10, v18);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSCKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end