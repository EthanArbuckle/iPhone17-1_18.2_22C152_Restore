@interface CNInternalIdentifierDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isEqualIgnoringIdentifiersForContact:(id)a3 other:(id)a4;
- (CNInternalIdentifierDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (id)CNValueFromABValue:(void *)a3;
- (void)ABValueFromCNValue:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
@end

@implementation CNInternalIdentifierDescription

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49BB8];
  }
  return a3 != 0;
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 internalIdentifier];
}

- (CNInternalIdentifierDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"identifier" readSelector:sel_internalIdentifier writeSelector:0];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 internalIdentifier];
  if (!v8)
  {
    v4 = [v7 internalIdentifier];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 internalIdentifier];
  v10 = [v7 internalIdentifier];
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
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_internalIdentifier"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[1];
  v5[1] = v7;
}

- (BOOL)isEqualIgnoringIdentifiersForContact:(id)a3 other:(id)a4
{
  return 1;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (void)ABValueFromCNValue:(id)a3
{
  return a3;
}

- (id)CNValueFromABValue:(void *)a3
{
  v3 = a3;

  return v3;
}

@end