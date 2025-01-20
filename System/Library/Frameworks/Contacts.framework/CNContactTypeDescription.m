@interface CNContactTypeDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isValidValue:(id)a3 error:(id *)a4;
- (CNContactTypeDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4;
- (id)CNValueFromABValue:(void *)a3;
- (id)nilValue;
- (void)ABValueFromCNValue:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNContactTypeDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5 = a4;
  objc_msgSend(v5, "setContactType:", objc_msgSend(a3, "integerValue"));
}

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  id v5 = +[CNiOSABConversions numberFromIntegerABBytes:a3 length:a4];

  return [(CNContactTypeDescription *)self CNValueFromABValue:v5];
}

- (id)CNValueFromABValue:(void *)a3
{
  return (id)[NSNumber numberWithInteger:*MEMORY[0x1E4F49BD0] == (void)a3];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49BE0];
  }
  return a3 != 0;
}

- (id)CNValueForContact:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = [a3 contactType];

  return (id)[v3 numberWithInteger:v4];
}

- (CNContactTypeDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"contactType" readSelector:sel_contactType writeSelector:sel_setContactType_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return *((void *)a3 + 44) == *((void *)a4 + 44);
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  id v5 = a4;
  v5[44] = [a3 decodeIntegerForKey:@"_contactType"];

  MEMORY[0x1F41817F8]();
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)nilValue
{
  return &unk_1EE089260;
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNContactTypeDescription;
  if (![(CNPropertyDescription *)&v13 isValidValue:v6 error:a4])
  {
LABEL_6:
    BOOL v8 = 0;
    goto LABEL_7;
  }
  unint64_t v7 = [v6 integerValue];
  BOOL v8 = 1;
  if (v6 && v7 >= 2)
  {
    if (a4)
    {
      v15 = @"CNKeyPaths";
      v9 = [(CNPropertyDescription *)self key];
      v14 = v9;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      v16[0] = v10;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      *a4 = +[CNErrorFactory errorWithCode:302 userInfo:v11];
    }
    goto LABEL_6;
  }
LABEL_7:

  return v8;
}

- (void)ABValueFromCNValue:(id)a3
{
  uint64_t v3 = [a3 integerValue];
  uint64_t v4 = (void **)MEMORY[0x1E4F49BD0];
  if (v3 != 1) {
    uint64_t v4 = (void **)MEMORY[0x1E4F49BD8];
  }
  return *v4;
}

@end