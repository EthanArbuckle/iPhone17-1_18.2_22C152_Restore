@interface HAP2AccessoryServerCoordinator
- (BOOL)isDiscovering;
- (BOOL)isStartDiscoveringPending;
- (BOOL)isStopDiscoveringPending;
- (HAP2AccessoryServerBrowserPrivate)browser;
- (HAP2AccessoryServerControllerFactory)controllerFactory;
- (HAP2AccessoryServerCoordinator)initWithDiscovery:(id)a3 pairingFactory:(id)a4 transportFactory:(id)a5 secureTransportFactory:(id)a6 encodingFactory:(id)a7 controllerFactory:(id)a8;
- (HAP2AccessoryServerCoordinatorDelegate)delegate;
- (HAP2AccessoryServerDiscovery)discovery;
- (HAP2AccessoryServerEncodingFactory)encodingFactory;
- (HAP2AccessoryServerPairingFactory)pairingFactory;
- (HAP2AccessoryServerSecureTransportFactory)secureTransportFactory;
- (HAP2AccessoryServerTransportFactory)transportFactory;
- (HAP2PropertyLock)propertyLock;
- (HAP2SerializedOperationQueue)operationQueue;
- (NSMutableDictionary)discoveredAccessoryServers;
- (NSOperationQueue)localOperationQueue;
- (id)_createMetadataForAccessoryServerWithAccessoryInfo:(id)a3;
- (id)_createPairedAccessoryServerWithAccessoryInfo:(id)a3 transport:(id)a4 operationQueue:(id)a5;
- (id)_createUnpairedAccessoryServerWithAccessoryInfo:(id)a3 transport:(id)a4 operationQueue:(id)a5;
- (void)_didDeterminePairingStateForAccessory:(id)a3 isPaired:(BOOL)a4 completion:(id)a5;
- (void)_didDiscoverAccessory:(id)a3 completion:(id)a4;
- (void)_didDiscoverPairedAccessory:(id)a3 transport:(id)a4 operationQueue:(id)a5 completion:(id)a6;
- (void)_didDiscoverUnpairedAccessory:(id)a3 transport:(id)a4 operationQueue:(id)a5 completion:(id)a6;
- (void)_didLoseAccessory:(id)a3 error:(id)a4;
- (void)_didStartDiscoveringWithError:(id)a3;
- (void)_didStopDiscoveringWithError:(id)a3;
- (void)_startDiscovering;
- (void)_stopDiscovering;
- (void)discovery:(id)a3 didDiscoverAccessory:(id)a4;
- (void)discovery:(id)a3 didLoseAccessory:(id)a4 error:(id)a5;
- (void)discovery:(id)a3 didStartDiscoveringWithError:(id)a4;
- (void)discovery:(id)a3 didStopDiscoveringWithError:(id)a4;
- (void)resurfaceDiscoveryInfoForDeviceID:(id)a3;
- (void)setBrowser:(id)a3 operationQueue:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDiscovering:(BOOL)a3;
- (void)setStartDiscoveringPending:(BOOL)a3;
- (void)setStopDiscoveringPending:(BOOL)a3;
- (void)startDiscovering;
- (void)stopDiscovering;
@end

@implementation HAP2AccessoryServerCoordinator

void __68__HAP2AccessoryServerCoordinator_resurfaceDiscoveryInfoForDeviceID___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = [WeakRetained discoveredAccessoryServers];
  v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__HAP2AccessoryServerCoordinator_resurfaceDiscoveryInfoForDeviceID___block_invoke_3;
    v5[3] = &unk_1E69F12A8;
    v5[4] = *(void *)(a1 + 40);
    [WeakRetained _didDiscoverAccessory:v4 completion:v5];
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) finish];
  }
}

void __68__HAP2AccessoryServerCoordinator_resurfaceDiscoveryInfoForDeviceID___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = [WeakRetained operationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HAP2AccessoryServerCoordinator_resurfaceDiscoveryInfoForDeviceID___block_invoke_2;
  v7[3] = &unk_1E69F3650;
  objc_copyWeak(&v10, v2);
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  [v4 addBlock:v7];

  objc_destroyWeak(&v10);
}

