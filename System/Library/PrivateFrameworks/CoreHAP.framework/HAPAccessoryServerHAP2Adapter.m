@interface HAPAccessoryServerHAP2Adapter
+ (void)initialize;
- (BOOL)_hap2CharacteristicTuplesForHAPCharacteristics:(id)a3 tuples:(id *)a4 error:(id *)a5;
- (BOOL)_isActiveServer:(id)a3;
- (BOOL)doesPeriodicSessionChecks;
- (BOOL)hasAdvertisement;
- (BOOL)isInternallyPaired;
- (BOOL)isReachable;
- (BOOL)isSecuritySessionOpen;
- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4;
- (BOOL)shouldDiscoverAccessoriesOncePaired;
- (BOOL)shouldSkipUserConsent;
- (BOOL)stopPairingWithError:(id *)a3;
- (BOOL)supportsTimedWrite;
- (BOOL)tryPairingPassword:(id)a3 onboardingSetupPayloadString:(id)a4 error:(id *)a5;
- (HAP2AccessorySessionInfo)sessionInfo;
- (HAP2Cancelable)pairingSessionCancelable;
- (HAP2PairedAccessoryServer)pairedServer;
- (HAP2SerializedOperationQueue)operationQueue;
- (HAP2UnpairedAccessoryServer)unpairedServer;
- (HAPAccessoryServerHAP2Adapter)initWithOperationQueue:(id)a3 accessoryServer:(id)a4;
- (HAPAccessoryServerHAP2Adapter)initWithPairedServer:(id)a3;
- (HAPAccessoryServerHAP2Adapter)initWithUnpairedServer:(id)a3;
- (HMFTimer)connectionIdleTimer;
- (NSString)description;
- (double)disconnectOnIdleTimeout;
- (id)_accessoryFromHAP2Accessory:(id)a3;
- (id)_hapIdentifierForAccessory:(id)a3;
- (id)accessories;
- (id)activeServer;
- (id)authValidationCompletion;
- (id)authenticateUUIDCompletion;
- (id)category;
- (id)clientQueue;
- (id)currentIdentity;
- (id)primaryAccessory;
- (id)productData;
- (id)reachabilityChangedReason;
- (id)setupCodeCompletion;
- (id)setupHash;
- (id)softwareAuthFinishedCompletion;
- (id)userConsentCompletion;
- (id)version;
- (int64_t)linkLayerType;
- (int64_t)linkType;
- (unint64_t)configNumber;
- (unint64_t)numActiveSessionClients;
- (unint64_t)sessionCheckInterval;
- (void)_continuePairingAfterAuthPromptWithError:(id)a3;
- (void)_enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6;
- (void)_firedConnectionIdleTimer:(id)a3;
- (void)_handleConnectionIdleTimeout;
- (void)_handleIncorrectStartPairingCall;
- (void)_informDelegateOfUpdatedAccessories:(id)a3 error:(id)a4;
- (void)_kickConnectionIdleTimer;
- (void)_notifyDelegatePairingStoppedWithError:(id)a3;
- (void)_printMissingValues:(id)a3;
- (void)_readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)_resetPairingState;
- (void)_startConnectionIdleTimer;
- (void)_suspendConnectionIdleTimer;
- (void)_writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)accessory:(id)a3 didNotifyForUpdatedValuesOnCharacteristic:(id)a4;
- (void)accessoryServer:(id)a3 authenticateSoftwareAuthUUID:(id)a4 token:(id)a5 completion:(id)a6;
- (void)accessoryServer:(id)a3 confirmSoftwareAuthUUID:(id)a4 token:(id)a5 completion:(id)a6;
- (void)accessoryServer:(id)a3 didCompleteWithError:(id)a4;
- (void)accessoryServer:(id)a3 didFailToUpdateAccessoriesWithError:(id)a4;
- (void)accessoryServer:(id)a3 didFinishAuthWithError:(id)a4;
- (void)accessoryServer:(id)a3 didRejectSetupCodeWithBackoffInterval:(double)a4 completion:(id)a5;
- (void)accessoryServer:(id)a3 doesRequirePermission:(unint64_t)a4 completion:(id)a5;
- (void)accessoryServer:(id)a3 doesRequireSetupCodeWithCompletion:(id)a4;
- (void)accessoryServer:(id)a3 validatePairingCert:(id)a4 model:(id)a5 completion:(id)a6;
- (void)accessoryServer:(id)a3 validateSoftwareAuthUUID:(id)a4 token:(id)a5 model:(id)a6 completion:(id)a7;
- (void)accessoryServerConnectedWithSecureSession;
- (void)accessoryServerConnectionFailureReportWithError:(id)a3;
- (void)accessoryServerDidBecomeUnpaired:(id)a3;
- (void)accessoryServerDidUpdateAccessories:(id)a3;
- (void)accessoryServerDidUpdateCategory:(id)a3;
- (void)accessoryServerDidUpdateConnectionState:(id)a3;
- (void)accessoryServerDidUpdateHasPairings:(id)a3;
- (void)accessoryServerDidUpdateName:(id)a3;
- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)authenticateAccessory;
- (void)closeSessions;
- (void)continueAuthAfterValidation:(BOOL)a3;
- (void)continuePairingAfterAuthPrompt;
- (void)continuePairingUsingWAC;
- (void)disconnectOnIdleUpdated;
- (void)discoverAccessories;
- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6;
- (void)handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4;
- (void)identifyWithCompletion:(id)a3;
- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)provisionToken:(id)a3;
- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)setAccessories:(id)a3;
- (void)setAuthValidationCompletion:(id)a3;
- (void)setAuthenticateUUIDCompletion:(id)a3;
- (void)setConnectionIdleTimer:(id)a3;
- (void)setDisconnectOnIdleTimeout:(double)a3;
- (void)setDiscoverAccessoriesOncePaired:(BOOL)a3;
- (void)setInternallyPaired:(BOOL)a3;
- (void)setPairedServer:(id)a3;
- (void)setPairingSessionCancelable:(id)a3;
- (void)setPrimaryAccessory:(id)a3;
- (void)setSecuritySessionOpen:(BOOL)a3;
- (void)setSessionInfo:(id)a3;
- (void)setSessionInfoWithNumIPsResolved:(unint64_t)a3 numIPsTried:(unint64_t)a4 numBonjourNames:(unint64_t)a5;
- (void)setSetupCodeCompletion:(id)a3;
- (void)setShouldBePaired:(BOOL)a3;
- (void)setSkipUserConsent:(BOOL)a3;
- (void)setSoftwareAuthFinishedCompletion:(id)a3;
- (void)setUnpairedServer:(id)a3;
- (void)setUserConsentCompletion:(id)a3;
- (void)startPairingWithRequest:(id)a3;
- (void)startPing;
- (void)stopPing;
- (void)updateActiveDisconnectOnIdleTimeout:(double)a3;
- (void)validatePairingAuthMethod:(id)a3;
- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
@end

@implementation HAPAccessoryServerHAP2Adapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_connectionIdleTimer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_primaryAccessory, 0);
  objc_storeStrong(&self->_authenticateUUIDCompletion, 0);
  objc_storeStrong(&self->_softwareAuthFinishedCompletion, 0);
  objc_storeStrong(&self->_authValidationCompletion, 0);
  objc_storeStrong(&self->_userConsentCompletion, 0);
  objc_storeStrong(&self->_setupCodeCompletion, 0);
  objc_storeStrong((id *)&self->_pairingSessionCancelable, 0);
  objc_storeStrong((id *)&self->_pairedServer, 0);

  objc_storeStrong((id *)&self->_unpairedServer, 0);
}

- (void)setSessionInfo:(id)a3
{
}

- (HAP2AccessorySessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (void)setDisconnectOnIdleTimeout:(double)a3
{
  self->_disconnectOnIdleTimeout = a3;
}

- (double)disconnectOnIdleTimeout
{
  return self->_disconnectOnIdleTimeout;
}

- (void)setConnectionIdleTimer:(id)a3
{
}

- (HMFTimer)connectionIdleTimer
{
  return self->_connectionIdleTimer;
}

- (HAP2SerializedOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setSkipUserConsent:(BOOL)a3
{
  self->_skipUserConsent = a3;
}

- (void)setInternallyPaired:(BOOL)a3
{
  self->_internallyPaired = a3;
}

- (BOOL)isInternallyPaired
{
  return self->_internallyPaired;
}

- (HAP2PairedAccessoryServer)pairedServer
{
  return self->_pairedServer;
}

- (HAP2UnpairedAccessoryServer)unpairedServer
{
  return self->_unpairedServer;
}

- (void)_firedConnectionIdleTimer:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HAPAccessoryServerHAP2Adapter__firedConnectionIdleTimer___block_invoke;
  v7[3] = &unk_1E69F4540;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 addBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __59__HAPAccessoryServerHAP2Adapter__firedConnectionIdleTimer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    v5 = [WeakRetained connectionIdleTimer];

    if (v4 == v5)
    {
      [v3 _handleConnectionIdleTimeout];
      [v3 setConnectionIdleTimer:0];
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v6 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEFAULT, "Accessory server died", v7, 2u);
    }
  }
}

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)HAPAccessoryServerHAP2Adapter;
  id v4 = [(HMFObject *)&v9 description];
  v5 = [(HAPAccessoryServer *)self name];
  id v6 = [(HAPAccessoryServer *)self identifier];
  v7 = [v3 stringWithFormat:@"%@ [%@/%@]", v4, v5, v6];

  return (NSString *)v7;
}

- (void)accessoryServer:(id)a3 validateSoftwareAuthUUID:(id)a4 token:(id)a5 model:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_initWeak(&location, self);
  v17 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __97__HAPAccessoryServerHAP2Adapter_accessoryServer_validateSoftwareAuthUUID_token_model_completion___block_invoke;
  v22[3] = &unk_1E69F42C0;
  objc_copyWeak(&v27, &location);
  id v18 = v16;
  id v26 = v18;
  id v19 = v13;
  id v23 = v19;
  id v20 = v14;
  id v24 = v20;
  id v21 = v15;
  id v25 = v21;
  [v17 addBlock:v22];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __97__HAPAccessoryServerHAP2Adapter_accessoryServer_validateSoftwareAuthUUID_token_model_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = [WeakRetained delegate];
  uint64_t v4 = *(void *)(a1 + 56);
  if (v3)
  {
    [WeakRetained setAuthValidationCompletion:*(void *)(a1 + 56)];
    v5 = [WeakRetained delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__HAPAccessoryServerHAP2Adapter_accessoryServer_validateSoftwareAuthUUID_token_model_completion___block_invoke_2;
    block[3] = &unk_1E69F20B0;
    id v8 = v3;
    id v9 = WeakRetained;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    dispatch_async(v5, block);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
  }
}

uint64_t __97__HAPAccessoryServerHAP2Adapter_accessoryServer_validateSoftwareAuthUUID_token_model_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServer:*(void *)(a1 + 40) validateUUID:*(void *)(a1 + 48) token:*(void *)(a1 + 56) model:*(void *)(a1 + 64)];
}

- (void)accessoryServer:(id)a3 validatePairingCert:(id)a4 model:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  id v14 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__HAPAccessoryServerHAP2Adapter_accessoryServer_validatePairingCert_model_completion___block_invoke;
  v18[3] = &unk_1E69F4298;
  objc_copyWeak(&v22, &location);
  id v15 = v13;
  id v21 = v15;
  id v16 = v11;
  id v19 = v16;
  id v17 = v12;
  id v20 = v17;
  [v14 addBlock:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __86__HAPAccessoryServerHAP2Adapter_accessoryServer_validatePairingCert_model_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = [WeakRetained delegate];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v3)
  {
    [WeakRetained setAuthValidationCompletion:*(void *)(a1 + 48)];
    v5 = [WeakRetained delegateQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __86__HAPAccessoryServerHAP2Adapter_accessoryServer_validatePairingCert_model_completion___block_invoke_2;
    v7[3] = &unk_1E69F4098;
    id v8 = v3;
    id v9 = WeakRetained;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
  }
}

