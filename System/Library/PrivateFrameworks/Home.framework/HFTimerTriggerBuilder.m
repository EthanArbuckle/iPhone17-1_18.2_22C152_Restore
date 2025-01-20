@interface HFTimerTriggerBuilder
- (BOOL)_currentStateRequiresEventBasedTimeTriggers;
- (BOOL)_supportsEventBasedTimeTriggers;
- (BOOL)supportsHomeKitAutomationBuilders;
- (BOOL)wantsConvertToEventTrigger;
- (HFConcreteTimeTriggerBuilderLikeObject)timeInterface;
- (HFTimeEventBuilder)eventBuilder;
- (HFTimerTriggerBuilder)initWithExistingObject:(id)a3 inHome:(id)a4 context:(id)a5;
- (HFTriggerBuilder)concreteTriggerBuilder;
- (NSArray)recurrences;
- (NSTimeZone)timeZone;
- (id)_commitUsingBuilders;
- (id)_lazy_performValidation;
- (id)commitCreateTrigger;
- (id)commitEditTrigger;
- (id)compareToObject:(id)a3;
- (id)convertedEventTriggerBuilder;
- (id)getOrCreateTriggerBuilder;
- (id)lazilyFinishCommitingTrigger;
- (id)naturalLanguageDetailsWithOptions:(id)a3;
- (id)naturalLanguageNameOfType:(unint64_t)a3;
- (id)naturalLanguageNameWithOptions:(id)a3;
- (id)updateTriggerBuilder:(id)a3;
- (id)validationError;
- (unint64_t)preferredHomeKitObjectType;
- (void)_createConcreteTriggerBuilder;
- (void)setConcreteTriggerBuilder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEventBuilder:(id)a3;
- (void)setName:(id)a3;
- (void)setPreferredHomeKitObjectType:(unint64_t)a3;
- (void)setRecurrences:(id)a3;
- (void)setTimeInterface:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation HFTimerTriggerBuilder

- (HFTimerTriggerBuilder)initWithExistingObject:(id)a3 inHome:(id)a4 context:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)HFTimerTriggerBuilder;
  v5 = [(HFTriggerBuilder *)&v8 initWithExistingObject:a3 inHome:a4 context:a5];
  v6 = v5;
  if (v5) {
    [(HFTimerTriggerBuilder *)v5 _createConcreteTriggerBuilder];
  }
  return v6;
}

- (id)validationError
{
  v3 = [(HFTimerTriggerBuilder *)self concreteTriggerBuilder];
  v4 = [v3 triggerActionSets];
  v5 = [(HFTriggerBuilder *)self triggerActionSets];
  [v4 updateFromTriggerActionSetsBuilder:v5];

  v13.receiver = self;
  v13.super_class = (Class)HFTimerTriggerBuilder;
  v6 = [(HFTriggerBuilder *)&v13 validationError];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [(HFItemBuilder *)self verifyPropertiesAreSet:&unk_26C0F81B8];
    v10 = v9;
    if (v9)
    {
      id v8 = v9;
    }
    else
    {
      v11 = [(HFTimerTriggerBuilder *)self concreteTriggerBuilder];
      id v8 = [v11 validationError];
    }
  }

  return v8;
}

