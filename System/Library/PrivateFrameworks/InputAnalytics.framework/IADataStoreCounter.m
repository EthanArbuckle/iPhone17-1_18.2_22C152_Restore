@interface IADataStoreCounter
+ (id)type;
- (BOOL)decrement;
- (BOOL)destroy;
- (BOOL)increment;
- (BOOL)persist;
- (BOOL)updateWithCount:(unint64_t)a3;
- (IADataStoreCounter)initWithDatastoreHandle:(id)a3 andName:(id)a4 shouldBeCreated:(BOOL)a5;
- (unint64_t)count;
@end

@implementation IADataStoreCounter

- (IADataStoreCounter)initWithDatastoreHandle:(id)a3 andName:(id)a4 shouldBeCreated:(BOOL)a5
{
  BOOL v5 = a5;
  location[4] = *(id *)MEMORY[0x263EF8340];
  objc_initWeak(location, a3);
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained(location);
  v35.receiver = self;
  v35.super_class = (Class)IADataStoreCounter;
  v10 = [(IADataStoreObject *)&v35 initWithDatastoreHandle:WeakRetained andName:v8 shouldBeCreated:v5];

  if (!v10) {
    goto LABEL_6;
  }
  if (v5)
  {
    v10->_count = 0;
    objc_msgSend_persist(v10, v11, v12, v13);
LABEL_6:
    v29 = v10;
    goto LABEL_7;
  }
  v14 = objc_msgSend_datastoreHandle(v10, v11, v12, v13);
  v18 = v14;
  if (v14)
  {
    v19 = objc_msgSend_defaultsHandle(v14, v15, v16, v17);
    v23 = objc_msgSend_name(v10, v20, v21, v22);
    v26 = objc_msgSend_stringByAppendingString_(v23, v24, @"_count", v25);
    v10->_count = objc_msgSend_integerForKey_(v19, v27, (uint64_t)v26, v28);

    goto LABEL_6;
  }
  v31 = sub_252A05B84();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend_name(v10, v32, v33, v34);
    objc_claimAutoreleasedReturnValue();
    sub_252A115A8();
  }

  v29 = 0;
LABEL_7:

  objc_destroyWeak(location);
  return v29;
}

- (BOOL)persist
{
  BOOL v5 = objc_msgSend_datastoreHandle(self, a2, v2, v3);
  if (!v5)
  {
    sub_252A05B84();
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT)) {
      sub_252A11674(self, v9, v23, v24);
    }
    goto LABEL_8;
  }
  v28.receiver = self;
  v28.super_class = (Class)IADataStoreCounter;
  if (![(IADataStoreObject *)&v28 persist])
  {
    sub_252A05B84();
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT)) {
      sub_252A1173C(self, v9, v25, v26);
    }
LABEL_8:
    BOOL v22 = 0;
    goto LABEL_9;
  }
  objc_msgSend_defaultsHandle(v5, v6, v7, v8);
  v9 = (char *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_count(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_name(self, v14, v15, v16);
  v20 = objc_msgSend_stringByAppendingString_(v17, v18, @"_count", v19);
  objc_msgSend_setInteger_forKey_(v9, v21, v13, (uint64_t)v20);

  BOOL v22 = 1;
LABEL_9:

  return v22;
}

- (BOOL)destroy
{
  BOOL v5 = objc_msgSend_datastoreHandle(self, a2, v2, v3);
  if (!v5)
  {
    sub_252A05B84();
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT)) {
      sub_252A11674(self, v9, v20, v21);
    }
    goto LABEL_8;
  }
  v25.receiver = self;
  v25.super_class = (Class)IADataStoreCounter;
  if (![(IADataStoreObject *)&v25 destroy])
  {
    sub_252A05B84();
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT)) {
      sub_252A117C0(self, v9, v22, v23);
    }
LABEL_8:
    BOOL v19 = 0;
    goto LABEL_9;
  }
  objc_msgSend_defaultsHandle(v5, v6, v7, v8);
  v9 = (char *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_name(self, v10, v11, v12);
  uint64_t v16 = objc_msgSend_stringByAppendingString_(v13, v14, @"_count", v15);
  objc_msgSend_removeObjectForKey_(v9, v17, (uint64_t)v16, v18);

  BOOL v19 = 1;
LABEL_9:

  return v19;
}

+ (id)type
{
  return @"IADataStoreCounter";
}

- (BOOL)updateWithCount:(unint64_t)a3
{
  self->_count = a3;
  return objc_msgSend_persist(self, a2, a3, v3);
}

- (BOOL)increment
{
  ++self->_count;
  return objc_msgSend_persist(self, a2, v2, v3);
}

- (BOOL)decrement
{
  if (objc_msgSend_count(self, a2, v2, v3))
  {
    --self->_count;
    return objc_msgSend_persist(self, v5, v6, v7);
  }
  else
  {
    sub_252A05B84();
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT)) {
      sub_252A11844(self, v9, v10, v11);
    }

    return 0;
  }
}

- (unint64_t)count
{
  return self->_count;
}

@end