- (NSMutableDictionary)discoveredAccessoryServers
{
  v3 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  [v3 assertCurrentQueue];

  discoveredAccessoryServers = self->_discoveredAccessoryServers;

  return discoveredAccessoryServers;
}

- (HAP2SerializedOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)resurfaceDiscoveryInfoForDeviceID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__336;
  v21 = __Block_byref_object_dispose__337;
  id v22 = 0;
  id v5 = [HAP2AsynchronousBlockOperation alloc];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __68__HAP2AccessoryServerCoordinator_resurfaceDiscoveryInfoForDeviceID___block_invoke;
  v13 = &unk_1E69F3650;
  objc_copyWeak(&v16, &location);
  id v6 = v4;
  id v14 = v6;
  v15 = &v17;
  uint64_t v7 = [(HAP2AsynchronousBlockOperation *)v5 initWithBlock:&v10];
  id v8 = (void *)v18[5];
  v18[5] = v7;

  uint64_t v9 = [(HAP2AccessoryServerCoordinator *)self localOperationQueue];
  [v9 addOperation:v18[5]];

  _Block_object_dispose(&v17, 8);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (NSOperationQueue)localOperationQueue
{
  return self->_localOperationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_localOperationQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_controllerFactory, 0);
  objc_storeStrong((id *)&self->_encodingFactory, 0);
  objc_storeStrong((id *)&self->_secureTransportFactory, 0);
  objc_storeStrong((id *)&self->_transportFactory, 0);
  objc_storeStrong((id *)&self->_pairingFactory, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_discoveredAccessoryServers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (HAP2PropertyLock)propertyLock
{
  return self->_propertyLock;
}

- (HAP2AccessoryServerControllerFactory)controllerFactory
{
  return self->_controllerFactory;
}

- (HAP2AccessoryServerEncodingFactory)encodingFactory
{
  return self->_encodingFactory;
}

- (HAP2AccessoryServerSecureTransportFactory)secureTransportFactory
{
  return self->_secureTransportFactory;
}

- (HAP2AccessoryServerTransportFactory)transportFactory
{
  return self->_transportFactory;
}

- (HAP2AccessoryServerPairingFactory)pairingFactory
{
  return self->_pairingFactory;
}

- (HAP2AccessoryServerDiscovery)discovery
{
  return self->_discovery;
}

- (HAP2AccessoryServerBrowserPrivate)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);

  return (HAP2AccessoryServerBrowserPrivate *)WeakRetained;
}

- (id)_createPairedAccessoryServerWithAccessoryInfo:(id)a3 transport:(id)a4 operationQueue:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  [v11 assertCurrentQueue];

  if (v9)
  {
    v12 = [(HAP2AccessoryServerCoordinator *)self _createMetadataForAccessoryServerWithAccessoryInfo:v8];
    if (v12)
    {
      v13 = [(HAP2AccessoryServerCoordinator *)self browser];
      id v14 = [v12 protocolVersion];
      uint64_t v15 = [v9 protocolFeaturesForVersion:v14];

      if (v15)
      {
        id v16 = [(HAP2AccessoryServerCoordinator *)self encodingFactory];
        uint64_t v17 = [v16 createEncodingWithOperationQueue:v10 accessoryServerMetadata:v12 encodingFeatures:v15];

        v18 = [(HAP2AccessoryServerCoordinator *)self secureTransportFactory];
        uint64_t v19 = [v18 createSecureTransportWithTransport:v9 isPaired:1 encryptedSession:0];

        v20 = [(HAP2AccessoryServerCoordinator *)self controllerFactory];
        v21 = [v20 createControllerWithEncoding:v17 secureTransport:v19 operationQueue:v10];

        id v22 = +[HAP2AccessoryServer pairedAccessoryServerWithMetadata:v12 browser:v13 controller:v21 operationQueue:v10];
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        v26 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          v28 = v26;
          v29 = [v12 name];
          v30 = [v12 deviceID];
          v31 = [v12 protocolVersion];
          int v32 = 138412802;
          v33 = v29;
          __int16 v34 = 2112;
          v35 = v30;
          __int16 v36 = 2112;
          v37 = v31;
          _os_log_error_impl(&dword_1D4758000, v28, OS_LOG_TYPE_ERROR, "Coordinator: Paired server [%@/%@] has invalid or unexpected version %@", (uint8_t *)&v32, 0x20u);
        }
        id v22 = 0;
      }
    }
    else
    {
      id v22 = 0;
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v23 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      v25 = [v8 deviceID];
      int v32 = 138412290;
      v33 = v25;
      _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_DEFAULT, "Coordinator: Ignoring discovered paired accessory %@ with no transport", (uint8_t *)&v32, 0xCu);
    }
    id v22 = 0;
  }

  return v22;
}

