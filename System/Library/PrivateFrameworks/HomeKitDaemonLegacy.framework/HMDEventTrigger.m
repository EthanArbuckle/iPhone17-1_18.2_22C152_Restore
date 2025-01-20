@interface HMDEventTrigger
+ (BOOL)__validateRecurrences:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)_checkAddEventModel:(id)a3 message:(id)a4;
- (BOOL)_isTriggerFiredNotificationEntitled;
- (BOOL)_populateTriggerModel:(id)a3 fromBuilderMessage:(id)a4 transaction:(id)a5 responsePayload:(id)a6;
- (BOOL)_validateUpdatingTriggerWithName:(id)a3 uuid:(id)a4 message:(id)a5;
- (BOOL)addEventsFromInfo:(char)a3 preserveUUIDs:(void *)a4 endEvent:(void *)a5 transaction:(void *)a6 message:(void *)a7 error:;
- (BOOL)addEventsFromMessage:(id)a3 preserveUUIDs:(BOOL)a4 transaction:(id)a5 error:(id *)a6;
- (BOOL)checkSharedEventTriggerActivationResidentRequirement:(id)a3;
- (BOOL)compatible:(id)a3 user:(id)a4;
- (BOOL)computedActive;
- (BOOL)containsRecurrences;
- (BOOL)doesTheLocationEventTargetCurrentUser;
- (BOOL)executeOnce;
- (BOOL)hasUserConfirmationSession;
- (BOOL)isAuthorizedForLocation;
- (BOOL)isEventTriggerOnLocalDeviceForAccessory:(id)a3;
- (BOOL)isEventTriggerOnRemoteGatewayForAccessory:(id)a3;
- (BOOL)isOwnerOfHome;
- (BOOL)migratedEventsToRecords;
- (BOOL)requiresDataVersion4;
- (BOOL)shouldActivateOnLocalDevice;
- (BOOL)shouldEncodeLastFireDate:(id)a3;
- (Class)eventTriggerTypeToEventClass:(id)a3;
- (HMDEventTrigger)initWithCoder:(id)a3;
- (HMDEventTrigger)initWithModel:(id)a3 home:(id)a4;
- (HMDEventTrigger)initWithModel:(id)a3 home:(id)a4 message:(id)a5;
- (HMDEventTrigger)initWithModel:(id)a3 home:(id)a4 message:(id)a5 factory:(id)a6;
- (HMDEventTriggerExecutionSession)executionSession;
- (HMDEventTriggerUserConfirmationSession)userConfirmationSession;
- (HMDPredicateUtilities)predicateUtilities;
- (HMFTimer)debounceTriggerActivationTimer;
- (NSArray)calendarEvents;
- (NSArray)charThresholdEvents;
- (NSArray)characteristicBaseEvents;
- (NSArray)characteristicEvents;
- (NSArray)durationEvents;
- (NSArray)endEvents;
- (NSArray)events;
- (NSArray)locationEvents;
- (NSArray)presenceEvents;
- (NSArray)recurrences;
- (NSArray)significantTimeEvents;
- (NSArray)timeEvents;
- (NSArray)triggerEvents;
- (NSMutableArray)currentEvents;
- (NSPredicate)evaluationCondition;
- (id)_modelWithRewrittenCondition:(id)a3;
- (id)_updateEventsOnEventTrigger:(id)a3;
- (id)backingStoreObjects:(int64_t)a3;
- (id)createEventModel:(id)a3 endEvent:(BOOL)a4 message:(id)a5 checkForSupport:(BOOL)a6 transaction:(id)a7 error:(id *)a8;
- (id)didOccurEvent:(id)a3 causingDevice:(id)a4;
- (id)dumpState;
- (id)emptyModelObject;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (uint64_t)updateEventsFromInfo:(void *)a1 existingEvents:(void *)a2 preserveUUIDs:(void *)a3 endEvent:(void *)a4 transaction:(void *)a5 message:(void *)a6 error:(void *)a7;
- (unint64_t)activationState;
- (unint64_t)activationType;
- (unint64_t)triggerType;
- (void)_activateEvents:(id)a3;
- (void)_activateWithCompletion:(id)a3;
- (void)_addEventModelFromDictionary:(uint64_t)a3 endEvent:(void *)a4 transaction:(void *)a5 message:(void *)a6 error:;
- (void)_addEventToEventTrigger:(id)a3;
- (void)_computeActivation;
- (void)_configureDebounceTriggerActivationTimer;
- (void)_evaluationConditionUpdated:(id)a3 message:(id)a4;
- (void)_eventTriggerRecurrencesUpdated:(id)a3 message:(id)a4;
- (void)_executeOnceUpdated:(id)a3 message:(id)a4;
- (void)_handleAddEventModel:(id)a3 message:(id)a4;
- (void)_handleAddEventToEventTrigger:(id)a3;
- (void)_handleEventTriggerUpdate:(id)a3 message:(id)a4;
- (void)_handleLocationAuthorizationChangedNotification:(id)a3;
- (void)_handleRemovalOfCharacteristic:(id)a3 withEvents:(id)a4 transaction:(id)a5;
- (void)_handleRemovalOfEvents:(id)a3 transaction:(id)a4;
- (void)_handleRemoveEventModel:(id)a3 message:(id)a4;
- (void)_handleRemoveEventsFromEventTrigger:(id)a3;
- (void)_handleRemoveEventsFromEventTrigger:(id)a3 relay:(BOOL)a4;
- (void)_handleUpdateEventTrigger:(id)a3;
- (void)_handleUpdateEventTriggerCondition:(id)a3;
- (void)_handleUpdateEventTriggerExecuteOnce:(id)a3;
- (void)_handleUpdateEventTriggerRecurrences:(id)a3;
- (void)_handleUpdateEventsOnEventTrigger:(id)a3;
- (void)_handleUpdateOwningDevice:(id)a3;
- (void)_handleUserPermissionRequest:(id)a3;
- (void)_migrateEventsToRecords;
- (void)_reevaluateIfRelaunchRequired;
- (void)_registerForMessages;
- (void)_removeEvents:(id)a3;
- (void)_removeEventsFromEventTrigger:(id)a3;
- (void)_resetExecutionState;
- (void)_transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)_updateEventTriggerExecuteOnce:(id)a3;
- (void)_updateEventTriggerRecurrences:(id)a3;
- (void)_updateOwningDevice:(id)a3;
- (void)_userDidConfirmExecute:(BOOL)a3 completionHandler:(id)a4;
- (void)addEvent:(id)a3;
- (void)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)executionComplete:(id)a3 error:(id)a4;
- (void)fixupForReplacementAccessory:(id)a3 transaction:(id)a4;
- (void)handleRemovalOfAccessory:(id)a3 transaction:(id)a4;
- (void)handleRemovalOfCharacteristic:(id)a3 transaction:(id)a4;
- (void)handleRemovalOfService:(id)a3 transaction:(id)a4;
- (void)handleRemovalOfUser:(id)a3 transaction:(id)a4;
- (void)invalidate;
- (void)processEventRecords:(id)a3 message:(id)a4;
- (void)removeEvent:(id)a3;
- (void)resetExecutionState;
- (void)sendTriggerFiredNotification:(id)a3;
- (void)setActivationState:(unint64_t)a3;
- (void)setActivationType:(unint64_t)a3;
- (void)setCurrentEvents:(id)a3;
- (void)setDebounceTriggerActivationTimer:(id)a3;
- (void)setEvaluationCondition:(id)a3;
- (void)setExecuteOnce:(BOOL)a3;
- (void)setExecutionSession:(id)a3;
- (void)setMigratedEventsToRecords:(BOOL)a3;
- (void)setPredicateUtilities:(id)a3;
- (void)setRecurrences:(id)a3;
- (void)setUserConfirmationSession:(id)a3;
- (void)takeOverOwnershipOfTrigger;
- (void)timerDidFire:(id)a3;
- (void)userDidConfirmExecute:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation HMDEventTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userConfirmationSession, 0);
  objc_storeStrong((id *)&self->_executionSession, 0);
  objc_storeStrong((id *)&self->_predicateUtilities, 0);
  objc_storeStrong((id *)&self->_evaluationCondition, 0);
  objc_storeStrong((id *)&self->_debounceTriggerActivationTimer, 0);
  objc_storeStrong((id *)&self->_currentEvents, 0);
  objc_storeStrong((id *)&self->_recurrences, 0);
  objc_storeStrong((id *)&self->_dependencyFactory, 0);
}

- (void)setActivationState:(unint64_t)a3
{
  self->_activationState = a3;
}

- (unint64_t)activationState
{
  return self->_activationState;
}

- (void)setActivationType:(unint64_t)a3
{
  self->_activationType = a3;
}

- (unint64_t)activationType
{
  return self->_activationType;
}

- (void)setUserConfirmationSession:(id)a3
{
}

- (HMDEventTriggerUserConfirmationSession)userConfirmationSession
{
  return self->_userConfirmationSession;
}

- (void)setExecutionSession:(id)a3
{
}

- (HMDEventTriggerExecutionSession)executionSession
{
  return self->_executionSession;
}

- (void)setPredicateUtilities:(id)a3
{
}

- (HMDPredicateUtilities)predicateUtilities
{
  return self->_predicateUtilities;
}

- (void)setExecuteOnce:(BOOL)a3
{
  self->_executeOnce = a3;
}

- (BOOL)executeOnce
{
  return self->_executeOnce;
}

- (void)setEvaluationCondition:(id)a3
{
}

- (NSPredicate)evaluationCondition
{
  return self->_evaluationCondition;
}

- (void)setDebounceTriggerActivationTimer:(id)a3
{
}

- (HMFTimer)debounceTriggerActivationTimer
{
  return self->_debounceTriggerActivationTimer;
}

- (void)setCurrentEvents:(id)a3
{
}

- (NSMutableArray)currentEvents
{
  return self->_currentEvents;
}

- (void)setMigratedEventsToRecords:(BOOL)a3
{
  self->_migratedEventsToRecords = a3;
}

- (BOOL)migratedEventsToRecords
{
  return self->_migratedEventsToRecords;
}

- (BOOL)isOwnerOfHome
{
  v2 = [(HMDTrigger *)self home];
  char v3 = [v2 isOwnerUser];

  return v3;
}

- (BOOL)isAuthorizedForLocation
{
  v2 = +[HMDLocation sharedManager];
  BOOL v3 = [v2 locationAuthorized] == 1;

  return v3;
}

- (BOOL)containsRecurrences
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(v14, 0, 7);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(HMDEventTrigger *)self recurrences];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v14[[*(id *)(*((void *)&v10 + 1) + 8 * v6++) weekday] - 1] = 1;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v4);
  }

  uint64_t v7 = 0;
  int v8 = 0;
  do
    v8 += v14[v7++];
  while (v7 != 7);
  return (v8 - 1) < 6;
}

- (id)emptyModelObject
{
  uint64_t v3 = [HMDEventTriggerModel alloc];
  uint64_t v4 = [(HMDTrigger *)self uuid];
  uint64_t v5 = [(HMDTrigger *)self home];
  uint64_t v6 = [v5 uuid];
  uint64_t v7 = [(HMDBackingStoreModelObject *)v3 initWithObjectChangeType:2 uuid:v4 parentUUID:v6];

  return v7;
}

- (id)backingStoreObjects:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(HMDEventTrigger *)self modelObjectWithChangeType:1 version:a3];
  [v5 addObject:v6];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(HMDEventTrigger *)self events];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) modelObjectWithChangeType:1];
        [v5 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v5;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  uint64_t v6 = [HMDEventTriggerModel alloc];
  uint64_t v7 = [(HMDTrigger *)self uuid];
  uint64_t v8 = [(HMDTrigger *)self home];
  uint64_t v9 = [v8 uuid];
  uint64_t v10 = [(HMDBackingStoreModelObject *)v6 initWithObjectChangeType:a3 uuid:v7 parentUUID:v9];

  [(HMDTrigger *)self _fillBaseObjectChangeModel:v10];
  long long v11 = [(HMDEventTrigger *)self evaluationCondition];

  if (v11)
  {
    long long v12 = (void *)MEMORY[0x1E4F28DB0];
    long long v13 = [(HMDEventTrigger *)self evaluationCondition];
    long long v14 = [v12 archivedDataWithRootObject:v13 requiringSecureCoding:1 error:0];
    [(HMDEventTriggerModel *)v10 setEvaluationCondition:v14];
  }
  long long v15 = [(HMDEventTrigger *)self recurrences];

  if (v15)
  {
    long long v16 = (void *)MEMORY[0x1E4F28DB0];
    long long v17 = [(HMDEventTrigger *)self recurrences];
    v18 = [v16 archivedDataWithRootObject:v17 requiringSecureCoding:1 error:0];
    [(HMDEventTriggerModel *)v10 setRecurrences:v18];
  }
  uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEventTrigger executeOnce](self, "executeOnce"));
  [(HMDEventTriggerModel *)v10 setExecuteOnce:v19];

  return v10;
}

- (void)_handleEventTriggerUpdate:(id)a3 message:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  uint64_t v7 = [v18 setProperties];
  int v8 = [v7 containsObject:@"evaluationCondition"];

  if (v8)
  {
    uint64_t v9 = [v18 evaluationCondition];
    uint64_t v10 = +[HMDPredicateUtilities decodePredicateFromData:v9 error:0];

    [(HMDEventTrigger *)self _evaluationConditionUpdated:v10 message:v6];
  }
  long long v11 = [v18 setProperties];
  int v12 = [v11 containsObject:@"recurrences"];

  if (v12)
  {
    long long v13 = [v18 recurrences];
    long long v14 = [v13 decodeArrayOfDateComponents];

    [(HMDEventTrigger *)self _eventTriggerRecurrencesUpdated:v14 message:v6];
  }
  long long v15 = [v18 setProperties];
  int v16 = [v15 containsObject:@"executeOnce"];

  if (v16)
  {
    long long v17 = [v18 executeOnce];
    [(HMDEventTrigger *)self _executeOnceUpdated:v17 message:v6];
  }
  [(HMDTrigger *)self _handleTriggerUpdate:v18 message:v6];
}

- (void)_transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    [(HMDEventTrigger *)self _handleRemoveEventModel:v10 message:v7];
  }
  else
  {
    long long v11 = (void *)MEMORY[0x1D9452090]();
    int v12 = self;
    long long v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      long long v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      int v16 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to cast the given model object to EventModel", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)processEventRecords:(id)a3 message:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    long long v11 = HMFGetLogIdentifier();
    int v14 = 138543362;
    int v15 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Saving to push the event records to cloud", (uint8_t *)&v14, 0xCu);
  }
  int v12 = [(HMDTrigger *)v9 home];
  long long v13 = [v7 name];
  [v12 saveWithReason:v13 postSyncNotification:0 objectChange:v6 != 0];
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v12 = v11;
  }
  else {
    int v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    int v14 = (void *)MEMORY[0x1D9452090]();
    int v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      int v31 = 138543362;
      v32 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling event trigger update", (uint8_t *)&v31, 0xCu);
    }
    [(HMDEventTrigger *)v15 _handleEventTriggerUpdate:v13 message:v10];
  }
  else
  {
    id v18 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
    id v20 = v19;

    if (v20)
    {
      v21 = [v10 name];
      int v22 = [v21 isEqualToString:@"kMigratedEventsToRecordsRequest"];

      if (v22)
      {
        [(HMDEventTrigger *)self processEventRecords:v20 message:v10];
      }
      else
      {
        v27 = (void *)MEMORY[0x1D9452090]();
        v28 = self;
        v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v30 = HMFGetLogIdentifier();
          int v31 = 138543362;
          v32 = v30;
          _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Handling event add", (uint8_t *)&v31, 0xCu);
        }
        [(HMDEventTrigger *)v28 _handleAddEventModel:v20 message:v10];
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x1D9452090]();
      v24 = self;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = HMFGetLogIdentifier();
        int v31 = 138543362;
        v32 = v26;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Unknown model object", (uint8_t *)&v31, 0xCu);
      }
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HMDEventTrigger;
  [(HMDTrigger *)&v26 encodeWithCoder:v4];
  if (objc_msgSend(v4, "hmd_isForXPCTransport")) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[HMDEventTrigger activationState](self, "activationState"), @"kEventTriggerActivationStateKey");
  }
  if (objc_msgSend(v4, "hmd_isForNonAdminSharedUser"))
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = [(HMDEventTrigger *)self presenceEvents];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
          int v12 = objc_msgSend(v4, "hmd_user");
          int v13 = [v11 compatibleWithUser:v12];

          if (v13) {
            [v5 addObject:v11];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }

    if ([v5 count])
    {
      int v14 = (void *)[v5 copy];
      [v4 encodeObject:v14 forKey:@"HM.eventTriggerEvents"];
    }
  }
  else
  {
    uint64_t v5 = [(HMDEventTrigger *)self events];
    [v4 encodeObject:v5 forKey:@"HM.eventTriggerEvents"];
  }

  int v15 = [(HMDEventTrigger *)self recurrences];

  if (v15)
  {
    uint64_t v16 = [(HMDEventTrigger *)self recurrences];
    [v4 encodeObject:v16 forKey:@"HM.eventTriggerRecurrences"];
  }
  uint64_t v17 = [(HMDEventTrigger *)self evaluationCondition];

  if (v17)
  {
    id v18 = [(HMDEventTrigger *)self evaluationCondition];
    if (objc_msgSend(v4, "hmd_isForXPCTransport"))
    {
      uint64_t v19 = [(HMDEventTrigger *)self predicateUtilities];
      id v20 = [(HMDEventTrigger *)self evaluationCondition];
      uint64_t v21 = [v19 rewritePredicateForClient:v20];

      id v18 = (void *)v21;
    }
    [v4 encodeObject:v18 forKey:@"HM.eventTriggerCondition"];
  }
  objc_msgSend(v4, "encodeBool:forKey:", -[HMDEventTrigger executeOnce](self, "executeOnce"), @"kEventTriggerExecuteOnce");
  if (objc_msgSend(v4, "hmd_isForLocalStore")) {
    objc_msgSend(v4, "encodeBool:forKey:", -[HMDEventTrigger migratedEventsToRecords](self, "migratedEventsToRecords"), @"HM.migratedEventsToRecords");
  }
}

