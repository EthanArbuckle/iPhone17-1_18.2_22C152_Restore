@interface DMTCoreWiFiBackedWiFiPrimitives
- (BOOL)isCancelled;
- (BOOL)wifiInterfacesAvailable;
- (CWFInterface)wiFiInterface;
- (DMTCoreWiFiBackedWiFiPrimitives)init;
- (NSString)wifiNetworkName;
- (NSTimer)joinNetworkTimeout;
- (id)joinNetworkCompletion;
- (void)cancelJoiningWiFi;
- (void)dealloc;
- (void)didJoinNetworkWithError:(id)a3;
- (void)disassociateWiFiNetworkWithCompletion:(id)a3;
- (void)foundNetworks:(id)a3 forCredential:(id)a4 error:(id)a5;
- (void)joinNetworkWithCredential:(id)a3 scanRecord:(id)a4;
- (void)joinWiFiNetworkWithCredential:(id)a3 timeout:(double)a4 completion:(id)a5;
- (void)networkJoinTimeOutDidFire:(id)a3;
- (void)scanForNetworksWithCredentials:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setJoinNetworkCompletion:(id)a3;
- (void)setJoinNetworkTimeout:(id)a3;
@end

@implementation DMTCoreWiFiBackedWiFiPrimitives

- (void)dealloc
{
  v3 = [(DMTCoreWiFiBackedWiFiPrimitives *)self wiFiInterface];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)DMTCoreWiFiBackedWiFiPrimitives;
  [(DMTCoreWiFiBackedWiFiPrimitives *)&v4 dealloc];
}

- (DMTCoreWiFiBackedWiFiPrimitives)init
{
  v6.receiver = self;
  v6.super_class = (Class)DMTCoreWiFiBackedWiFiPrimitives;
  v2 = [(DMTCoreWiFiBackedWiFiPrimitives *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F386E0]) initWithServiceType:2];
    wiFiInterface = v2->_wiFiInterface;
    v2->_wiFiInterface = (CWFInterface *)v3;

    [(CWFInterface *)v2->_wiFiInterface activate];
    [(CWFInterface *)v2->_wiFiInterface setInvalidationHandler:&__block_literal_global_0];
  }
  return v2;
}

void __39__DMTCoreWiFiBackedWiFiPrimitives_init__block_invoke()
{
  v0 = _DMTLogGeneral();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __39__DMTCoreWiFiBackedWiFiPrimitives_init__block_invoke_cold_1(v0);
  }
}

- (BOOL)wifiInterfacesAvailable
{
  v2 = [(DMTCoreWiFiBackedWiFiPrimitives *)self wiFiInterface];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)wifiNetworkName
{
  v2 = [(DMTCoreWiFiBackedWiFiPrimitives *)self wiFiInterface];
  BOOL v3 = [v2 networkName];

  return (NSString *)v3;
}

- (void)joinWiFiNetworkWithCredential:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void, void *))a5;
  if (![(DMTCoreWiFiBackedWiFiPrimitives *)self isCancelled])
  {
    v10 = [(DMTCoreWiFiBackedWiFiPrimitives *)self joinNetworkTimeout];

    if (!v10)
    {
      if ([(DMTCoreWiFiBackedWiFiPrimitives *)self wifiInterfacesAvailable])
      {
        [(DMTCoreWiFiBackedWiFiPrimitives *)self setJoinNetworkCompletion:v9];
        [(DMTCoreWiFiBackedWiFiPrimitives *)self scanForNetworksWithCredentials:v8];
        v11 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_networkJoinTimeOutDidFire_ selector:0 userInfo:0 repeats:a4];
        [(DMTCoreWiFiBackedWiFiPrimitives *)self setJoinNetworkTimeout:v11];
      }
      else
      {
        v12 = _DMTLogGeneral();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[DMTCoreWiFiBackedWiFiPrimitives joinWiFiNetworkWithCredential:timeout:completion:](v12);
        }

        v13 = DMTErrorWithCodeAndUserInfo(50, 0);
        v9[2](v9, 0, v13);
      }
    }
  }
}

- (void)disassociateWiFiNetworkWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(DMTCoreWiFiBackedWiFiPrimitives *)self wifiNetworkName];

  objc_super v6 = _DMTLogGeneral();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_22D3D6000, v6, OS_LOG_TYPE_INFO, "Disassociating from network…", v9, 2u);
    }

    id v8 = [(DMTCoreWiFiBackedWiFiPrimitives *)self wiFiInterface];
    [v8 disassociateWithReason:0];

    v4[2](v4, 1, 0);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D3D6000, v6, OS_LOG_TYPE_INFO, "Network is not currently associated, disassociation not necessary", buf, 2u);
    }
  }
}

