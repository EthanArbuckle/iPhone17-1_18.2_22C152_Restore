@interface HMSymptomsHandler
+ (id)logCategory;
+ (id)symptomsHandlerUUIDFromAccessoryUUID:(id)a3;
- (HMMutableArray)currentSymptoms;
- (HMSymptomsHandler)initWithAccessory:(id)a3;
- (HMSymptomsHandler)initWithUUID:(id)a3 context:(id)a4 logIdentifier:(id)a5;
- (HMSymptomsHandlerDelegate)delegate;
- (NSHashTable)fixSessions;
- (NSSet)symptoms;
- (NSString)logIdentifier;
- (NSUUID)sfDeviceIdentifier;
- (NSUUID)uuid;
- (_HMContext)context;
- (id)_findAndRemoveFixSessionsForSymptom:(id)a3;
- (id)fixSessionFactory;
- (id)newFixSessionForSymptom:(id)a3;
- (void)_addFixSession:(id)a3;
- (void)_callFixSessionAvailabilityUpdatedDelegate;
- (void)_callSymptomsUpdatedDelegate:(id)a3;
- (void)_handleSymptomStateUpdatedMessage:(id)a3;
- (void)_subscribe;
- (void)_unsubscribe;
- (void)configure;
- (void)dealloc;
- (void)initiateFixWithCompletionHandler:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFixSessionFactory:(id)a3;
- (void)setSFDeviceIdentifier:(id)a3;
@end

@implementation HMSymptomsHandler

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fixSessionFactory, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_fixSessions, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_currentSymptoms, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_sfDeviceIdentifier, 0);
}

- (void)setFixSessionFactory:(id)a3
{
}

- (id)fixSessionFactory
{
  return objc_getProperty(self, a2, 72, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (NSHashTable)fixSessions
{
  return self->_fixSessions;
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return self->_context;
}

- (HMMutableArray)currentSymptoms
{
  return (HMMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void)_handleSymptomStateUpdatedMessage:(id)a3
{
  v57[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v57[0] = objc_opt_class();
  v57[1] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
  v6 = [v4 unarchivedObjectForKey:@"HMSM.symptoms" ofClasses:v5];

  v7 = [(HMSymptomsHandler *)self symptoms];
  char v8 = [v7 isEqualToSet:v6];

  if ((v8 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x19F3A64A0]();
    v37 = self;
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      v13 = [v4 shortDescription];
      v14 = [(HMSymptomsHandler *)v10 symptoms];
      *(_DWORD *)buf = 138544130;
      v50 = v12;
      __int16 v51 = 2112;
      v52 = v13;
      __int16 v53 = 2112;
      v54 = v14;
      __int16 v55 = 2112;
      v56 = v6;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %@ message so updating symptoms from %@ to %@", buf, 0x2Au);
    }
    id v38 = v4;

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v15 = [(HMSymptomsHandler *)v10 symptoms];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          if ((objc_msgSend(v6, "containsObject:", v20, v37) & 1) == 0)
          {
            v21 = [(HMSymptomsHandler *)v10 _findAndRemoveFixSessionsForSymptom:v20];
            long long v39 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = *(void *)v40;
              do
              {
                for (uint64_t j = 0; j != v23; ++j)
                {
                  if (*(void *)v40 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  [*(id *)(*((void *)&v39 + 1) + 8 * j) noteSymptomDisappeared];
                }
                uint64_t v23 = [v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
              }
              while (v23);
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v17);
    }

    v26 = [(HMSymptomsHandler *)v10 currentSymptoms];
    v27 = [v6 allObjects];
    [v26 setArray:v27];

    [(HMSymptomsHandler *)v10 _callSymptomsUpdatedDelegate:v6];
    self = v37;
    id v4 = v38;
  }
  v28 = objc_msgSend(v4, "uuidForKey:", @"HMSM.sfDeviceIdentifier", v37);
  v29 = [(HMSymptomsHandler *)self sfDeviceIdentifier];
  char v30 = HMFEqualObjects();

  if ((v30 & 1) == 0)
  {
    v31 = (void *)MEMORY[0x19F3A64A0]();
    v32 = self;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = HMFGetLogIdentifier();
      v35 = [v4 shortDescription];
      v36 = [(HMSymptomsHandler *)v32 sfDeviceIdentifier];
      *(_DWORD *)buf = 138544130;
      v50 = v34;
      __int16 v51 = 2112;
      v52 = v35;
      __int16 v53 = 2112;
      v54 = v36;
      __int16 v55 = 2112;
      v56 = v28;
      _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_INFO, "%{public}@Received %@ message so updating SFDevice identifier from %@ to %@", buf, 0x2Au);
    }
    [(HMSymptomsHandler *)v32 setSFDeviceIdentifier:v28];
    [(HMSymptomsHandler *)v32 _callFixSessionAvailabilityUpdatedDelegate];
  }
  [v4 respondWithSuccess];
}

- (void)_callFixSessionAvailabilityUpdatedDelegate
{
  v3 = [(HMSymptomsHandler *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(HMSymptomsHandler *)self context];
    v6 = [v5 delegateCaller];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__HMSymptomsHandler__callFixSessionAvailabilityUpdatedDelegate__block_invoke;
    v7[3] = &unk_1E59452E8;
    v7[4] = self;
    [v6 invokeBlock:v7];
  }
}

void __63__HMSymptomsHandler__callFixSessionAvailabilityUpdatedDelegate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 fixSessionAvailabilityDidUpdateForSymptomsHandler:*(void *)(a1 + 32)];
}

