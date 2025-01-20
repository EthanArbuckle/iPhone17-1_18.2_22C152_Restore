@interface HMFVersion
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)isAtLeastVersion:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToVersion:(id)a3;
- (BOOL)isGreaterThanVersion:(id)a3;
- (HMFVersion)init;
- (HMFVersion)initWithCoder:(id)a3;
- (HMFVersion)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 updateVersion:(unint64_t)a5;
- (HMFVersion)initWithVersionString:(id)a3;
- (NSString)versionString;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)majorVersion;
- (unint64_t)minorVersion;
- (unint64_t)updateVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMFVersion

- (int64_t)compare:(id)a3
{
  v4 = (HMFVersion *)a3;
  v5 = v4;
  if (self == v4)
  {
    int64_t v10 = 0;
    goto LABEL_11;
  }
  if (!v4) {
    goto LABEL_10;
  }
  unint64_t v6 = [(HMFVersion *)self majorVersion];
  if (v6 > [(HMFVersion *)v5 majorVersion]) {
    goto LABEL_10;
  }
  unint64_t v7 = [(HMFVersion *)self majorVersion];
  if (v7 < [(HMFVersion *)v5 majorVersion])
  {
LABEL_7:
    int64_t v10 = -1;
    goto LABEL_11;
  }
  unint64_t v8 = [(HMFVersion *)self minorVersion];
  if (v8 > [(HMFVersion *)v5 minorVersion]) {
    goto LABEL_10;
  }
  unint64_t v9 = [(HMFVersion *)self minorVersion];
  if (v9 < [(HMFVersion *)v5 minorVersion]) {
    goto LABEL_7;
  }
  unint64_t v11 = [(HMFVersion *)self updateVersion];
  if (v11 > [(HMFVersion *)v5 updateVersion])
  {
LABEL_10:
    int64_t v10 = 1;
    goto LABEL_11;
  }
  unint64_t v13 = [(HMFVersion *)self updateVersion];
  if (v13 >= [(HMFVersion *)v5 updateVersion]) {
    int64_t v10 = 0;
  }
  else {
    int64_t v10 = -1;
  }
LABEL_11:

  return v10;
}

- (NSString)versionString
{
  unint64_t v3 = [(HMFVersion *)self updateVersion];
  v4 = NSString;
  unint64_t v5 = [(HMFVersion *)self majorVersion];
  unint64_t v6 = [(HMFVersion *)self minorVersion];
  if (v3) {
    objc_msgSend(v4, "stringWithFormat:", @"%tu.%tu.%tu", v5, v6, -[HMFVersion updateVersion](self, "updateVersion"));
  }
  else {
  unint64_t v7 = objc_msgSend(v4, "stringWithFormat:", @"%tu.%tu", v5, v6, v9);
  }
  return (NSString *)v7;
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)updateVersion
{
  return self->_updateVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (HMFVersion)initWithVersionString:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v30 = 0;
    unint64_t v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^(\\d+)(\\.(\\d+))?(\\.(\\d+))?.*$" options:0 error:&v30];
    id v6 = v30;
    if (v5)
    {
      unint64_t v7 = objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
      if ([v7 count])
      {
        unint64_t v8 = [v7 objectAtIndexedSubscript:0];
        if ([v8 numberOfRanges])
        {
          uint64_t v9 = [v8 rangeAtIndex:1];
          unint64_t v11 = objc_msgSend(v4, "substringWithRange:", v9, v10);
          if ((unint64_t)[v8 numberOfRanges] >= 4
            && (uint64_t v12 = [v8 rangeAtIndex:3], v13))
          {
            v14 = objc_msgSend(v4, "substringWithRange:", v12, v13);
          }
          else
          {
            v14 = 0;
          }
          if ((unint64_t)[v8 numberOfRanges] >= 6
            && (uint64_t v22 = [v8 rangeAtIndex:5], v23))
          {
            v24 = objc_msgSend(v4, "substringWithRange:", v22, v23);
          }
          else
          {
            v24 = 0;
          }
          self = -[HMFVersion initWithMajorVersion:minorVersion:updateVersion:](self, "initWithMajorVersion:minorVersion:updateVersion:", objc_msgSend(v11, "integerValue", v6), objc_msgSend(v14, "integerValue"), objc_msgSend(v24, "integerValue"));

          v15 = self;
          id v6 = v29;
        }
        else
        {
          v25 = (void *)MEMORY[0x19F3A87A0]();
          self = self;
          v26 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            v27 = HMFGetLogIdentifier(self);
            *(_DWORD *)buf = 138543618;
            v32 = v27;
            __int16 v33 = 2112;
            id v34 = v4;
            _os_log_impl(&dword_19D57B000, v26, OS_LOG_TYPE_INFO, "%{public}@Invalid version string: %@", buf, 0x16u);
          }
          v15 = 0;
        }
      }
      else
      {
        v19 = (void *)MEMORY[0x19F3A87A0]();
        self = self;
        v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = HMFGetLogIdentifier(self);
          *(_DWORD *)buf = 138543618;
          v32 = v21;
          __int16 v33 = 2112;
          id v34 = v4;
          _os_log_impl(&dword_19D57B000, v20, OS_LOG_TYPE_INFO, "%{public}@Invalid version string: %@", buf, 0x16u);
        }
        v15 = 0;
      }
    }
    else
    {
      v16 = (void *)MEMORY[0x19F3A87A0]();
      self = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier(self);
        *(_DWORD *)buf = 138543618;
        v32 = v18;
        __int16 v33 = 2112;
        id v34 = v6;
        _os_log_impl(&dword_19D57B000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to create version string regex with error: %@", buf, 0x16u);
      }
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (HMFVersion)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 updateVersion:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)HMFVersion;
  result = [(HMFVersion *)&v9 init];
  if (result)
  {
    result->_majorVersion = a3;
    result->_minorVersion = a4;
    result->_updateVersion = a5;
  }
  return result;
}

- (BOOL)isEqualToVersion:(id)a3
{
  return [(HMFVersion *)self compare:a3] == 0;
}

- (HMFVersion)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  unint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (unint64_t)hash
{
  unint64_t v3 = [(HMFVersion *)self majorVersion];
  unint64_t v4 = ([(HMFVersion *)self minorVersion] << 16) ^ (v3 << 48);
  return v4 ^ [(HMFVersion *)self updateVersion];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6) {
    BOOL v7 = [(HMFVersion *)self isEqualToVersion:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isAtLeastVersion:(id)a3
{
  return [(HMFVersion *)self compare:a3] != -1;
}

- (BOOL)isGreaterThanVersion:(id)a3
{
  return [(HMFVersion *)self compare:a3] == 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"HM.major"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"HM.minor"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"HM.update"];

  return [(HMFVersion *)self initWithMajorVersion:v5 minorVersion:v6 updateVersion:v7];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFVersion majorVersion](self, "majorVersion"), @"HM.major");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFVersion minorVersion](self, "minorVersion"), @"HM.minor");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFVersion updateVersion](self, "updateVersion"), @"HM.update");
}

+ (id)logCategory
{
  if (_MergedGlobals_3_2 != -1) {
    dispatch_once(&_MergedGlobals_3_2, &__block_literal_global_12);
  }
  v2 = (void *)qword_1EB4EEA60;
  return v2;
}

uint64_t __25__HMFVersion_logCategory__block_invoke()
{
  qword_1EB4EEA60 = HMFCreateOSLogHandle(@"HMFVersion", @"com.apple.HomeKit");
  return MEMORY[0x1F41817F8]();
}

@end