@interface __HMDPrimaryElectionCandidate
+ (BOOL)supportsPingRequest:(unint64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (id)fromMessagePayload:(id)a3;
+ (unint64_t)setSupportsPingRequest:(BOOL)a3 capabilities:(unint64_t)a4;
- (BOOL)enabledAsResident;
- (BOOL)matchesPreferredPrimaryIdentifier:(id)a3;
- (BOOL)pcsEnabled;
- (BOOL)supportsPingRequest;
- (HMDHomeKitVersion)homeKitVersion;
- (HMDResidentDevice)residentDevice;
- (HMFSoftwareVersion)swVersion;
- (NSString)name;
- (NSUUID)currentPrimaryIdentifier;
- (NSUUID)deviceIdentifier;
- (__HMDPrimaryElectionCandidate)initWithCoder:(id)a3;
- (__HMDPrimaryElectionCandidate)initWithVersion:(id)a3 deviceIdentifier:(id)a4 name:(id)a5 currentPrimaryIdentifier:(id)a6 enabledAsResident:(BOOL)a7 supportsPingRequest:(BOOL)a8 connectionType:(unint64_t)a9 pcsEnabled:(BOOL)a10 swVersion:(id)a11;
- (id)description;
- (id)toMessagePayload;
- (int64_t)compare:(id)a3 currentPrimary:(id)a4 outCriteria:(unint64_t *)a5;
- (int64_t)comparePreferredPrimaryStatusWith:(id)a3;
- (uint64_t)compareSoftwareVersion:(void *)a3 with:;
- (unint64_t)capabilities;
- (unint64_t)connectionType;
- (void)encodeWithCoder:(id)a3;
- (void)productClass;
- (void)setCapabilities:(unint64_t)a3;
- (void)setResidentDevice:(id)a3;
@end

@implementation __HMDPrimaryElectionCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swVersion, 0);
  objc_storeStrong((id *)&self->_currentPrimaryIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitVersion, 0);
  objc_storeStrong((id *)&self->_residentDevice, 0);
}

- (HMFSoftwareVersion)swVersion
{
  return self->_swVersion;
}

- (BOOL)pcsEnabled
{
  return self->_pcsEnabled;
}

- (unint64_t)connectionType
{
  return self->_connectionType;
}

