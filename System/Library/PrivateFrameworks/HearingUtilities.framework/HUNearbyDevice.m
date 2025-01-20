@interface HUNearbyDevice
+ (id)nearbyDeviceWithIDSDevice:(id)a3;
+ (id)nearbyDeviceWithIDSIdentifier:(id)a3;
- (BOOL)equalsToIdentifier:(id)a3;
- (BOOL)isCompanion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWatch;
- (HUNearbyDevice)initWithIDSDevice:(id)a3;
- (HUNearbyDevice)initWithIDSIdentifier:(id)a3;
- (IDSDevice)idsDevice;
- (NSMutableArray)registeredDomains;
- (NSMutableArray)updateDomains;
- (NSMutableDictionary)state;
- (NSString)identifierWithoutDevice;
- (id)description;
- (id)deviceTypeDescription;
- (id)identifier;
- (id)name;
- (id)stateForDomain:(id)a3;
- (id)uniqueIdentifier;
- (void)setIdentifierWithoutDevice:(id)a3;
- (void)setIdsDevice:(id)a3;
- (void)setRegisteredDomains:(id)a3;
- (void)setState:(id)a3;
- (void)setState:(id)a3 forDomain:(id)a4;
- (void)setUpdateDomains:(id)a3;
@end

@implementation HUNearbyDevice

+ (id)nearbyDeviceWithIDSDevice:(id)a3
{
  id v3 = a3;
  v4 = [[HUNearbyDevice alloc] initWithIDSDevice:v3];

  return v4;
}

+ (id)nearbyDeviceWithIDSIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[HUNearbyDevice alloc] initWithIDSIdentifier:v3];

  return v4;
}

- (HUNearbyDevice)initWithIDSDevice:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUNearbyDevice;
  v5 = [(HUNearbyDevice *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(HUNearbyDevice *)v5 setIdsDevice:v4];
    v7 = [MEMORY[0x263EFF980] array];
    [(HUNearbyDevice *)v6 setRegisteredDomains:v7];

    v8 = [MEMORY[0x263EFF980] array];
    [(HUNearbyDevice *)v6 setUpdateDomains:v8];

    v9 = [MEMORY[0x263EFF9A0] dictionary];
    [(HUNearbyDevice *)v6 setState:v9];
  }
  return v6;
}

- (HUNearbyDevice)initWithIDSIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUNearbyDevice;
  v5 = [(HUNearbyDevice *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(HUNearbyDevice *)v5 setIdentifierWithoutDevice:v4];
    v7 = [MEMORY[0x263EFF980] array];
    [(HUNearbyDevice *)v6 setRegisteredDomains:v7];

    v8 = [MEMORY[0x263EFF980] array];
    [(HUNearbyDevice *)v6 setUpdateDomains:v8];

    v9 = [MEMORY[0x263EFF9A0] dictionary];
    [(HUNearbyDevice *)v6 setState:v9];
  }
  return v6;
}

- (id)name
{
  v2 = [(HUNearbyDevice *)self idsDevice];
  id v3 = [v2 name];

  return v3;
}

- (id)identifier
{
  id v3 = [(HUNearbyDevice *)self idsDevice];

  if (v3)
  {
    id v4 = [(HUNearbyDevice *)self idsDevice];
    v5 = (void *)IDSCopyIDForDevice();
  }
  else
  {
    v5 = [(HUNearbyDevice *)self identifierWithoutDevice];
  }

  return v5;
}

- (id)uniqueIdentifier
{
  id v3 = [(HUNearbyDevice *)self idsDevice];

  if (v3)
  {
    id v4 = [(HUNearbyDevice *)self idsDevice];
    v5 = [v4 uniqueID];
  }
  else
  {
    v5 = [(HUNearbyDevice *)self identifierWithoutDevice];
  }

  return v5;
}

- (BOOL)equalsToIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(HUNearbyDevice *)self identifier];
    if ([v5 containsString:v4])
    {
      char v6 = 1;
    }
    else
    {
      v7 = [(HUNearbyDevice *)self uniqueIdentifier];
      char v6 = [v7 containsString:v4];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 identifier];
    char v6 = [(HUNearbyDevice *)self identifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isCompanion
{
  v2 = [(HUNearbyDevice *)self idsDevice];
  char v3 = [v2 isDefaultPairedDevice];

  return v3;
}

- (BOOL)isWatch
{
  v2 = [(HUNearbyDevice *)self idsDevice];
  BOOL v3 = [v2 deviceType] == 6;

  return v3;
}

- (void)setState:(id)a3 forDomain:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    v8 = [(HUNearbyDevice *)self state];
    id v9 = (id)[v8 mutableCopy];

    [v9 setObject:v7 forKey:v6];
    [(HUNearbyDevice *)self setState:v9];
  }
}

- (id)stateForDomain:(id)a3
{
  id v4 = a3;
  v5 = [(HUNearbyDevice *)self state];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)deviceTypeDescription
{
  v2 = [(HUNearbyDevice *)self idsDevice];
  uint64_t v3 = [v2 deviceType];

  uint64_t v4 = v3 - 1;
  if (unint64_t)(v3 - 1) < 6 && ((0x2Bu >> v4))
  {
    v5 = off_2640FF150[v4];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"DeviceType: %ld", v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(HUNearbyDevice *)self name];
  v5 = [(HUNearbyDevice *)self identifier];
  id v6 = [(HUNearbyDevice *)self deviceTypeDescription];
  id v7 = [(HUNearbyDevice *)self state];
  v8 = [v3 stringWithFormat:@"%@ [%@] %@ - %@", v4, v5, v6, v7];

  return v8;
}

- (IDSDevice)idsDevice
{
  return self->_idsDevice;
}

- (void)setIdsDevice:(id)a3
{
}

- (NSMutableArray)registeredDomains
{
  return self->_registeredDomains;
}

- (void)setRegisteredDomains:(id)a3
{
}

- (NSMutableArray)updateDomains
{
  return self->_updateDomains;
}

- (void)setUpdateDomains:(id)a3
{
}

- (NSMutableDictionary)state
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setState:(id)a3
{
}

- (NSString)identifierWithoutDevice
{
  return self->_identifierWithoutDevice;
}

- (void)setIdentifierWithoutDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierWithoutDevice, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_updateDomains, 0);
  objc_storeStrong((id *)&self->_registeredDomains, 0);

  objc_storeStrong((id *)&self->_idsDevice, 0);
}

@end