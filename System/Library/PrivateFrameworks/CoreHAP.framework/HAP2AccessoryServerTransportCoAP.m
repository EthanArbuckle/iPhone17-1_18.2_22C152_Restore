@interface HAP2AccessoryServerTransportCoAP
- (BOOL)mergeWithNewTransport:(id)a3;
- (HAP2AccessoryServerTransportCoAP)initWithAccessoryInfo:(id)a3 discovery:(id)a4 operationQueue:(id)a5;
- (HAP2AccessoryServerTransportCoAP)initWithOperationQueue:(id)a3 delegateQueue:(id)a4;
- (HAP2AccessoryServerTransportCoAP)initWithOperationQueue:(id)a3 delegateQueue:(id)a4 serviceName:(id)a5 serviceType:(id)a6 serviceDomain:(id)a7 addressResolutionTimeout:(double)a8 discovery:(id)a9 accessoryInfo:(id)a10 coapClient:(id)a11 coapClientFactory:(id)a12;
- (HAP2AccessoryServerTransportCoAP)initWithServiceName:(id)a3 type:(id)a4 domain:(id)a5 operationQueue:(id)a6;
- (id)coapClient;
- (id)discovery;
- (id)endpointForCharacteristic:(id)a3;
- (id)endpointForCharacteristics:(id)a3;
- (id)initWithServiceName:(void *)a3 type:(void *)a4 domain:(void *)a5 operationQueue:(void *)a6 discovery:(void *)a7 accessoryInfo:;
- (id)mimeTypeForCharacteristicRequests;
- (id)mimeTypeForWellKnownEndpoint:(unint64_t)a3;
- (id)underlyingTransport;
- (id)wellKnownEndpoint:(unint64_t)a3;
- (unint64_t)protocolFeaturesForVersion:(id)a3;
- (void)_handleResolve:(uint64_t)a1;
- (void)_openClientWithActivity:(void *)a1;
- (void)client:(id)a3 didReceiveEvent:(id)a4;
- (void)clientDidDisconnect:(id)a3 error:(id)a4;
- (void)doCloseWithError:(id)a3 completion:(id)a4;
- (void)doOpenWithCompletion:(id)a3;
- (void)doSendRequest:(id)a3 completion:(id)a4;
- (void)doUpdateMaxRequestTimeout:(double)a3;
- (void)numOfAddresses;
- (void)numOfAddressesTried;
- (void)setCoapClient:(id *)a1;
- (void)setSendRequestCompletion:(void *)a1;
- (void)setStateChangeCompletion:(void *)a1;
- (void)stateChangeCompletion;
@end

@implementation HAP2AccessoryServerTransportCoAP

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bonjourNames, 0);
  objc_storeStrong((id *)&self->_addressList, 0);
  objc_storeStrong((id *)&self->_coapClientFactory, 0);
  objc_storeStrong((id *)&self->_accessoryInfo, 0);
  objc_destroyWeak((id *)&self->_discovery);
  objc_storeStrong((id *)&self->_serviceDomain, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_nwConnection, 0);
  objc_storeStrong((id *)&self->_coapClient, 0);
  objc_storeStrong((id *)&self->_resolveActivity, 0);
  objc_storeStrong(&self->_sendRequestCompletion, 0);

  objc_storeStrong(&self->_stateChangeCompletion, 0);
}

- (void)client:(id)a3 didReceiveEvent:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unint64_t v6 = [(HAP2AccessoryServerTransportBase *)self state];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v7 = hap2Log_accessory;
  if (v6 == 2)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      v11 = self;
      __int16 v12 = 2112;
      unint64_t v13 = (unint64_t)v5;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%@ Received event: %@", (uint8_t *)&v10, 0x16u);
    }
    v8 = [(HAP2AccessoryServerTransportBaseWithDelegate *)self delegate];
    v9 = v8;
    if (v8) {
      [v8 transport:self didReceiveEvent:v5];
    }
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    v9 = v7;
    int v10 = 138412802;
    v11 = self;
    __int16 v12 = 2048;
    unint64_t v13 = [(HAP2AccessoryServerTransportBase *)self state];
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_error_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%@ Received event in bad state %lu: %@", (uint8_t *)&v10, 0x20u);
  }

LABEL_10:
}

- (void)clientDidDisconnect:(id)a3 error:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  unint64_t v6 = hap2Log_accessory;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412546;
      v11 = self;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_error_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, "%@ Disconnected with error: %@", (uint8_t *)&v10, 0x16u);
    }
    v7 = -[HAP2AccessoryServerTransportCoAP discovery]((id *)&self->super.super.super.super.isa);
    if (v7)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v8 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        v11 = self;
        _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%@ Requesting discovery reconfirm after disconnect", (uint8_t *)&v10, 0xCu);
      }
      if (self) {
        accessoryInfo = self->_accessoryInfo;
      }
      else {
        accessoryInfo = 0;
      }
      [v7 reconfirmAccessory:accessoryInfo];
    }
    [(HAP2AccessoryServerTransportBase *)self didDisconnectWithError:v5];
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    v11 = self;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEFAULT, "%@ Disconnected", (uint8_t *)&v10, 0xCu);
  }
}

- (id)discovery
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 20);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)doUpdateMaxRequestTimeout:(double)a3
{
  id v5 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v5 assertCurrentQueue];

  double v6 = 5.0;
  if (a3 >= 5.0) {
    double v6 = a3;
  }
  uint64_t v7 = 4;
  if (v6 < 15.0) {
    uint64_t v7 = 3;
  }
  if (v6 >= 30.0) {
    unint64_t v8 = 5;
  }
  else {
    unint64_t v8 = v7;
  }
  double v9 = v6 / (double)~(-1 << v8);
  if (self)
  {
    int v10 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
    [v10 assertCurrentQueue];

    self->_maxTransmitAttempts = v8;
    v11 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
    [v11 assertCurrentQueue];

    self->_initialACKTimeout = v9;
  }
  __int16 v12 = -[HAP2AccessoryServerTransportCoAP coapClient]((id *)&self->super.super.super.super.isa);

  if (v12)
  {
    -[HAP2AccessoryServerTransportCoAP coapClient]((id *)&self->super.super.super.super.isa);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [v13 alterMaxTransmitAttempts:v8 initialACKTimeout:v9];
  }
}

- (id)coapClient
{
  if (a1)
  {
    v2 = a1;
    v3 = [a1 operationQueue];
    [v3 assertCurrentQueue];

    a1 = (id *)v2[11];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)doCloseWithError:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v11 = a3;
  uint64_t v7 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v7 assertCurrentQueue];

  -[HAP2AccessoryServerTransportCoAP setStateChangeCompletion:](self, v6);
  if (self)
  {
    id v8 = v11;
    double v9 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
    [v9 assertCurrentQueue];

    int v10 = -[HAP2AccessoryServerTransportCoAP coapClient]((id *)&self->super.super.super.super.isa);
    -[HAP2AccessoryServerTransportCoAP setCoapClient:]((id *)&self->super.super.super.super.isa, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__HAP2AccessoryServerTransportCoAP__closeWithError___block_invoke;
    v12[3] = &unk_1E69F4380;
    v12[4] = self;
    [v10 closeWithError:v8 completion:v12];
  }
}

