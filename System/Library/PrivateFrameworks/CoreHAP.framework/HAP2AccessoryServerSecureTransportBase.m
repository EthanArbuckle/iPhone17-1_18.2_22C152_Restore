@interface HAP2AccessoryServerSecureTransportBase
+ (id)defaultEncryptedSession;
- (BOOL)mergeWithNewTransport:(id)a3;
- (HAP2AccessoryServerSecureTransportBase)initWithOperationQueue:(id)a3 delegateQueue:(id)a4 transport:(id)a5;
- (HAP2AccessoryServerSecureTransportBase)initWithOperationQueue:(id)a3 delegateQueue:(id)a4 transport:(id)a5 encryptedSession:(id)a6;
- (HAP2AccessoryServerSecureTransportDelegate)delegate;
- (HAP2AccessoryServerTransport)transport;
- (HAPEncryptedSession)encryptedSession;
- (id)decryptData:(id)a3 type:(unint64_t)a4 error:(id *)a5;
- (id)encryptData:(id)a3 error:(id *)a4;
- (id)endpointForCharacteristic:(id)a3;
- (id)endpointForCharacteristics:(id)a3;
- (id)mimeTypeForCharacteristicRequests;
- (id)mimeTypeForWellKnownEndpoint:(unint64_t)a3;
- (id)wellKnownEndpoint:(unint64_t)a3;
- (unint64_t)protocolFeaturesForVersion:(id)a3;
- (void)_decryptResponse:(id)a3 request:(id)a4 completion:(id)a5;
- (void)_encryptRequest:(id)a3 completion:(id)a4;
- (void)_sendRequest:(id)a3 completion:(id)a4;
- (void)didChangeStateWithError:(id)a3;
- (void)doCloseWithError:(id)a3 completion:(id)a4;
- (void)doOpenWithCompletion:(id)a3;
- (void)doSendRequest:(id)a3 completion:(id)a4;
- (void)doUpdateMaxRequestTimeout:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setEncryptedSession:(id)a3;
- (void)transport:(id)a3 didChangeState:(unint64_t)a4 error:(id)a5;
- (void)transport:(id)a3 didReceiveEvent:(id)a4;
@end

@implementation HAP2AccessoryServerSecureTransportBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_encryptedSession, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (HAP2AccessoryServerTransport)transport
{
  return self->_transport;
}

- (void)_decryptResponse:(id)a3 request:(id)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void (**)(id, id, void))a5;
  id v10 = a4;
  v11 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v11 assertCurrentQueue];

  LODWORD(v11) = [v10 isEncrypted];
  if (!v11)
  {
    id v12 = v8;
    id v13 = 0;
    goto LABEL_9;
  }
  id v15 = 0;
  id v12 = [(HAP2AccessoryServerSecureTransportBase *)self decryptData:v8 type:0 error:&v15];
  id v13 = v15;
  if (v12)
  {
LABEL_9:
    v9[2](v9, v12, 0);

    goto LABEL_10;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v14 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v17 = self;
    __int16 v18 = 2112;
    id v19 = v13;
    _os_log_error_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%@ (SecureBase) Failed to decrypt response: %@", buf, 0x16u);
  }
  ((void (**)(id, id, id))v9)[2](v9, 0, v13);
LABEL_10:
}

- (void)_sendRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v8 assertCurrentQueue];

  v9 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__HAP2AccessoryServerSecureTransportBase__sendRequest_completion___block_invoke;
  v12[3] = &unk_1E69F3300;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [v9 sendRequest:v10 completion:v12];
}

void __66__HAP2AccessoryServerSecureTransportBase__sendRequest_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      id v10 = a1[4];
      *(_DWORD *)buf = 138412546;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%@ (SecureBase) Failed to send request: %@", buf, 0x16u);
    }
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __66__HAP2AccessoryServerSecureTransportBase__sendRequest_completion___block_invoke_4;
    id v14 = &unk_1E69F3D58;
    id v15 = a1[4];
    id v18 = a1[6];
    id v16 = v5;
    id v17 = a1[5];
    id v8 = (void *)MEMORY[0x1D944E2D0](&v11);
    v9 = objc_msgSend(a1[4], "operationQueue", v11, v12, v13, v14, v15);
    [v9 addConcurrentBlock:v8];
  }
}

