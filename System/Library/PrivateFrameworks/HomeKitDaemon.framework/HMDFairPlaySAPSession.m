@interface HMDFairPlaySAPSession
- (FPSAPContextOpaque_)session;
- (FairPlayHWInfo_)hardwareInfo;
- (HMDFairPlaySAPSession)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (HMDFairPlaySAPSessionDelegate)delegate;
- (NSUUID)sessionIdentifier;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)delegateQueue;
- (unint64_t)state;
- (void)_closeWithError:(id)a3;
- (void)_handleServerCertificate:(id)a3 error:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)_handleServerSAPExchangeData:(id)a3 error:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)_setupSAPSessionWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)_teardown;
- (void)close;
- (void)dealloc;
- (void)openWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)setState:(unint64_t)a3;
- (void)signatureForData:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)verifySignedData:(id)a3 signature:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6;
@end

@implementation HMDFairPlaySAPSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (FairPlayHWInfo_)hardwareInfo
{
  *retstr = *(FairPlayHWInfo_ *)((char *)self + 56);
  return self;
}

- (FPSAPContextOpaque_)session
{
  return self->_session;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (HMDFairPlaySAPSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDFairPlaySAPSessionDelegate *)WeakRetained;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)verifySignedData:(id)a3 signature:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(HMDFairPlaySAPSession *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke;
  block[3] = &unk_264A2DDC0;
  id v20 = v10;
  id v21 = v12;
  id v23 = v11;
  id v24 = v13;
  v22 = self;
  id v15 = v11;
  id v16 = v13;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(v14, block);
}

void __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    if ([*(id *)(a1 + 48) state] == 2)
    {
      v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
      [*(id *)(a1 + 48) session];
      [*(id *)(a1 + 56) bytes];
      [*(id *)(a1 + 56) length];
      id v3 = v2;
      [v3 mutableBytes];
      [v3 length];
      gLg1CWr7p();
      if (v4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Failed to verified signed data with error: %d", v4);
        id v5 = (id)objc_claimAutoreleasedReturnValue();
        v6 = (void *)MEMORY[0x230FBD990]();
        v7 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v32 = v8;
          __int16 v33 = 2112;
          id v34 = v5;
          _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] %@", buf, 0x16u);
        }
        v9 = *(NSObject **)(a1 + 40);
        if (v9)
        {
          if (*(void *)(a1 + 64))
          {
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke_48;
            block[3] = &unk_264A2F870;
            id v5 = v5;
            id v25 = v5;
            id v26 = *(id *)(a1 + 64);
            dispatch_async(v9, block);
          }
        }
      }
      else
      {
        id v20 = *(NSObject **)(a1 + 40);
        if (!v20) {
          goto LABEL_23;
        }
        id v21 = *(void **)(a1 + 64);
        if (!v21) {
          goto LABEL_23;
        }
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke_2;
        v22[3] = &unk_264A2DFA0;
        id v23 = v21;
        dispatch_async(v20, v22);
        id v5 = v23;
      }

LABEL_23:
      return;
    }
    id v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v32 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] FairPlay session is not open", buf, 0xCu);
    }
    id v18 = *(NSObject **)(a1 + 40);
    if (v18)
    {
      v19 = *(void **)(a1 + 64);
      if (v19)
      {
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke_44;
        v27[3] = &unk_264A2DFA0;
        id v28 = v19;
        dispatch_async(v18, v27);
        id v3 = v28;
        goto LABEL_23;
      }
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v32 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] invalid parameter", buf, 0xCu);
    }
    id v13 = *(NSObject **)(a1 + 40);
    if (v13)
    {
      v14 = *(void **)(a1 + 64);
      if (v14)
      {
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke_43;
        v29[3] = &unk_264A2DFA0;
        id v30 = v14;
        dispatch_async(v13, v29);
        id v3 = v30;
        goto LABEL_23;
      }
    }
  }
}