uint64_t __86__HAPAccessoryServerHAP2Adapter_accessoryServer_validatePairingCert_model_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServer:*(void *)(a1 + 40) validateCert:*(void *)(a1 + 48) model:*(void *)(a1 + 56)];
}

- (void)accessoryServer:(id)a3 didFinishAuthWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__HAPAccessoryServerHAP2Adapter_accessoryServer_didFinishAuthWithError___block_invoke;
  v10[3] = &unk_1E69F4540;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 addBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __72__HAPAccessoryServerHAP2Adapter_accessoryServer_didFinishAuthWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained pairingActivity];
  [*(id *)(a1 + 32) domain];

  [*(id *)(a1 + 32) code];
  uint64_t v4 = [WeakRetained delegate];
  v5 = [WeakRetained delegateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HAPAccessoryServerHAP2Adapter_accessoryServer_didFinishAuthWithError___block_invoke_2;
  block[3] = &unk_1E69F4708;
  id v8 = v4;
  id v9 = WeakRetained;
  id v10 = *(id *)(a1 + 32);
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __72__HAPAccessoryServerHAP2Adapter_accessoryServer_didFinishAuthWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServer:*(void *)(a1 + 40) didFinishAuth:*(void *)(a1 + 48)];
}

- (void)accessoryServer:(id)a3 confirmSoftwareAuthUUID:(id)a4 token:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  id v14 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __90__HAPAccessoryServerHAP2Adapter_accessoryServer_confirmSoftwareAuthUUID_token_completion___block_invoke;
  v18[3] = &unk_1E69F4298;
  objc_copyWeak(&v22, &location);
  id v15 = v13;
  id v21 = v15;
  id v16 = v11;
  id v19 = v16;
  id v17 = v12;
  id v20 = v17;
  [v14 addBlock:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __90__HAPAccessoryServerHAP2Adapter_accessoryServer_confirmSoftwareAuthUUID_token_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = [WeakRetained delegate];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v3)
  {
    [WeakRetained setSoftwareAuthFinishedCompletion:*(void *)(a1 + 48)];
    v5 = [WeakRetained delegateQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __90__HAPAccessoryServerHAP2Adapter_accessoryServer_confirmSoftwareAuthUUID_token_completion___block_invoke_2;
    v7[3] = &unk_1E69F4098;
    id v8 = v3;
    id v9 = WeakRetained;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
  }
}

uint64_t __90__HAPAccessoryServerHAP2Adapter_accessoryServer_confirmSoftwareAuthUUID_token_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServer:*(void *)(a1 + 40) confirmUUID:*(void *)(a1 + 48) token:*(void *)(a1 + 56)];
}

- (void)accessoryServer:(id)a3 authenticateSoftwareAuthUUID:(id)a4 token:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  id v14 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __95__HAPAccessoryServerHAP2Adapter_accessoryServer_authenticateSoftwareAuthUUID_token_completion___block_invoke;
  v18[3] = &unk_1E69F4298;
  objc_copyWeak(&v22, &location);
  id v15 = v13;
  id v21 = v15;
  id v16 = v11;
  id v19 = v16;
  id v17 = v12;
  id v20 = v17;
  [v14 addBlock:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __95__HAPAccessoryServerHAP2Adapter_accessoryServer_authenticateSoftwareAuthUUID_token_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = [WeakRetained delegate];
  if (v3)
  {
    [WeakRetained setAuthenticateUUIDCompletion:*(void *)(a1 + 48)];
    uint64_t v4 = [WeakRetained delegateQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __95__HAPAccessoryServerHAP2Adapter_accessoryServer_authenticateSoftwareAuthUUID_token_completion___block_invoke_2;
    v6[3] = &unk_1E69F4098;
    id v7 = v3;
    id v8 = WeakRetained;
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    dispatch_async(v4, v6);
  }
  else
  {
    v5 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    [WeakRetained _notifyDelegatePairingStoppedWithError:v5];
  }
}

uint64_t __95__HAPAccessoryServerHAP2Adapter_accessoryServer_authenticateSoftwareAuthUUID_token_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServer:*(void *)(a1 + 40) authenticateUUID:*(void *)(a1 + 48) token:*(void *)(a1 + 56)];
}

- (void)accessoryServer:(id)a3 doesRequireSetupCodeWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__HAPAccessoryServerHAP2Adapter_accessoryServer_doesRequireSetupCodeWithCompletion___block_invoke;
  v10[3] = &unk_1E69F4630;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 addBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __84__HAPAccessoryServerHAP2Adapter_accessoryServer_doesRequireSetupCodeWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained delegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    [WeakRetained setSetupCodeCompletion:v4];
    v5 = [WeakRetained delegateQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__HAPAccessoryServerHAP2Adapter_accessoryServer_doesRequireSetupCodeWithCompletion___block_invoke_2;
    v7[3] = &unk_1E69F46E0;
    id v8 = v3;
    id v9 = WeakRetained;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v6);
  }
}

uint64_t __84__HAPAccessoryServerHAP2Adapter_accessoryServer_doesRequireSetupCodeWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServer:*(void *)(a1 + 40) promptUserForPasswordWithType:1];
}

- (void)accessoryServer:(id)a3 didRejectSetupCodeWithBackoffInterval:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__HAPAccessoryServerHAP2Adapter_accessoryServer_didRejectSetupCodeWithBackoffInterval_completion___block_invoke;
  v12[3] = &unk_1E69F4248;
  objc_copyWeak(v14, &location);
  id v11 = v9;
  id v13 = v11;
  v14[1] = *(id *)&a4;
  [v10 addBlock:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __98__HAPAccessoryServerHAP2Adapter_accessoryServer_didRejectSetupCodeWithBackoffInterval_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained delegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    [WeakRetained setSetupCodeCompletion:*(void *)(a1 + 32)];
    v5 = [WeakRetained delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__HAPAccessoryServerHAP2Adapter_accessoryServer_didRejectSetupCodeWithBackoffInterval_completion___block_invoke_2;
    block[3] = &unk_1E69F2088;
    id v8 = v3;
    id v9 = WeakRetained;
    uint64_t v10 = *(void *)(a1 + 48);
    dispatch_async(v5, block);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v6);
  }
}

uint64_t __98__HAPAccessoryServerHAP2Adapter_accessoryServer_didRejectSetupCodeWithBackoffInterval_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServer:*(void *)(a1 + 40) didReceiveBadPasswordThrottleAttemptsWithDelay:(uint64_t)*(double *)(a1 + 48)];
}

- (void)accessoryServer:(id)a3 doesRequirePermission:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  uint64_t v10 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__HAPAccessoryServerHAP2Adapter_accessoryServer_doesRequirePermission_completion___block_invoke;
  v12[3] = &unk_1E69F4248;
  objc_copyWeak(v14, &location);
  id v11 = v9;
  id v13 = v11;
  v14[1] = (id)a4;
  [v10 addBlock:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __82__HAPAccessoryServerHAP2Adapter_accessoryServer_doesRequirePermission_completion___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained unpairedServer];
  if (!v3)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v8 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = WeakRetained;
      _os_log_error_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%@ Accessory server is paired (expected unpaired)", buf, 0xCu);
    }
    uint64_t v9 = *(void *)(a1 + 32);
    v5 = [MEMORY[0x1E4F28C58] hapErrorWithCode:18];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v5);
    goto LABEL_28;
  }
  if ((unint64_t)(*(void *)(a1 + 48) - 1) > 1
    || ![WeakRetained shouldSkipUserConsent])
  {
    v5 = [WeakRetained delegate];
    if (v5)
    {
      [WeakRetained setUserConsentCompletion:*(void *)(a1 + 32)];
      uint64_t v6 = *(void *)(a1 + 48);
      if ((unint64_t)(v6 - 3) >= 2)
      {
        if (v6 == 1)
        {
          uint64_t v7 = 0;
          goto LABEL_27;
        }
        if (v6 == 2)
        {
          uint64_t v7 = 3;
LABEL_27:
          [WeakRetained setUserConsentCompletion:*(void *)(a1 + 32)];
          id v15 = [WeakRetained delegateQueue];
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __82__HAPAccessoryServerHAP2Adapter_accessoryServer_doesRequirePermission_completion___block_invoke_246;
          v16[3] = &unk_1E69F4518;
          id v17 = v3;
          id v18 = v5;
          id v19 = WeakRetained;
          uint64_t v20 = v7;
          dispatch_async(v15, v16);

          goto LABEL_28;
        }
      }
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = 9;
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v10 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = WeakRetained;
        _os_log_error_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%@ Delegate doesn't support auth prompts", buf, 0xCu);
      }
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = 2;
    }
    id v14 = [v12 hapErrorWithCode:v13];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v14);

LABEL_28:
    goto LABEL_29;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v4 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = WeakRetained;
    _os_log_debug_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEBUG, "%@ Skipping user consent as requested", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_29:
}

void __82__HAPAccessoryServerHAP2Adapter_accessoryServer_doesRequirePermission_completion___block_invoke_246(uint64_t a1)
{
  v2 = [HAPAccessoryInfo alloc];
  v3 = [*(id *)(a1 + 32) name];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "category"));
  v5 = [(HAPAccessoryInfo *)v2 initWithName:v3 manufacturer:0 modelName:0 category:v4 certificationStatus:0 denylisted:0 ppid:0];

  [*(id *)(a1 + 40) accessoryServer:*(void *)(a1 + 48) requestUserPermission:*(void *)(a1 + 56) accessoryInfo:v5 error:0];
}

- (void)accessoryServer:(id)a3 didCompleteWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__HAPAccessoryServerHAP2Adapter_accessoryServer_didCompleteWithError___block_invoke;
  v10[3] = &unk_1E69F4540;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 addBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __70__HAPAccessoryServerHAP2Adapter_accessoryServer_didCompleteWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _resetPairingState];
  if (*(void *)(a1 + 32))
  {
    v2 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithHMErrorCode:reason:underlyingError:", 79, 0);
  }
  else
  {
    v2 = 0;
  }
  [WeakRetained _notifyDelegatePairingStoppedWithError:v2];
}

- (id)_accessoryFromHAP2Accessory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 instanceID];
  id v6 = [HAPAccessory alloc];
  id v7 = [NSNumber numberWithUnsignedInteger:v5];
  id v8 = [v4 services];
  id v9 = (void *)[v8 copy];
  uint64_t v10 = [(HAPAccessory *)v6 initWithServer:self instanceID:v7 parsedServices:v9];

  if (v10)
  {
    id v11 = [(HAPAccessoryServer *)self identifier];
    [(HAPAccessory *)v10 setIdentifier:v11];

    id v12 = [(HAPAccessoryServer *)self identifier];
    [(HAPAccessory *)v10 setServerIdentifier:v12];

    -[HAPAccessory setPrimary:](v10, "setPrimary:", [v4 isPrimary]);
    uint64_t v13 = NSNumber;
    [v4 sleepInterval];
    id v15 = [v13 numberWithUnsignedInteger:(unint64_t)(v14 * 1000.0)];
    [(HAPAccessory *)v10 setSleepInterval:v15];

    id v16 = [v4 name];
    [(HAPAccessory *)v10 setName:v16];

    id v17 = [(HAPAccessory *)v10 services];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __61__HAPAccessoryServerHAP2Adapter__accessoryFromHAP2Accessory___block_invoke;
    v21[3] = &unk_1E69F31E8;
    id v18 = v10;
    id v22 = v18;
    [v17 enumerateObjectsUsingBlock:v21];

    id v19 = v18;
  }

  return v10;
}

uint64_t __61__HAPAccessoryServerHAP2Adapter__accessoryFromHAP2Accessory___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAccessory:*(void *)(a1 + 32)];
}

