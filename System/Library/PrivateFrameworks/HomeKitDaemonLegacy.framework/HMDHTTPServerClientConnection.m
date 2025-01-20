@interface HMDHTTPServerClientConnection
@end

@implementation HMDHTTPServerClientConnection

void __79___HMDHTTPServerClientConnection__reallySendMessage_timeout_completionHandler___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __79___HMDHTTPServerClientConnection__reallySendMessage_timeout_completionHandler___block_invoke_2;
    aBlock[3] = &unk_1E6A0EED0;
    objc_copyWeak(&v17, &location);
    objc_copyWeak(&v18, v2);
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 56);
    id v15 = v5;
    uint64_t v16 = v6;
    v7 = _Block_copy(aBlock);
    [*(id *)(a1 + 32) addCompletionHandler:v7 forTransactionIdentifier:*(void *)(a1 + 40)];
    v8 = [*(id *)(a1 + 32) connection];
    uint64_t v9 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79___HMDHTTPServerClientConnection__reallySendMessage_timeout_completionHandler___block_invoke_55;
    v10[3] = &unk_1E6A0EEF8;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, v2);
    id v11 = *(id *)(a1 + 40);
    [v8 sendResponse:v9 completionHandler:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __79___HMDHTTPServerClientConnection__reallySendMessage_timeout_completionHandler___block_invoke_57(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v4 = [WeakRetained error];
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v4);
}

void __79___HMDHTTPServerClientConnection__reallySendMessage_timeout_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v9 = (void *)MEMORY[0x1D9452090]();
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [WeakRetained shortDescription];
    id v13 = [*(id *)(a1 + 32) UUIDString];
    int v16 = 138544386;
    id v17 = v11;
    __int16 v18 = 2112;
    v19 = v12;
    __int16 v20 = 2112;
    v21 = v13;
    __int16 v22 = 2112;
    id v23 = v5;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@[%@] Received response to transaction '%@', %@, with error %@", (uint8_t *)&v16, 0x34u);
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v5;

  if (v6) {
    [v8 cancelWithError:v6];
  }
  else {
    [v8 finish];
  }
}

void __79___HMDHTTPServerClientConnection__reallySendMessage_timeout_completionHandler___block_invoke_55(id *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v5 = objc_loadWeakRetained(a1 + 6);
  if (v3)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = [WeakRetained shortDescription];
      v10 = [WeakRetained device];
      int v17 = 138544130;
      __int16 v18 = v8;
      __int16 v19 = 2112;
      __int16 v20 = v9;
      __int16 v21 = 2112;
      __int16 v22 = v10;
      __int16 v23 = 2112;
      id v24 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to send message to device, %@, with error: %@", (uint8_t *)&v17, 0x2Au);
    }
    [v5 cancelWithError:v3];
  }
  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    uint64_t v14 = [WeakRetained shortDescription];
    id v15 = [WeakRetained device];
    int v16 = [a1[4] UUIDString];
    int v17 = 138544130;
    __int16 v18 = v13;
    __int16 v19 = 2112;
    __int16 v20 = v14;
    __int16 v21 = 2112;
    __int16 v22 = v15;
    __int16 v23 = 2112;
    id v24 = v16;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@[%@] Sent message to device, %@, with transaction identifier: %@", (uint8_t *)&v17, 0x2Au);
  }
}

uint64_t __72___HMDHTTPServerClientConnection_sendMessage_timeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    v7 = (void *)WeakRetained;
    uint64_t WeakRetained = [(id)WeakRetained isCancelled];
    uint64_t v3 = (uint64_t)v7;
    if ((WeakRetained & 1) == 0)
    {
      [v7 setCompletionBlock:0];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      if (*(double *)(a1 + 72) - (v4 - *(double *)(a1 + 64)) <= 1.0) {
        double v5 = 1.0;
      }
      else {
        double v5 = *(double *)(a1 + 72);
      }
      [*(id *)(a1 + 32) _reallySendMessage:*(void *)(a1 + 40) timeout:*(void *)(a1 + 48) completionHandler:v5];
      uint64_t WeakRetained = [v7 finish];
      uint64_t v3 = (uint64_t)v7;
    }
  }
  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

void __72___HMDHTTPServerClientConnection_sendMessage_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained error];
  double v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F64ED0]])
  {
    double v5 = [WeakRetained error];
    uint64_t v6 = [v5 code];

    if (v6 != 13) {
      goto LABEL_8;
    }
    v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      v10 = [*(id *)(a1 + 32) shortDescription];
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@[%@] The request timed out, starting a lost connection timer", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v3 = [*(id *)(a1 + 32) lostConnectionTimer];
    [v3 resume];
  }
  else
  {
  }
LABEL_8:
  if (*(void *)(a1 + 40))
  {
    id v11 = [WeakRetained error];
    if (!v11)
    {
      id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23 description:@"Operation Cancelled" reason:@"Unable to send message" suggestion:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end