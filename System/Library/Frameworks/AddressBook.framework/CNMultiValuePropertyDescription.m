@interface CNMultiValuePropertyDescription
@end

@implementation CNMultiValuePropertyDescription

id __101__CNMultiValuePropertyDescription_ABSExtentions__multiValueTransformWithLabelMapping_valueTransform___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(void *)(a1 + 40))
  {
    v5 = [v3 value];
    v6 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v7 = [v4 label];
    v8 = [*(id *)(a1 + 32) mappedConstant:v7];
    v9 = (void *)[v6 copy];
    id v10 = [v4 labeledValueBySettingLabel:v8 value:v9];
  }
  else
  {
    id v10 = v3;
  }

  return v10;
}

id __141__CNMultiValuePropertyDescription_ABSExtentions__dictionaryBasedMultiValueTransformWithLabelMapping_inputKeys_destinationClass_valueMapping___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc_init(*(Class *)(a1 + 48));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(*(id *)(a1 + 40), "mappedConstant:", v10, (void)v15);
        v12 = [v3 valueForKey:v10];
        v13 = [*(id *)(a1 + 40) mappedConstant:v12];
        [v4 setValue:v13 forKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

@end