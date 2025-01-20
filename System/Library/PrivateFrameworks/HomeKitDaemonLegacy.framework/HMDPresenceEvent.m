@interface HMDPresenceEvent
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)_activate:(unint64_t)a3 completionHandler:(id)a4;
- (BOOL)_evaluateWithHomePresence:(id)a3 presenceType:(id)a4 users:(id)a5;
- (BOOL)compatibleWithUser:(id)a3;
- (BOOL)currentStatus;
- (BOOL)evaluateWithHomePresence:(id)a3;
- (BOOL)evaluateWithHomePresenceUpdate:(id)a3 presenceType:(id)a4;
- (BOOL)evaluateWithUserPresence:(id)a3 presenceType:(id)a4;
- (BOOL)isActive;
- (BOOL)isCompatibleWithEvent:(id)a3;
- (HMDEventTriggerExecutionSession)executionSession;
- (HMDFeaturesDataSource)featuresDataSource;
- (HMDPresenceEvent)initWithCoder:(id)a3;
- (HMDPresenceEvent)initWithModel:(id)a3 home:(id)a4;
- (HMDPresenceEvent)initWithModel:(id)a3 home:(id)a4 featuresDataSource:(id)a5;
- (HMPresenceEventActivation)activation;
- (NSArray)userUUIDs;
- (NSDictionary)users;
- (NSString)description;
- (NSString)presenceType;
- (id)_presenceTypeForClient;
- (id)analyticsPresenceEventData;
- (id)analyticsTriggerEventData;
- (id)createClientPayload;
- (id)createDaemonPayload;
- (id)createPresenceEventPayload:(BOOL)a3;
- (id)emptyModelObject;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (id)thisUser;
- (unint64_t)activationGranularity;
- (void)_addUser:(id)a3;
- (void)_evaluatePresenceEventForHomePresenceUpdate:(id)a3;
- (void)_handleHomePresenceUpdate:(id)a3;
- (void)_handleUpdateRequest:(id)a3;
- (void)_registerForMessages;
- (void)_removeAllUsers;
- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)_updateUsers:(id)a3 home:(id)a4;
- (void)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5 delegate:(id)a6;
- (void)dealloc;
- (void)didEndExecutionSession:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleRemovalOfUser:(id)a3 transaction:(id)a4;
- (void)setActivation:(id)a3;
- (void)setCurrentStatus:(BOOL)a3;
- (void)setExecutionSession:(id)a3;
- (void)setPresenceType:(id)a3;
- (void)setUserUUIDs:(id)a3;
- (void)setUsers:(id)a3;
@end

@implementation HMDPresenceEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_destroyWeak((id *)&self->_executionSession);
  objc_storeStrong((id *)&self->_userUUIDs, 0);
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_activation, 0);
  objc_storeStrong((id *)&self->_presenceType, 0);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 136, 1);
}

- (void)setExecutionSession:(id)a3
{
}

- (HMDEventTriggerExecutionSession)executionSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_executionSession);
  return (HMDEventTriggerExecutionSession *)WeakRetained;
}

- (void)setCurrentStatus:(BOOL)a3
{
  self->_currentStatus = a3;
}

- (BOOL)currentStatus
{
  return self->_currentStatus;
}

- (void)setUserUUIDs:(id)a3
{
}

- (NSArray)userUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setUsers:(id)a3
{
}

- (NSDictionary)users
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setActivation:(id)a3
{
}

- (HMPresenceEventActivation)activation
{
  return self->_activation;
}

- (void)setPresenceType:(id)a3
{
}

- (NSString)presenceType
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (id)analyticsPresenceEventData
{
  v3 = objc_alloc_init(HMDAnalyticsPresenceEventData);
  v4 = [(HMDPresenceEvent *)self presenceType];
  if ([v4 isEqualToString:*MEMORY[0x1E4F2DCC8]])
  {
    uint64_t v5 = 1;
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F2DCD0]])
  {
    uint64_t v5 = 2;
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F2DCA8]])
  {
    uint64_t v5 = 3;
  }
  else
  {
    if (![v4 isEqualToString:*MEMORY[0x1E4F2DCC0]]) {
      goto LABEL_10;
    }
    uint64_t v5 = 4;
  }
  [(HMDAnalyticsPresenceEventData *)v3 setPresenceEventType:v5];
LABEL_10:

  return v3;
}