- (HMDEventTrigger)initWithCoder:(id)a3
{
  v40[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)HMDEventTrigger;
  uint64_t v5 = [(HMDTrigger *)&v37 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    v40[2] = objc_opt_class();
    v40[3] = objc_opt_class();
    v40[4] = objc_opt_class();
    v40[5] = objc_opt_class();
    v40[6] = objc_opt_class();
    v40[7] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:8];
    uint64_t v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HM.eventTriggerEvents"];

    uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithArray:v9];
    currentEvents = v5->_currentEvents;
    v5->_currentEvents = (NSMutableArray *)v10;

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    int v12 = v5->_currentEvents;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v16++), "setEventTrigger:", v5, (void)v33);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v14);
    }

    uint64_t v17 = +[HMDPredicateUtilities predicateCodingClasses];
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"HM.eventTriggerCondition"];
    evaluationCondition = v5->_evaluationCondition;
    v5->_evaluationCondition = (NSPredicate *)v18;

    id v20 = (void *)MEMORY[0x1E4F1CAD0];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    long long v22 = [v20 setWithArray:v21];
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"HM.eventTriggerRecurrences"];
    recurrences = v5->_recurrences;
    v5->_recurrences = (NSArray *)v23;

    v5->_executeOnce = [v4 decodeBoolForKey:@"kEventTriggerExecuteOnce"];
    v5->_migratedEventsToRecords = [v4 decodeBoolForKey:@"HM.migratedEventsToRecords"];
    long long v25 = [HMDPredicateUtilities alloc];
    objc_super v26 = [(HMDTrigger *)v5 home];
    v27 = [(HMDTrigger *)v5 name];
    uint64_t v28 = [(HMDPredicateUtilities *)v25 initWithHome:v26 logIdentifier:v27];
    predicateUtilities = v5->_predicateUtilities;
    v5->_predicateUtilities = (HMDPredicateUtilities *)v28;

    v5->_lock._os_unfair_lock_opaque = 0;
    v30 = objc_alloc_init(HMDEventTriggerDependencyFactory);
    dependencyFactory = v5->_dependencyFactory;
    v5->_dependencyFactory = v30;
  }
  return v5;
}

- (BOOL)hasUserConfirmationSession
{
  uint64_t v3 = [(HMDEventTrigger *)self executionSession];
  id v4 = [v3 userConfirmationSession];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(HMDEventTrigger *)self userConfirmationSession];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (void)_handleUserPermissionRequest:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 uuidForKey:@"kEventTriggerExecutionSessionIdentifierKey"];
  uint64_t v6 = [v4 remoteSourceDevice];
  uint64_t v7 = (void *)v6;
  v47 = (void *)v5;
  if (v5 && v6)
  {
    uint64_t v8 = [(HMDTrigger *)self home];
    id v9 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    if ([v9 isRemote] && v11 && objc_msgSend(v11, "restriction") != 4)
    {
      int v12 = [v8 homeManager];
      uint64_t v13 = [v12 homeUserFromMessage:v9 home:v8];

      if (!v13 || ([(HMDEventTriggerDevice *)v13 isOwner] & 1) == 0)
      {
        v40 = (void *)MEMORY[0x1D9452090]();
        v41 = self;
        v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v49 = v43;
          __int16 v50 = 2112;
          id v51 = v9;
          _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Only owner may perform a user permission dialog: %@", buf, 0x16u);
        }
        v44 = [v9 responseHandler];

        if (!v44) {
          goto LABEL_26;
        }
        long long v34 = [v9 responseHandler];
        v45 = [MEMORY[0x1E4F28C58] hmErrorWithCode:17];
        ((void (**)(void, void *, void))v34)[2](v34, v45, 0);

        goto LABEL_20;
      }
    }
    uint64_t v14 = [(HMDEventTrigger *)self userConfirmationSession];

    if (v14)
    {
      uint64_t v15 = (void *)MEMORY[0x1D9452090]();
      uint64_t v16 = self;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v18 = v11;
        v20 = uint64_t v19 = v7;
        *(_DWORD *)buf = 138543362;
        v49 = v20;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@There is already a user confirmation session in progress, replacing it", buf, 0xCu);

        uint64_t v7 = v19;
        id v11 = v18;
      }

      [(HMDEventTrigger *)v16 setUserConfirmationSession:0];
    }
    v46 = v7;
    uint64_t v13 = [[HMDEventTriggerDevice alloc] initWithDevice:v7 forHome:v8];
    uint64_t v21 = [HMDEventTriggerUserConfirmationSession alloc];
    long long v22 = [(HMDTrigger *)self workQueue];
    uint64_t v23 = [(HMDTrigger *)self msgDispatcher];
    long long v24 = [(HMDEventTriggerUserConfirmationSession *)v21 initWithSessionID:v47 eventTrigger:self workQueue:v22 msgDispatcher:v23 requestingDevice:v13];
    [(HMDEventTrigger *)self setUserConfirmationSession:v24];

    long long v25 = (void *)MEMORY[0x1D9452090]();
    objc_super v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      [(HMDEventTrigger *)v26 userConfirmationSession];
      v29 = v8;
      int v31 = v30 = v13;
      *(_DWORD *)buf = 138543618;
      v49 = v28;
      __int16 v50 = 2112;
      id v51 = v31;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Created a user confirmation session %@", buf, 0x16u);

      uint64_t v13 = v30;
      uint64_t v8 = v29;
    }
    v32 = [(HMDEventTrigger *)v26 userConfirmationSession];
    [v32 createBulletinNotification];

    long long v33 = [v9 responseHandler];

    if (!v33)
    {
      uint64_t v7 = v46;
      goto LABEL_26;
    }
    long long v34 = [v9 responseHandler];
    v34[2](v34, 0, 0);
    uint64_t v7 = v46;
LABEL_20:

LABEL_26:
    goto LABEL_27;
  }
  long long v35 = (void *)MEMORY[0x1D9452090]();
  long long v36 = self;
  objc_super v37 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    v38 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v49 = v38;
    _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Did not receive execution session ID or requesting device", buf, 0xCu);
  }
  v39 = [v4 responseHandler];

  if (v39)
  {
    uint64_t v8 = [v4 responseHandler];
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    ((void (**)(void, id, void))v8)[2](v8, v11, 0);
LABEL_27:
  }
}

- (void)_userDidConfirmExecute:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(HMDEventTrigger *)self executionSession];
  uint64_t v8 = [v7 userConfirmationSession];

  if (v8)
  {
    id v9 = [(HMDEventTrigger *)self executionSession];
    uint64_t v10 = [v9 userConfirmationSession];
    [v10 userDidConfirmExecute:v4 completionHandler:v6];

LABEL_5:
    goto LABEL_6;
  }
  id v11 = [(HMDEventTrigger *)self userConfirmationSession];

  if (v11)
  {
    id v9 = [(HMDEventTrigger *)self userConfirmationSession];
    [v9 userDidConfirmExecute:v4 completionHandler:v6];
    goto LABEL_5;
  }
  int v12 = (void *)MEMORY[0x1D9452090]();
  uint64_t v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    int v18 = 138543362;
    uint64_t v19 = v15;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@There is no confirmation timer running, ignoring the response", (uint8_t *)&v18, 0xCu);
  }
  uint64_t v16 = _Block_copy(v6);
  uint64_t v17 = v16;
  if (v16) {
    (*((void (**)(void *, void))v16 + 2))(v16, 0);
  }

LABEL_6:
}

- (void)userDidConfirmExecute:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HMDTrigger *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HMDEventTrigger_userDidConfirmExecute_completionHandler___block_invoke;
  block[3] = &unk_1E6A113D0;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __59__HMDEventTrigger_userDidConfirmExecute_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _userDidConfirmExecute:*(unsigned __int8 *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (BOOL)_isTriggerFiredNotificationEntitled
{
  uint64_t v3 = [(HMDEventTrigger *)self presenceEvents];
  if ([v3 count])
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [(HMDEventTrigger *)self predicateUtilities];
    id v6 = [(HMDEventTrigger *)self evaluationCondition];
    char v4 = [v5 containsPresenceEvents:v6];
  }
  return v4;
}

- (void)takeOverOwnershipOfTrigger
{
  uint64_t v3 = [(HMDTrigger *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HMDEventTrigger_takeOverOwnershipOfTrigger__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __45__HMDEventTrigger_takeOverOwnershipOfTrigger__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = +[HMDAppleAccountManager sharedManager];
  uint64_t v3 = [v2 device];

  char v4 = [*(id *)(a1 + 32) owningDevice];
  int v5 = HMFEqualObjects();

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v9;
      __int16 v21 = 2112;
      long long v22 = v3;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Owning device is correctly set to %@, not changing", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v17 = @"HM.device";
    id v10 = encodeRootObject();
    int v18 = v10;
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];

    int v12 = (void *)MEMORY[0x1E4F65480];
    id v13 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "uuid", v17);
    uint64_t v15 = (void *)[v13 initWithTarget:v14];
    uint64_t v16 = [v12 messageWithName:@"kUpdateOwningDeviceRequestKey" destination:v15 payload:v11];

    [*(id *)(a1 + 32) _handleUpdateOwningDevice:v16];
  }
}

- (void)_resetExecutionState
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D9452090](self, a2);
  char v4 = self;
  int v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [(HMDEventTrigger *)v4 executionSession];
    id v8 = [(HMDEventTrigger *)v4 userConfirmationSession];
    int v9 = 138543874;
    id v10 = v6;
    __int16 v11 = 2112;
    int v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting execution sessions %@, confirmation session %@", (uint8_t *)&v9, 0x20u);
  }
  [(HMDEventTrigger *)v4 setExecutionSession:0];
  [(HMDEventTrigger *)v4 setUserConfirmationSession:0];
}

- (void)resetExecutionState
{
  uint64_t v3 = [(HMDTrigger *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__HMDEventTrigger_resetExecutionState__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __38__HMDEventTrigger_resetExecutionState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetExecutionState];
}

- (void)executionComplete:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDTrigger *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__HMDEventTrigger_executionComplete_error___block_invoke;
  block[3] = &unk_1E6A19668;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __43__HMDEventTrigger_executionComplete_error___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  char v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v13 = 138543874;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Action set execution session %@ is complete with error %@", (uint8_t *)&v13, 0x20u);
  }
  [*(id *)(a1 + 32) _resetExecutionState];
  if (!*(void *)(a1 + 48) && [*(id *)(a1 + 32) executeOnce])
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Trigger is marked to be executed once, deactivating", (uint8_t *)&v13, 0xCu);
    }
    [*(id *)(a1 + 32) setEnabled:0 message:0];
  }
  return [*(id *)(a1 + 32) executeCompleteWithError:*(void *)(a1 + 48)];
}

- (id)didOccurEvent:(id)a3 causingDevice:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (__CFString *)a3;
  uint64_t v7 = (__CFString *)a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v52 = v11;
    __int16 v53 = 2112;
    v54 = v7;
    __int16 v55 = 2112;
    v56 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Event occurred on device %@, %@", buf, 0x20u);
  }
  id v12 = [(HMDEventTrigger *)v9 executionSession];

  if (v12)
  {
    int v13 = [(HMDEventTrigger *)v9 executionSession];
    [v13 postponeRestoreIfWaitingForEndEvent];

    if (v7)
    {
      uint64_t v14 = [(HMDEventTrigger *)v9 executionSession];
      int v15 = [v14 needsUserConfirmation];

      uint64_t v16 = (void *)MEMORY[0x1D9452090]();
      __int16 v17 = v9;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        if (v15) {
          uint64_t v20 = &stru_1F2C9F1A8;
        }
        else {
          uint64_t v20 = @"not ";
        }
        __int16 v21 = [(HMDEventTrigger *)v17 executionSession];
        *(_DWORD *)buf = 138544130;
        uint64_t v52 = v19;
        __int16 v53 = 2112;
        v54 = v20;
        __int16 v55 = 2112;
        v56 = v7;
        __int16 v57 = 2112;
        v58 = v21;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Execution session is already in progress, %@adding occurred device %@ for asking confirmation %@", buf, 0x2Au);
      }
      if (v15)
      {
        long long v22 = [(HMDEventTrigger *)v17 executionSession];
        [v22 addEvent:v6 causingDevice:v7];

        uint64_t v23 = [(HMDEventTrigger *)v17 executionSession];
        goto LABEL_21;
      }
    }
    else
    {
      v44 = (void *)MEMORY[0x1D9452090]();
      v45 = v9;
      v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v47 = HMFGetLogIdentifier();
        v48 = [(HMDEventTrigger *)v45 executionSession];
        *(_DWORD *)buf = 138543618;
        uint64_t v52 = v47;
        __int16 v53 = 2112;
        v54 = v48;
        _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_INFO, "%{public}@Execution session is already in progress, not executing again %@", buf, 0x16u);
      }
    }
    uint64_t v23 = 0;
  }
  else
  {
    __int16 v50 = v6;
    long long v24 = (void *)MEMORY[0x1D9452090]();
    long long v25 = v9;
    objc_super v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = HMFGetLogIdentifier();
      uint64_t v28 = [(HMDEventTrigger *)v25 endEvents];
      *(_DWORD *)buf = 138543618;
      uint64_t v52 = v27;
      __int16 v53 = 2112;
      v54 = v28;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Creating execution session with end events %@", buf, 0x16u);
    }
    v29 = [HMDEventTriggerExecutionSession alloc];
    v30 = [(HMDEventTrigger *)v25 predicateUtilities];
    int v31 = [(HMDTrigger *)v25 workQueue];
    v32 = [(HMDTrigger *)v25 actionSets];
    long long v33 = [(HMDEventTrigger *)v25 evaluationCondition];
    long long v34 = [(HMDEventTrigger *)v25 recurrences];
    long long v35 = [(HMDEventTrigger *)v25 endEvents];
    long long v36 = [(HMDTrigger *)v25 msgDispatcher];
    objc_super v37 = [(HMDEventTriggerExecutionSession *)v29 initWithEventTrigger:v25 predicateUtilities:v30 triggerEvent:v50 causingDevice:v7 workQueue:v31 actionSets:v32 evaluationCondition:v33 recurrences:v34 endEvents:v35 msgDispatcher:v36];
    [(HMDEventTrigger *)v25 setExecutionSession:v37];

    v38 = (void *)MEMORY[0x1D9452090]();
    v39 = v25;
    v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v41 = HMFGetLogIdentifier();
      v42 = [(HMDEventTrigger *)v39 executionSession];
      *(_DWORD *)buf = 138543618;
      uint64_t v52 = v41;
      __int16 v53 = 2112;
      v54 = v42;
      _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_INFO, "%{public}@Created action set execution session: %@", buf, 0x16u);
    }
    v43 = [(HMDEventTrigger *)v39 executionSession];
    [v43 evaluateFiringTrigger];

    uint64_t v23 = [(HMDEventTrigger *)v39 executionSession];
    uint64_t v6 = v50;
  }
LABEL_21:

  return v23;
}

- (BOOL)isEventTriggerOnLocalDeviceForAccessory:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  id v6 = v5;

  if (v6
    && [(HMDEventTrigger *)self computedActive]
    && [(HMDEventTrigger *)self shouldActivateOnLocalDevice])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v26 = self;
    id obj = [(HMDEventTrigger *)self characteristicBaseEvents];
    uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(obj);
          }
          __int16 v11 = [*(id *)(*((void *)&v28 + 1) + 8 * i) characteristic];
          id v12 = [v11 accessory];
          int v13 = [v12 identifier];
          uint64_t v14 = [v6 identifier];
          int v15 = [v13 isEqualToString:v14];

          if (v15)
          {
            long long v22 = (void *)MEMORY[0x1D9452090]();
            uint64_t v23 = v26;
            long long v24 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              long long v25 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              long long v33 = v25;
              __int16 v34 = 2080;
              long long v35 = "-[HMDEventTrigger isEventTriggerOnLocalDeviceForAccessory:]";
              _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Event trigger will run locally. [%s]", buf, 0x16u);
            }

            BOOL v20 = 1;
            goto LABEL_19;
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    self = v26;
  }
  uint64_t v16 = (void *)MEMORY[0x1D9452090]();
  __int16 v17 = self;
  uint64_t v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v33 = v19;
    __int16 v34 = 2080;
    long long v35 = "-[HMDEventTrigger isEventTriggerOnLocalDeviceForAccessory:]";
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Event trigger will run on the resident. [%s]", buf, 0x16u);
  }
  BOOL v20 = 0;
LABEL_19:

  return v20;
}

- (BOOL)isEventTriggerOnRemoteGatewayForAccessory:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  id v6 = v5;

  if (v6
    && [(HMDEventTrigger *)self computedActive]
    && ![(HMDEventTrigger *)self shouldActivateOnLocalDevice])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v26 = self;
    id obj = [(HMDEventTrigger *)self characteristicBaseEvents];
    uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(obj);
          }
          __int16 v11 = [*(id *)(*((void *)&v28 + 1) + 8 * i) characteristic];
          id v12 = [v11 accessory];
          int v13 = [v12 identifier];
          uint64_t v14 = [v6 identifier];
          int v15 = [v13 isEqualToString:v14];

          if (v15)
          {
            long long v22 = (void *)MEMORY[0x1D9452090]();
            uint64_t v23 = v26;
            long long v24 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              long long v25 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              long long v33 = v25;
              __int16 v34 = 2080;
              long long v35 = "-[HMDEventTrigger isEventTriggerOnRemoteGatewayForAccessory:]";
              _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Event trigger will run on the resident. [%s]", buf, 0x16u);
            }

            BOOL v20 = 1;
            goto LABEL_19;
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    self = v26;
  }
  uint64_t v16 = (void *)MEMORY[0x1D9452090]();
  __int16 v17 = self;
  uint64_t v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v33 = v19;
    __int16 v34 = 2080;
    long long v35 = "-[HMDEventTrigger isEventTriggerOnRemoteGatewayForAccessory:]";
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Event trigger will run locally. [%s]", buf, 0x16u);
  }
  BOOL v20 = 0;
LABEL_19:

  return v20;
}

- (void)_executeOnceUpdated:(id)a3 message:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  -[HMDEventTrigger setExecuteOnce:](self, "setExecuteOnce:", [a3 BOOLValue]);
  uint64_t v9 = @"kEventTriggerExecuteOnce";
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEventTrigger executeOnce](self, "executeOnce"));
  v10[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  [v6 respondWithPayload:v8];
}

