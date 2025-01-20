@interface HMDDeviceNotificationHandler
+ (id)logCategory;
- (BOOL)delaySupported;
- (HMDDeviceNotificationHandler)initWithDestination:(id)a3 watchDevice:(BOOL)a4 withRequestIdentifier:(id)a5 messageDispatcher:(id)a6 home:(id)a7;
- (HMDDeviceNotificationHandler)initWithDestination:(id)a3 watchDevice:(BOOL)a4 withRequestIdentifier:(id)a5 messageDispatcher:(id)a6 home:(id)a7 dataSource:(id)a8;
- (HMDDeviceNotificationHandlerDataSource)dataSource;
- (HMDHome)home;
- (HMFMessageDispatcher)messageDispatcher;
- (HMFTimer)coalesceTimer;
- (HMFTimer)delayTimer;
- (NSMutableOrderedSet)deviceNotificationsByRequestIDs;
- (NSString)destination;
- (OS_dispatch_queue)workQueue;
- (id)_notificationUpdateWithRequestID:(id)a3 allowAdd:(BOOL)a4;
- (id)logIdentifier;
- (void)_beginCoalesce:(BOOL)a3;
- (void)_dispatchNotification;
- (void)_dispatchNotificationUpdate:(id)a3;
- (void)sendCoalescedRemoteNotificationForAccessories:(id)a3;
- (void)sendNotificationForActionSetResponses:(id)a3 notificationUpdateIdentifier:(id)a4;
- (void)sendNotificationForCharacteristicUpdates:(id)a3 withRequestIdentifier:(id)a4 notificationUpdateIdentifier:(id)a5 completion:(id)a6;
- (void)sendNotificationForMediaProperties:(id)a3 withRequestIdentifier:(id)a4 notificationUpdateIdentifier:(id)a5;
- (void)setCoalesceTimer:(id)a3;
- (void)setDelaySupported:(BOOL)a3;
- (void)setDelayTimer:(id)a3;
- (void)setDestination:(id)a3;
- (void)setDeviceNotificationsByRequestIDs:(id)a3;
- (void)setHome:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDDeviceNotificationHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceNotificationsByRequestIDs, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_coalesceTimer, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (void)setDeviceNotificationsByRequestIDs:(id)a3
{
}

- (NSMutableOrderedSet)deviceNotificationsByRequestIDs
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 72, 1);
}

- (HMDDeviceNotificationHandlerDataSource)dataSource
{
  return self->_dataSource;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (void)setDelaySupported:(BOOL)a3
{
  self->_delaySupported = a3;
}

- (BOOL)delaySupported
{
  return self->_delaySupported;
}

- (void)setDelayTimer:(id)a3
{
}

- (HMFTimer)delayTimer
{
  return self->_delayTimer;
}

- (void)setCoalesceTimer:(id)a3
{
}

- (HMFTimer)coalesceTimer
{
  return self->_coalesceTimer;
}

- (void)setDestination:(id)a3
{
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)logIdentifier
{
  v3 = NSString;
  v4 = [(HMDDeviceNotificationHandler *)self home];
  v5 = [v4 uuid];
  v6 = [(HMDDeviceNotificationHandler *)self destination];
  v7 = [v3 stringWithFormat:@"%@/%@", v5, v6];

  return v7;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDDeviceNotificationHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDDeviceNotificationHandler *)self coalesceTimer];
  if ([v4 isEqual:v6])
  {
  }
  else
  {
    v7 = [(HMDDeviceNotificationHandler *)self delayTimer];
    int v8 = [v4 isEqual:v7];

    if (!v8) {
      goto LABEL_7;
    }
  }
  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v12;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Notification timer fired %@", (uint8_t *)&v13, 0x16u);
  }
  [(HMDDeviceNotificationHandler *)v10 _dispatchNotification];
LABEL_7:
}

