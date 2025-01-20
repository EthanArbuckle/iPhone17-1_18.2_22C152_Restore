@interface HFServiceActionItem
+ (id)_percentFormatter;
+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4;
- (HFAccessoryRepresentable)accessoryRepresentableObject;
- (HFCharacteristicValueSource)valueSource;
- (HFHomeKitObject)homeKitObject;
- (HFServiceActionItem)init;
- (HFServiceActionItem)initWithHome:(id)a3 containingItem:(id)a4;
- (HFServiceLikeItem)containingItem;
- (HMHome)home;
- (NSSet)actionBuilders;
- (NSSet)actions;
- (NSSet)services;
- (NSString)description;
- (id)_characteristicTypeToTargetValuesMap;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessories;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)namingComponentForHomeKitObject;
- (id)serviceActionItemForChildServiceItem:(id)a3;
- (void)_getDesiredItemDescription:(id *)a3 controlDescription:(id *)a4 withSourceItemResults:(id)a5;
- (void)addAction:(id)a3;
- (void)addActionBuilder:(id)a3;
- (void)setActionBuilders:(id)a3;
- (void)setActions:(id)a3;
@end

@implementation HFServiceActionItem

- (HFServiceActionItem)initWithHome:(id)a3 containingItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFServiceActionItem;
  v9 = [(HFServiceActionItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_containingItem, a4);
  }

  return v10;
}

- (HFServiceActionItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HFServiceActionItem.m" lineNumber:50 description:@"Use -initWithHome:containingItem:"];

  return 0;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HFServiceActionItem *)self actions];
  id v7 = objc_msgSend(v6, "hf_prettyDescription");
  id v8 = [(HFServiceActionItem *)self actionBuilders];
  v9 = objc_msgSend(v8, "hf_prettyDescription");
  v10 = [(HFServiceActionItem *)self containingItem];
  v11 = [(HFItem *)self latestResults];
  objc_super v12 = [v3 stringWithFormat:@"<%@: %p, actions: %@ builders: %@ containined in: \"%@\" %@>", v5, self, v7, v9, v10, v11];

  return (NSString *)v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(HFServiceActionItem *)self containingItem];

  if (!v5) {
    NSLog(&cfstr_MustHaveAConta.isa);
  }
  v6 = [(HFServiceActionItem *)self containingItem];

  if (v6)
  {
    id v7 = (void *)[v4 mutableCopy];
    id v8 = [(HFServiceActionItem *)self actionBuilders];
    objc_msgSend(v7, "na_safeSetObject:forKey:", v8, HFItemUpdateOptionActionBuilders);

    v9 = [(HFServiceActionItem *)self containingItem];
    v10 = [v9 updateWithOptions:v7];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __51__HFServiceActionItem__subclass_updateWithOptions___block_invoke;
    v14[3] = &unk_26408E470;
    v14[4] = self;
    v11 = [v10 flatMap:v14];
  }
  else
  {
    objc_super v12 = (void *)MEMORY[0x263F58190];
    id v7 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    v11 = [v12 futureWithError:v7];
  }

  return v11;
}

id __51__HFServiceActionItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 results];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [MEMORY[0x263EFFA08] set];
  [v4 setObject:v5 forKeyedSubscript:@"dependentHomeKitObjects"];

  v6 = *(void **)(a1 + 32);
  id v14 = 0;
  id v15 = 0;
  [v6 _getDesiredItemDescription:&v15 controlDescription:&v14 withSourceItemResults:v4];
  id v7 = v15;
  id v8 = v14;
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, @"description");
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, @"controlDescription");

  if (_MergedGlobals_4_0 != -1) {
    dispatch_once(&_MergedGlobals_4_0, &__block_literal_global_20_6);
  }
  id v9 = (id)qword_2676B6A88;
  [v4 removeObjectsForKeys:v9];
  v10 = (void *)MEMORY[0x263F58190];
  v11 = +[HFItemUpdateOutcome outcomeWithResults:v4];
  objc_super v12 = [v10 futureWithResult:v11];

  return v12;
}

void __51__HFServiceActionItem__subclass_updateWithOptions___block_invoke_3()
{
  v2[4] = *MEMORY[0x263EF8340];
  v2[0] = @"errorDescription";
  v2[1] = @"longErrorDescription";
  v2[2] = @"badge";
  v2[3] = @"underlyingError";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:4];
  v1 = (void *)qword_2676B6A88;
  qword_2676B6A88 = v0;
}