- (void)_updateEventTriggerExecuteOnce:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMDEventTrigger *)self checkSharedEventTriggerActivationResidentRequirement:v4])
  {
    uint64_t v5 = [v4 BOOLForKey:@"kEventTriggerExecuteOnce"];
    id v6 = [(HMDEventTrigger *)self emptyModelObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;

    uint64_t v9 = [NSNumber numberWithBool:v5];
    [v8 setExecuteOnce:v9];

    id v10 = [(HMDTrigger *)self home];
    __int16 v11 = [v10 backingStore];
    id v12 = [v4 name];
    int v13 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    uint64_t v14 = [v11 transaction:v12 options:v13];

    [v14 add:v8 withMessage:v4];
    [v14 run];
  }
  else
  {
    int v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      BOOL v20 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Execute once requires shared-trigger-activation capable homehub", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)_handleUpdateEventTriggerExecuteOnce:(id)a3
{
  uint64_t v4 = [(HMDTrigger *)self updateEventTriggerMessage:6 message:a3 relay:1];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(HMDEventTrigger *)self _updateEventTriggerExecuteOnce:v4];
    uint64_t v5 = v6;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_updateOwningDevice:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMDEventTrigger *)self checkSharedEventTriggerActivationResidentRequirement:v4])
  {
    uint64_t v5 = [v4 dataForKey:@"HM.device"];
    id v27 = 0;
    uint64_t v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v27];
    id v7 = v27;
    id v8 = (void *)MEMORY[0x1D9452090]();
    uint64_t v9 = self;
    id v10 = HMFGetOSLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v11)
      {
        id v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v29 = v12;
        __int16 v30 = 2112;
        id v31 = v6;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Taking over owner ship of trigger to %@", buf, 0x16u);
      }
      int v13 = [(HMDEventTrigger *)v9 emptyModelObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 0;
      }
      id v15 = v14;

      [v15 setOwningDevice:v6];
      uint64_t v16 = [(HMDTrigger *)v9 home];
      __int16 v17 = [v16 backingStore];
      uint64_t v18 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      int v19 = [v17 transaction:@"UpdateOwningDevice" options:v18];

      [v19 add:v15 withMessage:v4];
      [v19 run];
    }
    else
    {
      if (v11)
      {
        long long v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v29 = v24;
        __int16 v30 = 2112;
        id v31 = v7;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to unarchive device from device data: %@", buf, 0x16u);
      }
      long long v25 = [v4 responseHandler];

      if (!v25) {
        goto LABEL_17;
      }
      int v19 = [v4 responseHandler];
      objc_super v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      ((void (**)(void, void *, void))v19)[2](v19, v26, 0);
    }
LABEL_17:

    goto LABEL_18;
  }
  BOOL v20 = (void *)MEMORY[0x1D9452090]();
  uint64_t v21 = self;
  long long v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v29 = v23;
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating owning device requires shared-trigger-activation capable homehub", buf, 0xCu);
  }
LABEL_18:
}

- (void)_handleUpdateOwningDevice:(id)a3
{
  uint64_t v4 = [(HMDTrigger *)self updateEventTriggerMessage:7 message:a3 relay:1];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(HMDEventTrigger *)self _updateOwningDevice:v4];
    uint64_t v5 = v6;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_evaluationConditionUpdated:(id)a3 message:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDEventTrigger *)self predicateUtilities];
  uint64_t v9 = [v8 rewritePredicateForDaemon:v7 message:v6];

  [(HMDEventTrigger *)self setEvaluationCondition:v9];
  id v10 = [(HMDEventTrigger *)self evaluationCondition];

  if (v10)
  {
    uint64_t v16 = @"kEventTriggerConditionKey";
    BOOL v11 = [(HMDEventTrigger *)self predicateUtilities];
    id v12 = [(HMDEventTrigger *)self evaluationCondition];
    int v13 = [v11 rewritePredicateForClient:v12];
    uint64_t v14 = encodeRootObject();
    v17[0] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  }
  else
  {
    id v15 = 0;
  }
  [v6 respondWithPayload:v15];
}

- (void)_handleUpdateEventTriggerCondition:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDTrigger *)self updateEventTriggerMessage:4 message:v4 relay:1];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 predicateForKey:@"kEventTriggerConditionKey"];
    id v8 = (void *)MEMORY[0x1D9452090]();
    uint64_t v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = HMFGetLogIdentifier();
      int v29 = 138543618;
      __int16 v30 = v11;
      __int16 v31 = 2112;
      uint64_t v32 = v7;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating evaluation condition for trigger %@", (uint8_t *)&v29, 0x16u);
    }
    id v12 = [(HMDEventTrigger *)v9 predicateUtilities];
    int v13 = [v12 containsPresenceEvents:v7];

    if (v13
      && ![(HMDEventTrigger *)v9 checkSharedEventTriggerActivationResidentRequirement:v6])
    {
      long long v25 = (void *)MEMORY[0x1D9452090]();
      objc_super v26 = v9;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        long long v28 = HMFGetLogIdentifier();
        int v29 = 138543362;
        __int16 v30 = v28;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Presence Event Condition requires shared-trigger-activation capable homehub", (uint8_t *)&v29, 0xCu);
      }
    }
    else
    {
      uint64_t v14 = [(HMDEventTrigger *)v9 emptyModelObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v15 = v14;
      }
      else {
        id v15 = 0;
      }
      id v16 = v15;

      __int16 v17 = [(HMDEventTrigger *)v9 predicateUtilities];
      uint64_t v18 = [v17 rewritePredicateForDaemon:v7 message:v6];

      int v19 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v18 requiringSecureCoding:1 error:0];
      [v16 setEvaluationCondition:v19];

      BOOL v20 = [(HMDTrigger *)v9 home];
      uint64_t v21 = [v20 backingStore];
      long long v22 = [v6 name];
      uint64_t v23 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      long long v24 = [v21 transaction:v22 options:v23];

      [v24 add:v16 withMessage:v6];
      [v24 run];
    }
  }
}

- (void)_eventTriggerRecurrencesUpdated:(id)a3 message:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)[a3 copy];
  [(HMDEventTrigger *)self setRecurrences:v7];

  id v8 = [(HMDEventTrigger *)self recurrences];
  uint64_t v9 = encodeRootObject();

  if (v9)
  {
    BOOL v11 = @"kEventTriggerRecurrencesKey";
    v12[0] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  else
  {
    id v10 = 0;
  }
  [v6 respondWithPayload:v10];
}

- (void)_updateEventTriggerRecurrences:(id)a3
{
  id v4 = a3;
  id v15 = [v4 arrayOfDateComponentsForKey:@"kEventTriggerRecurrencesKey"];
  if (+[HMDEventTrigger __validateRecurrences:](HMDEventTrigger, "__validateRecurrences:"))
  {
    uint64_t v5 = [(HMDEventTrigger *)self emptyModelObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v15 requiringSecureCoding:1 error:0];
    [v7 setRecurrences:v8];

    uint64_t v9 = [(HMDTrigger *)self home];
    id v10 = [v9 backingStore];
    BOOL v11 = [v4 name];
    id v12 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    int v13 = [v10 transaction:v11 options:v12];

    [v13 add:v7 withMessage:v4];
    [v13 run];
  }
  else
  {
    int v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:3 userInfo:0];
    uint64_t v14 = [v4 responseHandler];

    ((void (**)(void, void *, void))v14)[2](v14, v13, 0);
  }
}

- (void)_handleUpdateEventTriggerRecurrences:(id)a3
{
  uint64_t v4 = [(HMDTrigger *)self updateEventTriggerMessage:5 message:a3 relay:1];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(HMDEventTrigger *)self _updateEventTriggerRecurrences:v4];
    uint64_t v5 = v6;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (BOOL)_populateTriggerModel:(id)a3 fromBuilderMessage:(id)a4 transaction:(id)a5 responsePayload:(id)a6
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v80 = a3;
  id v10 = a4;
  id v82 = a5;
  id v81 = a6;
  id obj = self;
  v83 = [(HMDTrigger *)self home];
  id v84 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  v79 = v10;
  BOOL v11 = [v10 arrayForKey:@"kTriggerActionSetUUIDKey"];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v97 objects:v107 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v98;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v98 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(id *)(*((void *)&v97 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          __int16 v17 = v16;
        }
        else {
          __int16 v17 = 0;
        }
        id v18 = v17;

        if (!v18) {
          goto LABEL_25;
        }
        uint64_t v19 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v18];
        if (!v19)
        {
          id v18 = v16;
LABEL_25:
          long long v35 = (void *)MEMORY[0x1D9452090]();
          long long v36 = obj;
          uint64_t v37 = HMFGetOSLogHandle();
          v39 = v79;
          v38 = v80;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v40 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v104 = v40;
            __int16 v105 = 2112;
            id v106 = v18;
            _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Invalid ActionSet reference: '%@'", buf, 0x16u);
          }
          id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
          [v79 respondWithError:v20];
          goto LABEL_57;
        }
        id v20 = (id)v19;
        uint64_t v21 = [v83 actionSetWithUUID:v19];
        if (!v21)
        {
          v41 = (void *)MEMORY[0x1D9452090]();
          v42 = obj;
          v43 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            v44 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v104 = v44;
            __int16 v105 = 2112;
            id v106 = v20;
            _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to resolve ActionSet reference: %@", buf, 0x16u);
          }
          v45 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
          v39 = v79;
          [v79 respondWithError:v45];

          BOOL v46 = 0;
          v38 = v80;
          goto LABEL_58;
        }
        long long v22 = v21;
        uint64_t v23 = [v21 uuid];
        long long v24 = [v23 UUIDString];
        [v84 addObject:v24];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v97 objects:v107 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v25 = [(HMDTrigger *)obj actionSets];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v93 objects:v102 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    BOOL v11 = 0;
    uint64_t v28 = *(void *)v94;
    uint64_t v29 = *MEMORY[0x1E4F2C950];
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v94 != v28) {
          objc_enumerationMutation(v25);
        }
        __int16 v31 = *(void **)(*((void *)&v93 + 1) + 8 * j);
        uint64_t v32 = [v31 type];
        int v33 = [v32 isEqual:v29];

        if (v33)
        {
          id v34 = v31;

          BOOL v11 = v34;
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v93 objects:v102 count:16];
    }
    while (v27);
  }
  else
  {
    BOOL v11 = 0;
  }

  v39 = v79;
  id v18 = [v79 dictionaryForKey:@"kTriggerOwnedActionSetKey"];
  v38 = v80;
  if (!v18) {
    goto LABEL_52;
  }
  if (v11)
  {
    uint64_t v47 = [v11 modelObjectWithChangeType:2];
    [v82 add:v47];

    id v91 = 0;
    id v92 = 0;
    LOBYTE(v47) = -[HMDActionSet _updateActionSetFromDictionary:transaction:response:error:](v11, v18, v82, &v92, &v91);
    id v48 = v92;
    id v20 = v91;
    if (v47)
    {
      [v81 setObject:v48 forKeyedSubscript:@"kTriggerOwnedActionSetKey"];
      v49 = [v11 uuid];
      __int16 v50 = [v49 UUIDString];
      [v84 addObject:v50];
LABEL_51:

LABEL_52:
      id v20 = (id)[v84 copy];
      [v38 setCurrentActionSets:v20];
      BOOL v46 = 1;
      goto LABEL_58;
    }
    v64 = (void *)MEMORY[0x1D9452090]();
    v65 = obj;
    v66 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      v67 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v104 = v67;
      _os_log_impl(&dword_1D49D5000, v66, OS_LOG_TYPE_ERROR, "%{public}@Failed to modify trigger-owned action set", buf, 0xCu);
    }
    [v79 respondWithError:v20];
  }
  else
  {
    id v51 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v52 = objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", v51);
    __int16 v53 = [v52 UUIDString];

    v54 = (void *)*MEMORY[0x1E4F2C950];
    id v89 = 0;
    id v90 = 0;
    v75 = v53;
    __int16 v55 = -[HMDHome _createActionSetWithUUID:name:type:fromDictionary:transaction:response:error:](v83, v51, v53, v54, v18, v82, &v90, &v89);
    id v48 = v90;
    id v20 = v89;

    v76 = v51;
    if (v55)
    {
      id v74 = v48;
      [v81 setObject:v48 forKeyedSubscript:@"kTriggerOwnedActionSetKey"];
      v56 = [v51 UUIDString];
      [v84 addObject:v56];

      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id obja = [(HMDTrigger *)obj actionSets];
      uint64_t v57 = [obja countByEnumeratingWithState:&v85 objects:v101 count:16];
      if (v57)
      {
        uint64_t v58 = v57;
        uint64_t v59 = *(void *)v86;
        while (2)
        {
          for (uint64_t k = 0; k != v58; ++k)
          {
            if (*(void *)v86 != v59) {
              objc_enumerationMutation(obja);
            }
            v61 = *(void **)(*((void *)&v85 + 1) + 8 * k);
            v62 = [v61 type];
            int v63 = [v62 isEqualToString:v54];

            if (v63)
            {
              v68 = [v61 modelObjectWithChangeType:3];
              [v82 add:v68];

              goto LABEL_50;
            }
          }
          uint64_t v58 = [obja countByEnumeratingWithState:&v85 objects:v101 count:16];
          if (v58) {
            continue;
          }
          break;
        }
      }
LABEL_50:

      v39 = v79;
      v38 = v80;
      id v48 = v74;
      __int16 v50 = v75;
      v49 = v76;
      goto LABEL_51;
    }
    v69 = (void *)MEMORY[0x1D9452090]();
    v70 = obj;
    v71 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      v72 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v104 = v72;
      _os_log_impl(&dword_1D49D5000, v71, OS_LOG_TYPE_ERROR, "%{public}@Failed to create trigger-owned action set", buf, 0xCu);
    }
    [v79 respondWithError:v20];
  }
LABEL_57:
  BOOL v46 = 0;
LABEL_58:

  return v46;
}

- (BOOL)_validateUpdatingTriggerWithName:(id)a3 uuid:(id)a4 message:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = 20;
LABEL_9:
    id v18 = [v16 hmErrorWithCode:v17];
    [v10 respondWithError:v18];

    BOOL v19 = 0;
    goto LABEL_10;
  }
  if (![v8 length])
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = 3;
    goto LABEL_9;
  }
  unint64_t v11 = HMMaxLengthForNaming();
  if ([v8 length] > v11)
  {
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      int v26 = 138543362;
      uint64_t v27 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", (uint8_t *)&v26, 0xCu);
    }
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = 46;
    goto LABEL_9;
  }
  uint64_t v21 = [(HMDTrigger *)self home];
  long long v22 = [v21 triggerWithName:v8];

  if (v22
    && ([v22 uuid],
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        char v24 = [v23 isEqual:v9],
        v23,
        (v24 & 1) == 0))
  {
    long long v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:1];
    [v10 respondWithError:v25];

    BOOL v19 = 0;
  }
  else
  {
    BOOL v19 = 1;
  }

LABEL_10:
  return v19;
}

- (Class)eventTriggerTypeToEventClass:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"kEventTriggerTypeCharacteristicEventKey"] & 1) != 0
    || ([v3 isEqualToString:@"kEventTriggerTypeLocationEventKey"] & 1) != 0
    || ([v3 isEqualToString:@"kEventTriggerTypeCalendarEventKey"] & 1) != 0
    || ([v3 isEqualToString:@"kEventTriggerTypeSignificantTimeEventKey"] & 1) != 0
    || ([v3 isEqualToString:@"kEventTriggerTypeCharacteristicThresholdRangeEventKey"] & 1) != 0
    || ([v3 isEqualToString:@"kEventTriggerTypePresenceEventKey"] & 1) != 0
    || [v3 isEqualToString:@"kEventTriggerTypeDurationEventKey"])
  {
    uint64_t v4 = objc_opt_class();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (Class)v4;
}

- (void)_handleUpdateEventTrigger:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 messagePayload];
    *(_DWORD *)buf = 138543874;
    v67 = v8;
    __int16 v68 = 2112;
    id v69 = v4;
    __int16 v70 = 2112;
    v71 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Received request to update Event Trigger %@ / %@", buf, 0x20u);
  }
  uint64_t v52 = [(HMDTrigger *)v6 home];
  id v10 = [v52 enabledResidents];
  BOOL v11 = [v10 count] == 0;

  if (!v11)
  {
    id v51 = [v4 stringForKey:@"kTriggerName"];
    v49 = [v4 numberForKey:@"kEventTriggerRecurrencesKey"];
    if ([v49 unsignedIntegerValue] == 127)
    {
      id v48 = 0;
    }
    else
    {
      id v48 = HMDaysOfTheWeekToDateComponents();
    }
    __int16 v50 = (void *)[v4 mutableCopy];
    objc_initWeak(&location, v6);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __45__HMDEventTrigger__handleUpdateEventTrigger___block_invoke;
    v62[3] = &unk_1E6A17958;
    objc_copyWeak(&v64, &location);
    id v12 = v4;
    id v63 = v12;
    [v50 setResponseHandler:v62];
    uint64_t v13 = [(HMDTrigger *)v6 name];
    if ([v13 isEqualToString:v51])
    {
    }
    else
    {
      uint64_t v14 = [(HMDTrigger *)v6 uuid];
      BOOL v15 = [(HMDEventTrigger *)v6 _validateUpdatingTriggerWithName:v51 uuid:v14 message:v50];

      if (!v15)
      {
LABEL_28:

        objc_destroyWeak(&v64);
        objc_destroyWeak(&location);

        goto LABEL_29;
      }
    }
    if (v49 || +[HMDEventTrigger __validateRecurrences:v48])
    {
      id v16 = [HMDEventTriggerModel alloc];
      uint64_t v17 = [(HMDTrigger *)v6 uuid];
      id v18 = [v52 uuid];
      BOOL v19 = [(HMDBackingStoreModelObject *)v16 initWithObjectChangeType:2 uuid:v17 parentUUID:v18];

      id v20 = [v52 backingStore];
      uint64_t v21 = [v12 name];
      long long v22 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      uint64_t v47 = [v20 transaction:v21 options:v22];

      [(HMDEventTriggerModel *)v19 setName:v51];
      uint64_t v23 = [v12 stringForKey:*MEMORY[0x1E4F2E1E0]];
      [(HMDEventTriggerModel *)v19 setConfiguredName:v23];

      char v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "BOOLForKey:", @"kTriggerActivate"));
      [(HMDEventTriggerModel *)v19 setActive:v24];

      BOOL v46 = [v12 predicateForKey:@"kEventTriggerConditionKey"];
      if (v46)
      {
        long long v25 = [(HMDEventTrigger *)v6 predicateUtilities];
        int v26 = [v25 rewritePredicateForDaemon:v46 message:v12];

        uint64_t v27 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v26 requiringSecureCoding:1 error:0];
        [(HMDEventTriggerModel *)v19 setEvaluationCondition:v27];
      }
      else
      {
        [(HMDEventTriggerModel *)v19 setEvaluationCondition:0];
      }
      uint64_t v28 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v48 requiringSecureCoding:1 error:0];
      [(HMDEventTriggerModel *)v19 setRecurrences:v28];

      uint64_t v29 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "BOOLForKey:", @"kEventTriggerExecuteOnce"));
      [(HMDEventTriggerModel *)v19 setExecuteOnce:v29];

      __int16 v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "BOOLForKey:", *MEMORY[0x1E4F2E1F0]));
      [(HMDEventTriggerModel *)v19 setAutoDelete:v30];

      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if ([(HMDEventTrigger *)v6 _populateTriggerModel:v19 fromBuilderMessage:v50 transaction:v47 responsePayload:v31])
      {
        v45 = [[HMDEventTrigger alloc] initWithModel:v19 home:v52 message:v12];
        uint64_t v32 = [v12 arrayForKey:@"kEventTriggerEventsKey"];
        int v33 = [(HMDEventTrigger *)v6 triggerEvents];
        id v34 = (void *)[v33 mutableCopy];
        id v61 = 0;
        char v35 = -[HMDEventTrigger updateEventsFromInfo:existingEvents:preserveUUIDs:endEvent:transaction:message:error:](v45, v32, v34, MEMORY[0x1E4F1CC28], v47, v12, &v61);
        id v36 = v61;

        if (v35)
        {

          uint64_t v37 = [v12 arrayForKey:@"kEventTriggerEndEventsKey"];
          v38 = [(HMDEventTrigger *)v6 endEvents];
          v39 = (void *)[v38 mutableCopy];
          id v60 = 0;
          char v40 = -[HMDEventTrigger updateEventsFromInfo:existingEvents:preserveUUIDs:endEvent:transaction:message:error:](v45, v37, v39, MEMORY[0x1E4F1CC38], v47, v12, &v60);
          id v36 = v60;

          if (v40)
          {
            [v47 add:v19];
            v53[0] = MEMORY[0x1E4F143A8];
            v53[1] = 3221225472;
            v53[2] = __45__HMDEventTrigger__handleUpdateEventTrigger___block_invoke_114;
            v53[3] = &unk_1E6A09030;
            id v54 = v50;
            id v55 = v31;
            v56 = v19;
            id v57 = v46;
            id v58 = v52;
            uint64_t v59 = v6;
            [v47 run:v53];
          }
          else
          {
            [v50 respondWithError:v36];
          }
        }
        else
        {
          [v50 respondWithError:v36];
        }
      }
    }
    else
    {
      v41 = (void *)MEMORY[0x1D9452090]();
      v42 = v6;
      HMFGetOSLogHandle();
      v43 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v67 = v44;
        __int16 v68 = 2112;
        id v69 = v48;
        _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@Received invalid values for recurrences: %@", buf, 0x16u);
      }
      BOOL v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v50 respondWithError:v19];
    }

    goto LABEL_28;
  }
  id v51 = [MEMORY[0x1E4F28C58] hmErrorWithCode:91];
  [v4 respondWithError:v51];