- (void)_dispatchNotificationUpdate:(id)a3
{
  v81[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDDeviceNotificationHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    v6 = [v4 characteristicUpdateTuples];
    v7 = [v4 characteristicUpdateTuples];
    v60 = objc_msgSend(v7, "na_map:", &__block_literal_global_71);

    objc_msgSend(v60, "na_each:", &__block_literal_global_74);
    v58 = [v4 mediaProperties];
    v56 = [v4 actionSetResponses];
    if ([v60 count] || objc_msgSend(v58, "count") || objc_msgSend(v56, "count"))
    {
      v80 = @"kNotificationUpdateIdentifierKey";
      int v8 = [v4 notificationUpdateID];
      v81[0] = v8;
      v9 = [NSDictionary dictionaryWithObjects:v81 forKeys:&v80 count:1];
      v59 = (void *)[v9 mutableCopy];

      v10 = [(HMDDeviceNotificationHandler *)self destination];
      v55 = +[HMDHome notificationPayloadForChangedCharacteristics:v60 destination:v10 destinationIsXPCTransport:0];

      if ([v55 count]) {
        [v59 setObject:v55 forKeyedSubscript:@"kCharacteristicNotificationsKey"];
      }
      if ([v58 count])
      {
        v11 = +[HMDMediaPropertyResponse serializeResponses:v58];
        if (v11) {
          [v59 setObject:v11 forKeyedSubscript:@"kMediaNotificationsKey"];
        }
      }
      if ([v56 count])
      {
        v12 = +[HMDActionSetResponse serializeWithResponses:v56];
        if (v12) {
          [v59 setObject:v12 forKeyedSubscript:@"HMDDeviceNotificationActionSetsKey"];
        }
      }
      v57 = [v4 requestID];
      if (v57)
      {
        int v13 = [(HMDDeviceNotificationHandler *)self destination];
        char v14 = [v57 isEqualToString:v13];

        if ((v14 & 1) == 0) {
          [v59 setObject:v57 forKeyedSubscript:@"kRequestIdentifierKey"];
        }
      }
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v15 = v60;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v65 objects:v79 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v66;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v66 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = [*(id *)(*((void *)&v65 + 1) + 8 * i) characteristic];
            v20 = [v19 service];
            v21 = [(HMDDeviceNotificationHandler *)self destination];
            char v22 = [v20 shouldIncludePresenceForDeviceWithDestination:v21];

            if (v22)
            {
              LODWORD(v16) = 1;
              goto LABEL_28;
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v65 objects:v79 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
LABEL_28:

      v23 = [(HMDDeviceNotificationHandler *)self home];
      v24 = v23;
      if (v23)
      {
        if (v16)
        {
          v25 = [v23 presenceMonitor];
          v26 = [v25 currentHomePresence];
          v51 = [v26 serializedUUIDDictionary];

          v27 = [v24 presenceMonitor];
          v28 = [v27 currentHomePresence];
          v50 = [v28 serializedIdentifierDictionary];

          [v59 setObject:v51 forKeyedSubscript:@"kPresenceDictionaryForNotificationKey"];
          [v59 setObject:v50 forKeyedSubscript:@"kPresencePairingIdentifierDictionaryForNotificationKey"];
        }
        else
        {
          v50 = 0;
          v51 = 0;
        }
        v33 = [(HMDDeviceNotificationHandler *)self destination];
        v53 = +[HMDDeviceHandle deviceHandleForDestination:v33];

        v34 = +[HMDAccountRegistry sharedRegistry];
        v54 = [v34 deviceForHandle:v53];

        v35 = [HMDRemoteDeviceMessageDestination alloc];
        v36 = [v24 uuid];
        v52 = [(HMDRemoteDeviceMessageDestination *)v35 initWithTarget:v36 device:v54];

        v37 = [[HMDRemoteMessage alloc] initWithName:@"kCharacterisiticsChangedInternalNotificationKey" qualityOfService:17 destination:v52 payload:v59 type:3 timeout:1 secure:0.0];
        v38 = [v24 _userForDevice:v54];
        if (([v38 canGetUpdatesRemotely] & 1) == 0) {
          [(HMDRemoteMessage *)v37 setRestriction:14];
        }

        context = (void *)MEMORY[0x230FBD990]();
        v39 = self;
        v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v41 = HMFGetLogIdentifier();
          v42 = [(HMDRemoteMessage *)v37 identifier];
          v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
          v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v58, "count"));
          v45 = [(HMDRemoteMessage *)v37 messagePayload];
          *(_DWORD *)buf = 138544386;
          v70 = v41;
          __int16 v71 = 2112;
          id v72 = v42;
          __int16 v73 = 2112;
          v74 = v43;
          __int16 v75 = 2112;
          v76 = v44;
          __int16 v77 = 2112;
          v78 = v45;
          _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@Dispatching remote notification %@ with characteristics[%@], media properties[%@], payload: %@", buf, 0x34u);
        }
        v46 = [v24 workQueue];
        objc_initWeak((id *)buf, v39);
        v47 = [(HMDDeviceNotificationHandler *)v39 messageDispatcher];
        v61[0] = MEMORY[0x263EF8330];
        v61[1] = 3221225472;
        v61[2] = __60__HMDDeviceNotificationHandler__dispatchNotificationUpdate___block_invoke_83;
        v61[3] = &unk_264A2B420;
        objc_copyWeak(&v64, (id *)buf);
        id v48 = v46;
        id v62 = v48;
        id v63 = v4;
        [v47 sendMessage:v37 completionHandler:v61];

        objc_destroyWeak(&v64);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v29 = (void *)MEMORY[0x230FBD990]();
        v30 = self;
        v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v70 = v32;
          __int16 v71 = 2112;
          id v72 = v4;
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to dispatch notification update %@ due to no home", buf, 0x16u);
        }
      }
    }
  }
}

