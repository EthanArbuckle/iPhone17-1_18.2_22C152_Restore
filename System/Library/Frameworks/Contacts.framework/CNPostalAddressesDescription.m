@interface CNPostalAddressesDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)address:(id)a3 winsTieBreakerAgainstAddress:(id)a4;
- (BOOL)address:(id)a3 winsTieBreakerAgainstAddressUsingPostalCodeCompleteness:(id)a4;
- (BOOL)address:(id)a3 winsTieBreakerAgainstAddressUsingStateNameCompleteness:(id)a4;
- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isNonnull;
- (BOOL)isPostalCodeValue:(id)a3 equivalentToValue:(id)a4;
- (BOOL)isStateValue:(id)a3 equivalentToValue:(id)a4;
- (BOOL)isValue:(id)a3 equivalentToValue:(id)a4 forKey:(id)a5;
- (BOOL)isValue:(id)a3 preferredToUnifiedValue:(id)a4;
- (BOOL)postalCodeIsMoreComplete:(id)a3;
- (CNPostalAddressesDescription)init;
- (Class)labeledValueClass;
- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3;
- (id)CNValueForContact:(id)a3;
- (id)dictionaryTransform;
- (id)fromDictionaryTransform;
- (id)summarizationKeys;
- (unint64_t)indexOfUSState:(id)a3;
- (unint64_t)preferenceScoreForAddress:(id)a3;
- (unint64_t)preferenceScoreForKey:(id)a3;
- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNPostalAddressesDescription

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 postalAddresses];
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCountry:");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPostalCode:");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setState:");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCity:");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStreet:");
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F499E0];
  }
  return a3 != 0;
}

- (CNPostalAddressesDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"postalAddresses" readSelector:sel_postalAddresses writeSelector:sel_setPostalAddresses_];
}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3
{
  if (CNLabeledValueValueFromABMultiValueValue__cn_once_token_4 != -1) {
    dispatch_once(&CNLabeledValueValueFromABMultiValueValue__cn_once_token_4, &__block_literal_global_112);
  }
  id v5 = (id)CNLabeledValueValueFromABMultiValueValue__cn_once_object_4;
  v6 = [(CNMultiValuePropertyDescription *)self CNLabeledValueValueFromABMultiValueValue:a3 destinationClass:objc_opt_class() settersByABKeys:v5];

  return v6;
}

void __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke()
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v11[0] = *MEMORY[0x1E4F499F0];
  v0 = (void *)[&__block_literal_global_114_0 copy];
  v12[0] = v0;
  v11[1] = *MEMORY[0x1E4F49A00];
  v1 = (void *)[&__block_literal_global_116_0 copy];
  v12[1] = v1;
  v11[2] = *MEMORY[0x1E4F499C8];
  v2 = (void *)[&__block_literal_global_118 copy];
  v12[2] = v2;
  v11[3] = *MEMORY[0x1E4F499F8];
  v3 = (void *)[&__block_literal_global_120_0 copy];
  v12[3] = v3;
  v11[4] = *MEMORY[0x1E4F499E8];
  v4 = (void *)[&__block_literal_global_122_0 copy];
  v12[4] = v4;
  v11[5] = *MEMORY[0x1E4F49A08];
  id v5 = (void *)[&__block_literal_global_124 copy];
  v12[5] = v5;
  v11[6] = *MEMORY[0x1E4F499D8];
  v6 = (void *)[&__block_literal_global_126 copy];
  v12[6] = v6;
  v11[7] = *MEMORY[0x1E4F499D0];
  v7 = (void *)[&__block_literal_global_128_0 copy];
  v12[7] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:8];
  uint64_t v9 = [v8 copy];
  v10 = (void *)CNLabeledValueValueFromABMultiValueValue__cn_once_object_4;
  CNLabeledValueValueFromABMultiValueValue__cn_once_object_4 = v9;
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 postalAddresses];
  if (!v8)
  {
    v4 = [v7 postalAddresses];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  uint64_t v9 = [v6 postalAddresses];
  v10 = [v7 postalAddresses];
  char v11 = [v9 isEqual:v10];

  if (!v8) {
    goto LABEL_6;
  }
LABEL_7:

  return v11;
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v12 count:3];
  for (uint64_t i = 16; i != -8; i -= 8)

  uint64_t v9 = objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, @"_postalAddresses", v12, v13);
  uint64_t v10 = [v9 copy];
  char v11 = (void *)v6[55];
  v6[55] = v10;
}

- (BOOL)isNonnull
{
  return 1;
}