LABEL_29:
}

void __45__HMDEventTrigger__handleUpdateEventTrigger___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    BOOL v11 = HMFGetLogIdentifier();
    int v12 = 138543874;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Responding to the client about update event trigger status : Payload : [%@], error : [%@]", (uint8_t *)&v12, 0x20u);
  }
  [*(id *)(a1 + 32) respondWithPayload:v6 error:v5];
}

- (uint64_t)updateEventsFromInfo:(void *)a1 existingEvents:(void *)a2 preserveUUIDs:(void *)a3 endEvent:(void *)a4 transaction:(void *)a5 message:(void *)a6 error:(void *)a7
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v72 = a3;
  id v14 = a4;
  id v15 = a5;
  id v74 = a6;
  if (a1)
  {
    id v71 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v73 = [a1 home];
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v70 = v13;
    id obj = v13;
    uint64_t v83 = [obj countByEnumeratingWithState:&v93 objects:v106 count:16];
    if (v83)
    {
      uint64_t v81 = *(void *)v94;
      *(void *)&long long v16 = 138543874;
      long long v69 = v16;
      id v82 = v14;
      v79 = a1;
      v75 = a7;
      while (2)
      {
        for (uint64_t i = 0; i != v83; ++i)
        {
          if (*(void *)v94 != v81) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(id *)(*((void *)&v93 + 1) + 8 * i);
          BOOL v19 = v18;
          if (v14) {
            uint64_t v20 = [v14 BOOLValue];
          }
          else {
            uint64_t v20 = objc_msgSend(v18, "hmf_BOOLForKey:", @"kEventTriggerEndEvent");
          }
          uint64_t v21 = v20;
          id v22 = v19;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v23 = v22;
          }
          else {
            uint64_t v23 = 0;
          }
          id v24 = v23;

          if (v24)
          {
            uint64_t v25 = objc_msgSend(v22, "hmf_stringForKey:", @"kEventTriggerTypeKey");
            if (v25)
            {
              id v80 = (void *)v25;
              int v26 = (objc_class *)objc_msgSend(a1, "eventTriggerTypeToEventClass:");
              if (v26)
              {
                id v76 = v24;
                id v27 = [v26 alloc];
                id v92 = 0;
                [a1 createEventModel:v22 endEvent:v21 message:v74 checkForSupport:1 transaction:v15 error:&v92];
                v29 = uint64_t v28 = a1;
                id v77 = v92;
                __int16 v30 = (void *)[v27 initWithModel:v29 home:v73];

                if (v30)
                {
                  [v71 addObject:v30];
                  long long v90 = 0u;
                  long long v91 = 0u;
                  long long v88 = 0u;
                  long long v89 = 0u;
                  id v31 = v72;
                  uint64_t v32 = [v31 countByEnumeratingWithState:&v88 objects:v99 count:16];
                  if (v32)
                  {
                    uint64_t v33 = v32;
                    uint64_t v34 = *(void *)v89;
LABEL_19:
                    uint64_t v35 = 0;
                    while (1)
                    {
                      if (*(void *)v89 != v34) {
                        objc_enumerationMutation(v31);
                      }
                      id v36 = *(void **)(*((void *)&v88 + 1) + 8 * v35);
                      if (objc_msgSend(v36, "isCompatibleWithEvent:", v30, v69)) {
                        break;
                      }
                      if (v33 == ++v35)
                      {
                        uint64_t v33 = [v31 countByEnumeratingWithState:&v88 objects:v99 count:16];
                        if (v33) {
                          goto LABEL_19;
                        }
                        goto LABEL_25;
                      }
                    }
                    id v53 = v36;

                    if (!v53) {
                      goto LABEL_43;
                    }
                    id v54 = [v53 uuid];
                    [v30 setUuid:v54];

                    id v55 = [v53 eventTrigger];
                    [v30 setEventTrigger:v55];

                    v56 = [v30 modelObjectWithChangeType:2];
                    [v15 add:v56];

                    [v31 removeObject:v53];
                    int v43 = 0;
                    a1 = v79;
                  }
                  else
                  {
LABEL_25:

LABEL_43:
                    a1 = v79;
                    -[HMDEventTrigger _addEventModelFromDictionary:endEvent:transaction:message:error:](v79, v22, v21, v15, v74, v75);
                    int v43 = 0;
                  }
                  id v24 = v76;
                }
                else
                {
                  id v57 = (void *)MEMORY[0x1D9452090]();
                  id v58 = v28;
                  uint64_t v59 = HMFGetOSLogHandle();
                  id v24 = v76;
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                  {
                    id v60 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = v69;
                    v101 = v60;
                    __int16 v102 = 2112;
                    id v103 = v76;
                    __int16 v104 = 2112;
                    id v105 = v77;
                    _os_log_impl(&dword_1D49D5000, v59, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize action: %@ with error: %@", buf, 0x20u);
                  }
                  if (v75)
                  {
                    void *v75 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
                  }
                  unsigned __int8 v97 = 0;
                  int v43 = 1;
                  a1 = v79;
                }
                v44 = v80;
                v42 = v77;

                a7 = v75;
              }
              else
              {
                v49 = (void *)MEMORY[0x1D9452090]();
                id v50 = a1;
                id v51 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v52 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v101 = v52;
                  __int16 v102 = 2112;
                  id v103 = v80;
                  _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_ERROR, "%{public}@Invalid event trigger type: %@", buf, 0x16u);

                  a1 = v79;
                }

                if (a7)
                {
                  *a7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
                }
                v42 = 0;
                unsigned __int8 v97 = 0;
                int v43 = 1;
                v44 = v80;
              }
            }
            else
            {
              v44 = 0;
              v45 = (void *)MEMORY[0x1D9452090]();
              id v46 = a1;
              uint64_t v47 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                id v48 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v101 = v48;
                __int16 v102 = 2112;
                id v103 = v24;
                _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_ERROR, "%{public}@Event must have trigger type %@", buf, 0x16u);

                a1 = v79;
              }

              if (a7)
              {
                *a7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
              }
              v42 = 0;
              unsigned __int8 v97 = 0;
              int v43 = 1;
            }
          }
          else
          {
            uint64_t v37 = (void *)MEMORY[0x1D9452090]();
            id v38 = a1;
            v39 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              char v40 = HMFGetLogIdentifier();
              v41 = [v38 name];
              *(_DWORD *)buf = 138543618;
              v101 = v40;
              __int16 v102 = 2112;
              id v103 = v41;
              _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Can't update events %@; invalid serialized event",
                buf,
                0x16u);

              a1 = v79;
            }

            if (a7)
            {
              *a7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
            }
            v42 = 0;
            unsigned __int8 v97 = 0;
            int v43 = 1;
            id v24 = 0;
          }
          id v14 = v82;

          if (v43)
          {

            uint64_t v67 = v97;
            goto LABEL_64;
          }
        }
        uint64_t v83 = [obj countByEnumeratingWithState:&v93 objects:v106 count:16];
        if (v83) {
          continue;
        }
        break;
      }
    }

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v61 = v72;
    uint64_t v62 = [v61 countByEnumeratingWithState:&v84 objects:v98 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v85;
      do
      {
        for (uint64_t j = 0; j != v63; ++j)
        {
          if (*(void *)v85 != v64) {
            objc_enumerationMutation(v61);
          }
          v66 = objc_msgSend(*(id *)(*((void *)&v84 + 1) + 8 * j), "modelObjectWithChangeType:", 3, v69);
          [v15 add:v66];
        }
        uint64_t v63 = [v61 countByEnumeratingWithState:&v84 objects:v98 count:16];
      }
      while (v63);
    }

    uint64_t v67 = 1;
LABEL_64:

    id v13 = v70;
  }
  else
  {
    uint64_t v67 = 0;
  }

  return v67;
}

void __45__HMDEventTrigger__handleUpdateEventTrigger___block_invoke_114(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 respondWithError:a2];
  }
  else
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = [*(id *)(a1 + 48) createPayloadWithCondition:*(void *)(a1 + 56)];
    [v4 addEntriesFromDictionary:v5];

    uint64_t v6 = *(void *)(a1 + 64);
    id v7 = [*(id *)(a1 + 72) triggerEvents];
    id v8 = -[HMDHome _createEventsPayload:](v6, v7);
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:@"kEventTriggerEventsKey"];

    uint64_t v9 = *(void *)(a1 + 64);
    id v10 = [*(id *)(a1 + 72) endEvents];
    BOOL v11 = -[HMDHome _createEventsPayload:](v9, v10);
    [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:@"kEventTriggerEndEventsKey"];

    int v12 = *(void **)(a1 + 32);
    id v13 = (id)[*(id *)(a1 + 40) copy];
    [v12 respondWithPayload:v13];
  }
}

- (void)_addEventModelFromDictionary:(uint64_t)a3 endEvent:(void *)a4 transaction:(void *)a5 message:(void *)a6 error:
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  id v87 = 0;
  id v14 = [a1 createEventModel:v11 endEvent:a3 message:v13 checkForSupport:1 transaction:v12 error:&v87];
  id v86 = v87;
  if (v14)
  {
    id v84 = v13;
    id v85 = v11;
    [v12 add:v14];
    id v15 = v14;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v17 = [a1 home];
      id v18 = [[HMDCharacteristicEvent alloc] initWithModel:v15 home:v17];
      if (v18)
      {
        [a1 addEvent:v18];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          BOOL v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v19 postNotificationName:@"HMDEventTriggerCharacteristicBasedEventAddedNotification" object:v17 userInfo:0];
        }
      }
      else
      {
        uint64_t v25 = (void *)MEMORY[0x1D9452090]();
        id v26 = a1;
        id v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          uint64_t v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v89 = v28;
          __int16 v90 = 2112;
          id v91 = v15;
          _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v18 = 0;
    }
    id v29 = v15;
    objc_opt_class();
    char v30 = objc_opt_isKindOfClass();

    if (v30)
    {
      id v31 = [a1 home];
      uint64_t v32 = [[HMDLocationEvent alloc] initWithModel:v29 home:v31];

      if (v32)
      {
        [a1 addEvent:v32];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v33 postNotificationName:@"HMDEventTriggerCharacteristicBasedEventAddedNotification" object:v31 userInfo:0];
        }
      }
      else
      {
        uint64_t v34 = (void *)MEMORY[0x1D9452090]();
        id v35 = a1;
        id v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          uint64_t v37 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v89 = v37;
          __int16 v90 = 2112;
          id v91 = v29;
          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v32 = (HMDLocationEvent *)v18;
    }
    id v38 = v29;
    objc_opt_class();
    char v39 = objc_opt_isKindOfClass();

    if (v39)
    {
      char v40 = [a1 home];
      v41 = [[HMDCalendarEvent alloc] initWithModel:v38 home:v40];

      if (v41)
      {
        [a1 addEvent:v41];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v42 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v42 postNotificationName:@"HMDEventTriggerCharacteristicBasedEventAddedNotification" object:v40 userInfo:0];
        }
      }
      else
      {
        int v43 = (void *)MEMORY[0x1D9452090]();
        id v44 = a1;
        v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          id v46 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v89 = v46;
          __int16 v90 = 2112;
          id v91 = v38;
          _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v41 = (HMDCalendarEvent *)v32;
    }
    id v47 = v38;
    objc_opt_class();
    char v48 = objc_opt_isKindOfClass();

    if (v48)
    {
      v49 = [a1 home];
      id v50 = [[HMDSignificantTimeEvent alloc] initWithModel:v47 home:v49];

      if (v50)
      {
        [a1 addEvent:v50];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v51 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v51 postNotificationName:@"HMDEventTriggerCharacteristicBasedEventAddedNotification" object:v49 userInfo:0];
        }
      }
      else
      {
        uint64_t v52 = (void *)MEMORY[0x1D9452090]();
        id v53 = a1;
        id v54 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          id v55 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v89 = v55;
          __int16 v90 = 2112;
          id v91 = v47;
          _os_log_impl(&dword_1D49D5000, v54, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v50 = (HMDSignificantTimeEvent *)v41;
    }
    id v56 = v47;
    objc_opt_class();
    char v57 = objc_opt_isKindOfClass();

    if (v57)
    {
      id v58 = [a1 home];
      uint64_t v59 = [[HMDDurationEvent alloc] initWithModel:v56 home:v58];

      if (v59)
      {
        [a1 addEvent:v59];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v60 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v60 postNotificationName:@"HMDEventTriggerCharacteristicBasedEventAddedNotification" object:v58 userInfo:0];
        }
      }
      else
      {
        id v61 = (void *)MEMORY[0x1D9452090]();
        id v62 = a1;
        uint64_t v63 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          uint64_t v64 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v89 = v64;
          __int16 v90 = 2112;
          id v91 = v56;
          _os_log_impl(&dword_1D49D5000, v63, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v59 = (HMDDurationEvent *)v50;
    }
    id v65 = v56;
    objc_opt_class();
    char v66 = objc_opt_isKindOfClass();

    if (v66)
    {
      uint64_t v67 = [a1 home];
      __int16 v68 = [[HMDCharacteristicThresholdRangeEvent alloc] initWithModel:v65 home:v67];

      if (v68)
      {
        [a1 addEvent:v68];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v69 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v69 postNotificationName:@"HMDEventTriggerCharacteristicBasedEventAddedNotification" object:v67 userInfo:0];
        }
      }
      else
      {
        id v70 = (void *)MEMORY[0x1D9452090]();
        id v71 = a1;
        id v72 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          v73 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v89 = v73;
          __int16 v90 = 2112;
          id v91 = v65;
          _os_log_impl(&dword_1D49D5000, v72, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);
        }
      }
    }
    else
    {
      __int16 v68 = (HMDCharacteristicThresholdRangeEvent *)v59;
    }
    id v74 = v65;
    objc_opt_class();
    char v75 = objc_opt_isKindOfClass();

    if (v75)
    {
      id v76 = [a1 home];
      id v77 = [[HMDPresenceEvent alloc] initWithModel:v74 home:v76];

      if (v77)
      {
        [a1 addEvent:v77];
        objc_opt_class();
        id v24 = v86;
        if (objc_opt_isKindOfClass())
        {
          v78 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v78 postNotificationName:@"HMDEventTriggerCharacteristicBasedEventAddedNotification" object:v76 userInfo:0];
        }
      }
      else
      {
        v79 = (void *)MEMORY[0x1D9452090]();
        id v80 = a1;
        uint64_t v81 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
        {
          id v82 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v89 = v82;
          __int16 v90 = 2112;
          id v91 = v74;
          _os_log_impl(&dword_1D49D5000, v81, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);
        }
        id v24 = v86;
      }
    }
    else
    {
      id v77 = (HMDPresenceEvent *)v68;
      id v24 = v86;
    }

    id v13 = v84;
    id v11 = v85;
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = a1;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v89 = v23;
      __int16 v90 = 2112;
      id v91 = v11;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Cannot create event model for event info %@", buf, 0x16u);
    }
    id v24 = v86;
    if (a6)
    {
      if (v86)
      {
        *a6 = v86;
      }
      else
      {
        id v83 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
        *a6 = v83;
      }
    }
  }
}