- (void)setStateChangeCompletion:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    v4 = [a1 operationQueue];
    [v4 assertCurrentQueue];

    uint64_t v5 = MEMORY[0x1D944E2D0](v3);
    id v6 = (void *)a1[8];
    a1[8] = v5;
  }
}

- (void)setCoapClient:(id *)a1
{
  id v5 = a2;
  v4 = [a1 operationQueue];
  [v4 assertCurrentQueue];

  objc_storeStrong(a1 + 11, a2);
}

void __52__HAP2AccessoryServerTransportCoAP__closeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  int v10 = __52__HAP2AccessoryServerTransportCoAP__closeWithError___block_invoke_2;
  id v11 = &unk_1E69F46E0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v12 = v3;
  uint64_t v13 = v4;
  id v5 = v3;
  id v6 = (void *)MEMORY[0x1D944E2D0](&v8);
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "operationQueue", v8, v9, v10, v11);
  [v7 addConcurrentBlock:v6];
}

void __52__HAP2AccessoryServerTransportCoAP__closeWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v3 = hap2Log_accessory;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v17 = 138412546;
      uint64_t v18 = v4;
      __int16 v19 = 2112;
      uint64_t v20 = v5;
      _os_log_error_impl(&dword_1D4758000, v3, OS_LOG_TYPE_ERROR, "%@ Failed to close: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v17 = 138412290;
    uint64_t v18 = v6;
    _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_INFO, "%@ Closed", (uint8_t *)&v17, 0xCu);
  }
  -[HAP2AccessoryServerTransportCoAP stateChangeCompletion](*(void **)(a1 + 40));
  uint64_t v7 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServerTransportCoAP setStateChangeCompletion:](*(void **)(a1 + 40), 0);
  uint64_t v8 = *(void **)(a1 + 40);
  if (v8) {
    uint64_t v8 = (void *)v8[24];
  }
  uint64_t v9 = v8;
  uint64_t v10 = [v9 count];
  id v11 = [HAP2AccessorySessionInfo alloc];
  id v12 = -[HAP2AccessoryServerTransportCoAP numOfAddresses](*(void **)(a1 + 40));
  uint64_t v13 = -[HAP2AccessoryServerTransportCoAP numOfAddressesTried](*(void **)(a1 + 40));
  uint64_t v14 = *(void **)(a1 + 40);
  if (v14) {
    uint64_t v14 = (void *)v14[26];
  }
  id v15 = v14;
  uint64_t v16 = -[HAP2AccessorySessionInfo initWithNumIPs:numIPsTried:numBonjourNames:](v11, "initWithNumIPs:numIPsTried:numBonjourNames:", v12, v13, [v15 count]);
  ((void (**)(void, BOOL, HAP2AccessorySessionInfo *, void))v7)[2](v7, v10 != 0, v16, *(void *)(a1 + 32));
}

- (void)stateChangeCompletion
{
  if (a1)
  {
    uint64_t v2 = a1;
    id v3 = [a1 operationQueue];
    [v3 assertCurrentQueue];

    a1 = (void *)MEMORY[0x1D944E2D0](v2[8]);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)numOfAddresses
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [result operationQueue];
    [v2 assertCurrentQueue];

    return (void *)v1[15];
  }
  return result;
}

- (void)numOfAddressesTried
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [result operationQueue];
    [v2 assertCurrentQueue];

    return (void *)v1[16];
  }
  return result;
}

- (void)doSendRequest:(id)a3 completion:(id)a4
{
  v33[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v8 assertCurrentQueue];

  uint64_t v9 = [v6 endpoint];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v6 endpoint];

    if (v10)
    {
      -[HAP2AccessoryServerTransportCoAP setSendRequestCompletion:](self, v7);
      id v11 = v6;
      id v12 = v10;
      if (self)
      {
        uint64_t v13 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
        [v13 assertCurrentQueue];

        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        uint64_t v14 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          id v15 = v14;
          uint64_t v16 = [v11 data];
          *(_DWORD *)v28 = 138413058;
          *(void *)&v28[4] = self;
          *(_WORD *)&v28[12] = 2112;
          *(void *)&v28[14] = v11;
          *(_WORD *)&v28[22] = 2112;
          v29 = v12;
          LOWORD(v30) = 2112;
          *(void *)((char *)&v30 + 2) = v16;
          _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%@ Sending %@ to '%@': %@", v28, 0x2Au);
        }
        int v17 = [MEMORY[0x1E4F653F0] currentActivity];
        if (v17)
        {
          v33[0] = v12;
          v32[0] = @"path";
          v32[1] = @"method";
          uint64_t v18 = @"POST";
          v33[1] = @"POST";
          v32[2] = @"serializationType";
          __int16 v19 = [v11 mimeType];
          v33[2] = v19;
          v32[3] = @"reading";
          [v11 isForReading];
          uint64_t v20 = HMFBooleanToString();
          v33[3] = v20;
          v32[4] = @"writing";
          [v11 isForWriting];
          uint64_t v21 = HMFBooleanToString();
          v33[4] = v21;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:5];
        }
        v23 = -[HAP2AccessoryServerTransportCoAP coapClient]((id *)&self->super.super.super.super.isa);
        v24 = [v11 data];
        *(void *)v28 = MEMORY[0x1E4F143A8];
        *(void *)&v28[8] = 3221225472;
        *(void *)&v28[16] = __54__HAP2AccessoryServerTransportCoAP__sendRequest_path___block_invoke;
        v29 = &unk_1E69F4158;
        *(void *)&long long v30 = self;
        *((void *)&v30 + 1) = v11;
        id v31 = v12;
        [v23 sendRequestWithMethod:2 path:v31 payload:v24 completion:v28];
      }
      goto LABEL_18;
    }
  }
  else
  {
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v25 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    v26 = v25;
    v27 = [v6 endpoint];
    *(_DWORD *)v28 = 138412546;
    *(void *)&v28[4] = self;
    *(_WORD *)&v28[12] = 2112;
    *(void *)&v28[14] = v27;
    _os_log_error_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%@ Invalid endpoint: %@", v28, 0x16u);
  }
  id v12 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9];
  (*((void (**)(id, void, id))v7 + 2))(v7, 0, v12);
LABEL_18:
}

- (void)setSendRequestCompletion:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = [a1 operationQueue];
    [v4 assertCurrentQueue];

    uint64_t v5 = MEMORY[0x1D944E2D0](v3);
    id v6 = (void *)a1[9];
    a1[9] = v5;
  }
}