- (id)_createUnpairedAccessoryServerWithAccessoryInfo:(id)a3 transport:(id)a4 operationQueue:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  [v11 assertCurrentQueue];

  if (v9)
  {
    v12 = [(HAP2AccessoryServerCoordinator *)self _createMetadataForAccessoryServerWithAccessoryInfo:v8];
    if (v12)
    {
      v13 = [(HAP2AccessoryServerCoordinator *)self browser];
      id v14 = [v12 protocolVersion];
      uint64_t v15 = [v9 protocolFeaturesForVersion:v14];

      if (v15)
      {
        id v16 = [(HAP2AccessoryServerCoordinator *)self encodingFactory];
        uint64_t v17 = [v16 createEncodingWithOperationQueue:v10 accessoryServerMetadata:v12 encodingFeatures:v15];

        [(HAP2AccessoryServerCoordinator *)self secureTransportFactory];
        v18 = __int16 v36 = v13;
        uint64_t v19 = [v18 createSecureTransportWithTransport:v9 isPaired:0 encryptedSession:0];

        v20 = [(HAP2AccessoryServerCoordinator *)self controllerFactory];
        v21 = [v20 createControllerWithEncoding:v17 secureTransport:v19 operationQueue:v10];

        id v22 = [(HAP2AccessoryServerCoordinator *)self pairingFactory];
        v23 = [(HAP2AccessoryServerCoordinator *)self secureTransportFactory];
        v24 = [v22 createPairingDriverWithAccessoryInfo:v8 transport:v9 secureTransportFactory:v23 encoding:v17 operationQueue:v10];

        v13 = v36;
        v25 = +[HAP2AccessoryServer unpairedAccessoryServerWithMetadata:v12 browser:v36 controller:v21 pairingDriver:v24 operationQueue:v10];
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        v29 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          v31 = v29;
          int v32 = [v12 name];
          v33 = [v12 deviceID];
          [v12 protocolVersion];
          v35 = __int16 v34 = v13;
          *(_DWORD *)buf = 138412802;
          uint64_t v38 = v32;
          __int16 v39 = 2112;
          v40 = v33;
          __int16 v41 = 2112;
          v42 = v35;
          _os_log_error_impl(&dword_1D4758000, v31, OS_LOG_TYPE_ERROR, "Coordinator: Unpaired server [%@/%@] has invalid or unexpected version %@", buf, 0x20u);

          v13 = v34;
        }
        v25 = 0;
      }
    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v26 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      v28 = [v8 deviceID];
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = v28;
      _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_DEFAULT, "Coordinator: Ignoring discovered unpaired accessory %@ with no transport", buf, 0xCu);
    }
    v25 = 0;
  }

  return v25;
}

- (id)_createMetadataForAccessoryServerWithAccessoryInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  [v5 assertCurrentQueue];

  objc_opt_class();
  v21 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  BOOL v20 = ([v7 status] & 1) == 0;
  id v8 = [HAP2AccessoryServerMetadata alloc];
  id v9 = [v7 deviceID];
  id v10 = [v7 protocolVersion];
  uint64_t v11 = [v7 name];
  v12 = [v7 model];
  uint64_t v13 = [v7 category];
  __int16 v14 = [v7 stateNumber];
  __int16 v15 = [v7 configurationNumber];
  id v16 = [v7 setupHash];

  WORD1(v19) = v15;
  LOWORD(v19) = v14;
  uint64_t v17 = -[HAP2AccessoryServerMetadata initWithDeviceID:hasPairings:protocolVersion:name:model:category:stateNumber:configNumber:setupHash:](v8, "initWithDeviceID:hasPairings:protocolVersion:name:model:category:stateNumber:configNumber:setupHash:", v9, v20, v10, v11, v12, v13, v19, v16);

  return v17;
}

