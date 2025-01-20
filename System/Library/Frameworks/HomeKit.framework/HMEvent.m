@interface HMEvent
+ (BOOL)isSupportedForHome:(HMHome *)home;
+ (BOOL)sharedTriggerActivationSupportedForHome:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (HMEvent)new;
- (BOOL)isEndEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMEvent)init;
- (HMEvent)initWithCoder:(id)a3;
- (HMEvent)initWithDict:(id)a3;
- (HMEventTrigger)eventTrigger;
- (NSString)triggerType;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (_HMContext)context;
- (id)_serializeForAdd;
- (unint64_t)hash;
- (void)__configureWithContext:(id)a3 eventTrigger:(id)a4;
- (void)_unconfigure;
- (void)_updateEventWithPayload:(id)a3 completionHandler:(id)a4;
- (void)_updateTriggerType;
- (void)setContext:(id)a3;
- (void)setEndEvent:(BOOL)a3;
- (void)setEventTrigger:(id)a3;
@end

@implementation HMEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_destroyWeak((id *)&self->_eventTrigger);
}

- (NSString)triggerType
{
  return self->_triggerType;
}

- (void)setEndEvent:(BOOL)a3
{
  self->_endEvent = a3;
}

- (BOOL)isEndEvent
{
  return self->_endEvent;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return self->_context;
}

- (HMEvent)init
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"kEventUUIDKey";
  v3 = [MEMORY[0x1E4F29128] UUID];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [(HMEvent *)self initWithDict:v4];

  return v5;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  return 0;
}

- (id)_serializeForAdd
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"kEventUUIDKey";
  v3 = [(HMEvent *)self uuid];
  v4 = [v3 UUIDString];
  v10[0] = v4;
  v9[1] = @"kEventTriggerEndEvent";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMEvent isEndEvent](self, "isEndEvent"));
  v10[1] = v5;
  v9[2] = @"kEventTriggerTypeKey";
  v6 = [(HMEvent *)self triggerType];
  v10[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (HMEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMEvent *)self init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "hm_decodeAndCacheUUIDFromStringForKey:", @"HM.eventIdentifier");
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    v5->_endEvent = [v4 decodeBoolForKey:@"kEventTriggerEndEvent"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.eventTrigger"];
    objc_storeWeak((id *)&v5->_eventTrigger, v8);

    [(HMEvent *)v5 _updateTriggerType];
  }

  return v5;
}

- (void)_updateEventWithPayload:(id)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMEvent *)self context];
  if (v8)
  {
    v9 = [(HMEvent *)self uuid];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__HMEvent__updateEventWithPayload_completionHandler___block_invoke;
    v15[3] = &unk_1E5945510;
    id v16 = v8;
    v17 = self;
    id v18 = v7;
    -[_HMContext sendMessage:target:payload:responseHandler:](v16, @"kEventTriggerUpdateEventRequestKey", v9, v6, v15);

    v10 = v16;
LABEL_7:

    goto LABEL_8;
  }
  v11 = (void *)MEMORY[0x19F3A64A0]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    __int16 v21 = 2080;
    v22 = "-[HMEvent _updateEventWithPayload:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v7)
  {
    v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
    goto LABEL_7;
  }
LABEL_8:
}

void __53__HMEvent__updateEventWithPayload_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (v9)
  {
    v5 = [*(id *)(a1 + 32) delegateCaller];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = v9;
  }
  else
  {
    [*(id *)(a1 + 40) _updateFromDictionary:a3];
    v5 = [*(id *)(a1 + 32) delegateCaller];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = 0;
  }
  [v5 callCompletion:v7 error:v8];
}

- (void)_updateTriggerType
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_triggerType, @"kEventTriggerTypeCharacteristicEventKey");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_triggerType, @"kEventTriggerTypeLocationEventKey");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_triggerType, @"kEventTriggerTypeCalendarEventKey");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_triggerType, @"kEventTriggerTypeSignificantTimeEventKey");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_triggerType, @"kEventTriggerTypeDurationEventKey");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_triggerType, @"kEventTriggerTypeCharacteristicThresholdRangeEventKey");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_triggerType, @"kEventTriggerTypePresenceEventKey");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    triggerType = self->_triggerType;
    self->_triggerType = (NSString *)@"kEventTriggerTypeMatterAttributeEventKey";
  }
}

- (void)setEventTrigger:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_eventTrigger, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMEventTrigger)eventTrigger
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventTrigger);
  os_unfair_lock_unlock(p_lock);

  return (HMEventTrigger *)WeakRetained;
}

- (NSUUID)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    id v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  uint64_t v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMEvent *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(HMEvent *)v4 uuid];
      id v6 = [(HMEvent *)self uuid];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(HMEvent *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)__configureWithContext:(id)a3 eventTrigger:(id)a4
{
  id v7 = a3;
  [(HMEvent *)self setEventTrigger:a4];
  if (v7) {
    objc_storeStrong((id *)&self->_context, a3);
  }
}

- (void)_unconfigure
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  context = self->_context;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring event", (uint8_t *)&v11, 0xCu);
    }
    [(HMEvent *)v5 setEventTrigger:0];
    [(HMEvent *)v5 setContext:0];
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:v5];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (HMEvent)initWithDict:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMEvent;
  id v5 = [(HMEvent *)&v10 init];
  if (v5)
  {
    id v6 = objc_msgSend(v4, "hmf_UUIDForKey:", @"kEventUUIDKey");
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v6);
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v7;

    v5->_endEvent = objc_msgSend(v4, "hmf_BOOLForKey:", @"kEventTriggerEndEvent");
    [(HMEvent *)v5 _updateTriggerType];
  }
  return v5;
}

+ (HMEvent)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HMEvent;
  return (HMEvent *)objc_msgSendSuper2(&v3, "new");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)sharedTriggerActivationSupportedForHome:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = objc_msgSend(a3, "residentDevices", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (([*(id *)(*((void *)&v8 + 1) + 8 * i) capabilities] & 8) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (BOOL)isSupportedForHome:(HMHome *)home
{
  return 1;
}

@end