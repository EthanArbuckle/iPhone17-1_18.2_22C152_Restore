@interface HMFSoftwareVersion
+ (BOOL)isValidVersionString:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)versionFromOperatingSystemVersion:(id *)a3;
+ (id)versionRegex;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion;
- (HMFSoftwareVersion)initWithCoder:(id)a3;
- (HMFSoftwareVersion)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 updateVersion:(unint64_t)a5;
- (HMFSoftwareVersion)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 updateVersion:(unint64_t)a5 buildVersion:(id)a6;
- (HMFSoftwareVersion)initWithVersionString:(id)a3;
- (NSString)buildVersion;
- (NSString)shortVersionString;
- (id)versionString;
- (int64_t)compare:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMFSoftwareVersion

- (id)versionString
{
  v3 = [(HMFSoftwareVersion *)self buildVersion];

  if (v3)
  {
    v4 = NSString;
    v10.receiver = self;
    v10.super_class = (Class)HMFSoftwareVersion;
    v5 = [(HMFVersion *)&v10 versionString];
    v6 = [(HMFSoftwareVersion *)self buildVersion];
    v7 = [v4 stringWithFormat:@"%@ (%@)", v5, v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HMFSoftwareVersion;
    v7 = [(HMFVersion *)&v9 versionString];
  }
  return v7;
}

- (NSString)buildVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
}

- (HMFSoftwareVersion)initWithVersionString:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = +[HMFSoftwareVersion versionRegex];
    if (v5)
    {
      v6 = objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
      if ([v6 count])
      {
        v7 = [v6 objectAtIndexedSubscript:0];
        if ([v7 numberOfRanges])
        {
          uint64_t v8 = [v7 rangeAtIndex:1];
          objc_super v10 = objc_msgSend(v4, "substringWithRange:", v8, v9);
          if ((unint64_t)[v7 numberOfRanges] >= 4
            && (uint64_t v11 = [v7 rangeAtIndex:3], v12))
          {
            v13 = objc_msgSend(v4, "substringWithRange:", v11, v12);
          }
          else
          {
            v13 = 0;
          }
          if ((unint64_t)[v7 numberOfRanges] >= 6
            && (uint64_t v18 = [v7 rangeAtIndex:5], v19))
          {
            v34 = objc_msgSend(v4, "substringWithRange:", v18, v19);
          }
          else
          {
            v34 = 0;
          }
          if ((unint64_t)[v7 numberOfRanges] >= 0xD
            && (uint64_t v20 = [v7 rangeAtIndex:12], v21))
          {
            v22 = objc_msgSend(v4, "substringWithRange:", v20, v21);
          }
          else
          {
            v22 = 0;
          }
          if ((unint64_t)[v7 numberOfRanges] >= 0xB)
          {
            uint64_t v23 = [v7 rangeAtIndex:10];
            if (v24)
            {
              uint64_t v25 = objc_msgSend(v4, "substringWithRange:", v23, v24);

              v22 = (void *)v25;
            }
          }
          if ((unint64_t)[v7 numberOfRanges] >= 9)
          {
            uint64_t v26 = [v7 rangeAtIndex:8];
            if (v27)
            {
              uint64_t v28 = objc_msgSend(v4, "substringWithRange:", v26, v27);

              v22 = (void *)v28;
            }
          }
          self = -[HMFSoftwareVersion initWithMajorVersion:minorVersion:updateVersion:buildVersion:](self, "initWithMajorVersion:minorVersion:updateVersion:buildVersion:", objc_msgSend(v10, "integerValue", v6), objc_msgSend(v13, "integerValue"), objc_msgSend(v34, "integerValue"), v22);

          v14 = self;
          v6 = v33;
        }
        else
        {
          v29 = (void *)MEMORY[0x19F3A87A0]();
          self = self;
          v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = HMFGetLogIdentifier(self);
            *(_DWORD *)buf = 138543618;
            v36 = v31;
            __int16 v37 = 2112;
            id v38 = v4;
            _os_log_impl(&dword_19D57B000, v30, OS_LOG_TYPE_INFO, "%{public}@Invalid version string: %@", buf, 0x16u);
          }
          v14 = 0;
        }
      }
      else
      {
        v15 = (void *)MEMORY[0x19F3A87A0]();
        self = self;
        v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = HMFGetLogIdentifier(self);
          *(_DWORD *)buf = 138543618;
          v36 = v17;
          __int16 v37 = 2112;
          id v38 = v4;
          _os_log_impl(&dword_19D57B000, v16, OS_LOG_TYPE_INFO, "%{public}@Invalid version string: %@", buf, 0x16u);
        }
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (HMFSoftwareVersion)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 updateVersion:(unint64_t)a5 buildVersion:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HMFSoftwareVersion;
  uint64_t v11 = [(HMFVersion *)&v15 initWithMajorVersion:a3 minorVersion:a4 updateVersion:a5];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    buildVersion = v11->_buildVersion;
    v11->_buildVersion = (NSString *)v12;
  }
  return v11;
}

