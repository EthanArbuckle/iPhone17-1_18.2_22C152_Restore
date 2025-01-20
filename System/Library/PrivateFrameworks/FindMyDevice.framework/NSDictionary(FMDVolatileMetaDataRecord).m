@interface NSDictionary(FMDVolatileMetaDataRecord)
- (id)fm_dictionaryByDeeplySettingValuesForKeysWithDictionary:()FMDVolatileMetaDataRecord;
@end

@implementation NSDictionary(FMDVolatileMetaDataRecord)

- (id)fm_dictionaryByDeeplySettingValuesForKeysWithDictionary:()FMDVolatileMetaDataRecord
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99__NSDictionary_FMDVolatileMetaDataRecord__fm_dictionaryByDeeplySettingValuesForKeysWithDictionary___block_invoke;
  v8[3] = &unk_1E689C4E8;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

@end