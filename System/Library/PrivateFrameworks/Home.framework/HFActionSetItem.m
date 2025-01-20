@interface HFActionSetItem
+ (BOOL)_value:(id)a3 isApproximatelyEqualToValue:(id)a4 forMinimumValue:(id)a5 maximumValue:(id)a6;
+ (id)_primaryStateForActionSet:(id)a3 valueSource:(id)a4 logger:(id)a5 fastInitialUpdate:(BOOL)a6;
+ (id)_valuesAtTargetStateForCharacteristics:(id)a3 targetValuesKeyedByCharacteristicIdentifier:(id)a4 valueSource:(id)a5 actionSet:(id)a6 logger:(id)a7;
+ (id)_valuesAtTargetStateForMatterActions:(id)a3;
+ (id)_valuesAtTargetStateForMediaActions:(id)a3 targetValuesKeyedByCharacteristicIdentifier:(id)a4 valueSource:(id)a5 actionSet:(id)a6 logger:(id)a7;
+ (id)_valuesAtTargetStateForNaturalLightActions:(id)a3 valueSource:(id)a4;
- (HFActionSetItem)init;
- (HFActionSetItem)initWithActionSet:(id)a3 actionSetItemStyle:(unint64_t)a4 valueSource:(id)a5;
- (HFCharacteristicValueSource)valueSource;
- (HFServiceLikeItem)serviceLikeItem;
- (HMActionSet)actionSet;
- (NSString)description;
- (id)_mostCommonRoomForActionSet:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)actionSetOperation:(id)a3 errorFromError:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)executeActionSet;
- (id)rooms;
- (id)turnOffActionSet;
- (unint64_t)_effectiveLoadingStateForSuggestedLoadingState:(unint64_t)a3;
- (unint64_t)actionSetItemStyle;
- (void)setServiceLikeItem:(id)a3;
@end

@implementation HFActionSetItem

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HFActionSetItem *)self actionSet];
  v7 = objc_msgSend(v6, "hf_prettyDescription");
  v8 = [(HFItem *)self latestResults];
  v9 = [v3 stringWithFormat:@"<%@: %p, \"%@\" %@>", v5, self, v7, v8];

  return (NSString *)v9;
}

uint64_t __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke()
{
  return [MEMORY[0x263EFF9C0] set];
}

uint64_t __47__HFActionSetItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 characteristic];
    uint64_t v4 = [v3 requiresDeviceUnlock];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id __131__HFActionSetItem__valuesAtTargetStateForCharacteristics_targetValuesKeyedByCharacteristicIdentifier_valueSource_actionSet_logger___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v34 = a2;
  id obj = [v34 allCharacteristics];
  uint64_t v35 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (!v35)
  {
    uint64_t v32 = 0;
    goto LABEL_25;
  }
  uint64_t v32 = 0;
  uint64_t v33 = *(void *)v38;
  *(void *)&long long v3 = 138413058;
  long long v30 = v3;
  do
  {
    uint64_t v4 = 0;
    do
    {
      if (*(void *)v38 != v33) {
        objc_enumerationMutation(obj);
      }
      v5 = *(void **)(*((void *)&v37 + 1) + 8 * v4);
      v6 = objc_msgSend(v5, "characteristicType", v30);
      v7 = [v34 responseForCharacteristicType:v6];
      v8 = [v7 value];

      v9 = *(void **)(a1 + 32);
      v10 = [v5 uniqueIdentifier];
      v11 = [v9 objectForKeyedSubscript:v10];

      if (v11)
      {
        if (!v8) {
          goto LABEL_12;
        }
      }
      else
      {
        NSLog(&cfstr_WeGotAReadResp.isa);
        if (!v8) {
          goto LABEL_12;
        }
      }
      v12 = *(void **)(a1 + 56);
      v13 = [v5 metadata];
      v14 = [v13 minimumValue];
      v15 = [v5 metadata];
      v16 = [v15 maximumValue];
      LODWORD(v12) = [v12 _value:v8 isApproximatelyEqualToValue:v11 forMinimumValue:v14 maximumValue:v16];

      if (v12)
      {
        ++v32;
        goto LABEL_17;
      }
LABEL_12:
      if (*(unsigned char *)(a1 + 64))
      {
        v17 = *(void **)(a1 + 40);
        if (v17)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          v18 = [v17 loggerActivity];
          os_activity_scope_enter(v18, &state);

          v19 = HFLogForCategory(0x2AuLL);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = [*(id *)(a1 + 48) name];
            v21 = objc_msgSend(v5, "hf_prettyDescription");
            *(_DWORD *)buf = v30;
            v42 = v20;
            __int16 v43 = 2112;
            v44 = v11;
            __int16 v45 = 2112;
            v46 = v8;
            __int16 v47 = 2112;
            v48 = v21;
            _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" isn't on because targetValue = %@, but readValue = %@ for characteristic %@", buf, 0x2Au);
          }
          os_activity_scope_leave(&state);
        }
        else
        {
          v22 = HFLogForCategory(0x2AuLL);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = [*(id *)(a1 + 48) name];
            v24 = objc_msgSend(v5, "hf_prettyDescription");
            *(_DWORD *)buf = v30;
            v42 = v23;
            __int16 v43 = 2112;
            v44 = v11;
            __int16 v45 = 2112;
            v46 = v8;
            __int16 v47 = 2112;
            v48 = v24;
            _os_log_impl(&dword_20B986000, v22, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" isn't on because targetValue = %@, but readValue = %@ for characteristic %@", buf, 0x2Au);
          }
        }
      }
LABEL_17:

      ++v4;
    }
    while (v35 != v4);
    uint64_t v25 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
    uint64_t v35 = v25;
  }
  while (v25);
LABEL_25:

  v26 = (void *)MEMORY[0x263F58190];
  v27 = [NSNumber numberWithInteger:v32];
  v28 = [v26 futureWithResult:v27];

  return v28;
}

