@interface HFTriggerItem
- (BOOL)usesRichIconDescriptors;
- (HFServiceActionItemProvider)serviceActionItemProvider;
- (HFTriggerItem)init;
- (HFTriggerItem)initWithHome:(id)a3 trigger:(id)a4;
- (HMHome)home;
- (HMTrigger)trigger;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createRichIconDescriptors:(id)a3 options:(id)a4;
- (id)translateToRichIconDescriptors:(id)a3 basedOnActionItems:(id)a4;
- (void)setServiceActionItemProvider:(id)a3;
- (void)setUsesRichIconDescriptors:(BOOL)a3;
@end

@implementation HFTriggerItem

- (HFTriggerItem)initWithHome:(id)a3 trigger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HFTriggerItem;
  v9 = [(HFTriggerItem *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_trigger, a4);
    serviceActionItemProvider = v10->_serviceActionItemProvider;
    v10->_serviceActionItemProvider = 0;

    v10->_usesRichIconDescriptors = 0;
  }

  return v10;
}

- (HFTriggerItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HFTriggerItem.m" lineNumber:55 description:@"Use -initWithHome:trigger:"];

  return 0;
}

- (HFServiceActionItemProvider)serviceActionItemProvider
{
  if (!self->_serviceActionItemProvider && [(HFTriggerItem *)self usesRichIconDescriptors])
  {
    v3 = [(HFTriggerItem *)self trigger];
    v4 = [v3 actionSets];
    v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_140);

    if (v5)
    {
      v6 = [HFServiceActionItemProvider alloc];
      id v7 = [(HFTriggerItem *)self home];
      id v8 = [(HFServiceActionItemProvider *)v6 initWithHome:v7 actionSet:v5];
      serviceActionItemProvider = self->_serviceActionItemProvider;
      self->_serviceActionItemProvider = v8;
    }
  }
  v10 = self->_serviceActionItemProvider;
  return v10;
}

uint64_t __42__HFTriggerItem_serviceActionItemProvider__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isAnonymous");
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(HFTriggerItem *)self trigger];

  if (!v5) {
    NSLog(&cfstr_TriggerMustBeS.isa);
  }
  v6 = [(HFTriggerItem *)self trigger];

  if (v6)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __45__HFTriggerItem__subclass_updateWithOptions___block_invoke;
    v16[3] = &unk_2640936B0;
    id v7 = v4;
    id v17 = v7;
    v18 = self;
    id v8 = __45__HFTriggerItem__subclass_updateWithOptions___block_invoke((uint64_t)v16);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __45__HFTriggerItem__subclass_updateWithOptions___block_invoke_22;
    v13[3] = &unk_2640977C8;
    id v14 = v7;
    v15 = self;
    v9 = [v8 flatMap:v13];
  }
  else
  {
    v10 = (void *)MEMORY[0x263F58190];
    v11 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    v9 = [v10 futureWithError:v11];
  }
  return v9;
}

id __45__HFTriggerItem__subclass_updateWithOptions___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    id v4 = [MEMORY[0x263F58190] futureWithResult:&unk_26C0F6E10];
  }
  else
  {
    v5 = [*(id *)(a1 + 40) trigger];
    id v4 = objc_msgSend(v5, "hf_forceDisableReasons");
  }
  return v4;
}

id __45__HFTriggerItem__subclass_updateWithOptions___block_invoke_22(uint64_t a1, void *a2)
{
  int v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a2;
  v5 = [v3 dictionary];
  uint64_t v6 = [v4 integerValue];

  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:HFTriggerItemIgnoresDisabledStateOptionKey];
  uint64_t v8 = [v7 BOOLValue];

  v9 = [HFTriggerUISummary alloc];
  v10 = [*(id *)(a1 + 40) trigger];
  v11 = [*(id *)(a1 + 40) home];
  v12 = [(HFTriggerUISummary *)v9 initWithTrigger:v10 inHome:v11 forceDisabled:v6 != 0 ignoringDisabled:v8];

  [v5 setObject:v12 forKeyedSubscript:@"HFResultTriggerUISummaryKey"];
  uint64_t v13 = [(HFTriggerUISummary *)v12 triggerDisplayTitle];
  id v14 = (void *)v13;
  uint64_t v15 = MEMORY[0x263EFFA88];
  if (v13) {
    uint64_t v16 = v13;
  }
  else {
    uint64_t v16 = MEMORY[0x263EFFA88];
  }
  id v17 = HFResultHiddenKey;
  if (v13) {
    id v17 = HFResultDisplayTitleKey;
  }
  [v5 setObject:v16 forKeyedSubscript:*v17];
  [v5 setObject:v15 forKeyedSubscript:@"accessWhileLockedSettingDependency"];
  [v5 setObject:v15 forKeyedSubscript:@"userNotificationSettingsDependency"];
  [v5 setObject:v15 forKeyedSubscript:@"remoteAccessDependency"];
  objc_opt_class();
  v18 = [*(id *)(a1 + 40) trigger];
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  v21 = [*(id *)(a1 + 40) home];
  BOOL v22 = objc_msgSend(v21, "hf_remoteAccessState") == 1 || objc_msgSend(v20, "triggerActivationState") == 1;

  v23 = [(HFTriggerUISummary *)v12 triggerDescription];
  if (v23) {
    [v5 setObject:v23 forKeyedSubscript:@"description"];
  }
  if (v6) {
    uint64_t v24 = 1;
  }
  else {
    uint64_t v24 = v22;
  }
  v25 = [NSNumber numberWithBool:v24];
  [v5 setObject:v25 forKeyedSubscript:@"displayWarningIcon"];

  v26 = NSNumber;
  v27 = [*(id *)(a1 + 40) trigger];
  v28 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "hf_triggerType"));
  [v5 setObject:v28 forKeyedSubscript:@"triggerType"];

  v29 = [(HFTriggerUISummary *)v12 triggerIconDescriptor];
  [v5 setObject:v29 forKeyedSubscript:@"icon"];

  v30 = [(HFTriggerUISummary *)v12 triggerSummaryIconDescriptors];
  v31 = [*(id *)(a1 + 40) createRichIconDescriptors:v30 options:*(void *)(a1 + 32)];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __45__HFTriggerItem__subclass_updateWithOptions___block_invoke_2;
  v35[3] = &unk_26408FAA0;
  id v36 = v5;
  id v32 = v5;
  v33 = [v31 flatMap:v35];

  return v33;
}

