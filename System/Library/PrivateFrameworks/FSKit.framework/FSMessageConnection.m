@interface FSMessageConnection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCompleted;
- (FSMessageConnection)initWithCoder:(id)a3;
- (FSMessageConnection)initWithEndpoint:(id)a3;
- (FSMessageReceiver)receiver;
- (NSArray)preferredLanguages;
- (NSLocale)locale;
- (NSXPCConnection)connection;
- (NSXPCListenerEndpoint)endpoint;
- (id)earlyCompletedBlock;
- (id)lateCompletedBlock;
- (id)localizedMessage:(id)a3 table:(id)a4 bundle:(id)a5;
- (id)localizedMessage:(id)a3 table:(id)a4 bundle:(id)a5 arguments:(char *)a6;
- (id)localizedMessage:(id)a3 table:(id)a4 bundle:(id)a5 array:(id)a6;
- (void)completed:(id)a3 reply:(id)a4;
- (void)completed:(id)a3 replyHandler:(id)a4;
- (void)connect:(id)a3;
- (void)didCompleteWithError:(id)a3 completionHandler:(id)a4;
- (void)didStart;
- (void)encodeWithCoder:(id)a3;
- (void)getLocalizationSetup:(id)a3;
- (void)logLocalizedMessage:(id)a3 table:(id)a4 bundle:(id)a5;
- (void)logLocalizedMessage:(id)a3 table:(id)a4 bundle:(id)a5 arguments:(char *)a6;
- (void)logLocalizedMessage:(id)a3 table:(id)a4 bundle:(id)a5 array:(id)a6;
- (void)logMessage:(id)a3;
- (void)prompt:(id)a3 replyHandler:(id)a4;
- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4;
- (void)setEarlyCompletedBlock:(id)a3;
- (void)setLateCompletedBlock:(id)a3;
- (void)setReceiver:(id)a3;
@end

@implementation FSMessageConnection

- (void)logMessage:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_11];
  [v5 logMessage:v4];
}

void __34__FSMessageConnection_logMessage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = fskit_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __34__FSMessageConnection_logMessage___block_invoke_cold_1(v2);
  }
}

- (void)completed:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__FSMessageConnection_completed_reply___block_invoke;
  v8[3] = &unk_26530B0E8;
  id v9 = v6;
  id v7 = v6;
  [(FSMessageConnection *)self completed:a3 replyHandler:v8];
}

uint64_t __39__FSMessageConnection_completed_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didCompleteWithError:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__FSMessageConnection_didCompleteWithError_completionHandler___block_invoke;
  v8[3] = &unk_26530B0E8;
  id v9 = v6;
  id v7 = v6;
  [(FSMessageConnection *)self completed:a3 replyHandler:v8];
}

uint64_t __62__FSMessageConnection_didCompleteWithError_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)getLocalizationSetup:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__FSMessageConnection_getLocalizationSetup___block_invoke;
  v8[3] = &unk_26530B198;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 getLocalizationSetup:v6];
}

void __44__FSMessageConnection_getLocalizationSetup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fskit_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __34__FSMessageConnection_logMessage___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)earlyCompletedBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setEarlyCompletedBlock:(id)a3
{
}

- (id)lateCompletedBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setLateCompletedBlock:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)hasCompleted
{
  return self->_hasCompleted;
}

- (NSArray)preferredLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (FSMessageReceiver)receiver
{
  return (FSMessageReceiver *)objc_getProperty(self, a2, 56, 1);
}

- (void)setReceiver:(id)a3
{
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_lateCompletedBlock, 0);
  objc_storeStrong(&self->_earlyCompletedBlock, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be encoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v4);
  }
  [v5 encodeObject:self->_endpoint forKey:@"FSMessageConnection.Endpoint"];
}

- (FSMessageConnection)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v8);
  }
  if ([v4 containsValueForKey:@"FSMessageConnection.Endpoint"])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSMessageConnection.Endpoint"];
    self = [(FSMessageConnection *)self initWithEndpoint:v5];

    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)connect:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = fskit_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FSMessageConnection(Private) connect:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  if (self->_connection)
  {
    v13 = fskit_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[FSMessageConnection(Private) connect:](v13, v14, v15, v16, v17, v18, v19, v20);
    }

    v21 = fs_errorForPOSIXError(17);
    v4[2](v4, v21);
  }
  else
  {
    objc_initWeak(&location, self);
    v22 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:self->_endpoint];
    connection = self->_connection;
    self->_connection = v22;

    v24 = +[FSKitConstants FSTaskOperations];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v24];

    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __40__FSMessageConnection_Private__connect___block_invoke;
    v46[3] = &unk_26530B130;
    objc_copyWeak(&v47, &location);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v46];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
    id location = 0;
    p_id location = &location;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__3;
    v44 = __Block_byref_object_dispose__3;
    id v45 = 0;
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__3;
    v38 = __Block_byref_object_dispose__3;
    id v39 = 0;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __40__FSMessageConnection_Private__connect___block_invoke_74;
    v33[3] = &unk_26530B9B8;
    v33[4] = &location;
    v33[5] = &v34;
    [(FSMessageConnection *)self getLocalizationSetup:v33];
    objc_storeStrong((id *)&self->_locale, p_location[5]);
    objc_storeStrong((id *)&self->_preferredLanguages, (id)v35[5]);
    v25 = fskit_std_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[FSMessageConnection(Private) connect:](v25, v26, v27, v28, v29, v30, v31, v32);
    }

    v4[2](v4, 0);
    _Block_object_dispose(&v34, 8);

    _Block_object_dispose(&location, 8);
  }
}

