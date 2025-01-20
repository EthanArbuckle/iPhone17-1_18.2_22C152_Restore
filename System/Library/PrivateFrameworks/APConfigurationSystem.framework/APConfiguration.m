@interface APConfiguration
+ (NSString)path;
- (APConfiguration)initWithConfig:(id)a3 notifier:(id)a4;
- (APPurgeableCacheNotifierP)notifier;
- (NSDictionary)configDictionary;
- (NSString)identifier;
- (id)methodSignatureForSelector:(SEL)a3;
- (int64_t)version;
- (void)forwardInvocation:(id)a3;
- (void)setConfigDictionary:(id)a3;
- (void)setNotifier:(id)a3;
@end

@implementation APConfiguration

- (NSString)identifier
{
  v2 = objc_opt_class();
  return (NSString *)objc_msgSend_path(v2, v3, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifier, 0);
  objc_storeStrong((id *)&self->configDictionary, 0);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)APConfiguration;
  v3 = [(APConfiguration *)&v6 methodSignatureForSelector:a3];
  if (!v3)
  {
    v3 = objc_msgSend_signatureWithObjCTypes_(MEMORY[0x263EFF970], v4, (uint64_t)"@@:");
  }
  return v3;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7 = (const char *)objc_msgSend_selector(v4, v5, v6);
  v8 = NSStringFromSelector(v7);
  v13 = objc_msgSend_ap_propertyName(v8, v9, v10);
  if (v13)
  {
    v14 = objc_msgSend_configDictionary(self, v11, v12);
    v16 = objc_msgSend_objectForKey_(v14, v15, @"properties");

    objc_msgSend_valueForKey_(v16, v17, (uint64_t)v8);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      v19 = APLogForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478083;
        id v32 = (id)objc_opt_class();
        __int16 v33 = 2113;
        v34 = v13;
        id v20 = v32;
        _os_log_impl(&dword_24718C000, v19, OS_LOG_TYPE_ERROR, "[%{private}@] Error: Forward invocation for %{private}@ value is nil.", buf, 0x16u);
      }
      v21 = NSString;
      uint64_t v22 = objc_opt_class();
      v24 = objc_msgSend_stringWithFormat_(v21, v23, @"[%@] Error: Forward invocation for %@ value is nil.", v22, v13);
      CreateDiagnosticReport();
    }
    objc_msgSend_setReturnValue_(v4, v18, (uint64_t)&v30);
    v27 = objc_msgSend_notifier(self, v25, v26);
    objc_msgSend_recentlyAccessedObject_(v27, v28, (uint64_t)self);
  }
  else
  {
    v16 = APLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v32 = (id)objc_opt_class();
      id v29 = v32;
      _os_log_impl(&dword_24718C000, v16, OS_LOG_TYPE_ERROR, "[%{private}@] Error: Forward invocation couldn't find property name.", buf, 0xCu);
    }
  }
}

- (NSDictionary)configDictionary
{
  return self->configDictionary;
}

- (APPurgeableCacheNotifierP)notifier
{
  return self->_notifier;
}

- (APConfiguration)initWithConfig:(id)a3 notifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)APConfiguration;
  v8 = [(APConfiguration *)&v13 init];
  uint64_t v10 = v8;
  if (v8)
  {
    objc_msgSend_setConfigDictionary_(v8, v9, (uint64_t)v6);
    objc_msgSend_setNotifier_(v10, v11, (uint64_t)v7);
  }

  return v10;
}

- (void)setNotifier:(id)a3
{
}

- (void)setConfigDictionary:(id)a3
{
}

+ (NSString)path
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138477827;
    id v6 = (id)objc_opt_class();
    id v3 = v6;
    _os_log_impl(&dword_24718C000, v2, OS_LOG_TYPE_ERROR, "[%{private}@] Error: Path needs to be implemented for each subclass.", (uint8_t *)&v5, 0xCu);
  }
  APSimulateCrash();
  return (NSString *)&stru_26FB57F48;
}

- (int64_t)version
{
  id v3 = objc_msgSend_configDictionary(self, a2, v2);
  int v5 = objc_msgSend_objectForKey_(v3, v4, @"version");

  int64_t v8 = objc_msgSend_integerValue(v5, v6, v7);
  return v8;
}

@end