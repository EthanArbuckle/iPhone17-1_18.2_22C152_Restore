@interface APConfigurationRequester
- (APConfigurationRequester)initWithStorefront:(id)a3;
- (BOOL)_testingFlag;
- (BOOL)cancelled;
- (NSString)storefront;
- (NSURLSessionDataTask)sessionDataTask;
- (OS_dispatch_queue)responseQueue;
- (id)_queryItems;
- (id)_requestHost;
- (id)completionHandler;
- (int64_t)_configurationVersion;
- (void)_httpResponse:(id)a3 session:(id)a4;
- (void)_runCompletionHandlerWithSuccess:(BOOL)a3 data:(id)a4;
- (void)_sendCoreAnalyticsWithUpdateStatus:(int64_t)a3 version:(int64_t)a4;
- (void)cancelRequest;
- (void)requestConfigurationWithCompletionHandler:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setResponseQueue:(id)a3;
- (void)setSessionDataTask:(id)a3;
@end

@implementation APConfigurationRequester

- (APConfigurationRequester)initWithStorefront:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)APConfigurationRequester;
  v6 = [(APConfigurationRequester *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storefront, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.ap.configurationsystem.response", v9);
    responseQueue = v7->_responseQueue;
    v7->_responseQueue = (OS_dispatch_queue *)v10;

    v7->_cancelled = 0;
  }

  return v7;
}

- (id)_requestHost
{
  v2 = @"device-config.pcms.apple.com";
  if (objc_msgSend_isAppleInternalInstall(MEMORY[0x263F20B88], v3, v4))
  {
    id v5 = objc_alloc(MEMORY[0x263EFFA40]);
    v7 = objc_msgSend_initWithSuiteName_(v5, v6, *MEMORY[0x263F20B40]);
    v9 = objc_msgSend_stringForKey_(v7, v8, @"configSystemHostEnvironment");
    v11 = v9;
    if (v9)
    {
      if (objc_msgSend_isEqualToString_(v9, v10, @"STG"))
      {
        objc_super v13 = kAPConfigSystemURLSTGHost;
LABEL_7:
        v14 = *v13;

        v2 = v14;
        goto LABEL_8;
      }
      if (objc_msgSend_isEqualToString_(v11, v12, @"RVW"))
      {
        objc_super v13 = kAPConfigSystemURLRVWHost;
        goto LABEL_7;
      }
    }
LABEL_8:
  }
  return v2;
}

- (void)requestConfigurationWithCompletionHandler:(id)a3
{
  uint64_t v4 = objc_msgSend_copy(a3, a2, (uint64_t)a3);
  objc_msgSend_setCompletionHandler_(self, v5, (uint64_t)v4);

  id v6 = objc_alloc_init(MEMORY[0x263F08BA0]);
  objc_msgSend_setScheme_(v6, v7, @"https");
  dispatch_queue_t v10 = objc_msgSend__requestHost(self, v8, v9);
  objc_msgSend_setHost_(v6, v11, (uint64_t)v10);

  objc_msgSend_setPath_(v6, v12, @"/transform-service/1/config");
  v15 = objc_msgSend__queryItems(self, v13, v14);
  objc_msgSend_setQueryItems_(v6, v16, (uint64_t)v15);

  v19 = objc_msgSend_URL(v6, v17, v18);
  v22 = objc_msgSend_sharedAPNetworkClient(MEMORY[0x263F20B68], v20, v21);
  v25 = objc_msgSend_temporarySessionForDaemon(v22, v23, v24);

  v28 = objc_msgSend_responseQueue(self, v26, v27);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_247191B88;
  block[3] = &unk_2652062E0;
  block[4] = self;
  id v32 = v19;
  id v33 = v25;
  id v29 = v25;
  id v30 = v19;
  dispatch_async(v28, block);
}