- (id)_updateEventsOnEventTrigger:(id)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v69 = v3;
  if (([v3 isRemote] & 1) != 0
    || ([(HMDEventTrigger *)self locationEvents],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        id v3 = v69,
        !v5)
    || ([v69 isAuthorizedForLocationAccess] & 1) != 0)
  {
    uint64_t v6 = [v3 arrayForKey:@"kEventTriggerEventsKey"];
    id v72 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = [v69 BOOLForKey:@"kEventTriggerEndEvent"];
    char v75 = [(HMDTrigger *)self home];
    id v8 = [v75 backingStore];
    uint64_t v9 = [v69 name];
    id v10 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    id v76 = [v8 transaction:v9 options:v10];

    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id obj = v6;
    uint64_t v71 = [obj countByEnumeratingWithState:&v88 objects:v97 count:16];
    BOOL v12 = v71 != 0;
    if (v71)
    {
      uint64_t v70 = *(void *)v89;
      *(void *)&long long v11 = 138543362;
      long long v67 = v11;
LABEL_6:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v89 != v70) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v88 + 1) + 8 * v13);
        id v87 = 0;
        id v15 = -[HMDEventTrigger createEventModel:endEvent:message:checkForSupport:transaction:error:](self, "createEventModel:endEvent:message:checkForSupport:transaction:error:", v14, v7, v69, 1, v76, &v87, v67);
        id v73 = v87;
        if (!v15) {
          break;
        }
        if (![(HMDEventTrigger *)self _checkAddEventModel:v15 message:v69])
        {
          id v53 = (void *)MEMORY[0x1D9452090]();
          id v54 = self;
          id v55 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            id v56 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v67;
            long long v99 = v56;
            _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_INFO, "%{public}@Cannot update events - Incompatible home hub", buf, 0xCu);
          }
LABEL_42:

          char v57 = 0;
          goto LABEL_47;
        }
        if ([v75 isSharedAdmin])
        {
          long long v16 = (void *)MEMORY[0x1D9452090]();
          id v17 = self;
          id v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            BOOL v19 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v67;
            long long v99 = v19;
            _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@shared admin is sending the request to resident.", buf, 0xCu);
          }
          id v20 = objc_alloc(MEMORY[0x1E4F65488]);
          id v21 = [(HMDTrigger *)v17 uuid];
          id v22 = (void *)[v20 initWithTarget:v21];

          uint64_t v23 = (void *)MEMORY[0x1E4F65480];
          long long v95 = @"kEventTriggerEventsKey";
          uint64_t v96 = v14;
          id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
          uint64_t v25 = [v23 messageWithName:@"kAddEventToEventTriggerRequestKey" qualityOfService:9 destination:v22 payload:v24];

          [v72 addObject:v25];
        }
        [v76 add:v15 withMessage:0];

        if (v71 == ++v13)
        {
          uint64_t v71 = [obj countByEnumeratingWithState:&v88 objects:v97 count:16];
          if (v71) {
            goto LABEL_6;
          }
          goto LABEL_17;
        }
      }
      id v51 = [v69 responseHandler];

      if (v51)
      {
        if (!v73)
        {
          id v73 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        }
        uint64_t v52 = [v69 responseHandler];
        ((void (**)(void, id, void))v52)[2](v52, v73, 0);
      }
      id v15 = 0;
      goto LABEL_42;
    }
LABEL_17:

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v74 = [(HMDEventTrigger *)self events];
    uint64_t v26 = [v74 countByEnumeratingWithState:&v83 objects:v94 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v84 != v27) {
            objc_enumerationMutation(v74);
          }
          id v29 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          if (v7 == [v29 isEndEvent])
          {
            char v30 = (void *)MEMORY[0x1D9452090]();
            id v31 = self;
            uint64_t v32 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              uint64_t v33 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              long long v99 = v33;
              __int16 v100 = 2112;
              id v101 = v29;
              _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Deleting event %@", buf, 0x16u);
            }
            uint64_t v34 = [HMDEventModel alloc];
            id v35 = [v29 uuid];
            id v36 = [(HMDTrigger *)v31 uuid];
            uint64_t v37 = [(HMDBackingStoreModelObject *)v34 initWithObjectChangeType:3 uuid:v35 parentUUID:v36];

            if ([v75 isSharedAdmin])
            {
              id v38 = (void *)MEMORY[0x1D9452090]();
              char v39 = v31;
              char v40 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                v41 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                long long v99 = v41;
                _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_ERROR, "%{public}@Admin user : Remove event from trigger", buf, 0xCu);
              }
              id v42 = objc_alloc(MEMORY[0x1E4F65488]);
              int v43 = [(HMDTrigger *)v39 uuid];
              id v44 = (void *)[v42 initWithTarget:v43];

              v45 = (void *)MEMORY[0x1E4F65480];
              uint64_t v92 = @"kEventUUIDKey";
              id v46 = [v29 uuid];
              id v47 = [v46 UUIDString];
              long long v93 = v47;
              char v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
              v49 = [v45 messageWithName:@"kRemoveEventFromEventTriggerRequestKey" qualityOfService:9 destination:v44 payload:v48];

              [v72 addObject:v49];
            }
            [v76 add:v37 withMessage:0];

            BOOL v12 = 1;
          }
        }
        uint64_t v26 = [v74 countByEnumeratingWithState:&v83 objects:v94 count:16];
      }
      while (v26);
    }

    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__HMDEventTrigger__updateEventsOnEventTrigger___block_invoke;
    aBlock[3] = &unk_1E6A09008;
    objc_copyWeak(&v80, &location);
    char v81 = v7;
    id v79 = v69;
    id v50 = (void (**)(void *, void))_Block_copy(aBlock);
    if (v12)
    {
      [v76 run:v50];
    }
    else
    {
      id v58 = (void *)MEMORY[0x1D9452090]();
      uint64_t v59 = self;
      HMFGetOSLogHandle();
      id v60 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        id v61 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v99 = v61;
        _os_log_impl(&dword_1D49D5000, v60, OS_LOG_TYPE_ERROR, "%{public}@No events updated, calling the completion handler rightaway", buf, 0xCu);
      }
      v50[2](v50, 0);
    }
    char v57 = (void *)[v72 copy];

    objc_destroyWeak(&v80);
    objc_destroyWeak(&location);
LABEL_47:
  }
  else
  {
    id obj = [MEMORY[0x1E4F28C58] hmErrorWithCode:85];
    uint64_t v63 = (void *)MEMORY[0x1D9452090]([v69 respondWithError:obj]);
    uint64_t v64 = self;
    id v65 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      char v66 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v99 = v66;
      __int16 v100 = 2112;
      id v101 = obj;
      _os_log_impl(&dword_1D49D5000, v65, OS_LOG_TYPE_INFO, "%{public}@Client does not have authorization for location, cannot remove event. [%@]", buf, 0x16u);
    }
    char v57 = 0;
  }

  return v57;
}

void __47__HMDEventTrigger__updateEventsOnEventTrigger___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained workQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__HMDEventTrigger__updateEventsOnEventTrigger___block_invoke_2;
    v13[3] = &unk_1E6A15B38;
    id v7 = v3;
    char v17 = *(unsigned char *)(a1 + 48);
    uint64_t v14 = (void (**)(void, void, void))v7;
    id v15 = v5;
    id v16 = *(id *)(a1 + 32);
    dispatch_async(v6, v13);

    id v8 = v14;
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v9 = [*(id *)(a1 + 32) responseHandler];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    long long v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      BOOL v19 = v12;
      __int16 v20 = 2112;
      id v21 = v3;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not finish the request as self is no longer valid. Replying back to client with error:[%@]", buf, 0x16u);
    }
    id v8 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, id, void))v8)[2](v8, v3, 0);
    goto LABEL_7;
  }
LABEL_8:
}

void __47__HMDEventTrigger__updateEventsOnEventTrigger___block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v29 = v5;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while updating events on event trigger. [%@]", buf, 0x16u);
    }
    [*(id *)(a1 + 48) respondWithError:*(void *)(a1 + 32)];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    id v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
    [v7 setObject:v8 forKeyedSubscript:@"kEventTriggerEndEvent"];

    uint64_t v9 = *(void **)(a1 + 40);
    if (*(unsigned char *)(a1 + 56)) {
      [v9 endEvents];
    }
    else {
    id v10 = [v9 triggerEvents];
    }
    long long v11 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          char v17 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "createPayload", (void)v24);
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v14);
    }

    id v18 = (void *)[v11 copy];
    [v7 setObject:v18 forKeyedSubscript:@"kEventTriggerEventsKey"];

    BOOL v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = *(id *)(a1 + 40);
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      uint64_t v23 = [*(id *)(a1 + 48) name];
      *(_DWORD *)buf = 138543874;
      id v29 = v22;
      __int16 v30 = 2112;
      id v31 = v23;
      __int16 v32 = 2112;
      uint64_t v33 = v7;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@All the events updated. Updating clients. %@ : %@]", buf, 0x20u);
    }
    [*(id *)(a1 + 48) respondWithPayload:v7];
  }
}

- (void)_handleUpdateEventsOnEventTrigger:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDTrigger *)self updateEventTriggerMessage:2 message:v4 relay:0];
  if (v5)
  {
    uint64_t v6 = [(HMDEventTrigger *)self _updateEventsOnEventTrigger:v5];
    id v7 = [(HMDTrigger *)self home];
    if ([v6 count] && objc_msgSend(v7, "isSharedAdmin"))
    {
      __int16 v30 = v7;
      id v31 = (void *)[v4 mutableCopy];
      [v31 setResponseHandler:0];
      if ([(HMDEventTrigger *)self checkSharedEventTriggerActivationResidentRequirement:0])
      {
        id v8 = (void *)MEMORY[0x1D9452090]();
        uint64_t v9 = self;
        id v10 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          long long v11 = HMFGetLogIdentifier();
          id v12 = [v4 name];
          *(_DWORD *)buf = 138543618;
          id v38 = v11;
          __int16 v39 = 2112;
          char v40 = v12;
          _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@The resident supports shared-trigger-activation, relaying the update events message as is : %@", buf, 0x16u);
        }
        id v13 = [v30 administratorHandler];
        uint64_t v14 = [v13 operationForMessage:v31 error:0];
        if (v14) {
          [v13 addOperation:v14];
        }
      }
      else
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v13 = v6;
        uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          long long v27 = v6;
          uint64_t v28 = v5;
          id v29 = v4;
          uint64_t v17 = *(void *)v33;
          id v18 = v7;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v33 != v17) {
                objc_enumerationMutation(v13);
              }
              id v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              id v21 = (void *)MEMORY[0x1D9452090]();
              uint64_t v22 = self;
              uint64_t v23 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                long long v24 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                id v38 = v24;
                __int16 v39 = 2112;
                char v40 = v20;
                _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@The resident does not support shared-trigger-activation, relaying the message %@", buf, 0x16u);

                id v18 = v30;
              }

              long long v25 = [v18 administratorHandler];
              long long v26 = [v25 operationForMessage:v31 error:0];
              if (v26) {
                [v25 addOperation:v26];
              }
            }
            uint64_t v16 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
          }
          while (v16);
          uint64_t v5 = v28;
          id v4 = v29;
          uint64_t v6 = v27;
        }
      }

      id v7 = v30;
    }
  }
}

- (BOOL)checkSharedEventTriggerActivationResidentRequirement:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDTrigger *)self home];
  uint64_t v6 = [v5 enabledResidents];

  if ([v6 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      int v10 = 0;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v7);
          }
          v10 |= objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "supportsSharedEventTriggerActivation", (void)v26);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v9);

      if (v10)
      {
        LOBYTE(v13) = 1;
        goto LABEL_21;
      }
    }
    else
    {
    }
    id v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v32 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Did not find any compatible resident device", buf, 0xCu);
    }
    id v13 = [v4 responseHandler];

    if (v13)
    {
      id v13 = [v4 responseHandler];
      id v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = 92;
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1D9452090]();
    uint64_t v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v32 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Did not find any resident device", buf, 0xCu);
    }
    id v13 = [v4 responseHandler];

    if (v13)
    {
      id v13 = [v4 responseHandler];
      id v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = 91;
LABEL_20:
      long long v24 = objc_msgSend(v18, "hmErrorWithCode:", v19, (void)v26);
      ((void (**)(void, void *, void))v13)[2](v13, v24, 0);

      LOBYTE(v13) = 0;
    }
  }
LABEL_21:

  return (char)v13;
}

- (BOOL)_checkAddEventModel:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 endEvent];
  char v9 = [v8 BOOLValue];

  BOOL v10 = (v9 & 1) == 0
     && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
     && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
     && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
     && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
     || [(HMDEventTrigger *)self checkSharedEventTriggerActivationResidentRequirement:v7];

  return v10;
}

- (BOOL)addEventsFromMessage:(id)a3 preserveUUIDs:(BOOL)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [v10 arrayForKey:@"kEventTriggerEventsKey"];
  id v13 = [v10 arrayForKey:@"kEventTriggerEndEventsKey"];
  if (v13)
  {
    if (!-[HMDEventTrigger addEventsFromInfo:preserveUUIDs:endEvent:transaction:message:error:](self, v12, a4, MEMORY[0x1E4F1CC28], v11, v10, a6))
    {
      BOOL v18 = 0;
      goto LABEL_7;
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F1CC38];
    uint64_t v15 = self;
    uint64_t v16 = v13;
    char v17 = a4;
  }
  else
  {
    uint64_t v15 = self;
    uint64_t v16 = v12;
    char v17 = a4;
    uint64_t v14 = 0;
  }
  BOOL v18 = -[HMDEventTrigger addEventsFromInfo:preserveUUIDs:endEvent:transaction:message:error:](v15, v16, v17, v14, v11, v10, a6);
LABEL_7:

  return v18;
}

- (BOOL)addEventsFromInfo:(char)a3 preserveUUIDs:(void *)a4 endEvent:(void *)a5 transaction:(void *)a6 message:(void *)a7 error:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id obj = a2;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = a1;
  id v15 = v13;
  id v16 = a6;
  if (v14)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v31 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v31)
    {
      uint64_t v17 = *(void *)v33;
      uint64_t v27 = *(void *)v33;
      id v28 = v12;
      id v26 = v15;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(id *)(*((void *)&v32 + 1) + 8 * i);
          id v20 = v19;
          if (v12) {
            uint64_t v21 = [v12 BOOLValue];
          }
          else {
            uint64_t v21 = objc_msgSend(v19, "hmf_BOOLForKey:", @"kEventTriggerEndEvent");
          }
          uint64_t v22 = v21;
          if ((a3 & 1) == 0)
          {
            uint64_t v23 = [v20 objectForKeyedSubscript:@"kEventUUIDKey"];

            if (v23)
            {
              long long v24 = (void *)[v20 mutableCopy];
              [v24 setObject:0 forKeyedSubscript:@"kEventUUIDKey"];

              id v20 = v24;
            }
            id v15 = v26;
            uint64_t v17 = v27;
            id v12 = v28;
          }
          -[HMDEventTrigger _addEventModelFromDictionary:endEvent:transaction:message:error:](v14, v20, v22, v15, v16, a7);
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v31);
    }
  }

  return v14 != 0;
}

- (void)_handleRemoveEventModel:(id)a3 message:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDEventTrigger *)self events];
  char v9 = [v6 uuid];
  id v10 = objc_msgSend(v8, "hmf_firstObjectWithUUID:", v9);

  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v26 = v14;
    __int16 v27 = 2112;
    id v28 = v10;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing event %@", buf, 0x16u);
  }
  if (v10)
  {
    id v15 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;

    [v17 invalidate];
    [(HMDEventTrigger *)v12 removeEvent:v15];
    uint64_t v23 = @"kUUIDsOfEventsKey";
    BOOL v18 = [v15 uuid];
    id v19 = [v18 UUIDString];
    uint64_t v22 = v19;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    long long v24 = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];

    [(HMDTrigger *)v12 markChangedForMessage:v7];
    [v7 respondWithPayload:v21];
  }
  else
  {
    uint64_t v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v7 respondWithError:v21];
  }
}

- (void)_removeEventsFromEventTrigger:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 uuidForKey:@"kEventUUIDKey"];
  id v6 = [(HMDEventTrigger *)self events];
  id v7 = objc_msgSend(v6, "hmf_firstObjectWithUUID:", v5);

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) == 0 || ([v4 isAuthorizedForLocationAccess])
    {
      uint64_t v8 = [HMDEventModel alloc];
      char v9 = [v7 uuid];
      id v10 = [(HMDTrigger *)self uuid];
      id v11 = [(HMDBackingStoreModelObject *)v8 initWithObjectChangeType:3 uuid:v9 parentUUID:v10];

      id v12 = [(HMDTrigger *)self home];
      id v13 = [v12 backingStore];
      uint64_t v14 = [v4 name];
      id v15 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      id v16 = [v13 transaction:v14 options:v15];

      [v16 add:v11 withMessage:v4];
      [v16 run];

      goto LABEL_14;
    }
    long long v24 = (void *)MEMORY[0x1D9452090]();
    long long v25 = self;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      __int16 v27 = HMFGetLogIdentifier();
      int v31 = 138543362;
      long long v32 = v27;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Client does have authorization for location, cannot remove event", (uint8_t *)&v31, 0xCu);
    }
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = 85;
  }
  else
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
    BOOL v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      uint64_t v21 = [(HMDTrigger *)v18 name];
      int v31 = 138543874;
      long long v32 = v20;
      __int16 v33 = 2112;
      long long v34 = v5;
      __int16 v35 = 2112;
      id v36 = v21;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Couldn't find event with UUID %@ in trigger %@", (uint8_t *)&v31, 0x20u);
    }
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = 2;
  }
  id v28 = [v22 hmErrorWithCode:v23];
  uint64_t v29 = [v4 responseHandler];

  if (v29)
  {
    __int16 v30 = [v4 responseHandler];
    ((void (**)(void, void *, void))v30)[2](v30, v28, 0);
  }
LABEL_14:
}

- (void)_handleRemoveEventsFromEventTrigger:(id)a3
{
}

