@interface HMDEventTriggerDevice
- (BOOL)isCurrentDevice;
- (BOOL)isEqual:(id)a3;
- (HMDDevice)device;
- (HMDEventTriggerDevice)initWithCurrentDeviceForHome:(id)a3;
- (HMDEventTriggerDevice)initWithDevice:(id)a3 forHome:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation HMDEventTriggerDevice

- (void).cxx_destruct
{
}

- (BOOL)isCurrentDevice
{
  return self->_currentDevice;
}

- (HMDDevice)device
{
  return self->_device;
}

- (unint64_t)hash
{
  v3 = [(HMDEventTriggerDevice *)self device];

  if (!v3) {
    return 1;
  }
  v4 = [(HMDEventTriggerDevice *)self device];
  unint64_t v5 = [v4 hash];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDEventTriggerDevice *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(HMDEventTriggerDevice *)self device];
      if (v7)
      {
      }
      else
      {
        v9 = [(HMDEventTriggerDevice *)v6 device];

        if (!v9)
        {
          char v8 = 1;
          goto LABEL_12;
        }
      }
      v10 = [(HMDEventTriggerDevice *)self device];
      v11 = [(HMDEventTriggerDevice *)v6 device];
      char v8 = HMFEqualObjects();
    }
    else
    {
      char v8 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  char v8 = 1;
LABEL_13:

  return v8;
}

- (id)description
{
  v3 = [(HMDEventTriggerDevice *)self device];

  v4 = NSString;
  if (v3)
  {
    unint64_t v5 = [(HMDEventTriggerDevice *)self device];
    v6 = [v4 stringWithFormat:@"[Event-trigger-device: %@]", v5];
  }
  else
  {
    v6 = [NSString stringWithFormat:@"[Event-trigger-device: THIS-DEVICE]"];
  }
  return v6;
}

- (HMDEventTriggerDevice)initWithDevice:(id)a3 forHome:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDEventTriggerDevice;
  v7 = [(HMDEventTriggerDevice *)&v10 init];
  char v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_device, a3);
    v8->_currentDevice = [v6 isCurrentDevice];
  }

  return v8;
}

- (HMDEventTriggerDevice)initWithCurrentDeviceForHome:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HMDEventTriggerDevice;
  v3 = [(HMDEventTriggerDevice *)&v8 init];
  if (v3)
  {
    v4 = +[HMDAppleAccountManager sharedManager];
    uint64_t v5 = [v4 device];
    device = v3->_device;
    v3->_device = (HMDDevice *)v5;

    v3->_currentDevice = 1;
  }
  return v3;
}

@end