void __54__HAP2AccessoryServerTransportCoAP__sendRequest_path___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v7 = hap2Log_accessory;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 40);
      v22 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138413058;
      uint64_t v27 = v20;
      __int16 v28 = 2112;
      uint64_t v29 = v21;
      __int16 v30 = 2112;
      id v31 = v22;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%@ Failed to send %@ to '%@': %@", buf, 0x2Au);
    }
    uint64_t v8 = [v6 domain];
    if (v8 == @"HAPErrorDomain")
    {
      uint64_t v12 = [v6 code];

      if (v12 == 8)
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v14 = @"CoAP authentication failure";
        uint64_t v15 = 17;
LABEL_14:
        id v11 = [v13 hapErrorWithCode:v15 description:v14 reason:0 suggestion:0 underlyingError:v6];
        goto LABEL_15;
      }
    }
    else
    {
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = @"CoAP communication failure";
    uint64_t v15 = 8;
    goto LABEL_14;
  }
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = v9;
    __int16 v28 = 2112;
    uint64_t v29 = v10;
    __int16 v30 = 2112;
    id v31 = v5;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%@ Received response to %@: %@", buf, 0x20u);
  }
  id v11 = 0;
LABEL_15:
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __54__HAP2AccessoryServerTransportCoAP__sendRequest_path___block_invoke_91;
  v23[3] = &unk_1E69F4708;
  v23[4] = *(void *)(a1 + 32);
  id v24 = v11;
  id v25 = v5;
  id v16 = v5;
  id v17 = v11;
  uint64_t v18 = (void *)MEMORY[0x1D944E2D0](v23);
  __int16 v19 = [*(id *)(a1 + 32) operationQueue];
  [v19 addConcurrentBlock:v18];
}

void __54__HAP2AccessoryServerTransportCoAP__sendRequest_path___block_invoke_91(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) operationQueue];
    [v3 assertCurrentQueue];

    uint64_t v12 = (void (**)(id, void, uint64_t))MEMORY[0x1D944E2D0](*(void *)(v2 + 72));
    uint64_t v4 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v12 = 0;
  }
  -[HAP2AccessoryServerTransportCoAP setSendRequestCompletion:](v4, 0);
  uint64_t v5 = *(void *)(a1 + 40);
  if (!v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (!v6) {
      goto LABEL_13;
    }
    id v7 = [*(id *)(a1 + 32) operationQueue];
    [v7 assertCurrentQueue];

    *(void *)(v6 + 120) = 0;
    uint64_t v8 = *(void *)(a1 + 32);
    if (!v8) {
      goto LABEL_13;
    }
    uint64_t v9 = [*(id *)(a1 + 32) operationQueue];
    [v9 assertCurrentQueue];

    *(void *)(v8 + 128) = 0;
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      id v11 = *(void **)(v10 + 192);
    }
    else {
LABEL_13:
    }
      id v11 = 0;
    [v11 removeAllObjects];
    uint64_t v5 = *(void *)(a1 + 40);
  }
  v12[2](v12, *(void *)(a1 + 48), v5);
}

- (void)doOpenWithCompletion:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v5 assertCurrentQueue];

  -[HAP2AccessoryServerTransportCoAP setStateChangeCompletion:](self, v4);
  uint64_t v6 = -[HAP2AccessoryServerTransportCoAP coapClient]((id *)&self->super.super.super.super.isa);

  if (v6)
  {
    if (self)
    {
      id v7 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
      [v7 assertCurrentQueue];

      uint64_t v8 = NSString;
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      id v11 = [v8 stringWithFormat:@"%@ Open Client", v10];

      *(void *)block = [objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v11];
      -[HAP2AccessoryServerTransportCoAP _openClientWithActivity:](self, *(void **)block);
      __HMFActivityScopeLeave();
    }
  }
  else if (self)
  {
    uint64_t v12 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
    [v12 assertCurrentQueue];

    uint64_t v13 = NSString;
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    id v16 = [v13 stringWithFormat:@"%@ Resolve", v15];

    v41 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v16];
    if ([(NSMutableArray *)self->_addressList count])
    {
      *(void *)block = MEMORY[0x1E4F143A8];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = __58__HAP2AccessoryServerTransportCoAP__initiateNewConnection__block_invoke;
      v44 = (NSString *)&unk_1E69F4330;
      *(void *)v45 = self;
      id v17 = (void *)MEMORY[0x1D944E2D0](block);
      uint64_t v18 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
      [v18 addConcurrentBlock:v17];
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      __int16 v19 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        serviceName = self->_serviceName;
        serviceType = self->_serviceType;
        serviceDomain = self->_serviceDomain;
        *(_DWORD *)block = 138413315;
        *(void *)&block[4] = self;
        *(_WORD *)&block[12] = 2113;
        *(void *)&block[14] = serviceName;
        *(_WORD *)&block[22] = 2113;
        v44 = serviceName;
        *(_WORD *)v45 = 2112;
        *(void *)&v45[2] = serviceType;
        __int16 v46 = 2112;
        v47 = serviceDomain;
        v38 = serviceType;
        v39 = serviceName;
        v40 = v19;
        _os_log_error_impl(&dword_1D4758000, v40, OS_LOG_TYPE_ERROR, "%@ Attempting to resolve '%{private}@' '%{private}@.%@.%@'", block, 0x34u);
      }
      self->_numOfAddresses = 0;
      self->_numOfAddressesTried = 0;
      secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], &__block_literal_global_22883);
      uint64_t v21 = nw_interface_create_with_name();
      nw_parameters_prohibit_interface(secure_udp, v21);

      v22 = self->_serviceName;
      v23 = [(NSString *)v22 UTF8String];
      id v24 = self->_serviceType;
      id v25 = [(NSString *)v24 UTF8String];
      v26 = self->_serviceDomain;
      bonjour_service = nw_endpoint_create_bonjour_service(v23, v25, [(NSString *)v26 UTF8String]);
      __int16 v28 = (OS_nw_connection *)nw_connection_create(bonjour_service, secure_udp);
      nwConnection = self->_nwConnection;
      self->_nwConnection = v28;

      __int16 v30 = self->_nwConnection;
      id v31 = [(HAP2AccessoryServerTransportBase *)self delegateQueue];
      nw_connection_set_queue((nw_connection_t)v30, v31);

      dispatch_time_t v32 = dispatch_time(0, (uint64_t)(self->_addressResolutionTimeout * 1000000000.0));
      id v33 = [(HAP2AccessoryServerTransportBase *)self delegateQueue];
      *(void *)block = MEMORY[0x1E4F143A8];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_2;
      v44 = (NSString *)&unk_1E69F4330;
      *(void *)v45 = self;
      dispatch_after(v32, v33, block);

      uint64_t v34 = self->_nwConnection;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_44;
      handler[3] = &unk_1E69F4100;
      handler[4] = self;
      nw_connection_set_state_changed_handler(v34, handler);
      nw_connection_start((nw_connection_t)self->_nwConnection);
    }
    __HMFActivityScopeLeave();
  }
}