- (id)analyticsTriggerEventData
{
  v3 = objc_alloc_init(HMDAnalyticsTriggerEventData);
  [(HMDAnalyticsTriggerEventData *)v3 setEndEvent:[(HMDEvent *)self isEndEvent]];
  v4 = [(HMDPresenceEvent *)self analyticsPresenceEventData];
  [(HMDAnalyticsTriggerEventData *)v3 setPresenceEvent:v4];
  unint64_t v5 = [(HMDPresenceEvent *)self activationGranularity];
  v6 = [(HMDAnalyticsTriggerEventData *)v3 presenceEvent];
  [v6 setPresenceEventGranularity:v5];

  return v3;
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1D9452090]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v48 = v13;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling transaction updated", buf, 0xCu);
  }
  id v14 = v8;
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
    os_unfair_lock_t lock = &v11->_lock;
    os_unfair_lock_lock_with_options();
    if ([v16 propertyWasSet:@"presenceType"]
      && ([(HMDPresenceEvent *)v11 presenceType],
          v17 = objc_claimAutoreleasedReturnValue(),
          [v16 presenceType],
          v18 = objc_claimAutoreleasedReturnValue(),
          char v19 = HMFEqualObjects(),
          v18,
          v17,
          (v19 & 1) == 0))
    {
      v21 = (void *)MEMORY[0x1D9452090]();
      v22 = v11;
      HMFGetOSLogHandle();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = [(HMDPresenceEvent *)v22 presenceType];
        v26 = [v16 presenceType];
        *(_DWORD *)buf = 138543874;
        id v48 = v24;
        __int16 v49 = 2112;
        v50 = v25;
        __int16 v51 = 2112;
        v52 = v26;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating presence type from %@ to %@", buf, 0x20u);
      }
      v27 = [v16 presenceType];
      [(HMDPresenceEvent *)v22 setPresenceType:v27];

      char v20 = 1;
    }
    else
    {
      char v20 = 0;
    }
    v28 = [(HMDEvent *)v11 eventTrigger];
    if ([v16 propertyWasSet:@"users"])
    {
      v29 = (void *)MEMORY[0x1E4F1CAD0];
      v30 = [(HMDPresenceEvent *)v11 userUUIDs];
      v31 = [v29 setWithArray:v30];

      v32 = (void *)MEMORY[0x1E4F1CAD0];
      v33 = [v16 users];
      v34 = [v32 setWithArray:v33];

      if (([v31 isEqualToSet:v34] & 1) == 0)
      {
        v35 = [v16 users];
        v36 = [v28 home];
        [(HMDPresenceEvent *)v11 _updateUsers:v35 home:v36];

        char v20 = 1;
      }
    }
    if (![v16 propertyWasSet:@"activation"]) {
      goto LABEL_19;
    }
    v37 = [(HMDPresenceEvent *)v11 activation];
    v38 = [v37 number];
    v39 = [v16 activation];
    char v40 = HMFEqualObjects();

    if ((v40 & 1) == 0)
    {
      v41 = (void *)MEMORY[0x1E4F2EA30];
      v42 = [v16 activation];
      v43 = [v41 activationGranularityWithNumber:v42];
      [(HMDPresenceEvent *)v11 setActivation:v43];

      os_unfair_lock_unlock(locka);
    }
    else
    {
LABEL_19:
      os_unfair_lock_unlock(locka);
      if ((v20 & 1) == 0) {
        goto LABEL_23;
      }
    }
    [v28 markChangedForMessage:v9];
LABEL_23:
    [v9 respondWithSuccess];
  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  unint64_t v5 = [HMDPresenceEventModel alloc];
  v6 = [(HMDEvent *)self uuid];
  v7 = [(HMDEvent *)self eventTrigger];
  id v8 = [v7 uuid];
  id v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  [(HMDPresenceEventModel *)v9 setEndEvent:v10];

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v12 = [(HMDPresenceEvent *)self presenceType];
  [(HMDPresenceEventModel *)v9 setPresenceType:v12];

  v13 = [(HMDPresenceEvent *)self userUUIDs];
  [(HMDPresenceEventModel *)v9 setUsers:v13];

  id v14 = [(HMDPresenceEvent *)self activation];
  v15 = [v14 number];
  [(HMDPresenceEventModel *)v9 setActivation:v15];

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)_presenceTypeForClient
{
  v3 = [(HMDPresenceEvent *)self presenceType];
  uint64_t v4 = *MEMORY[0x1E4F2DCC8];
  if (([v3 isEqualToString:*MEMORY[0x1E4F2DCC8]] & 1) != 0
    || [v3 isEqualToString:*MEMORY[0x1E4F2DCD0]])
  {
    unint64_t v5 = [(HMDPresenceEvent *)self userUUIDs];
    if ([v5 count] != 1) {
      goto LABEL_10;
    }
    v6 = [v5 firstObject];
    v7 = [(HMDPresenceEvent *)self thisUser];
    id v8 = [v7 uuid];
    id v9 = [v8 UUIDString];
    int v10 = [v6 isEqualToString:v9];

    if (!v10) {
      goto LABEL_10;
    }
    if ([v3 isEqualToString:v4])
    {
      v11 = (id *)MEMORY[0x1E4F2DCB0];
    }
    else
    {
      if (![v3 isEqualToString:*MEMORY[0x1E4F2DCD0]])
      {
LABEL_10:

        goto LABEL_11;
      }
      v11 = (id *)MEMORY[0x1E4F2DCB8];
    }
    id v12 = *v11;

    v3 = v12;
    goto LABEL_10;
  }
LABEL_11:
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v19 = self;
  v24.receiver = self;
  v24.super_class = (Class)HMDPresenceEvent;
  [(HMDEvent *)&v24 encodeWithCoder:v4];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v18 = [(HMDPresenceEvent *)self presenceType];
  v17 = [(HMDPresenceEvent *)self users];
  if (!objc_msgSend(v4, "hmd_isForNonAdminSharedUser"))
  {
    if (objc_msgSend(v4, "hmd_isForXPCTransport", lock))
    {
      unint64_t v5 = [(HMDPresenceEvent *)self _presenceTypeForClient];
      [v4 encodeObject:v5 forKey:@"kPresenceEventPresence"];
      if (objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess")
        && usersListApplicable())
      {
        v13 = [v17 allValues];
        [v4 encodeObject:v13 forKey:@"kPresenceEventUsers"];
      }
    }
    else
    {
      [v4 encodeObject:v18 forKey:@"kPresenceEventPresence"];
      unint64_t v5 = [v17 allValues];
      [v4 encodeObject:v5 forKey:@"kPresenceEventUsers"];
    }
    goto LABEL_19;
  }
  objc_msgSend(v4, "encodeObject:forKey:", v18, @"kPresenceEventPresence", lock);
  if (([v18 isEqualToString:*MEMORY[0x1E4F2DCC8]] & 1) != 0
    || [v18 isEqualToString:*MEMORY[0x1E4F2DCD0]])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    unint64_t v5 = [v17 allValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          int v10 = objc_msgSend(v4, "hmd_user");
          int v11 = [v9 isEqual:v10];

          if (v11)
          {
            v25 = v9;
            id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
            [v4 encodeObject:v12 forKey:@"kPresenceEventUsers"];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v6);
    }
LABEL_19:
  }
  os_unfair_lock_unlock(locka);
  id v14 = [(HMDPresenceEvent *)v19 activation];
  [v14 addToCoder:v4];
}

