@interface HMDRemoteDeviceMonitor
+ (id)logCategory;
+ (id)pingMessageForDevice:(id)a3 timeout:(double)a4 restriction:(unint64_t)a5;
- (BOOL)isReachable;
- (HMDAccountRegistry)accountRegistry;
- (HMDModernTransportDeviceReachabilityObserver)transportReachabilityObserver;
- (HMDRemoteDeviceInformation)_startMonitoringDevice:(void *)a3 withInitialReachability:(void *)a4 forClient:;
- (HMDRemoteDeviceMonitor)init;
- (HMDRemoteDeviceMonitor)initWithAccountRegistry:(id)a3 activityObserver:(id)a4 accountManager:(id)a5;
- (HMDRemoteDeviceMonitor)initWithAccountRegistry:(id)a3 activityObserver:(id)a4 queue:(id)a5 service:(id)a6 modernService:(id)a7 accountManager:(id)a8 remoteAccountManager:(id)a9 netMonitor:(id)a10 factory:(id)a11;
- (NSArray)unreachableDevices;
- (id)_deviceInformationForDevice:(uint64_t)a1;
- (id)devices;
- (id)dumpState;
- (id)iCloudAccount;
- (id)newConfirmationHandlerWithTimeout:(double)a3 workQueue:(id)a4 handler:(id)a5;
- (id)newDeviceMonitoringTimer;
- (id)newInitialDeviceHealthTimer;
- (id)newRepeatingDeviceHealthTimer;
- (id)newSendMessageOperationWithMessage:(id)a3;
- (void)_confirmDevice:(void *)a3 timeout:(double)a4 completionHandler:;
- (void)_handleGlobalReachabilityChange;
- (void)_handleIncomingMessageForDevice:(id)a3;
- (void)_sendPingToDevice:(dispatch_queue_t *)a1;
- (void)_stopMonitoringDevice:(uint64_t)a1;
- (void)account:(id)a3 isActiveChanged:(BOOL)a4;
- (void)account:(id)a3 loginChanged:(id)a4;
- (void)confirmDevice:(id)a3 forClient:(id)a4 timeout:(double)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)handleAccountRemoved:(id)a3;
- (void)handleCurrentDeviceUpdate:(id)a3;
- (void)handleDeviceRemovedFromAccount:(id)a3;
- (void)handleReachabilityChange:(void *)a3 deviceInformation:(unint64_t)a4 reason:(char)a5 didStartMonitoringDevice:;
- (void)modernTransportDeviceReachabilityObserverDidUpdate:(id)a3 isReachable:(BOOL)a4;
- (void)networkMonitorIsReachable:(id)a3;
- (void)networkMonitorIsUnreachable:(id)a3;
- (void)notifyDeviceReachabilityChange:(void *)a3 forDevice:;
- (void)observer:(id)a3 didUpdateDevice:(id)a4 isOnline:(BOOL)a5;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)setReachable:(uint64_t)a1;
- (void)setTransportReachabilityObserver:(id)a3;
- (void)start;
- (void)startMonitoringDevice:(id)a3 withInitialReachability:(id)a4 forClient:(id)a5;
- (void)stopMonitoringDevice:(id)a3 forClient:(id)a4;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDRemoteDeviceMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDeviceHealthTimer, 0);
  objc_storeStrong((id *)&self->_deviceHealthTimer, 0);
  objc_storeStrong((id *)&self->_deviceInformationByDevice, 0);
  objc_destroyWeak((id *)&self->_factory);
  objc_storeStrong((id *)&self->_netMonitor, 0);
  objc_destroyWeak((id *)&self->_remoteAccountManager);
  objc_destroyWeak((id *)&self->_accountManager);
  objc_storeStrong((id *)&self->_activityObserver, 0);
  objc_destroyWeak((id *)&self->_iCloudAccount);
  objc_storeStrong((id *)&self->_modernService, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_accountRegistry, 0);
  objc_storeStrong((id *)&self->_transportReachabilityObserver, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (HMDAccountRegistry)accountRegistry
{
  return self->_accountRegistry;
}

- (void)modernTransportDeviceReachabilityObserverDidUpdate:(id)a3 isReachable:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(HMDRemoteDeviceMonitor *)self accountRegistry];
  v8 = [v7 deviceForAddress:v6];

  if (!a4 && v8)
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      v13 = [v8 shortDescription];
      int v14 = 138543618;
      v15 = v12;
      __int16 v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Transport detects device %{public}@ might be unreachable, confirming...", (uint8_t *)&v14, 0x16u);
    }
    [(HMDRemoteDeviceMonitor *)v10 confirmDevice:v8 forClient:v10 timeout:0 completionHandler:65.0];
  }
}

- (void)observer:(id)a3 didUpdateDevice:(id)a4 isOnline:(BOOL)a5
{
  id v8 = a4;
  v9 = v8;
  if (self) {
    activityObserver = self->_activityObserver;
  }
  else {
    activityObserver = 0;
  }
  if (activityObserver == a3)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__HMDRemoteDeviceMonitor_observer_didUpdateDevice_isOnline___block_invoke;
    block[3] = &unk_1E6A18708;
    block[4] = self;
    id v13 = v8;
    BOOL v14 = a5;
    dispatch_async(queue, block);
  }
}

void __60__HMDRemoteDeviceMonitor_observer_didUpdateDevice_isOnline___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = [*(id *)(a1 + 40) shortDescription];
    v7 = (void *)v6;
    int v8 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    if (v8) {
      v9 = @"Connected";
    }
    else {
      v9 = @"Disconnected";
    }
    v31 = v5;
    __int16 v32 = 2114;
    uint64_t v33 = v6;
    __int16 v34 = 2112;
    v35 = v9;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received IDS Activity update for device %{public}@: %@", buf, 0x20u);
  }
  v10 = [[HMDRemoteDeviceReachabilityChangeLogEvent alloc] initWithReason:4 reachable:*(unsigned __int8 *)(a1 + 48) targetSupportsIDSPresence:1];
  v11 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v11 submitLogEvent:v10];

  v12 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  uint64_t v13 = -[HMDRemoteDeviceMonitor _deviceInformationForDevice:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  os_unfair_lock_unlock(v12);
  if (!v13)
  {
    BOOL v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = *(id *)(a1 + 32);
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      v20 = [*(id *)(a1 + 40) shortDescription];
      *(_DWORD *)buf = 138543618;
      v31 = v19;
      __int16 v32 = 2114;
      uint64_t v33 = (uint64_t)v20;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@No Device Information found for device: %{public}@", buf, 0x16u);
    }
    goto LABEL_10;
  }
  if (*(unsigned char *)(a1 + 48) == (*(unsigned char *)(v13 + 8) & 1))
  {
    BOOL v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = *(id *)(a1 + 32);
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = HMFGetLogIdentifier();
      uint64_t v18 = [*(id *)(a1 + 40) shortDescription];
      *(_DWORD *)buf = 138543618;
      v31 = v17;
      __int16 v32 = 2114;
      uint64_t v33 = (uint64_t)v18;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Server reachability is the same as our reachability for device: %{public}@", buf, 0x16u);
    }
LABEL_10:

    goto LABEL_17;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v13 + 24));
  *(void *)(v13 + 40) &= ~8uLL;
  v21 = (void *)MEMORY[0x1D9452090]();
  id v22 = *(id *)(a1 + 32);
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = HMFGetLogIdentifier();
    v25 = [*(id *)(a1 + 40) shortDescription];
    *(_DWORD *)buf = 138543618;
    v31 = v24;
    __int16 v32 = 2114;
    uint64_t v33 = (uint64_t)v25;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Confirming device %{public}@ because server reachability is different from our reachability", buf, 0x16u);
  }
  [*(id *)(v13 + 64) suspend];
  v26 = *(void **)(v13 + 64);
  *(void *)(v13 + 64) = 0;

  uint64_t v27 = *(void *)(a1 + 32);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __60__HMDRemoteDeviceMonitor_observer_didUpdateDevice_isOnline___block_invoke_197;
  v28[3] = &unk_1E6A196E0;
  v28[4] = v27;
  id v29 = *(id *)(a1 + 40);
  -[HMDRemoteDeviceMonitor _confirmDevice:timeout:completionHandler:](v27, (void *)v13, v28, 65.0);

LABEL_17:
}

- (id)_deviceInformationForDevice:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v2 + 8));
    uint64_t v2 = [*(id *)(v2 + 120) objectForKey:v3];
  }
  return (id)v2;
}

void __60__HMDRemoteDeviceMonitor_observer_didUpdateDevice_isOnline___block_invoke_197(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    uint64_t v8 = [*(id *)(a1 + 40) shortDescription];
    v9 = (void *)v8;
    v10 = @"Success";
    int v11 = 138543874;
    v12 = v7;
    if (v3) {
      v10 = v3;
    }
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    __int16 v16 = v10;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Ping result due to IDS Activity for device %{public}@: %@", (uint8_t *)&v11, 0x20u);
  }
}

