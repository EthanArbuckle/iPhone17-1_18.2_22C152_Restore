@interface LNDeferredLocalizedString(CATSupport)
- (id)localizedKeyWithParameters;
- (id)parameterDefinitions;
- (id)parametersForCAT;
@end

@implementation LNDeferredLocalizedString(CATSupport)

- (id)parametersForCAT
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = [a1 arguments];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__LNDeferredLocalizedString_CATSupport__parametersForCAT__block_invoke;
  v6[3] = &unk_1E5B38A68;
  id v4 = v2;
  id v7 = v4;
  [v3 enumerateObjectsUsingBlock:v6];

  return v4;
}

- (id)parameterDefinitions
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v3 = [a1 arguments];
  id v4 = objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count"));

  v5 = [a1 arguments];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__LNDeferredLocalizedString_CATSupport__parameterDefinitions__block_invoke;
  v8[3] = &unk_1E5B38A68;
  id v6 = v4;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  return v6;
}

- (id)localizedKeyWithParameters
{
  if (localizedKeyWithParameters_onceToken != -1) {
    dispatch_once(&localizedKeyWithParameters_onceToken, &__block_literal_global_2778);
  }
  id v2 = [a1 localizedKey];
  v3 = objc_msgSend(v2, "ln_stringByEscapingForXML");
  id v4 = (void *)[v3 mutableCopy];

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v5 = (void *)localizedKeyWithParameters_regularExpression;
  id v6 = [a1 localizedKey];
  id v7 = [a1 localizedKey];
  uint64_t v8 = [v7 length];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__LNDeferredLocalizedString_CATSupport__localizedKeyWithParameters__block_invoke_2;
  v13[3] = &unk_1E5B38A40;
  v13[4] = a1;
  v15 = v17;
  v16 = v18;
  id v9 = v4;
  id v14 = v9;
  objc_msgSend(v5, "enumerateMatchesInString:options:range:usingBlock:", v6, 0, 0, v8, v13);

  v10 = v14;
  id v11 = v9;

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v18, 8);
  return v11;
}

@end