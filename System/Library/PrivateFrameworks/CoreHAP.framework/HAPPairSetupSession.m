@interface HAPPairSetupSession
+ (BOOL)isValidSetupCode:(id)a3;
+ (id)logCategory;
+ (void)initialize;
- (BOOL)_initializeSession;
- (BOOL)handleSavePeerRequestWithPeerIdentity:(id)a3 error:(id *)a4;
- (BOOL)isHandlingInvalidSetupCode;
- (BOOL)isSecureSession;
- (HAPPairSetupSession)init;
- (HAPPairSetupSession)initWithRole:(int64_t)a3 pairSetupType:(unint64_t)a4 delegate:(id)a5;
- (HAPPairSetupSessionDelegate)delegate;
- (HMFTimer)backoffTimer;
- (NSData)certificate;
- (NSData)sessionReadKey;
- (NSData)sessionWriteKey;
- (NSMutableData)sessionReadNonce;
- (NSMutableData)sessionWriteNonce;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)clientQueue;
- (PairingSessionPrivate)pairingSession;
- (id)_handleLocalPairingIdentityRequestWithStatus:(int *)a3;
- (id)_showSetupCodeWithError:(id *)a3;
- (id)decryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)encryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5;
- (id)getCertificate;
- (id)logIdentifier;
- (id)shortDescription;
- (int64_t)role;
- (unint64_t)pairSetupType;
- (unint64_t)state;
- (void)_handleBackoffExpiration;
- (void)_handlePairSetupExchangeComplete;
- (void)_handleProductData:(id)a3;
- (void)_initializeServer;
- (void)_initiateClientPairSetupExchange;
- (void)_invalidate;
- (void)_processSetupCode:(id)a3 error:(id)a4;
- (void)_processSetupExchangeData:(id)a3 error:(id)a4;
- (void)_stopWithError:(id)a3;
- (void)dealloc;
- (void)generateSessionKeys;
- (void)handleBackoffRequestWithTimeout:(double)a3;
- (void)handleInvalidSetupCodeAndRestart:(BOOL)a3;
- (void)handleSetupCodeRequest;
- (void)receivedSetupExchangeData:(id)a3 error:(id)a4;
- (void)setBackoffTimer:(id)a3;
- (void)setCertificate:(id)a3;
- (void)setHandlingInvalidSetupCode:(BOOL)a3;
- (void)setPairSetupType:(unint64_t)a3;
- (void)setSessionReadKey:(id)a3;
- (void)setSessionReadNonce:(id)a3;
- (void)setSessionWriteKey:(id)a3;
- (void)setSessionWriteNonce:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)start;
- (void)stop;
- (void)stopWithError:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HAPPairSetupSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_sessionWriteNonce, 0);
  objc_storeStrong((id *)&self->_sessionReadNonce, 0);
  objc_storeStrong((id *)&self->_sessionWriteKey, 0);
  objc_storeStrong((id *)&self->_sessionReadKey, 0);
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (PairingSessionPrivate)pairingSession
{
  return self->_pairingSession;
}

- (void)setCertificate:(id)a3
{
}

- (NSData)certificate
{
  return self->_certificate;
}

- (void)setSessionWriteNonce:(id)a3
{
}

- (NSMutableData)sessionWriteNonce
{
  return self->_sessionWriteNonce;
}

- (void)setSessionReadNonce:(id)a3
{
}

- (NSMutableData)sessionReadNonce
{
  return self->_sessionReadNonce;
}

- (void)setSessionWriteKey:(id)a3
{
}

- (NSData)sessionWriteKey
{
  return self->_sessionWriteKey;
}

- (void)setSessionReadKey:(id)a3
{
}

- (NSData)sessionReadKey
{
  return self->_sessionReadKey;
}

- (void)setPairSetupType:(unint64_t)a3
{
  self->_pairSetupType = a3;
}

- (unint64_t)pairSetupType
{
  return self->_pairSetupType;
}

- (void)setHandlingInvalidSetupCode:(BOOL)a3
{
  self->_handlingInvalidSetupCode = a3;
}

- (BOOL)isHandlingInvalidSetupCode
{
  return self->_handlingInvalidSetupCode;
}

- (void)setBackoffTimer:(id)a3
{
}

