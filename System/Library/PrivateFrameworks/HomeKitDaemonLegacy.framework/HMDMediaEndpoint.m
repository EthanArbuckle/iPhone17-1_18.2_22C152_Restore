@interface HMDMediaEndpoint
+ (id)logCategory;
- (BOOL)doesContainAnyAccessory:(id)a3;
- (BOOL)isConnected;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEndpoint:(void *)a3;
- (HMDMediaBrowser)browser;
- (HMDMediaEndpoint)initWithEndpoint:(void *)a3;
- (NSArray)advertisements;
- (NSMutableArray)pendingBlocks;
- (NSSet)outputDeviceIdentifiers;
- (NSString)description;
- (NSString)localizedName;
- (NSString)logID;
- (NSString)sessionIdentifier;
- (OS_dispatch_queue)workQueue;
- (unint64_t)hash;
- (unsigned)connectionState;
- (void)_connectWithCompletionHandler:(id)a3;
- (void)_getPlaybackStateWithCompletionHandler:(id)a3;
- (void)_notifyPendingBlocksOfError:(id)a3;
- (void)_setPlaybackState:(unsigned int)a3 completionHandler:(id)a4;
- (void)_updateOutputDeviceIdentifiers;
- (void)_updateOutputDevicesAndConnectWithCompletionHandler:(id)a3;
- (void)copyOrigin;
- (void)dealloc;
- (void)disconnectFromEndpoint:(void *)a3;
- (void)disconnectWithCompletionHandler:(id)a3;
- (void)externalDevice;
- (void)getPlaybackStateWithCompletionHandler:(id)a3;
- (void)registerForNowPlayingUpdates:(BOOL)a3;
- (void)retainedEndpoint;
- (void)setBrowser:(id)a3;
- (void)setConnectionState:(unsigned int)a3;
- (void)setOutputDeviceIdentifiers:(id)a3;
- (void)setPendingBlocks:(id)a3;
- (void)setPlaybackState:(unsigned int)a3 completionHandler:(id)a4;
- (void)setRetainedEndpoint:(void *)a3;
- (void)updateOutputDevicesAndConnectWithCompletionHandler:(id)a3;
- (void)updateWithEndpoint:(id)a3;
@end

@implementation HMDMediaEndpoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_logID, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_outputDeviceIdentifiers, 0);
}

- (void)setPendingBlocks:(id)a3
{
}

- (NSMutableArray)pendingBlocks
{
  return self->_pendingBlocks;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setBrowser:(id)a3
{
}

- (HMDMediaBrowser)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  return (HMDMediaBrowser *)WeakRetained;
}

- (NSString)logID
{
  return self->_logID;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)description
{
  v3 = [(HMDMediaEndpoint *)self retainedEndpoint];
  v4 = NSString;
  v5 = [(HMDMediaEndpoint *)self localizedName];
  v6 = [(HMDMediaEndpoint *)self sessionIdentifier];
  v7 = [(HMDMediaEndpoint *)self advertisements];
  v8 = [v4 stringWithFormat:@"Endpoint(%@/%@) - sessionIdentifier %@  advertisements:\n%@", v3, v5, v6, v7];

  if (v3) {
    CFRelease(v3);
  }
  return (NSString *)v8;
}

