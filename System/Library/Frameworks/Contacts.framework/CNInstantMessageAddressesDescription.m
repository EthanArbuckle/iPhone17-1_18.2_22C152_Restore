@interface CNInstantMessageAddressesDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isNonnull;
- (CNInstantMessageAddressesDescription)init;
- (Class)labeledValueClass;
- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3;
- (id)CNValueForContact:(id)a3;
- (id)dictionaryTransform;
- (id)fromDictionaryTransform;
- (id)summarizationKeys;
- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNInstantMessageAddressesDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 instantMessageAddresses];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49B48];
  }
  return a3 != 0;
}

- (CNInstantMessageAddressesDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"instantMessageAddresses" readSelector:sel_instantMessageAddresses writeSelector:sel_setInstantMessageAddresses_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 instantMessageAddresses];
  if (!v8)
  {
    v4 = [v7 instantMessageAddresses];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 instantMessageAddresses];
  v10 = [v7 instantMessageAddresses];
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

  v9 = objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, @"_instantMessageAddresses", v12, v13);
  uint64_t v10 = [v9 copy];
  char v11 = (void *)v6[52];
  v6[52] = v10;
}

- (BOOL)isNonnull
{
  return 1;
}

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v6;
  v9 = [v7 username];
  uint64_t v10 = [v8 username];
  if (v9) {
    char v11 = v9;
  }
  else {
    char v11 = &stru_1EE052B80;
  }
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = &stru_1EE052B80;
  }
  uint64_t v13 = [(__CFString *)v11 localizedCaseInsensitiveCompare:v12];

  uint64_t v14 = [v7 service];
  uint64_t v15 = [v8 service];
  if (v14) {
    v16 = v14;
  }
  else {
    v16 = &stru_1EE052B80;
  }
  if (v15) {
    v17 = v15;
  }
  else {
    v17 = &stru_1EE052B80;
  }
  uint64_t v18 = [(__CFString *)v16 localizedCaseInsensitiveCompare:v17];

  v19 = [v7 userIdentifier];
  if (v19 || ([v8 userIdentifier], (uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v20 = [v7 userIdentifier];
    v21 = [v8 userIdentifier];
    char v22 = [v20 isEqual:v21];

    if (v19) {
      goto LABEL_19;
    }
  }
  else
  {
    char v22 = 1;
  }

LABEL_19:
  if (v13 | v18) {
    BOOL v23 = 0;
  }
  else {
    BOOL v23 = v22;
  }

  return v23;
}

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

- (id)dictionaryTransform
{
  return +[CN instantMessageAddressToDictionaryTransform];
}

- (id)fromDictionaryTransform
{
  return +[CN instantMessageAddressFromDictionaryTransform];
}

- (id)summarizationKeys
{
  if (summarizationKeys_cn_once_token_9 != -1) {
    dispatch_once(&summarizationKeys_cn_once_token_9, &__block_literal_global_808);
  }
  v2 = (void *)summarizationKeys_cn_once_object_9;

  return v2;
}

uint64_t __57__CNInstantMessageAddressesDescription_summarizationKeys__block_invoke()
{
  summarizationKeys_cn_once_object_9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"username", @"service", 0);

  return MEMORY[0x1F41817F8]();
}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3
{
  if (CNLabeledValueValueFromABMultiValueValue__cn_once_token_0 != -1) {
    dispatch_once(&CNLabeledValueValueFromABMultiValueValue__cn_once_token_0, &__block_literal_global_80);
  }
  id v5 = (id)CNLabeledValueValueFromABMultiValueValue__cn_once_object_0;
  id v6 = [(CNMultiValuePropertyDescription *)self CNLabeledValueValueFromABMultiValueValue:a3 destinationClass:objc_opt_class() settersByABKeys:v5];

  return v6;
}

