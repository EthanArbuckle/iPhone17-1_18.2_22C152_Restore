@interface HUAvailableTriggerItem
- (BOOL)isActive;
- (HFServiceLikeItem)preferredRelatedItem;
- (HFTriggerItem)triggerItem;
- (HFTriggerNaturalLanguageOptions)triggerNaturalLanguageOptions;
- (HMHome)home;
- (HMTrigger)trigger;
- (HRERecommendationItem)recommendationItem;
- (HUAvailableTriggerItem)initWithHome:(id)a3 containingItem:(id)a4 relatedToServiceLikeItems:(id)a5;
- (HUTriggerLikeItem)sourceItem;
- (NSArray)relatedServiceLikeItems;
- (NSDictionary)naturalLanguageTitleOptions;
- (NSNumber)activeValue;
- (NSString)identifier;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)buildersForActivating:(BOOL)a3 inHome:(id)a4 withContext:(id)a5 serviceLikeItems:(id)a6;
- (id)removalTriggerBuildersForTriggers:(id)a3 home:(id)a4 context:(id)a5 relatedItems:(id)a6;
- (void)_updateNaturalLanguageOptions;
- (void)resetActiveToDefault;
- (void)setActive:(BOOL)a3;
- (void)setActiveValue:(id)a3;
- (void)setNaturalLanguageTitleOptions:(id)a3;
- (void)setRelatedServiceLikeItems:(id)a3;
- (void)setSourceItem:(id)a3;
- (void)setTriggerNaturalLanguageOptions:(id)a3;
@end

@implementation HUAvailableTriggerItem

- (HUAvailableTriggerItem)initWithHome:(id)a3 containingItem:(id)a4 relatedToServiceLikeItems:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HUAvailableTriggerItem;
  v12 = [(HUAvailableTriggerItem *)&v16 init];
  v13 = v12;
  if (v12)
  {
    [(HUAvailableTriggerItem *)v12 setSourceItem:v10];
    objc_storeStrong((id *)&v13->_home, a3);
    objc_storeStrong((id *)&v13->_relatedServiceLikeItems, a5);
    activeValue = v13->_activeValue;
    v13->_activeValue = 0;
  }
  return v13;
}

- (void)resetActiveToDefault
{
}

- (void)setSourceItem:(id)a3
{
  v4 = (HUTriggerLikeItem *)a3;
  if (!v4) {
    NSLog(&cfstr_Huavailabletri.isa);
  }
  sourceItem = self->_sourceItem;
  self->_sourceItem = v4;
}

- (HFServiceLikeItem)preferredRelatedItem
{
  v2 = [(HUAvailableTriggerItem *)self relatedServiceLikeItems];
  v3 = [v2 firstObject];

  return (HFServiceLikeItem *)v3;
}

