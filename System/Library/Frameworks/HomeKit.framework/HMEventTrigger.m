@interface HMEventTrigger
+ (BOOL)__validateRecurrences:(id)a3;
+ (BOOL)isActionAffectedByEndEvents:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (NSPredicate)predicateForEvaluatingTriggerOccurringAfterDateWithComponents:(NSDateComponents *)dateComponents;
+ (NSPredicate)predicateForEvaluatingTriggerOccurringAfterSignificantEvent:(HMSignificantTimeEvent *)significantEvent;
+ (NSPredicate)predicateForEvaluatingTriggerOccurringAfterSignificantEvent:(NSString *)significantEvent applyingOffset:(NSDateComponents *)offset;
+ (NSPredicate)predicateForEvaluatingTriggerOccurringBeforeDateWithComponents:(NSDateComponents *)dateComponents;
+ (NSPredicate)predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:(HMSignificantTimeEvent *)significantEvent;
+ (NSPredicate)predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:(NSString *)significantEvent applyingOffset:(NSDateComponents *)offset;
+ (NSPredicate)predicateForEvaluatingTriggerOccurringBetweenDateWithComponents:(NSDateComponents *)firstDateComponents secondDateWithComponents:(NSDateComponents *)secondDateWithComponents;
+ (NSPredicate)predicateForEvaluatingTriggerOccurringBetweenSignificantEvent:(HMSignificantTimeEvent *)firstSignificantEvent secondSignificantEvent:(HMSignificantTimeEvent *)secondSignificantEvent;
+ (NSPredicate)predicateForEvaluatingTriggerOccurringOnDateWithComponents:(NSDateComponents *)dateComponents;
+ (NSPredicate)predicateForEvaluatingTriggerWithCharacteristic:(HMCharacteristic *)characteristic relatedBy:(NSPredicateOperatorType)operatorType toValue:(id)value;
+ (NSPredicate)predicateForEvaluatingTriggerWithPresence:(HMPresenceEvent *)presenceEvent;
+ (id)_predicateForEvaluatingTriggerOccurringAfterSignificantEvent:(id)a3 applyingOffset:(id)a4;
+ (id)_predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:(id)a3 applyingOffset:(id)a4;
+ (id)_predicateForEvaluatingTriggerWithCharacteristic:(id)a3 value:(id)a4 valueFormatString:(id)a5;
+ (id)createWithDictionary:(id)a3 home:(id)a4;
+ (id)negateOffset:(id)a3;
+ (id)predicateForEvaluatingTriggerWithCharacteristic:(id)a3 matchingValue:(id)a4;
- (BOOL)_updateCharacteristicReferenceInNewEvent:(id)a3;
- (BOOL)compatibleWithApp;
- (BOOL)containsSharedTriggerActivationBits;
- (BOOL)executeOnce;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)mergeFromNewObjectForBuilderUpdates:(id)a3;
- (HMEventTrigger)initWithCoder:(id)a3;
- (HMEventTrigger)initWithDictionary:(id)a3 home:(id)a4;
- (HMEventTrigger)initWithName:(NSString *)name events:(NSArray *)events endEvents:(NSArray *)endEvents recurrences:(NSArray *)recurrences predicate:(NSPredicate *)predicate;
- (HMEventTrigger)initWithName:(NSString *)name events:(NSArray *)events predicate:(NSPredicate *)predicate;
- (HMMutableArray)currentEvents;
- (NSArray)allEvents;
- (NSArray)endEvents;
- (NSArray)events;
- (NSArray)recurrences;
- (NSPredicate)internalPredicate;
- (NSPredicate)predicate;
- (id)_eventsWithDictionaries:(void *)a3 home:;
- (id)_serializeForAdd;
- (id)addedEvent:(void *)a3 home:;
- (id)copyAsBuilder;
- (id)initInternalWithName:(id)a3 configuredName:(id)a4 events:(id)a5 endEvents:(id)a6 recurrences:(id)a7 predicate:(id)a8;
- (unint64_t)activationState;
- (void)__configureWithContext:(id)a3 home:(id)a4;
- (void)_addEvent:(id)a3 completionHandler:(id)a4;
- (void)_handleAddEventFromResponse:(id)a3 newEventPayload:(id)a4;
- (void)_handleEventsRemovedFromResponse:(id)a3;
- (void)_registerNotificationHandlers;
- (void)_removeEvent:(id)a3 completionHandler:(id)a4;
- (void)_removeEventsForAccessory:(id)a3;
- (void)_updateCharacteristicReference;
- (void)_updateEvents:(id)a3 endEvent:(BOOL)a4 completionHandler:(id)a5;
- (void)_updateEventsFromResponse:(id)a3 responsePayload:(id)a4;
- (void)_updateExecuteOnce:(BOOL)a3 completionHandler:(id)a4;
- (void)_updatePredicate:(id)a3 completionHandler:(id)a4;
- (void)_updateRecurrences:(id)a3 completionHandler:(id)a4;
- (void)addEvent:(HMEvent *)event completionHandler:(void *)completion;
- (void)handleActivationStateNotification:(id)a3;
- (void)removeEvent:(HMEvent *)event completionHandler:(void *)completion;
- (void)setActivationState:(unint64_t)a3;
- (void)setCurrentEvents:(id)a3;
- (void)setExecuteOnce:(BOOL)a3;
- (void)setInternalPredicate:(id)a3;
- (void)setRecurrences:(id)a3;
- (void)updateEndEvents:(NSArray *)endEvents completionHandler:(void *)completion;
- (void)updateEvents:(NSArray *)events completionHandler:(void *)completion;
- (void)updateExecuteOnce:(BOOL)executeOnce completionHandler:(void *)completion;
- (void)updatePredicate:(NSPredicate *)predicate completionHandler:(void *)completion;
- (void)updateRecurrences:(NSArray *)recurrences completionHandler:(void *)completion;
- (void)updateWithBuilder:(id)a3 completionHandler:(id)a4;
@end

@implementation HMEventTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEvents, 0);
  objc_storeStrong((id *)&self->_recurrences, 0);

  objc_storeStrong((id *)&self->_internalPredicate, 0);
}

- (void)setCurrentEvents:(id)a3
{
}

- (HMMutableArray)currentEvents
{
  return self->_currentEvents;
}

- (BOOL)compatibleWithApp
{
  if (dyld_program_sdk_at_least()) {
    return 1;
  }
  else {
    return ![(HMEventTrigger *)self containsSharedTriggerActivationBits];
  }
}

- (BOOL)containsSharedTriggerActivationBits
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(HMEventTrigger *)self executeOnce])
  {
    v3 = (void *)MEMORY[0x19F3A64A0]();
    v4 = self;
    v5 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_5;
    }
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v23 = v6;
    v7 = "%{public}@Contains execute once, requires data version 4";
    goto LABEL_4;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = [(HMEventTrigger *)self currentEvents];
  v9 = [v8 array];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        if (([*(id *)(*((void *)&v17 + 1) + 8 * i) isEndEvent] & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
              }
            }
          }
        }

        return 1;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  v14 = [(HMEventTrigger *)self internalPredicate];
  BOOL v15 = +[HMPredicateUtilities containsPresenceEvents:v14];

  if (!v15) {
    return 0;
  }
  v3 = (void *)MEMORY[0x19F3A64A0]();
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v23 = v6;
    v7 = "%{public}@Contains presence events, requires data version 4";
LABEL_4:
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, v7, buf, 0xCu);
  }
LABEL_5:

  return 1;
}

