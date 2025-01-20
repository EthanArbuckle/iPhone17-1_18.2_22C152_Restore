@interface HMDKeyTransferAgentClient
+ (id)logCategory;
- (BOOL)_newDeviceSeen:(id)a3;
- (BOOL)haveCulledPlist;
- (BOOL)resolutionInProgress;
- (HMDKeyTransferAgentClient)initWithHomeManager:(id)a3;
- (HMFExponentialBackoffTimer)atHomeRetryTimer;
- (HMFNetMonitor)netMonitor;
- (HMFNetServiceBrowser)serviceBrowser;
- (NSMutableDictionary)bonjourKeys;
- (NSMutableDictionary)idsKeys;
- (NSMutableSet)targetsToProcess;
- (NSString)pairingWithUUID;
- (id)_deviceWithUUID:(id)a3;
- (int64_t)tfaState;
- (unint64_t)residentProvisioningStatus;
- (void)__accessoryIsReachable:(id)a3;
- (void)__accountChanged:(id)a3;
- (void)__deviceAddedToAccount:(id)a3;
- (void)__deviceRemovedFromAccount:(id)a3;
- (void)__deviceUpdated:(id)a3;
- (void)_beginBonjourResolution:(BOOL)a3;
- (void)_device:(id)a3 addedToAccount:(id)a4;
- (void)_device:(id)a3 removedFromAccount:(id)a4;
- (void)_endPairingWithError:(id)a3 suspendingTimer:(BOOL)a4;
- (void)_handleKeyTransferAgentMessage:(id)a3;
- (void)_handleResidentProvisioningStatusChanged:(id)a3;
- (void)_havePairVerifiedAccessoryWithKeyUUID:(id)a3 forDevice:(id)a4;
- (void)_haveVerifiedTwoFactorAuthenticationWithKeyUUID:(id)a3 forTarget:(id)a4;
- (void)_reallyBeginBonjourResolution;
- (void)_restartKeyTransfer:(id)a3;
- (void)_saveKeyPlist;
- (void)_sendATVPrivateKey:(id)a3 withDevice:(id)a4 retry:(unint64_t)a5;
- (void)_sendIOSPublicKey:(id)a3 withDevice:(id)a4;
- (void)_startBrowser;
- (void)_startPairingWithKeyUUID:(id)a3 forTarget:(id)a4;
- (void)_stopBrowser;
- (void)_tfaVerificationCompleteForKeyUUID:(id)a3 forTarget:(id)a4;
- (void)_tryPairingWithAccessories:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)netService:(id)a3 didUpdateTXTRecord:(id)a4;
- (void)netServiceBrowser:(id)a3 didAddService:(id)a4;
- (void)netServiceBrowser:(id)a3 didStopBrowsingWithError:(id)a4;
- (void)networkMonitorIsReachable:(id)a3;
- (void)queryPlistDevices;
- (void)receivedBonjourTXTFrom:(id)a3 withUUIDData:(id)a4;
- (void)resetConfig;
- (void)setAtHomeRetryTimer:(id)a3;
- (void)setBonjourKeys:(id)a3;
- (void)setHaveCulledPlist:(BOOL)a3;
- (void)setIdsKeys:(id)a3;
- (void)setNetMonitor:(id)a3;
- (void)setPairingWithUUID:(id)a3;
- (void)setResidentProvisioningStatus:(unint64_t)a3;
- (void)setResolutionInProgress:(BOOL)a3;
- (void)setServiceBrowser:(id)a3;
- (void)setTargetsToProcess:(id)a3;
- (void)setTfaState:(int64_t)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDKeyTransferAgentClient

- (unint64_t)residentProvisioningStatus
{
  return self->_residentProvisioningStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netMonitor, 0);
  objc_storeStrong((id *)&self->_atHomeRetryTimer, 0);
  objc_storeStrong((id *)&self->_pairingWithUUID, 0);
  objc_storeStrong((id *)&self->_targetsToProcess, 0);
  objc_storeStrong((id *)&self->_bonjourKeys, 0);
  objc_storeStrong((id *)&self->_idsKeys, 0);
  objc_storeStrong((id *)&self->_serviceBrowser, 0);
}

- (void)setTfaState:(int64_t)a3
{
  self->_tfaState = a3;
}

- (int64_t)tfaState
{
  return self->_tfaState;
}

- (void)setHaveCulledPlist:(BOOL)a3
{
  self->_haveCulledPlist = a3;
}

- (BOOL)haveCulledPlist
{
  return self->_haveCulledPlist;
}

- (void)setNetMonitor:(id)a3
{
}

- (HMFNetMonitor)netMonitor
{
  return self->_netMonitor;
}

- (void)setAtHomeRetryTimer:(id)a3
{
}

- (HMFExponentialBackoffTimer)atHomeRetryTimer
{
  return self->_atHomeRetryTimer;
}

- (void)setPairingWithUUID:(id)a3
{
}

- (NSString)pairingWithUUID
{
  return self->_pairingWithUUID;
}

- (void)setResolutionInProgress:(BOOL)a3
{
  self->_resolutionInProgress = a3;
}

- (BOOL)resolutionInProgress
{
  return self->_resolutionInProgress;
}

- (void)setTargetsToProcess:(id)a3
{
}

- (NSMutableSet)targetsToProcess
{
  return self->_targetsToProcess;
}

- (void)setBonjourKeys:(id)a3
{
}

- (NSMutableDictionary)bonjourKeys
{
  return self->_bonjourKeys;
}

- (void)setIdsKeys:(id)a3
{
}

- (NSMutableDictionary)idsKeys
{
  return self->_idsKeys;
}

- (void)setServiceBrowser:(id)a3
{
}

- (HMFNetServiceBrowser)serviceBrowser
{
  return self->_serviceBrowser;
}

- (void)netServiceBrowser:(id)a3 didAddService:(id)a4
{
  id v5 = a4;
  [v5 setDelegate:self];
  id v7 = [v5 TXTRecord];
  v6 = [v7 objectForKey:@"uuid"];
  [(HMDKeyTransferAgentClient *)self receivedBonjourTXTFrom:v5 withUUIDData:v6];
}

- (void)netService:(id)a3 didUpdateTXTRecord:(id)a4
{
  id v6 = a3;
  id v7 = [a4 objectForKey:@"uuid"];
  [(HMDKeyTransferAgentClient *)self receivedBonjourTXTFrom:v6 withUUIDData:v7];
}

- (void)netServiceBrowser:(id)a3 didStopBrowsingWithError:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Browsing got stop delegate with error: %@", buf, 0x16u);
    }
    v13 = [(HMDKeyTransferAgent *)v9 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__HMDKeyTransferAgentClient_netServiceBrowser_didStopBrowsingWithError___block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = v9;
    dispatch_async(v13, block);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v17 = v14;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Browsing stopped.", buf, 0xCu);
    }
  }
}

uint64_t __72__HMDKeyTransferAgentClient_netServiceBrowser_didStopBrowsingWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginBonjourResolution:1];
}

- (void)receivedBonjourTXTFrom:(id)a3 withUUIDData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDKeyTransferAgent *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HMDKeyTransferAgentClient_receivedBonjourTXTFrom_withUUIDData___block_invoke;
  block[3] = &unk_1E6A19668;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __65__HMDKeyTransferAgentClient_receivedBonjourTXTFrom_withUUIDData___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) name];
  if (*(void *)(a1 + 40)
    && (uint64_t v3 = [[NSString alloc] initWithData:*(void *)(a1 + 40) encoding:4]) != 0)
  {
    v4 = (void *)v3;
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 48);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = HMFGetLogIdentifier();
      int v14 = 138543874;
      v15 = v8;
      __int16 v16 = 2112;
      v17 = v2;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@HMDHomeManager %@ advertised key transfer UUID %@ (Bonjour)", (uint8_t *)&v14, 0x20u);
    }
    id v9 = [*(id *)(a1 + 48) bonjourKeys];
    [v9 setObject:v4 forKey:v2];

    [*(id *)(a1 + 48) _newDeviceSeen:v2];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 48);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543618;
      v15 = v13;
      __int16 v16 = 2112;
      v17 = v2;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@HMDHomeManager %@ no longer advertising key transfer UUID (Bonjour)", (uint8_t *)&v14, 0x16u);
    }
    v4 = [*(id *)(a1 + 48) bonjourKeys];
    [v4 removeObjectForKey:v2];
  }
}

- (void)_handleResidentProvisioningStatusChanged:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 stringForKey:@"data"];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      int v20 = 138543618;
      v21 = v9;
      __int16 v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Got broadcast info that %@ has been successfully peered with.", (uint8_t *)&v20, 0x16u);
    }
    id v10 = [(HMDKeyTransferAgentClient *)v7 idsKeys];
    [v10 removeObjectForKey:v5];

    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = v7;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = HMFGetLogIdentifier();
      v15 = [(HMDKeyTransferAgentClient *)v12 idsKeys];
      int v20 = 138543618;
      v21 = v14;
      __int16 v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Current list of IDS received keys:%@", (uint8_t *)&v20, 0x16u);
    }
    [(HMDKeyTransferAgentClient *)v12 _saveKeyPlist];
    __int16 v16 = [(HMDKeyTransferAgentClient *)v12 idsKeys];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      __int16 v18 = [(HMDKeyTransferAgentClient *)v12 atHomeRetryTimer];
      [v18 reset];

      id v19 = [(HMDKeyTransferAgentClient *)v12 atHomeRetryTimer];
      [v19 resume];
    }
  }
  [v4 respondWithPayload:0];
}