- (id)buildersForActivating:(BOOL)a3 inHome:(id)a4 withContext:(id)a5 serviceLikeItems:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  objc_opt_class();
  v13 = [(HUAvailableTriggerItem *)self recommendationItem];
  v14 = [v13 recommendation];
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    v17 = [MEMORY[0x1E4F1CA48] array];
    v18 = [MEMORY[0x1E4F1CA48] array];
    if (v8)
    {
      v19 = [v16 selectedTriggerBuilder];
      v20 = [v19 triggerBuilderWithContext:v11];

      [v20 setEnabled:1];
      objc_msgSend(v17, "na_safeAddObject:", v20);
      v21 = [v10 triggers];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __84__HUAvailableTriggerItem_buildersForActivating_inHome_withContext_serviceLikeItems___block_invoke;
      v34[3] = &unk_1E6391350;
      id v35 = v10;
      id v36 = v11;
      id v37 = v16;
      v22 = objc_msgSend(v21, "na_filter:", v34);

      [v18 addObjectsFromArray:v22];
    }
    else
    {
      v23 = [v10 triggers];
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __84__HUAvailableTriggerItem_buildersForActivating_inHome_withContext_serviceLikeItems___block_invoke_2;
      v30 = &unk_1E6391350;
      id v31 = v10;
      id v32 = v11;
      id v33 = v16;
      v24 = objc_msgSend(v23, "na_filter:", &v27);

      objc_msgSend(v18, "addObjectsFromArray:", v24, v27, v28, v29, v30);
      v20 = v31;
    }

    if ([v18 count])
    {
      v25 = [(HUAvailableTriggerItem *)self removalTriggerBuildersForTriggers:v18 home:v10 context:v11 relatedItems:v12];
      [v17 addObjectsFromArray:v25];
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

uint64_t __84__HUAvailableTriggerItem_buildersForActivating_inHome_withContext_serviceLikeItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEnabled])
  {
    uint64_t v4 = 0;
  }
  else
  {
    v5 = [MEMORY[0x1E4F696C0] triggerBuilderForTrigger:v3 inHome:*(void *)(a1 + 32) context:*(void *)(a1 + 40) assertsFailure:0];
    if (v5)
    {
      v6 = [*(id *)(a1 + 48) compareForMatchingToTrigger:v5];
      uint64_t v4 = [v6 hasNoDifferencesHigherThanPriority:0];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

uint64_t __84__HUAvailableTriggerItem_buildersForActivating_inHome_withContext_serviceLikeItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F696C0] triggerBuilderForTrigger:a2 inHome:*(void *)(a1 + 32) context:*(void *)(a1 + 40) assertsFailure:0];
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 48) compareForMatchingToTrigger:v3];
    uint64_t v5 = [v4 hasNoDifferencesHigherThanPriority:0];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)removalTriggerBuildersForTriggers:(id)a3 home:(id)a4 context:(id)a5 relatedItems:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __86__HUAvailableTriggerItem_removalTriggerBuildersForTriggers_home_context_relatedItems___block_invoke;
  v17[3] = &unk_1E63913A0;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  v15 = objc_msgSend(a3, "na_map:", v17);

  return v15;
}

id __86__HUAvailableTriggerItem_removalTriggerBuildersForTriggers_home_context_relatedItems___block_invoke(void *a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F696C0] triggerBuilderForTrigger:a2 inHome:a1[4] context:a1[5]];
  uint64_t v4 = (void *)a1[6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__HUAvailableTriggerItem_removalTriggerBuildersForTriggers_home_context_relatedItems___block_invoke_2;
  v7[3] = &unk_1E6391378;
  id v5 = v3;
  id v8 = v5;
  objc_msgSend(v4, "na_each:", v7);

  return v5;
}

uint64_t __86__HUAvailableTriggerItem_removalTriggerBuildersForTriggers_home_context_relatedItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeServiceLikeItem:a2];
}

- (BOOL)isActive
{
  id v3 = [(HUAvailableTriggerItem *)self activeValue];

  if (v3)
  {
    uint64_t v4 = [(HUAvailableTriggerItem *)self activeValue];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    v6 = [(HUAvailableTriggerItem *)self latestResults];
    uint64_t v4 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];

    if (v4) {
      char v5 = [v4 integerValue] == 2;
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (void)setActive:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HUAvailableTriggerItem *)self setActiveValue:v4];
}