- (void)_createConcreteTriggerBuilder
{
  v3 = [(HFTriggerBuilder *)self trigger];

  if (v3)
  {
    v4 = [(HFTriggerBuilder *)self trigger];
    v5 = [(HFItemBuilder *)self home];
    v6 = [(HFTriggerBuilder *)self context];
    v7 = +[HFConcreteTimeTriggerBuilder builderForExistingTrigger:v4 inHome:v5 context:v6];
    [(HFTimerTriggerBuilder *)self setConcreteTriggerBuilder:v7];
  }
  else
  {
    if ([(HFTimerTriggerBuilder *)self _supportsEventBasedTimeTriggers]) {
      id v8 = HFEventTriggerBuilder;
    }
    else {
      id v8 = HFTimerBasedTimeTriggerBuilder;
    }
    id v9 = [v8 alloc];
    v4 = [(HFItemBuilder *)self home];
    v5 = [(HFTriggerBuilder *)self context];
    v6 = (void *)[v9 initWithHome:v4 context:v5];
    [(HFTimerTriggerBuilder *)self setConcreteTriggerBuilder:v6];
  }

  id v16 = [(HFTimerTriggerBuilder *)self timeInterface];
  v10 = [(HFTimerTriggerBuilder *)self concreteTriggerBuilder];
  if ([v10 conformsToProtocol:&unk_26C1284E0]) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  if (!v12)
  {
    objc_opt_class();
    objc_super v13 = [(HFTimerTriggerBuilder *)self concreteTriggerBuilder];
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    v10 = [v14 timeInterface];
  }
  [(HFTimerTriggerBuilder *)self setTimeInterface:v10];
  if (v16)
  {
    v15 = [(HFTimerTriggerBuilder *)self timeInterface];
    [v15 copyCurrentStateFromTriggerBuilder:v16];
  }
}

- (void)setPreferredHomeKitObjectType:(unint64_t)a3
{
  if (self->_preferredHomeKitObjectType != a3)
  {
    self->_preferredHomeKitObjectType = a3;
    v4 = [(HFTriggerBuilder *)self trigger];

    if (!v4)
    {
      [(HFTimerTriggerBuilder *)self _createConcreteTriggerBuilder];
    }
  }
}

- (id)commitCreateTrigger
{
  v3 = [(HFTimerTriggerBuilder *)self _lazy_performValidation];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__HFTimerTriggerBuilder_commitCreateTrigger__block_invoke;
  v6[3] = &unk_26408CDC8;
  v6[4] = self;
  v4 = [v3 flatMap:v6];

  return v4;
}

id __44__HFTimerTriggerBuilder_commitCreateTrigger__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) concreteTriggerBuilder];
  v2 = [v1 commitCreateTrigger];

  return v2;
}

- (id)commitEditTrigger
{
  if ([(HFTimerTriggerBuilder *)self wantsConvertToEventTrigger])
  {
    v3 = [(HFTimerTriggerBuilder *)self convertedEventTriggerBuilder];
    v4 = v3;
    if (v3)
    {
      v5 = [v3 commitCreateTrigger];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __42__HFTimerTriggerBuilder_commitEditTrigger__block_invoke;
      v9[3] = &unk_2640953B0;
      v9[4] = self;
      id v10 = v4;
      v6 = [v5 flatMap:v9];
    }
    else
    {
      v7 = (void *)MEMORY[0x263F58190];
      v5 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 38);
      v6 = [v7 futureWithError:v5];
    }
  }
  else
  {
    v4 = [(HFTimerTriggerBuilder *)self concreteTriggerBuilder];
    v6 = [v4 commitEditTrigger];
  }

  return v6;
}

id __42__HFTimerTriggerBuilder_commitEditTrigger__block_invoke(uint64_t a1, void *a2)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a2;
  [v4 setConcreteTriggerBuilder:v3];
  v6 = [*(id *)(a1 + 32) replaceCurrentTriggerWithTrigger:v5];

  return v6;
}

- (id)lazilyFinishCommitingTrigger
{
  v2 = [(HFTimerTriggerBuilder *)self concreteTriggerBuilder];
  uint64_t v3 = [v2 lazilyFinishCommitingTrigger];

  return v3;
}

