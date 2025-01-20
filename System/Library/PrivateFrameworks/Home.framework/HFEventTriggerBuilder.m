@interface HFEventTriggerBuilder
+ (Class)homeKitRepresentationClass;
- (BOOL)_effectiveExecuteOnce;
- (BOOL)executeOnce;
- (BOOL)requiresConfirmationToRun;
- (BOOL)shouldMarkTriggerAsHomeAppCreated;
- (BOOL)supportsConditions;
- (BOOL)supportsEndEvents;
- (HFCharacteristicTriggerBuilderInterface)characteristicInterface;
- (HFEventBuilderLocationInterface)locationInterface;
- (HFEventTriggerBuilder)initWithExistingObject:(id)a3 inHome:(id)a4 context:(id)a5;
- (HFEventTriggerBuilderTimeInterface)timeInterface;
- (NSArray)eventBuilders;
- (NSArray)recurrences;
- (NSMutableDictionary)extensionInterfaces;
- (NSMutableSet)mutableEventBuilders;
- (NSSet)characteristics;
- (NSSet)eventTypes;
- (id)_allActionSets;
- (id)_lazilyMarkTriggerAsHomeAppCreated;
- (id)_lazy_performValidation;
- (id)_updateEvents;
- (id)_updateExecuteOnce;
- (id)_updateRecurrences;
- (id)commitCreateTrigger;
- (id)commitEditTrigger;
- (id)compareToObject:(id)a3;
- (id)createEndEvents;
- (id)createEvents;
- (id)createNewTriggerBuilder;
- (id)deleteTrigger;
- (id)lazilyFinishCommitingTrigger;
- (id)naturalLanguageDetailsWithOptions:(id)a3;
- (id)naturalLanguageNameOfType:(unint64_t)a3;
- (id)naturalLanguageNameWithOptions:(id)a3;
- (id)updateTriggerBuilder:(id)a3;
- (id)validationError;
- (void)_createEventBuilders;
- (void)addEventBuilder:(id)a3;
- (void)applyEventBuilderDiff:(id)a3;
- (void)removeEventBuilder:(id)a3;
- (void)removeServiceLikeItem:(id)a3;
- (void)setExecuteOnce:(BOOL)a3;
- (void)setExtensionInterfaces:(id)a3;
- (void)setMutableEventBuilders:(id)a3;
- (void)setRecurrences:(id)a3;
- (void)setShouldMarkTriggerAsHomeAppCreated:(BOOL)a3;
@end

@implementation HFEventTriggerBuilder

- (HFEventTriggerBuilder)initWithExistingObject:(id)a3 inHome:(id)a4 context:(id)a5
{
  id v9 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HFEventTriggerBuilder;
  v10 = [(HFTriggerBuilder *)&v21 initWithExistingObject:v9 inHome:a4 context:a5];
  v11 = v10;
  if (v10)
  {
    v12 = [(HFTriggerBuilder *)v10 trigger];

    if (v12)
    {
      v13 = [(HFTriggerBuilder *)v11 trigger];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v19 = [MEMORY[0x263F08690] currentHandler];
        v20 = [(HFTriggerBuilder *)v11 trigger];
        [v19 handleFailureInMethod:a2, v11, @"HFEventTriggerBuilder.m", 33, @"HFEventTriggerBuilder must be instantiated with an HMEventTrigger. Got: %@ instead", v20 object file lineNumber description];
      }
    }
    v15 = objc_msgSend(v9, "hf_effectiveRecurrences");
    [(HFEventTriggerBuilder *)v11 setRecurrences:v15];

    -[HFEventTriggerBuilder setExecuteOnce:](v11, "setExecuteOnce:", [v9 executeOnce]);
    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    extensionInterfaces = v11->_extensionInterfaces;
    v11->_extensionInterfaces = (NSMutableDictionary *)v16;

    [(HFEventTriggerBuilder *)v11 _createEventBuilders];
  }

  return v11;
}

- (void)addEventBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [(HFEventTriggerBuilder *)self mutableEventBuilders];
  objc_msgSend(v5, "na_safeAddObject:", v4);
}

- (void)removeEventBuilder:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HFEventTriggerBuilder *)self mutableEventBuilders];
    [v5 removeObject:v4];
  }
}

- (void)applyEventBuilderDiff:(id)a3
{
  id v4 = a3;
  id v5 = [v4 additions];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__HFEventTriggerBuilder_applyEventBuilderDiff___block_invoke;
  v8[3] = &unk_26408EED0;
  v8[4] = self;
  objc_msgSend(v5, "na_each:", v8);

  v6 = [v4 deletions];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__HFEventTriggerBuilder_applyEventBuilderDiff___block_invoke_2;
  v7[3] = &unk_26408EED0;
  v7[4] = self;
  objc_msgSend(v6, "na_each:", v7);
}

