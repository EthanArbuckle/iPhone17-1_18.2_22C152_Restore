@interface CNPreviousFamilyNameDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isNonnull;
- (CNPreviousFamilyNameDescription)init;
- (id)CNValueForContact:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNPreviousFamilyNameDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 previousFamilyName];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49D08];
  }
  return a3 != 0;
}

- (CNPreviousFamilyNameDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"previousFamilyName" readSelector:sel_previousFamilyName writeSelector:sel_setPreviousFamilyName_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 previousFamilyName];
  if (!v8)
  {
    v4 = [v7 previousFamilyName];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 previousFamilyName];
  v10 = [v7 previousFamilyName];
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
  v5 = a4;
  id v6 = a3;
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_previousFamilyName"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[9];
  v5[9] = v7;
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
    v5 = (__CFString *)a4;
  }
  else {
    v5 = &stru_1EE052B80;
  }
  return [(__CFString *)v4 localizedCaseInsensitiveCompare:v5] == 0;
}

@end