- (void)_handleKeyTransferAgentMessage:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMFGetLogIdentifier();
    id v9 = [(__CFString *)v4 stringForKey:@"phase"];
    *(_DWORD *)buf = 138543874;
    v51 = v8;
    __int16 v52 = 2112;
    v53 = v4;
    __int16 v54 = 2112;
    v55 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Got Message: %@ / %@", buf, 0x20u);
  }
  id v10 = [MEMORY[0x1E4F65520] sharedPowerLogger];
  id v11 = [(__CFString *)v4 stringForKey:@"phase"];
  [v10 reportIncomingLoxyMessage:v11];

  id v12 = [(__CFString *)v4 stringForKey:@"phase"];
  int v13 = [v12 isEqualToString:@"broadcast"];

  if (v13)
  {
    int v14 = [(__CFString *)v4 destination];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;

    if (v16)
    {
      uint64_t v17 = [v16 device];
      __int16 v18 = [v17 identifier];
      id v19 = [v18 UUIDString];

      int v20 = [(__CFString *)v4 messagePayload];
      v21 = objc_msgSend(v20, "hmf_UUIDForKey:", @"data");
      __int16 v22 = [v21 UUIDString];

      v23 = (void *)MEMORY[0x1D9452090]();
      uint64_t v24 = v6;
      v25 = HMFGetOSLogHandle();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v26)
        {
          v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v51 = v27;
          __int16 v52 = 2112;
          v53 = v19;
          __int16 v54 = 2112;
          v55 = v22;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@HMDHomeManager %@ advertised key transfer UUID %@ (IDS)", buf, 0x20u);
        }
        v28 = [(HMDKeyTransferAgentClient *)v24 idsKeys];
        [v28 setObject:v22 forKey:v19];

        v29 = [(HMDKeyTransferAgent *)v24 workQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __60__HMDKeyTransferAgentClient__handleKeyTransferAgentMessage___block_invoke;
        block[3] = &unk_1E6A19B30;
        void block[4] = v24;
        dispatch_async(v29, block);
      }
      else
      {
        if (v26)
        {
          v35 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v51 = v35;
          __int16 v52 = 2112;
          v53 = v19;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@HMDHomeManager %@ no longer advertising key transfer UUID (IDS)", buf, 0x16u);
        }
        v29 = [(HMDKeyTransferAgentClient *)v24 idsKeys];
        [v29 removeObjectForKey:v19];
      }

      v36 = [(HMDKeyTransferAgentClient *)v24 idsKeys];
      char v37 = [v36 writeToFile:@"/var/mobile/Library/homed/com.apple.atvpair.plist" atomically:1];

      if ((v37 & 1) == 0)
      {
        v38 = (void *)MEMORY[0x1D9452090]();
        v39 = v24;
        v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v51 = v41;
          __int16 v52 = 2112;
          v53 = @"/var/mobile/Library/homed/com.apple.atvpair.plist";
          _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to write key storage plist %@", buf, 0x16u);
        }
      }
      if (v22)
      {
        [(HMDKeyTransferAgentClient *)v24 _newDeviceSeen:v19];
      }
      else
      {
        v42 = [(HMDKeyTransferAgentClient *)v24 pairingWithUUID];
        int v43 = [v42 isEqual:v19];

        if (v43)
        {
          v44 = (void *)MEMORY[0x1D9452090]();
          v45 = v24;
          v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            v47 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v51 = v47;
            _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@Ending current pairing operation with a no longer valid device.", buf, 0xCu);
          }
          v48 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:10 userInfo:0];
          [(HMDKeyTransferAgentClient *)v45 _endPairingWithError:v48 suspendingTimer:1];
        }
      }
    }
    [(__CFString *)v4 respondWithPayload:0];
  }
  else
  {
    v30 = (void *)MEMORY[0x1D9452090]();
    v31 = v6;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = HMFGetLogIdentifier();
      v34 = [(__CFString *)v4 stringForKey:@"phase"];
      *(_DWORD *)buf = 138543618;
      v51 = v33;
      __int16 v52 = 2112;
      v53 = v34;
      _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unknown message key %@", buf, 0x16u);
    }
    id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [(__CFString *)v4 respondWithError:v16];
  }
}

uint64_t __60__HMDKeyTransferAgentClient__handleKeyTransferAgentMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startBrowser];
}

- (void)_restartKeyTransfer:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(HMDKeyTransferAgentClient *)self bonjourKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v10 = (void *)MEMORY[0x1D9452090]();
        id v11 = self;
        id v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v24 = v13;
          __int16 v25 = 2112;
          uint64_t v26 = v9;
          _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Trying to key transfer with device %@.", buf, 0x16u);
        }
        if ([(HMDKeyTransferAgentClient *)v11 _newDeviceSeen:v9])
        {
          int v14 = (void *)MEMORY[0x1D9452090]();
          v15 = v11;
          id v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v24 = v17;
            _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Found device that we can possibly pair with.", buf, 0xCu);
          }
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (void)__accountChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDKeyTransferAgent *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HMDKeyTransferAgentClient___accountChanged___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __46__HMDKeyTransferAgentClient___accountChanged___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) userInfo];
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Account status changed. Re-trying key transfer.: %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) setTfaState:0];
  uint64_t v7 = [*(id *)(a1 + 32) atHomeRetryTimer];
  [v7 reset];

  return [*(id *)(a1 + 32) _restartKeyTransfer:0];
}

- (void)__accessoryIsReachable:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(HMDKeyTransferAgent *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HMDKeyTransferAgentClient___accessoryIsReachable___block_invoke;
  block[3] = &unk_1E6A16CE0;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__HMDKeyTransferAgentClient___accessoryIsReachable___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _restartKeyTransfer:v4];
}

- (void)__deviceRemovedFromAccount:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(HMDKeyTransferAgent *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HMDKeyTransferAgentClient___deviceRemovedFromAccount___block_invoke;
  block[3] = &unk_1E6A16CE0;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__HMDKeyTransferAgentClient___deviceRemovedFromAccount___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 valueForKey:@"HMDDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _device:v5 removedFromAccount:v8];
}

- (void)_device:(id)a3 removedFromAccount:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v9 = [v8 UUIDString];

  if (v6
    && v7
    && (+[HMDAppleAccountManager sharedManager],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 account],
        __int16 v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v7 isEqual:v11],
        v11,
        v10,
        (v12 & 1) != 0))
  {
    uint64_t v13 = (void *)MEMORY[0x1D9452090]();
    int v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = HMFGetLogIdentifier();
      uint64_t v17 = [v6 identifier];
      id v18 = [v17 UUIDString];
      int v34 = 138543618;
      v35 = v16;
      __int16 v36 = 2112;
      char v37 = v18;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Got notification that %@ was removed from the current account", (uint8_t *)&v34, 0x16u);
    }
    long long v19 = [(HMDKeyTransferAgentClient *)v14 pairingWithUUID];
    int v20 = [v19 isEqual:v9];

    long long v21 = (void *)MEMORY[0x1D9452090]();
    long long v22 = v14;
    v23 = HMFGetOSLogHandle();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v24)
      {
        __int16 v25 = HMFGetLogIdentifier();
        int v34 = 138543362;
        v35 = v25;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Ending current pairing operation with a no longer valid device.", (uint8_t *)&v34, 0xCu);
      }
      uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:10 userInfo:0];
      [(HMDKeyTransferAgentClient *)v22 _endPairingWithError:v26 suspendingTimer:1];
    }
    else
    {
      if (v24)
      {
        v32 = HMFGetLogIdentifier();
        int v34 = 138543362;
        v35 = v32;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Removing device from list of potential pairing devices.", (uint8_t *)&v34, 0xCu);
      }
      v33 = [(HMDKeyTransferAgentClient *)v22 idsKeys];
      [v33 removeObjectForKey:v9];

      [(HMDKeyTransferAgentClient *)v22 _saveKeyPlist];
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x1D9452090]();
    uint64_t v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = HMFGetLogIdentifier();
      v31 = [v7 shortDescription];
      int v34 = 138543874;
      v35 = v30;
      __int16 v36 = 2112;
      char v37 = v9;
      __int16 v38 = 2112;
      v39 = v31;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Device %@ not removed from current account %@.", (uint8_t *)&v34, 0x20u);
    }
  }
}

- (void)__deviceUpdated:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HMDKeyTransferAgent *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HMDKeyTransferAgentClient___deviceUpdated___block_invoke;
  block[3] = &unk_1E6A16CE0;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__HMDKeyTransferAgentClient___deviceUpdated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [v4 account];
  [WeakRetained _device:v4 addedToAccount:v5];
}

- (void)__deviceAddedToAccount:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HMDKeyTransferAgent *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HMDKeyTransferAgentClient___deviceAddedToAccount___block_invoke;
  block[3] = &unk_1E6A16CE0;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__HMDKeyTransferAgentClient___deviceAddedToAccount___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 valueForKey:@"HMDDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _device:v5 addedToAccount:v8];
}