- (HMDPresenceEvent)initWithCoder:(id)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)HMDPresenceEvent;
  unint64_t v5 = [(HMDEvent *)&v40 initWithCoder:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPresenceEventPresence"];
    presenceType = v6->_presenceType;
    v6->_presenceType = (NSString *)v7;

    uint64_t v9 = [MEMORY[0x1E4F2EA30] activationGranularityWithCoder:v4];
    activation = v6->_activation;
    v6->_activation = (HMPresenceEventActivation *)v9;

    int v11 = (void *)MEMORY[0x1E4F1CAD0];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    v13 = [v11 setWithArray:v12];
    id v35 = v4;
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kPresenceEventUsers"];

    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    id v16 = [MEMORY[0x1E4F1CA48] array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v34 = (void *)v14;
    v17 = +[HMDHome filterUsersSupportingPresence:v14];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          long long v23 = [v22 uuid];
          objc_super v24 = [v23 UUIDString];
          [v16 addObject:v24];

          v25 = [v22 uuid];
          v26 = [v25 UUIDString];
          [v15 setObject:v22 forKeyedSubscript:v26];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v19);
    }

    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithArray:v16];
    userUUIDs = v6->_userUUIDs;
    v6->_userUUIDs = (NSArray *)v27;

    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v15];
    users = v6->_users;
    v6->_users = (NSDictionary *)v29;

    v31 = objc_alloc_init(HMDFeaturesDataSource);
    featuresDataSource = v6->_featuresDataSource;
    v6->_featuresDataSource = v31;

    id v4 = v35;
  }

  return v6;
}

- (void)handleRemovalOfUser:(id)a3 transaction:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  uint64_t v7 = [(HMDPresenceEvent *)self users];
  id v8 = [v17 uuid];
  uint64_t v9 = [v8 UUIDString];
  int v10 = [v7 objectForKeyedSubscript:v9];

  if (v10)
  {
    int v11 = [(HMDPresenceEvent *)self userUUIDs];
    id v12 = (void *)[v11 mutableCopy];

    v13 = [v17 uuid];
    uint64_t v14 = [v13 UUIDString];
    [v12 removeObject:v14];

    v15 = [(HMDPresenceEvent *)self emptyModelObject];
    id v16 = (void *)[v12 copy];
    [v15 setUsers:v16];

    [v6 add:v15];
  }
}

- (void)_addUser:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HMDPresenceEvent *)self users];
  id v14 = (id)[v5 mutableCopy];

  id v6 = [v4 uuid];
  uint64_t v7 = [v6 UUIDString];
  [v14 setObject:v4 forKeyedSubscript:v7];

  id v8 = (void *)[v14 copy];
  [(HMDPresenceEvent *)self setUsers:v8];

  uint64_t v9 = [(HMDPresenceEvent *)self userUUIDs];
  int v10 = (void *)[v9 mutableCopy];

  int v11 = [v4 uuid];

  id v12 = [v11 UUIDString];
  [v10 addObject:v12];

  v13 = (void *)[v10 copy];
  [(HMDPresenceEvent *)self setUserUUIDs:v13];
}

- (void)_removeAllUsers
{
  v3 = [MEMORY[0x1E4F1C9E8] dictionary];
  [(HMDPresenceEvent *)self setUsers:v3];

  id v4 = [MEMORY[0x1E4F1C978] array];
  [(HMDPresenceEvent *)self setUserUUIDs:v4];
}

- (void)_updateUsers:(id)a3 home:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(HMDPresenceEvent *)self _removeAllUsers];
  long long v22 = v7;
  id v8 = [v7 usersSupportingPresence];
  uint64_t v9 = (void *)MEMORY[0x1D9452090]();
  int v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v12;
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    v33 = v8;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating users: %@, %@", buf, 0x20u);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v19 = [v18 uuid];
        uint64_t v20 = [v19 UUIDString];
        int v21 = [v6 containsObject:v20];

        if (v21) {
          [(HMDPresenceEvent *)v10 _addUser:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }
}

