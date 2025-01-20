@interface CNInstantMessageAddressContactPredicate
+ (BOOL)supportsSecureCoding;
- (CNInstantMessageAddress)imAddress;
- (CNInstantMessageAddressContactPredicate)initWithCoder:(id)a3;
- (CNInstantMessageAddressContactPredicate)initWithInstantMessageAddress:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNInstantMessageAddressContactPredicate

- (CNInstantMessageAddressContactPredicate)initWithInstantMessageAddress:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNInstantMessageAddressContactPredicate;
  v5 = [(CNPredicate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    imAddress = v5->_imAddress;
    v5->_imAddress = (CNInstantMessageAddress *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsMatchingInstantMessageAddress:]"];
  v5 = [(CNInstantMessageAddressContactPredicate *)self imAddress];
  uint64_t v6 = [v5 dictionaryRepresentation];
  id v7 = (id)[v3 appendName:@"instantMessageAddress" object:v6];

  v8 = [v3 build];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNInstantMessageAddressContactPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNInstantMessageAddressContactPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_imAddress"];
    uint64_t v7 = [v6 copy];
    imAddress = v5->_imAddress;
    v5->_imAddress = (CNInstantMessageAddress *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNInstantMessageAddressContactPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_imAddress, @"_imAddress", v5.receiver, v5.super_class);
}

- (CNInstantMessageAddress)imAddress
{
  return self->_imAddress;
}

- (void).cxx_destruct
{
}

@end