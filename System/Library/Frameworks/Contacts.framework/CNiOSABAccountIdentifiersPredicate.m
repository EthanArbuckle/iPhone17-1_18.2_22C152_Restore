@interface CNiOSABAccountIdentifiersPredicate
+ (BOOL)supportsSecureCoding;
- (CNiOSABAccountIdentifiersPredicate)initWithCoder:(id)a3;
- (CNiOSABAccountIdentifiersPredicate)initWithIdentifiers:(id)a3;
- (CNiOSABAccountIdentifiersPredicate)initWithPredicate:(id)a3;
- (NSArray)identifiers;
- (__CFArray)cn_copyAccountsInAddressBook:(void *)a3 error:(__CFError *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABAccountIdentifiersPredicate

- (CNiOSABAccountIdentifiersPredicate)initWithPredicate:(id)a3
{
  return [(CNiOSABAccountIdentifiersPredicate *)self initWithIdentifiers:MEMORY[0x1E4F1CBF0]];
}

- (CNiOSABAccountIdentifiersPredicate)initWithIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier IN %@", v4];
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABAccountIdentifiersPredicate;
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

- (CNiOSABAccountIdentifiersPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNiOSABAccountIdentifiersPredicate;
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
  v5.super_class = (Class)CNiOSABAccountIdentifiersPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifiers, @"_identifiers", v5.receiver, v5.super_class);
}

- (__CFArray)cn_copyAccountsInAddressBook:(void *)a3 error:(__CFError *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(CNiOSABAccountIdentifiersPredicate *)self identifiers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (*(void *)(*((void *)&v13 + 1) + 8 * v10)) {
          objc_msgSend(v5, "addObject:");
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  objc_super v11 = (__CFArray *)ABAddressBookCopyAccountsWithUUIDs();
  return v11;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
}

@end