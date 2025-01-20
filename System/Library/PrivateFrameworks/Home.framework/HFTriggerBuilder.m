@interface HFTriggerBuilder
+ (Class)homeKitRepresentationClass;
+ (id)triggerBuilderForTrigger:(id)a3 inHome:(id)a4 context:(id)a5;
+ (id)triggerBuilderForTrigger:(id)a3 inHome:(id)a4 context:(id)a5 assertsFailure:(BOOL)a6;
- (BOOL)areActionsAffectedByEndEvents;
- (BOOL)enabled;
- (BOOL)isShortcutOwned;
- (BOOL)nameIsConfigured;
- (BOOL)requiresConfirmationToRun;
- (BOOL)requiresFMFDeviceToRun;
- (BOOL)requiresHomeHub;
- (BOOL)requiresLocationServicesAuthorization;
- (BOOL)requiresUpdatedHomeHub;
- (BOOL)secureActionsRequireConfirmationToRun;
- (BOOL)supportsConditions;
- (BOOL)supportsEndEvents;
- (BOOL)supportsHomeKitAutomationBuilders;
- (HFConditionCollection)conditionCollection;
- (HFDurationEventBuilder)designatedDurationEventBuilder;
- (HFMutableSetDiff)endEventBuildersDiff;
- (HFTriggerActionSetsBuilder)triggerActionSets;
- (HFTriggerBuilder)initWithExistingObject:(id)a3 inHome:(id)a4;
- (HFTriggerBuilder)initWithExistingObject:(id)a3 inHome:(id)a4 context:(id)a5;
- (HFTriggerBuilder)initWithHome:(id)a3;
- (HFTriggerBuilder)initWithHome:(id)a3 context:(id)a4;
- (HFTriggerBuilder)triggerBuilderWithContext:(id)a3;
- (HFTriggerBuilderContextProviding)context;
- (NSArray)endEventBuilders;
- (NSString)displayName;
- (NSString)name;
- (id)_commitAddTriggerToHome:(id)a3;
- (id)_commitUsingBuilders;
- (id)_deleteTrigger:(id)a3 fromHome:(id)a4;
- (id)_lazy_performValidation;
- (id)_legacyCommitItem;
- (id)_uniquelyRenameTrigger:(id)a3 pendingReplaceByNewTriggerWithName:(id)a4;
- (id)_updateActionSets;
- (id)_updateAnonymousActionSet;
- (id)_updateConditions;
- (id)_updateEnabledState;
- (id)_updateEndEvents;
- (id)_updateName;
- (id)commitCreateTrigger;
- (id)commitEditTrigger;
- (id)commitItem;
- (id)compareToObject:(id)a3;
- (id)createNewTriggerBuilder;
- (id)deleteTrigger;
- (id)getOrCreateTriggerBuilder;
- (id)lazilyFinishCommitingTrigger;
- (id)naturalLanguageDetailsWithOptions:(id)a3;
- (id)naturalLanguageNameOfType:(unint64_t)a3;
- (id)naturalLanguageNameWithOptions:(id)a3;
- (id)replaceCurrentTriggerWithTrigger:(id)a3;
- (id)updateTriggerBuilder:(id)a3;
- (id)validationError;
- (unint64_t)hash;
- (void)_didReplaceBackingTrigger;
- (void)_notifyObserversOfAddingTrigger:(id)a3;
- (void)_notifyObserversOfChangingTrigger:(id)a3;
- (void)addEndEventBuilder:(id)a3;
- (void)removeAllEndEventBuilders;
- (void)removeEndEventBuilder:(id)a3;
- (void)removeServiceLikeItem:(id)a3;
- (void)replaceConditionsWithConditions:(id)a3;
- (void)setConditionCollection:(id)a3;
- (void)setContext:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEndEvent:(id)a3;
- (void)setEndEventBuildersDiff:(id)a3;
- (void)setName:(id)a3;
- (void)setNameIsConfigured:(BOOL)a3;
- (void)setTriggerActionSets:(id)a3;
- (void)updateEndEventBuilder:(id)a3;
@end

@implementation HFTriggerBuilder

- (id)getOrCreateTriggerBuilder
{
  v3 = [(HFTriggerBuilder *)self trigger];
  v4 = v3;
  if (!v3)
  {
    v5 = [(HFTriggerBuilder *)self createNewTriggerBuilder];
    uint64_t v6 = +[HFTriggerBuilderPair creatingTriggerWithBuilder:v5];
    goto LABEL_5;
  }
  v5 = objc_msgSend(v3, "hf_copyAsBuilder");
  if (v5)
  {
    uint64_t v6 = +[HFTriggerBuilderPair updatingTrigger:v4 withBuilder:v5];
LABEL_5:
    v7 = (void *)v6;
    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (id)createNewTriggerBuilder
{
  return 0;
}

- (id)updateTriggerBuilder:(id)a3
{
  id v4 = a3;
  v5 = [(HFTriggerBuilder *)self name];
  objc_msgSend(v4, "setName:isConfigured:", v5, -[HFTriggerBuilder nameIsConfigured](self, "nameIsConfigured"));

  objc_msgSend(v4, "setEnabled:", -[HFTriggerBuilder enabled](self, "enabled"));
  uint64_t v6 = [(HFTriggerBuilder *)self triggerActionSets];
  [v6 updateActionSetsInTriggerBuilder:v4];

  v7 = (void *)MEMORY[0x263F58190];
  return (id)[v7 futureWithNoResult];
}

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

+ (id)triggerBuilderForTrigger:(id)a3 inHome:(id)a4 context:(id)a5
{
  return (id)[a1 triggerBuilderForTrigger:a3 inHome:a4 context:a5 assertsFailure:1];
}

+ (id)triggerBuilderForTrigger:(id)a3 inHome:(id)a4 context:(id)a5 assertsFailure:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([v11 conformsToProtocol:&unk_26C15C260]) {
    uint64_t v14 = objc_msgSend(v11, "hf_triggerType");
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __75__HFTriggerBuilder_triggerBuilderForTrigger_inHome_context_assertsFailure___block_invoke;
  v22 = &unk_26409ABD8;
  uint64_t v24 = v14;
  id v15 = v11;
  BOOL v27 = v6;
  id v23 = v15;
  SEL v25 = a2;
  id v26 = a1;
  v16 = (objc_class *)__75__HFTriggerBuilder_triggerBuilderForTrigger_inHome_context_assertsFailure___block_invoke((uint64_t)&v19);
  if (v16 || v6)
  {
    v17 = (void *)[[v16 alloc] initWithExistingObject:v15 inHome:v12 context:v13];
    if (!v17) {
      NSLog(&cfstr_CouldNotCreate_1.isa, v15, v19, v20, v21, v22);
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

id __75__HFTriggerBuilder_triggerBuilderForTrigger_inHome_context_assertsFailure___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1 == 7 || v1 == 1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = objc_opt_class();
  }
  else
  {
    if (*(unsigned char *)(a1 + 64))
    {
      v5 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 48), *(void *)(a1 + 56), @"HFTriggerBuilder.m", 84, @"Unexpected trigger type %d", *(void *)(a1 + 40));
    }
    v3 = 0;
  }
  return v3;
}

- (BOOL)supportsConditions
{
  return 0;
}

- (BOOL)supportsEndEvents
{
  return 0;
}

- (BOOL)supportsHomeKitAutomationBuilders
{
  return 0;
}

- (HFTriggerBuilder)initWithHome:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  BOOL v6 = NSStringFromSelector(sel_initWithHome_context_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFTriggerBuilder.m", 119, @"%s is unavailable; use %@ instead",
    "-[HFTriggerBuilder initWithHome:]",
    v6);

  return 0;
}

