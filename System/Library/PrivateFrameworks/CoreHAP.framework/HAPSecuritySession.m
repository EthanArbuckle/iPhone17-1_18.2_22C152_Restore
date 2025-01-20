@interface HAPSecuritySession
+ (id)logCategory;
- (BOOL)_initializeSetupSession:(unint64_t)a3;
- (BOOL)isOpen;
- (BOOL)isOpening;
- (HAPSecuritySession)initWithRole:(unint64_t)a3 resumeSessionID:(unint64_t)a4 delegate:(id)a5;
- (HAPSecuritySessionDelegate)delegate;
- (HAPSecuritySessionEncryption)encryption;
- (NSData)broadcastKey;
- (NSDictionary)additionalDerivedKeys;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (PairingSessionPrivate)pairingSession;
- (id)_broadcastInfo;
- (id)_handleLocalPairingIdentityRequestWithStatus:(int *)a3;
- (id)_handlePeerPairingIdentityRequestWithIdentifier:(id)a3 status:(int *)a4;
- (id)_inputInfo;
- (id)_outputInfo;
- (id)decryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5;
- (id)encryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5;
- (id)logIdentifier;
- (unint64_t)resumeSessionID;
- (unint64_t)role;
- (unint64_t)sessionStartTime;
- (unint64_t)state;
- (void)_closeWithError:(id)a3;
- (void)_handleSetupExchangeComplete;
- (void)_initiateClientSessionSetupExchange;
- (void)_notifyOpened;
- (void)_notifyOpening;
- (void)_processSetupExchangeData:(id)a3 error:(id)a4;
- (void)close;
- (void)closeWithError:(id)a3;
- (void)dealloc;
- (void)open;
- (void)reallyOpen;
- (void)receivedSetupExchangeData:(id)a3 error:(id)a4;
- (void)setAdditionalDerivedKeys:(id)a3;
- (void)setBroadcastKey:(id)a3;
- (void)setEncryption:(id)a3;
- (void)setPairingSession:(PairingSessionPrivate *)a3;
- (void)setResumeSessionID:(unint64_t)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation HAPSecuritySession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryption, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_additionalDerivedKeys, 0);

  objc_storeStrong((id *)&self->_broadcastKey, 0);
}

- (void)setEncryption:(id)a3
{
}

- (HAPSecuritySessionEncryption)encryption
{
  return self->_encryption;
}

- (void)setPairingSession:(PairingSessionPrivate *)a3
{
  self->_pairingSession = a3;
}

- (PairingSessionPrivate)pairingSession
{
  return self->_pairingSession;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)role
{
  return self->_role;
}

- (HAPSecuritySessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAPSecuritySessionDelegate *)WeakRetained;
}

- (unint64_t)sessionStartTime
{
  return self->_sessionStartTime;
}