void __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke_43(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] hmErrorWithCode:27 description:@"invalid parameter" reason:0 suggestion:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke_44(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] hmErrorWithCode:21 description:@"FairPlay session is not open" reason:0 suggestion:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke_48(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] hmErrorWithCode:52 description:*(void *)(a1 + 32) reason:0 suggestion:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)signatureForData:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDFairPlaySAPSession *)self clientQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke;
  v15[3] = &unk_264A2EE30;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  __int16 v33 = 0;
  unsigned int v32 = 0;
  if (!*(void *)(a1 + 32))
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] invalid parameter", buf, 0xCu);
    }
    id v12 = *(NSObject **)(a1 + 40);
    if (v12)
    {
      id v13 = *(void **)(a1 + 56);
      if (v13)
      {
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke_31;
        v30[3] = &unk_264A2DFA0;
        id v31 = v13;
        dispatch_async(v12, v30);
        id v19 = 0;
        id v5 = v31;
LABEL_31:

        goto LABEL_32;
      }
    }
LABEL_27:
    id v19 = 0;
    goto LABEL_32;
  }
  if ([*(id *)(a1 + 48) state] != 2)
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] FairPlay session is not open", buf, 0xCu);
    }
    id v17 = *(NSObject **)(a1 + 40);
    if (v17)
    {
      id v18 = *(void **)(a1 + 56);
      if (v18)
      {
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke_35;
        v28[3] = &unk_264A2DFA0;
        id v29 = v18;
        dispatch_async(v17, v28);
        id v19 = 0;
        id v5 = v29;
        goto LABEL_31;
      }
    }
    goto LABEL_27;
  }
  Fc3vhtJDvr([*(id *)(a1 + 48) session], objc_msgSend(*(id *)(a1 + 32), "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"), (uint64_t)&v33, (uint64_t)&v32);
  if (v2) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v33 == 0;
  }
  if (v3 || v32 == 0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Failed to sign data with error: %d", v32, v2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x230FBD990]();
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v8;
      __int16 v36 = 2112;
      id v37 = v5;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] %@", buf, 0x16u);
    }
    id v19 = *(NSObject **)(a1 + 40);
    if (v19)
    {
      if (*(void *)(a1 + 56))
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke_42;
        block[3] = &unk_264A2F870;
        id v5 = v5;
        id v26 = v5;
        id v27 = *(id *)(a1 + 56);
        dispatch_async(v19, block);
      }
      id v19 = 0;
    }
    goto LABEL_31;
  }
  id v19 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:");
  free(v33);
  id v20 = *(NSObject **)(a1 + 40);
  if (v20)
  {
    id v21 = *(void **)(a1 + 56);
    if (v21)
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke_2;
      v22[3] = &unk_264A2F870;
      id v24 = v21;
      id v19 = v19;
      id v23 = v19;
      dispatch_async(v20, v22);

      id v5 = v24;
      goto LABEL_31;
    }
  }
LABEL_32:
}

void __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke_31(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] hmErrorWithCode:27 description:@"invalid parameter" reason:0 suggestion:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke_35(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] hmErrorWithCode:21 description:@"FairPlay session is not open" reason:0 suggestion:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke_42(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] hmErrorWithCode:52 description:*(void *)(a1 + 32) reason:0 suggestion:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_handleServerSAPExchangeData:(id)a3 error:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMDFairPlaySAPSession *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__HMDFairPlaySAPSession__handleServerSAPExchangeData_error_completionQueue_completionHandler___block_invoke;
  block[3] = &unk_264A2DDC0;
  id v20 = v11;
  id v21 = v12;
  id v23 = v10;
  id v24 = v13;
  v22 = self;
  id v15 = v10;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(v14, block);
}

