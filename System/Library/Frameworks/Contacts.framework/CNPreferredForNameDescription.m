@interface CNPreferredForNameDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5;
- (CNPreferredForNameDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4;
- (id)nilValue;
- (void)ABValueForABPerson:(void *)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNPreferredForNameDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5 = a4;
  objc_msgSend(v5, "setPreferredForName:", objc_msgSend(a3, "BOOLValue"));
}

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  return +[CNiOSABConversions numberFromIntegerABBytes:a3 length:a4];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49BC0];
  }
  return a3 != 0;
}

- (id)CNValueForContact:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = [a3 isPreferredForName];

  return (id)[v3 numberWithBool:v4];
}

- (CNPreferredForNameDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"preferredForName" readSelector:sel_isPreferredForName writeSelector:sel_setPreferredForName_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return (*((unsigned char *)a3 + 336) == 0) ^ (*((unsigned char *)a4 + 336) != 0);
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  id v5 = a4;
  v5[336] = [a3 decodeBoolForKey:@"_preferredForName"];

  MEMORY[0x1F41817F8]();
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)nilValue
{
  return (id)MEMORY[0x1E4F1CC28];
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

- (void)ABValueForABPerson:(void *)a3
{
  if (ABRecordGetIntValue()) {
    return (void *)*MEMORY[0x1E4F1CFD0];
  }
  uint64_t v4 = (void *)*MEMORY[0x1E4F1CFC8];
  if (ABRecordGetIntValue() == -1) {
    return (void *)*MEMORY[0x1E4F1CFD0];
  }
  else {
    return v4;
  }
}

@end