- (void)_confirmDevice:(void *)a3 timeout:(double)a4 completionHandler:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v7 = a2;
  uint64_t v8 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    os_unfair_lock_lock_with_options();
    int v9 = *(unsigned __int8 *)(a1 + 41);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v9)
    {
      if (v7) {
        id Property = objc_getProperty(v7, v10, 16, 1);
      }
      else {
        id Property = 0;
      }
      id v12 = Property;
      if ([(id)a1 isReachable])
      {
        if ([v12 isCurrentDevice])
        {
          __int16 v13 = (void *)MEMORY[0x1D9452090]();
          id v14 = (id)a1;
          __int16 v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            __int16 v16 = HMFGetLogIdentifier();
            int v40 = 138543362;
            v41 = v16;
            _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Confirming ourselves, returning success", (uint8_t *)&v40, 0xCu);
          }
          if (v8) {
            v8[2](v8, 0);
          }
          goto LABEL_19;
        }
        if (v7)
        {
          BOOL v27 = ((unint64_t)v7[5] & 0xA) == 0;
          if (((_BYTE)v7[1] & 1) == 0 && ((unint64_t)v7[5] & 0xA) != 0)
          {
            v28 = (void *)MEMORY[0x1D9452090]();
            id v29 = (id)a1;
            v30 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              v31 = HMFGetLogIdentifier();
              __int16 v32 = [v12 shortDescription];
              int v40 = 138543618;
              v41 = v31;
              __int16 v42 = 2114;
              v43 = v32;
              _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@The device is already unreachable: %{public}@", (uint8_t *)&v40, 0x16u);
            }
            dispatch_assert_queue_V2(v7[3]);
            v7[5] = (dispatch_queue_t)((unint64_t)v7[5] | 1);
            if (!v8) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }
        }
        else
        {
          BOOL v27 = 1;
        }
        if (v8) {
          -[HMDRemoteDeviceInformation queueConfirmationHandler:timeout:]((uint64_t)v7, v8, a4);
        }
        if (v27)
        {
          -[HMDRemoteDeviceMonitor _sendPingToDevice:]((dispatch_queue_t *)a1, v7);
        }
        else
        {
          uint64_t v33 = (void *)MEMORY[0x1D9452090]();
          id v34 = (id)a1;
          v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            v37 = HMFGetLogIdentifier();
            if (v7) {
              id v38 = objc_getProperty(v7, v36, 16, 1);
            }
            else {
              id v38 = 0;
            }
            v39 = [v38 shortDescription];
            int v40 = 138543618;
            v41 = v37;
            __int16 v42 = 2114;
            v43 = v39;
            _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@The device is already being confirmed: %{public}@", (uint8_t *)&v40, 0x16u);
          }
        }
        goto LABEL_19;
      }
      v21 = (void *)MEMORY[0x1D9452090]();
      id v22 = (id)a1;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = HMFGetLogIdentifier();
        v25 = [v12 shortDescription];
        int v40 = 138543618;
        v41 = v24;
        __int16 v42 = 2114;
        v43 = v25;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@We are currently unreachable, so failing confirm for device: %{public}@", (uint8_t *)&v40, 0x16u);
      }
      if (!v8) {
        goto LABEL_19;
      }
LABEL_18:
      v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54];
      ((void (**)(id, void *))v8)[2](v8, v26);

      goto LABEL_19;
    }
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = (id)a1;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      int v40 = 138543362;
      v41 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot confirm device before monitor has started", (uint8_t *)&v40, 0xCu);
    }
    if (v8)
    {
      id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      ((void (**)(id, id))v8)[2](v8, v12);
LABEL_19:
    }
  }
}

- (void)_sendPingToDevice:(dispatch_queue_t *)a1
{
  v56[2] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    if (v3)
    {
      if (objc_msgSend(objc_getProperty(v3, v4, 16, 1), "isCurrentDevice"))
      {
        id v5 = (void *)MEMORY[0x1D9452090]();
        uint64_t v6 = a1;
        v7 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v8;
          _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to send ping to ourselves", buf, 0xCu);
        }
LABEL_6:

        goto LABEL_24;
      }
      BOOL v9 = ((unint64_t)v3[5] & 2) == 0;
      id v5 = (void *)MEMORY[0x1D9452090]();
      uint64_t v6 = a1;
      v10 = HMFGetOSLogHandle();
      v7 = v10;
      if (!v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v24 = HMFGetLogIdentifier();
          v26 = objc_msgSend(objc_getProperty(v3, v25, 16, 1), "shortDescription");
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v24;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v26;
          _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Already pinging to device: %{public}@", buf, 0x16u);
        }
        goto LABEL_6;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = HMFGetLogIdentifier();
        __int16 v13 = objc_msgSend(objc_getProperty(v3, v12, 16, 1), "shortDescription");
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v13;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Sending ping to device: %{public}@", buf, 0x16u);
      }
      [v3[8] suspend];
      objc_initWeak(&location, v6);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __44__HMDRemoteDeviceMonitor__sendPingToDevice___block_invoke;
      aBlock[3] = &unk_1E6A17758;
      objc_copyWeak(&v48, &location);
      id v14 = v3;
      v47 = v14;
      v45 = _Block_copy(aBlock);
      double v15 = 65.0;
      if ((_pingTimeoutAdjustedForIDSPushBlackout_isPushAvailable & 1) == 0)
      {
        __int16 v16 = [MEMORY[0x1E4F28F80] processInfo];
        [v16 systemUptime];
        double v18 = v17;

        double v19 = 120.0 - v18;
        if (v19 <= 0.0)
        {
          BOOL v27 = (void *)MEMORY[0x1D9452090]();
          v28 = v6;
          id v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v30;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = 0x4050400000000000;
            _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Push is available, using default ping timeout: %f", buf, 0x16u);
          }
          _pingTimeoutAdjustedForIDSPushBlackout_isPushAvailable = 1;
        }
        else
        {
          v20 = (void *)MEMORY[0x1D9452090]();
          v21 = v6;
          id v22 = HMFGetOSLogHandle();
          double v15 = v19 + 65.0;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v23 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v23;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v19 + 65.0;
            _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Push is unavailable, using extended ping timeout: %f", buf, 0x16u);
          }
        }
      }
      -[HMDRemoteDeviceInformation queueConfirmationHandler:timeout:]((uint64_t)v14, v45, v15);
      dispatch_assert_queue_V2(v14[3]);
      v14[5] = (dispatch_queue_t)((unint64_t)v14[5] | 2);
      dispatch_assert_queue_V2(v14[3]);
      v14[5] = (dispatch_queue_t)((unint64_t)v14[5] & 0xFFFFFFFFFFFFFFFBLL);
      v31 = v14;
      uint64_t v33 = +[HMDRemoteDeviceMonitor pingMessageForDevice:objc_getProperty(v31, v32, 16, 1) timeout:0 restriction:v15];
      id WeakRetained = objc_loadWeakRetained(v6 + 14);
      v35 = (void *)[WeakRetained newSendMessageOperationWithMessage:v33];
      objc_initWeak(&from, v6);
      objc_initWeak(&v50, v35);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __61__HMDRemoteDeviceMonitor__createRemotePingOperation_timeout___block_invoke;
      v53 = &unk_1E6A177A8;
      objc_copyWeak(&v55, &from);
      objc_copyWeak(v56, &v50);
      uint64_t v36 = v31;
      v54 = v36;
      [v35 setCompletionBlock:buf];

      objc_destroyWeak(v56);
      objc_destroyWeak(&v55);
      objc_destroyWeak(&v50);
      objc_destroyWeak(&from);

      v37 = (void *)MEMORY[0x1D9452090]();
      id v38 = v6;
      HMFGetOSLogHandle();
      v39 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v40 = (id)objc_claimAutoreleasedReturnValue();
        v41 = [v35 shortDescription];
        id v43 = objc_getProperty(v36, v42, 16, 1);
        uint64_t v44 = [v43 shortDescription];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v40;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v41;
        *(_WORD *)&buf[22] = 2114;
        v53 = v44;
        _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@Starting ping operation %{public}@ for device: %{public}@", buf, 0x20u);
      }
      [v38[3] addOperation:v35];

      objc_destroyWeak(&v48);
      objc_destroyWeak(&location);
    }
  }
LABEL_24:
}

void __44__HMDRemoteDeviceMonitor__sendPingToDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[2]);
    uint64_t v6 = (void *)MEMORY[0x1D9452090]();
    v7 = v5;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = HMFGetLogIdentifier();
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v9, 16, 1);
      }
      SEL v12 = [Property shortDescription];
      int v32 = 138543874;
      uint64_t v33 = v10;
      __int16 v34 = 2114;
      v35 = v12;
      __int16 v36 = 2112;
      id v37 = v3;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Confirmation completed for device %{public}@ with error: %@", (uint8_t *)&v32, 0x20u);
    }
    if (!v3)
    {
      v24 = (void *)MEMORY[0x1D9452090]();
      SEL v25 = v7;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v28 = HMFGetLogIdentifier();
        id v29 = *(id *)(a1 + 32);
        if (v29) {
          id v29 = objc_getProperty(v29, v27, 16, 1);
        }
        v30 = [v29 shortDescription];
        int v32 = 138543618;
        uint64_t v33 = v28;
        __int16 v34 = 2114;
        v35 = v30;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Confirmation succeeded to reachable device: %{public}@", (uint8_t *)&v32, 0x16u);
      }
      -[HMDRemoteDeviceMonitor handleReachabilityChange:deviceInformation:reason:didStartMonitoringDevice:](v25, 1, *(void **)(a1 + 32), 1uLL, 0);
      goto LABEL_27;
    }
    uint64_t v13 = *(void *)(a1 + 32);
    if (!v13 || (*(unsigned char *)(v13 + 8) & 1) == 0)
    {
      id v14 = (void *)MEMORY[0x1D9452090]();
      double v15 = v7;
      __int16 v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        double v18 = HMFGetLogIdentifier();
        id v19 = *(id *)(a1 + 32);
        if (v19) {
          id v19 = objc_getProperty(v19, v17, 16, 1);
        }
        v20 = [v19 shortDescription];
        int v32 = 138543874;
        uint64_t v33 = v18;
        __int16 v34 = 2114;
        v35 = v20;
        __int16 v36 = 2112;
        id v37 = v3;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Confirmation failed to unreachable device %{public}@ with error: %@", (uint8_t *)&v32, 0x20u);
      }
    }
    v21 = [v3 domain];
    if ([v21 isEqual:*MEMORY[0x1E4F64ED0]])
    {
      uint64_t v22 = [v3 code];

      if (v22 == 13)
      {
        unint64_t v23 = 3;
LABEL_24:
        -[HMDRemoteDeviceMonitor handleReachabilityChange:deviceInformation:reason:didStartMonitoringDevice:](v7, 0, *(void **)(a1 + 32), v23, 0);
        -[HMDRemoteDeviceInformation addState:](*(void *)(a1 + 32), 8);
        uint64_t v31 = *(void *)(a1 + 32);
        if (v31 && (*(unsigned char *)(v31 + 40) & 4) != 0)
        {
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(v31 + 24));
          *(void *)(v31 + 40) &= ~2uLL;
        }
LABEL_27:
        -[HMDRemoteDeviceInformation completeConfirmationsWithError:](*(void *)(a1 + 32), v3);
        goto LABEL_28;
      }
    }
    else
    {
    }
    unint64_t v23 = 2;
    goto LABEL_24;
  }