- (void)_setPlaybackState:(unsigned int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__HMDMediaEndpoint__setPlaybackState_completionHandler___block_invoke;
  v8[3] = &unk_1E6A0D7E8;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  unsigned int v11 = a3;
  [(HMDMediaEndpoint *)self _connectWithCompletionHandler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __56__HMDMediaEndpoint__setPlaybackState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = v5;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v30 = v9;
      __int16 v31 = 2112;
      id v32 = v3;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Attempt to connect to the endpoint to set the playback state failed with error %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v10 = (const void *)[WeakRetained copyOrigin];
    unsigned int v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = v5;
    v13 = HMFGetOSLogHandle();
    v14 = v13;
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v30 = v15;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Attempting to locally set the playback state command with mediaRemote", buf, 0xCu);
      }
      v16 = [v12 workQueue];
      id v28 = *(id *)(a1 + 32);
      int v17 = MRMediaRemoteSendCommandForOriginWithReply();

      CFRelease(v10);
      if (!v17)
      {
        v18 = (void *)[v12 retainedEndpoint];
        v19 = (void *)MEMORY[0x1D9452090]();
        id v20 = v12;
        v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v30 = v22;
          __int16 v31 = 2112;
          id v32 = v18;
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Sending the command to mediaremote failed for media endpoint %@", buf, 0x16u);
        }
        if (v18) {
          CFRelease(v18);
        }
        v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2005];
        v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:74 description:@"Media remote command send failure " reason:@"Media remote command send failure" suggestion:0 underlyingError:v23];
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v30 = v25;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot look up origin for mediaSession to set playback state after connection", buf, 0xCu);
      }
      if (*(void *)(a1 + 32))
      {
        v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2005];
        v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:4 description:@"Cannot lookup origin" reason:@"Cannot lookup origin" suggestion:0 underlyingError:v26];
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
  }
}

uint64_t __56__HMDMediaEndpoint__setPlaybackState_completionHandler___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPlaybackState:(unsigned int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(HMDMediaEndpoint *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HMDMediaEndpoint_setPlaybackState_completionHandler___block_invoke;
  block[3] = &unk_1E6A0DBB8;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __55__HMDMediaEndpoint_setPlaybackState_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPlaybackState:*(unsigned int *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (void)_getPlaybackStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HMDMediaEndpoint__getPlaybackStateWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E6A16F80;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(HMDMediaEndpoint *)self _connectWithCompletionHandler:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __59__HMDMediaEndpoint__getPlaybackStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (v3)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = v5;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v9;
      __int16 v24 = 2112;
      id v25 = v3;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Attempt to connect to the endpoint to get the playback state failed with error %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v10 = (const void *)[WeakRetained copyOrigin];
    unsigned int v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = v5;
    v13 = HMFGetOSLogHandle();
    v14 = v13;
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v23 = v15;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Endpoint Attempting to locally read the playback state from media remote", buf, 0xCu);
      }
      v16 = [v12 workQueue];
      objc_copyWeak(&v21, (id *)(a1 + 40));
      id v20 = *(id *)(a1 + 32);
      MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin();

      CFRelease(v10);
      objc_destroyWeak(&v21);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v23 = v17;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot look up origin for mediaSession to get playback state after connection", buf, 0xCu);
      }
      if (*(void *)(a1 + 32))
      {
        v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2005];
        v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:4 description:@"Cannot lookup origin" reason:@"Cannot lookup origin" suggestion:0 underlyingError:v18];
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
  }
}

void __59__HMDMediaEndpoint__getPlaybackStateWithCompletionHandler___block_invoke_24(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (a2 > 5) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = qword_1D54D4460[a2];
    }
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v9;
    __int16 v13 = 2048;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Locally read the playback state as: %tu", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, void, uint64_t))(v10 + 16))(v10, 0, a2);
  }
}

- (void)getPlaybackStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaEndpoint *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HMDMediaEndpoint_getPlaybackStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __58__HMDMediaEndpoint_getPlaybackStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getPlaybackStateWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_notifyPendingBlocksOfError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(HMDMediaEndpoint *)self pendingBlocks];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(HMDMediaEndpoint *)self pendingBlocks];
  [v10 removeAllObjects];
}

- (BOOL)doesContainAnyAccessory:(id)a3
{
  outputDeviceIdentifiers = self->_outputDeviceIdentifiers;
  id v4 = a3;
  id v5 = (void *)[(NSSet *)outputDeviceIdentifiers mutableCopy];
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];

  [v5 intersectSet:v6];
  LOBYTE(v4) = [v5 count] != 0;

  return (char)v4;
}