- (BOOL)wantsConvertToEventTrigger
{
  if ([(HFTimerTriggerBuilder *)self _currentStateRequiresEventBasedTimeTriggers])
  {
    uint64_t v3 = [(HFTimerTriggerBuilder *)self concreteTriggerBuilder];
    objc_opt_class();
    char v4 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (id)convertedEventTriggerBuilder
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([(HFTimerTriggerBuilder *)self _supportsEventBasedTimeTriggers])
  {
    uint64_t v3 = [HFEventTriggerBuilder alloc];
    char v4 = [(HFItemBuilder *)self home];
    id v5 = [(HFTriggerBuilder *)self context];
    v6 = [(HFTriggerBuilder *)v3 initWithHome:v4 context:v5];

    v7 = [(HFEventTriggerBuilder *)v6 timeInterface];
    id v8 = [(HFTimerTriggerBuilder *)self timeInterface];
    [v7 copyCurrentStateFromTriggerBuilder:v8];

    [(HFTriggerBuilder *)v6 removeAllEndEventBuilders];
    id v9 = [(HFTriggerBuilder *)self endEventBuilders];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __53__HFTimerTriggerBuilder_convertedEventTriggerBuilder__block_invoke;
    v18[3] = &unk_26408EED0;
    id v10 = v6;
    p_super = &v10->super.super.super;
    objc_msgSend(v9, "na_each:", v18);

    v11 = [(HFTriggerBuilder *)self conditionCollection];
    [(HFTriggerBuilder *)v10 replaceConditionsWithConditions:v11];

    id v12 = [(HFTriggerBuilder *)v10 triggerActionSets];
    objc_super v13 = [(HFTriggerBuilder *)self triggerActionSets];
    [v12 updateFromTriggerActionSetsBuilder:v13];

    v14 = [(HFTriggerBuilder *)self name];
    [(HFTriggerBuilder *)v10 setName:v14];

    [(HFTriggerBuilder *)v10 setNameIsConfigured:[(HFTriggerBuilder *)self nameIsConfigured]];
    [(HFTriggerBuilder *)v10 setEnabled:[(HFTriggerBuilder *)self enabled]];
    v15 = p_super;
  }
  else
  {
    v15 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(HFTriggerBuilder *)self name];
      *(_DWORD *)buf = 138412546;
      v21 = self;
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Attempting to use trigger features on timer trigger builder %@ (name:%@) that require supporting the new event-based time triggers when they are not currently supported in this home!", buf, 0x16u);
    }
    id v10 = 0;
  }

  return v10;
}

uint64_t __53__HFTimerTriggerBuilder_convertedEventTriggerBuilder__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addEndEventBuilder:a2];
}

- (id)naturalLanguageNameOfType:(unint64_t)a3
{
  id v5 = [(HFItemBuilder *)self home];
  v6 = +[HFTriggerNaturalLanguageOptions optionsWithHome:v5 nameType:a3];
  v7 = [(HFTimerTriggerBuilder *)self naturalLanguageNameWithOptions:v6];

  return v7;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTimerTriggerBuilder *)self eventBuilder];
  v6 = [(HFTimerTriggerBuilder *)self recurrences];
  v7 = [v5 naturalLanguageNameWithOptions:v4 recurrences:v6];

  return v7;
}

- (id)naturalLanguageDetailsWithOptions:(id)a3
{
  id v4 = (void *)MEMORY[0x263F0E860];
  id v5 = a3;
  v6 = [(HFTimerTriggerBuilder *)self recurrences];
  v7 = objc_msgSend(v4, "hf_naturalLanguageDetailsWithRecurrences:withOptions:", v6, v5);

  return v7;
}

- (HFTimeEventBuilder)eventBuilder
{
  v2 = [(HFTimerTriggerBuilder *)self timeInterface];
  uint64_t v3 = [v2 eventBuilder];

  return (HFTimeEventBuilder *)v3;
}

- (void)setEventBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTimerTriggerBuilder *)self timeInterface];
  [v5 setEventBuilder:v4];
}

- (NSTimeZone)timeZone
{
  v2 = [(HFTimerTriggerBuilder *)self timeInterface];
  uint64_t v3 = [v2 timeZone];

  return (NSTimeZone *)v3;
}

- (void)setTimeZone:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTimerTriggerBuilder *)self timeInterface];
  [v5 setTimeZone:v4];
}