void __88__CNInstantMessageAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke()
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = *MEMORY[0x1E4F49BB0];
  v0 = (void *)[&__block_literal_global_54_1 copy];
  v9[0] = v0;
  v8[1] = *MEMORY[0x1E4F49BA8];
  v1 = (void *)[&__block_literal_global_56_1 copy];
  v9[1] = v1;
  v8[2] = *MEMORY[0x1E4F49B80];
  v2 = (void *)[&__block_literal_global_58_0 copy];
  v9[2] = v2;
  v8[3] = *MEMORY[0x1E4F49AB0];
  v3 = (void *)[&__block_literal_global_60_2 copy];
  v9[3] = v3;
  v8[4] = *MEMORY[0x1E4F49AA8];
  v4 = (void *)[&__block_literal_global_62 copy];
  v9[4] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
  uint64_t v6 = [v5 copy];
  id v7 = (void *)CNLabeledValueValueFromABMultiValueValue__cn_once_object_0;
  CNLabeledValueValueFromABMultiValueValue__cn_once_object_0 = v6;
}

uint64_t __88__CNInstantMessageAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUsername:");
}

uint64_t __88__CNInstantMessageAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserIdentifier:");
}

void __88__CNInstantMessageAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v4 = a3;
  id v5 = +[CNiOSABConstantsMapping ABToCNPersonInstantMessageConstantsMapping];

  uint64_t v6 = v4;
  if (v5)
  {
    id v7 = +[CNiOSABConstantsMapping ABToCNPersonInstantMessageConstantsMapping];
    uint64_t v6 = [v7 mappedConstant:v4];
  }
  [v8 setService:v6];
}

uint64_t __88__CNInstantMessageAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTeamIdentifier:");
}

uint64_t __88__CNInstantMessageAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBundleIdentifiers:");
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3
{
  uint64_t v4 = ABMultiValueValueFromCNLabeledValueValue__cn_once_token_1;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&ABMultiValueValueFromCNLabeledValueValue__cn_once_token_1, &__block_literal_global_66_0);
  }
  uint64_t v6 = [(CNMultiValuePropertyDescription *)self ABMultiValueValueFromCNLabeledValueValue:v5 gettersByABKeys:ABMultiValueValueFromCNLabeledValueValue__cn_once_object_1];

  return v6;
}

void __88__CNInstantMessageAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke()
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = *MEMORY[0x1E4F49BB0];
  v0 = (void *)[&__block_literal_global_69 copy];
  v9[0] = v0;
  v8[1] = *MEMORY[0x1E4F49BA8];
  v1 = (void *)[&__block_literal_global_71_0 copy];
  v9[1] = v1;
  v8[2] = *MEMORY[0x1E4F49B80];
  v2 = (void *)[&__block_literal_global_73 copy];
  v9[2] = v2;
  v8[3] = *MEMORY[0x1E4F49AB0];
  v3 = (void *)[&__block_literal_global_75 copy];
  v9[3] = v3;
  v8[4] = *MEMORY[0x1E4F49AA8];
  uint64_t v4 = (void *)[&__block_literal_global_77 copy];
  v9[4] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
  uint64_t v6 = [v5 copy];
  id v7 = (void *)ABMultiValueValueFromCNLabeledValueValue__cn_once_object_1;
  ABMultiValueValueFromCNLabeledValueValue__cn_once_object_1 = v6;
}

uint64_t __88__CNInstantMessageAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 username];
}

uint64_t __88__CNInstantMessageAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 userIdentifier];
}

id __88__CNInstantMessageAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 service];
  v3 = +[CNiOSABConstantsMapping CNToABPersonInstantMessageConstantsMapping];

  if (v3)
  {
    uint64_t v4 = +[CNiOSABConstantsMapping CNToABPersonInstantMessageConstantsMapping];
    uint64_t v5 = [v4 mappedConstant:v2];

    v2 = (void *)v5;
  }

  return v2;
}

uint64_t __88__CNInstantMessageAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 teamIdentifier];
}

uint64_t __88__CNInstantMessageAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifiers];
}

@end