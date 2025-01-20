@interface IADataStoreObject
+ (id)type;
- (BOOL)destroy;
- (BOOL)destroyed;
- (BOOL)persist;
- (IADataStoreObject)initWithDatastoreHandle:(id)a3 andName:(id)a4 shouldBeCreated:(BOOL)a5;
- (IADefaultsDataStore)datastoreHandle;
- (NSDate)lastModified;
- (NSString)name;
- (int)version;
@end

@implementation IADataStoreObject

- (IADataStoreObject)initWithDatastoreHandle:(id)a3 andName:(id)a4 shouldBeCreated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v76 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, a3);
  id v8 = a4;
  v68.receiver = self;
  v68.super_class = (Class)IADataStoreObject;
  v9 = [(IADataStoreObject *)&v68 init];
  if (!v9) {
    goto LABEL_7;
  }
  id v10 = objc_loadWeakRetained(&location);
  objc_storeWeak((id *)&v9->_datastoreHandle, v10);

  objc_storeStrong((id *)&v9->_name, a4);
  v9->_destroyed = 0;
  if (!v5)
  {
    v14 = objc_msgSend_datastoreHandle(v9, v11, v12, v13);
    v18 = v14;
    if (v14)
    {
      v19 = objc_msgSend_defaultsHandle(v14, v15, v16, v17);
      v23 = objc_msgSend_name(v9, v20, v21, v22);
      v26 = objc_msgSend_stringByAppendingString_(v23, v24, @"_version", v25);
      v9->_version = objc_msgSend_integerForKey_(v19, v27, (uint64_t)v26, v28);

      if (objc_msgSend_version(v9, v29, v30, v31) == 1)
      {
        v35 = objc_msgSend_defaultsHandle(v18, v32, v33, v34);
        v39 = objc_msgSend_name(v9, v36, v37, v38);
        v42 = objc_msgSend_stringByAppendingString_(v39, v40, @"_lastModified", v41);
        uint64_t v45 = objc_msgSend_objectForKey_(v35, v43, (uint64_t)v42, v44);
        lastModified = v9->_lastModified;
        v9->_lastModified = (NSDate *)v45;

        goto LABEL_7;
      }
      v48 = sub_252A05B84();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
      {
        v56 = NSNumber;
        uint64_t v57 = objc_msgSend_version(v9, v52, v53, v54);
        v60 = objc_msgSend_numberWithInt_(v56, v58, v57, v59);
        v64 = objc_msgSend_name(v9, v61, v62, v63);
        v67 = objc_msgSend_numberWithInt_(NSNumber, v65, 1, v66);
        *(_DWORD *)buf = 138412802;
        v71 = v60;
        __int16 v72 = 2112;
        v73 = v64;
        __int16 v74 = 2112;
        v75 = v67;
        _os_log_fault_impl(&dword_2529F1000, v48, OS_LOG_TYPE_FAULT, "Invalid version %@ object with name %@ (expected %@)", buf, 0x20u);
      }
    }
    else
    {
      v48 = sub_252A05B84();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend_name(v9, v49, v50, v51);
        objc_claimAutoreleasedReturnValue();
        sub_252A115A8();
      }
    }

    v47 = 0;
    goto LABEL_13;
  }
  v9->_version = 1;
  objc_msgSend_persist(v9, v11, v12, v13);
LABEL_7:
  v47 = v9;
LABEL_13:

  objc_destroyWeak(&location);
  return v47;
}

- (BOOL)persist
{
  if (objc_msgSend_destroyed(self, a2, v2, v3))
  {
    sub_252A05B84();
    id v8 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT)) {
      sub_252A115F0(self, v8, v9, v10);
    }