- (NSArray)advertisements
{
  v2 = [(HMDMediaEndpoint *)self retainedEndpoint];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = MRAVEndpointCopyOutputDevices();
    if (v4)
    {
      id v5 = (const void *)v4;
      uint64_t v6 = +[HMDMediaBrowser advertisementsFromOutputDevices:v4];
      uint64_t v7 = [v6 allObjects];

      CFRelease(v5);
    }
    else
    {
      uint64_t v7 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (NSArray *)v7;
}

- (void)registerForNowPlayingUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDMediaEndpoint *)self externalDevice];
  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  uint64_t v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  uint64_t v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      long long v11 = (void *)v10;
      long long v12 = @"De-registering";
      if (v3) {
        long long v12 = @"Registering";
      }
      int v14 = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      int v17 = v12;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@%@ for playback state changes", (uint8_t *)&v14, 0x16u);
    }
    CFRetain(v5);
    MRExternalDeviceSetWantsNowPlayingUpdates();
    CFRelease(v5);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      uint64_t v15 = (uint64_t)v13;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot look up external device for endpoint to register for playback state updates", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)_connectWithCompletionHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMDMediaEndpoint *)self pendingBlocks];
    uint64_t v6 = _Block_copy(v4);
    [v5 addObject:v6];
  }
  uint64_t v7 = [(HMDMediaEndpoint *)self externalDevice];
  if (v7)
  {
    uint64_t v8 = v7;
    CFRetain(v7);
    uint64_t ConnectionState = MRExternalDeviceGetConnectionState();
    uint64_t v10 = [(HMDMediaEndpoint *)self setConnectionState:ConnectionState];
    if (ConnectionState == 1)
    {
      long long v12 = (void *)MEMORY[0x1D9452090](v10);
      long long v13 = self;
      int v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v25 = v15;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Already in the process of connecting to the external device...", buf, 0xCu);
      }
      CFRelease(v8);
    }
    else if (ConnectionState == 2)
    {
      [(HMDMediaEndpoint *)self _notifyPendingBlocksOfError:0];
      CFRelease(v8);
    }
    else
    {
      __int16 v16 = (void *)MEMORY[0x1D9452090](v10);
      int v17 = self;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v25 = v19;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@No connection to external device - setting up connection state callback and attempting to connect...", buf, 0xCu);
      }
      [(HMDMediaEndpoint *)v17 setConnectionState:1];
      id v20 = [(HMDMediaEndpoint *)v17 sessionIdentifier];
      objc_initWeak((id *)buf, v17);
      id v21 = [(HMDMediaEndpoint *)v17 workQueue];
      objc_copyWeak(&v23, (id *)buf);
      id v22 = v20;
      MRExternalDeviceSetConnectionStateCallback();

      MRExternalDeviceConnect();
      CFRelease(v8);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    long long v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54];
    [(HMDMediaEndpoint *)self _notifyPendingBlocksOfError:v11];
  }
}

