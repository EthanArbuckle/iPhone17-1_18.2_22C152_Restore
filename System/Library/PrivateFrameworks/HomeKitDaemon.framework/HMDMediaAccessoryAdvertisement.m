@interface HMDMediaAccessoryAdvertisement
+ (BOOL)canAirPortExpressSupportMediaAccessory:(id)a3;
- (BOOL)isAssociated;
- (BOOL)matchesWACDeviceID:(id)a3;
- (HMDMediaAccessoryAdvertisement)initWithOutputDevice:(id)a3;
- (HMDMediaOutputDevice)outputDevice;
- (id)description;
- (int64_t)associationOptions;
- (void)setAssociated:(BOOL)a3;
- (void)setOutputDevice:(id)a3;
@end

@implementation HMDMediaAccessoryAdvertisement

- (void).cxx_destruct
{
}

- (int64_t)associationOptions
{
  uint64_t v3 = [(HMDMediaAccessoryAdvertisement *)self outputDevice];
  v4 = [(id)v3 modelID];

  v5 = [(HMDMediaAccessoryAdvertisement *)self outputDevice];
  LOBYTE(v3) = [v5 supportsWHA];

  if ((v3 & 1) != 0
    || !+[HMDMediaAccessoryAdvertisement canAirPortExpressSupportMediaAccessory:v4])
  {
    int64_t v6 = 0;
  }
  else
  {
    int64_t v6 = 2;
  }

  return v6;
}

- (void)setAssociated:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_associated = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isAssociated
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_associated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setOutputDevice:(id)a3
{
  v4 = (HMDMediaOutputDevice *)a3;
  os_unfair_lock_lock_with_options();
  outputDevice = self->_outputDevice;
  self->_outputDevice = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDMediaOutputDevice)outputDevice
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_outputDevice;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)HMDMediaAccessoryAdvertisement;
  v4 = [(HMDAccessoryAdvertisement *)&v9 description];
  v5 = [(HMDMediaAccessoryAdvertisement *)self outputDevice];
  int64_t v6 = [v5 modelID];
  v7 = [v3 stringWithFormat:@"[ %@, modelID = %@]", v4, v6];

  return v7;
}

- (BOOL)matchesWACDeviceID:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccessoryAdvertisement *)self identifier];
  uint64_t v6 = [v5 caseInsensitiveCompare:v4];

  return v6 == 0;
}

- (HMDMediaAccessoryAdvertisement)initWithOutputDevice:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 uniqueIdentifier];
  v7 = [v5 name];
  v8 = [v5 modelID];
  if (+[HMDMediaAccessoryAdvertisement canAirPortExpressSupportMediaAccessory:v8])
  {
    id v9 = objc_alloc(MEMORY[0x263F08C38]);
    v10 = (void *)[v9 initWithUUIDString:*MEMORY[0x263F0B010]];
    v11 = [MEMORY[0x263F0DF40] categoryWithIdentifier:v10];
  }
  else
  {
    v11 = [MEMORY[0x263F0DF40] categoryForProductClass:HMFProductClassFromString()];
  }

  v15.receiver = self;
  v15.super_class = (Class)HMDMediaAccessoryAdvertisement;
  v12 = [(HMDAccessoryAdvertisement *)&v15 initWithIdentifier:v6 name:v7 category:v11];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_outputDevice, a3);
  }

  return v13;
}

+ (BOOL)canAirPortExpressSupportMediaAccessory:(id)a3
{
  return [a3 isEqual:@"AirPort10,115"];
}

@end