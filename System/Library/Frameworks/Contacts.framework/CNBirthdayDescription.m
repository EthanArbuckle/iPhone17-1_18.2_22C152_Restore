@interface CNBirthdayDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isValidValue:(id)a3 error:(id *)a4;
- (BOOL)isValue:(id)a3 preferredToUnifiedValue:(id)a4;
- (CNBirthdayDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4;
- (id)CNValueFromABValue:(void *)a3;
- (id)fromPlistTransform;
- (void)ABValueFromCNValue:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNBirthdayDescription

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 birthday];
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49A60];
  }
  return a3 != 0;
}

- (CNBirthdayDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"birthday" readSelector:sel_birthday writeSelector:sel_setBirthday_];
}

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  id v5 = +[CNiOSABConversions dateFromABBytes:a3 length:a4];

  return [(CNBirthdayDescription *)self CNValueFromABValue:v5];
}

- (id)CNValueFromABValue:(void *)a3
{
  return (id)[MEMORY[0x1E4F5A390] dayComponentsFromDate:a3];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 birthday];
  if (!v8)
  {
    v4 = [v7 birthday];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 birthday];
  v10 = [v7 birthday];
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
  id v5 = a4;
  id v6 = a3;
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_birthday"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[27];
  v5[27] = v7;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 day];
  uint64_t v9 = [v7 day];
  uint64_t v22 = [v6 month];
  uint64_t v10 = [v7 month];
  char v11 = [v6 calendar];
  if (!v11)
  {
    v4 = [v7 calendar];
    if (!v4)
    {
      char v14 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v12 = [v6 calendar];
  v13 = [v7 calendar];
  char v14 = [v12 isEqual:v13];

  if (!v11) {
    goto LABEL_6;
  }
LABEL_7:

  uint64_t v15 = [v6 year];
  uint64_t v16 = [v7 year];
  uint64_t v17 = [v6 year];
  uint64_t v18 = [v7 year];
  char v19 = 0;
  if (v8 == v9 && v22 == v10)
  {
    char v20 = (v15 == 0x7FFFFFFFFFFFFFFFLL) ^ (v16 == 0x7FFFFFFFFFFFFFFFLL);
    if (v17 == v18) {
      char v20 = 1;
    }
    char v19 = v14 & v20;
  }

  return v19;
}

- (BOOL)isValue:(id)a3 preferredToUnifiedValue:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 year];
  uint64_t v7 = [v5 year];

  return v6 != 0x7FFFFFFFFFFFFFFFLL && v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNBirthdayDescription;
  unsigned int v7 = [(CNPropertyDescription *)&v13 isValidValue:v6 error:a4];
  BOOL v8 = v7;
  if (v6 && v7)
  {
    id v12 = 0;
    BOOL v8 = +[CN areValidGregorianDayComponents:v6 error:&v12];
    id v9 = v12;
    if (a4 && !v8)
    {
      uint64_t v10 = [(CNPropertyDescription *)self key];
      *a4 = +[CNErrorFactory errorByPrependingKeyPath:v10 toKeyPathsInError:v9];
    }
  }

  return v8;
}

- (id)fromPlistTransform
{
  return +[CN dateComponentsFromDictionaryTransform];
}

- (void)ABValueFromCNValue:(id)a3
{
  v3 = [MEMORY[0x1E4F5A390] dateFromDayComponents:a3];
  v4 = v3;
  if (v3 && (CFTypeRef v5 = CFRetain(v3)) != 0) {
    CFTypeRef v6 = CFAutorelease(v5);
  }
  else {
    CFTypeRef v6 = 0;
  }

  return (void *)v6;
}

@end