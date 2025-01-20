@interface BRLTTranslationService
+ (NSMutableDictionary)connections;
+ (id)connectionForLoopbackService:(id)a3;
+ (id)connectionForServiceIdentifier:(id)a3;
+ (id)connectionsLock;
+ (id)serviceForIdentifier:(id)a3 input:(BOOL)a4;
+ (id)serviceForIdentifier:(id)a3 input:(BOOL)a4 loopback:(BOOL)a5;
- (BOOL)interrupted;
- (BOOL)isInvalid;
- (BOOL)isLoopback;
- (BRLTTranslationService)initWithServiceIdentifier:(id)a3 connection:(id)a4;
- (NSString)serviceIdentifier;
- (NSXPCConnection)queue_connection;
- (OS_dispatch_queue)queue;
- (id)_queue_serviceProxy;
- (id)description;
- (id)invalidationHandler;
- (void)_queue_invalidate;
- (void)_queue_loadBundle;
- (void)_queue_resume;
- (void)brailleForText:(id)a3 parameters:(id)a4 withReply:(id)a5;
- (void)setInterrupted:(BOOL)a3;
- (void)setInvalid:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQueue_connection:(id)a3;
- (void)textForBraille:(id)a3 parameters:(id)a4 withReply:(id)a5;
@end

@implementation BRLTTranslationService

+ (id)serviceForIdentifier:(id)a3 input:(BOOL)a4
{
  return (id)[a1 serviceForIdentifier:a3 input:a4 loopback:0];
}

+ (id)serviceForIdentifier:(id)a3 input:(BOOL)a4 loopback:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
    v11 = v10;
    if (v6)
    {
      v11 = [NSString stringWithFormat:@"%@.input", v10];
    }
    v12 = [a1 connectionsLock];
    [v12 lock];

    v13 = [a1 connections];
    v14 = [v13 objectForKeyedSubscript:v11];

    v15 = [a1 connectionsLock];
    [v15 unlock];

    if (!v14 || [v14 isInvalid])
    {
      if (a5)
      {
        v16 = objc_alloc_init(BRLTSLoopbackTranslationService);
        uint64_t v17 = [a1 connectionForLoopbackService:v16];
        v18 = [[BRLTLoopbackTranslationService alloc] initWithServiceIdentifier:v10 connection:v17 loopbackService:v16];

        v14 = (void *)v17;
      }
      else
      {
        v16 = [a1 connectionForServiceIdentifier:v10];
        v18 = (BRLTLoopbackTranslationService *)[objc_alloc((Class)a1) initWithServiceIdentifier:v10 connection:v16];
      }

      v20 = [a1 connectionsLock];
      [v20 lock];

      v21 = [a1 connections];
      [v21 setObject:v18 forKeyedSubscript:v11];

      v22 = [a1 connectionsLock];
      [v22 unlock];

      v14 = v18;
    }
  }
  else
  {
    v19 = BRLTLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[BRLTTranslationService serviceForIdentifier:input:loopback:](v19);
    }

    v14 = 0;
  }

  return v14;
}

+ (id)connectionForServiceIdentifier:(id)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.accessibility.BrailleTranslation.BrailleTranslationService"];
  v5 = BRLTTranslationServiceInterface();
  [v4 setRemoteObjectInterface:v5];

  BOOL v6 = BRLTTranslationServiceClientInterface();
  [v4 setExportedInterface:v6];

  [v4 setExportedObject:a1];
  return v4;
}

+ (id)connectionForLoopbackService:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F08D68];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 listener];

  id v8 = [v7 endpoint];
  v9 = (void *)[v6 initWithListenerEndpoint:v8];

  id v10 = +[BRLTSTranslationService exportedInterface];
  [v9 setRemoteObjectInterface:v10];

  v11 = BRLTTranslationServiceClientInterface();
  [v9 setExportedInterface:v11];

  [v9 setExportedObject:a1];
  return v9;
}

