@interface CNPhoneNumbersDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isNonnull;
- (CNPhoneNumbersDescription)init;
- (Class)labeledValueClass;
- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3;
- (id)CNLabeledValueValueFromABMultiValueValueBytes:(char *)a3 length:(unint64_t)a4;
- (id)CNValueForContact:(id)a3;
- (id)equivalentLabelSets;
- (id)fromPlistTransform;
- (id)plistTransform;
- (id)standardLabels;
- (id)stringForIndexingForContact:(id)a3;
- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNPhoneNumbersDescription

- (id)CNLabeledValueValueFromABMultiValueValueBytes:(char *)a3 length:(unint64_t)a4
{
  v4 = a3;
  if (a3)
  {
    uint64_t v5 = [[NSString alloc] initWithBytes:a3 length:a4 encoding:4];
    if (v5)
    {
      v6 = (void *)v5;
      v4 = +[CNPhoneNumber phoneNumberWithCopiedStringValue:v5];
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  return [a3 isLikePhoneNumberForSamePerson:a4];
}

- (id)equivalentLabelSets
{
  if (equivalentLabelSets_cn_once_token_2 != -1) {
    dispatch_once(&equivalentLabelSets_cn_once_token_2, &__block_literal_global_618);
  }
  v2 = (void *)equivalentLabelSets_cn_once_object_2;

  return v2;
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 phoneNumbers];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49CC8];
  }
  return a3 != 0;
}

void __48__CNPhoneNumbersDescription_equivalentLabelSets__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C978]);
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"iPhone", @"Apple Watch", @"_$!<Mobile>!$_", 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_$!<Main>!$_", @"_$!<Home>!$_", 0);
  uint64_t v2 = objc_msgSend(v0, "initWithObjects:", v4, v1, 0);
  v3 = (void *)equivalentLabelSets_cn_once_object_2;
  equivalentLabelSets_cn_once_object_2 = v2;
}

- (CNPhoneNumbersDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"phoneNumbers" readSelector:sel_phoneNumbers writeSelector:sel_setPhoneNumbers_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 phoneNumbers];
  if (!v8)
  {
    id v4 = [v7 phoneNumbers];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 phoneNumbers];
  v10 = [v7 phoneNumbers];
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

  v9 = objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, @"_phoneNumbers", v12, v13);
  uint64_t v10 = [v9 copy];
  char v11 = (void *)v6[48];
  v6[48] = v10;
}

- (BOOL)isNonnull
{
  return 1;
}

- (id)standardLabels
{
  if (standardLabels_cn_once_token_3 != -1) {
    dispatch_once(&standardLabels_cn_once_token_3, &__block_literal_global_620);
  }
  uint64_t v2 = (void *)standardLabels_cn_once_object_3;

  return v2;
}

uint64_t __43__CNPhoneNumbersDescription_standardLabels__block_invoke()
{
  standardLabels_cn_once_object_3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"_$!<Mobile>!$_", @"_$!<Home>!$_", @"_$!<Work>!$_", @"_$!<School>!$_", @"iPhone", @"Apple Watch", @"_$!<Main>!$_", @"_$!<HomeFAX>!$_", @"_$!<WorkFAX>!$_", @"_$!<Pager>!$_", @"_$!<Other>!$_", 0);

  return MEMORY[0x1F41817F8]();
}

- (id)stringForIndexingForContact:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 phoneNumbers];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28E78] string];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v18 = v3;
    id v7 = [v3 phoneNumbers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) value];
          uint64_t v13 = [v12 digits];
          uint64_t v14 = [v12 countryCode];
          uint64_t v15 = (void *)_PNCopyIndexStringsForAddressBookSearch();

          if (v15)
          {
            v16 = [v15 componentsJoinedByString:@" "];
            [v6 appendString:v16];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    id v3 = v18;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)plistTransform
{
  return +[CN phoneNumberToStringTransform];
}

- (id)fromPlistTransform
{
  return +[CN phoneNumberFromStringTransform];
}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3
{
  if (a3)
  {
    CFTypeID v5 = CFGetTypeID(a3);
    if (v5 == CFStringGetTypeID())
    {
      id v6 = +[CNPhoneNumber phoneNumberWithCopiedStringValue:a3];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 stringValue];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end