void __50__HMDMediaEndpoint__connectWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    int v8 = [WeakRetained connectionState];
    [v7 setConnectionState:a2];
    if (a2 != 1 && v8 != a2)
    {
      uint64_t v9 = (const void *)[v7 retainedEndpoint];
      uint64_t v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = v7;
      long long v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        long long v13 = HMFGetLogIdentifier();
        int v23 = 138544386;
        __int16 v24 = v13;
        __int16 v25 = 1024;
        *(_DWORD *)uint64_t v26 = a2;
        *(_WORD *)&v26[4] = 1024;
        *(_DWORD *)&v26[6] = v8;
        __int16 v27 = 2112;
        id v28 = v9;
        __int16 v29 = 2112;
        v30 = a3;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Connection state changed to %u (from %u) for endpoint %@ with error %@", (uint8_t *)&v23, 0x2Cu);
      }
      if (v9) {
        CFRelease(v9);
      }
      id v14 = a3;
      if (a2 == 3 && v8 == 2)
      {
        uint64_t v15 = (void *)MEMORY[0x1D9452090]();
        id v16 = v11;
        int v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = HMFGetLogIdentifier();
          uint64_t v19 = *(void *)(a1 + 32);
          int v23 = 138543618;
          __int16 v24 = v18;
          __int16 v25 = 2112;
          *(void *)uint64_t v26 = v19;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Attempting to refresh the session for the accessories on endpoint (%@) disconnect", (uint8_t *)&v23, 0x16u);
        }
        id v20 = [v16 browser];
        id v21 = [v16 outputDeviceIdentifiers];
        id v22 = [v21 allObjects];
        [v20 updateSessionsForAccessories:v22];

        if (!v14)
        {
          id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:4];
        }
      }
      [v11 _notifyPendingBlocksOfError:v14];
    }
  }
}

- (void)updateOutputDevicesAndConnectWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaEndpoint *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__HMDMediaEndpoint_updateOutputDevicesAndConnectWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __71__HMDMediaEndpoint_updateOutputDevicesAndConnectWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateOutputDevicesAndConnectWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_updateOutputDevicesAndConnectWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(HMDMediaEndpoint *)self _updateOutputDeviceIdentifiers];
  [(HMDMediaEndpoint *)self _connectWithCompletionHandler:v4];
}

- (void)disconnectWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaEndpoint *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HMDMediaEndpoint_disconnectWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__HMDMediaEndpoint_disconnectWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) retainedEndpoint];
  if (v2)
  {
    BOOL v3 = (const void *)v2;
    __disconnectFromEndpoint(v2);
    CFRelease(v3);
  }
  [*(id *)(a1 + 32) setConnectionState:3];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
  id v5 = *(void **)(a1 + 32);
  id v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:4];
  [v5 _notifyPendingBlocksOfError:v6];
}

- (void)disconnectFromEndpoint:(void *)a3
{
  CFRetain(a3);
  id v5 = [(HMDMediaEndpoint *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__HMDMediaEndpoint_disconnectFromEndpoint___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(v5, block);
}

void __43__HMDMediaEndpoint_disconnectFromEndpoint___block_invoke(uint64_t a1)
{
  __disconnectFromEndpoint(*(void *)(a1 + 32));
  uint64_t v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

- (void)copyOrigin
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  result = [(HMDMediaEndpoint *)self externalDevice];
  if (result)
  {
    result = (void *)MRExternalDeviceCopyCustomOrigin();
    if (!result)
    {
      uint64_t v4 = (void *)MEMORY[0x1D9452090]();
      id v5 = self;
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = HMFGetLogIdentifier();
        int v8 = 138543362;
        uint64_t v9 = v7;
        _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Cannot look up origin from external device", (uint8_t *)&v8, 0xCu);
      }
      return 0;
    }
  }
  return result;
}

- (void)externalDevice
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDMediaEndpoint *)self retainedEndpoint];
  if (v3)
  {
    uint64_t v4 = v3;
    ExternalDevice = (void *)MRAVEndpointGetExternalDevice();
    if (!ExternalDevice)
    {
      id v6 = (void *)MEMORY[0x1D9452090]();
      uint64_t v7 = self;
      int v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = HMFGetLogIdentifier();
        int v15 = 138543618;
        id v16 = v9;
        __int16 v17 = 2112;
        uint64_t v18 = v4;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Cannot look up the external device for endpoint %@", (uint8_t *)&v15, 0x16u);
      }
    }
    CFRelease(v4);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    long long v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      long long v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      id v16 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@No endpoint to look up origin", (uint8_t *)&v15, 0xCu);
    }
    return 0;
  }
  return ExternalDevice;
}