LABEL_28:
}

void __61__HMDRemoteDeviceMonitor__createRemotePingOperation_timeout___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(a1 + 6);
    v4 = [v3 error];
    id v5 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__HMDRemoteDeviceMonitor__createRemotePingOperation_timeout___block_invoke_2;
    block[3] = &unk_1E6A19668;
    block[4] = WeakRetained;
    id v8 = v4;
    id v9 = a1[4];
    id v6 = v4;
    dispatch_async(v5, block);
  }
}

void __61__HMDRemoteDeviceMonitor__createRemotePingOperation_timeout___block_invoke_2(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    id v8 = *(void **)(a1 + 40);
    id Property = *(id *)(a1 + 48);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 16, 1);
    }
    id v9 = [Property shortDescription];
    int v50 = 138543874;
    v51 = v6;
    __int16 v52 = 2112;
    v53 = v8;
    __int16 v54 = 2114;
    id v55 = v9;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Operation completed with error %@ to device %{public}@", (uint8_t *)&v50, 0x20u);
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10 && (*(unsigned char *)(v10 + 40) & 2) != 0)
  {
    uint64_t v11 = *(void *)(a1 + 40);
    SEL v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = *(id *)(a1 + 32);
    id v14 = HMFGetOSLogHandle();
    double v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        double v17 = HMFGetLogIdentifier();
        id v18 = *(id *)(a1 + 48);
        if (v18) {
          id v18 = objc_getProperty(v18, v16, 16, 1);
        }
        id v19 = [v18 shortDescription];
        v20 = *(void **)(a1 + 40);
        int v50 = 138543874;
        v51 = v17;
        __int16 v52 = 2114;
        v53 = v19;
        __int16 v54 = 2112;
        id v55 = v20;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to send ping to device %{public}@ with error: %@", (uint8_t *)&v50, 0x20u);
      }
      -[HMDRemoteDeviceInformation completeConfirmationsWithError:](*(void *)(a1 + 48), *(void **)(a1 + 40));
      uint64_t v22 = *(void *)(a1 + 32);
      if (v22) {
        id WeakRetained = objc_loadWeakRetained((id *)(v22 + 96));
      }
      else {
        id WeakRetained = 0;
      }
      uint64_t v25 = *(void *)(a1 + 40);
      id v24 = *(id *)(a1 + 48);
      if (v24) {
        id v24 = objc_getProperty(v24, v21, 16, 1);
      }
      v26 = [v24 remoteDestinationString];
      objc_msgSend(WeakRetained, "__handleSendMessageFailureWithError:destination:", v25, v26);

      -[HMDRemoteDeviceInformation addState:](*(void *)(a1 + 48), 1);
      -[HMDRemoteDeviceInformation clearState:](*(void *)(a1 + 48));
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v28 = HMFGetLogIdentifier();
        id v29 = *(id *)(a1 + 48);
        if (v29) {
          id v29 = objc_getProperty(v29, v27, 16, 1);
        }
        v30 = [v29 shortDescription];
        int v50 = 138543618;
        v51 = v28;
        __int16 v52 = 2114;
        v53 = v30;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully sent ping to device: %{public}@", (uint8_t *)&v50, 0x16u);
      }
      -[HMDRemoteDeviceInformation addState:](*(void *)(a1 + 48), 4);
    }
    uint64_t v31 = *(void **)(a1 + 32);
    int v32 = *(id *)(a1 + 48);
    uint64_t v33 = v32;
    if (!v31) {
      goto LABEL_33;
    }
    if (v32) {
      uint64_t v34 = v32[8];
    }
    else {
      uint64_t v34 = 0;
    }
    v35 = (void *)MEMORY[0x1D9452090]();
    __int16 v36 = v31;
    id v37 = HMFGetOSLogHandle();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);
    if (v34)
    {
      if (v38)
      {
        id v40 = HMFGetLogIdentifier();
        if (v33) {
          id v41 = objc_getProperty(v33, v39, 16, 1);
        }
        else {
          id v41 = 0;
        }
        SEL v42 = [v41 shortDescription];
        int v50 = 138543618;
        v51 = v40;
        __int16 v52 = 2114;
        v53 = v42;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Resuming actively monitoring device: %{public}@", (uint8_t *)&v50, 0x16u);
      }
      if (v33)
      {
LABEL_31:
        id v43 = (void *)v33[8];
LABEL_32:
        [v43 resume];
LABEL_33:

        return;
      }
    }
    else
    {
      if (v38)
      {
        v45 = HMFGetLogIdentifier();
        if (v33) {
          id v46 = objc_getProperty(v33, v44, 16, 1);
        }
        else {
          id v46 = 0;
        }
        v47 = [v46 shortDescription];
        int v50 = 138543618;
        v51 = v45;
        __int16 v52 = 2114;
        v53 = v47;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Starting to actively monitor device: %{public}@", (uint8_t *)&v50, 0x16u);
      }
      id v48 = objc_loadWeakRetained(v36 + 14);
      v49 = (void *)[v48 newDeviceMonitoringTimer];

      [v49 setDelegateQueue:v36[2]];
      [v49 setDelegate:v36];
      -[HMDRemoteDeviceInformation setRetryTimer:]((uint64_t)v33, v49);

      if (v33) {
        goto LABEL_31;
      }
    }
    id v43 = 0;
    goto LABEL_32;
  }
}

- (void)handleReachabilityChange:(void *)a3 deviceInformation:(unint64_t)a4 reason:(char)a5 didStartMonitoringDevice:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = (dispatch_queue_t *)v9;
  if (a1)
  {
    if (a4 < 5)
    {
      if (!v9) {
        goto LABEL_6;
      }
      uint64_t v11 = v9 + 9;
      goto LABEL_5;
    }
    if (a4 != 6 || !v9)
    {
LABEL_6:
      SEL v12 = off_1E6A0C5C0[a4];
      if (v10)
      {
        if ((*((unsigned char *)v10 + 10) & 1) != 0 && a4 == 5 && (*((unsigned char *)v10 + 9) & 1) == 0)
        {
          id v13 = (void *)MEMORY[0x1D9452090]();
          id v14 = a1;
          double v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            __int16 v16 = HMFGetLogIdentifier();
            int v36 = 138543874;
            id v37 = v16;
            __int16 v38 = 2114;
            v39 = v12;
            __int16 v40 = 2112;
            id Property = objc_getProperty(v10, v17, 16, 1);
            _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping updating reachability with reason: %{public}@ because initial reachability is set and waiting for non-network reachability changes for device: %@", (uint8_t *)&v36, 0x20u);
          }
          if ((a5 & 1) == 0) {
            goto LABEL_24;
          }
          goto LABEL_16;
        }
        if ((a5 & 1) != 0 || ((_BYTE)v10[1] & 1) != a2)
        {
LABEL_16:
          dispatch_assert_queue_V2(v10[3]);
          id v19 = objc_msgSend(objc_getProperty(v10, v18, 16, 1), "capabilities");
          uint64_t v20 = [v19 supportsIDSActivityMonitorPresence];

          v21 = [[HMDRemoteDeviceReachabilityChangeLogEvent alloc] initWithReason:a4 reachable:a2 targetSupportsIDSPresence:v20];
          uint64_t v22 = +[HMDMetricsManager sharedLogEventSubmitter];
          [v22 submitLogEvent:v21];

          *((unsigned char *)v10 + 8) = a2;
LABEL_17:
          unint64_t v23 = (void *)MEMORY[0x1D9452090]();
          id v24 = a1;
          uint64_t v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v26 = HMFGetLogIdentifier();
            HMFBooleanToString();
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v10) {
              id v29 = objc_getProperty(v10, v27, 16, 1);
            }
            else {
              id v29 = 0;
            }
            int v36 = 138544130;
            id v37 = v26;
            __int16 v38 = 2114;
            v39 = v28;
            __int16 v40 = 2114;
            id Property = v12;
            __int16 v42 = 2112;
            id v43 = v29;
            _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Updating reachability to %{public}@ with reason: %{public}@, for device: %@", (uint8_t *)&v36, 0x2Au);
          }
          if (v10) {
            id v31 = objc_getProperty(v10, v30, 16, 1);
          }
          else {
            id v31 = 0;
          }
          -[HMDRemoteDeviceMonitor notifyDeviceReachabilityChange:forDevice:](v24, a2, v31);
        }
      }
      else if (a2 & 1) != 0 || (a5)
      {
        goto LABEL_17;
      }