- (void)addAction:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HFServiceActionItem.m", 96, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];
  }
  v5 = [(HFServiceActionItem *)self actions];
  v6 = (void *)[v5 mutableCopy];

  if (!v6)
  {
    v6 = [MEMORY[0x263EFF9C0] set];
  }
  [v6 addObject:v9];
  id v7 = (void *)[v6 copy];
  [(HFServiceActionItem *)self setActions:v7];
}

- (void)addActionBuilder:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HFServiceActionItem.m", 107, @"Invalid parameter not satisfying: %@", @"actionBuilder" object file lineNumber description];
  }
  v5 = [(HFServiceActionItem *)self actionBuilders];
  v6 = (void *)[v5 mutableCopy];

  if (!v6)
  {
    v6 = [MEMORY[0x263EFF9C0] set];
  }
  [v6 addObject:v9];
  id v7 = (void *)[v6 copy];
  [(HFServiceActionItem *)self setActionBuilders:v7];
}

- (id)serviceActionItemForChildServiceItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 service];
  v6 = [(HFServiceActionItem *)self services];
  char v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0)
  {
    id v8 = objc_msgSend(v5, "hf_prettyDescription");
    NSLog(&cfstr_RequestToCreat.isa, v8, self);
  }
  id v9 = [HFServiceActionItem alloc];
  v10 = [(HFServiceActionItem *)self home];
  v11 = [(HFServiceActionItem *)v9 initWithHome:v10 containingItem:v4];

  objc_super v12 = [(HFServiceActionItem *)self actionBuilders];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __60__HFServiceActionItem_serviceActionItemForChildServiceItem___block_invoke;
  v21[3] = &unk_26408EA88;
  id v13 = v5;
  id v22 = v13;
  id v14 = objc_msgSend(v12, "na_filter:", v21);
  [(HFServiceActionItem *)v11 setActionBuilders:v14];

  id v15 = [(HFServiceActionItem *)self actions];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __60__HFServiceActionItem_serviceActionItemForChildServiceItem___block_invoke_2;
  v19[3] = &unk_264090490;
  id v20 = v13;
  id v16 = v13;
  v17 = objc_msgSend(v15, "na_filter:", v19);
  [(HFServiceActionItem *)v11 setActions:v17];

  return v11;
}

uint64_t __60__HFServiceActionItem_serviceActionItemForChildServiceItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 characteristic];
    v5 = [v4 service];
    v6 = [v5 uniqueIdentifier];
    char v7 = [*(id *)(a1 + 32) uniqueIdentifier];
    uint64_t v8 = [v6 isEqual:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __60__HFServiceActionItem_serviceActionItemForChildServiceItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 characteristic];
    v5 = [v4 service];
    v6 = [v5 uniqueIdentifier];
    char v7 = [*(id *)(a1 + 32) uniqueIdentifier];
    uint64_t v8 = [v6 isEqual:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (HFHomeKitObject)homeKitObject
{
  v2 = [(HFServiceActionItem *)self containingItem];
  id v3 = [v2 homeKitObject];

  return (HFHomeKitObject *)v3;
}

- (NSSet)services
{
  v2 = [(HFServiceActionItem *)self containingItem];
  id v3 = [v2 services];

  return (NSSet *)v3;
}

- (id)accessories
{
  v2 = [(HFServiceActionItem *)self containingItem];
  id v3 = [v2 accessories];

  return v3;
}

- (HFCharacteristicValueSource)valueSource
{
  v2 = [(HFServiceActionItem *)self containingItem];
  id v3 = [v2 valueSource];

  return (HFCharacteristicValueSource *)v3;
}

- (id)copyWithValueSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(HFServiceActionItem *)self home];
  char v7 = [(HFServiceActionItem *)self containingItem];
  uint64_t v8 = (void *)[v7 copyWithValueSource:v4];

  id v9 = (void *)[v5 initWithHome:v6 containingItem:v8];
  [v9 copyLatestResultsFromItem:self];
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(HFServiceActionItem *)self valueSource];
  id v5 = [(HFServiceActionItem *)self copyWithValueSource:v4];

  return v5;
}

- (id)namingComponentForHomeKitObject
{
  v2 = [(HFServiceActionItem *)self containingItem];
  id v3 = [v2 homeKitObject];
  id v4 = +[HFNamingComponents namingComponentFromHomeKitObject:v3];

  return v4;
}