void __94__HMDFairPlaySAPSession__handleServerSAPExchangeData_error_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  char v26 = 0;
  uint64_t v25 = 0;
  int v24 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    BOOL v3 = *(NSObject **)(a1 + 40);
    if (v3)
    {
      uint64_t v4 = *(void **)(a1 + 64);
      if (v4)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __94__HMDFairPlaySAPSession__handleServerSAPExchangeData_error_completionQueue_completionHandler___block_invoke_2;
        block[3] = &unk_264A2F870;
        id v23 = v4;
        id v22 = *(id *)(a1 + 32);
        dispatch_async(v3, block);

        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    [*(id *)(a1 + 48) _closeWithError:v2];
  }
  Mib5yocT(200, *(void *)(a1 + 48) + 56, [*(id *)(a1 + 48) session], objc_msgSend(*(id *)(a1 + 56), "bytes"), objc_msgSend(*(id *)(a1 + 56), "length"), (uint64_t)&v25, (uint64_t)&v24, (uint64_t)&v26);
  if (v5) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v26 == 0;
  }
  if (!v6)
  {
    if (v5) {
      objc_msgSend(NSString, "stringWithFormat:", @"Failed to complete SAP Setup Exchange with error: %d", v5);
    }
    else {
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"Unexpected return code '%d' after getting exchange data", v26);
    }
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v28 = v12;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] %@", buf, 0x16u);
    }
    id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:52 description:v9 reason:0 suggestion:0];
    id v14 = *(NSObject **)(a1 + 40);
    if (v14)
    {
      id v15 = *(void **)(a1 + 64);
      if (v15)
      {
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __94__HMDFairPlaySAPSession__handleServerSAPExchangeData_error_completionQueue_completionHandler___block_invoke_29;
        v18[3] = &unk_264A2F870;
        id v20 = v15;
        id v19 = v13;
        dispatch_async(v14, v18);
      }
    }
    [*(id *)(a1 + 48) _closeWithError:v13];

    goto LABEL_22;
  }
  [*(id *)(a1 + 48) setState:2];
  v7 = *(NSObject **)(a1 + 40);
  if (v7)
  {
    id v8 = *(void **)(a1 + 64);
    if (v8)
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __94__HMDFairPlaySAPSession__handleServerSAPExchangeData_error_completionQueue_completionHandler___block_invoke_2_30;
      v16[3] = &unk_264A2DFA0;
      id v17 = v8;
      dispatch_async(v7, v16);
      id v9 = v17;
LABEL_22:
    }
  }
}

uint64_t __94__HMDFairPlaySAPSession__handleServerSAPExchangeData_error_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __94__HMDFairPlaySAPSession__handleServerSAPExchangeData_error_completionQueue_completionHandler___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __94__HMDFairPlaySAPSession__handleServerSAPExchangeData_error_completionQueue_completionHandler___block_invoke_2_30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleServerCertificate:(id)a3 error:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMDFairPlaySAPSession *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke;
  block[3] = &unk_264A2DDC0;
  id v20 = v11;
  id v21 = v12;
  id v23 = v10;
  id v24 = v13;
  id v22 = self;
  id v15 = v10;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(v14, block);
}

