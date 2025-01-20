@interface MSDDefaultsInfo
+ (BOOL)supportsSecureCoding;
- (MSDDefaultsInfo)initWithCoder:(id)a3;
- (MSDDefaultsInfo)initWithService:(id)a3 homeID:(id)a4 homeUserID:(id)a5;
- (MediaService)service;
- (NSString)recordName;
- (NSString)recordType;
- (NSString)recordZoneName;
- (NSUUID)homeID;
- (NSUUID)homeUserID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setRecordName:(id)a3;
- (void)setRecordType:(id)a3;
- (void)setRecordZoneName:(id)a3;
@end

@implementation MSDDefaultsInfo

- (MSDDefaultsInfo)initWithService:(id)a3 homeID:(id)a4 homeUserID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MSDDefaultsInfo;
  v12 = [(MSDDefaultsInfo *)&v16 init];
  p_isa = (id *)&v12->super.isa;
  if (!v12) {
    goto LABEL_5;
  }
  v14 = 0;
  if (v9 && v11)
  {
    objc_storeStrong((id *)&v12->_service, a3);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 6, a5);
LABEL_5:
    v14 = p_isa;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = objc_opt_new();
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_homeID, @"homeID");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_homeUserID, @"homeUserID");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_recordName, @"recordName");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_recordType, @"recordType");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_recordZoneName, @"recordZoneName");
  v4 = [MEMORY[0x263F089D8] stringWithFormat:@"<MSDefaultsInfo: %@", v3];
  v5 = v4;
  if (self->_service) {
    [v4 appendFormat:@"MediaService = %@>\n", self->_service];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  service = self->_service;
  id v5 = a3;
  [v5 encodeObject:service forKey:@"kMediaServiceEncodeKey"];
  [v5 encodeObject:self->_homeID forKey:@"kHomeIDEncodeKey"];
  [v5 encodeObject:self->_homeUserID forKey:@"kHomeUserIDEncodeKey"];
  [v5 encodeObject:self->_recordName forKey:@"kRecordNameEncodeKey"];
  [v5 encodeObject:self->_recordType forKey:@"kRecordTypeEncodeKey"];
  [v5 encodeObject:self->_recordZoneName forKey:@"kRecordZoneNameEncodeKey"];
}

- (MSDDefaultsInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMediaServiceEncodeKey"];
  service = self->_service;
  self->_service = v5;

  if (!self->_service) {
    goto LABEL_6;
  }
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kHomeIDEncodeKey"];
  homeID = self->_homeID;
  self->_homeID = v7;

  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kHomeUserIDEncodeKey"];
  homeUserID = self->_homeUserID;
  self->_homeUserID = v9;

  if (self->_homeUserID)
  {
    id v11 = -[MSDDefaultsInfo initWithService:homeID:homeUserID:](self, "initWithService:homeID:homeUserID:", self->_service, self->_homeID);
    if (v11)
    {
      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRecordNameEncodeKey"];
      recordName = v11->_recordName;
      v11->_recordName = (NSString *)v12;

      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRecordTypeEncodeKey"];
      recordType = v11->_recordType;
      v11->_recordType = (NSString *)v14;

      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRecordZoneNameEncodeKey"];
      recordZoneName = v11->_recordZoneName;
      v11->_recordZoneName = (NSString *)v16;
    }
    self = v11;
    v18 = self;
  }
  else
  {
LABEL_6:
    v18 = 0;
  }

  return v18;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setRecordName:(id)a3
{
}

- (NSString)recordZoneName
{
  return self->_recordZoneName;
}

- (void)setRecordZoneName:(id)a3
{
}

- (NSString)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
{
}

- (MediaService)service
{
  return self->_service;
}

- (NSUUID)homeID
{
  return self->_homeID;
}

- (NSUUID)homeUserID
{
  return self->_homeUserID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUserID, 0);
  objc_storeStrong((id *)&self->_homeID, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_recordZoneName, 0);

  objc_storeStrong((id *)&self->_recordName, 0);
}

@end