- (HMFTimer)backoffTimer
{
  return self->_backoffTimer;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (int64_t)role
{
  return self->_role;
}

- (HAPPairSetupSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAPPairSetupSessionDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v3 = [(HAPPairSetupSession *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  v6 = NSString;
  uint64_t v7 = objc_opt_class();
  v8 = [v5 identifier];

  unint64_t v9 = [(HAPPairSetupSession *)self state];
  if (v9 > 2) {
    v10 = @"unknown";
  }
  else {
    v10 = off_1E69F2810[v9];
  }
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HAPPairSetupSession pairSetupType](self, "pairSetupType"));
  v12 = [v6 stringWithFormat:@"%@ %@(%@ %@)", v7, v8, v10, v11];

  return v12;
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPPairSetupSession *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HAPPairSetupSession *)self backoffTimer];

  if (v6 == v4)
  {
    [(HAPPairSetupSession *)self _handleBackoffExpiration];
  }
}

- (id)decryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    if (a5)
    {
      id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6705 userInfo:0];
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  if ((unint64_t)[v8 length] <= 0xF)
  {
    v10 = (void *)MEMORY[0x1D944E080]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v8 length];
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "%{public}@The encrypted data has an invalid length of %tu bytes", buf, 0x16u);
    }
    if (a5)
    {
      id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6743 userInfo:0];
LABEL_9:
      id v15 = 0;
      *a5 = v14;
      goto LABEL_14;
    }
LABEL_13:
    id v15 = 0;
    goto LABEL_14;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v30 = __Block_byref_object_copy__14940;
  v31 = __Block_byref_object_dispose__14941;
  id v32 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__14940;
  v27 = __Block_byref_object_dispose__14941;
  id v28 = 0;
  v16 = [(HAPPairSetupSession *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__HAPPairSetupSession_decryptData_additionalAuthenticatedData_error___block_invoke;
  block[3] = &unk_1E69F27F0;
  block[4] = self;
  v21 = &v23;
  id v19 = v8;
  v22 = buf;
  id v20 = v9;
  dispatch_sync(v16, block);

  if (a5) {
    *a5 = (id) v24[5];
  }
  id v15 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(buf, 8);

LABEL_14:

  return v15;
}

void __69__HAPPairSetupSession_decryptData_additionalAuthenticatedData_error___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) sessionWriteKey];
  if (v2
    && (v3 = (void *)v2,
        [*(id *)(a1 + 32) sessionReadKey],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    objc_msgSend(*(id *)(a1 + 40), "subdataWithRange:", objc_msgSend(*(id *)(a1 + 40), "length") - 16, 16);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = objc_msgSend(*(id *)(a1 + 40), "subdataWithRange:", 0, objc_msgSend(*(id *)(a1 + 40), "length") - 16);
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(v5, "length"));
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v9 = [*(id *)(a1 + 32) sessionReadKey];
    [v9 bytes];
    id v10 = [*(id *)(a1 + 32) sessionReadNonce];
    [v10 bytes];
    [*(id *)(a1 + 48) bytes];
    [*(id *)(a1 + 48) length];
    id v11 = v5;
    [v11 bytes];
    [v11 length];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) mutableBytes];
    id v33 = v32;
    [v33 bytes];
    int v12 = chacha20_poly1305_decrypt_all_64x64();

    id v13 = [*(id *)(a1 + 32) sessionReadNonce];
    id v14 = (unsigned char *)[v13 mutableBytes];
    id v15 = [*(id *)(a1 + 32) sessionReadNonce];
    uint64_t v16 = [v15 length];
    if (v16)
    {
      uint64_t v17 = v16 - 1;
      do
      {
        if (++*v14++) {
          BOOL v19 = 1;
        }
        else {
          BOOL v19 = v17 == 0;
        }
        --v17;
      }
      while (!v19);
    }

    if (v12)
    {
      uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:v12 userInfo:0];
      uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
      v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;
    }
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x1D944E080]();
    id v24 = *(id *)(a1 + 32);
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      v27 = [*(id *)(a1 + 32) sessionReadKey];
      id v28 = [*(id *)(a1 + 32) sessionWriteKey];
      *(_DWORD *)buf = 138543874;
      v35 = v26;
      __int16 v36 = 2112;
      v37 = v27;
      __int16 v38 = 2112;
      v39 = v28;
      _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_ERROR, "%{public}@Nil Session keys: readKey: %@, writeKey: %@", buf, 0x20u);
    }
    uint64_t v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6709 userInfo:0];
    uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
    v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;
  }
}

