@interface CNContainerAccountIdentifierDescription
- (BOOL)isWritable;
- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5;
- (Class)valueClass;
- (id)CNValueForContainer:(id)a3;
- (id)CNValueFromABValue:(void *)a3;
- (id)key;
- (int)abPropertyID;
- (void)ABValueForABSource:(void *)a3;
- (void)ABValueFromCNValue:(id)a3;
- (void)setCNValue:(id)a3 onContainer:(id)a4;
@end

@implementation CNContainerAccountIdentifierDescription

- (id)key
{
  return @"accountIdentifier";
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
  return (id)[a3 accountIdentifier];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
}

- (int)abPropertyID
{
  return *MEMORY[0x1E4F49DF0];
}

- (void)ABValueFromCNValue:(id)a3
{
  return a3;
}

- (id)CNValueFromABValue:(void *)a3
{
  v3 = a3;

  return v3;
}

- (void)ABValueForABSource:(void *)a3
{
  ABRecordGetAddressBook();
  if (!ABAddressBookGetAccountForSource()) {
    return 0;
  }
  v3 = (const void *)ABAccountCopyIdentifier();
  if (!v3) {
    return 0;
  }

  return (void *)CFAutorelease(v3);
}

- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

@end