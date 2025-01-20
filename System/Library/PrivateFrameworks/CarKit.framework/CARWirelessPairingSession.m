@interface CARWirelessPairingSession
- (CARWirelessPairingDelegate)delegate;
- (CARWirelessPairingSession)initWithVehicleAddress:(id)a3 supportedCapabilites:(unint64_t)a4 keyIdentifier:(id)a5;
- (NSData)vehicleAddress;
- (NSString)keyIdentifier;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)clientQueue;
- (unint64_t)supportedCapabilities;
- (void)_delegate_handleCompletedWithResult:(unint64_t)a3;
- (void)_delegate_handleRequestedPairingWithDeviceAddress:(id)a3 forIntent:(unint64_t)a4 C192:(id)a5 R192:(id)a6 C256:(id)a7 R256:(id)a8;
- (void)_handleConnectionReset;
- (void)_servicePerform:(id)a3;
- (void)_setupConnection;
- (void)_synchronous_servicePerform:(id)a3;
- (void)cancelPairing;
- (void)dealloc;
- (void)handleVehicleReportedResult:(BOOL)a3;
- (void)invalidate;
- (void)requestPairing;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setupVehicleDataC192:(id)a3 r192:(id)a4 c256:(id)a5 r256:(id)a6;
@end

@implementation CARWirelessPairingSession

- (CARWirelessPairingSession)initWithVehicleAddress:(id)a3 supportedCapabilites:(unint64_t)a4 keyIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CARWirelessPairingSession;
  v11 = [(CARWirelessPairingSession *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_vehicleAddress, a3);
    v12->_supportedCapabilities = a4;
    objc_storeStrong((id *)&v12->_keyIdentifier, a5);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.carkit.wirelessPairingSession", v14);
    clientQueue = v12->_clientQueue;
    v12->_clientQueue = (OS_dispatch_queue *)v15;

    [(CARWirelessPairingSession *)v12 _setupConnection];
  }

  return v12;
}

- (void)dealloc
{
  [(CARWirelessPairingSession *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CARWirelessPairingSession;
  [(CARWirelessPairingSession *)&v3 dealloc];
}

- (void)requestPairing
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1ABB00000, v0, v1, "vehicle does not support pairing for CarPlay, stopping pairing", v2, v3, v4, v5, v6);
}

void __43__CARWirelessPairingSession_requestPairing__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__CARWirelessPairingSession_requestPairing__block_invoke_22;
    v6[3] = &unk_1E5E3BA80;
    objc_copyWeak(v7, (id *)(a1 + 40));
    v7[1] = *(id *)(a1 + 48);
    [v3 requestPairingForIntent:v4 completion:v6];
    objc_destroyWeak(v7);
  }
  else
  {
    uint64_t v5 = CarPairingLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __43__CARWirelessPairingSession_requestPairing__block_invoke_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 32), "_delegate_handleCompletedWithResult:", 5);
  }
}

void __43__CARWirelessPairingSession_requestPairing__block_invoke_22(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v22 = CarPairingLogging();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (a2 || !v15)
  {
    if (v23)
    {
      int v24 = 134218242;
      uint64_t v25 = a2;
      __int16 v26 = 2112;
      id v27 = v20;
      _os_log_impl(&dword_1ABB00000, v22, OS_LOG_TYPE_DEFAULT, "cannot request pairing, result: %lu error: %@", (uint8_t *)&v24, 0x16u);
    }

    objc_msgSend(WeakRetained, "_delegate_handleCompletedWithResult:", a2);
  }
  else
  {
    if (v23)
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1ABB00000, v22, OS_LOG_TYPE_DEFAULT, "received pairing data", (uint8_t *)&v24, 2u);
    }

    objc_msgSend(WeakRetained, "_delegate_handleRequestedPairingWithDeviceAddress:forIntent:C192:R192:C256:R256:", v15, *(void *)(a1 + 40), v16, v17, v18, v19);
  }
}

