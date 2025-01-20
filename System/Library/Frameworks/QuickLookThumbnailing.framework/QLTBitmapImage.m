@interface QLTBitmapImage
+ (BOOL)supportsSecureCoding;
+ (id)imageWithFormat:(id)a3 data:(id)a4;
- (NSData)data;
- (QLTBitmapFormat)format;
- (QLTBitmapImage)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setFormat:(id)a3;
@end

@implementation QLTBitmapImage

- (QLTBitmapFormat)format
{
  return self->_format;
}

- (NSData)data
{
  return self->_data;
}

- (void)encodeWithCoder:(id)a3
{
  data = self->_data;
  id v5 = a3;
  [v5 encodeObject:data forKey:@"d"];
  [v5 encodeObject:self->_format forKey:@"f"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

+ (id)imageWithFormat:(id)a3 data:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setFormat:v6];

  [v7 setData:v5];

  return v7;
}

- (void)setFormat:(id)a3
{
}

- (void)setData:(id)a3
{
}

- (QLTBitmapImage)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)QLTBitmapImage;
  id v3 = a3;
  v4 = [(QLTBitmapImage *)&v10 init];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"d", v10.receiver, v10.super_class);
  data = v4->_data;
  v4->_data = (NSData *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"f"];

  format = v4->_format;
  v4->_format = (QLTBitmapFormat *)v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end