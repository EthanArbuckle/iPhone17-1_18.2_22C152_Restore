@interface FMLPlaceMark
- (BOOL)isEqual:(id)a3;
- (FMLPlaceMark)initWithLocality:(id)a3 administrativeArea:(id)a4 country:(id)a5 stateCode:(id)a6 streetAddress:(id)a7 streetName:(id)a8 formattedAddressLines:(id)a9;
- (NSArray)formattedAddressLines;
- (NSString)administrativeArea;
- (NSString)country;
- (NSString)locality;
- (NSString)stateCode;
- (NSString)streetAddress;
- (NSString)streetName;
- (id)comparisonIdentifier;
- (id)debugDescription;
- (unint64_t)hash;
- (void)setAdministrativeArea:(id)a3;
- (void)setCountry:(id)a3;
- (void)setFormattedAddressLines:(id)a3;
- (void)setLocality:(id)a3;
- (void)setStateCode:(id)a3;
- (void)setStreetAddress:(id)a3;
- (void)setStreetName:(id)a3;
@end

@implementation FMLPlaceMark

- (FMLPlaceMark)initWithLocality:(id)a3 administrativeArea:(id)a4 country:(id)a5 stateCode:(id)a6 streetAddress:(id)a7 streetName:(id)a8 formattedAddressLines:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v26.receiver = self;
  v26.super_class = (Class)FMLPlaceMark;
  v22 = [(FMLPlaceMark *)&v26 init];
  v23 = v22;
  if (v22)
  {
    [(FMLPlaceMark *)v22 setLocality:v15];
    [(FMLPlaceMark *)v23 setAdministrativeArea:v16];
    [(FMLPlaceMark *)v23 setCountry:v17];
    [(FMLPlaceMark *)v23 setStateCode:v18];
    [(FMLPlaceMark *)v23 setStreetAddress:v19];
    [(FMLPlaceMark *)v23 setStreetName:v20];
    v24 = (void *)[v21 copy];
    [(FMLPlaceMark *)v23 setFormattedAddressLines:v24];
  }
  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(FMLPlaceMark *)self comparisonIdentifier];
    v7 = [v5 comparisonIdentifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)comparisonIdentifier
{
  v3 = NSString;
  id v4 = [(FMLPlaceMark *)self locality];
  id v5 = [(FMLPlaceMark *)self country];
  v6 = [(FMLPlaceMark *)self stateCode];
  v7 = [(FMLPlaceMark *)self streetAddress];
  char v8 = [(FMLPlaceMark *)self streetName];
  v9 = [v3 stringWithFormat:@"locality: %@, country: %@, stateCode: %@, streetAddress: %@, streetName: %@.", v4, v5, v6, v7, v8];

  return v9;
}

- (unint64_t)hash
{
  v2 = [(FMLPlaceMark *)self comparisonIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FMLPlaceMark *)self comparisonIdentifier];
  v6 = [v3 stringWithFormat:@"<%@ %p [%@]>", v4, self, v5];

  return v6;
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

- (NSString)stateCode
{
  return self->_stateCode;
}

- (void)setStateCode:(id)a3
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
  objc_storeStrong((id *)&self->_stateCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);

  objc_storeStrong((id *)&self->_locality, 0);
}

@end