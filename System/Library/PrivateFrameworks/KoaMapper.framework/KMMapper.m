@interface KMMapper
@end

@implementation KMMapper

void __63__KMMapper_INVocabularyItem__fieldTypeNumberForIntentSlotName___block_invoke()
{
  v22[19] = *MEMORY[0x263EF8340];
  v21[0] = *MEMORY[0x263F0F850];
  v20 = KVFieldTypeToNumber();
  v22[0] = v20;
  v21[1] = *MEMORY[0x263F0F848];
  v19 = KVFieldTypeToNumber();
  v22[1] = v19;
  v21[2] = *MEMORY[0x263F0F898];
  v18 = KVFieldTypeToNumber();
  v22[2] = v18;
  v21[3] = *MEMORY[0x263F0F888];
  v17 = KVFieldTypeToNumber();
  v22[3] = v17;
  v21[4] = *MEMORY[0x263F0F820];
  v16 = KVFieldTypeToNumber();
  v22[4] = v16;
  v21[5] = *MEMORY[0x263F0F840];
  v15 = KVFieldTypeToNumber();
  v22[5] = v15;
  v21[6] = *MEMORY[0x263F0F838];
  v14 = KVFieldTypeToNumber();
  v22[6] = v14;
  v21[7] = *MEMORY[0x263F0F880];
  v13 = KVFieldTypeToNumber();
  v22[7] = v13;
  v21[8] = *MEMORY[0x263F0F878];
  v12 = KVFieldTypeToNumber();
  v22[8] = v12;
  v21[9] = *MEMORY[0x263F0F870];
  v0 = KVFieldTypeToNumber();
  v22[9] = v0;
  v21[10] = *MEMORY[0x263F0F868];
  v1 = KVFieldTypeToNumber();
  v22[10] = v1;
  v21[11] = *MEMORY[0x263F0F8A0];
  v2 = KVFieldTypeToNumber();
  v22[11] = v2;
  v21[12] = *MEMORY[0x263F0F860];
  v3 = KVFieldTypeToNumber();
  v22[12] = v3;
  v21[13] = *MEMORY[0x263F0F830];
  v4 = KVFieldTypeToNumber();
  v22[13] = v4;
  v21[14] = *MEMORY[0x263F0F828];
  v5 = KVFieldTypeToNumber();
  v22[14] = v5;
  v21[15] = *MEMORY[0x263F0F8A8];
  v6 = KVFieldTypeToNumber();
  v22[15] = v6;
  v21[16] = *MEMORY[0x263F0F8B0];
  v7 = KVFieldTypeToNumber();
  v22[16] = v7;
  v21[17] = *MEMORY[0x263F0F890];
  v8 = KVFieldTypeToNumber();
  v22[17] = v8;
  v21[18] = *MEMORY[0x263F0F858];
  v9 = KVFieldTypeToNumber();
  v22[18] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:19];
  v11 = (void *)_fieldTypeNumberForIntentSlotName__intentSlotToFieldTypeMap;
  _fieldTypeNumberForIntentSlotName__intentSlotToFieldTypeMap = v10;
}

void __73__KMMapper_LSApplicationRecord_addAlternativeNamesFor_forLanguage_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 valueForKey:@"INAlternativeAppName"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 length])
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        id v8 = objc_alloc(MEMORY[0x263F086E0]);
        v9 = [*(id *)(a1 + 32) URL];
        uint64_t v10 = [v8 initWithURL:v9];
        uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
        v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;
      }
      v13 = [MEMORY[0x263F28530] sharedInstance];
      v14 = [v13 localizedStringForKey:v7 table:@"InfoPlist" bundle:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) languageCode:*(void *)(a1 + 40)];

      if (![v14 length])
      {
        id v15 = v7;

        v14 = v15;
      }
      v16 = *(void **)(*(void *)(a1 + 48) + 8);
      uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v17 + 40);
      v18 = [v16 addFieldWithType:104 value:v14 error:&obj];
      objc_storeStrong((id *)(v17 + 40), obj);

      if (!v18) {
        *a4 = 1;
      }
    }
  }
}

@end