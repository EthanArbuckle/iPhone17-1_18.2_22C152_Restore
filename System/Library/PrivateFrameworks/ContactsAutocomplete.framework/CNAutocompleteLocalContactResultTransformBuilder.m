@interface CNAutocompleteLocalContactResultTransformBuilder
+ (id)localContactBuilderWithResultFactory:(id)a3;
+ (id)resultValueForContactPropertyValue:(id)a3 propertyKey:(id)a4 contact:(id)a5;
+ (id)serverContactBuilderWithResultFactory:(id)a3;
+ (id)suggestedContactBuilderWithResultFactory:(id)a3;
+ (int64_t)addressTypeForProperty:(id)a3;
- (CNAutocompleteLocalContactResultTransformBuilder)initWithResultFactory:(id)a3;
- (id)build;
- (id)buildAggregateTransform;
- (id)makeTransformForProperty:(id)a3;
- (unint64_t)builtContactType;
- (void)addTransformForProperty:(id)a3;
- (void)setBuiltContactType:(unint64_t)a3;
@end

@implementation CNAutocompleteLocalContactResultTransformBuilder

+ (id)localContactBuilderWithResultFactory:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithResultFactory:v4];

  [v5 setBuiltContactType:0];
  return v5;
}

+ (id)suggestedContactBuilderWithResultFactory:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithResultFactory:v4];

  [v5 setBuiltContactType:1];
  return v5;
}

+ (id)serverContactBuilderWithResultFactory:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithResultFactory:v4];

  [v5 setBuiltContactType:2];
  return v5;
}

- (CNAutocompleteLocalContactResultTransformBuilder)initWithResultFactory:(id)a3
{
  id v5 = a3;
  v6 = [(CNAutocompleteLocalContactResultTransformBuilder *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_factory, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    transforms = v7->_transforms;
    v7->_transforms = v8;

    v10 = v7;
  }

  return v7;
}

- (void)addTransformForProperty:(id)a3
{
  id v6 = [(CNAutocompleteLocalContactResultTransformBuilder *)self makeTransformForProperty:a3];
  transforms = self->_transforms;
  id v5 = _Block_copy(v6);
  [(NSMutableArray *)transforms _cn_addNonNilObject:v5];
}

- (id)makeTransformForProperty:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CNAutocompleteLocalContactResultTransformBuilder *)self builtContactType];
  id v6 = self->_factory;
  uint64_t v7 = objc_opt_class();
  id v8 = objc_alloc_init(MEMORY[0x1E4F1B910]);
  [v8 setStyle:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__CNAutocompleteLocalContactResultTransformBuilder_makeTransformForProperty___block_invoke;
  aBlock[3] = &unk_1E63DDCA0;
  id v16 = v4;
  id v17 = v8;
  uint64_t v19 = v7;
  unint64_t v20 = v5;
  v18 = v6;
  v9 = v6;
  id v10 = v8;
  id v11 = v4;
  v12 = _Block_copy(aBlock);
  v13 = (void *)[v12 copy];

  return v13;
}

id __77__CNAutocompleteLocalContactResultTransformBuilder_makeTransformForProperty___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 valueForKey:*(void *)(a1 + 32)];
  unint64_t v5 = [*(id *)(a1 + 40) stringFromContact:v3];
  id v6 = sNameComponentsFromContact_block_invoke((uint64_t)v5, v3);
  v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = [*(id *)(a1 + 56) resultValueForContactPropertyValue:*(void *)(*((void *)&v24 + 1) + 8 * v10) propertyKey:*(void *)(a1 + 32) contact:v3];
        uint64_t v12 = *(void *)(a1 + 64);
        if (v12 == 1)
        {
          uint64_t v13 = [*(id *)(a1 + 48) suggestedResultWithDisplayName:v5 value:v11 nameComponents:v6];
LABEL_10:
          v14 = (void *)v13;
          if (!v13) {
            goto LABEL_12;
          }
LABEL_11:
          [v23 addObject:v14];
          goto LABEL_12;
        }
        if (v12 == 2)
        {
          uint64_t v13 = [*(id *)(a1 + 48) directoryServerResultWithDisplayName:v5 value:v11 nameComponents:v6];
          goto LABEL_10;
        }
        if ([v3 hasBeenPersisted])
        {
          v15 = [v3 linkIdentifier];
          id v16 = v15;
          if (v15)
          {
            id v17 = v15;
          }
          else
          {
            id v17 = [v3 identifier];
          }
          v18 = v17;
        }
        else
        {
          v18 = 0;
        }
        v14 = [*(id *)(a1 + 48) localContactResultWithDisplayName:v5 value:v11 nameComponents:v6 contactIdentifier:v18];

        if (v14) {
          goto LABEL_11;
        }
LABEL_12:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v8 = v19;
    }
    while (v19);
  }

  unint64_t v20 = (void *)[v23 copy];
  return v20;
}

