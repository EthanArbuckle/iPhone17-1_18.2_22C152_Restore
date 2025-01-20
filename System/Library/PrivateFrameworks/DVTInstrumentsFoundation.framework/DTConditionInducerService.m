@interface DTConditionInducerService
+ (void)registerCapabilities:(id)a3;
- (DTConditionInducerService)initWithChannel:(id)a3;
- (NSXPCConnection)connectionToService;
- (id)availableConditionInducers;
- (id)disableActiveCondition;
- (id)disableConditionWithIdentifier:(id)a3;
- (id)enableConditionWithIdentifier:(id)a3 profileIdentifier:(id)a4;
- (void)_disconnectServiceConnection;
- (void)_requestAvailableConditionInducersWithCompletion:(id)a3;
- (void)_requestDisableActiveConditionInducerWithCompletion:(id)a3;
- (void)_requestDisableConditionInducerWithIdentifier:(id)a3 completion:(id)a4;
- (void)_requestEnableConditionInducerWithIdentifier:(id)a3 profileIdentifier:(id)a4 completion:(id)a5;
- (void)activeConditionsDidStop;
- (void)activeConditionsWillStop;
- (void)dealloc;
- (void)setConnectionToService:(id)a3;
@end

@implementation DTConditionInducerService

- (DTConditionInducerService)initWithChannel:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DTConditionInducerService;
  v5 = [(DTXService *)&v15 initWithChannel:v4];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.dt.DTConditionInducerSupportService"];
    connectionToService = v5->_connectionToService;
    v5->_connectionToService = (NSXPCConnection *)v6;

    v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E54A0A8];
    [(NSXPCConnection *)v5->_connectionToService setRemoteObjectInterface:v8];

    v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E53EB20];
    [(NSXPCConnection *)v5->_connectionToService setExportedInterface:v9];

    [(NSXPCConnection *)v5->_connectionToService setExportedObject:v5];
    [(NSXPCConnection *)v5->_connectionToService resume];
    objc_initWeak(&location, v5);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_2308CAD34;
    v11[3] = &unk_264B8F288;
    v12 = v5;
    objc_copyWeak(&v13, &location);
    [v4 registerDisconnectHandler:v11];
    objc_destroyWeak(&v13);

    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  [(DTConditionInducerService *)self _disconnectServiceConnection];
  v3.receiver = self;
  v3.super_class = (Class)DTConditionInducerService;
  [(DTConditionInducerService *)&v3 dealloc];
}

- (void)_disconnectServiceConnection
{
  [(NSXPCConnection *)self->_connectionToService invalidate];
  connectionToService = self->_connectionToService;
  self->_connectionToService = 0;
}

+ (void)registerCapabilities:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v6 = 138412290;
    *(void *)&v6[4] = objc_opt_class();
    id v5 = *(id *)&v6[4];
    _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Registering service %@", v6, 0xCu);
  }
  [v4 publishCapability:@"com.apple.instruments.server.services.ConditionInducer" withVersion:1 forClass:a1];
}

- (id)availableConditionInducers
{
  objc_super v3 = objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_2308CB024;
  v8[3] = &unk_264B8F2B0;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(DTConditionInducerService *)self _requestAvailableConditionInducersWithCompletion:v8];
  id v5 = v9;
  id v6 = v4;

  return v6;
}

- (id)disableActiveCondition
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = (id)objc_opt_class();
    id v3 = v12;
    _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@: disable active condition", buf, 0xCu);
  }
  id v4 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2308CB2E0;
  v9[3] = &unk_264B8F2D8;
  v9[4] = self;
  id v5 = v4;
  id v10 = v5;
  [(DTConditionInducerService *)self _requestDisableActiveConditionInducerWithCompletion:v9];
  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (id)disableConditionWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2112;
    id v18 = v4;
    id v5 = v16;
    _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@: disable condition with identifier: %@", buf, 0x16u);
  }
  id v6 = objc_opt_new();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2308CB648;
  v12[3] = &unk_264B8F300;
  v12[4] = self;
  id v13 = v4;
  id v7 = v6;
  id v14 = v7;
  id v8 = v4;
  [(DTConditionInducerService *)self _requestDisableConditionInducerWithIdentifier:v8 completion:v12];
  id v9 = v14;
  id v10 = v7;

  return v10;
}

