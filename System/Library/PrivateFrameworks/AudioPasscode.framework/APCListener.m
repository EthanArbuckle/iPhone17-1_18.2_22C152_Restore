@interface APCListener
+ (id)capabilityData;
- (APCListener)init;
- (APCListener)initWithCodecConfiguration:(id)a3;
- (APCListener)initWithConfigurationData:(id)a3;
- (BOOL)getResultData:(id *)a3;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (id)retrievedDataHandler;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRetrievedDataHandler:(id)a3;
- (void)startListening;
- (void)startListeningWithError:(id *)a3;
- (void)stopListening;
@end

@implementation APCListener

+ (id)capabilityData
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"version";
  v2 = [NSNumber numberWithUnsignedInteger:0];
  v9[1] = @"aupccapability";
  v10[0] = v2;
  v3 = +[AUPasscodeDecoder supportedDecoders];
  v10[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v5 = objc_alloc(MEMORY[0x263EFF8F8]);
  v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:0 error:0];
  v7 = (void *)[v5 initWithData:v6];

  return v7;
}

- (APCListener)init
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF8F8]);
  v4 = [(APCListener *)self initWithConfigurationData:v3];

  return v4;
}

- (APCListener)initWithConfigurationData:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)APCListener;
  id v5 = [(APCListener *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0];
    codecConfig = v5->_codecConfig;
    v5->_codecConfig = (AUPasscodeCodecConfiguration *)v6;

    v8 = v5->_codecConfig;
    if (v8)
    {
      if ([(AUPasscodeCodecConfiguration *)v8 payloadLengthBytes] > 0)
      {
        v9 = APCLogObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = [(AUPasscodeCodecConfiguration *)v5->_codecConfig payloadLengthBytes];
          v11 = [(AUPasscodeCodecConfiguration *)v5->_codecConfig algorithmName];
          *(_DWORD *)buf = 134218242;
          uint64_t v19 = v10;
          __int16 v20 = 2112;
          v21 = v11;
          _os_log_impl(&dword_237D0E000, v9, OS_LOG_TYPE_INFO, "Created with configuration data. Payload length = %ld, codec = %@", buf, 0x16u);
        }
        v12 = objc_alloc_init(APCListenerResultData);
        resultData = v5->_resultData;
        v5->_resultData = v12;

        goto LABEL_7;
      }
      v15 = APCLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_237D0E000, v15, OS_LOG_TYPE_ERROR, "Codec config has a payload size less than 1, that's not valid!", buf, 2u);
      }
    }
    else
    {
      v15 = APCLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_237D0E000, v15, OS_LOG_TYPE_ERROR, "Failed to unarchive the configuration data object", buf, 2u);
      }
    }

    v14 = 0;
    goto LABEL_14;
  }
LABEL_7:
  v14 = v5;
LABEL_14:

  return v14;
}

- (APCListener)initWithCodecConfiguration:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)APCListener;
  uint64_t v6 = [(APCListener *)&v16 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v6->_codecConfig, a3);
  codecConfig = v7->_codecConfig;
  if (!codecConfig)
  {
    v12 = APCLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 0;
      v13 = "Config is nil, invalid";
LABEL_10:
      _os_log_impl(&dword_237D0E000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)v15, 2u);
    }
LABEL_11:

    v11 = 0;
    goto LABEL_12;
  }
  if ([(AUPasscodeCodecConfiguration *)codecConfig payloadLengthBytes] <= 0)
  {
    v12 = APCLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 0;
      v13 = "Codec config has a payload size less than 1, that's not valid!";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v9 = objc_alloc_init(APCListenerResultData);
  resultData = v7->_resultData;
  v7->_resultData = v9;

LABEL_5:
  v11 = v7;
LABEL_12:

  return v11;
}

- (void)startListening
{
}

- (void)startListeningWithError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = [(APCListener *)self dispatchQueue];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = APCLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    resultData = self->_resultData;
    *(_DWORD *)buf = 134217984;
    uint64_t v22 = resultData;
    _os_log_impl(&dword_237D0E000, v9, OS_LOG_TYPE_INFO, "result data pointer: %p", buf, 0xCu);
  }

  codecConfig = self->_codecConfig;
  id v19 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __39__APCListener_startListeningWithError___block_invoke;
  v20[3] = &unk_264CFE550;
  v20[4] = self;
  v12 = +[APCListenerEngine listenerWithCodecConfig:codecConfig queue:v8 dataReceivedHandler:v20 resultData:self->_resultData error:&v19];
  v13 = (APCListenerResultData *)v19;
  listenerEngine = self->_listenerEngine;
  self->_listenerEngine = v12;

  if (v13)
  {
    v15 = APCLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v13;
      _os_log_impl(&dword_237D0E000, v15, OS_LOG_TYPE_ERROR, "Could not crate the APCListener engine: %@", buf, 0xCu);
    }
  }
  else
  {
    objc_super v16 = self->_listenerEngine;
    id v18 = 0;
    [(APCListenerEngine *)v16 startEngineWithError:&v18];
    v13 = (APCListenerResultData *)v18;
    if (!v13) {
      goto LABEL_16;
    }
    objc_super v17 = APCLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v13;
      _os_log_impl(&dword_237D0E000, v17, OS_LOG_TYPE_ERROR, "Could not start the APCListener engine: %@", buf, 0xCu);
    }
  }
  if (a3)
  {
    v13 = v13;
    *a3 = v13;
  }
LABEL_16:
}

void __39__APCListener_startListeningWithError___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) retrievedDataHandler];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) retrievedDataHandler];
    ((void (**)(void, void, id))v4)[2](v4, 0, v5);
  }
}

- (void)stopListening
{
  [(APCListenerEngine *)self->_listenerEngine stopEngine];
  if (self->_invalidationHandler)
  {
    id v3 = [(APCListener *)self dispatchQueue];
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = dispatch_get_global_queue(0, 0);
    }
    queue = v5;

    dispatch_async(queue, self->_invalidationHandler);
  }
}

- (BOOL)getResultData:(id *)a3
{
  BOOL v5 = [(APCListenerResultData *)self->_resultData isValid];
  if (v5) {
    *a3 = self->_resultData;
  }
  return v5;
}

- (id)retrievedDataHandler
{
  return self->_retrievedDataHandler;
}

- (void)setRetrievedDataHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_retrievedDataHandler, 0);
  objc_storeStrong((id *)&self->_resultData, 0);
  objc_storeStrong((id *)&self->_listenerEngine, 0);

  objc_storeStrong((id *)&self->_codecConfig, 0);
}

@end