uint64_t __58__HAP2AccessoryServerTransportCoAP__initiateNewConnection__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  ++*(void *)(*(void *)(a1 + 32) + 128);
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v2 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    if (v3) {
      uint64_t v4 = v3[17];
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = v3[16];
    uint64_t v6 = v3[15];
    *(_DWORD *)id v11 = 138413059;
    *(void *)&v11[4] = v3;
    *(_WORD *)&v11[12] = 2113;
    *(void *)&v11[14] = v4;
    *(_WORD *)&v11[22] = 2048;
    uint64_t v12 = v5;
    LOWORD(v13) = 2048;
    *(void *)((char *)&v13 + 2) = v6;
    id v7 = v2;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%@ '%{private}@' trying address %lu of %lu", v11, 0x2Au);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = objc_msgSend(*(id *)(v8 + 192), "objectAtIndexedSubscript:", 0, *(_OWORD *)v11, *(void *)&v11[16], v12, v13);
  -[HAP2AccessoryServerTransportCoAP _handleResolve:](v8, (unsigned int *)[v9 getAddressPtr]);

  return [*(id *)(*(void *)(a1 + 32) + 192) removeObjectAtIndex:0];
}

void __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v2 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      uint64_t v4 = *(void *)(v3 + 136);
    }
    else {
      uint64_t v4 = 0;
    }
    int v8 = 138412547;
    uint64_t v9 = v3;
    __int16 v10 = 2113;
    uint64_t v11 = v4;
    uint64_t v5 = v2;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%@ '%{private}@' Cancelling address resolver", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    id v7 = *(NSObject **)(v6 + 112);
  }
  else {
    id v7 = 0;
  }
  nw_connection_cancel(v7);
}

void __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_44(uint64_t a1, int a2, void *a3)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v6 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v43 = *(void *)(a1 + 32);
    if (v43) {
      uint64_t v44 = *(void *)(v43 + 136);
    }
    else {
      uint64_t v44 = 0;
    }
    *(_DWORD *)buf = 138412803;
    uint64_t v78 = v43;
    *(_WORD *)v79 = 2113;
    *(void *)&v79[2] = v44;
    *(_WORD *)&v79[10] = 1024;
    *(_DWORD *)&v79[12] = a2;
    v45 = v6;
    _os_log_debug_impl(&dword_1D4758000, v45, OS_LOG_TYPE_DEBUG, "%@ NWConnection '%{private}@' resolve state=%d", buf, 0x1Cu);
  }
  if (a2 == 5)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    __int16 v10 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v49 = *(void *)(a1 + 32);
      if (v49) {
        uint64_t v50 = *(void *)(v49 + 136);
      }
      else {
        uint64_t v50 = 0;
      }
      *(_DWORD *)buf = 138412547;
      uint64_t v78 = v49;
      *(_WORD *)v79 = 2113;
      *(void *)&v79[2] = v50;
      v51 = v10;
      _os_log_debug_impl(&dword_1D4758000, v51, OS_LOG_TYPE_DEBUG, "%@ '%{private}@' Stopping address resolver", buf, 0x16u);
    }
    uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 192) count];
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v12 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      if (v13) {
        uint64_t v14 = *(void *)(v13 + 136);
      }
      else {
        uint64_t v14 = 0;
      }
      *(_DWORD *)buf = 138413059;
      uint64_t v78 = v13;
      *(_WORD *)v79 = 2113;
      if (v11) {
        uint64_t v15 = @"trying first address";
      }
      else {
        uint64_t v15 = @"aborting";
      }
      *(void *)&v79[2] = v14;
      *(_WORD *)&v79[10] = 2048;
      *(void *)&v79[12] = v11;
      __int16 v80 = 2112;
      v81 = v15;
      id v16 = v12;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_INFO, "%@ '%{private}@' resolves to %lu address(es), %@", buf, 0x2Au);
    }
    if (v11)
    {
      if (v11 != 1) {
        [*(id *)(*(void *)(a1 + 32) + 192) sortUsingComparator:&__block_literal_global_55];
      }
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_2_56;
      v72[3] = &unk_1E69F4330;
      v72[4] = *(void *)(a1 + 32);
      nw_path_t v17 = (nw_path_t)MEMORY[0x1D944E2D0](v72);
      uint64_t v18 = [*(id *)(a1 + 32) operationQueue];
      [v18 addConcurrentBlock:v17];
    }
    else
    {
      v40 = [MEMORY[0x1E4F28C58] hapErrorWithCode:19];
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_3;
      v70[3] = &unk_1E69F46E0;
      v70[4] = *(void *)(a1 + 32);
      id v71 = v40;
      nw_path_t v17 = v40;
      v41 = (void *)MEMORY[0x1D944E2D0](v70);
      v42 = [*(id *)(a1 + 32) operationQueue];
      [v42 addConcurrentBlock:v41];
    }
    goto LABEL_94;
  }
  if (a2 == 3)
  {
    if (v5)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v7 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        uint64_t v58 = *(void *)(a1 + 32);
        if (v58) {
          uint64_t v59 = *(void *)(v58 + 136);
        }
        else {
          uint64_t v59 = 0;
        }
        *(_DWORD *)buf = 138412803;
        uint64_t v78 = v58;
        *(_WORD *)v79 = 2113;
        *(void *)&v79[2] = v59;
        *(_WORD *)&v79[10] = 2112;
        *(void *)&v79[12] = v5;
        v60 = v7;
        _os_log_error_impl(&dword_1D4758000, v60, OS_LOG_TYPE_ERROR, "%@ '%{private}@' error in state_ready report (%@) - attempting next IP connection", buf, 0x20u);
      }
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8) {
        uint64_t v9 = *(NSObject **)(v8 + 112);
      }
      else {
        uint64_t v9 = 0;
      }
      nw_connection_cancel_current_endpoint(v9);
      goto LABEL_95;
    }
    uint64_t v25 = *(void *)(a1 + 32);
    if (v25) {
      v26 = *(NSObject **)(v25 + 112);
    }
    else {
      v26 = 0;
    }
    nw_path_t v17 = nw_connection_copy_current_path(v26);
    memset(v79, 0, sizeof(v79));
    uint64_t v78 = 0;
    if (v17)
    {
      uint64_t v27 = nw_path_copy_endpoint();
      __int16 v28 = v27;
      if (v27)
      {
        address = nw_endpoint_get_address(v27);
        if (address)
        {
          v69 = v28;
          *(_DWORD *)buf = address->sa_len;
          __memcpy_chk();
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          __int16 v30 = (HAP2AccessoryDeviceIPAddress *)*(id *)(*(void *)(a1 + 32) + 192);
          uint64_t v31 = [(HAP2AccessoryDeviceIPAddress *)v30 countByEnumeratingWithState:&v73 objects:v88 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v74;
            while (2)
            {
              for (uint64_t i = 0; i != v32; ++i)
              {
                if (*(void *)v74 != v33) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v35 = objc_msgSend(*(id *)(*((void *)&v73 + 1) + 8 * i), "getAddressPtr", v69);
                if (*(unsigned char *)(v35 + 5) == 30
                  && *(void *)(v35 + 12) == *(void *)v79
                  && *(void *)(v35 + 20) == *(void *)&v79[8])
                {
                  if (hap2LogInitialize_onceToken != -1) {
                    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
                  }
                  __int16 v28 = v69;
                  v52 = (void *)hap2Log_accessory;
                  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v53 = *(void *)(a1 + 32);
                    if (v53) {
                      uint64_t v54 = *(void *)(v53 + 136);
                    }
                    else {
                      uint64_t v54 = 0;
                    }
                    *(_DWORD *)v82 = 138412547;
                    uint64_t v83 = v53;
                    __int16 v84 = 2113;
                    uint64_t v85 = v54;
                    v55 = v52;
                    _os_log_impl(&dword_1D4758000, v55, OS_LOG_TYPE_DEFAULT, "%@ '%{private}@' Duplicate IP address - skipping", v82, 0x16u);
                  }
                  uint64_t v56 = *(void *)(a1 + 32);
                  if (v56) {
                    v57 = *(NSObject **)(v56 + 112);
                  }
                  else {
                    v57 = 0;
                  }
                  goto LABEL_92;
                }
              }
              uint64_t v32 = [(HAP2AccessoryDeviceIPAddress *)v30 countByEnumeratingWithState:&v73 objects:v88 count:16];
              if (v32) {
                continue;
              }
              break;
            }
          }

          ++*(void *)(*(void *)(a1 + 32) + 120);
          if ([*(id *)(*(void *)(a1 + 32) + 192) count] == *(void *)(*(void *)(a1 + 32) + 200))
          {
            if (hap2LogInitialize_onceToken != -1) {
              dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
            }
            v37 = (void *)hap2Log_accessory;
            __int16 v28 = v69;
            if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
            {
              uint64_t v65 = *(void *)(a1 + 32);
              if (v65) {
                uint64_t v66 = *(void *)(v65 + 136);
              }
              else {
                uint64_t v66 = 0;
              }
              uint64_t v67 = *(void *)(v65 + 200);
              *(_DWORD *)v82 = 138412803;
              uint64_t v83 = v65;
              __int16 v84 = 2113;
              uint64_t v85 = v66;
              __int16 v86 = 2048;
              uint64_t v87 = v67;
              v68 = v37;
              _os_log_error_impl(&dword_1D4758000, v68, OS_LOG_TYPE_ERROR, "%@ '%{private}@' resolves to more than %lu addresses; ignoring rest",
                v82,
                0x20u);
            }
            uint64_t v38 = *(void *)(a1 + 32);
            if (v38) {
              v39 = *(NSObject **)(v38 + 112);
            }
            else {
              v39 = 0;
            }
            nw_connection_cancel(v39);
          }
          else
          {
            __int16 v30 = [[HAP2AccessoryDeviceIPAddress alloc] initWithAddress:buf];
            [*(id *)(*(void *)(a1 + 32) + 192) addObject:v30];
            uint64_t v61 = *(void *)(a1 + 32);
            if (v61) {
              v57 = *(NSObject **)(v61 + 112);
            }
            else {
              v57 = 0;
            }
            __int16 v28 = v69;
LABEL_92:
            nw_connection_cancel_current_endpoint(v57);
          }
          goto LABEL_93;
        }
      }
    }
    else
    {
      __int16 v28 = 0;
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    __int16 v46 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v62 = *(void *)(a1 + 32);
      if (v62) {
        uint64_t v63 = *(void *)(v62 + 136);
      }
      else {
        uint64_t v63 = 0;
      }
      *(_DWORD *)v82 = 138412547;
      uint64_t v83 = v62;
      __int16 v84 = 2113;
      uint64_t v85 = v63;
      v64 = v46;
      _os_log_error_impl(&dword_1D4758000, v64, OS_LOG_TYPE_ERROR, "%@ '%{private}@' reported a network path that cannot be resolved to an IP address - skipping", v82, 0x16u);
    }
    uint64_t v47 = *(void *)(a1 + 32);
    if (v47) {
      uint64_t v48 = *(NSObject **)(v47 + 112);
    }
    else {
      uint64_t v48 = 0;
    }
    nw_connection_cancel_current_endpoint(v48);
