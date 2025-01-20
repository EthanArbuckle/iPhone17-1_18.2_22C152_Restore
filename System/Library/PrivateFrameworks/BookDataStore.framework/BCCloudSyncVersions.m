@interface BCCloudSyncVersions
- (NSPersistentHistoryToken)historyToken;
- (id)mutableCopy;
- (void)configureFromSyncVersions:(id)a3;
- (void)setHistoryToken:(id)a3;
@end

@implementation BCCloudSyncVersions

- (id)mutableCopy
{
  v3 = [BCMutableCloudSyncVersions alloc];
  return (id)MEMORY[0x270F9A6D0](v3, sel_initWithCloudSyncVersions_, self, v4, v5, v6, v7, v8);
}

- (void)configureFromSyncVersions:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_cloudVersion(v4, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend_setCloudVersion_(self, v13, v12, v14, v15, v16, v17, v18);
  uint64_t v26 = objc_msgSend_localVersion(v4, v19, v20, v21, v22, v23, v24, v25);
  objc_msgSend_setLocalVersion_(self, v27, v26, v28, v29, v30, v31, v32);
  uint64_t v40 = objc_msgSend_syncVersion(v4, v33, v34, v35, v36, v37, v38, v39);
  objc_msgSend_setSyncVersion_(self, v41, v40, v42, v43, v44, v45, v46);
  v54 = objc_msgSend_historyToken(v4, v47, v48, v49, v50, v51, v52, v53);
  objc_msgSend_setHistoryToken_(self, v55, (uint64_t)v54, v56, v57, v58, v59, v60);

  uint64_t v68 = objc_msgSend_historyTokenOffset(v4, v61, v62, v63, v64, v65, v66, v67);
  objc_msgSend_setHistoryTokenOffset_(self, v69, v68, v70, v71, v72, v73, v74);
}

- (void)setHistoryToken:(id)a3
{
  id v10 = a3;
  if (!v10)
  {
    id v12 = 0;
LABEL_6:
    uint64_t v11 = 0;
    goto LABEL_7;
  }
  id v13 = 0;
  uint64_t v11 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x263F08910], v4, (uint64_t)v10, 1, (uint64_t)&v13, v7, v8, v9);
  id v12 = v13;
  if (!v11)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_2361F8504((uint64_t)v12);
    }
    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend_setRawHistoryToken_(self, v4, (uint64_t)v11, v5, v6, v7, v8, v9);
}

- (NSPersistentHistoryToken)historyToken
{
  uint64_t v8 = objc_msgSend_rawHistoryToken(self, a2, v2, v3, v4, v5, v6, v7);
  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x263F08928];
    uint64_t v10 = objc_opt_class();
    id v20 = 0;
    uint64_t v15 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)v8, (uint64_t)&v20, v12, v13, v14);
    id v16 = v20;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v15;
    }
    else
    {
      uint64_t v18 = BDSCloudKitLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_2361F8584((uint64_t)v16, v18);
      }

      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return (NSPersistentHistoryToken *)v17;
}

@end