@interface HAPAccessoryServerBTLE200
@end

@implementation HAPAccessoryServerBTLE200

uint64_t __40___HAPAccessoryServerBTLE200_disconnect__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _disconnectWithDisconnectionError:0 completionHandler:0];
}

void __43___HAPAccessoryServerBTLE200_timerDidFire___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) pairingActivity];
}

void __64___HAPAccessoryServerBTLE200_securitySession_didCloseWithError___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) securitySession];

  if (v2 == v3)
  {
    v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = *(id *)(a1 + 40);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Security session did close with error: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) submitPairVerifyMetricWithError:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) setSecuritySession:0];
    if (([*(id *)(a1 + 40) _shouldIgnoreRetryDiscoveryError:*(void *)(a1 + 48)] & 1) == 0)
    {
      [*(id *)(a1 + 40) _updateLastKeyBagIdentityIndexFailingPVWithError:*(void *)(a1 + 48)];
      int v9 = [*(id *)(a1 + 40) shouldRetryPVDueToAuthenticationError:*(void *)(a1 + 48)];
      v10 = *(void **)(a1 + 40);
      if (v9)
      {
        v11 = [v10 clientQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __64___HAPAccessoryServerBTLE200_securitySession_didCloseWithError___block_invoke_1011;
        block[3] = &unk_1E69F4330;
        block[4] = *(void *)(a1 + 40);
        dispatch_async(v11, block);
      }
      else
      {
        [v10 _disconnectWithDisconnectionError:0 completionHandler:0];
        if (*(void *)(a1 + 48))
        {
          objc_msgSend(*(id *)(a1 + 40), "_cancelAllQueuedOperationsWithError:");
          [*(id *)(a1 + 40) _resumeAllOperations];
          [*(id *)(a1 + 40) updateResumeSessionID:0];
        }
      }
    }
  }
}

uint64_t __64___HAPAccessoryServerBTLE200_securitySession_didCloseWithError___block_invoke_1011(uint64_t a1)
{
  return [*(id *)(a1 + 32) _establishSecureSession];
}

void __53___HAPAccessoryServerBTLE200_securitySessionDidOpen___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) securitySession];

  if (v2 == v3)
  {
    v4 = [*(id *)(a1 + 40) accessoryCache];
    [v4 setLastKeyBagIdentityIndexFailingPV:0];

    id v5 = *(void **)(a1 + 40);
    v6 = [v5 identifier];
    [v5 associateAccessoryWithControllerKeyUsingAccessoryIdentifier:v6];

    v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = *(id *)(a1 + 40);
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = HMFGetLogIdentifier();
      uint64_t v11 = [*(id *)(a1 + 32) resumeSessionID];
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Security session is open with resumeSessionID %llu", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 40) submitPairVerifyMetricWithError:0];
    objc_msgSend(*(id *)(a1 + 40), "updateResumeSessionID:", objc_msgSend(*(id *)(a1 + 32), "resumeSessionID"));
    [*(id *)(a1 + 40) _notifyDelegatesOfConnectionState:1 withError:0];
    [*(id *)(a1 + 40) _resumeAllOperations];
  }
}

void __55___HAPAccessoryServerBTLE200_securitySessionIsOpening___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) securitySession];

  if (v2 == v3)
  {
    v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = *(id *)(a1 + 40);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      int v9 = v7;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Security session is opening", (uint8_t *)&v8, 0xCu);
    }
  }
}

void __74___HAPAccessoryServerBTLE200_securitySession_didReceiveSetupExchangeData___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) securitySession];

  if (v2 == v3)
  {
    v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = *(id *)(a1 + 40);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      int v9 = v7;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Request to send security session setup exchange", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 40) _handleSecuritySessionSetupExchangeData:*(void *)(a1 + 48)];
  }
}

void __55___HAPAccessoryServerBTLE200_authSession_authComplete___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v23 = v5;
    __int16 v24 = 2112;
    uint64_t v25 = v6;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Auth Complete with status: %@", buf, 0x16u);
  }
  v7 = [*(id *)(a1 + 40) userInfo];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if (!v8) {
    id v8 = *(id *)(a1 + 40);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __55___HAPAccessoryServerBTLE200_authSession_authComplete___block_invoke_993;
  v20[3] = &unk_1E69F46E0;
  v20[4] = *(void *)(a1 + 32);
  id v9 = v8;
  id v21 = v9;
  __55___HAPAccessoryServerBTLE200_authSession_authComplete___block_invoke_993((uint64_t)v20);
  uint64_t v10 = [*(id *)(a1 + 32) delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    int v12 = [*(id *)(a1 + 32) delegateQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55___HAPAccessoryServerBTLE200_authSession_authComplete___block_invoke_2;
    v18[3] = &unk_1E69F46E0;
    v13 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v13;
    dispatch_async(v12, v18);
  }
  else
  {
    __int16 v14 = (void *)MEMORY[0x1D944E080]();
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v23 = v17;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement accessoryServer:didFinishAuth:", buf, 0xCu);
    }
  }
}

void __55___HAPAccessoryServerBTLE200_authSession_authComplete___block_invoke_993(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    v2 = v3;
  }
}

void __55___HAPAccessoryServerBTLE200_authSession_authComplete___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didFinishAuth:*(void *)(a1 + 40)];
}

void __60___HAPAccessoryServerBTLE200_authSession_confirmUUID_token___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60___HAPAccessoryServerBTLE200_authSession_confirmUUID_token___block_invoke_2;
    block[3] = &unk_1E69F4708;
    id v5 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v14 = v5;
    id v15 = *(id *)(a1 + 48);
    dispatch_async(v4, block);
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement accessoryServer:confirmUUID:token:)", buf, 0xCu);
    }
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    int v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:1 userInfo:0];
    [v10 authSession:v11 authComplete:v12];
  }
}

void __60___HAPAccessoryServerBTLE200_authSession_confirmUUID_token___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) confirmUUID:*(void *)(a1 + 40) token:*(void *)(a1 + 48)];
}

void __65___HAPAccessoryServerBTLE200_authSession_authenticateUUID_token___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65___HAPAccessoryServerBTLE200_authSession_authenticateUUID_token___block_invoke_2;
    block[3] = &unk_1E69F4708;
    id v5 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v14 = v5;
    id v15 = *(id *)(a1 + 48);
    dispatch_async(v4, block);
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement accessoryServer:authenticateUUID:token:", buf, 0xCu);
    }
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    int v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:1 userInfo:0];
    [v10 authSession:v11 authComplete:v12];
  }
}

void __65___HAPAccessoryServerBTLE200_authSession_authenticateUUID_token___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) authenticateUUID:*(void *)(a1 + 40) token:*(void *)(a1 + 48)];
}

void __61___HAPAccessoryServerBTLE200_authSession_validateUUID_token___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    [*(id *)(a1 + 32) _suspendConnectionIdleTimer];
    v4 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61___HAPAccessoryServerBTLE200_authSession_validateUUID_token___block_invoke_2;
    block[3] = &unk_1E69F4708;
    id v5 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v14 = v5;
    id v15 = *(id *)(a1 + 48);
    dispatch_async(v4, block);
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement validateUUID:token1:token2:", buf, 0xCu);
    }
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    int v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:1 userInfo:0];
    [v10 authSession:v11 authComplete:v12];
  }
}

void __61___HAPAccessoryServerBTLE200_authSession_validateUUID_token___block_invoke_2(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [v2 authenticatedProtocolInfo];
  uint64_t v6 = [v5 modelName];
  [v7 accessoryServer:v2 validateUUID:v3 token:v4 model:v6];
}

uint64_t __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke_2;
  v4[3] = &unk_1E69F1BC8;
  v4[4] = v2;
  return [v2 _sendProtocolInfoServiceExchangeData:v1 completion:v4];
}

void __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v10;
      __int16 v27 = 2112;
      id v28 = v5;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@SW Auth failed, sending auth exchange with error: %@", buf, 0x16u);
    }
    id v11 = v5;
    int v12 = [v11 userInfo];
    uint64_t v13 = *MEMORY[0x1E4F28A50];
    id v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    id v15 = v11;
    if (v14)
    {
      uint64_t v16 = [v11 userInfo];
      id v15 = [v16 objectForKeyedSubscript:v13];
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke_986;
    v23[3] = &unk_1E69F46E0;
    v23[4] = *(void *)(a1 + 32);
    id v17 = v15;
    id v24 = v17;
    __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke_986((uint64_t)v23);
    uint64_t v18 = [*(id *)(a1 + 32) authSession];
    [v18 resetSession];

    if ([*(id *)(a1 + 32) _delegateRespondsToSelector:sel_accessoryServer_didFinishAuth_])
    {
      id v19 = [*(id *)(a1 + 32) delegateQueue];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke_2_989;
      v21[3] = &unk_1E69F46E0;
      v21[4] = *(void *)(a1 + 32);
      id v22 = v11;
      dispatch_async(v19, v21);
    }
  }
  else
  {
    v20 = [*(id *)(a1 + 32) authSession];
    [v20 handleAuthExchangeData:v6 withHeader:0];
  }
}

void __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke_986(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    id v2 = v3;
  }
}

void __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke_2_989(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didFinishAuth:*(void *)(a1 + 40)];
}

void __74___HAPAccessoryServerBTLE200__notifyDelegatesOfConnectionState_withError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didUpdateConnectionState:*(unsigned __int8 *)(a1 + 48) linkLayerType:3 withError:*(void *)(a1 + 40)];
}

void __61___HAPAccessoryServerBTLE200__notifyDelegatesPairingStopped___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v10 = v4;

  id v5 = *(id *)(a1 + 32);
  if ([v10 isHAPError] && objc_msgSend(v10, "code") == 1)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = [*(id *)(a1 + 32) domain];
    uint64_t v8 = objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, objc_msgSend(*(id *)(a1 + 32), "code"), 0);

    id v5 = (id)v8;
  }
  id v9 = [*(id *)(a1 + 40) delegate];
  [v9 accessoryServer:*(void *)(a1 + 40) didStopPairingWithError:v5];
}

void __61___HAPAccessoryServerBTLE200_tearDownSessionOnAuthCompletion__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) authSession];
  [v2 resetSession];

  [*(id *)(a1 + 32) setAuthenticated:1];
  [*(id *)(a1 + 32) setPairing:0];
  id v3 = -[HAPPairSetupSession initWithRole:pairSetupType:delegate:]([HAPPairSetupSession alloc], "initWithRole:pairSetupType:delegate:", 0, [*(id *)(a1 + 32) _getPairSetupType], *(void *)(a1 + 32));
  [*(id *)(a1 + 32) setPairSetupSession:v3];
}

void __45___HAPAccessoryServerBTLE200_provisionToken___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) authSession];
  [v2 sendTokenUpdateRequest:*(void *)(a1 + 40)];
}

void __58___HAPAccessoryServerBTLE200_continueAuthAfterValidation___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) authMethod] == 2)
  {
    id v6 = [*(id *)(a1 + 32) authSession];
    [v6 continueAuthAfterValidation:*(unsigned __int8 *)(a1 + 40)];

    return;
  }
  if (!*(unsigned char *)(a1 + 40)) {
    goto LABEL_14;
  }
  if ([*(id *)(a1 + 32) authMethod] == 4)
  {
    id v2 = *(void **)(a1 + 32);
    [v2 _continuePairingAfterMFiCertValidation];
    return;
  }
  if (!*(unsigned char *)(a1 + 40))
  {
LABEL_14:
    uint64_t v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:16 description:@"Pairing Failed." reason:@"User cancelled pairing" suggestion:0 underlyingError:0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58___HAPAccessoryServerBTLE200_continueAuthAfterValidation___block_invoke_2;
    v7[3] = &unk_1E69F46E0;
    v7[4] = *(void *)(a1 + 32);
    id v8 = v4;
    id v5 = v4;
    __58___HAPAccessoryServerBTLE200_continueAuthAfterValidation___block_invoke_2((uint64_t)v7);
    [*(id *)(a1 + 32) _pairingCompletedWithError:v5];

    return;
  }
  id v3 = *(void **)(a1 + 32);

  [v3 continuePairingAfterAuthPrompt];
}

void __58___HAPAccessoryServerBTLE200_continueAuthAfterValidation___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    id v2 = v3;
  }
}

void __51___HAPAccessoryServerBTLE200_authenticateAccessory__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) authSession];
  [v1 handleAuthExchangeData:0 withHeader:0];
}

void __47___HAPAccessoryServerBTLE200_getAccessoryInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) protocolInfoServiceSignatureCharacteristics];
  id v3 = [v2 instanceID];
  uint64_t v4 = +[HAPProtocolMessages constructInfoRequest:v3 outTID:*(void *)(*(void *)(a1 + 48) + 8) + 24];

  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47___HAPAccessoryServerBTLE200_getAccessoryInfo___block_invoke_2;
    v9[3] = &unk_1E69F1BA0;
    id v5 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v6;
    uint64_t v11 = *(void *)(a1 + 48);
    [v5 _sendProtocolInfoServiceExchangeData:v4 completion:v9];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:1 userInfo:0];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

void __47___HAPAccessoryServerBTLE200_getAccessoryInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_5:
    v7();
    goto LABEL_6;
  }
  id v8 = +[HAPProtocolMessages parseInfoResponse:v6 expectedTID:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) withHeader:0];
  [*(id *)(a1 + 32) setAuthenticatedProtocolInfo:v8];

  id v9 = *(void **)(a1 + 32);
  id v10 = [v9 authenticatedProtocolInfo];
  LODWORD(v9) = [v9 _validateProtocolInfo:v10];

  if (v9)
  {
    uint64_t v11 = [*(id *)(a1 + 32) authenticatedProtocolInfo];
    int v12 = [v11 protocolVersion];
    [*(id *)(a1 + 32) setVersion:v12];

    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_5;
  }
  uint64_t v13 = (void *)MEMORY[0x1D944E080]();
  id v14 = *(id *)(a1 + 32);
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    id v17 = [*(id *)(a1 + 32) authenticatedProtocolInfo];
    int v20 = 138543618;
    id v21 = v16;
    __int16 v22 = 2112;
    v23 = v17;
    _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@Protocol Info does not match: %@ Accessory out of compliance", (uint8_t *)&v20, 0x16u);
  }
  uint64_t v18 = *(void *)(a1 + 40);
  id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:7 userInfo:0];
  (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

LABEL_6:
}

void __88___HAPAccessoryServerBTLE200_pairSetupSession_didReceiveBackoffRequestWithTimeInterval___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) pairSetupSession];

  if (v2 == v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 48);
      int v9 = 138543618;
      id v10 = v7;
      __int16 v11 = 2048;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Pair Setup session request to backoff for %g seconds", (uint8_t *)&v9, 0x16u);
    }
    [*(id *)(a1 + 40) setBadPairSetupCode:1];
    [*(id *)(a1 + 40) setPairSetupBackoffTimeInterval:*(double *)(a1 + 48)];
  }
}

void __73___HAPAccessoryServerBTLE200_pairSetupSessionDidReceiveInvalidSetupCode___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) pairSetupSession];

  if (v2 == v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      int v9 = v7;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Pair Setup session invalid setup code", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 40) setBadPairSetupCode:1];
    [*(id *)(a1 + 40) setPairSetupBackoffTimeInterval:0.0];
  }
}

void __95___HAPAccessoryServerBTLE200_pairSetupSession_didReceiveSetupCodeRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) pairSetupSession];

  if (v2 == v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      int v9 = v7;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Request to get the pairing peer setup code", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 40) _handlePairingSetupCodeRequestWithCompletionHandler:*(void *)(a1 + 48)];
  }
}

void __69___HAPAccessoryServerBTLE200_pairSetupSession_didReceiveProductData___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) pairSetupSession];

  if (v2 == v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    [v4 setProductData:v5];
  }
}

void __64___HAPAccessoryServerBTLE200_pairSetupSession_didStopWithError___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) pairSetupSession];

  if (v2 == v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    [v4 _pairingCompletedWithError:v5];
  }
}

void __75___HAPAccessoryServerBTLE200_pairSetupSession_didReceiveSetupExchangeData___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) pairSetupSession];

  if (v2 == v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      int v9 = v7;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Request to send Pair Setup session setup exchange", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 40) _handlePairSetupSessionExchangeData:*(void *)(a1 + 48)];
  }
}