- (HFTriggerItem)triggerItem
{
  objc_opt_class();
  id v3 = [(HUAvailableTriggerItem *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return (HFTriggerItem *)v5;
}

- (HRERecommendationItem)recommendationItem
{
  objc_opt_class();
  id v3 = [(HUAvailableTriggerItem *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return (HRERecommendationItem *)v5;
}

- (NSString)identifier
{
  v2 = [(HUAvailableTriggerItem *)self sourceItem];
  id v3 = [v2 identifier];

  return (NSString *)v3;
}

- (HMTrigger)trigger
{
  v2 = [(HUAvailableTriggerItem *)self sourceItem];
  id v3 = [v2 trigger];

  return (HMTrigger *)v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_opt_class();
  v6 = [(HUAvailableTriggerItem *)self recommendationItem];
  v7 = [v6 recommendation];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [(HUAvailableTriggerItem *)self sourceItem];

  if (!v10)
  {
    id v19 = (void *)MEMORY[0x1E4F7A0D8];
    id v18 = [MEMORY[0x1E4F69228] outcomeWithResults:MEMORY[0x1E4F1CC08]];
    id v20 = [v19 futureWithResult:v18];
    goto LABEL_12;
  }
  id v11 = [v4 objectForKeyedSubscript:@"shallow"];
  if (([v11 BOOLValue] & 1) == 0)
  {

    goto LABEL_10;
  }
  id v12 = [(HUAvailableTriggerItem *)self sourceItem];
  id v13 = [v12 latestResults];
  uint64_t v14 = [v13 count];

  if (!v14)
  {
LABEL_10:
    id v16 = (void *)[v4 mutableCopy];
    [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68D80]];
    v17 = [(HUAvailableTriggerItem *)self sourceItem];
    v21 = [v17 updateWithOptions:v16];
    id v18 = [v21 flatMap:&__block_literal_global_261];

    goto LABEL_11;
  }
  v15 = (void *)MEMORY[0x1E4F7A0D8];
  id v16 = [(HUAvailableTriggerItem *)self sourceItem];
  v17 = [v16 latestResults];
  id v18 = [v15 futureWithResult:v17];
LABEL_11:

  [(HUAvailableTriggerItem *)self _updateNaturalLanguageOptions];
  v22 = [(HUAvailableTriggerItem *)self triggerNaturalLanguageOptions];
  v23 = (void *)[v22 copy];

  v24 = (void *)MEMORY[0x1E4F696E0];
  v25 = [(HUAvailableTriggerItem *)self triggerNaturalLanguageOptions];
  v26 = [v24 detailOptionsWithOptions:v25];

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_2;
  v30[3] = &unk_1E6391410;
  id v31 = v5;
  id v32 = self;
  id v33 = v9;
  id v34 = v23;
  id v35 = v26;
  id v27 = v23;
  id v28 = v26;
  id v20 = [v18 flatMap:v30];

LABEL_12:

  return v20;
}

id __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  id v3 = [a2 results];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

id __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_2(id *a1, uint64_t a2)
{
  [a1[4] addEntriesFromDictionary:a2];
  uint64_t v3 = *MEMORY[0x1E4F68908];
  id v4 = [a1[4] objectForKeyedSubscript:*MEMORY[0x1E4F68908]];
  id v5 = (void *)[v4 mutableCopy];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA80] set];
  }
  id v8 = v7;

  id v9 = [a1[5] relatedServiceLikeItems];
  id v10 = objc_msgSend(v9, "na_map:", &__block_literal_global_20_4);
  [v8 addObjectsFromArray:v10];

  id v11 = [a1[5] triggerItem];
  if (v11)
  {
  }
  else
  {
    id v12 = [a1[5] recommendationItem];
    id v13 = [v12 recommendation];
    uint64_t v14 = objc_msgSend(v13, "hu_triggerBuilderIfAny");
    v15 = [v14 trigger];

    if (!v15) {
      goto LABEL_8;
    }
  }
  id v16 = [a1[5] trigger];
  [v8 addObject:v16];

LABEL_8:
  [a1[4] setObject:v8 forKeyedSubscript:v3];
  v17 = [a1[5] recommendationItem];

  if (v17)
  {
    [a1[6] containsMeaningfulChanges];
    id v18 = [a1[5] activeValue];

    if (v18)
    {
      id v19 = [a1[5] activeValue];
      [v19 BOOLValue];
    }
    v24 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
    [a1[4] setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

    v25 = NSNumber;
    v26 = [a1[5] home];
    id v27 = objc_msgSend(v25, "numberWithInt:", objc_msgSend(v26, "hf_userCanCreateTrigger") ^ 1);
    [a1[4] setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

    v21 = [a1[7] actionNaturalLanguageOptions];
    [v21 setIgnoreOptionalCharacteristics:1];
  }
  else
  {
    id v20 = [a1[5] triggerItem];

    if (!v20) {
      goto LABEL_18;
    }
    v21 = [a1[5] trigger];
    if ([v21 isEnabled]) {
      v22 = @"HUSmartAutomationTriggerEnabledValueText";
    }
    else {
      v22 = @"HUSmartAutomationTriggerDisabledValueText";
    }
    v23 = _HULocalizedStringWithDefaultValue(v22, v22, 1);
    [a1[4] setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F68990]];
  }
LABEL_18:
  id v28 = [a1[4] objectForKeyedSubscript:*MEMORY[0x1E4F68C38]];
  [a1[7] setFormattingStyle:1];
  [a1[8] setFormattingStyle:3];
  [a1[8] setShouldUseFullDayNames:1];
  if ([v28 triggerNameIsConfigured])
  {
    v29 = [v28 triggerName];
  }
  else
  {
    v29 = 0;
  }
  v30 = [a1[5] recommendationItem];

  if (v30)
  {
    [a1[7] setShouldUseFirstPersonPronounIfPossible:1];
    if (v29)
    {
      id v31 = v29;
    }
    else
    {
      id v33 = [a1[6] selectedTriggerBuilder];
      id v31 = [v33 naturalLanguageNameWithOptions:a1[7]];
    }
    id v34 = [a1[6] selectedTriggerBuilder];
    uint64_t v35 = [v34 naturalLanguageDetailsWithOptions:a1[8]];
LABEL_37:
    v41 = (void *)v35;
LABEL_38:

    goto LABEL_39;
  }
  id v32 = [a1[5] triggerItem];

  if (v32)
  {
    if (v29)
    {
      id v31 = v29;
    }
    else
    {
      v40 = [a1[5] trigger];
      objc_msgSend(v40, "hf_naturalLanguageNameWithOptions:", a1[7]);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v34 = [a1[5] trigger];
    uint64_t v35 = objc_msgSend(v34, "hf_naturalLangugeDetailsWithOptions:", a1[8]);
    goto LABEL_37;
  }
  id v36 = [a1[5] trigger];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_opt_class();
    v38 = [a1[5] trigger];
    if (objc_opt_isKindOfClass()) {
      v39 = v38;
    }
    else {
      v39 = 0;
    }
    id v34 = v39;

    if (v29)
    {
      id v31 = v29;
    }
    else
    {
      v72 = (void *)MEMORY[0x1E4F2E7A8];
      id v73 = a1[7];
      v74 = [v34 events];
      v75 = objc_msgSend(v34, "hf_effectiveRecurrences");
      objc_msgSend(v72, "hf_naturalLanguageNameWithOptions:events:recurrences:", v73, v74, v75);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    v76 = [a1[5] trigger];
    v41 = objc_msgSend(v76, "hf_naturalLangugeDetailsWithOptions:", a1[8]);

    goto LABEL_38;
  }
  id v31 = 0;
  v41 = 0;
LABEL_39:
  if ([v31 length])
  {
    [a1[4] setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    uint64_t v42 = [v41 length];
    id v43 = a1[4];
    if (v42) {
      [v43 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F68980]];
    }
    else {
      [v43 removeObjectForKey:*MEMORY[0x1E4F68980]];
    }
  }
  uint64_t v44 = *MEMORY[0x1E4F689E8];
  v45 = [a1[4] objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];
  v78 = v8;
  if (v45)
  {
    [a1[4] setObject:v45 forKeyedSubscript:v44];
  }
  else
  {
    id v46 = objc_alloc(MEMORY[0x1E4F691D0]);
    v47 = (void *)[v46 initWithImageIdentifier:*MEMORY[0x1E4F685D0]];
    [a1[4] setObject:v47 forKeyedSubscript:v44];
  }
  uint64_t v48 = *MEMORY[0x1E4F688E0];
  v49 = [a1[4] objectForKeyedSubscript:*MEMORY[0x1E4F688E0]];
  v50 = (void *)[v49 mutableCopy];
  v51 = v50;
  v77 = v41;
  if (v50) {
    id v52 = v50;
  }
  else {
    id v52 = (id)objc_opt_new();
  }
  v53 = v52;

  v54 = [a1[5] sourceItem];
  [v53 addObject:v54];

  [a1[4] setObject:v53 forKeyedSubscript:v48];
  objc_opt_class();
  v55 = [a1[5] latestResults];
  v56 = [v55 objectForKeyedSubscript:v48];
  if (objc_opt_isKindOfClass()) {
    v57 = v56;
  }
  else {
    v57 = 0;
  }
  if (v57)
  {
    id v58 = v56;
  }
  else
  {
    id v58 = [MEMORY[0x1E4F1CAD0] set];
  }
  v59 = v58;
  v60 = v31;

  v61 = [a1[5] sourceItem];
  int v62 = [v59 containsObject:v61];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_4;
  aBlock[3] = &unk_1E6388F60;
  id v63 = a1[4];
  id v64 = a1[5];
  id v80 = v63;
  id v81 = v64;
  v65 = _Block_copy(aBlock);
  v66 = v65;
  if (v62 && !(*((unsigned int (**)(void *))v65 + 2))(v65)) {
    uint64_t v67 = 0;
  }
  else {
    uint64_t v67 = 2;
  }
  v68 = (void *)MEMORY[0x1E4F7A0D8];
  v69 = (void *)[objc_alloc(MEMORY[0x1E4F69228]) initWithResults:a1[4] type:v67];
  v70 = [v68 futureWithResult:v69];

  return v70;
}

uint64_t __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 homeKitObject];
}

