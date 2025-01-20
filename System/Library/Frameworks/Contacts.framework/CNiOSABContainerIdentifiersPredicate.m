@interface CNiOSABContainerIdentifiersPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)includesDisabledContainers;
- (CNiOSABContainerIdentifiersPredicate)initWithCoder:(id)a3;
- (CNiOSABContainerIdentifiersPredicate)initWithIdentifiers:(id)a3;
- (NSArray)identifiers;
- (NSString)description;
- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABContainerIdentifiersPredicate

- (CNiOSABContainerIdentifiersPredicate)initWithIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier IN %@", v4];
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContainerIdentifiersPredicate;
  v6 = [(CNPredicate *)&v11 initWithPredicate:v5];
  if (v6)
  {
    uint64_t v7 = [v4 copy];
    identifiers = v6->_identifiers;
    v6->_identifiers = (NSArray *)v7;

    v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContainerIdentifiersPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNiOSABContainerIdentifiersPredicate;
  v5 = [(CNPredicate *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_identifiers"];
    uint64_t v10 = [v9 copy];
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSArray *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContainerIdentifiersPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifiers, @"_identifiers", v5.receiver, v5.super_class);
}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  v6 = [(CNiOSABContainerIdentifiersPredicate *)self identifiers];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    if (!a4) {
      return 0;
    }
    +[CNErrorFactory errorWithCode:400 userInfo:0];
    v9 = 0;
    *a4 = (__CFError *)objc_claimAutoreleasedReturnValue();
    return v9;
  }
  v8 = [(CNiOSABContainerIdentifiersPredicate *)self identifiers];
  v9 = (__CFArray *)ABAddressBookCopySourcesWithUUIDs();

  if (v9) {
    return v9;
  }
  uint64_t v10 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];

  return CFArrayCreate(0, 0, 0, v10);
}

- (BOOL)includesDisabledContainers
{
  return 0;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContainer predicateForContainersWithIdentifiers:]"];
  objc_super v5 = [(CNiOSABContainerIdentifiersPredicate *)self identifiers];
  id v6 = (id)[v3 appendName:@"identifiers" object:v5];

  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
}

@end