+ (BOOL)_value:(id)a3 isApproximatelyEqualToValue:(id)a4 forMinimumValue:(id)a5 maximumValue:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  objc_opt_class();
  id v13 = v11;
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  objc_opt_class();
  id v16 = v12;
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  if (v15) {
    BOOL v19 = v18 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19) {
    goto LABEL_21;
  }
  objc_opt_class();
  id v20 = v9;
  if (objc_opt_isKindOfClass()) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  id v22 = v21;

  objc_opt_class();
  id v23 = v10;
  if (objc_opt_isKindOfClass()) {
    v24 = v23;
  }
  else {
    v24 = 0;
  }
  id v25 = v24;

  if (!v22 || !v25)
  {

LABEL_21:
    char v33 = [v9 isEqual:v10];
    goto LABEL_22;
  }
  [v22 floatValue];
  float v27 = v26;
  [v25 floatValue];
  float v29 = vabds_f32(v27, v28);
  [v18 floatValue];
  float v31 = v30;
  [v15 floatValue];
  char v33 = v29 <= (float)((float)(v31 - v32) * 0.02);

LABEL_22:
  return v33;
}

id __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        id v10 = v9;
        if (objc_opt_isKindOfClass()) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }
        id v12 = v11;

        if (v12) {
          v6 += [v12 integerValue];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (v6 == *(void *)(a1 + 32)) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  v14 = (void *)MEMORY[0x263F58190];
  id v15 = [NSNumber numberWithInteger:v13];
  id v16 = [v14 futureWithResult:v15];

  return v16;
}

- (id)rooms
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F08760] set];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v4 = [(HFActionSetItem *)self actionSet];
  uint64_t v5 = [v4 actions];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    uint64_t v27 = *(void *)v41;
    do
    {
      uint64_t v9 = 0;
      uint64_t v28 = v7;
      do
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [v10 characteristic];
          id v12 = [v11 service];
          uint64_t v13 = [v12 accessory];
          v14 = [v13 room];
          objc_msgSend(v3, "na_safeAddObject:", v14);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_25;
          }
          id v11 = v10;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v12 = [v11 mediaProfiles];
          uint64_t v15 = [v12 countByEnumeratingWithState:&v36 objects:v45 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            id v29 = v11;
            uint64_t v30 = v9;
            uint64_t v17 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v37 != v17) {
                  objc_enumerationMutation(v12);
                }
                long long v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                long long v32 = 0u;
                long long v33 = 0u;
                long long v34 = 0u;
                long long v35 = 0u;
                long long v20 = [v19 accessories];
                uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v44 count:16];
                if (v21)
                {
                  uint64_t v22 = v21;
                  uint64_t v23 = *(void *)v33;
                  do
                  {
                    for (uint64_t j = 0; j != v22; ++j)
                    {
                      if (*(void *)v33 != v23) {
                        objc_enumerationMutation(v20);
                      }
                      id v25 = [*(id *)(*((void *)&v32 + 1) + 8 * j) room];
                      objc_msgSend(v3, "na_safeAddObject:", v25);
                    }
                    uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v44 count:16];
                  }
                  while (v22);
                }
              }
              uint64_t v16 = [v12 countByEnumeratingWithState:&v36 objects:v45 count:16];
            }
            while (v16);
            uint64_t v8 = v27;
            uint64_t v7 = v28;
            id v11 = v29;
            uint64_t v9 = v30;
          }
        }

LABEL_25:
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v7);
  }

  return v3;
}

- (unint64_t)_effectiveLoadingStateForSuggestedLoadingState:(unint64_t)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [(HFActionSetItem *)self actionSet];
  unint64_t v6 = [(HFActionSetItem *)self actionSetItemStyle];
  uint64_t v7 = [(HFActionSetItem *)self valueSource];
  uint64_t v8 = (void *)[v4 initWithActionSet:v5 actionSetItemStyle:v6 valueSource:v7];

  uint64_t v9 = [(HFActionSetItem *)self serviceLikeItem];
  [v8 setServiceLikeItem:v9];

  [v8 copyLatestResultsFromItem:self];
  return v8;
}

- (HFActionSetItem)initWithActionSet:(id)a3 actionSetItemStyle:(unint64_t)a4 valueSource:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HFActionSetItem;
  id v11 = [(HFActionSetItem *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_actionSet, a3);
    v12->_actionSetItemStyle = a4;
    objc_storeStrong((id *)&v12->_valueSource, a5);
  }

  return v12;
}