- (void)_device:(id)a3 addedToAccount:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v9 = [v8 UUIDString];

  if (v6
    && v7
    && (+[HMDAppleAccountManager sharedManager],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 account],
        __int16 v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v7 isEqual:v11],
        v11,
        v10,
        (v12 & 1) != 0))
  {
    uint64_t v13 = (void *)MEMORY[0x1D9452090]();
    int v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = HMFGetLogIdentifier();
      int v22 = 138543618;
      v23 = v16;
      __int16 v24 = 2112;
      __int16 v25 = v9;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Got notification that %@ was added to the current account", (uint8_t *)&v22, 0x16u);
    }
    [(HMDKeyTransferAgentClient *)v14 _newDeviceSeen:v9];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = self;
    long long v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = HMFGetLogIdentifier();
      long long v21 = [v7 shortDescription];
      int v22 = 138543874;
      v23 = v20;
      __int16 v24 = 2112;
      __int16 v25 = v9;
      __int16 v26 = 2112;
      v27 = v21;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Device %@ not added / updated from current account %@.", (uint8_t *)&v22, 0x20u);
    }
  }
}

- (BOOL)_newDeviceSeen:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDKeyTransferAgentClient *)self bonjourKeys];
  id v6 = [v5 objectForKey:v4];

  id v7 = [(HMDKeyTransferAgentClient *)self idsKeys];
  id v8 = [v7 objectForKey:v4];

  id v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = self;
  __int16 v11 = HMFGetOSLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v12)
    {
      int v20 = HMFGetLogIdentifier();
      int v26 = 138543362;
      v27 = v20;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@We *DO NOT* have this device's pairing id via Bonjour", (uint8_t *)&v26, 0xCu);
    }
    if (v8) {
      [(HMDKeyTransferAgentClient *)v10 setResidentProvisioningStatus:2];
    }
    goto LABEL_19;
  }
  if (v12)
  {
    uint64_t v13 = HMFGetLogIdentifier();
    int v26 = 138543362;
    v27 = v13;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@We have received this device's pairing id via Bonjour", (uint8_t *)&v26, 0xCu);
  }
  int v14 = (void *)MEMORY[0x1D9452090]();
  v15 = v10;
  id v16 = HMFGetOSLogHandle();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v17)
    {
      long long v21 = HMFGetLogIdentifier();
      int v26 = 138543362;
      v27 = v21;
      int v22 = "%{public}@We *DO NOT* have this device's pairing id via IDS";
      v23 = v16;
      uint32_t v24 = 12;
LABEL_17:
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v26, v24);
    }
LABEL_18:

LABEL_19:
    BOOL v19 = 0;
    goto LABEL_20;
  }
  if (v17)
  {
    id v18 = HMFGetLogIdentifier();
    int v26 = 138543362;
    v27 = v18;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@We have received this device's pairing id via IDS", (uint8_t *)&v26, 0xCu);
  }
  if (([v6 isEqual:v8] & 1) == 0)
  {
    int v14 = (void *)MEMORY[0x1D9452090]();
    v15 = v15;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v21 = HMFGetLogIdentifier();
      int v26 = 138543874;
      v27 = v21;
      __int16 v28 = 2112;
      v29 = v6;
      __int16 v30 = 2112;
      v31 = v8;
      int v22 = "%{public}@Bonjour and IDS keys do not match (%@!=%@)";
      v23 = v16;
      uint32_t v24 = 32;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  [(HMDKeyTransferAgentClient *)v15 _startPairingWithKeyUUID:v8 forTarget:v4];
  BOOL v19 = 1;
LABEL_20:

  return v19;
}

- (void)_sendATVPrivateKey:(id)a3 withDevice:(id)a4 retry:(unint64_t)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v35 = objc_msgSend(v7, "hmf_stringForKey:", @"kControllerPairingNameKey");
  int v34 = objc_msgSend(v7, "hmf_dataForKey:", @"kControllerKeyPairKey");
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v34];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F5BE00]) initWithIdentifier:v35 publicKey:v9 privateKey:0 permissions:0];
  if (v10)
  {
    __int16 v11 = +[HMDIdentityRegistry sharedRegistry];
    [v11 registerIdentity:v10 device:v8 object:self];

    BOOL v12 = [MEMORY[0x1E4F5BE48] systemStore];
    id v42 = 0;
    id v43 = 0;
    id v41 = 0;
    char v13 = [v12 getControllerPublicKey:0 secretKey:0 keyPair:&v43 username:&v42 allowCreation:0 error:&v41];
    id v32 = v43;
    id v14 = v42;
    id v33 = v41;

    if (v13)
    {
      v15 = [HMDRemoteDeviceMessageDestination alloc];
      id v16 = [(HMDKeyTransferAgent *)self uuid];
      __int16 v30 = [(HMDRemoteDeviceMessageDestination *)v15 initWithTarget:v16 device:v8];

      BOOL v17 = [HMDRemoteMessage alloc];
      v44[0] = @"phase";
      v44[1] = @"kControllerKeyPairKey";
      v45[0] = @"send_private";
      v45[1] = v32;
      v44[2] = @"kControllerPairingNameKey";
      v45[2] = v14;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:3];
      BOOL v19 = [(HMDRemoteMessage *)v17 initWithName:@"kKeyTransferAgentKey" destination:v30 payload:v18 type:0 timeout:1 secure:2 restriction:0.0];

      objc_initWeak((id *)location, self);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __65__HMDKeyTransferAgentClient__sendATVPrivateKey_withDevice_retry___block_invoke;
      v36[3] = &unk_1E6A0C7A0;
      v36[4] = self;
      objc_copyWeak(v40, (id *)location);
      v40[1] = (id)a5;
      id v37 = v8;
      id v38 = v7;
      id v39 = v10;
      [(HMDRemoteMessage *)v19 setResponseHandler:v36];
      int v20 = [(HMDKeyTransferAgent *)self homeManager];
      long long v21 = [v20 messageDispatcher];
      [v21 sendMessage:v19 completionHandler:0];

      [(HMDKeyTransferAgentClient *)self setResidentProvisioningStatus:0];
      objc_destroyWeak(v40);
      objc_destroyWeak((id *)location);
    }
    else
    {
      int v26 = (void *)MEMORY[0x1D9452090]();
      v27 = self;
      __int16 v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = HMFGetLogIdentifier();
        *(_DWORD *)id location = 138543618;
        *(void *)&location[4] = v29;
        __int16 v47 = 2112;
        id v48 = v33;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@unable to retrieve iOS public / private key pair: %@", location, 0x16u);
      }
      [(HMDKeyTransferAgentClient *)v27 _endPairingWithError:v33 suspendingTimer:1];
    }
  }
  else
  {
    int v22 = (void *)MEMORY[0x1D9452090]();
    v23 = self;
    uint32_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      __int16 v25 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543362;
      *(void *)&location[4] = v25;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@did not get valid username / public key from ATV device.", location, 0xCu);
    }
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:3 userInfo:0];
    [(HMDKeyTransferAgentClient *)v23 _endPairingWithError:v14 suspendingTimer:1];
  }
}

void __65__HMDKeyTransferAgentClient__sendATVPrivateKey_withDevice_retry___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__HMDKeyTransferAgentClient__sendATVPrivateKey_withDevice_retry___block_invoke_2;
  v7[3] = &unk_1E6A0C778;
  objc_copyWeak(v12, (id *)(a1 + 64));
  id v5 = *(void **)(a1 + 72);
  id v8 = v3;
  v12[1] = v5;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(v4, v7);

  objc_destroyWeak(v12);
}

void __65__HMDKeyTransferAgentClient__sendATVPrivateKey_withDevice_retry___block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      unint64_t v4 = *(void *)(a1 + 72);
      id v5 = (void *)MEMORY[0x1D9452090]();
      id v6 = v3;
      id v7 = HMFGetOSLogHandle();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v4 < 4)
      {
        if (v8)
        {
          id v16 = HMFGetLogIdentifier();
          BOOL v17 = [*(id *)(a1 + 40) identifier];
          id v18 = [v17 UUIDString];
          uint64_t v19 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138544130;
          v29 = v16;
          __int16 v30 = 2112;
          v31 = v18;
          __int16 v32 = 2112;
          uint64_t v33 = v19;
          __int16 v34 = 2048;
          uint64_t v35 = 180;
          _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Send Private Key to %@ failed with error: %@ (retrying in %lu seconds)", buf, 0x2Au);
        }
        dispatch_time_t v20 = dispatch_time(0, 180000000000);
        long long v21 = [v6 workQueue];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __65__HMDKeyTransferAgentClient__sendATVPrivateKey_withDevice_retry___block_invoke_67;
        v24[3] = &unk_1E6A17018;
        v24[4] = v6;
        id v25 = *(id *)(a1 + 48);
        id v22 = *(id *)(a1 + 40);
        uint64_t v23 = *(void *)(a1 + 72);
        id v26 = v22;
        uint64_t v27 = v23;
        dispatch_after(v20, v21, v24);
      }
      else
      {
        if (v8)
        {
          id v9 = HMFGetLogIdentifier();
          id v10 = [*(id *)(a1 + 40) identifier];
          id v11 = [v10 UUIDString];
          uint64_t v12 = *(void *)(a1 + 32);
          uint64_t v13 = *(void *)(a1 + 72);
          *(_DWORD *)buf = 138544130;
          v29 = v9;
          __int16 v30 = 2112;
          v31 = v11;
          __int16 v32 = 2112;
          uint64_t v33 = v12;
          __int16 v34 = 2048;
          uint64_t v35 = v13;
          _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Send Private Key to %@ failed with error: %@ (timed out after %lu retries)", buf, 0x2Au);
        }
        id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:10 userInfo:0];
        [v6 _endPairingWithError:v14 suspendingTimer:1];
      }
    }
    else
    {
      [WeakRetained _endPairingWithError:0 suspendingTimer:1];
      if (*(void *)(a1 + 56))
      {
        v15 = +[HMDIdentityRegistry sharedRegistry];
        [v15 deregisterIdentity:*(void *)(a1 + 56) object:v3];
      }
    }
  }
}

