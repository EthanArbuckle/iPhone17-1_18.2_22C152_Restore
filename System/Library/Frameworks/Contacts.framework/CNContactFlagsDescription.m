@interface CNContactFlagsDescription
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isEqualIgnoringIdentifiersForContact:(id)a3 other:(id)a4;
- (CNContactFlagsDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNContactFlagsDescription

- (id)CNValueForContact:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = [a3 flags];

  return (id)[v3 numberWithUnsignedInteger:v4];
}

- (CNContactFlagsDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"iOSLegacyIdentifier" readSelector:sel_flags writeSelector:sel_setFlags_];
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  id v9 = v5;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v9;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  objc_msgSend(v6, "setFlags:", objc_msgSend(v8, "CNContactFlagsValue"));
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return *((void *)a3 + 3) == *((void *)a4 + 3);
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  id v5 = a4;
  v5[3] = [a3 decodeIntegerForKey:@"_flags"];

  MEMORY[0x1F41817F8]();
}

- (BOOL)isEqualIgnoringIdentifiersForContact:(id)a3 other:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 flags];
  uint64_t v7 = [v5 flags];

  return v6 == v7;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

@end