@interface HMDLocationEvent
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)_activate:(unint64_t)a3 completionHandler:(id)a4;
- (BOOL)doesThisTargetCurrentUser;
- (BOOL)isActive;
- (BOOL)isCompatibleWithEvent:(id)a3;
- (CLRegion)region;
- (CLRegion)uniqueRegion;
- (HMDLocationEvent)initWithCoder:(id)a3;
- (HMDLocationEvent)initWithModel:(id)a3 home:(id)a4;
- (NSString)description;
- (NSUUID)userUUID;
- (id)analyticsTriggerEventData;
- (id)createPayload;
- (id)dumpState;
- (id)emptyModelObject;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (void)_handleLocationEventOccured:(id)a3;
- (void)_handleRetrieveLocationEventForEventTrigger:(id)a3;
- (void)_handleUpdateRequest:(id)a3;
- (void)_registerForMessages;
- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)checkFMFStatus:(id)a3;
- (void)didEnterRegion:(id)a3;
- (void)didExitRegion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fmfStatusUpdateNotification:(id)a3;
- (void)informLocationEventOccuranceToResident;
- (void)locationEventOccured;
- (void)setRegion:(id)a3;
- (void)setUserUUID:(id)a3;
@end

@implementation HMDLocationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

- (void)setUserUUID:(id)a3
{
}

- (NSUUID)userUUID
{
  return self->_userUUID;
}

- (void)setRegion:(id)a3
{
}

- (CLRegion)region
{
  return self->_region;
}

- (id)analyticsTriggerEventData
{
  v3 = objc_alloc_init(HMDAnalyticsTriggerEventData);
  [(HMDAnalyticsTriggerEventData *)v3 setEndEvent:[(HMDEvent *)self isEndEvent]];
  v4 = objc_alloc_init(HMDAnalyticsLocationEventData);
  v5 = [(HMDLocationEvent *)self region];
  -[HMDAnalyticsLocationEventData setNotifyOnEntry:](v4, "setNotifyOnEntry:", [v5 notifyOnEntry]);

  v6 = [(HMDLocationEvent *)self region];
  -[HMDAnalyticsLocationEventData setNotifyOnExit:](v4, "setNotifyOnExit:", [v6 notifyOnExit]);

  [(HMDAnalyticsTriggerEventData *)v3 setLocationEvent:v4];
  return v3;
}

- (void)didExitRegion:(id)a3
{
  id v4 = a3;
  v5 = [(HMDEvent *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__HMDLocationEvent_didExitRegion___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __34__HMDLocationEvent_didExitRegion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Received a exit callback from HMDLocation for the region callback: [%@]", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) locationEventOccured];
}

- (void)didEnterRegion:(id)a3
{
  id v4 = a3;
  v5 = [(HMDEvent *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__HMDLocationEvent_didEnterRegion___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __35__HMDLocationEvent_didEnterRegion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Received a enter callback from HMDLocation for the region callback : [%@]", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) locationEventOccured];
}

- (void)informLocationEventOccuranceToResident
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = [(HMDEvent *)self eventTrigger];
  id v4 = [v3 home];

  v5 = [v4 homeManager];
  uint64_t v6 = [v5 messageDispatcher];

  v7 = [HMDRemoteHomeMessageDestination alloc];
  int v8 = [(HMDEvent *)self uuid];
  v9 = [v4 uuid];
  __int16 v10 = [(HMDRemoteHomeMessageDestination *)v7 initWithTarget:v8 homeUUID:v9];

  uint64_t v11 = +[HMDRemoteMessage secureMessageWithName:@"kLocationEventOccuredRequestKey" qualityOfService:17 destination:v10 messagePayload:MEMORY[0x263EFFA78]];
  uint64_t v12 = [v11 identifier];
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __58__HMDLocationEvent_informLocationEventOccuranceToResident__block_invoke;
  v18[3] = &unk_264A2D420;
  objc_copyWeak(&v20, &location);
  id v13 = v12;
  id v19 = v13;
  v14 = (void *)MEMORY[0x230FBD990]([v11 setResponseHandler:v18]);
  v15 = self;
  HMFGetOSLogHandle();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v23 = v17;
    __int16 v24 = 2114;
    id v25 = v13;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Sending message with identifier %{public}@ to inform location event to resident", buf, 0x16u);
  }
  [v6 sendMessage:v11 completionHandler:0];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __58__HMDLocationEvent_informLocationEventOccuranceToResident__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = WeakRetained;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138543618;
    v14 = v11;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Message with identifier %@ to inform location event has been sent", (uint8_t *)&v13, 0x16u);
  }
}

- (void)_handleLocationEventOccured:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    id v9 = HMDEventTriggerActivationTypeAsString([(HMDEvent *)v6 activationType]);
    int v17 = 138543618;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received remote message that location event has occurred, with current activation type %@", (uint8_t *)&v17, 0x16u);
  }
  if ([(HMDEvent *)v6 activationType] == 2)
  {
    __int16 v10 = [HMDEventTriggerDevice alloc];
    uint64_t v11 = [v4 remoteSourceDevice];
    uint64_t v12 = [(HMDEvent *)v6 eventTrigger];
    int v13 = [v12 home];
    v14 = [(HMDEventTriggerDevice *)v10 initWithDevice:v11 forHome:v13];

    __int16 v15 = [(HMDEvent *)v6 delegate];
    id v16 = (id)[v15 didOccurEvent:v6 causingDevice:v14];
  }
  [v4 respondWithPayload:0];
}