void __61___HAPAccessoryServerBTLE200_controlOutputStreamDidComplete___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionHandler];
  if (v2)
  {
    id v3 = v2;
    v2[2](v2, 0);
    [*(id *)(a1 + 32) setCompletionHandler:0];
    id v2 = (void (**)(void, void))v3;
  }
}

void __68___HAPAccessoryServerBTLE200_controlOutputStream_didCloseWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionHandler];
  if (v2)
  {
    id v3 = v2;
    v2[2](v2, *(void *)(a1 + 40));
    [*(id *)(a1 + 32) setCompletionHandler:0];
    id v2 = (void (**)(void, void))v3;
  }
}

void __105___HAPAccessoryServerBTLE200_controlOutputStream_didReceiveRequestToSendControlPacket_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "pendingRequests", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v8 = *(void **)(a1 + 40);
        int v9 = [v7 controlOutputStream];

        if (v8 == v9)
        {
          [*(id *)(a1 + 32) _sendControlPacket:*(void *)(a1 + 48) forRequest:v7 completionHandler:*(void *)(a1 + 56)];
          goto LABEL_14;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  uint64_t v10 = (void *)MEMORY[0x1D944E080]();
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    int v20 = v13;
    __int16 v21 = 2112;
    uint64_t v22 = v14;
    _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%{public}@No matching request for control output stream: %@", buf, 0x16u);
  }
  if (*(void *)(a1 + 56))
  {
    id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Invalid parameter." reason:@"No matching request for control output stream." suggestion:0 underlyingError:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_14:
  }
}

void __91___HAPAccessoryServerBTLE200_peripheral_didUpdateNotificationStateForCharacteristic_error___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    id v2 = (void *)MEMORY[0x1D944E080]();
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 48);
      int v13 = 138543618;
      uint64_t v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Received Notification updated confirmation for characteristics %@", (uint8_t *)&v13, 0x16u);
    }
    if (*(void *)(a1 + 56))
    {
      uint64_t v7 = (void *)MEMORY[0x1D944E080]();
      id v8 = *(id *)(a1 + 40);
      int v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        uint64_t v11 = *(void *)(a1 + 56);
        int v13 = 138543618;
        uint64_t v14 = v10;
        __int16 v15 = 2112;
        uint64_t v16 = v11;
        _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Notification Update failed with error: %@", (uint8_t *)&v13, 0x16u);
      }
    }
    uint64_t v12 = [*(id *)(a1 + 40) _characteristicForCBCharacteristic:*(void *)(a1 + 48)];
    if (v12) {
      [*(id *)(a1 + 40) _handleHAPNotificationStateUpdateForCharacteristic:v12 error:*(void *)(a1 + 56)];
    }
  }
}

void __78___HAPAccessoryServerBTLE200_peripheral_didWriteValueForCharacteristic_error___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v2 = objc_msgSend(*(id *)(a1 + 40), "characteristicWriteCompletionHandlers", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v20 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v8 = [v7 cbCharacteristic];
          char v9 = [v8 isEqual:*(void *)(a1 + 48)];

          if (v9)
          {
            [*(id *)(a1 + 40) _handleWriteCompletionForCharacteristic:v7 error:*(void *)(a1 + 56)];

            return;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

    uint64_t v10 = (void *)MEMORY[0x1D944E080]();
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v13;
      __int16 v26 = 2112;
      uint64_t v27 = v14;
      __int16 v15 = "%{public}@Received characteristic write confirmation from unmapped characteristic: %@";
      uint64_t v16 = v12;
      os_log_type_t v17 = OS_LOG_TYPE_INFO;
LABEL_14:
      _os_log_impl(&dword_1D4758000, v16, v17, v15, buf, 0x16u);
    }
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1D944E080]();
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = HMFGetLogIdentifier();
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v13;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      __int16 v15 = "%{public}@Received characteristic write for invalid peripheral: %@";
      uint64_t v16 = v12;
      os_log_type_t v17 = OS_LOG_TYPE_DEBUG;
      goto LABEL_14;
    }
  }
}

uint64_t __79___HAPAccessoryServerBTLE200_peripheral_didUpdateValueForCharacteristic_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result == 2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    return [v3 _handleUpdateValueForCharacteristic:v4 error:v5];
  }
  return result;
}

uint64_t __75___HAPAccessoryServerBTLE200_peripheral_didUpdateValueForDescriptor_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result == 2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    return [v3 _handleReadDescriptorValue:v4 error:v5];
  }
  return result;
}

uint64_t __87___HAPAccessoryServerBTLE200_peripheral_didDiscoverDescriptorsForCharacteristic_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result == 2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    return [v3 _handleDiscoveredCharacteristic:v4 error:v5];
  }
  return result;
}

uint64_t __84___HAPAccessoryServerBTLE200_peripheral_didDiscoverCharacteristicsForService_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result == 2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    return [v3 _handleDiscoveredCharacteristicsForService:v4 error:v5];
  }
  return result;
}

uint64_t __59___HAPAccessoryServerBTLE200_peripheral_didModifyServices___block_invoke(id *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a1[4] state];
  if (result == 2)
  {
    uint64_t result = [a1[5] count];
    if (result)
    {
      uint64_t v3 = (void *)MEMORY[0x1D944E080]();
      id v4 = a1[6];
      uint64_t v5 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = HMFGetLogIdentifier();
        id v7 = a1[5];
        *(_DWORD *)buf = 138543618;
        os_log_type_t v17 = v6;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_ERROR, "%{public}@Disconnecting on services changed: %@", buf, 0x16u);
      }
      if ([a1[6] isPairing])
      {
        id v8 = [MEMORY[0x1E4F28C58] hapErrorWithCode:24];
        uint64_t v10 = MEMORY[0x1E4F143A8];
        uint64_t v11 = 3221225472;
        uint64_t v12 = __59___HAPAccessoryServerBTLE200_peripheral_didModifyServices___block_invoke_958;
        int v13 = &unk_1E69F46E0;
        id v14 = a1[6];
        id v15 = v8;
        id v9 = v8;
        __59___HAPAccessoryServerBTLE200_peripheral_didModifyServices___block_invoke_958((uint64_t)&v10);
        objc_msgSend(a1[6], "setPairingDisconnectionError:", v9, v10, v11, v12, v13, v14);
      }
      return [a1[6] _disconnectWithDisconnectionError:0 completionHandler:0];
    }
  }
  return result;
}

void __59___HAPAccessoryServerBTLE200_peripheral_didModifyServices___block_invoke_958(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    id v2 = v3;
  }
}

uint64_t __61___HAPAccessoryServerBTLE200_peripheral_didDiscoverServices___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result == 2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    return [v3 _handleDiscoveredServices:v4 error:v5];
  }
  return result;
}

void __83___HAPAccessoryServerBTLE200__notifyDelegateOfSentPlaintextData_forCharacteristic___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBTLE:*(void *)(a1 + 32) willSendPlaintextPayload:*(void *)(a1 + 40) forCharacteristic:*(void *)(a1 + 48)];
}

void __96___HAPAccessoryServerBTLE200__notifyDelegateOfSentEncryptedAuthenticatedData_forCharacteristic___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBTLE:*(void *)(a1 + 32) willSendEncryptedAndAuthenticatedPayload:*(void *)(a1 + 40) forCharacteristic:*(void *)(a1 + 48)];
}

void __87___HAPAccessoryServerBTLE200__notifyDelegateOfReceivedPlaintextData_forCharacteristic___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBTLE:*(void *)(a1 + 32) didReceivePlaintextPayload:*(void *)(a1 + 40) forCharacteristic:*(void *)(a1 + 48)];
}

void __100___HAPAccessoryServerBTLE200__notifyDelegateOfReceivedEncryptedAuthenticatedData_forCharacteristic___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBTLE:*(void *)(a1 + 32) didReceiveEncryptedAndAuthenticatedPayload:*(void *)(a1 + 40) forCharacteristic:*(void *)(a1 + 48)];
}

void __80___HAPAccessoryServerBTLE200__generateBroadcastKey_queue_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, double a4, uint64_t a5, void *a6)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a3;
  id v12 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v14 = v12;
  id v15 = v14;
  if (!v14)
  {
    if (v11)
    {
      [WeakRetained setStateNumber:v11];
      long long v21 = [WeakRetained browser];
      long long v22 = [WeakRetained identifier];
      [v21 updateCachedStateForIdentifier:v22 stateNumber:v11];
    }
    if (v10)
    {
      if (*(unsigned char *)(a1 + 56) == 2)
      {
        v23 = [WeakRetained accessoryCache];
        uint64_t v24 = [v23 peripheralInfo];
        [v24 keyUpdatedTime];
        double v26 = v25;

        double Current = 1.0;
        if (v26 <= 0.0) {
          double Current = CFAbsoluteTimeGetCurrent();
        }
        uint64_t v28 = [WeakRetained browser];
        uint64_t v29 = [WeakRetained identifier];
        [v28 updateBroadcastKeyForIdentifier:v29 key:v10 keyUpdatedStateNumber:v11 keyUpdatedTime:Current];

        uint64_t v16 = (void *)MEMORY[0x1D944E080]();
        id v30 = WeakRetained;
        __int16 v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          v51 = v31;
          __int16 v52 = 2112;
          id v53 = v10;
          __int16 v54 = 2112;
          id v55 = v11;
          __int16 v56 = 2048;
          double v57 = Current;
          _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Saving the read broadcast key: %@, S#: %@ time: %f", buf, 0x2Au);
        }
        id v15 = 0;
        goto LABEL_13;
      }
      if ([WeakRetained _validateGeneratedBroadcastKey:v10])
      {
        double v38 = CFAbsoluteTimeGetCurrent();
        v39 = [WeakRetained browser];
        v40 = [WeakRetained identifier];
        [v39 updateBroadcastKeyForIdentifier:v40 key:v10 keyUpdatedStateNumber:v11 keyUpdatedTime:v38];

        uint64_t v16 = (void *)MEMORY[0x1D944E080]();
        id v41 = WeakRetained;
        __int16 v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          v51 = v42;
          __int16 v52 = 2112;
          id v53 = v10;
          __int16 v54 = 2112;
          id v55 = v11;
          __int16 v56 = 2048;
          double v57 = v38;
          _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Saving the read broadcast key: %@, S#: %@ time: %f", buf, 0x2Au);
        }
        id v15 = 0;
        char v32 = 1;
        goto LABEL_14;
      }
    }
    id v15 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9];
    if (!v15)
    {
      char v32 = 0;
      goto LABEL_15;
    }
  }
  uint64_t v16 = (void *)MEMORY[0x1D944E080]();
  id v17 = WeakRetained;
  __int16 v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v19 = HMFGetLogIdentifier();
    uint64_t v20 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 56)];
    *(_DWORD *)buf = 138543874;
    v51 = v19;
    __int16 v52 = 2112;
    id v53 = v20;
    __int16 v54 = 2112;
    id v55 = v15;
    _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate broadcast key with type: %@. Error: %@", buf, 0x20u);
  }
LABEL_13:
  char v32 = 0;
LABEL_14:

LABEL_15:
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __80___HAPAccessoryServerBTLE200__generateBroadcastKey_queue_withCompletionHandler___block_invoke_864;
  v43[3] = &unk_1E69F3328;
  v33 = *(NSObject **)(a1 + 32);
  id v34 = *(id *)(a1 + 40);
  id v44 = v10;
  id v45 = v11;
  double v48 = a4;
  char v49 = v32;
  id v46 = v15;
  id v47 = v34;
  id v35 = v15;
  id v36 = v11;
  id v37 = v10;
  dispatch_async(v33, v43);
}

uint64_t __80___HAPAccessoryServerBTLE200__generateBroadcastKey_queue_withCompletionHandler___block_invoke_864(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, double))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 48), *(double *)(a1 + 64));
}

void __79___HAPAccessoryServerBTLE200_generateBroadcastKey_queue_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _getProtocolInfoService];
  if (([v2 serviceProperties] & 4) != 0)
  {
    BOOL v5 = *(unsigned char *)(a1 + 56) == 2;
    uint64_t v6 = [*(id *)(a1 + 32) accessoryCache];
    id v7 = [v6 peripheralInfo];
    uint64_t v4 = [v7 broadcastKey];

    id v8 = [*(id *)(a1 + 32) accessoryCache];
    id v9 = [v8 peripheralInfo];
    id v10 = [v9 keyUpdatedStateNumber];

    id v11 = [*(id *)(a1 + 32) accessoryCache];
    id v12 = [v11 peripheralInfo];
    [v12 keyUpdatedTime];
    double v14 = v13;

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    int v16 = 0;
    double v17 = Current - v14;
    if (!*(unsigned char *)(a1 + 56) && v14 > 0.0 && v17 <= 604800.0)
    {
      if ([*(id *)(a1 + 32) connectReason] == 3)
      {
        int v16 = 0;
      }
      else
      {
        BOOL v5 = v4 == 0;
        __int16 v18 = (void *)MEMORY[0x1D944E080]();
        id v19 = *(id *)(a1 + 32);
        uint64_t v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          long long v21 = HMFGetLogIdentifier();
          long long v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
          *(_DWORD *)buf = 138544130;
          double v38 = v21;
          __int16 v39 = 2112;
          v40 = v22;
          __int16 v41 = 2112;
          v42 = v10;
          __int16 v43 = 2048;
          double v44 = v17;
          _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%{public}@Rate limiting BC key generation. BC Key Info: %@ / %@ / %.2fs", buf, 0x2Au);
        }
        int v16 = 1;
      }
    }
    if (*(unsigned char *)(a1 + 56) == 1 && v14 > 0.0 && v17 <= 86400.0)
    {
      BOOL v5 = v4 == 0;
      v23 = (void *)MEMORY[0x1D944E080]();
      id v24 = *(id *)(a1 + 32);
      double v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        double v26 = HMFGetLogIdentifier();
        uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
        *(_DWORD *)buf = 138544130;
        double v38 = v26;
        __int16 v39 = 2112;
        v40 = v27;
        __int16 v41 = 2112;
        v42 = v10;
        __int16 v43 = 2048;
        double v44 = v17;
        _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_ERROR, "%{public}@Rate limiting BC key refresh. BC Key Info: %@ / %@ / %.2fs", buf, 0x2Au);
      }
      int v16 = 1;
    }
    if (!v16 || v5)
    {
      if (v5) {
        uint64_t v29 = 2;
      }
      else {
        uint64_t v29 = *(unsigned __int8 *)(a1 + 56);
      }
      [*(id *)(a1 + 32) _generateBroadcastKey:v29 queue:*(void *)(a1 + 40) withCompletionHandler:*(void *)(a1 + 48)];
    }
    else
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __79___HAPAccessoryServerBTLE200_generateBroadcastKey_queue_withCompletionHandler___block_invoke_854;
      v30[3] = &unk_1E69F1B50;
      uint64_t v28 = *(NSObject **)(a1 + 40);
      id v33 = *(id *)(a1 + 48);
      id v31 = v4;
      id v32 = v10;
      double v34 = v14;
      dispatch_async(v28, v30);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79___HAPAccessoryServerBTLE200_generateBroadcastKey_queue_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E69F3B20;
    id v3 = *(NSObject **)(a1 + 40);
    id v36 = *(id *)(a1 + 48);
    dispatch_async(v3, block);
    uint64_t v4 = v36;
  }
}

uint64_t __79___HAPAccessoryServerBTLE200_generateBroadcastKey_queue_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
}

void __79___HAPAccessoryServerBTLE200_generateBroadcastKey_queue_withCompletionHandler___block_invoke_854(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:28 description:@"Not generating BC Keys" reason:@"Key generated in recent past" suggestion:@"Report the faulty accessory" underlyingError:0];
  (*(void (**)(double))(*(void *)(a1 + 48) + 16))(*(double *)(a1 + 56));
}

