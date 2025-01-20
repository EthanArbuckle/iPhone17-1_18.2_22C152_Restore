@interface CNImageBackgroundColorsDataDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (CNImageBackgroundColorsDataDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNImageBackgroundColorsDataDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 imageBackgroundColorsData];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49B20];
  }
  return a3 != 0;
}

- (CNImageBackgroundColorsDataDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"imageBackgroundColorsData" readSelector:sel_imageBackgroundColorsData writeSelector:sel_setImageBackgroundColorsData_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 imageBackgroundColorsData];
  if (!v8)
  {
    v4 = [v7 imageBackgroundColorsData];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 imageBackgroundColorsData];
  v10 = [v7 imageBackgroundColorsData];
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
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_imageBackgroundColorsData"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[85];
  v5[85] = v7;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  return +[CNiOSABConversions dataFromABBytes:a3 length:a4];
}

@end