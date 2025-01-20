@interface CTEOSFirmwareInfo
+ (BOOL)supportsSecureCoding;
- (CTEOSFirmwareInfo)initWithCoder:(id)a3;
- (NSData)currentVersion;
- (NSData)updateCsn;
- (NSNumber)userProfiles;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentVersion:(id)a3;
- (void)setUpdateCsn:(id)a3;
- (void)setUserProfiles:(id)a3;
@end

@implementation CTEOSFirmwareInfo

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTEOSFirmwareInfo *)self currentVersion];
  [v3 appendFormat:@", CurrentVersion=%@", v4];

  v5 = [(CTEOSFirmwareInfo *)self userProfiles];
  [v3 appendFormat:@", UserProfiles=%@", v5];

  v6 = [(CTEOSFirmwareInfo *)self updateCsn];
  [v3 appendFormat:@", UpdateCsn=%@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTEOSFirmwareInfo *)self currentVersion];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setCurrentVersion:v7];

  v8 = [(CTEOSFirmwareInfo *)self userProfiles];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setUserProfiles:v9];

  v10 = [(CTEOSFirmwareInfo *)self updateCsn];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setUpdateCsn:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTEOSFirmwareInfo *)self currentVersion];
  [v4 encodeObject:v5 forKey:@"kCurrentVersionKey"];

  v6 = [(CTEOSFirmwareInfo *)self userProfiles];
  [v4 encodeObject:v6 forKey:@"kUserProfilesKey"];

  id v7 = [(CTEOSFirmwareInfo *)self updateCsn];
  [v4 encodeObject:v7 forKey:@"kUpdateCsnKey"];
}

- (CTEOSFirmwareInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTEOSFirmwareInfo;
  v5 = [(CTEOSFirmwareInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCurrentVersionKey"];
    currentVersion = v5->_currentVersion;
    v5->_currentVersion = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUserProfilesKey"];
    userProfiles = v5->_userProfiles;
    v5->_userProfiles = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUpdateCsnKey"];
    updateCsn = v5->_updateCsn;
    v5->_updateCsn = (NSData *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)currentVersion
{
  return self->_currentVersion;
}

- (void)setCurrentVersion:(id)a3
{
}

- (NSNumber)userProfiles
{
  return self->_userProfiles;
}

- (void)setUserProfiles:(id)a3
{
}

- (NSData)updateCsn
{
  return self->_updateCsn;
}

- (void)setUpdateCsn:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateCsn, 0);
  objc_storeStrong((id *)&self->_userProfiles, 0);

  objc_storeStrong((id *)&self->_currentVersion, 0);
}

@end