uint64_t __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1)
{
  if (_MergedGlobals_4_8 != -1) {
    dispatch_once(&_MergedGlobals_4_8, &__block_literal_global_35_3);
  }
  id v2 = (id)qword_1EA12E190;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_7;
  id v12 = &unk_1E63913E8;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v13 = v3;
  uint64_t v14 = v4;
  id v5 = objc_msgSend(v2, "na_map:", &v9);
  v6 = objc_msgSend(v5, "mutableCopy", v9, v10, v11, v12);

  uint64_t v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_40_2);
  return v7;
}

void __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_6()
{
  v4[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F68980];
  v4[0] = *MEMORY[0x1E4F68AB8];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F68A08];
  v4[2] = *MEMORY[0x1E4F68BC0];
  v4[3] = v1;
  v4[4] = *MEMORY[0x1E4F68B10];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  id v3 = (void *)qword_1EA12E190;
  qword_1EA12E190 = v2;
}

id __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  v6 = [v4 objectForKeyedSubscript:v5];
  uint64_t v7 = [*(id *)(a1 + 40) latestResults];
  id v8 = [v7 objectForKeyedSubscript:v5];

  id v9 = v6;
  id v10 = v8;
  if (v9 == v10)
  {
    uint64_t v11 = 0;
  }
  else if (v9)
  {
    uint64_t v11 = [v9 isEqual:v10] ^ 1;
  }
  else
  {
    uint64_t v11 = 1;
  }

  id v12 = [v3 numberWithInt:v11];

  return v12;
}

