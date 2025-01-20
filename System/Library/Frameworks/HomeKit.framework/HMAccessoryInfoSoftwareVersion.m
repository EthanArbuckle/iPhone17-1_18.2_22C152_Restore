@interface HMAccessoryInfoSoftwareVersion
- (BOOL)isEqual:(id)a3;
- (HMAccessoryInfoSoftwareVersion)initWithProtoData:(id)a3;
- (HMAccessoryInfoSoftwareVersion)initWithProtoPayload:(id)a3;
- (HMAccessoryInfoSoftwareVersion)initWithSoftwareVersion:(id)a3;
- (HMFSoftwareVersion)softwareVersion;
- (id)description;
- (id)protoData;
- (id)protoPayload;
- (unint64_t)hash;
@end

@implementation HMAccessoryInfoSoftwareVersion

- (void).cxx_destruct
{
}

- (HMFSoftwareVersion)softwareVersion
{
  return (HMFSoftwareVersion *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessoryInfoSoftwareVersion)initWithProtoData:(id)a3
{
  id v4 = a3;
  v5 = [[HMAccessoryInfoProtoSoftwareVersionInfoEvent alloc] initWithData:v4];

  v6 = [(HMAccessoryInfoSoftwareVersion *)self initWithProtoPayload:v5];
  return v6;
}

- (HMAccessoryInfoSoftwareVersion)initWithProtoPayload:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hasMajorVersion]
    && [v4 hasMinorVersion]
    && ([v4 hasUpdateVersion] & 1) != 0)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F65558]);
    uint64_t v6 = [v4 majorVersion];
    uint64_t v7 = [v4 minorVersion];
    uint64_t v8 = [v4 updateVersion];
    v9 = [v4 buildVersion];
    v10 = (void *)[v5 initWithMajorVersion:v6 minorVersion:v7 updateVersion:v8 buildVersion:v9];

    v11 = [(HMAccessoryInfoSoftwareVersion *)self initWithSoftwareVersion:v10];
    v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    v11 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v17 = 138544130;
      v18 = v15;
      __int16 v19 = 2048;
      uint64_t v20 = [v4 majorVersion];
      __int16 v21 = 2048;
      uint64_t v22 = [v4 minorVersion];
      __int16 v23 = 2048;
      uint64_t v24 = [v4 updateVersion];
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Proto payload is missing required sw version info. Major: %lld minor: %lld update: %lld", (uint8_t *)&v17, 0x2Au);
    }
    v12 = 0;
  }

  return v12;
}

- (id)protoData
{
  v2 = [(HMAccessoryInfoSoftwareVersion *)self protoPayload];
  v3 = [v2 data];

  return v3;
}

- (id)protoPayload
{
  v3 = objc_alloc_init(HMAccessoryInfoProtoSoftwareVersionInfoEvent);
  id v4 = [(HMAccessoryInfoSoftwareVersion *)self softwareVersion];
  -[HMAccessoryInfoProtoSoftwareVersionInfoEvent setMajorVersion:](v3, "setMajorVersion:", [v4 majorVersion]);

  id v5 = [(HMAccessoryInfoSoftwareVersion *)self softwareVersion];
  -[HMAccessoryInfoProtoSoftwareVersionInfoEvent setMinorVersion:](v3, "setMinorVersion:", [v5 minorVersion]);

  uint64_t v6 = [(HMAccessoryInfoSoftwareVersion *)self softwareVersion];
  -[HMAccessoryInfoProtoSoftwareVersionInfoEvent setUpdateVersion:](v3, "setUpdateVersion:", [v6 updateVersion]);

  uint64_t v7 = [(HMAccessoryInfoSoftwareVersion *)self softwareVersion];
  uint64_t v8 = [v7 buildVersion];
  [(HMAccessoryInfoProtoSoftwareVersionInfoEvent *)v3 setBuildVersion:v8];

  return v3;
}

- (unint64_t)hash
{
  v2 = [(HMAccessoryInfoSoftwareVersion *)self softwareVersion];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMAccessoryInfoSoftwareVersion *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6)
    {
      uint64_t v7 = [(HMAccessoryInfoSoftwareVersion *)self softwareVersion];
      uint64_t v8 = [(HMAccessoryInfoSoftwareVersion *)v6 softwareVersion];
      char v9 = HMFEqualObjects();
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (id)description
{
  unint64_t v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)HMAccessoryInfoSoftwareVersion;
  id v4 = [(HMAccessoryInfoSoftwareVersion *)&v10 description];
  id v5 = [(HMAccessoryInfoSoftwareVersion *)self softwareVersion];
  uint64_t v6 = [(HMAccessoryInfoSoftwareVersion *)self softwareVersion];
  uint64_t v7 = [v6 buildVersion];
  uint64_t v8 = [v3 stringWithFormat:@"%@, %@ (%@)", v4, v5, v7];

  return v8;
}

- (HMAccessoryInfoSoftwareVersion)initWithSoftwareVersion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessoryInfoSoftwareVersion;
  uint64_t v6 = [(HMAccessoryInfoSoftwareVersion *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_softwareVersion, a3);
  }

  return v7;
}

@end