- (void)_callSymptomsUpdatedDelegate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMSymptomsHandler *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = (void *)MEMORY[0x19F3A64A0]();
    char v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated symptoms %@", buf, 0x16u);
    }
    v11 = [(HMSymptomsHandler *)v8 context];
    v12 = [v11 delegateCaller];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__HMSymptomsHandler__callSymptomsUpdatedDelegate___block_invoke;
    v13[3] = &unk_1E5945628;
    v13[4] = v8;
    id v14 = v4;
    [v12 invokeBlock:v13];
  }
}

void __50__HMSymptomsHandler__callSymptomsUpdatedDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 symptomsHandler:*(void *)(a1 + 32) didUpdateSymptoms:*(void *)(a1 + 40)];
}

- (id)_findAndRemoveFixSessionsForSymptom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v6 = [(HMSymptomsHandler *)self fixSessions];
  v7 = (void *)[v6 copy];

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
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = [v11 symptom];
        int v13 = [v12 isEqual:v4];

        if (v13)
        {
          [v5 addObject:v11];
          id v14 = [(HMSymptomsHandler *)self fixSessions];
          [v14 removeObject:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  v15 = (void *)[v5 copy];
  os_unfair_lock_unlock(lock);

  return v15;
}

- (void)_addFixSession:(id)a3
{
  id v6 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(HMSymptomsHandler *)self fixSessions];
  [v5 addObject:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)_unsubscribe
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(HMSymptomsHandler *)self uuid];
  v5 = (void *)[v3 initWithTarget:v4];

  id v6 = [MEMORY[0x1E4F654B0] messageWithName:@"HMSM.unsubscribe" destination:v5 payload:0];
  v7 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = HMFGetLogIdentifier();
    v11 = [v6 shortDescription];
    int v14 = 138543618;
    v15 = v10;
    __int16 v16 = 2112;
    __int16 v17 = v11;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Unsubscribing from symptoms changes with message: %@", (uint8_t *)&v14, 0x16u);
  }
  v12 = [(HMSymptomsHandler *)v8 context];
  int v13 = [v12 messageDispatcher];
  [v13 sendMessage:v6];
}

- (void)_subscribe
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(HMSymptomsHandler *)self uuid];
  v5 = (void *)[v3 initWithTarget:v4];

  id v6 = [MEMORY[0x1E4F654B0] messageWithName:@"HMSM.subscribe" destination:v5 payload:0];
  v7 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = HMFGetLogIdentifier();
    v11 = [v6 shortDescription];
    int v14 = 138543618;
    v15 = v10;
    __int16 v16 = 2112;
    __int16 v17 = v11;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Subscribing to symptoms changes with message: %@", (uint8_t *)&v14, 0x16u);
  }
  v12 = [(HMSymptomsHandler *)v8 context];
  int v13 = [v12 messageDispatcher];
  [v13 sendMessage:v6];
}