- (void)setupVehicleDataC192:(id)a3 r192:(id)a4 c256:(id)a5 r256:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = CarPairingLogging();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1ABB00000, v14, OS_LOG_TYPE_DEFAULT, "setting up vehicle pairing data", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__CARWirelessPairingSession_setupVehicleDataC192_r192_c256_r256___block_invoke;
  v19[3] = &unk_1E5E3BAF8;
  v19[4] = self;
  id v15 = v10;
  id v20 = v15;
  id v16 = v11;
  id v21 = v16;
  id v17 = v12;
  id v22 = v17;
  id v18 = v13;
  id v23 = v18;
  objc_copyWeak(&v24, buf);
  [(CARWirelessPairingSession *)self _servicePerform:v19];
  objc_destroyWeak(&v24);

  objc_destroyWeak(buf);
}

void __65__CARWirelessPairingSession_setupVehicleDataC192_r192_c256_r256___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__CARWirelessPairingSession_setupVehicleDataC192_r192_c256_r256___block_invoke_25;
    v9[3] = &unk_1E5E3BAD0;
    objc_copyWeak(&v10, (id *)(a1 + 72));
    [v3 setupVehicleDataC192:v4 r192:v5 c256:v6 r256:v7 completion:v9];
    objc_destroyWeak(&v10);
  }
  else
  {
    v8 = CarPairingLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __65__CARWirelessPairingSession_setupVehicleDataC192_r192_c256_r256___block_invoke_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 32), "_delegate_handleCompletedWithResult:", 5);
  }
}

void __65__CARWirelessPairingSession_setupVehicleDataC192_r192_c256_r256___block_invoke_25(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = CarPairingLogging();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v8)
    {
      int v9 = 134218242;
      uint64_t v10 = a2;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1ABB00000, v7, OS_LOG_TYPE_DEFAULT, "pairing completed unsuccessfully, result: %lu error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    if (v8)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1ABB00000, v7, OS_LOG_TYPE_DEFAULT, "pairing completed successfully", (uint8_t *)&v9, 2u);
    }
    a2 = 0;
  }

  objc_msgSend(WeakRetained, "_delegate_handleCompletedWithResult:", a2);
}

- (void)handleVehicleReportedResult:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = CarPairingLogging();
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1ABB00000, v6, OS_LOG_TYPE_DEFAULT, "vehicle reported pairing success", v7, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CARWirelessPairingSession handleVehicleReportedResult:]();
    }

    [(CARWirelessPairingSession *)self cancelPairing];
  }
}

- (void)cancelPairing
{
  BOOL v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1ABB00000, v3, OS_LOG_TYPE_DEFAULT, "cancelling pairing", v4, 2u);
  }

  [(CARWirelessPairingSession *)self _servicePerform:&__block_literal_global_22];
}

uint64_t __42__CARWirelessPairingSession_cancelPairing__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancelPairing];
}

- (void)invalidate
{
  [(CARWirelessPairingSession *)self cancelPairing];
  BOOL v3 = [(CARWirelessPairingSession *)self connection];
  [v3 invalidate];

  [(CARWirelessPairingSession *)self setConnection:0];
}

- (void)_setupConnection
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.carkit.pairing.service" options:4096];
  uint64_t v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F03275A0];
  [v3 setRemoteObjectInterface:v4];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__CARWirelessPairingSession__setupConnection__block_invoke;
  v8[3] = &unk_1E5E3AC10;
  objc_copyWeak(&v9, &location);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__CARWirelessPairingSession__setupConnection__block_invoke_84;
  v6[3] = &unk_1E5E3AC10;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  [v3 resume];
  [(CARWirelessPairingSession *)self setConnection:v3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__CARWirelessPairingSession__setupConnection__block_invoke_85;
  v5[3] = &unk_1E5E3BB40;
  v5[4] = self;
  [(CARWirelessPairingSession *)self _synchronous_servicePerform:v5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__CARWirelessPairingSession__setupConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __45__CARWirelessPairingSession__setupConnection__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionReset];
}

void __45__CARWirelessPairingSession__setupConnection__block_invoke_84(uint64_t a1)
{
  uint64_t v2 = CarPairingLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __45__CARWirelessPairingSession__setupConnection__block_invoke_84_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void __45__CARWirelessPairingSession__setupConnection__block_invoke_85(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 vehicleAddress];
  id v5 = [*(id *)(a1 + 32) keyIdentifier];
  [v4 initializeForVehicleAddress:v6 keyIdentifier:v5 completion:&__block_literal_global_88];
}

