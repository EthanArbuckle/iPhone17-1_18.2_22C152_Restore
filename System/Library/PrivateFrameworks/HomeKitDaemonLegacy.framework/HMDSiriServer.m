@interface HMDSiriServer
+ (id)sharedSiriServer;
- (BOOL)_isAudioCodecSupported:(id)a3;
- (BOOL)_isSiriInputType:(int64_t)a3 supportedOnAccessory:(id)a4 siriAudioConfiguration:(id)a5;
- (HMDNotificationRegistration)notificationRegistration;
- (HMDSiriAccessoryMonitor)siriAccessoryMonitor;
- (HMDSiriRemoteInputServer)siriInputServer;
- (HMDSiriServer)init;
- (HMDSiriSession)siriUISession;
- (OS_dispatch_queue)queue;
- (OS_dispatch_workloop)audioWorkloop;
- (id)_getBestAudioCodecConfiguration:(id)a3;
- (id)_getSiriSessionForAccessory:(id)a3;
- (unsigned)targetControlIdentifier;
- (void)_checkSiriSupportByAccessory:(id)a3;
- (void)_handleDisconnectForAccessory:(id)a3;
- (void)_maybeTearDownSiriPlugin;
- (void)_removeDataStreamListenerForAccessory:(id)a3;
- (void)_setupSiriPlugin;
- (void)_setupSiriUIContext;
- (void)_tearDownSiriUIContext;
- (void)accessory:(id)a3 didCloseDataStreamWithError:(id)a4;
- (void)accessory:(id)a3 didReceiveBulkSessionCandidate:(id)a4;
- (void)accessoryDidStartListening:(id)a3;
- (void)handleAccessoryConfigured:(id)a3;
- (void)handleAccessoryHasBulkSendDataStream:(id)a3;
- (void)handleAccessoryRemoved:(id)a3;
- (void)handleAccessoryUnconfigured:(id)a3;
- (void)monitor:(id)a3 needsSiriCapabilityForAccessory:(id)a4;
- (void)monitor:(id)a3 willAllowAccessoryForDragonSiri:(id)a4;
- (void)monitor:(id)a3 willNotAllowAccessoryForDragonSiri:(id)a4;
- (void)monitorHasNoAccessoriesForDragonSiri:(id)a3;
- (void)registerForMessages;
- (void)setAudioWorkloop:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSiriAccessoryMonitor:(id)a3;
- (void)setSiriInputServer:(id)a3;
- (void)setSiriUISession:(id)a3;
- (void)setTargetControlIdentifier:(unsigned int)a3;
- (void)setTargetableAccessory:(id)a3 withControllers:(id)a4;
@end

@implementation HMDSiriServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriUISession, 0);
  objc_storeStrong((id *)&self->_siriAccessoryMonitor, 0);
  objc_storeStrong((id *)&self->_siriInputServer, 0);
  objc_storeStrong((id *)&self->_notificationRegistration, 0);
  objc_storeStrong((id *)&self->_audioWorkloop, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setTargetControlIdentifier:(unsigned int)a3
{
  self->_targetControlIdentifier = a3;
}

- (unsigned)targetControlIdentifier
{
  return self->_targetControlIdentifier;
}

- (void)setSiriUISession:(id)a3
{
}

- (HMDSiriSession)siriUISession
{
  return self->_siriUISession;
}

- (void)setSiriAccessoryMonitor:(id)a3
{
}

- (HMDSiriAccessoryMonitor)siriAccessoryMonitor
{
  return self->_siriAccessoryMonitor;
}

- (void)setSiriInputServer:(id)a3
{
}

- (HMDSiriRemoteInputServer)siriInputServer
{
  return self->_siriInputServer;
}

- (HMDNotificationRegistration)notificationRegistration
{
  return self->_notificationRegistration;
}

- (void)setAudioWorkloop:(id)a3
{
}

- (OS_dispatch_workloop)audioWorkloop
{
  return self->_audioWorkloop;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)accessory:(id)a3 didCloseDataStreamWithError:(id)a4
{
  id v5 = a3;
  v6 = [(HMDSiriServer *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__HMDSiriServer_accessory_didCloseDataStreamWithError___block_invoke;
  v8[3] = &unk_1E6A197C8;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __55__HMDSiriServer_accessory_didCloseDataStreamWithError___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    id v9 = [v4 name];
    v10 = [v4 uuid];
    int v11 = 138543874;
    v12 = v8;
    __int16 v13 = 2112;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@DataStream closed for accessory %@/%@.", (uint8_t *)&v11, 0x20u);
  }
}

- (void)accessoryDidStartListening:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSiriServer *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__HMDSiriServer_accessoryDidStartListening___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__HMDSiriServer_accessoryDidStartListening___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v13 = 138543362;
    v14 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory's DataStream started.", (uint8_t *)&v13, 0xCu);
  }
  id v6 = *(id *)(a1 + 40);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    if ([*(id *)(a1 + 32) targetControlIdentifier]) {
      objc_msgSend(v8, "sendTargetControlWhoAmIWithIdentifier:", objc_msgSend(*(id *)(a1 + 32), "targetControlIdentifier"));
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 32);
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Accessory provided is not a HMDHAPAccessory; cannot send targetControl identifier.",
        (uint8_t *)&v13,
        0xCu);
    }
  }
}

