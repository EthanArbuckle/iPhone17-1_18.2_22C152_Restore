@interface HUAccessorySetupFlow
- (HUAccessorySetupFlow)initWithType:(id)a3 homeKitObjects:(id)a4;
- (NSArray)homeKitObjects;
- (NSString)type;
- (id)description;
@end

@implementation HUAccessorySetupFlow

- (HUAccessorySetupFlow)initWithType:(id)a3 homeKitObjects:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUAccessorySetupFlow;
  v9 = [(HUAccessorySetupFlow *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    objc_storeStrong((id *)&v10->_homeKitObjects, a4);
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  v4 = [(HUAccessorySetupFlow *)self type];
  [v3 appendString:v4 withName:@"type"];

  v5 = [(HUAccessorySetupFlow *)self homeKitObjects];
  id v6 = (id)[v3 appendObject:v5 withName:@"homeKitObjects"];

  id v7 = [v3 build];

  return v7;
}

- (NSString)type
{
  return self->_type;
}

- (NSArray)homeKitObjects
{
  return self->_homeKitObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitObjects, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end