- (id)encryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__14940;
    id v28 = __Block_byref_object_dispose__14941;
    id v29 = 0;
    uint64_t v18 = 0;
    BOOL v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__14940;
    v22 = __Block_byref_object_dispose__14941;
    id v23 = 0;
    id v10 = [(HAPPairSetupSession *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__HAPPairSetupSession_encryptData_additionalAuthenticatedData_error___block_invoke;
    block[3] = &unk_1E69F27F0;
    block[4] = self;
    uint64_t v16 = &v18;
    uint64_t v17 = &v24;
    id v14 = v8;
    id v15 = v9;
    dispatch_sync(v10, block);

    if (a5) {
      *a5 = (id) v19[5];
    }
    id v11 = (id)v25[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6705 userInfo:0];
    id v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __69__HAPPairSetupSession_encryptData_additionalAuthenticatedData_error___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) sessionWriteKey];
  if (v2
    && (v3 = (void *)v2,
        [*(id *)(a1 + 32) sessionReadKey],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(*(id *)(a1 + 40), "length"));
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = [*(id *)(a1 + 32) sessionWriteKey];
    [v8 bytes];
    id v9 = [*(id *)(a1 + 32) sessionWriteNonce];
    [v9 bytes];
    [*(id *)(a1 + 48) bytes];
    [*(id *)(a1 + 48) length];
    [*(id *)(a1 + 40) bytes];
    [*(id *)(a1 + 40) length];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) mutableBytes];
    chacha20_poly1305_encrypt_all_64x64();

    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) appendBytes:&v26 length:16];
    id v10 = [*(id *)(a1 + 32) sessionWriteNonce];
    id v11 = (unsigned char *)[v10 mutableBytes];
    int v12 = [*(id *)(a1 + 32) sessionWriteNonce];
    uint64_t v13 = [v12 length];
    if (v13)
    {
      uint64_t v14 = v13 - 1;
      do
      {
        if (++*v11++) {
          BOOL v16 = 1;
        }
        else {
          BOOL v16 = v14 == 0;
        }
        --v14;
      }
      while (!v16);
    }
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1D944E080]();
    id v18 = *(id *)(a1 + 32);
    BOOL v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      uint64_t v21 = [*(id *)(a1 + 32) sessionReadKey];
      v22 = [*(id *)(a1 + 32) sessionWriteKey];
      int v26 = 138543874;
      v27 = v20;
      __int16 v28 = 2112;
      id v29 = v21;
      __int16 v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil Session keys: readKey: %@, writeKey: %@", (uint8_t *)&v26, 0x20u);
    }
    uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6709 userInfo:0];
    uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
}

- (BOOL)isSecureSession
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(HAPPairSetupSession *)self clientQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__HAPPairSetupSession_isSecureSession__block_invoke;
  v5[3] = &unk_1E69F44F0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __38__HAPPairSetupSession_isSecureSession__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sessionWriteKey];
  if (v2)
  {
    v3 = (void *)v2;
    id v4 = [*(id *)(a1 + 32) sessionReadKey];

    if (v4) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

- (id)getCertificate
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__14940;
  id v11 = __Block_byref_object_dispose__14941;
  id v12 = 0;
  v3 = [(HAPPairSetupSession *)self clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__HAPPairSetupSession_getCertificate__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __37__HAPPairSetupSession_getCertificate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) certificate];

  return MEMORY[0x1F41817F8]();
}

- (void)generateSessionKeys
{
  v3 = [(HAPPairSetupSession *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__HAPPairSetupSession_generateSessionKeys__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

void __42__HAPPairSetupSession_generateSessionKeys__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v31 = v5;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Split pair setup done.", buf, 0xCu);
  }
  [*(id *)(a1 + 32) pairingSession];
  if (PairingSessionDeriveKey()
    || ([*(id *)(a1 + 32) pairingSession], PairingSessionDeriveKey()))
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] hapErrorWithCode:6 description:@"Failed to generate session keys" reason:0 suggestion:0 underlyingError:0];
    [*(id *)(a1 + 32) _stopWithError:v6];
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:32];
    [v7 setSessionReadKey:v8];

    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v29 length:32];
    [v9 setSessionWriteKey:v10];

    memset_s(__s, 8uLL, 0, 8uLL);
    memset_s(v27, 8uLL, 0, 8uLL);
    id v11 = *(void **)(a1 + 32);
    id v12 = [MEMORY[0x1E4F1CA58] dataWithBytes:__s length:8];
    [v11 setSessionReadNonce:v12];

    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = [MEMORY[0x1E4F1CA58] dataWithBytes:v27 length:8];
    [v13 setSessionWriteNonce:v14];

    id v15 = (void *)MEMORY[0x1D944E080]();
    id v16 = *(id *)(a1 + 32);
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v18 = HMFGetLogIdentifier();
      BOOL v19 = [*(id *)(a1 + 32) sessionReadKey];
      uint64_t v20 = [*(id *)(a1 + 32) sessionWriteKey];
      int v21 = 138543874;
      v22 = v18;
      __int16 v23 = 2112;
      uint64_t v24 = v19;
      __int16 v25 = 2112;
      int v26 = v20;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Generated read key: %@, write key: %@", (uint8_t *)&v21, 0x20u);
    }
  }
}