- (void)accessory:(id)a3 didReceiveBulkSessionCandidate:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    int v11 = [(HMDSiriServer *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__HMDSiriServer_accessory_didReceiveBulkSessionCandidate___block_invoke;
    block[3] = &unk_1E6A19668;
    block[4] = self;
    id v17 = v10;
    id v18 = v7;
    dispatch_async(v11, block);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    int v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v20 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Accessory provided is not a HMDHAPAccessory; cannot activate corresponding siri session.",
        buf,
        0xCu);
    }
  }
}

void __58__HMDSiriServer_accessory_didReceiveBulkSessionCandidate___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _getSiriSessionForAccessory:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = *(id *)(a1 + 32);
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v29 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Received new Siri Audio stream but unable to create local context", buf, 0xCu);
    }
    uint64_t v21 = *(void **)(a1 + 48);
    uint64_t v22 = 2;
    goto LABEL_12;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) metadata];
  char v5 = [v2 activateWithAccessory:v3 metadata:v4];

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v29 = v23;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Received new Siri Audio stream but unable to activate Siri.", buf, 0xCu);
    }
    uint64_t v21 = *(void **)(a1 + 48);
    uint64_t v22 = 5;
LABEL_12:
    [v21 rejectBulkSendSessionWithStatus:v22];
    goto LABEL_13;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v29 = v10;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Received new Siri Audio stream; setting it up.",
      buf,
      0xCu);
  }
  int v11 = [v2 activeSessionToken];
  v12 = *(void **)(a1 + 48);
  int v13 = [*(id *)(a1 + 32) queue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __58__HMDSiriServer_accessory_didReceiveBulkSessionCandidate___block_invoke_22;
  v24[3] = &unk_1E6A0D118;
  id v25 = v11;
  id v14 = v2;
  uint64_t v15 = *(void *)(a1 + 32);
  id v26 = v14;
  uint64_t v27 = v15;
  id v16 = v11;
  [v12 acceptBulkSendSessionOnQueue:v13 callback:v24];

LABEL_13:
}

void __58__HMDSiriServer_accessory_didReceiveBulkSessionCandidate___block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  char v5 = [*(id *)(a1 + 40) activeSessionToken];

  if (v4 == v5)
  {
    [*(id *)(a1 + 40) setActiveBulkSendSession:v3];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 48);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      int v11 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Siri session canceled before it began; cleaning up.",
        (uint8_t *)&v10,
        0xCu);
    }
    [v3 cancelWithReason:2];
  }
}

- (void)monitorHasNoAccessoriesForDragonSiri:(id)a3
{
  id v4 = [(HMDSiriServer *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HMDSiriServer_monitorHasNoAccessoriesForDragonSiri___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __54__HMDSiriServer_monitorHasNoAccessoriesForDragonSiri___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tearDownSiriUIContext];
}

- (void)monitor:(id)a3 willNotAllowAccessoryForDragonSiri:(id)a4
{
}

- (void)monitor:(id)a3 willAllowAccessoryForDragonSiri:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  if (v7)
  {
    id v8 = [(HMDSiriServer *)self queue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__HMDSiriServer_monitor_willAllowAccessoryForDragonSiri___block_invoke;
    v9[3] = &unk_1E6A197C8;
    v9[4] = self;
    id v10 = v7;
    dispatch_async(v8, v9);
  }
}

uint64_t __57__HMDSiriServer_monitor_willAllowAccessoryForDragonSiri___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) name];
    id v7 = [*(id *)(a1 + 40) uuid];
    id v8 = [v7 UUIDString];
    int v10 = 138543874;
    int v11 = v5;
    __int16 v12 = 2112;
    int v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory is ready to accept Siri; registering listener (%@/%@)",
      (uint8_t *)&v10,
      0x20u);
  }
  [*(id *)(a1 + 32) _setupSiriPlugin];
  [*(id *)(a1 + 32) _setupSiriUIContext];
  return [*(id *)(a1 + 40) addDataStreamBulkSendListener:*(void *)(a1 + 32) fileType:@"audio.siri"];
}