- (id)logIdentifier
{
  v3 = [(HAPSecuritySession *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  if (v4)
  {
    v7 = [(HAPSecuritySession *)self delegate];
    v8 = [v7 shortDescription];
    v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];
  }
  else
  {
    unint64_t v10 = [(HAPSecuritySession *)self state];
    if (v10 > 3) {
      v11 = @"unknown";
    }
    else {
      v11 = off_1E69F0BA0[v10];
    }
    v9 = [v5 stringWithFormat:@"%@ %@", v6, v11];
  }

  return v9;
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
    unint64_t v10 = (void *)MEMORY[0x1D944E080]();
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
  v30 = __Block_byref_object_copy__2670;
  v31 = __Block_byref_object_dispose__2671;
  id v32 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2670;
  v27 = __Block_byref_object_dispose__2671;
  id v28 = 0;
  v16 = [(HAPSecuritySession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HAPSecuritySession_decryptData_additionalAuthenticatedData_error___block_invoke;
  block[3] = &unk_1E69F27F0;
  block[4] = self;
  v21 = &v23;
  v22 = buf;
  id v19 = v8;
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

void __68__HAPSecuritySession_decryptData_additionalAuthenticatedData_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 2)
  {
    v2 = [*(id *)(a1 + 32) encryption];
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v5 + 40);
    uint64_t v6 = [v2 decrypt:v3 additionalAuthenticatedData:v4 error:&obj];
    objc_storeStrong((id *)(v5 + 40), obj);
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      objc_msgSend(*(id *)(a1 + 32), "_closeWithError:");
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6709 userInfo:0];
    MEMORY[0x1F41817F8]();
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
    v27 = __Block_byref_object_copy__2670;
    id v28 = __Block_byref_object_dispose__2671;
    id v29 = 0;
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__2670;
    v22 = __Block_byref_object_dispose__2671;
    id v23 = 0;
    unint64_t v10 = [(HAPSecuritySession *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__HAPSecuritySession_encryptData_additionalAuthenticatedData_error___block_invoke;
    block[3] = &unk_1E69F27F0;
    block[4] = self;
    v16 = &v18;
    v17 = &v24;
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

uint64_t __68__HAPSecuritySession_encryptData_additionalAuthenticatedData_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 2)
  {
    [*(id *)(a1 + 32) encryption];
    uint64_t v2 = [(id)objc_claimAutoreleasedReturnValue() encrypt:*(void *)(a1 + 40) additionalAuthenticatedData:*(void *)(a1 + 48)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6709 userInfo:0];
  }

  return MEMORY[0x1F41817F8]();
}

- (void)_closeWithError:(id)a3
{
  id v12 = a3;
  BOOL v4 = [(HAPSecuritySession *)self state] == 3;
  uint64_t v5 = v12;
  if (!v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    uint64_t v7 = self;
    pairingSession = v7->_pairingSession;
    if (pairingSession)
    {
      CFRelease(pairingSession);
      v7->_pairingSession = 0;
    }
    id v9 = objc_alloc_init(HAPSecuritySessionEncryption);
    [(HAPSecuritySession *)v7 setEncryption:v9];

    v7->_resumeSessionID = 0;
    os_unfair_lock_unlock(p_lock);
    [(HAPSecuritySession *)v7 setState:3];
    unint64_t v10 = [(HAPSecuritySession *)v7 delegate];
    LOBYTE(v9) = objc_opt_respondsToSelector();

    uint64_t v5 = v12;
    if (v9)
    {
      id v11 = [(HAPSecuritySession *)v7 delegate];
      [v11 securitySession:v7 didCloseWithError:v12];

      uint64_t v5 = v12;
    }
  }
}

- (void)closeWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPSecuritySession *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__HAPSecuritySession_closeWithError___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __37__HAPSecuritySession_closeWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeWithError:*(void *)(a1 + 40)];
}

- (void)close
{
  uint64_t v3 = [(HAPSecuritySession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__HAPSecuritySession_close__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __27__HAPSecuritySession_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeWithError:0];
}

- (void)_notifyOpened
{
  uint64_t v3 = [(HAPSecuritySession *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(HAPSecuritySession *)self delegate];
    [v5 securitySessionDidOpen:self];
  }
}

- (void)_notifyOpening
{
  uint64_t v3 = [(HAPSecuritySession *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(HAPSecuritySession *)self delegate];
    [v5 securitySessionIsOpening:self];
  }
}

- (void)reallyOpen
{
  uint64_t v3 = [(HAPSecuritySession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__HAPSecuritySession_reallyOpen__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __32__HAPSecuritySession_reallyOpen__block_invoke(uint64_t a1)
{
  mach_absolute_time();
  *(void *)(*(void *)(a1 + 32) + 48) = UpTicksToMilliseconds();
  uint64_t result = [*(id *)(a1 + 32) role];
  if (result == 1)
  {
    char v4 = *(void **)(a1 + 32);
    return [v4 _notifyOpening];
  }
  else if (!result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _initiateClientSessionSetupExchange];
  }
  return result;
}

- (void)open
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(HAPSecuritySession *)self state])
  {
    uint64_t v3 = (void *)MEMORY[0x1D944E080]();
    char v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      unint64_t v10 = v6;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to open security session, a security session can only be opened once.", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = [(HAPSecuritySession *)self delegate];

    if (v7)
    {
      [(HAPSecuritySession *)self setState:1];
      [(HAPSecuritySession *)self reallyOpen];
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6705 userInfo:0];
      -[HAPSecuritySession closeWithError:](self, "closeWithError:");
    }
  }
}

