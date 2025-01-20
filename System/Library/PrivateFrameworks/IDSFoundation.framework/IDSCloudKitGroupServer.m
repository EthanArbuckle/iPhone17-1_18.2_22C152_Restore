@interface IDSCloudKitGroupServer
- (IDSCKDatabase)database;
- (IDSCloudKitGroupServer)initWithDatabase:(id)a3 queue:(id)a4;
- (OS_dispatch_queue)queue;
- (void)fetchGroupWithID:(id)a3 inContext:(id)a4 completion:(id)a5;
- (void)fetchGroupsWithStableGroupID:(id)a3 inContext:(id)a4 completion:(id)a5;
- (void)q_groupFromRecord:(id)a3 inContext:(id)a4 completion:(id)a5;
- (void)saveGroup:(id)a3 inContext:(id)a4 completion:(id)a5;
- (void)setDatabase:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation IDSCloudKitGroupServer

- (IDSCloudKitGroupServer)initWithDatabase:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSCloudKitGroupServer;
  v9 = [(IDSCloudKitGroupServer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_database, a3);
  }

  return v10;
}

- (void)saveGroup:(id)a3 inContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F61160];
  id v11 = a4;
  v15 = objc_msgSend_groupContext(v10, v12, v13, v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_INFO, "Save to group server", buf, 2u);
  }

  v19 = objc_msgSend_groupID(v8, v16, v17, v18);
  v23 = objc_msgSend_dataRepresentation(v19, v20, v21, v22);
  v26 = objc_msgSend_base64EncodedStringWithOptions_(v23, v24, 0, v25);

  v27 = [IDSCKRecordID alloc];
  v30 = objc_msgSend_initWithRecordName_(v27, v28, (uint64_t)v26, v29);
  v31 = [IDSCKRecord alloc];
  v34 = objc_msgSend_initWithRecordType_recordID_(v31, v32, @"Group", v33, v30);
  v38 = objc_msgSend_groupID(v8, v35, v36, v37);
  v42 = objc_msgSend_dataRepresentation(v38, v39, v40, v41);
  v45 = objc_msgSend_base64EncodedStringWithOptions_(v42, v43, 0, v44);
  objc_msgSend_setObject_forKey_(v34, v46, (uint64_t)v45, v47, @"groupID");

  v51 = objc_msgSend_destinations(v8, v48, v49, v50);
  v55 = objc_msgSend_allObjects(v51, v52, v53, v54);
  v58 = objc_msgSend_componentsJoinedByString_(v55, v56, @", ", v57);

  objc_msgSend_setObject_forKey_(v34, v59, (uint64_t)v58, v60, @"destinations");
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = sub_19DB40578;
  v66[3] = &unk_1E5975958;
  id v67 = v34;
  v68 = self;
  id v69 = v8;
  id v70 = v9;
  id v61 = v8;
  id v62 = v9;
  id v63 = v34;
  objc_msgSend__publicDataRepresentationForGroup_completion_(v11, v64, (uint64_t)v61, v65, v66);
}

- (void)fetchGroupWithID:(id)a3 inContext:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v13 = objc_msgSend_dataRepresentation(a3, v10, v11, v12);
  v16 = objc_msgSend_base64EncodedStringWithOptions_(v13, v14, 0, v15);

  uint64_t v17 = [IDSCKRecordID alloc];
  v20 = objc_msgSend_initWithRecordName_(v17, v18, (uint64_t)v16, v19);
  v24 = objc_msgSend_database(self, v21, v22, v23);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_19DB40998;
  v29[3] = &unk_1E59759D0;
  v29[4] = self;
  id v30 = v8;
  id v31 = v9;
  id v25 = v9;
  id v26 = v8;
  objc_msgSend_fetchRecordWithID_completionHandler_(v24, v27, (uint64_t)v20, v28, v29);
}

- (void)fetchGroupsWithStableGroupID:(id)a3 inContext:(id)a4 completion:(id)a5
{
  v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F61130];
  id v8 = a5;
  objc_msgSend_errorWithDomain_code_userInfo_(v6, v9, v7, v10, -1000, 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a5 + 2))(v8, 0, v11);
}

- (void)q_groupFromRecord:(id)a3 inContext:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v11 = objc_msgSend_objectForKey_(a3, v9, @"payload", v10);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_19DB40D2C;
  v15[3] = &unk_1E5975980;
  id v16 = v7;
  id v12 = v7;
  objc_msgSend__groupFromPublicDataRepresentation_completion_(v8, v13, (uint64_t)v11, v14, v15);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSCKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end