- (void)setServiceLikeItem:(id)a3
{
  if (self->_serviceLikeItem != a3)
  {
    id v4 = a3;
    uint64_t v5 = [HFActionSetValueSource alloc];
    unint64_t v6 = [(HFActionSetItem *)self actionSet];
    id v9 = [(HFActionSetValueSource *)v5 initWithActionSet:v6];

    uint64_t v7 = (HFServiceLikeItem *)[v4 copyWithValueSource:v9];
    serviceLikeItem = self->_serviceLikeItem;
    self->_serviceLikeItem = v7;
  }
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFActionSetItem *)self actionSet];
  unint64_t v6 = [v4 objectForKeyedSubscript:HFItemUpdateOptionLogger];
  uint64_t v7 = [v4 objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
  unsigned int v8 = [v7 BOOLValue];

  if (v5)
  {
    unsigned int v39 = v8;
    id v9 = objc_alloc_init(MEMORY[0x263F58190]);
    id v10 = objc_alloc_init(HFMutableItemUpdateOutcome);
    [(HFMutableItemUpdateOutcome *)v10 setObject:&unk_26C0F7B30 forKeyedSubscript:@"controlSummaryStyle"];
    id v11 = [v5 name];

    if (v11)
    {
      id v12 = [v5 name];
      [(HFMutableItemUpdateOutcome *)v10 setObject:v12 forKeyedSubscript:@"title"];
    }
    else
    {
      [(HFMutableItemUpdateOutcome *)v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
    }
    uint64_t v16 = [(HFActionSetItem *)self actionSet];
    uint64_t v17 = objc_msgSend(v16, "hf_iconDescriptor");

    if (v17) {
      [(HFMutableItemUpdateOutcome *)v10 setObject:v17 forKeyedSubscript:@"icon"];
    }
    long long v40 = v6;
    long long v18 = [(HFActionSetItem *)self actionSet];
    long long v19 = objc_msgSend(v18, "hf_iconTintColor");

    if (v19) {
      [(HFMutableItemUpdateOutcome *)v10 setObject:v19 forKeyedSubscript:@"tintColor"];
    }
    long long v20 = [(HFActionSetItem *)self _mostCommonRoomForActionSet:v5];
    uint64_t v21 = v20;
    if (v20)
    {
      uint64_t v22 = [v20 uniqueIdentifier];
      [(HFMutableItemUpdateOutcome *)v10 setObject:v22 forKeyedSubscript:@"roomIdentifier"];
    }
    uint64_t v23 = [v5 actions];
    uint64_t v24 = [v23 count];

    if (!v24) {
      [(HFMutableItemUpdateOutcome *)v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
    }
    id v25 = NSNumber;
    float v26 = [v5 actions];
    uint64_t v27 = objc_msgSend(v25, "numberWithBool:", objc_msgSend(v26, "na_any:", &__block_literal_global_221));
    [(HFMutableItemUpdateOutcome *)v10 setObject:v27 forKeyedSubscript:@"actionRequiresDeviceUnlock"];

    unint64_t v28 = [(HFActionSetItem *)self actionSetItemStyle];
    id v29 = &__unnamed_4;
    if (v28 - 1 >= 2)
    {
      if (!v28)
      {
        [(HFMutableItemUpdateOutcome *)v10 setObject:&unk_26C0F7B48 forKeyedSubscript:@"state"];
        [v9 finishWithResult:v10];
      }
    }
    else
    {
      uint64_t v30 = objc_opt_class();
      float v31 = [(HFActionSetItem *)self valueSource];
      long long v32 = [v30 _primaryStateForActionSet:v5 valueSource:v31 logger:v40 fastInitialUpdate:v39];
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_27;
      v50[3] = &unk_26409B750;
      v51 = v10;
      v52 = self;
      id v53 = v5;
      id v54 = v9;
      id v33 = (id)[v32 addCompletionBlock:v50];

      id v29 = (void *)&__unnamed_4;
    }
    uint64_t v44 = MEMORY[0x263EF8330];
    uint64_t v45 = v29[155];
    uint64_t v34 = v45;
    v46 = __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_2;
    uint64_t v47 = &unk_2640936B0;
    v48 = self;
    id v49 = v4;
    long long v35 = __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_2((uint64_t)&v44);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = v34;
    v41[2] = __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_3;
    v41[3] = &unk_26408D148;
    id v42 = v35;
    long long v43 = v10;
    long long v36 = v10;
    id v37 = v35;
    uint64_t v15 = [v9 flatMap:v41];

    unint64_t v6 = v40;
  }
  else
  {
    NSLog(&cfstr_ActionsetMustB.isa);
    uint64_t v13 = (void *)MEMORY[0x263F58190];
    objc_super v14 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    uint64_t v15 = [v13 futureWithError:v14];
  }
  return v15;
}

- (HMActionSet)actionSet
{
  return self->_actionSet;
}

- (unint64_t)actionSetItemStyle
{
  return self->_actionSetItemStyle;
}

id __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serviceLikeItem];

  if (v2)
  {
    id v3 = [HFActionSetBuilder alloc];
    id v4 = [*(id *)(a1 + 32) actionSet];
    uint64_t v5 = [*(id *)(a1 + 32) actionSet];
    unint64_t v6 = [v5 home];
    uint64_t v7 = [(HFActionSetBuilder *)v3 initWithExistingObject:v4 inHome:v6];

    unsigned int v8 = [[HFActionSetValueSource alloc] initWithActionSetBuilder:v7];
    id v9 = [HFServiceActionItem alloc];
    id v10 = [*(id *)(a1 + 32) actionSet];
    id v11 = [v10 home];
    id v12 = [*(id *)(a1 + 32) serviceLikeItem];
    uint64_t v13 = (void *)[v12 copyWithValueSource:v8];
    objc_super v14 = [(HFServiceActionItem *)v9 initWithHome:v11 containingItem:v13];

    uint64_t v15 = [*(id *)(a1 + 32) actionSet];
    uint64_t v16 = [v15 actions];
    [(HFServiceActionItem *)v14 setActions:v16];

    uint64_t v17 = (void *)[*(id *)(a1 + 40) mutableCopy];
    long long v18 = (void *)MEMORY[0x263EFFA08];
    long long v19 = [(HFAbstractBaseActionSetBuilder *)v7 actions];
    long long v20 = [v18 setWithArray:v19];
    [v17 setObject:v20 forKeyedSubscript:HFItemUpdateOptionActionBuilders];

    uint64_t v21 = (void *)[v17 copy];
    uint64_t v22 = [(HFItem *)v14 updateWithOptions:v21];
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x263F58190];
    uint64_t v24 = [HFItemUpdateOutcome alloc];
    uint64_t v7 = [(HFItemUpdateOutcome *)v24 initWithResults:MEMORY[0x263EFFA78]];
    uint64_t v22 = [v23 futureWithResult:v7];
  }

  return v22;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (id)_mostCommonRoomForActionSet:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HFActionSetItem *)self rooms];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = [v5 countForObject:v12];
        if (v13 > v8)
        {
          uint64_t v14 = v13;
          id v15 = v12;

          uint64_t v8 = v14;
          id v9 = v15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_27(id *a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (v15) {
    [a1[4] setObject:v15 forKeyedSubscript:@"state"];
  }
  uint64_t v6 = [a1[5] valueSource];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [a1[5] valueSource];
    id v9 = [v8 cachedErrorForExecutionOfActionSet:a1[6]];

    if (v9)
    {
      uint64_t v10 = _HFLocalizedStringWithDefaultValue(@"HFActionSetItemDescriptionExecutionFailure", @"HFActionSetItemDescriptionExecutionFailure", 1);

      if (v10)
      {
        [a1[4] setObject:v10 forKeyedSubscript:@"description"];
      }
    }
  }
  id v11 = [MEMORY[0x263EFF9C0] set];
  id v12 = objc_msgSend(a1[6], "hf_affectedCharacteristics");
  [v11 unionSet:v12];
  uint64_t v13 = objc_msgSend(a1[6], "hf_affectedMediaSessions");
  [v11 unionSet:v13];
  uint64_t v14 = objc_msgSend(a1[6], "hf_affectedProfiles");
  [v11 unionSet:v14];
  if ([v11 count]) {
    [a1[4] setObject:v11 forKeyedSubscript:@"dependentHomeKitObjects"];
  }
  [a1[7] finishWithResult:a1[4]];
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

+ (id)_primaryStateForActionSet:(id)a3 valueSource:(id)a4 logger:(id)a5 fastInitialUpdate:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v6)
  {
    uint64_t v13 = (void *)MEMORY[0x263F58190];
    uint64_t v14 = &unk_26C0F7B60;
LABEL_41:
    uint64_t v45 = [v13 futureWithResult:v14];
    goto LABEL_44;
  }
  id v15 = [v10 actions];
  uint64_t v16 = [v15 count];

  if (!v16)
  {
    uint64_t v13 = (void *)MEMORY[0x263F58190];
    uint64_t v14 = &unk_26C0F7B78;
    goto LABEL_41;
  }
  id v56 = a1;
  id v57 = v12;
  id v58 = v11;
  v63 = [MEMORY[0x263EFF9A0] dictionary];
  v62 = [MEMORY[0x263EFF9A0] dictionary];
  v64 = [MEMORY[0x263EFF980] array];
  v61 = [MEMORY[0x263EFF980] array];
  [MEMORY[0x263EFF980] array];
  v60 = id v59 = v10;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v17 = [v10 actions];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (!v18)
  {
    uint64_t v20 = 0;
    goto LABEL_43;
  }
  uint64_t v19 = v18;
  uint64_t v20 = 0;
  uint64_t v21 = *(void *)v68;
  do
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v68 != v21) {
        objc_enumerationMutation(v17);
      }
      uint64_t v23 = *(void **)(*((void *)&v67 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = v23;
        id v25 = [v24 characteristic];
        float v26 = [v25 service];
        uint64_t v27 = [v26 uniqueIdentifier];

        if (v25) {
          BOOL v28 = v27 == 0;
        }
        else {
          BOOL v28 = 1;
        }
        if (!v28)
        {
          id v29 = [v24 targetValue];

          if (v29)
          {
            v65 = objc_msgSend(v63, "na_objectForKey:withDefaultValue:", v27, &__block_literal_global_114_1);
            [v65 addObject:v25];
            uint64_t v30 = [v24 targetValue];
            [v25 uniqueIdentifier];
            uint64_t v31 = v19;
            uint64_t v32 = v21;
            uint64_t v33 = v20 + 1;
            v35 = uint64_t v34 = v17;
            [v62 setObject:v30 forKeyedSubscript:v35];

            long long v17 = v34;
            uint64_t v20 = v33;
            uint64_t v21 = v32;
            uint64_t v19 = v31;
          }
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          id v36 = v23;
          if (objc_opt_isKindOfClass()) {
            id v37 = v36;
          }
          else {
            id v37 = 0;
          }
          id v24 = v37;

          if ([v24 state]
            || ([v24 volume], long long v38 = objc_claimAutoreleasedReturnValue(), v38, v38))
          {
            unsigned int v39 = [v24 mediaProfiles];
            v20 += [v39 count];
          }
          [v64 addObject:v24];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            id v40 = v23;
            if (objc_opt_isKindOfClass()) {
              long long v41 = v40;
            }
            else {
              long long v41 = 0;
            }
            id v24 = v41;

            ++v20;
            id v42 = v61;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            objc_opt_class();
            id v43 = v23;
            if (objc_opt_isKindOfClass()) {
              uint64_t v44 = v43;
            }
            else {
              uint64_t v44 = 0;
            }
            id v24 = v44;

            ++v20;
            id v42 = v60;
          }
          [v42 addObject:v24];
        }
      }
    }
    uint64_t v19 = [v17 countByEnumeratingWithState:&v67 objects:v71 count:16];
  }
  while (v19);