- (void)_handleUpdateRequest:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 stringForKey:@"kPresenceEventPresence"];
  uint64_t v6 = [v4 arrayForKey:@"kPresenceEventUsers"];
  if (v5 | v6)
  {
    uint64_t v14 = [(HMDPresenceEvent *)self emptyModelObject];
    uint64_t v15 = [(HMDEvent *)self eventTrigger];
    uint64_t v16 = [v15 home];

    if (v5)
    {
      [v14 setPresenceType:v5];
      if (([(id)v5 isEqualToString:*MEMORY[0x1E4F2DCB0]] & 1) != 0
        || [(id)v5 isEqualToString:*MEMORY[0x1E4F2DCB8]])
      {
        id v17 = [v16 currentUser];
        uint64_t v18 = [v17 uuid];
        uint64_t v19 = [v18 UUIDString];
        long long v25 = v19;
        uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
        [v14 setUsers:v20];
      }
    }
    if (v6) {
      [v14 setUsers:v6];
    }
    int v21 = [v16 backingStore];
    long long v22 = [v4 name];
    long long v23 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    long long v24 = [v21 transaction:v22 options:v23];

    [v24 add:v14 withMessage:v4];
    [v24 run];
  }
  else
  {
    id v7 = [v4 responseHandler];

    if (v7)
    {
      id v8 = [v4 responseHandler];
      uint64_t v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
      ((void (**)(void, void *, void))v8)[2](v8, v9, 0);
    }
    int v10 = (void *)MEMORY[0x1D9452090]();
    int v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to update Presence event as parameters are NIL", buf, 0xCu);
    }
  }
}

- (BOOL)compatibleWithUser:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(HMDPresenceEvent *)self presenceType];
  if (([v5 isEqualToString:*MEMORY[0x1E4F2DCB0]] & 1) != 0
    || [v5 isEqualToString:*MEMORY[0x1E4F2DCB8]])
  {
    uint64_t v6 = [(HMDPresenceEvent *)self thisUser];
    LOBYTE(v7) = HMFEqualObjects();
  }
  else if (([v5 isEqualToString:*MEMORY[0x1E4F2DCA8]] & 1) != 0 {
         || ([v5 isEqualToString:*MEMORY[0x1E4F2DCC0]] & 1) != 0)
  }
  {
    LOBYTE(v7) = 1;
  }
  else if (([v5 isEqualToString:*MEMORY[0x1E4F2DCC8]] & 1) != 0 {
         || [v5 isEqualToString:*MEMORY[0x1E4F2DCD0]])
  }
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v14 = [(HMDPresenceEvent *)self users];
    uint64_t v15 = [v14 allValues];

    uint64_t v7 = [v15 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v7)
    {
      uint64_t v16 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v15);
          }
          if ([*(id *)(*((void *)&v18 + 1) + 8 * i) isEqual:v4])
          {
            LOBYTE(v7) = 1;
            goto LABEL_22;
          }
        }
        uint64_t v7 = [v15 countByEnumeratingWithState:&v18 objects:v28 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  os_unfair_lock_unlock(&self->_lock);
  id v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    id v12 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    long long v23 = v11;
    __int16 v24 = 2112;
    id v25 = v4;
    __int16 v26 = 2112;
    uint64_t v27 = v12;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Checking if the username %@ is compatible: %@", buf, 0x20u);
  }

  return v7;
}

- (BOOL)evaluateWithHomePresence:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(HMDPresenceEvent *)self presenceType];
  uint64_t v6 = [(HMDPresenceEvent *)self users];
  os_unfair_lock_unlock(&self->_lock);
  LOBYTE(self) = [(HMDPresenceEvent *)self _evaluateWithHomePresence:v4 presenceType:v5 users:v6];

  return (char)self;
}

- (BOOL)_evaluateWithHomePresence:(id)a3 presenceType:(id)a4 users:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:*MEMORY[0x1E4F2DCB0]])
  {
    int v11 = [(HMDPresenceEvent *)self thisUser];
    char v12 = [v8 isUserAtHome:v11];
  }
  else
  {
    if (![v9 isEqualToString:*MEMORY[0x1E4F2DCB8]])
    {
      if ([v9 isEqualToString:*MEMORY[0x1E4F2DCA8]])
      {
        char v15 = [v8 isAnyUserAtHome];
      }
      else
      {
        if (![v9 isEqualToString:*MEMORY[0x1E4F2DCC0]])
        {
          if ([v9 isEqualToString:*MEMORY[0x1E4F2DCC8]])
          {
            int v11 = [v10 allValues];
            char v12 = [v8 areUsersAtHome:v11];
          }
          else
          {
            if (![v9 isEqualToString:*MEMORY[0x1E4F2DCD0]])
            {
              BOOL v13 = 0;
              goto LABEL_6;
            }
            int v11 = [v10 allValues];
            char v12 = [v8 areUsersNotAtHome:v11];
          }
          goto LABEL_5;
        }
        char v15 = [v8 isNoUserAtHome];
      }
      BOOL v13 = v15;
      goto LABEL_6;
    }
    int v11 = [(HMDPresenceEvent *)self thisUser];
    char v12 = [v8 isUserNotAtHome:v11];
  }
LABEL_5:
  BOOL v13 = v12;

LABEL_6:
  return v13;
}