- (void)accessoryServer:(id)a3 didFailToUpdateAccessoriesWithError:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(HAPAccessoryServerHAP2Adapter *)self _isActiveServer:a3])
  {
    [(HAPAccessoryServerHAP2Adapter *)self _informDelegateOfUpdatedAccessories:0 error:v6];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = self;
      _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%@ Accessory server is no longer active.  Ignoring accessory update failure propagation.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)accessoryServerDidUpdateAccessories:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HAPAccessoryServerHAP2Adapter *)self _isActiveServer:v4];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v6 = hap2Log_accessory;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%@ Accessory server has updated accessories", buf, 0xCu);
    }
    id v7 = [v4 accessories];
    int v8 = [(HAPAccessoryServerHAP2Adapter *)self accessories];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    id v25 = 0;
    id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    uint64_t v10 = (void *)MEMORY[0x1D944E080]();
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __69__HAPAccessoryServerHAP2Adapter_accessoryServerDidUpdateAccessories___block_invoke;
    id v19 = &unk_1E69F2060;
    uint64_t v20 = self;
    uint64_t v23 = buf;
    id v11 = v8;
    id v21 = v11;
    id v12 = v9;
    id v22 = v12;
    [v7 enumerateObjectsUsingBlock:&v16];

    uint64_t v13 = objc_msgSend(v12, "copy", v16, v17, v18, v19, v20);
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)&self->_accessories, v13);
    os_unfair_lock_unlock(&self->super._lock);
    [(HAPAccessoryServerHAP2Adapter *)self _informDelegateOfUpdatedAccessories:v13 error:0];

    _Block_object_dispose(buf, 8);
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    double v14 = v6;
    id v15 = [(HAPAccessoryServerHAP2Adapter *)self activeServer];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    id v25 = v15;
    _os_log_error_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%@ Incoming accessory server (%@) isn't the active one (%@)", buf, 0x20u);
  }
}

void __69__HAPAccessoryServerHAP2Adapter_accessoryServerDidUpdateAccessories___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _accessoryFromHAP2Accessory:v3];
  if (v4)
  {
    [v3 setDelegate:*(void *)(a1 + 32)];
    while (1)
    {
      unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v5 >= [*(id *)(a1 + 40) count]) {
        break;
      }
      id v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
      id v7 = [v6 instanceID];
      int v8 = [v4 instanceID];
      char v9 = [v7 isEqualToNumber:v8];

      if (v9)
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        if (v6)
        {
          uint64_t v16 = (void *)MEMORY[0x1E4F1CA48];
          uint64_t v17 = [v4 services];
          id v18 = objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));

          id v19 = [v6 services];
          uint64_t v20 = [v4 services];
          +[HAPService hap2_mergeServices:v19 discoveredServices:v20 mergedServices:v18];

          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __69__HAPAccessoryServerHAP2Adapter_accessoryServerDidUpdateAccessories___block_invoke_2;
          v23[3] = &unk_1E69F31E8;
          id v24 = v6;
          id v21 = v6;
          [v18 enumerateObjectsUsingBlock:v23];
          id v22 = (void *)[v18 copy];
          [v21 setServices:v22];

          [*(id *)(a1 + 48) addObject:v21];
          goto LABEL_15;
        }
        break;
      }
      uint64_t v10 = [v6 instanceID];
      unsigned int v11 = [v10 unsignedIntValue];
      id v12 = [v4 instanceID];
      unsigned int v13 = [v12 unsignedIntValue];

      if (v11 > v13)
      {

        break;
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    }
    [*(id *)(a1 + 48) addObject:v4];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    double v14 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v15;
      __int16 v27 = 2112;
      id v28 = v3;
      _os_log_error_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%@ Failed to validate HAP2Accessory: %@", buf, 0x16u);
    }
  }
LABEL_15:
}

uint64_t __69__HAPAccessoryServerHAP2Adapter_accessoryServerDidUpdateAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setAccessory:*(void *)(a1 + 32)];
}

- (void)accessoryServerDidBecomeUnpaired:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(HAPAccessoryServerHAP2Adapter *)self _isActiveServer:a3])
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v4 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = self;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEFAULT, "%@ Accessory server has become unpaired", (uint8_t *)&v6, 0xCu);
    }
    [(HAPAccessoryServerHAP2Adapter *)self stopPing];
    os_unfair_lock_lock_with_options();
    accessories = self->_accessories;
    self->_accessories = (NSArray *)MEMORY[0x1E4F1CBF0];

    os_unfair_lock_unlock(&self->super._lock);
  }
}

- (id)currentIdentity
{
  v2 = [(HAPAccessoryServer *)self keyBag];
  id v3 = [v2 currentIdentity];

  return v3;
}

- (void)accessoryServerDidUpdateHasPairings:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  unint64_t v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    uint64_t v8 = self;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%@ Accessory server updated hasPairings", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = [v4 hasPairings];

  [(HAPAccessoryServer *)self setHasPairings:v6];
}

- (id)_hapIdentifierForAccessory:(id)a3
{
  id v3 = [a3 accessoryServer];
  id v4 = [v3 deviceID];
  unint64_t v5 = [v4 deviceIDString];

  return v5;
}

- (void)_informDelegateOfUpdatedAccessories:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HAPAccessoryServer *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [(HAPAccessoryServer *)self delegateQueue];
    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __75__HAPAccessoryServerHAP2Adapter__informDelegateOfUpdatedAccessories_error___block_invoke;
      v10[3] = &unk_1E69F4098;
      id v11 = v8;
      id v12 = self;
      id v13 = v6;
      id v14 = v7;
      dispatch_async(v9, v10);
    }
  }
}

uint64_t __75__HAPAccessoryServerHAP2Adapter__informDelegateOfUpdatedAccessories_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServer:*(void *)(a1 + 40) didDiscoverAccessories:*(void *)(a1 + 48) transaction:0 error:*(void *)(a1 + 56)];
}

- (BOOL)_isActiveServer:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F2C8C540]) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 0;
  }
  id v6 = v5;
  id v7 = [(HAPAccessoryServerHAP2Adapter *)self activeServer];
  char v8 = [v6 isEqual:v7];

  return v8;
}

- (void)discoverAccessories
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(HAPAccessoryServer *)self pairingActivity];
  [v3 begin];
  uint64_t v9 = [(HAPAccessoryServer *)self pairingActivity];

  id v4 = [(HAPAccessoryServerHAP2Adapter *)self pairedServer];

  if (v4)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    unint64_t v5 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = self;
      _os_log_debug_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEBUG, "%@ Accessory server requested to discover accessories", buf, 0xCu);
    }
    [(HAPAccessoryServerHAP2Adapter *)self setDiscoverAccessoriesOncePaired:0];
    id v6 = [(HAPAccessoryServerHAP2Adapter *)self pairedServer];
    id v7 = (id)[v6 updateAccessoriesWithReason:@"requested"];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    char v8 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = self;
      _os_log_debug_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%@ Accessory server requested to discover accessories, queued until paired", buf, 0xCu);
    }
    [(HAPAccessoryServerHAP2Adapter *)self setDiscoverAccessoriesOncePaired:1];
  }
  __HMFActivityScopeLeave();
}

- (void)handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(HAPAccessoryServer *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [(HAPAccessoryServer *)self delegateQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__HAPAccessoryServerHAP2Adapter_handleUpdatesForCharacteristics_stateNumber___block_invoke;
    v10[3] = &unk_1E69F4098;
    id v11 = v8;
    uint64_t v12 = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(v9, v10);
  }
}

void __77__HAPAccessoryServerHAP2Adapter_handleUpdatesForCharacteristics_stateNumber___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (id)[*(id *)(a1 + 48) copy];
  [v2 accessoryServer:v3 didUpdateValuesForCharacteristics:v4 stateNumber:*(void *)(a1 + 56) broadcast:0];
}

- (void)accessory:(id)a3 didNotifyForUpdatedValuesOnCharacteristic:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 service];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "instanceID"));
  uint64_t v10 = [v8 instanceID];
  id v11 = [v7 instanceID];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__10843;
  v49 = __Block_byref_object_dispose__10844;
  id v50 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__10843;
  v43 = __Block_byref_object_dispose__10844;
  id v44 = 0;
  uint64_t v12 = [(HAPAccessoryServerHAP2Adapter *)self accessories];
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  v32 = __85__HAPAccessoryServerHAP2Adapter_accessory_didNotifyForUpdatedValuesOnCharacteristic___block_invoke;
  v33 = &unk_1E69F2038;
  id v13 = v9;
  id v34 = v13;
  id v14 = v10;
  id v35 = v14;
  id v15 = v11;
  id v36 = v15;
  v37 = &v45;
  v38 = &v39;
  [v12 enumerateObjectsUsingBlock:&v30];

  if (v40[5])
  {
    uint64_t v16 = objc_msgSend(v7, "value", v30, v31, v32, v33, v34, v35);
    uint64_t v17 = v16;
    if (v16)
    {
      int v18 = [v16 conformsToProtocol:&unk_1F2C83AA8];
      if (v18) {
        id v19 = v17;
      }
      else {
        id v19 = 0;
      }
      id v20 = v19;
      if (v18) {
        uint64_t v21 = [v17 copyWithZone:0];
      }
      else {
        uint64_t v21 = [v17 copy];
      }
      uint64_t v23 = (void *)v21;
    }
    else
    {
      uint64_t v23 = 0;
    }

    id v24 = [v7 notificationContext];
    id v25 = (void *)[v24 copy];
    [(id)v40[5] setNotificationContext:v25];

    uint64_t v26 = (void *)[(id)v40[5] copy];
    [v26 setValue:v23];
    __int16 v27 = [(id)v40[5] service];
    [v26 setService:v27];

    id v28 = [(id)v46[5] server];
    v51 = v26;
    uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    [v28 handleUpdatesForCharacteristics:v29 stateNumber:0];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v22 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = self;
      _os_log_error_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%@ Didn't match characteristic for event", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);
}

void __85__HAPAccessoryServerHAP2Adapter_accessory_didNotifyForUpdatedValuesOnCharacteristic___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 instanceID];
  int v8 = [v7 isEqualToNumber:*(void *)(a1 + 32)];

  if (v8)
  {
    uint64_t v9 = [v6 services];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    id v14[2] = __85__HAPAccessoryServerHAP2Adapter_accessory_didNotifyForUpdatedValuesOnCharacteristic___block_invoke_2;
    v14[3] = &unk_1E69F2010;
    id v15 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    id v16 = v10;
    uint64_t v18 = v11;
    id v12 = v6;
    uint64_t v13 = *(void *)(a1 + 64);
    id v17 = v12;
    uint64_t v19 = v13;
    [v9 enumerateObjectsUsingBlock:v14];

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
      *a4 = 1;
    }
  }
}

void __85__HAPAccessoryServerHAP2Adapter_accessory_didNotifyForUpdatedValuesOnCharacteristic___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 instanceID];
  int v8 = [v7 isEqualToNumber:*(void *)(a1 + 32)];

  if (v8)
  {
    uint64_t v9 = [v6 characteristics];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__HAPAccessoryServerHAP2Adapter_accessory_didNotifyForUpdatedValuesOnCharacteristic___block_invoke_3;
    v12[3] = &unk_1E69F3918;
    id v13 = *(id *)(a1 + 40);
    long long v11 = *(_OWORD *)(a1 + 48);
    id v10 = (id)v11;
    long long v14 = v11;
    uint64_t v15 = *(void *)(a1 + 64);
    [v9 enumerateObjectsUsingBlock:v12];

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
      *a4 = 1;
    }
  }
}

void __85__HAPAccessoryServerHAP2Adapter_accessory_didNotifyForUpdatedValuesOnCharacteristic___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 instanceID];
  int v8 = [v7 isEqualToNumber:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)accessoryServerDidUpdateCategory:(id)a3
{
  id v5 = a3;
  if (-[HAPAccessoryServerHAP2Adapter _isActiveServer:](self, "_isActiveServer:"))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "category"));
    [(HAPAccessoryServer *)self setCategory:v4];
  }
}

- (void)accessoryServerDidUpdateName:(id)a3
{
  id v5 = a3;
  if (-[HAPAccessoryServerHAP2Adapter _isActiveServer:](self, "_isActiveServer:"))
  {
    id v4 = [v5 name];
    [(HAPAccessoryServer *)self setName:v4];
  }
}

