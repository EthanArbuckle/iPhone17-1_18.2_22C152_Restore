@interface CRSApplicationIcon
+ (BOOL)supportsSecureCoding;
- (CRSApplicationIcon)initWithBundleIdentifier:(id)a3;
- (CRSApplicationIcon)initWithCoder:(id)a3;
- (NSData)iconImageData;
- (NSString)bundleIdentifier;
- (NSString)localizedDisplayName;
- (double)iconImageScale;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIconImageData:(id)a3;
- (void)setIconImageScale:(double)a3;
- (void)setLocalizedDisplayName:(id)a3;
@end

@implementation CRSApplicationIcon

- (CRSApplicationIcon)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRSApplicationIcon;
  v5 = [(CRSApplicationIcon *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;
  }
  return v5;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  v8.receiver = self;
  v8.super_class = (Class)CRSApplicationIcon;
  id v4 = [(CRSApplicationIcon *)&v8 description];
  v5 = [v3 stringWithString:v4];

  uint64_t v6 = [(CRSApplicationIcon *)self bundleIdentifier];
  [v5 appendFormat:@" %@", v6];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRSApplicationIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRSApplicationIcon;
  v5 = [(CRSApplicationIcon *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CRSApplicationIconBundleID"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CRSApplicationIconImageData"];
    iconImageData = v5->_iconImageData;
    v5->_iconImageData = (NSData *)v8;

    [v4 decodeFloatForKey:@"CRSApplicationIconImageScale"];
    v5->_iconImageScale = v10;
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CRSApplicationIconDisplayName"];
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CRSApplicationIcon *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"CRSApplicationIconBundleID"];

  uint64_t v6 = [(CRSApplicationIcon *)self iconImageData];
  [v4 encodeObject:v6 forKey:@"CRSApplicationIconImageData"];

  [(CRSApplicationIcon *)self iconImageScale];
  *(float *)&double v7 = v7;
  [v4 encodeFloat:@"CRSApplicationIconImageScale" forKey:v7];
  id v8 = [(CRSApplicationIcon *)self localizedDisplayName];
  [v4 encodeObject:v8 forKey:@"CRSApplicationIconDisplayName"];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSData)iconImageData
{
  return self->_iconImageData;
}

- (void)setIconImageData:(id)a3
{
}

- (double)iconImageScale
{
  return self->_iconImageScale;
}

- (void)setIconImageScale:(double)a3
{
  self->_iconImageScale = a3;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_iconImageData, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end