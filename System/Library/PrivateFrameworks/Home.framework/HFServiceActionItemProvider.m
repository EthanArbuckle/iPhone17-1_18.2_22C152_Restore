@interface HFServiceActionItemProvider
- (BOOL)isMatterServiceActionItem:(id)a3 forAccessoryID:(id)a4;
- (HFActionSetBuilderProtocol)actionSetBuilder;
- (HFActionSetValueSource)valueSource;
- (HFActionSetValueSourceDelegate)actionSetValueSourceDelegate;
- (HFServiceActionItemProvider)init;
- (HFServiceActionItemProvider)initWithHome:(id)a3 actionSet:(id)a4;
- (HFServiceActionItemProvider)initWithHome:(id)a3 actionSetBuilder:(id)a4;
- (HMActionSet)actionSet;
- (HMHome)home;
- (NSMutableSet)actionItems;
- (id)_actionItemForAccessory:(id)a3 addedActionsItems:(id)a4 home:(id)a5;
- (id)_actionItemForCharacteristic:(id)a3 addedActionItems:(id)a4 home:(id)a5;
- (id)_actionItemForMediaProfile:(id)a3 addedActionItems:(id)a4 home:(id)a5;
- (id)_addOrUpdateActionItemWithAction:(id)a3 actionBuilder:(id)a4 addedActionItems:(id)a5 home:(id)a6;
- (id)_addOrUpdateActionItemWithMediaAction:(id)a3 mediaActionBuilder:(id)a4 addedActionItems:(id)a5 home:(id)a6;
- (id)_addOrUpdateMatterActionItemForAction:(id)a3 actionBuilder:(id)a4 addedActionsItems:(id)a5 home:(id)a6;
- (id)_createActionItemForCharacteristic:(id)a3 home:(id)a4;
- (id)_createActionItemForMediaProfile:(id)a3 home:(id)a4;
- (id)_createMatterActionItemFor:(id)a3 home:(id)a4 actionSetBuilder:(id)a5;
- (id)_findServiceActionForIdentifier:(id)a3 addedActionItems:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setActionItems:(id)a3;
- (void)setActionSet:(id)a3;
- (void)setActionSetBuilder:(id)a3;
- (void)setActionSetValueSourceDelegate:(id)a3;
- (void)setFilter:(id)a3;
- (void)setValueSource:(id)a3;
@end

@implementation HFServiceActionItemProvider

- (id)_createMatterActionItemFor:(id)a3 home:(id)a4 actionSetBuilder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id MatterbC03for4home16actionSetBuilderSo0abC0CSgSo11HMAccessoryC_So6HMHomeCSo08HFActionkL8Protocol_So06HFItemL0CySo08HMActionK0CGXctF_0 = _sSo27HFServiceActionItemProviderC4HomeE013_createMatterbC03for4home16actionSetBuilderSo0abC0CSgSo11HMAccessoryC_So6HMHomeCSo08HFActionkL8Protocol_So06HFItemL0CySo08HMActionK0CGXctF_0(v8, (uint64_t)v9, v10);

  return MatterbC03for4home16actionSetBuilderSo0abC0CSgSo11HMAccessoryC_So6HMHomeCSo08HFActionkL8Protocol_So06HFItemL0CySo08HMActionK0CGXctF_0;
}

- (BOOL)isMatterServiceActionItem:(id)a3 forAccessoryID:(id)a4
{
  uint64_t v6 = sub_20BCE65C0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20BCE6590();
  id v10 = a3;
  v11 = self;
  LOBYTE(self) = _sSo27HFServiceActionItemProviderC4HomeE015isMatterServicebC0_14forAccessoryIDSbSo0abC0C_10Foundation4UUIDVtF_0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (HFServiceActionItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_actionSet_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFServiceActionItemProvider.m", 39, @"%s is unavailable; use %@ instead",
    "-[HFServiceActionItemProvider init]",
    v5);

  return 0;
}

- (HFServiceActionItemProvider)initWithHome:(id)a3 actionSet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFServiceActionItemProvider;
  id v9 = [(HFItemProvider *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_actionSet, a4);
    v11 = [[HFActionSetValueSource alloc] initWithActionSet:v8];
    valueSource = v10->_valueSource;
    v10->_valueSource = v11;
  }
  return v10;
}

