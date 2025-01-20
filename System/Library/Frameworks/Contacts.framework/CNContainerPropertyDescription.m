@interface CNContainerPropertyDescription
- (BOOL)isConvertibleABValue:(void *)a3;
- (BOOL)isValidValue:(id)a3 error:(id *)a4;
- (BOOL)isValue:(id)a3 equalToEmptyEquivalentOrValue:(id)a4;
- (BOOL)isWritable;
- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5;
- (Class)valueClass;
- (NSString)key;
- (id)CNValueForContainer:(id)a3;
- (id)CNValueFromABValue:(void *)a3;
- (id)nilValue;
- (int)abPropertyID;
- (void)ABValueForABSource:(void *)a3;
- (void)ABValueFromCNValue:(id)a3;
- (void)setCNValue:(id)a3 onContainer:(id)a4;
@end

@implementation CNContainerPropertyDescription

- (NSString)key
{
  v2 = self;
  CNAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (BOOL)isWritable
{
  return 0;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6 || ([(CNContainerPropertyDescription *)self valueClass], (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (a4)
    {
      +[CNErrorFactory errorWithCode:301 userInfo:0];
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)CNValueForContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  CNAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CNAbstractMethodException();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (id)nilValue
{
  if (objc_opt_isKindOfClass()) {
    return &stru_1EE052B80;
  }
  else {
    return 0;
  }
}

- (BOOL)isValue:(id)a3 equalToEmptyEquivalentOrValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    id v6 = [(CNContainerPropertyDescription *)self nilValue];
    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    v8 = [(CNContainerPropertyDescription *)self nilValue];
    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  char v9 = [MEMORY[0x1E4F5A3E0] isObject:v6 equalToOther:v8];

  return v9;
}

- (int)abPropertyID
{
  v2 = self;
  CNAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)ABValueFromCNValue:(id)a3
{
  return a3;
}

- (id)CNValueFromABValue:(void *)a3
{
  return a3;
}

- (BOOL)isConvertibleABValue:(void *)a3
{
  return 1;
}

- (void)ABValueForABSource:(void *)a3
{
  result = (void *)ABRecordCopyValue(a3, [(CNContainerPropertyDescription *)self abPropertyID]);
  if (result)
  {
    return (void *)CFAutorelease(result);
  }
  return result;
}

- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5
{
  ABPropertyID v8 = [(CNContainerPropertyDescription *)self abPropertyID];

  return ABRecordSetValue(a4, v8, a3, a5);
}

@end