@interface NEProfileIngestionPayloadInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isSetAside;
- (NEProfileIngestionPayloadInfo)init;
- (NEProfileIngestionPayloadInfo)initWithCoder:(id)a3;
- (NSDate)profileIngestionDate;
- (NSString)payloadOrganization;
- (NSString)payloadProtocolType;
- (NSString)payloadUUID;
- (NSString)profileIdentifier;
- (NSString)profileOrganization;
- (NSString)profileUUID;
- (NSString)systemVersion;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int64_t)profileSource;
- (void)encodeWithCoder:(id)a3;
- (void)setIsSetAside:(BOOL)a3;
- (void)setPayloadOrganization:(id)a3;
- (void)setPayloadProtocolType:(id)a3;
- (void)setPayloadUUID:(id)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setProfileIngestionDate:(id)a3;
- (void)setProfileOrganization:(id)a3;
- (void)setProfileSource:(int64_t)a3;
- (void)setProfileUUID:(id)a3;
- (void)setSystemVersion:(id)a3;
@end

@implementation NEProfileIngestionPayloadInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_profileIngestionDate, 0);
  objc_storeStrong((id *)&self->_profileUUID, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_profileOrganization, 0);
  objc_storeStrong((id *)&self->_payloadOrganization, 0);
  objc_storeStrong((id *)&self->_payloadUUID, 0);

  objc_storeStrong((id *)&self->_payloadProtocolType, 0);
}

- (void)setProfileSource:(int64_t)a3
{
  self->_profileSource = a3;
}

- (int64_t)profileSource
{
  return self->_profileSource;
}

- (void)setIsSetAside:(BOOL)a3
{
  self->_isSetAside = a3;
}

- (BOOL)isSetAside
{
  return self->_isSetAside;
}

- (void)setSystemVersion:(id)a3
{
}

- (NSString)systemVersion
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setProfileIngestionDate:(id)a3
{
}

- (NSDate)profileIngestionDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProfileUUID:(id)a3
{
}

- (NSString)profileUUID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProfileIdentifier:(id)a3
{
}

- (NSString)profileIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProfileOrganization:(id)a3
{
}

- (NSString)profileOrganization
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPayloadOrganization:(id)a3
{
}

- (NSString)payloadOrganization
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPayloadUUID:(id)a3
{
}

- (NSString)payloadUUID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPayloadProtocolType:(id)a3
{
}

- (NSString)payloadProtocolType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)copyLegacyDictionary
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  if (!v3) {
    goto LABEL_16;
  }
  if (self->_payloadUUID)
  {
    v4 = (void *)[[NSString alloc] initWithString:self->_payloadUUID];
    [v3 setObject:v4 forKeyedSubscript:@"PayloadUUID"];
  }
  if (self->_payloadOrganization)
  {
    v5 = (void *)[[NSString alloc] initWithString:self->_payloadOrganization];
    [v3 setObject:v5 forKeyedSubscript:@"PayloadOrganization"];
  }
  if (!self->_profileIdentifier && !self->_profileUUID && !self->_profileOrganization) {
    goto LABEL_15;
  }
  uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  if (!v6)
  {
LABEL_16:
    id v10 = 0;
    goto LABEL_17;
  }
  v7 = (void *)v6;
  if (self->_profileIdentifier)
  {
    v8 = (void *)[[NSString alloc] initWithString:self->_profileIdentifier];
    [v7 setObject:v8 forKeyedSubscript:@"PayloadIdentifier"];
  }
  if (self->_profileUUID)
  {
    v9 = (void *)[[NSString alloc] initWithString:self->_profileUUID];
    [v7 setObject:v9 forKeyedSubscript:@"PayloadUUID"];
  }
  [v3 setObject:v7 forKeyedSubscript:@"PayloadRoot"];

LABEL_15:
  id v10 = v3;
