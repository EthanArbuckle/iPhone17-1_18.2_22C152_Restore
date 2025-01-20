@interface AMSPaymentSheetImageAssetConfiguration
+ (BOOL)supportsSecureCoding;
- (AMSPaymentSheetImageAssetConfiguration)initWithCoder:(id)a3;
- (AMSPaymentSheetImageAssetConfiguration)initWithFilename:(id)a3 size:(CGSize)a4 type:(int64_t)a5;
- (CGSize)size;
- (NSString)fileExtension;
- (NSString)filename;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSPaymentSheetImageAssetConfiguration

- (AMSPaymentSheetImageAssetConfiguration)initWithFilename:(id)a3 size:(CGSize)a4 type:(int64_t)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AMSPaymentSheetImageAssetConfiguration;
  v10 = [(AMSPaymentSheetImageAssetConfiguration *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    filename = v10->_filename;
    v10->_filename = (NSString *)v11;

    v10->_size.CGFloat width = width;
    v10->_size.CGFloat height = height;
    v10->_type = a5;
  }

  return v10;
}

- (NSString)fileExtension
{
  if ([(AMSPaymentSheetImageAssetConfiguration *)self type] == 1) {
    return (NSString *)@"pdf";
  }
  else {
    return (NSString *)@"tiff";
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(AMSPaymentSheetImageAssetConfiguration *)self filename];
  [v5 encodeObject:v4 forKey:@"filename"];

  [(AMSPaymentSheetImageAssetConfiguration *)self size];
  objc_msgSend(v5, "encodeCGSize:forKey:", @"size");
  objc_msgSend(v5, "encodeInteger:forKey:", -[AMSPaymentSheetImageAssetConfiguration type](self, "type"), @"type");
}

- (AMSPaymentSheetImageAssetConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSPaymentSheetImageAssetConfiguration;
  id v5 = [(AMSPaymentSheetImageAssetConfiguration *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filename"];
    filename = v5->_filename;
    v5->_filename = (NSString *)v6;

    [v4 decodeCGSizeForKey:@"size"];
    v5->_size.CGFloat width = v8;
    v5->_size.CGFloat height = v9;
    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)filename
{
  return self->_filename;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end