- (HFTriggerBuilder)initWithHome:(id)a3 context:(id)a4
{
  id v6 = a4;
  v7 = [(HFTriggerBuilder *)self initWithExistingObject:0 inHome:a3 context:v6];
  v8 = v7;
  if (v7) {
    [(HFTriggerBuilder *)v7 setContext:v6];
  }

  return v8;
}

- (HFTriggerBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithExistingObject_inHome_context_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFTriggerBuilder.m", 132, @"%s is unavailable; use %@ instead",
    "-[HFTriggerBuilder initWithExistingObject:inHome:]",
    v7);

  return 0;
}

- (HFTriggerBuilder)initWithExistingObject:(id)a3 inHome:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v39.receiver = self;
  v39.super_class = (Class)HFTriggerBuilder;
  v10 = [(HFItemBuilder *)&v39 initWithExistingObject:a3 inHome:v8];
  id v11 = v10;
  if (v10)
  {
    [(HFTriggerBuilder *)v10 setContext:v9];
    id v12 = [HFTriggerActionSetsBuilder alloc];
    id v13 = [(HFTriggerBuilder *)v11 trigger];
    uint64_t v14 = [v13 actionSets];
    id v15 = -[HFTriggerActionSetsBuilder initWithActionSets:inHome:filterEmptyActionSets:](v12, "initWithActionSets:inHome:filterEmptyActionSets:", v14, v8, [v9 filtersEmptyActionSets]);
    [(HFTriggerBuilder *)v11 setTriggerActionSets:v15];

    objc_opt_class();
    v16 = [(HFTriggerBuilder *)v11 trigger];
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v18 = v17;

    uint64_t v19 = [v18 predicate];

    if (v19)
    {
      uint64_t v20 = [v18 predicate];
      uint64_t v21 = +[HFConditionCollection conditionCollectionForPredicate:v20];
    }
    else
    {
      v22 = [HFConditionCollection alloc];
      uint64_t v20 = [MEMORY[0x263EFF8C0] array];
      uint64_t v21 = [(HFConditionCollection *)v22 initWithConditions:v20];
    }
    id v23 = (void *)v21;
    [(HFTriggerBuilder *)v11 setConditionCollection:v21];

    uint64_t v24 = [v18 endEvents];
    if (v24)
    {
      SEL v25 = [v18 endEvents];
      id v26 = objc_msgSend(v25, "na_map:", &__block_literal_global_207);
    }
    else
    {
      id v26 = [MEMORY[0x263EFF8C0] array];
    }

    BOOL v27 = [HFMutableSetDiff alloc];
    v28 = [MEMORY[0x263EFFA08] setWithArray:v26];
    v29 = [(HFMutableSetDiff *)v27 initWithFromSet:v28];
    [(HFTriggerBuilder *)v11 setEndEventBuildersDiff:v29];

    v30 = [(HFTriggerBuilder *)v11 trigger];
    v31 = [v30 configuredName];
    if (v31)
    {
      [(HFTriggerBuilder *)v11 setName:v31];
    }
    else
    {
      v32 = [(HFTriggerBuilder *)v11 trigger];
      v33 = [v32 name];
      [(HFTriggerBuilder *)v11 setName:v33];
    }
    v34 = [(HFTriggerBuilder *)v11 trigger];
    v35 = [v34 configuredName];
    [(HFTriggerBuilder *)v11 setNameIsConfigured:v35 != 0];

    v36 = [(HFTriggerBuilder *)v11 trigger];
    if (v36)
    {
      v37 = [(HFTriggerBuilder *)v11 trigger];
      -[HFTriggerBuilder setEnabled:](v11, "setEnabled:", [v37 isEnabled]);
    }
    else
    {
      [(HFTriggerBuilder *)v11 setEnabled:1];
    }
  }
  return v11;
}

id __58__HFTriggerBuilder_initWithExistingObject_inHome_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HFEventBuilder eventBuilderForEvent:a2];
}

- (NSString)displayName
{
  displayName = self->_displayName;
  if (!displayName)
  {
    id v4 = [(HFTriggerBuilder *)self naturalLanguageNameOfType:2];
    v5 = self->_displayName;
    self->_displayName = v4;

    displayName = self->_displayName;
  }
  return displayName;
}

- (void)addEndEventBuilder:(id)a3
{
  id v5 = a3;
  if (![(HFTriggerBuilder *)self supportsEndEvents]) {
    NSLog(&cfstr_AttemptToAddAn.isa, v5, self);
  }
  id v4 = [(HFTriggerBuilder *)self endEventBuildersDiff];
  [v4 addObject:v5];
}

- (void)updateEndEventBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTriggerBuilder *)self endEventBuildersDiff];
  [v5 updateObject:v4];
}

- (void)removeEndEventBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTriggerBuilder *)self endEventBuildersDiff];
  [v5 deleteObject:v4];
}

- (void)removeAllEndEventBuilders
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(HFTriggerBuilder *)self endEventBuilders];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(HFTriggerBuilder *)self removeEndEventBuilder:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeServiceLikeItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 services];
  uint64_t v6 = objc_msgSend(v5, "na_flatMap:", &__block_literal_global_80_1);

  objc_opt_class();
  uint64_t v7 = [v4 homeKitObject];
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    long long v10 = [v9 services];
    long long v11 = objc_msgSend(v10, "na_flatMap:", &__block_literal_global_84_1);
    uint64_t v12 = [v6 setByAddingObjectsFromArray:v11];

    uint64_t v6 = (void *)v12;
  }
  objc_opt_class();
  id v13 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;

  v16 = [v15 mediaProfileContainer];

  v17 = [(HFTriggerBuilder *)self triggerActionSets];
  id v18 = [v17 anonymousActionSetBuilder];

  uint64_t v19 = [v18 actionBuilders];
  uint64_t v20 = [v19 toSet];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __42__HFTriggerBuilder_removeServiceLikeItem___block_invoke_3;
  v28[3] = &unk_26409AC00;
  id v29 = v6;
  id v30 = v16;
  id v21 = v18;
  id v31 = v21;
  id v22 = v6;
  id v23 = v16;
  uint64_t v24 = objc_msgSend(v20, "na_map:", v28);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __42__HFTriggerBuilder_removeServiceLikeItem___block_invoke_4;
  v26[3] = &unk_264090B88;
  id v27 = v21;
  id v25 = v21;
  objc_msgSend(v24, "na_each:", v26);
}

id __42__HFTriggerBuilder_removeServiceLikeItem___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [a2 characteristics];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

uint64_t __42__HFTriggerBuilder_removeServiceLikeItem___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 characteristics];
}

id __42__HFTriggerBuilder_removeServiceLikeItem___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6
    && (uint64_t v7 = *(void **)(a1 + 32),
        [v6 characteristic],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v7) = [v7 containsObject:v8],
        v8,
        v7))
  {
    id v9 = v4;
  }
  else
  {
    objc_opt_class();
    id v10 = v4;
    if (objc_opt_isKindOfClass()) {
      long long v11 = v10;
    }
    else {
      long long v11 = 0;
    }
    id v12 = v11;

    id v13 = [v12 mediaProfiles];
    uint64_t v14 = objc_msgSend(MEMORY[0x263EFFA08], "na_setWithSafeObject:", *(void *)(a1 + 40));
    id v15 = objc_msgSend(v13, "na_setByRemovingObjectsFromSet:", v14);

    if ([v15 count])
    {
      [v12 setMediaProfiles:v15];
      [*(id *)(a1 + 48) updateAction:v12];
      id v9 = 0;
    }
    else
    {
      id v9 = v12;
    }
  }
  return v9;
}

