@interface _SFPerSitePreferencesUtilities
+ (BOOL)isBinaryPreferenceValueOn:(id)a3 preference:(id)a4 preferenceManager:(id)a5;
+ (id)preferenceValueForBoolValue:(BOOL)a3 preference:(id)a4 preferenceManager:(id)a5;
+ (id)preferenceValueForPSSpecifierValue:(id)a3 specifier:(id)a4 preference:(id)a5 preferenceManager:(id)a6;
+ (id)specifierValueForSpecifier:(id)a3 preferenceValue:(id)a4 preference:(id)a5 preferenceManager:(id)a6;
@end

@implementation _SFPerSitePreferencesUtilities

+ (id)preferenceValueForPSSpecifierValue:(id)a3 specifier:(id)a4 preference:(id)a5 preferenceManager:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([a4 cellType] == 6 && objc_msgSend(v12, "conformsToProtocol:", &unk_1EFC20430))
  {
    objc_msgSend(a1, "preferenceValueForBoolValue:preference:preferenceManager:", objc_msgSend(v10, "BOOLValue"), v11, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v14 = objc_msgSend(v12, "valuesForPreference:", v11, 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v19 isEqual:v10])
          {
            id v13 = v19;

            goto LABEL_14;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    id v13 = 0;
  }
LABEL_14:

  return v13;
}

+ (id)specifierValueForSpecifier:(id)a3 preferenceValue:(id)a4 preference:(id)a5 preferenceManager:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([a3 cellType] == 6)
  {
    objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isBinaryPreferenceValueOn:preference:preferenceManager:", v10, v11, v12));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = v10;
  }
  v14 = v13;

  return v14;
}

+ (BOOL)isBinaryPreferenceValueOn:(id)a3 preference:(id)a4 preferenceManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 conformsToProtocol:&unk_1EFC20430])
  {
    id v10 = [v9 onValueForPreference:v8];
    char v11 = [v7 isEqual:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (id)preferenceValueForBoolValue:(BOOL)a3 preference:(id)a4 preferenceManager:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v8 conformsToProtocol:&unk_1EFC20430])
  {
    if (a3) {
      [v8 onValueForPreference:v7];
    }
    else {
    id v9 = [v8 offValueForPreference:v7];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end