- (BOOL)evaluateWithUserPresence:(id)a3 presenceType:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v7 isEqualToString:*MEMORY[0x1E4F2DCB0]] & 1) == 0
    && ([v7 isEqualToString:*MEMORY[0x1E4F2DCA8]] & 1) == 0
    && ![v7 isEqualToString:*MEMORY[0x1E4F2DCC8]])
  {
    if ((([v7 isEqualToString:*MEMORY[0x1E4F2DCB8]] & 1) != 0
       || ([v7 isEqualToString:*MEMORY[0x1E4F2DCC0]] & 1) != 0
       || [v7 isEqualToString:*MEMORY[0x1E4F2DCD0]])
      && [v6 isNotAtHome])
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      uint64_t v14 = self;
      id v10 = HMFGetOSLogHandle();
      BOOL v11 = 1;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      char v12 = HMFGetLogIdentifier();
      int v18 = 138543362;
      long long v19 = v12;
      BOOL v13 = "%{public}@User presence in the update is leaving home";
      goto LABEL_7;
    }
    goto LABEL_14;
  }
  if (![v6 isAtHome])
  {
LABEL_14:
    id v8 = (void *)MEMORY[0x1D9452090]();
    char v15 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v18 = 138543362;
      long long v19 = v16;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Returning result to not fire event", (uint8_t *)&v18, 0xCu);
    }
    BOOL v11 = 0;
    goto LABEL_17;
  }
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  BOOL v11 = 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    char v12 = HMFGetLogIdentifier();
    int v18 = 138543362;
    long long v19 = v12;
    BOOL v13 = "%{public}@User presence in the update is arriving home";
LABEL_7:
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v18, 0xCu);
  }
LABEL_17:

  return v11;
}

- (BOOL)evaluateWithHomePresenceUpdate:(id)a3 presenceType:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    BOOL v11 = HMFGetLogIdentifier();
    char v12 = [(HMDPresenceEvent *)v9 activation];
    int v17 = 138543874;
    int v18 = v11;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    long long v22 = v12;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Evaluating with homePresenceUpdate %@, activation is set to %@", (uint8_t *)&v17, 0x20u);
  }
  if ([(HMDPresenceEvent *)v9 activationGranularity] == 1)
  {
    BOOL v13 = [v6 userPresence];
    BOOL v14 = [(HMDPresenceEvent *)v9 evaluateWithUserPresence:v13 presenceType:v7];
  }
  else
  {
    BOOL v13 = [v6 homePresence];
    BOOL v14 = [(HMDPresenceEvent *)v9 evaluateWithHomePresence:v13];
  }
  BOOL v15 = v14;

  return v15;
}

- (void)didEndExecutionSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDEvent *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__HMDPresenceEvent_didEndExecutionSession___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__HMDPresenceEvent_didEndExecutionSession___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) executionSession];
  v3 = *(void **)(a1 + 40);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v2 == v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      char v12 = v10;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating the current status to YES after the execution session is complete", (uint8_t *)&v11, 0xCu);
    }
    if ([*(id *)(a1 + 32) activationGranularity] != 1) {
      [*(id *)(a1 + 32) setCurrentStatus:1];
    }
    [*(id *)(a1 + 32) setExecutionSession:0];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 138543618;
      char v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Received a callback that execution session %@ has ended, but is not known session", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDPresenceEvent;
  return [(HMDEvent *)&v4 isCompatibleWithEvent:a3];
}