- (void)configure
{
  id v4 = [(HMSymptomsHandler *)self context];
  id v3 = [v4 messageDispatcher];
  [v3 registerForMessage:@"HMSM.symptomStateUpdated" receiver:self selector:sel__handleSymptomStateUpdatedMessage_];
}

- (void)initiateFixWithCompletionHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMSymptomsHandler *)self context];
  if (!v4)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMSymptomsHandler initiateFixWithCompletionHandler:]", @"completion"];
    int v14 = (void *)MEMORY[0x19F3A64A0]();
    v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      v25 = (const char *)v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
    objc_exception_throw(v18);
  }
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HMSymptomsHandler_initiateFixWithCompletionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v21 = v4;
    id v20 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v11;
      __int16 v24 = 2080;
      v25 = "-[HMSymptomsHandler initiateFixWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v12);
  }
}

void __54__HMSymptomsHandler_initiateFixWithCompletionHandler___block_invoke(id *a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [a1[4] uuid];
  v5 = (void *)[v3 initWithTarget:v4];
  id v6 = (void *)[v2 initWithName:@"HMSM.initiateFix" destination:v5 payload:0];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__HMSymptomsHandler_initiateFixWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E5943468;
  id v9 = a1[6];
  [v6 setResponseHandler:v8];
  v7 = [a1[5] messageDispatcher];
  [v7 sendMessage:v6];
}

uint64_t __54__HMSymptomsHandler_initiateFixWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)newFixSessionForSymptom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v29 = 138543618;
    char v30 = v8;
    __int16 v31 = 2112;
    id v32 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Asked to create a new fix session for symptom %@", (uint8_t *)&v29, 0x16u);
  }
  id v9 = [(HMSymptomsHandler *)v6 symptoms];
  int v10 = [v9 containsObject:v4];

  if (!v10)
  {
    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
    int v14 = v6;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      __int16 v24 = [(HMSymptomsHandler *)v14 symptoms];
      int v29 = 138543874;
      char v30 = v23;
      __int16 v31 = 2112;
      id v32 = v4;
      __int16 v33 = 2112;
      v34 = v24;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Not creating fix session for symptom %@ because it isn't one of this symptoms handler's current symptoms: %@", (uint8_t *)&v29, 0x20u);

LABEL_23:
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  unint64_t v11 = [v4 type];
  if (v11 > 0x15)
  {
LABEL_19:
    if (v11 - 999 >= 2)
    {
LABEL_25:
      uint64_t v22 = 0;
      goto LABEL_26;
    }
LABEL_20:
    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
    int v14 = v6;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      int v29 = 138543618;
      char v30 = v23;
      __int16 v31 = 2112;
      id v32 = v4;
      v25 = "%{public}@Not creating fix session for unfixable symptom %@";
      uint64_t v26 = v16;
      os_log_type_t v27 = OS_LOG_TYPE_INFO;
      goto LABEL_22;
    }
LABEL_24:

    goto LABEL_25;
  }
  if (((1 << v11) & 0x1F6FFE) == 0)
  {
    if (((1 << v11) & 0x209000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v12 = [(HMSymptomsHandler *)v6 sfDeviceIdentifier];

  uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
  int v14 = v6;
  v15 = HMFGetOSLogHandle();
  __int16 v16 = v15;
  if (!v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      int v29 = 138543618;
      char v30 = v23;
      __int16 v31 = 2112;
      id v32 = v4;
      v25 = "%{public}@Not creating fix session for symptom %@ because our SF device identifier is nil";
      uint64_t v26 = v16;
      os_log_type_t v27 = OS_LOG_TYPE_DEBUG;
LABEL_22:
      _os_log_impl(&dword_19D1A8000, v26, v27, v25, (uint8_t *)&v29, 0x16u);
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = HMFGetLogIdentifier();
    id v18 = [(HMSymptomsHandler *)v14 sfDeviceIdentifier];
    int v29 = 138543874;
    char v30 = v17;
    __int16 v31 = 2112;
    id v32 = v4;
    __int16 v33 = 2112;
    v34 = v18;
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Creating fix session for symptom %@ with SF device identifier %@", (uint8_t *)&v29, 0x20u);
  }
  long long v19 = [(HMSymptomsHandler *)v14 fixSessionFactory];
  id v20 = [(HMSymptomsHandler *)v14 sfDeviceIdentifier];
  id v21 = [(HMSymptomsHandler *)v14 context];
  uint64_t v22 = ((void (**)(void, id, void *, void *))v19)[2](v19, v4, v20, v21);

  if ([v4 type] == 11 || objc_msgSend(v4, "type") == 19) {
    [v22 setDeviceRepairFlags:1];
  }
  if (v22) {
    [(HMSymptomsHandler *)v14 _addFixSession:v22];
  }
LABEL_26:

  return v22;
}

- (void)setSFDeviceIdentifier:(id)a3
{
  id v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  sfDeviceIdentifier = self->_sfDeviceIdentifier;
  self->_sfDeviceIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)sfDeviceIdentifier
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_sfDeviceIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setDelegate:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  objc_storeWeak((id *)&self->_delegate, v5);
  os_unfair_lock_unlock(p_lock);
  if (!v5 || WeakRetained)
  {
    if (!v5 && WeakRetained)
    {
      [(HMSymptomsHandler *)self _unsubscribe];
    }
  }
  else
  {
    [(HMSymptomsHandler *)self _subscribe];
  }
}

- (HMSymptomsHandlerDelegate)delegate
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return (HMSymptomsHandlerDelegate *)WeakRetained;
}

