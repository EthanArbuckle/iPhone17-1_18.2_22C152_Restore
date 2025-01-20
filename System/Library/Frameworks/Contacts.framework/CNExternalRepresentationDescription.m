@interface CNExternalRepresentationDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (CNExternalRepresentationDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4;
- (unsigned)abPropertyType;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)resetGuardianManagedValueOnContact:(id)a3;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNExternalRepresentationDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 externalRepresentation];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49AD8];
  }
  return a3 != 0;
}

- (CNExternalRepresentationDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"externalRepresentation" readSelector:sel_externalRepresentation writeSelector:sel_setExternalRepresentation_];
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (void)resetGuardianManagedValueOnContact:(id)a3
{
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 externalRepresentation];
  if (!v8)
  {
    v4 = [v7 externalRepresentation];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 externalRepresentation];
  v10 = [v7 externalRepresentation];
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
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_externalRepresentation"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[59];
  v5[59] = v7;
}

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  return +[CNiOSABConversions dataFromABBytes:a3 length:a4];
}

- (unsigned)abPropertyType
{
  return 7;
}

@end