- (id)dictionaryTransform
{
  return +[CN postalAddressToDictionaryTransform];
}

- (id)fromDictionaryTransform
{
  return +[CN postalAddressFromDictionaryTransform];
}

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  v25[6] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v25[0] = @"street";
  v25[1] = @"subLocality";
  v25[2] = @"city";
  v25[3] = @"subAdministrativeArea";
  v25[4] = @"state";
  v25[5] = @"postalCode";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v14 = [v5 valueForKey:v13];
        uint64_t v15 = [v6 valueForKey:v13];
        v16 = (void *)v15;
        if (v14) {
          BOOL v17 = v15 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17)
        {
          if (![(CNPostalAddressesDescription *)self isValue:v14 equivalentToValue:v15 forKey:v13])
          {

            goto LABEL_16;
          }
          char v10 = 1;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_16:
    char v10 = 0;
  }

  return v10 & 1;
}

- (BOOL)isValue:(id)a3 equivalentToValue:(id)a4 forKey:(id)a5
{
  uint64_t v8 = (__CFString *)a3;
  uint64_t v9 = (__CFString *)a4;
  id v10 = a5;
  if (v8) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = &stru_1EE052B80;
  }
  if (v9) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = &stru_1EE052B80;
  }
  if ([(__CFString *)v11 localizedCaseInsensitiveCompare:v12])
  {
    if ([v10 isEqual:@"state"])
    {
      char v13 = [(CNPostalAddressesDescription *)self isStateValue:v8 equivalentToValue:v9];
    }
    else if ([v10 isEqual:@"postalCode"])
    {
      char v13 = [(CNPostalAddressesDescription *)self isPostalCodeValue:v8 equivalentToValue:v9];
    }
    else
    {
      if (![v10 isEqual:@"street"])
      {
        BOOL v14 = 0;
        goto LABEL_16;
      }
      char v13 = [MEMORY[0x1E4F5A4A8] isStreetAddress:v8 equivalentToStreetAddress:v9];
    }
    BOOL v14 = v13;
  }
  else
  {
    BOOL v14 = 1;
  }
LABEL_16:

  return v14;
}

- (BOOL)isStateValue:(id)a3 equivalentToValue:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(CNPostalAddressesDescription *)self indexOfUSState:a3];
  unint64_t v8 = [(CNPostalAddressesDescription *)self indexOfUSState:v6];

  return v7 == v8;
}

- (unint64_t)indexOfUSState:(id)a3
{
  id v3 = a3;
  v4 = +[CNAddressFormats usaStateAbbreviations];
  unint64_t v5 = [v4 indexOfObject:v3];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = +[CNAddressFormats usaStateNames];
    unint64_t v5 = [v6 indexOfObject:v3];
  }
  return v5;
}

- (BOOL)isPostalCodeValue:(id)a3 equivalentToValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    if ([v5 hasPrefix:v6] & 1) != 0 || (objc_msgSend(v6, "hasPrefix:", v5))
    {
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v9 = [v5 stringByReplacingOccurrencesOfString:@" " withString:&stru_1EE052B80];
      id v10 = [v6 stringByReplacingOccurrencesOfString:@" " withString:&stru_1EE052B80];
      BOOL v7 = [v9 localizedCaseInsensitiveCompare:v10] == 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isValue:(id)a3 preferredToUnifiedValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(CNPostalAddressesDescription *)self preferenceScoreForAddress:v6];
  unint64_t v9 = [(CNPostalAddressesDescription *)self preferenceScoreForAddress:v7];
  if (v8 == v9) {
    BOOL v10 = [(CNPostalAddressesDescription *)self address:v6 winsTieBreakerAgainstAddress:v7];
  }
  else {
    BOOL v10 = v8 > v9;
  }

  return v10;
}

- (unint64_t)preferenceScoreForAddress:(id)a3
{
  v19[7] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19[0] = @"street";
  v19[1] = @"subLocality";
  v19[2] = @"city";
  v19[3] = @"subAdministrativeArea";
  v19[4] = @"state";
  v19[5] = @"postalCode";
  v19[6] = @"ISOCountryCode";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:7];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v4, "valueForKey:", v11, (void)v14);
        if (v12)
        {
          v8 += [(CNPostalAddressesDescription *)self preferenceScoreForKey:v11];
          if ([@"postalCode" isEqualToString:v11]) {
            v8 += [(CNPostalAddressesDescription *)self postalCodeIsMoreComplete:v12];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)preferenceScoreForKey:(id)a3
{
  if ([@"street" isEqual:a3]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)postalCodeIsMoreComplete:(id)a3
{
  return [a3 rangeOfString:@"-"] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)address:(id)a3 winsTieBreakerAgainstAddress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CNPostalAddressesDescription *)self address:v6 winsTieBreakerAgainstAddressUsingPostalCodeCompleteness:v7]|| [(CNPostalAddressesDescription *)self address:v6 winsTieBreakerAgainstAddressUsingStateNameCompleteness:v7];

  return v8;
}