LABEL_43:

  v46 = [MEMORY[0x263EFF980] array];
  uint64_t v47 = [v63 allValues];
  id v12 = v57;
  id v11 = v58;
  id v10 = v59;
  v48 = [v56 _valuesAtTargetStateForCharacteristics:v47 targetValuesKeyedByCharacteristicIdentifier:v62 valueSource:v58 actionSet:v59 logger:v57];
  [v46 addObjectsFromArray:v48];

  id v49 = [v56 _valuesAtTargetStateForMediaActions:v64 targetValuesKeyedByCharacteristicIdentifier:v62 valueSource:v58 actionSet:v59 logger:v57];
  [v46 addObjectsFromArray:v49];

  uint64_t v50 = [v56 _valuesAtTargetStateForNaturalLightActions:v61 valueSource:v58];
  [v46 addObjectsFromArray:v50];

  v51 = [v56 _valuesAtTargetStateForMatterActions:v60];
  [v46 addObjectsFromArray:v51];

  v52 = (void *)MEMORY[0x263F58190];
  id v53 = [MEMORY[0x263F581B8] immediateScheduler];
  id v54 = [v52 combineAllFutures:v46 ignoringErrors:1 scheduler:v53];
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke_2;
  v66[3] = &__block_descriptor_40_e27___NAFuture_16__0__NSArray_8l;
  v66[4] = v20;
  uint64_t v45 = [v54 flatMap:v66];