void __42__HFTriggerBuilder_removeServiceLikeItem___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 actionBuilders];
  [v4 deleteObject:v3];
}

- (void)setEndEvent:(id)a3
{
  id v4 = a3;
  [(HFTriggerBuilder *)self removeAllEndEventBuilders];
  [(HFTriggerBuilder *)self addEndEventBuilder:v4];
}

- (NSArray)endEventBuilders
{
  v2 = [(HFTriggerBuilder *)self endEventBuildersDiff];
  id v3 = [v2 toSet];
  id v4 = [v3 allObjects];

  return (NSArray *)v4;
}

- (BOOL)requiresConfirmationToRun
{
  return 0;
}

- (BOOL)secureActionsRequireConfirmationToRun
{
  return 0;
}

- (BOOL)requiresLocationServicesAuthorization
{
  return 0;
}

- (BOOL)requiresHomeHub
{
  objc_opt_class();
  id v3 = [(HFTriggerBuilder *)self trigger];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 triggerActivationState];
  return v6 == 1;
}

- (BOOL)requiresUpdatedHomeHub
{
  objc_opt_class();
  id v3 = [(HFTriggerBuilder *)self trigger];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 triggerActivationState];
  return v6 == 2;
}

- (BOOL)requiresFMFDeviceToRun
{
  return 0;
}

- (BOOL)areActionsAffectedByEndEvents
{
  v2 = [(HFTriggerBuilder *)self triggerActionSets];
  char v3 = [v2 areActionsAffectedByEndEvents];

  return v3;
}

- (HFDurationEventBuilder)designatedDurationEventBuilder
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v2 = [(HFTriggerBuilder *)self endEventBuilders];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          [v9 duration];
          if (v10 > 1.0)
          {
            if (!v5 || ([v5 duration], double v12 = v11, objc_msgSend(v9, "duration"), v12 > v13))
            {
              id v14 = v9;

              id v5 = v14;
            }
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return (HFDurationEventBuilder *)v5;
}

- (BOOL)isShortcutOwned
{
  uint64_t v3 = [(HFTriggerBuilder *)self triggerActionSets];
  char v4 = [v3 isShortcutOwned];

  if (v4) {
    return 1;
  }
  uint64_t v6 = [(HFTriggerBuilder *)self trigger];

  if (!v6) {
    return 0;
  }
  uint64_t v7 = [(HFTriggerBuilder *)self trigger];
  char v8 = objc_msgSend(v7, "hf_isShortcutOwned");

  return v8;
}

- (id)deleteTrigger
{
  uint64_t v3 = [(HFTriggerBuilder *)self trigger];
  char v4 = [(HFItemBuilder *)self home];
  id v5 = [(HFTriggerBuilder *)self _deleteTrigger:v3 fromHome:v4];

  return v5;
}

- (id)validationError
{
  v21[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HFItemBuilder *)self verifyPropertyIsSet:@"name"];
  if (!v3)
  {
    char v4 = [(HFTriggerBuilder *)self name];
    uint64_t v3 = [(HFItemBuilder *)self verifyNameIsNotEmpty:v4];

    if (!v3)
    {
      id v5 = [(HFTriggerBuilder *)self triggerActionSets];
      uint64_t v6 = [v5 anonymousActionSetBuilder];
      uint64_t v7 = [v6 actions];
      uint64_t v8 = [v7 count];

      id v9 = [(HFTriggerBuilder *)self triggerActionSets];
      double v10 = [v9 namedActionSetsDiff];
      double v11 = [v10 toSet];
      uint64_t v12 = v8 | [v11 count];

      if (v12)
      {
        id v14 = [(HFTriggerBuilder *)self triggerActionSets];
        id v15 = [v14 anonymousActionSetBuilder];
        long long v16 = [v15 actions];
        long long v17 = objc_msgSend(v16, "na_map:", &__block_literal_global_101_0);
        uint64_t v3 = [v17 firstObject];

        if (v3) {
          id v18 = v3;
        }
      }
      else
      {
        uint64_t v20 = @"HFItemBuilderFailureReason";
        v21[0] = @"Triggers must have at least one action or action set";
        double v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
        uint64_t v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F58160] code:2 userInfo:v13];
      }
    }
  }
  return v3;
}

uint64_t __35__HFTriggerBuilder_validationError__block_invoke(uint64_t a1, void *a2)
{
  return [a2 validationError];
}

- (id)_lazy_performValidation
{
  v12[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HFItemBuilder *)self lazy_verifyPropertyIsSet:@"name"];
  char v4 = (void *)MEMORY[0x263F58190];
  v12[0] = v3;
  id v5 = [(HFTriggerBuilder *)self name];
  uint64_t v6 = [(HFItemBuilder *)self lazy_verifyNameIsNotEmpty:v5];
  v12[1] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  uint64_t v8 = [v4 chainFutures:v7];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__HFTriggerBuilder__lazy_performValidation__block_invoke;
  v11[3] = &unk_26408CDF0;
  v11[4] = self;
  id v9 = (id)[v8 addFailureBlock:v11];

  return v8;
}

void __43__HFTriggerBuilder__lazy_performValidation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Error validating trigger builder: %@. Error: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)_commitUsingBuilders
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(HFTriggerBuilder *)self validationError];
  if (v3)
  {
    char v4 = [(HFTriggerBuilder *)self trigger];
    uint64_t v5 = HFOperationEditTrigger;
    if (!v4) {
      uint64_t v5 = HFOperationAddTrigger;
    }
    int v6 = *v5;

    uint64_t v7 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = self;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_error_impl(&dword_20B986000, v7, OS_LOG_TYPE_ERROR, "Error validating trigger builder: %@. Error: %@", buf, 0x16u);
    }

    __int16 v8 = (void *)MEMORY[0x263F58190];
    id v9 = [(HFTriggerBuilder *)self displayName];
    uint64_t v10 = objc_msgSend(v3, "hf_errorWithOperationType:failedItemName:", v6, v9);
    double v11 = [v8 futureWithError:v10];
  }
  else
  {
    int v6 = [(HFItemBuilder *)self home];
    uint64_t v12 = [(HFTriggerBuilder *)self getOrCreateTriggerBuilder];
    if (v12)
    {
      double v13 = v12;
      id v14 = [v12 builder];
      id v15 = [(HFTriggerBuilder *)self updateTriggerBuilder:v14];

      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __40__HFTriggerBuilder__commitUsingBuilders__block_invoke;
      v17[3] = &unk_2640945A0;
      id v9 = v13;
      id v18 = v9;
      int v6 = v6;
      long long v19 = v6;
      double v11 = [v15 flatMap:v17];
    }
    else
    {
      double v11 = [(HFTriggerBuilder *)self _legacyCommitItem];
      id v9 = 0;
    }
  }

  return v11;
}

uint64_t __40__HFTriggerBuilder__commitUsingBuilders__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) commitBuilderInHome:*(void *)(a1 + 40)];
}