uint64_t __65__HMDKeyTransferAgentClient__sendATVPrivateKey_withDevice_retry___block_invoke_67(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendATVPrivateKey:*(void *)(a1 + 40) withDevice:*(void *)(a1 + 48) retry:*(void *)(a1 + 56) + 1];
}

- (void)_sendIOSPublicKey:(id)a3 withDevice:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMDKeyTransferAgent *)self homeManager];
  id v32 = 0;
  id v33 = 0;
  id v31 = 0;
  char v9 = [v8 getOrCreateControllerPublicKey:&v33 controllerUsername:&v32 error:&v31];
  id v10 = v33;
  id v11 = v32;
  id v12 = v31;
  if (v9)
  {
    uint64_t v13 = [HMDRemoteDeviceMessageDestination alloc];
    id v14 = [(HMDKeyTransferAgent *)self uuid];
    v15 = [(HMDRemoteDeviceMessageDestination *)v13 initWithTarget:v14 device:v7];

    id v16 = [HMDRemoteMessage alloc];
    v34[0] = @"phase";
    v34[1] = @"kControllerKeyPairKey";
    v35[0] = @"send_public";
    v35[1] = v10;
    v34[2] = @"kControllerPairingNameKey";
    v35[2] = v11;
    BOOL v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];
    id v18 = [(HMDRemoteMessage *)v16 initWithName:@"kKeyTransferAgentKey" destination:v15 payload:v17 type:0 timeout:0 secure:1 restriction:0.0];

    objc_initWeak((id *)location, self);
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __58__HMDKeyTransferAgentClient__sendIOSPublicKey_withDevice___block_invoke;
    uint64_t v27 = &unk_1E6A19048;
    __int16 v28 = self;
    objc_copyWeak(&v30, (id *)location);
    id v29 = v7;
    [(HMDRemoteMessage *)v18 setResponseHandler:&v24];
    uint64_t v19 = objc_msgSend(v8, "messageDispatcher", v24, v25, v26, v27, v28);
    [v19 sendMessage:v18];

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)location);
  }
  else
  {
    dispatch_time_t v20 = (void *)MEMORY[0x1D9452090]();
    long long v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v23;
      __int16 v37 = 2112;
      id v38 = v12;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to get IOS controller key / name: %@", location, 0x16u);
    }
    [(HMDKeyTransferAgentClient *)v21 _endPairingWithError:v12 suspendingTimer:1];
  }
}

void __58__HMDKeyTransferAgentClient__sendIOSPublicKey_withDevice___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] workQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__HMDKeyTransferAgentClient__sendIOSPublicKey_withDevice___block_invoke_2;
  v10[3] = &unk_1E6A17780;
  objc_copyWeak(&v14, a1 + 6);
  id v11 = v5;
  id v12 = a1[5];
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v14);
}

void __58__HMDKeyTransferAgentClient__sendIOSPublicKey_withDevice___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      unint64_t v4 = (void *)MEMORY[0x1D9452090]();
      id v5 = v3;
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = HMFGetLogIdentifier();
        id v8 = [*(id *)(a1 + 40) identifier];
        id v9 = [v8 UUIDString];
        uint64_t v10 = *(void *)(a1 + 32);
        int v12 = 138543874;
        id v13 = v7;
        __int16 v14 = 2112;
        v15 = v9;
        __int16 v16 = 2112;
        uint64_t v17 = v10;
        _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Send public key to %@ failed with error: %@", (uint8_t *)&v12, 0x20u);
      }
      id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:10 userInfo:0];
      [v5 _endPairingWithError:v11 suspendingTimer:1];
    }
    else
    {
      [WeakRetained _sendATVPrivateKey:*(void *)(a1 + 48) withDevice:*(void *)(a1 + 40) retry:1];
    }
  }
}

- (void)_havePairVerifiedAccessoryWithKeyUUID:(id)a3 forDevice:(id)a4
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [HMDRemoteDeviceMessageDestination alloc];
  id v9 = [(HMDKeyTransferAgent *)self uuid];
  uint64_t v10 = [(HMDRemoteDeviceMessageDestination *)v8 initWithTarget:v9 device:v7];

  id v11 = [HMDRemoteMessage alloc];
  v24[0] = @"phase";
  v24[1] = @"data";
  v25[0] = @"ping";
  v25[1] = v6;
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  id v13 = [(HMDRemoteMessage *)v11 initWithName:@"kKeyTransferAgentKey" destination:v10 payload:v12 type:0 timeout:0 secure:2 restriction:0.0];

  objc_initWeak(&location, self);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __77__HMDKeyTransferAgentClient__havePairVerifiedAccessoryWithKeyUUID_forDevice___block_invoke;
  dispatch_time_t v20 = &unk_1E6A17958;
  objc_copyWeak(&v22, &location);
  id v14 = v7;
  id v21 = v14;
  [(HMDRemoteMessage *)v13 setResponseHandler:&v17];
  v15 = [(HMDKeyTransferAgent *)self homeManager];
  __int16 v16 = [v15 messageDispatcher];
  [v16 sendMessage:v13 completionHandler:0];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __77__HMDKeyTransferAgentClient__havePairVerifiedAccessoryWithKeyUUID_forDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained workQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__HMDKeyTransferAgentClient__havePairVerifiedAccessoryWithKeyUUID_forDevice___block_invoke_2;
    v10[3] = &unk_1E6A18668;
    id v11 = v5;
    id v12 = v8;
    id v13 = *(id *)(a1 + 32);
    id v14 = v6;
    dispatch_async(v9, v10);
  }
}

void __77__HMDKeyTransferAgentClient__havePairVerifiedAccessoryWithKeyUUID_forDevice___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 40);
    unint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = HMFGetLogIdentifier();
      id v6 = [*(id *)(a1 + 48) remoteDestinationString];
      uint64_t v7 = *(void *)(a1 + 32);
      int v13 = 138543874;
      id v14 = v5;
      __int16 v15 = 2112;
      __int16 v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = v7;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_ERROR, "%{public}@Ping to %@ failed with error: %@", (uint8_t *)&v13, 0x20u);
    }
    id v8 = *(void **)(a1 + 40);
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:10 userInfo:0];
    [v8 _endPairingWithError:v9 suspendingTimer:1];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    id v12 = *(void **)(a1 + 40);
    [v12 _sendIOSPublicKey:v10 withDevice:v11];
  }
}

- (void)_haveVerifiedTwoFactorAuthenticationWithKeyUUID:(id)a3 forTarget:(id)a4
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v83 = a3;
  id v88 = a4;
  v85 = [MEMORY[0x1E4F1CA48] array];
  v84 = [MEMORY[0x1E4F1CA48] array];
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v6 = +[HMDAppleAccountManager sharedManager];
  uint64_t v7 = [v6 account];
  id v8 = [v7 devices];

  id obj = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v102 objects:v112 count:16];
  v86 = self;
  if (!v9)
  {
LABEL_14:

LABEL_52:
    v68 = (void *)MEMORY[0x1D9452090]();
    v69 = v86;
    v70 = HMFGetOSLogHandle();
    __int16 v34 = v83;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      v71 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v109 = v71;
      __int16 v110 = 2112;
      id v111 = v88;
      _os_log_impl(&dword_1D49D5000, v70, OS_LOG_TYPE_ERROR, "%{public}@The device with uuid %@ does not belong to the current user (waiting for IDS notification).", buf, 0x16u);
    }
    id v66 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:10 userInfo:0];
    [(HMDKeyTransferAgentClient *)v69 _endPairingWithError:v66 suspendingTimer:1];
    goto LABEL_59;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v103;
LABEL_3:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v103 != v11) {
      objc_enumerationMutation(obj);
    }
    int v13 = *(void **)(*((void *)&v102 + 1) + 8 * v12);
    id v14 = (void *)MEMORY[0x1D9452090]();
    __int16 v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = HMFGetLogIdentifier();
      uint64_t v18 = [v13 identifier];
      uint64_t v19 = [v18 UUIDString];
      *(_DWORD *)buf = 138543618;
      v109 = v17;
      __int16 v110 = 2112;
      id v111 = v19;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Checking ownership of %@", buf, 0x16u);

      self = v86;
    }

    dispatch_time_t v20 = [v13 capabilities];
    if (([v20 supportsKeyTransferServer] & 1) == 0)
    {

      goto LABEL_12;
    }
    id v21 = [v13 identifier];
    id v22 = [v21 UUIDString];
    int v23 = [v88 isEqual:v22];

    if (v23) {
      break;
    }