LABEL_24:

      goto LABEL_25;
    }
    uint64_t v11 = v9 + 10;
    if ((v9[10] & 1) == 0 && (v9[9] & 1) == 0)
    {
LABEL_5:
      unsigned char *v11 = 1;
      goto LABEL_6;
    }
    int v32 = (void *)MEMORY[0x1D9452090]();
    id v33 = a1;
    uint64_t v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v35 = HMFGetLogIdentifier();
      int v36 = 138543362;
      id v37 = v35;
      _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Skipping updating reachability with initial reachability reason", (uint8_t *)&v36, 0xCu);
    }
  }
LABEL_25:
}

- (void)notifyDeviceReachabilityChange:(void *)a3 forDevice:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = a1;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    uint64_t v10 = HMFBooleanToString();
    uint64_t v11 = [v5 shortDescription];
    int v15 = 138543874;
    __int16 v16 = v9;
    __int16 v17 = 2112;
    SEL v18 = v10;
    __int16 v19 = 2114;
    uint64_t v20 = v11;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Notifying clients of reachability change, %@, for device: %{public}@", (uint8_t *)&v15, 0x20u);
  }
  SEL v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v13 = v12;
  if (a2) {
    id v14 = @"HMDRemoteDeviceIsReachableNotification";
  }
  else {
    id v14 = @"HMDRemoteDeviceIsNotReachableNotification";
  }
  [v12 postNotificationName:v14 object:v5];
}

- (void)_handleIncomingMessageForDevice:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = -[HMDRemoteDeviceMonitor _startMonitoringDevice:withInitialReachability:forClient:]((uint64_t)self, v4, 0, 0);
  id v6 = (void *)v5;
  if (v5)
  {
    -[HMDRemoteDeviceInformation completeConfirmationsWithError:](v5, 0);
    id v7 = v6;
    if (*((void *)v7 + 8))
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = self;
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        id v13 = objc_msgSend(objc_getProperty(v7, v12, 16, 1), "shortDescription");
        int v18 = 138543618;
        __int16 v19 = v11;
        __int16 v20 = 2114;
        id v21 = v13;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Stopping actively monitoring device: %{public}@", (uint8_t *)&v18, 0x16u);
      }
      [*((id *)v7 + 8) suspend];
      objc_storeStrong((id *)v7 + 8, 0);
    }

    dispatch_assert_queue_V2(*((dispatch_queue_t *)v7 + 3));
    dispatch_assert_queue_V2(*((dispatch_queue_t *)v7 + 3));
    *((void *)v7 + 5) &= 0xFFFFFFFFFFFFFFF0;
    -[HMDRemoteDeviceMonitor handleReachabilityChange:deviceInformation:reason:didStartMonitoringDevice:](self, 1, v7, 0, 0);
  }
  else
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    int v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      __int16 v17 = HMFGetLogIdentifier();
      int v18 = 138543618;
      __int16 v19 = v17;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring incoming message from device %@ because no clients have registered to monitor it", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (HMDRemoteDeviceInformation)_startMonitoringDevice:(void *)a3 withInitialReachability:(void *)a4 forClient:
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v68 = a3;
  id v8 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (v7)
    {
      id v67 = v8;
      char v71 = 0;
      id v9 = [(id)a1 accountRegistry];
      uint64_t v10 = [v9 deviceForDevice:v7 exists:&v71];

      if (([v10 isCurrentDevice] & 1) == 0)
      {
        uint64_t v11 = [v10 handles];
        int v12 = objc_msgSend(v11, "hmf_isEmpty");

        if (!v12)
        {
          os_unfair_lock_lock_with_options();
          -[HMDRemoteDeviceMonitor _deviceInformationForDevice:](a1, v10);
          __int16 v20 = (HMDRemoteDeviceInformation *)objc_claimAutoreleasedReturnValue();
          uint64_t v22 = v20;
          if (v20)
          {
            objc_setProperty_atomic(v20, v21, v10, 16);
            int v18 = v22;
          }
          else
          {
            int v18 = [HMDRemoteDeviceInformation alloc];
            unint64_t v23 = *(void **)(a1 + 16);
            id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
            id v25 = v10;
            id v65 = v23;
            id v26 = WeakRetained;
            BOOL v27 = v26;
            id v63 = v25;
            if (v18)
            {
              if (!v25 || !v65 || !v26)
              {
                _HMFPreconditionFailure();
                __break(1u);
              }
              *(void *)buf = v18;
              *(void *)&buf[8] = HMDRemoteDeviceInformation;
              v28 = (HMDRemoteDeviceInformation *)objc_msgSendSuper2((objc_super *)buf, sel_init);
              int v18 = v28;
              if (v28)
              {
                objc_storeStrong((id *)&v28->_device, v10);
                objc_storeStrong((id *)&v18->_workQueue, v23);
                objc_storeWeak((id *)&v18->_factory, v27);
                v18->_reachable = 1;
                uint64_t v29 = [MEMORY[0x1E4F1CA48] array];
                confirmationHandlers = v18->_confirmationHandlers;
                v18->_confirmationHandlers = (NSMutableArray *)v29;

                uint64_t v31 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
                clients = v18->_clients;
                v18->_clients = (NSHashTable *)v31;
              }
            }

            id v33 = *(id *)(a1 + 120);
            [v33 setObject:v18 forKey:v63];
          }
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
          if (v67)
          {
            os_unfair_lock_lock_with_options();
            if (v18) {
              uint64_t v34 = v18->_clients;
            }
            else {
              uint64_t v34 = 0;
            }
            v35 = v34;
            [(NSHashTable *)v35 addObject:v67];

            os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
          }
          if (v22)
          {
            if (v68 && ([v68 BOOLValue] & 1) == 0) {
              -[HMDRemoteDeviceMonitor handleReachabilityChange:deviceInformation:reason:didStartMonitoringDevice:]((void *)a1, [v68 BOOLValue], v18, 6uLL, 1);
            }
          }
          else
          {
            int v18 = v18;
            id v64 = v68;
            dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
            if (v18) {
              id Property = objc_getProperty(v18, v36, 16, 1);
            }
            else {
              id Property = 0;
            }
            v66 = [Property account];
            if (v66)
            {
              __int16 v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
              [v38 addObserver:a1 selector:sel_handleDeviceRemovedFromAccount_ name:@"HMDAccountRemovedDeviceNotification" object:v66];
            }
            unsigned int obj = [(id)a1 isReachable];
            if (v64 && ([v64 BOOLValue] & 1) == 0)
            {
              unsigned int obj = [v64 BOOLValue];
              uint64_t v39 = 6;
            }
            else
            {
              uint64_t v39 = 5;
            }
            unint64_t v60 = v39;
            context = (void *)MEMORY[0x1D9452090]();
            __int16 v40 = (os_unfair_lock_s *)(id)a1;
            id v41 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              id v43 = HMFGetLogIdentifier();
              if (v18) {
                id v44 = objc_getProperty(v18, v42, 16, 1);
              }
              else {
                id v44 = 0;
              }
              v45 = [v44 shortDescription];
              id v46 = HMFBooleanToString();
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v43;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v45;
              __int16 v73 = 2112;
              v74 = v46;
              _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Marking newly added device: %{public}@ with reachability: %@", buf, 0x20u);
            }
            -[HMDRemoteDeviceMonitor handleReachabilityChange:deviceInformation:reason:didStartMonitoringDevice:](v40, obj, v18, v60, 1);

            os_unfair_lock_lock_with_options();
            int v47 = BYTE1(v40[10]._os_unfair_lock_opaque);
            os_unfair_lock_unlock(v40 + 2);
            if (v47 && !isWatch())
            {
              -[HMDRemoteDeviceInformation addState:]((uint64_t)v18, 1);
              v69[0] = MEMORY[0x1E4F143A8];
              v69[1] = 3221225472;
              v69[2] = __83__HMDRemoteDeviceMonitor__startMonitoringDevice_withInitialReachability_forClient___block_invoke;
              v69[3] = &unk_1E6A196E0;
              v69[4] = v40;
              id v70 = v10;
              -[HMDRemoteDeviceMonitor _confirmDevice:timeout:completionHandler:]((uint64_t)v40, v18, v69, 65.0);
            }
            id v48 = *(void **)&v40[8]._os_unfair_lock_opaque;
            v49 = [v10 deviceAddress];
            [v48 addListener:v40 forDeviceAddress:v49];

            int v50 = (void *)MEMORY[0x1D9452090]();
            v51 = v40;
            __int16 v52 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              __int16 v54 = HMFGetLogIdentifier();
              if (v18) {
                id v55 = objc_getProperty(v18, v53, 16, 1);
              }
              else {
                id v55 = 0;
              }
              uint64_t v56 = [v55 shortDescription];
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v54;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v56;
              _os_log_impl(&dword_1D49D5000, v52, OS_LOG_TYPE_INFO, "%{public}@Starting IDS Activity for device: %{public}@", buf, 0x16u);
            }
            id v58 = v51[10];
            if (v18) {
              id v59 = objc_getProperty(v18, v57, 16, 1);
            }
            else {
              id v59 = 0;
            }
            [v58 startObservingPresenceForDevice:v59];
          }
          goto LABEL_9;
        }
        id v13 = (void *)MEMORY[0x1D9452090]();
        id v14 = (id)a1;
        int v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          __int16 v16 = HMFGetLogIdentifier();
          __int16 v17 = HMFBooleanToString();
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v16;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v10;
          __int16 v73 = 2112;
          v74 = v17;
          _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Cannot monitor a device without any handles: %@, device found in account register: %@", buf, 0x20u);
        }
      }
      int v18 = 0;
LABEL_9:

      id v8 = v67;
      goto LABEL_11;
    }
  }
  int v18 = 0;
LABEL_11:

  return v18;
}

