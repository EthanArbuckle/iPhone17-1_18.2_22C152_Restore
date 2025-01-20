@interface CNPreferredForImageDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5;
- (CNPreferredForImageDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4;
- (id)nilValue;
- (void)ABValueForABPerson:(void *)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNPreferredForImageDescription

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  return +[CNiOSABConversions numberFromIntegerABBytes:a3 length:a4];
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5 = a4;
  objc_msgSend(v5, "setPreferredForImage:", objc_msgSend(a3, "BOOLValue"));
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F498F8];
  }
  return a3 != 0;
}

- (id)CNValueForContact:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = [a3 isPreferredForImage];

  return (id)[v3 numberWithBool:v4];
}

- (CNPreferredForImageDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"preferredForImage" readSelector:sel_isPreferredForImage writeSelector:sel_setPreferredForImage_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return (*((unsigned char *)a3 + 337) == 0) ^ (*((unsigned char *)a4 + 337) != 0);
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  id v5 = a4;
  v5[337] = [a3 decodeBoolForKey:@"_preferredForImage"];

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
  uint64_t v4 = (void *)*MEMORY[0x1E4F1CFC8];
  CFArrayRef v5 = ABPersonCopyArrayOfAllLinkedPeople(a3);
  if (CFArrayGetCount(v5) >= 2)
  {
    CFArrayGetValueAtIndex(v5, 0);
    CFArrayGetValueAtIndex(v5, 1);
    v6 = (const void *)ABPersonCopyPreferredLinkedPersonForImage();
    v7 = (const void *)ABPersonCopyPreferredLinkedPersonForImage();
    if (CFEqual(v6, v7) && CFEqual(v6, a3)) {
      uint64_t v4 = (void *)*MEMORY[0x1E4F1CFD0];
    }
    if (v6) {
      CFRelease(v6);
    }
    if (v7) {
      CFRelease(v7);
    }
  }
  if (v5) {
    CFRelease(v5);
  }
  return v4;
}

@end