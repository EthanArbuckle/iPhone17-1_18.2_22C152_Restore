@interface CNiOSABContainersForAccountExternalIdentifierPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)includesDisabledContainers;
- (CNiOSABContainersForAccountExternalIdentifierPredicate)initWithAccountExternalIdentifier:(id)a3;
- (CNiOSABContainersForAccountExternalIdentifierPredicate)initWithCoder:(id)a3;
- (CNiOSABContainersForAccountExternalIdentifierPredicate)initWithPredicate:(id)a3;
- (NSString)accountExternalIdentifier;
- (NSString)description;
- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABContainersForAccountExternalIdentifierPredicate

- (CNiOSABContainersForAccountExternalIdentifierPredicate)initWithPredicate:(id)a3
{
  return [(CNiOSABContainersForAccountExternalIdentifierPredicate *)self initWithAccountExternalIdentifier:0];
}

- (CNiOSABContainersForAccountExternalIdentifierPredicate)initWithAccountExternalIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"externalIdentifierString == %@", v4];
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABContainersForAccountExternalIdentifierPredicate;
  v6 = [(CNPredicate *)&v10 initWithPredicate:v5];
  if (v6)
  {
    uint64_t v7 = [v4 copy];
    accountExternalIdentifier = v6->_accountExternalIdentifier;
    v6->_accountExternalIdentifier = (NSString *)v7;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContainersForAccountExternalIdentifierPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContainersForAccountExternalIdentifierPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_accountExternalIdentifier"];
    uint64_t v7 = [v6 copy];
    accountExternalIdentifier = v5->_accountExternalIdentifier;
    v5->_accountExternalIdentifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContainersForAccountExternalIdentifierPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountExternalIdentifier, @"_accountExternalIdentifier", v5.receiver, v5.super_class);
}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  objc_super v5 = [(CNiOSABContainersForAccountExternalIdentifierPredicate *)self accountExternalIdentifier];

  return (__CFArray *)MEMORY[0x1F4106B48](a3, v5);
}

- (BOOL)includesDisabledContainers
{
  return 0;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContainer predicateForContainersInAccountWithExternalIdentifier:]"];
  objc_super v5 = [(CNiOSABContainersForAccountExternalIdentifierPredicate *)self accountExternalIdentifier];
  id v6 = (id)[v3 appendName:@"externalIdentifier" object:v5];

  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (NSString)accountExternalIdentifier
{
  return self->_accountExternalIdentifier;
}

- (void).cxx_destruct
{
}

@end