- (BOOL)_updateCharacteristicReferenceInNewEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 characteristic];
  v6 = [v5 service];
  v7 = [v6 accessory];
  if (v7)
  {
    v8 = [(HMTrigger *)self home];
    v9 = [v7 uuid];
    uint64_t v10 = [v8 accessoryWithUUID:v9];

    uint64_t v11 = [v5 instanceID];
    uint64_t v12 = [v6 instanceID];
    v13 = [v10 _findCharacteristic:v11 forService:v12];

    BOOL v14 = v13 != 0;
    if (v13) {
      [v4 setCharacteristic:v13];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)mergeFromNewObjectForBuilderUpdates:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HMEventTrigger;
  BOOL v5 = [(HMTrigger *)&v29 mergeFromNewObjectForBuilderUpdates:v4];
  v6 = [HMObjectMergeCollection alloc];
  v7 = [(HMEventTrigger *)self currentEvents];
  v8 = [v7 array];
  v9 = [v4 currentEvents];
  uint64_t v10 = [v9 array];
  uint64_t v11 = [(HMObjectMergeCollection *)v6 initWithCurrentObjects:v8 newObjects:v10];

  uint64_t v12 = [(HMObjectMergeCollection *)v11 removedObjects];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __54__HMEventTrigger_mergeFromNewObjectForBuilderUpdates___block_invoke;
  v28[3] = &unk_1E593FAC8;
  v28[4] = self;
  [v12 enumerateObjectsUsingBlock:v28];

  v13 = [(HMObjectMergeCollection *)v11 addedObjects];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __54__HMEventTrigger_mergeFromNewObjectForBuilderUpdates___block_invoke_152;
  v27[3] = &unk_1E593FAC8;
  v27[4] = self;
  [v13 enumerateObjectsUsingBlock:v27];

  [(HMObjectMergeCollection *)v11 mergeCommonObjects];
  if ([(HMObjectMergeCollection *)v11 isModified])
  {
    BOOL v14 = [(HMObjectMergeCollection *)v11 finalObjects];
    BOOL v15 = [(HMEventTrigger *)self currentEvents];
    [v15 setArray:v14];

    BOOL v5 = 1;
  }
  v16 = [(HMEventTrigger *)self internalPredicate];
  long long v17 = [v4 internalPredicate];
  char v18 = HMFEqualObjects();

  if ((v18 & 1) == 0)
  {
    long long v19 = [v4 internalPredicate];
    [(HMEventTrigger *)self setInternalPredicate:v19];

    BOOL v5 = 1;
  }
  long long v20 = [(HMEventTrigger *)self recurrences];
  v21 = [v4 recurrences];
  char v22 = HMFEqualObjects();

  if ((v22 & 1) == 0)
  {
    v23 = [v4 recurrences];
    [(HMEventTrigger *)self setRecurrences:v23];

    BOOL v5 = 1;
  }
  int v24 = [(HMEventTrigger *)self executeOnce];
  if (v24 != [v4 executeOnce])
  {
    -[HMEventTrigger setExecuteOnce:](self, "setExecuteOnce:", [v4 executeOnce]);
    BOOL v5 = 1;
  }
  unint64_t v25 = [(HMEventTrigger *)self activationState];
  if (v25 != [v4 activationState])
  {
    -[HMEventTrigger setActivationState:](self, "setActivationState:", [v4 activationState]);
    BOOL v5 = 1;
  }

  return v5;
}

void __54__HMEventTrigger_mergeFromNewObjectForBuilderUpdates___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed event via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
}

void __54__HMEventTrigger_mergeFromNewObjectForBuilderUpdates___block_invoke_152(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v12 = 138543618;
    v13 = v7;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added event via merge: %@", (uint8_t *)&v12, 0x16u);
  }
  id v8 = v3;
  if ([v8 conformsToProtocol:&unk_1EEF23710]) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (!v10 || [*(id *)(a1 + 32) _updateCharacteristicReferenceInNewEvent:v10])
  {
    id v11 = [*(id *)(a1 + 32) context];
    objc_msgSend(v8, "__configureWithContext:eventTrigger:", v11, *(void *)(a1 + 32));
  }
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)HMEventTrigger;
  unsigned int v5 = [(HMTrigger *)&v33 mergeFromNewObject:v4];
  v6 = [HMObjectMergeCollection alloc];
  v7 = [(HMEventTrigger *)self currentEvents];
  id v8 = [v7 array];
  v9 = [v4 currentEvents];
  id v10 = [v9 array];
  id v11 = [(HMObjectMergeCollection *)v6 initWithCurrentObjects:v8 newObjects:v10];

  int v12 = [(HMObjectMergeCollection *)v11 removedObjects];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __37__HMEventTrigger_mergeFromNewObject___block_invoke;
  v32[3] = &unk_1E593FAC8;
  v32[4] = self;
  [v12 enumerateObjectsUsingBlock:v32];

  v13 = [(HMObjectMergeCollection *)v11 addedObjects];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __37__HMEventTrigger_mergeFromNewObject___block_invoke_148;
  v31[3] = &unk_1E593FAC8;
  v31[4] = self;
  [v13 enumerateObjectsUsingBlock:v31];

  [(HMObjectMergeCollection *)v11 mergeCommonObjects];
  if ([(HMObjectMergeCollection *)v11 isModified])
  {
    __int16 v14 = [(HMObjectMergeCollection *)v11 finalObjects];
    id v15 = [(HMEventTrigger *)self currentEvents];
    [v15 setArray:v14];

    unsigned int v5 = 1;
  }
  uint64_t v16 = [(HMEventTrigger *)self internalPredicate];
  long long v17 = [v4 internalPredicate];
  char v18 = HMFEqualObjects();

  if ((v18 & 1) == 0)
  {
    long long v19 = [v4 internalPredicate];
    [(HMEventTrigger *)self setInternalPredicate:v19];

    unsigned int v5 = 1;
  }
  long long v20 = [(HMEventTrigger *)self recurrences];
  v21 = [v4 recurrences];
  char v22 = HMFEqualObjects();

  if ((v22 & 1) == 0)
  {
    v23 = [v4 recurrences];
    [(HMEventTrigger *)self setRecurrences:v23];

    unsigned int v5 = 1;
  }
  int v24 = [(HMEventTrigger *)self executeOnce];
  if (v24 != [v4 executeOnce])
  {
    -[HMEventTrigger setExecuteOnce:](self, "setExecuteOnce:", [v4 executeOnce]);
    unsigned int v5 = 1;
  }
  unint64_t v25 = [(HMEventTrigger *)self activationState];
  if (v25 != [v4 activationState])
  {
    -[HMEventTrigger setActivationState:](self, "setActivationState:", [v4 activationState]);
    goto LABEL_13;
  }
  if (v5)
  {
LABEL_13:
    v27 = [(HMTrigger *)self context];
    v28 = [v27 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__HMEventTrigger_mergeFromNewObject___block_invoke_149;
    block[3] = &unk_1E59452E8;
    block[4] = self;
    dispatch_async(v28, block);

    BOOL v26 = 1;
    goto LABEL_14;
  }
  BOOL v26 = 0;
LABEL_14:

  return v26;
}

void __37__HMEventTrigger_mergeFromNewObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed event via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
}

void __37__HMEventTrigger_mergeFromNewObject___block_invoke_148(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v12 = 138543618;
    v13 = v7;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added event via merge: %@", (uint8_t *)&v12, 0x16u);
  }
  id v8 = v3;
  if ([v8 conformsToProtocol:&unk_1EEF23710]) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (!v10 || [*(id *)(a1 + 32) _updateCharacteristicReferenceInNewEvent:v10])
  {
    id v11 = [*(id *)(a1 + 32) context];
    objc_msgSend(v8, "__configureWithContext:eventTrigger:", v11, *(void *)(a1 + 32));
  }
}

void __37__HMEventTrigger_mergeFromNewObject___block_invoke_149(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) home];
  [v2 _notifyDelegateOfTriggerUpdated:*(void *)(a1 + 32)];
}

- (HMEventTrigger)initWithCoder:(id)a3
{
  v26[9] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HMEventTrigger;
  id v5 = [(HMTrigger *)&v23 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v26[2] = objc_opt_class();
    v26[3] = objc_opt_class();
    v26[4] = objc_opt_class();
    v26[5] = objc_opt_class();
    v26[6] = objc_opt_class();
    v26[7] = objc_opt_class();
    v26[8] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:9];
    id v8 = [v6 setWithArray:v7];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HM.eventTriggerEvents"];

    uint64_t v10 = +[HMMutableArray arrayWithArray:v9];
    currentEvents = v5->_currentEvents;
    v5->_currentEvents = (HMMutableArray *)v10;

    int v12 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    __int16 v14 = [v12 setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"HM.eventTriggerCondition"];
    internalPredicate = v5->_internalPredicate;
    v5->_internalPredicate = (NSPredicate *)v15;

    long long v17 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    char v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    long long v19 = [v17 setWithArray:v18];
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"HM.eventTriggerRecurrences"];
    recurrences = v5->_recurrences;
    v5->_recurrences = (NSArray *)v20;

    v5->_activationState = [v4 decodeIntegerForKey:@"kEventTriggerActivationStateKey"];
    *(&v5->_executeOnce + 4) = [v4 decodeBoolForKey:@"kEventTriggerExecuteOnce"];
  }
  return v5;
}

- (void)handleActivationStateNotification:(id)a3
{
  id v4 = [a3 numberForKey:@"kEventTriggerActivationStateKey"];
  uint64_t v5 = [v4 integerValue];

  [(HMEventTrigger *)self setActivationState:v5];
  id v6 = [(HMTrigger *)self home];
  [v6 _notifyDelegateOfTriggerUpdated:self];
}