+ (NSMutableDictionary)connections
{
  if (connections_onceToken != -1) {
    dispatch_once(&connections_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)connections__Connections;
  return (NSMutableDictionary *)v2;
}

uint64_t __37__BRLTTranslationService_connections__block_invoke()
{
  connections__Connections = [MEMORY[0x263EFF9A0] dictionary];
  return MEMORY[0x270F9A758]();
}

+ (id)connectionsLock
{
  if (connectionsLock_onceToken != -1) {
    dispatch_once(&connectionsLock_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)connectionsLock__connectionsLock;
  return v2;
}

uint64_t __41__BRLTTranslationService_connectionsLock__block_invoke()
{
  connectionsLock__connectionsLock = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (BRLTTranslationService)initWithServiceIdentifier:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)BRLTTranslationService;
  v9 = [(BRLTTranslationService *)&v19 init];
  if (v9)
  {
    id v10 = [NSString stringWithFormat:@"%@.serviceQueue", v7];
    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    id v12 = v10;
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], v11);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v9->_queue_connection, a4);
    objc_storeStrong((id *)&v9->_serviceIdentifier, a3);
    v15 = v9->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__BRLTTranslationService_initWithServiceIdentifier_connection___block_invoke;
    block[3] = &unk_26440BBD8;
    v18 = v9;
    dispatch_async(v15, block);
  }
  return v9;
}

uint64_t __63__BRLTTranslationService_initWithServiceIdentifier_connection___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_resume");
  v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_queue_loadBundle");
}

- (BOOL)isLoopback
{
  return 0;
}

- (void)_queue_resume
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(BRLTTranslationService *)self queue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__BRLTTranslationService__queue_resume__block_invoke;
  v10[3] = &unk_26440BC00;
  objc_copyWeak(&v11, &location);
  v4 = [(BRLTTranslationService *)self queue_connection];
  [v4 setInterruptionHandler:v10];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__BRLTTranslationService__queue_resume__block_invoke_19;
  v8[3] = &unk_26440BC00;
  objc_copyWeak(&v9, &location);
  id v5 = [(BRLTTranslationService *)self queue_connection];
  [v5 setInvalidationHandler:v8];

  id v6 = BRLTLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = self;
    _os_log_impl(&dword_21C554000, v6, OS_LOG_TYPE_DEFAULT, "Resuming connection to BrailleTranslationService. service:%@", buf, 0xCu);
  }

  id v7 = [(BRLTTranslationService *)self queue_connection];
  [v7 resume];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __39__BRLTTranslationService__queue_resume__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = BRLTLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v5 = 138412290;
    id v6 = WeakRetained;
    _os_log_impl(&dword_21C554000, v2, OS_LOG_TYPE_DEFAULT, "Connection to service interrupted. service:%@", (uint8_t *)&v5, 0xCu);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  [v4 setInterrupted:1];
}

void __39__BRLTTranslationService__queue_resume__block_invoke_19(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  objc_copyWeak(&to, (id *)(a1 + 32));
  v2 = BRLTLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __39__BRLTTranslationService__queue_resume__block_invoke_19_cold_1(&to, v2);
  }

  id v3 = objc_loadWeakRetained(&to);
  id v4 = [v3 queue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__BRLTTranslationService__queue_resume__block_invoke_20;
  v5[3] = &unk_26440BC00;
  objc_copyWeak(&v6, v1);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&to);
}

void __39__BRLTTranslationService__queue_resume__block_invoke_20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_invalidate");
}