uint64_t __47__HFEventTriggerBuilder_applyEventBuilderDiff___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addEventBuilder:a2];
}

uint64_t __47__HFEventTriggerBuilder_applyEventBuilderDiff___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeEventBuilder:a2];
}

- (NSArray)eventBuilders
{
  v2 = [(HFEventTriggerBuilder *)self mutableEventBuilders];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSSet)characteristics
{
  v2 = [(HFEventTriggerBuilder *)self mutableEventBuilders];
  v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_28);

  return (NSSet *)v3;
}

id __40__HFEventTriggerBuilder_characteristics__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  v6 = [v5 characteristic];

  return v6;
}

- (void)setRecurrences:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = (NSArray *)a3;
  BOOL v5 = ([(NSArray *)v4 na_all:&__block_literal_global_11] & 1) != 0 || [(NSArray *)v4 count] == 0;
  if ([(NSArray *)v4 count] == 1
    && ([(NSArray *)v4 firstObject],
        v6 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(MEMORY[0x263EFF918], "hf_dailyIntervalComponents"),
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = objc_msgSend(v6, "hf_isEqualToHomeKitRecurrence:", v7),
        v7,
        v6,
        v8))
  {
    id v9 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(HFEventTriggerBuilder *)self recurrences];
      v11 = [(HFTriggerBuilder *)self name];
      int v20 = 138412546;
      objc_super v21 = v10;
      __int16 v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Reset recurrences: %@ to weekday components for trigger with name: %@", (uint8_t *)&v20, 0x16u);
    }
    uint64_t v12 = objc_msgSend(MEMORY[0x263EFF918], "hf_dailyWeekdayIntervalComponents");
  }
  else
  {
    v13 = v4;
    if (v5) {
      goto LABEL_14;
    }
    v14 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(HFEventTriggerBuilder *)self recurrences];
      uint64_t v16 = [(HFTriggerBuilder *)self name];
      int v20 = 138412546;
      objc_super v21 = v15;
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Filtered to recurrences: %@ for trigger with name: %@", (uint8_t *)&v20, 0x16u);
    }
    uint64_t v12 = [(NSArray *)v4 na_filter:&__block_literal_global_11];
  }
  v13 = (NSArray *)v12;

LABEL_14:
  recurrences = self->_recurrences;
  self->_recurrences = v13;
  v18 = v13;

  NSUInteger v19 = [(NSArray *)self->_recurrences count];
  if (v19) {
    self->_executeOnce = 0;
  }
}

BOOL __40__HFEventTriggerBuilder_setRecurrences___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 weekday] >= 1 && objc_msgSend(v2, "weekday") < 8;

  return v3;
}

- (NSSet)eventTypes
{
  eventTypes = self->_eventTypes;
  if (eventTypes)
  {
    BOOL v3 = eventTypes;
  }
  else
  {
    id v4 = [(HFEventTriggerBuilder *)self mutableEventBuilders];
    objc_msgSend(v4, "na_map:", &__block_literal_global_14);
    BOOL v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

uint64_t __35__HFEventTriggerBuilder_eventTypes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 eventType];
}

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (BOOL)supportsConditions
{
  return 1;
}

- (BOOL)supportsEndEvents
{
  return 1;
}

- (id)validationError
{
  v8.receiver = self;
  v8.super_class = (Class)HFEventTriggerBuilder;
  BOOL v3 = [(HFTriggerBuilder *)&v8 validationError];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(HFItemBuilder *)self verifyProperty:@"mutableEventBuilders" matchesCondition:&__block_literal_global_22_0 description:@"List of events cannot be empty"];
  }
  v6 = v5;

  return v6;
}

BOOL __40__HFEventTriggerBuilder_validationError__block_invoke(uint64_t a1, void *a2)
{
  return [a2 count] != 0;
}

- (BOOL)requiresConfirmationToRun
{
  BOOL v3 = [(HFEventTriggerBuilder *)self mutableEventBuilders];
  int v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_28_0);

  if (!v4) {
    return 0;
  }
  id v5 = [(HFEventTriggerBuilder *)self _allActionSets];
  char v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_75);

  return v6;
}

uint64_t __50__HFEventTriggerBuilder_requiresConfirmationToRun__block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_26C10A780];
}

