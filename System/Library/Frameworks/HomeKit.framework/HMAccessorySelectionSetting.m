@interface HMAccessorySelectionSetting
- (HMAccessorySelectionSetting)initWithInternal:(id)a3;
- (HMAccessorySelectionSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5;
- (HMAccessorySelectionSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5 items:(id)a6;
- (NSArray)items;
- (void)_setting:(id)a3 didAddConstraint:(id)a4;
- (void)addItem:(id)a3 completionHandler:(id)a4;
- (void)removeItem:(id)a3 completionHandler:(id)a4;
- (void)updateValue:(id)a3;
@end

@implementation HMAccessorySelectionSetting

- (void)_setting:(id)a3 didAddConstraint:(id)a4
{
  v5 = objc_msgSend(a4, "value", a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  [v7 setSetting:self];
}

- (void)removeItem:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v22 = a4;
  if (v6)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = [(HMAccessorySetting *)self internal];
    v8 = [v7 constraints];

    id v9 = (id)[v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "value", v22);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v14 = v13;
          }
          else {
            v14 = 0;
          }
          id v15 = v14;

          if ([v6 isEqual:v15])
          {
            id v9 = v12;

            goto LABEL_15;
          }
        }
        id v9 = (id)[v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    objc_initWeak(&location, v6);
    v16 = [(HMAccessorySetting *)self internal];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __60__HMAccessorySelectionSetting_removeItem_completionHandler___block_invoke;
    v23[3] = &unk_1E5944A68;
    objc_copyWeak(&v25, &location);
    id v24 = v22;
    [v16 removeConstraint:v9 completionHandler:v23];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

    v17 = v22;
  }
  else
  {
    v18 = [(HMAccessorySetting *)self internal];
    v19 = [v18 context];
    v20 = [v19 delegateCaller];
    v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    v17 = v22;
    [v20 callCompletion:v22 error:v21];
  }
}

uint64_t __60__HMAccessorySelectionSetting_removeItem_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setSetting:0];

    id v3 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t, id))(v5 + 16))(v5, v7);
    id v3 = v7;
  }

  return MEMORY[0x1F41817F8](v5, v3);
}

- (void)addItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [[HMAccessorySettingConstraint alloc] initWithType:4 value:v6];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    id v9 = [(HMAccessorySetting *)self internal];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__HMAccessorySelectionSetting_addItem_completionHandler___block_invoke;
    v13[3] = &unk_1E5944A40;
    objc_copyWeak(&v15, &location);
    objc_copyWeak(&v16, &from);
    id v14 = v7;
    [v9 addConstraint:v8 completionHandler:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = [(HMAccessorySetting *)self internal];
    uint64_t v10 = [(HMAccessorySettingConstraint *)v8 context];
    v11 = [v10 delegateCaller];
    v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v11 callCompletion:v7 error:v12];
  }
}

uint64_t __57__HMAccessorySelectionSetting_addItem_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = objc_loadWeakRetained((id *)(a1 + 48));
    [v5 setSetting:WeakRetained];

    id v3 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t, id))(v6 + 16))(v6, v8);
    id v3 = v8;
  }

  return MEMORY[0x1F41817F8](v6, v3);
}

- (NSArray)items
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [(HMAccessorySetting *)self internal];
  id v3 = [v2 constraints];

  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (void)v16) == 4)
        {
          v11 = [v10 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v12 = v11;
          }
          else {
            v12 = 0;
          }
          id v13 = v12;

          if (v13) {
            [v4 addObject:v13];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v14 = (void *)[v4 copy];

  return (NSArray *)v14;
}

- (HMAccessorySelectionSetting)initWithInternal:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMAccessorySelectionSetting;
  id v5 = [(HMAccessorySetting *)&v19 initWithInternal:v4];
  if (v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = objc_msgSend(v4, "constraints", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v10) value];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v12 = v11;
          }
          else {
            v12 = 0;
          }
          id v13 = v12;

          [v13 setSetting:v5];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (void)updateValue:(id)a3
{
  id v4 = a3;
  id v5 = [(HMAccessorySetting *)self internal];
  [v5 setValue:v4];

  id v6 = [(HMAccessorySetting *)self internal];
  [(HMAccessorySetting *)self _settingDidUpdateValue:v6];
}

- (HMAccessorySelectionSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5 items:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = [[HMAccessorySettingConstraint alloc] initWithType:4 value:*(void *)(*((void *)&v23 + 1) + 8 * v17)];
        [v12 addObject:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  objc_super v19 = [[_HMAccessorySetting alloc] initWithType:4 properties:a4 name:v9 constraints:v12];
  [(_HMAccessorySetting *)v19 setValue:v10];
  v20 = [(HMAccessorySelectionSetting *)self initWithInternal:v19];

  return v20;
}

- (HMAccessorySelectionSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5
{
  return [(HMAccessorySelectionSetting *)self initWithKey:a3 properties:a4 value:a5 items:0];
}

@end