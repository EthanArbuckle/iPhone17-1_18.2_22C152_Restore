@interface AKBundleInformation
+ (BOOL)supportsSecureCoding;
- (AKBundleInformation)initWithBundleIdentifier:(id)a3 bundleName:(id)a4 bundleDescription:(id)a5 bundleType:(unint64_t)a6 otherInfo:(id)a7;
- (AKBundleInformation)initWithCoder:(id)a3;
- (NSDictionary)otherInfo;
- (NSString)bundleDescription;
- (NSString)bundleIdentifier;
- (NSString)bundleName;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)bundleType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AKBundleInformation

- (AKBundleInformation)initWithBundleIdentifier:(id)a3 bundleName:(id)a4 bundleDescription:(id)a5 bundleType:(unint64_t)a6 otherInfo:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)AKBundleInformation;
  v17 = [(AKBundleInformation *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_bundleName, a4);
    objc_storeStrong((id *)&v18->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v18->_bundleDescription, a5);
    v18->_bundleType = a6;
    objc_storeStrong((id *)&v18->_otherInfo, a7);
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  bundleName = self->_bundleName;
  id v6 = a3;
  [v6 encodeObject:bundleName forKey:@"_bundleName"];
  [v6 encodeObject:self->_bundleIdentifier forKey:@"_bundleIdentifier"];
  [v6 encodeObject:self->_bundleDescription forKey:@"_bundleDescription"];
  v5 = +[NSNumber numberWithUnsignedInteger:self->_bundleType];
  [v6 encodeObject:v5 forKey:@"_bundleType"];

  [v6 encodeObject:self->_otherInfo forKey:@"_otherInfo"];
}

- (AKBundleInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AKBundleInformation *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleName"];
    bundleName = v5->_bundleName;
    v5->_bundleName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleDescription"];
    bundleDescription = v5->_bundleDescription;
    v5->_bundleDescription = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleType"];
    v5->_bundleType = (unint64_t)[v12 integerValue];

    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    id v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"_otherInfo"];
    otherInfo = v5->_otherInfo;
    v5->_otherInfo = (NSDictionary *)v16;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AKBundleInformation);
  v5 = (NSString *)[(NSString *)self->_bundleName copy];
  bundleName = v4->_bundleName;
  v4->_bundleName = v5;

  v7 = (NSString *)[(NSString *)self->_bundleIdentifier copy];
  bundleIdentifier = v4->_bundleIdentifier;
  v4->_bundleIdentifier = v7;

  v9 = (NSString *)[(NSString *)self->_bundleDescription copy];
  bundleDescription = v4->_bundleDescription;
  v4->_bundleDescription = v9;

  v4->_bundleType = self->_bundleType;
  v11 = (NSDictionary *)[(NSDictionary *)self->_otherInfo copy];
  otherInfo = v4->_otherInfo;
  v4->_otherInfo = v11;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (NSString)bundleDescription
{
  return self->_bundleDescription;
}

- (unint64_t)bundleType
{
  return self->_bundleType;
}

- (NSDictionary)otherInfo
{
  return self->_otherInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherInfo, 0);
  objc_storeStrong((id *)&self->_bundleDescription, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end