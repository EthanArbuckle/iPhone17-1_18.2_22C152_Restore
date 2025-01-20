@interface ANAnnounceReachability
+ (id)stringForAnnounceReachabilityLevel:(unint64_t)a3;
- (ANAnnounceReachability)init;
- (ANAnnounceReachabilityDelegate)delegate;
- (NSXPCConnection)connection;
- (OS_os_log)log;
- (unint64_t)announceReachabilityForHomeName:(id)a3;
- (unint64_t)announceReachabilityForHomeUUID:(id)a3;
- (unint64_t)announceReachabilityForRoomName:(id)a3 inHomeName:(id)a4;
- (unint64_t)announceReachabilityForRoomUUID:(id)a3 inHomeUUID:(id)a4;
- (void)_start;
- (void)dealloc;
- (void)invalidate;
- (void)reachabilityLevel:(unint64_t)a3 didChangeForHomeName:(id)a4;
- (void)reachabilityLevel:(unint64_t)a3 didChangeForHomeUUID:(id)a4;
- (void)reachabilityLevel:(unint64_t)a3 didChangeForRoomName:(id)a4 inHomeName:(id)a5;
- (void)reachabilityLevel:(unint64_t)a3 didChangeForRoomUUID:(id)a4 inHomeUUID:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation ANAnnounceReachability

- (ANAnnounceReachability)init
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)ANAnnounceReachability;
  v2 = [(ANAnnounceReachability *)&v21 init];
  if (v2)
  {
    uint64_t v3 = ANLogWithCategory("ReachabilityClient");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = @"com.apple.announced.reachability";
      _os_log_impl(&dword_220FAA000, v5, OS_LOG_TYPE_DEFAULT, "Creating Connection to %@", buf, 0xCu);
    }
    uint64_t v6 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.announced.reachability" options:4096];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v6;

    v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D2E35A0];
    v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D2DF798];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v8];
    v10 = objc_opt_new();
    [v10 setDelegate:v2];
    [(NSXPCConnection *)v2->_connection setExportedInterface:v9];
    [(NSXPCConnection *)v2->_connection setExportedObject:v10];
    objc_initWeak((id *)buf, v2);
    v11 = v2->_connection;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __30__ANAnnounceReachability_init__block_invoke;
    v19[3] = &unk_264587168;
    objc_copyWeak(&v20, (id *)buf);
    [(NSXPCConnection *)v11 setInterruptionHandler:v19];
    v12 = v2->_connection;
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __30__ANAnnounceReachability_init__block_invoke_81;
    v17 = &unk_264587168;
    objc_copyWeak(&v18, (id *)buf);
    [(NSXPCConnection *)v12 setInvalidationHandler:&v14];
    [(NSXPCConnection *)v2->_connection resume];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

void __30__ANAnnounceReachability_init__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained log];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_220FAA000, v3, OS_LOG_TYPE_DEFAULT, "Connection to announced was interrupted", v6, 2u);
  }

  id v4 = objc_loadWeakRetained(v1);
  v5 = [v4 delegate];
  [v5 connectionInterrupted];
}

void __30__ANAnnounceReachability_init__block_invoke_81(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained log];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_220FAA000, v3, OS_LOG_TYPE_DEFAULT, "Connection to announced was invalidated", v6, 2u);
  }

  id v4 = objc_loadWeakRetained(v1);
  v5 = [v4 delegate];
  [v5 connectionInvalidated];
}

- (void)dealloc
{
  uint64_t v3 = [(ANAnnounceReachability *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_220FAA000, v3, OS_LOG_TYPE_DEFAULT, "Dealloc Reachability", buf, 2u);
  }

  [(ANAnnounceReachability *)self invalidate];
  v4.receiver = self;
  v4.super_class = (Class)ANAnnounceReachability;
  [(ANAnnounceReachability *)&v4 dealloc];
}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_delegate, 0);
  id v3 = [(ANAnnounceReachability *)self connection];
  [v3 invalidate];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  if (obj)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = obj;
    if (WeakRetained == obj) {
      goto LABEL_6;
    }
    [(ANAnnounceReachability *)self _start];
  }
  else
  {
    objc_storeWeak((id *)&self->_delegate, 0);
  }
  v5 = obj;