- (BOOL)address:(id)a3 winsTieBreakerAgainstAddressUsingPostalCodeCompleteness:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 street];
  if (![v7 length])
  {

LABEL_5:
    uint64_t v11 = [v5 postalCode];
    if ([v11 length])
    {
      uint64_t v12 = [v5 postalCode];
      char v13 = [v6 postalCode];
      char v14 = [v12 isEqual:v13];

      if (v14)
      {
        BOOL v10 = 0;
        goto LABEL_11;
      }
      uint64_t v11 = [v5 postalCode];
      unint64_t v15 = [v11 length];
      long long v16 = [v6 postalCode];
      BOOL v10 = v15 > [v16 length];
    }
    else
    {
      BOOL v10 = 0;
    }

    goto LABEL_11;
  }
  BOOL v8 = [v6 street];
  uint64_t v9 = [v8 length];

  if (v9) {
    goto LABEL_5;
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)address:(id)a3 winsTieBreakerAgainstAddressUsingStateNameCompleteness:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CNAddressFormats usaStateNames];
  BOOL v8 = [v6 state];

  if ([v7 containsObject:v8])
  {
    uint64_t v9 = [v5 state];
    int v10 = [v7 containsObject:v9] ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)summarizationKeys
{
  if (summarizationKeys_cn_once_token_11 != -1) {
    dispatch_once(&summarizationKeys_cn_once_token_11, &__block_literal_global_842);
  }
  v2 = (void *)summarizationKeys_cn_once_object_11;

  return v2;
}

uint64_t __49__CNPostalAddressesDescription_summarizationKeys__block_invoke()
{
  summarizationKeys_cn_once_object_11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"street", @"subLocality", @"city", @"subAdministrativeArea", @"state", @"postalCode", @"country", 0);

  return MEMORY[0x1F41817F8]();
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSubLocality:");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSubAdministrativeArea:");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setISOCountryCode:");
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3
{
  uint64_t v4 = ABMultiValueValueFromCNLabeledValueValue__cn_once_token_5;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&ABMultiValueValueFromCNLabeledValueValue__cn_once_token_5, &__block_literal_global_131_0);
  }
  id v6 = [(CNMultiValuePropertyDescription *)self ABMultiValueValueFromCNLabeledValueValue:v5 gettersByABKeys:ABMultiValueValueFromCNLabeledValueValue__cn_once_object_5];

  return v6;
}

void __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke()
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v11[0] = *MEMORY[0x1E4F499F0];
  v0 = (void *)[&__block_literal_global_133 copy];
  v12[0] = v0;
  v11[1] = *MEMORY[0x1E4F49A00];
  v1 = (void *)[&__block_literal_global_135 copy];
  v12[1] = v1;
  v11[2] = *MEMORY[0x1E4F499C8];
  v2 = (void *)[&__block_literal_global_137_0 copy];
  v12[2] = v2;
  v11[3] = *MEMORY[0x1E4F499F8];
  id v3 = (void *)[&__block_literal_global_139 copy];
  v12[3] = v3;
  v11[4] = *MEMORY[0x1E4F499E8];
  uint64_t v4 = (void *)[&__block_literal_global_141 copy];
  v12[4] = v4;
  v11[5] = *MEMORY[0x1E4F49A08];
  id v5 = (void *)[&__block_literal_global_143_0 copy];
  v12[5] = v5;
  v11[6] = *MEMORY[0x1E4F499D8];
  id v6 = (void *)[&__block_literal_global_145 copy];
  v12[6] = v6;
  v11[7] = *MEMORY[0x1E4F499D0];
  id v7 = (void *)[&__block_literal_global_147 copy];
  v12[7] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:8];
  uint64_t v9 = [v8 copy];
  int v10 = (void *)ABMultiValueValueFromCNLabeledValueValue__cn_once_object_5;
  ABMultiValueValueFromCNLabeledValueValue__cn_once_object_5 = v9;
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 street];
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 subLocality];
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 city];
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 subAdministrativeArea];
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 state];
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 postalCode];
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 country];
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 ISOCountryCode];
}

@end