- (void)monitor:(id)a3 needsSiriCapabilityForAccessory:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  if (v7)
  {
    id v8 = [(HMDSiriServer *)self queue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__HMDSiriServer_monitor_needsSiriCapabilityForAccessory___block_invoke;
    v9[3] = &unk_1E6A197C8;
    v9[4] = self;
    id v10 = v7;
    dispatch_async(v8, v9);
  }
}

uint64_t __57__HMDSiriServer_monitor_needsSiriCapabilityForAccessory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkSiriSupportByAccessory:*(void *)(a1 + 40)];
}

- (id)_getSiriSessionForAccessory:(id)a3
{
  [(HMDSiriServer *)self _setupSiriUIContext];
  return [(HMDSiriServer *)self siriUISession];
}

- (void)_removeDataStreamListenerForAccessory:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    id v7 = [(HMDSiriServer *)self queue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__HMDSiriServer__removeDataStreamListenerForAccessory___block_invoke;
    v8[3] = &unk_1E6A197C8;
    void v8[4] = self;
    id v9 = v6;
    dispatch_async(v7, v8);
  }
}

uint64_t __55__HMDSiriServer__removeDataStreamListenerForAccessory___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) name];
    id v7 = [*(id *)(a1 + 40) uuid];
    id v8 = [v7 UUIDString];
    int v10 = 138543874;
    int v11 = v5;
    __int16 v12 = 2112;
    int v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory no longer able to accept Siri; deregistering listener (%@/%@)",
      (uint8_t *)&v10,
      0x20u);
  }
  return [*(id *)(a1 + 40) removeDataStreamBulkSendListener:*(void *)(a1 + 32)];
}

- (BOOL)_isAudioCodecSupported:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 codecType];
  if (!v4) {
    goto LABEL_7;
  }
  id v5 = (void *)v4;
  id v6 = [v3 codecParameters];

  if (v6)
  {
    id v7 = [v3 codecParameters];
    id v6 = [v7 bitRate];
    if (v6)
    {
      id v8 = [v3 codecParameters];
      id v9 = [v8 sampleRate];

      if (!v9) {
        goto LABEL_7;
      }
      int v10 = [v3 codecType];
      uint64_t v11 = [v10 value];

      if (v11 != 3
        || ([v3 codecParameters],
            __int16 v12 = objc_claimAutoreleasedReturnValue(),
            [v12 bitRate],
            int v13 = objc_claimAutoreleasedReturnValue(),
            uint64_t v14 = [v13 value],
            v13,
            v12,
            v14))
      {
LABEL_7:
        LOBYTE(v6) = 0;
        goto LABEL_10;
      }
      id v7 = [v3 codecParameters];
      uint64_t v15 = [v7 sampleRate];
      LOBYTE(v6) = [v15 value] == 1;
    }
  }
LABEL_10:

  return (char)v6;
}

- (id)_getBestAudioCodecConfiguration:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (-[HMDSiriServer _isAudioCodecSupported:](self, "_isAudioCodecSupported:", v9, (void)v12))
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_isSiriInputType:(int64_t)a3 supportedOnAccessory:(id)a4 siriAudioConfiguration:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (!v9
    || ([v9 supportedConfigurations],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    v32 = (void *)MEMORY[0x1D9452090]();
    v33 = self;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v35 = HMFGetLogIdentifier();
      v36 = [v8 name];
      v37 = [v8 uuid];
      v38 = [v37 UUIDString];
      *(_DWORD *)buf = 138543874;
      v59 = v35;
      __int16 v60 = 2112;
      *(void *)v61 = v36;
      *(_WORD *)&v61[8] = 2112;
      *(void *)&v61[10] = v38;
      _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Marking accessory not ready for connection due to missing Siri/Audio ability (%@/%@)", buf, 0x20u);
    }
    goto LABEL_17;
  }
  if ([v10 siriInputType] != a3)
  {
    v32 = (void *)MEMORY[0x1D9452090]();
    v33 = self;
    v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = HMFGetLogIdentifier();
      uint64_t v41 = [v10 siriInputType];
      v42 = [v8 name];
      v43 = [v8 uuid];
      [v43 UUIDString];
      v44 = v56 = v32;
      *(_DWORD *)buf = 138544386;
      v59 = v40;
      __int16 v60 = 2048;
      *(void *)v61 = a3;
      *(_WORD *)&v61[8] = 2048;
      *(void *)&v61[10] = v41;
      *(_WORD *)&v61[18] = 2112;
      *(void *)&v61[20] = v42;
      __int16 v62 = 2112;
      uint64_t v63 = (uint64_t)v44;
      _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@Checking for input type %ld, but accessory has input type %ld (%@/%@)", buf, 0x34u);

      v32 = v56;
    }