- (void)_stopWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    BOOL v8 = 0;
    if ([(HAPPairSetupSession *)self pairSetupType] != 5) {
      BOOL v8 = [(HAPPairSetupSession *)self pairSetupType] != 6;
    }
    if ([(HAPPairSetupSession *)self pairingSession] && !v8)
    {
      [(HAPPairSetupSession *)self pairingSession];
      uint64_t v9 = (const void *)PairingSessionCopyProperty();
      id v10 = (void *)MEMORY[0x1D944E080]();
      id v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v15 = v13;
        __int16 v16 = 1024;
        int v17 = 0;
        __int16 v18 = 2112;
        BOOL v19 = v9;
        _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Pair Setup completed with err: %d,  MFi Cert %@", buf, 0x1Cu);
      }
      if (v9)
      {
        [(HAPPairSetupSession *)v11 setCertificate:v9];
        CFRelease(v9);
      }
    }
  }
  [(HAPPairSetupSession *)self setHandlingInvalidSetupCode:0];
  if ([(HAPPairSetupSession *)self pairSetupType] != 3) {
    [(HAPPairSetupSession *)self _invalidate];
  }
  [(HAPPairSetupSession *)self setState:2];
  uint64_t v5 = [(HAPPairSetupSession *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(HAPPairSetupSession *)self delegate];
    [v7 pairSetupSession:self didStopWithError:v4];
  }
}

- (void)stopWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPPairSetupSession *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__HAPPairSetupSession_stopWithError___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __37__HAPPairSetupSession_stopWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopWithError:*(void *)(a1 + 40)];
}

- (void)stop
{
}

- (void)start
{
  id v3 = [(HAPPairSetupSession *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__HAPPairSetupSession_start__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __28__HAPPairSetupSession_start__block_invoke(uint64_t a1)
{
  uint64_t v5 = [*(id *)(a1 + 32) delegate];
  if (v5)
  {
    [*(id *)(a1 + 32) setState:1];
    uint64_t v2 = [*(id *)(a1 + 32) role];
    if (v2 == 1)
    {
      [*(id *)(a1 + 32) _initializeServer];
    }
    else if (!v2)
    {
      [*(id *)(a1 + 32) _initiateClientPairSetupExchange];
    }
    if (objc_opt_respondsToSelector()) {
      [v5 pairSetupSessionDidStart:*(void *)(a1 + 32)];
    }
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"A delegate is required for this session." reason:0 suggestion:0 underlyingError:0];
    [*(id *)(a1 + 32) _stopWithError:v3];
  }

  return MEMORY[0x1F41817F8]();
}

- (void)_handleProductData:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HAPPairSetupSession *)self delegate];
  if ([v5 conformsToProtocol:&unk_1F2C95CD8])
  {
    id v6 = [(HAPPairSetupSession *)self delegate];

    if (v6)
    {
      if (objc_opt_respondsToSelector()) {
        [v6 pairSetupSession:self didReceiveProductData:v4];
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  uint64_t v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = HMFGetLogIdentifier();
    int v11 = 138543362;
    id v12 = v10;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle product data, the delegate is missing", (uint8_t *)&v11, 0xCu);
  }
  id v6 = 0;
LABEL_9:
}

- (id)_showSetupCodeWithError:(id *)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = NSString;
  id v6 = NSStringFromSelector(a2);
  uint64_t v7 = [v5 stringWithFormat:@"%@ is unavailable", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (BOOL)handleSavePeerRequestWithPeerIdentity:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v26 = v10;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Received request to save peer '%@'", buf, 0x16u);
  }
  int v11 = [(HAPPairSetupSession *)v8 delegate];
  id v12 = v11;
  if (v11)
  {
    id v24 = 0;
    char v13 = [v11 pairSetupSession:v8 didPairWithPeer:v6 error:&v24];
    id v14 = v24;
    if (v13)
    {
      BOOL v15 = 1;
      goto LABEL_15;
    }
    uint64_t v20 = (void *)MEMORY[0x1D944E080]();
    int v17 = v8;
    int v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v26 = v22;
      __int16 v27 = 2112;
      id v28 = v14;
      _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "%{public}@The delegate failed to save the peer with error: %@", buf, 0x16u);
    }
  }
  else
  {
    __int16 v16 = (void *)MEMORY[0x1D944E080]();
    int v17 = v8;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      BOOL v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v26 = v19;
      _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to save the peer, the delegate is missing", buf, 0xCu);
    }
    id v14 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Failed to save peer" reason:@"The delegate is mising" suggestion:0 underlyingError:0];
  }
  [(HAPPairSetupSession *)v17 stopWithError:v14];
  if (a4)
  {
    id v14 = v14;
    BOOL v15 = 0;
    *a4 = v14;
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_15:

  return v15;
}

