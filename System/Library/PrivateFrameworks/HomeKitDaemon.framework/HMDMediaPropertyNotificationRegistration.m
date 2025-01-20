@interface HMDMediaPropertyNotificationRegistration
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (HMDMediaPropertyNotificationRegistration)initWithMediaProfileUniqueIdentifier:(id)a3 mediaProperty:(id)a4 deviceIdsDestination:(id)a5 userUUID:(id)a6 lastModified:(id)a7 enabled:(BOOL)a8;
- (NSDate)lastModified;
- (NSString)deviceIdsDestination;
- (NSString)mediaProperty;
- (NSUUID)mediaProfileUniqueIdentifier;
- (NSUUID)userUUID;
- (id)attributeDescriptions;
- (unint64_t)hash;
@end

@implementation HMDMediaPropertyNotificationRegistration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_deviceIdsDestination, 0);
  objc_storeStrong((id *)&self->_mediaProperty, 0);
  objc_storeStrong((id *)&self->_mediaProfileUniqueIdentifier, 0);
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

- (NSString)mediaProperty
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)mediaProfileUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v23[6] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v22 = [(HMDMediaPropertyNotificationRegistration *)self mediaProfileUniqueIdentifier];
  v21 = (void *)[v3 initWithName:@"Media Profile Unique Identifier" value:v22];
  v23[0] = v21;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v20 = [(HMDMediaPropertyNotificationRegistration *)self mediaProperty];
  v5 = (void *)[v4 initWithName:@"Media Property" value:v20];
  v23[1] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDMediaPropertyNotificationRegistration *)self deviceIdsDestination];
  v8 = (void *)[v6 initWithName:@"Device IDS Destination" value:v7];
  v23[2] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = [(HMDMediaPropertyNotificationRegistration *)self userUUID];
  v11 = (void *)[v9 initWithName:@"User UUID" value:v10];
  v23[3] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = [(HMDMediaPropertyNotificationRegistration *)self lastModified];
  v14 = (void *)[v12 initWithName:@"Last Modified" value:v13];
  v23[4] = v14;
  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDMediaPropertyNotificationRegistration *)self enabled];
  v16 = HMFBooleanToString();
  v17 = (void *)[v15 initWithName:@"Enabled" value:v16];
  v23[5] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:6];

  return v18;
}

- (unint64_t)hash
{
  id v3 = [(HMDMediaPropertyNotificationRegistration *)self mediaProfileUniqueIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(HMDMediaPropertyNotificationRegistration *)self mediaProperty];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HMDMediaPropertyNotificationRegistration *)self deviceIdsDestination];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMDMediaPropertyNotificationRegistration *)a3;
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
      v7 = [(HMDMediaPropertyNotificationRegistration *)self mediaProfileUniqueIdentifier];
      unint64_t v8 = [(HMDMediaPropertyNotificationRegistration *)v6 mediaProfileUniqueIdentifier];
      if ([v7 isEqual:v8])
      {
        id v9 = [(HMDMediaPropertyNotificationRegistration *)self mediaProperty];
        v10 = [(HMDMediaPropertyNotificationRegistration *)v6 mediaProperty];
        if ([v9 isEqual:v10])
        {
          v11 = [(HMDMediaPropertyNotificationRegistration *)self deviceIdsDestination];
          id v12 = [(HMDMediaPropertyNotificationRegistration *)v6 deviceIdsDestination];
          if ([v11 isEqual:v12])
          {
            v13 = [(HMDMediaPropertyNotificationRegistration *)self userUUID];
            v22 = [(HMDMediaPropertyNotificationRegistration *)v6 userUUID];
            v23 = v13;
            if ([v13 isEqual:v22])
            {
              uint64_t v14 = [(HMDMediaPropertyNotificationRegistration *)self lastModified];
              uint64_t v15 = [(HMDMediaPropertyNotificationRegistration *)v6 lastModified];
              v21 = (void *)v14;
              v16 = (void *)v14;
              v17 = (void *)v15;
              if ([v16 isEqual:v15])
              {
                BOOL v18 = [(HMDMediaPropertyNotificationRegistration *)self enabled];
                BOOL v19 = v18 ^ [(HMDMediaPropertyNotificationRegistration *)v6 enabled] ^ 1;
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

- (HMDMediaPropertyNotificationRegistration)initWithMediaProfileUniqueIdentifier:(id)a3 mediaProperty:(id)a4 deviceIdsDestination:(id)a5 userUUID:(id)a6 lastModified:(id)a7 enabled:(BOOL)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDMediaPropertyNotificationRegistration;
  BOOL v18 = [(HMDMediaPropertyNotificationRegistration *)&v23 init];
  BOOL v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_mediaProfileUniqueIdentifier, a3);
    objc_storeStrong((id *)&v19->_mediaProperty, a4);
    objc_storeStrong((id *)&v19->_deviceIdsDestination, a5);
    objc_storeStrong((id *)&v19->_userUUID, a6);
    objc_storeStrong((id *)&v19->_lastModified, a7);
    v19->_enabled = a8;
  }

  return v19;
}

@end