- (void)cancelRequest
{
  uint64_t v4 = objc_msgSend_responseQueue(self, a2, v2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_247191EF4;
  block[3] = &unk_265206330;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_runCompletionHandlerWithSuccess:(BOOL)a3 data:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v9 = objc_msgSend_completionHandler(self, v7, v8);
  dispatch_queue_t v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, BOOL, id))(v9 + 16))(v9, v4, v6);
    objc_msgSend_setCompletionHandler_(self, v11, 0);
  }
  else
  {
    v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_super v13 = @"Error";
      if (v4) {
        objc_super v13 = @"Succes";
      }
      int v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_24718C000, v12, OS_LOG_TYPE_ERROR, "Error: completionHandler is nil when trying to run with: %@.", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)_httpResponse:(id)a3 session:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_valid(v5, v6, v7);
  uint64_t v9 = APLogForCategory();
  dispatch_queue_t v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_msgSend_responseStatusCode(v5, v22, v23);
      uint64_t v27 = objc_msgSend_responseError(v5, v25, v26);
      *(_DWORD *)buf = 134218242;
      uint64_t v45 = v24;
      __int16 v46 = 2114;
      v47 = v27;
      _os_log_impl(&dword_24718C000, v10, OS_LOG_TYPE_ERROR, "Received error request. Status Code: %ld Error: %{public}@", buf, 0x16u);
    }
    v28 = NSString;
    uint64_t v31 = objc_msgSend_responseStatusCode(v5, v29, v30);
    v34 = objc_msgSend_responseError(v5, v32, v33);
    v36 = objc_msgSend_stringWithFormat_(v28, v35, @"Received error request. Status Code: %ld Error: %@", v31, v34);
    CreateDiagnosticReport();

    uint64_t v39 = objc_msgSend__configurationVersion(self, v37, v38);
    objc_msgSend__sendCoreAnalyticsWithUpdateStatus_version_(self, v40, 1512, v39);
    goto LABEL_16;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24718C000, v10, OS_LOG_TYPE_INFO, "Received response from server.", buf, 2u);
  }

  if (objc_msgSend_responseStatusCode(v5, v11, v12) != 200)
  {
    if (objc_msgSend_responseStatusCode(v5, v13, v14) != 204)
    {
LABEL_16:
      uint64_t v16 = 0;
      goto LABEL_17;
    }
    v17 = APLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v43 = objc_msgSend__configurationVersion(self, v41, v42);
      *(_DWORD *)buf = 134217984;
      uint64_t v45 = v43;
      uint64_t v18 = "Configuration system up to date version %lu.";
      v19 = v17;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      uint32_t v21 = 12;
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v16 = objc_msgSend_responseBody(v5, v13, v14);
  if (!v16)
  {
    v17 = APLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "Error: Response empty, no config file.";
      v19 = v17;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      uint32_t v21 = 2;
LABEL_14:
      _os_log_impl(&dword_24718C000, v19, v20, v18, buf, v21);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
LABEL_17:
  objc_msgSend__runCompletionHandlerWithSuccess_data_(self, v15, v8, v16);
}

- (BOOL)_testingFlag
{
  if (!objc_msgSend_isAppleInternalInstall(MEMORY[0x263F20B88], a2, v2)) {
    return 0;
  }
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  id v5 = objc_msgSend_initWithSuiteName_(v3, v4, *MEMORY[0x263F20B40]);
  uint64_t v7 = objc_msgSend_objectForKey_(v5, v6, @"APConfigurationSystem.testEnvironment");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    char v13 = objc_msgSend_BOOLValue(v10, v11, v12);
  }
  else
  {
    id v10 = (id)MEMORY[0x263EFFA80];
    char v13 = objc_msgSend_BOOLValue(MEMORY[0x263EFFA80], v8, v9);
  }
  char v14 = v13;

  return (v14 & 1) != 0;
}

- (int64_t)_configurationVersion
{
  uint64_t v2 = [APVersionHelper alloc];
  id v3 = objc_alloc_init(APVersionData);
  id v5 = objc_msgSend_initWithDatasource_(v2, v4, (uint64_t)v3);

  int64_t v8 = objc_msgSend_systemVersion(v5, v6, v7);
  return v8;
}