- (void)_didDiscoverPairedAccessory:(id)a3 transport:(id)a4 operationQueue:(id)a5 completion:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(void))a6;
  __int16 v14 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  [v14 assertCurrentQueue];

  __int16 v15 = [(HAP2AccessoryServerCoordinator *)self delegate];
  if (v15)
  {
    id v16 = [(HAP2AccessoryServerCoordinator *)self _createPairedAccessoryServerWithAccessoryInfo:v10 transport:v11 operationQueue:v12];
    if (v16)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v17 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        id v22 = v16;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEFAULT, "Coordinator: Discovered paired accessory %@", (uint8_t *)&v21, 0xCu);
      }
      [v15 coordinator:self didCreatePairedAccessoryServer:v16];
    }
    v13[2](v13);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v18 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = v18;
      BOOL v20 = [v10 deviceID];
      int v21 = 138412290;
      id v22 = v20;
      _os_log_debug_impl(&dword_1D4758000, v19, OS_LOG_TYPE_DEBUG, "Coordinator: Ignoring discovered paired accessory %@ with no delegate", (uint8_t *)&v21, 0xCu);
    }
    v13[2](v13);
  }
}

- (void)_didDiscoverUnpairedAccessory:(id)a3 transport:(id)a4 operationQueue:(id)a5 completion:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(void))a6;
  __int16 v14 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  [v14 assertCurrentQueue];

  __int16 v15 = [(HAP2AccessoryServerCoordinator *)self delegate];
  if (v15)
  {
    id v16 = [(HAP2AccessoryServerCoordinator *)self _createUnpairedAccessoryServerWithAccessoryInfo:v10 transport:v11 operationQueue:v12];
    if (v16)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v17 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        id v22 = v16;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEFAULT, "Coordinator: Discovered unpaired accessory %@", (uint8_t *)&v21, 0xCu);
      }
      [v15 coordinator:self didCreateUnpairedAccessoryServer:v16];
    }
    v13[2](v13);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v18 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = v18;
      BOOL v20 = [v10 deviceID];
      int v21 = 138412290;
      id v22 = v20;
      _os_log_debug_impl(&dword_1D4758000, v19, OS_LOG_TYPE_DEBUG, "Coordinator: Ignoring discovered unpaired accessory %@ with no delegate", (uint8_t *)&v21, 0xCu);
    }
    v13[2](v13);
  }
}

- (void)_didLoseAccessory:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  [v8 assertCurrentQueue];

  if ([(HAP2AccessoryServerCoordinator *)self isDiscovering])
  {
    id v9 = [(HAP2AccessoryServerCoordinator *)self discoveredAccessoryServers];
    id v10 = [v6 deviceID];
    [v9 removeObjectForKey:v10];

    id v11 = [(HAP2AccessoryServerCoordinator *)self delegate];
    id v12 = v11;
    if (v11)
    {
      [v11 coordinator:self didLoseAccessory:v6 error:v7];
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      __int16 v14 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
      {
        __int16 v15 = v14;
        id v16 = [v6 deviceID];
        int v17 = 138412290;
        v18 = v16;
        _os_log_debug_impl(&dword_1D4758000, v15, OS_LOG_TYPE_DEBUG, "Coordinator: Ignoring lost unpaired accessory %@ with no delegate", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v13 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_debug_impl(&dword_1D4758000, v13, OS_LOG_TYPE_DEBUG, "Coordinator: Ignoring lost accessory while not discovering", (uint8_t *)&v17, 2u);
    }
  }
}

- (void)_didDeterminePairingStateForAccessory:(id)a3 isPaired:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  id v10 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  [v10 assertCurrentQueue];

  id v11 = [v8 deviceID];
  if ([(HAP2AccessoryServerCoordinator *)self isDiscovering])
  {
    id v12 = [(HAP2AccessoryServerCoordinator *)self browser];
    uint64_t v13 = [v12 operationQueueForDeviceID:v11];
    __int16 v14 = [(HAP2AccessoryServerCoordinator *)self transportFactory];
    __int16 v15 = [(HAP2AccessoryServerCoordinator *)self discovery];
    id v16 = [v14 createTransportWithAccessoryInfo:v8 discovery:v15];

    if (v6) {
      [(HAP2AccessoryServerCoordinator *)self _didDiscoverPairedAccessory:v8 transport:v16 operationQueue:v13 completion:v9];
    }
    else {
      [(HAP2AccessoryServerCoordinator *)self _didDiscoverUnpairedAccessory:v8 transport:v16 operationQueue:v13 completion:v9];
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    int v17 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 138412290;
      uint64_t v19 = v11;
      _os_log_debug_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEBUG, "Coordinator: Ignoring discovered accessory %@ while not discovering", (uint8_t *)&v18, 0xCu);
    }
    v9[2](v9);
  }
}

