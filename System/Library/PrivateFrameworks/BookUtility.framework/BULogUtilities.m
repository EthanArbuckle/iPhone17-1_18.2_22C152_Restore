@interface BULogUtilities
+ (id)shared;
- (BOOL)buVerboseLoggingEnabled;
- (BOOL)verboseLoggingEnabled;
- (BULogUtilities)init;
- (BULogUtilities)initWithUserDefaults:(id)a3 keyPath:(id)a4;
- (NSString)keyPath;
- (NSUserDefaults)defaults;
- (void)dealloc;
- (void)observeDefaults;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBuVerboseLoggingEnabled:(BOOL)a3;
- (void)setDefaults:(id)a3;
- (void)setKeyPath:(id)a3;
@end

@implementation BULogUtilities

+ (id)shared
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1D53C4;
  block[3] = &unk_26449D530;
  block[4] = a1;
  if (qword_26AB404F0 != -1) {
    dispatch_once(&qword_26AB404F0, block);
  }
  v2 = (void *)qword_26AB404E8;

  return v2;
}

- (BULogUtilities)init
{
  v4 = objc_msgSend_books(BUAppGroup, a2, v2);
  v7 = objc_msgSend_userDefaults(v4, v5, v6);

  v9 = (BULogUtilities *)objc_msgSend_initWithUserDefaults_keyPath_(self, v8, (uint64_t)v7, @"buVerboseLoggingEnabled");
  return v9;
}

- (BULogUtilities)initWithUserDefaults:(id)a3 keyPath:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)BULogUtilities;
  v8 = [(BULogUtilities *)&v30 init];
  v10 = v8;
  if (v8)
  {
    objc_msgSend_setDefaults_(v8, v9, (uint64_t)v6);
    objc_msgSend_setKeyPath_(v10, v11, (uint64_t)v7);
    v14 = objc_msgSend_defaults(v10, v12, v13);
    uint64_t v16 = objc_msgSend_BOOLForKey_(v14, v15, (uint64_t)v7);
    objc_msgSend_setBuVerboseLoggingEnabled_(v10, v17, v16);

    dispatch_queue_t v18 = dispatch_queue_create("BULogUtilities.access", MEMORY[0x263EF83A8]);
    accessQueue = v10->_accessQueue;
    v10->_accessQueue = (OS_dispatch_queue *)v18;

    objc_msgSend_observeDefaults(v10, v20, v21);
    v22 = BookUtilityLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend_keyPath(v10, v23, v24);
      int v28 = objc_msgSend_buVerboseLoggingEnabled(v10, v26, v27);
      *(_DWORD *)buf = 138412546;
      v32 = v25;
      __int16 v33 = 1024;
      int v34 = v28;
      _os_log_impl(&dword_21E1C7000, v22, OS_LOG_TYPE_DEFAULT, "BULogUtilities: Init with %@:%{BOOL}d", buf, 0x12u);
    }
  }

  return v10;
}

- (void)dealloc
{
  v4 = objc_msgSend_defaults(self, a2, v2);
  id v7 = objc_msgSend_keyPath(self, v5, v6);
  objc_msgSend_removeObserver_forKeyPath_(v4, v8, (uint64_t)self, v7);

  v9.receiver = self;
  v9.super_class = (Class)BULogUtilities;
  [(BULogUtilities *)&v9 dealloc];
}

- (void)observeDefaults
{
  objc_msgSend_defaults(self, a2, v2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_keyPath(self, v4, v5);
  objc_msgSend_addObserver_forKeyPath_options_context_(v8, v7, (uint64_t)self, v6, 5, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  v12 = objc_msgSend_objectForKeyedSubscript_(v8, v11, *MEMORY[0x263F081B8]);

  uint64_t v13 = BUDynamicCast(v10, v12);
  int v16 = objc_msgSend_BOOLValue(v13, v14, v15);

  v17 = BookUtilityLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend_keyPath(self, v18, v19);
    *(_DWORD *)buf = 138412546;
    objc_super v30 = v20;
    __int16 v31 = 1024;
    int v32 = v16;
    _os_log_impl(&dword_21E1C7000, v17, OS_LOG_TYPE_DEFAULT, "BULogUtilities: Received change for keypath %@:%{BOOL}d", buf, 0x12u);
  }
  v23 = objc_msgSend_keyPath(self, v21, v22);
  int isEqualToString = objc_msgSend_isEqualToString_(v9, v24, (uint64_t)v23);

  if (isEqualToString)
  {
    accessQueue = self->_accessQueue;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = sub_21E1D58A8;
    v27[3] = &unk_26449DA80;
    v27[4] = self;
    char v28 = v16;
    dispatch_barrier_sync(accessQueue, v27);
  }
}

- (BOOL)verboseLoggingEnabled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21E1D5960;
  v5[3] = &unk_26449D600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)buVerboseLoggingEnabled
{
  return self->_buVerboseLoggingEnabled;
}

- (void)setBuVerboseLoggingEnabled:(BOOL)a3
{
  self->_buVerboseLoggingEnabled = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_defaults, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end