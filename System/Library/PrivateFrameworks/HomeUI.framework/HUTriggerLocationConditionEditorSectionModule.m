@interface HUTriggerLocationConditionEditorSectionModule
- (BOOL)conditionIsDisabled;
- (HFItem)anyLocationOptionItem;
- (HFTransformItem)anyUserAtHomeOptionItem;
- (HFTransformItem)currentUserAtHomeOptionItem;
- (HFTransformItem)currentUserNotAtHomeOptionItem;
- (HFTransformItem)customOptionItem;
- (HFTransformItem)noUserAtHomeOptionItem;
- (HUTriggerLocationConditionEditorSectionModule)initWithItemUpdater:(id)a3 conditionType:(unint64_t)a4 home:(id)a5;
- (id)_conditionItemForPresenceEvent:(id)a3;
- (id)_createConditionItemForPresenceEventType:(unint64_t)a3 userType:(unint64_t)a4;
- (id)buildConditionOptionItems;
- (id)conditionForOptionItem:(id)a3;
- (id)conditionTitle;
- (id)noConditionSummaryTitle;
- (id)preferredConditionFromConditions:(id)a3;
- (id)selectOptionItemForCondition:(id)a3;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)setAnyLocationOptionItem:(id)a3;
- (void)setAnyUserAtHomeOptionItem:(id)a3;
- (void)setCurrentUserAtHomeOptionItem:(id)a3;
- (void)setCurrentUserNotAtHomeOptionItem:(id)a3;
- (void)setCustomOptionItem:(id)a3;
- (void)setNoUserAtHomeOptionItem:(id)a3;
@end

@implementation HUTriggerLocationConditionEditorSectionModule

- (HUTriggerLocationConditionEditorSectionModule)initWithItemUpdater:(id)a3 conditionType:(unint64_t)a4 home:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)HUTriggerLocationConditionEditorSectionModule;
  v5 = [(HUTriggerConditionEditorExpandingSectionModule *)&v8 initWithItemUpdater:a3 conditionType:a4 home:a5];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F69250] sharedDispatcher];
    [v6 addObserver:v5];
  }
  return v5;
}

- (id)conditionForOptionItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTriggerLocationConditionEditorSectionModule *)self anyLocationOptionItem];

  if (v5 == v4)
  {
    v12 = 0;
  }
  else
  {
    objc_opt_class();
    id v6 = v4;
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    if (v8
      && ([(HUTriggerConditionEditorExpandingSectionModule *)self optionItems],
          v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 containsObject:v8],
          v9,
          v10))
    {
      v11 = [v8 sourceItem];
      v12 = [v11 condition];
    }
    else
    {
      NSLog(&cfstr_UnknownOptionI.isa, v6);
      v12 = 0;
    }
  }

  return v12;
}

- (id)selectOptionItemForCondition:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    if (v7)
    {
      id v8 = [v7 presenceEvent];
      v9 = [(HUTriggerLocationConditionEditorSectionModule *)self _conditionItemForPresenceEvent:v8];

      int v10 = [v9 sourceItem];
      [v10 setCondition:v7];
    }
    else
    {
      NSLog(&cfstr_UnexpectedCond.isa, v5);
      v9 = 0;
    }
  }
  else
  {
    v9 = [(HUTriggerLocationConditionEditorSectionModule *)self anyLocationOptionItem];
  }

  return v9;
}

- (id)preferredConditionFromConditions:(id)a3
{
  v3 = objc_msgSend(a3, "na_filter:", &__block_literal_global_202);
  id v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_9_0);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 firstObject];
  }
  id v7 = v6;

  return v7;
}

uint64_t __82__HUTriggerLocationConditionEditorSectionModule_preferredConditionFromConditions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __82__HUTriggerLocationConditionEditorSectionModule_preferredConditionFromConditions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  v3 = [a2 presenceEvent];
  id v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "presenceUserType"));
  uint64_t v5 = [&unk_1F19B5990 containsObject:v4];

  return v5;
}

- (id)conditionTitle
{
  return _HULocalizedStringWithDefaultValue(@"HUTriggerLocationConditionTitle", @"HUTriggerLocationConditionTitle", 1);
}