- (id)enableConditionWithIdentifier:(id)a3 profileIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v21 = (id)objc_opt_class();
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    id v8 = v21;
    _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%@: enable condition with identifier '%@' profile '%@'", buf, 0x20u);
  }
  id v9 = objc_opt_new();
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_2308CBA0C;
  v16[3] = &unk_264B8F328;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v10 = v9;
  id v19 = v10;
  id v11 = v7;
  id v12 = v6;
  [(DTConditionInducerService *)self _requestEnableConditionInducerWithIdentifier:v12 profileIdentifier:v11 completion:v16];
  id v13 = v19;
  id v14 = v10;

  return v14;
}

- (void)_requestAvailableConditionInducersWithCompletion:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DTConditionInducerService *)self connectionToService];

  if (v5)
  {
    id v6 = [(DTConditionInducerService *)self connectionToService];
    id v7 = [v6 remoteObjectProxy];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_2308CBDBC;
    v11[3] = &unk_264B8F350;
    id v12 = v4;
    [v7 listAvailableConditionInducersWithReply:v11];

    id v8 = v12;
  }
  else
  {
    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = @"The Condition Inducer service is not available.";
    id v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v8 = [v9 errorWithDomain:@"DTConditionInducerService" code:2 userInfo:v10];

    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

- (void)_requestEnableConditionInducerWithIdentifier:(id)a3 profileIdentifier:(id)a4 completion:(id)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DTConditionInducerService *)self connectionToService];

  if (v11)
  {
    id v12 = [(DTConditionInducerService *)self connectionToService];
    uint64_t v13 = [v12 remoteObjectProxy];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_2308CBF88;
    v17[3] = &unk_264B8F378;
    id v18 = v10;
    [v13 enableConditionInducerWithIdentifier:v8 profileIdentifier:v9 reply:v17];

    id v14 = v18;
  }
  else
  {
    objc_super v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F08320];
    v20[0] = @"The Condition Inducer service is not available.";
    id v16 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v14 = [v15 errorWithDomain:@"DTConditionInducerService" code:2 userInfo:v16];

    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

- (void)_requestDisableConditionInducerWithIdentifier:(id)a3 completion:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DTConditionInducerService *)self connectionToService];

  if (v8)
  {
    id v9 = [(DTConditionInducerService *)self connectionToService];
    id v10 = [v9 remoteObjectProxy];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = sub_2308CC214;
    v14[3] = &unk_264B8F378;
    id v15 = v7;
    [v10 disableConditionInducerWithIdentifier:v6 reply:v14];

    id v11 = v15;
  }
  else
  {
    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F08320];
    v17[0] = @"The Condition Inducer service is not available.";
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v11 = [v12 errorWithDomain:@"DTConditionInducerService" code:2 userInfo:v13];

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)_requestDisableActiveConditionInducerWithCompletion:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DTConditionInducerService *)self connectionToService];

  if (v5)
  {
    id v6 = [(DTConditionInducerService *)self connectionToService];
    id v7 = [v6 remoteObjectProxy];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_2308CC48C;
    v11[3] = &unk_264B8F378;
    id v12 = v4;
    [v7 disableActiveConditionInducerWithReply:v11];

    id v8 = v12;
  }
  else
  {
    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = @"The Condition Inducer service is not available.";
    id v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v8 = [v9 errorWithDomain:@"DTConditionInducerService" code:2 userInfo:v10];

    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

- (void)activeConditionsWillStop
{
  id v4 = [MEMORY[0x263F38CA0] message];
  [v4 setInteger:1 forMessageKey:@"ActiveConditionsWillStop"];
  id v3 = [(DTXService *)self channel];
  [v3 sendControlAsync:v4 replyHandler:0];
}

- (void)activeConditionsDidStop
{
  id v4 = [MEMORY[0x263F38CA0] message];
  [v4 setInteger:1 forMessageKey:@"ActiveConditionsDidStop"];
  id v3 = [(DTXService *)self channel];
  [v3 sendControlAsync:v4 replyHandler:0];
}

- (NSXPCConnection)connectionToService
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnectionToService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end