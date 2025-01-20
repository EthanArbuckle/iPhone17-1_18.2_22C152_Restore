@interface HMPresenceEvent
+ (BOOL)isSupportedForHome:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)createWithDictionary:(id)a3 home:(id)a4;
+ (id)users:(id)a3 home:(id)a4 presenceType:(id)a5;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMMutableArray)observedUsers;
- (HMPresenceEvent)initWithCoder:(id)a3;
- (HMPresenceEvent)initWithDict:(id)a3 presenceType:(id)a4 users:(id)a5 activation:(id)a6;
- (HMPresenceEvent)initWithDict:(id)a3 presenceType:(id)a4 users:(id)a5 activationGranularity:(unint64_t)a6;
- (HMPresenceEvent)initWithPresenceEventType:(HMPresenceEventType)presenceEventType presenceUserType:(HMPresenceEventUserType)presenceUserType;
- (HMPresenceEvent)initWithPresenceEventType:(unint64_t)a3 presenceUserType:(unint64_t)a4 users:(id)a5;
- (HMPresenceEvent)initWithPresenceType:(id)a3;
- (HMPresenceEvent)initWithPresenceType:(id)a3 users:(id)a4;
- (HMPresenceEventActivation)activation;
- (HMPresenceEventType)presenceEventType;
- (HMPresenceEventUserType)presenceUserType;
- (NSString)presenceType;
- (id)_serializeForAdd;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)users;
- (unint64_t)activationGranularity;
- (void)_updateFromDictionary:(id)a3;
- (void)setActivation:(id)a3;
- (void)setPresenceEventType:(unint64_t)a3;
- (void)setPresenceType:(id)a3;
- (void)setPresenceUserType:(unint64_t)a3;
- (void)updatePresenceType:(id)a3 completionHandler:(id)a4;
- (void)updateUsers:(id)a3 completionHandler:(id)a4;
@end

@implementation HMPresenceEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedUsers, 0);
  objc_storeStrong((id *)&self->_activation, 0);

  objc_storeStrong((id *)&self->_presenceType, 0);
}

- (HMMutableArray)observedUsers
{
  return self->_observedUsers;
}

- (HMPresenceEvent)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMPresenceEvent;
  v5 = [(HMEvent *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPresenceEventPresence"];
    presenceType = v5->_presenceType;
    v5->_presenceType = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    v10 = [v8 setWithArray:v9];
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"kPresenceEventUsers"];

    uint64_t v12 = +[HMMutableArray array];
    observedUsers = v5->_observedUsers;
    v5->_observedUsers = (HMMutableArray *)v12;

    [(HMMutableArray *)v5->_observedUsers setArray:v11];
    uint64_t v14 = +[HMPresenceEventActivation activationGranularityWithCoder:v4];
    activation = v5->_activation;
    v5->_activation = (HMPresenceEventActivation *)v14;
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HMMutablePresenceEvent alloc];
  HMPresenceEventType v5 = [(HMPresenceEvent *)self presenceEventType];
  HMPresenceEventUserType v6 = [(HMPresenceEvent *)self presenceUserType];
  v7 = [(HMPresenceEvent *)self users];
  v8 = [(HMPresenceEvent *)v4 initWithPresenceEventType:v5 presenceUserType:v6 users:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)users:(id)a3 home:(id)a4 presenceType:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (usersListApplicable(v9))
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    if (v7)
    {
      id v28 = v9;
      v29 = v8;
      v11 = [v8 users];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v31 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            objc_super v17 = [v16 uuid];
            v18 = [v17 UUIDString];
            int v19 = [v7 containsObject:v18];

            if (v19) {
              [v10 addObject:v16];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v13);
      }
      id v8 = v29;
      v20 = [v29 currentUser];
      v21 = [v20 uuid];
      v22 = [v21 UUIDString];
      int v23 = [v7 containsObject:v22];

      if (v23) {
        [v10 addObject:v20];
      }

      id v9 = v28;
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x19F3A64A0]();
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v36 = v26;
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_INFO, "%{public}@Presence type %@ does not apply for users", buf, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