- (id)noConditionSummaryTitle
{
  return _HULocalizedStringWithDefaultValue(@"HUTriggerLocationConditionNoSelectedConditionSummary", @"HUTriggerLocationConditionNoSelectedConditionSummary", 1);
}

- (BOOL)conditionIsDisabled
{
  id v2 = (void *)MEMORY[0x1E4F2EA28];
  v3 = [(HUTriggerConditionEditorExpandingSectionModule *)self home];
  LOBYTE(v2) = objc_msgSend(v2, "hf_presenceDisableReasonsForHome:", v3) != 0;

  return (char)v2;
}

- (id)buildConditionOptionItems
{
  v12[6] = *MEMORY[0x1E4F143B8];
  v3 = _HULocalizedStringWithDefaultValue(@"HUTriggerLocationConditionOptionNoneTitle", @"HUTriggerLocationConditionOptionNoneTitle", 1);
  id v4 = [(HUTriggerConditionEditorExpandingSectionModule *)self createNoConditionOptionItemWithTitle:v3];
  [(HUTriggerLocationConditionEditorSectionModule *)self setAnyLocationOptionItem:v4];
  v12[0] = v4;
  uint64_t v5 = [(HUTriggerLocationConditionEditorSectionModule *)self _createConditionItemForPresenceEventType:3 userType:2];
  [(HUTriggerLocationConditionEditorSectionModule *)self setAnyUserAtHomeOptionItem:v5];
  v12[1] = v5;
  id v6 = [(HUTriggerLocationConditionEditorSectionModule *)self _createConditionItemForPresenceEventType:3 userType:1];
  [(HUTriggerLocationConditionEditorSectionModule *)self setCurrentUserAtHomeOptionItem:v6];
  v12[2] = v6;
  id v7 = [(HUTriggerLocationConditionEditorSectionModule *)self _createConditionItemForPresenceEventType:4 userType:2];
  [(HUTriggerLocationConditionEditorSectionModule *)self setNoUserAtHomeOptionItem:v7];
  v12[3] = v7;
  id v8 = [(HUTriggerLocationConditionEditorSectionModule *)self _createConditionItemForPresenceEventType:4 userType:1];
  [(HUTriggerLocationConditionEditorSectionModule *)self setCurrentUserNotAtHomeOptionItem:v8];
  v12[4] = v8;
  v9 = [(HUTriggerLocationConditionEditorSectionModule *)self _createConditionItemForPresenceEventType:3 userType:3];
  [(HUTriggerLocationConditionEditorSectionModule *)self setCustomOptionItem:v9];
  v12[5] = v9;
  int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:6];

  return v10;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F69230];
  id v6 = [(HUTriggerConditionEditorExpandingSectionModule *)self itemProviders];
  id v9 = [v5 requestToReloadItemProviders:v6 senderSelector:a2];

  id v7 = [(HFItemModule *)self itemUpdater];
  id v8 = (id)[v7 performItemUpdateRequest:v9];
}

- (id)_conditionItemForPresenceEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 presenceUserType];
  if (v5 == 1)
  {
    if ([v4 presenceEventType] == 3) {
      [(HUTriggerLocationConditionEditorSectionModule *)self currentUserAtHomeOptionItem];
    }
    else {
      [(HUTriggerLocationConditionEditorSectionModule *)self currentUserNotAtHomeOptionItem];
    }
    goto LABEL_5;
  }
  if (v5 == 2)
  {
    if ([v4 presenceEventType] == 3) {
      [(HUTriggerLocationConditionEditorSectionModule *)self anyUserAtHomeOptionItem];
    }
    else {
      [(HUTriggerLocationConditionEditorSectionModule *)self noUserAtHomeOptionItem];
    }
    uint64_t v6 = LABEL_5:;
    goto LABEL_11;
  }
  uint64_t v6 = [(HUTriggerLocationConditionEditorSectionModule *)self customOptionItem];
LABEL_11:
  id v7 = (void *)v6;

  return v7;
}

