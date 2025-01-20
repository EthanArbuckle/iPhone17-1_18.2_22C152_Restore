@interface HMDAppleAccessoryPairingHomeState
+ (BOOL)supportsSecureCoding;
- (HMBCloudZoneID)cloudZoneID;
- (HMDAppleAccessoryPairingHomeState)initWithCloudZoneID:(id)a3 accessory:(id)a4;
- (HMDAppleAccessoryPairingHomeState)initWithCoder:(id)a3;
- (HMDDevice)device;
- (HMDUnassociatedAppleMediaAccessory)accessory;
- (HMSoftwareUpdateDescriptor)lastPostedSoftwareUpdateDescriptor;
- (NSUUID)deviceIdentifier;
- (NSUUID)homeUUID;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setHomeUUID:(id)a3;
- (void)setLastPostedSoftwareUpdateDescriptor:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation HMDAppleAccessoryPairingHomeState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_cloudZoneID, 0);
  objc_storeStrong((id *)&self->_lastPostedSoftwareUpdateDescriptor, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

- (HMDUnassociatedAppleMediaAccessory)accessory
{
  return self->_accessory;
}

- (HMBCloudZoneID)cloudZoneID
{
  return self->_cloudZoneID;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAppleAccessoryPairingHomeState *)self cloudZoneID];
  [v4 encodeObject:v5 forKey:@"AAPS.cz"];

  v6 = [(HMDAppleAccessoryPairingHomeState *)self accessory];
  [v4 encodeObject:v6 forKey:@"AAPS.a"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDAppleAccessoryPairingHomeState state](self, "state"), @"AAPS.st");
  v7 = [(HMDAppleAccessoryPairingHomeState *)self homeUUID];
  [v4 encodeObject:v7 forKey:@"AAPS.hu"];

  v8 = [(HMDAppleAccessoryPairingHomeState *)self deviceIdentifier];
  [v4 encodeObject:v8 forKey:@"AAPS.du"];

  id v9 = [(HMDAppleAccessoryPairingHomeState *)self device];
  [v4 encodeObject:v9 forKey:@"AAPS.d"];
}

- (HMDAppleAccessoryPairingHomeState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AAPS.cz"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"AAPS.st"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AAPS.a"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AAPS.d"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AAPS.du"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AAPS.hu"];

  v11 = [(HMDAppleAccessoryPairingHomeState *)self initWithCloudZoneID:v5 accessory:v7];
  v12 = v11;
  if (v11)
  {
    v11->_state = v6;
    objc_storeStrong((id *)&v11->_homeUUID, v10);
    objc_storeStrong((id *)&v12->_deviceIdentifier, v9);
    objc_storeStrong((id *)&v12->_device, v8);
  }

  return v12;
}

- (void)setDeviceIdentifier:(id)a3
{
  id v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  deviceIdentifier = self->_deviceIdentifier;
  self->_deviceIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)deviceIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_deviceIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setState:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_state = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)setHomeUUID:(id)a3
{
  id v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  homeUUID = self->_homeUUID;
  self->_homeUUID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)homeUUID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_homeUUID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDevice:(id)a3
{
  id v4 = (HMDDevice *)a3;
  os_unfair_lock_lock_with_options();
  device = self->_device;
  self->_device = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDDevice)device
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_device;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLastPostedSoftwareUpdateDescriptor:(id)a3
{
  id v4 = (HMSoftwareUpdateDescriptor *)a3;
  os_unfair_lock_lock_with_options();
  lastPostedSoftwareUpdateDescriptor = self->_lastPostedSoftwareUpdateDescriptor;
  self->_lastPostedSoftwareUpdateDescriptor = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMSoftwareUpdateDescriptor)lastPostedSoftwareUpdateDescriptor
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_lastPostedSoftwareUpdateDescriptor;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMDAppleAccessoryPairingHomeState)initWithCloudZoneID:(id)a3 accessory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDAppleAccessoryPairingHomeState;
  id v9 = [(HMDAppleAccessoryPairingHomeState *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cloudZoneID, a3);
    v10->_unint64_t state = 0;
    homeUUID = v10->_homeUUID;
    v10->_homeUUID = 0;

    objc_storeStrong((id *)&v10->_accessory, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end