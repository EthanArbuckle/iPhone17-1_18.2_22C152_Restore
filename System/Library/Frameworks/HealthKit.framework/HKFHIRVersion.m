@interface HKFHIRVersion
+ (BOOL)supportsSecureCoding;
+ (HKFHIRVersion)primaryDSTU2Version;
+ (HKFHIRVersion)primaryR4Version;
+ (HKFHIRVersion)versionFromVersionString:(NSString *)versionString error:(NSError *)errorOut;
+ (id)versionFromVersionString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HKFHIRRelease)FHIRRelease;
- (HKFHIRVersion)init;
- (HKFHIRVersion)initWithCoder:(id)a3;
- (HKFHIRVersion)initWithInvalidVersionString:(id)a3;
- (HKFHIRVersion)initWithSemanticVersion:(id *)a3;
- (NSInteger)majorVersion;
- (NSInteger)minorVersion;
- (NSInteger)patchVersion;
- (NSString)stringRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFHIRVersion

- (HKFHIRVersion)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKFHIRVersion)initWithSemanticVersion:(id *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKFHIRVersion;
  result = [(HKFHIRVersion *)&v5 init];
  if (result)
  {
    result->_majorVersion = a3->var0;
    result->_minorVersion = a3->var1;
    result->_patchVersion = a3->var2;
  }
  return result;
}

- (HKFHIRVersion)initWithInvalidVersionString:(id)a3
{
  id v4 = a3;
  long long v9 = xmmword_19C3D48C0;
  uint64_t v10 = 0;
  objc_super v5 = [(HKFHIRVersion *)self initWithSemanticVersion:&v9];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    invalidVersionString = v5->_invalidVersionString;
    v5->_invalidVersionString = (NSString *)v6;
  }
  return v5;
}

+ (id)versionFromVersionString:(id)a3
{
  id v3 = a3;
  id v10 = 0;
  id v4 = +[HKFHIRVersion versionFromVersionString:v3 error:&v10];
  id v5 = v10;
  if (v4)
  {
    uint64_t v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    v7 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      +[HKFHIRVersion versionFromVersionString:]((uint64_t)v5, v7);
    }
    uint64_t v6 = [[HKFHIRVersion alloc] initWithInvalidVersionString:v3];
  }
  v8 = v6;

  return v8;
}

+ (HKFHIRVersion)versionFromVersionString:(NSString *)versionString error:(NSError *)errorOut
{
  long long v16 = 0uLL;
  uint64_t v17 = 0;
  id v15 = 0;
  char v5 = HKSemanticVersionByParsingString(versionString, &v16, (uint64_t)&v15);
  id v6 = v15;
  if (v5)
  {
    v7 = [HKFHIRVersion alloc];
    long long v13 = v16;
    uint64_t v14 = v17;
    v8 = [(HKFHIRVersion *)v7 initWithSemanticVersion:&v13];
  }
  else
  {
    long long v9 = [NSString stringWithFormat:@"Unable to parse: %@", v6];
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 3, v9, v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (errorOut) {
        *errorOut = (NSError *)v10;
      }
      else {
        _HKLogDroppedError(v10);
      }
    }

    v8 = 0;
  }

  return v8;
}

- (HKFHIRRelease)FHIRRelease
{
  int64_t majorVersion = self->_majorVersion;
  if (majorVersion == 4)
  {
    if (!self->_minorVersion)
    {
      id v3 = (id *)&HKFHIRReleaseR4;
      return (HKFHIRRelease)*v3;
    }
    goto LABEL_6;
  }
  if (majorVersion != 1 || self->_minorVersion)
  {
LABEL_6:
    id v3 = (id *)&HKFHIRReleaseUnknown;
    return (HKFHIRRelease)*v3;
  }
  id v3 = (id *)&HKFHIRReleaseDSTU2;
  return (HKFHIRRelease)*v3;
}

+ (HKFHIRVersion)primaryDSTU2Version
{
  long long v4 = xmmword_19C3D48D8;
  uint64_t v5 = 2;
  v2 = (void *)[objc_alloc((Class)a1) initWithSemanticVersion:&v4];

  return (HKFHIRVersion *)v2;
}

+ (HKFHIRVersion)primaryR4Version
{
  long long v4 = xmmword_19C3D48F0;
  uint64_t v5 = 1;
  v2 = (void *)[objc_alloc((Class)a1) initWithSemanticVersion:&v4];

  return (HKFHIRVersion *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 requiresSecureCoding])
  {
    [v4 encodeInteger:self->_majorVersion forKey:@"Major"];
    [v4 encodeInteger:self->_minorVersion forKey:@"Minor"];
    [v4 encodeInteger:self->_patchVersion forKey:@"Patch"];
    [v4 encodeObject:self->_invalidVersionString forKey:@"InvalidVersionString"];
  }
}

- (HKFHIRVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 requiresSecureCoding])
  {
    uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InvalidVersionString"];
    if (v5)
    {
      id v6 = [(HKFHIRVersion *)self initWithInvalidVersionString:v5];
    }
    else
    {
      v9[0] = [v4 decodeIntegerForKey:@"Major"];
      v9[1] = [v4 decodeIntegerForKey:@"Minor"];
      v9[2] = [v4 decodeIntegerForKey:@"Patch"];
      id v6 = [(HKFHIRVersion *)self initWithSemanticVersion:v9];
    }
    self = v6;

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKFHIRVersion *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
    goto LABEL_12;
  }
  id v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  int64_t majorVersion = self->_majorVersion;
  if (majorVersion != [(HKFHIRVersion *)v6 majorVersion]) {
    goto LABEL_9;
  }
  int64_t minorVersion = self->_minorVersion;
  if (minorVersion != [(HKFHIRVersion *)v6 minorVersion]) {
    goto LABEL_9;
  }
  int64_t patchVersion = self->_patchVersion;
  if (patchVersion != [(HKFHIRVersion *)v6 patchVersion]) {
    goto LABEL_9;
  }
  invalidVersionString = self->_invalidVersionString;
  v11 = v6->_invalidVersionString;
  if (invalidVersionString == v11)
  {
    char v12 = 1;
    goto LABEL_10;
  }
  if (v11) {
    char v12 = -[NSString isEqualToString:](invalidVersionString, "isEqualToString:");
  }
  else {
LABEL_9:
  }
    char v12 = 0;
LABEL_10:

LABEL_12:
  return v12;
}

- (unint64_t)hash
{
  int64_t v2 = self->_minorVersion ^ self->_majorVersion ^ self->_patchVersion;
  return v2 ^ [(NSString *)self->_invalidVersionString hash];
}

- (NSString)stringRepresentation
{
  invalidVersionString = self->_invalidVersionString;
  if (invalidVersionString)
  {
    id v3 = invalidVersionString;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld.%ld", self->_majorVersion, self->_minorVersion, self->_patchVersion);
    id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (NSInteger)majorVersion
{
  return self->_majorVersion;
}

- (NSInteger)minorVersion
{
  return self->_minorVersion;
}

- (NSInteger)patchVersion
{
  return self->_patchVersion;
}

- (void).cxx_destruct
{
}

+ (void)versionFromVersionString:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Unable to parse: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end