void __77___HAPAccessoryServerBTLE200_handleDisconnectionWithError_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  id v3 = (void *)MEMORY[0x1D944E080]();
  id v4 = *(id *)(a1 + 40);
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    uint64_t v7 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    __int16 v41 = v6;
    __int16 v42 = 2112;
    id v43 = v2;
    __int16 v44 = 2048;
    uint64_t v45 = v7;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@The connection disconnected with error = %@ duration = %.3f seconds", buf, 0x20u);
  }
  if ([*(id *)(a1 + 40) connectionState] == 1 && !v2)
  {
    id v8 = (void *)MEMORY[0x1D944E080]();
    id v9 = *(id *)(a1 + 40);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v41 = v11;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_INFO, "%{public}@Received a disconnection while a connection was in progress", buf, 0xCu);
    }
    id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2 description:@"Connection failed." reason:@"Connection was cancelled." suggestion:0 underlyingError:0];
  }
  [*(id *)(a1 + 40) setConnectionState:0];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __77___HAPAccessoryServerBTLE200_handleDisconnectionWithError_completionHandler___block_invoke_842;
  v38[3] = &unk_1E69F46E0;
  int8x16_t v35 = *(int8x16_t *)(a1 + 32);
  id v12 = (id)v35.i64[0];
  int8x16_t v39 = vextq_s8(v35, v35, 8uLL);
  __77___HAPAccessoryServerBTLE200_handleDisconnectionWithError_completionHandler___block_invoke_842((uint64_t)v38);
  [*(id *)(a1 + 40) _notifyDelegatesOfConnectionState:0 withError:v2];
  double v13 = [*(id *)(a1 + 40) connectionCompletionHandler];
  uint64_t v14 = MEMORY[0x1D944E2D0]();
  id v15 = (void *)v14;
  if (v14) {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v2);
  }

  [*(id *)(a1 + 40) setConnectionCompletionHandler:0];
  int v16 = [*(id *)(a1 + 40) discoveryContext];

  double v17 = *(void **)(a1 + 40);
  if (v16)
  {
    if (([v17 _cancelDiscoveryWithError:v2] & 1) == 0) {
      goto LABEL_19;
    }
  }
  else if ([v17 isPaired] & 1) != 0 || (objc_msgSend(*(id *)(a1 + 40), "isPairing"))
  {
    __int16 v18 = objc_msgSend(*(id *)(a1 + 40), "operationsReceivedDuringConnectionStateChange", *(_OWORD *)&v35);
    uint64_t v19 = [v18 count];

    if (!v19)
    {
LABEL_19:
      [*(id *)(a1 + 40) _resetWithError:v2];
      uint64_t v28 = 1;
      goto LABEL_24;
    }
    uint64_t v20 = (void *)MEMORY[0x1D944E080]();
    id v21 = *(id *)(a1 + 40);
    long long v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      id v24 = NSNumber;
      double v25 = [*(id *)(a1 + 40) operationsReceivedDuringConnectionStateChange];
      double v26 = objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
      *(_DWORD *)buf = 138543618;
      __int16 v41 = v23;
      __int16 v42 = 2112;
      id v43 = v26;
      _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_INFO, "%{public}@Rediscovering the accessory with %@ pending operations mid connection state change", buf, 0x16u);
    }
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    uint64_t v27 = *(void **)(a1 + 40);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __77___HAPAccessoryServerBTLE200_handleDisconnectionWithError_completionHandler___block_invoke_847;
    v36[3] = &unk_1E69F4420;
    objc_copyWeak(&v37, (id *)buf);
    [v27 _discoverWithType:0 completionHandler:v36];
    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v29 = (void *)MEMORY[0x1D944E080]();
    id v30 = *(id *)(a1 + 40);
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      id v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v41 = v32;
      _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_DEBUG, "%{public}@The accessory is unpaired and no pairing operation is in progress, not removing server on disconnection", buf, 0xCu);
    }
    [*(id *)(a1 + 40) _resetWithError:v2];
  }
  uint64_t v28 = 0;
LABEL_24:
  uint64_t v33 = MEMORY[0x1D944E2D0](*(void *)(a1 + 48));
  double v34 = (void *)v33;
  if (v33) {
    (*(void (**)(uint64_t, uint64_t))(v33 + 16))(v33, v28);
  }
}

void __77___HAPAccessoryServerBTLE200_handleDisconnectionWithError_completionHandler___block_invoke_842(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    id v2 = v3;
  }
}

void __77___HAPAccessoryServerBTLE200_handleDisconnectionWithError_completionHandler___block_invoke_847(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _invokeOperationsReceivedDuringConnectionStateChangeWithError:v3];
}

void __50___HAPAccessoryServerBTLE200_isReadyForOperation___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) connectionState])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    if ([*(id *)(a1 + 32) connectionState] == 3)
    {
      id v2 = (void *)MEMORY[0x1D944E080]();
      id v3 = *(id *)(a1 + 32);
      id v4 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        BOOL v5 = HMFGetLogIdentifier();
        int v8 = 138543362;
        id v9 = v5;
        _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory is in disconnecting state. Pending an operation block", (uint8_t *)&v8, 0xCu);
      }
      uint64_t v6 = [*(id *)(a1 + 32) operationsReceivedDuringConnectionStateChange];
      [v6 addObject:&__block_literal_global_835];
    }
    else if (*(void *)(a1 + 48))
    {
      uint64_t v7 = *(void **)(a1 + 32);
      [v7 _kickConnectionIdleTimer];
    }
  }
}

void __71___HAPAccessoryServerBTLE200_handleConnectionWithPeripheral_withError___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (HAPIsHH2Enabled_onceToken != -1) {
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
  }
  if (HAPIsHH2Enabled_hh2Enabled == 1
    && !*(void *)(a1 + 32)
    && [*(id *)(a1 + 40) connectionState] == 2)
  {
    id v2 = (void *)MEMORY[0x1D944E080]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 48);
      int v13 = 138543618;
      uint64_t v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      uint64_t v7 = "%{public}@Received a connection completion while already connected. Ignoring %@";
LABEL_15:
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v13, 0x16u);

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!*(void *)(a1 + 32) && [*(id *)(a1 + 48) state] != 2)
  {
    id v2 = (void *)MEMORY[0x1D944E080]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 48);
      int v13 = 138543618;
      uint64_t v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      uint64_t v7 = "%{public}@Received a connection with invalid connection state. Ignoring %@";
      goto LABEL_15;
    }
LABEL_16:

    return;
  }
  int v8 = [*(id *)(a1 + 40) peripheral];
  [v8 setDelegate:0];

  [*(id *)(a1 + 40) updatePeripheral:*(void *)(a1 + 48)];
  id v9 = [*(id *)(a1 + 40) peripheral];
  [v9 setDelegate:*(void *)(a1 + 40)];

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(a1 + 40);

  [v10 _handleConnectionWithError:v11];
}

uint64_t __55___HAPAccessoryServerBTLE200_updateConnectionIdleTime___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateConnectionIdleTime:*(unsigned __int8 *)(a1 + 40)];
}

void __82___HAPAccessoryServerBTLE200__disconnectWithDisconnectionError_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    id v2 = v3;
  }
}

void __57___HAPAccessoryServerBTLE200__cancelConnectionWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    id v2 = v3;
  }
}

void __59___HAPAccessoryServerBTLE200_connectWithCompletionHandler___block_invoke(id *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] connectionState];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59___HAPAccessoryServerBTLE200_connectWithCompletionHandler___block_invoke_2;
  v21[3] = &unk_1E69F1658;
  objc_copyWeak(v24, a1 + 6);
  v24[1] = (id)v2;
  id v4 = v3;
  id v22 = v4;
  id v23 = a1[5];
  BOOL v5 = (void (**)(void, void))MEMORY[0x1D944E2D0](v21);
  if (v2)
  {
    if ((v2 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      uint64_t v6 = (void *)MEMORY[0x1D944E080]();
      id v7 = a1[4];
      HMFGetOSLogHandle();
      int v8 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = [NSNumber numberWithInteger:v2];
        *(_DWORD *)buf = 138543618;
        id v26 = v9;
        __int16 v27 = 2112;
        uint64_t v28 = v10;
        _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Trying to connect but a connection is already in progress (%@)", buf, 0x16u);
      }
      uint64_t v11 = [MEMORY[0x1E4F28C58] hapErrorWithCode:4];
    }
    else
    {
      uint64_t v11 = 0;
    }
    ((void (**)(void, void *))v5)[2](v5, v11);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1D944E080]([a1[4] setConnectionCompletionHandler:v5]);
    id v13 = a1[4];
    HMFGetOSLogHandle();
    uint64_t v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = v12;
      HMFGetLogIdentifier();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [a1[4] blePeripheral];
      uint64_t v17 = [v16 shortDescription];
      __int16 v18 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(a1[4], "connectReason"));
      *(_DWORD *)buf = 138543874;
      id v26 = v15;
      __int16 v27 = 2112;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      id v30 = v18;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_INFO, "%{public}@Connecting to the peripheral: %@. Connection Reason: %@", buf, 0x20u);

      uint64_t v12 = v20;
    }

    uint64_t v19 = [a1[4] browser];
    [v19 connectToBTLEAccessoryServer:a1[4]];

    [a1[4] _restartConnectionIdleTimer:15.0];
    [a1[4] setConnectionState:1];
  }

  objc_destroyWeak(v24);
}

void __59___HAPAccessoryServerBTLE200_connectWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(void *)(a1 + 56) != 2)
  {
    BOOL v5 = [MEMORY[0x1E4F1C9C8] date];
    [v5 timeIntervalSinceDate:*(void *)(a1 + 32)];
    uint64_t v7 = v6;

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59___HAPAccessoryServerBTLE200_connectWithCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E69F2088;
    v10[4] = WeakRetained;
    uint64_t v12 = v7;
    id v11 = v3;
    __59___HAPAccessoryServerBTLE200_connectWithCompletionHandler___block_invoke_3((uint64_t)v10);
  }
  uint64_t v8 = MEMORY[0x1D944E2D0](*(void *)(a1 + 40));
  id v9 = (void *)v8;
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

void __59___HAPAccessoryServerBTLE200_connectWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v4 = v2;
    id v3 = (id)[NSNumber numberWithDouble:*(double *)(a1 + 48)];
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    uint64_t v2 = v4;
  }
}

void __70___HAPAccessoryServerBTLE200__handleSecuritySessionSetupExchangeData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = [v5 value];
  if (v6)
  {
    id v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = WeakRetained;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v20 = 138543618;
      id v21 = v12;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to send security session exchange data with error: %@", (uint8_t *)&v20, 0x16u);
    }
    id v13 = v6;
LABEL_10:
    uint64_t v14 = v13;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v15 = (void *)MEMORY[0x1D944E080]();
    id v16 = WeakRetained;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = HMFGetLogIdentifier();
      int v20 = 138543618;
      id v21 = v18;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@The security session exchange response value, %@, is invalid", (uint8_t *)&v20, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Security session setup exchange failed." reason:@"Invalid Pair Verify exchange response." suggestion:0 underlyingError:0];
    goto LABEL_10;
  }
  uint64_t v14 = 0;
LABEL_11:
  uint64_t v19 = [WeakRetained securitySession];
  [v19 receivedSetupExchangeData:v8 error:v14];

  [*(id *)(a1 + 32) setValue:0];
}

void __72___HAPAccessoryServerBTLE200_evaluateConnectionStateForOperation_block___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) connectionState] == 3
    || ([*(id *)(a1 + 32) operationsReceivedDuringConnectionStateChange],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        uint64_t v3 = [v2 count],
        v2,
        v3))
  {
    id v4 = [*(id *)(a1 + 32) operationsReceivedDuringConnectionStateChange];
    id v5 = (void *)MEMORY[0x1D944E2D0](*(void *)(a1 + 40));
    [v4 addObject:v5];

    id v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
      id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "connectionState"));
      uint64_t v12 = NSNumber;
      id v13 = [*(id *)(a1 + 32) operationsReceivedDuringConnectionStateChange];
      uint64_t v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
      *(_DWORD *)buf = 138544130;
      __int16 v18 = v9;
      __int16 v19 = 2112;
      int v20 = v10;
      __int16 v21 = 2112;
      __int16 v22 = v11;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Adding block for operation: %@ due to connection state: %@. Count: %@", buf, 0x2Au);
    }
  }
  else
  {
    id v15 = (void (**)(void))MEMORY[0x1D944E2D0](*(void *)(a1 + 40));
    if (v15)
    {
      id v16 = v15;
      v15[2]();
      id v15 = v16;
    }
  }
}

void __78___HAPAccessoryServerBTLE200__sendProtocolInfoServiceExchangeData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    uint64_t v8 = (void *)MEMORY[0x1D944E080]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v19 = 138543618;
      int v20 = v11;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to send Protocol Exchange error: %@", (uint8_t *)&v19, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if ([v5 statusCode])
    {
      uint64_t v12 = (void *)MEMORY[0x1D944E080]();
      id v13 = WeakRetained;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        int v19 = 138543618;
        int v20 = v15;
        __int16 v21 = 1024;
        LODWORD(v22) = [v5 statusCode];
        _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Protocol Exchange failed with status: %d", (uint8_t *)&v19, 0x12u);
      }
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:8 userInfo:0];
      (*(void (**)(uint64_t, void *, void))(v16 + 16))(v16, v17, 0);
    }
    else
    {
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v17 = [v5 body];
      (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v17);
    }
  }
}

void __67___HAPAccessoryServerBTLE200__reallySendRequest_completionHandler___block_invoke(id *a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = a1[4];
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = a1[5];
    *(_DWORD *)buf = 138543618;
    id v36 = v5;
    __int16 v37 = 2112;
    double v38 = v6;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Sending request: %@", buf, 0x16u);
  }
  id v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = a1[4];
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [a1[5] characteristic];
    uint64_t v12 = [v11 type];
    id v13 = [a1[5] characteristic];
    uint64_t v14 = [v13 instanceID];
    id v15 = [a1[5] serialize];
    *(_DWORD *)buf = 138544130;
    id v36 = v10;
    __int16 v37 = 2112;
    double v38 = v12;
    __int16 v39 = 2112;
    v40 = v14;
    __int16 v41 = 2112;
    __int16 v42 = v15;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Serialized Request '%@/%@' -> %@", buf, 0x2Au);
  }
  uint64_t v16 = [a1[4] _maximumControlWriteLengthForRequest:a1[5]];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = [HAPBTLETransactionIdentifier alloc];
    int v19 = [a1[5] identifier];
    int v20 = -[HAPBTLETransactionIdentifier initWithUnsignedCharValue:](v18, "initWithUnsignedCharValue:", [v19 unsignedCharValue]);

    __int16 v21 = [HAPBTLEControlOutputStream alloc];
    id v22 = [a1[5] serialize];
    uint64_t v23 = [(HAPBTLEControlOutputStream *)v21 initWithControlType:0 transactionIdentifier:v20 controlPayload:v22 mtuLength:v17 timeoutInterval:4.0];

    [(HAPBTLEControlOutputStream *)v23 setDelegate:a1[4]];
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    uint64_t v31 = __67___HAPAccessoryServerBTLE200__reallySendRequest_completionHandler___block_invoke_778;
    id v32 = &unk_1E69F3E20;
    id v33 = a1[4];
    id v34 = a1[6];
    [(HAPBTLEControlOutputStream *)v23 setCompletionHandler:&v29];
    objc_msgSend(a1[4], "_suspendConnectionIdleTimer", v29, v30, v31, v32, v33);
    [a1[5] setControlOutputStream:v23];
    uint64_t v24 = [a1[4] pendingRequests];
    [v24 addObject:a1[5]];

    [(HAPBTLEControlOutputStream *)v23 open];
LABEL_11:

    return;
  }
  uint64_t v25 = (void *)MEMORY[0x1D944E080]();
  id v26 = a1[4];
  __int16 v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    uint64_t v28 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v36 = v28;
    _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine the control write length", buf, 0xCu);
  }
  if (a1[6])
  {
    int v20 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1 description:@"Control write failed." reason:@"Failed to determine the control write length" suggestion:0 underlyingError:0];
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_11;
  }
}

void __67___HAPAccessoryServerBTLE200__reallySendRequest_completionHandler___block_invoke_778(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67___HAPAccessoryServerBTLE200__reallySendRequest_completionHandler___block_invoke_2;
  v7[3] = &unk_1E69F3C68;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __67___HAPAccessoryServerBTLE200__reallySendRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke_2;
    v6[3] = &unk_1E69F1A08;
    objc_copyWeak(&v9, (id *)(a1 + 56));
    id v7 = v3;
    id v8 = *(id *)(a1 + 40);
    [v4 _reallySendRequest:v5 completionHandler:v6];

    objc_destroyWeak(&v9);
  }
}

