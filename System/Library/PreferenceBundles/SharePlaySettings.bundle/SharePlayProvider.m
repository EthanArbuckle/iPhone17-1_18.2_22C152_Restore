@interface SharePlayProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToProvider:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)localizedName;
- (SharePlayProvider)initWithBundleIdentifier:(id)a3;
- (SharePlayProvider)initWithCoder:(id)a3;
- (SharePlayProvider)initWithProvider:(id)a3;
- (UIImage)iconImage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIconImage:(id)a3;
- (void)setLocalizedName:(id)a3;
@end

@implementation SharePlayProvider

- (SharePlayProvider)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SharePlayProvider;
  v5 = [(SharePlayProvider *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = v6;
  }
  return v5;
}

- (SharePlayProvider)initWithProvider:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SharePlayProvider;
  v5 = [(SharePlayProvider *)&v11 init];
  if (v5)
  {
    v6 = (NSString *)[*((id *)v4 + 2) copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = v6;

    v5->_enabled = *((unsigned char *)v4 + 8);
    v8 = (NSString *)[*((id *)v4 + 4) copy];
    localizedName = v5->_localizedName;
    v5->_localizedName = v8;

    objc_storeStrong((id *)&v5->_iconImage, *((id *)v4 + 3));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SharePlayProvider allocWithZone:a3];

  return [(SharePlayProvider *)v4 initWithProvider:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[SharePlayMutableProvider allocWithZone:a3];

  return [(SharePlayProvider *)v4 initWithProvider:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  v6 = NSStringFromSelector("bundleIdentifier");
  [v5 encodeObject:bundleIdentifier forKey:v6];

  BOOL enabled = self->_enabled;
  v8 = NSStringFromSelector("isEnabled");
  [v5 encodeBool:enabled forKey:v8];

  iconImage = self->_iconImage;
  v10 = NSStringFromSelector("iconImage");
  [v5 encodeObject:iconImage forKey:v10];

  localizedName = self->_localizedName;
  NSStringFromSelector("localizedName");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:localizedName forKey:v12];
}

- (SharePlayProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SharePlayProvider;
  id v5 = [(SharePlayProvider *)&v20 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector("bundleIdentifier");
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    v10 = NSStringFromSelector("isEnabled");
    v5->_BOOL enabled = [v4 decodeBoolForKey:v10];

    uint64_t v11 = objc_opt_class();
    id v12 = NSStringFromSelector("iconImage");
    uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
    iconImage = v5->_iconImage;
    v5->_iconImage = (UIImage *)v13;

    uint64_t v15 = objc_opt_class();
    v16 = NSStringFromSelector("localizedName");
    uint64_t v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v17;
  }
  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector("bundleIdentifier");
  id v5 = [(SharePlayProvider *)self bundleIdentifier];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  uint64_t v6 = NSStringFromSelector("localizedName");
  v7 = [(SharePlayProvider *)self localizedName];
  [v3 appendFormat:@"%@=%@", v6, v7];

  [v3 appendFormat:@", "];
  uint64_t v8 = NSStringFromSelector("enabled");
  [v3 appendFormat:@"%@=%lu", v8, -[SharePlayProvider isEnabled](self, "isEnabled")];

  [v3 appendFormat:@">"];
  id v9 = [v3 copy];

  return v9;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector("bundleIdentifier");
  id v5 = [(SharePlayProvider *)self bundleIdentifier];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  uint64_t v6 = NSStringFromSelector("enabled");
  [v3 appendFormat:@"%@=%lu", v6, -[SharePlayProvider isEnabled](self, "isEnabled")];

  [v3 appendFormat:@">"];
  id v7 = [v3 copy];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SharePlayProvider *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(SharePlayProvider *)self isEqualToProvider:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  id v3 = [(SharePlayProvider *)self bundleIdentifier];
  unint64_t v4 = (unint64_t)[v3 hash];
  if ([(SharePlayProvider *)self isEnabled]) {
    uint64_t v5 = 1231;
  }
  else {
    uint64_t v5 = 1237;
  }
  uint64_t v6 = [(SharePlayProvider *)self iconImage];
  unint64_t v7 = v5 ^ v4 ^ (unint64_t)[v6 hash];
  uint64_t v8 = [(SharePlayProvider *)self localizedName];
  unint64_t v9 = v7 ^ (unint64_t)[v8 hash];

  return v9;
}

- (BOOL)isEqualToProvider:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SharePlayProvider *)self isEnabled];
  if (v5 == [v4 isEnabled])
  {
    unint64_t v7 = [(SharePlayProvider *)self bundleIdentifier];
    uint64_t v8 = [v4 bundleIdentifier];
    if (TUStringsAreEqualOrNil())
    {
      unint64_t v9 = [(SharePlayProvider *)self localizedName];
      v10 = [v4 localizedName];
      if (TUStringsAreEqualOrNil())
      {
        uint64_t v11 = [(SharePlayProvider *)self iconImage];
        id v12 = [v4 iconImage];
        char v6 = TUObjectsAreEqualOrNil();
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_BOOL enabled = a3;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end