- (void)setCapabilities:(unint64_t)a3
{
  self->_capabilities = a3;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (BOOL)enabledAsResident
{
  return self->_enabledAsResident;
}

- (NSUUID)currentPrimaryIdentifier
{
  return self->_currentPrimaryIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (HMDHomeKitVersion)homeKitVersion
{
  return self->_homeKitVersion;
}

- (void)setResidentDevice:(id)a3
{
}

- (HMDResidentDevice)residentDevice
{
  return self->_residentDevice;
}

- (int64_t)compare:(id)a3 currentPrimary:(id)a4 outCriteria:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(__HMDPrimaryElectionCandidate *)self comparePreferredPrimaryStatusWith:v8];
  if (!v10)
  {
    BOOL v13 = [(__HMDPrimaryElectionCandidate *)self enabledAsResident];
    int v14 = [v8 enabledAsResident];
    if (!self) {
      goto LABEL_7;
    }
    if ((v14 | !v13) == 1)
    {
      if ((v13 | v14 ^ 1))
      {
LABEL_7:
        BOOL v15 = [(__HMDPrimaryElectionCandidate *)self pcsEnabled];
        int v16 = [v8 pcsEnabled];
        if (self)
        {
          if ((v16 | !v15) == 1)
          {
            if ((v15 | v16 ^ 1))
            {
              v17 = -[__HMDPrimaryElectionCandidate productClass](self);
              v18 = -[__HMDPrimaryElectionCandidate productClass](v8);
              if (v17 != (void *)3 && v18 == (void *)3)
              {
                int64_t v11 = 1;
                goto LABEL_24;
              }
              if (v17 == (void *)3 && v18 != (void *)3)
              {
                int64_t v11 = -1;
LABEL_24:
                if (a5)
                {
                  unint64_t v12 = 4;
                  goto LABEL_26;
                }
                goto LABEL_27;
              }
LABEL_29:
              v20 = [(__HMDPrimaryElectionCandidate *)self homeKitVersion];
              v21 = [v8 homeKitVersion];
              int64_t v11 = [v20 compare:v21];

              if (v11)
              {
                if (!a5) {
                  goto LABEL_27;
                }
                unint64_t v12 = 5;
                goto LABEL_26;
              }
              v22 = [(__HMDPrimaryElectionCandidate *)self swVersion];
              v23 = [v8 swVersion];
              int64_t v11 = -[__HMDPrimaryElectionCandidate compareSoftwareVersion:with:]((uint64_t)self, v22, v23);

              if (v11)
              {
                if (!a5) {
                  goto LABEL_27;
                }
                unint64_t v12 = 16;
                goto LABEL_26;
              }
              if (v9)
              {
                v24 = [(__HMDPrimaryElectionCandidate *)self residentDevice];
                int v25 = [v24 isEqual:v9];

                if (v25)
                {
                  if (a5) {
                    *a5 = 10;
                  }
                  int64_t v11 = 1;
                  goto LABEL_27;
                }
                v26 = [v8 residentDevice];
                int v27 = [v26 isEqual:v9];

                if (v27)
                {
                  if (a5) {
                    *a5 = 10;
                  }
                  int64_t v11 = -1;
                  goto LABEL_27;
                }
              }
              unint64_t v28 = [(__HMDPrimaryElectionCandidate *)self connectionType];
              uint64_t v29 = [v8 connectionType];
              if (self)
              {
                if (v28 == 1 && v29 != 1)
                {
                  int64_t v11 = 1;
LABEL_51:
                  if (!a5) {
                    goto LABEL_27;
                  }
                  unint64_t v12 = 14;
                  goto LABEL_26;
                }
                if (v28 != 1 && v29 == 1)
                {
                  int64_t v11 = -1;
                  goto LABEL_51;
                }
              }
              if (a5) {
                *a5 = 13;
              }
              v30 = [(__HMDPrimaryElectionCandidate *)self deviceIdentifier];
              v31 = [v30 UUIDString];
              v32 = [v8 deviceIdentifier];
              v33 = [v32 UUIDString];
              int64_t v11 = [v31 compare:v33];

              goto LABEL_27;
            }
            int64_t v11 = -1;
            if (!a5) {
              goto LABEL_27;
            }
          }
          else
          {
            int64_t v11 = 1;
            if (!a5) {
              goto LABEL_27;
            }
          }
          unint64_t v12 = 15;
          goto LABEL_26;
        }
        -[__HMDPrimaryElectionCandidate productClass](v8);
        goto LABEL_29;
      }
      int64_t v11 = -1;
      if (!a5) {
        goto LABEL_27;
      }
    }
    else
    {
      int64_t v11 = 1;
      if (!a5) {
        goto LABEL_27;
      }
    }
    unint64_t v12 = 1;
    goto LABEL_26;
  }
  int64_t v11 = v10;
  if (a5)
  {
    unint64_t v12 = 17;
LABEL_26:
    *a5 = v12;
  }
LABEL_27:

  return v11;
}

- (void)productClass
{
  if (result)
  {
    v1 = [result residentDevice];
    v2 = [v1 device];
    v3 = [v2 productInfo];
    uint64_t v4 = [v3 productClass];

    return (void *)v4;
  }
  return result;
}

- (uint64_t)compareSoftwareVersion:(void *)a3 with:
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v5 && !v6)
    {
      a1 = 1;
      goto LABEL_13;
    }
    if (!v5 && v6)
    {
      a1 = -1;
      goto LABEL_13;
    }
    if (v5)
    {
      [v5 operatingSystemVersion];
      if (!v7)
      {
LABEL_12:
        a1 = HMFOperatingSystemVersionCompare();
        goto LABEL_13;
      }
    }
    else if (!v6)
    {
      goto LABEL_12;
    }
    [v7 operatingSystemVersion];
    goto LABEL_12;
  }
LABEL_13:

  return a1;
}

