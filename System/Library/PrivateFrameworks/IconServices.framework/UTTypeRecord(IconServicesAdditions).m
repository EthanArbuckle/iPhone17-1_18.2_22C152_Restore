@interface UTTypeRecord(IconServicesAdditions)
+ (uint64_t)_IS_tagFromTypeCode:()IconServicesAdditions;
+ (uint64_t)_IS_typeCodeFromTag:()IconServicesAdditions;
- (id)_ICP_filenameExtensions;
- (id)_IS_iconProvidingRecordAcceptingWildCard:()IconServicesAdditions;
- (id)_IS_symbolHeroName;
- (id)_IS_symbolName;
- (id)_IS_symbolNameForVariantKey:()IconServicesAdditions;
- (id)_IS_symbolProvidingRecordWithVariantKey:()IconServicesAdditions allowNonVariantMatch:preferHeroOverBaseSymbol:;
- (uint64_t)_IS_allowsArbitraryExtensionAsText;
- (uint64_t)_IS_primaryFilenameExtension;
- (uint64_t)_IS_symbolProvidingRecord;
- (uint64_t)_IS_symbolProvidingRecordWithVariantKey:()IconServicesAdditions allowNonVariantMatch:;
@end

@implementation UTTypeRecord(IconServicesAdditions)

- (id)_IS_symbolName
{
  v1 = [a1 iconDictionary];
  v2 = objc_msgSend(v1, "_IF_stringForKey:", 0x1F063A3B0);

  return v2;
}

- (id)_IS_symbolProvidingRecordWithVariantKey:()IconServicesAdditions allowNonVariantMatch:preferHeroOverBaseSymbol:
{
  id v8 = a3;
  id v9 = a1;
  uint64_t v22 = 0;
  v23 = (id *)&v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __125__UTTypeRecord_IconServicesAdditions___IS_symbolProvidingRecordWithVariantKey_allowNonVariantMatch_preferHeroOverBaseSymbol___block_invoke;
  v18[3] = &unk_1E5F08E18;
  id v10 = v8;
  id v19 = v10;
  char v20 = a4;
  char v21 = a5;
  v11 = (unsigned int (**)(void, void))MEMORY[0x1B3E71130](v18);
  if (((unsigned int (**)(void, id))v11)[2](v11, v9)) {
    objc_storeStrong(v23 + 5, a1);
  }
  id v12 = v23[5];
  if (!v12)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __125__UTTypeRecord_IconServicesAdditions___IS_symbolProvidingRecordWithVariantKey_allowNonVariantMatch_preferHeroOverBaseSymbol___block_invoke_2;
    v15[3] = &unk_1E5F08DF0;
    v16 = v11;
    v17 = &v22;
    [v9 enumeratePedigreeWithBlock:v15];

    id v12 = v23[5];
  }
  id v13 = v12;

  _Block_object_dispose(&v22, 8);
  return v13;
}

- (uint64_t)_IS_symbolProvidingRecordWithVariantKey:()IconServicesAdditions allowNonVariantMatch:
{
  return objc_msgSend(a1, "_IS_symbolProvidingRecordWithVariantKey:allowNonVariantMatch:preferHeroOverBaseSymbol:", a3, a4, 0);
}

+ (uint64_t)_IS_tagFromTypeCode:()IconServicesAdditions
{
  return 0;
}

+ (uint64_t)_IS_typeCodeFromTag:()IconServicesAdditions
{
  return 0;
}

- (id)_IS_iconProvidingRecordAcceptingWildCard:()IconServicesAdditions
{
  id v5 = a1;
  uint64_t v15 = 0;
  v16 = (id *)&v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__UTTypeRecord_IconServicesAdditions___IS_iconProvidingRecordAcceptingWildCard___block_invoke;
  v13[3] = &__block_descriptor_33_e22_B16__0__UTTypeRecord_8l;
  char v14 = a3;
  v6 = (unsigned int (**)(void, void))MEMORY[0x1B3E71130](v13);
  if (((unsigned int (**)(void, id))v6)[2](v6, v5)) {
    objc_storeStrong(v16 + 5, a1);
  }
  id v7 = v16[5];
  if (!v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __80__UTTypeRecord_IconServicesAdditions___IS_iconProvidingRecordAcceptingWildCard___block_invoke_2;
    v10[3] = &unk_1E5F08DF0;
    v11 = v6;
    id v12 = &v15;
    [v5 enumeratePedigreeWithBlock:v10];

    id v7 = v16[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (id)_IS_symbolNameForVariantKey:()IconServicesAdditions
{
  id v4 = a3;
  id v5 = [a1 iconDictionary];
  v6 = objc_msgSend(v5, "_IF_dictionaryForKey:", 0x1F063A3D0);
  id v7 = objc_msgSend(v6, "_IF_stringForKey:", v4);

  return v7;
}

- (id)_IS_symbolHeroName
{
  v1 = [a1 iconDictionary];
  v2 = objc_msgSend(v1, "_IF_stringForKey:", 0x1F063A3F0);

  return v2;
}

- (uint64_t)_IS_symbolProvidingRecord
{
  return objc_msgSend(a1, "_IS_symbolProvidingRecordWithVariantKey:allowNonVariantMatch:preferHeroOverBaseSymbol:", 0, 1, 0);
}

- (uint64_t)_IS_allowsArbitraryExtensionAsText
{
  v1 = [a1 iconDictionary];
  v2 = [v1 objectForKeyedSubscript:0x1F063A390];

  uint64_t v3 = [v2 isEqual:@"*"];
  return v3;
}

- (uint64_t)_IS_primaryFilenameExtension
{
  return [a1 preferredTagOfClass:*MEMORY[0x1E4F224F8]];
}

- (id)_ICP_filenameExtensions
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 tagSpecification];
  uint64_t v3 = *MEMORY[0x1E4F224F8];
  id v4 = [v2 objectForKey:*MEMORY[0x1E4F224F8] ofClass:objc_opt_class()];

  if (v4)
  {
    v12[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    v6 = [a1 tagSpecification];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = [v6 objectForKey:v3 ofClass:v7 valuesOfClass:objc_opt_class()];
    id v9 = (void *)v8;
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
    if (v8) {
      id v10 = (void *)v8;
    }
    id v5 = v10;
  }
  return v5;
}

@end