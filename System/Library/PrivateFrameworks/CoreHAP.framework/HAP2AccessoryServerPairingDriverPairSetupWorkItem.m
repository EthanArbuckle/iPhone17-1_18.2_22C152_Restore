@interface HAP2AccessoryServerPairingDriverPairSetupWorkItem
+ (id)pairSetupWithType:(unint64_t)a3;
- (BOOL)isInvalidSetupCode;
- (BOOL)pairSetupSession:(id)a3 didPairWithPeer:(id)a4 error:(id *)a5;
- (BOOL)pairSetupSession:(id)a3 didReceiveBackoffRequestWithTimeInterval:(double)a4;
- (HAP2AccessoryServerPairingDriverDelegate)delegate;
- (HAP2AccessoryServerPairingDriverPairSetupWorkItem)initWithPairSetupType:(unint64_t)a3;
- (HAP2AccessoryServerTransport)transport;
- (HAPPairSetupSession)pairingSession;
- (NSError)cancelError;
- (NSString)description;
- (double)backoffInterval;
- (id)pairSetupSession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4;
- (unint64_t)pairSetupType;
- (void)_pairingStoppedWithError:(id)a3;
- (void)_resetPairingState;
- (void)cancelWithError:(id)a3;
- (void)pairSetupSession:(id)a3 didReceiveProductData:(id)a4;
- (void)pairSetupSession:(id)a3 didReceiveSetupCodeRequestWithCompletionHandler:(id)a4;
- (void)pairSetupSession:(id)a3 didReceiveSetupExchangeData:(id)a4;
- (void)pairSetupSession:(id)a3 didStopWithError:(id)a4;
- (void)pairSetupSessionDidReceiveInvalidSetupCode:(id)a3;
- (void)pairSetupSessionDidStart:(id)a3;
- (void)runForPairingDriver:(id)a3;
- (void)setBackoffInterval:(double)a3;
- (void)setCancelError:(id)a3;
- (void)setInvalidSetupCode:(BOOL)a3;
- (void)setPairingSession:(id)a3;
@end

@implementation HAP2AccessoryServerPairingDriverPairSetupWorkItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelError, 0);
  objc_storeStrong((id *)&self->_pairingSession, 0);
  objc_storeStrong((id *)&self->_transport, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setCancelError:(id)a3
{
}

- (NSError)cancelError
{
  return self->_cancelError;
}

- (void)setBackoffInterval:(double)a3
{
  self->_backoffInterval = a3;
}

- (double)backoffInterval
{
  return self->_backoffInterval;
}

- (void)setInvalidSetupCode:(BOOL)a3
{
  self->_invalidSetupCode = a3;
}

- (BOOL)isInvalidSetupCode
{
  return self->_invalidSetupCode;
}

- (unint64_t)pairSetupType
{
  return self->_pairSetupType;
}

- (void)setPairingSession:(id)a3
{
}

- (HAPPairSetupSession)pairingSession
{
  return self->_pairingSession;
}

- (HAP2AccessoryServerTransport)transport
{
  return self->_transport;
}

- (HAP2AccessoryServerPairingDriverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAP2AccessoryServerPairingDriverDelegate *)WeakRetained;
}

- (BOOL)pairSetupSession:(id)a3 didReceiveBackoffRequestWithTimeInterval:(double)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v7 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __111__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveBackoffRequestWithTimeInterval___block_invoke;
  v9[3] = &unk_1E69F4680;
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)&a4;
  [v7 addBlock:v9];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

  return 0;
}

void __111__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveBackoffRequestWithTimeInterval___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setBackoffInterval:*(double *)(a1 + 40)];
  [WeakRetained setInvalidSetupCode:1];
}

- (void)pairSetupSessionDidReceiveInvalidSetupCode:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSessionDidReceiveInvalidSetupCode___block_invoke;
  v6[3] = &unk_1E69F4658;
  objc_copyWeak(&v7, &location);
  [v5 addBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __96__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSessionDidReceiveInvalidSetupCode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setBackoffInterval:0.0];
  [WeakRetained setInvalidSetupCode:1];
}

- (void)pairSetupSession:(id)a3 didReceiveSetupCodeRequestWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v10[2] = __118__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveSetupCodeRequestWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E69F4630;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 addBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __118__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveSetupCodeRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained pairingDriver];
  id v4 = [v3 accessoryServer];
  if (v4)
  {
    v5 = [WeakRetained delegate];
    if (v5)
    {
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      id v11 = __118__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveSetupCodeRequestWithCompletionHandler___block_invoke_2;
      id v12 = &unk_1E69F4608;
      id v13 = WeakRetained;
      id v14 = *(id *)(a1 + 32);
      id v6 = (void *)MEMORY[0x1D944E2D0](&v9);
      if (objc_msgSend(WeakRetained, "isInvalidSetupCode", v9, v10, v11, v12, v13))
      {
        [WeakRetained backoffInterval];
        objc_msgSend(v5, "pairingDriver:didRejectSetupCodeForAccessory:backoffInterval:completion:", v3, v4, v6);
      }
      else
      {
        [v5 pairingDriver:v3 doesRequireSetupCodeForAccessory:v4 completion:v6];
      }
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
}

void __118__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveSetupCodeRequestWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) cancelError];

  if (!v6)
  {
    [*(id *)(a1 + 32) setInvalidSetupCode:0];
    [*(id *)(a1 + 32) setBackoffInterval:0.0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)pairSetupSession:(id)a3 didStopWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didStopWithError___block_invoke;
  v11[3] = &unk_1E69F45E0;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 addBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __87__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didStopWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained pairingSession];
  v3 = *(void **)(a1 + 32);

  if (v2 == v3) {
    [WeakRetained _pairingStoppedWithError:*(void *)(a1 + 40)];
  }
}