void __60__HMDDeviceNotificationHandler__dispatchNotificationUpdate___block_invoke_83(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__HMDDeviceNotificationHandler__dispatchNotificationUpdate___block_invoke_2_84;
    v6[3] = &unk_264A2F820;
    v5 = *(NSObject **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    id v8 = v3;
    dispatch_async(v5, v6);
  }
}

void __60__HMDDeviceNotificationHandler__dispatchNotificationUpdate___block_invoke_2_84(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completions];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__HMDDeviceNotificationHandler__dispatchNotificationUpdate___block_invoke_3;
  v3[3] = &unk_264A2D0E0;
  id v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "na_each:", v3);
}

uint64_t __60__HMDDeviceNotificationHandler__dispatchNotificationUpdate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

void __60__HMDDeviceNotificationHandler__dispatchNotificationUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristicResponse];
  v2 = [v3 request];
  [v2 setCompleted:1];
}

id __60__HMDDeviceNotificationHandler__dispatchNotificationUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 characteristicResponse];
  id v4 = [v3 request];
  if ([v4 isCompleted]) {
    v5 = 0;
  }
  else {
    v5 = v2;
  }
  id v6 = v5;

  return v6;
}

- (void)_dispatchNotification
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(HMDDeviceNotificationHandler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDDeviceNotificationHandler *)self delayTimer];
  [v4 suspend];

  v5 = [(HMDDeviceNotificationHandler *)self coalesceTimer];
  [v5 suspend];

  [(HMDDeviceNotificationHandler *)self setDelayTimer:0];
  [(HMDDeviceNotificationHandler *)self setCoalesceTimer:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(HMDDeviceNotificationHandler *)self deviceNotificationsByRequestIDs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x230FBD990]();
        [(HMDDeviceNotificationHandler *)self _dispatchNotificationUpdate:v11];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  int v13 = [(HMDDeviceNotificationHandler *)self deviceNotificationsByRequestIDs];
  [v13 removeAllObjects];
}

- (void)_beginCoalesce:(BOOL)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = [(HMDDeviceNotificationHandler *)self coalesceTimer];

    if (v4) {
      return;
    }
    v5 = [(HMDDeviceNotificationHandler *)self dataSource];
    id v6 = [v5 timerWithType:0];
    [(HMDDeviceNotificationHandler *)self setCoalesceTimer:v6];

    uint64_t v7 = [(HMDDeviceNotificationHandler *)self coalesceTimer];
    [v7 setDelegate:self];

    uint64_t v8 = [(HMDDeviceNotificationHandler *)self workQueue];
    uint64_t v9 = [(HMDDeviceNotificationHandler *)self coalesceTimer];
    [v9 setDelegateQueue:v8];

    uint64_t v10 = [(HMDDeviceNotificationHandler *)self coalesceTimer];
    [v10 resume];

    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    long long v14 = HMFGetLogIdentifier();
    long long v15 = [(HMDDeviceNotificationHandler *)v12 coalesceTimer];
    int v24 = 138543618;
    v25 = v14;
    __int16 v26 = 2112;
    v27 = v15;
    long long v16 = "%{public}@Running coalescence timer %@";
LABEL_9:
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v24, 0x16u);