- (id)_legacyCommitItem
{
  v36[7] = *MEMORY[0x263EF8340];
  id v3 = [(HFTriggerBuilder *)self trigger];
  char v4 = HFOperationEditTrigger;
  if (!v3) {
    char v4 = HFOperationAddTrigger;
  }
  uint64_t v24 = *v4;

  uint64_t v5 = [(HFTriggerBuilder *)self trigger];
  BOOL v6 = v5 == 0;

  uint64_t v7 = [(HFTriggerBuilder *)self _lazy_performValidation];
  __int16 v8 = v7;
  if (v6)
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __37__HFTriggerBuilder__legacyCommitItem__block_invoke;
    v35[3] = &unk_26408CDC8;
    v35[4] = self;
    uint64_t v10 = objc_msgSend(v7, "flatMap:", v35, v24);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __37__HFTriggerBuilder__legacyCommitItem__block_invoke_2;
    v34[3] = &unk_26409AC28;
    v34[4] = self;
    id v9 = [v10 flatMap:v34];
  }
  else
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __37__HFTriggerBuilder__legacyCommitItem__block_invoke_3;
    v33[3] = &unk_26408CDC8;
    v33[4] = self;
    id v9 = objc_msgSend(v7, "flatMap:", v33, v24);
  }
  double v11 = (void *)MEMORY[0x263F58190];
  v36[0] = v9;
  uint64_t v12 = [(HFTriggerBuilder *)self _updateAnonymousActionSet];
  v36[1] = v12;
  double v13 = [(HFTriggerBuilder *)self _updateActionSets];
  v36[2] = v13;
  id v14 = [(HFTriggerBuilder *)self _updateConditions];
  v36[3] = v14;
  id v15 = [(HFTriggerBuilder *)self _updateEndEvents];
  v36[4] = v15;
  long long v16 = [(HFTriggerBuilder *)self _updateEnabledState];
  v36[5] = v16;
  long long v17 = [(HFTriggerBuilder *)self lazilyFinishCommitingTrigger];
  v36[6] = v17;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:7];
  long long v19 = [v11 chainFutures:v18];

  objc_initWeak(&location, self);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __37__HFTriggerBuilder__legacyCommitItem__block_invoke_4;
  v30[3] = &unk_26408DDB8;
  objc_copyWeak(&v31, &location);
  uint64_t v20 = [v19 flatMap:v30];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __37__HFTriggerBuilder__legacyCommitItem__block_invoke_5;
  v26[3] = &unk_26409AC50;
  id v21 = v25;
  id v27 = v21;
  v28 = self;
  objc_copyWeak(&v29, &location);
  __int16 v22 = [v20 recover:v26];
  objc_destroyWeak(&v29);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

  return v22;
}

uint64_t __37__HFTriggerBuilder__legacyCommitItem__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) commitCreateTrigger];
}

id __37__HFTriggerBuilder__legacyCommitItem__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) nameIsConfigured] & 1) == 0) {
    [v3 setValue:0 forKey:@"configuredName"];
  }
  char v4 = [*(id *)(a1 + 32) _commitAddTriggerToHome:v3];

  return v4;
}

id __37__HFTriggerBuilder__legacyCommitItem__block_invoke_3(uint64_t a1)
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F58190];
  id v3 = [*(id *)(a1 + 32) commitEditTrigger];
  v8[0] = v3;
  char v4 = [*(id *)(a1 + 32) _updateName];
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  BOOL v6 = [v2 chainFutures:v5];

  return v6;
}

id __37__HFTriggerBuilder__legacyCommitItem__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained trigger];
  [WeakRetained _notifyObserversOfChangingTrigger:v5];

  BOOL v6 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v6;
}

id __37__HFTriggerBuilder__legacyCommitItem__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [MEMORY[0x263F58190] futureWithNoResult];
  uint64_t v5 = *(__CFString **)(a1 + 32);
  if (v5 == @"HFOperationAddTrigger")
  {
    BOOL v6 = [*(id *)(a1 + 40) deleteTrigger];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    void v21[2] = __37__HFTriggerBuilder__legacyCommitItem__block_invoke_6;
    v21[3] = &unk_264095D90;
    objc_copyWeak(&v22, (id *)(a1 + 48));
    uint64_t v7 = [v6 addCompletionBlock:v21];

    objc_destroyWeak(&v22);
    uint64_t v5 = *(__CFString **)(a1 + 32);
    char v4 = (void *)v7;
  }
  __int16 v8 = (void *)MEMORY[0x263F58190];
  id v9 = [*(id *)(a1 + 40) displayName];
  uint64_t v10 = objc_msgSend(v3, "hf_errorWithOperationType:failedItemName:", v5, v9);
  double v11 = [v8 futureWithError:v10];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __37__HFTriggerBuilder__legacyCommitItem__block_invoke_7;
  v19[3] = &unk_26408CDC8;
  id v12 = v11;
  id v20 = v12;
  double v13 = [v4 flatMap:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __37__HFTriggerBuilder__legacyCommitItem__block_invoke_8;
  v17[3] = &unk_26408F1C0;
  id v18 = v12;
  id v14 = v12;
  id v15 = [v13 recover:v17];

  return v15;
}

void __37__HFTriggerBuilder__legacyCommitItem__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setTrigger:0];
  uint64_t v1 = [WeakRetained triggerActionSets];
  v2 = [v1 anonymousActionSetBuilder];
  [v2 setActionSet:0];
}

id __37__HFTriggerBuilder__legacyCommitItem__block_invoke_7(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __37__HFTriggerBuilder__legacyCommitItem__block_invoke_8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)commitItem
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = HFLogForCategory(0x32uLL);
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  uint64_t v5 = NSString;
  BOOL v6 = [(HFTriggerBuilder *)self trigger];
  if (v6) {
    uint64_t v7 = @"Committing";
  }
  else {
    uint64_t v7 = @"Creating";
  }
  __int16 v8 = [(HFTriggerBuilder *)self name];
  id v9 = [(HFTriggerBuilder *)self trigger];
  if (v9)
  {
    uint64_t v10 = NSString;
    double v11 = [(HFTriggerBuilder *)self trigger];
    id v12 = [v11 uniqueIdentifier];
    double v13 = [v10 stringWithFormat:@" (%@)", v12];
    id v14 = [v5 stringWithFormat:@"%@ trigger with name: %@%@", v7, v8, v13];
  }
  else
  {
    id v14 = [v5 stringWithFormat:@"%@ trigger with name: %@%@", v7, v8, &stru_26C081158];
  }

  id v15 = HFLogForCategory(0x32uLL);
  long long v16 = v15;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_20B986000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v4, "HFTriggerBuilderCommit", "%@", buf, 0xCu);
  }

  long long v17 = [(HFItemBuilder *)self home];
  if ([v17 areAutomationBuildersSupported])
  {
    BOOL v18 = [(HFTriggerBuilder(AutomationBuilders) *)self supportsHomeKitAutomationBuilders];

    if (v18)
    {
      uint64_t v19 = [(HFTriggerBuilder *)self _commitUsingBuilders];
      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v19 = [(HFTriggerBuilder *)self _legacyCommitItem];
LABEL_15:
  id v20 = (void *)v19;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __30__HFTriggerBuilder_commitItem__block_invoke;
  v24[3] = &unk_2640914E8;
  id v25 = v14;
  os_signpost_id_t v26 = v4;
  v24[4] = self;
  id v21 = v14;
  id v22 = (id)[v20 addCompletionBlock:v24];

  return v20;
}

void __30__HFTriggerBuilder_commitItem__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = HFLogForCategory(0x44uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = [*(id *)(a1 + 32) name];
      id v9 = [*(id *)(a1 + 32) trigger];
      uint64_t v10 = [v9 uniqueIdentifier];
      double v11 = (void *)v10;
      id v12 = @"no-id";
      *(_DWORD *)buf = 138412802;
      id v25 = v6;
      if (v10) {
        id v12 = (__CFString *)v10;
      }
      __int16 v26 = 2112;
      id v27 = v8;
      __int16 v28 = 2112;
      uint64_t v29 = v12;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Error %@ while committing \"%@\" (%@)", buf, 0x20u);
    }
  }
  double v13 = HFLogForCategory(0x44uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [*(id *)(a1 + 32) name];
    id v15 = [*(id *)(a1 + 32) trigger];
    uint64_t v16 = [v15 uniqueIdentifier];
    long long v17 = (void *)v16;
    BOOL v18 = @"no-id";
    if (v16) {
      BOOL v18 = (__CFString *)v16;
    }
    *(_DWORD *)buf = 138412546;
    id v25 = v14;
    __int16 v26 = 2112;
    id v27 = v18;
    _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "Finished commiting trigger \"%@\" (%@)", buf, 0x16u);
  }
  uint64_t v19 = HFLogForCategory(0x32uLL);
  id v20 = v19;
  os_signpost_id_t v21 = *(void *)(a1 + 48);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    id v22 = *(void **)(a1 + 40);
    if (v6)
    {
      id v23 = [NSString stringWithFormat:@" error: %@", v6];
    }
    else
    {
      id v23 = &stru_26C081158;
    }
    *(_DWORD *)buf = 138412546;
    id v25 = v22;
    __int16 v26 = 2112;
    id v27 = v23;
    _os_signpost_emit_with_name_impl(&dword_20B986000, v20, OS_SIGNPOST_INTERVAL_END, v21, "HFTriggerBuilderCommit", "%@%@", buf, 0x16u);
    if (v6) {
  }
    }
}