+ (int64_t)addressTypeForProperty:(id)a3
{
  uint64_t v3 = addressTypeForProperty__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&addressTypeForProperty__onceToken, &__block_literal_global_8);
  }
  unint64_t v5 = [(id)addressTypeForProperty__sTypesByKeyMap objectForKey:v4];

  int64_t v6 = objc_msgSend(v5, "_cnac_autocompleteAddressTypeValue");
  return v6;
}

void __75__CNAutocompleteLocalContactResultTransformBuilder_addressTypeForProperty___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v0 setObject:&unk_1F1A3BE00 forKey:*MEMORY[0x1E4F1ADC8]];
  [v0 setObject:&unk_1F1A3BE18 forKey:*MEMORY[0x1E4F1AEE0]];
  [v0 setObject:&unk_1F1A3BE30 forKey:*MEMORY[0x1E4F1AE60]];
  v1 = (void *)addressTypeForProperty__sTypesByKeyMap;
  addressTypeForProperty__sTypesByKeyMap = (uint64_t)v0;
}

+ (id)resultValueForContactPropertyValue:(id)a3 propertyKey:(id)a4 contact:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [a1 addressTypeForProperty:v9];
  uint64_t v12 = objc_alloc_init(CNAutocompleteResultValue);
  uint64_t v13 = [v8 label];
  [(CNAutocompleteResultValue *)v12 setLabel:v13];

  if ([v10 hasBeenPersisted])
  {
    v14 = [v8 identifier];
    [(CNAutocompleteResultValue *)v12 setIdentifier:v14];
  }
  [(CNAutocompleteResultValue *)v12 setAddressType:v11];
  switch(v11)
  {
    case 1:
      objc_opt_class();
      unint64_t v20 = [v8 value];
      if (objc_opt_isKindOfClass()) {
        v21 = v20;
      }
      else {
        v21 = 0;
      }
      id v17 = v21;

      if (v17) {
        [(CNAutocompleteResultValue *)v12 setAddress:v17];
      }
      break;
    case 2:
      objc_opt_class();
      v22 = [v8 value];
      if (objc_opt_isKindOfClass()) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }
      id v17 = v23;

      if (!v17) {
        break;
      }
      uint64_t v19 = [v17 stringValue];
      [(CNAutocompleteResultValue *)v12 setAddress:v19];
LABEL_21:

      break;
    case 3:
      objc_opt_class();
      v15 = [v8 value];
      if (objc_opt_isKindOfClass()) {
        id v16 = v15;
      }
      else {
        id v16 = 0;
      }
      id v17 = v16;

      if (!v17) {
        break;
      }
      v18 = [v17 username];
      [(CNAutocompleteResultValue *)v12 setAddress:v18];

      uint64_t v19 = [v17 service];
      [(CNAutocompleteResultValue *)v12 setInstantMessageAddressService:v19];
      goto LABEL_21;
    default:
      id v17 = CNALoggingContextDebug();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138412546;
        id v26 = v9;
        __int16 v27 = 2112;
        id v28 = v10;
        _os_log_impl(&dword_1BEF57000, v17, OS_LOG_TYPE_DEFAULT, "Unknown address type for property: %@ contact: %@", (uint8_t *)&v25, 0x16u);
      }
      break;
  }

  return v12;
}

- (id)build
{
  uint64_t v3 = [(NSMutableArray *)self->_transforms count];
  transforms = self->_transforms;
  if (v3 == 1)
  {
    unint64_t v5 = [(NSMutableArray *)transforms lastObject];
    int64_t v6 = (void *)[v5 copy];
  }
  else
  {
    if ((unint64_t)[(NSMutableArray *)transforms count] < 2)
    {
      uint64_t v7 = (uint64_t)_Block_copy((const void *)*MEMORY[0x1E4F5A248]);
    }
    else
    {
      uint64_t v7 = [(CNAutocompleteLocalContactResultTransformBuilder *)self buildAggregateTransform];
    }
    int64_t v6 = (void *)v7;
  }
  return v6;
}

- (id)buildAggregateTransform
{
  v2 = (void *)[(NSMutableArray *)self->_transforms copy];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__CNAutocompleteLocalContactResultTransformBuilder_buildAggregateTransform__block_invoke;
  aBlock[3] = &unk_1E63DDCF0;
  id v8 = v2;
  id v3 = v2;
  id v4 = _Block_copy(aBlock);
  unint64_t v5 = (void *)[v4 copy];

  return v5;
}

id __75__CNAutocompleteLocalContactResultTransformBuilder_buildAggregateTransform__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__CNAutocompleteLocalContactResultTransformBuilder_buildAggregateTransform__block_invoke_2;
  v9[3] = &unk_1E63DDCC8;
  id v10 = v3;
  id v5 = v3;
  int64_t v6 = objc_msgSend(v4, "_cn_map:", v9);
  uint64_t v7 = objc_msgSend(v6, "_cn_flatten");

  return v7;
}

uint64_t __75__CNAutocompleteLocalContactResultTransformBuilder_buildAggregateTransform__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (unint64_t)builtContactType
{
  return self->_builtContactType;
}

- (void)setBuiltContactType:(unint64_t)a3
{
  self->_builtContactType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_transforms, 0);
}

@end