- (void)pairSetupSessionDidStart:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSessionDidStart___block_invoke;
  v7[3] = &unk_1E69F4540;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 addBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __78__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSessionDidStart___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [WeakRetained pairingDriver];
  [v3 setPairingSession:v2];
}

- (void)pairSetupSession:(id)a3 didReceiveProductData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v10[2] = __92__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveProductData___block_invoke;
  v10[3] = &unk_1E69F4540;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 addBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __92__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveProductData___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v3 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v9 = 138412546;
    id v10 = WeakRetained;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_DEFAULT, "%@ Received product data: %@", (uint8_t *)&v9, 0x16u);
  }
  id v5 = [WeakRetained pairingDriver];
  id v6 = [v5 accessoryServer];
  if ([v6 conformsToProtocol:&unk_1F2C8C5B0])
  {
    id v7 = [WeakRetained pairingDriver];
    id v8 = [v7 accessoryServer];
  }
  else
  {
    id v8 = 0;
  }

  [v8 setProductData:*(void *)(a1 + 32)];
}

- (void)pairSetupSession:(id)a3 didReceiveSetupExchangeData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v10[2] = __98__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveSetupExchangeData___block_invoke;
  v10[3] = &unk_1E69F4540;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 addBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __98__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveSetupExchangeData___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained transport];
  id v5 = [v4 wellKnownEndpoint:2];

  id v6 = [WeakRetained transport];
  id v7 = [v6 mimeTypeForWellKnownEndpoint:2];

  id v8 = [[HAP2AccessoryServerTransportRequest alloc] initForWritingWithEndpoint:v5 data:*(void *)(a1 + 32) encrypted:0 mimeType:v7];
  id v9 = HAPPairingStateFromData(*(void **)(a1 + 32));
  id v10 = [WeakRetained transport];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveSetupExchangeData___block_invoke_2;
  v12[3] = &unk_1E69F45B8;
  objc_copyWeak(&v14, v2);
  id v11 = v9;
  id v13 = v11;
  [v10 sendRequest:v8 completion:v12];

  objc_destroyWeak(&v14);
}

void __98__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveSetupExchangeData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained cancelError];

    if (!v8)
    {
      if (v5)
      {
        id v9 = [v7 pairingActivity];
        [v5 domain];

        [v5 code];
      }
      id v10 = [v7 pairingSession];
      [v10 receivedSetupExchangeData:v11 error:v5];
    }
  }
}

- (id)pairSetupSession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4
{
  id v6 = a3;
  id v7 = [(HAP2AccessoryServerPairingDriverWorkItem *)self pairingDriver];
  id v8 = [v7 delegate];
  if (v8)
  {
    id v9 = dispatch_group_create();
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__24863;
    v27 = __Block_byref_object_dispose__24864;
    id v28 = 0;
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__24863;
    v21 = __Block_byref_object_dispose__24864;
    id v22 = 0;
    dispatch_group_enter(v9);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __117__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveLocalPairingIdentityRequestWithError___block_invoke;
    v13[3] = &unk_1E69F4590;
    id v10 = v9;
    id v14 = v10;
    v15 = &v23;
    v16 = &v17;
    [v8 pairingDriver:v7 didRequestLocalPairingIdentityWithCompletion:v13];
    if (dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL))
    {
      id v11 = 0;
    }
    else
    {
      if (a4) {
        *a4 = (id) v18[5];
      }
      id v11 = (id)v24[5];
    }

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] hapErrorWithCode:6];
    id v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __117__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveLocalPairingIdentityRequestWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)pairSetupSession:(id)a3 didPairWithPeer:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v8 = a4;
  uint64_t v9 = [(HAP2AccessoryServerPairingDriverWorkItem *)self pairingDriver];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v10 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v8;
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_INFO, "Request to save pairing peer: %@", buf, 0xCu);
  }
  id v11 = [v9 delegate];
  id v12 = [v9 accessoryServer];
  id v13 = v12;
  if (!v11 || !v12)
  {
    if (a5)
    {
      id v21 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
LABEL_18:
      BOOL v20 = 0;
      *a5 = v21;
      goto LABEL_24;
    }
LABEL_19:
    BOOL v20 = 0;
    goto LABEL_24;
  }
  id v14 = [v12 deviceID];
  v15 = [v14 deviceIDString];
  v16 = [v8 identifier];
  char v17 = [v15 isEqualToString:v16];

  if ((v17 & 1) == 0)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v22 = (void *)hap2Log_default;
    if (os_log_type_enabled((os_log_t)hap2Log_default, OS_LOG_TYPE_ERROR))
    {
      v24 = v22;
      uint64_t v25 = [v13 deviceID];
      v26 = [v8 identifier];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v26;
      _os_log_error_impl(&dword_1D4758000, v24, OS_LOG_TYPE_ERROR, "The peer's identifier doesn't match any more %@ -> %@", buf, 0x16u);
    }
    if (a5)
    {
      id v21 = [MEMORY[0x1E4F28C58] hapErrorWithCode:7];
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v18 = dispatch_group_create();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v32 = __Block_byref_object_copy__24863;
  v33 = __Block_byref_object_dispose__24864;
  id v34 = 0;
  dispatch_group_enter(v18);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __92__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didPairWithPeer_error___block_invoke;
  v28[3] = &unk_1E69F4568;
  uint64_t v19 = v18;
  v29 = v19;
  v30 = buf;
  [v11 pairingDriver:v9 didSaveRemotePairingIdentity:v8 completion:v28];
  if (dispatch_group_wait(v19, 0xFFFFFFFFFFFFFFFFLL))
  {
    BOOL v20 = 0;
  }
  else
  {
    if (a5) {
      *a5 = *(id *)(*(void *)&buf[8] + 40);
    }
    BOOL v20 = *(void *)(*(void *)&buf[8] + 40) == 0;
  }

  _Block_object_dispose(buf, 8);
LABEL_24:

  return v20;
}