- (void)_handleEventsRemovedFromResponse:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(a3, "hmf_arrayForKey:", @"kUUIDsOfEventsKey");
  uint64_t v5 = v4;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(*((void *)&v14 + 1) + 8 * v9)];
          id v11 = [(HMEventTrigger *)self currentEvents];
          int v12 = [v11 firstItemWithUUID:v10];

          if (v12)
          {
            v13 = [(HMEventTrigger *)self currentEvents];
            [v13 removeObject:v12];

            [v12 _unconfigure];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)_updateEventsFromResponse:(id)a3 responsePayload:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v31 = a4;
  uint64_t v7 = objc_msgSend(v31, "hmf_BOOLForKey:", @"kEventTriggerEndEvent");
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v8 = [(HMEventTrigger *)self currentEvents];
  uint64_t v9 = [v8 array];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (v7 == [v14 isEndEvent])
        {
          long long v15 = [(HMEventTrigger *)self currentEvents];
          [v15 removeObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v11);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    while (2)
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        char v22 = [(HMEventTrigger *)self currentEvents];
        [v22 replaceObject:v21];

        [v21 setEndEvent:v7];
        objc_super v23 = [(HMTrigger *)self context];
        objc_msgSend(v21, "__configureWithContext:eventTrigger:", v23, self);

        id v24 = v21;
        if ([v24 conformsToProtocol:&unk_1EEF23710]) {
          unint64_t v25 = v24;
        }
        else {
          unint64_t v25 = 0;
        }
        id v26 = v25;

        if (v26
          && ![(HMEventTrigger *)self _updateCharacteristicReferenceInNewEvent:v26])
        {

          goto LABEL_26;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v44 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }

  v27 = (void *)MEMORY[0x19F3A64A0]();
  v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    objc_super v29 = HMFGetLogIdentifier();
    v30 = [(HMEventTrigger *)self allEvents];
    *(_DWORD *)buf = 138543618;
    v41 = v29;
    __int16 v42 = 2112;
    v43 = v30;
    _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_INFO, "%{public}@handleEventsUpdatedNotification: current events: %@", buf, 0x16u);
  }
LABEL_26:
}

- (void)_handleAddEventFromResponse:(id)a3 newEventPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v18 = v6;
  if (v18)
  {
    objc_msgSend(v18, "setEndEvent:", objc_msgSend(v7, "hmf_BOOLForKey:", @"kEventTriggerEndEvent"));
    uint64_t v8 = v18;
  }
  else
  {
    uint64_t v9 = [(HMTrigger *)self home];
    uint64_t v8 = -[HMEventTrigger addedEvent:home:](self, v7, v9);

    if (!v8) {
      goto LABEL_11;
    }
  }
  id v10 = v8;
  int v11 = [v10 conformsToProtocol:&unk_1EEF23710];
  if (v11) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  if (!v11
    || (v14 = [(HMEventTrigger *)self _updateCharacteristicReferenceInNewEvent:v10], long long v15 = v10, v14))
  {
    id v16 = [(HMEventTrigger *)self currentEvents];
    [v16 replaceObject:v10];

    uint64_t v17 = [(HMTrigger *)self context];
    objc_msgSend(v10, "__configureWithContext:eventTrigger:", v17, self);

    long long v15 = v13;
  }

LABEL_11:
}

- (id)addedEvent:(void *)a3 home:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = objc_msgSend(v5, "hmf_stringForKey:", @"kEventTriggerTypeKey");
    if ([v7 isEqualToString:@"kEventTriggerTypeCharacteristicEventKey"])
    {
      uint64_t v8 = HMCharacteristicEvent;
    }
    else if ([v7 isEqualToString:@"kEventTriggerTypeLocationEventKey"])
    {
      uint64_t v8 = HMLocationEvent;
    }
    else if ([v7 isEqualToString:@"kEventTriggerTypeCalendarEventKey"])
    {
      uint64_t v8 = HMCalendarEvent;
    }
    else if ([v7 isEqualToString:@"kEventTriggerTypeSignificantTimeEventKey"])
    {
      uint64_t v8 = HMSignificantTimeEvent;
    }
    else if ([v7 isEqualToString:@"kEventTriggerTypeCharacteristicThresholdRangeEventKey"])
    {
      uint64_t v8 = HMCharacteristicThresholdRangeEvent;
    }
    else if ([v7 isEqualToString:@"kEventTriggerTypePresenceEventKey"])
    {
      uint64_t v8 = HMPresenceEvent;
    }
    else if ([v7 isEqualToString:@"kEventTriggerTypeDurationEventKey"])
    {
      uint64_t v8 = HMDurationEvent;
    }
    else
    {
      if (![v7 isEqualToString:@"kEventTriggerTypeMatterAttributeEventKey"])
      {
        id v10 = (void *)MEMORY[0x19F3A64A0]();
        id v11 = a1;
        uint64_t v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = HMFGetLogIdentifier();
          int v14 = 138543874;
          long long v15 = v13;
          __int16 v16 = 2112;
          uint64_t v17 = objc_opt_class();
          __int16 v18 = 2112;
          uint64_t v19 = v7;
          _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, invalid event type '%@'", (uint8_t *)&v14, 0x20u);
        }
        a1 = 0;
        goto LABEL_19;
      }
      uint64_t v8 = HMMatterAttributeEvent;
    }
    a1 = [(__objc2_class *)v8 createWithDictionary:v5 home:v6];
LABEL_19:
  }

  return a1;
}

- (void)_registerNotificationHandlers
{
  v5.receiver = self;
  v5.super_class = (Class)HMEventTrigger;
  [(HMTrigger *)&v5 _registerNotificationHandlers];
  id v3 = [(HMTrigger *)self context];
  id v4 = [v3 messageDispatcher];
  [v4 registerForMessage:@"kEventTriggerActivationStateNotificationKey" receiver:self selector:sel_handleActivationStateNotification_];
}

- (id)_serializeForAdd
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  v31.receiver = self;
  v31.super_class = (Class)HMEventTrigger;
  id v4 = [(HMTrigger *)&v31 _serializeForAdd];
  objc_super v5 = [v3 dictionaryWithDictionary:v4];

  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = [(HMEventTrigger *)self events];
  uint64_t v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v27 + 1) + 8 * i) _serializeForAdd];
        int v14 = v13;
        if (v13)
        {
          long long v15 = [v13 objectForKeyedSubscript:@"kEventTriggerTypeKey"];

          if (v15) {
            [v6 addObject:v14];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  __int16 v16 = (void *)[v6 copy];
  [v5 setObject:v16 forKeyedSubscript:@"kEventTriggerEventsKey"];

  uint64_t v17 = [(HMEventTrigger *)self internalPredicate];

  if (v17)
  {
    char v26 = 0;
    __int16 v18 = [(HMEventTrigger *)self predicate];
    uint64_t v19 = +[HMPredicateUtilities rewritePredicateForDaemon:v18 characteristicIsInvalid:&v26];

    uint64_t v20 = encodeRootObject(v19);
    [v5 setObject:v20 forKeyedSubscript:@"kEventTriggerConditionKey"];
  }
  v21 = [(HMEventTrigger *)self recurrences];

  if (v21)
  {
    char v22 = [(HMEventTrigger *)self recurrences];
    objc_super v23 = encodeRootObject(v22);
    [v5 setObject:v23 forKeyedSubscript:@"kEventTriggerRecurrencesKey"];
  }
  id v24 = (void *)[v5 copy];

  return v24;
}

- (void)_removeEventsForAccessory:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  v21 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = [(HMEventTrigger *)self allEvents];
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v27 + 1) + 8 * i);
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
          uint64_t v11 = [v10 characteristic];
          uint64_t v12 = [v11 service];

          if (v12)
          {
            id v13 = [v12 accessoryUUID];
            int v14 = [v22 uuid];
            int v15 = objc_msgSend(v13, "hmf_isEqualToUUID:", v14);

            if (v15) {
              [v21 addObject:v8];
            }
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v5);
  }

  __int16 v16 = [(HMEventTrigger *)self currentEvents];
  [v16 removeObjectsInArray:v21];

  uint64_t v17 = [(HMTrigger *)self home];
  __int16 v18 = [v17 delegate];

  if ([v21 count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v19 = [(HMTrigger *)self context];
    uint64_t v20 = [v19 delegateCaller];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __44__HMEventTrigger__removeEventsForAccessory___block_invoke;
    v24[3] = &unk_1E5945628;
    id v25 = v18;
    char v26 = self;
    [v20 invokeBlock:v24];
  }
}

