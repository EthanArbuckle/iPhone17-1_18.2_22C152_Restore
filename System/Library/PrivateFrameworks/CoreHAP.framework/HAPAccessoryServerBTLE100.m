@interface HAPAccessoryServerBTLE100
@end

@implementation HAPAccessoryServerBTLE100

uint64_t __40___HAPAccessoryServerBTLE100_disconnect__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    v6 = [*(id *)(a1 + 32) name];
    v7 = [*(id *)(a1 + 32) identifier];
    int v9 = 138543874;
    v10 = v5;
    __int16 v11 = 2112;
    v12 = v6;
    __int16 v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Disconnecting %@ %@ as a result of direct disconnect call", (uint8_t *)&v9, 0x20u);
  }
  return [*(id *)(a1 + 32) _disconnect];
}

void __80___HAPAccessoryServerBTLE100_listPairingsWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6702 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82___HAPAccessoryServerBTLE100_removePairingForCurrentControllerOnQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __82___HAPAccessoryServerBTLE100_removePairingForCurrentControllerOnQueue_completion___block_invoke_345(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D944E080]();
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    v7 = [*(id *)(a1 + 32) name];
    *(_DWORD *)buf = 138543874;
    v31 = v6;
    __int16 v32 = 2112;
    v33 = v7;
    __int16 v34 = 2112;
    id v35 = v3;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@] Request to remove current controller completed with error %@", buf, 0x20u);
  }
  v8 = [*(id *)(a1 + 32) keyStore];
  int v9 = [*(id *)(a1 + 32) identifier];
  id v29 = 0;
  [v8 removeAccessoryKeyForName:v9 error:&v29];
  id v10 = v29;

  if (v10)
  {
    __int16 v11 = (void *)MEMORY[0x1D944E080]();
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      v14 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138543874;
      v31 = v13;
      __int16 v32 = 2112;
      v33 = v14;
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%{public}@After removing the accessory with 'Remove Pairing', we failed to remove accessory %@ from the keychain with error %@", buf, 0x20u);
    }
  }
  uint64_t v15 = [*(id *)(a1 + 32) keyStore];
  v16 = [*(id *)(a1 + 32) identifier];
  id v28 = v10;
  char v17 = [v15 deletePeripheralIdentifierForAccessoryIdentifier:v16 error:&v28];
  id v18 = v28;

  if ((v17 & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1D944E080]();
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = HMFGetLogIdentifier();
      v22 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138543874;
      v31 = v21;
      __int16 v32 = 2112;
      v33 = v22;
      __int16 v34 = 2112;
      id v35 = v3;
      _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to remove the peripheral keychain entry for %@ with error: %@", buf, 0x20u);
    }
  }
  v23 = *(void **)(a1 + 48);
  if (v23)
  {
    v24 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82___HAPAccessoryServerBTLE100_removePairingForCurrentControllerOnQueue_completion___block_invoke_346;
    block[3] = &unk_1E69F3B20;
    id v27 = v23;
    dispatch_async(v24, block);
  }
  v25 = [*(id *)(a1 + 32) browser];
  [v25 disconnectFromBTLEAccessoryServer:*(void *)(a1 + 32)];
}

uint64_t __82___HAPAccessoryServerBTLE100_removePairingForCurrentControllerOnQueue_completion___block_invoke_346(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86___HAPAccessoryServerBTLE100__removePairingWithIdentifier_publicKey_queue_completion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Remove pairing failed." reason:@"Failed to create remove pairing request payload." suggestion:0 underlyingError:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __86___HAPAccessoryServerBTLE100__removePairingWithIdentifier_publicKey_queue_completion___block_invoke_344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86___HAPAccessoryServerBTLE100__removePairingWithIdentifier_publicKey_queue_completion___block_invoke_2;
  v9[3] = &unk_1E69F3E20;
  id v8 = *(id *)(a1 + 48);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  [v6 _handlePairingsWriteForCharacteristic:a2 writeError:a3 removing:1 queue:v7 completion:v9];
}

uint64_t __86___HAPAccessoryServerBTLE100__removePairingWithIdentifier_publicKey_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 _dequeueAndContinueOperation];
}

void __78___HAPAccessoryServerBTLE100_removePairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) addRemovePairingOperationsQueue];
  uint64_t v3 = [v2 count];

  if (!v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = [*(id *)(a1 + 40) identifier];
    v6 = [*(id *)(a1 + 40) publicKey];
    uint64_t v7 = [v6 data];
    [v4 _removePairingWithIdentifier:v5 publicKey:v7 queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  id v8 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) identifier];
  int v9 = [*(id *)(a1 + 40) publicKey];
  id v10 = [v9 data];
  [v8 _enqueueOperation:6 identifier:v11 publicKey:v10 admin:0 queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __103___HAPAccessoryServerBTLE100__handlePairingsReadForCharacteristic_readError_removing_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __103___HAPAccessoryServerBTLE100__handlePairingsReadForCharacteristic_readError_removing_queue_completion___block_invoke_337(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __105___HAPAccessoryServerBTLE100__handlePairingsWriteForCharacteristic_writeError_removing_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __105___HAPAccessoryServerBTLE100__handlePairingsWriteForCharacteristic_writeError_removing_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handlePairingsReadForCharacteristic:a2 readError:a3 removing:*(unsigned __int8 *)(a1 + 56) queue:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __89___HAPAccessoryServerBTLE100__addPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Add pairing failed." reason:@"Failed to create add pairing request payload." suggestion:0 underlyingError:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __89___HAPAccessoryServerBTLE100__addPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke_334(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89___HAPAccessoryServerBTLE100__addPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke_2;
  v9[3] = &unk_1E69F3E20;
  id v8 = *(id *)(a1 + 48);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  [v6 _handlePairingsWriteForCharacteristic:a2 writeError:a3 removing:0 queue:v7 completion:v9];
}

uint64_t __89___HAPAccessoryServerBTLE100__addPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 _dequeueAndContinueOperation];
}

void __75___HAPAccessoryServerBTLE100_addPairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) permissions];
  uint64_t v3 = [*(id *)(a1 + 40) addRemovePairingOperationsQueue];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    v5 = *(void **)(a1 + 40);
    v6 = [*(id *)(a1 + 32) identifier];
    uint64_t v7 = [*(id *)(a1 + 32) publicKey];
    id v8 = [v7 data];
    [v5 _addPairingWithIdentifier:v6 publicKey:v8 admin:v2 & 1 queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  int v9 = *(void **)(a1 + 40);
  id v12 = [*(id *)(a1 + 32) identifier];
  id v10 = [*(id *)(a1 + 32) publicKey];
  id v11 = [v10 data];
  [v9 _enqueueOperation:5 identifier:v12 publicKey:v11 admin:v2 & 1 queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void __53___HAPAccessoryServerBTLE100_identifyWithCompletion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) unpairedIdentifyRequested])
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v5 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:15];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
  }
  else
  {
    [*(id *)(a1 + 32) setUnpairedIdentifyRequested:1];
    [*(id *)(a1 + 32) _handlePairingStateMachine];
    [*(id *)(a1 + 32) _updateConnectionLifetimeTimer];
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 setUnpairedIdentifyCompletionBlock:v4];
  }
}

