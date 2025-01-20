@interface HKConcept(Medications)
- (id)meds_englishUSName;
- (id)meds_preferredNameForFirstObjectOfRelationshipType:()Medications;
- (uint64_t)_meds_isA:()Medications;
- (uint64_t)meds_isClinicalProduct;
- (uint64_t)meds_isIngredientProduct;
- (uint64_t)meds_isRoutedDoseFormProduct;
- (uint64_t)meds_isSpecificProduct;
- (uint64_t)meds_isTradeNameProduct;
@end

@implementation HKConcept(Medications)

- (uint64_t)_meds_isA:()Medications
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = objc_msgSend(a1, "relationships", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v9 type] == 1015)
        {
          v10 = [v9 destination];
          v11 = [v10 identifier];
          uint64_t v12 = [v11 rawIdentifier];

          if (v12 == a3)
          {
            uint64_t v13 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 0;
LABEL_12:

  return v13;
}

- (uint64_t)meds_isSpecificProduct
{
  return objc_msgSend(a1, "_meds_isA:", 841);
}

- (uint64_t)meds_isIngredientProduct
{
  return objc_msgSend(a1, "_meds_isA:", 844);
}

- (uint64_t)meds_isClinicalProduct
{
  return objc_msgSend(a1, "_meds_isA:", 842);
}

- (uint64_t)meds_isRoutedDoseFormProduct
{
  return objc_msgSend(a1, "_meds_isA:", 843);
}

- (uint64_t)meds_isTradeNameProduct
{
  return objc_msgSend(a1, "_meds_isA:", 845);
}

- (id)meds_preferredNameForFirstObjectOfRelationshipType:()Medications
{
  v1 = objc_msgSend(a1, "firstConceptOfRelationshipType:");
  v2 = [v1 localizedPreferredName];

  return v2;
}

- (id)meds_englishUSName
{
  v1 = [a1 firstAttributeForType:960];
  v2 = [v1 stringValue];

  return v2;
}

@end