- (void)_handleSetupExchangeComplete
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D944E080](self, a2);
  char v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v60 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@Deriving session keys", buf, 0xCu);
  }
  uint64_t v7 = [(HAPSecuritySession *)v4 _inputInfo];
  [(HAPSecuritySession *)v4 pairingSession];
  id v8 = v7;
  [v8 bytes];
  [v8 length];
  int v9 = PairingSessionDeriveKey();
  int v50 = v9;
  if (v9)
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:v9 userInfo:0];
    uint64_t v11 = (void *)MEMORY[0x1D944E080]();
    id v12 = v4;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)v55 = 138543618;
      v56 = v14;
      __int16 v57 = 2112;
      id v58 = v10;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to create input key with error: %@", v55, 0x16u);
    }
    [(HAPSecuritySession *)v12 _closeWithError:v10];
  }
  else
  {
    id v15 = [(HAPSecuritySession *)v4 _outputInfo];
    [(HAPSecuritySession *)v4 pairingSession];
    id v10 = v15;
    [v10 bytes];
    [v10 length];
    int v16 = PairingSessionDeriveKey();
    int v50 = v16;
    if (v16)
    {
      v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:v16 userInfo:0];
      uint64_t v18 = (void *)MEMORY[0x1D944E080]();
      id v19 = v4;
      uint64_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = HMFGetLogIdentifier();
        *(_DWORD *)v51 = 138543618;
        v52 = v21;
        __int16 v53 = 2112;
        v54 = v17;
        _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to create output key with error: %@", v51, 0x16u);
      }
      [(HAPSecuritySession *)v19 _closeWithError:v17];
    }
    else
    {
      v49 = 0;
      [(HAPSecuritySession *)v4 pairingSession];
      if (!PairingSessionGetResumeInfo())
      {
        v22 = (void *)MEMORY[0x1D944E080]();
        id v23 = v4;
        uint64_t v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          uint64_t v25 = HMFGetLogIdentifier();
          *(_DWORD *)v51 = 138543618;
          v52 = v25;
          __int16 v53 = 2048;
          v54 = v49;
          _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_INFO, "%{public}@Got resumeSessionID: %llu", v51, 0x16u);
        }
        [(HAPSecuritySession *)v23 setResumeSessionID:v49];
      }
      uint64_t v26 = [(HAPSecuritySession *)v4 _broadcastInfo];
      v27 = [(HAPSecuritySession *)v4 _handleLocalPairingIdentityRequestWithStatus:&v50];
      unint64_t v28 = 0x1E4F1C000;
      if (v50) {
        goto LABEL_19;
      }
      if ([(HAPSecuritySession *)v4 pairingSession])
      {
        [(HAPSecuritySession *)v4 pairingSession];
        v46 = [v27 publicKey];
        id v45 = [v46 data];
        [v45 bytes];
        id v29 = [v27 publicKey];
        v30 = [v29 data];
        [v30 length];
        id v31 = v26;
        [v31 bytes];
        [v31 length];
        unint64_t v28 = 0x1E4F1C000uLL;
        int v50 = PairingSessionDeriveKey();
      }
      if (v50)
      {
LABEL_19:
        [(HAPSecuritySession *)v4 setBroadcastKey:0];
      }
      else
      {
        v44 = [*(id *)(v28 + 2488) dataWithBytes:v51 length:32];
        [(HAPSecuritySession *)v4 setBroadcastKey:v44];
      }
      id v32 = [(HAPSecuritySession *)v4 delegate];
      char v33 = objc_opt_respondsToSelector();

      if (v33)
      {
        v34 = [(HAPSecuritySession *)v4 delegate];
        v35 = [v34 securitySessionDidRequestAdditionalDerivedKeyTuples:v4];

        v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v35, "count"));
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __50__HAPSecuritySession__handleSetupExchangeComplete__block_invoke;
        v47[3] = &unk_1E69F0B80;
        v47[4] = v4;
        id v48 = v36;
        id v37 = v36;
        [v35 enumerateObjectsUsingBlock:v47];
        v38 = (void *)[v37 copy];
        [(HAPSecuritySession *)v4 setAdditionalDerivedKeys:v38];
      }
      pairingSession = v4->_pairingSession;
      if (pairingSession) {
        CFRelease(pairingSession);
      }
      v4->_pairingSession = 0;
      v40 = [HAPSecuritySessionEncryption alloc];
      v41 = [*(id *)(v28 + 2488) dataWithBytes:buf length:32];
      v42 = [*(id *)(v28 + 2488) dataWithBytes:v55 length:32];
      v43 = [(HAPSecuritySessionEncryption *)v40 initWithInputKey:v41 outputKey:v42];
      [(HAPSecuritySession *)v4 setEncryption:v43];

      [(HAPSecuritySession *)v4 setState:2];
      [(HAPSecuritySession *)v4 _notifyOpened];
    }
  }
}