void __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke(id *a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  char v36 = 0;
  uint64_t v35 = 0;
  int v34 = 0;
  id v2 = a1[4];
  if (v2)
  {
    BOOL v3 = a1[5];
    if (v3)
    {
      id v4 = a1[8];
      if (v4)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_2;
        block[3] = &unk_264A2F870;
        id v33 = v4;
        id v32 = a1[4];
        dispatch_async(v3, block);

        id v2 = a1[4];
      }
    }
    [a1[6] _closeWithError:v2];
  }
  Mib5yocT(200, (uint64_t)a1[6] + 56, [a1[6] session], objc_msgSend(a1[7], "bytes"), objc_msgSend(a1[7], "length"), (uint64_t)&v35, (uint64_t)&v34, (uint64_t)&v36);
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v35 == 0;
  }
  BOOL v7 = v6 || v34 == 0;
  int v8 = v7;
  if (v7 || v36 != 1)
  {
    if (v8) {
      objc_msgSend(NSString, "stringWithFormat:", @"Failed to get exchange data with error: %d", v5);
    }
    else {
      objc_msgSend(NSString, "stringWithFormat:", @"Unexpected return code '%d' after getting exchange data", v36);
    }
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v14;
      __int16 v39 = 2112;
      id v40 = v9;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] %@", buf, 0x16u);
    }
    id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:52 description:v9 reason:0 suggestion:0];
    id v16 = a1[5];
    if (!v16) {
      goto LABEL_31;
    }
    id v17 = a1[8];
    if (!v17) {
      goto LABEL_31;
    }
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_23;
    v28[3] = &unk_264A2F870;
    id v30 = v17;
    id v29 = v15;
    dispatch_async(v16, v28);

    id v18 = v30;
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  free(v35);
  id v10 = [a1[6] delegate];

  if (!v10)
  {
    id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"The FairPlay session delegate is missing" reason:0 suggestion:0];
    id v19 = a1[5];
    if (!v19) {
      goto LABEL_31;
    }
    id v20 = a1[8];
    if (!v20) {
      goto LABEL_31;
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_4;
    v21[3] = &unk_264A2F870;
    id v23 = v20;
    id v22 = v15;
    dispatch_async(v19, v21);

    id v18 = v23;
LABEL_30:

LABEL_31:
    [a1[6] _closeWithError:v15];

    goto LABEL_32;
  }
  id v11 = [a1[6] delegateQueue];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_2_25;
  v24[3] = &unk_264A2EE30;
  v24[4] = a1[6];
  id v9 = v9;
  id v25 = v9;
  id v26 = a1[5];
  id v27 = a1[8];
  dispatch_async(v11, v24);

LABEL_32:
}

uint64_t __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_2_25(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_3;
  v5[3] = &unk_264A27B00;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v2 session:v3 didReceiveClientExchangeData:v4 completionHandler:v5];
}

uint64_t __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleServerSAPExchangeData:a2 error:a3 completionQueue:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_setupSAPSessionWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDFairPlaySAPSession *)self delegate];

  if (v8)
  {
    [(HMDFairPlaySAPSession *)self setState:1];
    id v9 = [(HMDFairPlaySAPSession *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__HMDFairPlaySAPSession__setupSAPSessionWithCompletionQueue_completionHandler___block_invoke;
    block[3] = &unk_264A2EE80;
    void block[4] = self;
    id v15 = v6;
    id v16 = v7;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"The FairPlay session delegate is missing" reason:0 suggestion:0];
    if (v6 && v7)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __79__HMDFairPlaySAPSession__setupSAPSessionWithCompletionQueue_completionHandler___block_invoke_3;
      v11[3] = &unk_264A2F870;
      id v13 = v7;
      id v12 = v10;
      dispatch_async(v6, v11);
    }
    [(HMDFairPlaySAPSession *)self _closeWithError:v10];
  }
}

void __79__HMDFairPlaySAPSession__setupSAPSessionWithCompletionQueue_completionHandler___block_invoke(id *a1)
{
  id v2 = [a1[4] delegate];
  id v3 = a1[4];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __79__HMDFairPlaySAPSession__setupSAPSessionWithCompletionQueue_completionHandler___block_invoke_2;
  v4[3] = &unk_264A27B00;
  v4[4] = v3;
  id v5 = a1[5];
  id v6 = a1[6];
  [v2 session:v3 didReceiveServerCertificateRequestWithCompletionHandler:v4];
}

uint64_t __79__HMDFairPlaySAPSession__setupSAPSessionWithCompletionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __79__HMDFairPlaySAPSession__setupSAPSessionWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleServerCertificate:a2 error:a3 completionQueue:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_teardown
{
  session = self->_session;
  if (session)
  {
    IPaI1oem5iL((uint64_t)session);
    self->_session = 0;
  }
}