void __40__FSMessageConnection_Private__connect___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = fs_errorForCocoaError(4097);
    [WeakRetained completed:v1 replyHandler:&__block_literal_global_72];
  }
}

void __40__FSMessageConnection_Private__connect___block_invoke_74(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v10)
  {
    uint64_t v11 = fskit_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __40__FSMessageConnection_Private__connect___block_invoke_74_cold_1(v10, v11);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (void)logLocalizedMessage:(id)a3 table:(id)a4 bundle:(id)a5 array:(id)a6
{
  id v7 = [(FSMessageConnection *)self localizedMessage:a3 table:a4 bundle:a5 array:a6];
  [(FSMessageConnection *)self logMessage:v7];
}

- (void)logLocalizedMessage:(id)a3 table:(id)a4 bundle:(id)a5 arguments:(char *)a6
{
  id v7 = [(FSMessageConnection *)self localizedMessage:a3 table:a4 bundle:a5 arguments:a6];
  [(FSMessageConnection *)self logMessage:v7];
}

- (void)completed:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  BOOL hasCompleted = v8->_hasCompleted;
  id v10 = (void (**)(void *, id))_Block_copy(v8->_earlyCompletedBlock);
  id earlyCompletedBlock = v8->_earlyCompletedBlock;
  v8->_id earlyCompletedBlock = 0;

  uint64_t v12 = (void (**)(void *, id))_Block_copy(v8->_lateCompletedBlock);
  id lateCompletedBlock = v8->_lateCompletedBlock;
  v8->_id lateCompletedBlock = 0;

  if (!v8->_hasCompleted) {
    v8->_BOOL hasCompleted = 1;
  }
  objc_sync_exit(v8);

  if (hasCompleted)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else
  {
    if (v10) {
      v10[2](v10, v6);
    }
    connection = v8->_connection;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __55__FSMessageConnection_Private__completed_replyHandler___block_invoke;
    v17[3] = &unk_26530B198;
    id v15 = v7;
    id v18 = v15;
    uint64_t v16 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v17];
    [v16 completed:v6 replyHandler:v15];
    if (v12) {
      v12[2](v12, v6);
    }
  }
}

void __55__FSMessageConnection_Private__completed_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fskit_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __34__FSMessageConnection_logMessage___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prompt:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__FSMessageConnection_Private__prompt_replyHandler___block_invoke;
  v11[3] = &unk_26530B198;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  [v10 prompt:v9 replyHandler:v8];
}

void __52__FSMessageConnection_Private__prompt_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fskit_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __34__FSMessageConnection_logMessage___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__FSMessageConnection_Private__promptTrueFalse_replyHandler___block_invoke;
  v11[3] = &unk_26530B198;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  [v10 promptTrueFalse:v9 replyHandler:v8];
}

void __61__FSMessageConnection_Private__promptTrueFalse_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fskit_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __34__FSMessageConnection_logMessage___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)logLocalizedMessage:(id)a3 table:(id)a4 bundle:(id)a5
{
  [(FSMessageConnection *)self logLocalizedMessage:a3 table:a4 bundle:a5 arguments:&v5];
}

- (id)localizedMessage:(id)a3 table:(id)a4 bundle:(id)a5
{
  uint64_t v5 = [(FSMessageConnection *)self localizedMessage:a3 table:a4 bundle:a5 arguments:&v8];
  return v5;
}

- (FSMessageConnection)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FSMessageConnection;
  id v6 = [(FSMessageConnection *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpoint, a3);
    connection = v7->_connection;
    v7->_connection = 0;

    v7->_BOOL hasCompleted = 0;
    uint64_t v9 = [MEMORY[0x263EFF960] currentLocale];
    locale = v7->_locale;
    v7->_locale = (NSLocale *)v9;

    uint64_t v11 = [MEMORY[0x263EFF960] preferredLanguages];
    preferredLanguages = v7->_preferredLanguages;
    v7->_preferredLanguages = (NSArray *)v11;

    receiver = v7->_receiver;
    v7->_receiver = 0;
  }
  return v7;
}

- (void)didStart
{
  receiver = self->_receiver;
  if (receiver) {
    [(FSMessageReceiver *)receiver didStart];
  }
}

- (id)localizedMessage:(id)a3 table:(id)a4 bundle:(id)a5 array:(id)a6
{
  locale = self->_locale;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  objc_super v15 = [(NSLocale *)locale languageCode];
  uint64_t v16 = [v12 localizedStringForKey:v14 value:0 table:v13 localization:v15];

  uint64_t v17 = +[FSKitUtils stringWithFormatString:v16 locale:self->_locale arguments:v11];

  return v17;
}

- (id)localizedMessage:(id)a3 table:(id)a4 bundle:(id)a5 arguments:(char *)a6
{
  locale = self->_locale;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(NSLocale *)locale languageCode];
  objc_super v15 = [v11 localizedStringForKey:v13 value:0 table:v12 localization:v14];

  uint64_t v16 = (void *)[[NSString alloc] initWithFormat:v15 locale:self->_locale arguments:a6];
  return v16;
}

void __34__FSMessageConnection_logMessage___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_15(&dword_24DDB2000, v2, v3, "Can't get proxy object error: %@", v4, v5, v6, v7, v8);
}

void __40__FSMessageConnection_Private__connect___block_invoke_74_cold_1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  int v4 = 136315394;
  uint64_t v5 = "-[FSMessageConnection(Private) connect:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_24DDB2000, a2, OS_LOG_TYPE_ERROR, "%s: Can't get localization setup from client (%@), using current locale", (uint8_t *)&v4, 0x16u);
}

@end