+ (id)_percentFormatter
{
  if (qword_2676B6A98 != -1) {
    dispatch_once(&qword_2676B6A98, &__block_literal_global_44_0);
  }
  v2 = (void *)qword_2676B6A90;
  return v2;
}

uint64_t __40__HFServiceActionItem__percentFormatter__block_invoke()
{
  uint64_t v0 = objc_alloc_init(HFPercentFormatter);
  uint64_t v1 = qword_2676B6A90;
  qword_2676B6A90 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)_getDesiredItemDescription:(id *)a3 controlDescription:(id *)a4 withSourceItemResults:(id)a5
{
  id v8 = a5;
  id v9 = [v8 objectForKeyedSubscript:@"description"];
  v10 = [v8 objectForKeyedSubscript:@"controlDescription"];
  v11 = [v8 objectForKeyedSubscript:@"errorDescription"];
  objc_super v12 = v11;
  v50 = a3;
  if (v11 && [v11 isEqualToString:v9])
  {

    v10 = 0;
    id v9 = 0;
  }
  id v13 = [(HFServiceActionItem *)self _characteristicTypeToTargetValuesMap];
  id v14 = [v8 objectForKeyedSubscript:@"childItems"];
  id v15 = objc_msgSend(v14, "na_firstObjectPassingTest:", &__block_literal_global_48_0);

  v52 = [v15 incrementalCharacteristicType];
  id v16 = [v8 objectForKeyedSubscript:@"childItems"];
  v51 = objc_msgSend(v16, "na_firstObjectPassingTest:", &__block_literal_global_51);

  v17 = objc_msgSend(MEMORY[0x263F0E248], "hf_powerStateCharacteristicTypes");
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __91__HFServiceActionItem__getDesiredItemDescription_controlDescription_withSourceItemResults___block_invoke_3;
  v55[3] = &unk_26408D210;
  id v18 = v13;
  id v56 = v18;
  LODWORD(v13) = objc_msgSend(v17, "na_any:", v55);

  if (v13)
  {
    v19 = objc_msgSend(MEMORY[0x263F0E248], "hf_powerStateCharacteristicTypes");
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __91__HFServiceActionItem__getDesiredItemDescription_controlDescription_withSourceItemResults___block_invoke_4;
    v53[3] = &unk_26408CEC0;
    id v20 = v18;
    id v54 = v20;
    v21 = objc_msgSend(v19, "na_flatMap:", v53);

    if ([v21 count] != 1)
    {
LABEL_31:

      v26 = v54;
      goto LABEL_32;
    }
    v49 = a4;
    id v22 = [v21 anyObject];
    int v23 = [v22 BOOLValue];

    if (v23)
    {
      if (v52) {
        objc_msgSend(v20, "objectForKeyedSubscript:");
      }
      else {
      v39 = [MEMORY[0x263EFFA08] set];
      }
      a4 = v49;
      if ([v39 count] || v51) {
        goto LABEL_30;
      }
      uint64_t v38 = _HFLocalizedStringWithDefaultValue(@"HFSceneDescriptionValueOn", @"HFSceneDescriptionValueOn", 1);

      uint64_t v47 = _HFLocalizedStringWithDefaultValue(@"HFSceneDescriptionValueOn", @"HFSceneDescriptionValueOn", 1);

      v10 = (void *)v47;
    }
    else
    {
      uint64_t v38 = _HFLocalizedStringWithDefaultValue(@"HFSceneDescriptionValueOff", @"HFSceneDescriptionValueOff", 1);

      _HFLocalizedStringWithDefaultValue(@"HFSceneDescriptionValueOff", @"HFSceneDescriptionValueOff", 1);
      v10 = v39 = v10;
    }
    id v9 = (void *)v38;
    a4 = v49;
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v24 = *MEMORY[0x263F0C520];
  v25 = [v18 objectForKeyedSubscript:*MEMORY[0x263F0C520]];

  if (v25)
  {
    v26 = [v18 objectForKeyedSubscript:v24];
    if ([v26 count] == 1)
    {
      v27 = a4;
      v28 = [v26 anyObject];
      uint64_t v29 = [v28 integerValue];

      if (!v29)
      {
        uint64_t v30 = _HFLocalizedStringWithDefaultValue(@"HFSceneDescriptionValueClosed", @"HFSceneDescriptionValueClosed", 1);

        uint64_t v31 = _HFLocalizedStringWithDefaultValue(@"HFSceneDescriptionValueClosed", @"HFSceneDescriptionValueClosed", 1);

        v10 = (void *)v31;
        id v9 = (void *)v30;
      }
      a4 = v27;
    }
LABEL_32:
    v48 = v50;

    if (!v50) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  uint64_t v32 = *MEMORY[0x263F0C4A8];
  v33 = [v18 objectForKeyedSubscript:*MEMORY[0x263F0C4A8]];

  if (v33)
  {
    v26 = [v18 objectForKeyedSubscript:v32];
    if ([v26 count] != 1) {
      goto LABEL_32;
    }
    v34 = [v26 anyObject];
    uint64_t v35 = [v34 integerValue];
    v36 = @"HFSceneDescriptionValueOpen";
    v37 = @"HFSceneDescriptionValueClosed";
LABEL_21:
    if (v35 == 1) {
      v42 = v37;
    }
    else {
      v42 = v36;
    }
    _HFLocalizedStringWithDefaultValue(v42, v42, 1);
    v44 = v43 = a4;

    id v45 = v44;
    a4 = v43;
    id v46 = v45;

    v10 = v46;
    id v9 = v46;
    goto LABEL_32;
  }
  uint64_t v40 = *MEMORY[0x263F0C510];
  v41 = [v18 objectForKeyedSubscript:*MEMORY[0x263F0C510]];

  if (v41)
  {
    v26 = [v18 objectForKeyedSubscript:v40];
    if ([v26 count] != 1) {
      goto LABEL_32;
    }
    v34 = [v26 anyObject];
    uint64_t v35 = [v34 integerValue];
    v36 = @"HFSceneDescriptionValueUnlocked";
    v37 = @"HFSceneDescriptionValueLocked";
    goto LABEL_21;
  }
  v48 = v50;
  if (v50) {
LABEL_33:
  }
    id *v48 = v9;
LABEL_34:
  if (a4) {
    *a4 = v10;
  }
}

uint64_t __91__HFServiceActionItem__getDesiredItemDescription_controlDescription_withSourceItemResults___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __91__HFServiceActionItem__getDesiredItemDescription_controlDescription_withSourceItemResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL __91__HFServiceActionItem__getDesiredItemDescription_controlDescription_withSourceItemResults___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __91__HFServiceActionItem__getDesiredItemDescription_controlDescription_withSourceItemResults___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

- (id)_characteristicTypeToTargetValuesMap
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionary];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__HFServiceActionItem__characteristicTypeToTargetValuesMap__block_invoke;
  aBlock[3] = &unk_264094E88;
  aBlock[4] = self;
  id v25 = v3;
  id v35 = v25;
  id v4 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = [(HFServiceActionItem *)self actions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          objc_super v12 = [v11 characteristic];
          id v13 = [v11 targetValue];

          v4[2](v4, v12, v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v7);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = [(HFServiceActionItem *)self actionBuilders];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = v19;
          v21 = [v20 characteristic];
          id v22 = [v20 targetValue];

          v4[2](v4, v21, v22);
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v16);
  }

  id v23 = v25;
  return v23;
}

void __59__HFServiceActionItem__characteristicTypeToTargetValuesMap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) services];
  uint64_t v7 = [v12 service];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    uint64_t v9 = [v12 characteristicType];
    v10 = (void *)v9;
    if (v5 && v9)
    {
      id v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
      if (!v11)
      {
        id v11 = [MEMORY[0x263EFF9C0] set];
        [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v10];
      }
      [v11 addObject:v5];
    }
  }
}

- (HFAccessoryRepresentable)accessoryRepresentableObject
{
  id v2 = [(HFServiceActionItem *)self containingItem];
  if ([v2 conformsToProtocol:&unk_26C0FC1F0]) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;
  id v5 = [v4 accessoryRepresentableObject];

  return (HFAccessoryRepresentable *)v5;
}

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  return 0;
}

- (HMHome)home
{
  return self->_home;
}

- (HFServiceLikeItem)containingItem
{
  return self->_containingItem;
}

- (NSSet)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NSSet)actionBuilders
{
  return self->_actionBuilders;
}

- (void)setActionBuilders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionBuilders, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_containingItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end