void __83__HMDRemoteDeviceMonitor__startMonitoringDevice_withInitialReachability_forClient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [*(id *)(a1 + 40) shortDescription];
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      int v12 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Determined newly monitored device is unreachable: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v28 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __int16 v16 = +[HMDDeviceHandle deviceHandleForDestination:v14];
  __int16 v17 = (void *)MEMORY[0x1D9452090]();
  int v18 = self;
  __int16 v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    __int16 v20 = HMFGetLogIdentifier();
    id v21 = [v12 serviceIdentifier];
    *(_DWORD *)buf = 138543874;
    v30 = v20;
    __int16 v31 = 2112;
    int v32 = v16;
    __int16 v33 = 2114;
    uint64_t v34 = v21;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Received incoming message from: %@, on service: %{public}@", buf, 0x20u);
  }
  uint64_t v22 = [(HMDRemoteDeviceMonitor *)v18 accountRegistry];
  unint64_t v23 = [v22 deviceForHandle:v16];

  if (v23 && ![v23 isCurrentDevice])
  {
    [(HMDRemoteDeviceMonitor *)v18 _handleIncomingMessageForDevice:v23];
  }
  else
  {
    id v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = v18;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      BOOL v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v30 = v27;
      __int16 v31 = 2112;
      int v32 = v23;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring incoming message from device because it is nil or it is the current device: %@", buf, 0x16u);
    }
  }
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = (void *)MEMORY[0x1D9452090]();
  int v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v20 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@IDS Service active accounts changed", buf, 0xCu);
  }
  id v12 = [v6 iCloudAccount];
  id WeakRetained = objc_loadWeakRetained((id *)&v9->_iCloudAccount);
  if (v12 && ([v12 isEqual:WeakRetained] & 1) == 0)
  {
    context = (void *)MEMORY[0x1D9452090]();
    id v14 = v9;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      __int16 v16 = v17 = v7;
      *(_DWORD *)buf = 138543362;
      __int16 v20 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@iCloud account changed, updating delegate", buf, 0xCu);

      id v7 = v17;
    }

    [WeakRetained removeDelegate:v14];
    [WeakRetained removeRegistrationDelegate:v14];
    [v12 addDelegate:v14 queue:self->_queue];
    [v12 addRegistrationDelegate:v14 queue:self->_queue];
    objc_storeWeak(v14 + 9, v12);
  }
  [(HMDRemoteDeviceMonitor *)v9 _handleGlobalReachabilityChange];
}

- (id)iCloudAccount
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 9);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)account:(id)a3 loginChanged:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = -[HMDRemoteDeviceMonitor iCloudAccount]((id *)&self->super.super.isa);
  int v9 = [v8 uniqueID];
  char v10 = [v9 isEqual:v6];

  __int16 v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v14)
    {
      id v15 = HMFGetLogIdentifier();
      int v17 = 138543362;
      int v18 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@IDS Account login changed", (uint8_t *)&v17, 0xCu);
    }
    [(HMDRemoteDeviceMonitor *)v12 _handleGlobalReachabilityChange];
  }
  else
  {
    if (v14)
    {
      __int16 v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      int v18 = v16;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Ignoring IDS Account login change on non-iCloud account", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)account:(id)a3 isActiveChanged:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = -[HMDRemoteDeviceMonitor iCloudAccount]((id *)&self->super.super.isa);
  char v7 = [v6 isEqual:v5];

  id v8 = (void *)MEMORY[0x1D9452090]();
  int v9 = self;
  char v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = HMFBooleanToString();
      int v15 = 138543618;
      __int16 v16 = v12;
      __int16 v17 = 2112;
      int v18 = v13;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@IDS Account active state changed to %@", (uint8_t *)&v15, 0x16u);
    }
    [(HMDRemoteDeviceMonitor *)v9 _handleGlobalReachabilityChange];
  }
  else
  {
    if (v11)
    {
      BOOL v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      __int16 v16 = v14;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Ignoring IDS Account active state change on non-iCloud account", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)timerDidFire:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v4 = (HMFTimer *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = self->_deviceHealthTimer;
  if (v5 == v4)
  {

    goto LABEL_19;
  }
  initialDeviceHealthTimer = self->_initialDeviceHealthTimer;

  if (initialDeviceHealthTimer == v4)
  {
LABEL_19:
    v76 = v4;
    uint64_t v19 = (void *)MEMORY[0x1D9452090]([(HMFTimer *)self->_deviceHealthTimer resume]);
    __int16 v20 = self;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v88 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Confirming all reachable devices", buf, 0xCu);
    }
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    -[HMDRemoteDeviceMonitor devices]((char *)v20);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [obj countByEnumeratingWithState:&v82 objects:v91 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v83;
      id v26 = &OBJC_IVAR___HMDResidentReachabilityNotificationManager__home;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v83 != v25) {
            objc_enumerationMutation(obj);
          }
          id v28 = *(char **)(*((void *)&v82 + 1) + 8 * v27);
          if (v28) {
            uint64_t v29 = *(void *)&v28[v26[834]];
          }
          else {
            LOBYTE(v29) = 0;
          }
          if ([(HMDRemoteDeviceMonitor *)v20 isReachable] || (v29 & 0xA) != 0)
          {
            id v37 = v28;
            __int16 v38 = v37;
            if (v20 && v28)
            {
              char v39 = v37[8];

              if (v39)
              {
                __int16 v40 = (void *)MEMORY[0x1D9452090]();
                id v41 = v20;
                __int16 v42 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  id v43 = HMFGetLogIdentifier();
                  objc_msgSend(objc_getProperty(v38, v44, 16, 1), "shortDescription");
                  v45 = (HMFTimer *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v88 = v43;
                  __int16 v89 = 2114;
                  v90 = v45;
                  _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Trying reachability health check to device: %{public}@", buf, 0x16u);

                  id v26 = &OBJC_IVAR___HMDResidentReachabilityNotificationManager__home;
                }

                -[HMDRemoteDeviceMonitor _sendPingToDevice:]((dispatch_queue_t *)v41, v38);
              }
            }
            else
            {
            }
          }
          else
          {
            v30 = (void *)MEMORY[0x1D9452090]();
            __int16 v31 = v20;
            int v32 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v34 = HMFGetLogIdentifier();
              if (v28) {
                id Property = objc_getProperty(v28, v33, 16, 1);
              }
              else {
                id Property = 0;
              }
              int v36 = [Property shortDescription];
              *(_DWORD *)buf = 138543618;
              v88 = v34;
              __int16 v89 = 2114;
              v90 = v36;
              _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Deferring ping to device while we are unreachable: %{public}@", buf, 0x16u);

              id v26 = &OBJC_IVAR___HMDResidentReachabilityNotificationManager__home;
            }

            -[HMDRemoteDeviceInformation addState:]((uint64_t)v28, 1);
          }
          ++v27;
        }
        while (v24 != v27);
        uint64_t v46 = [obj countByEnumeratingWithState:&v82 objects:v91 count:16];
        uint64_t v24 = v46;
      }
      while (v46);
    }

    id v4 = v76;
    goto LABEL_71;
  }
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  char v7 = -[HMDRemoteDeviceMonitor devices]((char *)self);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v78 objects:v86 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v79;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v79 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v78 + 1) + 8 * v11);
        if (v12) {
          id v13 = *(HMFTimer **)(v12 + 64);
        }
        else {
          id v13 = 0;
        }
        if (v13 == v4)
        {
          int v47 = (void *)MEMORY[0x1D9452090]();
          id v48 = self;
          v49 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            v51 = HMFGetLogIdentifier();
            if (v12) {
              id v52 = objc_getProperty((id)v12, v50, 16, 1);
            }
            else {
              id v52 = 0;
            }
            v53 = [v52 shortDescription];
            *(_DWORD *)buf = 138543618;
            v88 = v51;
            __int16 v89 = 2114;
            v90 = v53;
            _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_DEBUG, "%{public}@Timer fired for device: %{public}@", buf, 0x16u);
          }
          if ([(HMDRemoteDeviceMonitor *)v48 isReachable])
          {
            if (!v12 || (*(unsigned char *)(v12 + 40) & 1) == 0)
            {
              __int16 v54 = (void *)MEMORY[0x1D9452090]();
              id v55 = v48;
              uint64_t v56 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
              {
                id v58 = HMFGetLogIdentifier();
                id v59 = v4;
                if (v12) {
                  id v60 = objc_getProperty((id)v12, v57, 16, 1);
                }
                else {
                  id v60 = 0;
                }
                v61 = [v60 shortDescription];
                *(_DWORD *)buf = 138543618;
                v88 = v58;
                __int16 v89 = 2114;
                v90 = v61;
                _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_INFO, "%{public}@Timer fired but should confirm is not set for device: %{public}@", buf, 0x16u);

                id v4 = v59;
              }
            }
            v62 = (void *)MEMORY[0x1D9452090]();
            id v63 = v48;
            id v64 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              v66 = HMFGetLogIdentifier();
              if (v12) {
                id v67 = objc_getProperty((id)v12, v65, 16, 1);
              }
              else {
                id v67 = 0;
              }
              id v68 = [v67 shortDescription];
              *(_DWORD *)buf = 138543618;
              v88 = v66;
              __int16 v89 = 2114;
              v90 = v68;
              _os_log_impl(&dword_1D49D5000, v64, OS_LOG_TYPE_INFO, "%{public}@Retrying ping to device: %{public}@", buf, 0x16u);
            }
            -[HMDRemoteDeviceMonitor _sendPingToDevice:]((dispatch_queue_t *)v63, (void *)v12);
          }
          else
          {
            v69 = (void *)MEMORY[0x1D9452090]();
            id v70 = v48;
            char v71 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              __int16 v73 = HMFGetLogIdentifier();
              if (v12) {
                id v74 = objc_getProperty((id)v12, v72, 16, 1);
              }
              else {
                id v74 = 0;
              }
              uint64_t v75 = [v74 shortDescription];
              *(_DWORD *)buf = 138543618;
              v88 = v73;
              __int16 v89 = 2114;
              v90 = v75;
              _os_log_impl(&dword_1D49D5000, v71, OS_LOG_TYPE_INFO, "%{public}@Deferring ping while unreachable to device: %{public}@", buf, 0x16u);
            }
            -[HMDRemoteDeviceInformation addState:](v12, 1);
          }

          goto LABEL_71;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v14 = [v7 countByEnumeratingWithState:&v78 objects:v86 count:16];
      uint64_t v9 = v14;
      if (v14) {
        continue;
      }
      break;
    }
  }

  int v15 = (void *)MEMORY[0x1D9452090]();
  __int16 v16 = self;
  __int16 v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v88 = v18;
    __int16 v89 = 2112;
    v90 = v4;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unhandled timer: %@", buf, 0x16u);
  }
