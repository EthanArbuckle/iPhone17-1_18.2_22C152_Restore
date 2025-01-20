@interface ATXTimeEventIcon
+ (BOOL)supportsSecureCoding;
- (ATXTimeEventIcon)initWithBundleId:(id)a3;
- (ATXTimeEventIcon)initWithCoder:(id)a3;
- (ATXTimeEventIcon)initWithContactImageData:(id)a3;
- (ATXTimeEventIcon)initWithSymbolImageName:(id)a3 backgroundColorName:(id)a4 foregroundColorName:(id)a5;
- (NSData)contactImageData;
- (NSString)backgroundColorName;
- (NSString)bundleId;
- (NSString)foregroundColorName;
- (NSString)symbolImageName;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXTimeEventIcon

- (ATXTimeEventIcon)initWithBundleId:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXTimeEventIcon;
  v5 = [(ATXTimeEventIcon *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;
  }
  return v5;
}

- (ATXTimeEventIcon)initWithContactImageData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXTimeEventIcon;
  v5 = [(ATXTimeEventIcon *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contactImageData = v5->_contactImageData;
    v5->_contactImageData = (NSData *)v6;
  }
  return v5;
}

- (ATXTimeEventIcon)initWithSymbolImageName:(id)a3 backgroundColorName:(id)a4 foregroundColorName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXTimeEventIcon;
  v11 = [(ATXTimeEventIcon *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    symbolImageName = v11->_symbolImageName;
    v11->_symbolImageName = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    backgroundColorName = v11->_backgroundColorName;
    v11->_backgroundColorName = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    foregroundColorName = v11->_foregroundColorName;
    v11->_foregroundColorName = (NSString *)v16;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  bundleId = self->_bundleId;
  id v5 = a3;
  [v5 encodeObject:bundleId forKey:@"bundle"];
  [v5 encodeObject:self->_contactImageData forKey:@"imageData"];
  [v5 encodeObject:self->_symbolImageName forKey:@"symbol"];
  [v5 encodeObject:self->_foregroundColorName forKey:@"foreground"];
  [v5 encodeObject:self->_backgroundColorName forKey:@"background"];
}

- (ATXTimeEventIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATXTimeEventIcon;
  id v5 = [(ATXTimeEventIcon *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundle"];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
    contactImageData = v5->_contactImageData;
    v5->_contactImageData = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbol"];
    symbolImageName = v5->_symbolImageName;
    v5->_symbolImageName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"foreground"];
    foregroundColorName = v5->_foregroundColorName;
    v5->_foregroundColorName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"background"];
    backgroundColorName = v5->_backgroundColorName;
    v5->_backgroundColorName = (NSString *)v14;
  }
  return v5;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSData)contactImageData
{
  return self->_contactImageData;
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (NSString)backgroundColorName
{
  return self->_backgroundColorName;
}

- (NSString)foregroundColorName
{
  return self->_foregroundColorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColorName, 0);
  objc_storeStrong((id *)&self->_backgroundColorName, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_contactImageData, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end