LABEL_9:
    BOOL v63 = 0;
    goto LABEL_10;
  }
  objc_msgSend_datastoreHandle(self, v5, v6, v7);
  v11 = (char *)objc_claimAutoreleasedReturnValue();
  id v8 = v11;
  if (!v11)
  {
    sub_252A05B84();
    v64 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_FAULT)) {
      sub_252A11674(self, v64, v65, v66);
    }

    goto LABEL_9;
  }
  v15 = objc_msgSend_defaultsHandle(v11, v12, v13, v14);
  uint64_t v16 = objc_opt_class();
  v20 = objc_msgSend_type(v16, v17, v18, v19);
  v24 = objc_msgSend_name(self, v21, v22, v23);
  objc_msgSend_setObject_forKey_(v15, v25, (uint64_t)v20, (uint64_t)v24);

  v29 = objc_msgSend_defaultsHandle(v8, v26, v27, v28);
  uint64_t v33 = (int)objc_msgSend_version(self, v30, v31, v32);
  uint64_t v37 = objc_msgSend_name(self, v34, v35, v36);
  v40 = objc_msgSend_stringByAppendingString_(v37, v38, @"_version", v39);
  objc_msgSend_setInteger_forKey_(v29, v41, v33, (uint64_t)v40);

  objc_msgSend_now(MEMORY[0x263EFF910], v42, v43, v44);
  uint64_t v45 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastModified = self->_lastModified;
  self->_lastModified = v45;

  uint64_t v50 = objc_msgSend_defaultsHandle(v8, v47, v48, v49);
  uint64_t v54 = objc_msgSend_lastModified(self, v51, v52, v53);
  v58 = objc_msgSend_name(self, v55, v56, v57);
  v61 = objc_msgSend_stringByAppendingString_(v58, v59, @"_lastModified", v60);
  objc_msgSend_setObject_forKey_(v50, v62, (uint64_t)v54, (uint64_t)v61);

  BOOL v63 = 1;
LABEL_10:

  return v63;
}

- (BOOL)destroy
{
  if (objc_msgSend_destroyed(self, a2, v2, v3))
  {
    sub_252A05B84();
    id v8 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT)) {
      sub_252A115F0(self, v8, v9, v10);
    }
LABEL_9:
    BOOL v48 = 0;
    goto LABEL_10;
  }
  objc_msgSend_datastoreHandle(self, v5, v6, v7);
  v11 = (char *)objc_claimAutoreleasedReturnValue();
  id v8 = v11;
  if (!v11)
  {
    sub_252A05B84();
    uint64_t v49 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_FAULT)) {
      sub_252A11674(self, v49, v50, v51);
    }

    goto LABEL_9;
  }
  v15 = objc_msgSend_defaultsHandle(v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_name(self, v16, v17, v18);
  objc_msgSend_removeObjectForKey_(v15, v20, (uint64_t)v19, v21);

  uint64_t v25 = objc_msgSend_defaultsHandle(v8, v22, v23, v24);
  v29 = objc_msgSend_name(self, v26, v27, v28);
  uint64_t v32 = objc_msgSend_stringByAppendingString_(v29, v30, @"_version", v31);
  objc_msgSend_removeObjectForKey_(v25, v33, (uint64_t)v32, v34);

  uint64_t v38 = objc_msgSend_defaultsHandle(v8, v35, v36, v37);
  v42 = objc_msgSend_name(self, v39, v40, v41);
  uint64_t v45 = objc_msgSend_stringByAppendingString_(v42, v43, @"_lastModified", v44);
  objc_msgSend_removeObjectForKey_(v38, v46, (uint64_t)v45, v47);

  BOOL v48 = 1;
  self->_destroyed = 1;
LABEL_10:

  return v48;
}

+ (id)type
{
  v4 = sub_252A05B84();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_252A116F8(v4);
  }

  id v8 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v5, v6, v7);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, (uint64_t)a1, @"IADataStoreObject.m", 118, @"type not implemented");

  return 0;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (IADefaultsDataStore)datastoreHandle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datastoreHandle);
  return (IADefaultsDataStore *)WeakRetained;
}

- (BOOL)destroyed
{
  return self->_destroyed;
}

- (int)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_datastoreHandle);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end