void __66__HAP2AccessoryServerSecureTransportBase__sendRequest_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    [v2 _decryptResponse:v3 request:v4 completion:v5];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v6 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEFAULT, "%@ (SecureBase) No longer open after sending request", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 56);
    v9 = [MEMORY[0x1E4F28C58] hapErrorWithCode:19];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
}

- (void)_encryptRequest:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, id))a4;
  uint64_t v8 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v8 assertCurrentQueue];

  LODWORD(v8) = [v6 isEncrypted];
  uint64_t v9 = [v6 data];
  int v10 = (void *)v9;
  if (!v8)
  {
    id v12 = (id)v9;
    goto LABEL_5;
  }
  id v21 = 0;
  uint64_t v11 = [(HAP2AccessoryServerSecureTransportBase *)self encryptData:v9 error:&v21];
  id v12 = v21;

  if (v11)
  {

    id v12 = (id)v11;
LABEL_5:
    int v13 = [v6 isForReading];
    id v14 = [HAP2AccessoryServerTransportRequest alloc];
    id v15 = [v6 endpoint];
    uint64_t v16 = [v6 isEncrypted];
    id v17 = [v6 mimeType];
    if (v13) {
      uint64_t v18 = [(HAP2AccessoryServerTransportRequest *)v14 initForReadingWithEndpoint:v15 data:v12 encrypted:v16 mimeType:v17];
    }
    else {
      uint64_t v18 = [(HAP2AccessoryServerTransportRequest *)v14 initForWritingWithEndpoint:v15 data:v12 encrypted:v16 mimeType:v17];
    }
    id v19 = (void *)v18;

    [(HAP2AccessoryServerSecureTransportBase *)self _sendRequest:v19 completion:v7];
    goto LABEL_9;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v20 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v23 = self;
    __int16 v24 = 2112;
    id v25 = v12;
    _os_log_error_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%@ (SecureBase) Failed to encrypt request: %@", buf, 0x16u);
  }
  v7[2](v7, 0, v12);
LABEL_9:
}

- (void)transport:(id)a3 didReceiveEvent:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    int v10 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = self;
      _os_log_debug_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEBUG, "%@ (SecureBase) Received an event", buf, 0xCu);
    }
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __68__HAP2AccessoryServerSecureTransportBase_transport_didReceiveEvent___block_invoke;
    uint64_t v16 = &unk_1E69F46E0;
    id v17 = self;
    id v18 = v6;
    uint64_t v11 = (void *)MEMORY[0x1D944E2D0](&v13);
    id v12 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
    [v12 addBlock:v11];
  }
}

void __68__HAP2AccessoryServerSecureTransportBase_transport_didReceiveEvent___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v20 = 0;
    uint64_t v4 = [v2 decryptData:v3 type:1 error:&v20];
    id v5 = v20;
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v6 = hap2Log_accessory;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        id v22 = v14;
        _os_log_debug_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEBUG, "%@ (SecureBase) Successfully decrypted event", buf, 0xCu);
      }
      id v7 = [*(id *)(a1 + 32) delegate];
      if (v7)
      {
        uint64_t v8 = [*(id *)(a1 + 32) delegateQueue];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __68__HAP2AccessoryServerSecureTransportBase_transport_didReceiveEvent___block_invoke_2;
        v16[3] = &unk_1E69F4708;
        id v9 = v7;
        uint64_t v10 = *(void *)(a1 + 32);
        id v17 = v9;
        uint64_t v18 = v10;
        id v19 = v4;
        dispatch_async(v8, v16);
      }
    }
    else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      id v15 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v5;
      _os_log_error_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, "%@ (SecureBase) Failed to decrypt event: %@", buf, 0x16u);
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v11 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      id v12 = *(void **)(a1 + 32);
      uint64_t v13 = v11;
      *(_DWORD *)buf = 138412546;
      id v22 = v12;
      __int16 v23 = 2048;
      uint64_t v24 = [v12 state];
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, "%@ (SecureBase) Ignoring event while in the wrong state: %lu", buf, 0x16u);
    }
  }
}

uint64_t __68__HAP2AccessoryServerSecureTransportBase_transport_didReceiveEvent___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) secureTransport:*(void *)(a1 + 40) didReceiveEvent:*(void *)(a1 + 48)];
}

