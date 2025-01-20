@interface NSDictionary
@end

@implementation NSDictionary

void __99__NSDictionary_FMDVolatileMetaDataRecord__fm_dictionaryByDeeplySettingValuesForKeysWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    v8 = [v7 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = objc_msgSend(v8, "fm_dictionaryByDeeplySettingValuesForKeysWithDictionary:", v5);
      [*(id *)(a1 + 32) setObject:v9 forKey:v10];
    }
    else
    {
      [*(id *)(a1 + 32) setObject:v5 forKey:v10];
    }
  }
  else
  {
    [v7 setObject:v5 forKey:v10];
  }
}

@end