- (void)_handleRemoveEventsFromEventTrigger:(id)a3 relay:(BOOL)a4
{
  uint64_t v5 = [(HMDTrigger *)self updateEventTriggerMessage:3 message:a3 relay:a4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v5 = [(HMDEventTrigger *)self _removeEventsFromEventTrigger:v5];
    uint64_t v6 = v7;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (void)_handleAddEventModel:(id)a3 message:(id)a4
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (HMDPresenceEvent *)v6;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v10 = 0;
  if (v8 && (isKindOfClass & 1) != 0)
  {
    id v11 = [(HMDTrigger *)self home];
    id v10 = [[HMDCharacteristicEvent alloc] initWithModel:v8 home:v11];
    if (v10)
    {
      [(HMDEventTrigger *)self addEvent:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v12 postNotificationName:@"HMDEventTriggerCharacteristicBasedEventAddedNotification" object:v11 userInfo:0];
      }
    }
    else
    {
      id v13 = (void *)MEMORY[0x1D9452090]();
      uint64_t v14 = self;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v83 = v16;
        __int16 v84 = 2112;
        long long v85 = v8;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);
      }
    }
  }
  id v17 = v8;
  objc_opt_class();
  char v18 = objc_opt_isKindOfClass();

  if (v8 && (v18 & 1) != 0)
  {
    id v19 = [(HMDTrigger *)self home];
    id v20 = [[HMDLocationEvent alloc] initWithModel:v17 home:v19];

    if (v20)
    {
      [(HMDEventTrigger *)self addEvent:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v21 postNotificationName:@"HMDEventTriggerCharacteristicBasedEventAddedNotification" object:v19 userInfo:0];
      }
    }
    else
    {
      uint64_t v22 = (void *)MEMORY[0x1D9452090]();
      uint64_t v23 = self;
      long long v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        long long v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v83 = v25;
        __int16 v84 = 2112;
        long long v85 = v17;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v20 = (HMDLocationEvent *)v10;
  }
  id v26 = v17;
  objc_opt_class();
  char v27 = objc_opt_isKindOfClass();

  if (v8 && (v27 & 1) != 0)
  {
    id v28 = [(HMDTrigger *)self home];
    uint64_t v29 = [[HMDCalendarEvent alloc] initWithModel:v26 home:v28];

    if (v29)
    {
      [(HMDEventTrigger *)self addEvent:v29];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v30 postNotificationName:@"HMDEventTriggerCharacteristicBasedEventAddedNotification" object:v28 userInfo:0];
      }
    }
    else
    {
      int v31 = (void *)MEMORY[0x1D9452090]();
      long long v32 = self;
      __int16 v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        long long v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v83 = v34;
        __int16 v84 = 2112;
        long long v85 = v26;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v29 = (HMDCalendarEvent *)v20;
  }
  __int16 v35 = v26;
  objc_opt_class();
  char v36 = objc_opt_isKindOfClass();

  if (v8 && (v36 & 1) != 0)
  {
    uint64_t v37 = [(HMDTrigger *)self home];
    id v38 = [[HMDSignificantTimeEvent alloc] initWithModel:v35 home:v37];

    if (v38)
    {
      [(HMDEventTrigger *)self addEvent:v38];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v39 postNotificationName:@"HMDEventTriggerCharacteristicBasedEventAddedNotification" object:v37 userInfo:0];
      }
    }
    else
    {
      char v40 = (void *)MEMORY[0x1D9452090]();
      uint64_t v41 = self;
      id v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        int v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v83 = v43;
        __int16 v84 = 2112;
        long long v85 = v35;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v38 = (HMDSignificantTimeEvent *)v29;
  }
  id v44 = v35;
  objc_opt_class();
  char v45 = objc_opt_isKindOfClass();

  if (v8 && (v45 & 1) != 0)
  {
    id v46 = [(HMDTrigger *)self home];
    id v47 = [[HMDDurationEvent alloc] initWithModel:v44 home:v46];

    if (v47)
    {
      [(HMDEventTrigger *)self addEvent:v47];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v48 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v48 postNotificationName:@"HMDEventTriggerCharacteristicBasedEventAddedNotification" object:v46 userInfo:0];
      }
    }
    else
    {
      v49 = (void *)MEMORY[0x1D9452090]();
      id v50 = self;
      id v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        uint64_t v52 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v83 = v52;
        __int16 v84 = 2112;
        long long v85 = v44;
        _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v47 = (HMDDurationEvent *)v38;
  }
  id v53 = v44;
  objc_opt_class();
  char v54 = objc_opt_isKindOfClass();

  if (v8 && (v54 & 1) != 0)
  {
    id v55 = [(HMDTrigger *)self home];
    id v56 = [[HMDCharacteristicThresholdRangeEvent alloc] initWithModel:v53 home:v55];

    if (v56)
    {
      [(HMDEventTrigger *)self addEvent:v56];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v57 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v57 postNotificationName:@"HMDEventTriggerCharacteristicBasedEventAddedNotification" object:v55 userInfo:0];
      }
    }
    else
    {
      id v58 = (void *)MEMORY[0x1D9452090]();
      uint64_t v59 = self;
      id v60 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        id v61 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v83 = v61;
        __int16 v84 = 2112;
        long long v85 = v53;
        _os_log_impl(&dword_1D49D5000, v60, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v56 = (HMDCharacteristicThresholdRangeEvent *)v47;
  }
  id v62 = v53;
  objc_opt_class();
  char v63 = objc_opt_isKindOfClass();

  if (v8 && (v63 & 1) != 0)
  {
    uint64_t v64 = [(HMDTrigger *)self home];
    id v65 = [[HMDPresenceEvent alloc] initWithModel:v62 home:v64];

    if (v65)
    {
      [(HMDEventTrigger *)self addEvent:v65];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v66 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v66 postNotificationName:@"HMDEventTriggerCharacteristicBasedEventAddedNotification" object:v64 userInfo:0];
      }
    }
    else
    {
      __int16 v68 = (void *)MEMORY[0x1D9452090]();
      long long v69 = self;
      uint64_t v70 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        uint64_t v71 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v83 = v71;
        __int16 v84 = 2112;
        long long v85 = v62;
        _os_log_impl(&dword_1D49D5000, v70, OS_LOG_TYPE_INFO, "%{public}@Failed to create event object with event model %@", buf, 0x16u);
      }
    }

    if (v65) {
      goto LABEL_71;
    }
LABEL_66:
    long long v67 = 0;
    goto LABEL_74;
  }
  id v65 = (HMDPresenceEvent *)v56;
  if (!v56) {
    goto LABEL_66;
  }
LABEL_71:
  id v72 = (void *)MEMORY[0x1D9452090]();
  id v73 = self;
  id v74 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
  {
    char v75 = HMFGetLogIdentifier();
    id v76 = [(HMDEventTrigger *)v73 events];
    *(_DWORD *)buf = 138543874;
    long long v83 = v75;
    __int16 v84 = 2112;
    long long v85 = v65;
    __int16 v86 = 2112;
    id v87 = v76;
    _os_log_impl(&dword_1D49D5000, v74, OS_LOG_TYPE_DEBUG, "%{public}@Added new event %@ to %@", buf, 0x20u);
  }
  id v77 = [(HMDTrigger *)v73 msgDispatcher];
  v78 = [(HMDTrigger *)v73 workQueue];
  [(HMDPresenceEvent *)v65 configure:v73 messageDispatcher:v77 queue:v78 delegate:v73];

  [(HMDEventTrigger *)v73 _activateWithCompletion:0];
  id v79 = [(HMDPresenceEvent *)v65 createPayload];
  char v81 = v79;
  long long v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];

  [(HMDTrigger *)v73 markChangedForMessage:v7];
LABEL_74:
  [v7 respondWithPayload:v67];
}

- (id)createEventModel:(id)a3 endEvent:(BOOL)a4 message:(id)a5 checkForSupport:(BOOL)a6 transaction:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = objc_msgSend(v14, "hmf_stringForKey:", @"kEventTriggerTypeKey");
  char v18 = [(HMDTrigger *)self home];
  if (a4)
  {
    if ([v17 isEqualToString:@"kEventTriggerTypeDurationEventKey"])
    {
      id v19 = HMDDurationEventModel;
LABEL_23:
      char v27 = [(HMDTrigger *)self uuid];
      uint64_t v21 = [(__objc2_class *)v19 eventModelWithDictionary:v14 home:v18 eventTriggerUUID:v27 message:v15];

      goto LABEL_25;
    }
  }
  else
  {
    if ([v17 isEqualToString:@"kEventTriggerTypeCharacteristicEventKey"])
    {
      id v20 = [(HMDTrigger *)self uuid];
      uint64_t v21 = +[HMDCharacteristicEventModel eventModelWithDictionary:v14 home:v18 eventTriggerUUID:v20 message:v15 checkForSupport:v10 error:a8];

      goto LABEL_25;
    }
    if ([v17 isEqualToString:@"kEventTriggerTypeLocationEventKey"])
    {
      if (!v15
        || ([v15 isRemote] & 1) != 0
        || ([v15 isAuthorizedForLocationAccess] & 1) != 0)
      {
        id v19 = HMDLocationEventModel;
        goto LABEL_23;
      }
      uint64_t v23 = (void *)MEMORY[0x1D9452090]();
      long long v24 = self;
      long long v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = HMFGetLogIdentifier();
        int v29 = 138543362;
        __int16 v30 = v26;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Client does have authorization for location, cannot add event", (uint8_t *)&v29, 0xCu);
      }
      if (a8)
      {
        [MEMORY[0x1E4F28C58] hmErrorWithCode:85];
        uint64_t v21 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
    }
    else
    {
      if ([v17 isEqualToString:@"kEventTriggerTypeCalendarEventKey"])
      {
        id v19 = HMDCalendarEventModel;
        goto LABEL_23;
      }
      if ([v17 isEqualToString:@"kEventTriggerTypeSignificantTimeEventKey"])
      {
        id v19 = HMDSignificantTimeEventModel;
        goto LABEL_23;
      }
      if ([v17 isEqualToString:@"kEventTriggerTypeCharacteristicThresholdRangeEventKey"])
      {
        uint64_t v22 = [(HMDTrigger *)self uuid];
        uint64_t v21 = +[HMDCharacteristicThresholdRangeEventModel eventModelWithDictionary:v14 home:v18 eventTriggerUUID:v22 message:v15 checkForSupport:v10];

        goto LABEL_25;
      }
      if ([v17 isEqualToString:@"kEventTriggerTypePresenceEventKey"])
      {
        id v19 = HMDPresenceEventModel;
        goto LABEL_23;
      }
    }
  }
  uint64_t v21 = 0;
LABEL_25:

  return v21;
}

- (void)_addEventToEventTrigger:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 dictionaryForKey:@"kEventTriggerEventsKey"];
  id v6 = [(HMDTrigger *)self home];
  id v7 = [v6 backingStore];
  uint64_t v8 = [v4 name];
  char v9 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  BOOL v10 = [v7 transaction:v8 options:v9];

  id v19 = 0;
  id v11 = [(HMDEventTrigger *)self createEventModel:v5 endEvent:0 message:v4 checkForSupport:1 transaction:v10 error:&v19];
  id v12 = v19;
  if (v11)
  {
    if ([(HMDEventTrigger *)self _checkAddEventModel:v11 message:v4])
    {
      [v10 add:v11 withMessage:v4];
      [v10 run];
    }
    else
    {
      id v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = self;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        char v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = v18;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Cannot add event - Incompatible home hub", buf, 0xCu);
      }
    }
  }
  else
  {
    id v13 = [v4 responseHandler];

    if (v13)
    {
      if (!v12)
      {
        id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      }
      id v14 = [v4 responseHandler];
      ((void (**)(void, id, void))v14)[2](v14, v12, 0);
    }
  }
}

- (void)_handleAddEventToEventTrigger:(id)a3
{
  uint64_t v4 = [(HMDTrigger *)self updateEventTriggerMessage:1 message:a3 relay:1];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(HMDEventTrigger *)self _addEventToEventTrigger:v4];
    uint64_t v5 = v6;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_handleLocationAuthorizationChangedNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = objc_msgSend(v5, "hmf_numberForKey:", @"HMDLocationAuthorizationKey");

  if (v6)
  {
    [v6 integerValue];
    id v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    char v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = HMFGetLogIdentifier();
      id v11 = HMDLocationAuthorizationAsString();
      int v16 = 138543618;
      id v17 = v10;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Latest Location Authorization is %@", (uint8_t *)&v16, 0x16u);
    }
    [(HMDEventTrigger *)v8 _activateWithCompletion:0];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      id v17 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@No location authorization key in the message", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)fixupForReplacementAccessory:(id)a3 transaction:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)HMDEventTrigger;
  id v31 = a4;
  -[HMDTrigger fixupForReplacementAccessory:transaction:](&v38, sel_fixupForReplacementAccessory_transaction_, v6);
  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    __int16 v30 = self;
    BOOL v10 = [(HMDEventTrigger *)self characteristicBaseEvents];
    id v11 = (void *)[v10 copy];

    uint64_t v33 = [v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v33)
    {
      uint64_t v12 = *(void *)v35;
      int v29 = v11;
      uint64_t v32 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v11);
          }
          id v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          id v15 = [v14 characteristic];
          int v16 = [v15 service];

          id v17 = [v16 accessory];
          __int16 v18 = [v17 uuid];

          if (!v18)
          {
            __int16 v18 = [v14 accessoryUUID];
          }
          id v19 = [v7 uuid];
          int v20 = [v19 isEqual:v18];

          if (v20)
          {
            uint64_t v21 = [v16 instanceID];
            if (!v21)
            {
              uint64_t v21 = [v14 serviceID];
            }
            uint64_t v22 = [v14 characteristic];
            uint64_t v23 = [v22 instanceID];

            if (!v23)
            {
              uint64_t v23 = [v14 characteristicInstanceID];
            }
            long long v24 = [v9 findCharacteristic:v23 forService:v21];
            if (v24)
            {
              [v14 replaceCharacteristic:v24];
            }
            else
            {
              __int16 v39 = v14;
              long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
              id v26 = v9;
              id v27 = v7;
              id v28 = (void *)[v25 mutableCopy];

              [(HMDEventTrigger *)v30 _handleRemovalOfCharacteristic:0 withEvents:v28 transaction:v31];
              id v7 = v27;
              id v9 = v26;
              id v11 = v29;
            }

            uint64_t v12 = v32;
          }
        }
        uint64_t v33 = [v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v33);
    }
  }
}

- (id)_modelWithRewrittenCondition:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v17 = 138543618;
    __int16 v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating evaluation condition for trigger %@", (uint8_t *)&v17, 0x16u);
  }
  id v9 = [(HMDEventTrigger *)v6 emptyModelObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = [(HMDEventTrigger *)v6 predicateUtilities];
  id v13 = [v12 rewritePredicateForDaemon:v4 message:0];

  if (v13)
  {
    id v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:0];
    [v11 setEvaluationCondition:v14];

    id v15 = v11;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)handleRemovalOfUser:(id)a3 transaction:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  BOOL v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int buf = 138543618;
    long long v35 = v11;
    __int16 v36 = 2112;
    id v37 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Preparing to remove references to user %@ from trigger", (uint8_t *)&buf, 0x16u);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v12 = [(HMDEventTrigger *)v9 presenceEvents];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * i) handleRemovalOfUser:v6 transaction:v7];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v14);
  }

  int v17 = [(HMDEventTrigger *)v9 predicateUtilities];
  __int16 v18 = [(HMDEventTrigger *)v9 evaluationCondition];
  int v19 = [v17 containsPresenceEvents:v18];

  if (v19)
  {
    char v28 = 0;
    id v20 = [(HMDEventTrigger *)v9 predicateUtilities];
    uint64_t v21 = [(HMDEventTrigger *)v9 evaluationCondition];
    uint64_t v22 = [v20 updatePredicate:v21 removedUser:v6 conditionModified:&v28];

    if (v28)
    {
      uint64_t v23 = (void *)MEMORY[0x1D9452090]();
      long long v24 = v9;
      long long v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = HMFGetLogIdentifier();
        int buf = 138543618;
        long long v35 = v26;
        __int16 v36 = 2112;
        id v37 = v6;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Condition has been modified following removal of user %@", (uint8_t *)&buf, 0x16u);
      }
      id v27 = [(HMDEventTrigger *)v24 _modelWithRewrittenCondition:v22];
      if (v27) {
        [v7 add:v27 withMessage:0];
      }
    }
  }
}

- (void)_handleRemovalOfEvents:(id)a3 transaction:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v20 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = (void *)MEMORY[0x1D9452090]();
          uint64_t v13 = self;
          uint64_t v14 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            uint64_t v15 = HMFGetLogIdentifier();
            *(_DWORD *)int buf = 138543618;
            id v27 = v15;
            __int16 v28 = 2112;
            long long v29 = v11;
            _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Client does have authorization for location, cannot remove event %@", buf, 0x16u);
          }
        }
        else
        {
          int v16 = [HMDEventModel alloc];
          int v17 = [v11 uuid];
          __int16 v18 = [(HMDTrigger *)self uuid];
          int v19 = [(HMDBackingStoreModelObject *)v16 initWithObjectChangeType:3 uuid:v17 parentUUID:v18];

          [v20 add:v19];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v8);
  }
}

- (void)_removeEvents:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v21;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v20 + 1) + 8 * v6);
        long long v24 = @"kEventUUIDKey";
        uint64_t v8 = [v7 uuid];
        uint64_t v9 = [v8 UUIDString];
        long long v25 = v9;
        BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];

        id v11 = (void *)MEMORY[0x1E4F65480];
        id v12 = objc_alloc(MEMORY[0x1E4F65488]);
        uint64_t v13 = [(HMDTrigger *)self uuid];
        uint64_t v14 = (void *)[v12 initWithTarget:v13];
        uint64_t v15 = [v11 messageWithName:@"kRemoveEventFromEventTriggerRequestKey" destination:v14 payload:v10];

        objc_initWeak(&location, self);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        void v17[2] = __33__HMDEventTrigger__removeEvents___block_invoke;
        v17[3] = &unk_1E6A17A08;
        objc_copyWeak(&v18, &location);
        [v15 setResponseHandler:v17];
        [(HMDEventTrigger *)self _handleRemoveEventsFromEventTrigger:v15 relay:0];
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v4);
  }
}

void __33__HMDEventTrigger__removeEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained triggerEvents];
    uint64_t v10 = [v9 count];

    if (!v10)
    {
      id v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = v8;
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        int v16 = 138543362;
        int v17 = v14;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@There are no triggering events anymore, removing the trigger", (uint8_t *)&v16, 0xCu);
      }
      uint64_t v15 = [v12 home];
      [v15 removeTrigger:v12];
    }
  }
}

