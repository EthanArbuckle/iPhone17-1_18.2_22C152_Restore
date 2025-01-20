@interface IADefaultsDataStore
- (BOOL)_createErrorWithDescription:(id)a3 code:(int64_t)a4 error:(id *)a5;
- (BOOL)_validName:(id)a3;
- (BOOL)deleteDataStoreObject:(id)a3 withError:(id *)a4;
- (BOOL)objectExistsWithName:(id)a3 andType:(id)a4 withError:(id *)a5;
- (IADefaultsDataStore)initWithName:(id)a3;
- (NSString)datastoreName;
- (NSUserDefaults)defaultsHandle;
- (id)createDataStoreObjectWithName:(id)a3 withType:(id)a4 withError:(id *)a5;
- (id)getObjectWithName:(id)a3 withType:(id)a4 withError:(id *)a5;
@end

@implementation IADefaultsDataStore

- (IADefaultsDataStore)initWithName:(id)a3
{
  id v5 = a3;
  if (objc_msgSend_hasPrefix_(v5, v6, @"com.apple.", v7))
  {
    v18.receiver = self;
    v18.super_class = (Class)IADefaultsDataStore;
    v8 = [(IADefaultsDataStore *)&v18 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_datastoreName, a3);
      id v10 = objc_alloc(MEMORY[0x263EFFA40]);
      uint64_t v13 = objc_msgSend_initWithSuiteName_(v10, v11, (uint64_t)v5, v12);
      defaultsHandle = v9->_defaultsHandle;
      v9->_defaultsHandle = (NSUserDefaults *)v13;
    }
    self = v9;
    v15 = self;
  }
  else
  {
    v16 = sub_252A05B84();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_252A11BD4((uint64_t)v5, v16);
    }

    v15 = 0;
  }

  return v15;
}

- (BOOL)_createErrorWithDescription:(id)a3 code:(int64_t)a4 error:(id *)a5
{
  uint64_t v7 = (void *)MEMORY[0x263EFF9A0];
  id v8 = a3;
  uint64_t v12 = objc_msgSend_dictionary(v7, v9, v10, v11);
  objc_msgSend_setValue_forKey_(v12, v13, (uint64_t)v8, *MEMORY[0x263F08320]);

  if (a5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v14, @"IADefaultsDataStoreErrorDomain", a4, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return a5 != 0;
}

- (BOOL)_validName:(id)a3
{
  return objc_msgSend_containsString_(a3, a2, @"_", v3) ^ 1;
}

- (BOOL)objectExistsWithName:(id)a3 andType:(id)a4 withError:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v12 = objc_msgSend_defaultsHandle(self, v9, v10, v11);
  v15 = objc_msgSend_stringForKey_(v12, v13, (uint64_t)v8, v14);

  if (!v15) {
    goto LABEL_6;
  }
  if (qword_269C402F8 != -1) {
    dispatch_once(&qword_269C402F8, &unk_2702E3928);
  }
  if (objc_msgSend_containsObject_((void *)qword_269C402F0, v16, (uint64_t)v15, v17)) {
    char isEqualToString = objc_msgSend_isEqualToString_(v15, v18, (uint64_t)v7, v19);
  }
  else {
LABEL_6:
  }
    char isEqualToString = 0;

  return isEqualToString;
}

- (id)createDataStoreObjectWithName:(id)a3 withType:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ((objc_msgSend__validName_(self, v10, (uint64_t)v8, v11) & 1) == 0)
  {
    v15 = sub_252A05B84();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_252A11D98();
    }

    objc_msgSend__createErrorWithDescription_code_error_(self, v16, @"Object name not allowed", 105, a5);
    goto LABEL_9;
  }
  if (objc_msgSend_objectExistsWithName_andType_withError_(self, v12, (uint64_t)v8, (uint64_t)v9, a5))
  {
    uint64_t v13 = sub_252A05B84();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_252A11C60();
    }

    objc_msgSend__createErrorWithDescription_code_error_(self, v14, @"Object already exists", 102, a5);
LABEL_9:
    uint64_t v17 = 0;
    goto LABEL_25;
  }
  objc_initWeak(&location, self);
  v21 = objc_msgSend_type(IADataStoreCounter, v18, v19, v20);
  int isEqualToString = objc_msgSend_isEqualToString_(v9, v22, (uint64_t)v21, v23);

  if (isEqualToString)
  {
    v28 = [IADataStoreCounter alloc];
    id v29 = objc_loadWeakRetained(&location);
    uint64_t shouldBeCreated = objc_msgSend_initWithDatastoreHandle_andName_shouldBeCreated_(v28, v30, (uint64_t)v29, (uint64_t)v8, 1);
  }
  else
  {
    v32 = objc_msgSend_type(IADataStoreBoolean, v25, v26, v27);
    int v35 = objc_msgSend_isEqualToString_(v9, v33, (uint64_t)v32, v34);

    if (v35)
    {
      v39 = [IADataStoreBoolean alloc];
      id v29 = objc_loadWeakRetained(&location);
      uint64_t shouldBeCreated = objc_msgSend_initWithDatastoreHandle_andName_shouldBeCreated_(v39, v40, (uint64_t)v29, (uint64_t)v8, 1);
    }
    else
    {
      v41 = objc_msgSend_type(IADataStoreDaterange, v36, v37, v38);
      int v44 = objc_msgSend_isEqualToString_(v9, v42, (uint64_t)v41, v43);

      if (!v44)
      {
        v47 = sub_252A05B84();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
          sub_252A11D30();
        }
        v48 = @"Unrecognized type";
        uint64_t v49 = 100;
        goto LABEL_23;
      }
      v45 = [IADataStoreDaterange alloc];
      id v29 = objc_loadWeakRetained(&location);
      uint64_t shouldBeCreated = objc_msgSend_initWithDatastoreHandle_andName_shouldBeCreated_(v45, v46, (uint64_t)v29, (uint64_t)v8, 1);
    }
  }
  uint64_t v17 = (void *)shouldBeCreated;

  if (!v17)
  {
    v47 = sub_252A05B84();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
      sub_252A11CC8();
    }
    v48 = @"Initialization error";
    uint64_t v49 = 101;
