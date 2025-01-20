@interface LNDeferredLocalizedString
@end

@implementation LNDeferredLocalizedString

void __57__LNDeferredLocalizedString_CATSupport__parametersForCAT__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 valueType];
  v4 = objc_msgSend(v7, "cat_value:", v3);
  v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(v3, "cat_parameterName");

  [v5 setObject:v4 forKeyedSubscript:v6];
}

void __61__LNDeferredLocalizedString_CATSupport__parameterDefinitions__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "cat_definitionXML");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __67__LNDeferredLocalizedString_CATSupport__localizedKeyWithParameters__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 arguments];
  id v10 = [v5 objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];

  v6 = objc_msgSend(v10, "cat_variableXML");
  uint64_t v7 = [v4 range];
  uint64_t v9 = v8;

  objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + v7, v9, v6);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v6 length] - v9;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

uint64_t __67__LNDeferredLocalizedString_CATSupport__localizedKeyWithParameters__block_invoke()
{
  localizedKeyWithParameters_regularExpression = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(\\%[\\@ldfu0-9.]+)" options:0 error:0];
  return MEMORY[0x1F41817F8]();
}

@end