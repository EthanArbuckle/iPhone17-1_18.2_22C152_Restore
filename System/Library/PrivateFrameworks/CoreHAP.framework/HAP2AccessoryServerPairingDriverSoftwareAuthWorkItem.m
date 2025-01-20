@interface HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem
+ (id)doSoftwareAuth;
- (BOOL)_isProtocolInfoValid:(id)a3;
- (HAP2AccessoryServerEncoding)encoding;
- (HAP2AccessoryServerSecureTransport)transport;
- (HAPAccessoryProtocolInfo)authenticatedProtocolInfo;
- (HAPAuthSession)authSession;
- (HAPPairSetupSession)pairingSession;
- (NSError)cancelError;
- (void)_handleAuthCompleteWithError:(id)a3;
- (void)_sendSoftwareAuthMessageWithData:(id)a3 completion:(id)a4;
- (void)_softwareAuthFinished;
- (void)_startSoftwareAuth;
- (void)_validateAccessoryInfoWithCompletion:(id)a3;
- (void)authSession:(id)a3 authComplete:(id)a4;
- (void)authSession:(id)a3 authenticateUUID:(id)a4 token:(id)a5;
- (void)authSession:(id)a3 confirmUUID:(id)a4 token:(id)a5;
- (void)authSession:(id)a3 sendAuthExchangeData:(id)a4;
- (void)authSession:(id)a3 validateUUID:(id)a4 token:(id)a5;
- (void)cancelWithError:(id)a3;
- (void)runForPairingDriver:(id)a3;
- (void)setAuthSession:(id)a3;
- (void)setAuthenticatedProtocolInfo:(id)a3;
- (void)setCancelError:(id)a3;
- (void)setPairingSession:(id)a3;
@end

@implementation HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem

+ (id)doSoftwareAuth
{
  v2 = objc_opt_new();

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authSession, 0);
  objc_storeStrong((id *)&self->_cancelError, 0);
  objc_storeStrong((id *)&self->_authenticatedProtocolInfo, 0);
  objc_storeStrong((id *)&self->_pairingSession, 0);
  objc_storeStrong((id *)&self->_encoding, 0);

  objc_storeStrong((id *)&self->_transport, 0);
}

- (void)setAuthSession:(id)a3
{
}

- (HAPAuthSession)authSession
{
  return self->_authSession;
}

- (void)setCancelError:(id)a3
{
}

- (NSError)cancelError
{
  return self->_cancelError;
}

- (void)setAuthenticatedProtocolInfo:(id)a3
{
}

- (HAPAccessoryProtocolInfo)authenticatedProtocolInfo
{
  return self->_authenticatedProtocolInfo;
}

- (void)setPairingSession:(id)a3
{
}

- (HAPPairSetupSession)pairingSession
{
  return self->_pairingSession;
}

- (HAP2AccessoryServerEncoding)encoding
{
  return self->_encoding;
}

- (HAP2AccessoryServerSecureTransport)transport
{
  return self->_transport;
}

- (void)authSession:(id)a3 validateUUID:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v11 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_validateUUID_token___block_invoke;
  v14[3] = &unk_1E69F45E0;
  objc_copyWeak(&v17, &location);
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [v11 addBlock:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __87__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_validateUUID_token___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = [WeakRetained cancelError];

  if (!v4)
  {
    v5 = [WeakRetained pairingDriver];
    v6 = [v5 delegate];
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = [WeakRetained authenticatedProtocolInfo];
      id v10 = [v9 modelName];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __87__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_validateUUID_token___block_invoke_2;
      v12[3] = &unk_1E69F4420;
      objc_copyWeak(&v13, v2);
      [v6 pairingDriver:v5 validateSoftwareAuthUUID:v7 token:v8 model:v10 completion:v12];

      objc_destroyWeak(&v13);
    }
    else
    {
      v11 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
      [WeakRetained cancelWithError:v11];
    }
  }
}

void __87__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_validateUUID_token___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained operationQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __87__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_validateUUID_token___block_invoke_3;
    v8[3] = &unk_1E69F4540;
    objc_copyWeak(&v10, v4);
    id v9 = v3;
    [v7 addBlock:v8];

    objc_destroyWeak(&v10);
  }
}

void __87__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_validateUUID_token___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "cancelWithError:");
  }
  else
  {
    id v3 = [WeakRetained authSession];
    [v3 continueAuthAfterValidation:1];
  }
}

