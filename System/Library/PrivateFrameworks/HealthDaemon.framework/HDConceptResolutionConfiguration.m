@interface HDConceptResolutionConfiguration
- (HDConceptResolutionConfiguration)init;
- (HDConceptResolutionConfiguration)initWithCountryCode:(id)a3;
- (HDConceptResolutionConfiguration)initWithCountryCode:(id)a3 recordCategoryType:(int64_t)a4 options:(unint64_t)a5;
- (NSString)countryCode;
- (id)description;
- (int64_t)recordCategoryType;
- (unint64_t)options;
@end

@implementation HDConceptResolutionConfiguration

- (HDConceptResolutionConfiguration)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDConceptResolutionConfiguration)initWithCountryCode:(id)a3 recordCategoryType:(int64_t)a4 options:(unint64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDConceptResolutionConfiguration;
  v9 = [(HDConceptResolutionConfiguration *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    countryCode = v9->_countryCode;
    v9->_countryCode = (NSString *)v10;

    v9->_recordCategoryType = a4;
    v9->_options = a5;
  }

  return v9;
}

- (HDConceptResolutionConfiguration)initWithCountryCode:(id)a3
{
  return [(HDConceptResolutionConfiguration *)self initWithCountryCode:a3 recordCategoryType:0 options:0];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  countryCode = self->_countryCode;
  v6 = HKStringFromMedicalRecordCategoryType();
  v7 = [v3 stringWithFormat:@"<%@:%p %@ /'%@/'>", v4, self, countryCode, v6];

  return v7;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (int64_t)recordCategoryType
{
  return self->_recordCategoryType;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end