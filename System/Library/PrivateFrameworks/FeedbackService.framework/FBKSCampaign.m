@interface FBKSCampaign
- (FBKSCampaign)initWithSwiftObject:(id)a3;
- (FBKSCampaign_FrameworkPrivateName)swiftObject;
- (NSDate)updatedAt;
- (id)description;
- (int64_t)state;
- (void)setSwiftObject:(id)a3;
@end

@implementation FBKSCampaign

- (FBKSCampaign)initWithSwiftObject:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)FBKSCampaign;
    v6 = [(FBKSCampaign *)&v10 init];
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

- (NSDate)updatedAt
{
  v2 = [(FBKSCampaign *)self swiftObject];
  v3 = [v2 updatedAt];

  return (NSDate *)v3;
}

- (int64_t)state
{
  v2 = [(FBKSCampaign *)self swiftObject];
  int64_t v3 = [v2 state];

  return v3;
}

- (id)description
{
  v2 = [(FBKSCampaign *)self swiftObject];
  int64_t v3 = [v2 description];

  return v3;
}

- (FBKSCampaign_FrameworkPrivateName)swiftObject
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