void __60___HAPAccessoryServerBTLE100__updateConnectionLifetimeTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleConnectionLifetimeTimeout];
    id WeakRetained = v2;
  }
}

uint64_t __55___HAPAccessoryServerBTLE100_updateConnectionIdleTime___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 32);
  double v4 = 10.0;
  if (v2 == 1) {
    double v4 = 2.0;
  }
  [v3 setIdleConnectionTimeoutInSec:v4];
  id v5 = *(void **)(a1 + 32);

  return [v5 _updateConnectionLifetimeTimer];
}

void __63___HAPAccessoryServerBTLE100__handlePairSetupExchangeWithData___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didStopPairingWithError:*(void *)(a1 + 40)];
}

void __63___HAPAccessoryServerBTLE100__handlePairSetupExchangeWithData___block_invoke_323(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didStopPairingWithError:*(void *)(a1 + 40)];
}

void __45___HAPAccessoryServerBTLE100__pairSetupStart__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didStopPairingWithError:0];
}

void __45___HAPAccessoryServerBTLE100__pairSetupStart__block_invoke_322(uint64_t a1)
{
  HMErrorFromOSStatus(*(unsigned int *)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didStopPairingWithError:v3];
}

uint64_t __91___HAPAccessoryServerBTLE100_peripheral_didUpdateNotificationStateForCharacteristic_error___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    double v4 = HMFGetLogIdentifier();
    uint64_t v5 = *(void *)(a1 + 32);
    int v13 = 138543874;
    v14 = v4;
    __int16 v15 = 2080;
    v16 = "-[_HAPAccessoryServerBTLE100 peripheral:didUpdateNotificationStateForCharacteristic:error:]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_INFO, "%{public}@%s: Received Notification Updated confirmation for characteristics %@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v6 = [*(id *)(a1 + 40) _updateConnectionLifetimeTimer];
  if (*(void *)(a1 + 48))
  {
    uint64_t v7 = (void *)MEMORY[0x1D944E080](v6);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = HMFGetLogIdentifier();
      id v10 = *(const char **)(a1 + 48);
      int v13 = 138543618;
      v14 = v9;
      __int16 v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@### Notification Update failed with error: %@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v11 = *(void *)(a1 + 48);
  }
  else
  {
    uint64_t v11 = 0;
  }
  return [*(id *)(a1 + 40) _handleHAPNotificationStateUpdateForCharacteristic:*(void *)(a1 + 32) error:v11];
}

void __78___HAPAccessoryServerBTLE100_peripheral_didWriteValueForCharacteristic_error___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _updateConnectionLifetimeTimer];
  if (*(void *)(a1 + 40))
  {
    id v3 = (void *)MEMORY[0x1D944E080](v2);
    double v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 40);
      int v18 = 138543618;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_ERROR, "%{public}@### Writing failed after receiving a write confirmation with error: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  uint64_t v7 = *(void **)(a1 + 48);
  id v8 = [*(id *)(a1 + 32) pairSetupCharacteristic];
  LODWORD(v7) = [v7 isEqual:v8];

  if (v7)
  {
    int v9 = [*(id *)(a1 + 32) peripheral];
    uint64_t v10 = [*(id *)(a1 + 32) pairSetupCharacteristic];
  }
  else
  {
    uint64_t v11 = *(void **)(a1 + 48);
    id v12 = [*(id *)(a1 + 32) pairVerifyCharacteristic];
    LODWORD(v11) = [v11 isEqual:v12];

    if (!v11)
    {
      v14 = *(void **)(a1 + 48);
      __int16 v15 = [*(id *)(a1 + 32) identifyCharacteristic];
      if ([v14 isEqual:v15])
      {
        int v16 = [*(id *)(a1 + 32) unpairedIdentifyRequested];

        if (v16)
        {
          int v9 = [*(id *)(a1 + 32) unpairedIdentifyCompletionBlock];
          [*(id *)(a1 + 32) setUnpairedIdentifyCompletionBlock:0];
          if (v9) {
            v9[2](v9, *(void *)(a1 + 40));
          }
          __int16 v17 = [*(id *)(a1 + 32) browser];
          [v17 disconnectFromBTLEAccessoryServer:*(void *)(a1 + 32)];

          goto LABEL_10;
        }
      }
      else
      {
      }
      [*(id *)(a1 + 32) _handleHAPWriteConfirmationForCharacteristic:*(void *)(a1 + 48) error:*(void *)(a1 + 40)];
      return;
    }
    int v9 = [*(id *)(a1 + 32) peripheral];
    uint64_t v10 = [*(id *)(a1 + 32) pairVerifyCharacteristic];
  }
  int v13 = (void *)v10;
  [v9 readValueForCharacteristic:v10];

LABEL_10:
}

void __79___HAPAccessoryServerBTLE100_peripheral_didUpdateValueForCharacteristic_error___block_invoke(id *a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] _updateConnectionLifetimeTimer];
  if (a1[5])
  {
    id v3 = (void *)MEMORY[0x1D944E080](v2);
    double v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      id v7 = a1[5];
      uint64_t v6 = (const char *)a1[6];
      *(_DWORD *)buf = 138543874;
      v60 = v5;
      __int16 v61 = 2112;
      v62 = v6;
      __int16 v63 = 2112;
      v64 = v7;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_ERROR, "%{public}@### Reading characteristic %@ failed with error: %@", buf, 0x20u);
    }
    id v8 = (void *)MEMORY[0x1E4F28C58];
    int v9 = objc_msgSend(NSString, "stringWithFormat:", @"Failed with CBT code %d", objc_msgSend(a1[5], "code"));
    uint64_t v10 = [v8 errorWithHMErrorCode:54 reason:v9 underlyingError:0];
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = a1[6];
  id v12 = [a1[4] pairSetupCharacteristic];
  LODWORD(v11) = [v11 isEqual:v12];

  if (v11)
  {
    int v13 = (void *)MEMORY[0x1D944E080]();
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v60 = v15;
      __int16 v61 = 2080;
      v62 = "-[_HAPAccessoryServerBTLE100 peripheral:didUpdateValueForCharacteristic:error:]_block_invoke";
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_INFO, "%{public}@%s: Received pair setup data", buf, 0x16u);
    }
    id v16 = a1[4];
    __int16 v17 = [a1[6] value];
    int v18 = [a1[4] _pairSetupHAPCharacteristic];
    [v16 _notifyDelegateOfReceivedPlaintextData:v17 forCharacteristic:v18];

    id v19 = a1[4];
    __int16 v20 = [a1[6] value];
    [v19 _handlePairSetupExchangeWithData:v20];