LABEL_71:
}

- (id)devices
{
  uint64_t v1 = (id *)a1;
  if (a1)
  {
    uint64_t v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    id v3 = (NSMapTable *)v1[15];
    NSAllMapTableValues(v3);
    uint64_t v1 = (id *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)networkMonitorIsUnreachable:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HMDRemoteDeviceMonitor_networkMonitorIsUnreachable___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __54__HMDRemoteDeviceMonitor_networkMonitorIsUnreachable___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@NetworkMonitor status changed to disconnected", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _handleGlobalReachabilityChange];
}

- (void)networkMonitorIsReachable:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HMDRemoteDeviceMonitor_networkMonitorIsReachable___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__HMDRemoteDeviceMonitor_networkMonitorIsReachable___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@NetworkMonitor status changed to connected", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _handleGlobalReachabilityChange];
}

- (id)newConfirmationHandlerWithTimeout:(double)a3 workQueue:(id)a4 handler:(id)a5
{
  int v7 = (objc_class *)MEMORY[0x1E4F65580];
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = (void *)[[v7 alloc] initWithTimeInterval:0 options:a3];
  uint64_t v11 = [[HMDRemoteDeviceConfirmationHandler alloc] initWithTimeoutTimer:v10 workQueue:v9 handler:v8];

  return v11;
}

- (id)newSendMessageOperationWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = [HMDIDSSendMessageOperation alloc];
  if (self) {
    service = self->_service;
  }
  else {
    service = 0;
  }
  int v7 = [(HMDIDSSendMessageOperation *)v5 initWithMessage:v4 service:service];

  return v7;
}

- (id)newDeviceMonitoringTimer
{
  id v2 = objc_alloc(MEMORY[0x1E4F65428]);
  double v3 = *(double *)&remoteDeviceMonitorRetryTimerMinimumTimeInterval;
  double v4 = *(double *)&remoteDeviceMonitorRetryTimerMaximumTimeInterval;
  uint64_t v5 = remoteDeviceMonitorRetryTimerFactor;
  return (id)[v2 initWithMinimumTimeInterval:v5 maximumTimeInterval:0 exponentialFactor:v3 options:v4];
}

- (id)newRepeatingDeviceHealthTimer
{
  id v2 = objc_alloc(MEMORY[0x1E4F65580]);
  double v3 = *(double *)&remoteDeviceMonitorHealthTimerTimeInterval;
  return (id)[v2 initWithTimeInterval:4 options:v3];
}

- (id)newInitialDeviceHealthTimer
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v3 = (int)*(double *)&remoteDeviceMonitorHealthTimerTimeInterval;
  uint32_t v4 = arc4random_uniform((int)*(double *)&remoteDeviceMonitorHealthTimerTimeInterval);
  if (v3 >= 0) {
    int v5 = v3;
  }
  else {
    int v5 = v3 + 1;
  }
  int v6 = v4 + (v5 >> 1);
  int v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v10;
    __int16 v14 = 1024;
    int v15 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Initial health timer interval is %d seconds", (uint8_t *)&v12, 0x12u);
  }
  return (id)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:(double)v6];
}

- (void)handleAccountRemoved:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__HMDRemoteDeviceMonitor_handleAccountRemoved___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __47__HMDRemoteDeviceMonitor_handleAccountRemoved___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) userInfo];
  int v3 = [v2 objectForKeyedSubscript:@"HMDAccountNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 40);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = [v5 shortDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v9;
      __int16 v23 = 2114;
      uint64_t v24 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Stopping monitoring account: %{public}@", buf, 0x16u);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v11 = objc_msgSend(v5, "devices", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          -[HMDRemoteDeviceMonitor _stopMonitoringDevice:](*(void *)(a1 + 40), *(void **)(*((void *)&v16 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
}

- (void)_stopMonitoringDevice:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (v3)
    {
      os_unfair_lock_lock_with_options();
      id v4 = *(id *)(a1 + 120);
      id v5 = [v4 objectForKey:v3];

      if (v5)
      {
        id v6 = *(id *)(a1 + 120);
        [v6 removeObjectForKey:v3];

        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        id v7 = (void *)MEMORY[0x1D9452090]();
        id v8 = (id *)(id)a1;
        id v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = HMFGetLogIdentifier();
          uint64_t v12 = objc_msgSend(objc_getProperty(v5, v11, 16, 1), "shortDescription");
          int v19 = 138543618;
          __int16 v20 = v10;
          __int16 v21 = 2114;
          uint64_t v22 = v12;
          _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Stopping monitoring of device: %{public}@", (uint8_t *)&v19, 0x16u);
        }
        id v13 = v8[10];
        objc_msgSend(v13, "stopObservingPresenceForDevice:", objc_getProperty(v5, v14, 16, 1));

        id v15 = v8[4];
        long long v17 = objc_msgSend(objc_getProperty(v5, v16, 16, 1), "deviceAddress");
        [v15 removeListener:v8 forDeviceAddress:v17];

        long long v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
        -[HMDRemoteDeviceInformation completeConfirmationsWithError:]((uint64_t)v5, v18);
      }
      else
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      }
    }
  }
}

- (void)handleDeviceRemovedFromAccount:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HMDRemoteDeviceMonitor_handleDeviceRemovedFromAccount___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __57__HMDRemoteDeviceMonitor_handleDeviceRemovedFromAccount___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"HMDDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v6 = v4;

  id v5 = v6;
  if (v6)
  {
    -[HMDRemoteDeviceMonitor _stopMonitoringDevice:](*(void *)(a1 + 40), v6);
    id v5 = v6;
  }
}

- (void)handleCurrentDeviceUpdate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HMDRemoteDeviceMonitor_handleCurrentDeviceUpdate___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __52__HMDRemoteDeviceMonitor_handleCurrentDeviceUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = [v4 device];

  if (v5) {
    -[HMDRemoteDeviceMonitor _stopMonitoringDevice:](*(void *)(a1 + 40), v5);
  }
  [*(id *)(a1 + 40) _handleGlobalReachabilityChange];
}

- (void)confirmDevice:(id)a3 forClient:(id)a4 timeout:(double)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void (**)(void, void))v12;
  if (v10)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__HMDRemoteDeviceMonitor_confirmDevice_forClient_timeout_completionHandler___block_invoke;
    block[3] = &unk_1E6A14940;
    block[4] = self;
    id v17 = v10;
    id v18 = v11;
    double v20 = a5;
    int v19 = v13;
    dispatch_async(queue, block);
  }
  else if (v12)
  {
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    ((void (**)(void, void *))v13)[2](v13, v15);
  }
}

void __76__HMDRemoteDeviceMonitor_confirmDevice_forClient_timeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = -[HMDRemoteDeviceMonitor _startMonitoringDevice:withInitialReachability:forClient:](*(void *)(a1 + 32), *(void **)(a1 + 40), 0, *(void **)(a1 + 48));
  if (v2)
  {
    -[HMDRemoteDeviceMonitor _confirmDevice:timeout:completionHandler:](*(void *)(a1 + 32), v2, *(void **)(a1 + 56), *(double *)(a1 + 64));
  }
  else
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = HMFGetLogIdentifier();
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543618;
      id v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain device information even after monitoring was started for device: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_handleGlobalReachabilityChange
{
  id v2 = (char *)self;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (__HMDRemoteDeviceMonitorReachable(v2))
  {
    -[HMDRemoteDeviceMonitor setReachable:]((uint64_t)v2, 1);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v3 = -[HMDRemoteDeviceMonitor devices](v2);
    id v4 = [v3 objectEnumerator];
    id v5 = [v4 allObjects];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (!v6) {
      goto LABEL_43;
    }
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v49;
    *(void *)&long long v8 = 138543618;
    long long v40 = v8;
    __int16 v42 = v2;
    id v43 = v5;
    uint64_t v41 = *(void *)v49;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v48 + 1) + 8 * v11);
        if (v12)
        {
          if (objc_msgSend(objc_getProperty(*(id *)(*((void *)&v48 + 1) + 8 * v11), v7, 16, 1), "isCurrentDevice")) {
            goto LABEL_22;
          }
          char v13 = *(unsigned char *)(v12 + 8) & 1;
          uint64_t v14 = *(void *)(v12 + 40);
          if ((v14 & 8) != 0) {
            goto LABEL_15;
          }
        }
        else
        {
          if ([0 isCurrentDevice]) {
            goto LABEL_22;
          }
          LOBYTE(v14) = 0;
          char v13 = 0;
        }
        id v15 = (void *)MEMORY[0x1D9452090]();
        SEL v16 = v2;
        id v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v19 = HMFGetLogIdentifier();
          if (v12) {
            id Property = objc_getProperty((id)v12, v18, 16, 1);
          }
          else {
            id Property = 0;
          }
          __int16 v21 = objc_msgSend(Property, "shortDescription", v40);
          *(_DWORD *)buf = v40;
          __int16 v54 = v19;
          __int16 v55 = 2114;
          uint64_t v56 = v21;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Marking formerly unreachable device as reachable now that we are reachable: %{public}@", buf, 0x16u);

          uint64_t v10 = v41;
          id v2 = v42;
        }

        -[HMDRemoteDeviceMonitor handleReachabilityChange:deviceInformation:reason:didStartMonitoringDevice:](v16, 1, (void *)v12, 5uLL, 0);
        id v5 = v43;