LABEL_93:

LABEL_94:
    goto LABEL_95;
  }
  if (a2 == 4 || v5)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    __int16 v19 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      if (v20) {
        uint64_t v21 = *(void *)(v20 + 136);
      }
      else {
        uint64_t v21 = 0;
      }
      *(_DWORD *)buf = 138413059;
      uint64_t v78 = v20;
      *(_WORD *)v79 = 2113;
      *(void *)&v79[2] = v21;
      *(_WORD *)&v79[10] = 2112;
      *(void *)&v79[12] = v5;
      __int16 v80 = 1024;
      LODWORD(v81) = a2;
      v22 = v19;
      _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_DEFAULT, "%@ '%{private}@' Address resolution completed - error (%@) in state %d", buf, 0x26u);
    }
    uint64_t v23 = *(void *)(a1 + 32);
    if (v23) {
      id v24 = *(NSObject **)(v23 + 112);
    }
    else {
      id v24 = 0;
    }
    nw_connection_cancel(v24);
  }
LABEL_95:
}

uint64_t __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_2_56(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(v2 + 192) objectAtIndexedSubscript:0];
  -[HAP2AccessoryServerTransportCoAP _handleResolve:](v2, (unsigned int *)[v3 getAddressPtr]);

  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 192) removeObjectAtIndex:0];
  ++*(void *)(*(void *)(a1 + 32) + 128);
  return result;
}