- (NSArray)recurrences
{
  v2 = [(HFTimerTriggerBuilder *)self timeInterface];
  uint64_t v3 = [v2 recurrences];

  return (NSArray *)v3;
}

- (void)setRecurrences:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTimerTriggerBuilder *)self timeInterface];
  [v5 setRecurrences:v4];
}

- (void)setName:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HFTimerTriggerBuilder;
  id v4 = a3;
  [(HFTriggerBuilder *)&v6 setName:v4];
  id v5 = [(HFTimerTriggerBuilder *)self concreteTriggerBuilder];
  [v5 setName:v4];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(HFTriggerBuilder *)self enabled];
  v7.receiver = self;
  v7.super_class = (Class)HFTimerTriggerBuilder;
  [(HFTriggerBuilder *)&v7 setEnabled:v3];
  if (v5 != v3)
  {
    objc_super v6 = [(HFTimerTriggerBuilder *)self timeInterface];
    [v6 triggerEnabledStateDidChange:v3];
  }
}

- (BOOL)_currentStateRequiresEventBasedTimeTriggers
{
  BOOL v3 = [(HFTriggerBuilder *)self endEventBuilders];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v5 = [(HFTriggerBuilder *)self conditionCollection];
    objc_super v6 = [v5 conditions];
    BOOL v4 = [v6 count] != 0;
  }
  return v4;
}

- (BOOL)_supportsEventBasedTimeTriggers
{
  unint64_t v3 = [(HFTimerTriggerBuilder *)self preferredHomeKitObjectType];
  if (v3 == 1) {
    return 0;
  }
  if (v3 == 2) {
    return 1;
  }
  uint64_t v5 = HFPreferencesBooleanValueForKey(@"HFForcedEventBasedTimeTriggerAvailability");
  if (v5) {
    return v5 == 2;
  }
  objc_super v6 = [(HFItemBuilder *)self home];
  char v7 = objc_msgSend(v6, "hf_supportsSharedEventAutomation");

  return v7;
}

- (id)_lazy_performValidation
{
  return [(HFItemBuilder *)self lazy_verifyPropertiesAreSet:&unk_26C0F81D0];
}

- (HFTriggerBuilder)concreteTriggerBuilder
{
  return self->_concreteTriggerBuilder;
}

- (void)setConcreteTriggerBuilder:(id)a3
{
}

- (unint64_t)preferredHomeKitObjectType
{
  return self->_preferredHomeKitObjectType;
}

- (HFConcreteTimeTriggerBuilderLikeObject)timeInterface
{
  return self->_timeInterface;
}

- (void)setTimeInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeInterface, 0);
  objc_storeStrong((id *)&self->_concreteTriggerBuilder, 0);
}

- (id)getOrCreateTriggerBuilder
{
  if ([(HFTimerTriggerBuilder *)self wantsConvertToEventTrigger])
  {
    unint64_t v3 = [(HFItemBuilder *)self home];
    BOOL v4 = (void *)[v3 newEventTriggerBuilder];
    uint64_t v5 = +[HFTriggerBuilderPair creatingTriggerWithBuilder:v4];
  }
  else
  {
    unint64_t v3 = [(HFTimerTriggerBuilder *)self concreteTriggerBuilder];
    uint64_t v5 = [v3 getOrCreateTriggerBuilder];
  }

  return v5;
}

