@interface CNPhonemeDataDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (CNPhonemeDataDescription)init;
- (id)CNValueForContact:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNPhonemeDataDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 phonemeData];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49CE0];
  }
  return a3 != 0;
}

- (CNPhonemeDataDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"phonemeData" readSelector:sel_phonemeData writeSelector:sel_setPhonemeData_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 phonemeData];
  if (!v8)
  {
    v4 = [v7 phonemeData];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 phonemeData];
  v10 = [v7 phonemeData];
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
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_phonemeData"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[43];
  v5[43] = v7;
}

@end