void __50__HAPSecuritySession__handleSetupExchangeComplete__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) pairingSession];
  id v4 = [v3 saltData];
  [v4 bytes];
  id v5 = [v3 saltData];
  [v5 length];
  id v6 = [v3 infoData];
  [v6 bytes];
  uint64_t v7 = [v3 infoData];
  [v7 length];
  int v8 = PairingSessionDeriveKey();

  if (v8)
  {
    int v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      v13 = [v3 name];
      int v17 = 138543874;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2048;
      uint64_t v22 = v8;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive additional key '%@' with error: %ld", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v23 length:32];
    id v15 = *(void **)(a1 + 40);
    int v16 = [v3 name];
    [v15 setObject:v14 forKeyedSubscript:v16];
  }
}

- (id)_broadcastInfo
{
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:"Broadcast-Encryption-Key" length:24];
}

- (id)_outputInfo
{
  uint64_t v2 = [(HAPSecuritySession *)self role];
  if (v2 == (void *)1)
  {
    id v3 = (void *)MEMORY[0x1E4F1C9B8];
    id v4 = "Control-Read-Encryption-Key";
    uint64_t v5 = 27;
  }
  else
  {
    if (v2) {
      goto LABEL_6;
    }
    id v3 = (void *)MEMORY[0x1E4F1C9B8];
    id v4 = "Control-Write-Encryption-Key";
    uint64_t v5 = 28;
  }
  uint64_t v2 = [v3 dataWithBytes:v4 length:v5];
LABEL_6:

  return v2;
}

- (id)_inputInfo
{
  uint64_t v2 = [(HAPSecuritySession *)self role];
  if (v2 == (void *)1)
  {
    id v3 = (void *)MEMORY[0x1E4F1C9B8];
    id v4 = "Control-Write-Encryption-Key";
    uint64_t v5 = 28;
  }
  else
  {
    if (v2) {
      goto LABEL_6;
    }
    id v3 = (void *)MEMORY[0x1E4F1C9B8];
    id v4 = "Control-Read-Encryption-Key";
    uint64_t v5 = 27;
  }
  uint64_t v2 = [v3 dataWithBytes:v4 length:v5];
LABEL_6:

  return v2;
}