- (void)accessoryServerConnectedWithSecureSession
{
  uint64_t v3 = [(HAPAccessoryServer *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(HAPAccessoryServer *)self delegate];
    id v5 = [(HAPAccessoryServerHAP2Adapter *)self sessionInfo];
    [v6 accessoryServer:self didUpdateConnectionState:1 sessionInfo:v5 linkLayerType:4 withError:0];
  }
}

- (void)accessoryServerConnectionFailureReportWithError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(HAPAccessoryServerHAP2Adapter *)self accessories];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v9++) invalidateWithError:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v10 = [(HAPAccessoryServer *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(HAPAccessoryServer *)self delegate];
    id v13 = [(HAPAccessoryServerHAP2Adapter *)self sessionInfo];
    [v12 accessoryServer:self didUpdateConnectionState:0 sessionInfo:v13 linkLayerType:4 withError:v4];
  }
}

- (void)accessoryServerDidUpdateConnectionState:(id)a3
{
  if ([(HAPAccessoryServerHAP2Adapter *)self _isActiveServer:a3])
  {
    BOOL v4 = [(HAPAccessoryServerHAP2Adapter *)self isReachable];
    [(HAPAccessoryServer *)self setReachable:v4];
  }
}

- (BOOL)_hap2CharacteristicTuplesForHAPCharacteristics:(id)a3 tuples:(id *)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(HAPAccessoryServerHAP2Adapter *)self pairedServer];

  if (!v9)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    long long v14 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = self;
      _os_log_error_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%@ Cannot get characteristics while unpaired", (uint8_t *)&buf, 0xCu);
      if (a5) {
        goto LABEL_9;
      }
    }
    else if (a5)
    {
LABEL_9:
      [MEMORY[0x1E4F28C58] hapErrorWithCode:3];
      BOOL v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    BOOL v13 = 0;
    goto LABEL_12;
  }
  id v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__10843;
  id v22 = __Block_byref_object_dispose__10844;
  id v23 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__HAPAccessoryServerHAP2Adapter__hap2CharacteristicTuplesForHAPCharacteristics_tuples_error___block_invoke;
  v16[3] = &unk_1E69F1FE8;
  void v16[4] = self;
  p_long long buf = &buf;
  id v11 = v10;
  id v17 = v11;
  [v8 enumerateObjectsUsingBlock:v16];
  id v12 = *(void **)(*((void *)&buf + 1) + 40);
  BOOL v13 = v12 == 0;
  if (v12)
  {
    if (a5) {
      *a5 = v12;
    }
  }
  else
  {
    *a4 = (id)[v11 copy];
  }

  _Block_object_dispose(&buf, 8);
LABEL_12:

  return v13;
}

void __93__HAPAccessoryServerHAP2Adapter__hap2CharacteristicTuplesForHAPCharacteristics_tuples_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;
  id v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 characteristic];

    id v8 = (id)v12;
  }
  BOOL v13 = [v8 service];
  long long v14 = [v13 accessory];
  long long v15 = v14;
  if (v14)
  {
    long long v16 = *(void **)(a1 + 40);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __93__HAPAccessoryServerHAP2Adapter__hap2CharacteristicTuplesForHAPCharacteristics_tuples_error___block_invoke_2;
    v41[3] = &unk_1E69F1F98;
    id v17 = v14;
    id v42 = v17;
    uint64_t v18 = [v16 indexOfObjectPassingTest:v41];
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v38 = a4;
      uint64_t v19 = [*(id *)(a1 + 32) pairedServer];
      uint64_t v20 = [v19 accessories];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __93__HAPAccessoryServerHAP2Adapter__hap2CharacteristicTuplesForHAPCharacteristics_tuples_error___block_invoke_3;
      v39[3] = &unk_1E69F1FC0;
      v40 = (HAP2CharacteristicTuple *)v17;
      uint64_t v21 = [v20 indexOfObjectPassingTest:v39];

      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v22 = *(void **)(a1 + 32);
        id v43 = v6;
        id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
        [v22 _printMissingValues:v23];

        uint64_t v24 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9];
        uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v26 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = v24;

        unsigned char *v38 = 1;
        __int16 v27 = v40;
LABEL_17:

        goto LABEL_18;
      }
      v33 = [HAP2CharacteristicTuple alloc];
      id v34 = [*(id *)(a1 + 32) pairedServer];
      id v35 = [v34 accessories];
      id v36 = [v35 objectAtIndexedSubscript:v21];
      __int16 v27 = [(HAP2CharacteristicTuple *)v33 initWithAccessory:v36];

      [*(id *)(a1 + 40) addObject:v27];
    }
    else
    {
      __int16 v27 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v18];
    }
    v37 = [(HAP2CharacteristicTuple *)v27 values];
    [v37 addObject:v6];

    goto LABEL_17;
  }
  id v28 = *(void **)(a1 + 32);
  v44[0] = v6;
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  [v28 _printMissingValues:v29];

  uint64_t v30 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9];
  uint64_t v31 = *(void *)(*(void *)(a1 + 48) + 8);
  v32 = *(void **)(v31 + 40);
  *(void *)(v31 + 40) = v30;

  *a4 = 1;
LABEL_18:
}

BOOL __93__HAPAccessoryServerHAP2Adapter__hap2CharacteristicTuplesForHAPCharacteristics_tuples_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 accessory];
  uint64_t v4 = [v3 instanceID];
  id v5 = [*(id *)(a1 + 32) instanceID];
  BOOL v6 = v4 == [v5 unsignedIntValue];

  return v6;
}

BOOL __93__HAPAccessoryServerHAP2Adapter__hap2CharacteristicTuplesForHAPCharacteristics_tuples_error___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 instanceID];
  int v5 = [v4 unsignedIntValue];
  uint64_t v6 = [v3 instanceID];

  return v6 == v5;
}

- (void)_printMissingValues:(id)a3
{
  id v4 = a3;
  int v5 = (void *)[v4 mutableCopy];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  uint64_t v6 = [(HAPAccessoryServerHAP2Adapter *)self pairedServer];
  uint64_t v7 = [v6 accessories];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_2;
  v11[3] = &unk_1E69F1F48;
  id v8 = v5;
  id v12 = v8;
  BOOL v13 = self;
  id v14 = &__block_literal_global_216;
  long long v15 = v16;
  [v7 enumerateObjectsUsingBlock:v11];

  if ([v8 count])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_228;
    v9[3] = &unk_1E69F1F70;
    v9[4] = self;
    id v10 = &__block_literal_global_216;
    [v8 enumerateObjectsUsingBlock:v9];
  }
  _Block_object_dispose(v16, 8);
}

void __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 services];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_3;
  v12[3] = &unk_1E69F1F20;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(a1 + 48);
  id v13 = v8;
  uint64_t v14 = v9;
  id v15 = v6;
  id v16 = v10;
  uint64_t v17 = *(void *)(a1 + 56);
  id v11 = v6;
  [v7 enumerateObjectsUsingBlock:v12];

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

void __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_228(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v3;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 characteristic];

    id v5 = (id)v9;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v10 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v13 = *(void (**)(uint64_t, id))(v11 + 16);
    uint64_t v14 = v10;
    id v15 = v13(v11, v5);
    int v16 = 138412802;
    uint64_t v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_error_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%@ Couldn't find characteristic (%@): %@", (uint8_t *)&v16, 0x20u);
  }
}

void __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 characteristics];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_4;
  v11[3] = &unk_1E69F1EF8;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v12 = v8;
  uint64_t v13 = v9;
  id v16 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 48);
  id v15 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v10 = v6;
  [v7 enumerateObjectsUsingBlock:v11];

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
}

void __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__10843;
  uint64_t v24 = __Block_byref_object_dispose__10844;
  id v25 = 0;
  id v7 = *(void **)(a1 + 32);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_220;
  uint64_t v13 = &unk_1E69F1ED0;
  id v8 = v6;
  uint64_t v19 = &v20;
  uint64_t v9 = *(void *)(a1 + 40);
  id v14 = v8;
  uint64_t v15 = v9;
  id v18 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  [v7 enumerateObjectsUsingBlock:&v10];
  if (v21[5])
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectsAtIndexes:", v10, v11, v12, v13, v14, v15, v16);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 32) count] == 0;
    *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  }

  _Block_object_dispose(&v20, 8);
}

void __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_220(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v5;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 characteristic];

    id v7 = (id)v11;
  }
  id v12 = [v7 type];
  uint64_t v13 = [*(id *)(a1 + 32) type];
  int v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (v15)
    {
      [v15 addIndex:a3];
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F28E60] indexSetWithIndex:a3];
      uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
      id v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v19 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = *(void *)(a1 + 40);
      uint64_t v21 = *(void *)(a1 + 64);
      uint64_t v22 = *(void (**)(uint64_t, id))(v21 + 16);
      id v23 = v19;
      uint64_t v24 = v22(v21, v7);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v33 = v31;
      __int16 v34 = 2112;
      *(void *)id v35 = v24;
      _os_log_error_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%@ Found missing characteristic %@", buf, 0x16u);

      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
    }
    uint64_t v20 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = *(void *)(a1 + 40);
      id v25 = *(void **)(a1 + 48);
      __int16 v27 = v20;
      LODWORD(v25) = [v25 instanceID];
      id v28 = [*(id *)(a1 + 56) instanceID];
      uint64_t v29 = [*(id *)(a1 + 32) instanceID];
      uint64_t v30 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138413314;
      uint64_t v33 = v26;
      __int16 v34 = 1024;
      *(_DWORD *)id v35 = v25;
      *(_WORD *)&v35[4] = 2112;
      *(void *)&v35[6] = v28;
      __int16 v36 = 2112;
      v37 = v29;
      __int16 v38 = 2112;
      uint64_t v39 = v30;
      _os_log_error_impl(&dword_1D4758000, v27, OS_LOG_TYPE_ERROR, "%@ (%d.%@.%@): %@", buf, 0x30u);
    }
  }
}

id __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = a2;
  id v4 = [v3 service];
  id v5 = [v4 accessory];
  id v6 = [v5 instanceID];
  id v7 = [v3 service];
  id v8 = [v7 instanceID];
  id v9 = [v3 instanceID];

  uint64_t v10 = [v2 stringWithFormat:@"%@.%@.%@", v6, v8, v9];

  return v10;
}

- (void)_writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  [v11 assertCurrentQueue];

  if ([v9 count])
  {
    id v25 = 0;
    id v26 = 0;
    BOOL v12 = [(HAPAccessoryServerHAP2Adapter *)self _hap2CharacteristicTuplesForHAPCharacteristics:v9 tuples:&v26 error:&v25];
    id v13 = v26;
    id v14 = v25;
    if (v12)
    {
      if ((unint64_t)[v13 count] < 2)
      {
        uint64_t v17 = [v13 firstObject];
        [(HAPAccessoryServerHAP2Adapter *)self _kickConnectionIdleTimer];
        id v18 = [v17 accessory];
        uint64_t v19 = [v17 values];
        uint64_t v20 = (void *)[v19 copy];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __102__HAPAccessoryServerHAP2Adapter__writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
        v22[3] = &unk_1E69F36F0;
        id v23 = v9;
        id v24 = v10;
        id v21 = (id)[v18 writeValuesForCharacteristics:v20 timeout:v22 completion:a4];
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        uint64_t v15 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v28 = self;
          _os_log_error_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%@ More than one accessory not supported at the moment", buf, 0xCu);
        }
        uint64_t v16 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9];
        (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
      }
    }
    else
    {
      (*((void (**)(id, void, id))v10 + 2))(v10, 0, v14);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, MEMORY[0x1E4F1CBF0], 0);
  }
}

void __102__HAPAccessoryServerHAP2Adapter__writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    id v8 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __102__HAPAccessoryServerHAP2Adapter__writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_2;
    v10[3] = &unk_1E69F2F90;
    id v11 = v7;
    id v9 = v7;
    [v8 enumerateObjectsUsingBlock:v10];
    [v5 enumerateObjectsUsingBlock:&__block_literal_global_213];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __102__HAPAccessoryServerHAP2Adapter__writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristic];
  [v2 addObject:v3];
}

