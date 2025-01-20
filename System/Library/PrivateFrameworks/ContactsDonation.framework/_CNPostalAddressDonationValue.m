@interface _CNPostalAddressDonationValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNPostalAddress)postalAddress;
- (NSString)label;
- (_CNPostalAddressDonationValue)initWithCoder:(id)a3;
- (_CNPostalAddressDonationValue)initWithPostalAddress:(id)a3 style:(int64_t)a4 label:(id)a5 origin:(id)a6;
- (id)copyWithNewExpirationDate:(id)a3;
- (int64_t)style;
- (unint64_t)hash;
- (void)acceptDonationValueVisitor:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)updatePropertyListRepresentation:(id)a3;
@end

@implementation _CNPostalAddressDonationValue

- (_CNPostalAddressDonationValue)initWithPostalAddress:(id)a3 style:(int64_t)a4 label:(id)a5 origin:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_CNPostalAddressDonationValue;
  v12 = [(CNDonationValue *)&v19 initWithOrigin:a6];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    postalAddress = v12->_postalAddress;
    v12->_postalAddress = (CNPostalAddress *)v13;

    v12->_style = a4;
    uint64_t v15 = [v11 copy];
    label = v12->_label;
    v12->_label = (NSString *)v15;

    v17 = v12;
  }

  return v12;
}

- (id)copyWithNewExpirationDate:(id)a3
{
  id v4 = a3;
  v5 = [(CNDonationValue *)self origin];
  v6 = (void *)[v5 mutableCopy];

  [v6 setExpirationDate:v4];
  id v7 = objc_alloc((Class)objc_opt_class());
  v8 = [(_CNPostalAddressDonationValue *)self postalAddress];
  int64_t v9 = [(_CNPostalAddressDonationValue *)self style];
  id v10 = [(_CNPostalAddressDonationValue *)self label];
  id v11 = (void *)[v7 initWithPostalAddress:v8 style:v9 label:v10 origin:v6];

  return v11;
}

- (_CNPostalAddressDonationValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_CNPostalAddressDonationValue;
  v5 = [(CNDonationValue *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_postalAddress"];
    uint64_t v7 = [v6 copy];
    postalAddress = v5->_postalAddress;
    v5->_postalAddress = (CNPostalAddress *)v7;

    int64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_label"];
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
  v5.super_class = (Class)_CNPostalAddressDonationValue;
  id v4 = a3;
  [(CNDonationValue *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_postalAddress, @"_postalAddress", v5.receiver, v5.super_class);
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
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __41___CNPostalAddressDonationValue_isEqual___block_invoke;
  v23[3] = &unk_2641FBF68;
  v23[4] = self;
  id v24 = v4;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __41___CNPostalAddressDonationValue_isEqual___block_invoke_2;
  v21[3] = &unk_2641FBF68;
  v21[4] = self;
  id v6 = v24;
  id v22 = v6;
  uint64_t v7 = (void *)MEMORY[0x21669C740](v21);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __41___CNPostalAddressDonationValue_isEqual___block_invoke_3;
  v19[3] = &unk_2641FBF68;
  v19[4] = self;
  id v8 = v6;
  id v20 = v8;
  int64_t v9 = (void *)MEMORY[0x21669C740](v19);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __41___CNPostalAddressDonationValue_isEqual___block_invoke_4;
  v16 = &unk_2641FBF68;
  v17 = self;
  id v18 = v8;
  id v10 = v8;
  id v11 = (void *)MEMORY[0x21669C740](&v13);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v10, v23, v7, v9, v11, 0, v13, v14, v15, v16, v17);

  return (char)self;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x263F335E8];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __37___CNPostalAddressDonationValue_hash__block_invoke;
  v12[3] = &unk_2641FBF90;
  v12[4] = self;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37___CNPostalAddressDonationValue_hash__block_invoke_2;
  v11[3] = &unk_2641FBF90;
  v11[4] = self;
  id v4 = (void *)MEMORY[0x21669C740](v11, a2);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37___CNPostalAddressDonationValue_hash__block_invoke_3;
  v10[3] = &unk_2641FBF90;
  v10[4] = self;
  objc_super v5 = (void *)MEMORY[0x21669C740](v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37___CNPostalAddressDonationValue_hash__block_invoke_4;
  v9[3] = &unk_2641FBF90;
  v9[4] = self;
  id v6 = (void *)MEMORY[0x21669C740](v9);
  unint64_t v7 = objc_msgSend(v3, "hashWithBlocks:", v12, v4, v5, v6, 0);

  return v7;
}

- (void)acceptDonationValueVisitor:(id)a3
{
  id v4 = a3;
  id v7 = [(_CNPostalAddressDonationValue *)self postalAddress];
  int64_t v5 = [(_CNPostalAddressDonationValue *)self style];
  id v6 = [(_CNPostalAddressDonationValue *)self label];
  [v4 visitDonationValue:self postalAddress:v7 style:v5 label:v6];
}

- (void)updatePropertyListRepresentation:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v23 = [v4 dictionaryWithCapacity:9];
  [v23 setObject:&unk_26C4FAEF8 forKeyedSubscript:@"version"];
  id v6 = [(_CNPostalAddressDonationValue *)self postalAddress];
  id v7 = [v6 street];
  [v23 setObject:v7 forKeyedSubscript:@"street"];

  id v8 = [(_CNPostalAddressDonationValue *)self postalAddress];
  int64_t v9 = [v8 subLocality];
  [v23 setObject:v9 forKeyedSubscript:@"subLocality"];

  id v10 = [(_CNPostalAddressDonationValue *)self postalAddress];
  id v11 = [v10 city];
  [v23 setObject:v11 forKeyedSubscript:@"city"];

  v12 = [(_CNPostalAddressDonationValue *)self postalAddress];
  uint64_t v13 = [v12 subAdministrativeArea];
  [v23 setObject:v13 forKeyedSubscript:@"subAdministrativeArea"];

  uint64_t v14 = [(_CNPostalAddressDonationValue *)self postalAddress];
  uint64_t v15 = [v14 postalCode];
  [v23 setObject:v15 forKeyedSubscript:@"postalCode"];

  v16 = [(_CNPostalAddressDonationValue *)self postalAddress];
  v17 = [v16 state];
  [v23 setObject:v17 forKeyedSubscript:@"state"];

  id v18 = [(_CNPostalAddressDonationValue *)self postalAddress];
  objc_super v19 = [v18 country];
  [v23 setObject:v19 forKeyedSubscript:@"country"];

  id v20 = [(_CNPostalAddressDonationValue *)self postalAddress];
  v21 = [v20 ISOCountryCode];
  [v23 setObject:v21 forKeyedSubscript:@"isoCountryCode"];

  [v5 setObject:v23 forKeyedSubscript:@"postal-address"];
  id v22 = [(_CNPostalAddressDonationValue *)self label];
  [v5 setObject:v22 forKeyedSubscript:@"label"];
}

- (CNPostalAddress)postalAddress
{
  return self->_postalAddress;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_postalAddress, 0);
}

@end