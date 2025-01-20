@interface HMDEvent
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)_activate:(unint64_t)a3 completionHandler:(id)a4;
- (BOOL)isActive;
- (BOOL)isCompatibleWithEvent:(id)a3;
- (BOOL)isConfigured;
- (BOOL)isEndEvent;
- (BOOL)isEqual:(id)a3;
- (HMDEvent)initWithCoder:(id)a3;
- (HMDEvent)initWithModel:(id)a3 home:(id)a4;
- (HMDEventDelegate)delegate;
- (HMDEventTrigger)eventTrigger;
- (HMDHome)home;
- (HMFMessageDispatcher)msgDispatcher;
- (NSString)description;
- (NSString)logString;
- (NSString)triggerType;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)analyticsTriggerEventData;
- (id)createPayload;
- (id)dumpState;
- (id)emptyModelObject;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (unint64_t)activationType;
- (unint64_t)hash;
- (void)_registerForMessages;
- (void)_setup;
- (void)_transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)_updateTriggerType;
- (void)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5 delegate:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setActivationType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEventTrigger:(id)a3;
- (void)setHome:(id)a3;
- (void)setLogString:(id)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMDEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logString, 0);
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_eventTrigger);
}

- (void)setActivationType:(unint64_t)a3
{
  self->_activationType = a3;
}

- (unint64_t)activationType
{
  return self->_activationType;
}

- (BOOL)isEndEvent
{
  return self->_endEvent;
}

- (void)setLogString:(id)a3
{
}

- (NSString)logString
{
  return self->_logString;
}

- (NSString)triggerType
{
  return self->_triggerType;
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMDEventDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDEventDelegate *)WeakRetained;
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setEventTrigger:(id)a3
{
}

- (HMDEventTrigger)eventTrigger
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventTrigger);
  return (HMDEventTrigger *)WeakRetained;
}

- (id)analyticsTriggerEventData
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)_activate:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    v11 = HMDEventTriggerActivationTypeAsString([(HMDEvent *)v8 activationType]);
    v12 = HMDEventTriggerActivationTypeAsString(a3);
    int v17 = 138543874;
    v18 = v10;
    __int16 v19 = 2112;
    v20 = v11;
    __int16 v21 = 2112;
    v22 = v12;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating the activation type from %@ to %@", (uint8_t *)&v17, 0x20u);
  }
  uint64_t v13 = [(HMDEvent *)v8 activationType];
  if (v13 != a3) {
    [(HMDEvent *)v8 setActivationType:a3];
  }
  v14 = _Block_copy(v6);
  v15 = v14;
  if (v14) {
    (*((void (**)(void *, void))v14 + 2))(v14, 0);
  }

  return v13 != a3;
}

- (void)_transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x263EFF940];
  uint64_t v9 = *MEMORY[0x263EFF498];
  v10 = NSString;
  v11 = NSStringFromSelector(a2);
  v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x263EFF940];
  uint64_t v12 = *MEMORY[0x263EFF498];
  id v13 = NSString;
  v14 = NSStringFromSelector(a2);
  v15 = [v13 stringWithFormat:@"You must override %@ in a subclass", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(HMDEvent *)self uuid];
  v5 = [v4 UUIDString];
  [v7 encodeObject:v5 forKey:@"HM.eventIdentifier"];

  id v6 = [(HMDEvent *)self eventTrigger];
  [v7 encodeConditionalObject:v6 forKey:@"HM.eventTrigger"];

  objc_msgSend(v7, "encodeBool:forKey:", -[HMDEvent isEndEvent](self, "isEndEvent"), @"kEventTriggerEndEvent");
}