- (void)cancelJoiningWiFi
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v4 = [(DMTCoreWiFiBackedWiFiPrimitives *)self isCancelled];
  v5 = _DMTLogGeneral();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      BOOL v7 = NSStringFromSelector(a2);
      int v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_22D3D6000, v5, OS_LOG_TYPE_INFO, "%{public}@ called again while already cancelled", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_22D3D6000, v5, OS_LOG_TYPE_INFO, "Cancelling Wi-Fi join", (uint8_t *)&v10, 2u);
    }

    [(DMTCoreWiFiBackedWiFiPrimitives *)self setCancelled:1];
    id v8 = [(DMTCoreWiFiBackedWiFiPrimitives *)self joinNetworkTimeout];

    if (v8)
    {
      v9 = [(DMTCoreWiFiBackedWiFiPrimitives *)self joinNetworkTimeout];
      [v9 invalidate];

      [(DMTCoreWiFiBackedWiFiPrimitives *)self setJoinNetworkTimeout:0];
    }
  }
}

- (void)networkJoinTimeOutDidFire:(id)a3
{
  BOOL v4 = _DMTLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_22D3D6000, v4, OS_LOG_TYPE_INFO, "Network join timeout has fired.", v9, 2u);
  }

  v5 = [(DMTCoreWiFiBackedWiFiPrimitives *)self joinNetworkTimeout];
  [v5 invalidate];

  [(DMTCoreWiFiBackedWiFiPrimitives *)self setJoinNetworkTimeout:0];
  BOOL v6 = [(DMTCoreWiFiBackedWiFiPrimitives *)self joinNetworkCompletion];

  if (v6)
  {
    BOOL v7 = [(DMTCoreWiFiBackedWiFiPrimitives *)self joinNetworkCompletion];
    id v8 = DMTErrorWithCodeAndUserInfo(54, 0);
    ((void (**)(void, void, void *))v7)[2](v7, 0, v8);

    [(DMTCoreWiFiBackedWiFiPrimitives *)self setJoinNetworkCompletion:0];
  }
}

- (void)scanForNetworksWithCredentials:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  BOOL v6 = [v4 networkName];
  [v5 setSSID:v6];

  [v5 setNumberOfScans:2];
  [v5 setMergeScanResults:1];
  objc_initWeak(&location, self);
  BOOL v7 = [(DMTCoreWiFiBackedWiFiPrimitives *)self wiFiInterface];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__DMTCoreWiFiBackedWiFiPrimitives_scanForNetworksWithCredentials___block_invoke;
  v9[3] = &unk_2649A9B90;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  [v7 performScanWithParameters:v5 reply:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __66__DMTCoreWiFiBackedWiFiPrimitives_scanForNetworksWithCredentials___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__DMTCoreWiFiBackedWiFiPrimitives_scanForNetworksWithCredentials___block_invoke_2;
  v9[3] = &unk_2649A9B68;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v6;
  id v11 = *(id *)(a1 + 32);
  id v12 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v9);

  objc_destroyWeak(&v13);
}

void __66__DMTCoreWiFiBackedWiFiPrimitives_scanForNetworksWithCredentials___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained foundNetworks:*(void *)(a1 + 32) forCredential:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)foundNetworks:(id)a3 forCredential:(id)a4 error:(id)a5
{
  v27[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(DMTCoreWiFiBackedWiFiPrimitives *)self isCancelled])
  {
    id v11 = _DMTLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      id v12 = "Found networks after being cancelled, bailing out.";
LABEL_11:
      _os_log_impl(&dword_22D3D6000, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v24, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  id v13 = [(DMTCoreWiFiBackedWiFiPrimitives *)self joinNetworkTimeout];

  if (!v13)
  {
    id v11 = _DMTLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      id v12 = "Found networks after timeout has occurred, bailing out.";
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v10)
  {
    v14 = _DMTLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[DMTCoreWiFiBackedWiFiPrimitives foundNetworks:forCredential:error:]((uint64_t)v10, v14);
    }

    v15 = [(DMTCoreWiFiBackedWiFiPrimitives *)self joinNetworkCompletion];
    uint64_t v26 = *MEMORY[0x263F08608];
    v27[0] = v10;
    v16 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    v17 = DMTErrorWithCodeAndUserInfo(55, v16);
    ((void (**)(void, void, void *))v15)[2](v15, 0, v17);

    [(DMTCoreWiFiBackedWiFiPrimitives *)self setJoinNetworkCompletion:0];
  }
  else
  {
    uint64_t v18 = [v8 count];
    v19 = _DMTLogGeneral();
    v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[DMTCoreWiFiBackedWiFiPrimitives foundNetworks:forCredential:error:]((uint64_t)v8, v20);
      }

      v21 = [v8 firstObject];
      [(DMTCoreWiFiBackedWiFiPrimitives *)self joinNetworkWithCredential:v9 scanRecord:v21];
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v22 = [v9 networkName];
        int v24 = 138477827;
        v25 = v22;
        _os_log_impl(&dword_22D3D6000, v20, OS_LOG_TYPE_INFO, "No network matching %{private}@ were found", (uint8_t *)&v24, 0xCu);
      }
      v21 = DMTErrorWithCodeAndUserInfo(53, 0);
      v23 = [(DMTCoreWiFiBackedWiFiPrimitives *)self joinNetworkCompletion];
      ((void (**)(void, void, void *))v23)[2](v23, 0, v21);

      [(DMTCoreWiFiBackedWiFiPrimitives *)self setJoinNetworkCompletion:0];
    }
  }
