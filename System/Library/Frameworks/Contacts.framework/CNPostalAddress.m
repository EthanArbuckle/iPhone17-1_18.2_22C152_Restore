@interface CNPostalAddress
+ (BOOL)supportsSecureCoding;
+ (CNPostalAddress)postalAddressWithAddressBookDictionaryRepresentation:(id)a3;
+ (CNPostalAddress)postalAddressWithDictionaryRepresentation:(id)a3;
+ (NSString)localizedStringForKey:(NSString *)key;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid:(id *)a3;
- (CNPostalAddress)initWithCoder:(id)a3;
- (CNPostalAddress)initWithPostalAddress:(id)a3;
- (NSString)ISOCountryCode;
- (NSString)city;
- (NSString)country;
- (NSString)description;
- (NSString)formattedAddress;
- (NSString)postalCode;
- (NSString)state;
- (NSString)street;
- (NSString)subAdministrativeArea;
- (NSString)subLocality;
- (id)addressBookDictionaryRepresentation;
- (id)dictionaryRepresentation;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCity:(id)a3;
- (void)setCountry:(id)a3;
- (void)setFormattedAddress:(id)a3;
- (void)setISOCountryCode:(id)a3;
- (void)setPostalCode:(id)a3;
- (void)setState:(id)a3;
- (void)setStreet:(id)a3;
- (void)setSubAdministrativeArea:(id)a3;
- (void)setSubLocality:(id)a3;
@end

@implementation CNPostalAddress

