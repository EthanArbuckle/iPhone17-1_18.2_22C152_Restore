@interface HMDAccessoryNetworkProtectionGroupRecord
+ (id)recordWithGroup:(id)a3 active:(BOOL)a4 persisted:(BOOL)a5;
- (BOOL)isActive;
- (BOOL)isPersisted;
- (HMDAccessoryNetworkProtectionGroup)group;
- (HMDAccessoryNetworkProtectionGroupRecord)initWithGroup:(id)a3 active:(BOOL)a4 persisted:(BOOL)a5;
- (void)setActive:(BOOL)a3;
- (void)setPersisted:(BOOL)a3;
@end

@implementation HMDAccessoryNetworkProtectionGroupRecord

- (void).cxx_destruct
{
}

- (HMDAccessoryNetworkProtectionGroup)group
{
  return (HMDAccessoryNetworkProtectionGroup *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPersisted:(BOOL)a3
{
  self->_persisted = a3;
}

- (BOOL)isPersisted
{
  return self->_persisted;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (HMDAccessoryNetworkProtectionGroupRecord)initWithGroup:(id)a3 active:(BOOL)a4 persisted:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDAccessoryNetworkProtectionGroupRecord;
  v10 = [(HMDAccessoryNetworkProtectionGroupRecord *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_active = a4;
    v10->_persisted = a5;
    objc_storeStrong((id *)&v10->_group, a3);
  }

  return v11;
}

+ (id)recordWithGroup:(id)a3 active:(BOOL)a4 persisted:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  v8 = [[HMDAccessoryNetworkProtectionGroupRecord alloc] initWithGroup:v7 active:v6 persisted:v5];

  return v8;
}

@end