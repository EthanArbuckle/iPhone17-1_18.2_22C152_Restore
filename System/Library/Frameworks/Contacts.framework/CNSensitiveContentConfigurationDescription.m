@interface CNSensitiveContentConfigurationDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (CNSensitiveContentConfigurationDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4;
- (id)CNValueFromABValue:(void *)a3;
- (void)ABValueFromCNValue:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNSensitiveContentConfigurationDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 sensitiveContentConfiguration];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49D18];
  }
  return a3 != 0;
}

- (CNSensitiveContentConfigurationDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"sensitiveContentConfiguration" readSelector:sel_sensitiveContentConfiguration writeSelector:sel_setSensitiveContentConfiguration_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 sensitiveContentConfiguration];
  if (!v8)
  {
    v4 = [v7 sensitiveContentConfiguration];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 sensitiveContentConfiguration];
  v10 = [v7 sensitiveContentConfiguration];
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
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_sensitiveContentConfiguration"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[86];
  v5[86] = v7;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  v4 = +[CNiOSABConversions dataFromABBytes:a3 length:a4];
  v5 = [[CNSensitiveContentConfiguration alloc] initWithDataRepresentation:v4];

  return v5;
}

- (void)ABValueFromCNValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 dataRepresentation];

  return v7;
}

- (id)CNValueFromABValue:(void *)a3
{
  id v3 = (CNSensitiveContentConfiguration *)a3;
  if (a3)
  {
    CFTypeID v4 = CFGetTypeID(a3);
    if (v4 == CFDataGetTypeID())
    {
      v5 = v3;
      id v3 = [[CNSensitiveContentConfiguration alloc] initWithDataRepresentation:v5];
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

@end