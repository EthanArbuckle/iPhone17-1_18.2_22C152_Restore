@interface AFSiriTaskContextProvider
- (AFSiriTaskContextProvider)initWithTaskmaster:(id)a3;
- (void)getAppContextWithDeliveryHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation AFSiriTaskContextProvider

- (void).cxx_destruct
{
}

- (void)getAppContextWithDeliveryHandler:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[AFSiriTaskContextProvider getAppContextWithDeliveryHandler:completionHandler:]";
    __int16 v20 = 2112;
    v21 = self;
    __int16 v22 = 2080;
    v23 = "-[AFSiriTaskContextProvider getAppContextWithDeliveryHandler:completionHandler:]";
    _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s %@ %s", buf, 0x20u);
  }
  v10 = objc_alloc_init(AFContextRequest);
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    taskmaster = self->_taskmaster;
    *(_DWORD *)buf = 136315650;
    v19 = "-[AFSiriTaskContextProvider getAppContextWithDeliveryHandler:completionHandler:]";
    __int16 v20 = 2112;
    v21 = (AFSiriTaskContextProvider *)taskmaster;
    __int16 v22 = 2112;
    v23 = (const char *)v10;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s asking taskmaster=%@ to handle contextRequest=%@", buf, 0x20u);
  }
  v13 = self->_taskmaster;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__AFSiriTaskContextProvider_getAppContextWithDeliveryHandler_completionHandler___block_invoke;
  v15[3] = &unk_1E5926700;
  id v16 = v8;
  SEL v17 = a2;
  v15[4] = self;
  id v14 = v8;
  [(AFSiriTaskmaster *)v13 handleSiriRequest:v10 deliveryHandler:v7 completionHandler:v15];
}

void __80__AFSiriTaskContextProvider_getAppContextWithDeliveryHandler_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a1[6], a1[4], @"AFSiriTaskContextProvider.m", 37, @"Invalid parameter not satisfying: %@", @"!response || [response isKindOfClass:[AFContextResponse class]]" object file lineNumber description];

    if (v6) {
      goto LABEL_4;
    }
  }
  else if (v6)
  {
LABEL_4:
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1[4] + 8);
      *(_DWORD *)buf = 136315650;
      id v14 = "-[AFSiriTaskContextProvider getAppContextWithDeliveryHandler:completionHandler:]_block_invoke";
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_error_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_ERROR, "%s Unable to obtain context using %@: %{public}@", buf, 0x20u);
    }
    id v8 = 0;
    goto LABEL_10;
  }
  id v8 = [v5 _context];
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1[4] + 8);
    *(_DWORD *)buf = 136315394;
    id v14 = "-[AFSiriTaskContextProvider getAppContextWithDeliveryHandler:completionHandler:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s %@ got context", buf, 0x16u);
  }
LABEL_10:
  (*(void (**)(void))(a1[5] + 16))();
}

- (AFSiriTaskContextProvider)initWithTaskmaster:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSiriTaskContextProvider;
  id v6 = [(AFSiriTaskContextProvider *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_taskmaster, a3);
  }

  return v7;
}

@end