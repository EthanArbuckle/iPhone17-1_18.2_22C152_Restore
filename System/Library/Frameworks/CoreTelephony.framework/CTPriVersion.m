@interface CTPriVersion
+ (BOOL)supportsSecureCoding;
- (CTPriVersion)initWithCoder:(id)a3;
- (NSNumber)majorVersion;
- (NSNumber)minorVersion;
- (NSNumber)releaseVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMajorVersion:(id)a3;
- (void)setMinorVersion:(id)a3;
- (void)setReleaseVersion:(id)a3;
@end

@implementation CTPriVersion

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTPriVersion *)self majorVersion];
  [v3 appendFormat:@", major=%@", v4];

  v5 = [(CTPriVersion *)self minorVersion];
  [v3 appendFormat:@", minor=%@", v5];

  v6 = [(CTPriVersion *)self releaseVersion];
  [v3 appendFormat:@", release=%@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTPriVersion *)self majorVersion];
  v6 = (void *)[v5 copy];
  [v4 setMajorVersion:v6];

  v7 = [(CTPriVersion *)self minorVersion];
  v8 = (void *)[v7 copy];
  [v4 setMinorVersion:v8];

  v9 = [(CTPriVersion *)self releaseVersion];
  v10 = (void *)[v9 copy];
  [v4 setReleaseVersion:v10];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTPriVersion *)self majorVersion];
  [v4 encodeObject:v5 forKey:@"major"];

  v6 = [(CTPriVersion *)self minorVersion];
  [v4 encodeObject:v6 forKey:@"minor"];

  id v7 = [(CTPriVersion *)self releaseVersion];
  [v4 encodeObject:v7 forKey:@"release"];
}

- (CTPriVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTPriVersion;
  v5 = [(CTPriVersion *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"major"];
    majorVersion = v5->_majorVersion;
    v5->_majorVersion = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minor"];
    minorVersion = v5->_minorVersion;
    v5->_minorVersion = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"release"];
    releaseVersion = v5->_releaseVersion;
    v5->_releaseVersion = (NSNumber *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)majorVersion
{
  return self->_majorVersion;
}

- (void)setMajorVersion:(id)a3
{
}

- (NSNumber)minorVersion
{
  return self->_minorVersion;
}

- (void)setMinorVersion:(id)a3
{
}

- (NSNumber)releaseVersion
{
  return self->_releaseVersion;
}

- (void)setReleaseVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releaseVersion, 0);
  objc_storeStrong((id *)&self->_minorVersion, 0);

  objc_storeStrong((id *)&self->_majorVersion, 0);
}

@end