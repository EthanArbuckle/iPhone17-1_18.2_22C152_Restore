@interface ASDBetaAppVersion
+ (ASDBetaAppVersion)versionWithBundleID:(id)a3 bundleVersion:(id)a4 andShortVersion:(id)a5;
+ (ASDBetaAppVersion)versionWithBundleID:(id)a3 bundleVersion:(id)a4 platform:(int64_t)a5 andShortVersion:(id)a6;
+ (BOOL)supportsSecureCoding;
+ (int64_t)defaultPlatform;
- (ASDBetaAppVersion)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleID;
- (NSString)bundleVersion;
- (NSString)shortVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)platform;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDBetaAppVersion

+ (ASDBetaAppVersion)versionWithBundleID:(id)a3 bundleVersion:(id)a4 andShortVersion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_msgSend(a1, "versionWithBundleID:bundleVersion:platform:andShortVersion:", v10, v9, objc_msgSend(a1, "defaultPlatform"), v8);

  return (ASDBetaAppVersion *)v11;
}

+ (ASDBetaAppVersion)versionWithBundleID:(id)a3 bundleVersion:(id)a4 platform:(int64_t)a5 andShortVersion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = objc_opt_new();
  v14 = v12;
  if (v12)
  {
    objc_setProperty_atomic_copy(v12, v13, v9, 8);
    objc_setProperty_atomic_copy(v14, v15, v10, 16);
    v14[3] = a5;
    objc_setProperty_atomic_copy(v14, v16, v11, 32);
  }

  return (ASDBetaAppVersion *)v14;
}

+ (int64_t)defaultPlatform
{
  return 0;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@: %@ (%@) - Platform (%ld)", self->_bundleID, self->_shortVersion, self->_bundleVersion, self->_platform];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ASDBetaAppVersion *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 != objc_opt_class()) {
      goto LABEL_7;
    }
    bundleID = self->_bundleID;
    v7 = [(ASDBetaAppVersion *)v4 bundleID];
    LODWORD(bundleID) = [(NSString *)bundleID isEqualToString:v7];

    if (!bundleID) {
      goto LABEL_7;
    }
    bundleVersion = self->_bundleVersion;
    id v9 = [(ASDBetaAppVersion *)v4 bundleVersion];
    LODWORD(bundleVersion) = [(NSString *)bundleVersion isEqualToString:v9];

    if (!bundleVersion) {
      goto LABEL_7;
    }
    shortVersion = self->_shortVersion;
    id v11 = [(ASDBetaAppVersion *)v4 shortVersion];
    LODWORD(shortVersion) = [(NSString *)shortVersion isEqual:v11];

    if (shortVersion)
    {
      int64_t platform = self->_platform;
      BOOL v13 = platform == [(ASDBetaAppVersion *)v4 platform];
    }
    else
    {
LABEL_7:
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[ASDBetaAppVersion allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_bundleID, self->_bundleID);
  objc_storeStrong((id *)&v4->_bundleVersion, self->_bundleVersion);
  v4->_int64_t platform = self->_platform;
  objc_storeStrong((id *)&v4->_shortVersion, self->_shortVersion);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  bundleID = self->_bundleID;
  id v5 = a3;
  [v5 encodeObject:bundleID forKey:@"A"];
  [v5 encodeObject:self->_bundleVersion forKey:@"B"];
  [v5 encodeInteger:self->_platform forKey:@"D"];
  [v5 encodeObject:self->_shortVersion forKey:@"C"];
}

- (ASDBetaAppVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDBetaAppVersion;
  id v5 = [(ASDBetaAppVersion *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"A"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"B"];
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v8;

    v5->_int64_t platform = [v4 decodeIntegerForKey:@"D"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"C"];
    shortVersion = v5->_shortVersion;
    v5->_shortVersion = (NSString *)v10;
  }
  return v5;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)bundleVersion
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)platform
{
  return self->_platform;
}

- (NSString)shortVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end