- (void)_didDiscoverAccessory:(id)a3 completion:(id)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  [v8 assertCurrentQueue];

  if ([(HAP2AccessoryServerCoordinator *)self isDiscovering])
  {
    id v9 = [(HAP2AccessoryServerCoordinator *)self delegate];
    if (v9)
    {
      id v10 = [(HAP2AccessoryServerCoordinator *)self browser];
      if (v10)
      {
        id v11 = [v6 deviceID];
        id v12 = [(HAP2AccessoryServerCoordinator *)self discoveredAccessoryServers];
        [v12 setObject:v6 forKeyedSubscript:v11];

        objc_initWeak(location, self);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __67__HAP2AccessoryServerCoordinator__didDiscoverAccessory_completion___block_invoke;
        v23[3] = &unk_1E69EFD90;
        id v13 = v11;
        id v24 = v13;
        v26 = v7;
        objc_copyWeak(&v27, location);
        id v25 = v6;
        [v10 accessoryWithDeviceIDIsPaired:v13 completion:v23];

        objc_destroyWeak(&v27);
        objc_destroyWeak(location);
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        id v16 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
        {
          int v21 = v16;
          id v22 = [v6 deviceID];
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v22;
          _os_log_debug_impl(&dword_1D4758000, v21, OS_LOG_TYPE_DEBUG, "Coordinator: Ignoring discovered accessory %@ after browser has died", (uint8_t *)location, 0xCu);
        }
        v7[2](v7);
      }
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      __int16 v15 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = v15;
        uint64_t v20 = [v6 deviceID];
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v20;
        _os_log_debug_impl(&dword_1D4758000, v19, OS_LOG_TYPE_DEBUG, "Coordinator: Ignoring discovered accessory %@ with no delegate", (uint8_t *)location, 0xCu);
      }
      v7[2](v7);
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    __int16 v14 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      int v17 = v14;
      int v18 = [v6 deviceID];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v18;
      _os_log_debug_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEBUG, "Coordinator: Ignoring discovered accessory %@ while not discovering", (uint8_t *)location, 0xCu);
    }
    v7[2](v7);
  }
}

void __67__HAP2AccessoryServerCoordinator__didDiscoverAccessory_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v6 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_error_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, "Coordinator: Failed to determine if discovered accessory %@ is paired: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v8 = [WeakRetained operationQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__HAP2AccessoryServerCoordinator__didDiscoverAccessory_completion___block_invoke_13;
    v10[3] = &unk_1E69EFD68;
    objc_copyWeak(&v13, (id *)(a1 + 56));
    id v11 = *(id *)(a1 + 40);
    char v14 = a2;
    id v12 = *(id *)(a1 + 48);
    [v8 addBlock:v10];

    objc_destroyWeak(&v13);
  }
}

void __67__HAP2AccessoryServerCoordinator__didDiscoverAccessory_completion___block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _didDeterminePairingStateForAccessory:*(void *)(a1 + 32) isPaired:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

- (void)_didStopDiscoveringWithError:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  [v5 assertCurrentQueue];

  [(HAP2AccessoryServerCoordinator *)self setStopDiscoveringPending:0];
  [(HAP2AccessoryServerCoordinator *)self setDiscovering:0];
  id v6 = [(HAP2AccessoryServerCoordinator *)self discoveredAccessoryServers];
  [v6 removeAllObjects];

  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v7 = hap2Log_accessory;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "Coordinator: Failed to stop discovering: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "Coordinator: Stopped discovering", (uint8_t *)&v9, 2u);
  }
  id v8 = [(HAP2AccessoryServerCoordinator *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 coordinator:self didStopDiscoveringWithError:v4];
  }
}

