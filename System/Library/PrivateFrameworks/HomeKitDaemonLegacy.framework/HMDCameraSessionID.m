@interface HMDCameraSessionID
+ (NSNumber)uptimeNumberInMilliseconds;
+ (id)hostProcessBundleIdentifierForMessage:(id)a3;
+ (int64_t)uptimeInMilliseconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSPIClient;
- (HMDCameraSessionID)initWithSessionID:(id)a3 hostProcessBundleIdentifier:(id)a4 isSPIClient:(BOOL)a5 deviceSectionName:(id)a6 description:(id)a7;
- (HMDCameraSessionID)initWithSessionID:(id)a3 message:(id)a4 description:(id)a5;
- (NSMutableDictionary)deviceMilestones;
- (NSMutableDictionary)milestones;
- (NSString)deviceSectionName;
- (NSString)hostProcessBundleIdentifier;
- (NSString)sessionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)addParameterFor:(id)a3 value:(id)a4;
- (void)markMilestoneFor:(id)a3;
- (void)markMilestoneFor:(id)a3 withTimestamp:(id)a4;
- (void)markMilestoneForPath:(id)a3;
- (void)setParameterFor:(id)a3 value:(id)a4;
- (void)setParameterForPath:(id)a3 value:(id)a4;
@end

@implementation HMDCameraSessionID

- (id)description
{
  return objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDCameraSessionID *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(HMDCameraSessionID *)self sessionID];
      v6 = [(HMDCameraSessionID *)v4 sessionID];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (void)markMilestoneFor:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() uptimeNumberInMilliseconds];
  [(HMDCameraSessionID *)self markMilestoneFor:v4 withTimestamp:v5];
}

- (void)markMilestoneFor:(id)a3 withTimestamp:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDCameraSessionID *)self deviceMilestones];
  [v8 setObject:v6 forKeyedSubscript:v7];
}

- (NSMutableDictionary)deviceMilestones
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

+ (NSNumber)uptimeNumberInMilliseconds
{
  v2 = NSNumber;
  uint64_t v3 = [a1 uptimeInMilliseconds];
  return (NSNumber *)[v2 numberWithInteger:v3];
}

+ (int64_t)uptimeInMilliseconds
{
  HMFUptime();
  return (uint64_t)(v2 * 1000.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceMilestones, 0);
  objc_storeStrong((id *)&self->_deviceSectionName, 0);
  objc_storeStrong((id *)&self->_milestones, 0);
  objc_storeStrong((id *)&self->_hostProcessBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

+ (id)hostProcessBundleIdentifierForMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 stringForKey:@"kCameraSessionApplicationID"];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    goto LABEL_14;
  }
  uint64_t v7 = [v3 companionAppBundleIdentifier];
  if (v7)
  {
    id v6 = (__CFString *)v7;
    if (!isWatch()) {
      goto LABEL_14;
    }
    if (hostProcessBundleIdentifierForMessage__onceToken != -1) {
      dispatch_once(&hostProcessBundleIdentifierForMessage__onceToken, &__block_literal_global_171773);
    }
    id v8 = [(id)hostProcessBundleIdentifierForMessage__companionAppBundleIdentifierOverrides objectForKeyedSubscript:v6];
    if (v8)
    {
      v9 = v8;

      id v6 = v9;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    uint64_t v10 = [v3 clientIdentifier];
    v9 = (__CFString *)v10;
    v11 = @"kDefaultCameraApplicationIdentifier";
    if (v10) {
      v11 = (__CFString *)v10;
    }
    id v6 = v11;
  }

LABEL_14:
  return v6;
}

