@interface CNExternalUUIDDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (CNExternalUUIDDescription)init;
- (id)CNValueForContact:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)resetGuardianManagedValueOnContact:(id)a3;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNExternalUUIDDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 externalUUID];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49AE0];
  }
  return a3 != 0;
}

- (CNExternalUUIDDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"externalUUID" readSelector:sel_externalUUID writeSelector:sel_setExternalUUID_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 externalUUID];
  if (!v8)
  {
    v4 = [v7 externalUUID];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 externalUUID];
  v10 = [v7 externalUUID];
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
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_externalUUID"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[61];
  v5[61] = v7;
}

- (void)resetGuardianManagedValueOnContact:(id)a3
{
}

@end