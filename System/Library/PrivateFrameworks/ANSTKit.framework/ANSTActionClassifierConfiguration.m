@interface ANSTActionClassifierConfiguration
- (ANSTActionClassifierConfiguration)init;
- (ANSTActionClassifierConfiguration)initWithVersion:(unint64_t)a3;
- (id)description;
@end

@implementation ANSTActionClassifierConfiguration

- (ANSTActionClassifierConfiguration)init
{
  return (ANSTActionClassifierConfiguration *)objc_msgSend_initWithVersion_(self, a2, 0x10000);
}

- (ANSTActionClassifierConfiguration)initWithVersion:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ANSTActionClassifierConfiguration;
  return [(ANSTConfiguration *)&v4 initWithVersion:a3];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_msgSend_version(self, a2, v2);
  v5 = ANSTActionClassifierVersionToNSString(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"ANSTActionClassifierConfiguration [version %@]", v5);

  return v7;
}

@end