- (void)_queue_invalidate
{
  id v3 = [(BRLTTranslationService *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(BRLTTranslationService *)self queue_connection];
  [v4 invalidate];

  [(BRLTTranslationService *)self setQueue_connection:0];
  [(BRLTTranslationService *)self setInvalid:1];
  int v5 = [(BRLTTranslationService *)self invalidationHandler];

  if (v5)
  {
    id v6 = [(BRLTTranslationService *)self invalidationHandler];
    v6[2]();
  }
}

- (id)_queue_serviceProxy
{
  id v3 = [(BRLTTranslationService *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(BRLTTranslationService *)self interrupted])
  {
    [(BRLTTranslationService *)self setInterrupted:0];
    [(BRLTTranslationService *)self _queue_loadBundle];
  }
  id v4 = [(BRLTTranslationService *)self queue_connection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__BRLTTranslationService__queue_serviceProxy__block_invoke;
  v7[3] = &unk_26440BC28;
  v7[4] = self;
  int v5 = [v4 remoteObjectProxyWithErrorHandler:v7];

  return v5;
}

void __45__BRLTTranslationService__queue_serviceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = BRLTLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__BRLTTranslationService__queue_serviceProxy__block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }
}

- (void)_queue_loadBundle
{
  id v3 = [(BRLTTranslationService *)self queue];
  dispatch_assert_queue_V2(v3);

  id v5 = [(BRLTTranslationService *)self _queue_serviceProxy];
  id v4 = [(BRLTTranslationService *)self serviceIdentifier];
  [v5 loadBrailleBundleForIdentifier:v4];
}

- (void)brailleForText:(id)a3 parameters:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(BRLTTranslationService *)self queue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__BRLTTranslationService_brailleForText_parameters_withReply___block_invoke;
  v15[3] = &unk_26440BC78;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __62__BRLTTranslationService_brailleForText_parameters_withReply___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_serviceProxy");
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__BRLTTranslationService_brailleForText_parameters_withReply___block_invoke_2;
  v5[3] = &unk_26440BC50;
  id v6 = *(id *)(a1 + 56);
  [v2 brailleForText:v3 parameters:v4 withReply:v5];
}

uint64_t __62__BRLTTranslationService_brailleForText_parameters_withReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)textForBraille:(id)a3 parameters:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(BRLTTranslationService *)self queue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__BRLTTranslationService_textForBraille_parameters_withReply___block_invoke;
  v15[3] = &unk_26440BC78;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __62__BRLTTranslationService_textForBraille_parameters_withReply___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_serviceProxy");
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__BRLTTranslationService_textForBraille_parameters_withReply___block_invoke_2;
  v5[3] = &unk_26440BC50;
  id v6 = *(id *)(a1 + 56);
  [v2 textForBraille:v3 parameters:v4 withReply:v5];
}

uint64_t __62__BRLTTranslationService_textForBraille_parameters_withReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x263F089D8];
  v8.receiver = self;
  v8.super_class = (Class)BRLTTranslationService;
  uint64_t v4 = [(BRLTTranslationService *)&v8 description];
  id v5 = [(BRLTTranslationService *)self serviceIdentifier];
  id v6 = [v3 stringWithFormat:@"<%@ service:%@", v4, v5];

  if ([(BRLTTranslationService *)self isInvalid]) {
    [v6 appendString:@" INVALID"];
  }
  [v6 appendString:@">"];
  return v6;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (BOOL)isInvalid
{
  return self->_invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSXPCConnection)queue_connection
{
  return self->_queue_connection;
}

- (void)setQueue_connection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queue_connection, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

+ (void)serviceForIdentifier:(os_log_t)log input:loopback:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C554000, log, OS_LOG_TYPE_ERROR, "Attempted to load service with nil identifier.", v1, 2u);
}

void __39__BRLTTranslationService__queue_resume__block_invoke_19_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1);
  int v4 = 138412290;
  id v5 = WeakRetained;
  _os_log_error_impl(&dword_21C554000, a2, OS_LOG_TYPE_ERROR, "Connection to service invalidated. service:%@", (uint8_t *)&v4, 0xCu);
}

void __45__BRLTTranslationService__queue_serviceProxy__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_21C554000, log, OS_LOG_TYPE_ERROR, "Couldn't get remote object proxy. service:%@ / %@", (uint8_t *)&v4, 0x16u);
}

@end