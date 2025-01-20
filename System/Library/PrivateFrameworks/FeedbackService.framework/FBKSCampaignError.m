@interface FBKSCampaignError
- (FBKSCampaignError)initWithSwiftObject:(id)a3;
- (FBKSCampaignError_FrameworkPrivateName)swiftObject;
- (NSDate)date;
- (NSString)domain;
- (NSString)errorDescription;
- (id)description;
- (int64_t)code;
- (void)setSwiftObject:(id)a3;
@end

@implementation FBKSCampaignError

- (FBKSCampaignError)initWithSwiftObject:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)FBKSCampaignError;
    v6 = [(FBKSCampaignError *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_swiftObject, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSDate)date
{
  v2 = [(FBKSCampaignError *)self swiftObject];
  v3 = [v2 date];

  return (NSDate *)v3;
}

- (int64_t)code
{
  v2 = [(FBKSCampaignError *)self swiftObject];
  int64_t v3 = [v2 code];

  return v3;
}

- (NSString)domain
{
  v2 = [(FBKSCampaignError *)self swiftObject];
  int64_t v3 = [v2 domain];

  return (NSString *)v3;
}

- (NSString)errorDescription
{
  v2 = [(FBKSCampaignError *)self swiftObject];
  int64_t v3 = [v2 errorDescription];

  return (NSString *)v3;
}

- (id)description
{
  v2 = [(FBKSCampaignError *)self swiftObject];
  int64_t v3 = [v2 description];

  return v3;
}

- (FBKSCampaignError_FrameworkPrivateName)swiftObject
{
  return self->_swiftObject;
}

- (void)setSwiftObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end