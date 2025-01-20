@interface CNPostalAddressContactPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNPostalAddress)postalAddress;
- (CNPostalAddressContactPredicate)initWithCoder:(id)a3;
- (CNPostalAddressContactPredicate)initWithPostalAddress:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNPostalAddressContactPredicate

- (CNPostalAddressContactPredicate)initWithPostalAddress:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNPostalAddressContactPredicate;
  v5 = [(CNPredicate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    postalAddress = v5->_postalAddress;
    v5->_postalAddress = (CNPostalAddress *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsMatchingPostalAddress:]"];
  v5 = [(CNPostalAddressContactPredicate *)self postalAddress];
  uint64_t v6 = [v5 dictionaryRepresentation];
  id v7 = (id)[v3 appendName:@"postalAddress" object:v6];

  v8 = [v3 build];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNPostalAddressContactPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNPostalAddressContactPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_postalAddress"];
    uint64_t v7 = [v6 copy];
    postalAddress = v5->_postalAddress;
    v5->_postalAddress = (CNPostalAddress *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNPostalAddressContactPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_postalAddress, @"_postalAddress", v5.receiver, v5.super_class);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E4F5A3E0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__CNPostalAddressContactPredicate_isEqual___block_invoke;
  v8[3] = &unk_1E56B3E18;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v8, 0);

  return (char)self;
}

uint64_t __43__CNPostalAddressContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) postalAddress];
  id v4 = [*(id *)(a1 + 40) postalAddress];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__CNPostalAddressContactPredicate_hash__block_invoke;
  v3[3] = &unk_1E56B3E40;
  v3[4] = self;
  return objc_msgSend(MEMORY[0x1E4F5A418], "hashWithBlocks:", v3, 0);
}

uint64_t __39__CNPostalAddressContactPredicate_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) postalAddress];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (CNPostalAddress)postalAddress
{
  return self->_postalAddress;
}

- (void).cxx_destruct
{
}

@end