uint64_t __50__HFEventTriggerBuilder_requiresConfirmationToRun__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 requiresDeviceUnlock];
}

- (id)naturalLanguageNameOfType:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3 == 4)
  {
    id v5 = [(HFTriggerBuilder *)self context];
    char v6 = [v5 triggerContextAwareTitle];

    if (v6)
    {
      v7 = [(HFTriggerBuilder *)self context];
      objc_super v8 = [v7 triggerContextAwareTitle];
      goto LABEL_6;
    }
    unint64_t v3 = 1;
  }
  v7 = [(HFItemBuilder *)self home];
  id v9 = +[HFTriggerNaturalLanguageOptions optionsWithHome:v7 nameType:v3];
  objc_super v8 = [(HFEventTriggerBuilder *)self naturalLanguageNameWithOptions:v9];

LABEL_6:
  return v8;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTriggerBuilder *)self trigger];
  uint64_t v6 = [v5 creator];
  if (v6) {
    goto LABEL_2;
  }
  objc_super v8 = [(HFItemBuilder *)self home];
  v7 = [v8 currentUser];

  if (!v7)
  {
    id v5 = [(HFTriggerBuilder *)self trigger];
    v13 = [(HFTriggerBuilder *)self trigger];
    v14 = [v13 creator];
    v15 = [(HFItemBuilder *)self home];
    uint64_t v16 = [v15 currentUser];
    NSLog(&cfstr_UnexpectedNilU.isa, v5, v14, v16);

LABEL_2:
    v7 = (void *)v6;
  }
  id v9 = (void *)MEMORY[0x263F0E310];
  v10 = [(HFEventTriggerBuilder *)self createEvents];
  v11 = objc_msgSend(v9, "hf_naturalLanguageNameWithOptions:events:forUser:", v4, v10, v7);

  return v11;
}

- (id)naturalLanguageDetailsWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTriggerBuilder *)self endEventBuilders];
  uint64_t v6 = objc_msgSend(v5, "na_flatMap:", &__block_literal_global_82);

  v7 = (void *)MEMORY[0x263F0E310];
  objc_super v8 = [(HFEventTriggerBuilder *)self recurrences];
  id v9 = [(HFTriggerBuilder *)self conditionCollection];
  v10 = objc_msgSend(v7, "hf_naturalLanguageDetailsWithRecurrences:conditions:endEvents:withOptions:", v8, v9, v6, v4);

  return v10;
}

id __59__HFEventTriggerBuilder_naturalLanguageDetailsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 buildNewEventsFromCurrentState];
  unint64_t v3 = [v2 allObjects];

  return v3;
}

- (id)deleteTrigger
{
  unint64_t v3 = [(HFItemBuilder *)self home];
  id v4 = [(HFTriggerBuilder *)self trigger];
  id v5 = [(HFTriggerBuilder *)self trigger];
  uint64_t v6 = [v5 uniqueIdentifier];

  if (v6 && v3)
  {
    v7 = [MEMORY[0x263EFF9C0] setWithObject:v4];
    objc_super v8 = [(HFTriggerBuilder *)self context];
    id v9 = [v8 unsupportedTriggers];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __38__HFEventTriggerBuilder_deleteTrigger__block_invoke;
    v28[3] = &unk_26408EFB8;
    id v10 = v7;
    id v29 = v10;
    [v9 enumerateObjectsUsingBlock:v28];

    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __38__HFEventTriggerBuilder_deleteTrigger__block_invoke_2;
    v26 = &unk_26408EFE0;
    id v27 = v3;
    v11 = objc_msgSend(v10, "na_map:", &v23);
    uint64_t v12 = objc_msgSend(v11, "allObjects", v23, v24, v25, v26);

    objc_opt_class();
    v13 = [(HFTriggerBuilder *)self trigger];
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;
    uint64_t v16 = objc_msgSend(v15, "hf_unmarkTriggerAsHomeAppCreated");
    v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [MEMORY[0x263F58190] futureWithNoResult];
    }
    int v20 = v18;

    objc_super v21 = [MEMORY[0x263EFF980] arrayWithObject:v20];
    [v21 addObjectsFromArray:v12];
    NSUInteger v19 = [MEMORY[0x263F58190] combineAllFutures:v21];
  }
  else
  {
    NSUInteger v19 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v19;
}

uint64_t __38__HFEventTriggerBuilder_deleteTrigger__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id __38__HFEventTriggerBuilder_deleteTrigger__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F58190];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__HFEventTriggerBuilder_deleteTrigger__block_invoke_3;
  v8[3] = &unk_26408E218;
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 futureWithErrorOnlyHandlerAdapterBlock:v8];

  return v6;
}

