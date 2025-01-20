@interface MOShieldLabel
+ (BOOL)supportsSecureCoding;
- (MOShieldLabel)initWithCoder:(id)a3;
- (MOShieldLabel)initWithText:(id)a3 colorData:(id)a4;
- (NSData)colorData;
- (NSString)text;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOShieldLabel

- (MOShieldLabel)initWithText:(id)a3 colorData:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)MOShieldLabel;
  id v5 = a4;
  id v6 = a3;
  v7 = [(MOShieldLabel *)&v13 init];
  uint64_t v8 = objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  text = v7->_text;
  v7->_text = (NSString *)v8;

  uint64_t v10 = [v5 copy];
  colorData = v7->_colorData;
  v7->_colorData = (NSData *)v10;

  return v7;
}

- (MOShieldLabel)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Text"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ColorData"];

  v7 = [(MOShieldLabel *)self initWithText:v5 colorData:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"Text"];
  [v5 encodeObject:self->_colorData forKey:@"ColorData"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)colorData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorData, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end