LABEL_14:

    goto LABEL_15;
  }
  id v21 = a1[6];
  uint64_t v22 = [a1[4] pairVerifyCharacteristic];
  LODWORD(v21) = [v21 isEqual:v22];

  if (v21)
  {
    v23 = (void *)MEMORY[0x1D944E080]();
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v60 = v25;
      __int16 v61 = 2080;
      v62 = "-[_HAPAccessoryServerBTLE100 peripheral:didUpdateValueForCharacteristic:error:]_block_invoke";
      _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_INFO, "%{public}@%s: Received pair verify data", buf, 0x16u);
    }
    id v26 = a1[4];
    id v27 = [a1[6] value];
    id v28 = [a1[4] _pairVerifyHAPCharacteristic];
    [v26 _notifyDelegateOfReceivedPlaintextData:v27 forCharacteristic:v28];

    id v29 = a1[4];
    __int16 v20 = [a1[6] value];
    [v29 _handleReceivedSecuritySessionSetupExchangeData:v20];
    goto LABEL_14;
  }
  id v30 = a1[6];
  v31 = [a1[4] pairingFeaturesCharacteristic];
  LODWORD(v30) = [v30 isEqual:v31];

  id v32 = a1[6];
  if (v30)
  {
    v33 = [v32 value];
    __int16 v34 = (void *)MEMORY[0x1D944E080]();
    id v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v60 = v36;
      __int16 v61 = 2080;
      v62 = "-[_HAPAccessoryServerBTLE100 peripheral:didUpdateValueForCharacteristic:error:]_block_invoke";
      __int16 v63 = 2112;
      v64 = v33;
      _os_log_impl(&dword_1D4758000, v35, OS_LOG_TYPE_INFO, "%{public}@%s: Received pair features data %@", buf, 0x20u);
    }
    if ([v33 length] == 1)
    {
      *((void *)a1[4] + 80) = *(unsigned __int8 *)[v33 bytes];
      [a1[4] setPairingFeaturesRead:1];
    }
    [a1[4] _handlePairingStateMachine];
  }
  else
  {
    v37 = [v32 UUID];
    v38 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"00000051-0000-1000-8000-0026BB765291"];
    int v39 = [v37 isEqual:v38];

    if (v39)
    {
      if (a1[5]
        || ([a1[6] value],
            v44 = objc_claimAutoreleasedReturnValue(),
            uint64_t v45 = [v44 length],
            v44,
            !v45))
      {
        v40 = 0;
      }
      else
      {
        unsigned __int16 v58 = 0;
        id v46 = a1[4];
        v47 = [a1[6] value];
        id v57 = 0;
        v48 = [v46 _decryptData:v47 error:&v57];
        id v49 = v57;

        v40 = 0;
        if ([v48 length] == 2)
        {
          [v48 getBytes:&v58 length:2];
          v40 = [NSNumber numberWithUnsignedShort:v58];
        }
        v50 = (void *)MEMORY[0x1D944E080]();
        v51 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          v52 = HMFGetLogIdentifier();
          v53 = [a1[6] service];
          v54 = [v53 UUID];
          *(_DWORD *)buf = 138543874;
          v60 = v52;
          __int16 v61 = 2112;
          v62 = v40;
          __int16 v63 = 2112;
          v64 = v54;
          _os_log_impl(&dword_1D4758000, v51, OS_LOG_TYPE_INFO, "%{public}@Read Service Instance ID value: %@ for Service-UUID: %@", buf, 0x20u);
        }
      }
      id v55 = a1[4];
      v56 = [a1[6] service];
      [v55 _handleHAPServiceDiscoveryCompletionForService:v56 withInstanceId:v40];
    }
    else
    {
      v41 = (void *)MEMORY[0x1D944E080]();
      v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v60 = v43;
        __int16 v61 = 2080;
        v62 = "-[_HAPAccessoryServerBTLE100 peripheral:didUpdateValueForCharacteristic:error:]_block_invoke";
        _os_log_impl(&dword_1D4758000, v42, OS_LOG_TYPE_INFO, "%{public}@%s: Received HAP characteristic data", buf, 0x16u);
      }
      [a1[4] _handleUpdatedValueForBTLECharacteristic:a1[6] error:v10];
    }
  }
LABEL_15:
}

void __75___HAPAccessoryServerBTLE100_peripheral_didUpdateValueForDescriptor_error___block_invoke(id *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  id v3 = (void *)MEMORY[0x1D944E080](objc_msgSend(a1[5], "setMetadataValueReadCount:", objc_msgSend(a1[5], "metadataValueReadCount") - 1));
  double v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = [a1[5] identifier];
    id v7 = a1[6];
    id v8 = a1[4];
    *(_DWORD *)buf = 138544130;
    id v21 = v5;
    __int16 v22 = 2112;
    v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@] didUpdateValueForDescriptor: %@ error: %@", buf, 0x2Au);
  }
  id v9 = a1[5];
  id v10 = a1[6];
  id v11 = [v10 characteristic];
  id v12 = [v11 descriptors];
  int v13 = [a1[6] characteristic];
  char v14 = [v9 _parseBTLECharacteristicDescriptor:v10 existingDescriptors:v12 characteristics:v13];

  if ((v14 & 1) == 0)
  {
    uint64_t v15 = HMErrorFromOSStatus(4294960562);

    id v2 = (id)v15;
  }
  [a1[5] _updateConnectionLifetimeTimer];
  if ([a1[5] metadataValueReadCount]) {
    char v16 = v14;
  }
  else {
    char v16 = 0;
  }
  if ((v16 & 1) == 0)
  {
    [a1[5] _handlePairingStateMachine];
    if ([a1[5] _delegateRespondsToSelector:sel_accessoryServer_didDiscoverAccessories_transaction_error_])
    {
      __int16 v17 = [a1[5] delegateQueue];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __75___HAPAccessoryServerBTLE100_peripheral_didUpdateValueForDescriptor_error___block_invoke_318;
      v18[3] = &unk_1E69F46E0;
      v18[4] = a1[5];
      id v19 = v2;
      dispatch_async(v17, v18);
    }
  }
}

void __75___HAPAccessoryServerBTLE100_peripheral_didUpdateValueForDescriptor_error___block_invoke_318(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 accessories];
  double v4 = (void *)[v3 copy];
  [v5 accessoryServer:v2 didDiscoverAccessories:v4 transaction:0 error:*(void *)(a1 + 40)];
}

uint64_t __87___HAPAccessoryServerBTLE100_peripheral_didDiscoverDescriptorsForCharacteristic_error___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    double v4 = HMFGetLogIdentifier();
    id v5 = [*(id *)(a1 + 32) identifier];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v9 = 138544130;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@] didDiscoverDescriptorsForCharacteristic: %@, error: %@", (uint8_t *)&v9, 0x2Au);
  }
  [*(id *)(a1 + 32) _updateConnectionLifetimeTimer];
  objc_msgSend(*(id *)(a1 + 32), "setMetadataDiscoveryRequestCount:", objc_msgSend(*(id *)(a1 + 32), "metadataDiscoveryRequestCount") - 1);
  uint64_t result = [*(id *)(a1 + 32) metadataDiscoveryRequestCount];
  if (!result) {
    return [*(id *)(a1 + 32) _handlePairingStateMachine];
  }
  return result;
}

