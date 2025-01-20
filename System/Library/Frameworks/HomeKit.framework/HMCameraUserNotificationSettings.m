@interface HMCameraUserNotificationSettings
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isAccessModeChangeNotificationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReachabilityEventNotificationEnabled;
- (BOOL)isSmartBulletinBoardNotificationEnabled;
- (HMCameraUserNotificationSettings)init;
- (HMCameraUserNotificationSettings)initWithCoder:(id)a3;
- (NSArray)attributeDescriptions;
- (NSPredicate)smartBulletinBoardNotificationCondition;
- (NSString)description;
- (NSString)shortDescription;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)version;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessModeChangeNotificationEnabled:(BOOL)a3;
- (void)setReachabilityEventNotificationEnabled:(BOOL)a3;
- (void)setSmartBulletinBoardNotificationCondition:(id)a3;
- (void)setSmartBulletinBoardNotificationEnabled:(BOOL)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation HMCameraUserNotificationSettings

- (void).cxx_destruct
{
}

- (HMCameraUserNotificationSettings)initWithCoder:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMCameraUserNotificationSettings *)self init];
  -[HMCameraUserNotificationSettings setVersion:](v5, "setVersion:", [v4 decodeIntegerForKey:@"HMCPNS.ck.version"]);
  -[HMCameraUserNotificationSettings setAccessModeChangeNotificationEnabled:](v5, "setAccessModeChangeNotificationEnabled:", [v4 decodeBoolForKey:@"HMCPNS.ck.amcne"]);
  -[HMCameraUserNotificationSettings setReachabilityEventNotificationEnabled:](v5, "setReachabilityEventNotificationEnabled:", [v4 decodeBoolForKey:@"HMCPNS.ck.rene"]);
  -[HMCameraUserNotificationSettings setSmartBulletinBoardNotificationEnabled:](v5, "setSmartBulletinBoardNotificationEnabled:", [v4 decodeBoolForKey:@"HMCPNS.ck.sbbne"]);
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HMCPNS.ck.sbbnc"];

  [(HMCameraUserNotificationSettings *)v5 setSmartBulletinBoardNotificationCondition:v9];
  return v5;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void)setSmartBulletinBoardNotificationEnabled:(BOOL)a3
{
  self->_smartBulletinBoardNotificationEnabled = a3;
}

- (void)setSmartBulletinBoardNotificationCondition:(id)a3
{
}

- (void)setReachabilityEventNotificationEnabled:(BOOL)a3
{
  self->_reachabilityEventNotificationEnabled = a3;
}

- (void)setAccessModeChangeNotificationEnabled:(BOOL)a3
{
  self->_accessModeChangeNotificationEnabled = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMCameraUserNotificationSettings version](self, "version"), @"HMCPNS.ck.version");
  objc_msgSend(v4, "encodeBool:forKey:", -[HMCameraUserNotificationSettings isAccessModeChangeNotificationEnabled](self, "isAccessModeChangeNotificationEnabled"), @"HMCPNS.ck.amcne");
  objc_msgSend(v4, "encodeBool:forKey:", -[HMCameraUserNotificationSettings isReachabilityEventNotificationEnabled](self, "isReachabilityEventNotificationEnabled"), @"HMCPNS.ck.rene");
  objc_msgSend(v4, "encodeBool:forKey:", -[HMCameraUserNotificationSettings isSmartBulletinBoardNotificationEnabled](self, "isSmartBulletinBoardNotificationEnabled"), @"HMCPNS.ck.sbbne");
  id v5 = [(HMCameraUserNotificationSettings *)self smartBulletinBoardNotificationCondition];
  [v4 encodeObject:v5 forKey:@"HMCPNS.ck.sbbnc"];
}