- (void)_processSetupExchangeData:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HAPSecuritySession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HAPSecuritySession__processSetupExchangeData_error___block_invoke;
  block[3] = &unk_1E69F4708;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __54__HAPSecuritySession__processSetupExchangeData_error___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  char v30 = 0;
  if ([*(id *)(a1 + 32) state] == 1)
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v2 = (void *)MEMORY[0x1D944E080]();
      id v3 = *(id *)(a1 + 32);
      id v4 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = HMFGetLogIdentifier();
        id v6 = *(__CFString **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v34 = v5;
        __int16 v35 = 2112;
        v36 = v6;
        _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_ERROR, "%{public}@Closing security session due to setup exchange error: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 32) _closeWithError:*(void *)(a1 + 40)];
      return;
    }
    [*(id *)(a1 + 32) pairingSession];
    [*(id *)(a1 + 48) bytes];
    [*(id *)(a1 + 48) length];
    uint64_t v13 = PairingSessionExchange();
    if (v13)
    {
      if (v13 == -6767)
      {
        id v14 = (void *)MEMORY[0x1D944E080]();
        id v15 = *(id *)(a1 + 32);
        int v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v34 = v17;
          _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%{public}@Session lookup failed, reset resumeSessionID, and retrying", buf, 0xCu);
        }
        [*(id *)(a1 + 32) _initializeSetupSession:0];
        [*(id *)(a1 + 32) setState:0];
        [*(id *)(a1 + 32) open];
        return;
      }
      uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithOSStatus:v13];
      if (HAPIsHH2Enabled_onceToken != -1) {
        dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
      }
      if (HAPIsHH2Enabled_hh2Enabled == 1)
      {
        uint64_t v20 = [*(id *)(a1 + 32) delegate];
        char v21 = objc_opt_respondsToSelector();

        if (v21)
        {
          uint64_t v22 = [*(id *)(a1 + 32) delegate];
          uint64_t v23 = *(void *)(a1 + 48);
          id v29 = v18;
          [v22 securitySessionWillCloseWithResponseData:v23 error:&v29];
          id v24 = v29;

          uint64_t v18 = v24;
        }
      }
      __int16 v19 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2 description:@"Operation Cancelled." reason:@"Failed to get the pairing exchange data." suggestion:0 underlyingError:v18];
      uint64_t v25 = (void *)MEMORY[0x1D944E080]();
      id v26 = *(id *)(a1 + 32);
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        unint64_t v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v34 = v28;
        __int16 v35 = 2112;
        v36 = v19;
        _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to process exchange data with error: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 32) _closeWithError:v19];
    }
    else
    {
      uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v32 length:v31];
      if (![v18 length])
      {
LABEL_28:

        return;
      }
      __int16 v19 = [*(id *)(a1 + 32) delegate];
      [(__CFString *)v19 securitySession:*(void *)(a1 + 32) didReceiveSetupExchangeData:v18];
    }

    goto LABEL_28;
  }
  id v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = HMFGetLogIdentifier();
    unint64_t v11 = [*(id *)(a1 + 32) state];
    if (v11 > 3) {
      id v12 = @"unknown";
    }
    else {
      id v12 = off_1E69F0BA0[v11];
    }
    *(_DWORD *)buf = 138543618;
    v34 = v10;
    __int16 v35 = 2112;
    v36 = v12;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to handle setup exchange data in state '%@'", buf, 0x16u);
  }
}

- (void)receivedSetupExchangeData:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPSecuritySession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HAPSecuritySession_receivedSetupExchangeData_error___block_invoke;
  block[3] = &unk_1E69F4708;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __54__HAPSecuritySession_receivedSetupExchangeData_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) || *(void *)(a1 + 40))
  {
    uint64_t v2 = (void *)MEMORY[0x1D944E080]();
    id v3 = *(id *)(a1 + 48);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v5;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling setup exchange data", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 48) _processSetupExchangeData:*(void *)(a1 + 40) error:*(void *)(a1 + 32)];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = *(id *)(a1 + 48);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Invalid setup exchange data: %@", (uint8_t *)&v12, 0x16u);
    }
    unint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6705 userInfo:0];
    [*(id *)(a1 + 48) _closeWithError:v11];
  }
}

- (void)_initiateClientSessionSetupExchange
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@Sending initial client exchange", (uint8_t *)&v7, 0xCu);
  }
  [(HAPSecuritySession *)v4 _notifyOpening];
  [(HAPSecuritySession *)v4 _processSetupExchangeData:0 error:0];
}