- (void)_evaluatePresenceEventForHomePresenceUpdate:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDEvent *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDEvent *)self activationType] > 1)
  {
    if (!v4
      || ([v4 homePresence], int v11 = objc_claimAutoreleasedReturnValue(), v11, !v11))
    {
      id v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = self;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        long long v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v91 = v22;
        __int16 v92 = 2112;
        id v93 = v4;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received home presence update is nil: %@", buf, 0x16u);
      }
      goto LABEL_4;
    }
    char v12 = [(HMDEvent *)self eventTrigger];
    __int16 v13 = [v12 home];

    uint64_t v14 = [v4 homePresence];
    uint64_t v15 = [v14 home];

    if (v15 != v13)
    {
      uint64_t v16 = (void *)MEMORY[0x1D9452090]();
      int v17 = self;
      int v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        __int16 v19 = HMFGetLogIdentifier();
        id v20 = [v4 homePresence];
        __int16 v21 = [v20 home];
        *(_DWORD *)buf = 138543874;
        v91 = v19;
        __int16 v92 = 2112;
        id v93 = v21;
        __int16 v94 = 2112;
        v95 = v13;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Received home presence update, homes are not matching: %@, ours: %@", buf, 0x20u);
      }
      goto LABEL_67;
    }
    os_unfair_lock_lock_with_options();
    uint64_t v23 = [(HMDPresenceEvent *)self presenceType];
    v89 = [(HMDPresenceEvent *)self users];
    os_unfair_lock_unlock(&self->_lock);
    if ([(HMDPresenceEvent *)self activationGranularity] != 1) {
      goto LABEL_23;
    }
    if (([v4 isUpdate] & 1) == 0)
    {
      __int16 v49 = (void *)MEMORY[0x1D9452090]();
      v50 = self;
      __int16 v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        v52 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v91 = v52;
        _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_INFO, "%{public}@Home presence is not an update", buf, 0xCu);
      }
      goto LABEL_66;
    }
    __int16 v24 = [v4 userPresence];
    if (v24)
    {
      if (([v23 isEqualToString:*MEMORY[0x1E4F2DCB0]] & 1) == 0
        && ([v23 isEqualToString:*MEMORY[0x1E4F2DCC8]] & 1) == 0
        && ([v23 isEqualToString:*MEMORY[0x1E4F2DCB8]] & 1) == 0
        && ![v23 isEqualToString:*MEMORY[0x1E4F2DCD0]]
        || ([v89 allValues],
            id v25 = objc_claimAutoreleasedReturnValue(),
            [v24 user],
            __int16 v26 = objc_claimAutoreleasedReturnValue(),
            char v27 = [v25 containsObject:v26],
            v26,
            v25,
            (v27 & 1) != 0))
      {

LABEL_23:
        BOOL v28 = [(HMDPresenceEvent *)self evaluateWithHomePresenceUpdate:v4 presenceType:v23];
        uint64_t v29 = (void *)MEMORY[0x1D9452090]();
        __int16 v30 = self;
        id v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          __int16 v32 = HMFGetLogIdentifier();
          v33 = HMFBooleanToString();
          *(_DWORD *)buf = 138543618;
          v91 = v32;
          __int16 v92 = 2112;
          id v93 = v33;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Evaluated status: %@", buf, 0x16u);
        }
        v88 = [(HMDEvent *)v30 delegate];
        uint64_t v34 = [(HMDPresenceEvent *)v30 executionSession];
        if (v34)
        {
          id v35 = (void *)MEMORY[0x1D9452090]();
          long long v36 = v30;
          long long v37 = HMFGetOSLogHandle();
          BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);
          if (v28)
          {
            if (v38)
            {
              long long v39 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v91 = v39;
              __int16 v92 = 2112;
              id v93 = v34;
              _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Execution session %@ is already underway, no need to create another one", buf, 0x16u);
            }
            objc_super v40 = [HMDEventTriggerDevice alloc];
            v41 = [v4 causingDevice];
            v42 = [(HMDEventTriggerDevice *)v40 initWithDevice:v41 forHome:v13];

            v43 = [v88 didOccurEvent:v36 causingDevice:v42];
            v44 = (void *)MEMORY[0x1D9452090]();
            v45 = v36;
            id v46 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              v47 = HMFGetLogIdentifier();
              id v48 = @"Added";
              *(_DWORD *)buf = 138544130;
              v91 = v47;
              if (!v43) {
                id v48 = @"Did not add";
              }
              __int16 v92 = 2112;
              id v93 = v48;
              __int16 v94 = 2112;
              v95 = v43;
              __int16 v96 = 2112;
              v97 = v42;
              _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_INFO, "%{public}@%@ device to execution session %@, device %@", buf, 0x2Au);
            }
          }
          else
          {
            if (v38)
            {
              v65 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v91 = v65;
              __int16 v92 = 2112;
              id v93 = v34;
              _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Evaluated status is changing to NO, resetting the execution session %@", buf, 0x16u);
            }
            [v34 cancelSessionIfWaitingForUserResponse];
            [(HMDPresenceEvent *)v36 setExecutionSession:0];
            [(HMDPresenceEvent *)v36 setCurrentStatus:0];
          }
        }
        else if (v28 == [(HMDPresenceEvent *)v30 currentStatus])
        {
          v66 = (void *)MEMORY[0x1D9452090]();
          v67 = v30;
          v68 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            v69 = HMFGetLogIdentifier();
            [(HMDPresenceEvent *)v67 currentStatus];
            v70 = HMFBooleanToString();
            *(_DWORD *)buf = 138543618;
            v91 = v69;
            __int16 v92 = 2112;
            id v93 = v70;
            _os_log_impl(&dword_1D49D5000, v68, OS_LOG_TYPE_INFO, "%{public}@Current status is not changing from %@", buf, 0x16u);
          }
        }
        else if ([v4 isUpdate])
        {
          if (v28)
          {
            uint64_t v53 = [HMDEventTriggerDevice alloc];
            v54 = [v4 causingDevice];
            v55 = [(HMDEventTriggerDevice *)v53 initWithDevice:v54 forHome:v13];

            v56 = [v88 didOccurEvent:v30 causingDevice:v55];
            v57 = (void *)MEMORY[0x1D9452090]([(HMDPresenceEvent *)v30 setExecutionSession:v56]);
            v58 = v30;
            v59 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              v60 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v91 = v60;
              __int16 v92 = 2112;
              id v93 = v56;
              __int16 v94 = 2112;
              v95 = v55;
              _os_log_impl(&dword_1D49D5000, v59, OS_LOG_TYPE_INFO, "%{public}@Created execution session %@ with triggerDevice: %@", buf, 0x20u);
            }
            if (!v56)
            {
              v61 = (void *)MEMORY[0x1D9452090]();
              v62 = v58;
              v63 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
              {
                v64 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v91 = v64;
                _os_log_impl(&dword_1D49D5000, v63, OS_LOG_TYPE_INFO, "%{public}@Could not create execution session, updating the current status to YES", buf, 0xCu);
              }
              if ([(HMDPresenceEvent *)v62 activationGranularity] != 1) {
                [(HMDPresenceEvent *)v62 setCurrentStatus:1];
              }
            }
          }
          else
          {
            v83 = (void *)MEMORY[0x1D9452090]();
            v84 = v30;
            v85 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
            {
              v86 = HMFGetLogIdentifier();
              v87 = [(HMDPresenceEvent *)v84 executionSession];
              *(_DWORD *)buf = 138543618;
              v91 = v86;
              __int16 v92 = 2112;
              id v93 = v87;
              _os_log_impl(&dword_1D49D5000, v85, OS_LOG_TYPE_INFO, "%{public}@This event is moving to inactive state, current execution session %@", buf, 0x16u);
            }
            [(HMDPresenceEvent *)v84 setCurrentStatus:0];
          }
        }
        else
        {
          v77 = (void *)MEMORY[0x1D9452090]();
          v78 = v30;
          v79 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            v80 = HMFGetLogIdentifier();
            [(HMDPresenceEvent *)v78 currentStatus];
            v81 = HMFBooleanToString();
            HMFBooleanToString();
            v82 = (HMDEventTriggerDevice *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v91 = v80;
            __int16 v92 = 2112;
            id v93 = v81;
            __int16 v94 = 2112;
            v95 = v82;
            _os_log_impl(&dword_1D49D5000, v79, OS_LOG_TYPE_INFO, "%{public}@Evaluation status is changing from %@ to %@", buf, 0x20u);
          }
          [(HMDPresenceEvent *)v78 setCurrentStatus:v28];
        }

        goto LABEL_66;
      }
      v71 = (void *)MEMORY[0x1D9452090]();
      v75 = self;
      v73 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        v76 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v91 = v76;
        __int16 v92 = 2112;
        id v93 = v75;
        _os_log_impl(&dword_1D49D5000, v73, OS_LOG_TYPE_INFO, "%{public}@User presence in the update is not relevant to the user in this event: %@", buf, 0x16u);
      }
    }
    else
    {
      v71 = (void *)MEMORY[0x1D9452090]();
      v72 = self;
      v73 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        v74 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v91 = v74;
        _os_log_impl(&dword_1D49D5000, v73, OS_LOG_TYPE_INFO, "%{public}@User Presence is nil, not firing event", buf, 0xCu);
      }
    }