- (id)_createConditionItemForPresenceEventType:(unint64_t)a3 userType:(unint64_t)a4
{
  id v7 = [(HUTriggerConditionEditorExpandingSectionModule *)self home];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F2EA28]) initWithPresenceEventType:a3 presenceUserType:a4];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F693F8]) initWithPresenceEvent:v8];
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F69400]) initWithCondition:v9 home:v7];
  objc_initWeak(&location, self);
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__25;
  v27 = __Block_byref_object_dispose__25;
  id v28 = 0;
  id v11 = objc_alloc(MEMORY[0x1E4F696A8]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __99__HUTriggerLocationConditionEditorSectionModule__createConditionItemForPresenceEventType_userType___block_invoke_33;
  v18[3] = &unk_1E638EB00;
  objc_copyWeak(v22, &location);
  v21 = &v23;
  v22[1] = (id)a4;
  id v12 = v10;
  id v19 = v12;
  id v13 = v7;
  id v20 = v13;
  uint64_t v14 = [v11 initWithSourceItem:v12 updateOptionsTransformBlock:&__block_literal_global_29_1 resultsTransformBlock:v18];
  v15 = (void *)v24[5];
  v24[5] = v14;

  id v16 = (id)v24[5];
  objc_destroyWeak(v22);
  _Block_object_dispose(&v23, 8);

  objc_destroyWeak(&location);

  return v16;
}

id __99__HUTriggerLocationConditionEditorSectionModule__createConditionItemForPresenceEventType_userType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 mutableCopy];
  [v2 setObject:&unk_1F19B4B08 forKeyedSubscript:*MEMORY[0x1E4F68708]];
  [v2 setObject:&unk_1F19B4B38 forKeyedSubscript:*MEMORY[0x1E4F68718]];

  return v2;
}

id __99__HUTriggerLocationConditionEditorSectionModule__createConditionItemForPresenceEventType_userType___block_invoke_33(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = (void *)[v4 mutableCopy];

  [WeakRetained selectedOptionItem];
  id v7 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  uint64_t v8 = *(void *)(a1 + 64);
  if (v8 == 3)
  {
    id v9 = [*(id *)(a1 + 32) condition];
    int v10 = [v9 presenceEvent];
    id v11 = [v10 users];
    uint64_t v12 = [v11 count];

    if (!v12) {
      [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
    }
    uint64_t v8 = *(void *)(a1 + 64);
  }
  if (v8 == 2)
  {
    id v13 = [*(id *)(a1 + 40) users];
    uint64_t v14 = [v13 count];

    if (!v14) {
      [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
    }
  }
  if ([WeakRetained conditionIsDisabled]) {
    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }

  return v6;
}

- (HFItem)anyLocationOptionItem
{
  return self->_anyLocationOptionItem;
}

- (void)setAnyLocationOptionItem:(id)a3
{
}

- (HFTransformItem)anyUserAtHomeOptionItem
{
  return self->_anyUserAtHomeOptionItem;
}

- (void)setAnyUserAtHomeOptionItem:(id)a3
{
}

- (HFTransformItem)currentUserAtHomeOptionItem
{
  return self->_currentUserAtHomeOptionItem;
}

- (void)setCurrentUserAtHomeOptionItem:(id)a3
{
}

- (HFTransformItem)noUserAtHomeOptionItem
{
  return self->_noUserAtHomeOptionItem;
}

- (void)setNoUserAtHomeOptionItem:(id)a3
{
}

- (HFTransformItem)currentUserNotAtHomeOptionItem
{
  return self->_currentUserNotAtHomeOptionItem;
}

- (void)setCurrentUserNotAtHomeOptionItem:(id)a3
{
}

- (HFTransformItem)customOptionItem
{
  return self->_customOptionItem;
}

- (void)setCustomOptionItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customOptionItem, 0);
  objc_storeStrong((id *)&self->_currentUserNotAtHomeOptionItem, 0);
  objc_storeStrong((id *)&self->_noUserAtHomeOptionItem, 0);
  objc_storeStrong((id *)&self->_currentUserAtHomeOptionItem, 0);
  objc_storeStrong((id *)&self->_anyUserAtHomeOptionItem, 0);

  objc_storeStrong((id *)&self->_anyLocationOptionItem, 0);
}

@end