uint64_t __38__HFEventTriggerBuilder_deleteTrigger__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeTrigger:*(void *)(a1 + 40) completionHandler:a2];
}

- (void)removeServiceLikeItem:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HFEventTriggerBuilder;
  id v4 = a3;
  [(HFTriggerBuilder *)&v13 removeServiceLikeItem:v4];
  id v5 = [v4 services];

  uint64_t v6 = objc_msgSend(v5, "na_flatMap:", &__block_literal_global_93_0);

  v7 = [(HFEventTriggerBuilder *)self mutableEventBuilders];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__HFEventTriggerBuilder_removeServiceLikeItem___block_invoke_2;
  v11[3] = &unk_26408F008;
  id v12 = v6;
  id v8 = v6;
  id v9 = objc_msgSend(v7, "na_filter:", v11);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__HFEventTriggerBuilder_removeServiceLikeItem___block_invoke_3;
  v10[3] = &unk_26408EED0;
  v10[4] = self;
  objc_msgSend(v9, "na_each:", v10);
}

id __47__HFEventTriggerBuilder_removeServiceLikeItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [a2 characteristics];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

uint64_t __47__HFEventTriggerBuilder_removeServiceLikeItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_26C1021D8]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  uint64_t v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    id v8 = [v5 characteristic];
    uint64_t v9 = [v7 containsObject:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void __47__HFEventTriggerBuilder_removeServiceLikeItem___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 mutableEventBuilders];
  [v4 removeObject:v3];
}

- (id)lazilyFinishCommitingTrigger
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__HFEventTriggerBuilder_lazilyFinishCommitingTrigger__block_invoke;
  v4[3] = &unk_26408E4E0;
  v4[4] = self;
  id v2 = [MEMORY[0x263F58190] lazyFutureWithBlock:v4];
  return v2;
}

void __53__HFEventTriggerBuilder_lazilyFinishCommitingTrigger__block_invoke(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F58190];
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 _lazilyMarkTriggerAsHomeAppCreated];
  v12[0] = v6;
  v7 = [*(id *)(a1 + 32) _updateExecuteOnce];
  v12[1] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  uint64_t v9 = [v3 chainFutures:v8];
  id v10 = [v5 completionHandlerAdapter];

  id v11 = (id)[v9 addCompletionBlock:v10];
}

- (id)commitCreateTrigger
{
  id v3 = [(HFEventTriggerBuilder *)self _lazy_performValidation];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__HFEventTriggerBuilder_commitCreateTrigger__block_invoke;
  v10[3] = &unk_26408CDC8;
  v10[4] = self;
  id v4 = [v3 flatMap:v10];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__HFEventTriggerBuilder_commitCreateTrigger__block_invoke_2;
  v9[3] = &unk_26408C8A0;
  v9[4] = self;
  id v5 = (id)[v4 addSuccessBlock:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__HFEventTriggerBuilder_commitCreateTrigger__block_invoke_107;
  v8[3] = &unk_26408CDF0;
  void v8[4] = self;
  id v6 = (id)[v4 addFailureBlock:v8];
  return v4;
}

id __44__HFEventTriggerBuilder_commitCreateTrigger__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F0E310]);
  id v3 = [*(id *)(a1 + 32) name];
  id v4 = [*(id *)(a1 + 32) createEvents];
  id v5 = [*(id *)(a1 + 32) recurrences];
  id v6 = (void *)[v2 initWithName:v3 events:v4 endEvents:0 recurrences:v5 predicate:0];
  [*(id *)(a1 + 32) setTrigger:v6];

  v7 = (void *)MEMORY[0x263F58190];
  id v8 = [*(id *)(a1 + 32) trigger];
  uint64_t v9 = [v7 futureWithResult:v8];

  return v9;
}

void __44__HFEventTriggerBuilder_commitCreateTrigger__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) name];
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Created event trigger with name:%@", (uint8_t *)&v4, 0xCu);
  }
}

void __44__HFEventTriggerBuilder_commitCreateTrigger__block_invoke_107(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = [*(id *)(a1 + 32) name];
    int v6 = 138412546;
    v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to create event trigger with name:%@. Error: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)commitEditTrigger
{
  id v3 = [(HFEventTriggerBuilder *)self _lazy_performValidation];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__HFEventTriggerBuilder_commitEditTrigger__block_invoke;
  v10[3] = &unk_26408CDC8;
  v10[4] = self;
  int v4 = [v3 flatMap:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__HFEventTriggerBuilder_commitEditTrigger__block_invoke_2;
  v9[3] = &unk_26408CDC8;
  v9[4] = self;
  id v5 = [v4 flatMap:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__HFEventTriggerBuilder_commitEditTrigger__block_invoke_3;
  v8[3] = &unk_26408CDC8;
  void v8[4] = self;
  int v6 = [v5 flatMap:v8];

  return v6;
}

uint64_t __42__HFEventTriggerBuilder_commitEditTrigger__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateEvents];
}

