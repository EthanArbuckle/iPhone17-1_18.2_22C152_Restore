@interface CNImageDataAvailableDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5;
- (CNImageDataAvailableDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4;
- (void)ABValueForABPerson:(void *)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNImageDataAvailableDescription

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  return +[CNiOSABConversions numberFromIntegerABBytes:a3 length:a4];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F498E0];
  }
  return a3 != 0;
}

- (id)CNValueForContact:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = [a3 imageDataAvailable];

  return (id)[v3 numberWithBool:v4];
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5 = a4;
  objc_msgSend(v5, "setImageDataAvailable:", objc_msgSend(a3, "BOOLValue"));
}

- (CNImageDataAvailableDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"imageDataAvailable" readSelector:sel_imageDataAvailable writeSelector:sel_setImageDataAvailable_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return (*((unsigned char *)a3 + 320) == 0) ^ (*((unsigned char *)a4 + 320) != 0);
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  id v5 = a4;
  v5[320] = [a3 decodeBoolForKey:@"_imageDataAvailable"];

  MEMORY[0x1F41817F8]();
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

- (void)ABValueForABPerson:(void *)a3
{
  BOOL HasImageData = ABPersonHasImageData(a3);
  uint64_t v4 = (void **)MEMORY[0x1E4F1CFD0];
  if (!HasImageData) {
    uint64_t v4 = (void **)MEMORY[0x1E4F1CFC8];
  }
  return *v4;
}

@end