- (void)authSession:(id)a3 sendAuthExchangeData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_sendAuthExchangeData___block_invoke;
  v10[3] = &unk_1E69F4540;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 addBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __89__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_sendAuthExchangeData___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained cancelError];

  if (!v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __89__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_sendAuthExchangeData___block_invoke_2;
    v6[3] = &unk_1E69F4448;
    objc_copyWeak(&v7, v2);
    [WeakRetained _sendSoftwareAuthMessageWithData:v5 completion:v6];
    objc_destroyWeak(&v7);
  }
}

void __89__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_sendAuthExchangeData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = [WeakRetained cancelError];

    if (!v8)
    {
      if (v5)
      {
        [v7 cancelWithError:v5];
      }
      else
      {
        id v9 = [v7 authSession];
        [v9 handleAuthExchangeData:v10 withHeader:v7[32]];
      }
    }
  }
}

- (void)authSession:(id)a3 confirmUUID:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_confirmUUID_token___block_invoke;
  v14[3] = &unk_1E69F45E0;
  objc_copyWeak(&v17, &location);
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [v11 addBlock:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __86__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_confirmUUID_token___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained cancelError];

  if (!v4)
  {
    id v5 = [WeakRetained pairingDriver];
    id v6 = [v5 delegate];
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __86__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_confirmUUID_token___block_invoke_2;
      v10[3] = &unk_1E69F4420;
      objc_copyWeak(&v11, v2);
      [v6 pairingDriver:v5 confirmSoftwareAuthUUID:v7 token:v8 completion:v10];
      objc_destroyWeak(&v11);
    }
    else
    {
      id v9 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
      [WeakRetained cancelWithError:v9];
    }
  }
}

void __86__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_confirmUUID_token___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      [WeakRetained cancelWithError:v3];
    }
    else
    {
      uint64_t v7 = [WeakRetained operationQueue];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __86__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_confirmUUID_token___block_invoke_3;
      v8[3] = &unk_1E69F4658;
      objc_copyWeak(&v9, v4);
      [v7 addBlock:v8];

      objc_destroyWeak(&v9);
    }
  }
}

void __86__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_confirmUUID_token___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _softwareAuthFinished];
}

- (void)authSession:(id)a3 authenticateUUID:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_authenticateUUID_token___block_invoke;
  v14[3] = &unk_1E69F45E0;
  objc_copyWeak(&v17, &location);
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [v11 addBlock:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __91__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_authenticateUUID_token___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained cancelError];

  if (!v4)
  {
    id v5 = [WeakRetained pairingDriver];
    id v6 = [v5 delegate];
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __91__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_authenticateUUID_token___block_invoke_2;
      v10[3] = &unk_1E69F43F8;
      objc_copyWeak(&v11, v2);
      [v6 pairingDriver:v5 authenticateSoftwareAuthUUID:v7 token:v8 completion:v10];
      objc_destroyWeak(&v11);
    }
    else
    {
      id v9 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
      [WeakRetained cancelWithError:v9];
    }
  }
}

void __91__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_authenticateUUID_token___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained authSession];
    [v5 sendTokenUpdateRequest:v6];
  }
}

- (void)authSession:(id)a3 authComplete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_authComplete___block_invoke;
  v10[3] = &unk_1E69F4540;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 addBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __81__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_authComplete___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleAuthCompleteWithError:*(void *)(a1 + 32)];
}

- (void)_handleAuthCompleteWithError:(id)a3
{
  id v8 = a3;
  id v4 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  [v4 assertCurrentQueue];

  [(HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem *)self setAuthSession:0];
  id v5 = [(HAP2AccessoryServerPairingDriverWorkItem *)self pairingDriver];
  id v6 = [v5 delegate];
  id v7 = v6;
  if (v6) {
    [v6 pairingDriver:v5 didFinishAuthWithError:v8];
  }
}

