@interface HUNaturalLightingItem
- (BOOL)selected;
- (HFHomeKitObject)homeKitObject;
- (HMRoom)hf_parentRoom;
- (HUNaturalLightingItem)initWithSourceItem:(id)a3 defaultSelected:(BOOL)a4;
- (NSSet)lightProfiles;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessory;
- (void)setSelected:(BOOL)a3;
@end

@implementation HUNaturalLightingItem

- (HUNaturalLightingItem)initWithSourceItem:(id)a3 defaultSelected:(BOOL)a4
{
  BOOL v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUNaturalLightingItem;
  v5 = [(HFTransformItem *)&v11 initWithSourceItem:a3 resultKeyExclusionFilter:MEMORY[0x1E4F1CBF0]];
  v6 = v5;
  if (v5)
  {
    v7 = [(HUNaturalLightingItem *)v5 accessory];
    int v8 = [v7 hasOnboardedForNaturalLighting];

    if (v8)
    {
      v9 = [(HUNaturalLightingItem *)v6 lightProfiles];
      -[HUNaturalLightingItem setSelected:](v6, "setSelected:", objc_msgSend(v9, "na_all:", &__block_literal_global_165));
    }
    else
    {
      [(HUNaturalLightingItem *)v6 setSelected:v4];
    }
  }
  return v6;
}

uint64_t __60__HUNaturalLightingItem_initWithSourceItem_defaultSelected___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 settings];
  uint64_t v3 = [v2 isNaturalLightingEnabled];

  return v3;
}

- (HMRoom)hf_parentRoom
{
  v2 = [(HUNaturalLightingItem *)self homeKitObject];
  if ([v2 conformsToProtocol:&unk_1F1A6A1B0]) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  v5 = objc_msgSend(v4, "hf_parentRoom");

  return (HMRoom *)v5;
}

- (HFHomeKitObject)homeKitObject
{
  v2 = [(HFTransformItem *)self sourceItem];
  uint64_t v3 = [v2 homeKitObject];

  return (HFHomeKitObject *)v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUNaturalLightingItem;
  id v4 = [(HFTransformItem *)&v8 _subclass_updateWithOptions:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HUNaturalLightingItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1E6389290;
  v7[4] = self;
  v5 = [v4 flatMap:v7];

  return v5;
}

id __53__HUNaturalLightingItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 results];
  id v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "selected"));
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68B40]];

  v6 = (void *)MEMORY[0x1E4F7A0D8];
  v7 = [MEMORY[0x1E4F69228] outcomeWithResults:v4];
  objc_super v8 = [v6 futureWithResult:v7];

  return v8;
}

- (NSSet)lightProfiles
{
  uint64_t v3 = [(HUNaturalLightingItem *)self accessory];

  if (v3)
  {
    id v4 = [(HUNaturalLightingItem *)self accessory];
    v5 = [v4 lightProfiles];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v5;
}

- (id)accessory
{
  objc_opt_class();
  uint64_t v3 = [(HUNaturalLightingItem *)self homeKitObject];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  objc_opt_class();
  v6 = [(HUNaturalLightingItem *)self homeKitObject];
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v5)
  {
    id v9 = [v5 accessory];
  }
  else
  {
    id v9 = v8;
  }
  v10 = v9;

  return v10;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

@end