- (void)setCity:(id)a3
{
  if (self->_city != a3)
  {
    self->_city = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (CNPostalAddress)initWithPostalAddress:(id)a3
{
  v4 = (id *)a3;
  v26.receiver = self;
  v26.super_class = (Class)CNPostalAddress;
  v5 = [(CNPostalAddress *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4[1] copy];
    street = v5->_street;
    v5->_street = (NSString *)v6;

    uint64_t v8 = [v4[2] copy];
    subLocality = v5->_subLocality;
    v5->_subLocality = (NSString *)v8;

    uint64_t v10 = [v4[3] copy];
    city = v5->_city;
    v5->_city = (NSString *)v10;

    uint64_t v12 = [v4[4] copy];
    subAdministrativeArea = v5->_subAdministrativeArea;
    v5->_subAdministrativeArea = (NSString *)v12;

    uint64_t v14 = [v4[5] copy];
    state = v5->_state;
    v5->_state = (NSString *)v14;

    uint64_t v16 = [v4[6] copy];
    postalCode = v5->_postalCode;
    v5->_postalCode = (NSString *)v16;

    uint64_t v18 = [v4[7] copy];
    country = v5->_country;
    v5->_country = (NSString *)v18;

    uint64_t v20 = [v4[8] copy];
    ISOCountryCode = v5->_ISOCountryCode;
    v5->_ISOCountryCode = (NSString *)v20;

    uint64_t v22 = [v4[9] copy];
    formattedAddress = v5->_formattedAddress;
    v5->_formattedAddress = (NSString *)v22;

    v24 = v5;
  }

  return v5;
}

- (void)setStreet:(id)a3
{
  if (self->_street != a3)
  {
    self->_street = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setState:(id)a3
{
  if (self->_state != a3)
  {
    self->_state = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setPostalCode:(id)a3
{
  if (self->_postalCode != a3)
  {
    self->_postalCode = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setCountry:(id)a3
{
  if (self->_country != a3)
  {
    self->_country = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setSubLocality:(id)a3
{
  if (self->_subLocality != a3)
  {
    self->_subLocality = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setSubAdministrativeArea:(id)a3
{
  if (self->_subAdministrativeArea != a3)
  {
    self->_subAdministrativeArea = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setISOCountryCode:(id)a3
{
  if (self->_ISOCountryCode != a3)
  {
    self->_ISOCountryCode = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setFormattedAddress:(id)a3
{
}

- (NSString)formattedAddress
{
  return self->_formattedAddress;
}

- (NSString)ISOCountryCode
{
  if (self->_ISOCountryCode) {
    return self->_ISOCountryCode;
  }
  else {
    return (NSString *)&stru_1EE052B80;
  }
}

- (NSString)street
{
  if (self->_street) {
    return self->_street;
  }
  else {
    return (NSString *)&stru_1EE052B80;
  }
}

- (NSString)state
{
  if (self->_state) {
    return self->_state;
  }
  else {
    return (NSString *)&stru_1EE052B80;
  }
}

- (NSString)postalCode
{
  if (self->_postalCode) {
    return self->_postalCode;
  }
  else {
    return (NSString *)&stru_1EE052B80;
  }
}

- (NSString)country
{
  if (self->_country) {
    return self->_country;
  }
  else {
    return (NSString *)&stru_1EE052B80;
  }
}

- (NSString)city
{
  if (self->_city) {
    return self->_city;
  }
  else {
    return (NSString *)&stru_1EE052B80;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedAddress, 0);
  objc_storeStrong((id *)&self->_ISOCountryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);

  objc_storeStrong((id *)&self->_street, 0);
}

+ (CNPostalAddress)postalAddressWithDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  v4 = +[CN postalAddressFromDictionaryTransform];
  v5 = ((void (**)(void, id))v4)[2](v4, v3);

  return (CNPostalAddress *)v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CNMutablePostalAddress alloc];

  return [(CNPostalAddress *)v4 initWithPostalAddress:self];
}

+ (CNPostalAddress)postalAddressWithAddressBookDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[CN postalAddressesDescription];
    v5 = [v4 CNLabeledValueValueFromABMultiValueValue:v3];
    uint64_t v6 = (CNPostalAddress *)[v5 copy];
  }
  else
  {
    uint64_t v6 = objc_alloc_init(CNPostalAddress);
  }

  return v6;
}

- (id)addressBookDictionaryRepresentation
{
  id v3 = +[CN postalAddressesDescription];
  v4 = [v3 ABMultiValueValueFromCNLabeledValueValue:self];
  v5 = (void *)[v4 copy];

  return v5;
}

+ (NSString)localizedStringForKey:(NSString *)key
{
  return (NSString *)[MEMORY[0x1E4F5A430] localizedStringForString:key class:a1 returningNilIfNotFound:1];
}

- (id)dictionaryRepresentation
{
  id v3 = +[CN postalAddressToDictionaryTransform];
  v4 = ((void (**)(void, CNPostalAddress *))v3)[2](v3, self);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNPostalAddress)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CNPostalAddress;
  v5 = [(CNPostalAddress *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_street"];
    uint64_t v7 = [v6 copy];
    street = v5->_street;
    v5->_street = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_subLocality"];
    uint64_t v10 = [v9 copy];
    subLocality = v5->_subLocality;
    v5->_subLocality = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_city"];
    uint64_t v13 = [v12 copy];
    city = v5->_city;
    v5->_city = (NSString *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_subAdministrativeArea"];
    uint64_t v16 = [v15 copy];
    subAdministrativeArea = v5->_subAdministrativeArea;
    v5->_subAdministrativeArea = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_state"];
    uint64_t v19 = [v18 copy];
    state = v5->_state;
    v5->_state = (NSString *)v19;

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_postalCode"];
    uint64_t v22 = [v21 copy];
    postalCode = v5->_postalCode;
    v5->_postalCode = (NSString *)v22;

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_country"];
    uint64_t v25 = [v24 copy];
    country = v5->_country;
    v5->_country = (NSString *)v25;

    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ISOCountryCode"];
    uint64_t v28 = [v27 copy];
    ISOCountryCode = v5->_ISOCountryCode;
    v5->_ISOCountryCode = (NSString *)v28;

    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_formattedAddress"];
    uint64_t v31 = [v30 copy];
    formattedAddress = v5->_formattedAddress;
    v5->_formattedAddress = (NSString *)v31;

    v33 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  street = self->_street;
  id v5 = a3;
  [v5 encodeObject:street forKey:@"_street"];
  [v5 encodeObject:self->_subLocality forKey:@"_subLocality"];
  [v5 encodeObject:self->_city forKey:@"_city"];
  [v5 encodeObject:self->_subAdministrativeArea forKey:@"_subAdministrativeArea"];
  [v5 encodeObject:self->_state forKey:@"_state"];
  [v5 encodeObject:self->_postalCode forKey:@"_postalCode"];
  [v5 encodeObject:self->_country forKey:@"_country"];
  [v5 encodeObject:self->_ISOCountryCode forKey:@"_ISOCountryCode"];
  [v5 encodeObject:self->_formattedAddress forKey:@"_formattedAddress"];
}

- (NSString)description
{
  id v3 = (void *)MEMORY[0x1E4F5A3A8];
  id v4 = [(CNPostalAddress *)self street];
  id v5 = [(CNPostalAddress *)self subLocality];
  uint64_t v6 = [(CNPostalAddress *)self city];
  uint64_t v7 = [(CNPostalAddress *)self subAdministrativeArea];
  uint64_t v8 = [(CNPostalAddress *)self state];
  v9 = [(CNPostalAddress *)self postalCode];
  uint64_t v10 = [(CNPostalAddress *)self country];
  v11 = [(CNPostalAddress *)self ISOCountryCode];
  objc_msgSend(v3, "descriptionForObject:withNamesAndObjects:", self, @"street", v4, @"subLocality", v5, @"city", v6, @"subAdministrativeArea", v7, @"state", v8, @"postalCode", v9, @"country", v10, @"countryCode", v11,
  uint64_t v12 = 0);

  return (NSString *)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v21 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v5 = objc_opt_class();
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __27__CNPostalAddress_isEqual___block_invoke;
  v36[3] = &unk_1E56B3E18;
  v36[4] = self;
  id v37 = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __27__CNPostalAddress_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E56B3E18;
  aBlock[4] = self;
  id v6 = v37;
  id v35 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __27__CNPostalAddress_isEqual___block_invoke_3;
  v32[3] = &unk_1E56B3E18;
  v32[4] = self;
  id v8 = v6;
  id v33 = v8;
  v9 = _Block_copy(v32);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __27__CNPostalAddress_isEqual___block_invoke_4;
  v30[3] = &unk_1E56B3E18;
  v30[4] = self;
  id v10 = v8;
  id v31 = v10;
  v11 = _Block_copy(v30);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __27__CNPostalAddress_isEqual___block_invoke_5;
  v28[3] = &unk_1E56B3E18;
  v28[4] = self;
  id v12 = v10;
  id v29 = v12;
  uint64_t v13 = _Block_copy(v28);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __27__CNPostalAddress_isEqual___block_invoke_6;
  v26[3] = &unk_1E56B3E18;
  v26[4] = self;
  id v14 = v12;
  id v27 = v14;
  v15 = _Block_copy(v26);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __27__CNPostalAddress_isEqual___block_invoke_7;
  v24[3] = &unk_1E56B3E18;
  v24[4] = self;
  id v16 = v14;
  id v25 = v16;
  v17 = _Block_copy(v24);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __27__CNPostalAddress_isEqual___block_invoke_8;
  v22[3] = &unk_1E56B3E18;
  v22[4] = self;
  id v23 = v16;
  id v18 = v16;
  uint64_t v19 = _Block_copy(v22);
  LOBYTE(self) = objc_msgSend(v21, "isObject:kindOfClass:andEqualToObject:withBlocks:", v18, v5, self, v36, v7, v9, v11, v13, v15, v17, v19, 0);

  return (char)self;
}

uint64_t __27__CNPostalAddress_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) street];
  id v4 = [*(id *)(a1 + 40) street];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __27__CNPostalAddress_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) subLocality];
  id v4 = [*(id *)(a1 + 40) subLocality];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __27__CNPostalAddress_isEqual___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) city];
  id v4 = [*(id *)(a1 + 40) city];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __27__CNPostalAddress_isEqual___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) subAdministrativeArea];
  id v4 = [*(id *)(a1 + 40) subAdministrativeArea];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __27__CNPostalAddress_isEqual___block_invoke_5(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) state];
  id v4 = [*(id *)(a1 + 40) state];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __27__CNPostalAddress_isEqual___block_invoke_6(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) postalCode];
  id v4 = [*(id *)(a1 + 40) postalCode];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __27__CNPostalAddress_isEqual___block_invoke_7(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) country];
  id v4 = [*(id *)(a1 + 40) country];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __27__CNPostalAddress_isEqual___block_invoke_8(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) ISOCountryCode];
  id v4 = [*(id *)(a1 + 40) ISOCountryCode];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  id v3 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __23__CNPostalAddress_hash__block_invoke;
  v20[3] = &unk_1E56B3E40;
  v20[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __23__CNPostalAddress_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  id v4 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __23__CNPostalAddress_hash__block_invoke_3;
  v18[3] = &unk_1E56B3E40;
  v18[4] = self;
  uint64_t v5 = _Block_copy(v18);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __23__CNPostalAddress_hash__block_invoke_4;
  v17[3] = &unk_1E56B3E40;
  v17[4] = self;
  id v6 = _Block_copy(v17);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __23__CNPostalAddress_hash__block_invoke_5;
  v16[3] = &unk_1E56B3E40;
  v16[4] = self;
  uint64_t v7 = _Block_copy(v16);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __23__CNPostalAddress_hash__block_invoke_6;
  v15[3] = &unk_1E56B3E40;
  v15[4] = self;
  id v8 = _Block_copy(v15);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __23__CNPostalAddress_hash__block_invoke_7;
  v14[3] = &unk_1E56B3E40;
  v14[4] = self;
  v9 = _Block_copy(v14);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __23__CNPostalAddress_hash__block_invoke_8;
  v13[3] = &unk_1E56B3E40;
  v13[4] = self;
  id v10 = _Block_copy(v13);
  unint64_t v11 = objc_msgSend(v3, "hashWithBlocks:", v20, v4, v5, v6, v7, v8, v9, v10, 0);

  return v11;
}

uint64_t __23__CNPostalAddress_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) street];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __23__CNPostalAddress_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) subLocality];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __23__CNPostalAddress_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) city];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __23__CNPostalAddress_hash__block_invoke_4(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) subAdministrativeArea];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __23__CNPostalAddress_hash__block_invoke_5(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) state];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __23__CNPostalAddress_hash__block_invoke_6(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) postalCode];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __23__CNPostalAddress_hash__block_invoke_7(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) country];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __23__CNPostalAddress_hash__block_invoke_8(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) ISOCountryCode];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (BOOL)isValid:(id *)a3
{
  if (isValid__cn_once_token_0_3 != -1) {
    dispatch_once(&isValid__cn_once_token_0_3, &__block_literal_global_117);
  }
  id v5 = (id)isValid__cn_once_object_0_3;
  if (isValid__cn_once_token_1_3 != -1) {
    dispatch_once(&isValid__cn_once_token_1_3, &__block_literal_global_66_1);
  }
  uint64_t v6 = isValid__cn_once_token_2_3;
  id v7 = (id)isValid__cn_once_object_1_3;
  if (v6 != -1) {
    dispatch_once(&isValid__cn_once_token_2_3, &__block_literal_global_69_0);
  }
  BOOL v8 = +[CN areValidKeyPaths:v5 forObject:self expectedClasses:v7 allowNil:isValid__cn_once_object_2_3 error:a3];

  return v8;
}

uint64_t __27__CNPostalAddress_isValid___block_invoke()
{
  uint64_t v0 = [&unk_1EE089758 copy];
  uint64_t v1 = isValid__cn_once_object_0_3;
  isValid__cn_once_object_0_3 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void __27__CNPostalAddress_isValid___block_invoke_2()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v3 count:9];
  uint64_t v1 = objc_msgSend(v0, "copy", v3, v4, v5, v6, v7, v8, v9, v10);
  v2 = (void *)isValid__cn_once_object_1_3;
  isValid__cn_once_object_1_3 = v1;
}

uint64_t __27__CNPostalAddress_isValid___block_invoke_3()
{
  uint64_t v0 = [&unk_1EE089770 copy];
  uint64_t v1 = isValid__cn_once_object_2_3;
  isValid__cn_once_object_2_3 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (NSString)subLocality
{
  if (self->_subLocality) {
    return self->_subLocality;
  }
  else {
    return (NSString *)&stru_1EE052B80;
  }
}

- (NSString)subAdministrativeArea
{
  if (self->_subAdministrativeArea) {
    return self->_subAdministrativeArea;
  }
  else {
    return (NSString *)&stru_1EE052B80;
  }
}

@end