LABEL_23:

    objc_msgSend__createErrorWithDescription_code_error_(self, v50, (uint64_t)v48, v49, a5);
    uint64_t v17 = 0;
  }
  objc_destroyWeak(&location);
LABEL_25:

  return v17;
}

- (BOOL)deleteDataStoreObject:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_name(v6, v7, v8, v9);
  uint64_t v11 = objc_opt_class();
  v15 = objc_msgSend_type(v11, v12, v13, v14);
  char v17 = objc_msgSend_objectExistsWithName_andType_withError_(self, v16, (uint64_t)v10, (uint64_t)v15, a4);

  if ((v17 & 1) == 0)
  {
    sub_252A05B84();
    v22 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_FAULT)) {
      sub_252A11E84(v6, v22, v23, v24);
    }
    uint64_t v25 = 103;
    goto LABEL_10;
  }
  if ((objc_msgSend_destroy(v6, v18, v19, v20) & 1) == 0)
  {
    sub_252A05B84();
    v22 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_FAULT)) {
      sub_252A11E00(v6, v22, v26, v27);
    }
    uint64_t v25 = 104;
LABEL_10:

    objc_msgSend__createErrorWithDescription_code_error_(self, v28, @"Object could not be deleted", v25, a4);
    BOOL v21 = 0;
    goto LABEL_11;
  }
  BOOL v21 = 1;
LABEL_11:

  return v21;
}

- (id)getObjectWithName:(id)a3 withType:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend_objectExistsWithName_andType_withError_(self, v10, (uint64_t)v8, (uint64_t)v9, a5))
  {
    objc_initWeak(&location, self);
    uint64_t v14 = objc_msgSend_type(IADataStoreCounter, v11, v12, v13);
    int isEqualToString = objc_msgSend_isEqualToString_(v9, v15, (uint64_t)v14, v16);

    if (isEqualToString)
    {
      BOOL v21 = [IADataStoreCounter alloc];
      id v22 = objc_loadWeakRetained(&location);
      uint64_t shouldBeCreated = objc_msgSend_initWithDatastoreHandle_andName_shouldBeCreated_(v21, v23, (uint64_t)v22, (uint64_t)v8, 0);
    }
    else
    {
      v28 = objc_msgSend_type(IADataStoreBoolean, v18, v19, v20);
      int v31 = objc_msgSend_isEqualToString_(v9, v29, (uint64_t)v28, v30);

      if (v31)
      {
        int v35 = [IADataStoreBoolean alloc];
        id v22 = objc_loadWeakRetained(&location);
        uint64_t shouldBeCreated = objc_msgSend_initWithDatastoreHandle_andName_shouldBeCreated_(v35, v36, (uint64_t)v22, (uint64_t)v8, 0);
      }
      else
      {
        uint64_t v37 = objc_msgSend_type(IADataStoreDaterange, v32, v33, v34);
        int v40 = objc_msgSend_isEqualToString_(v9, v38, (uint64_t)v37, v39);

        if (!v40)
        {
          uint64_t v43 = sub_252A05B84();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
            sub_252A11D30();
          }
          int v44 = @"Unrecognized type";
          uint64_t v45 = 100;
          goto LABEL_18;
        }
        v41 = [IADataStoreDaterange alloc];
        id v22 = objc_loadWeakRetained(&location);
        uint64_t shouldBeCreated = objc_msgSend_initWithDatastoreHandle_andName_shouldBeCreated_(v41, v42, (uint64_t)v22, (uint64_t)v8, 0);
      }
    }
    uint64_t v27 = (void *)shouldBeCreated;

    if (v27)
    {
LABEL_19:
      objc_destroyWeak(&location);
      goto LABEL_20;
    }
    uint64_t v43 = sub_252A05B84();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
      sub_252A11CC8();
    }
    int v44 = @"Initialization error";
    uint64_t v45 = 101;
LABEL_18:

    objc_msgSend__createErrorWithDescription_code_error_(self, v46, (uint64_t)v44, v45, a5);
    uint64_t v27 = 0;
    goto LABEL_19;
  }
  uint64_t v25 = sub_252A05B84();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    sub_252A11F08();
  }

  uint64_t v27 = objc_msgSend_createDataStoreObjectWithName_withType_withError_(self, v26, (uint64_t)v8, (uint64_t)v9, a5);
LABEL_20:

  return v27;
}

- (NSString)datastoreName
{
  return self->_datastoreName;
}

- (NSUserDefaults)defaultsHandle
{
  return self->_defaultsHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsHandle, 0);
  objc_storeStrong((id *)&self->_datastoreName, 0);
}

@end