LABEL_12:
    if (v10 == ++v12)
    {
      uint64_t v10 = [obj countByEnumeratingWithState:&v102 objects:v112 count:16];
      if (!v10) {
        goto LABEL_14;
      }
      goto LABEL_3;
    }
  }
  uint64_t v24 = (void *)MEMORY[0x1D9452090]();
  uint64_t v25 = v15;
  id v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v28 = HMFGetLogIdentifier();
    id v29 = [v13 identifier];
    id v30 = [v29 UUIDString];
    *(_DWORD *)buf = 138543618;
    v109 = v28;
    __int16 v110 = 2112;
    id v111 = v30;
    _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@We own device %@", buf, 0x16u);
  }
  id v31 = v13;

  if (!v31) {
    goto LABEL_52;
  }
  long long v100 = 0u;
  long long v101 = 0u;
  long long v99 = 0u;
  long long v98 = 0u;
  id v32 = [(HMDKeyTransferAgent *)v25 homeManager];
  id v33 = [v32 homes];

  __int16 v34 = v83;
  uint64_t v81 = [v33 countByEnumeratingWithState:&v98 objects:v107 count:16];
  if (v81)
  {
    uint64_t v82 = *(void *)v99;
    v79 = v33;
    id v80 = v31;
    v78 = v25;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v99 != v82) {
          objc_enumerationMutation(v33);
        }
        uint64_t v87 = v35;
        uint64_t v36 = *(void **)(*((void *)&v98 + 1) + 8 * v35);
        char v37 = [v36 isOwnerUser];
        id v38 = (void *)MEMORY[0x1D9452090]();
        uint64_t v39 = v25;
        uint64_t v40 = HMFGetOSLogHandle();
        BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
        if ((v37 & 1) == 0)
        {
          if (v41)
          {
            v63 = HMFGetLogIdentifier();
            v64 = [v36 uuid];
            v65 = [v64 UUIDString];
            *(_DWORD *)buf = 138543618;
            v109 = v63;
            __int16 v110 = 2112;
            id v111 = v65;
            _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@We do not own the home %@", buf, 0x16u);
          }
          goto LABEL_49;
        }
        if (v41)
        {
          id v42 = HMFGetLogIdentifier();
          id v43 = [v36 uuid];
          v44 = [v43 UUIDString];
          *(_DWORD *)buf = 138543618;
          v109 = v42;
          __int16 v110 = 2112;
          id v111 = v44;
          _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@We own the home %@", buf, 0x16u);
        }
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        v45 = [v36 accessories];
        v46 = (void *)[v45 copy];

        id obja = v46;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v94 objects:v106 count:16];
        if (!v47) {
          goto LABEL_45;
        }
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v95;
        while (2)
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v95 != v49) {
              objc_enumerationMutation(obja);
            }
            id v51 = *(id *)(*((void *)&v94 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              __int16 v52 = v51;
            }
            else {
              __int16 v52 = 0;
            }
            id v53 = v52;

            if (v53)
            {
              if ([v53 isSecuritySessionOpen])
              {
                v72 = (void *)MEMORY[0x1D9452090]();
                v73 = v39;
                v74 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                {
                  v75 = HMFGetLogIdentifier();
                  v76 = [v53 uuid];
                  v77 = [v76 UUIDString];
                  *(_DWORD *)buf = 138543618;
                  v109 = v75;
                  __int16 v110 = 2112;
                  id v111 = v77;
                  _os_log_impl(&dword_1D49D5000, v74, OS_LOG_TYPE_DEFAULT, "%{public}@%@ has an open pair verify session (how lucky).", buf, 0x16u);
                }
                __int16 v34 = v83;
                id v66 = v80;
                [(HMDKeyTransferAgentClient *)v73 _havePairVerifiedAccessoryWithKeyUUID:v83 forDevice:v80];

                v67 = v79;
                goto LABEL_58;
              }
              if ([v53 linkSpeed] < 0)
              {
                __int16 v54 = (void *)MEMORY[0x1D9452090]([v84 addObject:v53]);
                v62 = v39;
                uint64_t v56 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  v57 = HMFGetLogIdentifier();
                  v58 = [v51 uuid];
                  v59 = [v58 UUIDString];
                  *(_DWORD *)buf = 138543618;
                  v109 = v57;
                  __int16 v110 = 2112;
                  id v111 = v59;
                  v60 = v56;
                  v61 = "%{public}@%@ is a slow accessory.";
LABEL_41:
                  _os_log_impl(&dword_1D49D5000, v60, OS_LOG_TYPE_DEFAULT, v61, buf, 0x16u);
                }
              }
              else
              {
                __int16 v54 = (void *)MEMORY[0x1D9452090]([v85 addObject:v53]);
                v55 = v39;
                uint64_t v56 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  v57 = HMFGetLogIdentifier();
                  v58 = [v51 uuid];
                  v59 = [v58 UUIDString];
                  *(_DWORD *)buf = 138543618;
                  v109 = v57;
                  __int16 v110 = 2112;
                  id v111 = v59;
                  v60 = v56;
                  v61 = "%{public}@%@ is a fast accessory.";
                  goto LABEL_41;
                }
              }
            }
          }
          uint64_t v48 = [obja countByEnumeratingWithState:&v94 objects:v106 count:16];
          if (v48) {
            continue;
          }
          break;
        }
LABEL_45:

        __int16 v34 = v83;
        id v33 = v79;
        id v31 = v80;
        uint64_t v25 = v78;
LABEL_49:
        uint64_t v35 = v87 + 1;
      }
      while (v87 + 1 != v81);
      uint64_t v81 = [v33 countByEnumeratingWithState:&v98 objects:v107 count:16];
    }
    while (v81);
  }

  [v85 addObjectsFromArray:v84];
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __87__HMDKeyTransferAgentClient__haveVerifiedTwoFactorAuthenticationWithKeyUUID_forTarget___block_invoke;
  v91[3] = &unk_1E6A18BA0;
  v91[4] = v25;
  id v92 = v34;
  id v93 = v31;
  id v66 = v31;
  [(HMDKeyTransferAgentClient *)v25 _tryPairingWithAccessories:v85 completionHandler:v91];

  v67 = v92;
LABEL_58:

LABEL_59:
}

void __87__HMDKeyTransferAgentClient__haveVerifiedTwoFactorAuthenticationWithKeyUUID_forTarget___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__HMDKeyTransferAgentClient__haveVerifiedTwoFactorAuthenticationWithKeyUUID_forTarget___block_invoke_2;
  v8[3] = &unk_1E6A18668;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_async(v4, v8);
}

void __87__HMDKeyTransferAgentClient__haveVerifiedTwoFactorAuthenticationWithKeyUUID_forTarget___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 40);
    unint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_ERROR, "%{public}@No currently paired devices.", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 40) setResidentProvisioningStatus:2];
    id v6 = *(void **)(a1 + 40);
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:10 userInfo:0];
    [v6 _endPairingWithError:v7 suspendingTimer:1];
  }
  else
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    [v8 _havePairVerifiedAccessoryWithKeyUUID:v9 forDevice:v10];
  }
}

- (void)_tryPairingWithAccessories:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 firstObject];
  if (v8)
  {
    [v6 removeObject:v8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__HMDKeyTransferAgentClient__tryPairingWithAccessories_completionHandler___block_invoke;
    v10[3] = &unk_1E6A0C750;
    void v10[4] = self;
    id v11 = v8;
    id v12 = v6;
    id v13 = v7;
    [v11 verifyPairingWithCompletionHandler:v10];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:2 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
  }
}

void __74__HMDKeyTransferAgentClient__tryPairingWithAccessories_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = a1[4];
  uint64_t v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [a1[5] uuid];
      id v13 = [v12 UUIDString];
      *(_DWORD *)buf = 138543874;
      id v22 = v11;
      __int16 v23 = 2112;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to pair verify with accessory %@ (%@)", buf, 0x20u);
    }
    id v14 = [a1[4] workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__HMDKeyTransferAgentClient__tryPairingWithAccessories_completionHandler___block_invoke_59;
    block[3] = &unk_1E6A193D0;
    void block[4] = a1[4];
    id v19 = a1[6];
    id v20 = a1[7];
    dispatch_sync(v14, block);
  }
  else
  {
    if (v10)
    {
      __int16 v15 = HMFGetLogIdentifier();
      __int16 v16 = [a1[5] uuid];
      __int16 v17 = [v16 UUIDString];
      *(_DWORD *)buf = 138543874;
      id v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = v17;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Successful pair verify with accessory %@ (%@)", buf, 0x20u);
    }
    (*((void (**)(void))a1[7] + 2))();
  }
}

uint64_t __74__HMDKeyTransferAgentClient__tryPairingWithAccessories_completionHandler___block_invoke_59(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tryPairingWithAccessories:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_tfaVerificationCompleteForKeyUUID:(id)a3 forTarget:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(HMDKeyTransferAgentClient *)self tfaState] == 1)
  {
    id v8 = [(HMDKeyTransferAgentClient *)self atHomeRetryTimer];
    [v8 suspend];

    uint64_t v9 = [(HMDKeyTransferAgent *)self homeManager];
    [v9 startLocalTransport];

    [(HMDKeyTransferAgentClient *)self setResidentProvisioningStatus:[(HMDKeyTransferAgentClient *)self residentProvisioningStatus] & 0xFFFFFFFFFFFFFFFELL];
    dispatch_time_t v10 = dispatch_time(0, 20000000000);
    id v11 = [(HMDKeyTransferAgent *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__HMDKeyTransferAgentClient__tfaVerificationCompleteForKeyUUID_forTarget___block_invoke;
    block[3] = &unk_1E6A19668;
    void block[4] = self;
    id v15 = v6;
    id v16 = v7;
    dispatch_after(v10, v11, block);
  }
  else
  {
    [(HMDKeyTransferAgentClient *)self setResidentProvisioningStatus:[(HMDKeyTransferAgentClient *)self residentProvisioningStatus] | 1];
    id v12 = [(HMDKeyTransferAgentClient *)self atHomeRetryTimer];
    [v12 resume];

    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:10 userInfo:0];
    [(HMDKeyTransferAgentClient *)self _endPairingWithError:v13 suspendingTimer:0];
  }
}