- (void)_handleBackoffExpiration
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944E080](self, a2);
  uint64_t v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@The Pair Setup backoff did expire, requesting setup code", (uint8_t *)&v7, 0xCu);
  }
  [(HAPPairSetupSession *)v4 setBackoffTimer:0];
  [(HAPPairSetupSession *)v4 handleSetupCodeRequest];
}

- (void)handleBackoffRequestWithTimeout:(double)a3
{
  uint64_t v5 = [(HAPPairSetupSession *)self clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__HAPPairSetupSession_handleBackoffRequestWithTimeout___block_invoke;
  v6[3] = &unk_1E69F3A58;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);
}

void __55__HAPPairSetupSession_handleBackoffRequestWithTimeout___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v19 = 138543618;
    uint64_t v20 = v5;
    __int16 v21 = 2048;
    uint64_t v22 = v6;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Peer requested a backoff of %g seconds", (uint8_t *)&v19, 0x16u);
  }
  int v7 = [*(id *)(a1 + 32) delegate];
  if ([v7 conformsToProtocol:&unk_1F2C95CD8])
  {
    id v8 = [*(id *)(a1 + 32) delegate];
  }
  else
  {
    id v8 = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![v8 pairSetupSession:*(void *)(a1 + 32) didReceiveBackoffRequestWithTimeInterval:*(double *)(a1 + 40)])
  {
    BOOL v15 = (void *)MEMORY[0x1D944E080]();
    id v16 = *(id *)(a1 + 32);
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v18;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "%{public}@Client requested that no backoff be performed, requesting setup code", (uint8_t *)&v19, 0xCu);
    }
    [*(id *)(a1 + 32) handleSetupCodeRequest];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = *(id *)(a1 + 32);
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v12;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting Pair Setup backoff timer", (uint8_t *)&v19, 0xCu);
    }
    char v13 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:*(double *)(a1 + 40)];
    [v13 setDelegate:*(void *)(a1 + 32)];
    id v14 = [*(id *)(a1 + 32) clientQueue];
    [v13 setDelegateQueue:v14];

    [*(id *)(a1 + 32) setBackoffTimer:v13];
    [v13 resume];
  }
}

- (void)handleInvalidSetupCodeAndRestart:(BOOL)a3
{
  uint64_t v5 = [(HAPPairSetupSession *)self clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__HAPPairSetupSession_handleInvalidSetupCodeAndRestart___block_invoke;
  v6[3] = &unk_1E69F3DF8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __56__HAPPairSetupSession_handleInvalidSetupCodeAndRestart___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@The Pair Setup session received an invalid setup code", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = [*(id *)(a1 + 32) delegate];
  if ([v6 conformsToProtocol:&unk_1F2C95CD8])
  {
    BOOL v7 = [*(id *)(a1 + 32) delegate];
  }
  else
  {
    BOOL v7 = 0;
  }

  if (objc_opt_respondsToSelector()) {
    [v7 pairSetupSessionDidReceiveInvalidSetupCode:*(void *)(a1 + 32)];
  }
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) setHandlingInvalidSetupCode:1];
    [*(id *)(a1 + 32) _processSetupExchangeData:0 error:0];
  }
}

- (void)_processSetupCode:(id)a3 error:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = (void *)MEMORY[0x1D944E080]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      int v26 = 138543618;
      __int16 v27 = v11;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get setup code with error: %@", (uint8_t *)&v26, 0x16u);
    }
    id v12 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2 description:@"Pair Setup failed." reason:@"An error occurred getting the setup code." suggestion:0 underlyingError:v7];
    [(HAPPairSetupSession *)v9 _stopWithError:v12];
