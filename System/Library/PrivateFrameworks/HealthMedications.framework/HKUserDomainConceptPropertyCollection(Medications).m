@interface HKUserDomainConceptPropertyCollection(Medications)
+ (id)_userDomainConceptPropertyListWithFreeTextMedicationName:()Medications freeTextFormCode:namedQuantities:;
+ (id)propertyCollectionWithUserSpecifiedName:()Medications userSpecifiedNotes:medicationVisualizationConfig:freeTextProperties:;
+ (id)userDomainConceptPropertyListWithFreeTextMedicationName:()Medications freeTextFormCode:freeTextStrengthQuantity:;
@end

@implementation HKUserDomainConceptPropertyCollection(Medications)

+ (id)propertyCollectionWithUserSpecifiedName:()Medications userSpecifiedNotes:medicationVisualizationConfig:freeTextProperties:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v9)
  {
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F2B638]) initWithType:160000 version:1 stringValue:v9];
    [v13 addObject:v14];
  }
  if (v10)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F2B638]) initWithType:160001 version:1 stringValue:v10];
    [v13 addObject:v15];
  }
  if (v11 && [v11 length])
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F2B638]) initWithType:160008 version:1 stringValue:v11];
    [v13 addObject:v16];
  }
  if (v12) {
    [v13 addObjectsFromArray:v12];
  }
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F2B668]) initWithProperties:v13];

  return v17;
}

+ (id)userDomainConceptPropertyListWithFreeTextMedicationName:()Medications freeTextFormCode:freeTextStrengthQuantity:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a5)
  {
    id v9 = (objc_class *)MEMORY[0x1E4F2B658];
    id v10 = a5;
    id v11 = (void *)[[v9 alloc] initWithName:0 quantity:v10 type:160021];

    v15[0] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v13 = [a1 _userDomainConceptPropertyListWithFreeTextMedicationName:v8 freeTextFormCode:a4 namedQuantities:v12];

  return v13;
}

+ (id)_userDomainConceptPropertyListWithFreeTextMedicationName:()Medications freeTextFormCode:namedQuantities:
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v7 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v8 = a5;
  id v9 = a3;
  id v10 = [v7 alloc];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F2B638]) initWithType:160020 version:1 stringValue:v9];

  v16[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v13 = (void *)[v10 initWithArray:v12];

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F2B638]) initWithType:160014 version:1 integerValue:a4];
  [v13 addObject:v14];

  [v13 addObjectsFromArray:v8];

  return v13;
}

@end