- (void)locationEventOccured
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    v7 = HMDEventTriggerActivationTypeAsString([(HMDEvent *)v4 activationType]);
    int v21 = 138543618;
    v22 = v6;
    __int16 v23 = 2112;
    __int16 v24 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Received a callback that location event has occurred, current activation state: %@", (uint8_t *)&v21, 0x16u);
  }
  int v8 = +[HMDLostModeManager sharedManager];
  int v9 = [v8 isLost];

  if (v9)
  {
    __int16 v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = v4;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      int v21 = 138543362;
      v22 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Device Lost. Not informing that location event has occurred", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    uint64_t v14 = [(HMDEvent *)v4 activationType];
    if (v14 == 3)
    {
      __int16 v15 = [HMDEventTriggerDevice alloc];
      id v16 = [(HMDEvent *)v4 eventTrigger];
      int v17 = [v16 home];
      v18 = [(HMDEventTriggerDevice *)v15 initWithCurrentDeviceForHome:v17];

      __int16 v19 = [(HMDEvent *)v4 delegate];
      id v20 = (id)[v19 didOccurEvent:v4 causingDevice:v18];
    }
    else if (v14 == 1)
    {
      [(HMDLocationEvent *)v4 informLocationEventOccuranceToResident];
    }
  }
}

- (BOOL)_activate:(unint64_t)a3 completionHandler:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDLocationEvent;
  BOOL v7 = [(HMDEvent *)&v15 _activate:a3 completionHandler:0];
  uint64_t v8 = [(HMDLocationEvent *)self uniqueRegion];
  int v9 = (void *)v8;
  if (v8)
  {
    v16[0] = v8;
    __int16 v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  }
  else
  {
    __int16 v10 = (void *)MEMORY[0x263EFFA68];
  }
  BOOL v11 = [(HMDLocationEvent *)self isActive];
  uint64_t v12 = +[HMDLocation sharedManager];
  int v13 = v12;
  if (v11) {
    [v12 registerForRegionUpdate:v10 withDelegate:self completionHandler:v6];
  }
  else {
    [v12 deregisterForRegionUpdate:v10 completionHandler:v6];
  }

  return v7;
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = (void *)MEMORY[0x230FBD990]();
  uint64_t v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v43 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Handling transaction updated", buf, 0xCu);
  }
  id v15 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  if (v17)
  {
    v18 = [(HMDEvent *)v12 eventTrigger];
    __int16 v19 = [v10 name];
    int v20 = [v19 isEqualToString:@"kMigratedEventsToRecordsRequest"];

    if (v20)
    {
      [v18 processEventRecords:v17 message:v10];
    }
    else
    {
      if ([v17 propertyWasSet:@"region"])
      {
        int v21 = (void *)MEMORY[0x263F08928];
        uint64_t v22 = objc_opt_class();
        __int16 v23 = [v17 region];
        id v41 = 0;
        __int16 v24 = [v21 unarchivedObjectOfClass:v22 fromData:v23 error:&v41];
        id v25 = v41;

        if (!v24)
        {
          v33 = (void *)MEMORY[0x230FBD990]();
          v34 = v12;
          v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v43 = v36;
            __int16 v44 = 2112;
            id v45 = v25;
            _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive region from event model: %@", buf, 0x16u);
          }
          [v10 respondWithError:v25];

          goto LABEL_17;
        }
        uint64_t v26 = [(HMDLocationEvent *)v12 region];
        char v27 = [v26 isEqual:v24];

        if ((v27 & 1) == 0)
        {
          v28 = (void *)MEMORY[0x230FBD990]();
          v29 = v12;
          v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v40 = HMFGetLogIdentifier();
            v37 = [(HMDLocationEvent *)v29 region];
            regionAsString(v37);
            v31 = id v38 = v25;
            regionAsString(v24);
            v32 = v39 = v28;
            *(_DWORD *)buf = 138543874;
            v43 = v40;
            __int16 v44 = 2112;
            id v45 = v31;
            __int16 v46 = 2112;
            v47 = v32;
            _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Updating region %@ to new region %@", buf, 0x20u);

            v28 = v39;
            id v25 = v38;
          }
          [(HMDLocationEvent *)v29 setRegion:v24];
          [v18 markChangedForMessage:v10];
        }
      }
      [v10 respondWithSuccess];
    }