- (void)_handleRemovalOfCharacteristic:(id)a3 withEvents:(id)a4 transaction:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 accessory];
  char v45 = v9;
  id v47 = (void *)v11;
  if (!v9)
  {
    id v43 = v10;
    id v12 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v13 = [(HMDEventTrigger *)self characteristicBaseEvents];
    char v45 = objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v44 = self;
    uint64_t v14 = [(HMDEventTrigger *)self characteristicBaseEvents];
    uint64_t v15 = (void *)[v14 copy];

    id obj = v15;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v53 objects:v61 count:16];
    int v17 = (void *)v11;
    if (v16)
    {
      uint64_t v18 = v16;
      uint64_t v19 = *(void *)v54;
      id v46 = v8;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v54 != v19) {
            objc_enumerationMutation(obj);
          }
          long long v21 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          long long v22 = [v21 characteristic];
          long long v23 = [v22 service];
          long long v24 = [v23 accessory];

          long long v25 = [v17 uuid];
          id v26 = [v24 uuid];
          if ([v25 isEqual:v26])
          {
            uint64_t v27 = [v8 instanceID];
            v49 = v21;
            __int16 v28 = [v21 characteristic];
            [v28 instanceID];
            long long v29 = v22;
            uint64_t v30 = v18;
            v32 = uint64_t v31 = v19;
            int v50 = [v27 isEqual:v32];

            uint64_t v19 = v31;
            uint64_t v18 = v30;
            long long v22 = v29;

            int v17 = v47;
            id v8 = v46;

            if (v50) {
              [v45 addObject:v49];
            }
          }
          else
          {
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
      }
      while (v18);
    }

    id v10 = v43;
    self = v44;
    uint64_t v11 = (uint64_t)v17;
  }
  char v52 = 0;
  uint64_t v33 = [(HMDEventTrigger *)self predicateUtilities];
  long long v34 = [(HMDEventTrigger *)self evaluationCondition];
  id v51 = 0;
  long long v35 = [v8 service];
  __int16 v36 = [v33 updatePredicate:v34 currentCharacteristicInPredicate:&v51 conditionModified:&v52 removedCharacteristic:v8 underService:v35 underAccessory:v11];
  id v37 = v51;

  if (v52)
  {
    uint64_t v38 = (void *)MEMORY[0x1D9452090]();
    __int16 v39 = self;
    char v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      uint64_t v41 = HMFGetLogIdentifier();
      *(_DWORD *)int buf = 138543618;
      id v58 = v41;
      __int16 v59 = 2112;
      id v60 = v8;
      _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_INFO, "%{public}@Condition has been modified following removal of characteristic %@", buf, 0x16u);
    }
    id v42 = [(HMDEventTrigger *)v39 _modelWithRewrittenCondition:v36];
    if (v42) {
      [v10 add:v42 withMessage:0];
    }
  }
  [(HMDEventTrigger *)self _handleRemovalOfEvents:v45 transaction:v10];
}

- (void)handleRemovalOfCharacteristic:(id)a3 transaction:(id)a4
{
}

- (void)handleRemovalOfService:(id)a3 transaction:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMDEventTrigger;
  [(HMDTrigger *)&v18 handleRemovalOfService:v6 transaction:v7];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = objc_msgSend(v6, "characteristics", 0);
  id v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [(HMDEventTrigger *)self handleRemovalOfCharacteristic:*(void *)(*((void *)&v14 + 1) + 8 * v13++) transaction:v7];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)handleRemovalOfAccessory:(id)a3 transaction:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HMDEventTrigger;
  [(HMDTrigger *)&v21 handleRemovalOfAccessory:v6 transaction:v7];
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = objc_msgSend(v10, "services", 0);
  uint64_t v12 = (void *)[v11 copy];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [(HMDEventTrigger *)self handleRemovalOfService:*(void *)(*((void *)&v17 + 1) + 8 * v16++) transaction:v7];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v14);
  }
}

- (void)sendTriggerFiredNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDEventTrigger *)self locationEvents];
  uint64_t v6 = [v5 count];

  if (v6) {
    [MEMORY[0x1E4F65480] locationAuthorizedMessageWithName:@"kTriggerFiredNotificationKey" messagePayload:v4];
  }
  else {
  id v9 = [MEMORY[0x1E4F65480] messageWithName:@"kTriggerFiredNotificationKey" messagePayload:v4];
  }

  id v7 = [(HMDTrigger *)self msgDispatcher];
  id v8 = [(HMDTrigger *)self uuid];
  [v7 sendMessage:v9 target:v8];
}

- (BOOL)shouldEncodeLastFireDate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDEventTrigger *)self locationEvents];
  uint64_t v6 = [v5 count];

  if (v6) {
    char v7 = objc_msgSend(v4, "hmd_isForXPCTransportAuthorizedForLocationAccess");
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)dealloc
{
  id v3 = [(HMDTrigger *)self msgDispatcher];
  [v3 deregisterReceiver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDEventTrigger;
  [(HMDTrigger *)&v4 dealloc];
}

- (void)_registerForMessages
{
  v41[4] = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)HMDEventTrigger;
  [(HMDTrigger *)&v33 _registerForMessages];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleLocationAuthorizationChangedNotification_ name:@"HMDLocationAuthorizationChangedNotification" object:0];

  uint64_t v31 = [(HMDTrigger *)self home];
  long long v32 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  objc_msgSend(v32, "setRoles:", objc_msgSend(v32, "roles") | 4);
  objc_super v4 = (void *)[v32 copy];
  id v5 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v31 userPrivilege:4 remoteAccessRequired:0];
  uint64_t v6 = [(HMDTrigger *)self msgDispatcher];
  char v7 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v41[0] = v7;
  v41[1] = v4;
  v41[2] = v5;
  id v8 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v41[3] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
  [v6 registerForMessage:@"kUpdateEventTriggerConditionRequestKey" receiver:self policies:v9 selector:sel__handleUpdateEventTriggerCondition_];

  id v10 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v40[0] = v10;
  v40[1] = v4;
  v40[2] = v5;
  uint64_t v11 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v40[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
  [v6 registerForMessage:@"kUpdateEventTriggerRecurrencesRequestKey" receiver:self policies:v12 selector:sel__handleUpdateEventTriggerRecurrences_];

  uint64_t v13 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v39[0] = v13;
  v39[1] = v4;
  v39[2] = v5;
  uint64_t v14 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v39[3] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  [v6 registerForMessage:@"kUpdateEventTriggerExecuteOnceRequestKey" receiver:self policies:v15 selector:sel__handleUpdateEventTriggerExecuteOnce_];

  uint64_t v16 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v38[0] = v16;
  v38[1] = v4;
  void v38[2] = v5;
  long long v17 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:1];
  v38[3] = v17;
  long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
  [v6 registerForMessage:@"kAddEventToEventTriggerRequestKey" receiver:self policies:v18 selector:sel__handleAddEventToEventTrigger_];

  long long v19 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v37[0] = v19;
  v37[1] = v4;
  v37[2] = v5;
  long long v20 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:4];
  v37[3] = v20;
  objc_super v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  [v6 registerForMessage:@"kRemoveEventFromEventTriggerRequestKey" receiver:self policies:v21 selector:sel__handleRemoveEventsFromEventTrigger_];

  long long v22 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v36[0] = v22;
  v36[1] = v4;
  v36[2] = v5;
  uint64_t v23 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:6];
  v36[3] = v23;
  long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
  [v6 registerForMessage:@"kUpdateEventsToEventTriggerRequestKey" receiver:self policies:v24 selector:sel__handleUpdateEventsOnEventTrigger_];

  long long v25 = [(HMDTrigger *)self msgDispatcher];
  id v26 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v35[0] = v26;
  v35[1] = v5;
  uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  [v25 registerForMessage:@"kEventTriggerUserPermissionRequestKey" receiver:self policies:v27 selector:sel__handleUserPermissionRequest_];

  __int16 v28 = [(HMDTrigger *)self msgDispatcher];
  v34[0] = v4;
  v34[1] = v5;
  long long v29 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v34[2] = v29;
  uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
  [v28 registerForMessage:@"kUpdateOwningDeviceRequestKey" receiver:self policies:v30 selector:sel__handleUpdateOwningDevice_];
}

- (void)_migrateEventsToRecords
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  objc_super v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    [(HMDEventTrigger *)v4 migratedEventsToRecords];
    char v7 = HMFBooleanToString();
    *(_DWORD *)int buf = 138543618;
    long long v34 = v6;
    __int16 v35 = 2112;
    __int16 v36 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Events migration %@", buf, 0x16u);
  }
  if (![(HMDEventTrigger *)v4 migratedEventsToRecords])
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = v4;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)int buf = 138543362;
      long long v34 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@The events haven't been migrated, generating transactions for each event present", buf, 0xCu);
    }
    uint64_t v12 = [(HMDEventTrigger *)v9 characteristicEvents];
    uint64_t v13 = (void *)[v12 mutableCopy];

    uint64_t v14 = [(HMDEventTrigger *)v9 locationEvents];
    [v13 addObjectsFromArray:v14];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v13;
    uint64_t v15 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v27 = *(void *)v29;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v29 != v27) {
            objc_enumerationMutation(obj);
          }
          long long v18 = [*(id *)(*((void *)&v28 + 1) + 8 * v17) modelObjectWithChangeType:1];
          long long v19 = [MEMORY[0x1E4F65480] messageWithName:@"kMigratedEventsToRecordsRequest" messagePayload:0];
          [(HMDTrigger *)v9 home];
          v21 = long long v20 = v9;
          long long v22 = [v21 backingStore];
          uint64_t v23 = [v19 name];
          long long v24 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
          long long v25 = [v22 transaction:v23 options:v24];

          id v9 = v20;
          [v25 add:v18 withMessage:v19];
          [v25 run];

          ++v17;
        }
        while (v16 != v17);
        uint64_t v16 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v16);
    }

    [(HMDEventTrigger *)v9 setMigratedEventsToRecords:1];
  }
}

- (void)timerDidFire:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDTrigger *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDEventTrigger *)self debounceTriggerActivationTimer];

  if (v6 == v4)
  {
    char v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Debounce Timer expired: Going to activate the trigger", (uint8_t *)&v11, 0xCu);
    }
    [(HMDEventTrigger *)v8 _computeActivation];
    [(HMDEventTrigger *)v8 _activateEvents:0];
  }
}

- (void)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)HMDEventTrigger;
  [(HMDTrigger *)&v18 configure:a3 messageDispatcher:a4 queue:a5];
  [(HMDEventTrigger *)self _configureDebounceTriggerActivationTimer];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(HMDEventTrigger *)self events];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
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
        int v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        uint64_t v12 = [(HMDTrigger *)self msgDispatcher];
        uint64_t v13 = [(HMDTrigger *)self workQueue];
        [v11 configure:self messageDispatcher:v12 queue:v13 delegate:self];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }

  [(HMDEventTrigger *)self _activateWithCompletion:0];
  [(HMDEventTrigger *)self _migrateEventsToRecords];
}

- (void)_configureDebounceTriggerActivationTimer
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dependencyFactory = self->_dependencyFactory;
  if (!dependencyFactory)
  {
    id v4 = objc_alloc_init(HMDEventTriggerDependencyFactory);
    id v5 = self->_dependencyFactory;
    self->_dependencyFactory = v4;

    id v6 = (void *)MEMORY[0x1D9452090]();
    uint64_t v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      uint64_t v10 = self->_dependencyFactory;
      int v15 = 138543618;
      long long v16 = v9;
      __int16 v17 = 2112;
      objc_super v18 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Missing dependency factory, reinitializing %@", (uint8_t *)&v15, 0x16u);
    }
    dependencyFactory = self->_dependencyFactory;
  }
  int v11 = [(HMDEventTriggerDependencyFactory *)dependencyFactory createTimerWithTimeInterval:0 options:7.0];
  [(HMDEventTrigger *)self setDebounceTriggerActivationTimer:v11];

  uint64_t v12 = [(HMDEventTrigger *)self debounceTriggerActivationTimer];
  [v12 setDelegate:self];

  uint64_t v13 = [(HMDTrigger *)self workQueue];
  long long v14 = [(HMDEventTrigger *)self debounceTriggerActivationTimer];
  [v14 setDelegateQueue:v13];
}

- (void)_reevaluateIfRelaunchRequired
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = [(HMDEventTrigger *)self events];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    char v7 = 0;
    uint64_t v8 = *(void *)v19;
    *(void *)&long long v5 = 138543618;
    long long v17 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "isActive", v17))
        {
          int v11 = (void *)MEMORY[0x1D9452090]();
          uint64_t v12 = self;
          uint64_t v13 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            long long v14 = HMFGetLogIdentifier();
            *(_DWORD *)int buf = v17;
            uint64_t v23 = v14;
            __int16 v24 = 2112;
            long long v25 = v10;
            _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Registering for relaunch on behalf of event: %@", buf, 0x16u);
          }
          char v7 = 1;
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  int v15 = [(HMDEventTriggerDependencyFactory *)self->_dependencyFactory launchHandler];
  long long v16 = [(HMDTrigger *)self uuid];
  if (v7) {
    [v15 registerRelaunchClientWithUUID:v16];
  }
  else {
    [v15 deregisterRelaunchClientWithUUID:v16];
  }
}

- (void)_activateWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMDTrigger *)self isConfigured])
  {
    if (v4)
    {
      [(HMDEventTrigger *)self _computeActivation];
      [(HMDEventTrigger *)self _activateEvents:v4];
    }
    else
    {
      char v7 = [(HMDEventTrigger *)self debounceTriggerActivationTimer];
      uint64_t v8 = v7;
      if (!v7 || ([v7 timeInterval], v9 != 7.0))
      {
        uint64_t v10 = (void *)MEMORY[0x1D9452090]([(HMDEventTrigger *)self _configureDebounceTriggerActivationTimer]);
        int v11 = self;
        uint64_t v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = HMFGetLogIdentifier();
          long long v14 = [(HMDEventTrigger *)v11 debounceTriggerActivationTimer];
          int v16 = 138543874;
          long long v17 = v13;
          __int16 v18 = 2112;
          long long v19 = v8;
          __int16 v20 = 2112;
          long long v21 = v14;
          _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Reinitialized debounce timer from %@ to %@", (uint8_t *)&v16, 0x20u);
        }
      }
      int v15 = [(HMDEventTrigger *)self debounceTriggerActivationTimer];
      [v15 resume];
    }
  }
  else
  {
    long long v5 = (void (**)(void *, void *))_Block_copy(v4);
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2012];
      v5[2](v5, v6);
    }
  }
}

- (void)_activateEvents:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  group = dispatch_group_create();
  BOOL v37 = [(HMDEventTrigger *)self computedActive];
  id v4 = (void *)MEMORY[0x1D9452090]();
  val = self;
  long long v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    char v7 = HMDEventTriggerActivationTypeAsString([(HMDEventTrigger *)val activationType]);
    [(HMDEventTrigger *)val activationState];
    uint64_t v8 = HMEventTriggerActivationStateAsString();
    *(_DWORD *)int buf = 138543874;
    id v58 = v6;
    __int16 v59 = 2114;
    id v60 = v7;
    __int16 v61 = 2114;
    uint64_t v62 = v8;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Attempting to activate with activation type %{public}@, state %{public}@", buf, 0x20u);
  }
  uint64_t v38 = [MEMORY[0x1E4F1CA48] array];
  if (v37)
  {
    double v9 = [(HMDEventTrigger *)val evaluationCondition];
    if (!v9)
    {
      __int16 v24 = 0;
LABEL_11:

      goto LABEL_12;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
    id v11 = v9;
    uint64_t v12 = [v10 predicateWithValue:1];
    uint64_t v13 = [v11 predicateFormat];

    long long v14 = [v12 predicateFormat];
    char v15 = [v13 isEqualToString:v14];

    if ((v15 & 1) == 0)
    {
      int v16 = [(HMDTrigger *)val home];
      long long v17 = [v16 homeLocationHandler];
      __int16 v18 = [v17 location];
      BOOL v19 = v18 == 0;

      if (v19)
      {
        __int16 v20 = (void *)MEMORY[0x1D9452090]();
        long long v21 = val;
        uint64_t v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uint64_t v23 = HMFGetLogIdentifier();
          *(_DWORD *)int buf = 138543362;
          id v58 = v23;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Home location is not known, cannot activate the trigger", buf, 0xCu);
        }
        __int16 v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:84];
        [v38 addObject:v24];
        goto LABEL_11;
      }
    }
  }
LABEL_12:
  if (![v38 count])
  {
    dispatch_group_enter(group);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __35__HMDEventTrigger__activateEvents___block_invoke;
    v53[3] = &unk_1E6A18BA0;
    void v53[4] = val;
    id v25 = v38;
    id v54 = v25;
    id v26 = group;
    long long v55 = v26;
    [(HMDTrigger *)val _activate:v37 completionHandler:v53];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v50 = 0u;
    long long v49 = 0u;
    id obj = [(HMDEventTrigger *)val triggerEvents];
    uint64_t v27 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v50 != v28) {
            objc_enumerationMutation(obj);
          }
          long long v30 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          dispatch_group_enter(v26);
          uint64_t v31 = [(HMDEventTrigger *)val activationType];
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __35__HMDEventTrigger__activateEvents___block_invoke_3;
          v46[3] = &unk_1E6A18BA0;
          v46[4] = val;
          id v47 = v25;
          char v48 = v26;
          [v30 _activate:v31 completionHandler:v46];
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v27);
    }
  }
  objc_initWeak((id *)buf, val);
  long long v32 = [(HMDTrigger *)val workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__HMDEventTrigger__activateEvents___block_invoke_5;
  block[3] = &unk_1E6A15C50;
  objc_copyWeak(&v44, (id *)buf);
  BOOL v45 = v37;
  id v42 = v38;
  id v43 = v35;
  id v33 = v35;
  id v34 = v38;
  dispatch_group_notify(group, v32, block);

  objc_destroyWeak(&v44);
  objc_destroyWeak((id *)buf);
}

void __35__HMDEventTrigger__activateEvents___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__HMDEventTrigger__activateEvents___block_invoke_2;
  block[3] = &unk_1E6A19668;
  id v7 = v3;
  id v8 = a1[5];
  id v9 = a1[6];
  id v5 = v3;
  dispatch_async(v4, block);
}

void __35__HMDEventTrigger__activateEvents___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__HMDEventTrigger__activateEvents___block_invoke_4;
  block[3] = &unk_1E6A19668;
  id v7 = v3;
  id v8 = a1[5];
  id v9 = a1[6];
  id v5 = v3;
  dispatch_async(v4, block);
}

void __35__HMDEventTrigger__activateEvents___block_invoke_5(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = WeakRetained;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    uint64_t v7 = *(void *)(a1 + 32);
    int v12 = 138543618;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Completed activation with errors: %@", (uint8_t *)&v12, 0x16u);
  }
  if ([*(id *)(a1 + 32) count])
  {
    id v8 = [*(id *)(a1 + 32) objectAtIndex:0];
  }
  else
  {
    [v4 _reevaluateIfRelaunchRequired];
    id v8 = 0;
  }
  if (!*(unsigned char *)(a1 + 56)
    || ([v4 triggerEvents],
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        !v10))
  {
    [v4 setExecutionSession:0];
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v8);
  }
}

void __35__HMDEventTrigger__activateEvents___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  }
  v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

void __35__HMDEventTrigger__activateEvents___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  }
  v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

