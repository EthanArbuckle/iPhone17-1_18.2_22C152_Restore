@interface FMFPlacemark
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FMFPlacemark)initWithCoder:(id)a3;
- (FMFPlacemark)initWithDictionary:(id)a3;
- (FMFPlacemark)initWithLocality:(id)a3 administrativeArea:(id)a4 country:(id)a5 state:(id)a6 streetAddress:(id)a7 streetName:(id)a8;
- (NSArray)formattedAddressLines;
- (NSString)administrativeArea;
- (NSString)country;
- (NSString)locality;
- (NSString)state;
- (NSString)streetAddress;
- (NSString)streetName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryValue;
- (id)formattedAddress;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAdministrativeArea:(id)a3;
- (void)setCountry:(id)a3;
- (void)setFormattedAddressLines:(id)a3;
- (void)setLocality:(id)a3;
- (void)setState:(id)a3;
- (void)setStreetAddress:(id)a3;
- (void)setStreetName:(id)a3;
@end

@implementation FMFPlacemark

- (FMFPlacemark)initWithLocality:(id)a3 administrativeArea:(id)a4 country:(id)a5 state:(id)a6 streetAddress:(id)a7 streetName:(id)a8
{
  v34[4] = *MEMORY[0x263EF8340];
  v14 = (__CFString *)a3;
  v15 = (__CFString *)a4;
  v16 = (__CFString *)a5;
  v17 = (__CFString *)a6;
  v18 = (__CFString *)a7;
  v19 = (__CFString *)a8;
  v20 = [(FMFPlacemark *)self init];
  v21 = v20;
  if (v20)
  {
    if (v15) {
      v22 = v15;
    }
    else {
      v22 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v20->_administrativeArea, v22);
    if (v16) {
      v23 = v16;
    }
    else {
      v23 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v21->_country, v23);
    if (v14) {
      v24 = v14;
    }
    else {
      v24 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v21->_locality, v24);
    if (v17) {
      v25 = v17;
    }
    else {
      v25 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v21->_state, v25);
    if (v18) {
      v26 = v18;
    }
    else {
      v26 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v21->_streetAddress, v26);
    if (v19) {
      v27 = v19;
    }
    else {
      v27 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v21->_streetName, v27);
    locality = v21->_locality;
    v34[0] = v21->_streetName;
    v34[1] = locality;
    country = v21->_country;
    v34[2] = v21->_state;
    v34[3] = country;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
    uint64_t v31 = objc_msgSend(v30, "fm_filter:", &__block_literal_global_2);
    formattedAddressLines = v21->_formattedAddressLines;
    v21->_formattedAddressLines = (NSArray *)v31;
  }
  return v21;
}

BOOL __91__FMFPlacemark_initWithLocality_administrativeArea_country_state_streetAddress_streetName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