void __84___HAPAccessoryServerBTLE100_peripheral_didDiscoverCharacteristicsForService_error___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    double v4 = HMFGetLogIdentifier();
    id v5 = [*(id *)(a1 + 32) identifier];
    uint64_t v6 = [*(id *)(a1 + 40) UUID];
    uint64_t v7 = *(void *)(a1 + 48);
    int v26 = 138544130;
    id v27 = v4;
    __int16 v28 = 2112;
    id v29 = v5;
    __int16 v30 = 2112;
    v31 = v6;
    __int16 v32 = 2112;
    uint64_t v33 = v7;
    _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@] didDiscoverCharacteristicsForService:%@ error %@", (uint8_t *)&v26, 0x2Au);
  }
  [*(id *)(a1 + 32) _updateConnectionLifetimeTimer];
  id v8 = *(void **)(a1 + 40);
  int v9 = [*(id *)(a1 + 32) pairingService];
  LODWORD(v8) = [v8 isEqual:v9];

  if (!v8)
  {
    int v18 = *(void **)(a1 + 40);
    id v19 = [*(id *)(a1 + 32) accessoryInfoService];
    if ([v18 isEqual:v19])
    {
      uint64_t v20 = [*(id *)(a1 + 32) state];

      if (v20 == 6)
      {
        uint64_t v21 = *(void *)(a1 + 48);
        __int16 v11 = (void *)MEMORY[0x1D944E080]();
        __int16 v22 = HMFGetOSLogHandle();
        __int16 v13 = v22;
        if (v21)
        {
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            goto LABEL_8;
          }
          uint64_t v14 = HMFGetLogIdentifier();
          __int16 v15 = [*(id *)(a1 + 32) identifier];
          int v26 = 138543618;
          id v27 = v14;
          __int16 v28 = 2112;
          id v29 = v15;
          uint64_t v16 = "%{public}@[BTLE Accessory Server %@] accessory info service matched with error, disconnecting";
          goto LABEL_7;
        }
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
          goto LABEL_21;
        }
        v23 = HMFGetLogIdentifier();
        __int16 v24 = [*(id *)(a1 + 32) identifier];
        int v26 = 138543618;
        id v27 = v23;
        __int16 v28 = 2112;
        id v29 = v24;
        id v25 = "%{public}@[BTLE Accessory Server %@] accessory service match, running state machine";
        goto LABEL_20;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 32) _handleHAPCharacteristicDiscoveryForService:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
    return;
  }
  uint64_t v10 = *(void *)(a1 + 48);
  __int16 v11 = (void *)MEMORY[0x1D944E080]();
  id v12 = HMFGetOSLogHandle();
  __int16 v13 = v12;
  if (v10)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      uint64_t v17 = [*(id *)(a1 + 32) browser];
      [v17 disconnectFromBTLEAccessoryServer:*(void *)(a1 + 32)];

      return;
    }
    uint64_t v14 = HMFGetLogIdentifier();
    __int16 v15 = [*(id *)(a1 + 32) identifier];
    int v26 = 138543618;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v15;
    uint64_t v16 = "%{public}@[BTLE Accessory Server %@] pairing service matched with error, disconnecting";
LABEL_7:
    _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v26, 0x16u);

    goto LABEL_8;
  }
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
    goto LABEL_21;
  }
  v23 = HMFGetLogIdentifier();
  __int16 v24 = [*(id *)(a1 + 32) identifier];
  int v26 = 138543618;
  id v27 = v23;
  __int16 v28 = 2112;
  id v29 = v24;
  id v25 = "%{public}@[BTLE Accessory Server %@] pairing service match, running state machine";
LABEL_20:
  _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v26, 0x16u);

LABEL_21:
  [*(id *)(a1 + 32) _handlePairingStateMachine];
}

uint64_t __59___HAPAccessoryServerBTLE100_peripheral_didModifyServices___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    double v4 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    __int16 v30 = v4;
    __int16 v31 = 2112;
    id v32 = (id)objc_opt_class();
    __int16 v33 = 2080;
    uint64_t v34 = "-[_HAPAccessoryServerBTLE100 peripheral:didModifyServices:]_block_invoke";
    id v5 = v32;
    _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_INFO, "%{public}@%@ %s", buf, 0x20u);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v25;
    *(void *)&long long v8 = 138543618;
    long long v23 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
        __int16 v13 = objc_msgSend(*(id *)(a1 + 32), "btleServiceToHAPServiceMap", v23, (void)v24);
        [v13 removeObjectForKey:v12];

        uint64_t v14 = (void *)MEMORY[0x1D944E080]();
        __int16 v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = HMFGetLogIdentifier();
          *(_DWORD *)buf = v23;
          __int16 v30 = v16;
          __int16 v31 = 2112;
          id v32 = v12;
          _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%{public}@Removed BTLE service: %@", buf, 0x16u);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  uint64_t result = [*(id *)(a1 + 40) count];
  if (result)
  {
    int v18 = (void *)MEMORY[0x1D944E080]();
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      uint64_t v21 = [*(id *)(a1 + 32) identifier];
      __int16 v22 = *(const char **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      __int16 v30 = v20;
      __int16 v31 = 2112;
      id v32 = v21;
      __int16 v33 = 2112;
      uint64_t v34 = v22;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@] Disconnecting on services changed: %@", buf, 0x20u);
    }
    return [*(id *)(a1 + 32) _handleConnectionLifetimeTimeout];
  }
  return result;
}

void __61___HAPAccessoryServerBTLE100_peripheral_didDiscoverServices___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    double v4 = HMFGetLogIdentifier();
    int v11 = 138543874;
    id v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = (char *)objc_opt_class();
    __int16 v15 = 2080;
    uint64_t v16 = "-[_HAPAccessoryServerBTLE100 peripheral:didDiscoverServices:]_block_invoke";
    id v5 = v14;
    _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_INFO, "%{public}@%@ %s", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v6 = [*(id *)(a1 + 32) _updateConnectionLifetimeTimer];
  if (*(void *)(a1 + 40))
  {
    uint64_t v7 = (void *)MEMORY[0x1D944E080](v6);
    long long v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(const char **)(a1 + 40);
      int v11 = 138543874;
      id v12 = v9;
      __int16 v13 = 2080;
      uint64_t v14 = "-[_HAPAccessoryServerBTLE100 peripheral:didDiscoverServices:]_block_invoke";
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@%s: Unable to discover services with error: %@", (uint8_t *)&v11, 0x20u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _handlePairingStateMachine];
  }
}

void __83___HAPAccessoryServerBTLE100__notifyDelegateOfSentPlaintextData_forCharacteristic___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBTLE:*(void *)(a1 + 32) willSendPlaintextPayload:*(void *)(a1 + 40) forCharacteristic:*(void *)(a1 + 48)];
}