- (NSPredicate)smartBulletinBoardNotificationCondition
{
  return (NSPredicate *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isSmartBulletinBoardNotificationEnabled
{
  return self->_smartBulletinBoardNotificationEnabled;
}

- (HMCameraUserNotificationSettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMCameraUserNotificationSettings;
  result = [(HMCameraUserNotificationSettings *)&v3 init];
  if (result) {
    result->_version = 1;
  }
  return result;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)isReachabilityEventNotificationEnabled
{
  return self->_reachabilityEventNotificationEnabled;
}

- (BOOL)isAccessModeChangeNotificationEnabled
{
  return self->_accessModeChangeNotificationEnabled;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMCameraUserNotificationSettings *)self isAccessModeChangeNotificationEnabled];
  id v4 = HMFBooleanToString();
  id v5 = (void *)[v3 initWithName:@"Access Mode Change" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMCameraUserNotificationSettings *)self isReachabilityEventNotificationEnabled];
  v7 = HMFBooleanToString();
  v8 = (void *)[v6 initWithName:@"Reachability Event" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMCameraUserNotificationSettings *)self isSmartBulletinBoardNotificationEnabled];
  v10 = HMFBooleanToString();
  v11 = (void *)[v9 initWithName:@"Smart Bulletin" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = [(HMCameraUserNotificationSettings *)self smartBulletinBoardNotificationCondition];
  v14 = (void *)[v12 initWithName:@"Smart Bulletin Condition" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  return (NSArray *)v15;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(HMMutableCameraUserNotificationSettings);
  [(HMCameraUserNotificationSettings *)v4 setVersion:[(HMCameraUserNotificationSettings *)self version]];
  [(HMCameraUserNotificationSettings *)v4 setAccessModeChangeNotificationEnabled:[(HMCameraUserNotificationSettings *)self isAccessModeChangeNotificationEnabled]];
  [(HMCameraUserNotificationSettings *)v4 setReachabilityEventNotificationEnabled:[(HMCameraUserNotificationSettings *)self isReachabilityEventNotificationEnabled]];
  [(HMCameraUserNotificationSettings *)v4 setSmartBulletinBoardNotificationEnabled:[(HMCameraUserNotificationSettings *)self isSmartBulletinBoardNotificationEnabled]];
  id v5 = [(HMCameraUserNotificationSettings *)self smartBulletinBoardNotificationCondition];
  [(HMCameraUserNotificationSettings *)v4 setSmartBulletinBoardNotificationCondition:v5];

  return v4;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (unint64_t)hash
{
  int64_t v3 = [(HMCameraUserNotificationSettings *)self version];
  int64_t v4 = v3 ^ [(HMCameraUserNotificationSettings *)self isAccessModeChangeNotificationEnabled];
  uint64_t v5 = [(HMCameraUserNotificationSettings *)self isReachabilityEventNotificationEnabled];
  int64_t v6 = v4 ^ v5 ^ [(HMCameraUserNotificationSettings *)self isSmartBulletinBoardNotificationEnabled];
  v7 = [(HMCameraUserNotificationSettings *)self smartBulletinBoardNotificationCondition];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (int64_t v7 = -[HMCameraUserNotificationSettings version](self, "version"), v7 == [v6 version])
    && (v8 = -[HMCameraUserNotificationSettings isAccessModeChangeNotificationEnabled](self, "isAccessModeChangeNotificationEnabled"), v8 == [v6 isAccessModeChangeNotificationEnabled])&& (int v9 = -[HMCameraUserNotificationSettings isReachabilityEventNotificationEnabled](self, "isReachabilityEventNotificationEnabled"), v9 == objc_msgSend(v6, "isReachabilityEventNotificationEnabled"))&& (v10 = -[HMCameraUserNotificationSettings isSmartBulletinBoardNotificationEnabled](self, "isSmartBulletinBoardNotificationEnabled"), v10 == objc_msgSend(v6, "isSmartBulletinBoardNotificationEnabled")))
  {
    v13 = [(HMCameraUserNotificationSettings *)self smartBulletinBoardNotificationCondition];
    v14 = [v6 smartBulletinBoardNotificationCondition];
    char v11 = HMFEqualObjects();
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

@end