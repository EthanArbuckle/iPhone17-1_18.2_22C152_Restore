@interface CNImageTypeDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (CNImageTypeDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNImageTypeDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 imageType];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49B38];
  }
  return a3 != 0;
}

- (CNImageTypeDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"imageType" readSelector:sel_imageType writeSelector:sel_setImageType_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 imageType];
  if (!v8)
  {
    v4 = [v7 imageType];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 imageType];
  v10 = [v7 imageType];
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
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_imageType"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[78];
  v5[78] = v7;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

@end