void __92__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didPairWithPeer_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSString)description
{
  id v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)HAP2AccessoryServerPairingDriverPairSetupWorkItem;
  uint64_t v4 = [(HAP2AccessoryServerPairingDriverWorkItem *)&v10 description];
  unint64_t v5 = [(HAP2AccessoryServerPairingDriverPairSetupWorkItem *)self pairSetupType];
  if (v5 > 7) {
    id v6 = &stru_1F2C4E778;
  }
  else {
    id v6 = off_1E69F2980[v5];
  }
  uint64_t v7 = v6;
  id v8 = [v3 stringWithFormat:@"%@ (%@)", v4, v7];

  return (NSString *)v8;
}

- (void)_pairingStoppedWithError:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  [v4 assertCurrentQueue];

  [(HAP2AccessoryServerPairingDriverPairSetupWorkItem *)self _resetPairingState];
  [(HAP2AccessoryServerPairingDriverWorkItem *)self finishWithError:v5];
}

- (void)_resetPairingState
{
  id v3 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  [v3 assertCurrentQueue];

  [(HAP2AccessoryServerPairingDriverPairSetupWorkItem *)self setPairingSession:0];
  [(HAP2AccessoryServerPairingDriverPairSetupWorkItem *)self setInvalidSetupCode:0];
  [(HAP2AccessoryServerPairingDriverPairSetupWorkItem *)self setBackoffInterval:0.0];

  [(HAP2AccessoryServerPairingDriverPairSetupWorkItem *)self setCancelError:0];
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__HAP2AccessoryServerPairingDriverPairSetupWorkItem_cancelWithError___block_invoke;
  v7[3] = &unk_1E69F4540;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 addBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __69__HAP2AccessoryServerPairingDriverPairSetupWorkItem_cancelWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained maybePairingDriver];
  if (v2)
  {
    [WeakRetained setCancelError:*(void *)(a1 + 32)];
    id v3 = [v2 pairingSession];
    id v4 = v3;
    if (v3) {
      [v3 stop];
    }
  }
}

- (void)runForPairingDriver:(id)a3
{
  id v4 = a3;
  id v5 = [v4 delegate];
  objc_storeWeak((id *)&self->_delegate, v5);

  id v6 = [v4 transport];

  transport = self->_transport;
  self->_transport = v6;

  id v8 = [[HAPPairSetupSession alloc] initWithRole:0 pairSetupType:[(HAP2AccessoryServerPairingDriverPairSetupWorkItem *)self pairSetupType] delegate:self];
  pairingSession = self->_pairingSession;
  self->_pairingSession = v8;

  objc_super v10 = [(HAP2AccessoryServerPairingDriverWorkItem *)self pairingActivity];
  id v11 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupType](self, "pairSetupType"));

  id v12 = [(HAP2AccessoryServerPairingDriverPairSetupWorkItem *)self pairingSession];
  [v12 start];
}

- (HAP2AccessoryServerPairingDriverPairSetupWorkItem)initWithPairSetupType:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HAP2AccessoryServerPairingDriverPairSetupWorkItem;
  id v4 = [(HAP2AccessoryServerPairingDriverPairSetupWorkItem *)&v8 init];
  id v5 = v4;
  if (v4)
  {
    v4->_pairSetupType = a3;
    id v6 = v4;
  }

  return v5;
}

+ (id)pairSetupWithType:(unint64_t)a3
{
  id v3 = (void *)[objc_alloc((Class)a1) initWithPairSetupType:a3];

  return v3;
}

@end