void __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke_3(id *a1)
{
  uint64_t v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = objc_loadWeakRetained(a1 + 7);
  uint64_t v5 = [WeakRetained clientQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke_4;
  v8[3] = &unk_1E69F1A80;
  v8[4] = WeakRetained;
  id v9 = a1[4];
  id v6 = a1[5];
  id v10 = v4;
  id v11 = v6;
  id v7 = v4;
  objc_copyWeak(&v12, v2);
  objc_copyWeak(&v13, a1 + 7);
  dispatch_async(v5, v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
}

void __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  id v3 = [*(id *)(a1 + 32) _pendingResponseForRequest:*(void *)(a1 + 40)];
  id v4 = [*(id *)v2 pendingRequests];
  [v4 removeObject:*(void *)(v2 + 8)];

  uint64_t v5 = [*(id *)v2 pendingResponses];
  [v5 removeObject:v3];

  uint64_t v6 = *(void *)(a1 + 56);
  if (v6)
  {
    id v7 = [*(id *)(a1 + 48) error];
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v3, v7);
  }
  if (![*(id *)(a1 + 32) _outstandingRequests])
  {
    id v8 = (void *)MEMORY[0x1D944E080]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v11;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Resuming connection idle timer as there are no outstanding requests", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _resumeConnectionIdleTimer];
  }
  id v12 = [*(id *)(a1 + 48) error];
  if (v12 && ([*(id *)(a1 + 32) _shouldIgnoreRetryDiscoveryError:v12] & 1) == 0)
  {
    id v13 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke_769;
    v14[3] = &unk_1E69F1A58;
    objc_copyWeak(&v15, (id *)(a1 + 64));
    objc_copyWeak(&v16, (id *)(a1 + 72));
    [v13 _disconnectWithDisconnectionError:0 completionHandler:v14];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
  }
}

void __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke_769(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x1D944E080]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v8;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to disconnect from the accessory, resetting the server", (uint8_t *)&v11, 0xCu);
    }
    id v9 = objc_loadWeakRetained((id *)(a1 + 40));
    id v10 = [v9 error];
    [v6 _resetWithError:v10];
  }
}

void __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke_2(id *a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (v7)
  {
    [a1[4] cancelWithError:v7];
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x1E4F65580]);
    [a1[5] timeoutInterval];
    uint64_t v5 = objc_msgSend(v4, "initWithTimeInterval:options:", 1);
    [v5 setDelegate:WeakRetained];
    id v6 = [WeakRetained clientQueue];
    [v5 setDelegateQueue:v6];

    [a1[5] setResponseTimer:v5];
    [WeakRetained _requestResponseForRequest:a1[5]];
  }
}

void __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (!v3)
  {
    int v11 = [WeakRetained identifyCharacteristic];
    if (v11)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke_2;
      v20[3] = &unk_1E69F19E0;
      id v12 = &v21;
      id v13 = *(id *)(a1 + 32);
      v20[4] = v5;
      id v21 = v13;
      uint64_t v14 = (void *)MEMORY[0x1D944E2D0](v20);
      [v5 _writeValue:MEMORY[0x1E4F1CC38] toCharacteristic:v11 authorizationData:0 contextData:0 options:0 completionHandler:v14];
    }
    else
    {
      id v15 = (void *)MEMORY[0x1D944E080]();
      id v16 = v5;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v18;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@Identify failed, missing the Identify characteristic", buf, 0xCu);
      }
      if (!*(void *)(a1 + 32))
      {
        int v11 = 0;
        goto LABEL_13;
      }
      uint64_t v19 = [v16 clientQueue];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke_764;
      v22[3] = &unk_1E69F3B20;
      id v12 = &v23;
      id v23 = *(id *)(a1 + 32);
      dispatch_async(v19, v22);
    }
LABEL_13:

    goto LABEL_14;
  }
  id v6 = (void *)MEMORY[0x1D944E080]();
  id v7 = v5;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v9;
    __int16 v29 = 2112;
    id v30 = v3;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Cancelling operation, identity discovery failed with error: %@", buf, 0x16u);
  }
  if (*(void *)(a1 + 32))
  {
    id v10 = [v7 clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke_757;
    block[3] = &unk_1E69F3C68;
    id v25 = v3;
    id v26 = *(id *)(a1 + 32);
    dispatch_async(v10, block);

    int v11 = v25;
    goto LABEL_13;
  }
LABEL_14:
}

void __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke_757(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2 description:@"Identify failed." reason:@"Discovery of the Identify characteristic failed." suggestion:0 underlyingError:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke_764(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Identify failed." reason:@"Missing Identify characteristic." suggestion:0 underlyingError:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 32) clientQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke_3;
    v6[3] = &unk_1E69F3C68;
    id v8 = *(id *)(a1 + 40);
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __72___HAPAccessoryServerBTLE200__sendPairingRequestData_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v6)
  {
    id v12 = [v5 value];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v15 = (void *)MEMORY[0x1D944E080]();
      id v16 = WeakRetained;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        int v20 = 138543362;
        id v21 = v18;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@Pairing operation failed, the response value is invalid", (uint8_t *)&v20, 0xCu);
      }
      if (*(void *)(a1 + 32))
      {
        uint64_t v19 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Pairing operation failed." reason:@"Pairing response is invalid." suggestion:0 underlyingError:0];
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      goto LABEL_10;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    if (!v14)
    {
LABEL_10:

      goto LABEL_11;
    }
    id v13 = *(void (**)(void))(v14 + 16);
LABEL_9:
    v13();
    goto LABEL_10;
  }
  id v8 = (void *)MEMORY[0x1D944E080]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v11 = HMFGetLogIdentifier();
    int v20 = 138543618;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to write pairing request data with error: %@", (uint8_t *)&v20, 0x16u);
  }
  if (*(void *)(a1 + 32))
  {
    id v12 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Pairing operation failed." reason:@"Pairing write failed." suggestion:0 underlyingError:v6];
    id v13 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_9;
  }
LABEL_11:
}

void __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke(id *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v22 = 0;
  id v2 = +[HAPPairingUtilities createListPairingsRequest:&v22];
  id v3 = v22;
  if (v2)
  {
    id v4 = a1 + 4;
    objc_initWeak((id *)location, a1[4]);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke_2;
    id v15 = &unk_1E69F19B8;
    objc_copyWeak(&v18, (id *)location);
    id v16 = a1[5];
    id v17 = a1[6];
    id v5 = (void *)MEMORY[0x1D944E2D0](&v12);
    objc_msgSend(*v4, "_sendPairingRequestData:completionHandler:", v2, v5, v12, v13, v14, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = a1[4];
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v9;
      __int16 v24 = 2112;
      id v25 = v3;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to create list pairings request payload with error: %@", location, 0x16u);
    }
    id v10 = a1[5];
    if (v10)
    {
      id v11 = a1[6];
      if (v11)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke_736;
        block[3] = &unk_1E69F3C68;
        id v21 = v11;
        id v20 = v3;
        dispatch_async(v10, block);
      }
    }
  }
}

uint64_t __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke_736(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    id v25 = 0;
    id v8 = +[HAPPairingUtilities parseListPairingsResponse:v5 error:&v25];
    id v9 = v25;
    if (!v8)
    {
      id v10 = (void *)MEMORY[0x1D944E080]();
      id v11 = WeakRetained;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v30 = v13;
        __int16 v31 = 2112;
        id v32 = v9;
        _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to list pairings, peer responded with error: %@", buf, 0x16u);
      }
    }
    uint64_t v14 = *(NSObject **)(a1 + 32);
    if (v14)
    {
      id v15 = *(void **)(a1 + 40);
      if (v15)
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke_744;
        v21[3] = &unk_1E69F4070;
        id v24 = v15;
        id v22 = v8;
        id v23 = v9;
        dispatch_async(v14, v21);
      }
    }

    goto LABEL_10;
  }
  id v16 = (void *)MEMORY[0x1D944E080]();
  id v17 = WeakRetained;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v30 = v19;
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get pairings with error: %@", buf, 0x16u);
  }
  id v20 = *(NSObject **)(a1 + 32);
  if (v20 && *(void *)(a1 + 40))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke_737;
    block[3] = &unk_1E69F3C68;
    id v27 = v6;
    id v28 = *(id *)(a1 + 40);
    dispatch_async(v20, block);

    id v9 = v27;
LABEL_10:
  }
}

void __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke_737(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"List pairings failed." reason:@"List pairings write failed." suggestion:0 underlyingError:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke_744(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke_734(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v42 = v8;
    __int16 v43 = 2112;
    id v44 = v3;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Request to remove current controller completed with error %@", buf, 0x16u);
  }
  id v9 = v3;
  id v10 = [v6 browser];
  id v11 = [v6 identifier];
  [v10 deRegisterAccessoryWithIdentifier:v11];

  uint64_t v12 = [v6 keyStore];
  uint64_t v13 = [v6 identifier];
  id v40 = 0;
  char v14 = [v12 removeAccessoryKeyForName:v13 error:&v40];
  id v15 = v40;

  if ((v14 & 1) == 0)
  {
    id v16 = (void *)MEMORY[0x1D944E080]();
    id v17 = v6;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v42 = v19;
      __int16 v43 = 2112;
      id v44 = v15;
      _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Failed to remove the current controller keychain entry with error: %@", buf, 0x16u);
    }
  }
  id v20 = [v6 keyStore];
  id v21 = [v6 identifier];
  id v39 = v15;
  char v22 = [v20 deletePeripheralIdentifierForAccessoryIdentifier:v21 error:&v39];
  id v23 = v39;

  if ((v22 & 1) == 0)
  {
    id v24 = (void *)MEMORY[0x1D944E080]();
    id v25 = v6;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      id v27 = HMFGetLogIdentifier();
      id v28 = [v25 identifier];
      *(_DWORD *)buf = 138543874;
      __int16 v42 = v27;
      __int16 v43 = 2112;
      id v44 = v28;
      __int16 v45 = 2112;
      id v46 = v23;
      _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Failed to remove the peripheral keychain entry for %@ with error: %@", buf, 0x20u);
    }
  }
  __int16 v29 = *(NSObject **)(a1 + 32);
  if (v29)
  {
    id v30 = *(void **)(a1 + 40);
    if (v30)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke_735;
      block[3] = &unk_1E69F3B20;
      id v38 = v30;
      dispatch_async(v29, block);

      __int16 v29 = *(NSObject **)(a1 + 32);
    }
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke_2;
  v33[3] = &unk_1E69F3E98;
  id v34 = v29;
  id v31 = *(id *)(a1 + 48);
  id v35 = v9;
  id v36 = v31;
  id v32 = v9;
  [v6 _disconnectWithDisconnectionError:0 completionHandler:v33];
}

uint64_t __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke_735(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke_2(uint64_t a1)
{
  id v1 = *(NSObject **)(a1 + 32);
  if (v1)
  {
    id v3 = *(void **)(a1 + 48);
    if (v3)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke_3;
      v4[3] = &unk_1E69F3C68;
      id v6 = v3;
      id v5 = *(id *)(a1 + 40);
      dispatch_async(v1, v4);
    }
  }
}

uint64_t __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) accessoryCache];
  id v3 = [v2 peripheralInfo];
  [v3 resetBroadcastKeyConfig];

  uint64_t v4 = *(void *)(a1 + 40);
  id v24 = 0;
  id v5 = +[HAPPairingUtilities createRemovePairingRequestForPairingIdentity:v4 error:&v24];
  id v6 = v24;
  if (v5)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_2;
    id v17 = &unk_1E69F3300;
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 48);
    id v20 = *(id *)(a1 + 56);
    id v7 = (void *)MEMORY[0x1D944E2D0](&v14);
    objc_msgSend(*(id *)(a1 + 32), "_sendPairingRequestData:completionHandler:", v5, v7, v14, v15, v16, v17, v18);

    id v8 = v19;
LABEL_3:

    goto LABEL_4;
  }
  id v9 = (void *)MEMORY[0x1D944E080]();
  id v10 = *(id *)(a1 + 32);
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v12;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create remove pairing request payload with error: %@", buf, 0x16u);
  }
  uint64_t v13 = *(NSObject **)(a1 + 48);
  if (v13 && *(void *)(a1 + 56))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_718;
    block[3] = &unk_1E69F3C68;
    id v22 = v6;
    id v23 = *(id *)(a1 + 56);
    dispatch_async(v13, block);

    id v8 = v22;
    goto LABEL_3;
  }
LABEL_4:
}

void __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_718(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Remove pairing failed." reason:@"Failed to create remove pairing request payload." suggestion:0 underlyingError:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v27 = 0;
    BOOL v7 = +[HAPPairingUtilities parseRemovePairingResponse:v5 error:&v27];
    id v8 = v27;
    if (v7)
    {
      id v9 = *(NSObject **)(a1 + 40);
      if (!v9) {
        goto LABEL_17;
      }
      id v10 = *(void **)(a1 + 48);
      if (!v10) {
        goto LABEL_17;
      }
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_2_733;
      v22[3] = &unk_1E69F3B20;
      id v11 = &v23;
      id v23 = v10;
      dispatch_async(v9, v22);
    }
    else
    {
      id v17 = (void *)MEMORY[0x1D944E080]();
      id v18 = *(id *)(a1 + 32);
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v32 = v20;
        __int16 v33 = 2112;
        id v34 = v8;
        _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove pairing, peer responded with error: %@", buf, 0x16u);
      }
      id v21 = *(NSObject **)(a1 + 40);
      if (!v21 || !*(void *)(a1 + 48)) {
        goto LABEL_17;
      }
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      id v24[2] = __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_729;
      v24[3] = &unk_1E69F3C68;
      id v11 = &v25;
      id v25 = v8;
      id v26 = *(id *)(a1 + 48);
      dispatch_async(v21, v24);
    }
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v12 = (void *)MEMORY[0x1D944E080]();
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v32 = v15;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove pairing with error: %@", buf, 0x16u);
  }
  id v16 = *(NSObject **)(a1 + 40);
  if (v16 && *(void *)(a1 + 48))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_725;
    block[3] = &unk_1E69F3C68;
    id v29 = v6;
    id v30 = *(id *)(a1 + 48);
    dispatch_async(v16, block);

    id v8 = v29;
    goto LABEL_17;
  }
LABEL_18:
}

void __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_725(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Remove pairing failed." reason:@"Remove pairing write failed." suggestion:0 underlyingError:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_729(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Remove pairing failed." reason:@"The peer failed to remove the pairing." suggestion:0 underlyingError:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_2_733(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v23 = 0;
  id v3 = +[HAPPairingUtilities createAddPairingRequestForPairingIdentity:v2 error:&v23];
  id v4 = v23;
  if (v3)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_2;
    id v16 = &unk_1E69F3300;
    id v5 = *(void **)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 40);
    id v18 = v5;
    id v19 = *(id *)(a1 + 56);
    id v6 = (void *)MEMORY[0x1D944E2D0](&v13);
    objc_msgSend(*(id *)(a1 + 40), "_sendPairingRequestData:completionHandler:", v3, v6, v13, v14, v15, v16, v17);

    BOOL v7 = v18;
LABEL_3:

    goto LABEL_4;
  }
  id v8 = (void *)MEMORY[0x1D944E080]();
  id v9 = *(id *)(a1 + 40);
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to create add pairing request payload with error: %@", buf, 0x16u);
  }
  uint64_t v12 = *(NSObject **)(a1 + 48);
  if (v12 && *(void *)(a1 + 56))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_701;
    block[3] = &unk_1E69F3C68;
    id v21 = v4;
    id v22 = *(id *)(a1 + 56);
    dispatch_async(v12, block);

    BOOL v7 = v21;
    goto LABEL_3;
  }
LABEL_4:
}