- (void)transport:(id)a3 didChangeState:(unint64_t)a4 error:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v12 = hap2Log_accessory;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412802;
        uint64_t v14 = self;
        __int16 v15 = 2048;
        unint64_t v16 = a4;
        __int16 v17 = 2112;
        id v18 = v8;
        _os_log_error_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "%@ (SecureBase) Transport state changed to %lu with error: %@", (uint8_t *)&v13, 0x20u);
      }
      if (a4 == 3 || !a4) {
        [(HAP2AccessoryServerTransportBase *)self didDisconnectWithError:v8];
      }
    }
    else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      uint64_t v14 = self;
      __int16 v15 = 2048;
      unint64_t v16 = a4;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%@ (SecureBase) Transport state changed to %lu", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (id)decryptData:(id)a3 type:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v8 assertCurrentQueue];

  id v9 = [(HAP2AccessoryServerSecureTransportBase *)self encryptedSession];
  uint64_t v10 = [v9 decryptData:v7 additionalAuthenticatedData:0 error:a5];

  return v10;
}

- (id)encryptData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v7 assertCurrentQueue];

  id v8 = [(HAP2AccessoryServerSecureTransportBase *)self encryptedSession];
  id v9 = [v8 encryptData:v6 additionalAuthenticatedData:0 error:a4];

  return v9;
}

- (void)doUpdateMaxRequestTimeout:(double)a3
{
  id v5 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v5 assertCurrentQueue];

  id v6 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  [v6 updateMaxRequestTimeout:a3];
}

- (void)doCloseWithError:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v8 assertCurrentQueue];

  id v9 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__HAP2AccessoryServerSecureTransportBase_doCloseWithError_completion___block_invoke;
  v11[3] = &unk_1E69F3400;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 closeWithError:v7 completion:v11];
}

void __70__HAP2AccessoryServerSecureTransportBase_doCloseWithError_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  unint64_t v16 = __70__HAP2AccessoryServerSecureTransportBase_doCloseWithError_completion___block_invoke_2;
  __int16 v17 = &unk_1E69F3600;
  id v9 = *(id *)(a1 + 40);
  id v19 = v8;
  id v20 = v9;
  char v21 = a2;
  id v18 = v7;
  id v10 = v8;
  id v11 = v7;
  id v12 = (void *)MEMORY[0x1D944E2D0](&v14);
  int v13 = objc_msgSend(*(id *)(a1 + 32), "operationQueue", v14, v15, v16, v17);
  [v13 addConcurrentBlock:v12];
}

uint64_t __70__HAP2AccessoryServerSecureTransportBase_doCloseWithError_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)doSendRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  id v7 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v7 assertCurrentQueue];

  [(HAP2AccessoryServerSecureTransportBase *)self _encryptRequest:v8 completion:v6];
}

- (void)doOpenWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v5 assertCurrentQueue];

  id v6 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__HAP2AccessoryServerSecureTransportBase_doOpenWithCompletion___block_invoke;
  v8[3] = &unk_1E69F3400;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 openWithCompletion:v8];
}

void __63__HAP2AccessoryServerSecureTransportBase_doOpenWithCompletion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  unint64_t v16 = __63__HAP2AccessoryServerSecureTransportBase_doOpenWithCompletion___block_invoke_2;
  __int16 v17 = &unk_1E69F3600;
  id v9 = *(id *)(a1 + 40);
  id v19 = v8;
  id v20 = v9;
  char v21 = a2;
  id v18 = v7;
  id v10 = v8;
  id v11 = v7;
  id v12 = (void *)MEMORY[0x1D944E2D0](&v14);
  int v13 = objc_msgSend(*(id *)(a1 + 32), "operationQueue", v14, v15, v16, v17);
  [v13 addConcurrentBlock:v12];
}

uint64_t __63__HAP2AccessoryServerSecureTransportBase_doOpenWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)didChangeStateWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v5 assertCurrentQueue];

  id v6 = [(HAP2AccessoryServerSecureTransportBase *)self delegate];
  if (v6)
  {
    unint64_t v7 = [(HAP2AccessoryServerTransportBase *)self state];
    id v8 = [(HAP2AccessoryServerTransportBase *)self delegateQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__HAP2AccessoryServerSecureTransportBase_didChangeStateWithError___block_invoke;
    v9[3] = &unk_1E69F4518;
    id v10 = v6;
    id v11 = self;
    unint64_t v13 = v7;
    id v12 = v4;
    dispatch_async(v8, v9);
  }
}