LABEL_66:

LABEL_67:
    goto LABEL_68;
  }
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    id v10 = HMDEventTriggerActivationTypeAsString([(HMDEvent *)v7 activationType]);
    *(_DWORD *)buf = 138543618;
    v91 = v9;
    __int16 v92 = 2112;
    id v93 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Ignoring the home presence update since the activation type is %@", buf, 0x16u);
  }
LABEL_4:

LABEL_68:
}

- (void)_handleHomePresenceUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDEvent *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HMDPresenceEvent__handleHomePresenceUpdate___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__HMDPresenceEvent__handleHomePresenceUpdate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 objectForKeyedSubscript:@"HMDHomePresenceUpdateKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  [*(id *)(a1 + 40) _evaluatePresenceEventForHomePresenceUpdate:v5];
}

- (BOOL)_activate:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(HMDEvent *)self isConfigured])
  {
    v18.receiver = self;
    v18.super_class = (Class)HMDPresenceEvent;
    BOOL v7 = [(HMDEvent *)&v18 _activate:a3 completionHandler:v6];
    id v8 = [(HMDEvent *)self workQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __48__HMDPresenceEvent__activate_completionHandler___block_invoke;
    v16[3] = &unk_1E6A19B58;
    v16[4] = self;
    BOOL v17 = v7;
    dispatch_async(v8, v16);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      char v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v20 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Ignoring request to activate since event hasn't been configured", buf, 0xCu);
    }
    __int16 v13 = (void (**)(void *, void *))_Block_copy(v6);
    if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
      v13[2](v13, v14);
    }
    BOOL v7 = 0;
  }

  return v7;
}

void __48__HMDPresenceEvent__activate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 32) activationType];
  if (v2 - 2 < 2)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      id v4 = (void *)MEMORY[0x1D9452090]();
      id v5 = *(id *)(a1 + 32);
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        BOOL v7 = HMFGetLogIdentifier();
        id v8 = HMDEventTriggerActivationTypeAsString([*(id *)(a1 + 32) activationType]);
        int v13 = 138543618;
        uint64_t v14 = v7;
        __int16 v15 = 2112;
        uint64_t v16 = v8;
        _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Activation is changing to %@, initializing the current status", (uint8_t *)&v13, 0x16u);
      }
      uint64_t v9 = [*(id *)(a1 + 32) eventTrigger];
      id v10 = [v9 home];
      int v11 = [v10 presenceMonitor];
      char v12 = [v11 homePresenceUpdate];

      [*(id *)(a1 + 32) _evaluatePresenceEventForHomePresenceUpdate:v12];
    }
  }
  else if (v2 <= 1)
  {
    [*(id *)(a1 + 32) setCurrentStatus:0];
    v3 = *(void **)(a1 + 32);
    [v3 setExecutionSession:0];
  }
}