uint64_t __74__HMDKeyTransferAgentClient__tfaVerificationCompleteForKeyUUID_forTarget___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _haveVerifiedTwoFactorAuthenticationWithKeyUUID:*(void *)(a1 + 40) forTarget:*(void *)(a1 + 48)];
}

- (void)_startPairingWithKeyUUID:(id)a3 forTarget:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDKeyTransferAgentClient *)self pairingWithUUID];

  if (v8)
  {
    uint64_t v9 = [(HMDKeyTransferAgentClient *)self pairingWithUUID];
    char v10 = [v9 isEqual:v7];

    if ((v10 & 1) == 0)
    {
      id v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = self;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = HMFGetLogIdentifier();
        id v15 = [(HMDKeyTransferAgentClient *)v12 pairingWithUUID];
        *(_DWORD *)buf = 138543874;
        uint64_t v27 = v14;
        __int16 v28 = 2112;
        id v29 = v15;
        __int16 v30 = 2112;
        id v31 = v7;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Currently in the middle of processing a request from %@ (queueing request from %@)", buf, 0x20u);
      }
      id v16 = [(HMDKeyTransferAgentClient *)v12 targetsToProcess];
      [v16 addObject:v7];
    }
  }
  else
  {
    __int16 v17 = (void *)MEMORY[0x1D9452090]();
    uint64_t v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Beginning KeyTransferAgent", buf, 0xCu);
    }
    [(HMDKeyTransferAgentClient *)v18 setPairingWithUUID:v7];
    if ([(HMDKeyTransferAgentClient *)v18 tfaState])
    {
      [(HMDKeyTransferAgentClient *)v18 _tfaVerificationCompleteForKeyUUID:v6 forTarget:v7];
    }
    else
    {
      id v21 = [(HMDKeyTransferAgentClient *)v18 atHomeRetryTimer];
      [v21 suspend];

      objc_initWeak((id *)buf, v18);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __64__HMDKeyTransferAgentClient__startPairingWithKeyUUID_forTarget___block_invoke;
      v22[3] = &unk_1E6A130C0;
      objc_copyWeak(&v25, (id *)buf);
      id v23 = v6;
      id v24 = v7;
      +[HMDRemoteLoginUtilities fetchIsTwoFactorAuthenticationEnabledForAccountWithReason:@"Pairing with Apple TV" completionHandler:v22];

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __64__HMDKeyTransferAgentClient__startPairingWithKeyUUID_forTarget___block_invoke(id *a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained workQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__HMDKeyTransferAgentClient__startPairingWithKeyUUID_forTarget___block_invoke_2;
    v7[3] = &unk_1E6A15B38;
    char v10 = a2;
    void v7[4] = v5;
    id v8 = a1[4];
    id v9 = a1[5];
    dispatch_async(v6, v7);
  }
}

uint64_t __64__HMDKeyTransferAgentClient__startPairingWithKeyUUID_forTarget___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  id v3 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  [v3 setTfaState:v4];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  return [v5 _tfaVerificationCompleteForKeyUUID:v6 forTarget:v7];
}

- (void)_endPairingWithError:(id)a3 suspendingTimer:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  if (v34)
  {
    uint64_t v6 = (void *)MEMORY[0x1D9452090]();
    uint64_t v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      BOOL v41 = v9;
      __int16 v42 = 2112;
      id v43 = v34;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Pairing ended in failure: %@", buf, 0x16u);
    }
  }
  else
  {
    char v10 = [(HMDKeyTransferAgentClient *)self atHomeRetryTimer];
    [v10 reset];

    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      BOOL v41 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Pairing ended successfully", buf, 0xCu);
    }
    id v15 = [(HMDKeyTransferAgentClient *)v12 pairingWithUUID];

    if (v15)
    {
      id v16 = [(HMDKeyTransferAgentClient *)v12 bonjourKeys];
      __int16 v17 = [(HMDKeyTransferAgentClient *)v12 pairingWithUUID];
      [v16 removeObjectForKey:v17];

      uint64_t v18 = [(HMDKeyTransferAgentClient *)v12 idsKeys];
      id v19 = [(HMDKeyTransferAgentClient *)v12 pairingWithUUID];
      [v18 removeObjectForKey:v19];
    }
    [(HMDKeyTransferAgentClient *)v12 _saveKeyPlist];
  }
  id v20 = [(HMDKeyTransferAgentClient *)self pairingWithUUID];

  if (v20)
  {
    id v21 = [(HMDKeyTransferAgentClient *)self targetsToProcess];
    id v22 = [(HMDKeyTransferAgentClient *)self pairingWithUUID];
    [v21 removeObject:v22];
  }
  [(HMDKeyTransferAgentClient *)self setPairingWithUUID:0];
  if (v4)
  {
    id v23 = [(HMDKeyTransferAgentClient *)self atHomeRetryTimer];
    [v23 suspend];
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v24 = [(HMDKeyTransferAgentClient *)self targetsToProcess];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v36;
LABEL_16:
    uint64_t v28 = 0;
    while (1)
    {
      if (*(void *)v36 != v27) {
        objc_enumerationMutation(v24);
      }
      id v29 = *(void **)(*((void *)&v35 + 1) + 8 * v28);
      __int16 v30 = (void *)MEMORY[0x1D9452090]();
      id v31 = self;
      uint64_t v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        BOOL v41 = v33;
        __int16 v42 = 2112;
        id v43 = v29;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Processing remaining device in queue %@", buf, 0x16u);
      }
      if ([(HMDKeyTransferAgentClient *)v31 _newDeviceSeen:v29]) {
        break;
      }
      if (v26 == ++v28)
      {
        uint64_t v26 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v26) {
          goto LABEL_16;
        }
        break;
      }
    }
  }
}

- (void)_beginBonjourResolution:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(HMDKeyTransferAgentClient *)self resolutionInProgress])
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    uint64_t v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v23 = v8;
      id v9 = "%{public}@Bonjour discovery already in progress.";
      char v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
LABEL_11:
      _os_log_impl(&dword_1D49D5000, v10, v11, v9, buf, 0xCu);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  id v12 = [(HMDKeyTransferAgentClient *)self serviceBrowser];

  if (!v12)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    uint64_t v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v23 = v8;
      id v9 = "%{public}@No allocated Bonjour browser. Not attempting to start.";
      char v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_11;
    }
LABEL_12:

    return;
  }
  id v13 = (void *)MEMORY[0x1D9452090]([(HMDKeyTransferAgentClient *)self setResolutionInProgress:1]);
  id v14 = self;
  id v15 = HMFGetOSLogHandle();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v16)
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v17;
      __int16 v24 = 2048;
      uint64_t v25 = 600;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Re-starting Bonjour discovery in %lu seconds", buf, 0x16u);
    }
    dispatch_time_t v18 = dispatch_time(0, 600000000000);
    id v19 = [(HMDKeyTransferAgent *)v14 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__HMDKeyTransferAgentClient__beginBonjourResolution___block_invoke;
    block[3] = &unk_1E6A19B30;
    void block[4] = v14;
    dispatch_after(v18, v19, block);
  }
  else
  {
    if (v16)
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v23 = v20;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Starting Bonjour discovery.", buf, 0xCu);
    }
    [(HMDKeyTransferAgentClient *)v14 _reallyBeginBonjourResolution];
  }
}

uint64_t __53__HMDKeyTransferAgentClient__beginBonjourResolution___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reallyBeginBonjourResolution];
}

- (void)_reallyBeginBonjourResolution
{
  objc_initWeak(&location, self);
  BOOL v3 = [(HMDKeyTransferAgentClient *)self serviceBrowser];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__HMDKeyTransferAgentClient__reallyBeginBonjourResolution__block_invoke;
  v4[3] = &unk_1E6A17758;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  [v3 startBrowsingWithCompletionHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __58__HMDKeyTransferAgentClient__reallyBeginBonjourResolution__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__HMDKeyTransferAgentClient__reallyBeginBonjourResolution__block_invoke_2;
  v6[3] = &unk_1E6A16CE0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __58__HMDKeyTransferAgentClient__reallyBeginBonjourResolution__block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained setResolutionInProgress:0];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = (void *)MEMORY[0x1D9452090](v4);
    id v7 = v3;
    id v8 = HMFGetOSLogHandle();
    id v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        char v10 = HMFGetLogIdentifier();
        uint64_t v11 = *(void *)(a1 + 32);
        int v13 = 138543618;
        id v14 = v10;
        __int16 v15 = 2112;
        uint64_t v16 = v11;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Bonjour search failed to start with error: %@", (uint8_t *)&v13, 0x16u);
      }
      [v7 _beginBonjourResolution:1];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v12 = HMFGetLogIdentifier();
        int v13 = 138543362;
        id v14 = v12;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Bonjour search started.", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (void)_stopBrowser
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  uint64_t v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Ending Bonjour browser.", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(HMDKeyTransferAgentClient *)v4 serviceBrowser];
  [v7 stopBrowsing];

  [(HMDKeyTransferAgentClient *)v4 setServiceBrowser:0];
  [(HMDKeyTransferAgentClient *)v4 setResolutionInProgress:0];
}