LABEL_15:
        if (v13 & 1) == 0 && (v14)
        {
          uint64_t v22 = (void *)MEMORY[0x1D9452090]();
          uint64_t v23 = v2;
          uint64_t v24 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            id v26 = HMFGetLogIdentifier();
            if (v12) {
              id v27 = objc_getProperty((id)v12, v25, 16, 1);
            }
            else {
              id v27 = 0;
            }
            id v28 = objc_msgSend(v27, "shortDescription", v40);
            *(_DWORD *)buf = v40;
            __int16 v54 = v26;
            __int16 v55 = 2114;
            uint64_t v56 = v28;
            _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Confirming device due to network change: %{public}@", buf, 0x16u);

            uint64_t v10 = v41;
            id v2 = v42;
          }

          -[HMDRemoteDeviceMonitor _confirmDevice:timeout:completionHandler:]((uint64_t)v23, (void *)v12, 0, 65.0);
          id v5 = v43;
        }
LABEL_22:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v29 = [v5 countByEnumeratingWithState:&v48 objects:v57 count:16];
      uint64_t v9 = v29;
      if (!v29) {
        goto LABEL_43;
      }
    }
  }
  -[HMDRemoteDeviceMonitor setReachable:]((uint64_t)v2, 0);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v30 = -[HMDRemoteDeviceMonitor devices](v2);
  __int16 v31 = [v30 objectEnumerator];
  id v5 = [v31 allObjects];

  uint64_t v32 = [v5 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v32)
  {
    uint64_t v34 = v32;
    uint64_t v35 = *(void *)v45;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v45 != v35) {
          objc_enumerationMutation(v5);
        }
        id v37 = *(void **)(*((void *)&v44 + 1) + 8 * v36);
        if (v37) {
          id v38 = objc_getProperty(*(id *)(*((void *)&v44 + 1) + 8 * v36), v33, 16, 1);
        }
        else {
          id v38 = 0;
        }
        if (([v38 isCurrentDevice] & 1) == 0) {
          -[HMDRemoteDeviceMonitor handleReachabilityChange:deviceInformation:reason:didStartMonitoringDevice:](v2, 0, v37, 5uLL, 0);
        }
        ++v36;
      }
      while (v34 != v36);
      uint64_t v39 = [v5 countByEnumeratingWithState:&v44 objects:v52 count:16];
      uint64_t v34 = v39;
    }
    while (v39);
  }
LABEL_43:
}

- (void)setReachable:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    if (*(unsigned __int8 *)(a1 + 40) == a2)
    {
      os_unfair_lock_unlock(v4);
    }
    else
    {
      *(unsigned char *)(a1 + 40) = a2;
      os_unfair_lock_unlock(v4);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
      uint64_t v6 = [WeakRetained device];

      if (v6)
      {
        uint64_t v7 = (void *)MEMORY[0x1D9452090]();
        id v8 = (id)a1;
        uint64_t v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = HMFGetLogIdentifier();
          uint64_t v11 = (void *)v10;
          uint64_t v12 = "unreachable";
          if (a2) {
            uint64_t v12 = "reachable";
          }
          int v13 = 138543618;
          uint64_t v14 = v10;
          __int16 v15 = 2080;
          SEL v16 = v12;
          _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Marking current device as %s", (uint8_t *)&v13, 0x16u);
        }
        -[HMDRemoteDeviceMonitor notifyDeviceReachabilityChange:forDevice:](v8, a2, v6);
        logAndPostNotification(@"HMDRemoteDeviceMonitorReachableNotification", v8, 0);
      }
    }
  }
}

- (void)stopMonitoringDevice:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__HMDRemoteDeviceMonitor_stopMonitoringDevice_forClient___block_invoke;
    block[3] = &unk_1E6A19668;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
}

void __57__HMDRemoteDeviceMonitor_stopMonitoringDevice_forClient___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    id v3 = (void *)v3[15];
  }
  id v4 = v3;
  id v5 = [v4 objectForKey:*(void *)(a1 + 40)];

  if (v5)
  {
    id v6 = v5[7];
    [v6 removeObject:*(void *)(a1 + 48)];

    id v7 = v5[7];
    uint64_t v8 = [v7 count];

    if (!v8)
    {
      os_unfair_lock_unlock(v2);
      -[HMDRemoteDeviceMonitor _stopMonitoringDevice:](*(void *)(a1 + 32), *(void **)(a1 + 40));
      goto LABEL_10;
    }
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      id v13 = v5[7];
      uint64_t v14 = [v13 count];
      id v16 = objc_getProperty(v5, v15, 16, 1);
      uint64_t v17 = [v16 shortDescription];
      int v18 = 138543874;
      id v19 = v12;
      __int16 v20 = 2048;
      uint64_t v21 = v14;
      __int16 v22 = 2114;
      uint64_t v23 = v17;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@There are still %lu clients monitoring device: %{public}@", (uint8_t *)&v18, 0x20u);
    }
  }
  os_unfair_lock_unlock(v2);
LABEL_10:
}

- (void)startMonitoringDevice:(id)a3 withInitialReachability:(id)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__HMDRemoteDeviceMonitor_startMonitoringDevice_withInitialReachability_forClient___block_invoke;
  v15[3] = &unk_1E6A18668;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

id __82__HMDRemoteDeviceMonitor_startMonitoringDevice_withInitialReachability_forClient___block_invoke(id *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = a1[4];
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [a1[5] shortDescription];
    id v7 = a1[6];
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Received request to start monitoring device: %{public}@ with initial reachability: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  return -[HMDRemoteDeviceMonitor _startMonitoringDevice:withInitialReachability:forClient:]((uint64_t)a1[4], a1[5], a1[6], a1[7]);
}

- (NSArray)unreachableDevices
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = -[HMDRemoteDeviceMonitor devices]((char *)self);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v5) {
    goto LABEL_14;
  }
  uint64_t v7 = v5;
  uint64_t v8 = *(void *)v18;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v4);
      }
      id v10 = *(unsigned char **)(*((void *)&v17 + 1) + 8 * v9);
      if (v10)
      {
        if (v10[8]) {
          goto LABEL_10;
        }
        id Property = objc_getProperty(v10, v6, 16, 1);
      }
      else
      {
        id Property = 0;
      }
      objc_msgSend(v3, "addObject:", Property, (void)v17);
LABEL_10:
      ++v9;
    }
    while (v7 != v9);
    uint64_t v12 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    uint64_t v7 = v12;
  }
  while (v12);
LABEL_14:

  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_accountManager);
  }
  else {
    id WeakRetained = 0;
  }
  id v14 = objc_msgSend(WeakRetained, "device", (void)v17);

  if (v14 && ![(HMDRemoteDeviceMonitor *)self isReachable]) {
    [v3 addObject:v14];
  }
  uint64_t v15 = [v3 allObjects];

  return (NSArray *)v15;
}

- (BOOL)isReachable
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__HMDRemoteDeviceMonitor_start__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(queue, block);
}

void __31__HMDRemoteDeviceMonitor_start__block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v47 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Starting", buf, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void **)(v6 + 56);
  }
  else {
    uint64_t v7 = 0;
  }
  [v7 addDelegate:v6 queue:*(void *)(v6 + 16)];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    uint64_t v9 = *(void **)(v8 + 64);
  }
  else {
    uint64_t v9 = 0;
  }
  [v9 addDelegate:v8 queue:*(void *)(v8 + 16)];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    __int16 v11 = *(void **)(v10 + 56);
  }
  else {
    __int16 v11 = 0;
  }
  uint64_t v12 = [v11 iCloudAccount];
  [v12 addDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 16)];
  [v12 addRegistrationDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v39 = v12;
  if (v13 && (objc_storeWeak((id *)(v13 + 72), v12), (uint64_t v14 = *(void *)(a1 + 32)) != 0)) {
    uint64_t v15 = *(void **)(v14 + 80);
  }
  else {
    uint64_t v15 = 0;
  }
  objc_msgSend(v15, "addObserver:forSubActivity:");
  uint64_t v16 = *(void *)(a1 + 32);
  if (v16)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v16 + 16));
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(v16 + 41) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 8));
    long long v17 = *(void **)(a1 + 32);
  }
  else
  {
    long long v17 = 0;
  }
  [v17 _handleGlobalReachabilityChange];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  -[HMDRemoteDeviceMonitor devices](*(char **)(a1 + 32));
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v41 = *(void *)v43;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v43 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v42 + 1) + 8 * v20);
        uint64_t v22 = (void *)MEMORY[0x1D9452090]();
        id v23 = *(id *)(a1 + 32);
        uint64_t v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          id v26 = HMFGetLogIdentifier();
          if (v21) {
            id Property = objc_getProperty(v21, v25, 16, 1);
          }
          else {
            id Property = 0;
          }
          id v28 = [Property shortDescription];
          *(_DWORD *)buf = 138543618;
          long long v47 = v26;
          __int16 v48 = 2114;
          long long v49 = v28;
          _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Initializing IDS Activity for device: %{public}@", buf, 0x16u);
        }
        uint64_t v29 = *(void **)(a1 + 32);
        if (v29) {
          uint64_t v29 = (void *)v29[10];
        }
        __int16 v31 = v29;
        if (v21) {
          id v32 = objc_getProperty(v21, v30, 16, 1);
        }
        else {
          id v32 = 0;
        }
        [v31 startObservingPresenceForDevice:v32];

        uint64_t v34 = [*(id *)(a1 + 32) transportReachabilityObserver];
        uint64_t v35 = *(void *)(a1 + 32);
        if (v21) {
          id v36 = objc_getProperty(v21, v33, 16, 1);
        }
        else {
          id v36 = 0;
        }
        id v37 = [v36 deviceAddress];
        [v34 addListener:v35 forDeviceAddress:v37];

        if (!isWatch())
        {
          -[HMDRemoteDeviceInformation addState:]((uint64_t)v21, 1);
          -[HMDRemoteDeviceMonitor _confirmDevice:timeout:completionHandler:](*(void *)(a1 + 32), v21, 0, 65.0);
        }
        ++v20;
      }
      while (v19 != v20);
      uint64_t v38 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
      uint64_t v19 = v38;
    }
    while (v38);
  }
}

