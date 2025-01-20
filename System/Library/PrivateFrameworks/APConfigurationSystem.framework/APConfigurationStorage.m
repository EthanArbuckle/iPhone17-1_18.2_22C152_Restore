@interface APConfigurationStorage
- (APConfigurationResponseHandler)responseHandler;
- (APConfigurationStorage)init;
- (APUnfairLock)lock;
- (BOOL)resetConfigurationSystem;
- (BOOL)updateConfigurationSystemWithData:(id)a3;
- (void)cancelConfigurationUpdate;
- (void)setLock:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation APConfigurationStorage

- (APConfigurationStorage)init
{
  v8.receiver = self;
  v8.super_class = (Class)APConfigurationStorage;
  v2 = [(APConfigurationStorage *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F20B90]);
    uint64_t v5 = objc_msgSend_initWithOptions_(v3, v4, 1);
    lock = v2->_lock;
    v2->_lock = (APUnfairLock *)v5;
  }
  return v2;
}

- (BOOL)resetConfigurationSystem
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24718C000, v3, OS_LOG_TYPE_DEFAULT, "Reset Configuration System: Process started.", buf, 2u);
  }

  objc_super v8 = objc_msgSend_configSystemDirectoryPath(APConfigurationMediator, v4, v5);
  if (v8)
  {
    v9 = objc_msgSend_lock(self, v6, v7);
    objc_msgSend_lock(v9, v10, v11);
    v14 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v12, v13);
    if (objc_msgSend_fileExistsAtPath_(v14, v15, (uint64_t)v8)
      && (id v26 = 0,
          objc_msgSend_removeItemAtPath_error_(v14, v16, (uint64_t)v8, &v26),
          (v18 = v26) != 0))
    {
      v19 = v18;
      objc_msgSend_unlock(v9, v16, v17);
      v20 = APLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_msgSend_description(v19, v21, v22);
        *(_DWORD *)buf = 138543362;
        v28 = v23;
        _os_log_impl(&dword_24718C000, v20, OS_LOG_TYPE_ERROR, "Reset Configuration System: Could not remove current configuration, error: %{public}@.", buf, 0xCu);
      }
      BOOL v24 = 0;
    }
    else
    {
      objc_msgSend_unlock(v9, v16, v17);
      v19 = APLogForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24718C000, v19, OS_LOG_TYPE_DEFAULT, "Reset Configuration System: Process completed.", buf, 2u);
      }
      BOOL v24 = 1;
    }
  }
  else
  {
    v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24718C000, v9, OS_LOG_TYPE_ERROR, "Reset Configuration System: Error, path to config is nil.", buf, 2u);
    }
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)updateConfigurationSystemWithData:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_lock(self, v5, v6);
  objc_msgSend_lock(v7, v8, v9);
  v10 = objc_alloc_init(APConfigurationResponseHandler);
  objc_msgSend_setResponseHandler_(self, v11, (uint64_t)v10);

  v14 = objc_msgSend_responseHandler(self, v12, v13);
  char v16 = objc_msgSend_processResponseWithData_(v14, v15, (uint64_t)v4);

  objc_msgSend_setResponseHandler_(self, v17, 0);
  objc_msgSend_unlock(v7, v18, v19);

  return v16;
}

- (void)cancelConfigurationUpdate
{
  id v3 = objc_msgSend_responseHandler(self, a2, v2);
  if (v3)
  {
    id v6 = v3;
    objc_msgSend_cancelProcess(v3, v4, v5);
    id v3 = v6;
  }
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (APConfigurationResponseHandler)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end