- (id)_updateEnabledState
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__HFTriggerBuilder__updateEnabledState__block_invoke;
  v4[3] = &unk_26408E4E0;
  v4[4] = self;
  v2 = [MEMORY[0x263F58190] lazyFutureWithBlock:v4];
  return v2;
}

void __39__HFTriggerBuilder__updateEnabledState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39__HFTriggerBuilder__updateEnabledState__block_invoke_2;
  v11[3] = &unk_26408CD50;
  v11[4] = *(void *)(a1 + 32);
  os_signpost_id_t v4 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v11];
  id v5 = [MEMORY[0x263F581B8] mainThreadScheduler];
  id v6 = [v4 reschedule:v5];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__HFTriggerBuilder__updateEnabledState__block_invoke_3;
  v9[3] = &unk_26408F238;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v7 = v3;
  id v8 = (id)[v6 addCompletionBlock:v9];
}

void __39__HFTriggerBuilder__updateEnabledState__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 trigger];
  objc_msgSend(v5, "enable:completionHandler:", objc_msgSend(*(id *)(a1 + 32), "enabled"), v4);
}

void __39__HFTriggerBuilder__updateEnabledState__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  id v7 = HFLogForCategory(0x29uLL);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = [*(id *)(a1 + 32) name];
      int v10 = [*(id *)(a1 + 32) enabled];
      int v12 = 138412802;
      double v13 = v9;
      __int16 v14 = 1024;
      int v15 = v10;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Failed to update enabled state for trigger with name:%@ enabled:%d Error: %@", (uint8_t *)&v12, 0x1Cu);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 32) name];
    int v11 = [*(id *)(a1 + 32) enabled];
    int v12 = 138412546;
    double v13 = v9;
    __int16 v14 = 1024;
    int v15 = v11;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Update enabled state for trigger with name:%@ enabled:%d", (uint8_t *)&v12, 0x12u);
    goto LABEL_6;
  }

  [*(id *)(a1 + 40) finishWithResult:v6 error:v5];
}

- (id)_updateAnonymousActionSet
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__HFTriggerBuilder__updateAnonymousActionSet__block_invoke;
  v4[3] = &unk_26408E4E0;
  v4[4] = self;
  v2 = [MEMORY[0x263F58190] lazyFutureWithBlock:v4];
  return v2;
}

void __45__HFTriggerBuilder__updateAnonymousActionSet__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) trigger];
  id v5 = [*(id *)(a1 + 32) triggerActionSets];
  id v6 = [v5 anonymousActionSetBuilder];
  [v6 setContainingTrigger:v4];

  id v7 = [*(id *)(a1 + 32) triggerActionSets];
  id v8 = [v7 anonymousActionSetBuilder];
  id v9 = [v8 commitItem];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __45__HFTriggerBuilder__updateAnonymousActionSet__block_invoke_2;
  void v12[3] = &unk_26408F238;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v3;
  id v10 = v3;
  id v11 = (id)[v9 addCompletionBlock:v12];
}

void __45__HFTriggerBuilder__updateAnonymousActionSet__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  id v7 = HFLogForCategory(0x29uLL);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = [*(id *)(a1 + 32) name];
      int v10 = 138412546;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Failed to update anonymous action set for trigger with name:%@ Error: %@", (uint8_t *)&v10, 0x16u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 32) name];
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Updated anonymous action set for trigger with name:%@", (uint8_t *)&v10, 0xCu);
    goto LABEL_6;
  }

  [*(id *)(a1 + 40) finishWithResult:v6 error:v5];
}

- (id)_updateActionSets
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke;
  v4[3] = &unk_26408E4E0;
  v4[4] = self;
  v2 = [MEMORY[0x263F58190] lazyFutureWithBlock:v4];
  return v2;
}

void __37__HFTriggerBuilder__updateActionSets__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 triggerActionSets];
  id v6 = [v5 namedActionSetsDiff];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_2;
  v13[3] = &unk_26409AC78;
  uint64_t v14 = *(void *)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_139;
  void v12[3] = &unk_26409AC78;
  v12[4] = v14;
  id v7 = [v4 commitItemBuilderSetDiff:v6 addBlock:v13 deleteBlock:v12];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_143;
  v10[3] = &unk_26408F238;
  v10[4] = *(void *)(a1 + 32);
  id v11 = v3;
  id v8 = v3;
  id v9 = (id)[v7 addCompletionBlock:v10];
}

id __37__HFTriggerBuilder__updateActionSets__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F58190];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_3;
  v20[3] = &unk_26408E218;
  v20[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v21 = v5;
  id v6 = [v4 futureWithErrorOnlyHandlerAdapterBlock:v20];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_4;
  v17[3] = &unk_2640911C8;
  id v7 = v5;
  uint64_t v8 = *(void *)(a1 + 32);
  id v18 = v7;
  uint64_t v19 = v8;
  id v9 = (id)[v6 addSuccessBlock:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_137;
  v14[3] = &unk_26408C8C8;
  uint64_t v10 = *(void *)(a1 + 32);
  id v15 = v7;
  uint64_t v16 = v10;
  id v11 = v7;
  id v12 = (id)[v6 addFailureBlock:v14];

  return v6;
}

void __37__HFTriggerBuilder__updateActionSets__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 trigger];
  id v5 = [*(id *)(a1 + 40) actionSet];
  [v6 addActionSet:v5 completionHandler:v4];
}

void __37__HFTriggerBuilder__updateActionSets__block_invoke_4(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) actionSet];
    id v4 = [*(id *)(a1 + 40) name];
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Added action set: %@ to trigger with name:%@", (uint8_t *)&v5, 0x16u);
  }
}

void __37__HFTriggerBuilder__updateActionSets__block_invoke_137(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = [*(id *)(a1 + 32) actionSet];
    id v6 = [*(id *)(a1 + 40) name];
    int v7 = 138412802;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to add action set: %@ to trigger with name:%@. Error: %@", (uint8_t *)&v7, 0x20u);
  }
}

