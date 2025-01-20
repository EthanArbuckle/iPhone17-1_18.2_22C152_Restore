@interface CNUrlAddressesDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isNonnull;
- (CNUrlAddressesDescription)init;
- (id)CNValueForContact:(id)a3;
- (id)standardLabels;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNUrlAddressesDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 urlAddresses];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49DB0];
  }
  return a3 != 0;
}

- (CNUrlAddressesDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"urlAddresses" readSelector:sel_urlAddresses writeSelector:sel_setUrlAddresses_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 urlAddresses];
  if (!v8)
  {
    v4 = [v7 urlAddresses];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 urlAddresses];
  v10 = [v7 urlAddresses];
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

  v9 = objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, @"_urlAddresses", v12, v13);
  uint64_t v10 = [v9 copy];
  char v11 = (void *)v6[50];
  v6[50] = v10;
}

- (BOOL)isNonnull
{
  return 1;
}

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  if (a3) {
    v4 = (__CFString *)a3;
  }
  else {
    v4 = &stru_1EE052B80;
  }
  if (a4) {
    id v5 = (__CFString *)a4;
  }
  else {
    id v5 = &stru_1EE052B80;
  }
  return [(__CFString *)v4 localizedCaseInsensitiveCompare:v5] == 0;
}

- (id)standardLabels
{
  if (standardLabels_cn_once_token_5 != -1) {
    dispatch_once(&standardLabels_cn_once_token_5, &__block_literal_global_650);
  }
  v2 = (void *)standardLabels_cn_once_object_5;

  return v2;
}

uint64_t __43__CNUrlAddressesDescription_standardLabels__block_invoke()
{
  standardLabels_cn_once_object_5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"_$!<HomePage>!$_", @"_$!<Home>!$_", @"_$!<Work>!$_", @"_$!<School>!$_", @"_$!<Other>!$_", 0);

  return MEMORY[0x1F41817F8]();
}

@end