void __96___HAPAccessoryServerBTLE100__notifyDelegateOfSentEncryptedAuthenticatedData_forCharacteristic___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBTLE:*(void *)(a1 + 32) willSendEncryptedAndAuthenticatedPayload:*(void *)(a1 + 40) forCharacteristic:*(void *)(a1 + 48)];
}

void __87___HAPAccessoryServerBTLE100__notifyDelegateOfReceivedPlaintextData_forCharacteristic___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBTLE:*(void *)(a1 + 32) didReceivePlaintextPayload:*(void *)(a1 + 40) forCharacteristic:*(void *)(a1 + 48)];
}

void __100___HAPAccessoryServerBTLE100__notifyDelegateOfReceivedEncryptedAuthenticatedData_forCharacteristic___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBTLE:*(void *)(a1 + 32) didReceiveEncryptedAndAuthenticatedPayload:*(void *)(a1 + 40) forCharacteristic:*(void *)(a1 + 48)];
}

void __92___HAPAccessoryServerBTLE100__handleHAPServiceDiscoveryCompletionForService_withInstanceId___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 accessories];
  double v4 = (void *)[v3 copy];
  [v5 accessoryServer:v2 didDiscoverAccessories:v4 transaction:0 error:*(void *)(a1 + 40)];
}

void __57___HAPAccessoryServerBTLE100__handleReadDescriptorValues__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 accessories];
  double v4 = (void *)[v3 copy];
  [v5 accessoryServer:v2 didDiscoverAccessories:v4 transaction:0 error:0];
}

void __51___HAPAccessoryServerBTLE100__getAttributeDatabase__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 accessories];
  double v4 = (void *)[v3 copy];
  [v5 accessoryServer:v2 didDiscoverAccessories:v4 transaction:0 error:0];
}

void __49___HAPAccessoryServerBTLE100_discoverAccessories__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = HMFGetLogIdentifier();
    id v5 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    int v11 = v5;
    _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Requested accessory discovery", buf, 0x16u);
  }
  if ([*(id *)(a1 + 32) isSecuritySessionOpen])
  {
    [*(id *)(a1 + 32) _getAttributeDatabase];
  }
  else
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49___HAPAccessoryServerBTLE100_discoverAccessories__block_invoke_205;
    v6[3] = &unk_1E69F4420;
    objc_copyWeak(&v7, (id *)buf);
    [*(id *)(a1 + 32) setPairVerifyCompletionBlock:v6];
    objc_msgSend(*(id *)(a1 + 32), "setMetric_pairVerifyReason:", @"noSession.discovering");
    [*(id *)(a1 + 32) _establishSecureSession];
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

void __49___HAPAccessoryServerBTLE100_discoverAccessories__block_invoke_205(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (v3)
  {
    uint64_t v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      long long v8 = HMFGetLogIdentifier();
      uint64_t v9 = [v5 identifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%{public}@[BTLE Accessory Server %@] Failed to complete pair-verify - error: %@", buf, 0x20u);
    }
    if (v5
      && [v5 _delegateRespondsToSelector:sel_accessoryServer_didStopPairingWithError_])
    {
      __int16 v10 = [v5 delegateQueue];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __49___HAPAccessoryServerBTLE100_discoverAccessories__block_invoke_206;
      v11[3] = &unk_1E69F46E0;
      v11[4] = v5;
      id v12 = v3;
      dispatch_async(v10, v11);
    }
  }
  else
  {
    [WeakRetained _getAttributeDatabase];
  }
}

void __49___HAPAccessoryServerBTLE100_discoverAccessories__block_invoke_206(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didStopPairingWithError:*(void *)(a1 + 40)];
}

void __64___HAPAccessoryServerBTLE100_securitySession_didCloseWithError___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) securitySession];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    double v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      id v7 = [*(id *)(a1 + 40) identifier];
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      __int16 v17 = v6;
      __int16 v18 = 2112;
      uint64_t v19 = v7;
      __int16 v20 = 2112;
      uint64_t v21 = v8;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Security session did close with error: %@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) setSecuritySessionOpening:0];
    [*(id *)(a1 + 40) setSecuritySessionOpen:0];
    int v9 = [*(id *)(a1 + 40) shouldRetryPVDueToAuthenticationError:*(void *)(a1 + 48)];
    __int16 v10 = *(void **)(a1 + 40);
    if (v9)
    {
      int v11 = [v10 clientQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64___HAPAccessoryServerBTLE100_securitySession_didCloseWithError___block_invoke_204;
      block[3] = &unk_1E69F4330;
      void block[4] = *(void *)(a1 + 40);
      dispatch_async(v11, block);
    }
    else
    {
      id v12 = [v10 browser];
      [v12 disconnectFromBTLEAccessoryServer:*(void *)(a1 + 40)];

      __int16 v13 = [*(id *)(a1 + 40) pairVerifyCompletionBlock];

      if (v13)
      {
        uint64_t v14 = [*(id *)(a1 + 40) pairVerifyCompletionBlock];
        v14[2](v14, 0);

        [*(id *)(a1 + 40) setPairVerifyCompletionBlock:0];
      }
    }
  }
}

uint64_t __64___HAPAccessoryServerBTLE100_securitySession_didCloseWithError___block_invoke_204(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:8];
  id v2 = *(void **)(a1 + 32);

  return [v2 _reallyEstablishSecureSession];
}

void __53___HAPAccessoryServerBTLE100_securitySessionDidOpen___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) securitySession];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    double v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      id v7 = [*(id *)(a1 + 40) identifier];
      int v12 = 138543618;
      __int16 v13 = v6;
      __int16 v14 = 2112;
      __int16 v15 = v7;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Security session is open", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v8 = *(void **)(a1 + 40);
    int v9 = [v8 identifier];
    [v8 associateAccessoryWithControllerKeyUsingAccessoryIdentifier:v9];

    [*(id *)(a1 + 40) setSecuritySessionOpening:0];
    [*(id *)(a1 + 40) setSecuritySessionOpen:1];
    __int16 v10 = [*(id *)(a1 + 40) pairVerifyCompletionBlock];

    if (v10)
    {
      int v11 = [*(id *)(a1 + 40) pairVerifyCompletionBlock];
      v11[2](v11, 0);

      [*(id *)(a1 + 40) setPairVerifyCompletionBlock:0];
    }
  }
}

void __55___HAPAccessoryServerBTLE100_securitySessionIsOpening___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) securitySession];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    double v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      id v7 = [*(id *)(a1 + 40) identifier];
      int v8 = 138543618;
      int v9 = v6;
      __int16 v10 = 2112;
      int v11 = v7;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Security session is opening", (uint8_t *)&v8, 0x16u);
    }
    [*(id *)(a1 + 40) setSecuritySessionOpening:1];
  }
}

