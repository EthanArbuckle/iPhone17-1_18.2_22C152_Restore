@interface HKSourceRevision
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKSource)source;
- (HKSourceRevision)init;
- (HKSourceRevision)initWithCoder:(id)a3;
- (HKSourceRevision)initWithSource:(HKSource *)source version:(NSString *)version;
- (HKSourceRevision)initWithSource:(HKSource *)source version:(NSString *)version productType:(NSString *)productType operatingSystemVersion:(NSOperatingSystemVersion *)operatingSystemVersion;
- (NSOperatingSystemVersion)operatingSystemVersion;
- (NSString)productType;
- (NSString)version;
- (id)_init;
- (id)_initWithSource:(id)a3;
- (id)asJSONObject;
- (id)description;
- (unint64_t)hash;
- (void)_setSource:(id)a3;
- (void)_setVersion:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSourceRevision

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  source = self->_source;
  id v5 = a3;
  [v5 encodeObject:source forKey:@"source"];
  [v5 encodeObject:self->_version forKey:@"version"];
  [v5 encodeInteger:self->_operatingSystemVersion.majorVersion forKey:@"operatingSystemMajorVersion"];
  [v5 encodeInteger:self->_operatingSystemVersion.minorVersion forKey:@"operatingSystemMinorVersion"];
  [v5 encodeInteger:self->_operatingSystemVersion.patchVersion forKey:@"operatingSystemPatchVersion"];
  [v5 encodeObject:self->_productType forKey:@"productType"];
}

- (HKSourceRevision)initWithSource:(HKSource *)source version:(NSString *)version productType:(NSString *)productType operatingSystemVersion:(NSOperatingSystemVersion *)operatingSystemVersion
{
  v10 = version;
  v11 = productType;
  v12 = [(HKSourceRevision *)self _initWithSource:source];
  if (v12)
  {
    uint64_t v13 = [(NSString *)v10 copy];
    v14 = v12->_version;
    v12->_version = (NSString *)v13;

    uint64_t v15 = [(NSString *)v11 copy];
    v16 = v12->_productType;
    v12->_productType = (NSString *)v15;

    long long v17 = *(_OWORD *)&operatingSystemVersion->majorVersion;
    v12->_operatingSystemVersion.patchVersion = operatingSystemVersion->patchVersion;
    *(_OWORD *)&v12->_operatingSystemVersion.majorVersion = v17;
  }

  return v12;
}

- (id)_initWithSource:(id)a3
{
  id v4 = a3;
  int v5 = HKProgramSDKAtLeast();
  if (!v4 && v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"A valid source is required."];
  }
  v11.receiver = self;
  v11.super_class = (Class)HKSourceRevision;
  v6 = [(HKSourceRevision *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v4 copy];
    source = v6->_source;
    v6->_source = (HKSource *)v7;

    v9 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_version, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

- (HKSource)source
{
  return (HKSource *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)version
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)productType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSOperatingSystemVersion)operatingSystemVersion
{
  objc_copyStruct(retstr, &self->_operatingSystemVersion, 24, 1, 0);
  return result;
}

- (id)asJSONObject
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  id v4 = [(HKSourceRevision *)self source];
  int v5 = [v4 asJSONObject];
  [v3 setObject:v5 forKeyedSubscript:@"source"];

  v6 = [(HKSourceRevision *)self version];
  [v3 setObject:v6 forKeyedSubscript:@"version"];

  uint64_t v7 = [(HKSourceRevision *)self productType];
  [v3 setObject:v7 forKeyedSubscript:@"productType"];

  [(HKSourceRevision *)self operatingSystemVersion];
  v8 = HKNSOperatingSystemVersionString(v10);
  [v3 setObject:v8 forKeyedSubscript:@"operatingSystemVersion"];

  return v3;
}

- (HKSourceRevision)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  int v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKSourceRevision)initWithSource:(HKSource *)source version:(NSString *)version
{
  uint64_t v6 = 0;
  long long v5 = *(_OWORD *)&HKSourceRevisionAnyOperatingSystem.majorVersion;
  return [(HKSourceRevision *)self initWithSource:source version:version productType:@"HKSourceRevisionAnyProductType" operatingSystemVersion:&v5];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  BOOL v11 = (objc_opt_isKindOfClass() & 1) != 0
     && ((source = self->_source, uint64_t v6 = (HKSource *)v4[1], source == v6) || v6
                                                                        && -[HKSource isEqual:](source, "isEqual:"))
     && ((version = self->_version, v8 = (NSString *)v4[2], version == v8)
      || v8 && -[NSString isEqualToString:](version, "isEqualToString:"))
     && ((productType = self->_productType, v10 = (NSString *)v4[3], productType == v10)
      || v10 && -[NSString isEqualToString:](productType, "isEqualToString:"))
     && self->_operatingSystemVersion.majorVersion == v4[4]
     && self->_operatingSystemVersion.minorVersion == v4[5]
     && self->_operatingSystemVersion.patchVersion == v4[6];

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKSource *)self->_source hash];
  NSUInteger v4 = [(NSString *)self->_version hash] ^ v3;
  return v4 ^ [(NSString *)self->_productType hash] ^ (2654435761 * self->_operatingSystemVersion.majorVersion) ^ (2654435761 * self->_operatingSystemVersion.minorVersion) ^ (2654435761 * self->_operatingSystemVersion.patchVersion);
}

- (id)description
{
  unint64_t v3 = NSString;
  NSUInteger v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  uint64_t v6 = [(HKSource *)self->_source name];
  uint64_t v7 = [(HKSource *)self->_source bundleIdentifier];
  version = self->_version;
  productType = self->_productType;
  $A44FF20282FB96BA82CF1B0FF6945C38 operatingSystemVersion = self->_operatingSystemVersion;
  v10 = HKNSOperatingSystemVersionString(&operatingSystemVersion);
  BOOL v11 = [v3 stringWithFormat:@"<%@ name:%@, bundle:%@, version:%@, productType:%@, operatingSystemVersion:%@>", v5, v6, v7, version, productType, v10];

  return v11;
}

- (void)_setSource:(id)a3
{
  NSUInteger v4 = (HKSource *)[a3 copy];
  source = self->_source;
  self->_source = v4;

  MEMORY[0x1F41817F8](v4, source);
}

- (void)_setVersion:(id)a3
{
  NSUInteger v4 = (NSString *)[a3 copy];
  version = self->_version;
  self->_version = v4;

  MEMORY[0x1F41817F8](v4, version);
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)HKSourceRevision;
  return [(HKSourceRevision *)&v3 init];
}

- (HKSourceRevision)initWithCoder:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productType"];
    v10[0] = [v4 decodeIntegerForKey:@"operatingSystemMajorVersion"];
    v10[1] = [v4 decodeIntegerForKey:@"operatingSystemMinorVersion"];
    v10[2] = [v4 decodeIntegerForKey:@"operatingSystemPatchVersion"];
    self = [(HKSourceRevision *)self initWithSource:v5 version:v6 productType:v7 operatingSystemVersion:v10];

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end