- (void)_didStartDiscoveringWithError:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  [v5 assertCurrentQueue];

  [(HAP2AccessoryServerCoordinator *)self setStartDiscoveringPending:0];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v6 = hap2Log_accessory;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_error_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, "Coordinator: Failed to start discovering: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "Coordinator: Started discovering", (uint8_t *)&v8, 2u);
  }
  [(HAP2AccessoryServerCoordinator *)self setDiscovering:v4 == 0];
  id v7 = [(HAP2AccessoryServerCoordinator *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 coordinator:self didStartDiscoveringWithError:v4];
  }
}

- (void)_stopDiscovering
{
  v3 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  [v3 assertCurrentQueue];

  if ([(HAP2AccessoryServerCoordinator *)self isDiscovering])
  {
    BOOL v4 = [(HAP2AccessoryServerCoordinator *)self isStopDiscoveringPending];
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v5 = hap2Log_accessory;
    if (v4)
    {
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG)) {
        return;
      }
      __int16 v12 = 0;
      id v6 = "Coordinator: stopDiscovering called while a previous call is pending";
      id v7 = (uint8_t *)&v12;
      int v8 = v5;
      goto LABEL_11;
    }
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "Coordinator: Stopping discovery", v11, 2u);
    }
    [(HAP2AccessoryServerCoordinator *)self setStopDiscoveringPending:1];
    uint64_t v10 = [(HAP2AccessoryServerCoordinator *)self discovery];
    [v10 stopDiscovering];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v9 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      id v6 = "Coordinator: stopDiscovering called while not discovering";
      id v7 = buf;
      int v8 = v9;
LABEL_11:
      _os_log_debug_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, v6, v7, 2u);
    }
  }
}

- (void)_startDiscovering
{
  v3 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  [v3 assertCurrentQueue];

  if ([(HAP2AccessoryServerCoordinator *)self isDiscovering])
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v4 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      __int16 v13 = 0;
      id v5 = "Coordinator: startDiscovering called while already discovering";
      id v6 = (uint8_t *)&v13;
      id v7 = v4;
LABEL_11:
      _os_log_debug_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, v5, v6, 2u);
    }
  }
  else
  {
    BOOL v8 = [(HAP2AccessoryServerCoordinator *)self isStartDiscoveringPending];
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v9 = hap2Log_accessory;
    if (v8)
    {
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG)) {
        return;
      }
      *(_WORD *)buf = 0;
      id v5 = "Coordinator: startDiscovering called while a previous call is pending";
      id v6 = buf;
      id v7 = v9;
      goto LABEL_11;
    }
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "Coordinator: Starting discovery", v11, 2u);
    }
    [(HAP2AccessoryServerCoordinator *)self setStartDiscoveringPending:1];
    uint64_t v10 = [(HAP2AccessoryServerCoordinator *)self discovery];
    [v10 startDiscovering];
  }
}

