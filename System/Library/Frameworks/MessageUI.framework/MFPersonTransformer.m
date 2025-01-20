@interface MFPersonTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation MFPersonTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1B8F8];
  v5 = objc_msgSend(v3, "ea_uncommentedAddress");
  v6 = [v4 predicateForContactsMatchingEmailAddress:v5];

  v23[0] = *MEMORY[0x1E4F1ADC8];
  v7 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v23[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];

  v9 = [MEMORY[0x1E4F1B980] storeWithOptions:1];
  id v22 = 0;
  v10 = [v9 unifiedContactsMatchingPredicate:v6 keysToFetch:v8 error:&v22];
  id v11 = v22;
  id v12 = objc_alloc(MEMORY[0x1E4F305B8]);
  v13 = objc_msgSend(v3, "ea_uncommentedAddress");
  v14 = (void *)[v12 initWithValue:v13 type:1];

  if (v11 || ![v10 count])
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F305B0]) initWithPersonHandle:v14 nameComponents:0 displayName:0 image:0 contactIdentifier:0 customIdentifier:0];
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x1E4F305B0]);
    v17 = [v10 firstObject];
    v18 = (void *)[v16 initWithContact:v17];

    [v18 setPersonHandle:v14];
    v15 = v18;
  }
  v19 = objc_msgSend(v3, "ea_personNameComponents");
  if (v19) {
    [v15 setNameComponents:v19];
  }
  v20 = [MEMORY[0x1E4F605B0] displayNameFromAddress:v3];
  if (v20) {
    [v15 setDisplayName:v20];
  }

  return v15;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3 = [a3 personHandle];
  if ([v3 type] == 1)
  {
    v4 = [v3 value];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end