void __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    uint64_t v3 = [(id)v1 operationQueue];
    [v3 assertCurrentQueue];

    uint64_t v4 = -[HAP2AccessoryServerTransportCoAP stateChangeCompletion]((void *)v1);

    if (v4)
    {
      -[HAP2AccessoryServerTransportCoAP stateChangeCompletion]((void *)v1);
      id v5 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      -[HAP2AccessoryServerTransportCoAP setStateChangeCompletion:]((void *)v1, 0);
      uint64_t v6 = [HAP2AccessorySessionInfo alloc];
      id v7 = -[HAP2AccessoryServerTransportCoAP numOfAddresses]((void *)v1);
      uint64_t v8 = -[HAP2AccessorySessionInfo initWithNumIPs:numIPsTried:numBonjourNames:](v6, "initWithNumIPs:numIPsTried:numBonjourNames:", v7, -[HAP2AccessoryServerTransportCoAP numOfAddressesTried]((void *)v1), [*(id *)(v1 + 208) count]);
      ((void (**)(void, void, HAP2AccessorySessionInfo *, id))v5)[2](v5, 0, v8, v2);
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v9 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(v1 + 136);
        int v12 = 138412547;
        uint64_t v13 = v1;
        __int16 v14 = 2113;
        uint64_t v15 = v10;
        uint64_t v11 = v9;
        _os_log_error_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%@ '%{private}@' - resolver failure has already been handled", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

- (void)_handleResolve:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = [(id)a1 operationQueue];
    [v4 assertCurrentQueue];

    id v5 = NSString;
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = [v5 stringWithFormat:@"%@ Open Client after Resolve", v7];

    uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v8];
    if (coap_print_addr((uint64_t)a2, __dst, 0x36uLL))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v9 = (id)hap2Log_accessory;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = *(id *)(a1 + 136);
        uint64_t v11 = -[HAP2AccessoryServerTransportCoAP numOfAddresses]((void *)a1);
        int v12 = -[HAP2AccessoryServerTransportCoAP numOfAddressesTried]((void *)a1);
        id v13 = *(id *)(a1 + 192);
        *(_DWORD *)buf = 138413571;
        *(void *)uint64_t v31 = a1;
        *(_WORD *)&v31[8] = 2113;
        *(void *)&v31[10] = v10;
        *(_WORD *)&v31[18] = 2081;
        *(void *)&v31[20] = __dst;
        __int16 v32 = 2048;
        uint64_t v33 = v11;
        __int16 v34 = 2048;
        uint64_t v35 = v12;
        __int16 v36 = 2048;
        uint64_t v37 = [v13 count];
        _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%@ Resolved '%{private}@' to %{private}s (discovered %lu, tried %lu with %lu names)", buf, 0x3Eu);
      }
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      __int16 v14 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = *(void *)(a1 + 136);
        *(_DWORD *)buf = 138412547;
        *(void *)uint64_t v31 = a1;
        *(_WORD *)&v31[8] = 2113;
        *(void *)&v31[10] = v27;
        __int16 v28 = v14;
        _os_log_error_impl(&dword_1D4758000, v28, OS_LOG_TYPE_ERROR, "%@ Resolved '%{private}@' but can't print the address...", buf, 0x16u);
      }
    }
    *(_OWORD *)(a1 + 224) = 0u;
    *(_OWORD *)(a1 + 240) = 0u;
    *(_DWORD *)(a1 + 224) = *a2;
    uint64_t v15 = a2 + 1;
    int v16 = *((unsigned __int8 *)a2 + 5);
    if (v16 == 2)
    {
      *(_OWORD *)(a1 + 228) = *v15;
    }
    else if (v16 == 30)
    {
      *(unsigned char *)(a1 + 229) = 30;
      *(_OWORD *)(a1 + 236) = *(_OWORD *)(a2 + 3);
      *(_WORD *)(a1 + 230) = *((_WORD *)a2 + 3);
      *(_DWORD *)(a1 + 252) = a2[7];
    }
    else
    {
      memcpy((void *)(a1 + 228), v15, *a2);
    }
    memset(v31, 0, sizeof(v31));
    size_t v17 = *(unsigned int *)(a1 + 224);
    *(_DWORD *)buf = *(_DWORD *)(a1 + 224);
    uint64_t v18 = (_OWORD *)(a1 + 228);
    int v19 = *(unsigned __int8 *)(a1 + 229);
    if (v19 == 2)
    {
      *(_OWORD *)uint64_t v31 = *v18;
    }
    else if (v19 == 30)
    {
      v31[1] = 30;
      *(_OWORD *)&v31[8] = *(_OWORD *)(a1 + 236);
      *(_WORD *)&v31[2] = *(_WORD *)(a1 + 230);
      *(_DWORD *)&v31[24] = *(_DWORD *)(a1 + 252);
    }
    else
    {
      memcpy(v31, v18, v17);
    }
    uint64_t v20 = *(void **)(a1 + 184);
    if (v20)
    {
      uint64_t v21 = [v20 createWithSocketAddress:v31];
    }
    else
    {
      v22 = [HAP2CoAPClient alloc];
      id v23 = *(id *)(a1 + 136);
      id v24 = [(id)a1 operationQueue];
      [v24 assertCurrentQueue];

      uint64_t v25 = *(void *)(a1 + 96);
      v26 = [(id)a1 operationQueue];
      [v26 assertCurrentQueue];

      uint64_t v21 = [(HAP2CoAPClient *)v22 initWithSocketAddress:v31 withAccessoryName:v23 maxTransmitAttempts:v25 initialACKTimeout:*(double *)(a1 + 104)];
    }
    [(HAP2CoAPClient *)v21 setDelegate:a1];
    -[HAP2AccessoryServerTransportCoAP setCoapClient:]((id *)a1, v21);

    -[HAP2AccessoryServerTransportCoAP _openClientWithActivity:]((void *)a1, v29);
    __HMFActivityScopeLeave();
  }
}

- (void)_openClientWithActivity:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = [a1 operationQueue];
  [v4 assertCurrentQueue];

  id v5 = -[HAP2AccessoryServerTransportCoAP coapClient]((id *)a1);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HAP2AccessoryServerTransportCoAP__openClientWithActivity___block_invoke;
  v7[3] = &unk_1E69F4128;
  v7[4] = a1;
  id v6 = v3;
  id v8 = v6;
  [v5 openWithCompletion:v7];
}

void __60__HAP2AccessoryServerTransportCoAP__openClientWithActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __60__HAP2AccessoryServerTransportCoAP__openClientWithActivity___block_invoke_2;
  id v10 = &unk_1E69F46E0;
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1D944E2D0](&v7);
  id v6 = objc_msgSend(*(id *)(a1 + 32), "operationQueue", v7, v8, v9, v10, v11);
  [v6 addConcurrentBlock:v5];

  [*(id *)(a1 + 40) invalidate];
}

void __60__HAP2AccessoryServerTransportCoAP__openClientWithActivity___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  -[HAP2AccessoryServerTransportCoAP stateChangeCompletion](*(void **)(a1 + 32));
  id v2 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServerTransportCoAP setStateChangeCompletion:](*(void **)(a1 + 32), 0);
  uint64_t v3 = *(void *)(a1 + 40);
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v4 = hap2Log_accessory;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v23 = *(void *)(a1 + 40);
      int v24 = 138412546;
      uint64_t v25 = v22;
      __int16 v26 = 2112;
      uint64_t v27 = v23;
      _os_log_error_impl(&dword_1D4758000, v4, OS_LOG_TYPE_ERROR, "%@ Failed to open: %@", (uint8_t *)&v24, 0x16u);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      id v6 = *(void **)(v5 + 192);
    }
    else {
      id v6 = 0;
    }
    if (![v6 count])
    {
      uint64_t v7 = -[HAP2AccessoryServerTransportCoAP discovery](*(id **)(a1 + 32));
      if (v7)
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        uint64_t v8 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          uint64_t v9 = *(void *)(a1 + 32);
          int v24 = 138412290;
          uint64_t v25 = v9;
          _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%@ Requesting discovery reconfirm after failing to open", (uint8_t *)&v24, 0xCu);
        }
        uint64_t v10 = *(void *)(a1 + 32);
        if (v10) {
          uint64_t v11 = *(void *)(v10 + 168);
        }
        else {
          uint64_t v11 = 0;
        }
        [v7 reconfirmAccessory:v11];
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v24 = 138412290;
    uint64_t v25 = v12;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%@ Opened", (uint8_t *)&v24, 0xCu);
  }
  id v13 = *(void **)(a1 + 32);
  if (v13) {
    id v13 = (void *)v13[24];
  }
  __int16 v14 = v13;
  uint64_t v15 = [v14 count];
  int v16 = [HAP2AccessorySessionInfo alloc];
  size_t v17 = -[HAP2AccessoryServerTransportCoAP numOfAddresses](*(void **)(a1 + 32));
  uint64_t v18 = -[HAP2AccessoryServerTransportCoAP numOfAddressesTried](*(void **)(a1 + 32));
  int v19 = *(void **)(a1 + 32);
  if (v19) {
    int v19 = (void *)v19[26];
  }
  uint64_t v20 = v19;
  uint64_t v21 = -[HAP2AccessorySessionInfo initWithNumIPs:numIPsTried:numBonjourNames:](v16, "initWithNumIPs:numIPsTried:numBonjourNames:", v17, v18, [v20 count]);
  ((void (**)(void, BOOL, HAP2AccessorySessionInfo *, void))v2)[2](v2, v15 != 0, v21, *(void *)(a1 + 40));
}

