@interface UARPAssetVersion
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSString)versionString;
- (UARPAssetVersion)init;
- (UARPAssetVersion)initWithBVERString:(id)a3;
- (UARPAssetVersion)initWithCoder:(id)a3;
- (UARPAssetVersion)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 releaseVersion:(unint64_t)a5 buildVersion:(unint64_t)a6;
- (UARPAssetVersion)initWithVersionString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)buildVersion;
- (unint64_t)majorVersion;
- (unint64_t)minorVersion;
- (unint64_t)releaseVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPAssetVersion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPAssetVersion)init
{
  return 0;
}

- (UARPAssetVersion)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 releaseVersion:(unint64_t)a5 buildVersion:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)UARPAssetVersion;
  result = [(UARPAssetVersion *)&v11 init];
  if (result)
  {
    result->_majorVersion = a3;
    result->_minorVersion = a4;
    result->_releaseVersion = a5;
    result->_buildVersion = a6;
  }
  return result;
}

- (UARPAssetVersion)initWithVersionString:(id)a3
{
  v4 = [a3 componentsSeparatedByString:@"."];
  if ([v4 count] == 1)
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    uint64_t v6 = [v5 integerValue];
    uint64_t v7 = 0;
LABEL_5:
    uint64_t v9 = 0;
LABEL_6:
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  if ([v4 count] == 2)
  {
    v8 = [v4 objectAtIndexedSubscript:0];
    uint64_t v6 = [v8 integerValue];

    v5 = [v4 objectAtIndexedSubscript:1];
    uint64_t v7 = [v5 integerValue];
    goto LABEL_5;
  }
  if ([v4 count] == 3)
  {
    v13 = [v4 objectAtIndexedSubscript:0];
    uint64_t v6 = [v13 integerValue];

    v14 = [v4 objectAtIndexedSubscript:1];
    uint64_t v7 = [v14 integerValue];

    v5 = [v4 objectAtIndexedSubscript:2];
    uint64_t v9 = [v5 integerValue];
    goto LABEL_6;
  }
  if ([v4 count] != 4)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    goto LABEL_8;
  }
  v15 = [v4 objectAtIndexedSubscript:0];
  uint64_t v6 = [v15 integerValue];

  v16 = [v4 objectAtIndexedSubscript:1];
  uint64_t v7 = [v16 integerValue];

  v17 = [v4 objectAtIndexedSubscript:2];
  uint64_t v9 = [v17 integerValue];

  v5 = [v4 objectAtIndexedSubscript:3];
  uint64_t v10 = [v5 integerValue];
LABEL_7:

LABEL_8:
  objc_super v11 = [(UARPAssetVersion *)self initWithMajorVersion:v6 minorVersion:v7 releaseVersion:v9 buildVersion:v10];

  return v11;
}

- (UARPAssetVersion)initWithBVERString:(id)a3
{
  v4 = [a3 componentsSeparatedByString:@"|"];
  v5 = [v4 objectAtIndexedSubscript:0];
  uint64_t v6 = [v5 componentsSeparatedByString:@"."];

  uint64_t v7 = 0;
  uint64_t v8 = 0;
  unint64_t v9 = 0;
  uint64_t v10 = 0;
  if ([v6 count] == 3)
  {
    objc_super v11 = [v6 objectAtIndexedSubscript:0];
    uint64_t v10 = [v11 integerValue];

    v12 = [v6 objectAtIndexedSubscript:1];
    unint64_t v13 = [v12 longLongValue];

    unint64_t v9 = HIDWORD(v13);
    uint64_t v7 = v13;
    v14 = [v6 objectAtIndexedSubscript:2];
    uint64_t v8 = [v14 integerValue];
  }
  v15 = [(UARPAssetVersion *)self initWithMajorVersion:v10 minorVersion:v9 releaseVersion:v7 buildVersion:v8];

  return v15;
}

- (BOOL)isValid
{
  return self->_majorVersion || self->_minorVersion || self->_releaseVersion || self->_buildVersion != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [UARPAssetVersion alloc];
  unint64_t majorVersion = self->_majorVersion;
  unint64_t minorVersion = self->_minorVersion;
  unint64_t releaseVersion = self->_releaseVersion;
  unint64_t buildVersion = self->_buildVersion;
  return [(UARPAssetVersion *)v4 initWithMajorVersion:majorVersion minorVersion:minorVersion releaseVersion:releaseVersion buildVersion:buildVersion];
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t majorVersion = self->_majorVersion;
  id v6 = a3;
  uint64_t v7 = [v4 numberWithUnsignedInteger:majorVersion];
  [v6 encodeObject:v7 forKey:@"majorVersion"];

  uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_minorVersion];
  [v6 encodeObject:v8 forKey:@"minorVersion"];

  unint64_t v9 = [NSNumber numberWithUnsignedInteger:self->_releaseVersion];
  [v6 encodeObject:v9 forKey:@"releaseVersion"];

  id v10 = [NSNumber numberWithUnsignedInteger:self->_buildVersion];
  [v6 encodeObject:v10 forKey:@"buildVersion"];
}

- (UARPAssetVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"majorVersion"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minorVersion"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseVersion"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buildVersion"];

  unint64_t v9 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:](self, "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", [v5 unsignedIntegerValue], objc_msgSend(v6, "unsignedIntegerValue"), objc_msgSend(v7, "unsignedIntegerValue"), objc_msgSend(v8, "unsignedIntegerValue"));
  return v9;
}

- (NSString)versionString
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%lu.%lu.%lu.%lu", self->_majorVersion, self->_minorVersion, self->_releaseVersion, self->_buildVersion);
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (unint64_t)releaseVersion
{
  return self->_releaseVersion;
}

- (unint64_t)buildVersion
{
  return self->_buildVersion;
}

@end