- (HFServiceActionItemProvider)initWithHome:(id)a3 actionSetBuilder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFServiceActionItemProvider;
  id v9 = [(HFItemProvider *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_actionSetBuilder, a4);
    v11 = [[HFActionSetValueSource alloc] initWithActionSetBuilder:v8];
    valueSource = v10->_valueSource;
    v10->_valueSource = v11;
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(HFServiceActionItemProvider *)self actionSet];

  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t v6 = [(HFServiceActionItemProvider *)self home];
  if (v4)
  {
    id v7 = [(HFServiceActionItemProvider *)self actionSet];
    uint64_t v8 = [v5 initWithHome:v6 actionSet:v7];
  }
  else
  {
    id v7 = [(HFServiceActionItemProvider *)self actionSetBuilder];
    uint64_t v8 = [v5 initWithHome:v6 actionSetBuilder:v7];
  }
  id v9 = (void *)v8;

  return v9;
}

- (HFActionSetValueSourceDelegate)actionSetValueSourceDelegate
{
  v2 = [(HFServiceActionItemProvider *)self valueSource];
  v3 = [v2 delegate];

  return (HFActionSetValueSourceDelegate *)v3;
}

- (void)setActionSetValueSourceDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HFServiceActionItemProvider *)self valueSource];
  [v5 setDelegate:v4];
}

- (id)reloadItems
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  v3 = [HFMutableSetDiff alloc];
  id v4 = [(HFServiceActionItemProvider *)self actionItems];
  id v5 = [(HFMutableSetDiff *)v3 initWithFromSet:v4];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__HFServiceActionItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_26409A1A0;
  aBlock[4] = self;
  v61 = v5;
  v90 = v61;
  v66 = _Block_copy(aBlock);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  uint64_t v6 = [(HFServiceActionItemProvider *)self actionItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v85 objects:v94 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v86;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v86 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        v12 = objc_msgSend(MEMORY[0x263EFFA08], "set", v61);
        [v11 setActions:v12];

        uint64_t v13 = [MEMORY[0x263EFFA08] set];
        [v11 setActionBuilders:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v85 objects:v94 count:16];
    }
    while (v8);
  }

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  objc_super v14 = [(HFServiceActionItemProvider *)self actionSet];
  v15 = [v14 actions];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v81 objects:v93 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v82;
    v62 = v79;
    v63 = v66 + 2;
    unint64_t v19 = 0x263F0E000uLL;
    do
    {
      uint64_t v20 = 0;
      uint64_t v64 = v17;
      do
      {
        if (*(void *)v82 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = *(void *)(*((void *)&v81 + 1) + 8 * v20);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v22 = [(HFSetDiff *)v61 additions];
          v23 = [(HFServiceActionItemProvider *)self home];
          v24 = [(HFServiceActionItemProvider *)self _addOrUpdateActionItemWithMediaAction:v21 mediaActionBuilder:0 addedActionItems:v22 home:v23];

          v78[0] = MEMORY[0x263EF8330];
          v78[1] = 3221225472;
          v79[0] = __42__HFServiceActionItemProvider_reloadItems__block_invoke_2;
          v79[1] = &unk_26409A1C8;
          v80 = v66;
          objc_msgSend(v24, "na_each:", v78);
        }
        else
        {
          uint64_t v25 = v18;
          unint64_t v26 = v19;
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          v28 = [(HFSetDiff *)v61 additions];
          v29 = [(HFServiceActionItemProvider *)self home];
          if (isKindOfClass) {
            [(HFServiceActionItemProvider *)self _addOrUpdateMatterActionItemForAction:v21 actionBuilder:0 addedActionsItems:v28 home:v29];
          }
          else {
          v24 = [(HFServiceActionItemProvider *)self _addOrUpdateActionItemWithAction:v21 actionBuilder:0 addedActionItems:v28 home:v29];
          }

          ((void (*)(void *, void *))v66[2])(v66, v24);
          unint64_t v19 = v26;
          uint64_t v18 = v25;
          uint64_t v17 = v64;
        }

        ++v20;
      }
      while (v17 != v20);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v81 objects:v93 count:16];
    }
    while (v17);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v30 = [(HFServiceActionItemProvider *)self actionSetBuilder];
  v31 = [v30 actions];

  obuint64_t j = v31;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v74 objects:v92 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v75;
    v63 = v72;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v75 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = *(void *)(*((void *)&v74 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v37 = [(HFSetDiff *)v61 additions];
          v38 = [(HFServiceActionItemProvider *)self home];
          v39 = [(HFServiceActionItemProvider *)self _addOrUpdateActionItemWithMediaAction:0 mediaActionBuilder:v36 addedActionItems:v37 home:v38];

          v71[0] = MEMORY[0x263EF8330];
          v71[1] = 3221225472;
          v72[0] = __42__HFServiceActionItemProvider_reloadItems__block_invoke_3;
          v72[1] = &unk_26409A1C8;
          v73 = v66;
          objc_msgSend(v39, "na_each:", v71);
        }
        else
        {
          objc_opt_class();
          char v40 = objc_opt_isKindOfClass();
          v41 = [(HFSetDiff *)v61 additions];
          v42 = [(HFServiceActionItemProvider *)self home];
          if (v40) {
            [(HFServiceActionItemProvider *)self _addOrUpdateMatterActionItemForAction:0 actionBuilder:v36 addedActionsItems:v41 home:v42];
          }
          else {
          v39 = [(HFServiceActionItemProvider *)self _addOrUpdateActionItemWithAction:0 actionBuilder:v36 addedActionItems:v41 home:v42];
          }

          ((void (*)(void *, void *))v66[2])(v66, v39);
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v74 objects:v92 count:16];
    }
    while (v33);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v43 = [(HFServiceActionItemProvider *)self actionItems];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v67 objects:v91 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v68;
    do
    {
      for (uint64_t k = 0; k != v45; ++k)
      {
        if (*(void *)v68 != v46) {
          objc_enumerationMutation(v43);
        }
        v48 = *(void **)(*((void *)&v67 + 1) + 8 * k);
        v49 = objc_msgSend(v48, "actions", v61, v62, v63);
        if ([v49 count])
        {
        }
        else
        {
          v50 = [v48 actionBuilders];
          uint64_t v51 = [v50 count];

          if (!v51) {
            [(HFMutableSetDiff *)v61 deleteObject:v48];
          }
        }
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v67 objects:v91 count:16];
    }
    while (v45);
  }

  v52 = [(HFSetDiff *)v61 toSet];
  v53 = (void *)[v52 mutableCopy];
  [(HFServiceActionItemProvider *)self setActionItems:v53];

  v54 = [HFItemProviderReloadResults alloc];
  v55 = [(HFSetDiff *)v61 additions];
  v56 = [(HFSetDiff *)v61 deletions];
  v57 = [(HFSetDiff *)v61 updates];
  v58 = [(HFItemProviderReloadResults *)v54 initWithAddedItems:v55 removedItems:v56 existingItems:v57];

  v59 = [MEMORY[0x263F58190] futureWithResult:v58];

  return v59;
}