LABEL_5:

    goto LABEL_17;
  }
  [(HAPPairSetupSession *)self setHandlingInvalidSetupCode:0];
  BOOL v13 = +[HAPPairSetupSession isValidSetupCode:v6];
  id v14 = (void *)MEMORY[0x1D944E080]();
  BOOL v15 = self;
  id v16 = HMFGetOSLogHandle();
  int v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      int v26 = 138543618;
      __int16 v27 = v18;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "%{public}@Processing received setup code: %@", (uint8_t *)&v26, 0x16u);
    }
    [(HAPPairSetupSession *)v15 pairingSession];
    [v6 UTF8String];
    uint64_t v19 = PairingSessionSetSetupCode();
    if (!v19)
    {
      [(HAPPairSetupSession *)v15 _processSetupExchangeData:0 error:0];
      goto LABEL_17;
    }
    id v12 = [MEMORY[0x1E4F28C58] errorWithOSStatus:v19];
    uint64_t v20 = (void *)MEMORY[0x1D944E080]();
    __int16 v21 = v15;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      int v26 = 138543618;
      __int16 v27 = v23;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to set setup code with error: %@", (uint8_t *)&v26, 0x16u);
    }
    id v24 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2 description:@"Pair Setup failed." reason:@"Failed to handle setup code." suggestion:0 underlyingError:v12];
    [(HAPPairSetupSession *)v21 _stopWithError:v24];

    goto LABEL_5;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    __int16 v25 = HMFGetLogIdentifier();
    int v26 = 138543618;
    __int16 v27 = v25;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@Received invalid setup code '%@'", (uint8_t *)&v26, 0x16u);
  }
  [(HAPPairSetupSession *)v15 handleInvalidSetupCodeAndRestart:0];
  [(HAPPairSetupSession *)v15 handleSetupCodeRequest];
LABEL_17:
}

- (void)handleSetupCodeRequest
{
  id v3 = [(HAPPairSetupSession *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HAPPairSetupSession_handleSetupCodeRequest__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

void __45__HAPPairSetupSession_handleSetupCodeRequest__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if ([v2 conformsToProtocol:&unk_1F2C95CD8])
  {
    id v3 = [*(id *)(a1 + 32) delegate];

    if (v3)
    {
      objc_msgSend(v3, "pairSetupSession:didReceiveSetupCodeRequestWithCompletionHandler:");
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v4 = (void *)MEMORY[0x1D944E080]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to request setup code, invalid delegate.", buf, 0xCu);
  }
  id v3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Failed to request setup code." reason:@"The delegate is missing." suggestion:0 underlyingError:0];
  [*(id *)(a1 + 32) _stopWithError:v3];
LABEL_8:
}

void __45__HAPPairSetupSession_handleSetupCodeRequest__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HAPPairSetupSession_handleSetupCodeRequest__block_invoke_3;
  block[3] = &unk_1E69F4708;
  block[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

uint64_t __45__HAPPairSetupSession_handleSetupCodeRequest__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processSetupCode:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_handlePairSetupExchangeComplete
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944E080](self, a2);
  uint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@Pair setup session did complete successfully", (uint8_t *)&v7, 0xCu);
  }
  [(HAPPairSetupSession *)v4 _stopWithError:0];
}

- (void)_processSetupExchangeData:(id)a3 error:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (__CFString *)a4;
  if ([(HAPPairSetupSession *)self state] != 1)
  {
    id v12 = (void *)MEMORY[0x1D944E080]();
    BOOL v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = HMFGetLogIdentifier();
      unint64_t v16 = [(HAPPairSetupSession *)v13 state];
      if (v16 > 2) {
        int v17 = @"unknown";
      }
      else {
        int v17 = off_1E69F2810[v16];
      }
      *(_DWORD *)buf = 138543618;
      v34 = v15;
      __int16 v35 = 2112;
      __int16 v36 = v17;
      uint64_t v20 = "%{public}@Unable to handle setup exchange data in state '%@'";
      __int16 v21 = v14;
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      uint32_t v23 = 22;
      goto LABEL_15;
    }
LABEL_16:

    goto LABEL_17;
  }
  if (v7)
  {
    id v8 = (void *)MEMORY[0x1D944E080]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v11;
      __int16 v35 = 2112;
      __int16 v36 = v7;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Closing session due to exchange error: %@", buf, 0x16u);
    }
    [(HAPPairSetupSession *)v9 _stopWithError:v7];
    goto LABEL_17;
  }
  [(HAPPairSetupSession *)self pairingSession];
  id v18 = v6;
  [v18 bytes];
  [v18 length];
  uint64_t v19 = PairingSessionExchange();
  if (v19)
  {
    if (v19 == -6771)
    {
      id v12 = (void *)MEMORY[0x1D944E080]();
      BOOL v13 = self;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        BOOL v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v34 = v15;
        uint64_t v20 = "%{public}@The session is waiting for a client to handle an operation";
        __int16 v21 = v14;
        os_log_type_t v22 = OS_LOG_TYPE_INFO;
        uint32_t v23 = 12;
LABEL_15:
        _os_log_impl(&dword_1D4758000, v21, v22, v20, buf, v23);

        goto LABEL_16;
      }
      goto LABEL_16;
    }
    id v24 = (void *)MEMORY[0x1E4F28C58];
    __int16 v25 = [MEMORY[0x1E4F28C58] errorWithOSStatus:v19];
    int v26 = [v24 hapErrorWithCode:12 description:@"Failed to process exchange data" reason:0 suggestion:0 underlyingError:v25];

    __int16 v27 = (void *)MEMORY[0x1D944E080]();
    __int16 v28 = self;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v30;
      __int16 v35 = 2112;
      __int16 v36 = v26;
      _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to process exchange data with error: %@", buf, 0x16u);
    }
    [(HAPPairSetupSession *)v28 _stopWithError:v26];
  }
  v31 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:0 length:0];
  if ([v31 length])
  {
    uint64_t v32 = [(HAPPairSetupSession *)self delegate];
    [v32 pairSetupSession:self didReceiveSetupExchangeData:v31];
  }
