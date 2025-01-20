@interface IDSCloudKitKeyElectionStore
+ (BOOL)isItemNotFoundError:(id)a3;
- (IDSCKDatabase)database;
- (IDSCloudKitKeyElectionStore)initWithDatabase:(id)a3 queue:(id)a4;
- (OS_dispatch_queue)queue;
- (id)_itemFromRecord:(id)a3 error:(id *)a4;
- (id)_recordFromItem:(id)a3;
- (id)_recordID;
- (void)fetchAccountIdentityItemWithCompletion:(id)a3;
- (void)removeAccountIdentityItemWithCompletion:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setQueue:(id)a3;
- (void)storeAccountIdentityItem:(id)a3 withCompletion:(id)a4;
@end

@implementation IDSCloudKitKeyElectionStore

+ (BOOL)isItemNotFoundError:(id)a3
{
  id v3 = a3;
  v7 = objc_msgSend_domain(v3, v4, v5, v6);
  v8 = sub_19DA94020();
  if (objc_msgSend_isEqualToString_(v7, v9, (uint64_t)v8, v10)) {
    BOOL v14 = objc_msgSend_code(v3, v11, v12, v13) == 11;
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

- (IDSCloudKitKeyElectionStore)initWithDatabase:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSCloudKitKeyElectionStore;
  v9 = [(IDSCloudKitKeyElectionStore *)&v12 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (void)fetchAccountIdentityItemWithCompletion:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_queue(self, v5, v6, v7);
  dispatch_assert_queue_V2(v8);

  objc_super v12 = objc_msgSend_accountIdentity(IDSFoundationLog, v9, v10, v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_INFO, "Fetching account identity item", buf, 2u);
  }

  v16 = objc_msgSend__recordID(self, v13, v14, v15);
  v20 = objc_msgSend_database(self, v17, v18, v19);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_19DAC2968;
  v24[3] = &unk_1E5973D98;
  v24[4] = self;
  id v25 = v4;
  id v21 = v4;
  objc_msgSend_fetchRecordWithID_completionHandler_(v20, v22, (uint64_t)v16, v23, v24);
}

- (void)removeAccountIdentityItemWithCompletion:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_queue(self, v5, v6, v7);
  dispatch_assert_queue_V2(v8);

  objc_super v12 = objc_msgSend_accountIdentity(IDSFoundationLog, v9, v10, v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_INFO, "Fetching account identity item", buf, 2u);
  }

  v16 = objc_msgSend__recordID(self, v13, v14, v15);
  v20 = objc_msgSend_database(self, v17, v18, v19);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_19DAC2E28;
  v24[3] = &unk_1E5974AD8;
  v24[4] = self;
  id v25 = v4;
  id v21 = v4;
  objc_msgSend_deleteRecordWithID_completionHandler_(v20, v22, (uint64_t)v16, v23, v24);
}

- (void)storeAccountIdentityItem:(id)a3 withCompletion:(id)a4
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_super v12 = objc_msgSend_queue(self, v9, v10, v11);
  dispatch_assert_queue_V2(v12);

  v16 = objc_msgSend_accountIdentity(IDSFoundationLog, v13, v14, v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_INFO, "Storing account identity item", buf, 2u);
  }

  if (!v7)
  {
    v47 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18, v19);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v47, v48, (uint64_t)a2, v49, self, @"IDSCloudKitKeyElectionStore.m", 102, @"Invalid parameter not satisfying: %@", @"item");
  }
  v20 = objc_msgSend_groupName(v7, v17, v18, v19);

  if (!v20)
  {
    v50 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v21, v22, v23);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v50, v51, (uint64_t)a2, v52, self, @"IDSCloudKitKeyElectionStore.m", 103, @"Invalid parameter not satisfying: %@", @"item.groupName");
  }
  v24 = objc_msgSend_groupID(v7, v21, v22, v23);

  if (!v24)
  {
    v53 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v25, v26, v27);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v53, v54, (uint64_t)a2, v55, self, @"IDSCloudKitKeyElectionStore.m", 104, @"Invalid parameter not satisfying: %@", @"item.groupID");
  }
  v28 = objc_msgSend__recordFromItem_(self, v25, (uint64_t)v7, v27);
  v29 = [IDSCKModifyRecordsOperation alloc];
  v61[0] = v28;
  v32 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v30, (uint64_t)v61, v31, 1);
  v35 = objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(v29, v33, (uint64_t)v32, v34, 0);

  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = sub_19DAC31FC;
  v56[3] = &unk_1E5974B00;
  v56[4] = self;
  id v57 = v28;
  id v58 = v7;
  id v59 = v8;
  id v36 = v7;
  id v37 = v8;
  id v38 = v28;
  objc_msgSend_setModifyRecordsCompletionBlock_(v35, v39, (uint64_t)v56, v40);
  v44 = objc_msgSend_database(self, v41, v42, v43);
  objc_msgSend_addOperation_(v44, v45, (uint64_t)v35, v46);
}