LABEL_44:
  return v45;
}

+ (id)_valuesAtTargetStateForNaturalLightActions:(id)a3 valueSource:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__HFActionSetItem__valuesAtTargetStateForNaturalLightActions_valueSource___block_invoke;
  v9[3] = &unk_26409B840;
  id v10 = v5;
  id v6 = v5;
  char v7 = objc_msgSend(a3, "na_map:", v9);

  return v7;
}

+ (id)_valuesAtTargetStateForMediaActions:(id)a3 targetValuesKeyedByCharacteristicIdentifier:(id)a4 valueSource:(id)a5 actionSet:(id)a6 logger:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __128__HFActionSetItem__valuesAtTargetStateForMediaActions_targetValuesKeyedByCharacteristicIdentifier_valueSource_actionSet_logger___block_invoke;
  v16[3] = &unk_26409B818;
  id v17 = v11;
  id v18 = v10;
  id v19 = a1;
  id v12 = v10;
  id v13 = v11;
  uint64_t v14 = objc_msgSend(a3, "na_flatMap:", v16);

  return v14;
}

+ (id)_valuesAtTargetStateForMatterActions:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_105_2);
}

+ (id)_valuesAtTargetStateForCharacteristics:(id)a3 targetValuesKeyedByCharacteristicIdentifier:(id)a4 valueSource:(id)a5 actionSet:(id)a6 logger:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = (void *)MEMORY[0x263EFF910];
  id v17 = a3;
  id v18 = [v16 date];
  id v19 = [v14 lastExecutionDate];
  [v18 timeIntervalSinceDate:v19];
  BOOL v21 = v20 < 60.0;

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __131__HFActionSetItem__valuesAtTargetStateForCharacteristics_targetValuesKeyedByCharacteristicIdentifier_valueSource_actionSet_logger___block_invoke;
  v28[3] = &unk_26409B7A0;
  id v29 = v13;
  id v30 = v12;
  id v32 = v14;
  id v33 = a1;
  BOOL v34 = v21;
  id v31 = v15;
  id v22 = v14;
  id v23 = v15;
  id v24 = v12;
  id v25 = v13;
  float v26 = objc_msgSend(v17, "na_map:", v28);

  return v26;
}

id __131__HFActionSetItem__valuesAtTargetStateForCharacteristics_targetValuesKeyedByCharacteristicIdentifier_valueSource_actionSet_logger___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) readValuesForCharacteristics:a2];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __131__HFActionSetItem__valuesAtTargetStateForCharacteristics_targetValuesKeyedByCharacteristicIdentifier_valueSource_actionSet_logger___block_invoke_2;
  v8[3] = &unk_26409B778;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 64);
  id v9 = v4;
  uint64_t v12 = v5;
  char v13 = *(unsigned char *)(a1 + 72);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v6 = [v3 flatMap:v8];

  return v6;
}

id __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_4;
  v4[3] = &unk_26408E470;
  v1 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v2 = [v1 flatMap:v4];

  return v2;
}

id __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"description"];

  if (!v4)
  {
    id v5 = [v3 objectForKeyedSubscript:@"description"];
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"description"];
  }
  id v6 = [MEMORY[0x263F58190] futureWithResult:*(void *)(a1 + 32)];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_actionSet, 0);
}

- (HFActionSetItem)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithActionSet_actionSetItemStyle_valueSource_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFActionSetItem.m", 70, @"%s is unavailable; use %@ instead",
    "-[HFActionSetItem init]",
    v5);

  return 0;
}

id __128__HFActionSetItem__valuesAtTargetStateForMediaActions_targetValuesKeyedByCharacteristicIdentifier_valueSource_actionSet_logger___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 mediaProfiles];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __128__HFActionSetItem__valuesAtTargetStateForMediaActions_targetValuesKeyedByCharacteristicIdentifier_valueSource_actionSet_logger___block_invoke_2;
  v8[3] = &unk_26409B7F0;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = *(void *)(a1 + 48);
  id v5 = v3;
  id v6 = objc_msgSend(v4, "na_map:", v8);

  return v6;
}

id __128__HFActionSetItem__valuesAtTargetStateForMediaActions_targetValuesKeyedByCharacteristicIdentifier_valueSource_actionSet_logger___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F58190];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __128__HFActionSetItem__valuesAtTargetStateForMediaActions_targetValuesKeyedByCharacteristicIdentifier_valueSource_actionSet_logger___block_invoke_3;
  v10[3] = &unk_26409B7C8;
  id v11 = v3;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v14 = v5;
  uint64_t v15 = v6;
  id v7 = v3;
  uint64_t v8 = [v4 futureWithBlock:v10];

  return v8;
}