LABEL_10:
    return;
  }
  if ([(HMDDeviceNotificationHandler *)self delaySupported])
  {
    long long v17 = [(HMDDeviceNotificationHandler *)self delayTimer];

    if (v17) {
      return;
    }
    v18 = [(HMDDeviceNotificationHandler *)self dataSource];
    uint64_t v19 = [v18 timerWithType:1];
    [(HMDDeviceNotificationHandler *)self setDelayTimer:v19];

    v20 = [(HMDDeviceNotificationHandler *)self delayTimer];
    [v20 setDelegate:self];

    v21 = [(HMDDeviceNotificationHandler *)self workQueue];
    char v22 = [(HMDDeviceNotificationHandler *)self delayTimer];
    [v22 setDelegateQueue:v21];

    v23 = [(HMDDeviceNotificationHandler *)self delayTimer];
    [v23 resume];

    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    long long v14 = HMFGetLogIdentifier();
    long long v15 = [(HMDDeviceNotificationHandler *)v12 delayTimer];
    int v24 = 138543618;
    v25 = v14;
    __int16 v26 = 2112;
    v27 = v15;
    long long v16 = "%{public}@Running delay timer %@";
    goto LABEL_9;
  }
  [(HMDDeviceNotificationHandler *)self _dispatchNotification];
}

- (void)sendNotificationForActionSetResponses:(id)a3 notificationUpdateIdentifier:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDDeviceNotificationHandler *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (![v6 count])
  {
    long long v15 = (void *)MEMORY[0x230FBD990]();
    long long v16 = self;
    long long v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      int v25 = 138543362;
      __int16 v26 = v18;
      uint64_t v19 = "%{public}@No action sets updated";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_12;
  }
  uint64_t v9 = [(HMDDeviceNotificationHandler *)self home];
  uint64_t v10 = [v9 primaryResident];
  uint64_t v11 = [v10 device];
  v12 = [v11 remoteDestinationString];
  int v13 = [(HMDDeviceNotificationHandler *)self destination];
  int v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    long long v15 = (void *)MEMORY[0x230FBD990]();
    long long v16 = self;
    long long v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      int v25 = 138543362;
      __int16 v26 = v18;
      uint64_t v19 = "%{public}@No action set notification will be sent to the primary";
LABEL_7:
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v25, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v20 = [(HMDDeviceNotificationHandler *)self _notificationUpdateWithRequestID:0 allowAdd:1];
  v21 = (void *)MEMORY[0x230FBD990]([v20 updateWithUpdatedActionSetResponses:v6 notificationUpdateID:v7 completion:0]);
  char v22 = self;
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    int v24 = HMFGetLogIdentifier();
    int v25 = 138543618;
    __int16 v26 = v24;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Coalescing action set responses %@", (uint8_t *)&v25, 0x16u);
  }
  [(HMDDeviceNotificationHandler *)v22 _beginCoalesce:1];

LABEL_12:
}

- (void)sendNotificationForMediaProperties:(id)a3 withRequestIdentifier:(id)a4 notificationUpdateIdentifier:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDDeviceNotificationHandler *)self workQueue];
  dispatch_assert_queue_V2(v11);

  if ([v8 count])
  {
    [(HMDDeviceNotificationHandler *)self _notificationUpdateWithRequestID:v9 allowAdd:1];
    uint64_t v12 = v31 = v8;
    int v13 = [(HMDDeviceNotificationHandler *)self home];
    int v14 = [v13 primaryResident];
    long long v15 = [v14 device];
    long long v16 = [v15 remoteDestinationString];
    long long v17 = [(HMDDeviceNotificationHandler *)self destination];
    id v18 = v10;
    unsigned int v19 = [v16 isEqualToString:v17] ^ 1;

    if (v9) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = v19;
    }
    id v10 = v18;
    v21 = (void *)v12;
    id v8 = v31;
    char v22 = (void *)MEMORY[0x230FBD990]([v21 updateWithUpdatedMediaPropertiesByMediaResponses:v31 notificationUpdateID:v10 completion:0]);
    v23 = self;
    int v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v25 = HMFGetLogIdentifier();
      __int16 v26 = HMFBooleanToString();
      *(_DWORD *)buf = 138544130;
      v33 = v25;
      __int16 v34 = 2112;
      id v35 = v31;
      __int16 v36 = 2112;
      id v37 = v9;
      __int16 v38 = 2112;
      v39 = v26;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Coalescing media notifications %@, id: %@, shouldCoalesce: %@", buf, 0x2Au);
    }
    [(HMDDeviceNotificationHandler *)v23 _beginCoalesce:v20];
  }
  else
  {
    __int16 v27 = (void *)MEMORY[0x230FBD990]();
    id v28 = self;
    uint64_t v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v33 = v30;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@No media properties updated, returning", buf, 0xCu);
    }
  }
}

