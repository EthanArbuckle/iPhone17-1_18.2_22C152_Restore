@interface CRKOpenAppRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)lockInApp;
- (CRKOpenAppRequest)initWithCoder:(id)a3;
- (NSData)activityData;
- (NSString)activityType;
- (NSString)bundleIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityData:(id)a3;
- (void)setActivityType:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setLockInApp:(BOOL)a3;
@end

@implementation CRKOpenAppRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKOpenAppRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRKOpenAppRequest;
  v5 = [(CATTaskRequest *)&v17 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"activityType"];
    activityType = v5->_activityType;
    v5->_activityType = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"activityData"];
    activityData = v5->_activityData;
    v5->_activityData = (NSData *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lockInApp"];
    v5->_lockInApp = [v15 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRKOpenAppRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v9 encodeWithCoder:v4];
  v5 = [(CRKOpenAppRequest *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  v6 = [(CRKOpenAppRequest *)self activityType];
  [v4 encodeObject:v6 forKey:@"activityType"];

  uint64_t v7 = [(CRKOpenAppRequest *)self activityData];
  [v4 encodeObject:v7 forKey:@"activityData"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKOpenAppRequest lockInApp](self, "lockInApp"));
  [v4 encodeObject:v8 forKey:@"lockInApp"];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
}

- (NSData)activityData
{
  return self->_activityData;
}

- (void)setActivityData:(id)a3
{
}

- (BOOL)lockInApp
{
  return self->_lockInApp;
}

- (void)setLockInApp:(BOOL)a3
{
  self->_lockInApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityData, 0);
  objc_storeStrong((id *)&self->_activityType, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end