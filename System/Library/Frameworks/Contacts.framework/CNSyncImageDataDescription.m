@interface CNSyncImageDataDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5;
- (BOOL)setCNValue:(id)a3 onABPerson:(void *)a4 withDependentPropertiesContext:(id)a5 error:(id *)a6;
- (CNSyncImageDataDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (void)ABValueForABPerson:(void *)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNSyncImageDataDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 syncImageData];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49908];
  }
  return a3 != 0;
}

- (CNSyncImageDataDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"syncImageData" readSelector:sel_syncImageData writeSelector:sel_setSyncImageData_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 syncImageData];
  if (!v8)
  {
    v4 = [v7 syncImageData];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 syncImageData];
  v10 = [v7 syncImageData];
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
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_syncImageData"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[39];
  v5[39] = v7;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (void)ABValueForABPerson:(void *)a3
{
  result = ABPersonCopyImageDataWithFormat(a3, (ABPersonImageFormat)5u);
  if (result)
  {
    return (void *)CFAutorelease(result);
  }
  return result;
}

- (BOOL)setCNValue:(id)a3 onABPerson:(void *)a4 withDependentPropertiesContext:(id)a5 error:(id *)a6
{
  return 1;
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

@end