LABEL_17:
}

- (void)receivedSetupExchangeData:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPPairSetupSession *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HAPPairSetupSession_receivedSetupExchangeData_error___block_invoke;
  block[3] = &unk_1E69F4708;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __55__HAPPairSetupSession_receivedSetupExchangeData_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) || *(void *)(a1 + 40))
  {
    uint64_t v2 = (void *)MEMORY[0x1D944E080]();
    id v3 = *(id *)(a1 + 48);
    uint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v5;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling setup exchange data", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 48) _processSetupExchangeData:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = *(id *)(a1 + 48);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 32);
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Invalid setup exchange data: %@", (uint8_t *)&v12, 0x16u);
    }
    id v11 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Exchange data or an error is required" reason:0 suggestion:0 underlyingError:0];
    [*(id *)(a1 + 48) _stopWithError:v11];
  }
}

- (void)_initializeServer
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)_initiateClientPairSetupExchange
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D944E080](self, a2);
  uint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@Sending initial client exchange", (uint8_t *)&v7, 0xCu);
  }
  [(HAPPairSetupSession *)v4 _processSetupExchangeData:0 error:0];
}

- (id)_handleLocalPairingIdentityRequestWithStatus:(int *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1D944E080](self, a2);
  id v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v24 = v8;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Received request for local pairing identity", buf, 0xCu);
  }
  uint64_t v9 = [(HAPPairSetupSession *)v6 delegate];
  uint64_t v10 = v9;
  if (v9)
  {
    id v22 = 0;
    id v11 = [v9 pairSetupSession:v6 didReceiveLocalPairingIdentityRequestWithError:&v22];
    id v12 = v22;
    if (!v11)
    {
      id v13 = (void *)MEMORY[0x1D944E080]();
      __int16 v14 = v6;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v24 = v16;
        __int16 v25 = 2112;
        id v26 = v12;
        _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@The delegate failed to retrieve the local pairing identity with error: %@", buf, 0x16u);
      }
      if (a3) {
        *a3 = -6727;
      }
    }
  }
  else
  {
    int v17 = (void *)MEMORY[0x1D944E080]();
    id v18 = v6;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v24 = v20;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get local pairing identity, the delegate is missing", buf, 0xCu);
    }
    id v11 = 0;
    if (a3) {
      *a3 = -6705;
    }
  }

  return v11;
}

- (BOOL)_initializeSession
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(HAPPairSetupSession *)self role];
  [(HAPPairSetupSession *)self role];
  int v3 = PairingSessionCreate();
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2048;
      uint64_t v12 = v3;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to create pairing session with error: %ld", buf, 0x16u);
    }
  }
  else
  {
    [(HAPPairSetupSession *)self setSessionReadKey:0];
    [(HAPPairSetupSession *)self setSessionWriteKey:0];
    [(HAPPairSetupSession *)self setSessionReadNonce:0];
    [(HAPPairSetupSession *)self setSessionWriteNonce:0];
    if ([(HAPPairSetupSession *)self pairSetupType] == 1
      || [(HAPPairSetupSession *)self pairSetupType] == 3
      || [(HAPPairSetupSession *)self pairSetupType] == 4
      || [(HAPPairSetupSession *)self pairSetupType] == 6
      || [(HAPPairSetupSession *)self pairSetupType] == 5
      || [(HAPPairSetupSession *)self pairSetupType] == 7)
    {
      [(HAPPairSetupSession *)self pairingSession];
      PairingSessionSetFlags();
    }
    [(HAPPairSetupSession *)self pairingSession];
    PairingSessionSetEventHandler();
  }
  return v3 == 0;
}

