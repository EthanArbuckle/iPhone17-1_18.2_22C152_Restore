@interface HMDDeviceRegistrationEntry
- (BOOL)isEqual:(id)a3;
- (HMDDevice)device;
- (HMDDeviceRegistrationEntry)initWithDevice:(id)a3 accessoryList:(id)a4;
- (NSArray)accessoryUUIDList;
@end

@implementation HMDDeviceRegistrationEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUUIDList, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (NSArray)accessoryUUIDList
{
  return self->_accessoryUUIDList;
}

- (HMDDevice)device
{
  return self->_device;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDDeviceRegistrationEntry *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HMDDeviceRegistrationEntry *)self device];
      v7 = [(HMDDeviceRegistrationEntry *)v5 device];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (HMDDeviceRegistrationEntry)initWithDevice:(id)a3 accessoryList:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDDeviceRegistrationEntry;
  v9 = [(HMDDeviceRegistrationEntry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_accessoryUUIDList, a4);
  }

  return v10;
}

@end