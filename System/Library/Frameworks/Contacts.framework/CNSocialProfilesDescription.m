@interface CNSocialProfilesDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isNonnull;
- (CNSocialProfilesDescription)init;
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

@implementation CNSocialProfilesDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 socialProfiles];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49D30];
  }
  return a3 != 0;
}

- (CNSocialProfilesDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"socialProfiles" readSelector:sel_socialProfiles writeSelector:sel_setSocialProfiles_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 socialProfiles];
  if (!v8)
  {
    v4 = [v7 socialProfiles];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 socialProfiles];
  v10 = [v7 socialProfiles];
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

  v9 = objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, @"_socialProfiles", v12, v13);
  uint64_t v10 = [v9 copy];
  char v11 = (void *)v6[54];
  v6[54] = v10;
}

- (BOOL)isNonnull
{
  return 1;
}

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CN socialProfileToFoundationProfileTransform];
  v8 = ((void (**)(void, id))v7)[2](v7, v6);

  v9 = +[CN socialProfileToFoundationProfileTransform];
  uint64_t v10 = ((void (**)(void, id))v9)[2](v9, v5);

  LOBYTE(v9) = CNSocialProfileEquivalentValues();
  return (char)v9;
}

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

- (id)dictionaryTransform
{
  return +[CN socialProfileToDictionaryTransform];
}

- (id)fromDictionaryTransform
{
  return +[CN socialProfileFromDictionaryTransform];
}

- (id)summarizationKeys
{
  if (summarizationKeys_cn_once_token_10 != -1) {
    dispatch_once(&summarizationKeys_cn_once_token_10, &__block_literal_global_823);
  }
  v2 = (void *)summarizationKeys_cn_once_object_10;

  return v2;
}

uint64_t __48__CNSocialProfilesDescription_summarizationKeys__block_invoke()
{
  summarizationKeys_cn_once_object_10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"username", @"userIdentifier", @"displayname", 0);

  return MEMORY[0x1F41817F8]();
}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3
{
  if (CNLabeledValueValueFromABMultiValueValue__cn_once_token_2 != -1) {
    dispatch_once(&CNLabeledValueValueFromABMultiValueValue__cn_once_token_2, &__block_literal_global_79_0);
  }
  id v5 = (id)CNLabeledValueValueFromABMultiValueValue__cn_once_object_2;
  id v6 = [(CNMultiValuePropertyDescription *)self CNLabeledValueValueFromABMultiValueValue:a3 destinationClass:objc_opt_class() settersByABKeys:v5];

  return v6;
}

void __79__CNSocialProfilesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke()
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v10[0] = *MEMORY[0x1E4F49D78];
  v0 = (void *)[&__block_literal_global_81_1 copy];
  v11[0] = v0;
  v10[1] = *MEMORY[0x1E4F49D50];
  v1 = (void *)[&__block_literal_global_83_0 copy];
  v11[1] = v1;
  v10[2] = *MEMORY[0x1E4F49D88];
  v2 = (void *)[&__block_literal_global_85_1 copy];
  v11[2] = v2;
  v10[3] = *MEMORY[0x1E4F49D80];
  v3 = (void *)[&__block_literal_global_87 copy];
  v11[3] = v3;
  v10[4] = *MEMORY[0x1E4F49D28];
  v4 = (void *)[&__block_literal_global_89_1 copy];
  v11[4] = v4;
  v10[5] = *MEMORY[0x1E4F49AB0];
  id v5 = (void *)[&__block_literal_global_91 copy];
  v11[5] = v5;
  v10[6] = *MEMORY[0x1E4F49AA8];
  id v6 = (void *)[&__block_literal_global_93_0 copy];
  v11[6] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:7];
  uint64_t v8 = [v7 copy];
  v9 = (void *)CNLabeledValueValueFromABMultiValueValue__cn_once_object_2;
  CNLabeledValueValueFromABMultiValueValue__cn_once_object_2 = v8;
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUrlString:");
}

void __79__CNSocialProfilesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v4 = a3;
  id v5 = +[CNiOSABConstantsMapping ABToCNPersonSocialProfileConstantsMapping];

  id v6 = v4;
  if (v5)
  {
    id v7 = +[CNiOSABConstantsMapping ABToCNPersonSocialProfileConstantsMapping];
    id v6 = [v7 mappedConstant:v4];
  }
  [v8 setService:v6];
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUsername:");
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserIdentifier:");
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisplayname:");
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTeamIdentifier:");
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBundleIdentifiers:");
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3
{
  uint64_t v4 = ABMultiValueValueFromCNLabeledValueValue__cn_once_token_3;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&ABMultiValueValueFromCNLabeledValueValue__cn_once_token_3, &__block_literal_global_96_0);
  }
  id v6 = [(CNMultiValuePropertyDescription *)self ABMultiValueValueFromCNLabeledValueValue:v5 gettersByABKeys:ABMultiValueValueFromCNLabeledValueValue__cn_once_object_3];

  return v6;
}

void __79__CNSocialProfilesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke()
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v10[0] = *MEMORY[0x1E4F49D78];
  v0 = (void *)[&__block_literal_global_98_0 copy];
  v11[0] = v0;
  v10[1] = *MEMORY[0x1E4F49D50];
  v1 = (void *)[&__block_literal_global_100 copy];
  v11[1] = v1;
  v10[2] = *MEMORY[0x1E4F49D88];
  v2 = (void *)[&__block_literal_global_102 copy];
  v11[2] = v2;
  v10[3] = *MEMORY[0x1E4F49D80];
  v3 = (void *)[&__block_literal_global_104_0 copy];
  v11[3] = v3;
  v10[4] = *MEMORY[0x1E4F49D28];
  uint64_t v4 = (void *)[&__block_literal_global_106_0 copy];
  v11[4] = v4;
  v10[5] = *MEMORY[0x1E4F49AB0];
  id v5 = (void *)[&__block_literal_global_108 copy];
  v11[5] = v5;
  v10[6] = *MEMORY[0x1E4F49AA8];
  id v6 = (void *)[&__block_literal_global_110_1 copy];
  v11[6] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:7];
  uint64_t v8 = [v7 copy];
  v9 = (void *)ABMultiValueValueFromCNLabeledValueValue__cn_once_object_3;
  ABMultiValueValueFromCNLabeledValueValue__cn_once_object_3 = v8;
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 urlString];
}

id __79__CNSocialProfilesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 service];
  v3 = +[CNiOSABConstantsMapping CNToABPersonSocialProfileConstantsMapping];

  if (v3)
  {
    uint64_t v4 = +[CNiOSABConstantsMapping CNToABPersonSocialProfileConstantsMapping];
    uint64_t v5 = [v4 mappedConstant:v2];

    v2 = (void *)v5;
  }

  return v2;
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 username];
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 userIdentifier];
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 displayname];
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 teamIdentifier];
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifiers];
}

@end