- (void)_closeWithError:(id)a3
{
  id v4 = a3;
  [(HMDFairPlaySAPSession *)self _teardown];
  [(HMDFairPlaySAPSession *)self setState:3];
  id v5 = [(HMDFairPlaySAPSession *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(HMDFairPlaySAPSession *)self delegateQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __41__HMDFairPlaySAPSession__closeWithError___block_invoke;
    v8[3] = &unk_264A2F820;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

void __41__HMDFairPlaySAPSession__closeWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 session:*(void *)(a1 + 32) didCloseWithError:*(void *)(a1 + 40)];
}

- (void)close
{
  id v3 = [(HMDFairPlaySAPSession *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__HMDFairPlaySAPSession_close__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __30__HMDFairPlaySAPSession_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeWithError:0];
}

- (void)openWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDFairPlaySAPSession *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__HMDFairPlaySAPSession_openWithCompletionQueue_completionHandler___block_invoke;
  block[3] = &unk_264A2EE80;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __67__HMDFairPlaySAPSession_openWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) state];
  if (v2)
  {
    id v3 = @"Negotiating";
    if (v2 == 2) {
      id v3 = @"Open";
    }
    if (v2 == 3) {
      id v3 = @"Closed";
    }
    id v4 = [NSString stringWithFormat:@"Cannot open a FairPlay session in state '%@'", v3];
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v7;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] %@", buf, 0x16u);
    }
    int v8 = *(NSObject **)(a1 + 40);
    if (v8)
    {
      if (*(void *)(a1 + 48))
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __67__HMDFairPlaySAPSession_openWithCompletionQueue_completionHandler___block_invoke_4;
        block[3] = &unk_264A2F870;
        id v23 = v4;
        id v24 = *(id *)(a1 + 48);
        dispatch_async(v8, block);
      }
    }
LABEL_18:

    return;
  }
  cp2g1b9ro(*(void *)(a1 + 32) + 40, *(void *)(a1 + 32) + 56);
  if (v9)
  {
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to create fairplay session with error: %d", v9);
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v12;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] %@", buf, 0x16u);
    }
    id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:52 description:v4 reason:0 suggestion:0];
    id v14 = *(NSObject **)(a1 + 40);
    if (v14)
    {
      id v15 = *(void **)(a1 + 48);
      if (v15)
      {
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __67__HMDFairPlaySAPSession_openWithCompletionQueue_completionHandler___block_invoke_10;
        v19[3] = &unk_264A2F870;
        id v21 = v15;
        id v20 = v13;
        dispatch_async(v14, v19);
      }
    }
    [*(id *)(a1 + 32) _closeWithError:v13];

    goto LABEL_18;
  }
  id v16 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  [v16 _setupSAPSessionWithCompletionQueue:v17 completionHandler:v18];
}

void __67__HMDFairPlaySAPSession_openWithCompletionQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] hmErrorWithCode:52 description:*(void *)(a1 + 32) reason:0 suggestion:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __67__HMDFairPlaySAPSession_openWithCompletionQueue_completionHandler___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)dealloc
{
  [(HMDFairPlaySAPSession *)self _teardown];
  v3.receiver = self;
  v3.super_class = (Class)HMDFairPlaySAPSession;
  [(HMDFairPlaySAPSession *)&v3 dealloc];
}

- (HMDFairPlaySAPSession)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v6 && v7)
  {
    v22.receiver = self;
    v22.super_class = (Class)HMDFairPlaySAPSession;
    uint64_t v9 = [(HMDFairPlaySAPSession *)&v22 init];
    if (v9)
    {
      HMDispatchQueueNameString();
      id v10 = objc_claimAutoreleasedReturnValue();
      id v11 = (const char *)[v10 UTF8String];
      id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
      clientQueue = v9->_clientQueue;
      v9->_clientQueue = (OS_dispatch_queue *)v13;

      uint64_t v15 = [MEMORY[0x263F08C38] UUID];
      sessionIdentifier = v9->_sessionIdentifier;
      v9->_sessionIdentifier = (NSUUID *)v15;

      objc_storeWeak((id *)&v9->_delegate, v6);
      objc_storeStrong((id *)&v9->_delegateQueue, a4);
    }
    self = v9;
    uint64_t v17 = self;
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v24 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@[HMDFairPlaySAPSession] Invalid parameter", buf, 0xCu);
    }
    uint64_t v17 = 0;
  }

  return v17;
}

@end