id __45__HFTriggerItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:@"iconDescriptorList"];
  int v3 = (void *)MEMORY[0x263F58190];
  id v4 = +[HFItemUpdateOutcome outcomeWithResults:*(void *)(a1 + 32)];
  v5 = [v3 futureWithResult:v4];

  return v5;
}

- (id)createRichIconDescriptors:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(HFTriggerItem *)self usesRichIconDescriptors]
    && ([(HFTriggerItem *)self serviceActionItemProvider],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    v9 = [(HFTriggerItem *)self serviceActionItemProvider];
    v10 = [v9 reloadItems];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __51__HFTriggerItem_createRichIconDescriptors_options___block_invoke;
    v16[3] = &unk_264097818;
    void v16[4] = self;
    id v17 = v7;
    v11 = [v10 flatMap:v16];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __51__HFTriggerItem_createRichIconDescriptors_options___block_invoke_3;
    v14[3] = &unk_2640945A0;
    v14[4] = self;
    id v15 = v6;
    v12 = [v11 flatMap:v14];
  }
  else
  {
    v12 = [MEMORY[0x263F58190] futureWithResult:v6];
  }

  return v12;
}

id __51__HFTriggerItem_createRichIconDescriptors_options___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) serviceActionItemProvider];
  int v3 = [v2 items];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__HFTriggerItem_createRichIconDescriptors_options___block_invoke_2;
  v9[3] = &unk_2640977F0;
  id v10 = *(id *)(a1 + 40);
  id v4 = objc_msgSend(v3, "na_map:", v9);

  v5 = (void *)MEMORY[0x263F58190];
  id v6 = [v4 allObjects];
  id v7 = [v5 combineAllFutures:v6];

  return v7;
}

uint64_t __51__HFTriggerItem_createRichIconDescriptors_options___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateWithOptions:*(void *)(a1 + 32)];
}

id __51__HFTriggerItem_createRichIconDescriptors_options___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) serviceActionItemProvider];
  int v3 = [v2 items];

  id v4 = (void *)MEMORY[0x263F58190];
  v5 = [*(id *)(a1 + 32) translateToRichIconDescriptors:*(void *)(a1 + 40) basedOnActionItems:v3];
  id v6 = [v4 futureWithResult:v5];

  return v6;
}

- (id)translateToRichIconDescriptors:(id)a3 basedOnActionItems:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263EFF9B0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __67__HFTriggerItem_translateToRichIconDescriptors_basedOnActionItems___block_invoke;
  v21[3] = &unk_264097840;
  id v22 = v8;
  id v9 = v8;
  objc_msgSend(v7, "na_each:", v21);
  id v10 = objc_msgSend(v7, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_37_3);

  v11 = objc_msgSend(v6, "na_map:", &__block_literal_global_40_4);

  v12 = objc_msgSend(v11, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_98_1);
  uint64_t v13 = [v9 array];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __67__HFTriggerItem_translateToRichIconDescriptors_basedOnActionItems___block_invoke_5;
  v18[3] = &unk_2640978C8;
  id v19 = v12;
  id v20 = v10;
  id v14 = v10;
  id v15 = v12;
  uint64_t v16 = objc_msgSend(v13, "na_flatMap:", v18);

  return v16;
}

void __67__HFTriggerItem_translateToRichIconDescriptors_basedOnActionItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 addObject:v3];
}

uint64_t __67__HFTriggerItem_translateToRichIconDescriptors_basedOnActionItems___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

HFCAPackageIconDescriptor *__67__HFTriggerItem_translateToRichIconDescriptors_basedOnActionItems___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"icon"];
  if ([v3 conformsToProtocol:&unk_26C0FE438]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  v5 = v4;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [HFCAPackageIconDescriptor alloc];
    id v8 = [(HFCAPackageIconDescriptor *)v6 packageIdentifier];
    id v9 = [(HFCAPackageIconDescriptor *)v6 state];

    v5 = [(HFCAPackageIconDescriptor *)v7 initWithPackageIdentifier:v8 state:v9];
  }
  return v5;
}

uint64_t __67__HFTriggerItem_translateToRichIconDescriptors_basedOnActionItems___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

id __67__HFTriggerItem_translateToRichIconDescriptors_basedOnActionItems___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];

    id v4 = [v6 allObjects];

    [v4 sortedArrayUsingComparator:&__block_literal_global_101];
  }
  else
  {
    [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
  id v7 = };

  return v7;
}

uint64_t __67__HFTriggerItem_translateToRichIconDescriptors_basedOnActionItems___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (HMHome)home
{
  return self->_home;
}

- (HMTrigger)trigger
{
  return self->_trigger;
}

- (BOOL)usesRichIconDescriptors
{
  return self->_usesRichIconDescriptors;
}

- (void)setUsesRichIconDescriptors:(BOOL)a3
{
  self->_usesRichIconDescriptors = a3;
}

- (void)setServiceActionItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceActionItemProvider, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end