- (HMDCameraSessionID)initWithSessionID:(id)a3 hostProcessBundleIdentifier:(id)a4 isSPIClient:(BOOL)a5 deviceSectionName:(id)a6 description:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)HMDCameraSessionID;
  v17 = [(HMDCameraSessionID *)&v30 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sessionID, a3);
    uint64_t v19 = [v14 copy];
    hostProcessBundleIdentifier = v18->_hostProcessBundleIdentifier;
    v18->_hostProcessBundleIdentifier = (NSString *)v19;

    v18->_spiClient = a5;
    uint64_t v21 = [v15 copy];
    deviceSectionName = v18->_deviceSectionName;
    v18->_deviceSectionName = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    description = v18->_description;
    v18->_description = (NSString *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
    deviceMilestones = v18->_deviceMilestones;
    v18->_deviceMilestones = (NSMutableDictionary *)v25;

    uint64_t v27 = [MEMORY[0x1E4F1CA60] dictionary];
    milestones = v18->_milestones;
    v18->_milestones = (NSMutableDictionary *)v27;

    [(NSMutableDictionary *)v18->_milestones setObject:v18->_deviceMilestones forKeyedSubscript:v18->_deviceSectionName];
  }

  return v18;
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isSPIClient
{
  return self->_spiClient;
}

- (NSString)hostProcessBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)deviceSectionName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (HMDCameraSessionID)initWithSessionID:(id)a3 message:(id)a4 description:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[HMDCameraSessionID hostProcessBundleIdentifierForMessage:v9];
  uint64_t v12 = [v9 isEntitledForSPIAccess];
  if (isWatch())
  {
    id v13 = kCameraWatch;
  }
  else if (isTVOSDevice() || isiPadDevice() && ([v9 isRemote] & 1) != 0)
  {
    id v13 = kCameraResident;
  }
  else
  {
    id v13 = &kCameraController;
  }
  id v14 = *v13;
  id v15 = [(HMDCameraSessionID *)self initWithSessionID:v8 hostProcessBundleIdentifier:v11 isSPIClient:v12 deviceSectionName:v14 description:v10];

  return v15;
}

- (NSMutableDictionary)milestones
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)addParameterFor:(id)a3 value:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [(HMDCameraSessionID *)self deviceMilestones];
  id v8 = [v7 objectForKeyedSubscript:v13];

  if (!v8)
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    id v10 = [(HMDCameraSessionID *)self deviceMilestones];
    [v10 setObject:v9 forKeyedSubscript:v13];
  }
  v11 = [(HMDCameraSessionID *)self deviceMilestones];
  uint64_t v12 = [v11 objectForKeyedSubscript:v13];
  [v12 addObject:v6];
}

- (void)setParameterForPath:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDCameraSessionID *)self deviceMilestones];
  id v9 = [v7 firstObject];
  id v11 = [v8 objectForKeyedSubscript:v9];

  id v10 = [v7 lastObject];

  [v11 setObject:v6 forKeyedSubscript:v10];
}

- (void)setParameterFor:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDCameraSessionID *)self deviceMilestones];
  [v8 setObject:v6 forKeyedSubscript:v7];
}

- (void)markMilestoneForPath:(id)a3
{
  id v11 = a3;
  id v4 = [(HMDCameraSessionID *)self deviceMilestones];
  id v5 = [v11 firstObject];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    id v7 = [(HMDCameraSessionID *)self deviceMilestones];
    id v8 = [v11 firstObject];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
  id v9 = [(id)objc_opt_class() uptimeNumberInMilliseconds];
  id v10 = [v11 lastObject];
  [v6 setObject:v9 forKeyedSubscript:v10];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(HMDCameraSessionID *)self sessionID];
  id v6 = [(HMDCameraSessionID *)self hostProcessBundleIdentifier];
  BOOL v7 = [(HMDCameraSessionID *)self isSPIClient];
  id v8 = [(HMDCameraSessionID *)self deviceSectionName];
  id v9 = [(HMDCameraSessionID *)self description];
  id v10 = (void *)[v4 initWithSessionID:v5 hostProcessBundleIdentifier:v6 isSPIClient:v7 deviceSectionName:v8 description:v9];

  return v10;
}

- (unint64_t)hash
{
  double v2 = [(HMDCameraSessionID *)self sessionID];
  unint64_t v3 = [v2 hash];

  return v3;
}

void __60__HMDCameraSessionID_hostProcessBundleIdentifierForMessage___block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  [v2 setObject:*MEMORY[0x1E4F2D1C8] forKeyedSubscript:*MEMORY[0x1E4F2DA38]];
  uint64_t v0 = [v2 copy];
  v1 = (void *)hostProcessBundleIdentifierForMessage__companionAppBundleIdentifierOverrides;
  hostProcessBundleIdentifierForMessage__companionAppBundleIdentifierOverrides = v0;
}

@end