id __37__HFTriggerBuilder__updateActionSets__block_invoke_139(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 actionSet];
  if (!v4) {
    goto LABEL_4;
  }
  int v5 = (void *)v4;
  id v6 = [*(id *)(a1 + 32) home];
  int v7 = [v6 actionSets];
  uint64_t v8 = [v3 actionSet];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x263F58190];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_2_140;
    v26[3] = &unk_26408E218;
    void v26[4] = *(void *)(a1 + 32);
    id v11 = v3;
    id v27 = v11;
    id v12 = [v10 futureWithErrorOnlyHandlerAdapterBlock:v26];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_3_141;
    v23[3] = &unk_2640911C8;
    id v13 = v11;
    uint64_t v14 = *(void *)(a1 + 32);
    id v24 = v13;
    uint64_t v25 = v14;
    id v15 = (id)[v12 addSuccessBlock:v23];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_142;
    v20[3] = &unk_26408C8C8;
    id v16 = v13;
    uint64_t v17 = *(void *)(a1 + 32);
    id v21 = v16;
    uint64_t v22 = v17;
    id v18 = (id)[v12 addFailureBlock:v20];
  }
  else
  {
LABEL_4:
    id v12 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v12;
}

void __37__HFTriggerBuilder__updateActionSets__block_invoke_2_140(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 trigger];
  int v5 = [*(id *)(a1 + 40) actionSet];
  [v6 removeActionSet:v5 completionHandler:v4];
}

void __37__HFTriggerBuilder__updateActionSets__block_invoke_3_141(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) actionSet];
    id v4 = [*(id *)(a1 + 40) name];
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Removed action set: %@ to trigger with name:%@", (uint8_t *)&v5, 0x16u);
  }
}

void __37__HFTriggerBuilder__updateActionSets__block_invoke_142(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = [*(id *)(a1 + 32) actionSet];
    id v6 = [*(id *)(a1 + 40) name];
    int v7 = 138412802;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to remove set: %@ from trigger with name:%@. Error: %@", (uint8_t *)&v7, 0x20u);
  }
}

void __37__HFTriggerBuilder__updateActionSets__block_invoke_143(uint64_t a1, void *a2, void *a3)
{
  int v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = a2;
  int v7 = [v5 triggerActionSets];
  [v7 resetActionSetBuilders];

  [*(id *)(a1 + 40) finishWithResult:v8 error:v6];
}

- (id)_updateName
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x263F58190];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__HFTriggerBuilder__updateName__block_invoke;
  v5[3] = &unk_26408F0F0;
  objc_copyWeak(&v6, &location);
  id v3 = [v2 lazyFutureWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __31__HFTriggerBuilder__updateName__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F58190];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __31__HFTriggerBuilder__updateName__block_invoke_2;
  v14[3] = &unk_26409ACA0;
  objc_copyWeak(&v15, (id *)(a1 + 32));
  int v5 = [v4 futureWithErrorOnlyHandlerAdapterBlock:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __31__HFTriggerBuilder__updateName__block_invoke_3;
  void v12[3] = &unk_264098F70;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  id v6 = (id)[v5 addSuccessBlock:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __31__HFTriggerBuilder__updateName__block_invoke_144;
  v10[3] = &unk_26408D940;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  id v7 = (id)[v5 addFailureBlock:v10];
  id v8 = [v3 completionHandlerAdapter];
  id v9 = (id)[v5 addCompletionBlock:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v15);
}

void __31__HFTriggerBuilder__updateName__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained trigger];
  int v5 = [WeakRetained name];
  if ([WeakRetained nameIsConfigured])
  {
    id v6 = [WeakRetained name];
    [v4 updateName:v5 configuredName:v6 completionHandler:v7];
  }
  else
  {
    [v4 updateName:v5 configuredName:0 completionHandler:v7];
  }
}

void __31__HFTriggerBuilder__updateName__block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [WeakRetained name];
    int v4 = 138412546;
    int v5 = v3;
    __int16 v6 = 1024;
    int v7 = [WeakRetained nameIsConfigured];
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Updated trigger name:%@ configured:%{BOOL}d", (uint8_t *)&v4, 0x12u);
  }
}

void __31__HFTriggerBuilder__updateName__block_invoke_144(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __int16 v6 = [WeakRetained name];
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = [WeakRetained nameIsConfigured];
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Failed to update trigger name:%@ configured:%{BOOL}d. Error: %@", (uint8_t *)&v7, 0x1Cu);
  }
}

- (id)_updateConditions
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__HFTriggerBuilder__updateConditions__block_invoke;
  v4[3] = &unk_26408E4E0;
  v4[4] = self;
  v2 = [MEMORY[0x263F58190] lazyFutureWithBlock:v4];
  return v2;
}

void __37__HFTriggerBuilder__updateConditions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) trigger];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [*(id *)(a1 + 32) supportsConditions];

    if (v5)
    {
      __int16 v6 = [*(id *)(a1 + 32) conditionCollection];
      int v7 = [v6 predicate];

      uint64_t v8 = (void *)MEMORY[0x263F58190];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      void v21[2] = __37__HFTriggerBuilder__updateConditions__block_invoke_2;
      v21[3] = &unk_26408E218;
      void v21[4] = *(void *)(a1 + 32);
      id v9 = v7;
      id v22 = v9;
      int v10 = [v8 futureWithErrorOnlyHandlerAdapterBlock:v21];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __37__HFTriggerBuilder__updateConditions__block_invoke_3;
      v18[3] = &unk_26408D260;
      v18[4] = *(void *)(a1 + 32);
      id v19 = v9;
      id v20 = v3;
      id v11 = v9;
      id v12 = (id)[v10 addCompletionBlock:v18];

      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v13 = [*(id *)(a1 + 32) conditionCollection];
  uint64_t v14 = [v13 conditions];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    id v16 = [*(id *)(a1 + 32) conditionCollection];
    uint64_t v17 = [v16 conditions];
    NSLog(&cfstr_ConditionsAreC.isa, v17, *(void *)(a1 + 32));
  }
  [v3 finishWithNoResult];
LABEL_8:
}

void __37__HFTriggerBuilder__updateConditions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 trigger];
  [v5 updatePredicate:*(void *)(a1 + 40) completionHandler:v4];
}

void __37__HFTriggerBuilder__updateConditions__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  int v7 = HFLogForCategory(0x29uLL);
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = [*(id *)(a1 + 32) name];
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 138412802;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Failed to update predicate for trigger: %@. Predicate: %@. Error: %@", (uint8_t *)&v12, 0x20u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 32) name];
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 138412546;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Updated predicate for trigger: %@. Predicate: %@", (uint8_t *)&v12, 0x16u);
    goto LABEL_6;
  }

  [*(id *)(a1 + 48) finishWithResult:v6 error:v5];
}

- (id)_updateEndEvents
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__HFTriggerBuilder__updateEndEvents__block_invoke;
  v4[3] = &unk_26408E4E0;
  v4[4] = self;
  v2 = [MEMORY[0x263F58190] lazyFutureWithBlock:v4];
  return v2;
}

void __36__HFTriggerBuilder__updateEndEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) supportsEndEvents]
    && ([*(id *)(a1 + 32) trigger],
        id v4 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    id v6 = [*(id *)(a1 + 32) trigger];
    int v7 = [*(id *)(a1 + 32) endEventBuilders];
    uint64_t v8 = objc_msgSend(v7, "na_flatMap:", &__block_literal_global_153_2);

    id v9 = [v6 endEvents];
    int v10 = [v8 isEqualToArray:v9];

    if (v10)
    {
      [v3 finishWithNoResult];
    }
    else
    {
      __int16 v14 = (void *)MEMORY[0x263F58190];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __36__HFTriggerBuilder__updateEndEvents__block_invoke_3;
      v19[3] = &unk_26408E218;
      id v20 = v6;
      id v21 = v8;
      uint64_t v15 = [v14 futureWithErrorOnlyHandlerAdapterBlock:v19];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __36__HFTriggerBuilder__updateEndEvents__block_invoke_4;
      v17[3] = &unk_26408F238;
      void v17[4] = *(void *)(a1 + 32);
      id v18 = v3;
      id v16 = (id)[v15 addCompletionBlock:v17];
    }
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 32) endEventBuilders];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      uint64_t v13 = [*(id *)(a1 + 32) endEventBuilders];
      NSLog(&cfstr_EndEventsAreCu.isa, v13, *(void *)(a1 + 32));
    }
    [v3 finishWithNoResult];
  }
}

