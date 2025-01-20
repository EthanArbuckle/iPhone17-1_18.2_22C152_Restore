@interface AKIconContext
+ (BOOL)supportsSecureCoding;
- (AKIconContext)init;
- (AKIconContext)initWithCoder:(id)a3;
- (NSData)data;
- (NSNumber)scale;
- (NSString)appName;
- (unint64_t)maskingStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setAppName:(id)a3;
- (void)setData:(id)a3;
- (void)setMaskingStyle:(unint64_t)a3;
- (void)setScale:(id)a3;
@end

@implementation AKIconContext

- (AKIconContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)AKIconContext;
  v2 = [(AKIconContext *)&v8 init];
  v3 = v2;
  if (v2)
  {
    data = v2->_data;
    v2->_data = 0;

    scale = v3->_scale;
    v3->_scale = 0;

    appName = v3->_appName;
    v3->_maskingStyle = 0;
    v3->_appName = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKIconContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AKIconContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_data"];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_scale"];
    scale = v5->_scale;
    v5->_scale = (NSNumber *)v8;

    v5->_maskingStyle = [v4 decodeIntegerForKey:@"_maskingStyle"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_appName"];
    appName = v5->_appName;
    v5->_appName = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  data = self->_data;
  id v5 = a3;
  [v5 encodeObject:data forKey:@"_data"];
  [v5 encodeObject:self->_scale forKey:@"_scale"];
  [v5 encodeInteger:self->_maskingStyle forKey:@"_maskingStyle"];
  [v5 encodeObject:self->_appName forKey:@"_appName"];
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSNumber)scale
{
  return self->_scale;
}

- (void)setScale:(id)a3
{
}

- (unint64_t)maskingStyle
{
  return self->_maskingStyle;
}

- (void)setMaskingStyle:(unint64_t)a3
{
  self->_maskingStyle = a3;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_scale, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end