void __128__HFActionSetItem__valuesAtTargetStateForMediaActions_targetValuesKeyedByCharacteristicIdentifier_valueSource_actionSet_logger___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 mediaSession];
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = objc_msgSend(v6, "loggerActivity", 0, 0);
    os_activity_scope_enter(v7, &v82);

    uint64_t v8 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 48) name];
      id v10 = objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
      *(_DWORD *)buf = 138412802;
      v84 = v9;
      __int16 v85 = 2112;
      v86 = v10;
      __int16 v87 = 2112;
      v88 = v5;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" media profile \"%@\" media session \"%@\"", buf, 0x20u);
    }
    os_activity_scope_leave(&v82);
  }
  else
  {
    v64 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = [*(id *)(a1 + 48) name];
      v66 = objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
      *(_DWORD *)buf = 138412802;
      v84 = v65;
      __int16 v85 = 2112;
      v86 = v66;
      __int16 v87 = 2112;
      v88 = v5;
      _os_log_impl(&dword_20B986000, v64, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" media profile \"%@\" media session \"%@\"", buf, 0x20u);
    }
  }
  id v11 = [*(id *)(a1 + 56) volume];

  if (v11)
  {
    id v12 = NSNumber;
    id v13 = [v5 audioControl];
    [v13 volume];
    id v14 = objc_msgSend(v12, "numberWithFloat:");

    uint64_t v15 = objc_opt_class();
    uint64_t v16 = NSNumber;
    id v17 = [*(id *)(a1 + 56) volume];
    [v17 floatValue];
    *(float *)&double v19 = v18 / 100.0;
    double v20 = [v16 numberWithFloat:v19];
    LOBYTE(v15) = [(id)v15 _value:v20 isApproximatelyEqualToValue:v14 forMinimumValue:&unk_26C0F8320 maximumValue:&unk_26C0F8330];

    if ((v15 & 1) == 0)
    {
      BOOL v34 = *(void **)(a1 + 40);
      if (v34)
      {
        long long v35 = objc_msgSend(v34, "loggerActivity", 0, 0);
        os_activity_scope_enter(v35, &v82);

        id v36 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          id v37 = [*(id *)(a1 + 48) name];
          long long v38 = objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
          unsigned int v39 = [*(id *)(a1 + 56) volume];
          *(_DWORD *)buf = 138413314;
          v84 = v37;
          __int16 v85 = 2112;
          v86 = v38;
          __int16 v87 = 2112;
          v88 = v5;
          __int16 v89 = 2112;
          v90 = v39;
          __int16 v91 = 2112;
          v92 = v14;
          _os_log_impl(&dword_20B986000, v36, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" media profile \"%@\" media session \"%@\" volume doesn't match (%@, %@)", buf, 0x34u);
        }
        os_activity_scope_leave(&v82);
        goto LABEL_24;
      }
      long long v67 = HFLogForCategory(0x2AuLL);
      if (!os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      long long v68 = [*(id *)(a1 + 48) name];
      v71 = objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
      uint64_t v72 = [*(id *)(a1 + 56) volume];
      *(_DWORD *)buf = 138413314;
      v84 = v68;
      __int16 v85 = 2112;
      v86 = v71;
      __int16 v87 = 2112;
      v88 = v5;
      __int16 v89 = 2112;
      v90 = v72;
      __int16 v91 = 2112;
      v92 = v14;
      _os_log_impl(&dword_20B986000, v67, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" media profile \"%@\" media session \"%@\" volume doesn't match (%@, %@)", buf, 0x34u);

      goto LABEL_52;
    }
  }
  if (![*(id *)(a1 + 56) state]) {
    goto LABEL_19;
  }
  uint64_t v21 = [*(id *)(a1 + 56) state];
  if (v21 == 1)
  {
    if ([v5 playbackState] == 1) {
      goto LABEL_13;
    }
LABEL_26:
    id v40 = *(void **)(a1 + 40);
    if (v40)
    {
      long long v41 = objc_msgSend(v40, "loggerActivity", 0, 0);
      os_activity_scope_enter(v41, &v82);

      id v42 = HFLogForCategory(0x2AuLL);
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:

LABEL_31:
        os_activity_scope_leave(&v82);
        goto LABEL_32;
      }
      id v43 = [*(id *)(a1 + 48) name];
      uint64_t v44 = objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
      uint64_t v45 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "state"));
      v46 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "playbackState"));
      *(_DWORD *)buf = 138413314;
      v84 = v43;
      __int16 v85 = 2112;
      v86 = v44;
      __int16 v87 = 2112;
      v88 = v5;
      __int16 v89 = 2112;
      v90 = v45;
      __int16 v91 = 2112;
      v92 = v46;
      _os_log_impl(&dword_20B986000, v42, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" media profile \"%@\" media session \"%@\" playback state doesn't match (%@, %@)", buf, 0x34u);

LABEL_29:
      goto LABEL_30;
    }
    id v14 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      long long v67 = [*(id *)(a1 + 48) name];
      long long v68 = objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
      long long v69 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "state"));
      long long v70 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "playbackState"));
      *(_DWORD *)buf = 138413314;
      v84 = v67;
      __int16 v85 = 2112;
      v86 = v68;
      __int16 v87 = 2112;
      v88 = v5;
      __int16 v89 = 2112;
      v90 = v69;
      __int16 v91 = 2112;
      v92 = v70;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" media profile \"%@\" media session \"%@\" playback state doesn't match (%@, %@)", buf, 0x34u);

LABEL_53:
LABEL_54:

      goto LABEL_24;
    }
    goto LABEL_24;
  }
  if (v21 != 2 || [v5 playbackState] == 1 || !objc_msgSend(v5, "playbackState")) {
    goto LABEL_26;
  }
