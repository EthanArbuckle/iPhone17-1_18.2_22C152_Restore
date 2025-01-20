@interface _CNNameComponentsDonationValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSPersonNameComponents)nameComponents;
- (_CNNameComponentsDonationValue)initWithCoder:(id)a3;
- (_CNNameComponentsDonationValue)initWithNameComponents:(id)a3 origin:(id)a4;
- (id)copyWithNewExpirationDate:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)acceptDonationValueVisitor:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)updatePropertyListRepresentation:(id)a3;
@end

@implementation _CNNameComponentsDonationValue

- (_CNNameComponentsDonationValue)initWithNameComponents:(id)a3 origin:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CNNameComponentsDonationValue;
  v7 = [(CNDonationValue *)&v12 initWithOrigin:a4];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    nameComponents = v7->_nameComponents;
    v7->_nameComponents = (NSPersonNameComponents *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  v4 = [(_CNNameComponentsDonationValue *)self nameComponents];
  id v5 = (id)[v3 appendName:@"name" object:v4];

  id v6 = [(CNDonationValue *)self origin];
  id v7 = (id)[v3 appendName:@"origin" object:v6];

  uint64_t v8 = [v3 build];

  return v8;
}

- (id)copyWithNewExpirationDate:(id)a3
{
  id v4 = a3;
  id v5 = [(CNDonationValue *)self origin];
  id v6 = (void *)[v5 mutableCopy];

  [v6 setExpirationDate:v4];
  id v7 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = [(_CNNameComponentsDonationValue *)self nameComponents];
  v9 = (void *)[v7 initWithNameComponents:v8 origin:v6];

  return v9;
}

- (_CNNameComponentsDonationValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CNNameComponentsDonationValue;
  id v5 = [(CNDonationValue *)&v11 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_nameComponents"];
    uint64_t v7 = [v6 copy];
    nameComponents = v5->_nameComponents;
    v5->_nameComponents = (NSPersonNameComponents *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_CNNameComponentsDonationValue;
  id v4 = a3;
  [(CNDonationValue *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_nameComponents, @"_nameComponents", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x263F335D0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __42___CNNameComponentsDonationValue_isEqual___block_invoke;
  v15[3] = &unk_2641FBF68;
  v15[4] = self;
  id v16 = v4;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  objc_super v11 = __42___CNNameComponentsDonationValue_isEqual___block_invoke_2;
  objc_super v12 = &unk_2641FBF68;
  v13 = self;
  id v14 = v16;
  id v6 = v16;
  uint64_t v7 = (void *)MEMORY[0x21669C740](&v9);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v6, v15, v7, 0, v9, v10, v11, v12, v13);

  return (char)self;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x263F335E8];
  v6[4] = self;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38___CNNameComponentsDonationValue_hash__block_invoke;
  v7[3] = &unk_2641FBF90;
  v7[4] = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38___CNNameComponentsDonationValue_hash__block_invoke_2;
  v6[3] = &unk_2641FBF90;
  v3 = (void *)MEMORY[0x21669C740](v6, a2);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

- (void)acceptDonationValueVisitor:(id)a3
{
  id v4 = a3;
  id v5 = [(_CNNameComponentsDonationValue *)self nameComponents];
  [v4 visitDonationValue:self nameComponents:v5];
}

- (void)updatePropertyListRepresentation:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v18 = [v4 dictionaryWithCapacity:7];
  [v18 setObject:&unk_26C4FAEF8 forKeyedSubscript:@"version"];
  id v6 = [(_CNNameComponentsDonationValue *)self nameComponents];
  uint64_t v7 = [v6 namePrefix];
  [v18 setObject:v7 forKeyedSubscript:@"namePrefix"];

  uint64_t v8 = [(_CNNameComponentsDonationValue *)self nameComponents];
  uint64_t v9 = [v8 givenName];
  [v18 setObject:v9 forKeyedSubscript:@"givenName"];

  uint64_t v10 = [(_CNNameComponentsDonationValue *)self nameComponents];
  objc_super v11 = [v10 middleName];
  [v18 setObject:v11 forKeyedSubscript:@"middleName"];

  objc_super v12 = [(_CNNameComponentsDonationValue *)self nameComponents];
  v13 = [v12 familyName];
  [v18 setObject:v13 forKeyedSubscript:@"familyName"];

  id v14 = [(_CNNameComponentsDonationValue *)self nameComponents];
  v15 = [v14 nameSuffix];
  [v18 setObject:v15 forKeyedSubscript:@"nameSuffix"];

  id v16 = [(_CNNameComponentsDonationValue *)self nameComponents];
  v17 = [v16 nickname];
  [v18 setObject:v17 forKeyedSubscript:@"nickname"];

  [v5 setObject:v18 forKeyedSubscript:@"name-components"];
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void).cxx_destruct
{
}

@end