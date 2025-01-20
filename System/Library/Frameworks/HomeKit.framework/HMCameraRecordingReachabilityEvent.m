@interface HMCameraRecordingReachabilityEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReachable;
- (HMCameraRecordingReachabilityEvent)initWithCoder:(id)a3;
- (HMCameraRecordingReachabilityEvent)initWithUniqueIdentifier:(id)a3 dateOfOccurrence:(id)a4 reachable:(BOOL)a5;
- (NSDate)dateOfOccurrence;
- (NSString)description;
- (NSUUID)uniqueIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMCameraRecordingReachabilityEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (NSDate)dateOfOccurrence
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMCameraRecordingReachabilityEvent)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCRRE.ck.ui"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCRRE.ck.doo"];
  uint64_t v7 = [v4 decodeBoolForKey:@"HMCRRE.ck.r"];
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = (void *)MEMORY[0x19F3A64A0](v7);
    v12 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v15 = 138543874;
      v16 = v11;
      __int16 v17 = 2112;
      v18 = v5;
      __int16 v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded identifier: %@ dateOfOccurrence: %@", (uint8_t *)&v15, 0x20u);
    }
    v13 = 0;
  }
  else
  {
    v12 = [(HMCameraRecordingReachabilityEvent *)self initWithUniqueIdentifier:v5 dateOfOccurrence:v6 reachable:v7];
    v13 = v12;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(HMCameraRecordingReachabilityEvent *)self uniqueIdentifier];
  [v6 encodeObject:v4 forKey:@"HMCRRE.ck.ui"];

  v5 = [(HMCameraRecordingReachabilityEvent *)self dateOfOccurrence];
  [v6 encodeObject:v5 forKey:@"HMCRRE.ck.doo"];

  objc_msgSend(v6, "encodeBool:forKey:", -[HMCameraRecordingReachabilityEvent isReachable](self, "isReachable"), @"HMCRRE.ck.r");
}

- (unint64_t)hash
{
  v2 = [(HMCameraRecordingReachabilityEvent *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    uint64_t v7 = [(HMCameraRecordingReachabilityEvent *)self uniqueIdentifier];
    BOOL v8 = [v6 uniqueIdentifier];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMCameraRecordingReachabilityEvent *)self dateOfOccurrence];
      v10 = [v6 dateOfOccurrence];
      if ([v9 isEqualToDate:v10])
      {
        BOOL v11 = [(HMCameraRecordingReachabilityEvent *)self isReachable];
        int v12 = v11 ^ [v6 isReachable] ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (NSString)description
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  id v4 = [(HMCameraRecordingReachabilityEvent *)self uniqueIdentifier];
  [v3 appendFormat:@" uniqueIdentifier: %@", v4];

  v5 = (void *)MEMORY[0x1E4F28C10];
  id v6 = [(HMCameraRecordingReachabilityEvent *)self dateOfOccurrence];
  uint64_t v7 = [v5 localizedStringFromDate:v6 dateStyle:1 timeStyle:2];
  [v3 appendFormat:@" dateOfOccurrence: %@", v7];

  [(HMCameraRecordingReachabilityEvent *)self isReachable];
  BOOL v8 = HMFBooleanToString();
  [v3 appendFormat:@" reachable: %@", v8];

  [v3 appendString:@">"];
  v9 = (void *)[v3 copy];

  return (NSString *)v9;
}

- (HMCameraRecordingReachabilityEvent)initWithUniqueIdentifier:(id)a3 dateOfOccurrence:(id)a4 reachable:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_7:
    __int16 v17 = (void *)_HMFPreconditionFailure();
    return (HMCameraRecordingReachabilityEvent *)+[HMCameraRecordingReachabilityEvent supportsSecureCoding];
  }
  v19.receiver = self;
  v19.super_class = (Class)HMCameraRecordingReachabilityEvent;
  BOOL v11 = [(HMCameraRecordingReachabilityEvent *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    uniqueIdentifier = v11->_uniqueIdentifier;
    v11->_uniqueIdentifier = (NSUUID *)v12;

    uint64_t v14 = [v10 copy];
    dateOfOccurrence = v11->_dateOfOccurrence;
    v11->_dateOfOccurrence = (NSDate *)v14;

    v11->_reachable = a5;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end