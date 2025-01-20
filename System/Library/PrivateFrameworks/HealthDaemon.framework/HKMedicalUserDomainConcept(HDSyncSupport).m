@interface HKMedicalUserDomainConcept(HDSyncSupport)
- (id)codableSubclassData;
- (void)applyCodableSubclassData:()HDSyncSupport mutableUserDomainConceptProperties:;
@end

@implementation HKMedicalUserDomainConcept(HDSyncSupport)

- (void)applyCodableSubclassData:()HDSyncSupport mutableUserDomainConceptProperties:
{
  id v4 = a3;
  v7 = [[HDCodableMedicalUserDomainConcept alloc] initWithData:v4];

  if (v7)
  {
    v5 = PBRepeatedInt64NSArray();
    [a1 _setCategoryTypes:v5];

    v6 = [(HDCodableMedicalUserDomainConcept *)v7 countryCode];
    [a1 _setCountryCode:v6];
  }
}

- (id)codableSubclassData
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(HDCodableMedicalUserDomainConcept);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a1, "categoryTypes", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        -[HDCodableMedicalUserDomainConcept addCategoryTypes:](v2, "addCategoryTypes:", [*(id *)(*((void *)&v11 + 1) + 8 * i) longLongValue]);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v8 = [a1 countryCode];
  [(HDCodableMedicalUserDomainConcept *)v2 setCountryCode:v8];

  v9 = [(HDCodableMedicalUserDomainConcept *)v2 data];

  return v9;
}

@end