- (FMFPlacemark)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(FMFPlacemark *)self init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"administrativeArea"];
    v7 = [MEMORY[0x263EFF9D0] null];
    if (v6 == v7)
    {
      v8 = 0;
    }
    else
    {
      v8 = [v4 objectForKeyedSubscript:@"administrativeArea"];
    }
    if (v8) {
      v9 = v8;
    }
    else {
      v9 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v5->_administrativeArea, v9);
    if (v6 != v7) {

    }
    v10 = [v4 objectForKeyedSubscript:@"country"];
    v11 = [MEMORY[0x263EFF9D0] null];
    if (v10 == v11)
    {
      v12 = 0;
    }
    else
    {
      v12 = [v4 objectForKeyedSubscript:@"country"];
    }
    if (v12) {
      v13 = v12;
    }
    else {
      v13 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v5->_country, v13);
    if (v10 != v11) {

    }
    v14 = [v4 objectForKeyedSubscript:@"formattedAddressLines"];
    v15 = [MEMORY[0x263EFF9D0] null];
    if (v14 == v15)
    {
      uint64_t v19 = objc_opt_new();
      formattedAddressLines = v5->_formattedAddressLines;
      v5->_formattedAddressLines = (NSArray *)v19;
    }
    else
    {
      v16 = [v4 objectForKeyedSubscript:@"formattedAddressLines"];
      formattedAddressLines = v16;
      if (v16) {
        v18 = v16;
      }
      else {
        v18 = (NSArray *)objc_opt_new();
      }
      v20 = v5->_formattedAddressLines;
      v5->_formattedAddressLines = v18;
    }
    v21 = [v4 objectForKeyedSubscript:@"locality"];
    v22 = [MEMORY[0x263EFF9D0] null];
    if (v21 == v22)
    {
      v23 = 0;
    }
    else
    {
      v23 = [v4 objectForKeyedSubscript:@"locality"];
    }
    if (v23) {
      v24 = v23;
    }
    else {
      v24 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v5->_locality, v24);
    if (v21 != v22) {

    }
    v25 = [v4 objectForKeyedSubscript:@"stateCode"];
    v26 = [MEMORY[0x263EFF9D0] null];
    if (v25 == v26)
    {
      v27 = 0;
    }
    else
    {
      v27 = [v4 objectForKeyedSubscript:@"stateCode"];
    }
    if (v27) {
      v28 = v27;
    }
    else {
      v28 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v5->_state, v28);
    if (v25 != v26) {

    }
    v29 = [v4 objectForKeyedSubscript:@"streetAddress"];
    v30 = [MEMORY[0x263EFF9D0] null];
    if (v29 == v30)
    {
      uint64_t v31 = 0;
    }
    else
    {
      uint64_t v31 = [v4 objectForKeyedSubscript:@"streetAddress"];
    }
    if (v31) {
      v32 = v31;
    }
    else {
      v32 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v5->_streetAddress, v32);
    if (v29 != v30) {

    }
    v33 = [v4 objectForKeyedSubscript:@"streetName"];
    v34 = [MEMORY[0x263EFF9D0] null];
    if (v33 == v34)
    {
      v35 = 0;
    }
    else
    {
      v35 = [v4 objectForKeyedSubscript:@"streetName"];
    }
    if (v35) {
      v36 = v35;
    }
    else {
      v36 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v5->_streetName, v36);
    if (v33 != v34) {
  }
    }
  return v5;
}

- (FMFPlacemark)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMFPlacemark *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"administrativeArea"];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v5->_administrativeArea, v8);

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"country"];
    v10 = (void *)v9;
    if (v9) {
      v11 = (__CFString *)v9;
    }
    else {
      v11 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v5->_country, v11);

    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"formattedAddressLines"];
    v16 = v15;
    if (v15) {
      v17 = v15;
    }
    else {
      v17 = (NSArray *)objc_opt_new();
    }
    formattedAddressLines = v5->_formattedAddressLines;
    v5->_formattedAddressLines = v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locality"];
    v20 = (void *)v19;
    if (v19) {
      v21 = (__CFString *)v19;
    }
    else {
      v21 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v5->_locality, v21);

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stateCode"];
    v23 = (void *)v22;
    if (v22) {
      v24 = (__CFString *)v22;
    }
    else {
      v24 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v5->_state, v24);

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"streetAddress"];
    v26 = (void *)v25;
    if (v25) {
      v27 = (__CFString *)v25;
    }
    else {
      v27 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v5->_streetAddress, v27);

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"streetName"];
    v29 = (void *)v28;
    if (v28) {
      v30 = (__CFString *)v28;
    }
    else {
      v30 = &stru_26BEE3E40;
    }
    objc_storeStrong((id *)&v5->_streetName, v30);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  administrativeArea = self->_administrativeArea;
  id v5 = a3;
  [v5 encodeObject:administrativeArea forKey:@"administrativeArea"];
  [v5 encodeObject:self->_country forKey:@"country"];
  [v5 encodeObject:self->_formattedAddressLines forKey:@"formattedAddressLines"];
  [v5 encodeObject:self->_locality forKey:@"locality"];
  [v5 encodeObject:self->_state forKey:@"stateCode"];
  [v5 encodeObject:self->_streetAddress forKey:@"streetAddress"];
  [v5 encodeObject:self->_streetName forKey:@"streetName"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)formattedAddress
{
  v2 = [(FMFPlacemark *)self formattedAddressLines];
  v3 = [v2 componentsJoinedByString:@"\n"];
  id v4 = v3;
  if (!v3) {
    v3 = &stru_26BEE3E40;
  }
  id v5 = v3;

  return v5;
}

