@interface IDSCloudKitTransportLog
+ (id)_messageFromRecord:(id)a3;
- (IDSCKDatabase)database;
- (IDSCloudKitTransportLog)initWithDatabase:(id)a3 queue:(id)a4;
- (OS_dispatch_queue)queue;
- (id)_recordIDsToFetch;
- (id)_transportRecordZoneID;
- (void)createZone:(id)a3;
- (void)disabled_fetchChangesSinceToken:(id)a3 completion:(id)a4;
- (void)dropZone:(id)a3;
- (void)fetchChangesSinceToken:(id)a3 completion:(id)a4;
@end

@implementation IDSCloudKitTransportLog

- (IDSCloudKitTransportLog)initWithDatabase:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSCloudKitTransportLog;
  v9 = [(IDSCloudKitTransportLog *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (id)_recordIDsToFetch
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = objc_msgSend_count(&unk_1EF029500, v3, v4, v5);
  v9 = objc_msgSend_initWithCapacity_(v2, v7, v6, v8);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF029500, v10, (uint64_t)&v25, 0.0, v29, 16);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(&unk_1EF029500);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v16 = [IDSCKRecordID alloc];
        v19 = objc_msgSend_initWithRecordName_(v16, v17, v15, v18);
        objc_msgSend_addObject_(v9, v20, (uint64_t)v19, v21);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF029500, v22, (uint64_t)&v25, v23, v29, 16);
    }
    while (v12);
  }
  return v9;
}

- (void)fetchChangesSinceToken:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v32 = _os_activity_create(&dword_19D9BE000, "Fetching hard-coded transport log changes", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v32, &state);
  uint64_t v11 = objc_msgSend_cloudKit(IDSFoundationLog, v8, v9, v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v6;
    _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "!setState serverChangeToken=%@", buf, 0xCu);
  }

  uint64_t v12 = [IDSCKFetchRecordsOperation alloc];
  v16 = objc_msgSend__recordIDsToFetch(self, v13, v14, v15);
  v19 = objc_msgSend_initWithRecordIDs_(v12, v17, (uint64_t)v16, v18);

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_19DACA5F8;
  v29[3] = &unk_1E5974BA0;
  v29[4] = self;
  id v20 = v7;
  id v30 = v20;
  objc_msgSend_setFetchRecordsCompletionBlock_(v19, v21, (uint64_t)v29, v22);
  long long v26 = objc_msgSend_database(self, v23, v24, v25);
  objc_msgSend_addOperation_(v26, v27, (uint64_t)v19, v28);

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)createZone:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v8 = objc_msgSend_cloudKit(IDSFoundationLog, v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "TransportRecordZone - Create - Begin", buf, 2u);
  }

  uint64_t v9 = [IDSCKRecordZone alloc];
  uint64_t v13 = objc_msgSend__transportRecordZoneID(self, v10, v11, v12);
  v16 = objc_msgSend_initWithZoneID_(v9, v14, (uint64_t)v13, v15);

  v17 = [IDSCKModifyRecordZonesOperation alloc];
  v40[0] = v16;
  id v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v40, v19, 1);
  double v23 = objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(v17, v21, (uint64_t)v20, v22, 0);

  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  uint64_t v35 = sub_19DACAB0C;
  v36 = &unk_1E5973DC0;
  v37 = self;
  id v38 = v4;
  id v24 = v4;
  objc_msgSend_setModifyRecordZonesCompletionBlock_(v23, v25, (uint64_t)&v33, v26);
  id v30 = objc_msgSend_database(self, v27, v28, v29, v33, v34, v35, v36, v37);
  objc_msgSend_addOperation_(v30, v31, (uint64_t)v23, v32);
}

- (void)dropZone:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v8 = objc_msgSend_cloudKit(IDSFoundationLog, v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "TransportRecordZone - Drop - Begin", buf, 2u);
  }

  uint64_t v9 = [IDSCKModifyRecordZonesOperation alloc];
  uint64_t v13 = objc_msgSend__transportRecordZoneID(self, v10, v11, v12);
  v36[0] = v13;
  v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v14, (uint64_t)v36, v15, 1);
  double v19 = objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(v9, v17, 0, v18, v16);

  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = sub_19DACAE34;
  double v32 = &unk_1E5973DC0;
  uint64_t v33 = self;
  id v34 = v4;
  id v20 = v4;
  objc_msgSend_setModifyRecordZonesCompletionBlock_(v19, v21, (uint64_t)&v29, v22);
  double v26 = objc_msgSend_database(self, v23, v24, v25, v29, v30, v31, v32, v33);
  objc_msgSend_addOperation_(v26, v27, (uint64_t)v19, v28);
}