- (void)_startBrowser
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDKeyTransferAgentClient *)self serviceBrowser];

  if (!v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1D9452090]();
    uint64_t v5 = self;
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Starting Bonjour browser.", (uint8_t *)&v11, 0xCu);
    }
    int v8 = (void *)[objc_alloc(MEMORY[0x1E4F654D8]) initWithDomain:@"local." serviceType:@"_homekit._tcp."];
    [(HMDKeyTransferAgentClient *)v5 setServiceBrowser:v8];

    id v9 = [(HMDKeyTransferAgentClient *)v5 serviceBrowser];
    [v9 setDelegate:v5];

    uint64_t v10 = [(HMDKeyTransferAgentClient *)v5 serviceBrowser];
    [v10 setShouldCache:1];

    [(HMDKeyTransferAgentClient *)v5 setResolutionInProgress:0];
    [(HMDKeyTransferAgentClient *)v5 _beginBonjourResolution:0];
  }
}

- (void)setResidentProvisioningStatus:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1D9452090](self, a2);
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v19 = v8;
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Updating Resident Provisioning Status: %lx", buf, 0x16u);
  }
  id v9 = (void *)MEMORY[0x1E4F65480];
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3, @"kProvisioningStatusKey");
  uint64_t v17 = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  id v12 = [v9 entitledMessageWithName:@"kResidentProvisioningStatusChangedNotificationKey" messagePayload:v11];

  v6->_residentProvisioningStatus = a3;
  uint64_t v13 = [(HMDKeyTransferAgent *)v6 homeManager];
  id v14 = [v13 messageDispatcher];
  __int16 v15 = [v13 uuid];
  [v14 sendMessage:v12 target:v15];
}

- (void)resetConfig
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  uint64_t v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting Configuration (flushing any stored UUIDs that we have).", buf, 0xCu);
  }
  id v7 = [(HMDKeyTransferAgent *)v4 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__HMDKeyTransferAgentClient_resetConfig__block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = v4;
  dispatch_async(v7, block);
}

void __40__HMDKeyTransferAgentClient_resetConfig__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPairingWithUUID:0];
  int v2 = [*(id *)(a1 + 32) idsKeys];
  [v2 removeAllObjects];

  [*(id *)(a1 + 32) _saveKeyPlist];
  id v3 = [*(id *)(a1 + 32) atHomeRetryTimer];
  [v3 suspend];

  id v4 = [*(id *)(a1 + 32) atHomeRetryTimer];
  [v4 reset];
}

- (void)queryPlistDevices
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDKeyTransferAgent *)self homeManager];
  id v4 = [v3 homes];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v10 isOwnerUser])
        {
          uint64_t v11 = [v10 accessories];
          uint64_t v12 = [v11 count];

          if (v12)
          {

            uint64_t v17 = [(HMDKeyTransferAgent *)self workQueue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __46__HMDKeyTransferAgentClient_queryPlistDevices__block_invoke;
            block[3] = &unk_1E6A19B30;
            void block[4] = self;
            dispatch_async(v17, block);

            goto LABEL_14;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v13 = (void *)MEMORY[0x1D9452090]();
  id v14 = self;
  __int16 v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v24 = v16;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@No accessories found in owned homes, skipping key transfer", buf, 0xCu);
  }
LABEL_14:
}

void __46__HMDKeyTransferAgentClient_queryPlistDevices__block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v43 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Looking for stale items in the IDS Plist", buf, 0xCu);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v6 = [*(id *)(a1 + 32) idsKeys];
  id obj = [v6 allKeys];

  uint64_t v31 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v31)
  {
    char v28 = 0;
    uint64_t v30 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v9 = [*(id *)(a1 + 32) _deviceWithUUID:v8];
        if (v9)
        {
          uint64_t v10 = (void *)MEMORY[0x1D9452090]();
          id v11 = *(id *)(a1 + 32);
          uint64_t v12 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v43 = v13;
            __int16 v44 = 2112;
            v45 = v9;
            _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Querying device %@ for UUID.", buf, 0x16u);
          }
          id v14 = [HMDRemoteDeviceMessageDestination alloc];
          __int16 v15 = [*(id *)(a1 + 32) uuid];
          uint64_t v16 = [(HMDRemoteDeviceMessageDestination *)v14 initWithTarget:v15 device:v9];

          uint64_t v17 = [HMDRemoteMessage alloc];
          v40[0] = @"phase";
          v40[1] = @"uuid";
          v41[0] = @"request_uuid";
          v41[1] = v8;
          dispatch_time_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
          long long v19 = [(HMDRemoteMessage *)v17 initWithName:@"kKeyTransferAgentKey" destination:v16 payload:v18 type:0 timeout:0 secure:1 restriction:0.0];

          objc_initWeak((id *)buf, *(id *)(a1 + 32));
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __46__HMDKeyTransferAgentClient_queryPlistDevices__block_invoke_47;
          v32[3] = &unk_1E6A19048;
          objc_copyWeak(&v35, (id *)buf);
          long long v20 = v16;
          id v33 = v20;
          id v34 = v8;
          [(HMDRemoteMessage *)v19 setResponseHandler:v32];
          long long v21 = [*(id *)(a1 + 32) homeManager];
          long long v22 = [v21 messageDispatcher];
          [v22 sendMessage:v19 completionHandler:0];

          objc_destroyWeak(&v35);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          id v23 = [*(id *)(a1 + 32) idsKeys];
          [v23 removeObjectForKey:v8];

          __int16 v24 = (void *)MEMORY[0x1D9452090]();
          id v25 = *(id *)(a1 + 32);
          uint64_t v26 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v43 = v27;
            __int16 v44 = 2112;
            v45 = v8;
            _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Probably never should have gotten a broadcast from UUID %@", buf, 0x16u);
          }
          char v28 = 1;
        }
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v31);

    if (v28) {
      [*(id *)(a1 + 32) _saveKeyPlist];
    }
  }
  else
  {
  }
}

void __46__HMDKeyTransferAgentClient_queryPlistDevices__block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__HMDKeyTransferAgentClient_queryPlistDevices__block_invoke_2;
    block[3] = &unk_1E6A190C0;
    id v13 = v5;
    id v14 = v8;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v15 = v10;
    uint64_t v16 = v11;
    id v17 = v6;
    dispatch_async(v9, block);
  }
}

void __46__HMDKeyTransferAgentClient_queryPlistDevices__block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    int v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = HMFGetLogIdentifier();
      id v6 = *(void **)(a1 + 48);
      uint64_t v7 = *(void **)(a1 + 32);
      int v24 = 138543874;
      id v25 = v5;
      __int16 v26 = 2112;
      uint64_t v27 = v6;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to send UUID request message to %@ (%@)", (uint8_t *)&v24, 0x20u);
    }
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 40) idsKeys];
    id v9 = [v8 valueForKey:*(void *)(a1 + 56)];

    id v10 = objc_msgSend(*(id *)(a1 + 64), "hmf_stringForKey:", @"uuid");
    if (v10)
    {
      char v11 = [v9 isEqual:v10];
      uint64_t v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = *(id *)(a1 + 40);
      id v14 = HMFGetOSLogHandle();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v15)
        {
          uint64_t v16 = HMFGetLogIdentifier();
          int v24 = 138543362;
          id v25 = v16;
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Remote host still waiting for key transfer.", (uint8_t *)&v24, 0xCu);
        }
      }
      else
      {
        if (v15)
        {
          long long v22 = HMFGetLogIdentifier();
          int v24 = 138543874;
          id v25 = v22;
          __int16 v26 = 2112;
          uint64_t v27 = v9;
          __int16 v28 = 2112;
          id v29 = v10;
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Transfer key changed from %@ to %@ (using new key).", (uint8_t *)&v24, 0x20u);
        }
        id v23 = [*(id *)(a1 + 40) idsKeys];
        [v23 setValue:v10 forKey:*(void *)(a1 + 56)];

        [*(id *)(a1 + 40) _saveKeyPlist];
      }
      [*(id *)(a1 + 40) _startBrowser];
    }
    else
    {
      id v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = *(id *)(a1 + 40);
      long long v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        long long v20 = HMFGetLogIdentifier();
        int v24 = 138543618;
        id v25 = v20;
        __int16 v26 = 2112;
        uint64_t v27 = v9;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Remote %@ has already transferred key.", (uint8_t *)&v24, 0x16u);
      }
      long long v21 = [*(id *)(a1 + 40) idsKeys];
      [v21 removeObjectForKey:*(void *)(a1 + 56)];

      [*(id *)(a1 + 40) _saveKeyPlist];
    }
  }
}