uint64_t __42__HFEventTriggerBuilder_commitEditTrigger__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRecurrences];
}

uint64_t __42__HFEventTriggerBuilder_commitEditTrigger__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateExecuteOnce];
}

- (id)createEvents
{
  id v2 = [(HFEventTriggerBuilder *)self mutableEventBuilders];
  id v3 = objc_msgSend(v2, "na_flatMap:", &__block_literal_global_111);
  int v4 = [v3 allObjects];

  return v4;
}

uint64_t __37__HFEventTriggerBuilder_createEvents__block_invoke(uint64_t a1, void *a2)
{
  return [a2 buildNewEventsFromCurrentState];
}

- (id)createEndEvents
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(HFTriggerBuilder *)self endEventBuilders];
  int v4 = [v2 setWithArray:v3];
  id v5 = objc_msgSend(v4, "na_flatMap:", &__block_literal_global_113);
  int v6 = [v5 allObjects];

  return v6;
}

uint64_t __40__HFEventTriggerBuilder_createEndEvents__block_invoke(uint64_t a1, void *a2)
{
  return [a2 buildNewEventsFromCurrentState];
}

- (id)_updateEvents
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(HFTriggerBuilder *)self trigger];
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    int v6 = v4;
    if (v5) {
      goto LABEL_8;
    }
    v7 = [MEMORY[0x263F08690] currentHandler];
    __int16 v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];
  }
  int v6 = 0;
LABEL_8:

  id v9 = (void *)MEMORY[0x263F58190];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __38__HFEventTriggerBuilder__updateEvents__block_invoke;
  v17[3] = &unk_26408E218;
  id v18 = v6;
  NSUInteger v19 = self;
  id v10 = v6;
  id v11 = [v9 futureWithErrorOnlyHandlerAdapterBlock:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __38__HFEventTriggerBuilder__updateEvents__block_invoke_2;
  v16[3] = &unk_26408C8A0;
  v16[4] = self;
  id v12 = [v11 addSuccessBlock:v16];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __38__HFEventTriggerBuilder__updateEvents__block_invoke_114;
  v15[3] = &unk_26408CDF0;
  v15[4] = self;
  objc_super v13 = [v12 addFailureBlock:v15];

  return v13;
}

void __38__HFEventTriggerBuilder__updateEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 createEvents];
  [v2 updateEvents:v5 completionHandler:v4];
}

void __38__HFEventTriggerBuilder__updateEvents__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) mutableEventBuilders];
    id v4 = objc_msgSend(v3, "hf_prettyDescription");
    id v5 = [*(id *)(a1 + 32) name];
    int v6 = 138412546;
    v7 = v4;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Updated events: %@ from trigger with name: %@", (uint8_t *)&v6, 0x16u);
  }
}

void __38__HFEventTriggerBuilder__updateEvents__block_invoke_114(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = [*(id *)(a1 + 32) mutableEventBuilders];
    int v6 = objc_msgSend(v5, "hf_prettyDescription");
    v7 = [*(id *)(a1 + 32) name];
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to update events: %@ from trigger with name: %@. Error: %@", (uint8_t *)&v8, 0x20u);
  }
}

- (id)_updateExecuteOnce
{
  BOOL v3 = [(HFEventTriggerBuilder *)self _effectiveExecuteOnce];
  id v4 = [(HFEventTriggerBuilder *)self eventTypes];
  char v5 = [v4 containsObject:@"HFEventTypeTime"];

  if (v5)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __43__HFEventTriggerBuilder__updateExecuteOnce__block_invoke;
    v14[3] = &unk_26408F050;
    v14[4] = self;
    BOOL v15 = v3;
    int v6 = [MEMORY[0x263F58190] lazyFutureWithBlock:v14];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __43__HFEventTriggerBuilder__updateExecuteOnce__block_invoke_3;
    void v12[3] = &unk_26408F078;
    BOOL v13 = v3;
    v12[4] = self;
    id v7 = (id)[v6 addSuccessBlock:v12];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __43__HFEventTriggerBuilder__updateExecuteOnce__block_invoke_115;
    v10[3] = &unk_26408F0A0;
    BOOL v11 = v3;
    v10[4] = self;
    id v8 = (id)[v6 addFailureBlock:v10];
  }
  else
  {
    int v6 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v6;
}