+ (id)createWithDictionary:(id)a3 home:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_msgSend(v6, "hmf_stringForKey:", @"kPresenceEventPresence");
  id v8 = objc_msgSend(v6, "hmf_arrayForKey:", @"kPresenceEventUsers");
  id v9 = +[HMPresenceEvent users:v8 home:v5 presenceType:v7];

  v10 = +[HMPresenceEventActivation activationGranularityWithDict:v6];
  v11 = [[HMPresenceEvent alloc] initWithDict:v6 presenceType:v7 users:v9 activation:v10];

  return v11;
}

+ (BOOL)isSupportedForHome:(id)a3
{
  return +[HMEvent sharedTriggerActivationSupportedForHome:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HMPresenceEvent alloc];
  HMPresenceEventType v5 = [(HMPresenceEvent *)self presenceEventType];
  HMPresenceEventUserType v6 = [(HMPresenceEvent *)self presenceUserType];
  id v7 = [(HMPresenceEvent *)self users];
  id v8 = [(HMPresenceEvent *)v4 initWithPresenceEventType:v5 presenceUserType:v6 users:v7];

  return v8;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)HMPresenceEvent;
  BOOL v5 = [(HMEvent *)&v32 mergeFromNewObject:v4];
  id v6 = v4;
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
    id v9 = [(HMPresenceEvent *)self presenceType];
    v10 = [v8 presenceType];
    char v11 = HMFEqualObjects();

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = [v8 presenceType];
      [(HMPresenceEvent *)self setPresenceType:v12];

      BOOL v5 = 1;
    }
    uint64_t v13 = [(HMPresenceEvent *)self activation];
    uint64_t v14 = [v8 activation];
    char v15 = HMFEqualObjects();

    if ((v15 & 1) == 0)
    {
      v16 = [v8 activation];
      [(HMPresenceEvent *)self setActivation:v16];

      BOOL v5 = 1;
    }
    objc_super v17 = [HMObjectMergeCollection alloc];
    v18 = [(HMPresenceEvent *)self observedUsers];
    int v19 = [v18 array];
    v20 = [v8 users];
    v21 = [(HMObjectMergeCollection *)v17 initWithCurrentObjects:v19 newObjects:v20];

    v22 = [(HMObjectMergeCollection *)v21 removedObjects];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __38__HMPresenceEvent_mergeFromNewObject___block_invoke;
    v31[3] = &unk_1E5943AA8;
    v31[4] = self;
    [v22 enumerateObjectsUsingBlock:v31];

    int v23 = [(HMEvent *)self eventTrigger];
    v24 = [v23 home];
    v25 = [v24 users];
    [(HMObjectMergeCollection *)v21 replaceAddedObjectsWithObjects:v25];

    v26 = [(HMObjectMergeCollection *)v21 addedObjects];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __38__HMPresenceEvent_mergeFromNewObject___block_invoke_32;
    v30[3] = &unk_1E5943AA8;
    v30[4] = self;
    [v26 enumerateObjectsUsingBlock:v30];

    if ([(HMObjectMergeCollection *)v21 isModified])
    {
      v27 = [(HMObjectMergeCollection *)v21 finalObjects];
      id v28 = [(HMPresenceEvent *)self observedUsers];
      [v28 setArray:v27];

      BOOL v5 = 1;
    }
  }
  return v5;
}