LABEL_17:
    BOOL v14 = 0;
    goto LABEL_18;
  }
  long long v12 = [v10 supportedConfigurations];
  long long v13 = [(HMDSiriServer *)self _getBestAudioCodecConfiguration:v12];

  BOOL v14 = v13 != 0;
  if (v13)
  {
    long long v15 = [v10 selectedConfiguration];
    char v16 = [v13 isEqual:v15];

    if ((v16 & 1) == 0)
    {
      id v18 = (void *)MEMORY[0x1D9452090]();
      v19 = self;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v50 = HMFGetLogIdentifier();
        uint64_t v21 = [v8 name];
        v52 = [v8 uuid];
        v54 = v18;
        uint64_t v22 = [v52 UUIDString];
        [v10 selectedConfiguration];
        *(_DWORD *)buf = 138544386;
        v59 = v50;
        __int16 v60 = 2112;
        *(void *)v61 = v21;
        *(_WORD *)&v61[8] = 2112;
        *(void *)&v61[10] = v22;
        v23 = (void *)v22;
        *(_WORD *)&v61[18] = 2112;
        *(void *)&v61[20] = v13;
        v63 = __int16 v62 = 2112;
        v24 = (void *)v63;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Need to set the audio configuration (%@/%@) %@ != %@", buf, 0x34u);

        id v18 = v54;
      }

      uint64_t v17 = [v8 setSelectedSiriAudioConfiguration:v13];
    }
    id v25 = (void *)MEMORY[0x1D9452090](v17);
    id v26 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = HMFGetLogIdentifier();
      v29 = [v8 name];
      uint64_t v30 = [v8 uuid];
      [v30 UUIDString];
      v31 = v55 = v25;
      *(_DWORD *)buf = 138543874;
      v59 = v28;
      __int16 v60 = 2112;
      *(void *)v61 = v29;
      *(_WORD *)&v61[8] = 2112;
      *(void *)&v61[10] = v31;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Marking accessory READY for connection (%@/%@)", buf, 0x20u);

      id v25 = v55;
    }
  }
  else
  {
    id v25 = (void *)MEMORY[0x1D9452090]();
    v46 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v53 = HMFGetLogIdentifier();
      v57 = [v10 supportedConfigurations];
      int v51 = [v57 count];
      v47 = [v8 name];
      v48 = [v8 uuid];
      [v48 UUIDString];
      *(_DWORD *)buf = 138544130;
      v59 = v53;
      __int16 v60 = 1024;
      *(_DWORD *)v61 = v51;
      *(_WORD *)&v61[4] = 2112;
      *(void *)&v61[6] = v47;
      *(void *)&v61[16] = *(_WORD *)&v61[14] = 2112;
      v49 = *(void **)&v61[16];
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Marking accessory not ready for connection due to none of the %u codecs allowed (%@/%@)", buf, 0x26u);
    }
  }

LABEL_18:

  return v14;
}

- (void)_checkSiriSupportByAccessory:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 canAcceptBulkSendListeners])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__HMDSiriServer__checkSiriSupportByAccessory___block_invoke;
    v13[3] = &unk_1E6A0D0F0;
    v13[4] = self;
    id v14 = v4;
    [v14 getSupportedSiriAudioConfiguration:v13];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1D9452090]();
    uint64_t v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [v4 name];
      id v10 = [v4 uuid];
      uint64_t v11 = [v10 UUIDString];
      *(_DWORD *)buf = 138543874;
      char v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Marking accessory not ready for connection due to missing HDS (%@/%@)", buf, 0x20u);
    }
    long long v12 = [(HMDSiriServer *)v6 siriAccessoryMonitor];
    [v12 accessory:v4 setSupportsDragonSiri:0];
  }
}

