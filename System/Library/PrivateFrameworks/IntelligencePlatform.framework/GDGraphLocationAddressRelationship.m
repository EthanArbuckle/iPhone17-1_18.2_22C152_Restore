@interface GDGraphLocationAddressRelationship
- (GDGraphLocationAddressRelationship)initWithStreetField:(id)a3 subLocalityField:(id)a4 cityField:(id)a5 subAdministrativeAreaField:(id)a6 stateField:(id)a7 postalCodeField:(id)a8 countryField:(id)a9 isoCountryCodeField:(id)a10 inferredSemanticLabelField:(id)a11 allStreetField:(id)a12 allSubLocalityField:(id)a13 allCityField:(id)a14 allSubAdministrativeAreaField:(id)a15 allStateField:(id)a16 allPostalCodeField:(id)a17 allCountryField:(id)a18 allIsoCountryCodeField:(id)a19 allInferredSemanticLabelField:(id)a20;
- (NSArray)allCity;
- (NSArray)allCountry;
- (NSArray)allInferredSemanticLabel;
- (NSArray)allIsoCountryCode;
- (NSArray)allPostalCode;
- (NSArray)allState;
- (NSArray)allStreet;
- (NSArray)allSubAdministrativeArea;
- (NSArray)allSubLocality;
- (NSString)city;
- (NSString)country;
- (NSString)inferredSemanticLabel;
- (NSString)isoCountryCode;
- (NSString)postalCode;
- (NSString)state;
- (NSString)street;
- (NSString)subAdministrativeArea;
- (NSString)subLocality;
@end

@implementation GDGraphLocationAddressRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allInferredSemanticLabel, 0);
  objc_storeStrong((id *)&self->_allIsoCountryCode, 0);
  objc_storeStrong((id *)&self->_allCountry, 0);
  objc_storeStrong((id *)&self->_allPostalCode, 0);
  objc_storeStrong((id *)&self->_allState, 0);
  objc_storeStrong((id *)&self->_allSubAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_allCity, 0);
  objc_storeStrong((id *)&self->_allSubLocality, 0);
  objc_storeStrong((id *)&self->_allStreet, 0);
  objc_storeStrong((id *)&self->_inferredSemanticLabel, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);

  objc_storeStrong((id *)&self->_street, 0);
}

- (NSArray)allInferredSemanticLabel
{
  return self->_allInferredSemanticLabel;
}

- (NSArray)allIsoCountryCode
{
  return self->_allIsoCountryCode;
}

- (NSArray)allCountry
{
  return self->_allCountry;
}

- (NSArray)allPostalCode
{
  return self->_allPostalCode;
}

- (NSArray)allState
{
  return self->_allState;
}

- (NSArray)allSubAdministrativeArea
{
  return self->_allSubAdministrativeArea;
}

- (NSArray)allCity
{
  return self->_allCity;
}

- (NSArray)allSubLocality
{
  return self->_allSubLocality;
}

- (NSArray)allStreet
{
  return self->_allStreet;
}

- (NSString)inferredSemanticLabel
{
  return self->_inferredSemanticLabel;
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

- (GDGraphLocationAddressRelationship)initWithStreetField:(id)a3 subLocalityField:(id)a4 cityField:(id)a5 subAdministrativeAreaField:(id)a6 stateField:(id)a7 postalCodeField:(id)a8 countryField:(id)a9 isoCountryCodeField:(id)a10 inferredSemanticLabelField:(id)a11 allStreetField:(id)a12 allSubLocalityField:(id)a13 allCityField:(id)a14 allSubAdministrativeAreaField:(id)a15 allStateField:(id)a16 allPostalCodeField:(id)a17 allCountryField:(id)a18 allIsoCountryCodeField:(id)a19 allInferredSemanticLabelField:(id)a20
{
  id v51 = a3;
  id v36 = a4;
  id v50 = a4;
  id v37 = a5;
  id v49 = a5;
  id v38 = a6;
  id v48 = a6;
  id v39 = a7;
  id v47 = a7;
  id v46 = a8;
  id v45 = a9;
  id v44 = a10;
  id v43 = a11;
  id v42 = a12;
  id v41 = a13;
  id v25 = a14;
  id v26 = a15;
  id v27 = a16;
  id v28 = a17;
  id v29 = a18;
  id v30 = a19;
  id v31 = a20;
  v52.receiver = self;
  v52.super_class = (Class)GDGraphLocationAddressRelationship;
  v32 = [(GDGraphLocationAddressRelationship *)&v52 init];
  v33 = v32;
  if (v32)
  {
    objc_storeStrong((id *)&v32->_street, a3);
    objc_storeStrong((id *)&v33->_subLocality, v36);
    objc_storeStrong((id *)&v33->_city, v37);
    objc_storeStrong((id *)&v33->_subAdministrativeArea, v38);
    objc_storeStrong((id *)&v33->_state, v39);
    objc_storeStrong((id *)&v33->_postalCode, a8);
    objc_storeStrong((id *)&v33->_country, a9);
    objc_storeStrong((id *)&v33->_isoCountryCode, a10);
    objc_storeStrong((id *)&v33->_inferredSemanticLabel, a11);
    objc_storeStrong((id *)&v33->_allStreet, a12);
    objc_storeStrong((id *)&v33->_allSubLocality, a13);
    objc_storeStrong((id *)&v33->_allCity, a14);
    objc_storeStrong((id *)&v33->_allSubAdministrativeArea, a15);
    objc_storeStrong((id *)&v33->_allState, a16);
    objc_storeStrong((id *)&v33->_allPostalCode, a17);
    objc_storeStrong((id *)&v33->_allCountry, a18);
    objc_storeStrong((id *)&v33->_allIsoCountryCode, a19);
    objc_storeStrong((id *)&v33->_allInferredSemanticLabel, a20);
  }

  return v33;
}

@end