LABEL_13:
}

- (void)joinNetworkWithCredential:(id)a3 scanRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  [v8 setScanResult:v7];
  id v9 = [v6 credential];
  [v8 setPassword:v9];

  [v8 setRememberUponSuccessfulAssociation:0];
  objc_initWeak(&location, self);
  id v10 = [(DMTCoreWiFiBackedWiFiPrimitives *)self wiFiInterface];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__DMTCoreWiFiBackedWiFiPrimitives_joinNetworkWithCredential_scanRecord___block_invoke;
  v11[3] = &unk_2649A9BE0;
  objc_copyWeak(&v12, &location);
  [v10 associateWithParameters:v8 reply:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __72__DMTCoreWiFiBackedWiFiPrimitives_joinNetworkWithCredential_scanRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__DMTCoreWiFiBackedWiFiPrimitives_joinNetworkWithCredential_scanRecord___block_invoke_2;
  v5[3] = &unk_2649A9BB8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __72__DMTCoreWiFiBackedWiFiPrimitives_joinNetworkWithCredential_scanRecord___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didJoinNetworkWithError:*(void *)(a1 + 32)];
}

- (void)didJoinNetworkWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(DMTCoreWiFiBackedWiFiPrimitives *)self isCancelled])
  {
    id v5 = _DMTLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v4;
      id v6 = "Associate network returned after being cancelled with error: %{public}@";
LABEL_9:
      _os_log_impl(&dword_22D3D6000, v5, OS_LOG_TYPE_INFO, v6, buf, 0xCu);
    }
  }
  else
  {
    id v7 = [(DMTCoreWiFiBackedWiFiPrimitives *)self joinNetworkTimeout];

    if (v7)
    {
      if (v4)
      {
        uint64_t v11 = *MEMORY[0x263F08608];
        id v12 = v4;
        id v8 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
        id v5 = DMTErrorWithCodeAndUserInfo(55, v8);
      }
      else
      {
        id v5 = 0;
      }
      id v9 = [(DMTCoreWiFiBackedWiFiPrimitives *)self joinNetworkTimeout];
      [v9 invalidate];

      id v10 = [(DMTCoreWiFiBackedWiFiPrimitives *)self joinNetworkCompletion];
      ((void (**)(void, BOOL, NSObject *))v10)[2](v10, v5 == 0, v5);

      [(DMTCoreWiFiBackedWiFiPrimitives *)self setJoinNetworkCompletion:0];
      [(DMTCoreWiFiBackedWiFiPrimitives *)self setJoinNetworkTimeout:0];
    }
    else
    {
      id v5 = _DMTLogGeneral();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v4;
        id v6 = "Associate network returned after the timeout occurred with error: %{public}@";
        goto LABEL_9;
      }
    }
  }
}

- (CWFInterface)wiFiInterface
{
  return self->_wiFiInterface;
}

- (id)joinNetworkCompletion
{
  return self->_joinNetworkCompletion;
}

- (void)setJoinNetworkCompletion:(id)a3
{
}

- (NSTimer)joinNetworkTimeout
{
  return self->_joinNetworkTimeout;
}

- (void)setJoinNetworkTimeout:(id)a3
{
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinNetworkTimeout, 0);
  objc_storeStrong(&self->_joinNetworkCompletion, 0);
  objc_storeStrong((id *)&self->_wiFiInterface, 0);
}

void __39__DMTCoreWiFiBackedWiFiPrimitives_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D3D6000, log, OS_LOG_TYPE_ERROR, "CWFInterface invalidated!", v1, 2u);
}

- (void)joinWiFiNetworkWithCredential:(os_log_t)log timeout:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D3D6000, log, OS_LOG_TYPE_ERROR, "This device has no WiFi interface, cannot continue.", v1, 2u);
}

- (void)foundNetworks:(uint64_t)a1 forCredential:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22D3D6000, a2, OS_LOG_TYPE_DEBUG, "Network(s) found: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)foundNetworks:(uint64_t)a1 forCredential:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22D3D6000, a2, OS_LOG_TYPE_ERROR, "Error scanning for networks: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end