id __36__HFTriggerBuilder__updateEndEvents__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 buildNewEventsFromCurrentState];
  id v3 = [v2 allObjects];

  return v3;
}

uint64_t __36__HFTriggerBuilder__updateEndEvents__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateEndEvents:*(void *)(a1 + 40) completionHandler:a2];
}

void __36__HFTriggerBuilder__updateEndEvents__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  int v7 = HFLogForCategory(0x29uLL);
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = [*(id *)(a1 + 32) name];
      int v10 = [*(id *)(a1 + 32) endEventBuilders];
      int v15 = 138412802;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v10;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Failed to update end events for trigger: %@. Events: %@. Error: %@", (uint8_t *)&v15, 0x20u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 32) name];
    int v10 = [*(id *)(a1 + 32) endEventBuilders];
    int v15 = 138412546;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Updated predicate for trigger: %@. Events: %@", (uint8_t *)&v15, 0x16u);
    goto LABEL_6;
  }

  uint64_t v11 = [HFMutableSetDiff alloc];
  uint64_t v12 = [*(id *)(a1 + 32) endEventBuildersDiff];
  uint64_t v13 = [v12 toSet];
  __int16 v14 = [(HFMutableSetDiff *)v11 initWithFromSet:v13];
  [*(id *)(a1 + 32) setEndEventBuildersDiff:v14];

  [*(id *)(a1 + 40) finishWithResult:v6 error:v5];
}

- (id)lazilyFinishCommitingTrigger
{
  return (id)[MEMORY[0x263F58190] futureWithNoResult];
}

- (id)commitCreateTrigger
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFTriggerBuilder.m", 677, @"%s is an abstract method that must be overriden by subclass %@", "-[HFTriggerBuilder commitCreateTrigger]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)commitEditTrigger
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFTriggerBuilder.m", 683, @"%s is an abstract method that must be overriden by subclass %@", "-[HFTriggerBuilder commitEditTrigger]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)naturalLanguageNameOfType:(unint64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HFTriggerBuilder.m", 689, @"%s is an abstract method that must be overriden by subclass %@", "-[HFTriggerBuilder naturalLanguageNameOfType:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  uint64_t v4 = [a3 nameType];
  return [(HFTriggerBuilder *)self naturalLanguageNameOfType:v4];
}

- (id)naturalLanguageDetailsWithOptions:(id)a3
{
  return 0;
}

- (id)replaceCurrentTriggerWithTrigger:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HFTriggerBuilder *)self trigger];
  id v6 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = objc_msgSend(v5, "hf_prettyDescription");
    uint64_t v8 = objc_msgSend(v4, "hf_prettyDescription");
    id v9 = [(HFItemBuilder *)self home];
    *(_DWORD *)buf = 138412802;
    id v24 = v7;
    __int16 v25 = 2112;
    __int16 v26 = v8;
    __int16 v27 = 2112;
    __int16 v28 = v9;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Swapping current trigger:%@ for new trigger:%@ in home:%@", buf, 0x20u);
  }
  int v10 = [v4 name];
  uint64_t v11 = [(HFTriggerBuilder *)self _uniquelyRenameTrigger:v5 pendingReplaceByNewTriggerWithName:v10];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  void v21[2] = __53__HFTriggerBuilder_replaceCurrentTriggerWithTrigger___block_invoke;
  v21[3] = &unk_2640945A0;
  void v21[4] = self;
  id v22 = v4;
  id v12 = v4;
  uint64_t v13 = [v11 flatMap:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __53__HFTriggerBuilder_replaceCurrentTriggerWithTrigger___block_invoke_2;
  v19[3] = &unk_2640945A0;
  void v19[4] = self;
  id v20 = v5;
  id v14 = v5;
  int v15 = [v13 flatMap:v19];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __53__HFTriggerBuilder_replaceCurrentTriggerWithTrigger___block_invoke_3;
  v18[3] = &unk_26408C8A0;
  v18[4] = self;
  id v16 = [v15 addSuccessBlock:v18];

  return v16;
}

uint64_t __53__HFTriggerBuilder_replaceCurrentTriggerWithTrigger___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commitAddTriggerToHome:*(void *)(a1 + 40)];
}

id __53__HFTriggerBuilder_replaceCurrentTriggerWithTrigger___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [v1 home];
  id v4 = [v1 _deleteTrigger:v2 fromHome:v3];

  return v4;
}

uint64_t __53__HFTriggerBuilder_replaceCurrentTriggerWithTrigger___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReplaceBackingTrigger];
}

- (HFTriggerBuilder)triggerBuilderWithContext:(id)a3
{
  return self;
}

- (void)replaceConditionsWithConditions:(id)a3
{
}

- (void)_notifyObserversOfAddingTrigger:(id)a3
{
  id v4 = a3;
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__HFTriggerBuilder__notifyObserversOfAddingTrigger___block_invoke;
  v7[3] = &unk_26408D8F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 dispatchHomeObserverMessage:v7 sender:0];
}

void __52__HFTriggerBuilder__notifyObserversOfAddingTrigger___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didAddTrigger:*(void *)(a1 + 40)];
  }
}

- (void)_notifyObserversOfChangingTrigger:(id)a3
{
  id v4 = a3;
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__HFTriggerBuilder__notifyObserversOfChangingTrigger___block_invoke;
  v7[3] = &unk_26408D8F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 dispatchHomeObserverMessage:v7 sender:0];
}

void __54__HFTriggerBuilder__notifyObserversOfChangingTrigger___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didUpdateTrigger:*(void *)(a1 + 40)];
  }
}

- (void)_didReplaceBackingTrigger
{
  id v3 = [(HFTriggerBuilder *)self triggerActionSets];
  [v3 resetAllActionSets];

  id v8 = [MEMORY[0x263EFFA08] set];
  id v4 = [(HFTriggerBuilder *)self endEventBuildersDiff];
  id v5 = [v4 toSet];
  id v6 = +[HFSetDiff diffFromSet:v8 toSet:v5];
  int v7 = (void *)[v6 mutableCopy];
  [(HFTriggerBuilder *)self setEndEventBuildersDiff:v7];
}

- (id)_uniquelyRenameTrigger:(id)a3 pendingReplaceByNewTriggerWithName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F58190];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__HFTriggerBuilder__uniquelyRenameTrigger_pendingReplaceByNewTriggerWithName___block_invoke;
  v13[3] = &unk_2640910D8;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = [v8 futureWithErrorOnlyHandlerAdapterBlock:v13];

  return v11;
}

void __78__HFTriggerBuilder__uniquelyRenameTrigger_pendingReplaceByNewTriggerWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 home];
  id v7 = [v6 triggers];
  id v8 = [v3 setWithArray:v7];
  objc_msgSend(v8, "na_map:", &__block_literal_global_166_0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [*(id *)(a1 + 40) name];
  id v10 = [v12 setByAddingObject:*(void *)(a1 + 48)];
  uint64_t v11 = +[HFUtilities uniqueHomeKitNameForName:v9 allNames:v10];

  [*(id *)(a1 + 40) updateName:v11 completionHandler:v5];
}

