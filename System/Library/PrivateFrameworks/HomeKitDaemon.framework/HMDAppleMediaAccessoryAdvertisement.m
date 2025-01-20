@interface HMDAppleMediaAccessoryAdvertisement
- (HMDAppleMediaAccessoryAdvertisement)initWithOutputDevice:(id)a3 device:(id)a4;
- (HMDDevice)device;
- (id)description;
@end

@implementation HMDAppleMediaAccessoryAdvertisement

- (void).cxx_destruct
{
}

- (HMDDevice)device
{
  return (HMDDevice *)objc_getProperty(self, a2, 48, 1);
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDAppleMediaAccessoryAdvertisement;
  v4 = [(HMDMediaAccessoryAdvertisement *)&v8 description];
  v5 = [(HMDAppleMediaAccessoryAdvertisement *)self device];
  v6 = [v3 stringWithFormat:@"[ %@, device = %@]", v4, v5];

  return v6;
}

- (HMDAppleMediaAccessoryAdvertisement)initWithOutputDevice:(id)a3 device:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDAppleMediaAccessoryAdvertisement;
  objc_super v8 = [(HMDMediaAccessoryAdvertisement *)&v11 initWithOutputDevice:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_device, a4);
  }

  return v9;
}

@end