- (id)_deviceWithUUID:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = +[HMDAppleAccountManager sharedManager];
  id v6 = [v5 account];
  uint64_t v7 = [v6 devices];
  uint64_t v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v35 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
      id v14 = [v13 identifier];
      BOOL v15 = [v14 UUIDString];
      int v16 = [v4 isEqual:v15];

      if (v16) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    if ([v13 isCurrentDevice])
    {
      uint64_t v22 = MEMORY[0x1D9452090]();
      id v23 = self;
      int v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v39 = v25;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Skipping sending key to ourselves", buf, 0xCu);
      }
      __int16 v26 = (void *)v22;
    }
    else
    {
      uint64_t v27 = [v13 capabilities];
      char v28 = [v27 supportsKeyTransferServer];

      if (v28)
      {
        id v21 = v13;
LABEL_22:

        goto LABEL_23;
      }
      uint64_t v29 = MEMORY[0x1D9452090]();
      uint64_t v30 = self;
      uint64_t v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v39 = v32;
        __int16 v40 = 2112;
        id v41 = v13;
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Device does not support key transfer: %@", buf, 0x16u);
      }
      __int16 v26 = (void *)v29;
    }
    id v21 = 0;
    goto LABEL_22;
  }
LABEL_9:

  id v17 = (void *)MEMORY[0x1D9452090]();
  id v18 = self;
  long long v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    long long v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v39 = v20;
    __int16 v40 = 2112;
    id v41 = v4;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to find device with UUID %@", buf, 0x16u);
  }
  id v21 = 0;
LABEL_23:

  return v21;
}

- (void)_saveKeyPlist
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDKeyTransferAgentClient *)self idsKeys];
  char v4 = [v3 writeToFile:@"/var/mobile/Library/homed/com.apple.atvpair.plist" atomically:1];

  if ((v4 & 1) == 0)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v8;
      __int16 v14 = 2112;
      BOOL v15 = @"/var/mobile/Library/homed/com.apple.atvpair.plist";
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to write key storage plist %@", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v9 = [(HMDKeyTransferAgentClient *)self idsKeys];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = 2;
  }
  else
  {
    [(HMDKeyTransferAgentClient *)self _stopBrowser];
    uint64_t v11 = 0;
  }
  [(HMDKeyTransferAgentClient *)self setResidentProvisioningStatus:v11];
}

- (void)networkMonitorIsReachable:(id)a3
{
  char v4 = [(HMDKeyTransferAgent *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HMDKeyTransferAgentClient_networkMonitorIsReachable___block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __55__HMDKeyTransferAgentClient_networkMonitorIsReachable___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) haveCulledPlist];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setHaveCulledPlist:1];
    id v3 = *(void **)(a1 + 32);
    return [v3 queryPlistDevices];
  }
  return result;
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDKeyTransferAgentClient *)self atHomeRetryTimer];

  if (v5 == v4)
  {
    id v6 = [(HMDKeyTransferAgent *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__HMDKeyTransferAgentClient_timerDidFire___block_invoke;
    block[3] = &unk_1E6A19B30;
    void block[4] = self;
    dispatch_async(v6, block);
  }
}

void __42__HMDKeyTransferAgentClient_timerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) pairingWithUUID];

  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Got request to retry key transfer, but we are in the middle of one.", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Got request to retry key transfer.", (uint8_t *)&v9, 0xCu);
    }
    [*(id *)(a1 + 32) _restartKeyTransfer:0];
  }
}

- (void)dealloc
{
  id v3 = [(HMDKeyTransferAgent *)self homeManager];
  id v4 = [v3 messageDispatcher];
  [v4 deregisterReceiver:self];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)HMDKeyTransferAgentClient;
  [(HMDKeyTransferAgentClient *)&v6 dealloc];
}

- (HMDKeyTransferAgentClient)initWithHomeManager:(id)a3
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)HMDKeyTransferAgentClient;
  id v5 = [(HMDKeyTransferAgent *)&v50 initWithHomeManager:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1D9452090]();
    uint64_t v7 = v5;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v52 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Creating KeyTransferAgent", buf, 0xCu);
    }
    uint64_t v10 = [HMDRemoteAccountMessageFilter alloc];
    uint64_t v11 = [(HMDKeyTransferAgent *)v7 messageDestination];
    int v12 = [(HMDRemoteAccountMessageFilter *)v10 initWithTarget:v11];

    id v13 = [v4 msgFilterChain];
    [v13 addMessageFilter:v12];

    __int16 v14 = +[HMDRemoteMessagePolicy defaultPolicy];
    [v14 setRequiresSecureMessage:0];
    [v14 setRequiresAccountMessage:1];
    [v14 setTransportRestriction:1];
    uint64_t v15 = [v14 copy];
    uint64_t v16 = [v4 messageDispatcher];
    uint64_t v47 = (void *)v15;
    v56[0] = v15;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
    [v16 registerForMessage:@"kKeyTransferAgentKey" receiver:v7 policies:v17 selector:sel__handleKeyTransferAgentMessage_];

    id v18 = +[HMDRemoteMessagePolicy defaultPolicy];
    [v18 setRequiresSecureMessage:1];
    [v18 setRequiresAccountMessage:1];
    [v18 setTransportRestriction:-1];
    long long v19 = (void *)[v18 copy];
    long long v20 = [v4 messageDispatcher];
    v55 = v19;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
    [v20 registerForMessage:@"kResidentProvisioningStatusChangedNotificationKey" receiver:v7 policies:v21 selector:sel__handleResidentProvisioningStatusChanged_];

    uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:@"/var/mobile/Library/homed/com.apple.atvpair.plist"];
    idsKeys = v7->_idsKeys;
    v7->_idsKeys = (NSMutableDictionary *)v22;

    if (!v7->_idsKeys)
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
      id v25 = v7->_idsKeys;
      v7->_idsKeys = (NSMutableDictionary *)v24;

      if (([(NSMutableDictionary *)v7->_idsKeys writeToFile:@"/var/mobile/Library/homed/com.apple.atvpair.plist" atomically:1] & 1) == 0)
      {
        v46 = v12;
        context = (void *)MEMORY[0x1D9452090]();
        __int16 v26 = v7;
        uint64_t v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v44 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v52 = v44;
          __int16 v53 = 2112;
          __int16 v54 = @"/var/mobile/Library/homed/com.apple.atvpair.plist";
          _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to write key storage plist %@", buf, 0x16u);
        }
        int v12 = v46;
      }
    }
    if ([(NSMutableDictionary *)v7->_idsKeys count])
    {
      char v28 = [(HMDKeyTransferAgent *)v7 workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__HMDKeyTransferAgentClient_initWithHomeManager___block_invoke;
      block[3] = &unk_1E6A19B30;
      uint64_t v29 = v7;
      uint64_t v49 = v29;
      dispatch_async(v28, block);

      [(HMDKeyTransferAgentClient *)v29 setResidentProvisioningStatus:2];
    }
    else
    {
      [(HMDKeyTransferAgentClient *)v7 setResidentProvisioningStatus:0];
    }
    uint64_t v30 = [objc_alloc(MEMORY[0x1E4F65428]) initWithMinimumTimeInterval:4 maximumTimeInterval:1 exponentialFactor:10.0 options:86400.0];
    atHomeRetryTimer = v7->_atHomeRetryTimer;
    v7->_atHomeRetryTimer = (HMFExponentialBackoffTimer *)v30;

    [(HMFExponentialBackoffTimer *)v7->_atHomeRetryTimer setDelegate:v7];
    uint64_t v32 = [MEMORY[0x1E4F1CA60] dictionary];
    bonjourKeys = v7->_bonjourKeys;
    v7->_bonjourKeys = (NSMutableDictionary *)v32;

    uint64_t v34 = [MEMORY[0x1E4F1CA80] set];
    targetsToProcess = v7->_targetsToProcess;
    v7->_targetsToProcess = (NSMutableSet *)v34;

    long long v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 addObserver:v7 selector:sel___accessoryIsReachable_ name:@"HMDAccessoryIsReachableNotification" object:0];

    long long v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v37 addObserver:v7 selector:sel___deviceAddedToAccount_ name:@"HMDAccountAddedDeviceNotification" object:0];

    long long v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v38 addObserver:v7 selector:sel___deviceUpdated_ name:@"HMDDeviceUpdatedNotification" object:0];

    long long v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v39 addObserver:v7 selector:sel___deviceRemovedFromAccount_ name:@"HMDAccountRemovedDeviceNotification" object:0];

    __int16 v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v40 addObserver:v7 selector:sel___accountChanged_ name:@"HMDAppleAccountManagerAccountModifiedNotification" object:0];

    v7->_haveCulledPlist = 0;
    uint64_t v41 = [objc_alloc(MEMORY[0x1E4F654C8]) initWithNetAddress:0];
    netMonitor = v7->_netMonitor;
    v7->_netMonitor = (HMFNetMonitor *)v41;

    [(HMFNetMonitor *)v7->_netMonitor setDelegate:v7];
    v7->_tfaState = 0;
    if ([(HMFNetMonitor *)v7->_netMonitor isReachable])
    {
      [(HMDKeyTransferAgentClient *)v7 queryPlistDevices];
      v7->_haveCulledPlist = 1;
    }
  }
  return v5;
}

uint64_t __49__HMDKeyTransferAgentClient_initWithHomeManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startBrowser];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t83 != -1) {
    dispatch_once(&logCategory__hmf_once_t83, &__block_literal_global_64211);
  }
  int v2 = (void *)logCategory__hmf_once_v84;
  return v2;
}

uint64_t __40__HMDKeyTransferAgentClient_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v84;
  logCategory__hmf_once_v84 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end