uint64_t __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 getAddressPtr];
  uint64_t v6 = [v4 getAddressPtr];

  unint64_t v7 = bswap64(*(void *)(v5 + 12));
  unint64_t v8 = bswap64(*(void *)(v6 + 12));
  if (v7 == v8 && (unint64_t v7 = bswap64(*(void *)(v5 + 20)), v8 = bswap64(*(void *)(v6 + 20)), v7 == v8))
  {
    return 0;
  }
  else if (v7 < v8)
  {
    return -1;
  }
  else
  {
    return 1;
  }
}

uint64_t __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F40F3FA0](a2, 1);
}

- (BOOL)mergeWithNewTransport:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = (id *)v4;
    while (1)
    {
      objc_opt_class();
      int v7 = objc_opt_isKindOfClass() & 1;
      unint64_t v8 = v7 ? v6 : 0;
      uint64_t v9 = v8;
      if (v7) {
        break;
      }
      uint64_t v10 = [v6 underlyingTransport];

      uint64_t v6 = (id *)v10;
      if (!v10) {
        goto LABEL_8;
      }
    }

    id v13 = v6[17];
    id v14 = v6[18];
    id v15 = v6[19];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    int v24 = __58__HAP2AccessoryServerTransportCoAP_mergeWithNewTransport___block_invoke;
    uint64_t v25 = &unk_1E69F4098;
    __int16 v26 = self;
    id v27 = v13;
    id v28 = v14;
    id v29 = v15;
    id v16 = v15;
    id v17 = v14;
    id v18 = v13;
    int v19 = (void *)MEMORY[0x1D944E2D0](&v22);
    uint64_t v20 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
    [v20 addBlock:v19];

    BOOL v12 = 1;
  }
  else
  {
LABEL_8:
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v11 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v31 = self;
      __int16 v32 = 2112;
      uint64_t v33 = v5;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%@ Cannot merge with non-CoAP transport, replacing with %@", buf, 0x16u);
    }
    BOOL v12 = 0;
  }

  return v12;
}

void __58__HAP2AccessoryServerTransportCoAP_mergeWithNewTransport___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[17];
  }
  uint64_t v3 = v2;
  if ([v3 isEqualToString:*(void *)(a1 + 40)])
  {
    id v4 = *(void **)(a1 + 32);
    if (v4) {
      id v4 = (void *)v4[18];
    }
    uint64_t v5 = v4;
    if ([v5 isEqualToString:*(void *)(a1 + 48)])
    {
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6) {
        int v7 = *(void **)(v6 + 152);
      }
      else {
        int v7 = 0;
      }
      char v8 = [v7 isEqualToString:*(void *)(a1 + 56)];

      if (v8) {
        return;
      }
      goto LABEL_13;
    }
  }
LABEL_13:
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v9 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138413058;
    uint64_t v27 = v10;
    __int16 v28 = 2112;
    uint64_t v29 = v11;
    __int16 v30 = 2112;
    uint64_t v31 = v12;
    __int16 v32 = 2112;
    uint64_t v33 = v13;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%@ Using new connection details: name = '%@' type = '%@' domain = '%@'", buf, 0x2Au);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 136), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 144), *(id *)(a1 + 48));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 152), *(id *)(a1 + 56));
  id v14 = [NSString stringWithFormat:@"%@.%@.%@", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56)];
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    id v16 = *(void **)(v15 + 208);
  }
  else {
    id v16 = 0;
  }
  [v16 removeObject:v14];
  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    id v18 = *(void **)(v17 + 208);
  }
  else {
    id v18 = 0;
  }
  [v18 insertObject:v14 atIndex:0];
  int v19 = *(void **)(a1 + 32);
  if (v19) {
    int v19 = (void *)v19[26];
  }
  uint64_t v20 = v19;
  unint64_t v21 = [v20 count];
  uint64_t v22 = *(void *)(a1 + 32);
  if (v22) {
    unint64_t v23 = *(void *)(v22 + 216);
  }
  else {
    unint64_t v23 = 0;
  }

  if (v21 > v23)
  {
    uint64_t v24 = *(void *)(a1 + 32);
    if (v24) {
      uint64_t v25 = *(void **)(v24 + 208);
    }
    else {
      uint64_t v25 = 0;
    }
    [v25 removeLastObject];
  }
}

- (id)mimeTypeForCharacteristicRequests
{
  return @"application/octet-stream";
}

- (id)mimeTypeForWellKnownEndpoint:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return @"application/octet-stream";
  }
  else {
    return off_1E69F41A8[a3 - 1];
  }
}

- (id)endpointForCharacteristics:(id)a3
{
  return &stru_1F2C4E778;
}

- (id)endpointForCharacteristic:(id)a3
{
  return &stru_1F2C4E778;
}

- (id)wellKnownEndpoint:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return &stru_1F2C4E778;
  }
  else {
    return off_1E69F4178[a3 - 1];
  }
}