void __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_701(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Add pairing failed." reason:@"Failed to create add pairing request payload." suggestion:0 underlyingError:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v27 = 0;
    BOOL v7 = +[HAPPairingUtilities parseAddPairingResponse:v5 error:&v27];
    id v8 = v27;
    if (v7)
    {
      id v9 = *(NSObject **)(a1 + 40);
      if (!v9) {
        goto LABEL_17;
      }
      id v10 = *(void **)(a1 + 48);
      if (!v10) {
        goto LABEL_17;
      }
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_2_716;
      v22[3] = &unk_1E69F3B20;
      id v11 = &v23;
      id v23 = v10;
      dispatch_async(v9, v22);
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x1D944E080]();
      id v18 = *(id *)(a1 + 32);
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v32 = v20;
        __int16 v33 = 2112;
        id v34 = v8;
        _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to add pairing, peer responded with error: %@", buf, 0x16u);
      }
      id v21 = *(NSObject **)(a1 + 40);
      if (!v21 || !*(void *)(a1 + 48)) {
        goto LABEL_17;
      }
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      id v24[2] = __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_712;
      v24[3] = &unk_1E69F3C68;
      id v11 = &v25;
      id v25 = v8;
      id v26 = *(id *)(a1 + 48);
      dispatch_async(v21, v24);
    }
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v12 = (void *)MEMORY[0x1D944E080]();
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v32 = v15;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to add pairing with error: %@", buf, 0x16u);
  }
  id v16 = *(NSObject **)(a1 + 40);
  if (v16 && *(void *)(a1 + 48))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_708;
    block[3] = &unk_1E69F3C68;
    id v29 = v6;
    id v30 = *(id *)(a1 + 48);
    dispatch_async(v16, block);

    id v8 = v29;
    goto LABEL_17;
  }
LABEL_18:
}

void __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_708(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Add pairing failed." reason:@"Add pairing write failed." suggestion:0 underlyingError:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_712(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Add pairing failed." reason:@"The peer failed to add the pairing." suggestion:0 underlyingError:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_2_716(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57___HAPAccessoryServerBTLE200__pairingCompletedWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v6 = v5;

  id v7 = v3;
  id v8 = [v7 userInfo];
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  id v11 = v7;
  if (v10)
  {
    uint64_t v12 = [v7 userInfo];
    id v11 = [v12 objectForKeyedSubscript:v9];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57___HAPAccessoryServerBTLE200__pairingCompletedWithError___block_invoke_2;
  v16[3] = &unk_1E69F2088;
  v16[4] = *(void *)(a1 + 40);
  uint64_t v18 = v6;
  id v13 = v11;
  id v17 = v13;
  __57___HAPAccessoryServerBTLE200__pairingCompletedWithError___block_invoke_2((uint64_t)v16);
  uint64_t v14 = *(void **)(a1 + 40);
  if (v7)
  {
    uint64_t v15 = [v14 authSession];
    [v14 authSession:v15 authComplete:v7];
  }
  else
  {
    [v14 authenticateAccessory];
  }
}

void __57___HAPAccessoryServerBTLE200__pairingCompletedWithError___block_invoke_3(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [v3 authenticatedProtocolInfo];
  uint64_t v5 = [v4 modelName];
  [v6 accessoryServer:v3 validateCert:v2 model:v5];
}

void __57___HAPAccessoryServerBTLE200__pairingCompletedWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v4 = v2;
    id v3 = (id)[NSNumber numberWithDouble:*(double *)(a1 + 48)];
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    uint64_t v2 = v4;
  }
}

void __84___HAPAccessoryServerBTLE200_tryPairingPassword_onboardingSetupPayloadString_error___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) setupCodeCompletionHandler];
  if (v4)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2)
    {
      id v3 = 0;
    }
    else
    {
      id v3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Invalid setup code." reason:@"The setup code is nil" suggestion:0 underlyingError:0];
      uint64_t v2 = *(void *)(a1 + 40);
    }
    v4[2](v4, v2, v3);
    [*(id *)(a1 + 32) setSetupCodeCompletionHandler:0];
  }
  [*(id *)(a1 + 32) _resumeConnectionIdleTimer];
}

void __82___HAPAccessoryServerBTLE200__handlePairingSetupCodeRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void **)(a1 + 32);
  [v2 pairSetupBackoffTimeInterval];
  [v4 accessoryServer:v2 didReceiveBadPasswordThrottleAttemptsWithDelay:(uint64_t)v3];
}

void __82___HAPAccessoryServerBTLE200__handlePairingSetupCodeRequestWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) promptUserForPasswordWithType:1];
}

void __66___HAPAccessoryServerBTLE200__handlePairSetupSessionExchangeData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HAPPairingStateFromData(*(void **)(a1 + 32));
  uint64_t v5 = [v3 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if (!v6) {
    id v6 = v3;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66___HAPAccessoryServerBTLE200__handlePairSetupSessionExchangeData___block_invoke_2;
  v9[3] = &unk_1E69F4708;
  v9[4] = *(void *)(a1 + 40);
  id v10 = v4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v4;
  __66___HAPAccessoryServerBTLE200__handlePairSetupSessionExchangeData___block_invoke_2((uint64_t)v9);
}

void __66___HAPAccessoryServerBTLE200__handlePairSetupSessionExchangeData___block_invoke_679(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 value];
  if (v6)
  {
    id v8 = (void *)MEMORY[0x1D944E080]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v18 = 138543618;
      id v19 = v11;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to send Pair Setup exchange data with error: %@", (uint8_t *)&v18, 0x16u);
    }
    id v12 = v6;
LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = 0;
    goto LABEL_11;
  }
  id v13 = (void *)MEMORY[0x1D944E080]();
  id v14 = *(id *)(a1 + 32);
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    id v16 = HMFGetLogIdentifier();
    int v18 = 138543618;
    id v19 = v16;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@The Pair Setup exchange response value, %@, is invalid", (uint8_t *)&v18, 0x16u);
  }
  id v12 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Pairing Failed." reason:@"Invalid Pair Setup exchange response." suggestion:0 underlyingError:0];
  if (v12) {
    goto LABEL_5;
  }
LABEL_11:
  id v17 = [*(id *)(a1 + 32) pairSetupSession];
  [v17 receivedSetupExchangeData:v7 error:v12];

  [*(id *)(a1 + 40) setValue:0];
}

void __66___HAPAccessoryServerBTLE200__handlePairSetupSessionExchangeData___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 48) domain];

    [*(id *)(a1 + 48) code];
    id v2 = v3;
  }
}

void __51___HAPAccessoryServerBTLE200_stopPairingWithError___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isPairing])
  {
    id v12 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2 description:@"Pairing cancelled." reason:0 suggestion:0 underlyingError:0];
    id v2 = [*(id *)(a1 + 32) pairSetupSession];

    id v3 = *(void **)(a1 + 32);
    if (v2)
    {
      id v4 = [v3 pairSetupSession];
      [v4 stopWithError:v12];
    }
    else
    {
      [v3 _pairingCompletedWithError:v12];
    }
  }
  else if (![*(id *)(a1 + 32) pendingRemovePairing])
  {
    if ([*(id *)(a1 + 32) isPaired]) {
      goto LABEL_12;
    }
    id v5 = [*(id *)(a1 + 32) keyStore];
    id v6 = [*(id *)(a1 + 32) identifier];
    id v7 = [v5 readControllerPairingKeyForAccessory:v6 error:0];

    if (v7)
    {
LABEL_12:
      [*(id *)(a1 + 32) setPendingRemovePairing:1];
      uint64_t v8 = [*(id *)(a1 + 32) discoveryContext];
      if (!v8
        || (id v9 = (void *)v8, v10 = [*(id *)(a1 + 32) isSecuritySessionOpen], v9, v10))
      {
        id v11 = *(void **)(a1 + 32);
        [v11 _removePairingOfAccessoryServerCancelledMidPairing];
      }
    }
  }
}

uint64_t __60___HAPAccessoryServerBTLE200_continuePairingAfterAuthPrompt__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60___HAPAccessoryServerBTLE200_continuePairingAfterAuthPrompt__block_invoke_2;
  v3[3] = &unk_1E69F4380;
  v3[4] = v1;
  return [v1 connectWithCompletionHandler:v3];
}

void __60___HAPAccessoryServerBTLE200_continuePairingAfterAuthPrompt__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944E080]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, failed to connect to the accessory with error: %@", buf, 0x16u);
    }
    id v9 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2 description:@"Failed to connect to accessory." reason:0 suggestion:0 underlyingError:v3];
    [*(id *)(a1 + 32) _pairingCompletedWithError:v9];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = HMFGetLogIdentifier();
      unint64_t v11 = [*(id *)(a1 + 32) authMethod];
      if (v11 > 6) {
        id v12 = @"HAPAuthMethodUnknown";
      }
      else {
        id v12 = off_1E69EFD28[v11];
      }
      id v13 = v12;
      *(_DWORD *)buf = 138543618;
      id v17 = v10;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting the Pair Setup session with authMethods: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) setBadPairSetupCode:0];
    id v9 = -[HAPPairSetupSession initWithRole:pairSetupType:delegate:]([HAPPairSetupSession alloc], "initWithRole:pairSetupType:delegate:", 0, [*(id *)(a1 + 32) _getPairSetupType], *(void *)(a1 + 32));
    id v14 = [*(id *)(a1 + 32) browser];
    [v14 pauseScans];

    [*(id *)(a1 + 32) setPairSetupSession:v9];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60___HAPAccessoryServerBTLE200_continuePairingAfterAuthPrompt__block_invoke_664;
    v15[3] = &unk_1E69F4330;
    v15[4] = *(void *)(a1 + 32);
    __60___HAPAccessoryServerBTLE200_continuePairingAfterAuthPrompt__block_invoke_664((uint64_t)v15);
    [(HAPPairSetupSession *)v9 start];
  }
}

void __60___HAPAccessoryServerBTLE200_continuePairingAfterAuthPrompt__block_invoke_664(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 32) _getPairSetupType];
    id v2 = v3;
  }
}

void __71___HAPAccessoryServerBTLE200__getPairingFeaturesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if (!v7) {
    id v7 = v5;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71___HAPAccessoryServerBTLE200__getPairingFeaturesWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E69F2088;
  v10[4] = *(void *)(a1 + 32);
  uint64_t v12 = a2;
  id v8 = v7;
  id v11 = v8;
  __71___HAPAccessoryServerBTLE200__getPairingFeaturesWithCompletionHandler___block_invoke_2((uint64_t)v10);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
}

void __71___HAPAccessoryServerBTLE200__getPairingFeaturesWithCompletionHandler___block_invoke_653(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, failed to read the Pairing Features characteristic", buf, 0xCu);
    }
    id v11 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1 description:@"Pairing Failed." reason:@"Failed to read the Pairing Features characteristic" suggestion:0 underlyingError:v6];
    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v13 = 0;
    *(void *)buf = 0;
    [*(id *)(a1 + 32) _parsePairingFeaturesCharacteristic:*(void *)(a1 + 40) authMethod:buf error:&v13];
    id v11 = v13;
    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v12();
}

void __71___HAPAccessoryServerBTLE200__getPairingFeaturesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    id v2 = v3;
  }
}

void __50___HAPAccessoryServerBTLE200__checkForAuthPrompt___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944E080]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, failed to discover the accessory with error: %@", buf, 0x16u);
    }
    uint64_t v9 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2 description:@"Pairing Failed." reason:@"Failed to discovery the accessory." suggestion:0 underlyingError:v3];
    [*(id *)(a1 + 32) _pairingCompletedWithError:v9];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = HMFGetLogIdentifier();
      id v11 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Determining if MFi Pair Setup is supported, consentRequired: %@", buf, 0x16u);
    }
    uint64_t v12 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50___HAPAccessoryServerBTLE200__checkForAuthPrompt___block_invoke_633;
    v13[3] = &unk_1E69F1918;
    v13[4] = v12;
    char v14 = *(unsigned char *)(a1 + 40);
    [v12 _getPairingFeaturesWithCompletionHandler:v13];
  }
}

void __50___HAPAccessoryServerBTLE200__checkForAuthPrompt___block_invoke_633(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v49 = v9;
      __int16 v50 = 2112;
      v51 = v5;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, failed to get the pairing features with error: %@", buf, 0x16u);
    }
    int v10 = (void *)MEMORY[0x1E4F28C58];
    id v11 = @"Failed to get the pairing features.";
    uint64_t v12 = 2;
    id v13 = v5;
    goto LABEL_5;
  }
  if (a2 != 5 && a2)
  {
    id v29 = *(void **)(a1 + 32);
    if (a2 != 1 || !*(unsigned char *)(a1 + 40))
    {
      [v29 continuePairingAfterAuthPrompt];
      goto LABEL_6;
    }
    if ([v29 _delegateRespondsToSelector:sel_accessoryServer_requestUserPermission_accessoryInfo_error_])
    {
      id v30 = [HAPAccessoryInfo alloc];
      id v31 = [*(id *)(a1 + 32) name];
      id v32 = [*(id *)(a1 + 32) category];
      __int16 v33 = [(HAPAccessoryInfo *)v30 initWithName:v31 manufacturer:0 modelName:0 category:v32 certificationStatus:0 denylisted:0 ppid:0];

      id v34 = [*(id *)(a1 + 32) delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50___HAPAccessoryServerBTLE200__checkForAuthPrompt___block_invoke_644;
      block[3] = &unk_1E69F46E0;
      void block[4] = *(void *)(a1 + 32);
      id v44 = v33;
      uint64_t v35 = v33;
      dispatch_async(v34, block);

      id v36 = v44;
LABEL_27:

      goto LABEL_6;
    }
    id v25 = (void *)MEMORY[0x1D944E080]();
    id v26 = *(id *)(a1 + 32);
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      char v49 = v28;
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1D944E080]();
    id v16 = *(id *)(a1 + 32);
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      uint64_t v19 = off_1E69EFD28[a2];
      *(_DWORD *)buf = 138543618;
      char v49 = v18;
      __int16 v50 = 2112;
      v51 = v19;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "%{public}@Incompatible auth %@, prompting user", buf, 0x16u);
    }
    if ([*(id *)(a1 + 32) _delegateRespondsToSelector:sel_accessoryServer_requestUserPermission_accessoryInfo_error_])
    {
      uint64_t v20 = [HAPAccessoryInfo alloc];
      id v21 = [*(id *)(a1 + 32) name];
      uint64_t v22 = [*(id *)(a1 + 32) category];
      id v23 = [(HAPAccessoryInfo *)v20 initWithName:v21 manufacturer:0 modelName:0 category:v22 certificationStatus:0 denylisted:0 ppid:0];

      if (a2)
      {
        uint64_t v24 = 4;
      }
      else
      {
        __int16 v37 = (void *)MEMORY[0x1D944E080]();
        id v38 = *(id *)(a1 + 32);
        id v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          id v40 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          char v49 = v40;
          _os_log_impl(&dword_1D4758000, v39, OS_LOG_TYPE_INFO, "%{public}@The accessory does not support pair setup auth, prompting for user permission to pair the accessory", buf, 0xCu);
        }
        uint64_t v24 = 0;
      }
      __int16 v41 = [*(id *)(a1 + 32) delegateQueue];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __50___HAPAccessoryServerBTLE200__checkForAuthPrompt___block_invoke_640;
      v45[3] = &unk_1E69F2088;
      uint64_t v42 = *(void *)(a1 + 32);
      id v46 = v23;
      uint64_t v47 = v24;
      v45[4] = v42;
      uint64_t v35 = v23;
      dispatch_async(v41, v45);

      id v36 = v46;
      goto LABEL_27;
    }
    id v25 = (void *)MEMORY[0x1D944E080]();
    id v26 = *(id *)(a1 + 32);
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      char v49 = v28;
LABEL_16:
      _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, the pairing requires additional authentication and the delegate does not support additional authentication requests", buf, 0xCu);
    }
  }

  int v10 = (void *)MEMORY[0x1E4F28C58];
  id v11 = @"The delegate is missing.";
  uint64_t v12 = 9;
  id v13 = 0;
LABEL_5:
  char v14 = [v10 hapErrorWithCode:v12 description:@"Pairing Failed." reason:v11 suggestion:0 underlyingError:v13];
  [*(id *)(a1 + 32) _pairingCompletedWithError:v14];

LABEL_6:
}

void __50___HAPAccessoryServerBTLE200__checkForAuthPrompt___block_invoke_640(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) requestUserPermission:*(void *)(a1 + 48) accessoryInfo:*(void *)(a1 + 40) error:0];
}

void __50___HAPAccessoryServerBTLE200__checkForAuthPrompt___block_invoke_644(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) requestUserPermission:3 accessoryInfo:*(void *)(a1 + 40) error:0];
}