- (HMDEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDEvent;
  v5 = [(HMDEvent *)&v11 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.eventIdentifier"];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v6];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.eventTrigger"];
    objc_storeWeak((id *)&v5->_eventTrigger, v9);

    v5->_endEvent = [v4 decodeBoolForKey:@"kEventTriggerEndEvent"];
    [(HMDEvent *)v5 _setup];
  }
  return v5;
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  id v4 = a3;
  v5 = [(HMDEvent *)self triggerType];
  id v6 = [v4 triggerType];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(HMDEvent *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)createPayload
{
  v10[3] = *MEMORY[0x263EF8340];
  v9[0] = @"kEventUUIDKey";
  unint64_t v3 = [(HMDEvent *)self uuid];
  id v4 = [v3 UUIDString];
  v10[0] = v4;
  v9[1] = @"kEventTriggerTypeKey";
  v5 = [(HMDEvent *)self triggerType];
  v10[1] = v5;
  v9[2] = @"kEventTriggerEndEvent";
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  v10[2] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDEvent *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(HMDEvent *)v4 uuid];
      id v6 = [(HMDEvent *)self uuid];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)dumpState
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
  id v4 = NSString;
  v5 = [(HMDEvent *)self uuid];
  id v6 = [v5 UUIDString];
  char v7 = [(HMDEvent *)self eventTrigger];
  id v8 = [v7 name];
  id v9 = [v4 stringWithFormat:@"uuid: %@, trigger: %@", v6, v8];

  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x263F41FA8]];
  return v3;
}

- (void)_registerForMessages
{
  v8[2] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HMDEvent *)self home];
  id v4 = [v3 administratorHandler];
  v5 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v8[0] = v5;
  id v6 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v8[1] = v6;
  char v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  [v4 registerForMessage:@"kEventTriggerUpdateEventRequestKey" receiver:self policies:v7 selector:sel__handleUpdateRequest_];
}

- (void)invalidate
{
  unint64_t v3 = [(HMDEvent *)self msgDispatcher];
  [v3 deregisterReceiver:self];

  id v4 = [(HMDEvent *)self home];
  v5 = [v4 administratorHandler];
  [v5 deregisterReceiver:self];

  [(HMDEvent *)self setMsgDispatcher:0];
  [(HMDEvent *)self setEventTrigger:0];
}

- (void)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5 delegate:(id)a6
{
  id v10 = NSString;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [v14 name];
  id v16 = [(HMDEvent *)self uuid];
  int v17 = [v16 UUIDString];
  v18 = [v10 stringWithFormat:@"%@/%@", v15, v17];
  [(HMDEvent *)self setLogString:v18];

  [(HMDEvent *)self setEventTrigger:v14];
  __int16 v19 = [v14 home];

  [(HMDEvent *)self setHome:v19];
  [(HMDEvent *)self setMsgDispatcher:v13];

  [(HMDEvent *)self setWorkQueue:v12];
  [(HMDEvent *)self setDelegate:v11];

  [(HMDEvent *)self _registerForMessages];
}

- (id)emptyModelObject
{
  return 0;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  return 0;
}

- (BOOL)isConfigured
{
  v2 = [(HMDEvent *)self workQueue];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isActive
{
  return 0;
}

- (NSString)description
{
  v2 = NSString;
  BOOL v3 = [(HMDEvent *)self uuid];
  id v4 = [v3 UUIDString];
  v5 = [v2 stringWithFormat:@"%@", v4];

  return (NSString *)v5;
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
    BOOL v3 = (void *)*MEMORY[0x263F0E9D0];
    objc_storeStrong((id *)&self->_triggerType, v3);
  }
}

- (void)_setup
{
  self->_activationType = 0;
  [(HMDEvent *)self _updateTriggerType];
  BOOL v3 = NSString;
  id v8 = [(HMDEvent *)self eventTrigger];
  id v4 = [v8 name];
  v5 = [(HMDEvent *)self uuid];
  id v6 = [v5 UUIDString];
  char v7 = [v3 stringWithFormat:@"%@/%@", v4, v6];
  [(HMDEvent *)self setLogString:v7];
}

- (HMDEvent)initWithModel:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDEvent;
  id v8 = [(HMDEvent *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 uuid];
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v9;

    objc_storeWeak((id *)&v8->_home, v7);
    id v11 = [v6 endEvent];
    v8->_endEvent = [v11 BOOLValue];

    [(HMDEvent *)v8 _setup];
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_160057 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_160057, &__block_literal_global_160058);
  }
  v2 = (void *)logCategory__hmf_once_v1_160059;
  return v2;
}

void __23__HMDEvent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_160059;
  logCategory__hmf_once_v1_160059 = v0;
}

@end