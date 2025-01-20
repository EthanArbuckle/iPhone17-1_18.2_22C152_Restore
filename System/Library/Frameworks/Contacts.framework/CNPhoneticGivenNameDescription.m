@interface CNPhoneticGivenNameDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isNonnull;
- (CNPhoneticGivenNameDescription)init;
- (id)CNValueForContact:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNPhoneticGivenNameDescription

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 phoneticGivenName];
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49AF0];
  }
  return a3 != 0;
}

- (CNPhoneticGivenNameDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"phoneticGivenName" readSelector:sel_phoneticGivenName writeSelector:sel_setPhoneticGivenName_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 phoneticGivenName];
  if (!v8)
  {
    v4 = [v7 phoneticGivenName];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 phoneticGivenName];
  v10 = [v7 phoneticGivenName];
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
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_phoneticGivenName"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[11];
  v5[11] = v7;
}

- (BOOL)isNonnull
{
  return 1;
}

@end