+ (id)versionRegex
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"^(\\d+)(\\.(\\d+))?(\\.(\\d+))?((;(.*))|(\\s*\\((.*)\\))|(\\.(.*)))?.*$",
    0,
  v3 = &v11);
  id v4 = v11;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x19F3A87A0]();
    id v7 = a1;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier(v7);
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_19D57B000, v8, OS_LOG_TYPE_ERROR, "%{public}@HMFSoftwareVersion: Failed to create version string regex with error: %@", buf, 0x16u);
    }
  }

  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMFSoftwareVersion;
  id v5 = [(HMFVersion *)&v13 compare:v4];
  if (!v5)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    id v5 = [(HMFSoftwareVersion *)self buildVersion];
    if (v5)
    {
      uint64_t v9 = [v8 buildVersion];

      if (v9)
      {
        id v10 = [(HMFSoftwareVersion *)self buildVersion];
        id v11 = [v8 buildVersion];
        id v5 = (void *)[v10 compare:v11 options:65];
      }
      else
      {
        id v5 = 0;
      }
    }
  }
  return (int64_t)v5;
}

- (NSString)shortVersionString
{
  v4.receiver = self;
  v4.super_class = (Class)HMFSoftwareVersion;
  v2 = [(HMFVersion *)&v4 versionString];
  return (NSString *)v2;
}

- (HMFSoftwareVersion)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 updateVersion:(unint64_t)a5
{
  return [(HMFSoftwareVersion *)self initWithMajorVersion:a3 minorVersion:a4 updateVersion:a5 buildVersion:0];
}

+ (BOOL)isValidVersionString:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[HMFSoftwareVersion versionRegex];
  if (v4)
  {
    id v5 = objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    BOOL v6 = [v5 count] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)versionFromOperatingSystemVersion:(id *)a3
{
  id v3 = (void *)[objc_alloc((Class)a1) initWithMajorVersion:a3->var0 minorVersion:a3->var1 updateVersion:a3->var2];
  return v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion
{
  retstr->var0 = [(HMFVersion *)self majorVersion];
  retstr->var1 = [(HMFVersion *)self minorVersion];
  result = [(HMFVersion *)self updateVersion];
  retstr->var2 = (int64_t)result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFSoftwareVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"HM.major"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"HM.minor"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"HM.update"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.build"];

  uint64_t v9 = [(HMFSoftwareVersion *)self initWithMajorVersion:v5 minorVersion:v6 updateVersion:v7 buildVersion:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMFSoftwareVersion;
  id v4 = a3;
  [(HMFVersion *)&v6 encodeWithCoder:v4];
  uint64_t v5 = [(HMFSoftwareVersion *)self buildVersion];
  [v4 encodeObject:v5 forKey:@"HM.build"];
}

+ (id)logCategory
{
  if (qword_1EB4EEA68 != -1) {
    dispatch_once(&qword_1EB4EEA68, &__block_literal_global_130);
  }
  v2 = (void *)qword_1EB4EEA70;
  return v2;
}

uint64_t __33__HMFSoftwareVersion_logCategory__block_invoke()
{
  qword_1EB4EEA70 = HMFCreateOSLogHandle(@"HMFSoftwareVersion", @"com.apple.HomeKit");
  return MEMORY[0x1F41817F8]();
}

@end