- (id)dictionaryValue
{
  v3 = objc_opt_new();
  [v3 setObject:self->_administrativeArea forKeyedSubscript:@"administrativeArea"];
  [v3 setObject:self->_country forKeyedSubscript:@"country"];
  [v3 setObject:self->_formattedAddressLines forKeyedSubscript:@"formattedAddressLines"];
  [v3 setObject:self->_locality forKeyedSubscript:@"locality"];
  [v3 setObject:self->_streetName forKeyedSubscript:@"streetName"];
  [v3 setObject:self->_streetAddress forKeyedSubscript:@"streetAddress"];
  [v3 setObject:self->_state forKeyedSubscript:@"stateCode"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setAdministrativeArea:self->_administrativeArea];
  [v4 setCountry:self->_country];
  [v4 setFormattedAddressLines:self->_formattedAddressLines];
  [v4 setLocality:self->_locality];
  [v4 setState:self->_state];
  [v4 setStreetAddress:self->_streetAddress];
  [v4 setStreetName:self->_streetName];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(FMFPlacemark *)self administrativeArea];
    v7 = [v5 administrativeArea];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(FMFPlacemark *)self country];
      uint64_t v9 = [v5 country];
      if ([v8 isEqualToString:v9])
      {
        v10 = [(FMFPlacemark *)self formattedAddressLines];
        v11 = [v5 formattedAddressLines];
        if ([v10 isEqualToArray:v11])
        {
          v12 = [(FMFPlacemark *)self locality];
          uint64_t v25 = [v5 locality];
          v26 = v12;
          if ([v12 isEqualToString:v25])
          {
            uint64_t v13 = [(FMFPlacemark *)self state];
            v23 = [v5 state];
            v24 = v13;
            if ([v13 isEqualToString:v23])
            {
              uint64_t v14 = [(FMFPlacemark *)self streetAddress];
              uint64_t v15 = [v5 streetAddress];
              uint64_t v22 = (void *)v14;
              v16 = (void *)v14;
              v17 = (void *)v15;
              if ([v16 isEqualToString:v15])
              {
                v21 = [(FMFPlacemark *)self streetName];
                v20 = [v5 streetName];
                char v18 = [v21 isEqualToString:v20];
              }
              else
              {
                char v18 = 0;
              }
            }
            else
            {
              char v18 = 0;
            }
          }
          else
          {
            char v18 = 0;
          }
        }
        else
        {
          char v18 = 0;
        }
      }
      else
      {
        char v18 = 0;
      }
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  v3 = [(FMFPlacemark *)self administrativeArea];
  uint64_t v4 = [v3 hash];
  id v5 = [(FMFPlacemark *)self country];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(FMFPlacemark *)self formattedAddressLines];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = [(FMFPlacemark *)self locality];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(FMFPlacemark *)self state];
  uint64_t v12 = [v11 hash];
  uint64_t v13 = [(FMFPlacemark *)self streetAddress];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = [(FMFPlacemark *)self streetName];
  unint64_t v16 = v10 ^ v14 ^ [v15 hash];

  return v16;
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setLocality:(id)a3
{
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)streetAddress
{
  return self->_streetAddress;
}

- (void)setStreetAddress:(id)a3
{
}

- (NSString)streetName
{
  return self->_streetName;
}

- (void)setStreetName:(id)a3
{
}

- (NSArray)formattedAddressLines
{
  return self->_formattedAddressLines;
}

- (void)setFormattedAddressLines:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedAddressLines, 0);
  objc_storeStrong((id *)&self->_streetName, 0);
  objc_storeStrong((id *)&self->_streetAddress, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);

  objc_storeStrong((id *)&self->_locality, 0);
}

@end