void __74___HAPAccessoryServerBTLE100_securitySession_didReceiveSetupExchangeData___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) securitySession];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    double v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      id v7 = [*(id *)(a1 + 40) identifier];
      int v13 = 138543618;
      __int16 v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Request to send security session setup exchange", (uint8_t *)&v13, 0x16u);
    }
    int v8 = [*(id *)(a1 + 40) pairVerifyCharacteristic];
    if (v8)
    {
      int v9 = *(void **)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      int v11 = [v9 _pairVerifyHAPCharacteristic];
      [v9 _notifyDelegateOfSentPlaintextData:v10 forCharacteristic:v11];

      [*(id *)(a1 + 40) _updateConnectionLifetimeTimer];
      uint64_t v12 = [*(id *)(a1 + 40) peripheral];
      [v12 writeValue:*(void *)(a1 + 48) forCharacteristic:v8 type:0];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6723 userInfo:0];
      [*(id *)(a1 + 32) receivedSetupExchangeData:0 error:v12];
    }
  }
}

void __77___HAPAccessoryServerBTLE100__handleUpdatedValueForBTLECharacteristic_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _delegateRespondsToSelector:sel_accessoryServer_didUpdateValuesForCharacteristics_stateNumber_broadcast_])
  {
    double v4 = [*(id *)(a1 + 32) delegateQueue];
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    id v7 = __77___HAPAccessoryServerBTLE100__handleUpdatedValueForBTLECharacteristic_error___block_invoke_2;
    int v8 = &unk_1E69F46E0;
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = v3;
    dispatch_async(v4, &v5);

    objc_msgSend(*(id *)(a1 + 32), "_updateConnectionLifetimeTimer", v5, v6, v7, v8, v9);
  }
}

void __77___HAPAccessoryServerBTLE100__handleUpdatedValueForBTLECharacteristic_error___block_invoke_188(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handler];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __77___HAPAccessoryServerBTLE100__handleUpdatedValueForBTLECharacteristic_error___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = *(void *)(a1 + 40);
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 accessoryServer:v3 didUpdateValuesForCharacteristics:v4 stateNumber:0 broadcast:0];
}

uint64_t __92___HAPAccessoryServerBTLE100__readValueForCharacteristic_completionQueue_completionHandler___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __92___HAPAccessoryServerBTLE100__readValueForCharacteristic_completionQueue_completionHandler___block_invoke_187(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __92___HAPAccessoryServerBTLE100__readValueForCharacteristic_completionQueue_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __90___HAPAccessoryServerBTLE100__readCharacteristicValues_completionQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [v5 service];
    int v8 = [v7 accessory];

    uint64_t v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = HMFGetLogIdentifier();
      uint64_t v12 = [v8 serverIdentifier];
      int v13 = [v5 instanceID];
      __int16 v14 = [v5 type];
      int v17 = 138544386;
      __int16 v18 = v11;
      __int16 v19 = 2112;
      __int16 v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      long long v24 = v14;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Read response for characteristic %@/%@ with error: %@", (uint8_t *)&v17, 0x34u);
    }
    id v15 = *(id *)(a1 + 32);
    [v5 instanceID];

    [v6 domain];
    [v6 code];
  }
  else
  {
    [v5 instanceID];
  }
  uint64_t v16 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v5 error:v6];
  [*(id *)(a1 + 40) addObject:v16];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __90___HAPAccessoryServerBTLE100__readCharacteristicValues_completionQueue_completionHandler___block_invoke_179(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D944E080]();
  uint64_t v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    double v4 = HMFGetLogIdentifier();
    id v5 = [*(id *)(a1 + 32) identifier];
    id v6 = [*(id *)(a1 + 32) name];
    *(_DWORD *)buf = 138543874;
    int v13 = v4;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    int v17 = v6;
    _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory %@ %@] Completed multiple read requests", buf, 0x20u);
  }
  id v7 = *(NSObject **)(a1 + 40);
  if (v7)
  {
    int v8 = *(void **)(a1 + 56);
    if (v8)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __90___HAPAccessoryServerBTLE100__readCharacteristicValues_completionQueue_completionHandler___block_invoke_180;
      v9[3] = &unk_1E69F3C68;
      id v11 = v8;
      id v10 = *(id *)(a1 + 48);
      dispatch_async(v7, v9);
    }
  }
}

uint64_t __90___HAPAccessoryServerBTLE100__readCharacteristicValues_completionQueue_completionHandler___block_invoke_180(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __81___HAPAccessoryServerBTLE100_readValueForCharacteristic_queue_completionHandler___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __81___HAPAccessoryServerBTLE100_readValueForCharacteristic_queue_completionHandler___block_invoke_2;
  v5[3] = &unk_1E69F3D08;
  objc_copyWeak(&v7, &location);
  id v6 = *(id *)(a1 + 56);
  [v2 _readValueForCharacteristic:v3 completionQueue:v4 completionHandler:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __81___HAPAccessoryServerBTLE100_readValueForCharacteristic_queue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v8 = (void *)MEMORY[0x1D944E080]();
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [WeakRetained identifier];
    uint64_t v12 = [WeakRetained name];
    int v13 = [v5 value];
    int v15 = 138544386;
    __int16 v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    __int16 v20 = v12;
    __int16 v21 = 2112;
    uint64_t v22 = v13;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server '%@' '%@'] Read value '%@' for characteristic %@", (uint8_t *)&v15, 0x34u);
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);
  }
}

void __97___HAPAccessoryServerBTLE100_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(double *)(a1 + 64) > 0.0)
  {
    id v2 = (void *)MEMORY[0x1D944E080]();
    uint64_t v3 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = HMFGetLogIdentifier();
      id v5 = [*(id *)(a1 + 32) identifier];
      id v6 = [*(id *)(a1 + 32) name];
      uint64_t v7 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138544130;
      int v15 = v4;
      __int16 v16 = 2112;
      __int16 v17 = v5;
      __int16 v18 = 2112;
      __int16 v19 = v6;
      __int16 v20 = 2048;
      uint64_t v21 = v7;
      _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory %@ %@] Request timeouts are not supported, request may not timeout within %f seconds", buf, 0x2Au);
    }
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  int v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __97___HAPAccessoryServerBTLE100_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_166;
  v11[3] = &unk_1E69F3CE0;
  objc_copyWeak(&v13, (id *)buf);
  id v12 = *(id *)(a1 + 56);
  [v8 _readCharacteristicValues:v9 completionQueue:v10 completionHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __97___HAPAccessoryServerBTLE100_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_166(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v22 = a1;
  id v23 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    uint64_t v24 = *(void *)v28;
    id v25 = v6;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "error", v22);

        if (!v12)
        {
          id v13 = (void *)MEMORY[0x1D944E080]();
          uint64_t v14 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            int v15 = HMFGetLogIdentifier();
            __int16 v16 = [WeakRetained identifier];
            __int16 v17 = [WeakRetained name];
            __int16 v18 = [v11 characteristic];
            __int16 v19 = [v18 value];
            __int16 v20 = [v11 characteristic];
            *(_DWORD *)buf = 138544386;
            id v32 = v15;
            __int16 v33 = 2112;
            uint64_t v34 = v16;
            __int16 v35 = 2112;
            uint64_t v36 = v17;
            __int16 v37 = 2112;
            v38 = v19;
            __int16 v39 = 2112;
            v40 = v20;
            _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server '%@' '%@'] Read value '%@' for characteristic %@", buf, 0x34u);

            id v6 = v25;
            uint64_t v9 = v24;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v41 count:16];
    }
    while (v8);
  }

  uint64_t v21 = *(void *)(v22 + 32);
  if (v21) {
    (*(void (**)(uint64_t, id, id))(v21 + 16))(v21, v6, v23);
  }
}