void __44__HMEventTrigger__removeEventsForAccessory___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) home];
  [v2 home:v3 didUpdateTrigger:*(void *)(a1 + 40)];
}

- (void)_updateExecuteOnce:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMTrigger *)self home];
  id v8 = [(HMTrigger *)self context];
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8)
    {
      long long v30 = @"kEventTriggerExecuteOnce";
      id v10 = [NSNumber numberWithBool:v4];
      objc_super v31 = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];

      uint64_t v12 = (void *)MEMORY[0x1E4F654B0];
      id v13 = objc_alloc(MEMORY[0x1E4F65488]);
      int v14 = [(HMTrigger *)self uuid];
      int v15 = (void *)[v13 initWithTarget:v14];
      __int16 v16 = [v12 messageWithName:@"kUpdateEventTriggerExecuteOnceRequestKey" destination:v15 payload:v11];

      objc_initWeak((id *)location, self);
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      char v26 = __55__HMEventTrigger__updateExecuteOnce_completionHandler___block_invoke;
      long long v27 = &unk_1E5944188;
      objc_copyWeak(&v29, (id *)location);
      id v28 = v6;
      [v16 setResponseHandler:&v24];
      uint64_t v17 = objc_msgSend(v9, "messageDispatcher", v24, v25, v26, v27);
      [v17 sendMessage:v16 completionHandler:0];

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)location);
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
      v21 = self;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_super v23 = HMFGetLogIdentifier();
        *(_DWORD *)location = 138543618;
        *(void *)&location[4] = v23;
        __int16 v33 = 2080;
        long long v34 = "-[HMEventTrigger _updateExecuteOnce:completionHandler:]";
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
      }
    }
  }
  else
  {
    __int16 v18 = [v8 delegateCaller];
    uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
    [v18 callCompletion:v6 error:v19];
  }
}

void __55__HMEventTrigger__updateExecuteOnce_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = _Block_copy(*(const void **)(a1 + 32));
    int v14 = 138544130;
    int v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Update event trigger execute once response : %@, completionHandler: %@ error %@", (uint8_t *)&v14, 0x2Au);
  }
  if (!v5)
  {
    if (v6) {
      uint64_t v13 = objc_msgSend(v6, "hmf_BOOLForKey:", @"kEventTriggerExecuteOnce");
    }
    else {
      uint64_t v13 = 0;
    }
    [v9 setExecuteOnce:v13];
  }
  [v9 _updateClientWithResults:*(void *)(a1 + 32) withError:v5];
}

- (void)updateExecuteOnce:(BOOL)executeOnce completionHandler:(void *)completion
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = completion;
  id v7 = [(HMTrigger *)self context];
  if (!v6)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMEventTrigger updateExecuteOnce:completionHandler:]", @"completion"];
    __int16 v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = self;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v19;
      __int16 v26 = 2112;
      long long v27 = (const char *)v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
    objc_exception_throw(v20);
  }
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HMEventTrigger_updateExecuteOnce_completionHandler___block_invoke;
    block[3] = &unk_1E5941420;
    block[4] = self;
    BOOL v23 = executeOnce;
    id v22 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v13;
      __int16 v26 = 2080;
      long long v27 = "-[HMEventTrigger updateExecuteOnce:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    int v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v6 + 2))(v6, v14);
  }
}

uint64_t __54__HMEventTrigger_updateExecuteOnce_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateExecuteOnce:*(unsigned __int8 *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (void)_updateRecurrences:(id)a3 completionHandler:(id)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMTrigger *)self home];
  if (!v8)
  {
    uint64_t v12 = [(HMTrigger *)self context];
    uint64_t v13 = [v12 delegateCaller];
    uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
    goto LABEL_9;
  }
  if (v6)
  {
    if (+[HMEventTrigger __validateRecurrences:v6])
    {
      uint64_t v9 = encodeRootObject(v6);
      id v10 = (void *)v9;
      if (v9)
      {
        long long v36 = @"kEventTriggerRecurrencesKey";
        v37[0] = v9;
        uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      }
      else
      {
        uint64_t v11 = 0;
      }

      goto LABEL_12;
    }
    uint64_t v12 = [(HMTrigger *)self context];
    uint64_t v13 = [v12 delegateCaller];
    uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:3 userInfo:0];
LABEL_9:
    uint64_t v15 = (void *)v14;
    [v13 callCompletion:v7 error:v14];

    goto LABEL_18;
  }
  uint64_t v11 = 0;
LABEL_12:
  __int16 v16 = [(HMTrigger *)self context];
  if (v16)
  {
    id v17 = (void *)MEMORY[0x1E4F654B0];
    id v18 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v19 = [(HMTrigger *)self uuid];
    id v20 = (void *)[v18 initWithTarget:v19];
    id v21 = [v17 messageWithName:@"kUpdateEventTriggerRecurrencesRequestKey" destination:v20 payload:v11];

    objc_initWeak((id *)location, self);
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    id v29 = __55__HMEventTrigger__updateRecurrences_completionHandler___block_invoke;
    long long v30 = &unk_1E5944188;
    objc_copyWeak(&v32, (id *)location);
    id v31 = v7;
    [v21 setResponseHandler:&v27];
    id v22 = objc_msgSend(v16, "messageDispatcher", v27, v28, v29, v30);
    [v22 sendMessage:v21 completionHandler:0];

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)location);
  }
  else
  {
    BOOL v23 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v24 = self;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v26;
      __int16 v34 = 2080;
      uint64_t v35 = "-[HMEventTrigger _updateRecurrences:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
    }
  }

LABEL_18:
}

void __55__HMEventTrigger__updateRecurrences_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = _Block_copy(*(const void **)(a1 + 32));
    int v14 = 138544130;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Update event trigger recurrences response : %@, completionHandler: %@ error %@", (uint8_t *)&v14, 0x2Au);
  }
  if (!v5)
  {
    if (v6)
    {
      uint64_t v13 = [v6 arrayOfDateComponentsFromDataForKey:@"kEventTriggerRecurrencesKey"];
      [v9 setRecurrences:v13];
    }
    else
    {
      [v9 setRecurrences:0];
    }
  }
  [v9 _updateClientWithResults:*(void *)(a1 + 32) withError:v5];
}

- (void)updateRecurrences:(NSArray *)recurrences completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = recurrences;
  id v7 = completion;
  id v8 = [(HMTrigger *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMEventTrigger updateRecurrences:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HMEventTrigger_updateRecurrences_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    BOOL v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HMEventTrigger updateRecurrences:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __54__HMEventTrigger_updateRecurrences_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRecurrences:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_updatePredicate:(id)a3 completionHandler:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMTrigger *)self home];
  if (!v8)
  {
    uint64_t v11 = [(HMTrigger *)self context];
    uint64_t v12 = [v11 delegateCaller];
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
    goto LABEL_9;
  }
  if (v6)
  {
    if (+[HMPredicateUtilities validatePredicate:v6])
    {
      location[0] = 0;
      id v9 = +[HMPredicateUtilities rewritePredicateForDaemon:v6 characteristicIsInvalid:location];

      if (v9)
      {
        uint64_t v35 = @"kEventTriggerConditionKey";
        id v10 = encodeRootObject(v9);
        v36[0] = v10;
        id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
      }
      else
      {
        id v6 = 0;
      }
      goto LABEL_11;
    }
    uint64_t v11 = [(HMTrigger *)self context];
    uint64_t v12 = [v11 delegateCaller];
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:3 userInfo:0];
LABEL_9:
    int v14 = (void *)v13;
    [v12 callCompletion:v7 error:v13];

    goto LABEL_17;
  }
  id v9 = 0;
LABEL_11:
  uint64_t v15 = [(HMTrigger *)self context];
  if (v15)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F654B0];
    id v17 = objc_alloc(MEMORY[0x1E4F65488]);
    __int16 v18 = [(HMTrigger *)self uuid];
    uint64_t v19 = (void *)[v17 initWithTarget:v18];
    __int16 v20 = [v16 messageWithName:@"kUpdateEventTriggerConditionRequestKey" destination:v19 payload:v6];

    objc_initWeak((id *)location, self);
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    uint64_t v28 = __53__HMEventTrigger__updatePredicate_completionHandler___block_invoke;
    uint64_t v29 = &unk_1E5944188;
    objc_copyWeak(&v31, (id *)location);
    id v30 = v7;
    [v20 setResponseHandler:&v26];
    id v21 = objc_msgSend(v15, "messageDispatcher", v26, v27, v28, v29);
    [v21 sendMessage:v20 completionHandler:0];

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)location);
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v25;
      __int16 v33 = 2080;
      __int16 v34 = "-[HMEventTrigger _updatePredicate:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
    }
  }

  id v6 = v9;
