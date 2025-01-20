@interface HMDUserType3Focus
- (BOOL)isEnabled;
- (BOOL)isUserActionTriggered;
- (HMDUserType3Focus)initWithEnabled:(BOOL)a3 updatedTime:(id)a4 userActionTriggered:(BOOL)a5;
- (NSDate)updatedTime;
- (id)attributeDescriptions;
@end

@implementation HMDUserType3Focus

- (void).cxx_destruct
{
}

- (BOOL)isUserActionTriggered
{
  return self->_userActionTriggered;
}

- (NSDate)updatedTime
{
  return self->_updatedTime;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)attributeDescriptions
{
  v15[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDUserType3Focus *)self isEnabled];
  v4 = HMFBooleanToString();
  v5 = (void *)[v3 initWithName:@"Enabled" value:v4];
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDUserType3Focus *)self updatedTime];
  v8 = objc_msgSend(v7, "hmf_localTimeDescription");
  v9 = (void *)[v6 initWithName:@"Updated Time" value:v8];
  v15[1] = v9;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDUserType3Focus *)self isUserActionTriggered];
  v11 = HMFBooleanToString();
  v12 = (void *)[v10 initWithName:@"User Action Triggered" value:v11];
  v15[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

  return v13;
}

- (HMDUserType3Focus)initWithEnabled:(BOOL)a3 updatedTime:(id)a4 userActionTriggered:(BOOL)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDUserType3Focus;
  id v10 = [(HMDUserType3Focus *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_enabled = a3;
    objc_storeStrong((id *)&v10->_updatedTime, a4);
    v11->_userActionTriggered = a5;
  }

  return v11;
}

@end