- (BOOL)isActive
{
  return ([(HMDEvent *)self activationType] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_registerForMessages
{
  v5.receiver = self;
  v5.super_class = (Class)HMDPresenceEvent;
  [(HMDEvent *)&v5 _registerForMessages];
  v3 = [(HMDEvent *)self home];
  id v4 = [v3 notificationCenter];
  [v4 addObserver:self selector:sel__handleHomePresenceUpdate_ name:@"HMDHomePresenceUpdateNotification" object:0];
}

- (unint64_t)activationGranularity
{
  v3 = [(HMDPresenceEvent *)self activation];

  if (!v3) {
    return 2;
  }
  id v4 = [(HMDPresenceEvent *)self activation];
  unint64_t v5 = [v4 value];

  return v5;
}

- (id)thisUser
{
  unint64_t v2 = [(HMDEvent *)self home];
  v3 = [v2 currentUser];

  return v3;
}

- (id)emptyModelObject
{
  v3 = [HMDPresenceEventModel alloc];
  id v4 = [(HMDEvent *)self uuid];
  unint64_t v5 = [(HMDEvent *)self eventTrigger];
  id v6 = [v5 uuid];
  BOOL v7 = [(HMDBackingStoreModelObject *)v3 initWithObjectChangeType:2 uuid:v4 parentUUID:v6];

  return v7;
}

- (id)createClientPayload
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v11.receiver = self;
  v11.super_class = (Class)HMDPresenceEvent;
  id v4 = [(HMDEvent *)&v11 createPayload];
  unint64_t v5 = [v3 dictionaryWithDictionary:v4];

  os_unfair_lock_lock_with_options();
  id v6 = [(HMDPresenceEvent *)self _presenceTypeForClient];
  [v5 setObject:v6 forKeyedSubscript:@"kPresenceEventPresence"];
  BOOL v7 = [(HMDPresenceEvent *)self userUUIDs];
  [v5 setObject:v7 forKeyedSubscript:@"kPresenceEventUsers"];

  os_unfair_lock_unlock(&self->_lock);
  id v8 = [(HMDPresenceEvent *)self activation];
  [v8 addToPayload:v5];

  uint64_t v9 = (void *)[v5 copy];
  return v9;
}

- (id)createDaemonPayload
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v11.receiver = self;
  v11.super_class = (Class)HMDPresenceEvent;
  id v4 = [(HMDEvent *)&v11 createPayload];
  unint64_t v5 = [v3 dictionaryWithDictionary:v4];

  os_unfair_lock_lock_with_options();
  id v6 = [(HMDPresenceEvent *)self presenceType];
  [v5 setObject:v6 forKeyedSubscript:@"kPresenceEventPresence"];

  BOOL v7 = [(HMDPresenceEvent *)self userUUIDs];
  [v5 setObject:v7 forKeyedSubscript:@"kPresenceEventUsers"];

  os_unfair_lock_unlock(&self->_lock);
  id v8 = [(HMDPresenceEvent *)self activation];
  [v8 addToPayload:v5];

  uint64_t v9 = (void *)[v5 copy];
  return v9;
}

- (id)createPresenceEventPayload:(BOOL)a3
{
  if (a3) {
    [(HMDPresenceEvent *)self createDaemonPayload];
  }
  else {
  v3 = [(HMDPresenceEvent *)self createClientPayload];
  }
  return v3;
}

- (void)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HMDPresenceEvent;
  [(HMDEvent *)&v16 configure:v10 messageDispatcher:v11 queue:v12 delegate:v13];
  uint64_t v14 = [v10 home];
  os_unfair_lock_lock_with_options();
  __int16 v15 = [(HMDPresenceEvent *)self userUUIDs];
  [(HMDPresenceEvent *)self _updateUsers:v15 home:v14];

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)description
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMDPresenceEvent *)self presenceType];
  unint64_t v5 = [(HMDPresenceEvent *)self users];
  os_unfair_lock_unlock(p_lock);
  id v6 = [MEMORY[0x1E4F28E78] stringWithFormat:@"type: %@", v4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        [v6 appendString:@", "];
        [v6 appendString:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  id v12 = NSString;
  v17.receiver = self;
  v17.super_class = (Class)HMDPresenceEvent;
  id v13 = [(HMDEvent *)&v17 description];
  uint64_t v14 = [(HMDPresenceEvent *)self activation];
  __int16 v15 = [v12 stringWithFormat:@"[Presence-Event: %@, %@, %@]", v13, v6, v14];

  return (NSString *)v15;
}

- (void)dealloc
{
  v3 = [(HMDEvent *)self home];
  id v4 = [v3 notificationCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)HMDPresenceEvent;
  [(HMDPresenceEvent *)&v5 dealloc];
}

- (HMDPresenceEvent)initWithModel:(id)a3 home:(id)a4 featuresDataSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HMDPresenceEvent;
  uint64_t v11 = [(HMDEvent *)&v25 initWithModel:v8 home:v9];
  id v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    uint64_t v13 = [v8 presenceType];
    presenceType = v12->_presenceType;
    v12->_presenceType = (NSString *)v13;

    __int16 v15 = (void *)MEMORY[0x1E4F2EA30];
    objc_super v16 = [v8 activation];
    uint64_t v17 = [v15 activationGranularityWithNumber:v16];
    activation = v12->_activation;
    v12->_activation = (HMPresenceEventActivation *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1C978] array];
    userUUIDs = v12->_userUUIDs;
    v12->_userUUIDs = (NSArray *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionary];
    users = v12->_users;
    v12->_users = (NSDictionary *)v21;

    objc_storeStrong((id *)&v12->_featuresDataSource, a5);
    os_unfair_lock_lock_with_options();
    uint64_t v23 = [v8 users];
    [(HMDPresenceEvent *)v12 _updateUsers:v23 home:v9];

    os_unfair_lock_unlock(&v12->_lock);
  }

  return v12;
}

- (HMDPresenceEvent)initWithModel:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(HMDFeaturesDataSource);
  id v9 = [(HMDPresenceEvent *)self initWithModel:v7 home:v6 featuresDataSource:v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5 != -1) {
    dispatch_once(&logCategory__hmf_once_t5, &__block_literal_global_30583);
  }
  unint64_t v2 = (void *)logCategory__hmf_once_v6;
  return v2;
}

uint64_t __31__HMDPresenceEvent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v6;
  logCategory__hmf_once_id v6 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end