- (id)updateTriggerBuilder:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HFTimerTriggerBuilder *)self wantsConvertToEventTrigger]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = [(HFTimerTriggerBuilder *)self convertedEventTriggerBuilder];
    objc_super v6 = [v5 updateTriggerBuilder:v4];
  }
  else
  {
    char v7 = [(HFTimerTriggerBuilder *)self concreteTriggerBuilder];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v9 = [(HFTimerTriggerBuilder *)self concreteTriggerBuilder];
      [v9 removeAllEndEventBuilders];
      id v10 = [(HFTriggerBuilder *)self endEventBuilders];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __66__HFTimerTriggerBuilder_AutomationBuilders__updateTriggerBuilder___block_invoke;
      v20[3] = &unk_26408EED0;
      id v21 = v9;
      id v11 = v9;
      objc_msgSend(v10, "na_each:", v20);

      id v12 = [(HFTriggerBuilder *)self conditionCollection];
      [v11 replaceConditionsWithConditions:v12];

      objc_super v13 = [(HFTimerTriggerBuilder *)self recurrences];
      [v11 setRecurrences:v13];
    }
    v14 = (void *)MEMORY[0x263F58190];
    uint64_t v5 = [(HFTimerTriggerBuilder *)self concreteTriggerBuilder];
    v15 = [v5 updateTriggerBuilder:v4];
    v22[0] = v15;
    v19.receiver = self;
    v19.super_class = (Class)HFTimerTriggerBuilder;
    id v16 = [(HFTriggerBuilder *)&v19 updateTriggerBuilder:v4];
    v22[1] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    objc_super v6 = [v14 combineAllFutures:v17];
  }
  return v6;
}

uint64_t __66__HFTimerTriggerBuilder_AutomationBuilders__updateTriggerBuilder___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addEndEventBuilder:a2];
}

- (BOOL)supportsHomeKitAutomationBuilders
{
  if ([(HFTimerTriggerBuilder *)self wantsConvertToEventTrigger]) {
    [(HFTimerTriggerBuilder *)self convertedEventTriggerBuilder];
  }
  else {
  unint64_t v3 = [(HFTimerTriggerBuilder *)self concreteTriggerBuilder];
  }
  char v4 = [v3 supportsHomeKitAutomationBuilders];

  return v4;
}

- (id)_commitUsingBuilders
{
  if ([(HFTimerTriggerBuilder *)self wantsConvertToEventTrigger])
  {
    unint64_t v3 = [(HFTriggerBuilder *)self trigger];
    char v4 = [(HFTriggerBuilder *)self name];
    uint64_t v5 = [(HFTriggerBuilder *)self _uniquelyRenameTrigger:v3 pendingReplaceByNewTriggerWithName:v4];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __65__HFTimerTriggerBuilder_AutomationBuilders___commitUsingBuilders__block_invoke;
    v12[3] = &unk_26408CDC8;
    v12[4] = self;
    objc_super v6 = [v5 flatMap:v12];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __65__HFTimerTriggerBuilder_AutomationBuilders___commitUsingBuilders__block_invoke_2;
    v10[3] = &unk_264098688;
    v10[4] = self;
    id v11 = v3;
    id v7 = v3;
    id v8 = [v6 flatMap:v10];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HFTimerTriggerBuilder;
    id v8 = [(HFTriggerBuilder *)&v13 _commitUsingBuilders];
  }
  return v8;
}

id __65__HFTimerTriggerBuilder_AutomationBuilders___commitUsingBuilders__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)HFTimerTriggerBuilder;
  v1 = objc_msgSendSuper2(&v3, sel__commitUsingBuilders);
  return v1;
}

id __65__HFTimerTriggerBuilder_AutomationBuilders___commitUsingBuilders__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) convertedEventTriggerBuilder];
  [*(id *)(a1 + 32) setConcreteTriggerBuilder:v4];

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [v5 home];
  id v8 = [v5 _deleteTrigger:v6 fromHome:v7];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__HFTimerTriggerBuilder_AutomationBuilders___commitUsingBuilders__block_invoke_3;
  v12[3] = &unk_2640945A0;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v3;
  id v9 = v3;
  id v10 = [v8 flatMap:v12];

  return v10;
}

uint64_t __65__HFTimerTriggerBuilder_AutomationBuilders___commitUsingBuilders__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _didReplaceBackingTrigger];
  v2 = (void *)MEMORY[0x263F58190];
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 futureWithResult:v3];
}

- (id)compareToObject:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HFTimerTriggerBuilder;
  uint64_t v3 = [(HFTriggerBuilder *)&v5 compareToObject:a3];
  [v3 containsCriticalDifference];
  return v3;
}

@end