- (BOOL)isConnected
{
  return [(HMDMediaEndpoint *)self connectionState] != 3;
}

- (void)setOutputDeviceIdentifiers:(id)a3
{
  uint64_t v4 = (NSSet *)a3;
  os_unfair_lock_lock_with_options();
  outputDeviceIdentifiers = self->_outputDeviceIdentifiers;
  self->_outputDeviceIdentifiers = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSSet)outputDeviceIdentifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_outputDeviceIdentifiers;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setConnectionState:(unsigned int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_connectionState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unsigned)connectionState
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LODWORD(v2) = v2->_connectionState;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (void)updateWithEndpoint:(id)a3
{
  uint64_t v4 = (CFTypeRef *)a3;
  id v5 = v4;
  CFTypeRef v6 = v4[2];
  if (v6) {
    CFRetain(v4[2]);
  }
  uint64_t v7 = [(HMDMediaEndpoint *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__HMDMediaEndpoint_updateWithEndpoint___block_invoke;
  v8[3] = &unk_1E6A189D0;
  void v8[4] = self;
  v8[5] = v6;
  dispatch_async(v7, v8);
}

void __39__HMDMediaEndpoint_updateWithEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v2 = (const void *)[*(id *)(a1 + 32) retainedEndpoint];
  BOOL v3 = v2;
  if (v2 == *(const void **)(a1 + 40))
  {
    if (!v2) {
      return;
    }
    CFRelease(v2);
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "setRetainedEndpoint:");
  if (v3)
  {
    __disconnectFromEndpoint((uint64_t)v3);
    CFRelease(v3);
  }
  [*(id *)(a1 + 32) setConnectionState:0];
  uint64_t v4 = *(const void **)(a1 + 40);
  if (v4)
  {
    CFRetain(v4);
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v5 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__HMDMediaEndpoint_updateWithEndpoint___block_invoke_2;
    v7[3] = &unk_1E6A0E360;
    objc_copyWeak(v8, &location);
    v8[1] = *(id *)(a1 + 40);
    [v5 _updateOutputDevicesAndConnectWithCompletionHandler:v7];
    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
LABEL_8:
    CFTypeRef v6 = *(const void **)(a1 + 40);
    if (v6) {
      CFRelease(v6);
    }
  }
}

void __39__HMDMediaEndpoint_updateWithEndpoint___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  uint64_t v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v8)
    {
      uint64_t v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 40);
      int v15 = 138543874;
      id v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      id v20 = v3;
      id v11 = "%{public}@Updating connection to endpoint %@ failed with error %@";
      long long v12 = v7;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, v13);
    }
  }
  else if (v8)
  {
    uint64_t v9 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138543618;
    id v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    id v11 = "%{public}@Updated connection to endpoint %@";
    long long v12 = v7;
    uint32_t v13 = 22;
    goto LABEL_6;
  }

  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)_updateOutputDeviceIdentifiers
{
  id v3 = [(HMDMediaEndpoint *)self retainedEndpoint];
  if (v3)
  {
    uint64_t v4 = v3;
    CFArrayRef v5 = (const __CFArray *)MRAVEndpointCopyOutputDevices();
    if (v5)
    {
      CFArrayRef v6 = v5;
      CFIndex Count = CFArrayGetCount(v5);
      BOOL v8 = [MEMORY[0x1E4F1CA80] setWithCapacity:Count];
      if (Count >= 1)
      {
        for (CFIndex i = 0; i != Count; ++i)
        {
          if (CFArrayGetValueAtIndex(v6, i))
          {
            uint64_t v10 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
            if (v10) {
              [v8 addObject:v10];
            }
          }
        }
      }
      id v11 = (void *)[v8 copy];
      [(HMDMediaEndpoint *)self setOutputDeviceIdentifiers:v11];

      CFRelease(v6);
    }
    CFRelease(v4);
  }
}

