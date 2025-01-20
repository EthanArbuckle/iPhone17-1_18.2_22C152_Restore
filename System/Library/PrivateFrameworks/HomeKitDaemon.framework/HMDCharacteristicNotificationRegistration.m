@interface HMDCharacteristicNotificationRegistration
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (HMDCharacteristicNotificationRegistration)initWithAccessoryUUID:(id)a3 characteristicInstanceID:(id)a4 deviceIdsDestination:(id)a5 userUUID:(id)a6 lastModified:(id)a7 enabled:(BOOL)a8 notificationThreshold:(id)a9;
- (NSDate)lastModified;
- (NSNumber)characteristicInstanceID;
- (NSNumber)notificationThreshold;
- (NSString)deviceIdsDestination;
- (NSUUID)accessoryUUID;
- (NSUUID)userUUID;
- (id)attributeDescriptions;
- (unint64_t)hash;
@end

@implementation HMDCharacteristicNotificationRegistration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationThreshold, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_deviceIdsDestination, 0);
  objc_storeStrong((id *)&self->_characteristicInstanceID, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (NSNumber)notificationThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSDate)lastModified
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)deviceIdsDestination
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)characteristicInstanceID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v23[6] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v22 = [(HMDCharacteristicNotificationRegistration *)self accessoryUUID];
  v21 = (void *)[v3 initWithName:@"Accessory UUID" value:v22];
  v23[0] = v21;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v20 = [(HMDCharacteristicNotificationRegistration *)self characteristicInstanceID];
  v5 = (void *)[v4 initWithName:@"Characteristic Instance ID" value:v20];
  v23[1] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDCharacteristicNotificationRegistration *)self deviceIdsDestination];
  v8 = (void *)[v6 initWithName:@"Device IDS Destination" value:v7];
  v23[2] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = [(HMDCharacteristicNotificationRegistration *)self userUUID];
  v11 = (void *)[v9 initWithName:@"User UUID" value:v10];
  v23[3] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = [(HMDCharacteristicNotificationRegistration *)self lastModified];
  v14 = (void *)[v12 initWithName:@"Last Modified" value:v13];
  v23[4] = v14;
  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDCharacteristicNotificationRegistration *)self enabled];
  v16 = HMFBooleanToString();
  v17 = (void *)[v15 initWithName:@"Enabled" value:v16];
  v23[5] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:6];

  return v18;
}

- (unint64_t)hash
{
  id v3 = [(HMDCharacteristicNotificationRegistration *)self accessoryUUID];
  uint64_t v4 = [v3 hash];
  v5 = [(HMDCharacteristicNotificationRegistration *)self characteristicInstanceID];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HMDCharacteristicNotificationRegistration *)self deviceIdsDestination];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMDCharacteristicNotificationRegistration *)a3;
  if (v4 == self)
  {
    LOBYTE(v19) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6)
    {
      v7 = [(HMDCharacteristicNotificationRegistration *)self accessoryUUID];
      unint64_t v8 = [(HMDCharacteristicNotificationRegistration *)v6 accessoryUUID];
      if ([v7 isEqual:v8])
      {
        id v9 = [(HMDCharacteristicNotificationRegistration *)self characteristicInstanceID];
        v10 = [(HMDCharacteristicNotificationRegistration *)v6 characteristicInstanceID];
        if ([v9 isEqual:v10])
        {
          v11 = [(HMDCharacteristicNotificationRegistration *)self deviceIdsDestination];
          id v12 = [(HMDCharacteristicNotificationRegistration *)v6 deviceIdsDestination];
          if ([v11 isEqual:v12])
          {
            v13 = [(HMDCharacteristicNotificationRegistration *)self userUUID];
            v22 = [(HMDCharacteristicNotificationRegistration *)v6 userUUID];
            v23 = v13;
            if ([v13 isEqual:v22])
            {
              uint64_t v14 = [(HMDCharacteristicNotificationRegistration *)self lastModified];
              uint64_t v15 = [(HMDCharacteristicNotificationRegistration *)v6 lastModified];
              v21 = (void *)v14;
              v16 = (void *)v14;
              v17 = (void *)v15;
              if ([v16 isEqual:v15])
              {
                BOOL v18 = [(HMDCharacteristicNotificationRegistration *)self enabled];
                BOOL v19 = v18 ^ [(HMDCharacteristicNotificationRegistration *)v6 enabled] ^ 1;
              }
              else
              {
                LOBYTE(v19) = 0;
              }
            }
            else
            {
              LOBYTE(v19) = 0;
            }
          }
          else
          {
            LOBYTE(v19) = 0;
          }
        }
        else
        {
          LOBYTE(v19) = 0;
        }
      }
      else
      {
        LOBYTE(v19) = 0;
      }
    }
    else
    {
      LOBYTE(v19) = 0;
    }
  }
  return v19;
}

- (HMDCharacteristicNotificationRegistration)initWithAccessoryUUID:(id)a3 characteristicInstanceID:(id)a4 deviceIdsDestination:(id)a5 userUUID:(id)a6 lastModified:(id)a7 enabled:(BOOL)a8 notificationThreshold:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  v31.receiver = self;
  v31.super_class = (Class)HMDCharacteristicNotificationRegistration;
  v21 = [(HMDCharacteristicNotificationRegistration *)&v31 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_accessoryUUID, a3);
    uint64_t v23 = HAPInstanceIDFromValue();
    characteristicInstanceID = v22->_characteristicInstanceID;
    v22->_characteristicInstanceID = (NSNumber *)v23;

    uint64_t v25 = [v17 copy];
    deviceIdsDestination = v22->_deviceIdsDestination;
    v22->_deviceIdsDestination = (NSString *)v25;

    objc_storeStrong((id *)&v22->_userUUID, a6);
    objc_storeStrong((id *)&v22->_lastModified, a7);
    v22->_enabled = a8;
    uint64_t v27 = [v20 copy];
    notificationThreshold = v22->_notificationThreshold;
    v22->_notificationThreshold = (NSNumber *)v27;
  }
  return v22;
}

@end