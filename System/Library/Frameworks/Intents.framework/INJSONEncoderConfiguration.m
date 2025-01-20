@interface INJSONEncoderConfiguration
- (BOOL)locationIncludesTimestamp;
- (INJSONEncoderConfiguration)init;
- (NSString)languageCode;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLocationIncludesTimestamp:(BOOL)a3;
@end

@implementation INJSONEncoderConfiguration

- (void).cxx_destruct
{
}

- (void)setLocationIncludesTimestamp:(BOOL)a3
{
  self->_locationIncludesTimestamp = a3;
}

- (BOOL)locationIncludesTimestamp
{
  return self->_locationIncludesTimestamp;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(INJSONEncoderConfiguration);
  [(INJSONEncoderConfiguration *)v4 setLanguageCode:self->_languageCode];
  [(INJSONEncoderConfiguration *)v4 setLocationIncludesTimestamp:self->_locationIncludesTimestamp];
  return v4;
}

- (INJSONEncoderConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)INJSONEncoderConfiguration;
  result = [(INJSONEncoderConfiguration *)&v3 init];
  if (result) {
    result->_locationIncludesTimestamp = 1;
  }
  return result;
}

@end