LABEL_17:
}

void __53__HMEventTrigger__updatePredicate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = _Block_copy(*(const void **)(a1 + 32));
    int v14 = 138544130;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Update event trigger condition response : %@, completionHandler: %@ error %@", (uint8_t *)&v14, 0x2Au);
  }
  if (!v5)
  {
    if (v6)
    {
      uint64_t v13 = [v6 predicateFromDataForKey:@"kEventTriggerConditionKey"];
      [v9 setInternalPredicate:v13];
    }
    else
    {
      [v9 setInternalPredicate:0];
    }
  }
  [v9 _updateClientWithResults:*(void *)(a1 + 32) withError:v5];
}

- (void)updatePredicate:(NSPredicate *)predicate completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = predicate;
  id v7 = completion;
  id v8 = [(HMTrigger *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMEventTrigger updatePredicate:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__HMEventTrigger_updatePredicate_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    BOOL v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HMEventTrigger updatePredicate:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __52__HMEventTrigger_updatePredicate_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePredicate:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_updateCharacteristicReference
{
  id v2 = self;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  BOOL v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v5;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Updating characteristic references in the events and predicate", buf, 0xCu);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = [(HMEventTrigger *)v2 allEvents];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    id v10 = &selRef_reachabilityByAccessoryUniqueIdentifier;
    uint64_t v23 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = v10[277];
        id v13 = *(id *)(*((void *)&v24 + 1) + 8 * i);
        if ([v13 conformsToProtocol:v12]) {
          int v14 = v13;
        }
        else {
          int v14 = 0;
        }
        id v15 = v14;

        if (v15
          && ![(HMEventTrigger *)v2 _updateCharacteristicReferenceInNewEvent:v15])
        {
          uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
          id v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            __int16 v18 = v10;
            uint64_t v19 = v6;
            v21 = __int16 v20 = v2;
            uint64_t v22 = [v13 uuid];
            *(_DWORD *)buf = 138543618;
            uint64_t v29 = v21;
            __int16 v30 = 2112;
            id v31 = v22;
            _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Failed to update the characteristic reference for event %@", buf, 0x16u);

            id v2 = v20;
            id v6 = v19;
            id v10 = v18;
            uint64_t v9 = v23;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v8);
  }
}

- (void)_updateEvents:(id)a3 endEvent:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  val = self;
  id v39 = a5;
  v40 = [(HMTrigger *)self home];
  if (v40)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v41, "count"));
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v9 = v41;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v54 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = (void *)[*(id *)(*((void *)&v53 + 1) + 8 * i) copy];
          [v8 addObject:v13];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v53 objects:v60 count:16];
      }
      while (v10);
    }

    int v14 = [MEMORY[0x1E4F1CA48] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v15 = v8;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v49 objects:v59 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v50;
      while (2)
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v50 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = [*(id *)(*((void *)&v49 + 1) + 8 * j) _serializeForAdd];
          __int16 v20 = (void *)[v19 mutableCopy];

          if (!v20)
          {
            __int16 v30 = [(HMTrigger *)val context];
            uint64_t v33 = [v30 delegateCaller];
            __int16 v34 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:3 userInfo:0];
            [v33 callCompletion:v39 error:v34];

            long long v25 = v15;
            goto LABEL_19;
          }
          id v21 = [NSNumber numberWithBool:v6];
          [v20 setObject:v21 forKeyedSubscript:@"kEventTriggerEndEvent"];

          uint64_t v22 = (void *)[v20 copy];
          [v14 addObject:v22];
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v49 objects:v59 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    v57[0] = @"kEventTriggerEventsKey";
    uint64_t v23 = (void *)[v14 copy];
    v57[1] = @"kEventTriggerEndEvent";
    v58[0] = v23;
    long long v24 = [NSNumber numberWithBool:v6];
    v58[1] = v24;
    long long v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];

    long long v26 = (void *)MEMORY[0x1E4F654B0];
    id v27 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v28 = [(HMTrigger *)val uuid];
    uint64_t v29 = (void *)[v27 initWithTarget:v28];
    __int16 v30 = [v26 messageWithName:@"kUpdateEventsToEventTriggerRequestKey" destination:v29 payload:v25];

    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x3032000000;
    v47[3] = __Block_byref_object_copy__15818;
    v47[4] = __Block_byref_object_dispose__15819;
    id v48 = v15;
    objc_initWeak(&location, val);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __59__HMEventTrigger__updateEvents_endEvent_completionHandler___block_invoke;
    v42[3] = &unk_1E593FA88;
    objc_copyWeak(&v45, &location);
    id v43 = v39;
    v44 = v47;
    [v30 setResponseHandler:v42];
    id v31 = [(HMTrigger *)val context];
    id v32 = [v31 messageDispatcher];
    [v32 sendMessage:v30 completionHandler:0];

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
    _Block_object_dispose(v47, 8);

LABEL_19:
  }
  else
  {
    uint64_t v35 = [(HMTrigger *)self context];
    long long v36 = [v35 delegateCaller];
    long long v37 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
    [v36 callCompletion:v39 error:v37];
  }
}

void __59__HMEventTrigger__updateEvents_endEvent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = _Block_copy(*(const void **)(a1 + 32));
    int v13 = 138544130;
    int v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    __int16 v18 = v12;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Update events to event trigger response : %@, completionHandler: %@ error %@", (uint8_t *)&v13, 0x2Au);
  }
  if (!v5 && v6) {
    [v9 _updateEventsFromResponse:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) responsePayload:v6];
  }
  [v9 _updateClientWithResults:*(void *)(a1 + 32) withError:v5];
}

- (void)updateEndEvents:(NSArray *)endEvents completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = endEvents;
  uint64_t v7 = completion;
  uint64_t v8 = [(HMTrigger *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMEventTrigger updateEndEvents:completionHandler:]", @"completion"];
    __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__HMEventTrigger_updateEndEvents_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    uint64_t v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HMEventTrigger updateEndEvents:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __52__HMEventTrigger_updateEndEvents_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateEvents:*(void *)(a1 + 40) endEvent:1 completionHandler:*(void *)(a1 + 48)];
}

- (void)updateEvents:(NSArray *)events completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = events;
  uint64_t v7 = completion;
  uint64_t v8 = [(HMTrigger *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMEventTrigger updateEvents:completionHandler:]", @"completion"];
    __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__HMEventTrigger_updateEvents_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    uint64_t v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HMEventTrigger updateEvents:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __49__HMEventTrigger_updateEvents_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateEvents:*(void *)(a1 + 40) endEvent:0 completionHandler:*(void *)(a1 + 48)];
}

- (void)_removeEvent:(id)a3 completionHandler:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMTrigger *)self home];
  if (v8)
  {
    uint64_t v35 = @"kEventUUIDKey";
    id v9 = [v6 uuid];
    uint64_t v10 = [v9 UUIDString];
    v36[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];

    uint64_t v12 = [(HMTrigger *)self context];
    if (v12)
    {
      int v13 = (void *)MEMORY[0x1E4F654B0];
      id v14 = objc_alloc(MEMORY[0x1E4F65488]);
      __int16 v15 = [(HMTrigger *)self uuid];
      uint64_t v16 = (void *)[v14 initWithTarget:v15];
      __int16 v17 = [v13 messageWithName:@"kRemoveEventFromEventTriggerRequestKey" destination:v16 payload:v11];

      objc_initWeak((id *)location, self);
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      uint64_t v28 = __49__HMEventTrigger__removeEvent_completionHandler___block_invoke;
      uint64_t v29 = &unk_1E5944188;
      objc_copyWeak(&v31, (id *)location);
      id v30 = v7;
      [v17 setResponseHandler:&v26];
      __int16 v18 = objc_msgSend(v12, "messageDispatcher", v26, v27, v28, v29);
      [v18 sendMessage:v17 completionHandler:0];

      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)location);
    }
    else
    {
      uint64_t v22 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v23 = self;
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        long long v25 = HMFGetLogIdentifier();
        *(_DWORD *)id location = 138543618;
        *(void *)&location[4] = v25;
        __int16 v33 = 2080;
        __int16 v34 = "-[HMEventTrigger _removeEvent:completionHandler:]";
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
      }
    }
  }
  else
  {
    __int16 v19 = [(HMTrigger *)self context];
    id v20 = [v19 delegateCaller];
    id v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
    [v20 callCompletion:v7 error:v21];
  }
}

