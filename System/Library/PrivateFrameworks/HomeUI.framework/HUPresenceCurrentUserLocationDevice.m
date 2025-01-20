@interface HUPresenceCurrentUserLocationDevice
+ (id)FMFDevice;
+ (id)currentDevice;
+ (id)customDeviceWithHMDevice:(id)a3;
- (HMDevice)customDevice;
- (HUPresenceCurrentUserLocationDevice)initWithType:(unint64_t)a3 customDevice:(id)a4;
- (unint64_t)type;
@end

@implementation HUPresenceCurrentUserLocationDevice

+ (id)FMFDevice
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:0 customDevice:0];

  return v2;
}

+ (id)currentDevice
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:1 customDevice:0];

  return v2;
}

+ (id)customDeviceWithHMDevice:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithType:2 customDevice:v4];

  return v5;
}

- (HUPresenceCurrentUserLocationDevice)initWithType:(unint64_t)a3 customDevice:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUPresenceCurrentUserLocationDevice;
  v8 = [(HUPresenceCurrentUserLocationDevice *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_customDevice, a4);
  }

  return v9;
}

- (unint64_t)type
{
  return self->_type;
}

- (HMDevice)customDevice
{
  return self->_customDevice;
}

- (void).cxx_destruct
{
}

@end