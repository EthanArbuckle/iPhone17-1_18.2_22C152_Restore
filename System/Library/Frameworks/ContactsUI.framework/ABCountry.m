@interface ABCountry
- (NSString)countryCode;
- (NSString)countryName;
- (NSString)phoneticCountryName;
- (void)setCountryCode:(id)a3;
- (void)setCountryName:(id)a3;
- (void)setPhoneticCountryName:(id)a3;
@end

@implementation ABCountry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneticCountryName, 0);
  objc_storeStrong((id *)&self->_countryName, 0);

  objc_storeStrong((id *)&self->_countryCode, 0);
}

- (void)setPhoneticCountryName:(id)a3
{
}

- (NSString)phoneticCountryName
{
  return self->_phoneticCountryName;
}

- (void)setCountryName:(id)a3
{
}

- (NSString)countryName
{
  return self->_countryName;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

@end