void __54___HAPAccessoryServerBTLE200_startPairingWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setPairingActivity:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setPairingRequest:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 32) isPaired])
  {
    id v2 = @"Pairing not supported on paired accessory.";
    id v3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:18 description:@"Pairing not supported on paired accessory." reason:0 suggestion:0 underlyingError:0];
  }
  else
  {
    id v3 = 0;
    id v2 = 0;
  }
  if ([*(id *)(a1 + 32) isPairing])
  {
    id v2 = @"An existing pairing session is already in progress.";
    uint64_t v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:4 description:@"An existing pairing session is already in progress." reason:0 suggestion:0 underlyingError:0];

    id v3 = (void *)v4;
  }
  id v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v18 = v9;
      __int16 v19 = 2112;
      uint64_t v20 = v2;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@%@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) _notifyDelegatesPairingStopped:v3];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v18 = v10;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting Pair Setup", buf, 0xCu);
    }
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __54___HAPAccessoryServerBTLE200_startPairingWithRequest___block_invoke_622;
    char v14 = &unk_1E69F46E0;
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(id *)(a1 + 48);
    __54___HAPAccessoryServerBTLE200_startPairingWithRequest___block_invoke_622((uint64_t)&v11);
    objc_msgSend(*(id *)(a1 + 32), "setPairingDisconnectionError:", 0, v11, v12, v13, v14, v15);
    [*(id *)(a1 + 32) setPairing:1];
    objc_msgSend(*(id *)(a1 + 32), "_checkForAuthPrompt:", objc_msgSend(*(id *)(a1 + 48), "requiresUserConsent"));
  }
}

void __54___HAPAccessoryServerBTLE200_startPairingWithRequest___block_invoke_622(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v4 = v2;
    [*(id *)(a1 + 40) requiresUserConsent];
    id v3 = (id)HMFBooleanToString();
    id v2 = v4;
  }
}

void __97___HAPAccessoryServerBTLE200__enableBroadcastEvent_interval_forCharacteristic_completionHandler___block_invoke(void **a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (v6)
  {
    id v8 = (void *)MEMORY[0x1D944E080]();
    id v9 = WeakRetained;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v11;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to configure characteristic with error: %@", buf, 0x16u);
    }
    _callCharacteristicOperationCompletion(a1[4], a1[5], 3, v6, @"Configure Characteristic request failed.");
  }
  else if ([v5 statusCode])
  {
    uint64_t v12 = (void *)MEMORY[0x1D944E080]();
    id v13 = WeakRetained;
    char v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v15;
      __int16 v32 = 1024;
      LODWORD(v33) = [v5 statusCode];
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Configure characteristic failed with status: %d", buf, 0x12u);
    }
    __int16 v17 = a1[4];
    id v16 = a1[5];
    id v18 = (void *)MEMORY[0x1E4F28C58];
    [v5 statusCode];
    uint64_t v28 = objc_msgSend(v18, "hapErrorWithCode:");
    _callCharacteristicOperationCompletion(v17, v16, 3, v28, @"Response with failure status code");
  }
  else
  {
    id v29 = 0;
    char v19 = [(id)objc_opt_class() parseCharacteristicConfigurationResponse:v5 error:&v29];
    id v20 = v29;
    if (v19)
    {
      _callCharacteristicOperationCompletion(a1[4], a1[5], 3, 0, 0);
    }
    else
    {
      uint64_t v21 = (void *)MEMORY[0x1D944E080]();
      id v22 = WeakRetained;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v31 = v24;
        __int16 v32 = 2112;
        id v33 = v20;
        _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse characteristic configuration response with error: %@", buf, 0x16u);
      }
      id v26 = a1[4];
      id v25 = a1[5];
      id v27 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12];
      _callCharacteristicOperationCompletion(v26, v25, 3, v27, @"Configure characteristic response invalid.");
    }
  }
}

void __84___HAPAccessoryServerBTLE200__configureCharacteristics_queue_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = HMFGetLogIdentifier();
      uint64_t v11 = [v5 instanceID];
      uint64_t v12 = [v5 type];
      int v14 = 138544130;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      __int16 v17 = v11;
      __int16 v18 = 2112;
      char v19 = v12;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Enable event response for characteristic %@/%@ with error: %@", (uint8_t *)&v14, 0x2Au);
    }
  }
  id v13 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v5 error:v6];
  [*(id *)(a1 + 40) addObject:v13];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __84___HAPAccessoryServerBTLE200__configureCharacteristics_queue_withCompletionHandler___block_invoke_605(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = (void *)MEMORY[0x1D944E080]();
  id v4 = WeakRetained;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@Completed multiple broadcast enable requests", buf, 0xCu);
  }
  id v7 = *(NSObject **)(a1 + 32);
  if (v7)
  {
    id v8 = *(void **)(a1 + 48);
    if (v8)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __84___HAPAccessoryServerBTLE200__configureCharacteristics_queue_withCompletionHandler___block_invoke_606;
      v9[3] = &unk_1E69F3C68;
      id v11 = v8;
      id v10 = *(id *)(a1 + 40);
      dispatch_async(v7, v9);
    }
  }
}

uint64_t __84___HAPAccessoryServerBTLE200__configureCharacteristics_queue_withCompletionHandler___block_invoke_606(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __83___HAPAccessoryServerBTLE200_configureCharacteristics_queue_withCompletionHandler___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83___HAPAccessoryServerBTLE200_configureCharacteristics_queue_withCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E69F3CE0;
  objc_copyWeak(&v7, &location);
  id v6 = *(id *)(a1 + 56);
  [v2 _configureCharacteristics:v3 queue:v4 withCompletionHandler:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __83___HAPAccessoryServerBTLE200_configureCharacteristics_queue_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v20 = a1;
  id v21 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "error", v20);

        if (!v13)
        {
          uint64_t v14 = (void *)MEMORY[0x1D944E080]();
          id v15 = WeakRetained;
          __int16 v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            __int16 v17 = HMFGetLogIdentifier();
            __int16 v18 = [v12 characteristic];
            *(_DWORD *)buf = 138543618;
            id v27 = v17;
            __int16 v28 = 2112;
            id v29 = v18;
            _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_INFO, "%{public}@Configured characteristic %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v9);
  }

  uint64_t v19 = *(void *)(v20 + 32);
  if (v19) {
    (*(void (**)(uint64_t, id, id))(v19 + 16))(v19, v7, v21);
  }
}

void __86___HAPAccessoryServerBTLE200__configureBroadcastKeyGeneration_service_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    id v11 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 64)];
    *(_DWORD *)buf = 138543874;
    __int16 v43 = v10;
    __int16 v44 = 2112;
    id v45 = v11;
    __int16 v46 = 2112;
    id v47 = v6;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Did configure for broadcast key generation type: %@ with error: %@", buf, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v6)
  {
    if (*(void *)(a1 + 48))
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = [NSString stringWithFormat:@"Failed to configure for broadcast key"];
      id v15 = @"Protocol config request failed.";
      __int16 v16 = v13;
      __int16 v17 = v14;
      id v18 = v6;
LABEL_11:
      id v25 = [v16 hapErrorWithCode:1 description:v17 reason:v15 suggestion:0 underlyingError:v18];

      (*(void (**)(double))(*(void *)(a1 + 48) + 16))(0.0);
LABEL_20:
    }
  }
  else
  {
    if (![v5 statusCode])
    {
      id v40 = 0;
      id v41 = 0;
      id v39 = 0;
      char v26 = [(id)objc_opt_class() parseProtocolConfigurationResponse:v5 key:&v41 stateNumber:&v40 error:&v39];
      id v27 = v41;
      id v28 = v40;
      id v25 = v39;
      if (v26)
      {
        uint64_t v29 = *(void *)(a1 + 48);
        if (v29)
        {
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          (*(void (**)(uint64_t, id, id, uint64_t, void, CFAbsoluteTime))(v29 + 16))(v29, v27, v28, 1, 0, Current);
        }
      }
      else
      {
        uint64_t v31 = (void *)MEMORY[0x1D944E080]();
        id v32 = WeakRetained;
        id v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          uint64_t v34 = v38 = v31;
          *(_DWORD *)buf = 138543618;
          __int16 v43 = v34;
          __int16 v44 = 2112;
          id v45 = v25;
          _os_log_impl(&dword_1D4758000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse protocol configuration response with error: %@", buf, 0x16u);

          uint64_t v31 = v38;
        }

        if (*(void *)(a1 + 48))
        {
          uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
          id v36 = [NSString stringWithFormat:@"Failed to configure service %@.", *(void *)(a1 + 40)];
          __int16 v37 = [v35 hapErrorWithCode:12 description:v36 reason:@"Protocol config response was invalid." suggestion:0 underlyingError:v25];

          (*(void (**)(double))(*(void *)(a1 + 48) + 16))(0.0);
        }
      }

      goto LABEL_20;
    }
    uint64_t v19 = (void *)MEMORY[0x1D944E080]();
    id v20 = WeakRetained;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      long long v22 = HMFGetLogIdentifier();
      int v23 = [v5 statusCode];
      *(_DWORD *)buf = 138543618;
      __int16 v43 = v22;
      __int16 v44 = 1024;
      LODWORD(v45) = v23;
      _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "%{public}@Protocol Config failed with status: %d", buf, 0x12u);
    }
    if (*(void *)(a1 + 48))
    {
      long long v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = [NSString stringWithFormat:@"Protocol Config failed"];
      id v15 = @"Response with failure status code";
      __int16 v16 = v24;
      __int16 v17 = v14;
      id v18 = 0;
      goto LABEL_11;
    }
  }
}

void __70___HAPAccessoryServerBTLE200__handleEventIndicationForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [v10 error];

        if (!v11)
        {
          uint64_t v12 = [v10 characteristic];
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  if ([v4 count]
    && [*(id *)(a1 + 32) _delegateRespondsToSelector:sel_accessoryServer_didUpdateValuesForCharacteristics_stateNumber_broadcast_])
  {
    id v13 = [*(id *)(a1 + 32) delegateQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70___HAPAccessoryServerBTLE200__handleEventIndicationForCharacteristic___block_invoke_2;
    v14[3] = &unk_1E69F46E0;
    void v14[4] = *(void *)(a1 + 32);
    id v15 = v4;
    dispatch_async(v13, v14);
  }
}

void __70___HAPAccessoryServerBTLE200__handleEventIndicationForCharacteristic___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = [v3 stateNumber];
  [v5 accessoryServer:v3 didUpdateValuesForCharacteristics:v2 stateNumber:v4 broadcast:0];
}

uint64_t __85___HAPAccessoryServerBTLE200__performEnableEvent_toCharacteristic_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, *(void *)(a1 + 32), a2);
  }
  return result;
}

uint64_t __89___HAPAccessoryServerBTLE200__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __89___HAPAccessoryServerBTLE200__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_567(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __89___HAPAccessoryServerBTLE200__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v18 = v10;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to enable events on characteristic with error %@", buf, 0x16u);
    }
  }
  else
  {
    [v5 setEventNotificationsEnabled:*(unsigned __int8 *)(a1 + 56)];
  }
  id v11 = *(void **)(a1 + 48);
  if (v11)
  {
    uint64_t v12 = *(NSObject **)(a1 + 40);
    if (v12)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __89___HAPAccessoryServerBTLE200__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_568;
      block[3] = &unk_1E69F4070;
      id v16 = v11;
      id v14 = v5;
      id v15 = v6;
      dispatch_async(v12, block);
    }
  }
}

uint64_t __89___HAPAccessoryServerBTLE200__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_568(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_547(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [v5 setEventNotificationsEnabled:*(unsigned char *)(a1 + 56) == 0];
    uint64_t v7 = [v5 service];
    id v8 = [v7 accessory];

    uint64_t v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      id v13 = [v8 instanceID];
      id v14 = [v5 instanceID];
      [v5 type];
      id v15 = v17 = v9;
      *(_DWORD *)buf = 138544386;
      __int16 v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      int v23 = v14;
      __int16 v24 = 2112;
      id v25 = v15;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Enable event response for characteristic %@/%@/%@ with error: %@", buf, 0x34u);

      uint64_t v9 = v17;
    }
  }
  id v16 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v5 error:v6];
  if (v16) {
    [*(id *)(a1 + 40) addObject:v16];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_548(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_2;
  v6[3] = &unk_1E69F1878;
  uint64_t v5 = *(void *)(a1 + 72);
  void v6[4] = v3;
  uint64_t v11 = v5;
  id v7 = v2;
  char v12 = *(unsigned char *)(a1 + 80);
  id v10 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  [v3 _readCharacteristicValues:v7 queue:v4 completionHandler:v6];
}

uint64_t __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_553(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_560(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], *(void *)(*(void *)(a1[6] + 8) + 40));
}

void __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v47 = a1;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v59 = (uint64_t)v10;
      __int16 v60 = 2112;
      uint64_t v61 = (uint64_t)v6;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to read characteristic values with error: %@", buf, 0x16u);

      a1 = v47;
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
  }
  else
  {
    __int16 v44 = 0;
    id v45 = v5;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v19 = v5;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v64 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v55;
      uint64_t v46 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v55 != v22) {
            objc_enumerationMutation(v19);
          }
          __int16 v24 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          id v25 = objc_msgSend(v24, "error", v44, v45);

          if (v25)
          {
            __int16 v26 = (void *)MEMORY[0x1D944E080]();
            id v27 = *(id *)(a1 + 32);
            uint64_t v28 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              uint64_t v29 = HMFGetLogIdentifier();
              [v24 characteristic];
              id v30 = v48 = v26;
              uint64_t v31 = [v30 shortDescription];
              [v24 error];
              v33 = id v32 = v19;
              *(_DWORD *)buf = 138543874;
              uint64_t v59 = (uint64_t)v29;
              __int16 v60 = 2112;
              uint64_t v61 = (uint64_t)v31;
              __int16 v62 = 2112;
              v63 = v33;
              _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to read value for characteristic, %@, with error: %@", buf, 0x20u);

              __int16 v26 = v48;
              id v19 = v32;

              a1 = v47;
              uint64_t v22 = v46;
            }

            uint64_t v34 = [v24 error];
            uint64_t v35 = *(void *)(*(void *)(a1 + 72) + 8);
            id v36 = *(void **)(v35 + 40);
            *(void *)(v35 + 40) = v34;
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v54 objects:v64 count:16];
      }
      while (v21);
    }

    __int16 v37 = (void *)MEMORY[0x1D944E080]();
    id v38 = *(id *)(a1 + 32);
    id v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      id v40 = HMFGetLogIdentifier();
      uint64_t v41 = [v19 count];
      *(_DWORD *)buf = 138543618;
      uint64_t v59 = (uint64_t)v40;
      __int16 v60 = 2048;
      uint64_t v61 = v41;
      _os_log_impl(&dword_1D4758000, v39, OS_LOG_TYPE_INFO, "%{public}@Read values for %lu Characteristics supporting Events", buf, 0x16u);
    }
    id v6 = v44;
    id v5 = v45;
    if ([*(id *)(a1 + 40) count]
      && [*(id *)(a1 + 32) _delegateRespondsToSelector:sel_accessoryServer_didUpdateValuesForCharacteristics_stateNumber_broadcast_])
    {
      uint64_t v42 = [*(id *)(a1 + 32) delegateQueue];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_551;
      v52[3] = &unk_1E69F46E0;
      __int16 v43 = *(void **)(a1 + 40);
      v52[4] = *(void *)(a1 + 32);
      id v53 = v43;
      dispatch_async(v42, v52);
    }
  }
  uint64_t v11 = (void *)MEMORY[0x1D944E080]();
  id v12 = *(id *)(a1 + 32);
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    id v15 = (void *)v14;
    id v16 = @"enable";
    if (!*(unsigned char *)(a1 + 80)) {
      id v16 = @"disable";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v59 = v14;
    __int16 v60 = 2112;
    uint64_t v61 = (uint64_t)v16;
    _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, "%{public}@Completed multiple %@ event requests", buf, 0x16u);
  }
  long long v17 = *(void **)(a1 + 64);
  if (v17)
  {
    long long v18 = *(NSObject **)(a1 + 48);
    if (v18)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_552;
      block[3] = &unk_1E69F3C68;
      id v51 = v17;
      id v50 = *(id *)(a1 + 56);
      dispatch_async(v18, block);
    }
  }
}

