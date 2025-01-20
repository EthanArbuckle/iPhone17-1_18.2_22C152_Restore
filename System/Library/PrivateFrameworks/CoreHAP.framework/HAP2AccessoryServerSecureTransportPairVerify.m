@interface HAP2AccessoryServerSecureTransportPairVerify
- (HAP2AccessoryServerSecureTransportPairVerify)initWithTransport:(id)a3 operationQueue:(id)a4;
- (HAP2AccessorySessionInfo)sessionInfo;
- (HAPSecuritySession)securitySession;
- (id)securitySession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4;
- (id)securitySession:(id)a3 didReceiveRequestForPeerPairingIdentityWithIdentifier:(id)a4 error:(id *)a5;
- (id)stateChangeCompletion;
- (void)_closeWithError:(id)a3;
- (void)_openTransport;
- (void)_secureTransport;
- (void)_sendSetupExchangeData:(id)a3;
- (void)doCloseWithError:(id)a3 completion:(id)a4;
- (void)doOpenWithCompletion:(id)a3;
- (void)securitySession:(id)a3 didCloseWithError:(id)a4;
- (void)securitySession:(id)a3 didReceiveSetupExchangeData:(id)a4;
- (void)securitySessionDidOpen:(id)a3;
- (void)setSecuritySession:(id)a3;
- (void)setSessionInfo:(id)a3;
- (void)setStateChangeCompletion:(id)a3;
@end

@implementation HAP2AccessoryServerSecureTransportPairVerify

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong(&self->_stateChangeCompletion, 0);

  objc_storeStrong((id *)&self->_securitySession, 0);
}

- (void)setSessionInfo:(id)a3
{
}

- (HAP2AccessorySessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (void)setStateChangeCompletion:(id)a3
{
}

- (id)stateChangeCompletion
{
  return self->_stateChangeCompletion;
}

- (void)_closeWithError:(id)a3
{
  id v4 = a3;
  v5 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v5 assertCurrentQueue];

  v6 = [(HAP2AccessoryServerSecureTransportPairVerify *)self securitySession];
  if (v6)
  {
    [(HAP2AccessoryServerSecureTransportPairVerify *)self setSecuritySession:0];
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "Secure Transport: Closing security session", buf, 2u);
    }
    [v6 close];
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v8 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "Secure Transport: Closing transport", buf, 2u);
  }
  v9 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__HAP2AccessoryServerSecureTransportPairVerify__closeWithError___block_invoke;
  v10[3] = &unk_1E69F4358;
  v10[4] = self;
  [v9 closeWithError:v4 completion:v10];
}

void __64__HAP2AccessoryServerSecureTransportPairVerify__closeWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__HAP2AccessoryServerSecureTransportPairVerify__closeWithError___block_invoke_2;
  v13[3] = &unk_1E69F4708;
  uint64_t v8 = *(void *)(a1 + 32);
  id v14 = v7;
  uint64_t v15 = v8;
  id v16 = v6;
  id v9 = v6;
  id v10 = v7;
  v11 = (void *)MEMORY[0x1D944E2D0](v13);
  v12 = [*(id *)(a1 + 32) operationQueue];
  [v12 addConcurrentBlock:v11];
}

void __64__HAP2AccessoryServerSecureTransportPairVerify__closeWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v3 = hap2Log_accessory;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_error_impl(&dword_1D4758000, v3, OS_LOG_TYPE_ERROR, "Secure Transport: Failed to close transport: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_INFO, "Secure Transport: Closed transport", (uint8_t *)&v6, 2u);
  }
  v5 = [*(id *)(a1 + 40) stateChangeCompletion];
  [*(id *)(a1 + 40) setStateChangeCompletion:0];
  if (v5) {
    v5[2](v5, 0, *(void *)(a1 + 48), *(void *)(a1 + 32));
  }
}

- (void)_sendSetupExchangeData:(id)a3
{
  id v4 = a3;
  v5 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v5 assertCurrentQueue];

  int v6 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  uint64_t v7 = [v6 wellKnownEndpoint:3];

  uint64_t v8 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  id v9 = [v8 mimeTypeForWellKnownEndpoint:3];

  id v10 = [[HAP2AccessoryServerTransportRequest alloc] initForWritingWithEndpoint:v7 data:v4 encrypted:0 mimeType:v9];
  v11 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__HAP2AccessoryServerSecureTransportPairVerify__sendSetupExchangeData___block_invoke;
  v12[3] = &unk_1E69F10B0;
  v12[4] = self;
  [v11 sendRequest:v10 completion:v12];
}