void __38__HMPresenceEvent_mergeFromNewObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed user via presence event merge: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __38__HMPresenceEvent_mergeFromNewObject___block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added user via presence event merge: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)updateUsers:(id)a3 completionHandler:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(HMEvent *)self context];
  if (!v7)
  {
    uint64_t v37 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMPresenceEvent updateUsers:completionHandler:]", @"completion"];
    id v38 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v39 = self;
    v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v59 = v41;
      __int16 v60 = 2112;
      v61 = (const char *)v37;
      _os_log_impl(&dword_19D1A8000, v40, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v42 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v37 userInfo:0];
    objc_exception_throw(v42);
  }
  id v9 = (void *)v8;
  if (!v8)
  {
    long long v31 = (void *)MEMORY[0x19F3A64A0]();
    objc_super v32 = self;
    long long v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v59 = v34;
      __int16 v60 = 2080;
      v61 = "-[HMPresenceEvent updateUsers:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v35 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v7[2](v7, v35);
    goto LABEL_25;
  }
  __int16 v10 = [(HMPresenceEvent *)self presenceType];
  char v11 = usersListApplicable(v10);

  if ((v11 & 1) == 0)
  {
    v35 = [v9 delegateCaller];
    [v35 callCompletion:v7 error:0];
LABEL_25:

    goto LABEL_29;
  }
  v44 = v9;
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v45 = v6;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v51 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v50 + 1) + 8 * i) uuid];
        int v19 = [v18 UUIDString];
        [v12 addObject:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v15);
  }

  v20 = [(HMPresenceEvent *)self users];
  uint64_t v21 = [v12 count];
  if (v21 == [v20 count])
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v43 = v20;
    id v22 = v20;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v47;
      while (2)
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v47 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [*(id *)(*((void *)&v46 + 1) + 8 * j) uuid];
          id v28 = [v27 UUIDString];
          int v29 = [v12 containsObject:v28];

          if (!v29)
          {

            v20 = v43;
            goto LABEL_27;
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v46 objects:v56 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

    id v9 = v44;
    long long v30 = [v44 delegateCaller];
    [v30 callCompletion:v7 error:0];
    id v6 = v45;
    v20 = v43;
  }
  else
  {
LABEL_27:
    v54 = @"kPresenceEventUsers";
    long long v30 = [v12 allObjects];
    v55 = v30;
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    [(HMEvent *)self _updateEventWithPayload:v36 completionHandler:v7];

    id v9 = v44;
    id v6 = v45;
  }

LABEL_29:
}

- (void)updatePresenceType:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(HMEvent *)self context];
  if (!v7)
  {
    uint64_t v23 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMPresenceEvent updatePresenceType:completionHandler:]", @"completion"];
    uint64_t v24 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v25 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      objc_super v32 = v27;
      __int16 v33 = 2112;
      v34 = (const char *)v23;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v23 userInfo:0];
    objc_exception_throw(v28);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    if (isValidPresenceType(v6))
    {
      __int16 v10 = [(HMPresenceEvent *)self presenceType];
      int v11 = [v10 isEqualToString:v6];

      if (!v11)
      {
        int v29 = @"kPresenceEventPresence";
        long long v30 = v6;
        id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        [(HMEvent *)self _updateEventWithPayload:v22 completionHandler:v7];

        goto LABEL_13;
      }
      uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
      id v13 = self;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        objc_super v32 = v15;
        __int16 v33 = 2112;
        v34 = v6;
        _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Presence type is already %@", buf, 0x16u);
      }
      uint64_t v16 = [v9 delegateCaller];
      [v16 callCompletion:v7 error:0];
    }
    else
    {
      uint64_t v16 = [v9 delegateCaller];
      uint64_t v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v16 callCompletion:v7 error:v21];
    }
  }
  else
  {
    objc_super v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = self;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      objc_super v32 = v20;
      __int16 v33 = 2080;
      v34 = "-[HMPresenceEvent updatePresenceType:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v7[2](v7, v16);
  }

LABEL_13:
}

- (id)_serializeForAdd
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)HMPresenceEvent;
  id v3 = [(HMEvent *)&v24 _serializeForAdd];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(HMPresenceEvent *)self presenceType];
  [v4 setObject:v5 forKeyedSubscript:@"kPresenceEventPresence"];

  id v6 = [(HMPresenceEvent *)self activation];
  [v6 addToPayload:v4];

  id v7 = [(HMPresenceEvent *)self users];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    __int16 v10 = [(HMPresenceEvent *)self users];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v20 + 1) + 8 * i) uuid];
          uint64_t v16 = [v15 UUIDString];
          [v9 addObject:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v12);
    }

    objc_super v17 = (void *)[v9 copy];
    [v4 setObject:v17 forKeyedSubscript:@"kPresenceEventUsers"];
  }
  v18 = (void *)[v4 copy];

  return v18;
}