void __45__CARWirelessPairingSession__setupConnection__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  id v5 = CarPairingLogging();
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __45__CARWirelessPairingSession__setupConnection__block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __45__CARWirelessPairingSession__setupConnection__block_invoke_2_cold_2((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)_servicePerform:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = [(CARWirelessPairingSession *)self connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_91];

  v4[2](v4, v6);
}

void __45__CARWirelessPairingSession__servicePerform___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __45__CARWirelessPairingSession__servicePerform___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)_synchronous_servicePerform:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  uint64_t v5 = [(CARWirelessPairingSession *)self connection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_93];

  v4[2](v4, v6);
}

void __57__CARWirelessPairingSession__synchronous_servicePerform___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __57__CARWirelessPairingSession__synchronous_servicePerform___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)_handleConnectionReset
{
}

- (void)_delegate_handleRequestedPairingWithDeviceAddress:(id)a3 forIntent:(unint64_t)a4 C192:(id)a5 R192:(id)a6 C256:(id)a7 R256:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = [(CARWirelessPairingSession *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__CARWirelessPairingSession__delegate_handleRequestedPairingWithDeviceAddress_forIntent_C192_R192_C256_R256___block_invoke;
  block[3] = &unk_1E5E3BB68;
  block[4] = self;
  id v26 = v14;
  id v30 = v18;
  unint64_t v31 = a4;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(v19, block);
}

void __109__CARWirelessPairingSession__delegate_handleRequestedPairingWithDeviceAddress_forIntent_C192_R192_C256_R256___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  BOOL v3 = (void *)v2;
  if (v2)
  {
    uint64_t v5 = (void *)v2;
    char v4 = objc_opt_respondsToSelector();
    BOOL v3 = v5;
    if (v4)
    {
      [v5 pairingSession:*(void *)(a1 + 32) requestedPairingWithDeviceAddress:*(void *)(a1 + 40) forIntent:*(void *)(a1 + 80) c192:*(void *)(a1 + 48) r192:*(void *)(a1 + 56) c256:*(void *)(a1 + 64) r256:*(void *)(a1 + 72)];
      BOOL v3 = v5;
    }
  }
}

- (void)_delegate_handleCompletedWithResult:(unint64_t)a3
{
  uint64_t v5 = [(CARWirelessPairingSession *)self clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__CARWirelessPairingSession__delegate_handleCompletedWithResult___block_invoke;
  v6[3] = &unk_1E5E3B9A8;
  void v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __65__CARWirelessPairingSession__delegate_handleCompletedWithResult___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    char v4 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v4 pairingSession:*(void *)(a1 + 32) completedWithResult:*(void *)(a1 + 40)];
    }
  }
  return MEMORY[0x1F4181878]();
}

- (NSData)vehicleAddress
{
  return self->_vehicleAddress;
}

- (unint64_t)supportedCapabilities
{
  return self->_supportedCapabilities;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (CARWirelessPairingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CARWirelessPairingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_vehicleAddress, 0);
}

void __43__CARWirelessPairingSession_requestPairing__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1ABB00000, v0, v1, "cannot request pairing, no connection", v2, v3, v4, v5, v6);
}

void __65__CARWirelessPairingSession_setupVehicleDataC192_r192_c256_r256___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1ABB00000, v0, v1, "cannot setup pairing data, no connection", v2, v3, v4, v5, v6);
}

- (void)handleVehicleReportedResult:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1ABB00000, v0, v1, "vehicle reported pairing failure, cancelling", v2, v3, v4, v5, v6);
}

void __45__CARWirelessPairingSession__setupConnection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1ABB00000, v0, v1, "CarKit wireless pairing service was interrupted", v2, v3, v4, v5, v6);
}

void __45__CARWirelessPairingSession__setupConnection__block_invoke_84_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1ABB00000, v0, v1, "CarKit wireless pairing service was invalidated", v2, v3, v4, v5, v6);
}

void __45__CARWirelessPairingSession__setupConnection__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_1ABB00000, v0, OS_LOG_TYPE_DEBUG, "initialized wireless pairing session", v1, 2u);
}

void __45__CARWirelessPairingSession__setupConnection__block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45__CARWirelessPairingSession__servicePerform___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57__CARWirelessPairingSession__synchronous_servicePerform___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end