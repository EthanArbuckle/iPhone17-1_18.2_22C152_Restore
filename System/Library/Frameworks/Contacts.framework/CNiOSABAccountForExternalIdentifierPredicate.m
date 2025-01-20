@interface CNiOSABAccountForExternalIdentifierPredicate
+ (BOOL)supportsSecureCoding;
- (CNiOSABAccountForExternalIdentifierPredicate)initWithAccountExternalIdentifier:(id)a3;
- (CNiOSABAccountForExternalIdentifierPredicate)initWithCoder:(id)a3;
- (CNiOSABAccountForExternalIdentifierPredicate)initWithPredicate:(id)a3;
- (NSString)externalIdentifier;
- (__CFArray)cn_copyAccountsInAddressBook:(void *)a3 error:(__CFError *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABAccountForExternalIdentifierPredicate

- (CNiOSABAccountForExternalIdentifierPredicate)initWithPredicate:(id)a3
{
  return [(CNiOSABAccountForExternalIdentifierPredicate *)self initWithAccountExternalIdentifier:0];
}

- (CNiOSABAccountForExternalIdentifierPredicate)initWithAccountExternalIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"externalIdentifier == %@", v4];
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABAccountForExternalIdentifierPredicate;
  v6 = [(CNPredicate *)&v10 initWithPredicate:v5];

  if (v6)
  {
    uint64_t v7 = [v4 copy];
    externalIdentifier = v6->_externalIdentifier;
    v6->_externalIdentifier = (NSString *)v7;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABAccountForExternalIdentifierPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABAccountForExternalIdentifierPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_externalIdentifier"];
    uint64_t v7 = [v6 copy];
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABAccountForExternalIdentifierPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_externalIdentifier, @"_externalIdentifier", v5.receiver, v5.super_class);
}

- (__CFArray)cn_copyAccountsInAddressBook:(void *)a3 error:(__CFError *)a4
{
  [(CNiOSABAccountForExternalIdentifierPredicate *)self externalIdentifier];

  values = (void *)ABAddressBookCopyAccountWithIdentifier();
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  objc_super v5 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  if (values)
  {
    v6 = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
    if (values) {
      CFRelease(values);
    }
    return v6;
  }
  else
  {
    return CFArrayCreate(v4, 0, 0, v5);
  }
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void).cxx_destruct
{
}

@end