void __49__HMEventTrigger__removeEvent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = _Block_copy(*(const void **)(a1 + 32));
    int v13 = 138544130;
    id v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    __int16 v18 = v12;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Remove event from event trigger response : %@, completionHandler: %@ error %@", (uint8_t *)&v13, 0x2Au);
  }
  if (!v5 && v6) {
    [v9 _handleEventsRemovedFromResponse:v6];
  }
  [v9 _updateClientWithResults:*(void *)(a1 + 32) withError:v5];
}

- (void)removeEvent:(HMEvent *)event completionHandler:(void *)completion
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = event;
  id v7 = completion;
  uint64_t v8 = [(HMTrigger *)self context];
  if (!v7)
  {
    uint64_t v17 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMEventTrigger removeEvent:completionHandler:]", @"completion"];
    __int16 v18 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v21;
      __int16 v28 = 2112;
      uint64_t v29 = (const char *)v17;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0];
    objc_exception_throw(v22);
  }
  id v9 = v8;
  if (!v8)
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v14;
      __int16 v28 = 2080;
      uint64_t v29 = "-[HMEventTrigger removeEvent:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    goto LABEL_9;
  }
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:3 userInfo:0];
LABEL_9:
    id v16 = (void *)v15;
    v7[2](v7, v15);

    goto LABEL_10;
  }
  uint64_t v10 = [v8 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HMEventTrigger_removeEvent_completionHandler___block_invoke;
  block[3] = &unk_1E5945138;
  block[4] = self;
  id v24 = v6;
  long long v25 = v7;
  dispatch_async(v10, block);

LABEL_10:
}

uint64_t __48__HMEventTrigger_removeEvent_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeEvent:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_addEvent:(id)a3 completionHandler:(id)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMTrigger *)self home];
  if (v8)
  {
    id v9 = [v6 _serializeForAdd];
    uint64_t v10 = (void *)[v9 mutableCopy];

    if (v10)
    {
      __int16 v42 = @"kEventTriggerEventsKey";
      uint64_t v11 = (void *)[v10 copy];
      v43[0] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];

      int v13 = [(HMTrigger *)self context];
      if (v13)
      {
        id v14 = (void *)MEMORY[0x1E4F654B0];
        id v15 = objc_alloc(MEMORY[0x1E4F65488]);
        id v16 = [(HMTrigger *)self uuid];
        uint64_t v17 = (void *)[v15 initWithTarget:v16];
        __int16 v18 = [v14 messageWithName:@"kAddEventToEventTriggerRequestKey" destination:v17 payload:v12];

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        id v39 = __Block_byref_object_copy__15818;
        v40 = __Block_byref_object_dispose__15819;
        id v41 = v6;
        objc_initWeak(&location, self);
        uint64_t v30 = MEMORY[0x1E4F143A8];
        uint64_t v31 = 3221225472;
        id v32 = __46__HMEventTrigger__addEvent_completionHandler___block_invoke;
        __int16 v33 = &unk_1E593FA88;
        objc_copyWeak(&v36, &location);
        id v34 = v7;
        uint64_t v35 = buf;
        [v18 setResponseHandler:&v30];
        __int16 v19 = objc_msgSend(v13, "messageDispatcher", v30, v31, v32, v33);
        [v19 sendMessage:v18 completionHandler:0];

        objc_destroyWeak(&v36);
        objc_destroyWeak(&location);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        uint64_t v26 = (void *)MEMORY[0x19F3A64A0]();
        uint64_t v27 = self;
        __int16 v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v29;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[HMEventTrigger _addEvent:completionHandler:]";
          _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v23 = [(HMTrigger *)self context];
      id v24 = [v23 delegateCaller];
      long long v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:3 userInfo:0];
      [v24 callCompletion:v7 error:v25];
    }
  }
  else
  {
    id v20 = [(HMTrigger *)self context];
    uint64_t v21 = [v20 delegateCaller];
    id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
    [v21 callCompletion:v7 error:v22];
  }
}

void __46__HMEventTrigger__addEvent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = _Block_copy(*(const void **)(a1 + 32));
    int v13 = 138544130;
    id v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    __int16 v18 = v12;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Add event to event trigger response : %@, completionHandler: %@ error %@", (uint8_t *)&v13, 0x2Au);
  }
  if (!v5 && v6) {
    [v9 _handleAddEventFromResponse:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) newEventPayload:v6];
  }
  [v9 _updateClientWithResults:*(void *)(a1 + 32) withError:v5];
}

- (void)addEvent:(HMEvent *)event completionHandler:(void *)completion
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = event;
  id v7 = completion;
  uint64_t v8 = [(HMTrigger *)self context];
  if (!v7)
  {
    uint64_t v17 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMEventTrigger addEvent:completionHandler:]", @"completion"];
    __int16 v18 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v21;
      __int16 v28 = 2112;
      uint64_t v29 = (const char *)v17;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0];
    objc_exception_throw(v22);
  }
  id v9 = v8;
  if (!v8)
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v14;
      __int16 v28 = 2080;
      uint64_t v29 = "-[HMEventTrigger addEvent:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    goto LABEL_9;
  }
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:3 userInfo:0];
LABEL_9:
    id v16 = (void *)v15;
    v7[2](v7, v15);

    goto LABEL_10;
  }
  uint64_t v10 = [v8 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HMEventTrigger_addEvent_completionHandler___block_invoke;
  block[3] = &unk_1E5945138;
  block[4] = self;
  id v24 = v6;
  long long v25 = v7;
  dispatch_async(v10, block);

LABEL_10:
}

uint64_t __45__HMEventTrigger_addEvent_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addEvent:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)setActivationState:(unint64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_activationState = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)activationState
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  unint64_t activationState = self->_activationState;
  os_unfair_lock_unlock(p_lock);
  return activationState;
}

- (void)setExecuteOnce:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  *(&self->_executeOnce + 4) = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)executeOnce
{
  id v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = *(&v2->_executeOnce + 4);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setRecurrences:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  BOOL v4 = (NSArray *)[v6 copy];
  recurrences = self->_recurrences;
  self->_recurrences = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSArray)recurrences
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = self->_recurrences;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setInternalPredicate:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  BOOL v4 = (NSPredicate *)[v6 copy];
  internalPredicate = self->_internalPredicate;
  self->_internalPredicate = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSPredicate)internalPredicate
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = self->_internalPredicate;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSPredicate)predicate
{
  id v3 = [(HMEventTrigger *)self internalPredicate];
  BOOL v4 = [(HMTrigger *)self home];
  id v5 = +[HMPredicateUtilities rewritePredicateForClient:v3 home:v4];

  return (NSPredicate *)v5;
}

- (NSArray)allEvents
{
  id v2 = [(HMEventTrigger *)self currentEvents];
  id v3 = [v2 array];

  return (NSArray *)v3;
}

- (NSArray)endEvents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = [(HMEventTrigger *)self currentEvents];
  id v5 = [v4 array];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isEndEvent]) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (NSArray)events
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = [(HMEventTrigger *)self currentEvents];
  id v5 = [v4 array];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v10 isEndEvent] & 1) == 0) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMEventTrigger;
  [(HMTrigger *)&v16 __configureWithContext:v6 home:a4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = [(HMEventTrigger *)self allEvents];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "__configureWithContext:eventTrigger:", v6, self);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }
}

- (HMEventTrigger)initWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)HMEventTrigger;
  uint64_t v8 = [(HMTrigger *)&v40 initWithDictionary:v6 home:v7];
  if (!v8)
  {
LABEL_22:
    uint64_t v31 = v8;
    goto LABEL_23;
  }
  uint64_t v9 = objc_msgSend(v6, "hmf_numberForKey:", @"kEventTriggerRecurrencesKey");
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 unsignedIntegerValue];
    if (v11 == 127) {
      goto LABEL_7;
    }
    uint64_t v12 = HMDaysOfTheWeekToDateComponents(v11);
  }
  else
  {
    uint64_t v12 = [v6 arrayOfDateComponentsFromDataForKey:@"kEventTriggerRecurrencesKey"];
  }
  recurrences = v8->_recurrences;
  v8->_recurrences = (NSArray *)v12;

