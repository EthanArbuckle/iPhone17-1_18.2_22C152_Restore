@interface SKGPhoneNumber
- (BOOL)isEqual:(id)a3;
- (NSArray)synonyms;
- (NSString)phoneNumberValue;
- (id)description;
- (int64_t)countryCodeValue;
- (void)setCountryCodeValue:(int64_t)a3;
- (void)setPhoneNumberValue:(id)a3;
- (void)setSynonyms:(id)a3;
@end

@implementation SKGPhoneNumber

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(SKGPhoneNumber *)self phoneNumberValue];
    v7 = [(SKGPhoneNumber *)self phoneNumberValue];
    if ([v6 isEqualToString:v7])
    {
      v10.receiver = self;
      v10.super_class = (Class)SKGPhoneNumber;
      BOOL v8 = [(SKGEntity *)&v10 isEqual:v5];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(SKGPhoneNumber *)self phoneNumberValue];
  int64_t v5 = [(SKGPhoneNumber *)self countryCodeValue];
  [(SKGEntity *)self score];
  v7 = +[NSString stringWithFormat:@"<%@: %@ %ld %f", v3, v4, v5, v6];

  return v7;
}

- (NSString)phoneNumberValue
{
  return self->_phoneNumberValue;
}

- (void)setPhoneNumberValue:(id)a3
{
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (void)setSynonyms:(id)a3
{
}

- (int64_t)countryCodeValue
{
  return self->_countryCodeValue;
}

- (void)setCountryCodeValue:(int64_t)a3
{
  self->_countryCodeValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);

  objc_storeStrong((id *)&self->_phoneNumberValue, 0);
}

@end