void __102__HAPAccessoryServerHAP2Adapter__writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 characteristic];
  [v3 instanceID];

  id v4 = [v2 characteristic];
  [v4 type];

  id v5 = [v2 error];
  [v5 domain];

  id v6 = [v2 error];

  [v6 code];
}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc(MEMORY[0x1E4F653F0]);
  uint64_t v15 = NSString;
  uint64_t v16 = MEMORY[0x1D944D460](self, a2);
  uint64_t v17 = [v15 stringWithFormat:@"%@, %s:%ld", v16, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/HAP2/HAPAdapter/HAPAccessoryServerHAP2Adapter.m", 1293];
  id v18 = (void *)[v14 initWithName:v17];

  objc_initWeak(&location, self);
  uint64_t v19 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __101__HAPAccessoryServerHAP2Adapter_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
  v24[3] = &unk_1E69F1E88;
  objc_copyWeak(v29, &location);
  id v20 = v13;
  id v28 = v20;
  id v21 = v18;
  id v25 = v21;
  id v22 = v11;
  id v26 = v22;
  v29[1] = *(id *)&a4;
  id v23 = v12;
  id v27 = v23;
  [v19 addBlock:v24];

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
}

void __101__HAPAccessoryServerHAP2Adapter_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) begin];
    id v5 = *(id *)(a1 + 32);
    [WeakRetained _writeCharacteristicValues:*(void *)(a1 + 40) timeout:*(void *)(a1 + 48) completionQueue:*(void *)(a1 + 56) completionHandler:*(double *)(a1 + 72)];
    __HMFActivityScopeLeave();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 56);
    id v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
}

- (void)_readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  id v11 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  [v11 assertCurrentQueue];

  if ([v9 count])
  {
    id v24 = 0;
    id v25 = 0;
    BOOL v12 = [(HAPAccessoryServerHAP2Adapter *)self _hap2CharacteristicTuplesForHAPCharacteristics:v9 tuples:&v25 error:&v24];
    id v13 = v25;
    id v14 = v24;
    if (v12)
    {
      if ((unint64_t)[v13 count] < 2)
      {
        uint64_t v17 = [v13 firstObject];
        [(HAPAccessoryServerHAP2Adapter *)self _kickConnectionIdleTimer];
        id v18 = [v17 accessory];
        uint64_t v19 = [v17 values];
        id v20 = (void *)[v19 copy];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __101__HAPAccessoryServerHAP2Adapter__readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
        v22[3] = &unk_1E69F3028;
        id v23 = v10;
        id v21 = (id)[v18 readValuesForCharacteristics:v20 timeout:v22 completion:a4];
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        uint64_t v15 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v27 = self;
          _os_log_error_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%@ More than one accessory not supported at the moment", buf, 0xCu);
        }
        uint64_t v16 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9];
        (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
      }
    }
    else
    {
      (*((void (**)(id, void, id))v10 + 2))(v10, 0, v14);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, MEMORY[0x1E4F1CBF0], 0);
  }
}

void __101__HAPAccessoryServerHAP2Adapter__readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3) {
    [v3 enumerateObjectsUsingBlock:&__block_literal_global_209];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __101__HAPAccessoryServerHAP2Adapter__readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 characteristic];
  [v3 instanceID];

  id v4 = [v2 characteristic];
  [v4 type];

  id v5 = [v2 error];
  [v5 domain];

  id v6 = [v2 error];

  [v6 code];
}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc(MEMORY[0x1E4F653F0]);
  uint64_t v15 = NSString;
  uint64_t v16 = MEMORY[0x1D944D460](self, a2);
  uint64_t v17 = [v15 stringWithFormat:@"%@, %s:%ld", v16, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/HAP2/HAPAdapter/HAPAccessoryServerHAP2Adapter.m", 1216];
  id v18 = (void *)[v14 initWithName:v17];

  objc_initWeak(&location, self);
  uint64_t v19 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __100__HAPAccessoryServerHAP2Adapter_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
  v24[3] = &unk_1E69F1E88;
  objc_copyWeak(v29, &location);
  id v20 = v13;
  id v28 = v20;
  id v21 = v18;
  id v25 = v21;
  id v22 = v11;
  id v26 = v22;
  v29[1] = *(id *)&a4;
  id v23 = v12;
  id v27 = v23;
  [v19 addBlock:v24];

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
}

void __100__HAPAccessoryServerHAP2Adapter_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) begin];
    id v5 = *(id *)(a1 + 32);
    [WeakRetained _readCharacteristicValues:*(void *)(a1 + 40) timeout:*(void *)(a1 + 48) completionQueue:*(void *)(a1 + 56) completionHandler:*(double *)(a1 + 72)];
    __HMFActivityScopeLeave();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 56);
    id v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
}

- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__HAPAccessoryServerHAP2Adapter_listPairingsWithCompletionQueue_completionHandler___block_invoke;
  v12[3] = &unk_1E69F4070;
  id v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v8 = v7;
  id v9 = v6;
  id v10 = (void *)MEMORY[0x1D944E2D0](v12);
  id v11 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  [v11 addBlock:v10];
}

void __83__HAPAccessoryServerHAP2Adapter_listPairingsWithCompletionQueue_completionHandler___block_invoke(id *a1)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__HAPAccessoryServerHAP2Adapter_listPairingsWithCompletionQueue_completionHandler___block_invoke_2;
  v8[3] = &unk_1E69F36F0;
  id v9 = a1[4];
  id v10 = a1[6];
  id v2 = (void (**)(void, void, void))MEMORY[0x1D944E2D0](v8);
  uint64_t v3 = [a1[5] pairedServer];

  if (v3)
  {
    id v4 = [a1[5] pairedServer];
    id v5 = (id)[v4 getPairingsWithCompletion:v2];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v6 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, "Cannot list pairings if not paired", v7, 2u);
    }
    id v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:17];
    ((void (**)(void, void, void *))v2)[2](v2, 0, v4);
  }
}

void __83__HAPAccessoryServerHAP2Adapter_listPairingsWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__HAPAccessoryServerHAP2Adapter_listPairingsWithCompletionQueue_completionHandler___block_invoke_3;
  block[3] = &unk_1E69F4070;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __83__HAPAccessoryServerHAP2Adapter_listPairingsWithCompletionQueue_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__HAPAccessoryServerHAP2Adapter_removePairingForCurrentControllerOnQueue_completion___block_invoke;
  v13[3] = &unk_1E69F4070;
  id v14 = v6;
  id v15 = v7;
  v13[4] = self;
  id v8 = v6;
  id v9 = v7;
  id v10 = (void *)MEMORY[0x1D944E2D0](v13);
  id v11 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  [v11 addBlock:v10];

  return 1;
}

void __85__HAPAccessoryServerHAP2Adapter_removePairingForCurrentControllerOnQueue_completion___block_invoke(id *a1)
{
  id v2 = [a1[4] pairedServer];

  id v3 = a1[4];
  if (v2)
  {
    id v4 = [v3 pairedServer];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __85__HAPAccessoryServerHAP2Adapter_removePairingForCurrentControllerOnQueue_completion___block_invoke_3;
    v13[3] = &unk_1E69F3E20;
    id v5 = &v15;
    id v15 = a1[6];
    id v14 = a1[5];
    id v6 = (id)[v4 unpairWithCompletion:v13];

    goto LABEL_10;
  }
  id v7 = [v3 authValidationCompletion];
  id v8 = a1[4];
  if (v7)
  {
    [v8 setAuthValidationCompletion:0];
LABEL_7:
    id v10 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    ((void (**)(void, void *))v7)[2](v7, v10);

    goto LABEL_8;
  }
  uint64_t v9 = [v8 softwareAuthFinishedCompletion];
  if (v9)
  {
    id v7 = (void (**)(void, void))v9;
    [a1[4] setSoftwareAuthFinishedCompletion:0];
    goto LABEL_7;
  }
LABEL_8:
  id v11 = a1[6];
  if (!v11) {
    return;
  }
  id v12 = a1[5];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__HAPAccessoryServerHAP2Adapter_removePairingForCurrentControllerOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E69F3B20;
  id v5 = &v17;
  id v17 = v11;
  dispatch_async(v12, block);
LABEL_10:
}

void __85__HAPAccessoryServerHAP2Adapter_removePairingForCurrentControllerOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:17];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __85__HAPAccessoryServerHAP2Adapter_removePairingForCurrentControllerOnQueue_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    id v2 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__HAPAccessoryServerHAP2Adapter_removePairingForCurrentControllerOnQueue_completion___block_invoke_4;
    block[3] = &unk_1E69F3B20;
    id v4 = v1;
    dispatch_async(v2, block);
  }
}

uint64_t __85__HAPAccessoryServerHAP2Adapter_removePairingForCurrentControllerOnQueue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __81__HAPAccessoryServerHAP2Adapter_removePairing_completionQueue_completionHandler___block_invoke;
  uint64_t v19 = &unk_1E69F3D58;
  id v20 = v9;
  id v21 = self;
  id v22 = v8;
  id v23 = v10;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  id v14 = (void *)MEMORY[0x1D944E2D0](&v16);
  id v15 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  [v15 addBlock:v14];
}

void __81__HAPAccessoryServerHAP2Adapter_removePairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __81__HAPAccessoryServerHAP2Adapter_removePairing_completionQueue_completionHandler___block_invoke_2;
  id v9 = &unk_1E69F3E20;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 56);
  id v2 = (void (**)(void, void))MEMORY[0x1D944E2D0](&v6);
  id v3 = objc_msgSend(*(id *)(a1 + 40), "pairedServer", v6, v7, v8, v9);

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) pairedServer];
    id v5 = (id)[v4 removePairing:*(void *)(a1 + 48) completion:v2];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:17];
    ((void (**)(void, void *))v2)[2](v2, v4);
  }
}

void __81__HAPAccessoryServerHAP2Adapter_removePairing_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__HAPAccessoryServerHAP2Adapter_removePairing_completionQueue_completionHandler___block_invoke_3;
  v7[3] = &unk_1E69F3C68;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __81__HAPAccessoryServerHAP2Adapter_removePairing_completionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __78__HAPAccessoryServerHAP2Adapter_addPairing_completionQueue_completionHandler___block_invoke;
  uint64_t v19 = &unk_1E69F3D58;
  id v20 = v9;
  id v21 = self;
  id v22 = v8;
  id v23 = v10;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  id v14 = (void *)MEMORY[0x1D944E2D0](&v16);
  id v15 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  [v15 addBlock:v14];
}

void __78__HAPAccessoryServerHAP2Adapter_addPairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __78__HAPAccessoryServerHAP2Adapter_addPairing_completionQueue_completionHandler___block_invoke_2;
  id v9 = &unk_1E69F3E20;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 56);
  id v2 = (void (**)(void, void))MEMORY[0x1D944E2D0](&v6);
  id v3 = objc_msgSend(*(id *)(a1 + 40), "pairedServer", v6, v7, v8, v9);

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) pairedServer];
    id v5 = (id)[v4 addPairing:*(void *)(a1 + 48) completion:v2];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:17];
    ((void (**)(void, void *))v2)[2](v2, v4);
  }
}

void __78__HAPAccessoryServerHAP2Adapter_addPairing_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__HAPAccessoryServerHAP2Adapter_addPairing_completionQueue_completionHandler___block_invoke_3;
  v7[3] = &unk_1E69F3C68;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __78__HAPAccessoryServerHAP2Adapter_addPairing_completionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)stopPairingWithError:(id *)a3
{
  objc_initWeak(&location, self);
  id v4 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__HAPAccessoryServerHAP2Adapter_stopPairingWithError___block_invoke;
  v6[3] = &unk_1E69F4658;
  objc_copyWeak(&v7, &location);
  [v4 addBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return 1;
}

void __54__HAPAccessoryServerHAP2Adapter_stopPairingWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
  id v2 = [WeakRetained setupCodeCompletion];
  if (v2)
  {
    [WeakRetained setSetupCodeCompletion:0];
    ((void (**)(void, void, void *))v2)[2](v2, 0, v1);
  }
  else
  {
    id v3 = [WeakRetained userConsentCompletion];
    if (v3)
    {
      [WeakRetained setUserConsentCompletion:0];
      ((void (**)(void, void *))v3)[2](v3, v1);
    }
    else
    {
      id v4 = [WeakRetained pairingSessionCancelable];
      id v5 = v4;
      if (v4) {
        [v4 cancelWithError:v1];
      }
    }
  }
}

