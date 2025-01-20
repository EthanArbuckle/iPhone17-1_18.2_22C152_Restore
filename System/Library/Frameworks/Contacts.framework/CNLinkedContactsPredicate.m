@interface CNLinkedContactsPredicate
+ (BOOL)supportsSecureCoding;
- (CNContact)contact;
- (CNLinkedContactsPredicate)initWithCoder:(id)a3;
- (CNLinkedContactsPredicate)initWithContact:(id)a3;
- (CNLinkedContactsPredicate)initWithContactIdentifier:(id)a3;
- (NSString)contactIdentifier;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNLinkedContactsPredicate

- (CNLinkedContactsPredicate)initWithContact:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNLinkedContactsPredicate;
  v5 = [(CNPredicate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contact = v5->_contact;
    v5->_contact = (CNContact *)v6;
  }
  return v5;
}

- (CNLinkedContactsPredicate)initWithContactIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNLinkedContactsPredicate;
  v5 = [(CNPredicate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNLinkedContactsPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNLinkedContactsPredicate;
  v5 = [(CNPredicate *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contact"];
    uint64_t v7 = [v6 copy];
    contact = v5->_contact;
    v5->_contact = (CNContact *)v7;

    objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contactIdentifier"];
    uint64_t v10 = [v9 copy];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNLinkedContactsPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_contactIdentifier, @"_contactIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_contact forKey:@"_contact"];
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsLinkedToContact:]"];
  objc_super v5 = [(CNLinkedContactsPredicate *)self contact];
  id v6 = (id)[v3 appendName:@"contact" object:v5];

  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end