LABEL_17:

  return v10;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)NEProfileIngestionPayloadInfo;
  v5 = [(NEProfileIngestionPayloadInfo *)&v45 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"PayloadType"];
    int v7 = isa_nsstring(v6);

    if (v7)
    {
      id v8 = [NSString alloc];
      v9 = [v4 objectForKeyedSubscript:@"PayloadType"];
      uint64_t v10 = [v8 initWithString:v9];
      payloadProtocolType = v5->_payloadProtocolType;
      v5->_payloadProtocolType = (NSString *)v10;
    }
    v12 = [v4 objectForKeyedSubscript:@"PayloadUUID"];
    int v13 = isa_nsstring(v12);

    if (v13)
    {
      id v14 = [NSString alloc];
      v15 = [v4 objectForKeyedSubscript:@"PayloadUUID"];
      uint64_t v16 = [v14 initWithString:v15];
      payloadUUID = v5->_payloadUUID;
      v5->_payloadUUID = (NSString *)v16;
    }
    v18 = [v4 objectForKeyedSubscript:@"PayloadOrganization"];
    int v19 = isa_nsstring(v18);

    if (v19)
    {
      id v20 = [NSString alloc];
      v21 = [v4 objectForKeyedSubscript:@"PayloadOrganization"];
      uint64_t v22 = [v20 initWithString:v21];
      payloadOrganization = v5->_payloadOrganization;
      v5->_payloadOrganization = (NSString *)v22;
    }
    v24 = [v4 objectForKeyedSubscript:@"PayloadRoot"];
    v25 = v24;
    if (v24 && isa_nsdictionary(v24))
    {
      v26 = [v25 objectForKeyedSubscript:@"PayloadIdentifier"];
      int v27 = isa_nsstring(v26);

      if (v27)
      {
        id v28 = [NSString alloc];
        v29 = [v25 objectForKeyedSubscript:@"PayloadIdentifier"];
        uint64_t v30 = [v28 initWithString:v29];
        profileIdentifier = v5->_profileIdentifier;
        v5->_profileIdentifier = (NSString *)v30;
      }
      v32 = [v25 objectForKeyedSubscript:@"PayloadUUID"];
      int v33 = isa_nsstring(v32);

      if (v33)
      {
        id v34 = [NSString alloc];
        v35 = [v25 objectForKeyedSubscript:@"PayloadUUID"];
        uint64_t v36 = [v34 initWithString:v35];
        profileUUID = v5->_profileUUID;
        v5->_profileUUID = (NSString *)v36;
      }
      v38 = [v25 objectForKeyedSubscript:@"PayloadOrganization"];
      int v39 = isa_nsstring(v38);

      if (v39)
      {
        id v40 = [NSString alloc];
        v41 = [v25 objectForKeyedSubscript:@"PayloadOrganization"];
        uint64_t v42 = [v40 initWithString:v41];
        profileOrganization = v5->_profileOrganization;
        v5->_profileOrganization = (NSString *)v42;
      }
    }
  }
  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v8 = [(NEProfileIngestionPayloadInfo *)self payloadUUID];
  [v7 appendPrettyObject:v8 withName:@"payloadUUID" andIndent:v5 options:a4];

  v9 = [(NEProfileIngestionPayloadInfo *)self payloadOrganization];
  [v7 appendPrettyObject:v9 withName:@"payloadOrganization" andIndent:v5 options:a4 | 1];

  uint64_t v10 = [(NEProfileIngestionPayloadInfo *)self profileUUID];
  [v7 appendPrettyObject:v10 withName:@"profileUUID" andIndent:v5 options:a4];

  v11 = [(NEProfileIngestionPayloadInfo *)self profileIdentifier];
  [v7 appendPrettyObject:v11 withName:@"profileIdentifier" andIndent:v5 options:a4 | 1];

  v12 = [(NEProfileIngestionPayloadInfo *)self profileOrganization];
  [v7 appendPrettyObject:v12 withName:@"profileOrganization" andIndent:v5 options:a4 | 1];

  int v13 = [(NEProfileIngestionPayloadInfo *)self payloadProtocolType];
  [v7 appendPrettyObject:v13 withName:@"payloadProtocolType" andIndent:v5 options:a4];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProfileIngestionPayloadInfo isSetAside](self, "isSetAside"), @"isSetAside", v5, a4);
  id v14 = [(NEProfileIngestionPayloadInfo *)self profileIngestionDate];
  [v7 appendPrettyObject:v14 withName:@"profileIngestionDate" andIndent:v5 options:a4];

  v15 = [(NEProfileIngestionPayloadInfo *)self systemVersion];
  [v7 appendPrettyObject:v15 withName:@"systemVersion" andIndent:v5 options:a4];

  int64_t v16 = [(NEProfileIngestionPayloadInfo *)self profileSource];
  v17 = @"unknown";
  if (v16 == 2) {
    v17 = @"mdm";
  }
  if (v16 == 1) {
    v18 = @"user";
  }
  else {
    v18 = v17;
  }
  [v7 appendPrettyObject:v18 withName:@"profileSource" andIndent:v5 options:a4];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NEProfileIngestionPayloadInfo allocWithZone:a3] init];
  uint64_t v5 = [(NEProfileIngestionPayloadInfo *)self payloadProtocolType];
  [(NEProfileIngestionPayloadInfo *)v4 setPayloadProtocolType:v5];

  uint64_t v6 = [(NEProfileIngestionPayloadInfo *)self payloadUUID];
  [(NEProfileIngestionPayloadInfo *)v4 setPayloadUUID:v6];

  id v7 = [(NEProfileIngestionPayloadInfo *)self payloadOrganization];
  [(NEProfileIngestionPayloadInfo *)v4 setPayloadOrganization:v7];

  id v8 = [(NEProfileIngestionPayloadInfo *)self profileIdentifier];
  [(NEProfileIngestionPayloadInfo *)v4 setProfileIdentifier:v8];

  v9 = [(NEProfileIngestionPayloadInfo *)self profileUUID];
  [(NEProfileIngestionPayloadInfo *)v4 setProfileUUID:v9];

  uint64_t v10 = [(NEProfileIngestionPayloadInfo *)self profileOrganization];
  [(NEProfileIngestionPayloadInfo *)v4 setProfileOrganization:v10];

  [(NEProfileIngestionPayloadInfo *)v4 setIsSetAside:[(NEProfileIngestionPayloadInfo *)self isSetAside]];
  v11 = [(NEProfileIngestionPayloadInfo *)self profileIngestionDate];
  [(NEProfileIngestionPayloadInfo *)v4 setProfileIngestionDate:v11];

  v12 = [(NEProfileIngestionPayloadInfo *)self systemVersion];
  [(NEProfileIngestionPayloadInfo *)v4 setSystemVersion:v12];

  [(NEProfileIngestionPayloadInfo *)v4 setProfileSource:[(NEProfileIngestionPayloadInfo *)self profileSource]];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(NEProfileIngestionPayloadInfo *)self payloadProtocolType];
  [v12 encodeObject:v4 forKey:@"PayloadType"];

  uint64_t v5 = [(NEProfileIngestionPayloadInfo *)self payloadUUID];
  [v12 encodeObject:v5 forKey:@"PayloadUUID"];

  uint64_t v6 = [(NEProfileIngestionPayloadInfo *)self payloadOrganization];
  [v12 encodeObject:v6 forKey:@"PayloadOrganization"];

  id v7 = [(NEProfileIngestionPayloadInfo *)self profileIdentifier];
  [v12 encodeObject:v7 forKey:@"ProfileIdentifier"];

  id v8 = [(NEProfileIngestionPayloadInfo *)self profileUUID];
  [v12 encodeObject:v8 forKey:@"ProfileUUID"];

  v9 = [(NEProfileIngestionPayloadInfo *)self profileOrganization];
  [v12 encodeObject:v9 forKey:@"ProfileOrganization"];

  objc_msgSend(v12, "encodeBool:forKey:", -[NEProfileIngestionPayloadInfo isSetAside](self, "isSetAside"), @"isSetAside");
  uint64_t v10 = [(NEProfileIngestionPayloadInfo *)self profileIngestionDate];
  [v12 encodeObject:v10 forKey:@"profileIngestionDate"];

  v11 = [(NEProfileIngestionPayloadInfo *)self systemVersion];
  [v12 encodeObject:v11 forKey:@"systemVersion"];

  objc_msgSend(v12, "encodeInteger:forKey:", -[NEProfileIngestionPayloadInfo profileSource](self, "profileSource"), @"profileSource");
}

- (NEProfileIngestionPayloadInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NEProfileIngestionPayloadInfo;
  uint64_t v5 = [(NEProfileIngestionPayloadInfo *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PayloadType"];
    payloadProtocolType = v5->_payloadProtocolType;
    v5->_payloadProtocolType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PayloadUUID"];
    payloadUUID = v5->_payloadUUID;
    v5->_payloadUUID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PayloadOrganization"];
    payloadOrganization = v5->_payloadOrganization;
    v5->_payloadOrganization = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProfileIdentifier"];
    profileIdentifier = v5->_profileIdentifier;
    v5->_profileIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProfileUUID"];
    profileUUID = v5->_profileUUID;
    v5->_profileUUID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProfileOrganization"];
    profileOrganization = v5->_profileOrganization;
    v5->_profileOrganization = (NSString *)v16;

    v5->_isSetAside = [v4 decodeBoolForKey:@"isSetAside"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"profileIngestionDate"];
    profileIngestionDate = v5->_profileIngestionDate;
    v5->_profileIngestionDate = (NSDate *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemVersion"];
    systemVersion = v5->_systemVersion;
    v5->_systemVersion = (NSString *)v20;

    v5->_profileSource = [v4 decodeIntegerForKey:@"profileSource"];
  }

  return v5;
}

- (NEProfileIngestionPayloadInfo)init
{
  v9.receiver = self;
  v9.super_class = (Class)NEProfileIngestionPayloadInfo;
  v2 = [(NEProfileIngestionPayloadInfo *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v4 = [v3 operatingSystemVersionString];
    systemVersion = v2->_systemVersion;
    v2->_systemVersion = (NSString *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    profileIngestionDate = v2->_profileIngestionDate;
    v2->_profileIngestionDate = (NSDate *)v6;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end