- (BOOL)tryPairingPassword:(id)a3 onboardingSetupPayloadString:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  id v9 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__HAPAccessoryServerHAP2Adapter_tryPairingPassword_onboardingSetupPayloadString_error___block_invoke;
  v12[3] = &unk_1E69F4540;
  objc_copyWeak(&v14, &location);
  id v10 = v7;
  id v13 = v10;
  [v9 addBlock:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return 1;
}

void __87__HAPAccessoryServerHAP2Adapter_tryPairingPassword_onboardingSetupPayloadString_error___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained setupCodeCompletion];
  if (v3)
  {
    [WeakRetained setSetupCodeCompletion:0];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      id v5 = 0;
    }
    else
    {
      id v5 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
      uint64_t v4 = *(void *)(a1 + 32);
    }
    ((void (**)(void, uint64_t, void *))v3)[2](v3, v4, v5);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v6 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = WeakRetained;
      _os_log_error_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, "%@ Pairing password provided, but wasn't expected", (uint8_t *)&v7, 0xCu);
    }
    [WeakRetained _handleIncorrectStartPairingCall];
  }
}

- (void)startPairingWithRequest:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F653F0]);
  int v7 = NSString;
  id v8 = MEMORY[0x1D944D460](self, a2);
  uint64_t v9 = [v7 stringWithFormat:@"%@, %s:%ld", v8, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/HAP2/HAPAdapter/HAPAccessoryServerHAP2Adapter.m", 987];
  id v10 = (void *)[v6 initWithName:v9];

  objc_initWeak(&location, self);
  id v11 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  id v14[2] = __57__HAPAccessoryServerHAP2Adapter_startPairingWithRequest___block_invoke;
  v14[3] = &unk_1E69F45E0;
  objc_copyWeak(&v17, &location);
  id v12 = v10;
  id v15 = v12;
  id v13 = v5;
  id v16 = v13;
  [v11 addBlock:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __57__HAPAccessoryServerHAP2Adapter_startPairingWithRequest___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained setPairingActivity:a1[4]];
  [WeakRetained setPairingRequest:a1[5]];
  id v3 = [WeakRetained softwareAuthFinishedCompletion];
  if (v3)
  {
    [WeakRetained setSoftwareAuthFinishedCompletion:0];
    v3[2](v3, 0);
  }
  else
  {
    uint64_t v4 = [WeakRetained pairingSessionCancelable];

    if (v4)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v5 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v21 = 138412290;
        *(void *)&void v21[4] = WeakRetained;
        _os_log_error_impl(&dword_1D4758000, v5, OS_LOG_TYPE_ERROR, "%@ Request to pair when we're already pairing, canceling", v21, 0xCu);
      }
      id v6 = [WeakRetained pairingSessionCancelable];
      int v7 = [MEMORY[0x1E4F28C58] hapErrorWithCode:4];
      [v6 cancelWithError:v7];
    }
    else
    {
      id v8 = [WeakRetained unpairedServer];
      if (v8)
      {
        uint64_t v9 = a1 + 5;
        objc_msgSend(WeakRetained, "setSkipUserConsent:", objc_msgSend(a1[5], "requiresUserConsent") ^ 1);
        id v11 = a1[4];
        id v10 = a1 + 4;
        id v12 = v11;
        id v13 = (id)HMFBooleanToString();
        id v14 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "connectionState"));
        id v15 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "category"));
        [*v9 requiresUserConsent];

        id v16 = (id)HMFBooleanToString();
        id v17 = [v8 protocolVersion];
        [v17 versionString];

        [*v10 begin];
        *(void *)id v21 = *v10;
        id v18 = [v8 pairWithDelegate:WeakRetained];
        [WeakRetained setPairingSessionCancelable:v18];

        __HMFActivityScopeLeave();
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        uint64_t v19 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id v21 = 138412290;
          *(void *)&void v21[4] = WeakRetained;
          _os_log_error_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%@ Ignoring request to pair an already paired accessory", v21, 0xCu);
        }
        id v20 = [MEMORY[0x1E4F28C58] hapErrorWithCode:18];
        [WeakRetained _notifyDelegatePairingStoppedWithError:v20];
      }
    }
  }
}

- (void)continuePairingUsingWAC
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)_continuePairingAfterAuthPromptWithError:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  [v5 assertCurrentQueue];

  id v6 = [(HAPAccessoryServerHAP2Adapter *)self userConsentCompletion];
  if (v6)
  {
    [(HAPAccessoryServerHAP2Adapter *)self setUserConsentCompletion:0];
    ((void (**)(void, id))v6)[2](v6, v4);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      uint64_t v9 = self;
      _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%@ Someone thinks we just prompted for auth but we didn't", (uint8_t *)&v8, 0xCu);
    }
    [(HAPAccessoryServerHAP2Adapter *)self _handleIncorrectStartPairingCall];
  }
}

- (void)continuePairingAfterAuthPrompt
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__HAPAccessoryServerHAP2Adapter_continuePairingAfterAuthPrompt__block_invoke;
  v4[3] = &unk_1E69F4658;
  objc_copyWeak(&v5, &location);
  [v3 addBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__HAPAccessoryServerHAP2Adapter_continuePairingAfterAuthPrompt__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _continuePairingAfterAuthPromptWithError:0];
}

- (void)_resetPairingState
{
  uint64_t v3 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  [v3 assertCurrentQueue];

  os_unfair_lock_lock_with_options();
  pairingSessionCancelable = self->_pairingSessionCancelable;
  self->_pairingSessionCancelable = 0;

  id setupCodeCompletion = self->_setupCodeCompletion;
  self->_id setupCodeCompletion = 0;

  id userConsentCompletion = self->_userConsentCompletion;
  self->_id userConsentCompletion = 0;

  id authValidationCompletion = self->_authValidationCompletion;
  self->_id authValidationCompletion = 0;

  id softwareAuthFinishedCompletion = self->_softwareAuthFinishedCompletion;
  self->_id softwareAuthFinishedCompletion = 0;

  id authenticateUUIDCompletion = self->_authenticateUUIDCompletion;
  self->_id authenticateUUIDCompletion = 0;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)_notifyDelegatePairingStoppedWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  [v5 assertCurrentQueue];

  id v6 = [(HAPAccessoryServer *)self delegate];
  if (v6)
  {
    id v7 = [(HAPAccessoryServer *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__HAPAccessoryServerHAP2Adapter__notifyDelegatePairingStoppedWithError___block_invoke;
    block[3] = &unk_1E69F4708;
    id v9 = v6;
    uint64_t v10 = self;
    id v11 = v4;
    dispatch_async(v7, block);
  }
  [(HAPAccessoryServerHAP2Adapter *)self setPairingSessionCancelable:0];
  [(HAPAccessoryServer *)self setPairingRequest:0];
}

uint64_t __72__HAPAccessoryServerHAP2Adapter__notifyDelegatePairingStoppedWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServer:*(void *)(a1 + 40) didStopPairingWithError:*(void *)(a1 + 48)];
}

- (void)_handleIncorrectStartPairingCall
{
  uint64_t v3 = [(HAPAccessoryServerHAP2Adapter *)self pairingSessionCancelable];

  if (v3)
  {
    id v5 = [(HAPAccessoryServerHAP2Adapter *)self pairingSessionCancelable];
    id v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    [v5 cancelWithError:v4];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    -[HAPAccessoryServerHAP2Adapter _notifyDelegatePairingStoppedWithError:](self, "_notifyDelegatePairingStoppedWithError:");
  }
}

- (void)validatePairingAuthMethod:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HAPAccessoryServerHAP2Adapter_validatePairingAuthMethod___block_invoke;
  v7[3] = &unk_1E69F4630;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 addBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __59__HAPAccessoryServerHAP2Adapter_validatePairingAuthMethod___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3];
  (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v3, 0);
}

- (void)provisionToken:(id)a3
{
  id v5 = a3;
  objc_initWeak(&location, self);
  id v6 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__HAPAccessoryServerHAP2Adapter_provisionToken___block_invoke;
  v8[3] = &unk_1E69F1E60;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a2;
  id v7 = v5;
  id v9 = v7;
  [v6 addBlock:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __48__HAPAccessoryServerHAP2Adapter_provisionToken___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained authenticateUUIDCompletion];
  if (v3)
  {
    [WeakRetained setAuthenticateUUIDCompletion:0];
    v3[2](v3, *(void *)(a1 + 32));
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v4 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      id v5 = *(const char **)(a1 + 48);
      id v6 = v4;
      id v7 = NSStringFromSelector(v5);
      int v8 = 138412546;
      id v9 = WeakRetained;
      __int16 v10 = 2112;
      id v11 = v7;
      _os_log_error_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, "%@ Incorrect call to %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  objc_initWeak(&location, self);
  id v5 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__HAPAccessoryServerHAP2Adapter_continueAuthAfterValidation___block_invoke;
  v6[3] = &unk_1E69F3768;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  [v5 addBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __61__HAPAccessoryServerHAP2Adapter_continueAuthAfterValidation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained authValidationCompletion];
  if (v2)
  {
    [WeakRetained setAuthValidationCompletion:0];
    uint64_t v3 = 0;
    if (!*(unsigned char *)(a1 + 40))
    {
      uint64_t v3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    }
    ((void (**)(void, void *))v2)[2](v2, v3);
  }
  else
  {
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    }
    [WeakRetained _continuePairingAfterAuthPromptWithError:v3];
  }
}

- (void)authenticateAccessory
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (unint64_t)numActiveSessionClients
{
  return 1;
}

- (unint64_t)sessionCheckInterval
{
  uint64_t v2 = [(HAPAccessoryServerHAP2Adapter *)self activeServer];
  [v2 sessionCheckInterval];
  unint64_t v4 = (unint64_t)v3;

  return v4;
}

- (BOOL)doesPeriodicSessionChecks
{
  return 1;
}

- (void)stopPing
{
  objc_initWeak(&location, self);
  unint64_t v4 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__HAPAccessoryServerHAP2Adapter_stopPing__block_invoke;
  v5[3] = &unk_1E69F4680;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a2;
  [v4 addBlock:v5];

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __41__HAPAccessoryServerHAP2Adapter_stopPing__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setReachabilityPingEnabled:0];
  double v3 = [WeakRetained pairedServer];

  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  unint64_t v4 = (void *)hap2Log_accessory;
  BOOL v5 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      id v7 = *(const char **)(a1 + 40);
      BOOL v8 = v4;
      id v9 = NSStringFromSelector(v7);
      int v13 = 138412546;
      id v14 = WeakRetained;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_debug_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%@ %@", (uint8_t *)&v13, 0x16u);
    }
    id v6 = [WeakRetained pairedServer];
    [v6 stopConfirming];
  }
  else if (v5)
  {
    __int16 v10 = *(const char **)(a1 + 40);
    id v11 = v4;
    uint64_t v12 = NSStringFromSelector(v10);
    int v13 = 138412546;
    id v14 = WeakRetained;
    __int16 v15 = 2112;
    id v16 = v12;
    _os_log_debug_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEBUG, "%@ %@: server not paired", (uint8_t *)&v13, 0x16u);
  }
}