void __71__HAP2AccessoryServerSecureTransportPairVerify__sendSetupExchangeData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__HAP2AccessoryServerSecureTransportPairVerify__sendSetupExchangeData___block_invoke_2;
  v11[3] = &unk_1E69F4708;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = (void *)MEMORY[0x1D944E2D0](v11);
  id v10 = [*(id *)(a1 + 32) operationQueue];
  [v10 addConcurrentBlock:v9];
}

void __71__HAP2AccessoryServerSecureTransportPairVerify__sendSetupExchangeData___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) securitySession];
  [v2 receivedSetupExchangeData:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_secureTransport
{
  v3 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v3 assertCurrentQueue];

  id v4 = [[HAPSecuritySession alloc] initWithRole:0 resumeSessionID:0 delegate:self];
  [(HAP2AccessoryServerSecureTransportPairVerify *)self setSecuritySession:v4];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "Secure Transport: Opening security session", v6, 2u);
  }
  [(HAPSecuritySession *)v4 open];
}

- (void)_openTransport
{
  v3 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v3 assertCurrentQueue];

  id v4 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__HAP2AccessoryServerSecureTransportPairVerify__openTransport__block_invoke;
  v5[3] = &unk_1E69F4358;
  v5[4] = self;
  [v4 openWithCompletion:v5];
}

void __62__HAP2AccessoryServerSecureTransportPairVerify__openTransport__block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __62__HAP2AccessoryServerSecureTransportPairVerify__openTransport__block_invoke_2;
  v17 = &unk_1E69F1088;
  uint64_t v9 = *(void *)(a1 + 32);
  id v18 = v8;
  uint64_t v19 = v9;
  char v21 = a2;
  id v20 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = (void *)MEMORY[0x1D944E2D0](&v14);
  id v13 = objc_msgSend(*(id *)(a1 + 32), "operationQueue", v14, v15, v16, v17);
  [v13 addConcurrentBlock:v12];
}

void __62__HAP2AccessoryServerSecureTransportPairVerify__openTransport__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v2 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_error_impl(&dword_1D4758000, v2, OS_LOG_TYPE_ERROR, "Secure Transport: Failed to open transport: %@", (uint8_t *)&v7, 0xCu);
    }
    v3 = [*(id *)(a1 + 40) stateChangeCompletion];
    [*(id *)(a1 + 40) setStateChangeCompletion:0];
    if (v3) {
      v3[2](v3, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48), *(void *)(a1 + 32));
    }
  }
  else
  {
    if (*(void *)(a1 + 48))
    {
      id v4 = -[HAP2AccessorySessionInfo initWithNumIPs:numIPsTried:numBonjourNames:]([HAP2AccessorySessionInfo alloc], "initWithNumIPs:numIPsTried:numBonjourNames:", [*(id *)(a1 + 48) numIPAddresses], objc_msgSend(*(id *)(a1 + 48), "numIPAddressesTried"), objc_msgSend(*(id *)(a1 + 48), "numBonjourNames"));
      [*(id *)(a1 + 40) setSessionInfo:v4];
    }
    id v5 = *(void **)(a1 + 40);
    [v5 _secureTransport];
  }
}

- (void)securitySession:(id)a3 didCloseWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didCloseWithError___block_invoke;
  v12[3] = &unk_1E69F4708;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = (void *)MEMORY[0x1D944E2D0](v12);
  id v11 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v11 addConcurrentBlock:v10];
}

