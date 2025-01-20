@interface HKHealthStoreConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKHealthStoreConfiguration)initWithCoder:(id)a3;
- (HKHealthStoreConfiguration)initWithSourceBundleIdentifier:(id)a3 sourceVersion:(id)a4 debugIdentifier:(id)a5 profileIdentifier:(id)a6 applicationSDKVersionToken:(unint64_t)a7;
- (HKProfileIdentifier)profileIdentifier;
- (NSString)debugIdentifier;
- (NSString)sourceBundleIdentifier;
- (NSString)sourceVersion;
- (unint64_t)applicationSDKVersionToken;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKHealthStoreConfiguration

- (HKHealthStoreConfiguration)initWithSourceBundleIdentifier:(id)a3 sourceVersion:(id)a4 debugIdentifier:(id)a5 profileIdentifier:(id)a6 applicationSDKVersionToken:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HKHealthStoreConfiguration;
  v16 = [(HKHealthStoreConfiguration *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    sourceBundleIdentifier = v16->_sourceBundleIdentifier;
    v16->_sourceBundleIdentifier = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    sourceVersion = v16->_sourceVersion;
    v16->_sourceVersion = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    debugIdentifier = v16->_debugIdentifier;
    v16->_debugIdentifier = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    profileIdentifier = v16->_profileIdentifier;
    v16->_profileIdentifier = (HKProfileIdentifier *)v23;

    v16->_applicationSDKVersionToken = a7;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKHealthStoreConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKHealthStoreConfiguration;
  v5 = [(HKHealthStoreConfiguration *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sbid"];
    sourceBundleIdentifier = v5->_sourceBundleIdentifier;
    v5->_sourceBundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sver"];
    sourceVersion = v5->_sourceVersion;
    v5->_sourceVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dbid"];
    debugIdentifier = v5->_debugIdentifier;
    v5->_debugIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pid"];
    profileIdentifier = v5->_profileIdentifier;
    v5->_profileIdentifier = (HKProfileIdentifier *)v12;

    v5->_applicationSDKVersionToken = HKBitPatternCastSignedToUnsignedInt64([v4 decodeInt64ForKey:@"sdkv"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:sourceBundleIdentifier forKey:@"sbid"];
  [v5 encodeObject:self->_sourceVersion forKey:@"sver"];
  [v5 encodeObject:self->_debugIdentifier forKey:@"dbid"];
  [v5 encodeObject:self->_profileIdentifier forKey:@"pid"];
  [v5 encodeInt64:HKBitPatternCastUnsignedToSignedInt64(self->_applicationSDKVersionToken) forKey:@"sdkv"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKHealthStoreConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_16;
    }
    sourceBundleIdentifier = self->_sourceBundleIdentifier;
    uint64_t v6 = v4->_sourceBundleIdentifier;
    if (sourceBundleIdentifier != v6
      && (!v6 || !-[NSString isEqualToString:](sourceBundleIdentifier, "isEqualToString:")))
    {
      goto LABEL_16;
    }
    if (((sourceVersion = self->_sourceVersion, uint64_t v8 = v4->_sourceVersion, sourceVersion == v8)
       || v8 && -[NSString isEqualToString:](sourceVersion, "isEqualToString:"))
      && ((debugIdentifier = self->_debugIdentifier, uint64_t v10 = v4->_debugIdentifier, debugIdentifier == v10)
       || v10 && -[NSString isEqualToString:](debugIdentifier, "isEqualToString:"))
      && ((profileIdentifier = self->_profileIdentifier, uint64_t v12 = v4->_profileIdentifier, profileIdentifier == v12)
       || v12 && -[HKProfileIdentifier isEqual:](profileIdentifier, "isEqual:")))
    {
      BOOL v13 = self->_applicationSDKVersionToken == v4->_applicationSDKVersionToken;
    }
    else
    {
LABEL_16:
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sourceBundleIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_sourceVersion hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_debugIdentifier hash];
  return v4 ^ v5 ^ [(HKProfileIdentifier *)self->_profileIdentifier hash];
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (HKProfileIdentifier)profileIdentifier
{
  return self->_profileIdentifier;
}

- (unint64_t)applicationSDKVersionToken
{
  return self->_applicationSDKVersionToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);

  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
}

@end