void __46__HMDSiriServer__checkSiriSupportByAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HMDSiriServer__checkSiriSupportByAccessory___block_invoke_2;
  block[3] = &unk_1E6A19668;
  uint64_t v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __46__HMDSiriServer__checkSiriSupportByAccessory___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _isSiriInputType:0 supportedOnAccessory:*(void *)(a1 + 40) siriAudioConfiguration:*(void *)(a1 + 48)];
  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = HAPStringFromAccessoryServerSession();
    [v3 registerForSessionRestore:v4];
  }
  id v5 = [*(id *)(a1 + 32) siriAccessoryMonitor];
  [v5 accessory:*(void *)(a1 + 40) setSupportsDragonSiri:v2];
}

- (void)_tearDownSiriUIContext
{
  id v3 = [(HMDSiriServer *)self siriUISession];

  if (v3)
  {
    id v5 = [(HMDSiriServer *)self siriUISession];
    [(HMDSiriServer *)self setSiriUISession:0];
    id v4 = [(HMDSiriServer *)self siriInputServer];
    [v4 deregisterSiriSession:v5];

    [(HMDSiriServer *)self _maybeTearDownSiriPlugin];
  }
}

- (void)_setupSiriUIContext
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDSiriServer *)self siriUISession];

  if (!v3)
  {
    id v4 = +[HMDSiriSession siriSessionForUI];
    if (v4)
    {
      id v5 = [(HMDSiriServer *)self siriInputServer];
      char v6 = [v5 registerSiriSession:v4];

      uint64_t v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = self;
      id v9 = HMFGetOSLogHandle();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if (v6)
      {
        if (v10)
        {
          uint64_t v11 = HMFGetLogIdentifier();
          long long v12 = [v4 identifier];
          int v15 = 138543618;
          char v16 = v11;
          __int16 v17 = 2112;
          id v18 = v12;
          _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Created UI session with session id %@", (uint8_t *)&v15, 0x16u);
        }
        [(HMDSiriServer *)v8 setSiriUISession:v4];
        goto LABEL_13;
      }
      if (v10)
      {
        long long v13 = HMFGetLogIdentifier();
        int v15 = 138543362;
        char v16 = v13;
        id v14 = "%{public}@Created UI session but it failed to register properly; aborting.";
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = self;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        long long v13 = HMFGetLogIdentifier();
        int v15 = 138543362;
        char v16 = v13;
        id v14 = "%{public}@Unable to create UI session; aborting.";
LABEL_11:
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v15, 0xCu);
      }
    }

LABEL_13:
  }
}

- (void)_maybeTearDownSiriPlugin
{
  id v3 = [(HMDSiriServer *)self siriUISession];
  if (!v3)
  {
    id v4 = [(HMDSiriServer *)self siriInputServer];

    if (!v4) {
      return;
    }
    id v5 = [(HMDSiriServer *)self siriInputServer];
    [v5 invalidate];
    id v3 = v5;
  }
}

- (void)_setupSiriPlugin
{
  id v3 = [(HMDSiriServer *)self siriInputServer];

  if (!v3)
  {
    id v4 = [HMDSiriRemoteInputServer alloc];
    id v6 = [(HMDSiriServer *)self queue];
    id v5 = [(HMDSiriRemoteInputServer *)v4 initWithQueue:v6];
    [(HMDSiriServer *)self setSiriInputServer:v5];
  }
}

- (void)_handleDisconnectForAccessory:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = HMFGetLogIdentifier();
      uint64_t v11 = [v6 name];
      long long v12 = [v6 uuid];
      *(_DWORD *)buf = 138543874;
      __int16 v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling disconnect for %@/%@.", buf, 0x20u);
    }
    long long v13 = [(HMDSiriServer *)v8 queue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__HMDSiriServer__handleDisconnectForAccessory___block_invoke;
    v14[3] = &unk_1E6A197C8;
    v14[4] = v8;
    id v15 = v6;
    dispatch_async(v13, v14);
  }
}

void __47__HMDSiriServer__handleDisconnectForAccessory___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) siriAccessoryMonitor];
  [v2 accessory:*(void *)(a1 + 40) setSupportsDragonSiri:0];
}

- (void)handleAccessoryRemoved:(id)a3
{
  id v4 = [a3 object];
  [(HMDSiriServer *)self _handleDisconnectForAccessory:v4];
}

