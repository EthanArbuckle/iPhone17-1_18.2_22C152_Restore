@interface HUQuickControlTVInputSourceViewController
+ (Class)controlItemClass;
+ (id)controlItemPredicate;
- (BOOL)_shouldWriteInputValue:(id)a3;
- (id)_filterInputValues:(id)a3;
- (id)_toPickerViewItems:(id)a3;
- (id)controlToViewValueTransformer;
- (id)createInteractionCoordinator;
- (id)createViewProfile;
@end

@implementation HUQuickControlTVInputSourceViewController

+ (id)controlItemPredicate
{
  uint64_t v2 = objc_opt_class();

  return +[HUQuickControlSingleItemPredicate predicateWithControlItemClass:v2];
}

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (id)createInteractionCoordinator
{
  v3 = [HUQuickControlWheelPickerView alloc];
  v4 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  v5 = [(HUQuickControlWheelPickerView *)v3 initWithProfile:v4];

  v6 = [[HUQuickControlSimpleInteractionCoordinator alloc] initWithControlView:v5 delegate:self];

  return v6;
}

- (id)createViewProfile
{
  v3 = objc_alloc_init(HUQuickControlWheelPickerViewProfile);
  v4 = [(HUQuickControlSingleControlViewController *)self controlItem];
  v5 = [v4 valueSource];
  v6 = [v5 allCharacteristicsForCharacteristicType:*MEMORY[0x1E4F2CE48]];
  v7 = objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_108);

  v8 = [(HUQuickControlSingleControlViewController *)self controlItem];
  v9 = [v8 valueSource];
  v10 = [v9 valueSource];
  v11 = [v10 cachedValueForCharacteristic:v7];
  int v12 = [v11 BOOLValue];

  v13 = [(HUQuickControlSingleControlViewController *)self controlItem];
  v14 = [v13 latestResults];
  v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];

  if (v12) {
    uint64_t v16 = objc_msgSend(v15, "na_all:", &__block_literal_global_7_0);
  }
  else {
    uint64_t v16 = 1;
  }
  [(HUQuickControlWheelPickerViewProfile *)v3 setShowOffState:v16];

  return v3;
}

uint64_t __62__HUQuickControlTVInputSourceViewController_createViewProfile__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 service];
  v3 = [v2 serviceType];
  uint64_t v4 = [v3 isEqualToString:*MEMORY[0x1E4F2DEF0]];

  return v4;
}

uint64_t __62__HUQuickControlTVInputSourceViewController_createViewProfile__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 isHidden];
  return v6;
}

- (id)controlToViewValueTransformer
{
  id v3 = (void *)MEMORY[0x1E4F69760];
  uint64_t v4 = objc_opt_class();
  v7[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__HUQuickControlTVInputSourceViewController_controlToViewValueTransformer__block_invoke;
  v8[3] = &unk_1E638A990;
  v8[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__HUQuickControlTVInputSourceViewController_controlToViewValueTransformer__block_invoke_2;
  v7[3] = &unk_1E638A9B8;
  id v5 = [v3 transformerForValueClass:v4 transformBlock:v8 reverseTransformBlock:v7];

  return v5;
}

id __74__HUQuickControlTVInputSourceViewController_controlToViewValueTransformer__block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    id v2 = a2;
  }
  else {
    id v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 _filterInputValues:v2];
  uint64_t v6 = [v3 _toPickerViewItems:v5];

  return v6;
}

id __74__HUQuickControlTVInputSourceViewController_controlToViewValueTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _shouldWriteInputValue:v3])
  {
    id v4 = [*(id *)(a1 + 32) controlItem];
    id v5 = (id)[v4 writeValue:v3];
  }

  return v3;
}

- (BOOL)_shouldWriteInputValue:(id)a3
{
  id v4 = a3;
  id v5 = [(HUQuickControlSingleControlViewController *)self controlItem];
  uint64_t v6 = [v5 latestResults];
  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];

  if (v7)
  {
    v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_15_1);
    v9 = [v8 identifier];
    v10 = [v4 identifier];
    int v11 = [v9 isEqualToNumber:v10] ^ 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

uint64_t __68__HUQuickControlTVInputSourceViewController__shouldWriteInputValue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSelected];
}

- (id)_filterInputValues:(id)a3
{
  return (id)objc_msgSend(a3, "na_filter:", &__block_literal_global_18);
}

BOOL __64__HUQuickControlTVInputSourceViewController__filterInputValues___block_invoke(uint64_t a1, void *a2)
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

  if (v5 && ([v5 isHidden] & 1) == 0)
  {
    v7 = [v5 name];
    if (v7)
    {
      v8 = [v5 identifier];
      BOOL v6 = v8 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_toPickerViewItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        int v11 = [HUQuickControlWheelPickerViewItem alloc];
        int v12 = -[HUQuickControlWheelPickerViewItem initWithHFTVInputControlItemValue:](v11, "initWithHFTVInputControlItemValue:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

@end