- (int64_t)comparePreferredPrimaryStatusWith:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)CFPreferencesCopyAppValue(@"hmd.preferred.primary", @"hmd.preferred.primary.homeutil");
  if (!v5) {
    goto LABEL_11;
  }
  if (![(__HMDPrimaryElectionCandidate *)self matchesPreferredPrimaryIdentifier:v5])
  {
    if ([v4 matchesPreferredPrimaryIdentifier:v5])
    {
      id v6 = (void *)MEMORY[0x1D9452090]();
      BOOL v13 = self;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = HMFGetLogIdentifier();
        BOOL v15 = [v4 name];
        int v16 = [(__HMDPrimaryElectionCandidate *)v13 name];
        int v18 = 138544130;
        v19 = v14;
        __int16 v20 = 2112;
        v21 = v15;
        __int16 v22 = 2112;
        v23 = v16;
        __int16 v24 = 2112;
        int v25 = v5;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Preferring %@ over %@ in resident election due to preferred primary: %@", (uint8_t *)&v18, 0x2Au);
      }
      int64_t v12 = -1;
      goto LABEL_10;
    }
LABEL_11:
    int64_t v12 = 0;
    goto LABEL_12;
  }
  id v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = HMFGetLogIdentifier();
    int64_t v10 = [(__HMDPrimaryElectionCandidate *)v7 name];
    int64_t v11 = [v4 name];
    int v18 = 138544130;
    v19 = v9;
    __int16 v20 = 2112;
    v21 = v10;
    __int16 v22 = 2112;
    v23 = v11;
    __int16 v24 = 2112;
    int v25 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Preferring %@ over %@ in resident election due to preferred primary: %@", (uint8_t *)&v18, 0x2Au);
  }
  int64_t v12 = 1;
LABEL_10:

LABEL_12:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  homeKitVersion = self->_homeKitVersion;
  id v5 = a3;
  [v5 encodeObject:homeKitVersion forKey:@"v"];
  [v5 encodeObject:self->_deviceIdentifier forKey:@"id"];
  [v5 encodeObject:self->_name forKey:@"n"];
  [v5 encodeObject:self->_currentPrimaryIdentifier forKey:@"pid"];
  [v5 encodeBool:self->_enabledAsResident forKey:@"e"];
  [v5 encodeInt:LODWORD(self->_capabilities) forKey:@"caps"];
  [v5 encodeInteger:SLODWORD(self->_connectionType) forKey:@"conn"];
  [v5 encodeBool:self->_pcsEnabled forKey:@"pcs"];
  [v5 encodeObject:self->_swVersion forKey:@"swv"];
}

- (__HMDPrimaryElectionCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"v"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"n"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pid"];
  unsigned int v16 = [v4 decodeBoolForKey:@"e"];
  int v9 = [v4 decodeIntForKey:@"caps"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"conn"];
  char v11 = [v4 decodeBoolForKey:@"pcs"];
  int64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"swv"];

  BOOL v13 = 0;
  if (v5 && v6)
  {
    LOBYTE(v15) = v11;
    self = [(__HMDPrimaryElectionCandidate *)self initWithVersion:v5 deviceIdentifier:v6 name:v7 currentPrimaryIdentifier:v8 enabledAsResident:v16 supportsPingRequest:+[__HMDPrimaryElectionCandidate supportsPingRequest:v9] connectionType:v10 pcsEnabled:v15 swVersion:v12];
    BOOL v13 = self;
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  if (shouldLogPrivateInformation()) {
    name = (__CFString *)self->_name;
  }
  else {
    name = @"<redacted>";
  }
  long long v15 = *(_OWORD *)&self->_homeKitVersion;
  currentPrimaryIdentifier = self->_currentPrimaryIdentifier;
  id v8 = HMFBooleanToString();
  +[__HMDPrimaryElectionCandidate supportsPingRequest:self->_capabilities];
  int v9 = HMFBooleanToString();
  uint64_t v10 = HMFBooleanToString();
  char v11 = HMFBooleanToString();
  int64_t v12 = [(HMFSoftwareVersion *)self->_swVersion versionString];
  BOOL v13 = [v3 stringWithFormat:@"<%@ name: %@, homekitVersion: %@, id: %@, primary: %@, enabled: %@ supportsPingRequest: %@, wired: %@, pcsEnabled: %@>, swVersion: %@", v5, name, v15, currentPrimaryIdentifier, v8, v9, v10, v11, v12];

  return v13;
}