- (void)handleAccessoryUnconfigured:(id)a3
{
  id v4 = [a3 object];
  [(HMDSiriServer *)self _handleDisconnectForAccessory:v4];
}

- (void)handleAccessoryConfigured:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [(HMDSiriServer *)self queue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__HMDSiriServer_handleAccessoryConfigured___block_invoke;
    v8[3] = &unk_1E6A197C8;
    void v8[4] = self;
    id v9 = v6;
    dispatch_async(v7, v8);
  }
}

uint64_t __43__HMDSiriServer_handleAccessoryConfigured___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkSiriSupportByAccessory:*(void *)(a1 + 40)];
}

- (void)handleAccessoryHasBulkSendDataStream:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [(HMDSiriServer *)self queue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__HMDSiriServer_handleAccessoryHasBulkSendDataStream___block_invoke;
    v8[3] = &unk_1E6A197C8;
    void v8[4] = self;
    id v9 = v6;
    dispatch_async(v7, v8);
  }
}

uint64_t __54__HMDSiriServer_handleAccessoryHasBulkSendDataStream___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) name];
    uint64_t v7 = [*(id *)(a1 + 40) uuid];
    id v8 = [v7 UUIDString];
    int v10 = 138543874;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    long long v13 = v6;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory has bulk-send Data Stream capability (%@/%@)", (uint8_t *)&v10, 0x20u);
  }
  return [*(id *)(a1 + 32) _checkSiriSupportByAccessory:*(void *)(a1 + 40)];
}

- (void)registerForMessages
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v11 = 138543362;
    __int16 v12 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Registering for messages.", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v7 = [(HMDSiriServer *)v4 notificationRegistration];
  [v7 addObserver:sel_handleAccessoryHasBulkSendDataStream_ name:@"HMDAccessoryDoesSupportBulkSendDataStreamNotification" object:0];

  id v8 = [(HMDSiriServer *)v4 notificationRegistration];
  [v8 addObserver:sel_handleAccessoryConfigured_ name:@"HMDAccessoryConnectedNotification" object:0];

  id v9 = [(HMDSiriServer *)v4 notificationRegistration];
  [v9 addObserver:sel_handleAccessoryUnconfigured_ name:@"HMDAccessoryDisconnectedNotification" object:0];

  int v10 = [(HMDSiriServer *)v4 notificationRegistration];
  [v10 addObserver:sel_handleAccessoryRemoved_ name:@"HMDHomeAccessoryRemovedNotification" object:0];
}

- (void)setTargetableAccessory:(id)a3 withControllers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDSiriServer *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HMDSiriServer_setTargetableAccessory_withControllers___block_invoke;
  block[3] = &unk_1E6A19668;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __56__HMDSiriServer_setTargetableAccessory_withControllers___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) siriAccessoryMonitor];
  [v2 setTargetableAccessory:*(void *)(a1 + 40) withControllers:*(void *)(a1 + 48)];

  if (![*(id *)(a1 + 32) targetControlIdentifier])
  {
    id v5 = [*(id *)(a1 + 40) uuid];
    id v3 = [*(id *)(a1 + 40) home];
    id v4 = [v3 uuid];
    objc_msgSend(*(id *)(a1 + 32), "setTargetControlIdentifier:", identifierForTargetWithUUID(v5, v4));
  }
}

- (HMDSiriServer)init
{
  v13.receiver = self;
  v13.super_class = (Class)HMDSiriServer;
  id v2 = [(HMDSiriServer *)&v13 init];
  if (v2)
  {
    inactive = dispatch_workloop_create_inactive("HMDSiriServer-Audio");
    dispatch_workloop_set_autorelease_frequency(inactive, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_workloop_set_scheduler_priority();
    dispatch_workloop_set_cpupercent();
    dispatch_set_qos_class_fallback();
    dispatch_activate(inactive);
    id v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = inactive;

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create_with_target_V2("HMDSiriServer", v5, *((dispatch_queue_t *)v2 + 3));
    id v7 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v6;

    id v8 = [[HMDNotificationRegistration alloc] initWithRegisterer:v2];
    id v9 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v8;

    id v10 = [[HMDSiriAccessoryMonitor alloc] initWithDelegate:v2];
    int v11 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v10;

    *((_DWORD *)v2 + 2) = 0;
  }
  return (HMDSiriServer *)v2;
}

+ (id)sharedSiriServer
{
  return 0;
}

@end