void __43__HFEventTriggerBuilder__updateExecuteOnce__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) trigger];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__HFEventTriggerBuilder__updateExecuteOnce__block_invoke_2;
  v7[3] = &unk_26408CDF0;
  id v8 = v3;
  id v6 = v3;
  [v4 updateExecuteOnce:v5 completionHandler:v7];
}

uint64_t __43__HFEventTriggerBuilder__updateExecuteOnce__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithNoResult];
  }
}

void __43__HFEventTriggerBuilder__updateExecuteOnce__block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) name];
    v5[0] = 67109378;
    v5[1] = v3;
    __int16 v6 = 2112;
    id v7 = v4;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Updated execute once: %d for trigger with name: %@", (uint8_t *)v5, 0x12u);
  }
}

void __43__HFEventTriggerBuilder__updateExecuteOnce__block_invoke_115(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = *(unsigned __int8 *)(a1 + 40);
    __int16 v6 = [*(id *)(a1 + 32) name];
    v7[0] = 67109634;
    v7[1] = v5;
    __int16 v8 = 2112;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to update execute once: %d for trigger with name: %@. Error: %@", (uint8_t *)v7, 0x1Cu);
  }
}

- (id)_updateRecurrences
{
  id v3 = [(HFEventTriggerBuilder *)self recurrences];
  id v4 = (void *)MEMORY[0x263F58190];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __43__HFEventTriggerBuilder__updateRecurrences__block_invoke;
  void v12[3] = &unk_26408F0C8;
  v12[4] = self;
  id v13 = v3;
  id v5 = v3;
  __int16 v6 = [v4 lazyFutureWithBlock:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__HFEventTriggerBuilder__updateRecurrences__block_invoke_3;
  v11[3] = &unk_26408C8A0;
  void v11[4] = self;
  id v7 = (id)[v6 addSuccessBlock:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__HFEventTriggerBuilder__updateRecurrences__block_invoke_116;
  v10[3] = &unk_26408CDF0;
  v10[4] = self;
  id v8 = (id)[v6 addFailureBlock:v10];

  return v6;
}

void __43__HFEventTriggerBuilder__updateRecurrences__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) trigger];
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __43__HFEventTriggerBuilder__updateRecurrences__block_invoke_2;
  v7[3] = &unk_26408CDF0;
  id v8 = v3;
  id v6 = v3;
  [v4 updateRecurrences:v5 completionHandler:v7];
}

uint64_t __43__HFEventTriggerBuilder__updateRecurrences__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithNoResult];
  }
}

void __43__HFEventTriggerBuilder__updateRecurrences__block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) recurrences];
    id v4 = [*(id *)(a1 + 32) name];
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Updated recurrences: %@ for trigger with name: %@", (uint8_t *)&v5, 0x16u);
  }
}

void __43__HFEventTriggerBuilder__updateRecurrences__block_invoke_116(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = [*(id *)(a1 + 32) recurrences];
    id v6 = [*(id *)(a1 + 32) name];
    int v7 = 138412802;
    id v8 = v5;
    __int16 v9 = 2112;
    __int16 v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to update recurrences: %@ for trigger with name: %@. Error: %@", (uint8_t *)&v7, 0x20u);
  }
}

- (id)_lazy_performValidation
{
  return [(HFItemBuilder *)self lazy_verifyProperty:@"mutableEventBuilders" matchesCondition:&__block_literal_global_118 description:@"List of events cannot be empty"];
}

BOOL __48__HFEventTriggerBuilder__lazy_performValidation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 count] != 0;
}

- (id)_lazilyMarkTriggerAsHomeAppCreated
{
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x263F58190];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  _DWORD v5[2] = __59__HFEventTriggerBuilder__lazilyMarkTriggerAsHomeAppCreated__block_invoke;
  v5[3] = &unk_26408F0F0;
  objc_copyWeak(&v6, &location);
  id v3 = [v2 lazyFutureWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __59__HFEventTriggerBuilder__lazilyMarkTriggerAsHomeAppCreated__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  id v4 = [WeakRetained trigger];
  if (objc_opt_isKindOfClass()) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  id v6 = v5;

  if ([WeakRetained shouldMarkTriggerAsHomeAppCreated]) {
    objc_msgSend(v6, "hf_markTriggerAsHomeAppCreated");
  }
  else {
  int v7 = objc_msgSend(v6, "hf_unmarkTriggerAsHomeAppCreated");
  }

  if (v7)
  {
    id v8 = [v10 completionHandlerAdapter];
    id v9 = (id)[v7 addCompletionBlock:v8];
  }
  else
  {
    [v10 finishWithNoResult];
  }
}