void __82__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didCloseWithError___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) securitySession];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v5 = hap2Log_accessory;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        id v6 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        id v18 = v6;
        _os_log_error_impl(&dword_1D4758000, v5, OS_LOG_TYPE_ERROR, "Secure Transport: Security session closed with error: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "Secure Transport: Security session closed", buf, 2u);
    }
    [*(id *)(a1 + 40) setEncryptedSession:0];
    [*(id *)(a1 + 40) setSecuritySession:0];
    id v7 = [*(id *)(a1 + 40) stateChangeCompletion];
    [*(id *)(a1 + 40) setStateChangeCompletion:0];
    if (v7)
    {
      id v8 = *(void **)(a1 + 48);
      if (v8)
      {
        id v9 = v8;
      }
      else
      {
        id v9 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
      }
      id v10 = v9;
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v11 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v10;
        _os_log_error_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "Secure Transport: Failed to open security session: %@", buf, 0xCu);
      }
      id v12 = [*(id *)(a1 + 40) transport];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __82__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didCloseWithError___block_invoke_6;
      v14[3] = &unk_1E69F1060;
      v14[4] = *(void *)(a1 + 40);
      id v15 = v10;
      id v16 = v7;
      id v13 = v10;
      [v12 closeWithError:v13 completion:v14];
    }
    else
    {
      [*(id *)(a1 + 40) closeWithError:*(void *)(a1 + 48) completion:&__block_literal_global_5322];
    }
  }
}

void __82__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didCloseWithError___block_invoke_6(id *a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [a1[4] operationQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didCloseWithError___block_invoke_2;
  v9[3] = &unk_1E69F3600;
  id v7 = a1[6];
  char v13 = a2;
  id v12 = v7;
  id v10 = v5;
  id v11 = a1[5];
  id v8 = v5;
  [v6 addConcurrentBlock:v9];
}

void __82__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didCloseWithError___block_invoke_3()
{
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v0 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D4758000, v0, OS_LOG_TYPE_INFO, "Secure Transport: Finished force closing", v1, 2u);
  }
}

uint64_t __82__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didCloseWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)securitySessionDidOpen:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __71__HAP2AccessoryServerSecureTransportPairVerify_securitySessionDidOpen___block_invoke;
  id v11 = &unk_1E69F46E0;
  id v12 = self;
  id v13 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1D944E2D0](&v8);
  id v7 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v7 addConcurrentBlock:v6];
}

void __71__HAP2AccessoryServerSecureTransportPairVerify_securitySessionDidOpen___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) stateChangeCompletion];
  [*(id *)(a1 + 32) setStateChangeCompletion:0];
  [*(id *)(a1 + 32) setEncryptedSession:*(void *)(a1 + 40)];
  if (v3)
  {
    id v2 = [*(id *)(a1 + 32) sessionInfo];
    (*((void (**)(id, void, void *, void))v3 + 2))(v3, 0, v2, 0);
  }
}

- (void)securitySession:(id)a3 didReceiveSetupExchangeData:(id)a4
{
  id v5 = a4;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __92__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveSetupExchangeData___block_invoke;
  id v12 = &unk_1E69F46E0;
  id v13 = self;
  id v14 = v5;
  id v6 = v5;
  id v7 = (void *)MEMORY[0x1D944E2D0](&v9);
  uint64_t v8 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v8 addConcurrentBlock:v7];
}

uint64_t __92__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveSetupExchangeData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendSetupExchangeData:*(void *)(a1 + 40)];
}

- (id)securitySession:(id)a3 didReceiveRequestForPeerPairingIdentityWithIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [[HAPDeviceID alloc] initWithDeviceIDString:v9];
  if (v10)
  {
    id v11 = dispatch_group_create();
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__5326;
    v33 = __Block_byref_object_dispose__5327;
    id v34 = 0;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__5326;
    v27 = __Block_byref_object_dispose__5327;
    id v28 = 0;
    dispatch_group_enter(v11);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __124__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveRequestForPeerPairingIdentityWithIdentifier_error___block_invoke;
    v18[3] = &unk_1E69F27F0;
    v18[4] = self;
    char v21 = &v23;
    id v12 = v11;
    uint64_t v19 = v12;
    id v20 = v10;
    v22 = &v29;
    id v13 = (void *)MEMORY[0x1D944E2D0](v18);
    id v14 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
    [v14 addConcurrentBlock:v13];

    dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    id v15 = (void *)v30[5];
    if (v15)
    {
      id v16 = v15;
    }
    else if (a5)
    {
      *a5 = (id) v24[5];
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] hapErrorWithCode:9];
    id v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __124__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveRequestForPeerPairingIdentityWithIdentifier_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) delegateQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __124__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveRequestForPeerPairingIdentityWithIdentifier_error___block_invoke_5;
    v10[3] = &unk_1E69F1038;
    id v4 = v2;
    uint64_t v5 = *(void *)(a1 + 32);
    id v11 = v4;
    uint64_t v12 = v5;
    id v13 = *(id *)(a1 + 48);
    int8x16_t v15 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
    id v14 = *(id *)(a1 + 40);
    dispatch_async(v3, v10);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v6 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, "Secure Transport: No delegate", buf, 2u);
    }
    uint64_t v7 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __124__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveRequestForPeerPairingIdentityWithIdentifier_error___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __124__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveRequestForPeerPairingIdentityWithIdentifier_error___block_invoke_2;
  v6[3] = &unk_1E69F4590;
  uint64_t v8 = *(void *)(a1 + 72);
  long long v5 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v5;
  long long v7 = v5;
  [v1 secureTransport:v2 needsRemotePairingIdentityForDeviceID:v3 completion:v6];
}

