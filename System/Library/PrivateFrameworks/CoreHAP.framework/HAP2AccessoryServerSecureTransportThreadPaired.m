@interface HAP2AccessoryServerSecureTransportThreadPaired
- (HAPSecuritySessionEncryption)eventEncryption;
- (id)decryptData:(id)a3 type:(unint64_t)a4 error:(id *)a5;
- (id)securitySessionDidRequestAdditionalDerivedKeyTuples:(id)a3;
- (void)securitySession:(id)a3 didCloseWithError:(id)a4;
- (void)securitySessionDidOpen:(id)a3;
- (void)setEventEncryption:(id)a3;
@end

@implementation HAP2AccessoryServerSecureTransportThreadPaired

- (void).cxx_destruct
{
}

- (void)setEventEncryption:(id)a3
{
}

- (HAPSecuritySessionEncryption)eventEncryption
{
  return self->_eventEncryption;
}

- (void)securitySession:(id)a3 didCloseWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__HAP2AccessoryServerSecureTransportThreadPaired_securitySession_didCloseWithError___block_invoke;
  v12[3] = &unk_1E69F4708;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = (void *)MEMORY[0x1D944E2D0](v12);
  v11 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v11 addConcurrentBlock:v10];
}

id __84__HAP2AccessoryServerSecureTransportThreadPaired_securitySession_didCloseWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEventEncryption:0];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)HAP2AccessoryServerSecureTransportThreadPaired;
  return objc_msgSendSuper2(&v5, sel_securitySession_didCloseWithError_, v2, v3);
}

- (void)securitySessionDidOpen:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __73__HAP2AccessoryServerSecureTransportThreadPaired_securitySessionDidOpen___block_invoke;
  v11 = &unk_1E69F46E0;
  id v12 = v4;
  id v13 = self;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1D944E2D0](&v8);
  id v7 = [(HAP2AccessoryServerTransportBase *)self operationQueue];
  [v7 addConcurrentBlock:v6];
}

void __73__HAP2AccessoryServerSecureTransportThreadPaired_securitySessionDidOpen___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) additionalDerivedKeys];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"Event-Salt"];

  if (v3)
  {
    id v4 = [HAPSecuritySessionEncryption alloc];
    id v5 = [MEMORY[0x1E4F1C9B8] data];
    id v6 = [(HAPSecuritySessionEncryption *)v4 initWithInputKey:v3 outputKey:v5];
    [*(id *)(a1 + 40) setEventEncryption:v6];

    uint64_t v7 = *(void *)(a1 + 32);
    v10.receiver = *(id *)(a1 + 40);
    v10.super_class = (Class)HAP2AccessoryServerSecureTransportThreadPaired;
    objc_msgSendSuper2(&v10, sel_securitySessionDidOpen_, v7);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v8 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v9;
      _os_log_error_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%@ No event key was derived", buf, 0xCu);
    }
    [*(id *)(a1 + 32) close];
  }
}

- (id)securitySessionDidRequestAdditionalDerivedKeyTuples:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [HAPSecuritySessionDelegateAdditionalDerivedKeyTuple alloc];
  id v4 = [@"Event-Salt" dataUsingEncoding:4];
  id v5 = [@"Event-Read-Encryption-Key" dataUsingEncoding:4];
  id v6 = [(HAPSecuritySessionDelegateAdditionalDerivedKeyTuple *)v3 initWithName:@"Event-Salt" saltData:v4 infoData:v5];
  v9[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

- (id)decryptData:(id)a3 type:(unint64_t)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4 != 1)
  {
    v17.receiver = self;
    v17.super_class = (Class)HAP2AccessoryServerSecureTransportThreadPaired;
    v11 = [(HAP2AccessoryServerSecureTransportBase *)&v17 decryptData:v8 type:a4 error:a5];
    goto LABEL_14;
  }
  uint64_t v9 = [(HAP2AccessoryServerSecureTransportThreadPaired *)self eventEncryption];

  if (!v9)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v14 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = self;
      _os_log_error_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%@ No event key was derived", buf, 0xCu);
      if (a5) {
        goto LABEL_10;
      }
    }
    else if (a5)
    {
LABEL_10:
      [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v11 = 0;
    goto LABEL_14;
  }
  objc_super v10 = [(HAP2AccessoryServerSecureTransportThreadPaired *)self eventEncryption];
  id v16 = 0;
  v11 = [v10 decrypt:v8 additionalAuthenticatedData:0 error:&v16];
  id v12 = v16;

  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    [(HAP2AccessoryServerTransportBase *)self closeWithError:v12 completion:&__block_literal_global_25085];
    if (a5) {
      *a5 = v12;
    }
  }

LABEL_14:

  return v11;
}

void __73__HAP2AccessoryServerSecureTransportThreadPaired_decryptData_type_error___block_invoke()
{
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v0 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D4758000, v0, OS_LOG_TYPE_INFO, "Security session closed", v1, 2u);
  }
}

@end