- (id)_notificationUpdateWithRequestID:(id)a3 allowAdd:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HMDDeviceNotificationHandler *)self workQueue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(HMDDeviceNotificationHandler *)self destination];
  }
  id v9 = v8;
  uint64_t v25 = 0;
  __int16 v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__19701;
  uint64_t v29 = __Block_byref_object_dispose__19702;
  id v30 = 0;
  id v10 = [(HMDDeviceNotificationHandler *)self deviceNotificationsByRequestIDs];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __74__HMDDeviceNotificationHandler__notificationUpdateWithRequestID_allowAdd___block_invoke;
  char v22 = &unk_264A17950;
  id v11 = v9;
  id v23 = v11;
  int v24 = &v25;
  [v10 enumerateObjectsUsingBlock:&v19];

  uint64_t v12 = (void *)v26[5];
  if (!v12 && v4)
  {
    int v13 = [HMDDeviceNotificationUpdate alloc];
    uint64_t v14 = -[HMDDeviceNotificationUpdate initWithRequestID:](v13, "initWithRequestID:", v11, v19, v20, v21, v22);
    long long v15 = (void *)v26[5];
    v26[5] = v14;

    long long v16 = [(HMDDeviceNotificationHandler *)self deviceNotificationsByRequestIDs];
    [v16 addObject:v26[5]];

    uint64_t v12 = (void *)v26[5];
  }
  id v17 = v12;

  _Block_object_dispose(&v25, 8);
  return v17;
}

void __74__HMDDeviceNotificationHandler__notificationUpdateWithRequestID_allowAdd___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = *(void **)(a1 + 32);
  id v10 = v7;
  id v9 = [v7 requestID];
  LODWORD(v8) = [v8 isEqualToString:v9];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)sendCoalescedRemoteNotificationForAccessories:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDDeviceNotificationHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 count])
  {
    id v6 = [(HMDDeviceNotificationHandler *)self deviceNotificationsByRequestIDs];
    id v7 = [v6 array];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __78__HMDDeviceNotificationHandler_sendCoalescedRemoteNotificationForAccessories___block_invoke;
    v16[3] = &unk_264A17928;
    id v8 = v4;
    id v17 = v8;
    id v9 = objc_msgSend(v7, "na_filter:", v16);

    if ([v9 count])
    {
      id v10 = objc_msgSend(v8, "na_map:", &__block_literal_global_19744);
      id v11 = (void *)MEMORY[0x230FBD990]();
      uint64_t v12 = self;
      int v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        long long v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        *(_DWORD *)buf = 138543874;
        uint64_t v19 = v14;
        __int16 v20 = 2112;
        v21 = v15;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending all coalesced remote notifications including %@ updates for %@", buf, 0x20u);
      }
      [(HMDDeviceNotificationHandler *)v12 _dispatchNotification];
    }
  }
}

uint64_t __78__HMDDeviceNotificationHandler_sendCoalescedRemoteNotificationForAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristicUpdateTuples];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__HMDDeviceNotificationHandler_sendCoalescedRemoteNotificationForAccessories___block_invoke_2;
  v6[3] = &unk_264A17900;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __78__HMDDeviceNotificationHandler_sendCoalescedRemoteNotificationForAccessories___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 shortDescription];
}

uint64_t __78__HMDDeviceNotificationHandler_sendCoalescedRemoteNotificationForAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristic];
  uint64_t v4 = [v3 accessory];
  uint64_t v5 = [v2 containsObject:v4];

  return v5;
}