uint64_t __42__HFServiceActionItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v13 = v3;
    uint64_t v5 = [*(id *)(a1 + 32) filter];
    if (v5
      && (uint64_t v6 = (void *)v5,
          [*(id *)(a1 + 32) filter],
          uint64_t v7 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(),
          char v8 = ((uint64_t (**)(void, id))v7)[2](v7, v13),
          v7,
          v6,
          (v8 & 1) == 0))
    {
      id v3 = (id)[*(id *)(a1 + 40) deleteObject:v13];
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 32) actionItems];
      int v10 = [v9 containsObject:v13];

      v11 = *(void **)(a1 + 40);
      if (v10) {
        id v3 = (id)[v11 updateObject:v13];
      }
      else {
        id v3 = (id)[v11 addObject:v13];
      }
    }
    id v4 = v13;
  }
  return MEMORY[0x270F9A758](v3, v4);
}

uint64_t __42__HFServiceActionItemProvider_reloadItems__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __42__HFServiceActionItemProvider_reloadItems__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)invalidationReasons
{
  v7.receiver = self;
  v7.super_class = (Class)HFServiceActionItemProvider;
  id v3 = [(HFItemProvider *)&v7 invalidationReasons];
  id v4 = [(HFServiceActionItemProvider *)self actionSet];

  if (v4)
  {
    uint64_t v5 = [v3 setByAddingObject:@"actionSet"];

    id v3 = (void *)v5;
  }
  return v3;
}

