@interface CNContainerRestrictionsDescription
- (BOOL)isConvertibleABValue:(void *)a3;
- (BOOL)isValidValue:(id)a3 error:(id *)a4;
- (BOOL)isWritable;
- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5;
- (Class)valueClass;
- (id)CNValueForContainer:(id)a3;
- (id)CNValueFromABValue:(void *)a3;
- (id)key;
- (int)abPropertyID;
- (void)ABValueFromCNValue:(id)a3;
- (void)setCNValue:(id)a3 onContainer:(id)a4;
@end

@implementation CNContainerRestrictionsDescription

- (id)key
{
  return @"restrictions";
}

- (BOOL)isWritable
{
  return 1;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNValueForContainer:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = [a3 restrictions];

  return (id)[v3 numberWithUnsignedInteger:v4];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  id v5 = a4;
  objc_msgSend(v5, "setRestrictions:", objc_msgSend(a3, "unsignedIntegerValue"));
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  unint64_t v5 = [a3 unsignedIntegerValue];
  if (v5 >= 8) {
    CNSetError(a4, 301, 0);
  }
  return v5 < 8;
}

- (int)abPropertyID
{
  return *MEMORY[0x1E4F49DF8];
}

- (BOOL)isConvertibleABValue:(void *)a3
{
  unsigned int valuePtr = 0;
  if (CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, &valuePtr)) {
    BOOL v3 = valuePtr >= 0x10;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (void)ABValueFromCNValue:(id)a3
{
  char v3 = [a3 intValue];
  uint64_t v4 = (const void *)[NSNumber numberWithInt:v3 & 3];
  if (!v4) {
    return 0;
  }
  CFTypeRef v5 = CFRetain(v4);
  if (!v5) {
    return 0;
  }

  return (void *)CFAutorelease(v5);
}

- (id)CNValueFromABValue:(void *)a3
{
  uint64_t v3 = [a3 intValue] & 3;
  uint64_t v4 = NSNumber;

  return (id)[v4 numberWithUnsignedInteger:v3];
}

- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5
{
  if (!a3) {
    return 1;
  }
  v6 = a3;
  [(CNContainerRestrictionsDescription *)self abPropertyID];
  ABRecordGetIntValue();
  [v6 intValue];

  [(CNContainerRestrictionsDescription *)self abPropertyID];

  return ABRecordSetIntValue();
}

@end