- (void)_computeActivation
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDEventTrigger *)self characteristicEvents];
  uint64_t v71 = [v3 count];

  id v4 = [(HMDEventTrigger *)self locationEvents];
  uint64_t v5 = [v4 count];

  uint64_t v6 = [(HMDEventTrigger *)self calendarEvents];
  uint64_t v70 = [v6 count];

  uint64_t v7 = [(HMDEventTrigger *)self significantTimeEvents];
  uint64_t v69 = [v7 count];

  id v8 = [(HMDEventTrigger *)self presenceEvents];
  uint64_t v68 = [v8 count];

  id v9 = [(HMDEventTrigger *)self charThresholdEvents];
  uint64_t v67 = [v9 count];

  uint64_t v10 = [(HMDEventTrigger *)self endEvents];
  uint64_t v66 = [v10 count];

  uint64_t v11 = [(HMDTrigger *)self home];
  int v12 = [v11 primaryResident];
  id v76 = [v12 device];
  char v75 = [(HMDTrigger *)self owningDevice];
  int v13 = [v11 isCurrentDeviceConfirmedPrimaryResident];
  BOOL v14 = [(HMDEventTrigger *)self isThisDeviceDesignatedFMFDevice];
  BOOL v15 = [(HMDEventTrigger *)self isOwnerOfHome];
  if (v5) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = v13;
  }
  int v72 = v13;
  BOOL v73 = v16;
  if (v5 && v14)
  {
    BOOL v15 = [(HMDEventTrigger *)self doesTheLocationEventTargetCurrentUser];
    BOOL v73 = v15;
  }
  long long v17 = (void *)MEMORY[0x1D9452090](v15);
  __int16 v18 = self;
  BOOL v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    __int16 v20 = HMFGetLogIdentifier();
    long long v21 = HMFBooleanToString();
    HMFBooleanToString();
    uint64_t v65 = v5;
    uint64_t v22 = v12;
    v24 = uint64_t v23 = v11;
    id v25 = HMFBooleanToString();
    id v26 = HMFBooleanToString();
    *(_DWORD *)int buf = 138544898;
    uint64_t v80 = v20;
    __int16 v81 = 2112;
    uint64_t v82 = (uint64_t)v76;
    __int16 v83 = 2112;
    uint64_t v84 = (uint64_t)v21;
    __int16 v85 = 2112;
    uint64_t v86 = (uint64_t)v24;
    __int16 v87 = 2112;
    uint64_t v88 = (uint64_t)v75;
    __int16 v89 = 2112;
    uint64_t v90 = (uint64_t)v25;
    __int16 v91 = 2112;
    uint64_t v92 = (uint64_t)v26;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Resident %@, this-device-is-resident: %@, this-device-owns-trigger: %@, owning-device: %@, FMF device: %@, Owner of home: %@", buf, 0x48u);

    uint64_t v11 = v23;
    int v12 = v22;
    uint64_t v5 = v65;
  }
  uint64_t v27 = (void *)MEMORY[0x1D9452090]();
  uint64_t v28 = v18;
  long long v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    long long v30 = HMFGetLogIdentifier();
    *(_DWORD *)int buf = 138545154;
    uint64_t v80 = v30;
    __int16 v81 = 2048;
    uint64_t v82 = v71;
    __int16 v83 = 2048;
    uint64_t v84 = v5;
    __int16 v85 = 2048;
    uint64_t v86 = v70;
    __int16 v87 = 2048;
    uint64_t v88 = v69;
    __int16 v89 = 2048;
    uint64_t v90 = v68;
    __int16 v91 = 2048;
    uint64_t v92 = v67;
    __int16 v93 = 2048;
    uint64_t v94 = v66;
    _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@char: %tu, location: %tu, calendar: %tu, significant: %tu, presence: %tu, char-threshold: %tu, end: %tu", buf, 0x52u);
  }
  BOOL v31 = [(HMDTrigger *)v28 hasNoActions];
  if ([(HMDTrigger *)v28 active] && !v31)
  {
    if (v5 && ![(HMDEventTrigger *)v28 isAuthorizedForLocation])
    {
      unint64_t v32 = 0;
      uint64_t v33 = 3;
      goto LABEL_45;
    }
    if (([v12 supportsSharedEventTriggerActivation] & 1) == 0
      && [(HMDEventTrigger *)v28 requiresDataVersion4])
    {
      unint64_t v32 = 0;
      if (v76) {
        uint64_t v33 = 2;
      }
      else {
        uint64_t v33 = 1;
      }
      goto LABEL_45;
    }
    if ([v12 supportsSharedEventTriggerActivation])
    {
      if (v5)
      {
        if (v72)
        {
          if (v73) {
            unint64_t v32 = 3;
          }
          else {
            unint64_t v32 = 2;
          }
        }
        else
        {
          unint64_t v32 = v73;
        }
        goto LABEL_44;
      }
      BOOL v38 = v72;
      goto LABEL_37;
    }
    if ([(HMDEventTrigger *)v28 requiresDataVersion4])
    {
      unint64_t v32 = 0;
    }
    else
    {
      if (v5)
      {
        BOOL v38 = v73;
LABEL_37:
        BOOL v39 = !v38;
        goto LABEL_38;
      }
      if ((v72 & 1) == 0)
      {
        BOOL v39 = !v73 || v76 != 0;
LABEL_38:
        if (v39) {
          unint64_t v32 = 0;
        }
        else {
          unint64_t v32 = 3;
        }
        goto LABEL_44;
      }
      unint64_t v32 = 3;
    }
LABEL_44:
    uint64_t v33 = 4;
    goto LABEL_45;
  }
  if (v31)
  {
    id v34 = (void *)MEMORY[0x1D9452090]();
    id v35 = v28;
    __int16 v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      BOOL v37 = HMFGetLogIdentifier();
      *(_DWORD *)int buf = 138543362;
      uint64_t v80 = v37;
      _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@The trigger is disabled as there are no actions associated with this trigger.", buf, 0xCu);
    }
  }
  uint64_t v33 = 0;
  unint64_t v32 = 0;
LABEL_45:
  char v40 = (void *)MEMORY[0x1D9452090]();
  uint64_t v41 = v28;
  id v42 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    id v43 = HMFGetLogIdentifier();
    id v44 = HMEventTriggerActivationStateAsString();
    HMDEventTriggerActivationTypeAsString(v32);
    id v46 = v45 = v12;
    *(_DWORD *)int buf = 138543874;
    uint64_t v80 = v43;
    __int16 v81 = 2112;
    uint64_t v82 = (uint64_t)v44;
    __int16 v83 = 2112;
    uint64_t v84 = (uint64_t)v46;
    _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Computed activation flags state:%@ type: %@", buf, 0x20u);

    int v12 = v45;
  }

  if ([(HMDEventTrigger *)v41 activationType] != v32)
  {
    id v47 = (void *)MEMORY[0x1D9452090]();
    char v48 = v41;
    long long v49 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      long long v50 = HMFGetLogIdentifier();
      HMDEventTriggerActivationTypeAsString([(HMDEventTrigger *)v48 activationType]);
      long long v51 = v74 = v12;
      HMDEventTriggerActivationTypeAsString(v32);
      v53 = long long v52 = v11;
      *(_DWORD *)int buf = 138543874;
      uint64_t v80 = v50;
      __int16 v81 = 2112;
      uint64_t v82 = (uint64_t)v51;
      __int16 v83 = 2112;
      uint64_t v84 = (uint64_t)v53;
      _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_INFO, "%{public}@Updating activation type from %@ to %@", buf, 0x20u);

      uint64_t v11 = v52;
      int v12 = v74;
    }
    [(HMDEventTrigger *)v48 setActivationType:v32];
  }
  if ([(HMDEventTrigger *)v41 activationState] != v33)
  {
    id v54 = (void *)MEMORY[0x1D9452090]();
    long long v55 = v41;
    long long v56 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      char v57 = HMFGetLogIdentifier();
      [(HMDEventTrigger *)v55 activationState];
      id v58 = HMEventTriggerActivationStateAsString();
      __int16 v59 = HMEventTriggerActivationStateAsString();
      *(_DWORD *)int buf = 138543874;
      uint64_t v80 = v57;
      __int16 v81 = 2112;
      uint64_t v82 = (uint64_t)v58;
      __int16 v83 = 2112;
      uint64_t v84 = (uint64_t)v59;
      _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_INFO, "%{public}@Updating activation state from %@ to %@", buf, 0x20u);
    }
    [(HMDEventTrigger *)v55 setActivationState:v33];
    id v77 = @"kEventTriggerActivationStateKey";
    id v60 = [NSNumber numberWithUnsignedInteger:v33];
    v78 = v60;
    __int16 v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];

    uint64_t v62 = [MEMORY[0x1E4F65480] messageWithName:@"kEventTriggerActivationStateNotificationKey" identifier:0 messagePayload:v61];
    uint64_t v63 = [(HMDTrigger *)v55 msgDispatcher];
    uint64_t v64 = [(HMDTrigger *)v55 uuid];
    [v63 sendMessage:v62 target:v64];
  }
}

- (BOOL)doesTheLocationEventTargetCurrentUser
{
  v2 = [(HMDEventTrigger *)self locationEvents];
  char v3 = objc_msgSend(v2, "na_allObjectsPassTest:", &__block_literal_global_57);

  return v3;
}

uint64_t __56__HMDEventTrigger_doesTheLocationEventTargetCurrentUser__block_invoke(uint64_t a1, void *a2)
{
  return [a2 doesThisTargetCurrentUser];
}

- (BOOL)computedActive
{
  return [(HMDEventTrigger *)self activationState] == 4;
}

- (BOOL)shouldActivateOnLocalDevice
{
  unint64_t v3 = [(HMDEventTrigger *)self activationType];
  v5.receiver = self;
  v5.super_class = (Class)HMDEventTrigger;
  BOOL result = [(HMDTrigger *)&v5 shouldActivateOnLocalDevice];
  if (v3 - 1 >= 3) {
    return 0;
  }
  return result;
}

- (BOOL)compatible:(id)a3 user:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)int buf = 138543618;
    uint64_t v23 = v11;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Checking if the username %@ is compatible", buf, 0x16u);
  }
  if ([(HMDEventTrigger *)v9 requiresDataVersion4]
    && [v6 containsObject:&unk_1F2DC79C0])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int v12 = [(HMDEventTrigger *)v9 presenceEvents];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v12);
          }
          if ([*(id *)(*((void *)&v17 + 1) + 8 * i) compatibleWithUser:v7])
          {
            LOBYTE(v13) = 1;
            goto LABEL_16;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (BOOL)requiresDataVersion4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)HMDEventTrigger;
  if ([(HMDTrigger *)&v21 requiresDataVersion4]) {
    return 1;
  }
  if ([(HMDEventTrigger *)self executeOnce])
  {
    unint64_t v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = self;
    objc_super v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)int buf = 138543362;
      uint64_t v23 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Contains execute once/policy, requires data version 4", buf, 0xCu);
    }
    return 1;
  }
  id v9 = [(HMDEventTrigger *)self calendarEvents];
  uint64_t v10 = [v9 count];

  uint64_t v11 = [(HMDEventTrigger *)self significantTimeEvents];
  uint64_t v12 = [v11 count];

  uint64_t v13 = [(HMDEventTrigger *)self presenceEvents];
  uint64_t v14 = [v13 count];

  BOOL v15 = [(HMDEventTrigger *)self charThresholdEvents];
  uint64_t v16 = [v15 count];

  long long v17 = [(HMDEventTrigger *)self endEvents];
  uint64_t v18 = [v17 count];

  char v7 = 1;
  if (!v10 && !v12 && !v14 && !v18 && !v16)
  {
    long long v19 = [(HMDEventTrigger *)self predicateUtilities];
    long long v20 = [(HMDEventTrigger *)self evaluationCondition];
    char v7 = [v19 containsPresenceEvents:v20];
  }
  return v7;
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  objc_super v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)int buf = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Deactivating the trigger", buf, 0xCu);
  }
  [(HMDTrigger *)v4 setActive:0];
  [(HMDEventTrigger *)v4 _activateWithCompletion:0];
  v7.receiver = v4;
  v7.super_class = (Class)HMDEventTrigger;
  [(HMDTrigger *)&v7 invalidate];
}

- (void)setRecurrences:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  recurrences = self->_recurrences;
  self->_recurrences = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)recurrences
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSArray *)self->_recurrences copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)presenceEvents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(HMDEventTrigger *)self triggerEvents];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return (NSArray *)v10;
}

- (NSArray)charThresholdEvents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(HMDEventTrigger *)self events];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return (NSArray *)v10;
}

- (NSArray)durationEvents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(HMDEventTrigger *)self events];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return (NSArray *)v10;
}

- (NSArray)timeEvents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(HMDEventTrigger *)self triggerEvents];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return (NSArray *)v10;
}

- (NSArray)significantTimeEvents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(HMDEventTrigger *)self triggerEvents];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return (NSArray *)v10;
}

- (NSArray)calendarEvents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(HMDEventTrigger *)self triggerEvents];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return (NSArray *)v10;
}

- (NSArray)locationEvents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(HMDEventTrigger *)self triggerEvents];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return (NSArray *)v10;
}

- (NSArray)characteristicBaseEvents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(HMDEventTrigger *)self events];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return (NSArray *)v10;
}

- (NSArray)characteristicEvents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(HMDEventTrigger *)self triggerEvents];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return (NSArray *)v10;
}

- (NSArray)endEvents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(HMDEventTrigger *)self events];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 isEndEvent]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return (NSArray *)v10;
}

- (NSArray)triggerEvents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(HMDEventTrigger *)self events];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 isEndEvent] & 1) == 0) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return (NSArray *)v10;
}

- (void)removeEvent:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_currentEvents removeObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)addEvent:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  if (([(NSMutableArray *)self->_currentEvents containsObject:v4] & 1) == 0) {
    [(NSMutableArray *)self->_currentEvents addObject:v4];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)events
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_currentEvents copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (unint64_t)triggerType
{
  return 1;
}

- (id)dumpState
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)HMDEventTrigger;
  unint64_t v3 = [(HMDTrigger *)&v28 dumpState];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(HMDEventTrigger *)self events];
  if ([v5 count])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v7 = [(HMDEventTrigger *)self events];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [*(id *)(*((void *)&v24 + 1) + 8 * i) dumpState];
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F64DC8]];
  }
  long long v13 = [(HMDEventTrigger *)self evaluationCondition];

  if (v13)
  {
    long long v14 = [(HMDEventTrigger *)self evaluationCondition];
    long long v15 = [v14 description];
    [v4 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F64E50]];
  }
  uint64_t v16 = [(HMDEventTrigger *)self recurrences];

  if (v16)
  {
    uint64_t v17 = [(HMDEventTrigger *)self recurrences];
    uint64_t v18 = [v17 description];
    [v4 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F64E58]];
  }
  long long v19 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEventTrigger executeOnce](self, "executeOnce"));
  [v4 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F64DD0]];

  long long v20 = [(HMDEventTrigger *)self executionSession];

  if (v20)
  {
    objc_super v21 = [(HMDEventTrigger *)self executionSession];
    uint64_t v22 = [v21 dumpState];
    [v4 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F64DD8]];
  }
  return v4;
}

- (HMDEventTrigger)initWithModel:(id)a3 home:(id)a4
{
  return [(HMDEventTrigger *)self initWithModel:a3 home:a4 message:0];
}

- (HMDEventTrigger)initWithModel:(id)a3 home:(id)a4 message:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_alloc_init(HMDEventTriggerDependencyFactory);
  long long v12 = [(HMDEventTrigger *)self initWithModel:v10 home:v9 message:v8 factory:v11];

  return v12;
}

- (HMDEventTrigger)initWithModel:(id)a3 home:(id)a4 message:(id)a5 factory:(id)a6
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v43.receiver = self;
  v43.super_class = (Class)HMDEventTrigger;
  long long v13 = [(HMDTrigger *)&v43 initWithModel:v10 home:a4];
  if (v13)
  {
    long long v14 = [HMDPredicateUtilities alloc];
    long long v15 = [(HMDTrigger *)v13 home];
    uint64_t v16 = [(HMDTrigger *)v13 name];
    uint64_t v17 = [(HMDPredicateUtilities *)v14 initWithHome:v15 logIdentifier:v16];
    predicateUtilities = v13->_predicateUtilities;
    v13->_predicateUtilities = (HMDPredicateUtilities *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    currentEvents = v13->_currentEvents;
    v13->_currentEvents = (NSMutableArray *)v19;

    objc_super v21 = [v10 executeOnce];
    v13->_executeOnce = [v21 BOOLValue];

    v13->_migratedEventsToRecords = 1;
    uint64_t v22 = [v10 evaluationCondition];
    uint64_t v23 = +[HMDPredicateUtilities decodePredicateFromData:v22 error:0];

    long long v24 = [(HMDEventTrigger *)v13 predicateUtilities];
    uint64_t v25 = [v24 rewritePredicateForDaemon:v23 message:v11];
    evaluationCondition = v13->_evaluationCondition;
    v13->_evaluationCondition = (NSPredicate *)v25;

    long long v27 = (void *)MEMORY[0x1E4F28DC0];
    objc_super v28 = (void *)MEMORY[0x1E4F1CAD0];
    v44[0] = objc_opt_class();
    v44[1] = objc_opt_class();
    long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    uint64_t v30 = [v28 setWithArray:v29];
    BOOL v31 = [v10 recurrences];
    unint64_t v32 = [v27 unarchivedObjectOfClasses:v30 fromData:v31 error:0];

    id v33 = v32;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v34 = v33;
    }
    else {
      id v34 = 0;
    }
    id v35 = v34;

    recurrences = v13->_recurrences;
    v13->_recurrences = v35;

    BOOL v37 = [(HMDTrigger *)v13 active];
    uint64_t v38 = 3;
    if (!v37) {
      uint64_t v38 = 0;
    }
    v13->_activationType = v38;
    BOOL v39 = [(HMDTrigger *)v13 active];
    uint64_t v40 = 4;
    if (!v39) {
      uint64_t v40 = 0;
    }
    v13->_activationState = v40;
    v13->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v13->_dependencyFactory, obj);
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)__validateRecurrences:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (!objc_msgSend(v8, "weekday", (void)v12))
        {
          LOBYTE(v10) = 0;
          goto LABEL_15;
        }
        id v9 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
        if ([v8 weekday] != 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v9, "setWeekday:", objc_msgSend(v8, "weekday"));
        }
        int v10 = [v8 isEqual:v9];

        if (!v10) {
          goto LABEL_15;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      LOBYTE(v10) = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }
LABEL_15:

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_31404 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_31404, &__block_literal_global_31405);
  }
  v2 = (void *)logCategory__hmf_once_v2_31406;
  return v2;
}

uint64_t __30__HMDEventTrigger_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_31406;
  logCategory__hmf_once_v2_31406 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end