- (void)setTransportReachabilityObserver:(id)a3
{
  id v4 = (HMDModernTransportDeviceReachabilityObserver *)a3;
  os_unfair_lock_lock_with_options();
  transportReachabilityObserver = self->_transportReachabilityObserver;
  self->_transportReachabilityObserver = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDModernTransportDeviceReachabilityObserver)transportReachabilityObserver
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_transportReachabilityObserver;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDRemoteDeviceMonitor;
  [(HMDRemoteDeviceMonitor *)&v4 dealloc];
}

- (id)dumpState
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = -[HMDRemoteDeviceMonitor devices]((char *)self);
  if ([v2 count])
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "description", (void)v11);
          [v3 addObject:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (HMDRemoteDeviceMonitor)initWithAccountRegistry:(id)a3 activityObserver:(id)a4 queue:(id)a5 service:(id)a6 modernService:(id)a7 accountManager:(id)a8 remoteAccountManager:(id)a9 netMonitor:(id)a10 factory:(id)a11
{
  id v41 = a3;
  id v40 = a4;
  id v39 = a5;
  id v38 = a6;
  id v37 = a7;
  id v18 = a8;
  id obj = a9;
  id v19 = a10;
  id v20 = a11;
  v43.receiver = self;
  v43.super_class = (Class)HMDRemoteDeviceMonitor;
  uint64_t v21 = [(HMDRemoteDeviceMonitor *)&v43 init];
  uint64_t v22 = v21;
  if (v21)
  {
    id v23 = v18;
    p_queue = &v21->_queue;
    objc_storeStrong((id *)&v21->_queue, a5);
    uint64_t v25 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    id v26 = v19;
    operationQueue = v22->_operationQueue;
    v22->_operationQueue = v25;

    [(NSOperationQueue *)v22->_operationQueue setName:@"HMDRemoteDeviceMonitor"];
    [(NSOperationQueue *)v22->_operationQueue setQualityOfService:9];
    [(NSOperationQueue *)v22->_operationQueue setUnderlyingQueue:*p_queue];
    uint64_t v28 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    deviceInformationByDevice = v22->_deviceInformationByDevice;
    v22->_deviceInformationByDevice = (NSMapTable *)v28;

    objc_storeStrong((id *)&v22->_accountRegistry, a3);
    objc_storeStrong((id *)&v22->_activityObserver, a4);
    objc_storeStrong((id *)&v22->_service, a6);
    objc_storeStrong((id *)&v22->_modernService, a7);
    objc_storeWeak((id *)&v22->_accountManager, v23);
    objc_storeWeak((id *)&v22->_remoteAccountManager, obj);
    objc_storeStrong((id *)&v22->_netMonitor, a10);
    [(HMFNetMonitor *)v22->_netMonitor setDelegate:v22];
    objc_storeWeak((id *)&v22->_factory, v20);
    uint64_t v30 = [v20 newInitialDeviceHealthTimer];
    initialDeviceHealthTimer = v22->_initialDeviceHealthTimer;
    v22->_initialDeviceHealthTimer = (HMFTimer *)v30;

    [(HMFTimer *)v22->_initialDeviceHealthTimer setDelegateQueue:*p_queue];
    [(HMFTimer *)v22->_initialDeviceHealthTimer setDelegate:v22];
    [(HMFTimer *)v22->_initialDeviceHealthTimer resume];
    uint64_t v32 = [v20 newRepeatingDeviceHealthTimer];
    deviceHealthTimer = v22->_deviceHealthTimer;
    v22->_deviceHealthTimer = (HMFTimer *)v32;

    [(HMFTimer *)v22->_deviceHealthTimer setDelegateQueue:*p_queue];
    [(HMFTimer *)v22->_deviceHealthTimer setDelegate:v22];
    uint64_t v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v34 addObserver:v22 selector:sel_handleCurrentDeviceUpdate_ name:@"HMDAppleAccountManagerDeviceUpdatedNotification" object:v23];

    id v18 = v23;
    uint64_t v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v35 addObserver:v22 selector:sel_handleAccountRemoved_ name:@"HMDAccountRegistryRemovedAccountNotification" object:v23];

    id v19 = v26;
    v22->_reachable = __HMDRemoteDeviceMonitorReachable(v22);
  }

  return v22;
}

- (HMDRemoteDeviceMonitor)initWithAccountRegistry:(id)a3 activityObserver:(id)a4 accountManager:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = +[HMDIDSServiceManager sharedManager];
  long long v12 = [v11 service];

  if (!v12)
  {
    id v27 = (void *)MEMORY[0x1D9452090]();
    uint64_t v28 = self;
    uint64_t v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v53 = v30;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: IDSService is nil", buf, 0xCu);
    }
    __int16 v31 = [[HMDAssertionLogEvent alloc] initWithReason:@"IDSService is nil"];
    uint64_t v32 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v32 submitLogEvent:v31];
  }
  long long v13 = +[HMDIDSServiceManager sharedManager];
  long long v14 = [v13 modernService];

  if (!v14)
  {
    __int16 v33 = (void *)MEMORY[0x1D9452090]();
    uint64_t v34 = self;
    uint64_t v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v37 = id v36 = v8;
      *(_DWORD *)buf = 138543362;
      v53 = v37;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: IDSService for Modern Transport is nil", buf, 0xCu);

      id v8 = v36;
    }

    id v38 = [[HMDAssertionLogEvent alloc] initWithReason:@"IDSService for Modern Transport is nil"];
    id v39 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v39 submitLogEvent:v38];
  }
  if ([v12 isEqual:v14])
  {
    id v40 = (void *)MEMORY[0x1D9452090]();
    id v41 = self;
    long long v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      long long v44 = v43 = v8;
      *(_DWORD *)buf = 138543362;
      v53 = v44;
      _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: IDSService for Modern Transport and legacy transport is the same", buf, 0xCu);

      id v8 = v43;
    }

    long long v45 = [[HMDAssertionLogEvent alloc] initWithReason:@"IDSService for Modern Transport and legacy transport is the same"];
    long long v46 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v46 submitLogEvent:v45];

    if (v12) {
      goto LABEL_5;
    }
  }
  else if (v12)
  {
LABEL_5:
    HMDispatchQueueNameString();
    id v51 = objc_claimAutoreleasedReturnValue();
    uint64_t v15 = (const char *)[v51 UTF8String];
    uint64_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    +[HMDRemoteAccountManager sharedManager];
    id v18 = v14;
    id v19 = v12;
    id v20 = v10;
    id v21 = v9;
    v23 = id v22 = v8;
    uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F654C8]) initWithNetAddress:0];
    uint64_t v25 = [(HMDRemoteDeviceMonitor *)self initWithAccountRegistry:v22 activityObserver:v21 queue:v17 service:v19 modernService:v18 accountManager:v20 remoteAccountManager:v23 netMonitor:v24 factory:self];

    id v8 = v22;
    id v9 = v21;
    id v10 = v20;
    long long v12 = v19;
    long long v14 = v18;

    id v26 = v25;
    goto LABEL_18;
  }
  long long v47 = (void *)MEMORY[0x1D9452090]();
  uint64_t v25 = self;
  __int16 v48 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    long long v49 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v53 = v49;
    _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_ERROR, "%{public}@An IDS service is not available", buf, 0xCu);
  }
  id v26 = 0;
LABEL_18:

  return v26;
}

- (HMDRemoteDeviceMonitor)init
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t59_158569 != -1) {
    dispatch_once(&logCategory__hmf_once_t59_158569, &__block_literal_global_158570);
  }
  id v2 = (void *)logCategory__hmf_once_v60_158571;
  return v2;
}

uint64_t __37__HMDRemoteDeviceMonitor_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v60_158571;
  logCategory__hmf_once_v60_158571 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)pingMessageForDevice:(id)a3 timeout:(double)a4 restriction:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [HMDRemoteDeviceMessageDestination alloc];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
  id v10 = [(HMDRemoteDeviceMessageDestination *)v8 initWithTarget:v9 device:v7];

  long long v11 = [v7 version];

  long long v12 = [[HMDHomeKitVersion alloc] initWithVersionString:@"3.0"];
  int v13 = [v11 isAtLeastVersion:v12];

  long long v14 = [HMDRemoteMessage alloc];
  if (v13) {
    uint64_t v15 = @"kPingInternalRequestKey";
  }
  else {
    uint64_t v15 = @"kElectDeviceForIDSSessionKey";
  }
  uint64_t v16 = [(HMDRemoteMessage *)v14 initWithName:v15 destination:v10 payload:0 type:0 timeout:0 secure:a5 restriction:a4];

  return v16;
}

@end