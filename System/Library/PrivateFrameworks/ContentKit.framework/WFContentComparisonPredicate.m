@interface WFContentComparisonPredicate
+ (id)predicateWithValue:(id)a3 forProperty:(id)a4 comparisonType:(unint64_t)a5;
+ (id)predicateWithValueBlock:(id)a3 forProperty:(id)a4;
+ (void)initialize;
+ (void)registerValueMapping:(id)a3;
- (BOOL)evaluateWithValues:(id)a3;
- (NSCopying)value;
- (NSSet)containedProperties;
- (WFContentComparisonPredicate)initWithValue:(id)a3 valueBlock:(id)a4 property:(id)a5 comparisonType:(unint64_t)a6;
- (WFContentProperty)property;
- (id)comparableValueForValue:(id)a3;
- (id)description;
- (id)valueBlock;
- (unint64_t)comparisonType;
- (void)evaluateWithObject:(id)a3 propertySubstitutor:(id)a4 completionHandler:(id)a5;
@end

@implementation WFContentComparisonPredicate

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueBlock, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

- (unint64_t)comparisonType
{
  return self->_comparisonType;
}

- (id)valueBlock
{
  return self->_valueBlock;
}

- (NSCopying)value
{
  return self->_value;
}

- (WFContentProperty)property
{
  return self->_property;
}

- (NSSet)containedProperties
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(WFContentComparisonPredicate *)self property];
  v4 = [v2 setWithObject:v3];

  return (NSSet *)v4;
}

- (BOOL)evaluateWithValues:(id)a3
{
  id v4 = a3;
  v5 = [(WFContentComparisonPredicate *)self valueBlock];
  if (!v5)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__WFContentComparisonPredicate_evaluateWithValues___block_invoke;
    aBlock[3] = &unk_264287CC8;
    aBlock[4] = self;
    v5 = (uint64_t (**)(void, void))_Block_copy(aBlock);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__WFContentComparisonPredicate_evaluateWithValues___block_invoke_2;
  v9[3] = &unk_26428AD10;
  v9[4] = self;
  v6 = objc_msgSend(v4, "if_map:", v9);
  char v7 = ((uint64_t (**)(void, void *))v5)[2](v5, v6);

  return v7;
}

uint64_t __51__WFContentComparisonPredicate_evaluateWithValues___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) property];
  int v5 = [v4 multipleValues];

  if (!v5)
  {
    char v7 = (void *)MEMORY[0x263F08720];
    v8 = (void *)MEMORY[0x263F087F0];
    v9 = [v3 firstObject];
    v10 = [v8 expressionForConstantValue:v9];
    v11 = (void *)MEMORY[0x263F087F0];
    v12 = *(void **)(a1 + 32);
    v13 = [v12 value];
    v14 = [v12 comparableValueForValue:v13];
    v15 = [v11 expressionForConstantValue:v14];
    uint64_t v16 = [*(id *)(a1 + 32) comparisonType];
    v17 = [*(id *)(a1 + 32) property];
    v18 = objc_msgSend(v7, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v10, v15, 0, v16, objc_msgSend(v17, "caseInsensitive"));

LABEL_17:
    uint64_t v6 = objc_msgSend(v18, "evaluateWithObject:", 0, v32);

    goto LABEL_18;
  }
  if ([v3 count] || objc_msgSend(*(id *)(a1 + 32), "comparisonType") != 5)
  {
    v19 = objc_opt_new();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v32 = v3;
    id obj = v3;
    uint64_t v35 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v35)
    {
      uint64_t v34 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v37 != v34) {
            objc_enumerationMutation(obj);
          }
          v21 = (void *)MEMORY[0x263F08720];
          v22 = objc_msgSend(MEMORY[0x263F087F0], "expressionForConstantValue:", *(void *)(*((void *)&v36 + 1) + 8 * i), v32);
          v23 = (void *)MEMORY[0x263F087F0];
          v24 = *(void **)(a1 + 32);
          v25 = [v24 value];
          v26 = [v24 comparableValueForValue:v25];
          v27 = [v23 expressionForConstantValue:v26];
          uint64_t v28 = [*(id *)(a1 + 32) comparisonType];
          v29 = [*(id *)(a1 + 32) property];
          v30 = objc_msgSend(v21, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v22, v27, 0, v28, objc_msgSend(v29, "caseInsensitive"));
          [v19 addObject:v30];
        }
        uint64_t v35 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v35);
    }

    if ([*(id *)(a1 + 32) comparisonType] == 5) {
      [MEMORY[0x263F08730] andPredicateWithSubpredicates:v19];
    }
    else {
    v18 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v19];
    }
    id v3 = v32;

    goto LABEL_17;
  }
  uint64_t v6 = 1;
