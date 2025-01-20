@interface CNPreferredApplePersonaIdentifierDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (CNPreferredApplePersonaIdentifierDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNPreferredApplePersonaIdentifierDescription

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 preferredApplePersonaIdentifier];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49CF8];
  }
  return a3 != 0;
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (CNPreferredApplePersonaIdentifierDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"preferredApplePersonaIdentifier" readSelector:sel_preferredApplePersonaIdentifier writeSelector:sel_setPreferredApplePersonaIdentifier_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 preferredApplePersonaIdentifier];
  if (!v8)
  {
    v4 = [v7 preferredApplePersonaIdentifier];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 preferredApplePersonaIdentifier];
  v10 = [v7 preferredApplePersonaIdentifier];
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
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_preferredApplePersonaIdentifier"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[74];
  v5[74] = v7;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

@end