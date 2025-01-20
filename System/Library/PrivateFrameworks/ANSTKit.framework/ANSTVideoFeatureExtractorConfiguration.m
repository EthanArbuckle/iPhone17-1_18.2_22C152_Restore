@interface ANSTVideoFeatureExtractorConfiguration
- (ANSTVideoFeatureExtractorConfiguration)init;
- (ANSTVideoFeatureExtractorConfiguration)initWithVersion:(unint64_t)a3;
- (id)description;
@end

@implementation ANSTVideoFeatureExtractorConfiguration

- (ANSTVideoFeatureExtractorConfiguration)init
{
  return (ANSTVideoFeatureExtractorConfiguration *)objc_msgSend_initWithVersion_(self, a2, 0x10000);
}

- (ANSTVideoFeatureExtractorConfiguration)initWithVersion:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ANSTVideoFeatureExtractorConfiguration;
  return [(ANSTConfiguration *)&v4 initWithVersion:a3];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_msgSend_version(self, a2, v2);
  v5 = ANSTVideoFeatureExtractorVersionToNSString(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"ANSTVideoFeatureExtractorConfiguration [version %@]", v5);

  return v7;
}

@end