LABEL_17:
  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  id v5 = [HMDLocationEventModel alloc];
  id v6 = [(HMDEvent *)self uuid];
  BOOL v7 = [(HMDEvent *)self eventTrigger];
  id v8 = [v7 uuid];
  id v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  [(HMDLocationEventModel *)v9 setEndEvent:v10];

  BOOL v11 = [(HMDLocationEvent *)self region];
  uint64_t v12 = encodeRootObject();
  [(HMDLocationEventModel *)v9 setRegion:v12];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HMDLocationEvent;
  [(HMDEvent *)&v6 encodeWithCoder:v4];
  if (objc_msgSend(v4, "hmd_isForXPCTransport")
    && (objc_msgSend(v4, "hmd_isForXPCTransportAuthorizedForLocationAccess") & 1) != 0
    || (objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
    || objc_msgSend(v4, "hmd_isForRemoteTransport")
    && !objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount")
    || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount")
    && (objc_msgSend(v4, "hmd_isForRemoteGatewayCoder") & 1) == 0)
  {
    id v5 = [(HMDLocationEvent *)self region];
    [v4 encodeObject:v5 forKey:@"HM.locationEventRegion"];
  }
}

- (HMDLocationEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDLocationEvent;
  id v5 = [(HMDEvent *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.locationEventRegion"];
    region = v5->_region;
    v5->_region = (CLRegion *)v6;
  }
  return v5;
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDLocationEvent;
  return [(HMDEvent *)&v4 isCompatibleWithEvent:a3];
}

- (id)createPayload
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  v10.receiver = self;
  v10.super_class = (Class)HMDLocationEvent;
  objc_super v4 = [(HMDEvent *)&v10 createPayload];
  id v5 = [v3 dictionaryWithDictionary:v4];

  uint64_t v6 = [(HMDLocationEvent *)self region];
  BOOL v7 = encodeRootObject();
  [v5 setObject:v7 forKeyedSubscript:@"kLocationEventRegionKey"];

  id v8 = (void *)[v5 copy];
  return v8;
}