- (void)_updateFromDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HMPresenceEvent;
  [(HMEvent *)&v25 _updateFromDictionary:v4];
  id v5 = objc_msgSend(v4, "hmf_stringForKey:", @"kPresenceEventPresence");
  if (v5)
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]([(HMPresenceEvent *)self setPresenceType:v5]);
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v9;
      __int16 v28 = 2112;
      int v29 = v5;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating presence type to %@", buf, 0x16u);
    }
  }
  __int16 v10 = +[HMPresenceEventActivation activationGranularityWithDict:v4];
  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]([(HMPresenceEvent *)self setActivation:v10]);
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v14;
      __int16 v28 = 2112;
      int v29 = v10;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating activation to %@", buf, 0x16u);
    }
  }
  uint64_t v15 = objc_msgSend(v4, "hmf_arrayForKey:", @"kPresenceEventUsers");
  if (v15)
  {
    uint64_t v16 = [(HMEvent *)self eventTrigger];
    objc_super v17 = [v16 home];

    v18 = [(HMPresenceEvent *)self presenceType];
    int v19 = +[HMPresenceEvent users:v15 home:v17 presenceType:v18];

    long long v20 = (void *)MEMORY[0x19F3A64A0]();
    long long v21 = self;
    long long v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      long long v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v23;
      __int16 v28 = 2112;
      int v29 = v19;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating users list to %@", buf, 0x16u);
    }
    objc_super v24 = [(HMPresenceEvent *)v21 observedUsers];
    [v24 setArray:v19];
  }
}

- (id)users
{
  v2 = [(HMPresenceEvent *)self observedUsers];
  id v3 = [v2 array];

  return v3;
}

- (void)setPresenceUserType:(unint64_t)a3
{
  presenceTypeForEventTypeAndGranularity([(HMPresenceEvent *)self presenceEventType], a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  HMPresenceEventType v4 = [(HMPresenceEvent *)self presenceEventType];
  if (v4 - 1 >= 4) {
    id v5 = (uint64_t *)&kInvalidHMPresenceEventActivationGranularity;
  }
  else {
    id v5 = (uint64_t *)((char *)&unk_19D47B950 + 8 * v4 - 8);
  }
  uint64_t v6 = *v5;
  [(HMPresenceEvent *)self setPresenceType:v8];
  id v7 = +[HMPresenceEventActivation activationGranularityWithValue:v6];
  [(HMPresenceEvent *)self setActivation:v7];
}

- (HMPresenceEventUserType)presenceUserType
{
  id v3 = [(HMPresenceEvent *)self presenceType];
  [(HMPresenceEvent *)self activationGranularity];
  HMPresenceEventUserType v4 = userTypeForPresenceTypeAndGranularity(v3);

  return v4;
}

- (void)setPresenceEventType:(unint64_t)a3
{
  presenceTypeForEventTypeAndGranularity(a3, [(HMPresenceEvent *)self presenceUserType]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(HMPresenceEvent *)self presenceUserType];
  if (a3 - 1 >= 4) {
    id v5 = (uint64_t *)&kInvalidHMPresenceEventActivationGranularity;
  }
  else {
    id v5 = (uint64_t *)((char *)&unk_19D47B950 + 8 * a3 - 8);
  }
  uint64_t v6 = *v5;
  [(HMPresenceEvent *)self setPresenceType:v8];
  id v7 = +[HMPresenceEventActivation activationGranularityWithValue:v6];
  [(HMPresenceEvent *)self setActivation:v7];
}

- (HMPresenceEventType)presenceEventType
{
  id v3 = [(HMPresenceEvent *)self presenceType];
  HMPresenceEventType v4 = eventTypeForPresenceTypeAndGranularity(v3, [(HMPresenceEvent *)self activationGranularity]);

  return v4;
}

- (void)setActivation:(id)a3
{
  HMPresenceEventType v4 = (HMPresenceEventActivation *)a3;
  os_unfair_lock_lock_with_options();
  activation = self->_activation;
  self->_activation = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (HMPresenceEventActivation)activation
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  HMPresenceEventType v4 = self->_activation;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (unint64_t)activationGranularity
{
  v2 = [(HMPresenceEvent *)self activation];
  id v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 value];
  }
  else {
    unint64_t v4 = 2;
  }

  return v4;
}