- (id)_queryItems
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (objc_msgSend__testingFlag(self, v4, v5))
  {
    int64_t v8 = objc_msgSend_queryItemWithName_value_(MEMORY[0x263F08BD0], v6, @"t", @"true");
    objc_msgSend_addObject_(v3, v9, (uint64_t)v8);
  }
  if (objc_msgSend_isAppleInternalInstall(MEMORY[0x263F20B88], v6, v7))
  {
    uint64_t v12 = objc_msgSend_queryItemWithName_value_(MEMORY[0x263F08BD0], v10, @"ib", @"true");
    objc_msgSend_addObject_(v3, v13, (uint64_t)v12);
  }
  v57 = objc_msgSend_locale(MEMORY[0x263F20B80], v10, v11);
  v56 = objc_msgSend_queryItemWithName_value_(MEMORY[0x263F08BD0], v14, @"l", v57);
  objc_msgSend_addObject_(v3, v15, (uint64_t)v56);
  uint64_t v16 = (void *)MEMORY[0x263F08BD0];
  v19 = objc_msgSend_storefront(self, v17, v18);
  v55 = objc_msgSend_queryItemWithName_value_(v16, v20, @"sf", v19);

  objc_msgSend_addObject_(v3, v21, (uint64_t)v55);
  uint64_t v24 = objc_msgSend_modelType(MEMORY[0x263F20B80], v22, v23);
  uint64_t v26 = objc_msgSend_queryItemWithName_value_(MEMORY[0x263F08BD0], v25, @"dc", v24);
  objc_msgSend_addObject_(v3, v27, (uint64_t)v26);
  uint64_t v30 = objc_msgSend_shortBuildVersion(MEMORY[0x263F20B80], v28, v29);
  id v32 = objc_msgSend_queryItemWithName_value_(MEMORY[0x263F08BD0], v31, @"b", v30);
  objc_msgSend_addObject_(v3, v33, (uint64_t)v32);
  v36 = objc_msgSend_osIdentifier(MEMORY[0x263F20B80], v34, v35);
  uint64_t v38 = objc_msgSend_queryItemWithName_value_(MEMORY[0x263F08BD0], v37, @"os", v36);
  objc_msgSend_addObject_(v3, v39, (uint64_t)v38);
  uint64_t v42 = objc_msgSend__configurationVersion(self, v40, v41);
  uint64_t v43 = (void *)MEMORY[0x263F08BD0];
  uint64_t v45 = objc_msgSend_numberWithInteger_(NSNumber, v44, v42);
  uint64_t v48 = objc_msgSend_stringValue(v45, v46, v47);
  v50 = objc_msgSend_queryItemWithName_value_(v43, v49, @"v", v48);

  objc_msgSend_addObject_(v3, v51, (uint64_t)v50);
  v53 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v52, (uint64_t)v3);

  return v53;
}

- (void)_sendCoreAnalyticsWithUpdateStatus:(int64_t)a3 version:(int64_t)a4
{
  v19[3] = *MEMORY[0x263EF8340];
  v18[0] = @"ClientConfigVersion";
  id v6 = objc_msgSend_numberWithInteger_(NSNumber, a2, a4);
  v19[0] = v6;
  v18[1] = @"StatusCode";
  int64_t v8 = objc_msgSend_numberWithInteger_(NSNumber, v7, a3);
  v19[1] = v8;
  v18[2] = @"TestingFlag";
  uint64_t v9 = NSNumber;
  uint64_t v12 = objc_msgSend__testingFlag(self, v10, v11);
  char v14 = objc_msgSend_numberWithBool_(v9, v13, v12);
  v19[2] = v14;
  uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v15, (uint64_t)v19, v18, 3);

  objc_msgSend_sendEvent_customPayload_(MEMORY[0x263F20B48], v17, @"ConfigurationSystemRequest", v16);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (void)setResponseQueue:(id)a3
{
}

- (NSURLSessionDataTask)sessionDataTask
{
  return self->_sessionDataTask;
}

- (void)setSessionDataTask:(id)a3
{
}

- (NSString)storefront
{
  return self->_storefront;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_sessionDataTask, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end