- (id)_actionItemForCharacteristic:(id)a3 addedActionItems:(id)a4 home:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HFServiceActionItemProvider.m", 186, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  v12 = [v9 service];
  id v13 = [v12 uniqueIdentifier];

  if (v13)
  {
    objc_super v14 = [(HFServiceActionItemProvider *)self _findServiceActionForIdentifier:v13 addedActionItems:v10];
  }
  else
  {
    objc_super v14 = 0;
  }

  return v14;
}

- (id)_actionItemForMediaProfile:(id)a3 addedActionItems:(id)a4 home:(id)a5
{
  id v7 = a4;
  char v8 = [a3 accessories];
  id v9 = [v8 anyObject];
  id v10 = [v9 uniqueIdentifier];

  if (v10)
  {
    id v11 = [(HFServiceActionItemProvider *)self _findServiceActionForIdentifier:v10 addedActionItems:v7];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_findServiceActionForIdentifier:(id)a3 addedActionItems:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v40 = a3;
  id v6 = a4;
  id v7 = [(HFServiceActionItemProvider *)self actionItems];
  v38 = self;
  if (v7)
  {
    char v8 = [(HFServiceActionItemProvider *)self actionItems];
    id v9 = (void *)[v8 mutableCopy];
  }
  else
  {
    id v9 = [MEMORY[0x263EFF9C0] set];
  }

  if (v6) {
    [v9 unionSet:v6];
  }
  v37 = v6;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v48;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v48 != v12) {
          objc_enumerationMutation(obj);
        }
        objc_super v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v15 = [v14 containingItem];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v17 = [v14 containingItem];
          uint64_t v18 = [v17 serviceGroup];
          unint64_t v19 = [v18 services];
          uint64_t v20 = [v19 valueForKey:@"uniqueIdentifier"];
          char v21 = [v20 containsObject:v40];

          if (v21)
          {
            id v22 = v14;

            if (v22) {
              goto LABEL_34;
            }
            goto LABEL_18;
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

LABEL_18:
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v23 = obj;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (!v24)
  {
LABEL_29:

    goto LABEL_33;
  }
  uint64_t v25 = v24;
  uint64_t v26 = *(void *)v44;
LABEL_20:
  uint64_t v27 = 0;
  while (1)
  {
    if (*(void *)v44 != v26) {
      objc_enumerationMutation(v23);
    }
    id v22 = *(id *)(*((void *)&v43 + 1) + 8 * v27);
    v28 = [v22 containingItem];
    objc_opt_class();
    char v29 = objc_opt_isKindOfClass();

    if ((v29 & 1) == 0) {
      break;
    }
    v30 = [v22 containingItem];
    v31 = [v30 service];
    uint64_t v32 = [v31 uniqueIdentifier];
    int v33 = [v32 isEqual:v40];

    if (v33)
    {
      id v34 = v22;

      goto LABEL_32;
    }

LABEL_27:
    if (v25 == ++v27)
    {
      uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v25) {
        goto LABEL_20;
      }
      goto LABEL_29;
    }
  }
  if (![(HFServiceActionItemProvider *)v38 isMatterServiceActionItem:v22 forAccessoryID:v40])goto LABEL_27; {
  id v35 = v22;
  }
LABEL_32:

  if (v22) {
    goto LABEL_34;
  }
LABEL_33:
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __80__HFServiceActionItemProvider__findServiceActionForIdentifier_addedActionItems___block_invoke;
  v41[3] = &unk_26409A1F0;
  id v42 = v40;
  objc_msgSend(v23, "na_firstObjectPassingTest:", v41);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

LABEL_34:
  return v22;
}