- (void)setPresenceType:(id)a3
{
  unint64_t v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  presenceType = self->_presenceType;
  self->_presenceType = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSString)presenceType
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = self->_presenceType;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28E78];
  unint64_t v4 = [(HMPresenceEvent *)self presenceType];
  id v5 = [v3 stringWithFormat:@"type: %@", v4];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [(HMPresenceEvent *)self users];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v5 appendString:@", "];
        uint64_t v12 = [v11 userID];
        [v5 appendString:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v13 = NSString;
  uint64_t v14 = [(HMPresenceEvent *)self activation];
  uint64_t v15 = [v13 stringWithFormat:@"[Presence-Event: %@, mode: %@]", v5, v14];

  return v15;
}

- (HMPresenceEvent)initWithDict:(id)a3 presenceType:(id)a4 users:(id)a5 activation:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMPresenceEvent;
  uint64_t v14 = [(HMEvent *)&v19 initWithDict:a3];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_presenceType, a4);
    objc_storeStrong((id *)&v15->_activation, a6);
    uint64_t v16 = +[HMMutableArray arrayWithArray:v12];
    observedUsers = v15->_observedUsers;
    v15->_observedUsers = (HMMutableArray *)v16;
  }
  return v15;
}

- (HMPresenceEvent)initWithDict:(id)a3 presenceType:(id)a4 users:(id)a5 activationGranularity:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[HMPresenceEventActivation activationGranularityWithValue:a6];
  uint64_t v14 = [(HMPresenceEvent *)self initWithDict:v12 presenceType:v11 users:v10 activation:v13];

  return v14;
}

- (HMPresenceEvent)initWithPresenceEventType:(unint64_t)a3 presenceUserType:(unint64_t)a4 users:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = presenceTypeForEventTypeAndGranularity(a3, a4);
  id v10 = (uint64_t *)((char *)&unk_19D47B950 + 8 * a3 - 8);
  if (a3 - 1 >= 4) {
    id v10 = (uint64_t *)&kInvalidHMPresenceEventActivationGranularity;
  }
  uint64_t v11 = *v10;
  uint64_t v16 = @"kEventUUIDKey";
  id v12 = [MEMORY[0x1E4F29128] UUID];
  v17[0] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  uint64_t v14 = [(HMPresenceEvent *)self initWithDict:v13 presenceType:v9 users:v8 activationGranularity:v11];

  return v14;
}

- (HMPresenceEvent)initWithPresenceEventType:(HMPresenceEventType)presenceEventType presenceUserType:(HMPresenceEventUserType)presenceUserType
{
  return [(HMPresenceEvent *)self initWithPresenceEventType:presenceEventType presenceUserType:presenceUserType users:MEMORY[0x1E4F1CBF0]];
}

- (HMPresenceEvent)initWithPresenceType:(id)a3 users:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v13 = @"kEventUUIDKey";
  uint64_t v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 UUID];
  v14[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v11 = [(HMPresenceEvent *)self initWithDict:v10 presenceType:v8 users:v7 activationGranularity:2];

  return v11;
}

- (HMPresenceEvent)initWithPresenceType:(id)a3
{
  return [(HMPresenceEvent *)self initWithPresenceType:a3 users:MEMORY[0x1E4F1CBF0]];
}

@end