- (CLRegion)uniqueRegion
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  objc_super v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    BOOL v7 = [(HMDLocationEvent *)v4 region];
    *(_DWORD *)buf = 138543618;
    v49 = v6;
    __int16 v50 = 2112;
    uint64_t v51 = (uint64_t)v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@unique region %@", buf, 0x16u);
  }
  id v8 = NSString;
  objc_super v9 = [(HMDLocationEvent *)v4 region];
  objc_super v10 = [v9 identifier];
  uint64_t v11 = [(HMDEvent *)v4 uuid];
  uint64_t v12 = [(id)v11 UUIDString];
  int v13 = [v8 stringWithFormat:@"%@-%@", v10, v12];

  uint64_t v14 = [(HMDLocationEvent *)v4 region];
  objc_opt_class();
  LOBYTE(v11) = objc_opt_isKindOfClass();

  id v15 = [(HMDLocationEvent *)v4 region];
  if (v11)
  {
    id v16 = objc_alloc(MEMORY[0x263F00A28]);
    [v15 center];
    double v18 = v17;
    double v20 = v19;
    [v15 radius];
    uint64_t v22 = objc_msgSend(v16, "initWithCenter:radius:identifier:nearbyAllowed:", v13, 1, v18, v20, v21);
    objc_msgSend(v22, "setNotifyOnExit:", objc_msgSend(v15, "notifyOnExit"));
    objc_msgSend(v22, "setNotifyOnEntry:", objc_msgSend(v15, "notifyOnEntry"));
    uint64_t v23 = objc_msgSend(v22, "setReferenceFrame:", objc_msgSend(v15, "referenceFrame"));
    if (!v22)
    {
      __int16 v24 = (void *)MEMORY[0x230FBD990](v23);
      id v25 = v4;
      uint64_t v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        char v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v49 = v27;
        __int16 v50 = 2112;
        uint64_t v51 = (uint64_t)v15;
        v28 = "%{public}@Error getting circle region for unique region, %@";
LABEL_21:
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);

        goto LABEL_22;
      }
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v15 = [(HMDLocationEvent *)v4 region];
    uint64_t v30 = [v15 major];
    if (v30
      && (v31 = (void *)v30,
          [v15 minor],
          v32 = objc_claimAutoreleasedReturnValue(),
          v32,
          v31,
          v32))
    {
      id v33 = objc_alloc(MEMORY[0x263F00A18]);
      v34 = [v15 proximityUUID];
      v35 = [v15 major];
      uint64_t v36 = [v35 unsignedShortValue];
      v37 = [v15 minor];
      uint64_t v22 = objc_msgSend(v33, "initWithProximityUUID:major:minor:identifier:", v34, v36, objc_msgSend(v37, "unsignedShortValue"), v13);
    }
    else
    {
      __int16 v44 = [v15 major];

      id v45 = objc_alloc(MEMORY[0x263F00A18]);
      v34 = [v15 proximityUUID];
      if (!v44)
      {
        uint64_t v22 = (void *)[v45 initWithProximityUUID:v34 identifier:v13];
LABEL_18:

        objc_msgSend(v22, "setNotifyOnExit:", objc_msgSend(v15, "notifyOnExit"));
        uint64_t v46 = objc_msgSend(v22, "setNotifyOnEntry:", objc_msgSend(v15, "notifyOnEntry"));
        if (!v22)
        {
          __int16 v24 = (void *)MEMORY[0x230FBD990](v46);
          id v25 = v4;
          uint64_t v26 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            char v27 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v49 = v27;
            __int16 v50 = 2112;
            uint64_t v51 = (uint64_t)v15;
            v28 = "%{public}@Error getting beacon region for unique region, %@";
            goto LABEL_21;
          }
LABEL_22:
        }
LABEL_23:

        goto LABEL_24;
      }
      v35 = [v15 major];
      uint64_t v22 = objc_msgSend(v45, "initWithProximityUUID:major:identifier:", v34, objc_msgSend(v35, "unsignedShortValue"), v13);
    }

    goto LABEL_18;
  }
  id v38 = (void *)MEMORY[0x230FBD990]();
  v39 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    v40 = HMFGetLogIdentifier();
    id v41 = [(HMDLocationEvent *)v4 region];
    uint64_t v42 = objc_opt_class();
    v43 = [(HMDLocationEvent *)v4 region];
    *(_DWORD *)buf = 138543874;
    v49 = v40;
    __int16 v50 = 2112;
    uint64_t v51 = v42;
    __int16 v52 = 2112;
    v53 = v43;
    _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Cannot create unique region for region of unsupported class %@: %@", buf, 0x20u);
  }
  uint64_t v22 = 0;
LABEL_24:

  return (CLRegion *)v22;
}

- (id)dumpState
{
  v13.receiver = self;
  v13.super_class = (Class)HMDLocationEvent;
  id v3 = [(HMDEvent *)&v13 dumpState];
  objc_super v4 = (void *)[v3 mutableCopy];

  id v5 = NSString;
  uint64_t v6 = [(HMDLocationEvent *)self region];
  BOOL v7 = [(HMDLocationEvent *)self region];
  [v7 notifyOnEntry];
  id v8 = HMFBooleanToString();
  objc_super v9 = [(HMDLocationEvent *)self region];
  [v9 notifyOnExit];
  objc_super v10 = HMFBooleanToString();
  uint64_t v11 = [v5 stringWithFormat:@"Region: %@, Entry: %@, Exit: %@", v6, v8, v10];

  [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x263F41F38]];
  return v4;
}