- (void)discovery:(id)a3 didLoseAccessory:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAP2AccessoryServerCoordinator *)self discovery];

  if (v11 == v8)
  {
    objc_initWeak(&location, self);
    __int16 v12 = [(HAP2AccessoryServerCoordinator *)self localOperationQueue];
    __int16 v13 = (void *)MEMORY[0x1E4F28B48];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    __int16 v17 = __67__HAP2AccessoryServerCoordinator_discovery_didLoseAccessory_error___block_invoke;
    id v18 = &unk_1E69F45E0;
    objc_copyWeak(&v21, &location);
    id v19 = v9;
    id v20 = v10;
    char v14 = [v13 blockOperationWithBlock:&v15];
    objc_msgSend(v12, "addOperation:", v14, v15, v16, v17, v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __67__HAP2AccessoryServerCoordinator_discovery_didLoseAccessory_error___block_invoke(id *a1)
{
  v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v4 = [WeakRetained operationQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__HAP2AccessoryServerCoordinator_discovery_didLoseAccessory_error___block_invoke_2;
  v5[3] = &unk_1E69F45E0;
  objc_copyWeak(&v8, v2);
  id v6 = a1[4];
  id v7 = a1[5];
  [v4 addBlock:v5];

  objc_destroyWeak(&v8);
}

void __67__HAP2AccessoryServerCoordinator_discovery_didLoseAccessory_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _didLoseAccessory:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)discovery:(id)a3 didDiscoverAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAP2AccessoryServerCoordinator *)self discovery];

  if (v8 == v6)
  {
    objc_initWeak(&location, self);
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__336;
    id v24 = __Block_byref_object_dispose__337;
    id v25 = 0;
    id v9 = [HAP2AsynchronousBlockOperation alloc];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __65__HAP2AccessoryServerCoordinator_discovery_didDiscoverAccessory___block_invoke;
    uint64_t v16 = &unk_1E69F3650;
    objc_copyWeak(&v19, &location);
    id v17 = v7;
    id v18 = &v20;
    uint64_t v10 = [(HAP2AsynchronousBlockOperation *)v9 initWithBlock:&v13];
    id v11 = (void *)v21[5];
    v21[5] = v10;

    __int16 v12 = [(HAP2AccessoryServerCoordinator *)self localOperationQueue];
    [v12 addOperation:v21[5]];

    _Block_object_dispose(&v20, 8);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __65__HAP2AccessoryServerCoordinator_discovery_didDiscoverAccessory___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained operationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__HAP2AccessoryServerCoordinator_discovery_didDiscoverAccessory___block_invoke_2;
  v7[3] = &unk_1E69F3650;
  objc_copyWeak(&v10, v2);
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  [v4 addBlock:v7];

  objc_destroyWeak(&v10);
}

void __65__HAP2AccessoryServerCoordinator_discovery_didDiscoverAccessory___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__HAP2AccessoryServerCoordinator_discovery_didDiscoverAccessory___block_invoke_3;
  v4[3] = &unk_1E69F12A8;
  uint64_t v3 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  [WeakRetained _didDiscoverAccessory:v3 completion:v4];
}

uint64_t __65__HAP2AccessoryServerCoordinator_discovery_didDiscoverAccessory___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) finish];
}

- (void)discovery:(id)a3 didStopDiscoveringWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAP2AccessoryServerCoordinator *)self discovery];

  if (v8 == v6)
  {
    objc_initWeak(&location, self);
    uint64_t v9 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__HAP2AccessoryServerCoordinator_discovery_didStopDiscoveringWithError___block_invoke;
    v10[3] = &unk_1E69F4540;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    [v9 addBlock:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __72__HAP2AccessoryServerCoordinator_discovery_didStopDiscoveringWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didStopDiscoveringWithError:*(void *)(a1 + 32)];
}

- (void)discovery:(id)a3 didStartDiscoveringWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAP2AccessoryServerCoordinator *)self discovery];

  if (v8 == v6)
  {
    objc_initWeak(&location, self);
    uint64_t v9 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__HAP2AccessoryServerCoordinator_discovery_didStartDiscoveringWithError___block_invoke;
    v10[3] = &unk_1E69F4540;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    [v9 addBlock:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __73__HAP2AccessoryServerCoordinator_discovery_didStartDiscoveringWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didStartDiscoveringWithError:*(void *)(a1 + 32)];
}

uint64_t __68__HAP2AccessoryServerCoordinator_resurfaceDiscoveryInfoForDeviceID___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) finish];
}

- (void)stopDiscovering
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__HAP2AccessoryServerCoordinator_stopDiscovering__block_invoke;
  v4[3] = &unk_1E69F4658;
  objc_copyWeak(&v5, &location);
  [v3 addBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __49__HAP2AccessoryServerCoordinator_stopDiscovering__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stopDiscovering];
}

- (void)startDiscovering
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__HAP2AccessoryServerCoordinator_startDiscovering__block_invoke;
  v4[3] = &unk_1E69F4658;
  objc_copyWeak(&v5, &location);
  [v3 addBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__HAP2AccessoryServerCoordinator_startDiscovering__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startDiscovering];
}