- (BOOL)_effectiveExecuteOnce
{
  id v3 = [(HFEventTriggerBuilder *)self recurrences];
  if ([v3 count])
  {
    BOOL v4 = [(HFEventTriggerBuilder *)self executeOnce];
  }
  else
  {
    int v5 = [(HFEventTriggerBuilder *)self eventTypes];
    BOOL v4 = ([v5 containsObject:@"HFEventTypeTime"] & 1) != 0
      || [(HFEventTriggerBuilder *)self executeOnce];
  }
  return v4;
}

- (id)_allActionSets
{
  id v3 = [(HFTriggerBuilder *)self triggerActionSets];
  BOOL v4 = [v3 namedActionSets];

  int v5 = [(HFTriggerBuilder *)self triggerActionSets];
  id v6 = [v5 anonymousActionSetBuilder];
  int v7 = [v4 arrayByAddingObject:v6];

  return v7;
}

- (void)_createEventBuilders
{
  id v3 = [MEMORY[0x263EFF9C0] set];
  [(HFEventTriggerBuilder *)self setMutableEventBuilders:v3];

  BOOL v4 = [(HFTriggerBuilder *)self trigger];
  int v5 = [v4 events];
  id v6 = (void *)[v5 mutableCopy];

  int v7 = [(HFTriggerBuilder *)self trigger];
  id v8 = [v7 events];
  id v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_121);

  id v10 = [(HFEventTriggerBuilder *)self mutableEventBuilders];
  __int16 v11 = [(HFItemBuilder *)self home];
  id v12 = +[HFCharacteristicEventBuilder characteristicEventBuildersForEvents:v9 inHome:v11];
  [v10 addObjectsFromArray:v12];

  [v6 removeObjectsInArray:v9];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __45__HFEventTriggerBuilder__createEventBuilders__block_invoke_2;
  v13[3] = &unk_26408F138;
  v13[4] = self;
  objc_msgSend(v6, "na_each:", v13);
}

id __45__HFEventTriggerBuilder__createEventBuilders__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26C1021D8]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

void __45__HFEventTriggerBuilder__createEventBuilders__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = +[HFEventBuilder eventBuilderForEvent:](HFEventBuilder, "eventBuilderForEvent:");
  if (!v3) {
    NSLog(&cfstr_FailedToCreate_0.isa, v5);
  }
  id v4 = [*(id *)(a1 + 32) mutableEventBuilders];
  objc_msgSend(v4, "na_safeAddObject:", v3);
}

- (NSArray)recurrences
{
  return self->_recurrences;
}

- (BOOL)executeOnce
{
  return self->_executeOnce;
}

- (void)setExecuteOnce:(BOOL)a3
{
  self->_executeOnce = a3;
}

- (BOOL)shouldMarkTriggerAsHomeAppCreated
{
  return self->_shouldMarkTriggerAsHomeAppCreated;
}

- (void)setShouldMarkTriggerAsHomeAppCreated:(BOOL)a3
{
  self->_shouldMarkTriggerAsHomeAppCreated = a3;
}

- (NSMutableSet)mutableEventBuilders
{
  return self->_mutableEventBuilders;
}

- (void)setMutableEventBuilders:(id)a3
{
}

- (NSMutableDictionary)extensionInterfaces
{
  return self->_extensionInterfaces;
}

- (void)setExtensionInterfaces:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionInterfaces, 0);
  objc_storeStrong((id *)&self->_mutableEventBuilders, 0);
  objc_storeStrong((id *)&self->_recurrences, 0);
  objc_storeStrong((id *)&self->_eventTypes, 0);
}

- (id)createNewTriggerBuilder
{
  id v2 = [(HFItemBuilder *)self home];
  id v3 = (void *)[v2 newEventTriggerBuilder];

  return v3;
}