- (void)_handleRetrieveLocationEventForEventTrigger:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isAuthorizedForLocationAccess])
  {
    id v5 = [v4 proxyConnection];
    uint64_t v6 = [v5 processInfo];
    BOOL v7 = [v6 locationAuthorization];
    [v7 mark];

    id v8 = [MEMORY[0x263EFF9A0] dictionary];
    objc_super v9 = [(HMDLocationEvent *)self region];
    objc_super v10 = encodeRootObject();
    [v8 setObject:v10 forKeyedSubscript:@"kLocationEventRegionKey"];

    uint64_t v11 = [(HMDEvent *)self eventTrigger];
    uint64_t v12 = [v11 mostRecentFireDate];

    if (v12)
    {
      objc_super v13 = [v11 mostRecentFireDate];
      [v8 setObject:v13 forKeyedSubscript:@"kTriggerLastFireDateKey"];
    }
    [v4 respondWithPayload:v8];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      double v18 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Client does not have authorization to location", (uint8_t *)&v17, 0xCu);
    }
    [v4 respondWithPayload:0];
  }
}

- (void)_handleUpdateRequest:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isAuthorizedForLocationAccess])
  {
    id v5 = [v4 dataForKey:@"kLocationEventRegionKey"];
    id v35 = 0;
    uint64_t v6 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v35];
    id v7 = v35;
    if (v6)
    {
      if (HMIsValidRegion())
      {
        id v8 = [(HMDLocationEvent *)self emptyModelObject];
        objc_super v9 = encodeRootObject();
        [v8 setRegion:v9];

        objc_super v10 = [(HMDEvent *)self eventTrigger];
        uint64_t v11 = [v10 home];
        uint64_t v12 = [v11 backingStore];
        objc_super v13 = [v4 name];
        +[HMDBackingStoreTransactionOptions defaultXPCOptions];
        uint64_t v14 = v31 = v7;
        id v15 = [v12 transaction:v13 options:v14];

        [v15 add:v8];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __41__HMDLocationEvent__handleUpdateRequest___block_invoke;
        v32[3] = &unk_264A2F370;
        id v33 = v4;
        id v34 = v8;
        id v16 = v8;
        [v15 run:v32];

        id v7 = v31;
LABEL_15:

        goto LABEL_16;
      }
      char v27 = (void *)MEMORY[0x230FBD990]();
      v28 = self;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v37 = v30;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle update request as provided region is not valid", buf, 0xCu);
      }
      id v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = 3;
    }
    else
    {
      double v21 = (void *)MEMORY[0x230FBD990]();
      uint64_t v22 = self;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        __int16 v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v37 = v24;
        __int16 v38 = 2112;
        id v39 = v7;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive region from region data: %@", buf, 0x16u);
      }
      id v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = 20;
    }
    id v15 = [v25 hmErrorWithCode:v26];
    [v4 respondWithError:v15];
    goto LABEL_15;
  }
  int v17 = (void *)MEMORY[0x230FBD990]();
  double v18 = self;
  uint64_t v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    double v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v37 = v20;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle update request as the client is not authorized for location services", buf, 0xCu);
  }
  id v5 = [MEMORY[0x263F087E8] hmErrorWithCode:85];
  [v4 respondWithError:v5];
LABEL_16:
}

void __41__HMDLocationEvent__handleUpdateRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 respondWithError:a2];
  }
  else
  {
    uint64_t v6 = @"kLocationEventRegionKey";
    id v4 = [*(id *)(a1 + 40) region];
    v7[0] = v4;
    id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [v2 respondWithPayload:v5];
  }
}

- (void)checkFMFStatus:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Checking the ownership with fmfStatus %@", (uint8_t *)&v10, 0x16u);
  }
  if (-[HMDLocationEvent doesThisTargetCurrentUser](v6, "doesThisTargetCurrentUser") && [v4 value] == 2)
  {
    objc_super v9 = [(HMDEvent *)v6 eventTrigger];
    [v9 takeOverOwnershipOfTrigger];
  }
}

- (BOOL)doesThisTargetCurrentUser
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(HMDEvent *)self eventTrigger];
  id v4 = [v3 home];
  id v5 = [(HMDLocationEvent *)self userUUID];
  uint64_t v6 = [v4 userWithUUID:v5];

  id v7 = [v4 currentUser];
  char v8 = [v6 isEqual:v7];
  if ((v8 & 1) == 0)
  {
    objc_super v9 = (void *)MEMORY[0x230FBD990]();
    int v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = HMFGetLogIdentifier();
      int v14 = 138543874;
      id v15 = v12;
      __int16 v16 = 2112;
      int v17 = v6;
      __int16 v18 = 2112;
      uint64_t v19 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Not taking the ownership since this trigger belongs to user %@, this device's user %@", (uint8_t *)&v14, 0x20u);
    }
  }

  return v8;
}