- (id)_transportRecordZoneID
{
  id v2 = [IDSCKRecordZoneID alloc];
  v3 = sub_19DA93F7C();
  uint64_t v6 = objc_msgSend_initWithZoneName_ownerName_(v2, v4, @"TransportZone", v5, v3);

  return v6;
}

- (void)disabled_fetchChangesSinceToken:(id)a3 completion:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v57 = _os_activity_create(&dword_19D9BE000, "Fetch transport log changes", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v57, &state);
  uint64_t v11 = objc_msgSend_cloudKit(IDSFoundationLog, v8, v9, v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v62 = v6;
    _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "!setState serverChangeToken=%@", buf, 0xCu);
  }

  double v12 = [IDSCKRecordZoneID alloc];
  uint64_t v13 = sub_19DA93ED8();
  uint64_t v14 = sub_19DA93F7C();
  v17 = objc_msgSend_initWithZoneName_ownerName_(v12, v15, (uint64_t)v13, v16, v14);

  double v18 = objc_alloc_init(IDSCKFetchRecordZoneChangesOptions);
  double v22 = objc_msgSend_ckToken(v6, v19, v20, v21);
  objc_msgSend_setPreviousServerChangeToken_(v18, v23, (uint64_t)v22, v24);

  double v25 = [IDSCKFetchRecordZoneChangesOperation alloc];
  v60 = v17;
  double v28 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v26, (uint64_t)&v60, v27, 1);
  v58 = v17;
  v59 = v18;
  v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v29, (uint64_t)&v59, v30, &v58, 1);
  id v34 = objc_msgSend_initWithRecordZoneIDs_optionsByRecordZoneID_(v25, v32, (uint64_t)v28, v33, v31);

  objc_msgSend_setFetchAllChanges_(v34, v35, 0, v36);
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = sub_19DACB3A4;
  v54[3] = &unk_1E5974BC8;
  v54[4] = self;
  id v38 = v37;
  id v55 = v38;
  objc_msgSend_setRecordChangedBlock_(v34, v39, (uint64_t)v54, v40);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = sub_19DACB424;
  v51[3] = &unk_1E5974C18;
  v51[4] = self;
  id v41 = v7;
  id v53 = v41;
  id v42 = v38;
  id v52 = v42;
  objc_msgSend_setRecordZoneFetchCompletionBlock_(v34, v43, (uint64_t)v51, v44);
  v48 = objc_msgSend_database(self, v45, v46, v47);
  objc_msgSend_addOperation_(v48, v49, (uint64_t)v34, v50);

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

+ (id)_messageFromRecord:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(IDSCloudKitTransportLogMessage);
  id v7 = objc_msgSend_objectForKey_(v3, v5, @"secondary_id", v6);
  objc_msgSend_setSecondaryID_(v4, v8, (uint64_t)v7, v9);

  double v12 = objc_msgSend_objectForKey_(v3, v10, @"payload", v11);
  objc_msgSend_setPayload_(v4, v13, (uint64_t)v12, v14);

  v17 = objc_msgSend_objectForKey_(v3, v15, @"encryption_type", v16);
  objc_msgSend_setEncryptionType_(v4, v18, (uint64_t)v17, v19);

  double v22 = objc_msgSend_objectForKey_(v3, v20, @"device_id", v21);
  objc_msgSend_setDeviceID_(v4, v23, (uint64_t)v22, v24);

  double v28 = objc_msgSend_objectForKey_(v3, v25, @"payload", v26);
  if (!v28) {
    goto LABEL_4;
  }
  id v38 = 0;
  double v30 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], v27, (uint64_t)v28, v29, 0, 0, &v38);
  id v33 = v38;
  if (v30)
  {
    objc_msgSend_setPayload_(v4, v31, (uint64_t)v30, v34);

LABEL_4:
    uint64_t v35 = v4;
    goto LABEL_8;
  }
  double v36 = objc_msgSend_cloudKit(IDSFoundationLog, v31, v32, v34);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
    sub_19DB7EE88();
  }

  uint64_t v35 = 0;
LABEL_8:

  return v35;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IDSCKDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end