- (id)updateTriggerBuilder:(id)a3
{
  v24[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HFEventTriggerBuilder;
  id v6 = [(HFTriggerBuilder *)&v23 updateTriggerBuilder:v5];
  objc_opt_class();
  id v7 = v5;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [(HFEventTriggerBuilder *)self createEvents];
    [v9 setEvents:v10];

    __int16 v11 = [(HFEventTriggerBuilder *)self createEndEvents];
    [v9 setEndEvents:v11];

    id v12 = [(HFEventTriggerBuilder *)self recurrences];
    [v9 setRecurrences:v12];

    objc_msgSend(v9, "setExecuteOnce:", -[HFEventTriggerBuilder _effectiveExecuteOnce](self, "_effectiveExecuteOnce"));
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __66__HFEventTriggerBuilder_AutomationBuilders__updateTriggerBuilder___block_invoke;
    v22[3] = &unk_26408DAC0;
    v22[4] = self;
    uint64_t v13 = __66__HFEventTriggerBuilder_AutomationBuilders__updateTriggerBuilder___block_invoke((uint64_t)v22);
    [v9 setPredicate:v13];

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __66__HFEventTriggerBuilder_AutomationBuilders__updateTriggerBuilder___block_invoke_2;
    v20[3] = &unk_2640936B0;
    v20[4] = self;
    id v21 = v9;
    uint64_t v14 = __66__HFEventTriggerBuilder_AutomationBuilders__updateTriggerBuilder___block_invoke_2((uint64_t)v20);
    BOOL v15 = (void *)MEMORY[0x263F58190];
    v24[0] = v6;
    v24[1] = v14;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
    id v17 = [v15 combineAllFutures:v16];
  }
  else
  {
    id v18 = NSStringFromSelector(a2);
    NSLog(&cfstr_PassedAHmTrigg.isa, self, v18, v7);

    id v17 = v6;
  }

  return v17;
}

id __66__HFEventTriggerBuilder_AutomationBuilders__updateTriggerBuilder___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) supportsConditions])
  {
    id v2 = [*(id *)(a1 + 32) conditionCollection];
    id v3 = [v2 predicate];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

id __66__HFEventTriggerBuilder_AutomationBuilders__updateTriggerBuilder___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) shouldMarkTriggerAsHomeAppCreated];
  id v3 = *(void **)(a1 + 40);
  if (v2) {
    objc_msgSend(v3, "hf_markTriggerAsHomeAppCreated");
  }
  else {
  id v4 = objc_msgSend(v3, "hf_unmarkTriggerAsHomeAppCreated");
  }
  return v4;
}

- (HFCharacteristicTriggerBuilderInterface)characteristicInterface
{
  id v3 = [(HFEventTriggerBuilder *)self extensionInterfaces];
  id v4 = [v3 objectForKeyedSubscript:@"characteristicInterface"];

  if (!v4)
  {
    id v4 = +[HFEventTriggerBuilderInterface interfaceWithBuilder:self];
    id v5 = [(HFEventTriggerBuilder *)self extensionInterfaces];
    [v5 setObject:v4 forKeyedSubscript:@"characteristicInterface"];
  }
  return (HFCharacteristicTriggerBuilderInterface *)v4;
}

- (HFEventBuilderLocationInterface)locationInterface
{
  id v3 = [(HFEventTriggerBuilder *)self extensionInterfaces];
  id v4 = [v3 objectForKeyedSubscript:@"locationInterface"];

  if (!v4)
  {
    id v4 = +[HFEventTriggerBuilderInterface interfaceWithBuilder:self];
    id v5 = [(HFEventTriggerBuilder *)self extensionInterfaces];
    [v5 setObject:v4 forKeyedSubscript:@"locationInterface"];
  }
  return (HFEventBuilderLocationInterface *)v4;
}

- (HFEventTriggerBuilderTimeInterface)timeInterface
{
  id v3 = [(HFEventTriggerBuilder *)self extensionInterfaces];
  id v4 = [v3 objectForKeyedSubscript:@"timeInterface"];

  if (!v4)
  {
    id v4 = +[HFEventTriggerBuilderInterface interfaceWithBuilder:self];
    id v5 = [(HFEventTriggerBuilder *)self extensionInterfaces];
    [v5 setObject:v4 forKeyedSubscript:@"timeInterface"];
  }
  return (HFEventTriggerBuilderTimeInterface *)v4;
}

- (id)compareToObject:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFEventTriggerBuilder;
  id v5 = [(HFTriggerBuilder *)&v10 compareToObject:v4];
  if (([v5 containsCriticalDifference] & 1) == 0)
  {
    id v6 = [(HFEventTriggerBuilder *)self eventBuilders];
    id v7 = [v4 eventBuilders];
    id v8 = +[HFContainedObjectListDifference containedObjectDifferenceWithKey:@"eventBuilders" objectsA:v6 objectsB:v7];
    [v5 add:v8];
  }
  return v5;
}

@end