LABEL_7:
  *(&v8->_executeOnce + 4) = objc_msgSend(v6, "hmf_BOOLForKey:", @"kEventTriggerExecuteOnce");
  uint64_t v14 = [v6 predicateFromDataForKey:@"kEventTriggerConditionKey"];
  internalPredicate = v8->_internalPredicate;
  v8->_internalPredicate = (NSPredicate *)v14;

  objc_super v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  uint64_t v17 = objc_msgSend(v6, "hmf_arrayForKey:ofClasses:", @"kEventTriggerEventsKey", v16);
  uint64_t v18 = -[HMEventTrigger _eventsWithDictionaries:home:](v8, v17, v7);

  if (v18)
  {
    __int16 v19 = objc_msgSend(v6, "hmf_arrayForKey:ofClasses:", @"kEventTriggerEndEventsKey", v16);
    id v20 = -[HMEventTrigger _eventsWithDictionaries:home:](v8, v19, v7);

    if (v20)
    {
      id v34 = v16;
      uint64_t v35 = v10;
      uint64_t v21 = (void *)[v18 mutableCopy];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      __int16 v33 = v20;
      id v22 = v20;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v37 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            [v27 setEndEvent:1];
            [v21 addObject:v27];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v24);
      }

      uint64_t v28 = +[HMMutableArray arrayWithArray:v21];
      currentEvents = v8->_currentEvents;
      v8->_currentEvents = (HMMutableArray *)v28;

      int v30 = 0;
      objc_super v16 = v34;
      uint64_t v10 = v35;
      id v20 = v33;
    }
    else
    {
      int v30 = 1;
    }
  }
  else
  {
    int v30 = 1;
  }

  if (!v30) {
    goto LABEL_22;
  }
  uint64_t v31 = 0;
LABEL_23:

  return v31;
}

- (id)_eventsWithDictionaries:(void *)a3 home:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = -[HMEventTrigger addedEvent:home:](a1, *(void **)(*((void *)&v17 + 1) + 8 * i), v6);
        if (!v13)
        {

          long long v15 = 0;
          goto LABEL_11;
        }
        uint64_t v14 = (void *)v13;
        objc_msgSend(v7, "addObject:", v13, (void)v17);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  long long v15 = (void *)[v7 copy];
LABEL_11:

  return v15;
}

- (HMEventTrigger)initWithName:(NSString *)name events:(NSArray *)events predicate:(NSPredicate *)predicate
{
  return [(HMEventTrigger *)self initWithName:name events:events endEvents:0 recurrences:0 predicate:predicate];
}

- (id)initInternalWithName:(id)a3 configuredName:(id)a4 events:(id)a5 endEvents:(id)a6 recurrences:(id)a7 predicate:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HMEventTrigger;
  long long v18 = [(HMTrigger *)&v26 initWithName:a3 configuredName:a4];
  if (v18)
  {
    uint64_t v19 = +[HMMutableArray arrayWithArray:v14];
    currentEvents = v18->_currentEvents;
    v18->_currentEvents = (HMMutableArray *)v19;

    [(HMMutableArray *)v18->_currentEvents addObjectsFromArray:v15];
    uint64_t v21 = [v17 copy];
    internalPredicate = v18->_internalPredicate;
    v18->_internalPredicate = (NSPredicate *)v21;

    uint64_t v23 = [v16 copy];
    recurrences = v18->_recurrences;
    v18->_recurrences = (NSArray *)v23;

    v18->_unint64_t activationState = 0;
  }

  return v18;
}

- (HMEventTrigger)initWithName:(NSString *)name events:(NSArray *)events endEvents:(NSArray *)endEvents recurrences:(NSArray *)recurrences predicate:(NSPredicate *)predicate
{
  uint64_t v12 = name;
  uint64_t v13 = events;
  id v14 = endEvents;
  id v15 = recurrences;
  id v16 = predicate;
  if (!v13
    || (id v17 = v16, !+[HMEventTrigger __validateRecurrences:](HMEventTrigger, "__validateRecurrences:", v15))|| !+[HMPredicateUtilities validatePredicate:v17])
  {
    long long v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3C8];
    uint64_t v22 = [MEMORY[0x1E4F28C58] hmStringFromErrorCode:3];
    id v23 = [v20 exceptionWithName:v21 reason:v22 userInfo:0];

    objc_exception_throw(v23);
  }
  long long v18 = [(HMEventTrigger *)self initInternalWithName:v12 configuredName:v12 events:v13 endEvents:v14 recurrences:v15 predicate:v17];

  return v18;
}

+ (BOOL)isActionAffectedByEndEvents:(id)a3
{
  return [a3 isAffectedByEndEvents];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)createWithDictionary:(id)a3 home:(id)a4
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "hmf_stringForKey:", @"kTriggerName");
  if (v5)
  {
    id v6 = objc_msgSend(v4, "hmf_stringForKey:", @"HMT.triggerConfiguredNameKey");
    id v7 = [v4 arrayOfDateComponentsFromDataForKey:@"kEventTriggerRecurrencesKey"];
    id v8 = [v4 predicateFromDataForKey:@"kEventTriggerConditionKey"];
    uint64_t v9 = [HMEventTrigger alloc];
    id v10 = [(HMEventTrigger *)v9 initInternalWithName:v5 configuredName:v6 events:MEMORY[0x1E4F1CBF0] endEvents:MEMORY[0x1E4F1CBF0] recurrences:v7 predicate:v8];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)_predicateForEvaluatingTriggerWithCharacteristic:(id)a3 value:(id)a4 valueFormatString:(id)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 predicateWithFormat:@"%K = %@", @"characteristic", a3];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v8, @"characteristicValue", v9);

  uint64_t v12 = (void *)MEMORY[0x1E4F28BA0];
  v16[0] = v10;
  v16[1] = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  id v14 = [v12 andPredicateWithSubpredicates:v13];

  return v14;
}

+ (NSPredicate)predicateForEvaluatingTriggerWithCharacteristic:(HMCharacteristic *)characteristic relatedBy:(NSPredicateOperatorType)operatorType toValue:(id)value
{
  id v7 = characteristic;
  id v8 = value;
  if (operatorType >= NSMatchesPredicateOperatorType)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%tu is not a supported operation type", operatorType);
    id v9 = 0;
  }
  else
  {
    id v9 = +[HMEventTrigger _predicateForEvaluatingTriggerWithCharacteristic:v7 value:v8 valueFormatString:off_1E593FAE8[operatorType]];
  }

  return (NSPredicate *)v9;
}

