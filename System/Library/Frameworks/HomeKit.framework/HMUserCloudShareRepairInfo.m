@interface HMUserCloudShareRepairInfo
+ (BOOL)supportsSecureCoding;
- (HMUserCloudShareRepairInfo)init;
- (HMUserCloudShareRepairInfo)initWithCoder:(id)a3;
- (HMUserCloudShareRepairInfo)initWithIdentifier:(id)a3 version:(int64_t)a4;
- (NSUUID)identifier;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMUserCloudShareRepairInfo

- (void).cxx_destruct
{
}

- (int64_t)version
{
  return self->_version;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMUserCloudShareRepairInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];

  if (v6) {
    uint64_t v7 = [v6 integerValue];
  }
  else {
    uint64_t v7 = 1;
  }
  v8 = [(HMUserCloudShareRepairInfo *)self initWithIdentifier:v5 version:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMUserCloudShareRepairInfo *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(NSNumber, "numberWithInteger:", -[HMUserCloudShareRepairInfo version](self, "version"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"version"];
}

- (HMUserCloudShareRepairInfo)init
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [(HMUserCloudShareRepairInfo *)self initWithIdentifier:v3 version:1];

  return v4;
}

- (HMUserCloudShareRepairInfo)initWithIdentifier:(id)a3 version:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMUserCloudShareRepairInfo;
  v8 = [(HMUserCloudShareRepairInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_version = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end