- (NSSet)symptoms
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(HMSymptomsHandler *)self currentSymptoms];
  id v4 = [v3 array];
  id v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained) {
    [(HMSymptomsHandler *)self _unsubscribe];
  }
  v4.receiver = self;
  v4.super_class = (Class)HMSymptomsHandler;
  [(HMSymptomsHandler *)&v4 dealloc];
}

- (HMSymptomsHandler)initWithUUID:(id)a3 context:(id)a4 logIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HMSymptomsHandler;
  unint64_t v11 = [(HMSymptomsHandler *)&v22 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    objc_storeStrong((id *)&v11->_context, a4);
    uint64_t v14 = [v10 copy];
    logIdentifier = v11->_logIdentifier;
    v11->_logIdentifier = (NSString *)v14;

    uint64_t v16 = +[HMMutableArray array];
    currentSymptoms = v11->_currentSymptoms;
    v11->_currentSymptoms = (HMMutableArray *)v16;

    uint64_t v18 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    fixSessions = v11->_fixSessions;
    v11->_fixSessions = (NSHashTable *)v18;

    id fixSessionFactory = v11->_fixSessionFactory;
    v11->_id fixSessionFactory = &__block_literal_global_24218;
  }
  return v11;
}

HMSymptomFixSession *__56__HMSymptomsHandler_initWithUUID_context_logIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  id v9 = [[HMSymptomFixSession alloc] initWithSymptom:v8 deviceIdentifier:v7 context:v6];

  return v9;
}

- (HMSymptomsHandler)initWithAccessory:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [v4 uuid];
  id v7 = [v5 symptomsHandlerUUIDFromAccessoryUUID:v6];

  id v8 = NSString;
  id v9 = [v4 uuid];
  id v10 = [v8 stringWithFormat:@"%@/%@", v7, v9];

  unint64_t v11 = [v4 context];

  uint64_t v12 = [(HMSymptomsHandler *)self initWithUUID:v7 context:v11 logIdentifier:v10];
  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18 != -1) {
    dispatch_once(&logCategory__hmf_once_t18, &__block_literal_global_52);
  }
  id v2 = (void *)logCategory__hmf_once_v19;

  return v2;
}

uint64_t __32__HMSymptomsHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v19;
  logCategory__hmf_once_long long v19 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)symptomsHandlerUUIDFromAccessoryUUID:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:@"DA8F18EC-6C7D-4631-9B5B-615977C21A44"];
  id v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = [v4 UUIDString];

  id v8 = [v7 dataUsingEncoding:4];
  id v9 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v8);

  return v9;
}

@end