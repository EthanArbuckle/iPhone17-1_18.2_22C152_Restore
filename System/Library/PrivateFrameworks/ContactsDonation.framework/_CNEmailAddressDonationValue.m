@interface _CNEmailAddressDonationValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)emailAddress;
- (NSString)label;
- (_CNEmailAddressDonationValue)initWithCoder:(id)a3;
- (_CNEmailAddressDonationValue)initWithEmailAddress:(id)a3 label:(id)a4 origin:(id)a5;
- (id)copyWithNewExpirationDate:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)acceptDonationValueVisitor:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)updatePropertyListRepresentation:(id)a3;
@end

@implementation _CNEmailAddressDonationValue

- (_CNEmailAddressDonationValue)initWithEmailAddress:(id)a3 label:(id)a4 origin:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_CNEmailAddressDonationValue;
  v10 = [(CNDonationValue *)&v17 initWithOrigin:a5];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    emailAddress = v10->_emailAddress;
    v10->_emailAddress = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    label = v10->_label;
    v10->_label = (NSString *)v13;

    v15 = v10;
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  v4 = [(_CNEmailAddressDonationValue *)self emailAddress];
  id v5 = (id)[v3 appendName:@"email" object:v4];

  v6 = [(CNDonationValue *)self origin];
  id v7 = (id)[v3 appendName:@"origin" object:v6];

  id v8 = [v3 build];

  return v8;
}

- (id)copyWithNewExpirationDate:(id)a3
{
  id v4 = a3;
  id v5 = [(CNDonationValue *)self origin];
  v6 = (void *)[v5 mutableCopy];

  [v6 setExpirationDate:v4];
  id v7 = objc_alloc((Class)objc_opt_class());
  id v8 = [(_CNEmailAddressDonationValue *)self emailAddress];
  id v9 = [(_CNEmailAddressDonationValue *)self label];
  v10 = (void *)[v7 initWithEmailAddress:v8 label:v9 origin:v6];

  return v10;
}

- (_CNEmailAddressDonationValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_CNEmailAddressDonationValue;
  id v5 = [(CNDonationValue *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_emailAddress"];
    uint64_t v7 = [v6 copy];
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_label"];
    uint64_t v10 = [v9 copy];
    label = v5->_label;
    v5->_label = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_CNEmailAddressDonationValue;
  id v4 = a3;
  [(CNDonationValue *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_emailAddress, @"_emailAddress", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_label forKey:@"_label"];
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
  v15[2] = __40___CNEmailAddressDonationValue_isEqual___block_invoke;
  v15[3] = &unk_2641FBF68;
  v15[4] = self;
  id v16 = v4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __40___CNEmailAddressDonationValue_isEqual___block_invoke_2;
  v13[3] = &unk_2641FBF68;
  v13[4] = self;
  id v6 = v16;
  id v14 = v6;
  uint64_t v7 = (void *)MEMORY[0x21669C740](v13);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40___CNEmailAddressDonationValue_isEqual___block_invoke_3;
  v11[3] = &unk_2641FBF68;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  id v9 = (void *)MEMORY[0x21669C740](v11);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v8, v15, v7, v9, 0);

  return (char)self;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x263F335E8];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __36___CNEmailAddressDonationValue_hash__block_invoke;
  v10[3] = &unk_2641FBF90;
  v10[4] = self;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __36___CNEmailAddressDonationValue_hash__block_invoke_2;
  v9[3] = &unk_2641FBF90;
  v9[4] = self;
  id v4 = (void *)MEMORY[0x21669C740](v9, a2);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36___CNEmailAddressDonationValue_hash__block_invoke_3;
  v8[3] = &unk_2641FBF90;
  v8[4] = self;
  objc_super v5 = (void *)MEMORY[0x21669C740](v8);
  unint64_t v6 = objc_msgSend(v3, "hashWithBlocks:", v10, v4, v5, 0);

  return v6;
}

- (void)acceptDonationValueVisitor:(id)a3
{
  id v4 = a3;
  id v6 = [(_CNEmailAddressDonationValue *)self emailAddress];
  objc_super v5 = [(_CNEmailAddressDonationValue *)self label];
  [v4 visitDonationValue:self emailAddress:v6 label:v5];
}

- (void)updatePropertyListRepresentation:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_CNEmailAddressDonationValue *)self emailAddress];
  [v4 setObject:v5 forKeyedSubscript:@"email-address"];

  id v6 = [(_CNEmailAddressDonationValue *)self label];
  [v4 setObject:v6 forKeyedSubscript:@"label"];
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_emailAddress, 0);
}

@end