- (void)startPing
{
  objc_initWeak(&location, self);
  unint64_t v4 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__HAPAccessoryServerHAP2Adapter_startPing__block_invoke;
  v5[3] = &unk_1E69F4680;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a2;
  [v4 addBlock:v5];

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __42__HAPAccessoryServerHAP2Adapter_startPing__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = [WeakRetained pairedServer];

  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  unint64_t v4 = (void *)hap2Log_accessory;
  BOOL v5 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      id v7 = *(const char **)(a1 + 40);
      BOOL v8 = v4;
      id v9 = NSStringFromSelector(v7);
      int v13 = 138412546;
      id v14 = WeakRetained;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_debug_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%@ %@", (uint8_t *)&v13, 0x16u);
    }
    [WeakRetained setReachabilityPingEnabled:1];
    id v6 = [WeakRetained pairedServer];
    [v6 startConfirming];
  }
  else if (v5)
  {
    __int16 v10 = *(const char **)(a1 + 40);
    id v11 = v4;
    uint64_t v12 = NSStringFromSelector(v10);
    int v13 = 138412546;
    id v14 = WeakRetained;
    __int16 v15 = 2112;
    id v16 = v12;
    _os_log_debug_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEBUG, "%@ %@: server not paired", (uint8_t *)&v13, 0x16u);
  }
}

- (void)closeSessions
{
  objc_initWeak(&location, self);
  unint64_t v4 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__HAPAccessoryServerHAP2Adapter_closeSessions__block_invoke;
  v5[3] = &unk_1E69F4680;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a2;
  [v4 addBlock:v5];

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __46__HAPAccessoryServerHAP2Adapter_closeSessions__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = [WeakRetained pairedServer];

  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  unint64_t v4 = (void *)hap2Log_accessory;
  BOOL v5 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      __int16 v10 = *(const char **)(a1 + 40);
      id v11 = v4;
      uint64_t v12 = NSStringFromSelector(v10);
      int v16 = 138412546;
      id v17 = WeakRetained;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_debug_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEBUG, "%@ %@", (uint8_t *)&v16, 0x16u);
    }
    id v6 = [WeakRetained pairedServer];
    [v6 closeSession];

    id v7 = [MEMORY[0x1E4F65530] sharedPreferences];
    BOOL v8 = [v7 preferenceForKey:@"HAPDefaultHAP2DisconnectOnIdleTimeoutSeconds"];
    id v9 = [v8 numberValue];
    [v9 doubleValue];
    objc_msgSend(WeakRetained, "setDisconnectOnIdleTimeout:");
  }
  else if (v5)
  {
    int v13 = *(const char **)(a1 + 40);
    id v14 = v4;
    __int16 v15 = NSStringFromSelector(v13);
    int v16 = 138412546;
    id v17 = WeakRetained;
    __int16 v18 = 2112;
    uint64_t v19 = v15;
    _os_log_debug_impl(&dword_1D4758000, v14, OS_LOG_TYPE_DEBUG, "%@ %@: server not paired", (uint8_t *)&v16, 0x16u);
  }
}

- (void)identifyWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HAPAccessoryServerHAP2Adapter *)self unpairedServer];
  if (!v5)
  {
    id v6 = [(HAPAccessoryServerHAP2Adapter *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__HAPAccessoryServerHAP2Adapter_identifyWithCompletion___block_invoke;
    block[3] = &unk_1E69F3B20;
    id v9 = v4;
    dispatch_async(v6, block);
  }
  id v7 = (id)[v5 identifyWithCompletion:v4];
}

void __56__HAPAccessoryServerHAP2Adapter_identifyWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:18];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  BOOL v8 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = a6;
  int v13 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  [v13 assertCurrentQueue];

  id v14 = [(HAPAccessoryServerHAP2Adapter *)self pairedServer];

  if (v14)
  {
    id v41 = 0;
    id v40 = 0;
    BOOL v15 = [(HAPAccessoryServerHAP2Adapter *)self _hap2CharacteristicTuplesForHAPCharacteristics:v10 tuples:&v41 error:&v40];
    id v16 = v41;
    id v17 = v40;
    if (v15)
    {
      if ((unint64_t)[v16 count] < 2)
      {
        uint64_t v19 = [v16 firstObject];
        id v21 = [v19 values];
        uint64_t v22 = [v21 count];

        if (v22)
        {
          id v23 = [v19 values];
          id v24 = (void *)[v23 copy];

          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_3;
          v30[3] = &unk_1E69F36F0;
          uint64_t v31 = v12;
          id v32 = v11;
          id v25 = (void *)MEMORY[0x1D944E2D0](v30);
          id v26 = [v19 accessory];
          id v27 = v26;
          if (v8) {
            id v28 = (id)[v26 enableNotificationsForCharacteristics:v24 completion:v25];
          }
          else {
            id v29 = (id)[v26 disableNotificationsForCharacteristics:v24 completion:v25];
          }
        }
        else
        {
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_2_191;
          v33[3] = &unk_1E69F3B20;
          id v34 = v11;
          dispatch_async(v12, v33);
          id v24 = v34;
        }
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        __int16 v18 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v45 = self;
          _os_log_error_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%@ More than one accessory not supported at the moment", buf, 0xCu);
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_190;
        block[3] = &unk_1E69F3B20;
        id v36 = v11;
        dispatch_async(v12, block);
        uint64_t v19 = v36;
      }
    }
    else
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_2;
      v37[3] = &unk_1E69F3C68;
      id v39 = v11;
      id v38 = v17;
      dispatch_async(v12, v37);

      uint64_t v19 = v39;
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v20 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v45 = self;
      _os_log_error_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%@ Cannot update notification configuration while unpaired", buf, 0xCu);
    }
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
    v42[3] = &unk_1E69F3B20;
    id v43 = v11;
    dispatch_async(v12, v42);
    id v16 = v43;
  }
}

void __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_190(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_2_191(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_4;
  block[3] = &unk_1E69F4070;
  id v12 = v5;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 enumerateObjectsUsingBlock:&__block_literal_global_10892];
  }
  double v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

void __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = [v2 characteristic];
  [v3 instanceID];

  id v4 = [v2 characteristic];
  [v4 type];

  id v5 = [v2 error];
  [v5 domain];

  id v6 = [v2 error];

  [v6 code];
}

- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93__HAPAccessoryServerHAP2Adapter_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
  v17[3] = &unk_1E69F43A8;
  objc_copyWeak(&v21, &location);
  id v14 = v12;
  id v18 = v14;
  id v15 = v11;
  id v20 = v15;
  BOOL v22 = a3;
  id v16 = v10;
  id v19 = v16;
  [v13 addBlock:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __93__HAPAccessoryServerHAP2Adapter_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _enableEvents:*(unsigned __int8 *)(a1 + 64) forCharacteristics:*(void *)(a1 + 40) withCompletionHandler:*(void *)(a1 + 48) queue:*(void *)(a1 + 32)];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v4 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEFAULT, "Accessory server died", buf, 2u);
    }
    id v5 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__HAPAccessoryServerHAP2Adapter_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_188;
    block[3] = &unk_1E69F3B20;
    id v7 = *(id *)(a1 + 48);
    dispatch_async(v5, block);
  }
}

void __93__HAPAccessoryServerHAP2Adapter_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_188(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)productData
{
  id v2 = [(HAPAccessoryServerHAP2Adapter *)self pairedServer];
  double v3 = [v2 productData];

  return v3;
}

- (BOOL)supportsTimedWrite
{
  return 1;
}

- (void)setSecuritySessionOpen:(BOOL)a3
{
  double v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  id v6 = NSStringFromSelector(a2);
  id v7 = [v5 stringWithFormat:@"%@ is unavailable", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (BOOL)isSecuritySessionOpen
{
  id v2 = [(HAPAccessoryServerHAP2Adapter *)self pairedServer];
  BOOL v3 = [v2 connectionState] == 3;

  return v3;
}

- (void)setPrimaryAccessory:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)primaryAccessory
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_primaryAccessory;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (int64_t)linkType
{
  return 1;
}

- (int64_t)linkLayerType
{
  return 4;
}

- (void)setAccessories:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HAPAccessoryServerHAP2Adapter_setAccessories___block_invoke;
  v7[3] = &unk_1E69F1E38;
  void v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];
  if (!*((unsigned char *)v9 + 24))
  {
    os_unfair_lock_lock_with_options();
    id v5 = (NSArray *)[v4 copy];
    accessories = self->_accessories;
    self->_accessories = v5;

    os_unfair_lock_unlock(&self->super._lock);
  }
  _Block_object_dispose(&v8, 8);
}

void __48__HAPAccessoryServerHAP2Adapter_setAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (id)accessories
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSArray *)self->_accessories copy];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)reachabilityChangedReason
{
  id v2 = [(HAPAccessoryServerHAP2Adapter *)self activeServer];
  id v3 = [v2 reachabilityChangedReason];

  return v3;
}

- (BOOL)hasAdvertisement
{
  id v2 = [(HAPAccessoryServerHAP2Adapter *)self activeServer];
  char v3 = [v2 hasDiscoveryAdvertisement];

  return v3;
}

- (unint64_t)configNumber
{
  id v2 = [(HAPAccessoryServerHAP2Adapter *)self activeServer];
  unint64_t v3 = [v2 configNumber];

  return v3;
}

- (id)setupHash
{
  id v2 = [(HAPAccessoryServerHAP2Adapter *)self activeServer];
  unint64_t v3 = [v2 setupHash];

  return v3;
}

- (id)version
{
  id v2 = [(HAPAccessoryServerHAP2Adapter *)self activeServer];
  unint64_t v3 = [v2 protocolVersion];

  return v3;
}

- (id)category
{
  id v2 = NSNumber;
  unint64_t v3 = [(HAPAccessoryServerHAP2Adapter *)self activeServer];
  id v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "category"));

  return v4;
}

- (BOOL)isReachable
{
  id v2 = [(HAPAccessoryServerHAP2Adapter *)self activeServer];
  uint64_t v3 = [v2 connectionState];

  return (unint64_t)(v3 - 1) < 4;
}

- (void)disconnectOnIdleUpdated
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__HAPAccessoryServerHAP2Adapter_disconnectOnIdleUpdated__block_invoke;
  v4[3] = &unk_1E69F4658;
  objc_copyWeak(&v5, &location);
  [v3 addBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __56__HAPAccessoryServerHAP2Adapter_disconnectOnIdleUpdated__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained onDemandConnectionsAreEnabled]) {
      [v2 _startConnectionIdleTimer];
    }
    else {
      [v2 _suspendConnectionIdleTimer];
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v3 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_DEFAULT, "Accessory server died", v4, 2u);
    }
  }
}

- (void)_kickConnectionIdleTimer
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  [v3 assertCurrentQueue];

  id v4 = [(HAPAccessoryServerHAP2Adapter *)self connectionIdleTimer];

  if (v4)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v5 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      uint64_t v8 = self;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%@ Kicking connection idle timer", (uint8_t *)&v7, 0xCu);
    }
    uint64_t v6 = [(HAPAccessoryServerHAP2Adapter *)self connectionIdleTimer];
    [v6 resume];
  }
}

- (void)_suspendConnectionIdleTimer
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  [v3 assertCurrentQueue];

  id v4 = [(HAPAccessoryServerHAP2Adapter *)self connectionIdleTimer];

  if (v4)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v5 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      int v7 = [(HAPAccessoryServerHAP2Adapter *)self connectionIdleTimer];
      [v7 timeInterval];
      int v10 = 138412546;
      char v11 = self;
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEFAULT, "%@ Suspending connection idle timer of: %fs", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v9 = [(HAPAccessoryServerHAP2Adapter *)self connectionIdleTimer];
    [v9 suspend];

    [(HAPAccessoryServerHAP2Adapter *)self setConnectionIdleTimer:0];
  }
}

