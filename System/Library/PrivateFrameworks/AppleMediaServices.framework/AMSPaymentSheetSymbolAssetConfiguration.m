@interface AMSPaymentSheetSymbolAssetConfiguration
+ (BOOL)supportsSecureCoding;
- (AMSPaymentSheetSymbolAssetConfiguration)initWithCoder:(id)a3;
- (AMSPaymentSheetSymbolAssetConfiguration)initWithName:(id)a3 accessibilityText:(id)a4 scale:(int64_t)a5;
- (NSString)accessibilityText;
- (NSString)name;
- (int64_t)scale;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSPaymentSheetSymbolAssetConfiguration

- (AMSPaymentSheetSymbolAssetConfiguration)initWithName:(id)a3 accessibilityText:(id)a4 scale:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSPaymentSheetSymbolAssetConfiguration;
  v10 = [(AMSPaymentSheetSymbolAssetConfiguration *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    accessibilityText = v10->_accessibilityText;
    v10->_accessibilityText = (NSString *)v13;

    v10->_scale = a5;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(AMSPaymentSheetSymbolAssetConfiguration *)self name];
  [v6 encodeObject:v4 forKey:@"name"];

  v5 = [(AMSPaymentSheetSymbolAssetConfiguration *)self accessibilityText];
  [v6 encodeObject:v5 forKey:@"accessibilityText"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[AMSPaymentSheetSymbolAssetConfiguration scale](self, "scale"), @"scale");
}

- (AMSPaymentSheetSymbolAssetConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSPaymentSheetSymbolAssetConfiguration;
  v5 = [(AMSPaymentSheetSymbolAssetConfiguration *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityText"];
    accessibilityText = v5->_accessibilityText;
    v5->_accessibilityText = (NSString *)v8;

    v5->_scale = [v4 decodeIntegerForKey:@"scale"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_accessibilityText, 0);
}

@end