uint64_t __78__HFTriggerBuilder__uniquelyRenameTrigger_pendingReplaceByNewTriggerWithName___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (id)_commitAddTriggerToHome:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F58190];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __44__HFTriggerBuilder__commitAddTriggerToHome___block_invoke;
  v18[3] = &unk_26408E218;
  v18[4] = self;
  id v6 = v4;
  id v19 = v6;
  id v7 = [v5 futureWithErrorOnlyHandlerAdapterBlock:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __44__HFTriggerBuilder__commitAddTriggerToHome___block_invoke_2;
  v16[3] = &unk_2640911C8;
  v16[4] = self;
  id v8 = v6;
  id v17 = v8;
  id v9 = (id)[v7 addSuccessBlock:v16];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__HFTriggerBuilder__commitAddTriggerToHome___block_invoke_2_169;
  v13[3] = &unk_26408C8C8;
  id v14 = v8;
  id v15 = self;
  id v10 = v8;
  id v11 = (id)[v7 addFailureBlock:v13];

  return v7;
}

void __44__HFTriggerBuilder__commitAddTriggerToHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 home];
  [v5 addTrigger:*(void *)(a1 + 40) completionHandler:v4];
}

void __44__HFTriggerBuilder__commitAddTriggerToHome___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setTrigger:*(void *)(a1 + 40)];
  uint64_t v2 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) trigger];
    id v4 = objc_msgSend(v3, "hf_prettyDescription");
    id v5 = [*(id *)(a1 + 32) home];
    *(_DWORD *)buf = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Added trigger:%@ home:%@", buf, 0x16u);
  }
  id v6 = +[HFHomeKitDispatcher sharedDispatcher];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__HFTriggerBuilder__commitAddTriggerToHome___block_invoke_168;
  v7[3] = &unk_26408CDA0;
  v7[4] = *(void *)(a1 + 32);
  [v6 dispatchHomeObserverMessage:v7 sender:0];
}

void __44__HFTriggerBuilder__commitAddTriggerToHome___block_invoke_168(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = [*(id *)(a1 + 32) trigger];
    [v5 home:v3 didAddTrigger:v4];
  }
}

void __44__HFTriggerBuilder__commitAddTriggerToHome___block_invoke_2_169(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    id v6 = [*(id *)(a1 + 40) home];
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    __int16 v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to add trigger (error = %@) :%@ home:%@", (uint8_t *)&v7, 0x20u);
  }
}

- (id)_deleteTrigger:(id)a3 fromHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uniqueIdentifier];
  __int16 v9 = v8;
  if (v7 && v8)
  {
    char v10 = objc_msgSend(v6, "hf_isBuilder");

    if ((v10 & 1) == 0)
    {
      __int16 v11 = (void *)MEMORY[0x263F58190];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __44__HFTriggerBuilder__deleteTrigger_fromHome___block_invoke;
      v24[3] = &unk_26408E218;
      id v25 = v7;
      id v12 = v6;
      id v26 = v12;
      uint64_t v13 = [v11 futureWithErrorOnlyHandlerAdapterBlock:v24];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      void v21[2] = __44__HFTriggerBuilder__deleteTrigger_fromHome___block_invoke_2;
      v21[3] = &unk_2640911C8;
      id v14 = v12;
      id v22 = v14;
      id v23 = self;
      id v15 = [v13 addSuccessBlock:v21];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __44__HFTriggerBuilder__deleteTrigger_fromHome___block_invoke_2_173;
      v18[3] = &unk_26408C8C8;
      id v19 = v14;
      id v20 = self;
      id v16 = [v15 addFailureBlock:v18];

      goto LABEL_7;
    }
  }
  else
  {
  }
  id v16 = [MEMORY[0x263F58190] futureWithNoResult];
LABEL_7:

  return v16;
}

uint64_t __44__HFTriggerBuilder__deleteTrigger_fromHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeTrigger:*(void *)(a1 + 40) completionHandler:a2];
}

void __44__HFTriggerBuilder__deleteTrigger_fromHome___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    id v4 = [*(id *)(a1 + 40) home];
    *(_DWORD *)buf = 138412546;
    __int16 v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Deleted trigger:%@ home:%@", buf, 0x16u);
  }
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__HFTriggerBuilder__deleteTrigger_fromHome___block_invoke_170;
  void v8[3] = &unk_26408D8F0;
  int8x16_t v7 = *(int8x16_t *)(a1 + 32);
  id v6 = (id)v7.i64[0];
  int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
  [v5 dispatchHomeObserverMessage:v8 sender:0];
}

void __44__HFTriggerBuilder__deleteTrigger_fromHome___block_invoke_170(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didRemoveTrigger:*(void *)(a1 + 40)];
  }
}

void __44__HFTriggerBuilder__deleteTrigger_fromHome___block_invoke_2_173(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    id v6 = [*(id *)(a1 + 40) home];
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    char v10 = v5;
    __int16 v11 = 2112;
    __int16 v12 = v6;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to delete trigger (error = %@) :%@ home:%@", (uint8_t *)&v7, 0x20u);
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (BOOL)nameIsConfigured
{
  return self->_nameIsConfigured;
}

- (void)setNameIsConfigured:(BOOL)a3
{
  self->_nameIsConfigured = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (HFTriggerActionSetsBuilder)triggerActionSets
{
  return self->_triggerActionSets;
}

- (void)setTriggerActionSets:(id)a3
{
}

- (HFTriggerBuilderContextProviding)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (HFConditionCollection)conditionCollection
{
  return self->_conditionCollection;
}

- (void)setConditionCollection:(id)a3
{
}

- (HFMutableSetDiff)endEventBuildersDiff
{
  return self->_endEventBuildersDiff;
}

- (void)setEndEventBuildersDiff:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEventBuildersDiff, 0);
  objc_storeStrong((id *)&self->_conditionCollection, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_triggerActionSets, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)compareToObject:(id)a3
{
  id v4 = a3;
  id v5 = [[HFComparisonResult alloc] initWithObjectA:self objectB:v4];
  if (![(HFComparisonResult *)v5 containsCriticalDifference])
  {
    id v6 = [(HFTriggerBuilder *)self triggerActionSets];
    int v7 = [v4 triggerActionSets];
    id v8 = [v6 compareToObject:v7];

    __int16 v9 = +[HFContainedObjectDifference containedObjectDifferenceWithKey:@"triggerActionSets" comparisonResult:v8];
    [(HFComparisonResult *)v5 add:v9];

    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    id v18 = __48__HFTriggerBuilder_Comparison__compareToObject___block_invoke;
    id v19 = &unk_264091060;
    id v20 = self;
    id v10 = v4;
    id v21 = v10;
    __int16 v11 = +[HFDifference difference:@"enabled" priority:1 withBlock:&v16];
    -[HFComparisonResult add:](v5, "add:", v11, v16, v17, v18, v19, v20);

    __int16 v12 = [(HFTriggerBuilder *)self endEventBuilders];
    uint64_t v13 = [v10 endEventBuilders];
    uint64_t v14 = +[HFContainedObjectListDifference containedObjectDifferenceWithKey:@"endEvents" objectsA:v12 objectsB:v13];
    [(HFComparisonResult *)v5 add:v14];
  }
  return v5;
}

uint64_t __48__HFTriggerBuilder_Comparison__compareToObject___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) enabled];
  return v2 ^ [*(id *)(a1 + 40) enabled];
}

- (unint64_t)hash
{
  id v3 = [(HFTriggerBuilder *)self trigger];
  id v4 = [v3 uniqueIdentifier];

  if (!v4) {
    return 0;
  }
  id v5 = [(HFTriggerBuilder *)self trigger];
  id v6 = [v5 uniqueIdentifier];
  unint64_t v7 = [v6 hash];

  return v7;
}

@end