LABEL_6:
}

- (ANAnnounceReachabilityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ANAnnounceReachabilityDelegate *)WeakRetained;
}

- (unint64_t)announceReachabilityForHomeName:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  connection = self->_connection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__ANAnnounceReachability_announceReachabilityForHomeName___block_invoke;
  v10[3] = &unk_264587490;
  v10[4] = self;
  uint64_t v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__ANAnnounceReachability_announceReachabilityForHomeName___block_invoke_85;
  v9[3] = &unk_2645870F0;
  v9[4] = &v11;
  [v6 announceReachabilityForHomeName:v4 reply:v9];

  unint64_t v7 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __58__ANAnnounceReachability_announceReachabilityForHomeName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__ANAnnounceReachability_announceReachabilityForHomeName___block_invoke_cold_1();
  }
}

uint64_t __58__ANAnnounceReachability_announceReachabilityForHomeName___block_invoke_85(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (unint64_t)announceReachabilityForRoomName:(id)a3 inHomeName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  connection = self->_connection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__ANAnnounceReachability_announceReachabilityForRoomName_inHomeName___block_invoke;
  v13[3] = &unk_264587490;
  v13[4] = self;
  v9 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__ANAnnounceReachability_announceReachabilityForRoomName_inHomeName___block_invoke_87;
  v12[3] = &unk_2645870F0;
  v12[4] = &v14;
  [v9 announceReachabilityForRoomName:v6 inHomeName:v7 reply:v12];

  unint64_t v10 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __69__ANAnnounceReachability_announceReachabilityForRoomName_inHomeName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__ANAnnounceReachability_announceReachabilityForRoomName_inHomeName___block_invoke_cold_1();
  }
}

uint64_t __69__ANAnnounceReachability_announceReachabilityForRoomName_inHomeName___block_invoke_87(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (unint64_t)announceReachabilityForHomeUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  connection = self->_connection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__ANAnnounceReachability_announceReachabilityForHomeUUID___block_invoke;
  v10[3] = &unk_264587490;
  v10[4] = self;
  id v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__ANAnnounceReachability_announceReachabilityForHomeUUID___block_invoke_88;
  v9[3] = &unk_2645870F0;
  v9[4] = &v11;
  [v6 announceReachabilityForHomeUUID:v4 reply:v9];

  unint64_t v7 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __58__ANAnnounceReachability_announceReachabilityForHomeUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__ANAnnounceReachability_announceReachabilityForHomeUUID___block_invoke_cold_1();
  }
}

uint64_t __58__ANAnnounceReachability_announceReachabilityForHomeUUID___block_invoke_88(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (unint64_t)announceReachabilityForRoomUUID:(id)a3 inHomeUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  connection = self->_connection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__ANAnnounceReachability_announceReachabilityForRoomUUID_inHomeUUID___block_invoke;
  v13[3] = &unk_264587490;
  v13[4] = self;
  v9 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__ANAnnounceReachability_announceReachabilityForRoomUUID_inHomeUUID___block_invoke_89;
  v12[3] = &unk_2645870F0;
  v12[4] = &v14;
  [v9 announceReachabilityForRoomUUID:v6 inHomeUUID:v7 reply:v12];

  unint64_t v10 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __69__ANAnnounceReachability_announceReachabilityForRoomUUID_inHomeUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__ANAnnounceReachability_announceReachabilityForRoomUUID_inHomeUUID___block_invoke_cold_1();
  }
}