- (NSString)description
{
  return (NSString *)[(HAPPairSetupSession *)self descriptionWithPointer:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(HAPPairSetupSession *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = NSString;
  id v6 = [(HAPPairSetupSession *)self shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    int v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v7 = &stru_1F2C4E778;
  }
  int64_t v8 = [(HAPPairSetupSession *)self role];
  uint64_t v9 = @"unknown";
  uint64_t v10 = @"server";
  if (v8 != 1) {
    uint64_t v10 = @"unknown";
  }
  if (!v8) {
    uint64_t v10 = @"client";
  }
  __int16 v11 = v10;
  unint64_t v12 = [(HAPPairSetupSession *)self state];
  if (v12 <= 2) {
    uint64_t v9 = off_1E69F2810[v12];
  }
  uint64_t v13 = [v5 stringWithFormat:@"<%@%@, Role = %@, State = %@, Type: %tu>", v6, v7, v11, v9, -[HAPPairSetupSession pairSetupType](self, "pairSetupType")];

  if (v3) {

  }
  return v13;
}

- (id)shortDescription
{
  uint64_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)_invalidate
{
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
}

- (void)dealloc
{
  [(HAPPairSetupSession *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HAPPairSetupSession;
  [(HAPPairSetupSession *)&v3 dealloc];
}

- (HAPPairSetupSession)initWithRole:(int64_t)a3 pairSetupType:(unint64_t)a4 delegate:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (v8)
  {
    if (a3)
    {
      if (a3 != 1)
      {
        id v15 = 0;
LABEL_11:
        [v8 conformsToProtocol:v15];
        if ([v8 conformsToProtocol:v15])
        {
          v28.receiver = self;
          v28.super_class = (Class)HAPPairSetupSession;
          uint64_t v16 = [(HAPPairSetupSession *)&v28 init];
          __int16 v11 = v16;
          if (!v16) {
            goto LABEL_14;
          }
          int v17 = (const char *)HAPDispatchQueueName(v16, 0);
          id v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          dispatch_queue_t v19 = dispatch_queue_create(v17, v18);
          clientQueue = v11->_clientQueue;
          v11->_clientQueue = (OS_dispatch_queue *)v19;

          v11->_role = a3;
          v11->_handlingInvalidSetupCode = 0;
          v11->_pairSetupType = a4;
          objc_storeWeak((id *)&v11->_delegate, v8);
          if ([(HAPPairSetupSession *)v11 _initializeSession])
          {
LABEL_14:
            __int16 v11 = v11;
            __int16 v14 = v11;
LABEL_23:

            goto LABEL_24;
          }
        }
        else
        {
          __int16 v21 = (void *)MEMORY[0x1D944E080]();
          __int16 v11 = self;
          id v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = HMFGetLogIdentifier();
            id v24 = (void *)v23;
            __int16 v25 = @"unknown";
            if (a3 == 1) {
              __int16 v25 = @"server";
            }
            if (!a3) {
              __int16 v25 = @"client";
            }
            *(_DWORD *)buf = 138543618;
            uint64_t v30 = v23;
            __int16 v31 = 2112;
            uint64_t v32 = v25;
            id v26 = v25;
            _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%{public}@Delegate must conform to the %@ delegate", buf, 0x16u);
          }
        }
        __int16 v14 = 0;
        goto LABEL_23;
      }
      uint64_t v9 = (id *)&protocolRef_HAPPairSetupSessionServerDelegate;
    }
    else
    {
      uint64_t v9 = (id *)&protocolRef_HAPPairSetupSessionClientDelegate;
    }
    id v15 = *v9;
    goto LABEL_11;
  }
  uint64_t v10 = (void *)MEMORY[0x1D944E080]();
  __int16 v11 = self;
  unint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v30 = (uint64_t)v13;
    _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "%{public}@A valid delegate is required", buf, 0xCu);
  }
  __int16 v14 = 0;
LABEL_24:

  return v14;
}

- (HAPPairSetupSession)init
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t40 != -1) {
    dispatch_once(&logCategory__hmf_once_t40, &__block_literal_global_15045);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v41;

  return v2;
}

uint64_t __34__HAPPairSetupSession_logCategory__block_invoke()
{
  logCategory__hmf_once_v41 = HMFCreateOSLogHandle();

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)isValidSetupCode:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v13 = 0;
  id v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^[0-9]{3}-[0-9]{2}-[0-9]{3}$" options:0 error:&v13];
  id v6 = v13;
  if (!v5)
  {
    id v8 = (void *)MEMORY[0x1D944E080]();
    id v9 = a1;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = 0;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to create setup code regex with error: %@", buf, 0x16u);
    }
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) != 1)
  {
LABEL_7:
    LOBYTE(v7) = 0;
    goto LABEL_8;
  }
  int v7 = [(id)_denylistedSetupCodes containsObject:v4] ^ 1;
LABEL_8:

  return v7;
}

+ (void)initialize
{
  uint64_t v2 = (void *)_denylistedSetupCodes;
  _denylistedSetupCodes = (uint64_t)&unk_1F2C80E68;
}

@end