- (id)toMessagePayload
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"parameters";
  v2 = encodeRootObject();
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (BOOL)supportsPingRequest
{
  unint64_t v2 = [(__HMDPrimaryElectionCandidate *)self capabilities];
  return +[__HMDPrimaryElectionCandidate supportsPingRequest:v2];
}

- (BOOL)matchesPreferredPrimaryIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(__HMDPrimaryElectionCandidate *)self name];
  char v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
    if (!v8) {
      goto LABEL_8;
    }
    int v9 = [(__HMDPrimaryElectionCandidate *)self deviceIdentifier];
    char v10 = [v9 isEqual:v8];

    if (v10) {
      goto LABEL_7;
    }
    char v11 = [(__HMDPrimaryElectionCandidate *)self residentDevice];
    int64_t v12 = [v11 identifier];
    char v13 = [v12 isEqual:v8];

    if (v13) {
      goto LABEL_7;
    }
    int v14 = [(__HMDPrimaryElectionCandidate *)self residentDevice];
    long long v15 = [v14 device];
    unsigned int v16 = [v15 identifier];
    char v17 = [v16 isEqual:v8];

    if (v17) {
LABEL_7:
    }
      BOOL v7 = 1;
    else {
LABEL_8:
    }
      BOOL v7 = 0;
  }
  return v7;
}

- (__HMDPrimaryElectionCandidate)initWithVersion:(id)a3 deviceIdentifier:(id)a4 name:(id)a5 currentPrimaryIdentifier:(id)a6 enabledAsResident:(BOOL)a7 supportsPingRequest:(BOOL)a8 connectionType:(unint64_t)a9 pcsEnabled:(BOOL)a10 swVersion:(id)a11
{
  BOOL v32 = a8;
  unsigned int v16 = (HMDHomeKitVersion *)a3;
  char v17 = (NSUUID *)a4;
  int v18 = (NSString *)a5;
  v19 = (NSUUID *)a6;
  __int16 v20 = (HMFSoftwareVersion *)a11;
  v33.receiver = self;
  v33.super_class = (Class)__HMDPrimaryElectionCandidate;
  v21 = [(__HMDPrimaryElectionCandidate *)&v33 init];
  homeKitVersion = v21->_homeKitVersion;
  v21->_homeKitVersion = v16;
  v23 = v16;

  deviceIdentifier = v21->_deviceIdentifier;
  v21->_deviceIdentifier = v17;
  int v25 = v17;

  name = v21->_name;
  v21->_name = v18;
  int v27 = v18;

  currentPrimaryIdentifier = v21->_currentPrimaryIdentifier;
  v21->_currentPrimaryIdentifier = v19;
  uint64_t v29 = v19;

  v21->_enabledAsResident = a7;
  v21->_capabilities = +[__HMDPrimaryElectionCandidate setSupportsPingRequest:v32 capabilities:0];
  v21->_connectionType = a9;
  v21->_pcsEnabled = a10;
  swVersion = v21->_swVersion;
  v21->_swVersion = v20;

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsPingRequest:(unint64_t)a3
{
  return a3 & 1;
}

+ (unint64_t)setSupportsPingRequest:(BOOL)a3 capabilities:(unint64_t)a4
{
  return a3 | a4;
}

+ (id)fromMessagePayload:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(v3, "hmf_dataForKey:", @"parameters");
  if (v4)
  {
    id v18 = 0;
    id v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v18];
    id v6 = v18;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      char v13 = (void *)MEMORY[0x1D9452090]();
      int v14 = objc_opt_class();
      long long v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        unsigned int v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v20 = v16;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode election parameters: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    int v9 = objc_opt_class();
    char v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      char v11 = HMFGetLogIdentifier();
      int64_t v12 = [v3 allKeys];
      *(_DWORD *)buf = 138543618;
      __int16 v20 = v11;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to find election parameters in payload (keys: %@)", buf, 0x16u);
    }
    id v5 = 0;
  }

  return v5;
}

@end