- (void)_startConnectionIdleTimer
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  [v3 assertCurrentQueue];

  if ([(HAPAccessoryServerHAP2Adapter *)self onDemandConnectionsAreEnabled])
  {
    id v4 = [(HAPAccessoryServerHAP2Adapter *)self connectionIdleTimer];

    if (!v4)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F65580]);
      [(HAPAccessoryServerHAP2Adapter *)self disconnectOnIdleTimeout];
      uint64_t v6 = objc_msgSend(v5, "initWithTimeInterval:options:", 0);
      [(HAPAccessoryServerHAP2Adapter *)self setConnectionIdleTimer:v6];

      int v7 = [(HAPAccessoryServerHAP2Adapter *)self connectionIdleTimer];
      [v7 setDelegate:self];
    }
  }
  uint64_t v8 = [(HAPAccessoryServerHAP2Adapter *)self connectionIdleTimer];

  if (v8)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v9 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = v9;
      char v11 = [(HAPAccessoryServerHAP2Adapter *)self connectionIdleTimer];
      [v11 timeInterval];
      int v14 = 138412546;
      id v15 = self;
      __int16 v16 = 2048;
      uint64_t v17 = v12;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEFAULT, "%@ Starting connection idle timer of: %fs", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v13 = [(HAPAccessoryServerHAP2Adapter *)self connectionIdleTimer];
    [v13 resume];
  }
}

- (void)_handleConnectionIdleTimeout
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  [v3 assertCurrentQueue];

  if ([(HAPAccessoryServerHAP2Adapter *)self onDemandConnectionsAreEnabled])
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v4 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      uint64_t v6 = self;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEFAULT, "%@ The connection idle timer fired, disconnecting...", (uint8_t *)&v5, 0xCu);
    }
    [(HAPAccessoryServerHAP2Adapter *)self closeSessions];
  }
}

- (void)updateActiveDisconnectOnIdleTimeout:(double)a3
{
  objc_initWeak(&location, self);
  int v5 = [(HAPAccessoryServerHAP2Adapter *)self operationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v6[2] = __69__HAPAccessoryServerHAP2Adapter_updateActiveDisconnectOnIdleTimeout___block_invoke;
  v6[3] = &unk_1E69F4680;
  objc_copyWeak(v7, &location);
  v7[1] = *(id *)&a3;
  [v5 addBlock:v6];

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __69__HAPAccessoryServerHAP2Adapter_updateActiveDisconnectOnIdleTimeout___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained onDemandConnectionsAreEnabled])
    {
      [v3 setDisconnectOnIdleTimeout:*(double *)(a1 + 40)];
      uint64_t v4 = [v3 connectionIdleTimer];
      if (v4)
      {
        int v5 = (void *)v4;
        uint64_t v6 = [v3 connectionIdleTimer];
        [v6 timeInterval];
        double v8 = v7;
        [v3 disconnectOnIdleTimeout];
        double v10 = v9;

        if (v8 != v10)
        {
          if (hap2LogInitialize_onceToken != -1) {
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
          }
          char v11 = (void *)hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = v11;
            [v3 disconnectOnIdleTimeout];
            int v15 = 138412546;
            __int16 v16 = v3;
            __int16 v17 = 2048;
            uint64_t v18 = v13;
            _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEFAULT, "%@ Updating active connection idle timer timeout to: %fs", (uint8_t *)&v15, 0x16u);
          }
          [v3 _suspendConnectionIdleTimer];
          [v3 _startConnectionIdleTimer];
        }
      }
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    int v14 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_DEFAULT, "Accessory server died", (uint8_t *)&v15, 2u);
    }
  }
}

- (void)setDiscoverAccessoriesOncePaired:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_discoverAccessoriesOncePaired = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)shouldDiscoverAccessoriesOncePaired
{
  id v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_discoverAccessoriesOncePaired;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAuthenticateUUIDCompletion:(id)a3
{
  p_lock = &self->super._lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = (void *)MEMORY[0x1D944E2D0](v5);

  id authenticateUUIDCompletion = self->_authenticateUUIDCompletion;
  self->_id authenticateUUIDCompletion = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)authenticateUUIDCompletion
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (void *)MEMORY[0x1D944E2D0](self->_authenticateUUIDCompletion);
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSoftwareAuthFinishedCompletion:(id)a3
{
  p_lock = &self->super._lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = (void *)MEMORY[0x1D944E2D0](v5);

  id softwareAuthFinishedCompletion = self->_softwareAuthFinishedCompletion;
  self->_id softwareAuthFinishedCompletion = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)softwareAuthFinishedCompletion
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (void *)MEMORY[0x1D944E2D0](self->_softwareAuthFinishedCompletion);
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setAuthValidationCompletion:(id)a3
{
  p_lock = &self->super._lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = (void *)MEMORY[0x1D944E2D0](v5);

  id authValidationCompletion = self->_authValidationCompletion;
  self->_id authValidationCompletion = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)authValidationCompletion
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (void *)MEMORY[0x1D944E2D0](self->_authValidationCompletion);
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)shouldSkipUserConsent
{
  id v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_skipUserConsent;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setUserConsentCompletion:(id)a3
{
  p_lock = &self->super._lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = (void *)MEMORY[0x1D944E2D0](v5);

  id userConsentCompletion = self->_userConsentCompletion;
  self->_id userConsentCompletion = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)userConsentCompletion
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (void *)MEMORY[0x1D944E2D0](self->_userConsentCompletion);
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSetupCodeCompletion:(id)a3
{
  p_lock = &self->super._lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = (void *)MEMORY[0x1D944E2D0](v5);

  id setupCodeCompletion = self->_setupCodeCompletion;
  self->_id setupCodeCompletion = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)setupCodeCompletion
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (void *)MEMORY[0x1D944E2D0](self->_setupCodeCompletion);
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPairingSessionCancelable:(id)a3
{
  uint64_t v4 = (HAP2Cancelable *)a3;
  os_unfair_lock_lock_with_options();
  pairingSessionCancelable = self->_pairingSessionCancelable;
  self->_pairingSessionCancelable = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (HAP2Cancelable)pairingSessionCancelable
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_pairingSessionCancelable;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)clientQueue
{
  v4.receiver = self;
  v4.super_class = (Class)HAPAccessoryServerHAP2Adapter;
  id v2 = [(HAPAccessoryServer *)&v4 clientQueue];

  return v2;
}

- (id)activeServer
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  objc_super v4 = self->_pairedServer;
  unpairedServer = v4;
  if (!v4) {
    unpairedServer = self->_unpairedServer;
  }
  uint64_t v6 = unpairedServer;

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)setSessionInfoWithNumIPsResolved:(unint64_t)a3 numIPsTried:(unint64_t)a4 numBonjourNames:(unint64_t)a5
{
  uint64_t v6 = [[HAP2AccessorySessionInfo alloc] initWithNumIPs:a3 numIPsTried:a4 numBonjourNames:a5];
  [(HAPAccessoryServerHAP2Adapter *)self setSessionInfo:v6];
}

- (void)setShouldBePaired:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_internallyPaired = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setPairedServer:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v6 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_debug_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEBUG, "%@ Received a paired server: %@", (uint8_t *)&v11, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  double v7 = self->_unpairedServer;
  double v8 = self->_pairedServer;
  objc_storeStrong((id *)&self->_pairedServer, a3);
  unpairedServer = self->_unpairedServer;
  self->_unpairedServer = 0;

  self->_internallyPaired = 1;
  os_unfair_lock_unlock(&self->super._lock);
  if (v7) {
    [(HAP2UnpairedAccessoryServer *)v7 setDelegate:0];
  }
  if (v8 && ([(HAP2PairedAccessoryServer *)v8 isEqual:v5] & 1) == 0) {
    [(HAP2PairedAccessoryServer *)v8 setDelegate:0];
  }
  [v5 setDelegate:self];
  -[HAPAccessoryServer setHasPairings:](self, "setHasPairings:", [v5 hasPairings]);
  if ([(HAPAccessoryServerHAP2Adapter *)self shouldDiscoverAccessoriesOncePaired])
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    double v10 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412290;
      uint64_t v12 = self;
      _os_log_debug_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEBUG, "%@ Discovering accessories now that we're paired", (uint8_t *)&v11, 0xCu);
    }
    [(HAPAccessoryServerHAP2Adapter *)self setDiscoverAccessoriesOncePaired:0];
    [(HAPAccessoryServerHAP2Adapter *)self discoverAccessories];
  }
}

- (void)setUnpairedServer:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v6 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412546;
    int v11 = self;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_debug_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEBUG, "%@ Received an unpaired server: %@", (uint8_t *)&v10, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  double v7 = self->_unpairedServer;
  double v8 = self->_pairedServer;
  objc_storeStrong((id *)&self->_unpairedServer, a3);
  pairedServer = self->_pairedServer;
  self->_pairedServer = 0;

  self->_internallyPaired = 0;
  os_unfair_lock_unlock(&self->super._lock);
  if (v7 && ([(HAP2UnpairedAccessoryServer *)v7 isEqual:v5] & 1) == 0) {
    [(HAP2UnpairedAccessoryServer *)v7 setDelegate:0];
  }
  if (v8) {
    [(HAP2PairedAccessoryServer *)v8 setDelegate:0];
  }
  [v5 setDelegate:self];
  -[HAPAccessoryServer setHasPairings:](self, "setHasPairings:", [v5 hasPairings]);
}

- (HAPAccessoryServerHAP2Adapter)initWithPairedServer:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F2C8CD98]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  double v7 = [v6 operationQueue];
  double v8 = [(HAPAccessoryServerHAP2Adapter *)self initWithOperationQueue:v7 accessoryServer:v4];

  if (v8)
  {
    v8->_internallyPaired = 1;
    objc_storeStrong((id *)&v8->_pairedServer, v5);
    [v6 setDelegate:v8];
    double v9 = v8;
  }

  return v8;
}

- (HAPAccessoryServerHAP2Adapter)initWithUnpairedServer:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F2C8C6F0]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  double v7 = [v6 operationQueue];
  double v8 = [(HAPAccessoryServerHAP2Adapter *)self initWithOperationQueue:v7 accessoryServer:v4];

  if (v8)
  {
    v8->_internallyPaired = 0;
    objc_storeStrong((id *)&v8->_unpairedServer, v5);
    [v6 setDelegate:v8];
    double v9 = v8;
  }

  return v8;
}

- (HAPAccessoryServerHAP2Adapter)initWithOperationQueue:(id)a3 accessoryServer:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v9 = +[HAPSystemKeychainStore systemStore];
  v26.receiver = self;
  v26.super_class = (Class)HAPAccessoryServerHAP2Adapter;
  int v10 = [(HAPAccessoryServer *)&v26 initWithKeystore:v9];

  if (v10)
  {
    int v11 = [v8 name];
    __int16 v12 = [v8 deviceID];
    id v13 = [v12 deviceIDString];

    uint64_t v14 = [MEMORY[0x1E4F65530] sharedPreferences];
    uint64_t v15 = [v14 preferenceForKey:@"HAPDefaultHAP2DisconnectOnIdleTimeoutSeconds"];

    objc_storeStrong((id *)&v10->super._name, v11);
    objc_storeStrong((id *)&v10->super._identifier, v13);
    objc_storeStrong((id *)&v10->_operationQueue, a3);
    __int16 v16 = [HAPAccessory alloc];
    __int16 v17 = [NSNumber numberWithUnsignedInteger:1];
    uint64_t v18 = [(HAPAccessory *)v16 initWithServer:v10 instanceID:v17];

    [(HAPAccessory *)v18 setName:v11];
    [(HAPAccessory *)v18 setIdentifier:v13];
    [(HAPAccessory *)v18 setServerIdentifier:v13];
    [(HAPAccessory *)v18 setPrimary:1];
    objc_storeStrong((id *)&v10->_primaryAccessory, v18);
    v27[0] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    accessories = v10->_accessories;
    v10->_accessories = (NSArray *)v19;

    -[HAPAccessoryServer setHasPairings:](v10, "setHasPairings:", [v8 hasPairings]);
    [(HAPAccessoryServer *)v10 setSupportsUnreachablePing:1];
    if (v15)
    {
      id v21 = [v15 numberValue];
      [v21 doubleValue];
      v10->_disconnectOnIdleTimeout = v22;
    }
    else
    {
      v10->_disconnectOnIdleTimeout = 30.0;
    }
    sessionInfo = v10->_sessionInfo;
    v10->_sessionInfo = 0;

    id v24 = v10;
  }

  return v10;
}

+ (void)initialize
{
}

@end