- (void)setStopDiscoveringPending:(BOOL)a3
{
  id v5 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  [v5 assertCurrentQueue];

  self->_stopDiscoveringPending = a3;
}

- (BOOL)isStopDiscoveringPending
{
  uint64_t v3 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  [v3 assertCurrentQueue];

  return self->_stopDiscoveringPending;
}

- (void)setStartDiscoveringPending:(BOOL)a3
{
  id v5 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  [v5 assertCurrentQueue];

  self->_startDiscoveringPending = a3;
}

- (BOOL)isStartDiscoveringPending
{
  uint64_t v3 = [(HAP2AccessoryServerCoordinator *)self operationQueue];
  [v3 assertCurrentQueue];

  return self->_startDiscoveringPending;
}

- (void)setDiscovering:(BOOL)a3
{
  id v5 = [(HAP2AccessoryServerCoordinator *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__HAP2AccessoryServerCoordinator_setDiscovering___block_invoke;
  v6[3] = &unk_1E69F3DF8;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 performWritingBlock:v6];
}

uint64_t __49__HAP2AccessoryServerCoordinator_setDiscovering___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isDiscovering
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(HAP2AccessoryServerCoordinator *)self propertyLock];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__HAP2AccessoryServerCoordinator_isDiscovering__block_invoke;
  v5[3] = &unk_1E69F44F0;
  void v5[4] = v2;
  void v5[5] = &v6;
  [v3 performReadingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __47__HAP2AccessoryServerCoordinator_isDiscovering__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HAP2AccessoryServerCoordinator *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HAP2AccessoryServerCoordinator_setDelegate___block_invoke;
  v7[3] = &unk_1E69F46E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

id __46__HAP2AccessoryServerCoordinator_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (HAP2AccessoryServerCoordinatorDelegate)delegate
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__336;
  id v11 = __Block_byref_object_dispose__337;
  id v12 = 0;
  uint64_t v3 = [(HAP2AccessoryServerCoordinator *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__HAP2AccessoryServerCoordinator_delegate__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2AccessoryServerCoordinatorDelegate *)v4;
}

uint64_t __42__HAP2AccessoryServerCoordinator_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));

  return MEMORY[0x1F41817F8]();
}

- (void)setBrowser:(id)a3 operationQueue:(id)a4
{
  id v6 = (HAP2SerializedOperationQueue *)a4;
  objc_storeWeak((id *)&self->_browser, a3);
  operationQueue = self->_operationQueue;
  self->_operationQueue = v6;
}

- (HAP2AccessoryServerCoordinator)initWithDiscovery:(id)a3 pairingFactory:(id)a4 transportFactory:(id)a5 secureTransportFactory:(id)a6 encodingFactory:(id)a7 controllerFactory:(id)a8
{
  id v15 = a3;
  id v29 = a4;
  id v28 = a5;
  id v27 = a6;
  id v16 = a7;
  id v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)HAP2AccessoryServerCoordinator;
  id v18 = [(HAP2AccessoryServerCoordinator *)&v30 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_discovery, a3);
    objc_storeStrong((id *)&v19->_pairingFactory, a4);
    objc_storeStrong((id *)&v19->_transportFactory, a5);
    objc_storeStrong((id *)&v19->_secureTransportFactory, a6);
    objc_storeStrong((id *)&v19->_encodingFactory, a7);
    objc_storeStrong((id *)&v19->_controllerFactory, a8);
    uint64_t v20 = +[HAP2PropertyLock lockWithName:@"HAP2AccessoryServerCoordinator.propertyLock"];
    propertyLock = v19->_propertyLock;
    v19->_propertyLock = (HAP2PropertyLock *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
    discoveredAccessoryServers = v19->_discoveredAccessoryServers;
    v19->_discoveredAccessoryServers = (NSMutableDictionary *)v22;

    id v24 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    localOperationQueue = v19->_localOperationQueue;
    v19->_localOperationQueue = v24;

    [(NSOperationQueue *)v19->_localOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v19->_localOperationQueue setName:@"HAP2AccessoryServerCoordinator.localOperationQueue"];
    [v15 setDelegate:v19];
  }

  return v19;
}

@end