uint64_t __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 BOOLValue];
}

- (void)_updateNaturalLanguageOptions
{
  id v3 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v4 = [(HUAvailableTriggerItem *)self triggerItem];

  if (v4)
  {
    id v5 = [(HUAvailableTriggerItem *)self trigger];
    uint64_t v6 = objc_msgSend(v5, "hf_anonymousActions");
  }
  else
  {
    uint64_t v7 = [(HUAvailableTriggerItem *)self recommendationItem];

    if (!v7) {
      goto LABEL_6;
    }
    id v8 = [(HUAvailableTriggerItem *)self recommendationItem];
    id v5 = [v8 recommendation];

    id v9 = [v5 triggerBuilders];
    id v10 = [v9 allObjects];

    uint64_t v11 = objc_msgSend(v10, "na_flatMap:", &__block_literal_global_45_3);
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];

    id v3 = v10;
  }

  id v3 = (void *)v6;
LABEL_6:
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __55__HUAvailableTriggerItem__updateNaturalLanguageOptions__block_invoke_4;
  v27[3] = &unk_1E6391478;
  v27[4] = self;
  id v12 = objc_msgSend(v3, "na_filter:", v27);
  if ([v12 count]) {
    id v13 = v12;
  }
  else {
    id v13 = v3;
  }
  id v14 = v13;
  v15 = [(HUAvailableTriggerItem *)self triggerNaturalLanguageOptions];

  if (v15)
  {
    id v16 = [v14 allObjects];
    v17 = [(HUAvailableTriggerItem *)self triggerNaturalLanguageOptions];
    [v17 setActions:v16];
  }
  else
  {
    id v18 = objc_alloc(MEMORY[0x1E4F696E8]);
    id v16 = [(HUAvailableTriggerItem *)self home];
    v17 = [v14 allObjects];
    id v19 = (void *)[v18 initWithHome:v16 nameType:2 actions:v17];
    [(HUAvailableTriggerItem *)self setTriggerNaturalLanguageOptions:v19];
  }
  id v20 = (void *)MEMORY[0x1E4F1CAD0];
  v21 = [(HUAvailableTriggerItem *)self relatedServiceLikeItems];
  v22 = [v20 setWithArray:v21];
  v23 = objc_msgSend(v22, "na_flatMap:", &__block_literal_global_57_2);

  v24 = [(HUAvailableTriggerItem *)self triggerNaturalLanguageOptions];
  [v24 setObjectsInContext:v23];

  v25 = [(HUAvailableTriggerItem *)self triggerNaturalLanguageOptions];
  v26 = [v25 actionNaturalLanguageOptions];
  [v26 setObjectsInContext:v23];
}