- (id)_handlePeerPairingIdentityRequestWithIdentifier:(id)a3 status:(int *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Received request for peer pairing identity with identifier: %@", buf, 0x16u);
  }
  unint64_t v11 = [(HAPSecuritySession *)v8 delegate];
  int v12 = v11;
  if (v11)
  {
    id v24 = 0;
    id v13 = [v11 securitySession:v8 didReceiveRequestForPeerPairingIdentityWithIdentifier:v6 error:&v24];
    id v14 = v24;
    if (v13) {
      goto LABEL_15;
    }
    uint64_t v15 = (void *)MEMORY[0x1D944E080]();
    uint64_t v16 = v8;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v18;
      __int16 v27 = 2112;
      id v28 = v14;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@The delegate failed to retrieve the peer pairing identity with error: %@", buf, 0x16u);
    }
    if (a4) {
      *a4 = -6727;
    }
    [(HAPSecuritySession *)v16 closeWithError:v14];
  }
  else
  {
    __int16 v19 = (void *)MEMORY[0x1D944E080]();
    uint64_t v20 = v8;
    char v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v26 = v22;
      _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to get peer pairing identity, the delegate is missing", buf, 0xCu);
    }
    id v14 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Failed to get peer pairing identity." reason:@"The delegate is missing." suggestion:0 underlyingError:0];
    [(HAPSecuritySession *)v20 closeWithError:v14];
    if (a4)
    {
      id v13 = 0;
      *a4 = -6705;
      goto LABEL_15;
    }
  }
  id v13 = 0;
LABEL_15:

  return v13;
}

- (id)_handleLocalPairingIdentityRequestWithStatus:(int *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1D944E080](self, a2);
  id v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v24 = v8;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Received request for local pairing identity", buf, 0xCu);
  }
  uint64_t v9 = [(HAPSecuritySession *)v6 delegate];
  uint64_t v10 = v9;
  if (v9)
  {
    id v22 = 0;
    unint64_t v11 = [v9 securitySession:v6 didReceiveLocalPairingIdentityRequestWithError:&v22];
    id v12 = v22;
    if (v11) {
      goto LABEL_15;
    }
    id v13 = (void *)MEMORY[0x1D944E080]();
    id v14 = v6;
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
    [(HAPSecuritySession *)v14 closeWithError:v12];
  }
  else
  {
    int v17 = (void *)MEMORY[0x1D944E080]();
    uint64_t v18 = v6;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v24 = v20;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get local pairing identity, the delegate is missing", buf, 0xCu);
    }
    id v12 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Failed to get local pairing identity." reason:@"The delegate is missing." suggestion:0 underlyingError:0];
    [(HAPSecuritySession *)v18 closeWithError:v12];
    if (a3)
    {
      unint64_t v11 = 0;
      *a3 = -6705;
      goto LABEL_15;
    }
  }
  unint64_t v11 = 0;
LABEL_15:

  return v11;
}

- (BOOL)_initializeSetupSession:(unint64_t)a3
{
  id v4 = self;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_pairingSession = &self->_pairingSession;
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    *p_pairingSession = 0;
  }
  if (a3)
  {
    [(HAPSecuritySession *)v4 role];
    if (!PairingSessionCreate())
    {
      id v14 = (void *)MEMORY[0x1D944E080]();
      id v4 = v4;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = v16;
        __int16 v19 = 2048;
        unint64_t v20 = a3;
        _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%{public}@Created pairing session with resumeSessionID: %llu", buf, 0x16u);
      }
      PairingSessionSetResumeInfo();
      goto LABEL_12;
    }
  }
  [(HAPSecuritySession *)v4 role];
  int v7 = PairingSessionCreate();
  if (!v7)
  {
LABEL_12:
    [(HAPSecuritySession *)v4 pairingSession];
    PairingSessionSetFlags();
    return 1;
  }
  int v8 = v7;
  uint64_t v9 = (void *)MEMORY[0x1D944E080]();
  uint64_t v10 = v4;
  unint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    unint64_t v20 = v8;
    _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create pairing session with error: %ld", buf, 0x16u);
  }
  return 0;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(HAPSecuritySession *)self role];
  id v6 = @"unknown";
  int v7 = @"server";
  if (v5 != 1) {
    int v7 = @"unknown";
  }
  if (!v5) {
    int v7 = @"client";
  }
  int v8 = v7;
  unint64_t v9 = [(HAPSecuritySession *)self state];
  if (v9 <= 3) {
    id v6 = off_1E69F0BA0[v9];
  }
  uint64_t v10 = [v3 stringWithFormat:@"<%@, Role = %@, State = %@>", v4, v8, v6];

  return (NSString *)v10;
}