- (void)setRetainedEndpoint:(void *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  os_unfair_lock_lock_with_options();
  retainedEndpoint = self->_retainedEndpoint;
  if (retainedEndpoint == a3)
  {
    if (a3) {
      CFRelease(a3);
    }
  }
  else
  {
    self->_retainedEndpoint = a3;
    if (retainedEndpoint) {
      CFRelease(retainedEndpoint);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)retainedEndpoint
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  retainedEndpoint = self->_retainedEndpoint;
  if (retainedEndpoint) {
    CFRetain(retainedEndpoint);
  }
  os_unfair_lock_unlock(p_lock);
  return retainedEndpoint;
}

- (BOOL)isEqualToEndpoint:(void *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(a3) = self->_retainedEndpoint == a3;
  os_unfair_lock_unlock(p_lock);
  return (char)a3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMDMediaEndpoint *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      CFArrayRef v5 = v4;
    }
    else {
      CFArrayRef v5 = 0;
    }
    CFArrayRef v6 = v5;
    if (v6
      && ([(HMDMediaEndpoint *)self sessionIdentifier],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          [(HMDMediaEndpoint *)v6 sessionIdentifier],
          BOOL v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v7 isEqual:v8],
          v8,
          v7,
          v9))
    {
      uint64_t v10 = [(HMDMediaEndpoint *)v6 retainedEndpoint];
      BOOL v11 = [(HMDMediaEndpoint *)self isEqualToEndpoint:v10];
      if (v10) {
        CFRelease(v10);
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  return v11;
}

- (unint64_t)hash
{
  return [(NSString *)self->_sessionIdentifier hash];
}

- (void)dealloc
{
  retainedEndpoint = self->_retainedEndpoint;
  if (retainedEndpoint)
  {
    CFRelease(retainedEndpoint);
    self->_retainedEndpoint = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)HMDMediaEndpoint;
  [(HMDMediaEndpoint *)&v4 dealloc];
}

- (HMDMediaEndpoint)initWithEndpoint:(void *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)HMDMediaEndpoint;
  objc_super v4 = [(HMDMediaEndpoint *)&v22 init];
  if (!v4) {
    goto LABEL_4;
  }
  if (a3)
  {
    CFRetain(a3);
    v4->_retainedEndpoint = a3;
    HMDispatchQueueNameString();
    id v5 = objc_claimAutoreleasedReturnValue();
    CFArrayRef v6 = (const char *)[v5 UTF8String];
    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create(v6, v7);
    workQueue = v4->_workQueue;
    v4->_workQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = MRAVEndpointCopyUniqueIdentifier();
    sessionIdentifier = v4->_sessionIdentifier;
    v4->_sessionIdentifier = (NSString *)v10;

    uint64_t v12 = MRAVEndpointCopyLocalizedName();
    localizedName = v4->_localizedName;
    v4->_localizedName = (NSString *)v12;

    uint64_t v14 = NSString;
    int v15 = [(HMDMediaEndpoint *)v4 localizedName];
    id v16 = [(HMDMediaEndpoint *)v4 sessionIdentifier];
    uint64_t v17 = [v14 stringWithFormat:@"Endpoint(%@/%@)", v15, v16];
    logID = v4->_logID;
    v4->_logID = (NSString *)v17;

    v4->_connectionState = 0;
    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    pendingBlocks = v4->_pendingBlocks;
    v4->_pendingBlocks = (NSMutableArray *)v19;

    [(HMDMediaEndpoint *)v4 updateOutputDevicesAndConnectWithCompletionHandler:0];
LABEL_4:
    a3 = v4;
  }

  return (HMDMediaEndpoint *)a3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t28_82481 != -1) {
    dispatch_once(&logCategory__hmf_once_t28_82481, &__block_literal_global_82482);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v29_82483;
  return v2;
}

uint64_t __31__HMDMediaEndpoint_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v29_82483;
  logCategory__hmf_once_v29_82483 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end