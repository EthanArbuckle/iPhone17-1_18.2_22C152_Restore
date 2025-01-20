@interface CNIOSLegacyIdentifierDescription
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isEqualIgnoringIdentifiersForContact:(id)a3 other:(id)a4;
- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5;
- (CNIOSLegacyIdentifierDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (id)nilValue;
- (void)ABValueForABPerson:(void *)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)resetGuardianManagedValueOnContact:(id)a3;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNIOSLegacyIdentifierDescription

- (id)CNValueForContact:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = [a3 iOSLegacyIdentifier];

  return (id)[v3 numberWithInt:v4];
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5 = a4;
  objc_msgSend(v5, "setIOSLegacyIdentifier:", objc_msgSend(a3, "intValue"));
}

- (CNIOSLegacyIdentifierDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"iOSLegacyIdentifier" readSelector:sel_iOSLegacyIdentifier writeSelector:sel_setIOSLegacyIdentifier_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return *((_DWORD *)a3 + 4) == *((_DWORD *)a4 + 4);
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  id v5 = a4;
  v5[4] = [a3 decodeInt32ForKey:@"_iOSLegacyIdentifier"];

  MEMORY[0x1F41817F8]();
}

- (BOOL)isEqualIgnoringIdentifiersForContact:(id)a3 other:(id)a4
{
  return 1;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (void)resetGuardianManagedValueOnContact:(id)a3
{
}

- (id)nilValue
{
  return &unk_1EE089398;
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

- (void)ABValueForABPerson:(void *)a3
{
  ABRecordID valuePtr = ABRecordGetRecordID(a3);
  result = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
  if (result) {
    return (void *)CFAutorelease(result);
  }
  return result;
}

@end