- (void)sendNotificationForCharacteristicUpdates:(id)a3 withRequestIdentifier:(id)a4 notificationUpdateIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void (**)(id, void *))a6;
  uint64_t v14 = [(HMDDeviceNotificationHandler *)self workQueue];
  dispatch_assert_queue_V2(v14);

  if ([v10 count])
  {
    v51 = v13;
    id v52 = v12;
    long long v15 = [(HMDDeviceNotificationHandler *)self _notificationUpdateWithRequestID:v11 allowAdd:1];
    long long v16 = [(HMDDeviceNotificationHandler *)self home];
    id v17 = [v16 primaryResident];
    id v18 = [v17 device];
    uint64_t v19 = [v18 remoteDestinationString];
    v50 = self;
    __int16 v20 = [(HMDDeviceNotificationHandler *)self destination];
    unsigned int v21 = [v19 isEqualToString:v20] ^ 1;

    if (v11) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = v21;
    }
    v56 = +[HMDHAPMetadata getSharedInstance];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v53 = v10;
    id v23 = v10;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v57 objects:v67 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      id v48 = v15;
      id v49 = v11;
      char v26 = 0;
      id obj = v23;
      uint64_t v55 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v58 != v55) {
            objc_enumerationMutation(obj);
          }
          id v28 = [*(id *)(*((void *)&v57 + 1) + 8 * i) characteristic];
          uint64_t v29 = [v28 service];
          id v30 = [v28 type];
          id v31 = [v29 type];
          int v32 = [v56 shouldCoalesceCharacteristicNotifications:v30 forService:v31];

          uint64_t v22 = v32 & v22;
          v33 = [v28 type];
          __int16 v34 = [v29 type];
          LOBYTE(v32) = [v56 requiresDeviceUnlock:v33 forService:v34];

          v26 |= v32;
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
      }
      while (v25);

      long long v15 = v48;
      int v13 = v51;
      id v12 = v52;
      uint64_t v35 = [v48 updateWithCharacteristicUpdates:obj notificationUpdateID:v52 completion:v51];
      id v11 = v49;
      if (v26)
      {
        __int16 v36 = (void *)MEMORY[0x230FBD990](v35);
        id v37 = v50;
        __int16 v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v39 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          id v62 = v39;
          __int16 v63 = 2112;
          id v64 = obj;
          __int16 v65 = 2112;
          id v66 = v49;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Not coalescing notifications for %@, id: %@", buf, 0x20u);
        }
        uint64_t v40 = [(HMDDeviceNotificationHandler *)v37 deviceNotificationsByRequestIDs];
        uint64_t v41 = [v40 indexOfObject:v48];

        if (v41)
        {
          v42 = [(HMDDeviceNotificationHandler *)v37 deviceNotificationsByRequestIDs];
          [v42 removeObject:v48];

          v43 = [(HMDDeviceNotificationHandler *)v37 deviceNotificationsByRequestIDs];
          [v43 insertObject:v48 atIndex:0];
        }
        [(HMDDeviceNotificationHandler *)v37 _dispatchNotification];
        goto LABEL_24;
      }
    }
    else
    {

      id v12 = v52;
      [v15 updateWithCharacteristicUpdates:v23 notificationUpdateID:v52 completion:v13];
    }
    [(HMDDeviceNotificationHandler *)v50 _beginCoalesce:v22];
LABEL_24:

    id v10 = v53;
    goto LABEL_25;
  }
  v44 = (void *)MEMORY[0x230FBD990]();
  v45 = self;
  v46 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    v47 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v62 = v47;
    __int16 v63 = 2112;
    id v64 = v11;
    _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@No characteristics updated for: %@, returning", buf, 0x16u);
  }
  if (v13)
  {
    long long v15 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    v13[2](v13, v15);
LABEL_25:
  }
}

- (HMDDeviceNotificationHandler)initWithDestination:(id)a3 watchDevice:(BOOL)a4 withRequestIdentifier:(id)a5 messageDispatcher:(id)a6 home:(id)a7 dataSource:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HMDDeviceNotificationHandler;
  id v18 = [(HMDDeviceNotificationHandler *)&v25 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_destination, a3);
    objc_storeWeak((id *)&v19->_home, v16);
    v19->_delaySupported = !a4;
    uint64_t v20 = [MEMORY[0x263EFF9B0] orderedSet];
    deviceNotificationsByRequestIDs = v19->_deviceNotificationsByRequestIDs;
    v19->_deviceNotificationsByRequestIDs = (NSMutableOrderedSet *)v20;

    uint64_t v22 = [v16 workQueue];
    workQueue = v19->_workQueue;
    v19->_workQueue = (OS_dispatch_queue *)v22;

    objc_storeStrong((id *)&v19->_messageDispatcher, a6);
    objc_storeStrong((id *)&v19->_dataSource, a8);
  }

  return v19;
}

- (HMDDeviceNotificationHandler)initWithDestination:(id)a3 watchDevice:(BOOL)a4 withRequestIdentifier:(id)a5 messageDispatcher:(id)a6 home:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = [[HMDDeviceNotificationHandlerDefaultDataSource alloc] initWithHome:v12];
  id v17 = [(HMDDeviceNotificationHandler *)self initWithDestination:v15 watchDevice:v9 withRequestIdentifier:v14 messageDispatcher:v13 home:v12 dataSource:v16];

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13 != -1) {
    dispatch_once(&logCategory__hmf_once_t13, &__block_literal_global_89);
  }
  id v2 = (void *)logCategory__hmf_once_v14;
  return v2;
}

void __43__HMDDeviceNotificationHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v14;
  logCategory__hmf_once_id v14 = v0;
}

@end