- (unint64_t)protocolFeaturesForVersion:(id)a3
{
  id v3 = a3;
  if ([v3 majorVersion] == 1)
  {
    uint64_t v4 = [v3 minorVersion];
    uint64_t v5 = 47;
    if (!v4) {
      uint64_t v5 = 15;
    }
    if (v4 == 1) {
      unint64_t v6 = 25;
    }
    else {
      unint64_t v6 = v5;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)underlyingTransport
{
  return 0;
}

- (HAP2AccessoryServerTransportCoAP)initWithServiceName:(id)a3 type:(id)a4 domain:(id)a5 operationQueue:(id)a6
{
  return (HAP2AccessoryServerTransportCoAP *)-[HAP2AccessoryServerTransportCoAP initWithServiceName:type:domain:operationQueue:discovery:accessoryInfo:](self, a3, a4, a5, a6, 0, 0);
}

- (id)initWithServiceName:(void *)a3 type:(void *)a4 domain:(void *)a5 operationQueue:(void *)a6 discovery:(void *)a7 accessoryInfo:
{
  id v7 = a1;
  if (a1)
  {
    id v13 = a7;
    id v14 = a6;
    id v15 = a5;
    id v16 = a4;
    id v17 = a3;
    id v18 = a2;
    int v19 = (const char *)HAPDispatchQueueName(v7, @"delegateQueue");
    uint64_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unint64_t v21 = dispatch_get_global_queue(17, 0);
    dispatch_queue_t v22 = dispatch_queue_create_with_target_V2(v19, v20, v21);

    unint64_t v23 = (void *)[v7 initWithOperationQueue:v15 delegateQueue:v22 serviceName:v18 serviceType:v17 serviceDomain:v16 addressResolutionTimeout:v14 discovery:3.0 accessoryInfo:v13 coapClient:0 coapClientFactory:0];
    id v7 = v23;
  }
  return v7;
}

- (HAP2AccessoryServerTransportCoAP)initWithAccessoryInfo:(id)a3 discovery:(id)a4 operationQueue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 rawDiscoveryInfo];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"bonjourServiceName"];
  id v13 = [v11 objectForKeyedSubscript:@"bonjourServiceType"];
  id v14 = [v11 objectForKeyedSubscript:@"bonjourServiceDomain"];
  id v15 = (HAP2AccessoryServerTransportCoAP *)-[HAP2AccessoryServerTransportCoAP initWithServiceName:type:domain:operationQueue:discovery:accessoryInfo:](self, v12, v13, v14, v8, v9, v10);

  return v15;
}

- (HAP2AccessoryServerTransportCoAP)initWithOperationQueue:(id)a3 delegateQueue:(id)a4 serviceName:(id)a5 serviceType:(id)a6 serviceDomain:(id)a7 addressResolutionTimeout:(double)a8 discovery:(id)a9 accessoryInfo:(id)a10 coapClient:(id)a11 coapClientFactory:(id)a12
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v18 = a5;
  id v19 = a6;
  id obj = a7;
  id v20 = a7;
  id v21 = a9;
  id v57 = a10;
  id v22 = a11;
  unint64_t v23 = v18;
  id v24 = a12;
  v58.receiver = self;
  v58.super_class = (Class)HAP2AccessoryServerTransportCoAP;
  uint64_t v25 = v20;
  __int16 v26 = [(HAP2AccessoryServerTransportBase *)&v58 initWithOperationQueue:a3 delegateQueue:a4];
  uint64_t v27 = v26;
  if (v26)
  {
    id v56 = v24;
    objc_storeStrong((id *)&v26->_serviceName, a5);
    objc_storeStrong((id *)&v27->_serviceType, a6);
    objc_storeStrong((id *)&v27->_serviceDomain, obj);
    v27->_addressResolutionTimeout = a8;
    id v28 = v21;
    objc_storeWeak((id *)&v27->_discovery, v21);
    objc_storeStrong((id *)&v27->_accessoryInfo, a10);
    v27->_maxTransmitAttempts = 0;
    v27->_initialACKTimeout = 0.0;
    uint64_t v29 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    addressList = v27->_addressList;
    v27->_addressList = (NSMutableArray *)v29;

    v27->_numOfAddresses = 0;
    v27->_numOfAddressesTried = 0;
    uint64_t v31 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    bonjourNames = v27->_bonjourNames;
    v27->_bonjourNames = (NSMutableArray *)v31;

    uint64_t v33 = v27->_bonjourNames;
    id v52 = v25;
    id v54 = v19;
    uint64_t v34 = [NSString stringWithFormat:@"%@.%@.%@", v23, v19, v25];
    [(NSMutableArray *)v33 insertObject:v34 atIndex:0];

    *(void *)&v27->_ipAddress.addr.sa.sa_len = 0;
    *(void *)&v27->_ipAddress.addr.sin6.sin6_addr.__u6_addr32[2] = 0;
    *(void *)v27->_ipAddress.addr.sin6.sin6_addr.__u6_addr8 = 0;
    v27->_ipAddress.addr.sin6.sin6_scope_id = 0;
    v27->_ipAddress.size = 28;
    uint64_t v35 = [MEMORY[0x1E4F65530] sharedPreferences];
    __int16 v36 = [v35 preferenceForKey:@"AccessoryMaximumIPAddressesTracked"];
    uint64_t v37 = [v36 numberValue];

    if ((int)[v37 intValue] >= 1 && objc_msgSend(v37, "intValue") < 0x15)
    {
      uint64_t v39 = [v37 unsignedIntValue];
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v38 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v60 = v27;
        __int16 v61 = 2048;
        uint64_t v39 = 10;
        uint64_t v62 = 10;
        _os_log_error_impl(&dword_1D4758000, v38, OS_LOG_TYPE_ERROR, "%@ Preference 'AccessoryMaximumIPAddressesTracked' setting beyond bounds - using default %lu", buf, 0x16u);
      }
      else
      {
        uint64_t v39 = 10;
      }
    }
    v27->_maxAddressesAllowed = v39;
    v40 = [MEMORY[0x1E4F65530] sharedPreferences];
    v41 = [v40 preferenceForKey:@"AccessoryMaximumBonjourNamesTracked"];
    v42 = [v41 numberValue];

    if ((int)[v42 intValue] >= 1 && objc_msgSend(v42, "intValue") < 0xB)
    {
      uint64_t v44 = [v42 unsignedIntValue];
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v43 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v60 = v27;
        __int16 v61 = 2048;
        uint64_t v44 = 5;
        uint64_t v62 = 5;
        _os_log_error_impl(&dword_1D4758000, v43, OS_LOG_TYPE_ERROR, "%@ Preference 'AccessoryMaximumBonjourNamesTracked' setting beyond bounds - using default %lu", buf, 0x16u);
      }
      else
      {
        uint64_t v44 = 5;
      }
    }
    v27->_maxBonjourNamesAllowed = v44;
    if (v22)
    {
      [v22 setDelegate:v27];
      v45 = &OBJC_IVAR___HAP2AccessoryServerTransportCoAP__coapClient;
      __int16 v46 = v22;
    }
    else
    {
      v45 = &OBJC_IVAR___HAP2AccessoryServerTransportCoAP__coapClientFactory;
      __int16 v46 = v56;
    }
    uint64_t v25 = v52;
    id v19 = v54;
    uint64_t v47 = *v45;
    uint64_t v48 = v46;
    uint64_t v49 = *(Class *)((char *)&v27->super.super.super.super.isa + v47);
    *(Class *)((char *)&v27->super.super.super.super.isa + v47) = v48;

    id v24 = v56;
    id v21 = v28;
  }

  return v27;
}

- (HAP2AccessoryServerTransportCoAP)initWithOperationQueue:(id)a3 delegateQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  id v10 = NSString;
  uint64_t v11 = NSStringFromSelector(a2);
  uint64_t v12 = [v10 stringWithFormat:@"%@ is unavailable", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

@end