uint64_t __80__HFServiceActionItemProvider__findServiceActionForIdentifier_addedActionItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = [v3 containingItem];

  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [v6 accessories];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __80__HFServiceActionItemProvider__findServiceActionForIdentifier_addedActionItems___block_invoke_2;
    v10[3] = &unk_26408D968;
    id v11 = *(id *)(a1 + 32);
    uint64_t v8 = objc_msgSend(v7, "na_any:", v10);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __80__HFServiceActionItemProvider__findServiceActionForIdentifier_addedActionItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_createActionItemForCharacteristic:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = [a3 service];
  uint64_t v8 = objc_msgSend(v6, "hf_serviceGroupsForService:", v7);
  id v9 = [v8 firstObject];

  if (v9)
  {
    uint64_t v10 = [HFServiceGroupItem alloc];
    id v11 = [(HFServiceActionItemProvider *)self valueSource];
    uint64_t v12 = [(HFServiceGroupItem *)v10 initWithValueSource:v11 serviceGroup:v9];
  }
  else
  {
    if (!v7 || !objc_msgSend(v7, "hf_isVisible"))
    {
      id v13 = 0;
      goto LABEL_10;
    }
    id v11 = [(HFServiceActionItemProvider *)self valueSource];
    uint64_t v12 = +[HFServiceItem serviceItemForService:v7 valueSource:v11];
  }
  id v13 = (void *)v12;

  if (v13 && [v13 containsActions])
  {
    objc_super v14 = [[HFServiceActionItem alloc] initWithHome:v6 containingItem:v13];
    goto LABEL_11;
  }
LABEL_10:
  objc_super v14 = 0;
LABEL_11:

  return v14;
}

- (id)_createActionItemForMediaProfile:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [HFServiceActionItem alloc];
  id v9 = [HFMediaAccessoryItem alloc];
  uint64_t v10 = [(HFServiceActionItemProvider *)self valueSource];
  id v11 = [(HFMediaAccessoryItem *)v9 initWithValueSource:v10 mediaProfileContainer:v7];

  uint64_t v12 = [(HFServiceActionItem *)v8 initWithHome:v6 containingItem:v11];
  return v12;
}

- (id)_addOrUpdateActionItemWithAction:(id)a3 actionBuilder:(id)a4 addedActionItems:(id)a5 home:(id)a6
{
  unint64_t v11 = (unint64_t)a3;
  unint64_t v12 = (unint64_t)a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    uint64_t v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HFServiceActionItemProvider.m", 293, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  if (!(v11 | v12))
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HFServiceActionItemProvider.m", 294, @"Invalid parameter not satisfying: %@", @"action || actionBuilder" object file lineNumber description];
    uint64_t v16 = 0;
LABEL_16:

    goto LABEL_19;
  }
  if (v11 && v12)
  {
    unint64_t v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HFServiceActionItemProvider.m", 295, @"Invalid parameter not satisfying: %@", @"!action || !actionBuilder" object file lineNumber description];

LABEL_7:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [(id)v11 characteristic];
      uint64_t v16 = [(HFServiceActionItemProvider *)self _actionItemForCharacteristic:v15 addedActionItems:v13 home:v14];
      if (!v16)
      {
        uint64_t v16 = [(HFServiceActionItemProvider *)self _createActionItemForCharacteristic:v15 home:v14];
      }
      [v16 addAction:v11];
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (v11) {
    goto LABEL_7;
  }
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [(id)v12 characteristic];
      uint64_t v16 = [(HFServiceActionItemProvider *)self _actionItemForCharacteristic:v15 addedActionItems:v13 home:v14];
      if (!v16)
      {
        uint64_t v16 = [(HFServiceActionItemProvider *)self _createActionItemForCharacteristic:v15 home:v14];
      }
      [v16 addActionBuilder:v12];
      goto LABEL_16;
    }
LABEL_17:
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  uint64_t v16 = 0;
LABEL_19:

  return v16;
}

- (id)_addOrUpdateActionItemWithMediaAction:(id)a3 mediaActionBuilder:(id)a4 addedActionItems:(id)a5 home:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    uint64_t v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"HFServiceActionItemProvider.m", 329, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  if ((v11 != 0) == (v12 != 0))
  {
    uint64_t v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"HFServiceActionItemProvider.m", 330, @"Invalid parameter not satisfying: %@", @"(action != nil) ^ (actionBuilder != nil)" object file lineNumber description];
  }
  v15 = [MEMORY[0x263EFFA08] set];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    uint64_t v16 = [v11 mediaProfiles];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __110__HFServiceActionItemProvider__addOrUpdateActionItemWithMediaAction_mediaActionBuilder_addedActionItems_home___block_invoke;
    v30[3] = &unk_26409A218;
    v30[4] = self;
    uint64_t v17 = &v31;
    id v31 = v13;
    uint64_t v18 = &v32;
    id v32 = v14;
    unint64_t v19 = &v33;
    id v33 = v11;
    uint64_t v20 = v30;
    goto LABEL_11;
  }
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v12 mediaProfiles];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __110__HFServiceActionItemProvider__addOrUpdateActionItemWithMediaAction_mediaActionBuilder_addedActionItems_home___block_invoke_2;
      v26[3] = &unk_26409A218;
      v26[4] = self;
      uint64_t v17 = &v27;
      id v27 = v13;
      uint64_t v18 = &v28;
      id v28 = v14;
      unint64_t v19 = &v29;
      id v29 = v12;
      uint64_t v20 = v26;