id __55__HUAvailableTriggerItem__updateNaturalLanguageOptions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 triggerActionSets];
  id v3 = [v2 anonymousActionBuilder];
  uint64_t v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_48_0);
  id v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_51_0);

  return v5;
}

uint64_t __55__HUAvailableTriggerItem__updateNaturalLanguageOptions__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 createNewAction];
}

BOOL __55__HUAvailableTriggerItem__updateNaturalLanguageOptions__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

uint64_t __55__HUAvailableTriggerItem__updateNaturalLanguageOptions__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) relatedServiceLikeItems];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__HUAvailableTriggerItem__updateNaturalLanguageOptions__block_invoke_5;
  v8[3] = &unk_1E6390E70;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __55__HUAvailableTriggerItem__updateNaturalLanguageOptions__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hf_isServiceLikeItemInvolved:", a2);
}

id __55__HUAvailableTriggerItem__updateNaturalLanguageOptions__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 homeKitObject];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = [v2 homeKitObject];
    uint64_t v7 = objc_msgSend(v6, "hf_accessoryLikeObject");
    id v8 = [v5 setWithObject:v7];

LABEL_5:
    goto LABEL_7;
  }
  id v9 = [v2 homeKitObject];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v6 = [v2 homeKitObject];
    id v8 = objc_msgSend(v6, "hf_accessoryLikeObjects");
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

- (HMHome)home
{
  return self->_home;
}

- (HUTriggerLikeItem)sourceItem
{
  return self->_sourceItem;
}

- (NSDictionary)naturalLanguageTitleOptions
{
  return self->_naturalLanguageTitleOptions;
}

- (void)setNaturalLanguageTitleOptions:(id)a3
{
}

- (NSArray)relatedServiceLikeItems
{
  return self->_relatedServiceLikeItems;
}

- (void)setRelatedServiceLikeItems:(id)a3
{
}

- (NSNumber)activeValue
{
  return self->_activeValue;
}

- (void)setActiveValue:(id)a3
{
}

- (HFTriggerNaturalLanguageOptions)triggerNaturalLanguageOptions
{
  return self->_triggerNaturalLanguageOptions;
}

- (void)setTriggerNaturalLanguageOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerNaturalLanguageOptions, 0);
  objc_storeStrong((id *)&self->_activeValue, 0);
  objc_storeStrong((id *)&self->_relatedServiceLikeItems, 0);
  objc_storeStrong((id *)&self->_naturalLanguageTitleOptions, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end