LABEL_13:
  id v22 = [*(id *)(a1 + 56) playbackArchive];

  if (v22)
  {
    id v23 = [*(id *)(a1 + 56) playbackArchive];
    id v24 = [v23 playbackSessionIdentifier];
    id v25 = [v5 mediaUniqueIdentifier];
    char v26 = [v24 isEqualToString:v25];

    if (v26)
    {
      uint64_t v27 = [*(id *)(a1 + 56) playbackArchive];
      uint64_t v28 = [v27 BOOLValueForOption:1];

      uint64_t v29 = [v5 shuffleState];
      if ([v5 shuffleState] && ((v28 ^ (v29 == 1)) & 1) != 0)
      {
        id v30 = [*(id *)(a1 + 56) playbackArchive];
        uint64_t v31 = [v30 BOOLValueForOption:2];

        uint64_t v32 = [v5 repeatState];
        if ([v5 repeatState] && ((v31 ^ (v32 == 1)) & 1) != 0) {
          goto LABEL_19;
        }
        v62 = *(void **)(a1 + 40);
        if (v62)
        {
          v63 = objc_msgSend(v62, "loggerActivity", 0, 0);
          os_activity_scope_enter(v63, &v82);

          id v56 = HFLogForCategory(0x2AuLL);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            id v57 = [*(id *)(a1 + 48) name];
            id v58 = objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
            id v59 = [NSNumber numberWithBool:v31];
            v60 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "repeatState"));
            *(_DWORD *)buf = 138413314;
            v84 = v57;
            __int16 v85 = 2112;
            v86 = v58;
            __int16 v87 = 2112;
            v88 = v5;
            __int16 v89 = 2112;
            v90 = v59;
            __int16 v91 = 2112;
            v92 = v60;
            v61 = "Action set \"%@\" media profile \"%@\" media session \"%@\" repeat doesn't match (%@, %@)";
            goto LABEL_43;
          }
          goto LABEL_44;
        }
        v76 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          v77 = [*(id *)(a1 + 48) name];
          v78 = objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
          v79 = [NSNumber numberWithBool:v31];
          v80 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "repeatState"));
          *(_DWORD *)buf = 138413314;
          v84 = v77;
          __int16 v85 = 2112;
          v86 = v78;
          __int16 v87 = 2112;
          v88 = v5;
          __int16 v89 = 2112;
          v90 = v79;
          __int16 v91 = 2112;
          v92 = v80;
          v81 = "Action set \"%@\" media profile \"%@\" media session \"%@\" repeat doesn't match (%@, %@)";
          goto LABEL_61;
        }
      }
      else
      {
        id v54 = *(void **)(a1 + 40);
        if (v54)
        {
          v55 = objc_msgSend(v54, "loggerActivity", 0, 0);
          os_activity_scope_enter(v55, &v82);

          id v56 = HFLogForCategory(0x2AuLL);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            id v57 = [*(id *)(a1 + 48) name];
            id v58 = objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
            id v59 = [NSNumber numberWithBool:v28];
            v60 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "shuffleState"));
            *(_DWORD *)buf = 138413314;
            v84 = v57;
            __int16 v85 = 2112;
            v86 = v58;
            __int16 v87 = 2112;
            v88 = v5;
            __int16 v89 = 2112;
            v90 = v59;
            __int16 v91 = 2112;
            v92 = v60;
            v61 = "Action set \"%@\" media profile \"%@\" media session \"%@\" shuffle doesn't match (%@, %@)";
LABEL_43:
            _os_log_impl(&dword_20B986000, v56, OS_LOG_TYPE_DEFAULT, v61, buf, 0x34u);
          }
LABEL_44:

          goto LABEL_31;
        }
        v76 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          v77 = [*(id *)(a1 + 48) name];
          v78 = objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
          v79 = [NSNumber numberWithBool:v28];
          v80 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "shuffleState"));
          *(_DWORD *)buf = 138413314;
          v84 = v77;
          __int16 v85 = 2112;
          v86 = v78;
          __int16 v87 = 2112;
          v88 = v5;
          __int16 v89 = 2112;
          v90 = v79;
          __int16 v91 = 2112;
          v92 = v80;
          v81 = "Action set \"%@\" media profile \"%@\" media session \"%@\" shuffle doesn't match (%@, %@)";
LABEL_61:
          _os_log_impl(&dword_20B986000, v76, OS_LOG_TYPE_DEFAULT, v81, buf, 0x34u);
        }
      }

      goto LABEL_32;
    }
    v48 = *(void **)(a1 + 40);
    if (v48)
    {
      id v49 = objc_msgSend(v48, "loggerActivity", 0, 0);
      os_activity_scope_enter(v49, &v82);

      id v42 = HFLogForCategory(0x2AuLL);
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      id v43 = [*(id *)(a1 + 48) name];
      uint64_t v44 = objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
      uint64_t v50 = [*(id *)(a1 + 56) playbackArchive];
      v51 = [v50 playbackSessionIdentifier];
      v52 = [v5 mediaUniqueIdentifier];
      id v53 = [*(id *)(a1 + 56) playbackArchive];
      *(_DWORD *)buf = 138413570;
      v84 = v43;
      __int16 v85 = 2112;
      v86 = v44;
      __int16 v87 = 2112;
      v88 = v5;
      __int16 v89 = 2112;
      v90 = v51;
      __int16 v91 = 2112;
      v92 = v52;
      __int16 v93 = 2112;
      v94 = v53;
      _os_log_impl(&dword_20B986000, v42, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" media profile \"%@\" media session \"%@\" playback archive doesn't match (%@, %@). mediaAction.playbackArchive %@", buf, 0x3Eu);

      goto LABEL_29;
    }
    id v14 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      long long v67 = [*(id *)(a1 + 48) name];
      long long v68 = objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
      v71 = [*(id *)(a1 + 56) playbackArchive];
      v73 = [v71 playbackSessionIdentifier];
      v74 = [v5 mediaUniqueIdentifier];
      v75 = [*(id *)(a1 + 56) playbackArchive];
      *(_DWORD *)buf = 138413570;
      v84 = v67;
      __int16 v85 = 2112;
      v86 = v68;
      __int16 v87 = 2112;
      v88 = v5;
      __int16 v89 = 2112;
      v90 = v73;
      __int16 v91 = 2112;
      v92 = v74;
      __int16 v93 = 2112;
      v94 = v75;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" media profile \"%@\" media session \"%@\" playback archive doesn't match (%@, %@). mediaAction.playbackArchive %@", buf, 0x3Eu);

LABEL_52:
      goto LABEL_53;
    }
LABEL_24:

LABEL_32:
    uint64_t v33 = 0;
    goto LABEL_33;
  }
LABEL_19:
  uint64_t v33 = 1;
LABEL_33:
  uint64_t v47 = [NSNumber numberWithBool:v33];
  [v4 finishWithResult:v47];
}

id __74__HFActionSetItem__valuesAtTargetStateForNaturalLightActions_valueSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 isNaturalLightingEnabled];
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = &unk_26C111090;
  if ([v5 conformsToProtocol:v6]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = [v3 lightProfile];

  int v10 = [v8 isNaturalLightingEnabledForProfile:v9];
  id v11 = (void *)MEMORY[0x263F58190];
  id v12 = [NSNumber numberWithInt:v4 ^ v10 ^ 1u];
  id v13 = [v11 futureWithResult:v12];

  return v13;
}

