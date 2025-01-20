@interface CNisUsingSharedPhotoDescription
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5;
- (CNisUsingSharedPhotoDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (id)nilValue;
- (void)ABValueForABPerson:(void *)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNisUsingSharedPhotoDescription

- (id)CNValueForContact:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = [a3 isUsingSharedPhoto];

  return (id)[v3 numberWithBool:v4];
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5 = a4;
  objc_msgSend(v5, "setIsUsingSharedPhoto:", objc_msgSend(a3, "BOOLValue"));
}

- (CNisUsingSharedPhotoDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"isUsingSharedPhoto" readSelector:sel_isUsingSharedPhoto writeSelector:sel_setIsUsingSharedPhoto_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return (*((unsigned char *)a3 + 376) == 0) ^ (*((unsigned char *)a4 + 376) != 0);
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  id v5 = a4;
  v5[376] = [a3 decodeBoolForKey:@"_isUsingSharedPhoto"];

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
  return (void *)*MEMORY[0x1E4F1CFC8];
}

@end