- (NSString)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(HAPSecuritySession *)self role];
  id v6 = @"unknown";
  int v7 = @"server";
  if (v5 != 1) {
    int v7 = @"unknown";
  }
  if (!v5) {
    int v7 = @"client";
  }
  int v8 = v7;
  unint64_t v9 = [(HAPSecuritySession *)self state];
  if (v9 <= 3) {
    id v6 = off_1E69F0BA0[v9];
  }
  uint64_t v10 = [v3 stringWithFormat:@"<%@: %p, Role = %@, State = %@>", v4, self, v8, v6];

  return (NSString *)v10;
}

- (BOOL)isOpening
{
  return [(HAPSecuritySession *)self state] == 1;
}

- (BOOL)isOpen
{
  return [(HAPSecuritySession *)self state] == 2;
}

- (void)setResumeSessionID:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_resumeSessionID = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)resumeSessionID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t resumeSessionID = self->_resumeSessionID;
  os_unfair_lock_unlock(p_lock);
  return resumeSessionID;
}

- (void)setAdditionalDerivedKeys:(id)a3
{
  uint64_t v4 = (NSDictionary *)a3;
  os_unfair_lock_lock_with_options();
  additionalDerivedKeys = self->_additionalDerivedKeys;
  self->_additionalDerivedKeys = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDictionary)additionalDerivedKeys
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_additionalDerivedKeys;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setBroadcastKey:(id)a3
{
  uint64_t v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  broadcastKey = self->_broadcastKey;
  self->_broadcastKey = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)broadcastKey
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_broadcastKey;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setState:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_state = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)dealloc
{
  uint64_t v2 = self;
  pairingSession = v2->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    v2->_pairingSession = 0;
  }
  uint64_t v4 = objc_alloc_init(HAPSecuritySessionEncryption);
  [(HAPSecuritySession *)v2 setEncryption:v4];

  v2->_unint64_t resumeSessionID = 0;
  v5.receiver = v2;
  v5.super_class = (Class)HAPSecuritySession;
  [(HAPSecuritySession *)&v5 dealloc];
}

- (HAPSecuritySession)initWithRole:(unint64_t)a3 resumeSessionID:(unint64_t)a4 delegate:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (v8)
  {
    v23.receiver = self;
    v23.super_class = (Class)HAPSecuritySession;
    unint64_t v9 = [(HAPSecuritySession *)&v23 init];
    uint64_t v10 = v9;
    if (v9)
    {
      unint64_t v11 = (const char *)HAPDispatchQueueName(v9, 0);
      id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
      queue = v10->_queue;
      v10->_queue = (OS_dispatch_queue *)v13;

      objc_storeWeak((id *)&v10->_delegate, v8);
      v10->_role = a3;
      uint64_t v15 = objc_alloc_init(HAPSecuritySessionEncryption);
      encryption = v10->_encryption;
      v10->_encryption = v15;

      [(HAPSecuritySession *)v10 _initializeSetupSession:a4];
      v10->_unint64_t state = 0;
    }
    int v17 = v10;
    uint64_t v18 = v17;
  }
  else
  {
    __int16 v19 = (void *)MEMORY[0x1D944E080]();
    int v17 = self;
    unint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v25 = v21;
      _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%{public}@A valid delegate is required", buf, 0xCu);
    }
    uint64_t v18 = 0;
  }

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t34 != -1) {
    dispatch_once(&logCategory__hmf_once_t34, &__block_literal_global_2738);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v35;

  return v2;
}

uint64_t __33__HAPSecuritySession_logCategory__block_invoke()
{
  logCategory__hmf_once___int16 v35 = HMFCreateOSLogHandle();

  return MEMORY[0x1F41817F8]();
}

@end