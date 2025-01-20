@interface CNiOSABContactLegacyIdentifierPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (CNiOSABContactLegacyIdentifierPredicate)initWithCoder:(id)a3;
- (CNiOSABContactLegacyIdentifierPredicate)initWithLegacyIdentifier:(int)a3;
- (NSString)description;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (int)legacyIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABContactLegacyIdentifierPredicate

- (CNiOSABContactLegacyIdentifierPredicate)initWithLegacyIdentifier:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContactLegacyIdentifierPredicate;
  result = [(CNPredicate *)&v5 init];
  result->_legacyIdentifier = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContactLegacyIdentifierPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABContactLegacyIdentifierPredicate;
  objc_super v5 = [(CNPredicate *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_legacyIdentifier = [v4 decodeInt32ForKey:@"_legacyIdentifier"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContactLegacyIdentifierPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", self->_legacyIdentifier, @"_legacyIdentifier", v5.receiver, v5.super_class);
}

- (BOOL)cn_supportsNativeSorting
{
  return 0;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  result = (__CFArray *)ABAddressBookGetPersonWithRecordID(a3, self->_legacyIdentifier);
  values = result;
  if (result) {
    return CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
  }
  return result;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x1E4F498B0], "predicateForContactsWithLegacyIdentifier:", self->_legacyIdentifier, a4, a5);
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForLegacyIdentifier:]"];
  id v5 = (id)objc_msgSend(v3, "appendName:intValue:", @"legacyIdentifier", -[CNiOSABContactLegacyIdentifierPredicate legacyIdentifier](self, "legacyIdentifier"));
  v6 = [v3 build];

  return (NSString *)v6;
}

- (int)legacyIdentifier
{
  return self->_legacyIdentifier;
}

@end