id __56__HFActionSetItem__valuesAtTargetStateForMatterActions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = objc_msgSend(a2, "commands", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    LOBYTE(v6) = 1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        if (v6) {
          uint64_t v6 = [*(id *)(*((void *)&v12 + 1) + 8 * i) expectedValuesMatchCurrentState];
        }
        else {
          uint64_t v6 = 0;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v6 = 1;
  }

  id v8 = (void *)MEMORY[0x263F58190];
  id v9 = [NSNumber numberWithBool:v6];
  int v10 = [v8 futureWithResult:v9];

  return v10;
}

- (id)executeActionSet
{
  uint64_t v3 = [(HFActionSetItem *)self valueSource];
  char v4 = objc_opt_respondsToSelector();

  uint64_t v5 = (void *)MEMORY[0x263F58190];
  if (v4)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F58190]);
    objc_initWeak(&location, self);
    id v7 = [(HFActionSetItem *)self valueSource];
    id v8 = [(HFActionSetItem *)self actionSet];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __35__HFActionSetItem_executeActionSet__block_invoke;
    v12[3] = &unk_2640924E8;
    objc_copyWeak(&v14, &location);
    id v9 = v6;
    id v13 = v9;
    [v7 executeActionSet:v8 completionHandler:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    int v10 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 36);
    id v9 = [v5 futureWithError:v10];
  }
  return v9;
}

void __35__HFActionSetItem_executeActionSet__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v4 = WeakRetained;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v7)
  {
    id v6 = [WeakRetained actionSetOperation:@"HFOperationExecuteActionSet" errorFromError:v7];
    [v5 finishWithError:v6];
  }
  else
  {
    [v5 finishWithNoResult];
  }
}

- (id)turnOffActionSet
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v29 = [MEMORY[0x263EFF9C0] set];
  [MEMORY[0x263EFF9C0] set];
  v28 = uint64_t v27 = self;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v3 = [(HFActionSetItem *)self actionSet];
  char v4 = [v3 actions];

  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          id v11 = [v10 characteristic];
          long long v12 = [v10 targetValue];
          id v13 = objc_msgSend(MEMORY[0x263F0E248], "hf_powerStateCharacteristicTypes");
          id v14 = [v11 characteristicType];
          if ([v13 containsObject:v14])
          {
            int v15 = [v12 isEqual:MEMORY[0x263EFFA88]];

            if (v15) {
              [v29 addObject:v11];
            }
          }
          else
          {
          }
          goto LABEL_18;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        objc_opt_class();
        id v16 = v9;
        if (objc_opt_isKindOfClass()) {
          uint64_t v17 = v16;
        }
        else {
          uint64_t v17 = 0;
        }
        id v10 = v17;

        if ([v10 state] == 1)
        {
          id v11 = [v10 mediaProfiles];
          [v28 unionSet:v11];
LABEL_18:
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v6);
  }

  float v18 = [(HFActionSetItem *)v27 actionSet];
  double v19 = [v18 home];
  double v20 = objc_msgSend(v19, "hf_characteristicValueManager");

  uint64_t v21 = (void *)MEMORY[0x263F58190];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __35__HFActionSetItem_turnOffActionSet__block_invoke;
  v31[3] = &unk_264097100;
  id v32 = v29;
  id v33 = v28;
  id v34 = v20;
  long long v35 = v27;
  id v22 = v20;
  id v23 = v28;
  id v24 = v29;
  id v25 = [v21 futureWithBlock:v31];

  return v25;
}

void __35__HFActionSetItem_turnOffActionSet__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  char v4 = objc_msgSend(a1[4], "na_map:", &__block_literal_global_128);
  if ([a1[5] count])
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F0E510]) initWithMediaProfiles:a1[5] playbackState:2 volume:0 playbackArchive:0];
    uint64_t v6 = [v4 setByAddingObject:v5];

    char v4 = (void *)v6;
  }
  if ([v4 count])
  {
    [a1[6] beginTransactionWithReason:@"HFActionSetItemTransactionReasonCounterActionsExecution"];
    objc_initWeak(&location, a1[7]);
    uint64_t v7 = [a1[6] executeActions:v4];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __35__HFActionSetItem_turnOffActionSet__block_invoke_3;
    v9[3] = &unk_264090A28;
    objc_copyWeak(&v11, &location);
    id v10 = v3;
    id v8 = (id)[v7 addCompletionBlock:v9];

    [a1[6] commitTransactionWithReason:@"HFActionSetItemTransactionReasonCounterActionsExecution"];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    [v3 finishWithNoResult];
  }
}

id __35__HFActionSetItem_turnOffActionSet__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F0E290];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = (void *)[v4 initWithCharacteristic:v3 targetValue:MEMORY[0x263EFFA80]];

  return v5;
}

void __35__HFActionSetItem_turnOffActionSet__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = *(void **)(a1 + 32);
  id v9 = [WeakRetained actionSetOperation:@"HFOperationExecuteActionSet" errorFromError:v6];

  [v8 finishWithResult:v7 error:v9];
}

- (id)actionSetOperation:(id)a3 errorFromError:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v6)
  {
    id v7 = v6;
    id v8 = (void *)MEMORY[0x263EFF9A0];
    id v9 = a3;
    id v10 = [v8 dictionary];
    [v10 setObject:v9 forKeyedSubscript:@"HFErrorUserInfoOperationKey"];

    id v11 = [(HFItem *)self latestResults];
    long long v12 = [v11 objectForKeyedSubscript:@"title"];

    if (v12)
    {
      id v16 = @"HFErrorHandlerOptionFailedItemName";
      v17[0] = v12;
      id v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
      [v10 setObject:v13 forKeyedSubscript:@"HFErrorUserInfoOptionsKey"];
    }
    id v14 = objc_msgSend(v7, "hf_errorWithAddedUserInfo:", v10);
  }
  else
  {
    id v14 = 0;
  }
  return v14;
}

@end