- (id)_itemFromRecord:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"kGroupNameKey", v7);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v5, v9, @"kGroupIDKey", v10);
  double v15 = (void *)v11;
  if (v8 && v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v19 = objc_alloc(MEMORY[0x1E4F61158]);
      uint64_t v22 = objc_msgSend_initWithDataRepresentation_(v19, v20, (uint64_t)v15, v21);
      if (v22)
      {
        uint64_t v26 = (void *)v22;
        double v27 = objc_alloc_init(IDSCloudKitKeyElectionStoreItem);
        objc_msgSend_setGroupID_(v27, v28, (uint64_t)v26, v29);
        objc_msgSend_setGroupName_(v27, v30, (uint64_t)v8, v31);

        goto LABEL_14;
      }
      v32 = objc_msgSend_accountIdentity(IDSFoundationLog, v23, v24, v25);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        sub_19DB7E954((uint64_t)v15, v32, v48, v49, v50, v51, v52, v53);
      }
    }
    else
    {
      v32 = objc_msgSend_accountIdentity(IDSFoundationLog, v16, v17, v18);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        sub_19DB7E9C0((uint64_t)v5, v32, v39, v40, v41, v42, v43, v44);
      }
    }
  }
  else
  {
    v32 = objc_msgSend_accountIdentity(IDSFoundationLog, v12, v13, v14);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      sub_19DB7EA2C((uint64_t)v5, v32, v33, v34, v35, v36, v37, v38);
    }
  }

  if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v45, @"IDSCloudKitKeyElectionStoreErrorDomain", v46, -1000, 0);
    double v27 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v27 = 0;
  }
LABEL_14:

  return v27;
}

- (id)_recordFromItem:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_groupID(v4, v5, v6, v7);
  objc_super v12 = objc_msgSend_dataRepresentation(v8, v9, v10, v11);

  v16 = objc_msgSend__recordID(self, v13, v14, v15);
  uint64_t v17 = [IDSCKRecord alloc];
  v20 = objc_msgSend_initWithRecordType_recordID_(v17, v18, @"IDSCloudKitKeyElectionStoreItem", v19, v16);
  uint64_t v24 = objc_msgSend_groupName(v4, v21, v22, v23);

  objc_msgSend_setObject_forKeyedSubscript_(v20, v25, (uint64_t)v24, v26, @"kGroupNameKey");
  objc_msgSend_setObject_forKeyedSubscript_(v20, v27, (uint64_t)v12, v28, @"kGroupIDKey");

  return v20;
}

- (id)_recordID
{
  v2 = NSString;
  id v3 = _IDSEngramKeyElectorVersion();
  uint64_t v6 = objc_msgSend_stringWithFormat_(v2, v4, @"%@-%@", v5, @"IDSCloudKitKeyElectionStoreItem", v3);

  double v7 = [IDSCKRecordID alloc];
  uint64_t v10 = objc_msgSend_initWithRecordName_(v7, v8, (uint64_t)v6, v9);

  return v10;
}

- (IDSCKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end