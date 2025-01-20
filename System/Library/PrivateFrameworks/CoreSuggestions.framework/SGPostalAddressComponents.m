@interface SGPostalAddressComponents
+ (BOOL)supportsSecureCoding;
+ (id)components:(id)a3 city:(id)a4 state:(id)a5 postalCode:(id)a6 country:(id)a7;
+ (id)components:(id)a3 subLocality:(id)a4 city:(id)a5 subAdministrativeArea:(id)a6 state:(id)a7 postalCode:(id)a8 country:(id)a9 isoCountryCode:(id)a10;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPostalAddressComponents:(id)a3;
- (NSString)city;
- (NSString)country;
- (NSString)isoCountryCode;
- (NSString)postalCode;
- (NSString)state;
- (NSString)street;
- (NSString)subAdministrativeArea;
- (NSString)subLocality;
- (SGPostalAddressComponents)initWithCoder:(id)a3;
- (SGPostalAddressComponents)initWithStreet:(id)a3 subLocality:(id)a4 city:(id)a5 subAdministrativeArea:(id)a6 state:(id)a7 postalCode:(id)a8 country:(id)a9 isoCountryCode:(id)a10;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGPostalAddressComponents

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);

  objc_storeStrong((id *)&self->_street, 0);
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (NSString)country
{
  return self->_country;
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (NSString)city
{
  return self->_city;
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (NSString)street
{
  return self->_street;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"%@/%@/%@/%@/%@/%@/%@/%@", self->_street, self->_subLocality, self->_city, self->_subAdministrativeArea, self->_state, self->_postalCode, self->_country, self->_isoCountryCode];

  return v2;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_street hash];
  NSUInteger v4 = [(NSString *)self->_city hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_postalCode hash] - v4 + 32 * v4;
  return [(NSString *)self->_country hash] - v5 + 32 * v5;
}

- (BOOL)isEqualToPostalAddressComponents:(id)a3
{
  NSUInteger v4 = (id *)a3;
  street = self->_street;
  v6 = (NSString *)v4[1];
  if (street == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = street;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_27;
    }
  }
  subLocality = self->_subLocality;
  v11 = (NSString *)v4[2];
  if (subLocality == v11)
  {
  }
  else
  {
    v12 = v11;
    v13 = subLocality;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_27;
    }
  }
  city = self->_city;
  v16 = (NSString *)v4[3];
  if (city == v16)
  {
  }
  else
  {
    v17 = v16;
    v18 = city;
    char v19 = [(NSString *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_27;
    }
  }
  subAdministrativeArea = self->_subAdministrativeArea;
  v21 = (NSString *)v4[4];
  if (subAdministrativeArea == v21)
  {
  }
  else
  {
    v22 = v21;
    v23 = subAdministrativeArea;
    char v24 = [(NSString *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_27;
    }
  }
  state = self->_state;
  v26 = (NSString *)v4[5];
  if (state == v26)
  {
  }
  else
  {
    v27 = v26;
    v28 = state;
    char v29 = [(NSString *)v28 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_27;
    }
  }
  postalCode = self->_postalCode;
  v31 = (NSString *)v4[6];
  if (postalCode == v31)
  {
  }
  else
  {
    v32 = v31;
    v33 = postalCode;
    char v34 = [(NSString *)v33 isEqual:v32];

    if ((v34 & 1) == 0) {
      goto LABEL_27;
    }
  }
  country = self->_country;
  v36 = (NSString *)v4[7];
  if (country == v36)
  {
  }
  else
  {
    v37 = v36;
    v38 = country;
    char v39 = [(NSString *)v38 isEqual:v37];

    if ((v39 & 1) == 0)
    {
LABEL_27:
      char v40 = 0;
      goto LABEL_28;
    }
  }
  v42 = self->_isoCountryCode;
  v43 = v42;
  if (v42 == v4[8]) {
    char v40 = 1;
  }
  else {
    char v40 = -[NSString isEqual:](v42, "isEqual:");
  }

LABEL_28:
  return v40;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (SGPostalAddressComponents *)a3;
  NSUInteger v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGPostalAddressComponents *)self isEqualToPostalAddressComponents:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  street = self->_street;
  id v5 = a3;
  [v5 encodeObject:street forKey:@"street"];
  [v5 encodeObject:self->_subLocality forKey:@"subLocality"];
  [v5 encodeObject:self->_city forKey:@"city"];
  [v5 encodeObject:self->_subAdministrativeArea forKey:@"subAdministrativeArea"];
  [v5 encodeObject:self->_state forKey:@"state"];
  [v5 encodeObject:self->_postalCode forKey:@"postalCode"];
  [v5 encodeObject:self->_country forKey:@"country"];
  [v5 encodeObject:self->_isoCountryCode forKey:@"isoCountryCode"];
}

- (SGPostalAddressComponents)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SGPostalAddressComponents;
  id v5 = [(SGPostalAddressComponents *)&v31 init];
  if (v5)
  {
    BOOL v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"street"];
    street = v5->_street;
    v5->_street = (NSString *)v7;

    char v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"subLocality"];
    subLocality = v5->_subLocality;
    v5->_subLocality = (NSString *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"city"];
    city = v5->_city;
    v5->_city = (NSString *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"subAdministrativeArea"];
    subAdministrativeArea = v5->_subAdministrativeArea;
    v5->_subAdministrativeArea = (NSString *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"state"];
    state = v5->_state;
    v5->_state = (NSString *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"postalCode"];
    postalCode = v5->_postalCode;
    v5->_postalCode = (NSString *)v22;

    char v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"country"];
    country = v5->_country;
    v5->_country = (NSString *)v25;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"isoCountryCode"];
    isoCountryCode = v5->_isoCountryCode;
    v5->_isoCountryCode = (NSString *)v28;
  }
  return v5;
}

- (SGPostalAddressComponents)initWithStreet:(id)a3 subLocality:(id)a4 city:(id)a5 subAdministrativeArea:(id)a6 state:(id)a7 postalCode:(id)a8 country:(id)a9 isoCountryCode:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)SGPostalAddressComponents;
  v18 = [(SGPostalAddressComponents *)&v28 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_street, a3);
    objc_storeStrong((id *)&v19->_subLocality, a4);
    objc_storeStrong((id *)&v19->_city, a5);
    objc_storeStrong((id *)&v19->_subAdministrativeArea, a6);
    objc_storeStrong((id *)&v19->_state, a7);
    objc_storeStrong((id *)&v19->_postalCode, a8);
    objc_storeStrong((id *)&v19->_country, a9);
    objc_storeStrong((id *)&v19->_isoCountryCode, a10);
  }

  return v19;
}

+ (id)components:(id)a3 subLocality:(id)a4 city:(id)a5 subAdministrativeArea:(id)a6 state:(id)a7 postalCode:(id)a8 country:(id)a9 isoCountryCode:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  id v24 = [[SGPostalAddressComponents alloc] initWithStreet:v23 subLocality:v22 city:v21 subAdministrativeArea:v20 state:v19 postalCode:v18 country:v17 isoCountryCode:v16];

  return v24;
}

+ (id)components:(id)a3 city:(id)a4 state:(id)a5 postalCode:(id)a6 country:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [[SGPostalAddressComponents alloc] initWithStreet:v15 subLocality:0 city:v14 subAdministrativeArea:0 state:v13 postalCode:v12 country:v11 isoCountryCode:0];

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end