LABEL_11:
      uint64_t v21 = objc_msgSend(v16, "na_map:", v20);

      v15 = (void *)v21;
    }
  }
LABEL_12:
  id v22 = [v15 allObjects];

  return v22;
}

id __110__HFServiceActionItemProvider__addOrUpdateActionItemWithMediaAction_mediaActionBuilder_addedActionItems_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _actionItemForMediaProfile:v3 addedActionItems:*(void *)(a1 + 40) home:*(void *)(a1 + 48)];
  if (!v4)
  {
    uint64_t v4 = [*(id *)(a1 + 32) _createActionItemForMediaProfile:v3 home:*(void *)(a1 + 48)];
  }
  [v4 addAction:*(void *)(a1 + 56)];

  return v4;
}

id __110__HFServiceActionItemProvider__addOrUpdateActionItemWithMediaAction_mediaActionBuilder_addedActionItems_home___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _actionItemForMediaProfile:v3 addedActionItems:*(void *)(a1 + 40) home:*(void *)(a1 + 48)];
  if (!v4)
  {
    uint64_t v4 = [*(id *)(a1 + 32) _createActionItemForMediaProfile:v3 home:*(void *)(a1 + 48)];
  }
  [v4 addActionBuilder:*(void *)(a1 + 56)];

  return v4;
}

- (id)_actionItemForAccessory:(id)a3 addedActionsItems:(id)a4 home:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HFServiceActionItemProvider.m", 365, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  id v12 = [v9 uniqueIdentifier];
  if (v12)
  {
    id v13 = [(HFServiceActionItemProvider *)self _findServiceActionForIdentifier:v12 addedActionItems:v10];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)_addOrUpdateMatterActionItemForAction:(id)a3 actionBuilder:(id)a4 addedActionsItems:(id)a5 home:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [v10 commands];
      v15 = [v14 firstObject];
      uint64_t v16 = [v15 accessory];

      uint64_t v17 = [(HFServiceActionItemProvider *)self _actionItemForAccessory:v16 addedActionsItems:v12 home:v13];
      if (!v17)
      {
        uint64_t v18 = [(HFServiceActionItemProvider *)self valueSource];
        unint64_t v19 = [v18 actionSetBuilder];
        uint64_t v17 = [(HFServiceActionItemProvider *)self _createMatterActionItemFor:v16 home:v13 actionSetBuilder:v19];
      }
      [v17 addAction:v10];
LABEL_11:

      goto LABEL_13;
    }
  }
  else if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v11 accessory];
      uint64_t v17 = [(HFServiceActionItemProvider *)self _actionItemForAccessory:v16 addedActionsItems:v12 home:v13];
      if (!v17)
      {
        uint64_t v20 = [(HFServiceActionItemProvider *)self valueSource];
        uint64_t v21 = [v20 actionSetBuilder];
        uint64_t v17 = [(HFServiceActionItemProvider *)self _createMatterActionItemFor:v16 home:v13 actionSetBuilder:v21];
      }
      [v17 addActionBuilder:v11];
      goto LABEL_11;
    }
  }
  uint64_t v17 = 0;
LABEL_13:

  return v17;
}

- (HMHome)home
{
  return self->_home;
}

- (HMActionSet)actionSet
{
  return self->_actionSet;
}

- (void)setActionSet:(id)a3
{
}

- (HFActionSetBuilderProtocol)actionSetBuilder
{
  return self->_actionSetBuilder;
}

- (void)setActionSetBuilder:(id)a3
{
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (NSMutableSet)actionItems
{
  return self->_actionItems;
}

- (void)setActionItems:(id)a3
{
}

- (HFActionSetValueSource)valueSource
{
  return self->_valueSource;
}

- (void)setValueSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_actionItems, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_actionSetBuilder, 0);
  objc_storeStrong((id *)&self->_actionSet, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end