uint64_t __69__ANAnnounceReachability_announceReachabilityForRoomUUID_inHomeUUID___block_invoke_89(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (id)stringForAnnounceReachabilityLevel:(unint64_t)a3
{
  if (a3)
  {
    char v3 = a3;
    id v4 = objc_opt_new();
    v5 = v4;
    if (v3) {
      [v4 addObject:@"Local"];
    }
    if ((v3 & 2) != 0) {
      [v5 addObject:@"Remote"];
    }
    id v6 = NSString;
    id v7 = [v5 componentsJoinedByString:@" | "];
    v8 = [v6 stringWithFormat:@"[%@]", v7];
  }
  else
  {
    v8 = @"[Unknown]";
  }

  return v8;
}

- (void)_start
{
  char v3 = [(ANAnnounceReachability *)self connection];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__ANAnnounceReachability__start__block_invoke;
  v6[3] = &unk_264587490;
  v6[4] = self;
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__ANAnnounceReachability__start__block_invoke_105;
  v5[3] = &unk_2645876B0;
  v5[4] = self;
  [v4 resumeWithCompletionHandler:v5];
}

void __32__ANAnnounceReachability__start__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __32__ANAnnounceReachability__start__block_invoke_cold_1();
  }
}

void __32__ANAnnounceReachability__start__block_invoke_105(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 announceReachabilityDidStartScanning:*(void *)(a1 + 32)];
  }
}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForHomeName:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(ANAnnounceReachability *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = +[ANAnnounceReachability stringForAnnounceReachabilityLevel:a3];
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_220FAA000, v7, OS_LOG_TYPE_DEFAULT, "Reachability updated for Home = %@: %@", (uint8_t *)&v12, 0x16u);
  }
  v9 = [(ANAnnounceReachability *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(ANAnnounceReachability *)self delegate];
    [v11 announceReachability:self didUpdateReachabilityLevel:a3 forHomeName:v6];
  }
}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForRoomName:(id)a4 inHomeName:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  char v10 = [(ANAnnounceReachability *)self log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = +[ANAnnounceReachability stringForAnnounceReachabilityLevel:a3];
    int v15 = 138412802;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_impl(&dword_220FAA000, v10, OS_LOG_TYPE_DEFAULT, "Reachability updated for Home = %@, Room = %@: %@", (uint8_t *)&v15, 0x20u);
  }
  int v12 = [(ANAnnounceReachability *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    __int16 v14 = [(ANAnnounceReachability *)self delegate];
    [v14 announceReachability:self didUpdateReachabilityLevel:a3 forRoomName:v8 inHomeName:v9];
  }
}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForHomeUUID:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(ANAnnounceReachability *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = +[ANAnnounceReachability stringForAnnounceReachabilityLevel:a3];
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    int v15 = v8;
    _os_log_impl(&dword_220FAA000, v7, OS_LOG_TYPE_DEFAULT, "Reachability updated for Home = %@: %@", (uint8_t *)&v12, 0x16u);
  }
  id v9 = [(ANAnnounceReachability *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(ANAnnounceReachability *)self delegate];
    [v11 announceReachability:self didUpdateReachabilityLevel:a3 forHomeUUID:v6];
  }
}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForRoomUUID:(id)a4 inHomeUUID:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  char v10 = [(ANAnnounceReachability *)self log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = +[ANAnnounceReachability stringForAnnounceReachabilityLevel:a3];
    int v15 = 138412802;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_impl(&dword_220FAA000, v10, OS_LOG_TYPE_DEFAULT, "Reachability updated for Home = %@, Room = %@: %@", (uint8_t *)&v15, 0x20u);
  }
  int v12 = [(ANAnnounceReachability *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    __int16 v14 = [(ANAnnounceReachability *)self delegate];
    [v14 announceReachability:self didUpdateReachabilityLevel:a3 forRoomUUID:v8 inHomeUUID:v9];
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __58__ANAnnounceReachability_announceReachabilityForHomeName___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_220FAA000, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
}

void __69__ANAnnounceReachability_announceReachabilityForRoomName_inHomeName___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_220FAA000, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
}

void __58__ANAnnounceReachability_announceReachabilityForHomeUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_220FAA000, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
}

void __69__ANAnnounceReachability_announceReachabilityForRoomUUID_inHomeUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_220FAA000, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
}

void __32__ANAnnounceReachability__start__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_220FAA000, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
}

@end