uint64_t __66__HAP2AccessoryServerSecureTransportBase_didChangeStateWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) secureTransport:*(void *)(a1 + 40) didChangeState:*(void *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (BOOL)mergeWithNewTransport:(id)a3
{
  id v4 = a3;
  id v5 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  char v6 = [v5 mergeWithNewTransport:v4];

  return v6;
}

- (id)mimeTypeForCharacteristicRequests
{
  v2 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  uint64_t v3 = [v2 mimeTypeForCharacteristicRequests];

  return v3;
}

- (id)mimeTypeForWellKnownEndpoint:(unint64_t)a3
{
  id v4 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  id v5 = [v4 mimeTypeForWellKnownEndpoint:a3];

  return v5;
}

- (id)endpointForCharacteristics:(id)a3
{
  id v4 = a3;
  id v5 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  char v6 = [v5 endpointForCharacteristics:v4];

  return v6;
}

- (id)endpointForCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  char v6 = [v5 endpointForCharacteristic:v4];

  return v6;
}

- (id)wellKnownEndpoint:(unint64_t)a3
{
  id v4 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  id v5 = [v4 wellKnownEndpoint:a3];

  return v5;
}

- (unint64_t)protocolFeaturesForVersion:(id)a3
{
  id v4 = a3;
  id v5 = [(HAP2AccessoryServerSecureTransportBase *)self transport];
  unint64_t v6 = [v5 protocolFeaturesForVersion:v4];

  return v6;
}

- (void)setEncryptedSession:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(id)objc_opt_class() defaultEncryptedSession];
  }
  id v5 = [(HAP2AccessoryServerTransportBase *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HAP2AccessoryServerSecureTransportBase_setEncryptedSession___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

void __62__HAP2AccessoryServerSecureTransportBase_setEncryptedSession___block_invoke(uint64_t a1)
{
}

- (HAPEncryptedSession)encryptedSession
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__10534;
  id v11 = __Block_byref_object_dispose__10535;
  id v12 = 0;
  uint64_t v3 = [(HAP2AccessoryServerTransportBase *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__HAP2AccessoryServerSecureTransportBase_encryptedSession__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAPEncryptedSession *)v4;
}

void __58__HAP2AccessoryServerSecureTransportBase_encryptedSession__block_invoke(uint64_t a1)
{
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HAP2AccessoryServerTransportBase *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__HAP2AccessoryServerSecureTransportBase_setDelegate___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

id __54__HAP2AccessoryServerSecureTransportBase_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

- (HAP2AccessoryServerSecureTransportDelegate)delegate
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__10534;
  id v11 = __Block_byref_object_dispose__10535;
  id v12 = 0;
  uint64_t v3 = [(HAP2AccessoryServerTransportBase *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__HAP2AccessoryServerSecureTransportBase_delegate__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2AccessoryServerSecureTransportDelegate *)v4;
}

uint64_t __50__HAP2AccessoryServerSecureTransportBase_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));

  return MEMORY[0x1F41817F8]();
}

- (HAP2AccessoryServerSecureTransportBase)initWithOperationQueue:(id)a3 delegateQueue:(id)a4 transport:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() defaultEncryptedSession];
  id v12 = [(HAP2AccessoryServerSecureTransportBase *)self initWithOperationQueue:v10 delegateQueue:v9 transport:v8 encryptedSession:v11];

  return v12;
}

- (HAP2AccessoryServerSecureTransportBase)initWithOperationQueue:(id)a3 delegateQueue:(id)a4 transport:(id)a5 encryptedSession:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HAP2AccessoryServerSecureTransportBase;
  unint64_t v13 = [(HAP2AccessoryServerTransportBase *)&v16 initWithOperationQueue:a3 delegateQueue:a4];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_transport, a5);
    objc_storeStrong((id *)&v14->_encryptedSession, a6);
    [v11 setDelegate:v14];
  }

  return v14;
}

+ (id)defaultEncryptedSession
{
  v2 = objc_opt_new();

  return v2;
}

@end