void __124__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveRequestForPeerPairingIdentityWithIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)securitySession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = dispatch_group_create();
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__5326;
  v32 = __Block_byref_object_dispose__5327;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__5326;
  v26 = __Block_byref_object_dispose__5327;
  id v27 = 0;
  dispatch_group_enter(v7);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __111__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveLocalPairingIdentityRequestWithError___block_invoke;
  v17 = &unk_1E69F1CF8;
  id v18 = self;
  id v20 = &v22;
  uint64_t v8 = v7;
  uint64_t v19 = v8;
  char v21 = &v28;
  uint64_t v9 = (void *)MEMORY[0x1D944E2D0](&v14);
  uint64_t v10 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v10 addConcurrentBlock:v9];

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v11 = (void *)v29[5];
  if (v11)
  {
    id v12 = v11;
  }
  else if (a4)
  {
    *a4 = (id) v23[5];
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v11;
}

void __111__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveLocalPairingIdentityRequestWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveLocalPairingIdentityRequestWithError___block_invoke_1;
    block[3] = &unk_1E69F27F0;
    id v4 = v2;
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    id v12 = v4;
    uint64_t v13 = v5;
    int8x16_t v15 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    id v14 = v6;
    dispatch_async(v3, block);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "Secure Transport: No delegate", buf, 2u);
    }
    uint64_t v8 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __111__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveLocalPairingIdentityRequestWithError___block_invoke_1(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __111__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveLocalPairingIdentityRequestWithError___block_invoke_2;
  v5[3] = &unk_1E69F4590;
  uint64_t v7 = *(void *)(a1 + 64);
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v6 = v4;
  [v1 secureTransport:v2 needsLocalPairingIdentityWithCompletion:v5];
}

void __111__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveLocalPairingIdentityRequestWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)doCloseWithError:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  uint64_t v7 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v7 assertCurrentQueue];

  [(HAP2AccessoryServerSecureTransportPairVerify *)self setStateChangeCompletion:v6];
  [(HAP2AccessoryServerSecureTransportPairVerify *)self _closeWithError:v8];
}

- (void)doOpenWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v5 assertCurrentQueue];

  [(HAP2AccessoryServerSecureTransportPairVerify *)self setStateChangeCompletion:v4];

  [(HAP2AccessoryServerSecureTransportPairVerify *)self _openTransport];
}

- (void)setSecuritySession:(id)a3
{
  id v4 = (HAPSecuritySession *)a3;
  id v5 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v5 assertCurrentQueue];

  securitySession = self->_securitySession;
  self->_securitySession = v4;
}

- (HAPSecuritySession)securitySession
{
  id v3 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v3 assertCurrentQueue];

  securitySession = self->_securitySession;

  return securitySession;
}

- (HAP2AccessoryServerSecureTransportPairVerify)initWithTransport:(id)a3 operationQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (const char *)HAPDispatchQueueName(self, @"delegateQueue");
  uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v10 = dispatch_queue_create(v8, v9);

  v14.receiver = self;
  v14.super_class = (Class)HAP2AccessoryServerSecureTransportPairVerify;
  id v11 = [(HAP2AccessoryServerSecureTransportBase *)&v14 initWithOperationQueue:v7 delegateQueue:v10 transport:v6];

  if (v11)
  {
    [v6 setDelegate:v11];
    sessionInfo = v11->_sessionInfo;
    v11->_sessionInfo = 0;
  }
  return v11;
}

@end