uint64_t __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_154(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1D944E080]();
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v20 = v9;
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@### Failed to write characteristic with error %{public}@", buf, 0x16u);
    }
    id v10 = *(id *)(a1 + 56);
    [v5 instanceID];

    [v6 domain];
    [v6 code];
  }
  else
  {
    [v5 setValue:*(void *)(a1 + 32)];
    if ([*(id *)(a1 + 40) properties])
    {
      id v11 = [*(id *)(a1 + 48) browser];
      id v12 = [*(id *)(a1 + 48) identifier];
      [v11 markNotifyingCharacteristicUpdatedForIdentifier:v12];
    }
    [v5 instanceID];
  }
  id v13 = *(void **)(a1 + 72);
  if (v13)
  {
    uint64_t v14 = *(NSObject **)(a1 + 64);
    if (v14)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_164;
      block[3] = &unk_1E69F4070;
      id v18 = v13;
      id v16 = v5;
      id v17 = v6;
      dispatch_async(v14, block);
    }
  }
}

uint64_t __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_165(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_164(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __81___HAPAccessoryServerBTLE100__writeCharacteristicValues_queue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [v5 service];
    uint64_t v8 = [v7 accessory];

    uint64_t v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [v8 serverIdentifier];
      id v13 = [v5 instanceID];
      uint64_t v14 = [v5 type];
      int v16 = 138544386;
      id v17 = v11;
      __int16 v18 = 2112;
      __int16 v19 = v12;
      __int16 v20 = 2112;
      __int16 v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Write response for characteristic %@/%@ with error: %@", (uint8_t *)&v16, 0x34u);
    }
  }
  int v15 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v5 error:v6];
  [*(id *)(a1 + 32) addObject:v15];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __81___HAPAccessoryServerBTLE100__writeCharacteristicValues_queue_completionHandler___block_invoke_146(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D944E080]();
  uint64_t v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = HMFGetLogIdentifier();
    id v5 = [*(id *)(a1 + 32) identifier];
    id v6 = [*(id *)(a1 + 32) name];
    *(_DWORD *)buf = 138543874;
    id v13 = v4;
    __int16 v14 = 2112;
    int v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory %@ %@] Completed multiple write requests", buf, 0x20u);
  }
  uint64_t v7 = *(void **)(a1 + 56);
  if (v7)
  {
    uint64_t v8 = *(NSObject **)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81___HAPAccessoryServerBTLE100__writeCharacteristicValues_queue_completionHandler___block_invoke_147;
    v9[3] = &unk_1E69F3C68;
    id v11 = v7;
    id v10 = *(id *)(a1 + 48);
    dispatch_async(v8, v9);
  }
}

uint64_t __81___HAPAccessoryServerBTLE100__writeCharacteristicValues_queue_completionHandler___block_invoke_147(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __98___HAPAccessoryServerBTLE100_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (*(double *)(a1 + 64) > 0.0)
  {
    v1 = (void *)MEMORY[0x1D944E080]();
    id v2 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = HMFGetLogIdentifier();
      uint64_t v4 = [*(id *)(a1 + 32) identifier];
      id v5 = [*(id *)(a1 + 32) name];
      id v6 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138544130;
      long long v27 = v3;
      __int16 v28 = 2112;
      long long v29 = v4;
      __int16 v30 = 2112;
      __int16 v31 = v5;
      __int16 v32 = 2048;
      __int16 v33 = v6;
      _os_log_impl(&dword_1D4758000, v2, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory %@ %@] Request timeouts are not supported, request may not timeout within %f seconds", buf, 0x2Au);
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x1D944E080]();
        id v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          __int16 v14 = HMFGetLogIdentifier();
          int v15 = [*(id *)(a1 + 32) identifier];
          __int16 v16 = [v11 value];
          id v17 = [v11 characteristic];
          *(_DWORD *)buf = 138544130;
          long long v27 = v14;
          __int16 v28 = 2112;
          long long v29 = v15;
          __int16 v30 = 2112;
          __int16 v31 = v16;
          __int16 v32 = 2112;
          __int16 v33 = v17;
          _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@] Writing value '%@' to characteristic '%@'", buf, 0x2Au);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  return [*(id *)(a1 + 32) _writeCharacteristicValues:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

void __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:18];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didStopPairingWithError:v3];
}

void __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_137(uint64_t a1)
{
  id v6 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:54];
  id v2 = [*(id *)(a1 + 32) delegate];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 accessories];
  id v5 = (void *)[v4 copy];
  [v2 accessoryServer:v3 didDiscoverAccessories:v5 transaction:0 error:v6];
}

void __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_138(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handler];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handler];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_139(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionHandler];
  v2[2](v2, *(void *)(a1 + 40));
}

uint64_t __77___HAPAccessoryServerBTLE100_handleDisconnectionWithError_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDisconnectionWithCompletion:*(void *)(a1 + 40)];
}

uint64_t __71___HAPAccessoryServerBTLE100_handleConnectionWithPeripheral_withError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updatePeripheral:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) peripheral];
  [v2 setDelegate:*(void *)(a1 + 32)];

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 _handleConnectionWithError:v4];
}

void __87___HAPAccessoryServerBTLE100__handleHAPNotificationStateUpdateForCharacteristic_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) handler];
    (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
}

uint64_t __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_130(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1D944E080]();
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@### Failed to enable events on characteristic with error %@", buf, 0x16u);
    }
  }
  else
  {
    [v5 setEventNotificationsEnabled:*(unsigned __int8 *)(a1 + 48)];
  }
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    id v11 = *(NSObject **)(a1 + 32);
    if (v11)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_134;
      block[3] = &unk_1E69F4070;
      id v15 = v10;
      id v13 = v5;
      id v14 = v6;
      dispatch_async(v11, block);
    }
  }
}

