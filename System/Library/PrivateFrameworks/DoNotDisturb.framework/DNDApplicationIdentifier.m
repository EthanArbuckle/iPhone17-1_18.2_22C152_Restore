@interface DNDApplicationIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDApplicationIdentifier)initWithBundleID:(id)a3;
- (DNDApplicationIdentifier)initWithBundleID:(id)a3 platform:(unint64_t)a4;
- (DNDApplicationIdentifier)initWithCoder:(id)a3;
- (NSString)bundleID;
- (NSString)description;
- (id)diffDescription;
- (unint64_t)hash;
- (unint64_t)platform;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDApplicationIdentifier

- (DNDApplicationIdentifier)initWithBundleID:(id)a3
{
  id v4 = a3;
  v5 = [(DNDApplicationIdentifier *)self initWithBundleID:v4 platform:DNDPlatformForCurrentDevice()];

  return v5;
}

- (DNDApplicationIdentifier)initWithBundleID:(id)a3 platform:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDApplicationIdentifier;
  v7 = [(DNDApplicationIdentifier *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    bundleID = v7->_bundleID;
    v7->_bundleID = (NSString *)v8;

    v7->_platform = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [(DNDApplicationIdentifier *)self bundleID];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(DNDApplicationIdentifier *)self platform] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v8 = (DNDApplicationIdentifier *)a3;
  if (self == v8)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = v8;
      v10 = [(DNDApplicationIdentifier *)self bundleID];
      objc_super v11 = [(DNDApplicationIdentifier *)v9 bundleID];
      if (v10 != v11)
      {
        uint64_t v12 = [(DNDApplicationIdentifier *)self bundleID];
        if (!v12)
        {
          BOOL v14 = 0;
          goto LABEL_15;
        }
        v3 = (void *)v12;
        uint64_t v13 = [(DNDApplicationIdentifier *)v9 bundleID];
        if (!v13)
        {
          BOOL v14 = 0;
          goto LABEL_14;
        }
        uint64_t v4 = (void *)v13;
        unint64_t v5 = [(DNDApplicationIdentifier *)self bundleID];
        id v6 = [(DNDApplicationIdentifier *)v9 bundleID];
        if (![v5 isEqual:v6])
        {
          BOOL v14 = 0;
LABEL_11:

LABEL_14:
          goto LABEL_15;
        }
      }
      unint64_t v15 = [(DNDApplicationIdentifier *)self platform];
      BOOL v14 = v15 == [(DNDApplicationIdentifier *)v9 platform];
      if (v10 != v11) {
        goto LABEL_11;
      }
LABEL_15:

      goto LABEL_16;
    }
    BOOL v14 = 0;
  }
LABEL_16:

  return v14;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(DNDApplicationIdentifier *)self bundleID];
  id v6 = NSStringFromDNDPlatform(self->_platform);
  v7 = [v3 stringWithFormat:@"<%@: %p; bundleID: %@; platform: %@>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (id)diffDescription
{
  v2 = NSString;
  bundleID = self->_bundleID;
  uint64_t v4 = NSStringFromDNDPlatform(self->_platform);
  unint64_t v5 = [v2 stringWithFormat:@"bundleID:%@;platform:%@", bundleID, v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDApplicationIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"platform"];

  v7 = [(DNDApplicationIdentifier *)self initWithBundleID:v5 platform:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  bundleID = self->_bundleID;
  id v5 = a3;
  [v5 encodeObject:bundleID forKey:@"bundleID"];
  [v5 encodeInteger:self->_platform forKey:@"platform"];
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
}

@end