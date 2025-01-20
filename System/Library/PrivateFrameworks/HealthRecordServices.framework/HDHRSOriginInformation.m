@interface HDHRSOriginInformation
+ (BOOL)supportsSecureCoding;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion;
- (BOOL)isEqual:(id)a3;
- (HDHRSOriginInformation)initWithCoder:(id)a3;
- (HDHRSOriginInformation)initWithOperatingSystemVersion:(id *)a3 build:(id)a4;
- (NSString)operatingSystemBuild;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDHRSOriginInformation

- (HDHRSOriginInformation)initWithOperatingSystemVersion:(id *)a3 build:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDHRSOriginInformation;
  v7 = [(HDHRSOriginInformation *)&v13 init];
  v8 = v7;
  if (v7)
  {
    long long v9 = *(_OWORD *)&a3->var0;
    v7->_operatingSystemVersion.patchVersion = a3->var2;
    *(_OWORD *)&v7->_operatingSystemVersion.majorVersion = v9;
    uint64_t v10 = [v6 copy];
    operatingSystemBuild = v8->_operatingSystemBuild;
    v8->_operatingSystemBuild = (NSString *)v10;
  }
  return v8;
}

- (unint64_t)hash
{
  int64_t v2 = self->_operatingSystemVersion.minorVersion ^ self->_operatingSystemVersion.majorVersion ^ self->_operatingSystemVersion.patchVersion;
  return v2 ^ [(NSString *)self->_operatingSystemBuild hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDHRSOriginInformation *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = v5;
      if (v5)
      {
        [(HDHRSOriginInformation *)v5 operatingSystemVersion];
        if (v15 != self->_operatingSystemVersion.majorVersion) {
          goto LABEL_15;
        }
        [(HDHRSOriginInformation *)v6 operatingSystemVersion];
        if (v14 != self->_operatingSystemVersion.minorVersion) {
          goto LABEL_15;
        }
        [(HDHRSOriginInformation *)v6 operatingSystemVersion];
        int64_t minorVersion = v13;
      }
      else
      {
        if (self->_operatingSystemVersion.majorVersion) {
          goto LABEL_15;
        }
        int64_t minorVersion = self->_operatingSystemVersion.minorVersion;
        if (minorVersion) {
          goto LABEL_15;
        }
      }
      if (minorVersion == self->_operatingSystemVersion.patchVersion)
      {
        long long v9 = [(HDHRSOriginInformation *)v6 operatingSystemBuild];
        operatingSystemBuild = self->_operatingSystemBuild;
        if (v9 == operatingSystemBuild)
        {
          char v8 = 1;
        }
        else if (operatingSystemBuild)
        {
          v11 = [(HDHRSOriginInformation *)v6 operatingSystemBuild];
          char v8 = [v11 isEqualToString:self->_operatingSystemBuild];
        }
        else
        {
          char v8 = 0;
        }

        goto LABEL_16;
      }
LABEL_15:
      char v8 = 0;
LABEL_16:

      goto LABEL_17;
    }
    char v8 = 0;
  }
LABEL_17:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t majorVersion = self->_operatingSystemVersion.majorVersion;
  id v5 = a3;
  [v5 encodeInt64:majorVersion forKey:@"OperatingSystemVersionMajor"];
  [v5 encodeInt64:self->_operatingSystemVersion.minorVersion forKey:@"OperatingSystemVersionMinor"];
  [v5 encodeInt64:self->_operatingSystemVersion.patchVersion forKey:@"OperatingSystemVersionPatch"];
  [v5 encodeObject:self->_operatingSystemBuild forKey:@"OperatingSystemBuild"];
}

- (HDHRSOriginInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OperatingSystemBuild"];
  if (v5
    && [v4 containsValueForKey:@"OperatingSystemVersionMajor"]
    && [v4 containsValueForKey:@"OperatingSystemVersionMinor"]
    && ([v4 containsValueForKey:@"OperatingSystemVersionPatch"] & 1) != 0)
  {
    v8[0] = [v4 decodeInt64ForKey:@"OperatingSystemVersionMajor"];
    v8[1] = [v4 decodeInt64ForKey:@"OperatingSystemVersionMinor"];
    v8[2] = [v4 decodeInt64ForKey:@"OperatingSystemVersionPatch"];
    self = [(HDHRSOriginInformation *)self initWithOperatingSystemVersion:v8 build:v5];
    id v6 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v6 = 0;
  }

  return v6;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = *($A44FF20282FB96BA82CF1B0FF6945C38 *)&self->var2;
  return self;
}

- (NSString)operatingSystemBuild
{
  return self->_operatingSystemBuild;
}

- (void).cxx_destruct
{
}

@end