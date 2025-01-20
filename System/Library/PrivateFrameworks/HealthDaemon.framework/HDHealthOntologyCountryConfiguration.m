@interface HDHealthOntologyCountryConfiguration
- (HDHealthOntologyCountryConfiguration)initWithCountryCode:(id)a3 supportedCodingSystems:(id)a4 analyticsOptions:(unint64_t)a5;
- (NSSet)supportedCodingSystems;
- (NSString)countryCode;
- (unint64_t)analyticsOptions;
@end

@implementation HDHealthOntologyCountryConfiguration

- (HDHealthOntologyCountryConfiguration)initWithCountryCode:(id)a3 supportedCodingSystems:(id)a4 analyticsOptions:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDHealthOntologyCountryConfiguration;
  v10 = [(HDHealthOntologyCountryConfiguration *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    countryCode = v10->_countryCode;
    v10->_countryCode = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    supportedCodingSystems = v10->_supportedCodingSystems;
    v10->_supportedCodingSystems = (NSSet *)v13;

    v10->_analyticsOptions = a5;
  }

  return v10;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSSet)supportedCodingSystems
{
  return self->_supportedCodingSystems;
}

- (unint64_t)analyticsOptions
{
  return self->_analyticsOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCodingSystems, 0);

  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end