LABEL_18:

  return v6;
}

uint64_t __51__WFContentComparisonPredicate_evaluateWithValues___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) comparableValueForValue:a2];
}

- (void)evaluateWithObject:(id)a3 propertySubstitutor:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, id, void *))a4;
  v10 = (void (**)(id, void))a5;
  if (v10)
  {
    v11 = [(WFContentComparisonPredicate *)self property];
    if (v9
      && (v9[2](v9, v8, v11), uint64_t v12 = objc_claimAutoreleasedReturnValue(), v11, (v11 = (void *)v12) == 0))
    {
      v10[2](v10, 0);
    }
    else
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __89__WFContentComparisonPredicate_evaluateWithObject_propertySubstitutor_completionHandler___block_invoke;
      v13[3] = &unk_26428A598;
      v13[4] = self;
      v14 = v10;
      [v11 getValuesForObject:v8 completionHandler:v13];
    }
  }
}

uint64_t __89__WFContentComparisonPredicate_evaluateWithObject_propertySubstitutor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) evaluateWithValues:a2];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (id)comparableValueForValue:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)mappings;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      v10 = v4;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        uint64_t v12 = [(WFContentComparisonPredicate *)self property];
        (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v12, v10);
        id v4 = (id)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v4;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WFContentComparisonPredicate *)self property];
  uint64_t v7 = [(WFContentComparisonPredicate *)self value];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p, property: %@, value: %@, comparison: %lu>", v5, self, v6, v7, -[WFContentComparisonPredicate comparisonType](self, "comparisonType")];

  return v8;
}

- (WFContentComparisonPredicate)initWithValue:(id)a3 valueBlock:(id)a4 property:(id)a5 comparisonType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFContentComparisonPredicate;
  v13 = [(WFContentComparisonPredicate *)&v20 init];
  if (v13)
  {
    if ([v10 conformsToProtocol:&unk_26C745F88]) {
      long long v14 = (NSCopying *)[v10 copyWithZone:MEMORY[0x2166CEEB0]()];
    }
    else {
      long long v14 = (NSCopying *)v10;
    }
    value = v13->_value;
    v13->_value = v14;

    uint64_t v16 = [v11 copy];
    id valueBlock = v13->_valueBlock;
    v13->_id valueBlock = (id)v16;

    objc_storeStrong((id *)&v13->_property, a5);
    v13->_comparisonType = a6;
    v18 = v13;
  }

  return v13;
}

+ (void)initialize
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__WFContentComparisonPredicate_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, block);
  }
}

uint64_t __42__WFContentComparisonPredicate_initialize__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) registerValueMapping:&__block_literal_global_39_10902];
  [*(id *)(a1 + 32) registerValueMapping:&__block_literal_global_43];
  [*(id *)(a1 + 32) registerValueMapping:&__block_literal_global_47];
  [*(id *)(a1 + 32) registerValueMapping:&__block_literal_global_51];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 registerValueMapping:&__block_literal_global_55_10903];
}

id __42__WFContentComparisonPredicate_initialize__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 addressString];
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

id __42__WFContentComparisonPredicate_initialize__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 string];
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

id __42__WFContentComparisonPredicate_initialize__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 address];
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

id __42__WFContentComparisonPredicate_initialize__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 normalizedPhoneNumber];
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

id __42__WFContentComparisonPredicate_initialize__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 absoluteString];
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

+ (void)registerValueMapping:(id)a3
{
  uint64_t v3 = registerValueMapping__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&registerValueMapping__onceToken, &__block_literal_global_10916);
  }
  id v5 = (void *)mappings;
  id v6 = _Block_copy(v4);

  [v5 addObject:v6];
}

uint64_t __53__WFContentComparisonPredicate_registerValueMapping___block_invoke()
{
  mappings = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)predicateWithValueBlock:(id)a3 forProperty:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithValue:0 valueBlock:v7 property:v6 comparisonType:4];

  return v8;
}

+ (id)predicateWithValue:(id)a3 forProperty:(id)a4 comparisonType:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithValue:v9 valueBlock:0 property:v8 comparisonType:a5];

  return v10;
}

@end