uint64_t __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_551(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [v3 stateNumber];
  [v2 accessoryServer:v3 didUpdateValuesForCharacteristics:v4 stateNumber:v5 broadcast:0];

  id v6 = *(void **)(a1 + 32);

  return [v6 setStateChanged:0];
}

uint64_t __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_552(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __90___HAPAccessoryServerBTLE200_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableEvents:*(unsigned __int8 *)(a1 + 64) forCharacteristics:*(void *)(a1 + 40) withCompletionHandler:*(void *)(a1 + 56) queue:*(void *)(a1 + 48)];
}

void __105___HAPAccessoryServerBTLE200__performTimedWriteExecuteForCharacteristic_value_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v6)
  {
    id v8 = (void *)MEMORY[0x1D944E080]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v11;
      __int16 v43 = 2114;
      id v44 = v6;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to execute write to characteristic with error: %{public}@", buf, 0x16u);
    }
    id v12 = *(void **)(a1 + 40);
    id v13 = *(id *)(a1 + 32);
    [v12 instanceID];

    [v6 domain];
    [v6 code];

    _callCharacteristicOperationCompletion(*(void **)(a1 + 40), *(void **)(a1 + 56), 2, v6, @"Execute timed write request failed.");
    goto LABEL_24;
  }
  if (![v5 statusCode])
  {
    id v21 = *(id *)(a1 + 48);
    uint64_t v22 = v21;
    if ((*(unsigned char *)(a1 + 72) & 2) != 0)
    {
      id v39 = 0;
      id v40 = v21;
      char v24 = [(id)objc_opt_class() parseWriteResponse:v5 value:&v40 error:&v39];
      id v23 = v40;

      id v25 = v39;
      __int16 v26 = v25;
      if ((v24 & 1) == 0)
      {
        id v30 = (void *)MEMORY[0x1D944E080]();
        id v31 = WeakRetained;
        id v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          id v33 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v42 = v33;
          __int16 v43 = 2114;
          id v44 = v26;
          _os_log_impl(&dword_1D4758000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse characteristic execute response with error: %{public}@", buf, 0x16u);
        }
        uint64_t v34 = *(void **)(a1 + 40);
        id v35 = *(id *)(a1 + 32);
        [v34 instanceID];

        [v26 domain];
        [v26 code];

        _callCharacteristicOperationCompletion(*(void **)(a1 + 40), *(void **)(a1 + 56), 2, v26, @"Execute timed write response invalid.");
        goto LABEL_23;
      }
    }
    else
    {
      id v23 = v21;
    }
    [*(id *)(a1 + 40) setValue:v23];
    [*(id *)(a1 + 40) instanceID];

    [v5 statusCode];
    id v27 = [*(id *)(a1 + 40) type];
    if (![v27 isEqualToString:@"0000001E-0000-1000-8000-0026BB765291"])
    {
      uint64_t v28 = [*(id *)(a1 + 40) type];
      if (![v28 isEqualToString:@"00000032-0000-1000-8000-0026BB765291"])
      {
        uint64_t v29 = [*(id *)(a1 + 40) type];
        if (![v29 isEqualToString:@"0000007C-0000-1000-8000-0026BB765291"])
        {
          __int16 v37 = [*(id *)(a1 + 40) type];
          char v38 = [v37 isEqualToString:@"00000067-0000-1000-8000-0026BB765291"];

          if ((v38 & 1) == 0) {
            [WeakRetained markNotifyingCharacteristicUpdatedforCharacteristic:*(void *)(a1 + 40)];
          }
          goto LABEL_19;
        }
      }
    }

LABEL_19:
    _callCharacteristicOperationCompletion(*(void **)(a1 + 40), *(void **)(a1 + 56), 2, 0, 0);
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v14 = (void *)MEMORY[0x1D944E080]();
  id v15 = WeakRetained;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    long long v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v42 = v17;
    __int16 v43 = 1024;
    LODWORD(v44) = [v5 statusCode];
    _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%{public}@Received response to prepare with status code: 0x%02x", buf, 0x12u);
  }
  [*(id *)(a1 + 40) instanceID];

  [v5 statusCode];
  long long v18 = *(void **)(a1 + 40);
  id v19 = *(void **)(a1 + 56);
  uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
  [v5 statusCode];
  id v36 = objc_msgSend(v20, "hapErrorWithCode:");
  _callCharacteristicOperationCompletion(v18, v19, 2, v36, @"Execute response returned non-zero status code.");

LABEL_24:
}

void __138___HAPAccessoryServerBTLE200__performTimedWritePrepareWithValue_toCharacteristic_authorizationData_contextData_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v25 = 138543618;
      __int16 v26 = v10;
      __int16 v27 = 2114;
      id v28 = v6;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare timed write to characteristic with error: %{public}@", (uint8_t *)&v25, 0x16u);
    }
    uint64_t v11 = *(void **)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    [v11 instanceID];

    [v6 domain];
    [v6 code];

    id v13 = *(void **)(a1 + 48);
    uint64_t v14 = *(void **)(a1 + 56);
    id v15 = @"Prepare timed write request failed.";
    id v16 = v6;
    goto LABEL_5;
  }
  if (![v5 statusCode])
  {
    id v13 = *(void **)(a1 + 48);
    uint64_t v14 = *(void **)(a1 + 56);
    id v16 = 0;
    id v15 = 0;
LABEL_5:
    _callCharacteristicOperationCompletion(v13, v14, 2, v16, v15);
    goto LABEL_11;
  }
  long long v17 = (void *)MEMORY[0x1D944E080]();
  id v18 = *(id *)(a1 + 32);
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = HMFGetLogIdentifier();
    int v25 = 138543618;
    __int16 v26 = v20;
    __int16 v27 = 1024;
    LODWORD(v28) = [v5 statusCode];
    _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Received response to prepare write with status code: 0x%02x", (uint8_t *)&v25, 0x12u);
  }
  [*(id *)(a1 + 48) instanceID];

  [v5 statusCode];
  uint64_t v22 = *(void **)(a1 + 48);
  id v21 = *(void **)(a1 + 56);
  id v23 = (void *)MEMORY[0x1E4F28C58];
  [v5 statusCode];
  char v24 = objc_msgSend(v23, "hapErrorWithCode:");
  _callCharacteristicOperationCompletion(v22, v21, 2, v24, @"Prepare timed write response returned non-zero status code.");

LABEL_11:
}

void __127___HAPAccessoryServerBTLE200__performTimedWriteValue_toCharacteristic_authorizationData_contextData_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) clientQueue];
  dispatch_assert_queue_V2(v6);

  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, *(void *)(a1 + 40), v5);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _performTimedWriteExecuteForCharacteristic:v10 value:*(void *)(a1 + 48) options:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
  }
  id v8 = [*(id *)(a1 + 32) requestOperationQueue];
  int v9 = [v8 isSuspended];

  if (v9) {
    [*(id *)(a1 + 32) _resumeAllOperations];
  }
}

void __122___HAPAccessoryServerBTLE200__performWriteValue_toCharacteristic_authorizationData_contextData_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!v6)
  {
    id v15 = *(id *)(a1 + 48);
    id v16 = v15;
    if ((*(unsigned char *)(a1 + 72) & 2) != 0)
    {
      id v31 = 0;
      id v32 = v15;
      char v18 = [(id)objc_opt_class() parseWriteResponse:v5 value:&v32 error:&v31];
      id v17 = v32;

      id v19 = v31;
      uint64_t v20 = v19;
      if ((v18 & 1) == 0)
      {
        int v25 = (void *)MEMORY[0x1D944E080]();
        id v26 = WeakRetained;
        __int16 v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          id v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v34 = v28;
          __int16 v35 = 2114;
          id v36 = v20;
          _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse characteristic write response with error: %{public}@", buf, 0x16u);
        }
        uint64_t v29 = *(void **)(a1 + 32);
        id v30 = *(id *)(a1 + 40);
        [v29 instanceID];

        [v20 domain];
        [v20 code];

        _callCharacteristicOperationCompletion(*(void **)(a1 + 32), *(void **)(a1 + 56), 2, v20, @"Write response failed.");
        goto LABEL_15;
      }
    }
    else
    {
      id v17 = v15;
    }
    [*(id *)(a1 + 32) setValue:v17];
    [*(id *)(a1 + 32) instanceID];

    [v5 statusCode];
    id v21 = +[HAPMetadata getSharedInstance];
    uint64_t v22 = [v21 characteristicTypesChangingTargetState];
    id v23 = [*(id *)(a1 + 32) type];
    char v24 = [v22 containsObject:v23];

    if ((v24 & 1) == 0) {
      [WeakRetained markNotifyingCharacteristicUpdatedforCharacteristic:*(void *)(a1 + 32)];
    }
    _callCharacteristicOperationCompletion(*(void **)(a1 + 32), *(void **)(a1 + 56), 2, 0, 0);
LABEL_15:

    goto LABEL_16;
  }
  id v8 = (void *)MEMORY[0x1D944E080]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 32) shortDescription];
    *(_DWORD *)buf = 138543874;
    uint64_t v34 = v11;
    __int16 v35 = 2112;
    id v36 = v12;
    __int16 v37 = 2114;
    id v38 = v6;
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to write to characteristic: %@ with error: %{public}@", buf, 0x20u);
  }
  id v13 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  [v13 instanceID];

  [v6 domain];
  [v6 code];

  _callCharacteristicOperationCompletion(*(void **)(a1 + 32), *(void **)(a1 + 56), 2, v6, @"Write request failed.");
LABEL_16:
}

void __98___HAPAccessoryServerBTLE200_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v1 = (id *)a1;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  if (*(double *)(a1 + 72) > 0.0)
  {
    uint64_t v2 = (void *)MEMORY[0x1D944E080]();
    id v3 = v1[4];
    uint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      id v6 = *(void **)(a1 + 72);
      *(_DWORD *)buf = 138543618;
      v66 = v5;
      __int16 v67 = 2048;
      v68 = v6;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Request timeouts are not supported, request may not timeout within %f seconds", buf, 0x16u);

      id v1 = (id *)a1;
    }
  }
  uint64_t v46 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1[5], "count"));
  uint64_t v7 = dispatch_group_create();
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v1[5];
  uint64_t v47 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
  int v9 = 0;
  if (v47)
  {
    uint64_t v44 = *(void *)v62;
    *(void *)&long long v8 = 138544386;
    long long v39 = v8;
    uint64_t v45 = v7;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v62 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        dispatch_group_enter(v7);
        BOOL v12 = [v11 writeType] == 1;
        if ([v11 includeResponseValue]) {
          uint64_t v13 = 3;
        }
        else {
          uint64_t v13 = 1;
        }
        int v14 = objc_msgSend(v11, "timedWrite", v39);
        uint64_t v15 = v13 | 4;
        if (!v14) {
          uint64_t v15 = v13;
        }
        uint64_t v48 = v15;
        id v16 = [v11 characteristic];
        [v16 instanceID];

        id v17 = (void *)MEMORY[0x1D944E080]();
        id v18 = v1[4];
        id v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = HMFGetLogIdentifier();
          id v21 = [v11 value];
          uint64_t v22 = [v11 characteristic];
          [v22 shortDescription];
          int v42 = v9;
          char v24 = v23 = v12;
          [v11 contextData];
          int v25 = v43 = v17;
          *(_DWORD *)buf = v39;
          v66 = v20;
          __int16 v67 = 2114;
          v68 = v21;
          __int16 v69 = 2114;
          v70 = v24;
          __int16 v71 = 2050;
          uint64_t v72 = v48;
          __int16 v73 = 2114;
          v74 = v25;
          _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_INFO, "%{public}@Writing value '%{public}@' for characteristic %{public}@ with writeOptions: %{public}tu contextData: %{public}@", buf, 0x34u);

          BOOL v12 = v23;
          int v9 = v42;

          id v1 = (id *)a1;
          id v17 = v43;
        }
        v9 |= v12;

        id v26 = v1[4];
        __int16 v27 = [v11 value];
        id v28 = [v11 characteristic];
        uint64_t v29 = [v11 authorizationData];
        id v30 = [v11 contextData];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __98___HAPAccessoryServerBTLE200_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_439;
        v57[3] = &unk_1E69F3D30;
        id v31 = v46;
        id v32 = v1[4];
        id v58 = v31;
        id v59 = v32;
        uint64_t v7 = v45;
        __int16 v60 = v45;
        [v26 _writeValue:v27 toCharacteristic:v28 authorizationData:v29 contextData:v30 options:v48 completionHandler:v57];
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
    }
    while (v47);
  }

  id v33 = [v1[4] clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98___HAPAccessoryServerBTLE200_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_440;
  block[3] = &unk_1E69F1788;
  id v34 = v1[6];
  id v35 = v1[4];
  id v36 = v1[5];
  id v50 = v34;
  id v51 = v35;
  id v52 = v36;
  char v56 = v9 & 1;
  id v53 = v1[7];
  id v37 = v1[8];
  id v54 = v46;
  id v55 = v37;
  id v38 = v46;
  dispatch_group_notify(v7, v33, block);
}

void __98___HAPAccessoryServerBTLE200_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_439(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v5 error:v6];
  uint64_t v8 = [*(id *)(a1 + 32) addObject:v7];
  if (v6)
  {
    int v9 = (void *)MEMORY[0x1D944E080](v8);
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      int v14 = v12;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Write response: %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __98___HAPAccessoryServerBTLE200_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_440(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D944E080]([*(id *)(a1 + 32) begin]);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "count"));
    uint64_t v7 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    id v18 = v5;
    __int16 v19 = 2114;
    uint64_t v20 = v6;
    __int16 v21 = 2114;
    uint64_t v22 = v7;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Completed %{public}@ write requests. ShouldDisconnect: %{public}@", buf, 0x20u);
  }
  [*(id *)(a1 + 32) markWithReason:@"Calling completion handler"];
  uint64_t v8 = *(NSObject **)(a1 + 56);
  if (v8)
  {
    int v9 = *(void **)(a1 + 72);
    if (v9)
    {
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      int v13 = __98___HAPAccessoryServerBTLE200_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_441;
      int v14 = &unk_1E69F3C68;
      id v16 = v9;
      id v15 = *(id *)(a1 + 64);
      dispatch_async(v8, &v11);
    }
  }
  if (*(unsigned char *)(a1 + 80))
  {
    [*(id *)(a1 + 32) markWithReason:@"Disconnecting"];
    [*(id *)(a1 + 40) _suspendConnectionIdleTimer];
    [*(id *)(a1 + 40) _handleConnectionIdleTimeout];
  }
  objc_msgSend(*(id *)(a1 + 32), "end", v11, v12, v13, v14);
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __98___HAPAccessoryServerBTLE200_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_441(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __84___HAPAccessoryServerBTLE200__readValueForCharacteristic_options_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (v6)
  {
    uint64_t v8 = (void *)MEMORY[0x1D944E080]([a1[4] setValue:0]);
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v11;
      __int16 v31 = 2114;
      id v32 = v6;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to read from characteristic with error: %{public}@", buf, 0x16u);
    }
    id v12 = a1[4];
    id v13 = a1[5];
    [v12 instanceID];

    [v6 domain];
    [v6 code];

    _callCharacteristicOperationCompletion(a1[4], a1[6], 1, v6, @"Read request failed.");
  }
  else
  {
    id v27 = 0;
    id v28 = 0;
    id v26 = 0;
    char v14 = [(id)objc_opt_class() parseReadResponse:v5 value:&v28 notificationContext:&v27 error:&v26];
    id v15 = v28;
    id v16 = v27;
    id v17 = v26;
    id v18 = a1[4];
    if (v14)
    {
      [v18 setValue:v15];
      [a1[4] setNotificationContext:v16];
      [a1[4] instanceID];

      [v5 statusCode];
      [WeakRetained _updatePropertiesFromCharacteristic:a1[4]];
      _callCharacteristicOperationCompletion(a1[4], a1[6], 1, 0, 0);
    }
    else
    {
      id v25 = v15;
      [v18 setValue:0];
      __int16 v19 = (void *)MEMORY[0x1D944E080]([a1[4] setNotificationContext:0]);
      id v20 = WeakRetained;
      __int16 v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v30 = v22;
        __int16 v31 = 2114;
        id v32 = v17;
        _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse characteristic read response with error: %{public}@", buf, 0x16u);
      }
      id v23 = a1[4];
      id v24 = a1[5];
      [v23 instanceID];

      [v17 domain];
      [v17 code];

      _callCharacteristicOperationCompletion(a1[4], a1[6], 1, v17, @"Read response invalid.");
      id v15 = v25;
    }
  }
}