- (void)fmfStatusUpdateNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDEvent *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __48__HMDLocationEvent_fmfStatusUpdateNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__HMDLocationEvent_fmfStatusUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = +[HMDFMF fmfStatusWithDict:v2];
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 40);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    objc_super v9 = v7;
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Received FMF status update notification with %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 40) checkFMFStatus:v3];
}

- (void)_registerForMessages
{
  v17[2] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)HMDLocationEvent;
  [(HMDEvent *)&v15 _registerForMessages];
  id v3 = [(HMDEvent *)self home];
  id v4 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v3 userPrivilege:0 remoteAccessRequired:0];

  id v5 = [(HMDEvent *)self msgDispatcher];
  id v6 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v17[0] = v6;
  v17[1] = v4;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  [v5 registerForMessage:@"kRetrieveLocationEventRequestKey" receiver:self policies:v7 selector:sel__handleRetrieveLocationEventForEventTrigger_];

  int v8 = [(HMDEvent *)self msgDispatcher];
  objc_super v9 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v16[0] = v9;
  v16[1] = v4;
  __int16 v10 = +[HMDRemoteMessagePolicy defaultSecurePrimaryResidentPolicy];
  void v16[2] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  [v8 registerForMessage:@"kLocationEventOccuredRequestKey" receiver:self policies:v11 selector:sel__handleLocationEventOccured_];

  uint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 addObserver:self selector:sel_fmfStatusUpdateNotification_ name:@"HMDFMFStatusUpdateNotification" object:0];

  id v13 = +[HMDFMFHandler sharedHandler];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __40__HMDLocationEvent__registerForMessages__block_invoke;
  v14[3] = &unk_264A17658;
  v14[4] = self;
  [v13 queryFMFStatusWithCompletion:v14];
}

void __40__HMDLocationEvent__registerForMessages__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__HMDLocationEvent__registerForMessages__block_invoke_2;
  v6[3] = &unk_264A2F820;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __40__HMDLocationEvent__registerForMessages__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    objc_super v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@FMF Device Status is %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) checkFMFStatus:*(void *)(a1 + 40)];
}

- (id)emptyModelObject
{
  id v3 = [HMDLocationEventModel alloc];
  id v4 = [(HMDEvent *)self uuid];
  id v5 = [(HMDEvent *)self eventTrigger];
  uint64_t v6 = [v5 uuid];
  id v7 = [(HMDBackingStoreModelObject *)v3 initWithObjectChangeType:2 uuid:v4 parentUUID:v6];

  return v7;
}

- (BOOL)isActive
{
  return (([(HMDEvent *)self activationType] - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (NSString)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)HMDLocationEvent;
  id v4 = [(HMDEvent *)&v9 description];
  id v5 = [(HMDLocationEvent *)self region];
  uint64_t v6 = regionAsString(v5);
  id v7 = [v3 stringWithFormat:@"%@, %@", v4, v6];

  return (NSString *)v7;
}

- (HMDLocationEvent)initWithModel:(id)a3 home:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HMDLocationEvent;
  int v8 = [(HMDEvent *)&v23 initWithModel:v6 home:v7];
  if (v8)
  {
    objc_super v9 = (void *)MEMORY[0x263F08928];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v6 region];
    id v22 = 0;
    uint64_t v12 = [v9 unarchivedObjectOfClass:v10 fromData:v11 error:&v22];
    id v13 = v22;
    region = v8->_region;
    v8->_region = (CLRegion *)v12;

    if (!v8->_region)
    {
      objc_super v15 = (void *)MEMORY[0x230FBD990]();
      __int16 v16 = v8;
      int v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v25 = v18;
        __int16 v26 = 2112;
        id v27 = v13;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive region from object model's region: %@", buf, 0x16u);
      }
    }
    uint64_t v19 = [v6 userUUID];
    userUUID = v8->_userUUID;
    v8->_userUUID = (NSUUID *)v19;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_18524 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_18524, &__block_literal_global_18525);
  }
  v2 = (void *)logCategory__hmf_once_v2_18526;
  return v2;
}

void __31__HMDLocationEvent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_18526;
  logCategory__hmf_once_v2_18526 = v0;
}

@end