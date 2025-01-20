@interface ASDPurgeAppsRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDPurgeAppsRequestOptions)initWithCoder:(id)a3;
- (ASDPurgeAppsRequestOptions)initWithVolume:(id)a3 urgency:(int64_t)a4;
- (BOOL)offloadOnly;
- (BOOL)performAvailablityCheck;
- (BOOL)skipLaunchCheck;
- (NSArray)apps;
- (NSNumber)desiredPurgeAmount;
- (NSString)volume;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)urgency;
- (void)encodeWithCoder:(id)a3;
- (void)setApps:(id)a3;
- (void)setDesiredPurgeAmount:(id)a3;
- (void)setOffloadOnly:(BOOL)a3;
- (void)setPerformAvailablityCheck:(BOOL)a3;
- (void)setSkipLaunchCheck:(BOOL)a3;
- (void)setUrgency:(int64_t)a3;
- (void)setVolume:(id)a3;
@end

@implementation ASDPurgeAppsRequestOptions

- (ASDPurgeAppsRequestOptions)initWithVolume:(id)a3 urgency:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDPurgeAppsRequestOptions;
  v8 = [(ASDPurgeAppsRequestOptions *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_volume, a3);
    v9->_urgency = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDPurgeAppsRequestOptions allocWithZone:](ASDPurgeAppsRequestOptions, "allocWithZone:") init];
  uint64_t v6 = [(NSArray *)self->_apps copyWithZone:a3];
  apps = v5->_apps;
  v5->_apps = (NSArray *)v6;

  uint64_t v8 = [(NSNumber *)self->_desiredPurgeAmount copyWithZone:a3];
  desiredPurgeAmount = v5->_desiredPurgeAmount;
  v5->_desiredPurgeAmount = (NSNumber *)v8;

  v5->_offloadOnly = self->_offloadOnly;
  v5->_performAvailablityCheck = self->_performAvailablityCheck;
  v5->_skipLaunchCheck = self->_skipLaunchCheck;
  v5->_urgency = self->_urgency;
  uint64_t v10 = [(NSString *)self->_volume copyWithZone:a3];
  volume = v5->_volume;
  v5->_volume = (NSString *)v10;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurgeAppsRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASDPurgeAppsRequestOptions;
  v5 = [(ASDRequestOptions *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"apps"];
    apps = v5->_apps;
    v5->_apps = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"desiredPurgeAmount"];
    desiredPurgeAmount = v5->_desiredPurgeAmount;
    v5->_desiredPurgeAmount = (NSNumber *)v11;

    v5->_offloadOnly = [v4 decodeBoolForKey:@"offloadOnly"];
    v5->_performAvailablityCheck = [v4 decodeBoolForKey:@"performAvailablityCheck"];
    v5->_skipLaunchCheck = [v4 decodeBoolForKey:@"skipLaunchCheck"];
    v5->_urgency = [v4 decodeIntegerForKey:@"urgency"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"volume"];
    volume = v5->_volume;
    v5->_volume = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASDPurgeAppsRequestOptions *)self apps];
  [v4 encodeObject:v5 forKey:@"apps"];

  uint64_t v6 = [(ASDPurgeAppsRequestOptions *)self desiredPurgeAmount];
  [v4 encodeObject:v6 forKey:@"desiredPurgeAmount"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ASDPurgeAppsRequestOptions offloadOnly](self, "offloadOnly"), @"offloadOnly");
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDPurgeAppsRequestOptions performAvailablityCheck](self, "performAvailablityCheck"), @"performAvailablityCheck");
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDPurgeAppsRequestOptions skipLaunchCheck](self, "skipLaunchCheck"), @"skipLaunchCheck");
  objc_msgSend(v4, "encodeInteger:forKey:", -[ASDPurgeAppsRequestOptions urgency](self, "urgency"), @"urgency");
  uint64_t v7 = [(ASDPurgeAppsRequestOptions *)self volume];
  [v4 encodeObject:v7 forKey:@"volume"];

  v8.receiver = self;
  v8.super_class = (Class)ASDPurgeAppsRequestOptions;
  [(ASDRequestOptions *)&v8 encodeWithCoder:v4];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(ASDPurgeAppsRequestOptions *)self urgency];
  uint64_t v6 = [(ASDPurgeAppsRequestOptions *)self desiredPurgeAmount];
  uint64_t v7 = [(ASDPurgeAppsRequestOptions *)self volume];
  BOOL v8 = [(ASDPurgeAppsRequestOptions *)self skipLaunchCheck];
  uint64_t v9 = [(ASDPurgeAppsRequestOptions *)self apps];
  uint64_t v10 = [v9 componentsJoinedByString:@","];
  uint64_t v11 = [v3 stringWithFormat:@"%@ {urgency = %ld, desired = %@ volume: %@ skip launch check: %d apps: [%@]}", v4, v5, v6, v7, v8, v10];

  return v11;
}

- (NSArray)apps
{
  return self->_apps;
}

- (void)setApps:(id)a3
{
}

- (NSNumber)desiredPurgeAmount
{
  return self->_desiredPurgeAmount;
}

- (void)setDesiredPurgeAmount:(id)a3
{
}

- (BOOL)offloadOnly
{
  return self->_offloadOnly;
}

- (void)setOffloadOnly:(BOOL)a3
{
  self->_offloadOnly = a3;
}

- (BOOL)performAvailablityCheck
{
  return self->_performAvailablityCheck;
}

- (void)setPerformAvailablityCheck:(BOOL)a3
{
  self->_performAvailablityCheck = a3;
}

- (BOOL)skipLaunchCheck
{
  return self->_skipLaunchCheck;
}

- (void)setSkipLaunchCheck:(BOOL)a3
{
  self->_skipLaunchCheck = a3;
}

- (int64_t)urgency
{
  return self->_urgency;
}

- (void)setUrgency:(int64_t)a3
{
  self->_urgency = a3;
}

- (NSString)volume
{
  return self->_volume;
}

- (void)setVolume:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_desiredPurgeAmount, 0);
  objc_storeStrong((id *)&self->_apps, 0);
}

@end