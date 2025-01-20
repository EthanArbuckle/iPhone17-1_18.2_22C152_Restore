@interface CNiOSABGroupIdentifiersPredicate
+ (BOOL)supportsSecureCoding;
+ (id)descriptionOfIdentifiers:(id)a3;
- (CNiOSABGroupIdentifiersPredicate)initWithCoder:(id)a3;
- (CNiOSABGroupIdentifiersPredicate)initWithIdentifiers:(id)a3;
- (NSArray)identifiers;
- (NSString)description;
- (__CFArray)cn_copyGroupsInAddressBook:(void *)a3 error:(__CFError *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABGroupIdentifiersPredicate

- (CNiOSABGroupIdentifiersPredicate)initWithIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier IN %@", v4];
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABGroupIdentifiersPredicate;
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

- (CNiOSABGroupIdentifiersPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNiOSABGroupIdentifiersPredicate;
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
  v5.super_class = (Class)CNiOSABGroupIdentifiersPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifiers, @"_identifiers", v5.receiver, v5.super_class);
}

- (__CFArray)cn_copyGroupsInAddressBook:(void *)a3 error:(__CFError *)a4
{
  v6 = [(CNiOSABGroupIdentifiersPredicate *)self identifiers];
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
  v8 = [(CNiOSABGroupIdentifiersPredicate *)self identifiers];
  v9 = (__CFArray *)ABAddressBookCopyGroupsWithUUIDs();

  if (v9) {
    return v9;
  }
  uint64_t v10 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];

  return CFArrayCreate(0, 0, 0, v10);
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForGroupsWithIdentifiers:]"];
  objc_super v5 = objc_opt_class();
  v6 = [(CNiOSABGroupIdentifiersPredicate *)self identifiers];
  uint64_t v7 = [v5 descriptionOfIdentifiers:v6];
  id v8 = (id)[v3 appendName:@"identifiers" object:v7];

  v9 = [v3 build];

  return (NSString *)v9;
}

+ (id)descriptionOfIdentifiers:(id)a3
{
  v3 = NSString;
  id v4 = [a3 componentsJoinedByString:@","];
  objc_super v5 = [v3 stringWithFormat:@"(%@)", v4];

  return v5;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
}

@end