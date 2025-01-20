@interface AVTPresetStoreDependency
- (AVTPreset)overridePreset;
- (AVTPresetStoreDependency)initWithOverridePreset:(id)a3 conditionedOnPreset:(id)a4;
- (AVTPresetStoreDependency)initWithOverridePreset:(id)a3 conditionedOnPreset:(id)a4 forSpecificPresetIdentifier:(id)a5;
- (NSMutableArray)conditions;
- (void)addConditionOnPreset:(id)a3;
- (void)addConditionOnPreset:(id)a3 forSpecificPresetIdentifier:(id)a4;
- (void)setConditions:(id)a3;
- (void)setOverridePreset:(id)a3;
@end

@implementation AVTPresetStoreDependency

- (AVTPresetStoreDependency)initWithOverridePreset:(id)a3 conditionedOnPreset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTPresetStoreDependency;
  v9 = [(AVTPresetStoreDependency *)&v14 init];
  if (v9)
  {
    v13 = objc_alloc_init(AVTPresetStoreDependencyCondition);
    [(AVTPresetStoreDependencyCondition *)v13 setPresetOfOtherCategory:v8];
    objc_storeStrong((id *)&v9->_overridePreset, a3);
    uint64_t v10 = [objc_alloc(MEMORY[0x263EFF980]) initWithObjects:&v13 count:1];
    conditions = v9->_conditions;
    v9->_conditions = (NSMutableArray *)v10;
  }
  return v9;
}

- (AVTPresetStoreDependency)initWithOverridePreset:(id)a3 conditionedOnPreset:(id)a4 forSpecificPresetIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AVTPresetStoreDependency;
  v12 = [(AVTPresetStoreDependency *)&v17 init];
  if (v12)
  {
    v16 = objc_alloc_init(AVTPresetStoreDependencyCondition);
    [(AVTPresetStoreDependencyCondition *)v16 setPresetOfOtherCategory:v10];
    [(AVTPresetStoreDependencyCondition *)v16 setSpecificPresetIdentifier:v11];
    objc_storeStrong((id *)&v12->_overridePreset, a3);
    uint64_t v13 = [objc_alloc(MEMORY[0x263EFF980]) initWithObjects:&v16 count:1];
    conditions = v12->_conditions;
    v12->_conditions = (NSMutableArray *)v13;
  }
  return v12;
}

- (void)addConditionOnPreset:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_conditions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "presetOfOtherCategory", (void)v13);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        if (v11 == v4)
        {
          v12 = [v10 specificPresetIdentifier];

          if (!v12) {
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v5 = objc_alloc_init(AVTPresetStoreDependencyCondition);
  [(NSMutableArray *)v5 setPresetOfOtherCategory:v4];
  [(NSMutableArray *)self->_conditions addObject:v5];
LABEL_12:
}

- (void)addConditionOnPreset:(id)a3 forSpecificPresetIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = self->_conditions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "presetOfOtherCategory", (void)v17);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        if (v14 == v6)
        {
          long long v15 = [v13 specificPresetIdentifier];
          char v16 = [v15 isEqualToString:v7];

          if (v16) {
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  uint64_t v8 = objc_alloc_init(AVTPresetStoreDependencyCondition);
  [(NSMutableArray *)v8 setPresetOfOtherCategory:v6];
  [(NSMutableArray *)v8 setSpecificPresetIdentifier:v7];
  [(NSMutableArray *)self->_conditions addObject:v8];
LABEL_12:
}

- (AVTPreset)overridePreset
{
  return self->_overridePreset;
}

- (void)setOverridePreset:(id)a3
{
}

- (NSMutableArray)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_overridePreset, 0);
}

@end