- (BOOL)_isProtocolInfoValid:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  [v5 assertCurrentQueue];

  id v6 = [(HAP2AccessoryServerPairingDriverWorkItem *)self pairingDriver];
  id v7 = [v6 accessoryServer];

  if (v7)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v8 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      log = v8;
      id v9 = [v7 deviceID];
      id v10 = [v4 deviceIdentifier];
      int v26 = [v7 category];
      int v11 = [v4 categoryIdentifier];
      id v12 = [v7 protocolVersion];
      id v13 = [v4 protocolVersion];
      v14 = [(HAP2AccessoryServerPairingDriverWorkItem *)self pairingDriver];
      *(_DWORD *)buf = 138414338;
      v29 = self;
      __int16 v30 = 2112;
      v31 = v9;
      __int16 v32 = 2112;
      v33 = v10;
      __int16 v34 = 1024;
      int v35 = v26;
      __int16 v36 = 1024;
      int v37 = v11;
      __int16 v38 = 2112;
      v39 = v12;
      __int16 v40 = 2112;
      v41 = v13;
      __int16 v42 = 1024;
      int v43 = [v14 featureFlags];
      __int16 v44 = 1024;
      int v45 = [v4 featureFlags];
      _os_log_impl(&dword_1D4758000, log, OS_LOG_TYPE_INFO, "%@ Matching device ID: %@/%@ category: %d/%d protocol version: %@/%@ feature flags: %x/%x", buf, 0x4Cu);
    }
    id v15 = [v7 deviceID];
    id v16 = [v15 deviceIDString];
    id v17 = [v4 deviceIdentifier];
    if ([v16 isEqualToString:v17]
      && (uint64_t v18 = [v7 category], v18 == objc_msgSend(v4, "categoryIdentifier")))
    {
      v19 = [v7 protocolVersion];
      uint64_t v20 = [v19 majorVersion];
      v21 = [v4 protocolVersion];
      if (v20 == [v21 majorVersion])
      {
        v22 = [(HAP2AccessoryServerPairingDriverWorkItem *)self pairingDriver];
        uint64_t v23 = [v22 featureFlags];
        BOOL v24 = v23 == [v4 featureFlags];
      }
      else
      {
        BOOL v24 = 0;
      }
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (void)_validateAccessoryInfoWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  [v5 assertCurrentQueue];

  char v15 = 0;
  id v6 = +[HAPProtocolMessages constructInfoRequest:&unk_1F2C80D30 outTID:&v15];
  if (v6)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = self;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%@ Attempting to validate accessory info", buf, 0xCu);
    }
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    objc_initWeak((id *)buf, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __93__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem__validateAccessoryInfoWithCompletion___block_invoke;
    v10[3] = &unk_1E69F43D0;
    objc_copyWeak(&v13, (id *)buf);
    id v9 = v8;
    id v11 = v9;
    id v12 = v4;
    char v14 = v15;
    [(HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem *)self _sendSoftwareAuthMessageWithData:v6 completion:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    (*((void (**)(id, id))v4 + 2))(v4, v9);
  }
}

void __93__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem__validateAccessoryInfoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    [v8 timeIntervalSinceDate:*(void *)(a1 + 32)];
    double v10 = v9;

    id v11 = [WeakRetained pairingActivity];
    id v12 = (id)[NSNumber numberWithDouble:v10];
    [v6 domain];

    [v6 code];
    id v13 = [WeakRetained operationQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __93__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem__validateAccessoryInfoWithCompletion___block_invoke_2;
    v14[3] = &unk_1E69F43A8;
    objc_copyWeak(&v18, (id *)(a1 + 48));
    id v15 = v6;
    id v17 = *(id *)(a1 + 40);
    id v16 = v5;
    char v19 = *(unsigned char *)(a1 + 56);
    [v13 addBlock:v14];

    objc_destroyWeak(&v18);
  }
}

void __93__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem__validateAccessoryInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained cancelError];
  if (v3 || (id v3 = *(id *)(a1 + 32)) != 0)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (!*(void *)(a1 + 40)) {
      goto LABEL_6;
    }
    +[HAPProtocolMessages parseInfoResponse:expectedTID:withHeader:](HAPProtocolMessages, "parseInfoResponse:expectedTID:withHeader:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (![WeakRetained _isProtocolInfoValid:v3])
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v5 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412290;
        id v9 = WeakRetained;
        _os_log_error_impl(&dword_1D4758000, v5, OS_LOG_TYPE_ERROR, "%@ Accessory info didn't validate", (uint8_t *)&v8, 0xCu);
      }
      uint64_t v6 = *(void *)(a1 + 48);
      id v7 = [MEMORY[0x1E4F28C58] hapErrorWithCode:7];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

      goto LABEL_5;
    }
    [WeakRetained setAuthenticatedProtocolInfo:v3];
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v4();
LABEL_5:

LABEL_6:
}

- (void)_sendSoftwareAuthMessageWithData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem *)self transport];
  id v13 = [v8 wellKnownEndpoint:4];

  id v9 = [(HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem *)self transport];
  uint64_t v10 = [v9 mimeTypeForWellKnownEndpoint:4];

  id v11 = [[HAP2AccessoryServerTransportRequest alloc] initForWritingWithEndpoint:v13 data:v7 encrypted:1 mimeType:v10];
  id v12 = [(HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem *)self transport];
  [v12 sendRequest:v11 completion:v6];
}

- (void)_softwareAuthFinished
{
  id v3 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  [v3 assertCurrentQueue];

  [(HAP2AccessoryServerPairingDriverWorkItem *)self finishWithError:0];
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_cancelWithError___block_invoke;
  v7[3] = &unk_1E69F4540;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 addBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_cancelWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained cancelError];

  if (!v2)
  {
    [WeakRetained setCancelError:*(void *)(a1 + 32)];
    id v3 = [WeakRetained maybePairingDriver];
    if (v3) {
      [WeakRetained finishWithError:*(void *)(a1 + 32)];
    }
  }
}

- (void)_startSoftwareAuth
{
  id v3 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  [v3 assertCurrentQueue];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem__startSoftwareAuth__block_invoke;
  v4[3] = &unk_1E69F4380;
  v4[4] = self;
  [(HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem *)self _validateAccessoryInfoWithCompletion:v4];
}

void __74__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem__startSoftwareAuth__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) operationQueue];
  [v4 assertCurrentQueue];

  id v5 = [*(id *)(a1 + 32) cancelError];

  if (!v5)
  {
    if (v3)
    {
      [*(id *)(a1 + 32) cancelWithError:v3];
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v6 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v12 = 138412290;
        uint64_t v13 = v7;
        _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%@ Starting the software auth state machine", (uint8_t *)&v12, 0xCu);
      }
      id v8 = [*(id *)(a1 + 32) authSession];
      id v9 = v8;
      uint64_t v10 = *(void *)(a1 + 32);
      if (v10) {
        BOOL v11 = *(unsigned __int8 *)(v10 + 32) != 0;
      }
      else {
        BOOL v11 = 0;
      }
      [v8 handleAuthExchangeData:0 withHeader:v11];
    }
  }
}

- (void)runForPairingDriver:(id)a3
{
  id v4 = a3;
  id v5 = [v4 encoding];
  encoding = self->_encoding;
  self->_encoding = v5;

  uint64_t v7 = [v4 pairingSession];
  pairingSession = self->_pairingSession;
  self->_pairingSession = v7;

  id v9 = [v4 encoding];
  self->_sendPDUHeader = ([v9 encodingFeatures] & 8) != 0;

  uint64_t v10 = [(HAP2AccessoryServerPairingDriverWorkItem *)self operationQueue];
  [v10 assertCurrentQueue];

  BOOL v11 = [(HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem *)self pairingSession];
  [v11 generateSessionKeys];

  int v12 = [v4 secureTransportFactory];
  uint64_t v13 = [v4 transport];

  uint64_t v14 = [(HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem *)self pairingSession];
  id v15 = [v12 createSecureTransportWithTransport:v13 isPaired:0 encryptedSession:v14];
  transport = self->_transport;
  self->_transport = v15;

  id v17 = [(HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem *)self authSession];

  if (v17)
  {
    id v18 = [(HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem *)self authSession];
    [(HAPAuthSession *)v18 resetSession];
  }
  else
  {
    id v18 = [[HAPAuthSession alloc] initWithRole:0 instanceId:&unk_1F2C80D30 delegate:self];
    [(HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem *)self setAuthSession:v18];
  }

  char v19 = [(HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem *)self transport];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_runForPairingDriver___block_invoke;
  v20[3] = &unk_1E69F4358;
  v20[4] = self;
  [v19 openWithCompletion:v20];
}

void __76__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_runForPairingDriver___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_runForPairingDriver___block_invoke_2;
  v4[3] = &unk_1E69F4330;
  v4[4] = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1D944E2D0](v4);
  id v3 = [*(id *)(a1 + 32) operationQueue];
  [v3 addBlock:v2];
}

uint64_t __76__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_runForPairingDriver___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startSoftwareAuth];
}

@end