void __80___HAPAccessoryServerBTLE200__readCharacteristicValues_queue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = [v5 instanceID];
      id v12 = [v5 type];
      int v14 = 138544130;
      id v15 = v10;
      __int16 v16 = 2114;
      id v17 = v11;
      __int16 v18 = 2114;
      __int16 v19 = v12;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Read response for characteristic %{public}@/%{public}@ with error: %{public}@", (uint8_t *)&v14, 0x2Au);
    }
  }
  id v13 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v5 error:v6];
  [*(id *)(a1 + 40) addObject:v13];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __80___HAPAccessoryServerBTLE200__readCharacteristicValues_queue_completionHandler___block_invoke_391(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Completed multiple read requests", buf, 0xCu);
  }
  id v6 = *(NSObject **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 56);
    if (v7)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __80___HAPAccessoryServerBTLE200__readCharacteristicValues_queue_completionHandler___block_invoke_392;
      v8[3] = &unk_1E69F3C68;
      id v10 = v7;
      id v9 = *(id *)(a1 + 48);
      dispatch_async(v6, v8);
    }
  }
}

uint64_t __80___HAPAccessoryServerBTLE200__readCharacteristicValues_queue_completionHandler___block_invoke_392(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __97___HAPAccessoryServerBTLE200_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = *v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        if ([v3 containsObject:v8])
        {
          id v17 = (void *)MEMORY[0x1D944E080]();
          id v18 = *(id *)(a1 + 40);
          __int16 v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            __int16 v20 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v33 = v20;
            __int16 v34 = 2114;
            uint64_t v35 = v8;
            _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Not sending requests due to duplicate characteristic: %{public}@", buf, 0x16u);
          }
          [*(id *)(a1 + 48) markWithReason:@"Calling completion handler"];
          if (*(void *)(a1 + 64))
          {
            id v21 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v22 = [NSString stringWithFormat:@"Duplicate characteristic read of %@.", v8];
            id v23 = [v21 hapErrorWithCode:11 description:v22 reason:@"Client requested to read characteristic twice." suggestion:0 underlyingError:0];

            (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          }
          [*(id *)(a1 + 48) end];
          [*(id *)(a1 + 48) invalidate];

          goto LABEL_19;
        }
        [v3 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  if (*(double *)(a1 + 72) > 0.0)
  {
    id v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v12;
      __int16 v34 = 2048;
      uint64_t v35 = v13;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Request timeouts are not supported, request may not timeout within %f seconds", buf, 0x16u);
    }
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  int v14 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  id v24[2] = __97___HAPAccessoryServerBTLE200_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_381;
  v24[3] = &unk_1E69F1738;
  uint64_t v16 = *(void *)(a1 + 56);
  id v25 = *(id *)(a1 + 48);
  objc_copyWeak(&v27, (id *)buf);
  id v26 = *(id *)(a1 + 64);
  [v14 _readCharacteristicValues:v15 queue:v16 completionHandler:v24];

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
LABEL_19:
}

void __97___HAPAccessoryServerBTLE200_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_381(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) begin];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = objc_msgSend(v5, "hmf_objectsPassingTest:", &__block_literal_global_384);
  if ([v8 count])
  {
    id v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = WeakRetained;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v15 = 138543618;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Read response: '%{public}@'", (uint8_t *)&v15, 0x16u);
    }
  }
  [*(id *)(a1 + 32) markWithReason:@"Calling completion handler"];
  uint64_t v13 = MEMORY[0x1D944E2D0](*(void *)(a1 + 40));
  int v14 = (void *)v13;
  if (v13) {
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);
  }

  [*(id *)(a1 + 32) end];
  [*(id *)(a1 + 32) invalidate];
}

BOOL __97___HAPAccessoryServerBTLE200_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 error];
  BOOL v3 = v2 == 0;

  return v3;
}

void __64___HAPAccessoryServerBTLE200__handleReadServiceSignature_error___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] pairingActivity];
  if (v2)
  {
    id v5 = v2;
    BOOL v3 = [a1[5] UUID];
    id v4 = (id)[v3 UUIDString];

    [a1[6] domain];
    [a1[6] code];
    uint64_t v2 = v5;
  }
}

void __71___HAPAccessoryServerBTLE200__handleReadCharacteristicSignature_error___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] pairingActivity];
  if (v2)
  {
    id v5 = v2;
    BOOL v3 = [a1[5] UUID];
    id v4 = (id)[v3 UUIDString];

    [a1[6] domain];
    [a1[6] code];
    uint64_t v2 = v5;
  }
}

void __52___HAPAccessoryServerBTLE200__readServiceSignature___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 && *(void *)(a1 + 32))
  {
    uint64_t v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = *(id *)(a1 + 40);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v30 = v10;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get signature from service with error: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) _handleReadServiceSignature:*(void *)(a1 + 32) error:v6];
  }
  else
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    id v28 = 0;
    int v14 = [v11 parseServiceSignatureResponse:v5 serviceInstanceID:v12 serviceType:v13 error:&v28];
    id v15 = v28;
    if (v14 || !*(void *)(a1 + 32))
    {
      uint64_t v16 = (void *)MEMORY[0x1D944E080]();
      id v17 = *(id *)(a1 + 40);
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        __int16 v20 = [v14 description];
        *(_DWORD *)buf = 138543618;
        long long v30 = v19;
        __int16 v31 = 2112;
        id v32 = v20;
        _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);
      }
      id v21 = [*(id *)(a1 + 40) discoveryContext];
      uint64_t v22 = [v21 serviceSignatures];
      [v22 setObject:v14 forKey:*(void *)(a1 + 32)];

      id v23 = 0;
    }
    else
    {
      id v24 = (void *)MEMORY[0x1D944E080]();
      id v25 = *(id *)(a1 + 40);
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v30 = v27;
        __int16 v31 = 2112;
        id v32 = v15;
        _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse service signature response with error: %@", buf, 0x16u);
      }
      id v23 = v15;
    }
    [*(id *)(a1 + 40) _handleReadServiceSignature:*(void *)(a1 + 32) error:v23];
  }
}

void __59___HAPAccessoryServerBTLE200__readCharacteristicSignature___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get signature from characteristic with error: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) _handleReadCharacteristicSignature:*(void *)(a1 + 40) error:v6];
  }
  else
  {
    id v22 = 0;
    uint64_t v11 = [(id)objc_opt_class() parseSignatureResponse:v5 error:&v22];
    id v12 = v22;
    if (v11)
    {
      uint64_t v13 = [*(id *)(a1 + 32) discoveryContext];
      int v14 = [v13 characteristicSignatures];
      [v14 setObject:v11 forKey:*(void *)(a1 + 40)];

      id v15 = *(void **)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      id v17 = 0;
    }
    else
    {
      id v18 = (void *)MEMORY[0x1D944E080]();
      id v19 = *(id *)(a1 + 32);
      __int16 v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v24 = v21;
        __int16 v25 = 2112;
        id v26 = v12;
        _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse characteristic signature response with error: %@", buf, 0x16u);
      }
      id v15 = *(void **)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      id v17 = v12;
    }
    [v15 _handleReadCharacteristicSignature:v16 error:v17];
  }
}

uint64_t __55___HAPAccessoryServerBTLE200__handleCompletedDiscovery__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __45___HAPAccessoryServerBTLE200__retryDiscovery__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v4 = v2;
    id v3 = (id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "discoveryRetries"));
    uint64_t v2 = v4;
  }
}

uint64_t __56___HAPAccessoryServerBTLE200__cancelDiscoveryWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v7 = v6;

  id v8 = [v3 userInfo];
  id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (!v11) {
    id v9 = v3;
  }
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke_2;
  __int16 v20 = &unk_1E69F1630;
  uint64_t v12 = *(void *)(a1 + 56);
  id v21 = WeakRetained;
  uint64_t v23 = v12;
  uint64_t v24 = v7;
  id v13 = v9;
  id v22 = v13;
  __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke_2((uint64_t)&v17);
  int v14 = objc_msgSend(WeakRetained, "discoveryContext", v17, v18, v19, v20, v21);
  [v14 setDiscovering:0];

  uint64_t v15 = MEMORY[0x1D944E2D0](*(void *)(a1 + 40));
  uint64_t v16 = (void *)v15;
  if (v15) {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v3);
  }

  [WeakRetained incrementHAPBTLEMetricsDiscoveryCount];
}

void __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke_211(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    id v5 = (void *)MEMORY[0x1D944E080]();
    id v6 = WeakRetained;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138543874;
      __int16 v25 = v8;
      __int16 v26 = 2112;
      uint64_t v27 = v9;
      __int16 v28 = 2112;
      id v29 = v3;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to connect to the accessory during discovery type: %@ with error: %@", buf, 0x20u);
    }
    id v10 = [*(id *)(a1 + 32) completionHandler];
    if (v10)
    {
      id v11 = [v6 clientQueue];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke_212;
      v21[3] = &unk_1E69F3C68;
      id v22 = v3;
      id v23 = v10;
      dispatch_async(v11, v21);
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = (void *)MEMORY[0x1D944E080]();
    id v14 = WeakRetained;
    uint64_t v15 = HMFGetOSLogHandle();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v12 == 3)
    {
      if (v16)
      {
        uint64_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v25 = v17;
        _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%{public}@Ack-ed accessory notification", buf, 0xCu);
      }
      [v14 _cancelDiscoveryWithError:0];
      [v14 _disconnectWithDisconnectionError:0 completionHandler:0];
    }
    else
    {
      if (v16)
      {
        uint64_t v18 = HMFGetLogIdentifier();
        id v19 = *(void **)(a1 + 48);
        __int16 v20 = [v14 peripheral];
        *(_DWORD *)buf = 138543874;
        __int16 v25 = v18;
        __int16 v26 = 2050;
        uint64_t v27 = v19;
        __int16 v28 = 2114;
        id v29 = v20;
        _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%{public}@Starting attribute database discovery type: %{public}tu via %{public}@", buf, 0x20u);
      }
      [v14 _discoverServices];
    }
  }
}

void __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke_212(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:8 description:@"Discovery failed." reason:@"Failed to connect." suggestion:0 underlyingError:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v5 = v2;
    id v3 = (id)[NSNumber numberWithInteger:*(void *)(a1 + 48)];
    id v4 = (id)[NSNumber numberWithDouble:*(double *)(a1 + 56)];
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    id v2 = v5;
  }
}

uint64_t __86___HAPAccessoryServerBTLE200__readPendingDiscoveredCharacteristicTypesWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 32) count];
  if (!result)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  return result;
}

void __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_2;
  v25[3] = &unk_1E69F15E0;
  objc_copyWeak(&v26, &location);
  id v3 = (void (**)(void, void, void))MEMORY[0x1D944E2D0](v25);
  if ([*v2 isPaired])
  {
    if (*(void *)(a1 + 40))
    {
      id v4 = [*(id *)(a1 + 32) discoveredAccessoryCharacteristicsPendingRead];
      [v4 addObjectsFromArray:*(void *)(a1 + 40)];
    }
    id v5 = [*(id *)(a1 + 32) discoveryContext];
    int v6 = [v5 isDiscovering];

    if (v6)
    {
      uint64_t v7 = (void *)MEMORY[0x1D944E080]();
      id v8 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v11 = NSNumber;
        uint64_t v12 = [*(id *)(a1 + 32) discoveryContext];
        objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "discoveryType"));
        id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        id v29 = v10;
        __int16 v30 = 2112;
        __int16 v31 = v13;
        __int16 v32 = 2112;
        uint64_t v33 = v14;
        _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Discovering in progress for type: %@. Pending characteristic types to read: %@", buf, 0x20u);
      }
    }
    else
    {
      int v20 = [*(id *)(a1 + 32) connectReason];
      id v21 = *(void **)(a1 + 32);
      if (v20 == 2)
      {
        [*(id *)(a1 + 32) setHasBeenDiscovered:1];
        [*(id *)(a1 + 32) _discoverWithType:3 completionHandler:0];
      }
      else
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_198;
        v22[3] = &unk_1E69F1608;
        objc_copyWeak(&v24, &location);
        id v23 = v3;
        [v21 _discoverWithType:2 completionHandler:v22];

        objc_destroyWeak(&v24);
      }
    }
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1D944E080]();
    id v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    uint64_t v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v18;
      __int16 v30 = 2112;
      __int16 v31 = @"Discovery on an unpaired accessory is not allowed";
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@%@", buf, 0x16u);
    }
    id v19 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:@"Discovery on an unpaired accessory is not allowed" reason:0 suggestion:0 underlyingError:0];
    ((void (**)(void, void, void *))v3)[2](v3, 0, v19);
  }
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained pendingRemovePairing] == 1)
  {
    [WeakRetained _removePairingOfAccessoryServerCancelledMidPairing];
  }
  else
  {
    [WeakRetained setHasBeenDiscovered:v5 == 0];
    if ([WeakRetained _delegateRespondsToSelector:sel_accessoryServer_didDiscoverAccessories_transaction_error_])
    {
      uint64_t v7 = [WeakRetained delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_3;
      block[3] = &unk_1E69F2938;
      char v10 = a2;
      void block[4] = WeakRetained;
      id v9 = v5;
      dispatch_async(v7, block);
    }
  }
}

void __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_198(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    id v5 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1 description:@"Discovery failed" reason:0 suggestion:0 underlyingError:v3];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_2_202;
    v6[3] = &unk_1E69F1608;
    objc_copyWeak(&v8, (id *)(a1 + 40));
    id v7 = *(id *)(a1 + 32);
    [WeakRetained _discoverWithType:0 completionHandler:v6];

    objc_destroyWeak(&v8);
  }
}

void __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_2_202(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    id v5 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1 description:@"Discovery failed" reason:0 suggestion:0 underlyingError:v3];
    (*(void (**)(void, uint64_t, void *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [WeakRetained isIncompatibleUpdate], v5);
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_3_203;
    v7[3] = &unk_1E69F4270;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    id v6 = *(id *)(a1 + 32);
    id v8 = 0;
    id v9 = v6;
    [WeakRetained _readPendingDiscoveredCharacteristicTypesWithCompletion:v7];

    objc_destroyWeak(&v10);
  }
}

void __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_3_203(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained primaryAccessory];
  [v2 updateForAccessoryInformationService];

  (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [WeakRetained isIncompatibleUpdate], *(void *)(a1 + 32));
}

void __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) delegate];
    [v2 accessoryServer:*(void *)(a1 + 32) didDiscoverAccessories:0 transaction:0 error:*(void *)(a1 + 40)];
  }
  id v6 = [*(id *)(a1 + 32) delegate];
  id v3 = *(void **)(a1 + 32);
  id v4 = [v3 accessories];
  id v5 = (void *)[v4 copy];
  [v6 accessoryServer:v3 didDiscoverAccessories:v5 transaction:0 error:*(void *)(a1 + 40)];
}

void __80___HAPAccessoryServerBTLE200__removePairingOfAccessoryServerCancelledMidPairing__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944E080]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed accessory server that its pairing was cancelled post pair-setup with error %@", (uint8_t *)&v11, 0x16u);
  }
  [*(id *)(a1 + 32) setPendingRemovePairing:2];
  id v8 = [*(id *)(a1 + 32) browser];
  char v9 = [v8 isPerformingGeneralScan];

  if ((v9 & 1) == 0)
  {
    id v10 = [*(id *)(a1 + 32) browser];
    [v10 stopDiscoveringAccessoryServers];
  }
}

uint64_t __80___HAPAccessoryServerBTLE200__removePairingOfAccessoryServerCancelledMidPairing__block_invoke_191(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __209___HAPAccessoryServerBTLE200_initWithPeripheral_name_pairingUsername_statusFlags_stateNumber_stateChanged_connectReason_configNumber_category_setupHash_connectionIdleTime_browser_keyStore_whbStableIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained browser];
  id v2 = [WeakRetained accessoryCache];
  [v1 saveCacheToDisk:v2];
}

uint64_t __41___HAPAccessoryServerBTLE200_logCategory__block_invoke()
{
  logCategory__hmf_once_v333 = HMFCreateOSLogHandle();

  return MEMORY[0x1F41817F8]();
}

@end