+ (id)predicateForEvaluatingTriggerWithCharacteristic:(id)a3 matchingValue:(id)a4
{
  return +[HMEventTrigger predicateForEvaluatingTriggerWithCharacteristic:a3 relatedBy:4 toValue:a4];
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringBetweenDateWithComponents:(NSDateComponents *)firstDateComponents secondDateWithComponents:(NSDateComponents *)secondDateWithComponents
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v5 = firstDateComponents;
  id v6 = secondDateWithComponents;
  id v7 = +[HMEventTrigger predicateForEvaluatingTriggerOccurringAfterDateWithComponents:v5];
  id v8 = +[HMEventTrigger predicateForEvaluatingTriggerOccurringBeforeDateWithComponents:v6];
  if (!+[HMPredicateUtilities areOnlyHourAndMinuteSet:](HMPredicateUtilities, "areOnlyHourAndMinuteSet:", v5)|| !+[HMPredicateUtilities areOnlyHourAndMinuteSet:v6])
  {
    id v15 = (void *)MEMORY[0x1E4F28BA0];
    v21[0] = v7;
    v21[1] = v8;
    id v16 = (void *)MEMORY[0x1E4F1C978];
    id v17 = v21;
LABEL_8:
    uint64_t v13 = [v16 arrayWithObjects:v17 count:2];
    uint64_t v14 = [v15 andPredicateWithSubpredicates:v13];
    goto LABEL_9;
  }
  uint64_t v9 = [(NSDateComponents *)v5 hour];
  if (v9 > [(NSDateComponents *)v6 hour])
  {
LABEL_6:
    uint64_t v12 = (void *)MEMORY[0x1E4F28BA0];
    v22[0] = v7;
    v22[1] = v8;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    uint64_t v14 = [v12 orPredicateWithSubpredicates:v13];
LABEL_9:
    long long v18 = (void *)v14;

    goto LABEL_10;
  }
  uint64_t v10 = [(NSDateComponents *)v5 hour];
  if (v10 < [(NSDateComponents *)v6 hour]) {
    goto LABEL_14;
  }
  uint64_t v11 = [(NSDateComponents *)v5 minute];
  if (v11 > [(NSDateComponents *)v6 minute]) {
    goto LABEL_6;
  }
  uint64_t v20 = [(NSDateComponents *)v5 minute];
  if (v20 < [(NSDateComponents *)v6 minute])
  {
LABEL_14:
    id v15 = (void *)MEMORY[0x1E4F28BA0];
    v23[0] = v7;
    v23[1] = v8;
    id v16 = (void *)MEMORY[0x1E4F1C978];
    id v17 = v23;
    goto LABEL_8;
  }
  long long v18 = +[HMEventTrigger predicateForEvaluatingTriggerOccurringOnDateWithComponents:v5];
LABEL_10:

  return (NSPredicate *)v18;
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringAfterDateWithComponents:(NSDateComponents *)dateComponents
{
  return (NSPredicate *)[MEMORY[0x1E4F28F60] predicateWithFormat:@"now() > %@", dateComponents];
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringOnDateWithComponents:(NSDateComponents *)dateComponents
{
  return (NSPredicate *)[MEMORY[0x1E4F28F60] predicateWithFormat:@"now() = %@", dateComponents];
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringBeforeDateWithComponents:(NSDateComponents *)dateComponents
{
  return (NSPredicate *)[MEMORY[0x1E4F28F60] predicateWithFormat:@"now() < %@", dateComponents];
}

+ (NSPredicate)predicateForEvaluatingTriggerWithPresence:(HMPresenceEvent *)presenceEvent
{
  return (NSPredicate *)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"presence", presenceEvent];
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringBetweenSignificantEvent:(HMSignificantTimeEvent *)firstSignificantEvent secondSignificantEvent:(HMSignificantTimeEvent *)secondSignificantEvent
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v5 = secondSignificantEvent;
  id v6 = firstSignificantEvent;
  id v7 = +[HMEventTrigger predicateForEvaluatingTriggerOccurringAfterSignificantEvent:v6];
  id v8 = +[HMEventTrigger predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:v5];
  uint64_t v9 = [(HMSignificantTimeEvent *)v6 significantEvent];

  if ([v9 isEqualToString:@"sunrise"])
  {
    uint64_t v10 = [(HMSignificantTimeEvent *)v5 significantEvent];
    int v11 = [v10 isEqualToString:@"sunset"];

    if (v11)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28BA0];
      v19[0] = v7;
      v19[1] = v8;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      uint64_t v14 = [v12 andPredicateWithSubpredicates:v13];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v15 = (void *)MEMORY[0x1E4F28BA0];
  v18[0] = v7;
  v18[1] = v8;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  uint64_t v14 = [v15 orPredicateWithSubpredicates:v13];
LABEL_6:
  id v16 = (void *)v14;

  return (NSPredicate *)v16;
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringAfterSignificantEvent:(HMSignificantTimeEvent *)significantEvent
{
  id v3 = significantEvent;
  id v4 = [(HMSignificantTimeEvent *)v3 significantEvent];
  id v5 = [(HMSignificantTimeEvent *)v3 offset];

  id v6 = +[HMEventTrigger _predicateForEvaluatingTriggerOccurringAfterSignificantEvent:v4 applyingOffset:v5];

  return (NSPredicate *)v6;
}

+ (id)_predicateForEvaluatingTriggerOccurringAfterSignificantEvent:(id)a3 applyingOffset:(id)a4
{
  if (a4)
  {
    id v5 = a3;
    id v6 = +[HMEventTrigger negateOffset:a4];
    id v7 = (void *)MEMORY[0x1E4F28F60];
    id v8 = _HMSignificantEventKeyPath(v5);

    uint64_t v9 = [v7 predicateWithFormat:@"%K <= now() + %@", v8, v6];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
    id v11 = a3;
    id v6 = _HMSignificantEventKeyPath(v11);

    uint64_t v9 = objc_msgSend(v10, "predicateWithFormat:", @"%K <= now()", v6);
  }

  return v9;
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringAfterSignificantEvent:(NSString *)significantEvent applyingOffset:(NSDateComponents *)offset
{
  return (NSPredicate *)+[HMEventTrigger _predicateForEvaluatingTriggerOccurringAfterSignificantEvent:significantEvent applyingOffset:offset];
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:(HMSignificantTimeEvent *)significantEvent
{
  id v3 = significantEvent;
  id v4 = [(HMSignificantTimeEvent *)v3 significantEvent];
  id v5 = [(HMSignificantTimeEvent *)v3 offset];

  id v6 = +[HMEventTrigger _predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:v4 applyingOffset:v5];

  return (NSPredicate *)v6;
}

+ (id)_predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:(id)a3 applyingOffset:(id)a4
{
  if (a4)
  {
    id v5 = a3;
    id v6 = +[HMEventTrigger negateOffset:a4];
    id v7 = (void *)MEMORY[0x1E4F28F60];
    id v8 = _HMSignificantEventKeyPath(v5);

    uint64_t v9 = [v7 predicateWithFormat:@"%K > now() + %@", v8, v6];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
    id v11 = a3;
    id v6 = _HMSignificantEventKeyPath(v11);

    uint64_t v9 = objc_msgSend(v10, "predicateWithFormat:", @"%K > now()", v6);
  }

  return v9;
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:(NSString *)significantEvent applyingOffset:(NSDateComponents *)offset
{
  return (NSPredicate *)+[HMEventTrigger _predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:significantEvent applyingOffset:offset];
}

+ (id)negateOffset:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  if ([v3 minute] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v4, "setMinute:", -objc_msgSend(v3, "minute"));
  }
  if ([v3 hour] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v4, "setHour:", -objc_msgSend(v3, "hour"));
  }

  return v4;
}

+ (BOOL)__validateRecurrences:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "weekday", (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (void)updateWithBuilder:(id)a3 completionHandler:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMTrigger *)self context];
  uint64_t v9 = [(HMTrigger *)self home];
  long long v10 = v9;
  if (v8)
  {
    id v37 = 0;
    char v11 = [v9 validateBuilder:v6 error:&v37];
    id v12 = v37;
    long long v13 = v12;
    if (v11)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F1CA60];
      id v36 = v12;
      uint64_t v15 = [v10 encodeEventTriggerBuilder:v6 error:&v36];
      id v16 = v36;

      id v17 = [v14 dictionaryWithDictionary:v15];

      long long v18 = [(HMTrigger *)self uuid];
      uint64_t v19 = [v18 UUIDString];
      [v17 setObject:v19 forKeyedSubscript:@"kTriggerUUID"];

      if (v17)
      {
        uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
        uint64_t v21 = self;
        uint64_t v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          id v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v39 = v23;
          __int16 v40 = 2112;
          id v41 = (const char *)v17;
          _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@Going to update the event trigger with : %@", buf, 0x16u);
        }
        uint64_t v24 = [(HMTrigger *)v21 uuid];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __77__HMEventTrigger_HMEventTriggerBuilder__updateWithBuilder_completionHandler___block_invoke;
        v30[3] = &unk_1E5942B08;
        id v31 = v8;
        id v35 = v7;
        id v32 = v21;
        id v33 = v17;
        id v34 = v10;
        -[_HMContext sendMessage:target:payload:responseHandler:](v31, @"HMUpdateEventTriggerFromBuilderMessage", v24, v33, v30);

        uint64_t v25 = v31;
      }
      else
      {
        uint64_t v25 = [v8 delegateCaller];
        [v25 callCompletion:v7 error:v16];
      }
    }
    else
    {
      id v17 = [v8 delegateCaller];
      [v17 callCompletion:v7 error:v13];
      id v16 = v13;
    }
  }
  else
  {
    objc_super v26 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v27 = self;
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v39 = v29;
      __int16 v40 = 2080;
      id v41 = "-[HMEventTrigger(HMEventTriggerBuilder) updateWithBuilder:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __77__HMEventTrigger_HMEventTriggerBuilder__updateWithBuilder_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) delegateCaller];
    [(HMEventTrigger *)v7 callCompletion:*(void *)(a1 + 64) error:v5];
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 40);
    long long v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 48);
      int v16 = 138543618;
      id v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully updated the event trigger. ResponsePayload : %@", (uint8_t *)&v16, 0x16u);
    }
    id v7 = [[HMEventTrigger alloc] initWithDictionary:v6 home:*(void *)(a1 + 56)];
    if (v7)
    {
      [*(id *)(a1 + 40) mergeFromNewObjectForBuilderUpdates:v7];
      long long v13 = [*(id *)(a1 + 32) delegateCaller];
      [v13 callCompletion:*(void *)(a1 + 64) error:0];
    }
    else
    {
      long long v13 = [*(id *)(a1 + 32) delegateCaller];
      uint64_t v14 = *(void *)(a1 + 64);
      uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      [v13 callCompletion:v14 error:v15];
    }
  }
}

- (id)copyAsBuilder
{
  id v3 = [HMEventTriggerBuilder alloc];

  return [(HMEventTriggerBuilder *)v3 initWithEventTrigger:self];
}

@end