uint64_t __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_134(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __91___HAPAccessoryServerBTLE100__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v5 error:v6];
  if (v7)
  {
    if (v6)
    {
      uint64_t v8 = [v5 service];
      uint64_t v9 = [v8 accessory];

      id v10 = (void *)MEMORY[0x1D944E080]();
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = HMFGetLogIdentifier();
        id v13 = [v9 serverIdentifier];
        id v14 = [v5 instanceID];
        [v5 type];
        id v15 = v16 = v10;
        *(_DWORD *)buf = 138544386;
        __int16 v18 = v12;
        __int16 v19 = 2112;
        uint64_t v20 = v13;
        __int16 v21 = 2112;
        long long v22 = v14;
        __int16 v23 = 2112;
        long long v24 = v15;
        __int16 v25 = 2112;
        id v26 = v6;
        _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Enable event response for characteristic %@/%@ with error: %@", buf, 0x34u);

        id v10 = v16;
      }
    }
    [*(id *)(a1 + 32) addObject:v7];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __91___HAPAccessoryServerBTLE100__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_110(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = HMFGetLogIdentifier();
    id v5 = [*(id *)(a1 + 32) identifier];
    id v6 = [*(id *)(a1 + 32) name];
    *(_DWORD *)buf = 138543874;
    __int16 v18 = v4;
    __int16 v19 = 2112;
    uint64_t v20 = v5;
    __int16 v21 = 2112;
    long long v22 = v6;
    _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory %@ %@] Completed multiple enable event requests", buf, 0x20u);
  }
  uint64_t v7 = *(void **)(a1 + 64);
  if (v7)
  {
    uint64_t v8 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91___HAPAccessoryServerBTLE100__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_111;
    block[3] = &unk_1E69F3C68;
    id v16 = v7;
    id v15 = *(id *)(a1 + 48);
    dispatch_async(v8, block);
  }
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v9 = *(void **)(a1 + 56);
    id v11 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __91___HAPAccessoryServerBTLE100__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_2;
    v12[3] = &unk_1E69F3BF0;
    v12[4] = v11;
    id v13 = v9;
    [v11 _readCharacteristicValues:v13 completionQueue:v10 completionHandler:v12];
  }
}

uint64_t __91___HAPAccessoryServerBTLE100__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_111(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __91___HAPAccessoryServerBTLE100__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1D944E080]();
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    uint64_t v10 = [*(id *)(a1 + 32) identifier];
    id v11 = [*(id *)(a1 + 32) name];
    *(_DWORD *)buf = 138544130;
    __int16 v28 = v9;
    __int16 v29 = 2112;
    __int16 v30 = v10;
    __int16 v31 = 2112;
    __int16 v32 = v11;
    __int16 v33 = 2048;
    uint64_t v34 = [v5 count];
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory %@ %@] Read values for %lu events enabled characteristics", buf, 0x2Au);
  }
  id v12 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        __int16 v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        __int16 v19 = objc_msgSend(v18, "error", (void)v22);

        if (!v19)
        {
          uint64_t v20 = [v18 characteristic];
          [v12 addObject:v20];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }

  if ([v12 count]
    && [*(id *)(a1 + 32) _delegateRespondsToSelector:sel_accessoryServer_didUpdateValuesForCharacteristics_stateNumber_broadcast_])
  {
    __int16 v21 = [*(id *)(a1 + 32) delegate];
    [v21 accessoryServer:*(void *)(a1 + 32) didUpdateValuesForCharacteristics:*(void *)(a1 + 40) stateNumber:0 broadcast:0];
  }
}

uint64_t __90___HAPAccessoryServerBTLE100_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableEvents:*(unsigned __int8 *)(a1 + 64) forCharacteristics:*(void *)(a1 + 40) withCompletionHandler:*(void *)(a1 + 56) queue:*(void *)(a1 + 48)];
}

void __51___HAPAccessoryServerBTLE100_stopPairingWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setStartPairingRequested:0];
  [*(id *)(a1 + 32) setDisconnecting:1];
  id v2 = [*(id *)(a1 + 32) browser];
  [v2 disconnectFromBTLEAccessoryServer:*(void *)(a1 + 32)];
}

void __58___HAPAccessoryServerBTLE100_continueAuthAfterValidation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didStopPairingWithError:*(void *)(a1 + 40)];
}

uint64_t __84___HAPAccessoryServerBTLE100_tryPairingPassword_onboardingSetupPayloadString_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairSetupTryPassword:*(void *)(a1 + 40)];
}

void __49___HAPAccessoryServerBTLE100__checkForAuthPrompt__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) requestUserPermission:0 accessoryInfo:*(void *)(a1 + 40) error:0];
}

void __49___HAPAccessoryServerBTLE100__checkForAuthPrompt__block_invoke_2(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:18];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didStopPairingWithError:v3];
}

void __60___HAPAccessoryServerBTLE100_continuePairingAfterAuthPrompt__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) unpairedIdentifyRequested];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if ([v3 _delegateRespondsToSelector:sel_accessoryServer_didStopPairingWithError_])
    {
      uint64_t v4 = [*(id *)(a1 + 32) delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60___HAPAccessoryServerBTLE100_continuePairingAfterAuthPrompt__block_invoke_2;
      block[3] = &unk_1E69F4330;
      void block[4] = *(void *)(a1 + 32);
      dispatch_async(v4, block);
    }
  }
  else
  {
    [v3 _handlePairingStateMachine];
  }
}

void __60___HAPAccessoryServerBTLE100_continuePairingAfterAuthPrompt__block_invoke_2(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:14];
  char v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didStopPairingWithError:v3];
}

void __54___HAPAccessoryServerBTLE100_startPairingWithRequest___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPairingActivity:0];
  char v2 = [*(id *)(a1 + 32) unpairedIdentifyRequested];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if ([v3 _delegateRespondsToSelector:sel_accessoryServer_didStopPairingWithError_])
    {
      uint64_t v4 = [*(id *)(a1 + 32) delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54___HAPAccessoryServerBTLE100_startPairingWithRequest___block_invoke_2;
      block[3] = &unk_1E69F4330;
      void block[4] = *(void *)(a1 + 32);
      dispatch_async(v4, block);
    }
  }
  else
  {
    [v3 setStartPairingRequested:1];
    [*(id *)(a1 + 32) setPairingRequest:*(void *)(a1 + 40)];
    id v5 = *(void **)(a1 + 32);
    [v5 _handlePairingStateMachine];
  }
}

void __54___HAPAccessoryServerBTLE100_startPairingWithRequest___block_invoke_2(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:14];
  char v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didStopPairingWithError:v3];
}

void __83___HAPAccessoryServerBTLE100_configureCharacteristics_queue_withCompletionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1 description:@"Broadcast Key configuration failed" reason:@"Not supported for 1.0 accessories" suggestion:0 underlyingError:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __79___HAPAccessoryServerBTLE100_generateBroadcastKey_queue_withCompletionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1 description:@"Broadcast Key configuration failed" reason:@"Not supported for 1.0 accessories" suggestion:0 underlyingError:0];
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
  }
}

void __41___HAPAccessoryServerBTLE100_description__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v10.receiver = *(id *)(a1 + 40);
  v10.super_class = (Class)_HAPAccessoryServerBTLE100;
  id v3 = objc_msgSendSuper2(&v10, sel_description);
  [v2 appendFormat:@"%@\n", v3];

  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) peripheral];
  [v4 appendFormat:@"Peripheral: %@\n", v5];

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) state];
  if ((unint64_t)(v7 - 1) > 0xB) {
    uint64_t v8 = @"Unknown State";
  }
  else {
    uint64_t v8 = off_1E69F4468[v7 - 1];
  }
  uint64_t v9 = v8;
  [v6 appendFormat:@"State: %@\n", v9];
}

@end