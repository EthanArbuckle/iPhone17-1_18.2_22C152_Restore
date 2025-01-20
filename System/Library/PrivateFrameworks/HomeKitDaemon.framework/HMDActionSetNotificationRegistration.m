@interface HMDActionSetNotificationRegistration
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (HMDActionSetNotificationRegistration)initWithActionSetUUID:(id)a3 deviceIdsDestination:(id)a4 userUUID:(id)a5 lastModified:(id)a6 enabled:(BOOL)a7;
- (NSDate)lastModified;
- (NSString)deviceIdsDestination;
- (NSUUID)actionSetUUID;
- (NSUUID)userUUID;
- (id)attributeDescriptions;
- (unint64_t)hash;
@end

@implementation HMDActionSetNotificationRegistration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_deviceIdsDestination, 0);
  objc_storeStrong((id *)&self->_actionSetUUID, 0);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSDate)lastModified
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)deviceIdsDestination
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)actionSetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v20[5] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v19 = [(HMDActionSetNotificationRegistration *)self actionSetUUID];
  v4 = (void *)[v3 initWithName:@"Action Set UUID" value:v19];
  v20[0] = v4;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  v6 = [(HMDActionSetNotificationRegistration *)self deviceIdsDestination];
  v7 = (void *)[v5 initWithName:@"Device IDS Destination" value:v6];
  v20[1] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  v9 = [(HMDActionSetNotificationRegistration *)self userUUID];
  v10 = (void *)[v8 initWithName:@"User UUID" value:v9];
  v20[2] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  v12 = [(HMDActionSetNotificationRegistration *)self lastModified];
  v13 = (void *)[v11 initWithName:@"Last Modified" value:v12];
  v20[3] = v13;
  id v14 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDActionSetNotificationRegistration *)self enabled];
  v15 = HMFBooleanToString();
  v16 = (void *)[v14 initWithName:@"Enabled" value:v15];
  v20[4] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:5];

  return v17;
}

- (unint64_t)hash
{
  id v3 = [(HMDActionSetNotificationRegistration *)self actionSetUUID];
  uint64_t v4 = [v3 hash];
  id v5 = [(HMDActionSetNotificationRegistration *)self deviceIdsDestination];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMDActionSetNotificationRegistration *)a3;
  if (v4 == self)
  {
    LOBYTE(v18) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    unint64_t v6 = v5;
    if (v6)
    {
      v7 = [(HMDActionSetNotificationRegistration *)self actionSetUUID];
      id v8 = [(HMDActionSetNotificationRegistration *)v6 actionSetUUID];
      if ([v7 isEqual:v8])
      {
        v9 = [(HMDActionSetNotificationRegistration *)self deviceIdsDestination];
        v10 = [(HMDActionSetNotificationRegistration *)v6 deviceIdsDestination];
        if ([v9 isEqual:v10])
        {
          id v11 = [(HMDActionSetNotificationRegistration *)self userUUID];
          v12 = [(HMDActionSetNotificationRegistration *)v6 userUUID];
          if ([v11 isEqual:v12])
          {
            uint64_t v13 = [(HMDActionSetNotificationRegistration *)self lastModified];
            uint64_t v14 = [(HMDActionSetNotificationRegistration *)v6 lastModified];
            v20 = (void *)v13;
            v15 = (void *)v13;
            v16 = (void *)v14;
            if ([v15 isEqual:v14])
            {
              BOOL v17 = [(HMDActionSetNotificationRegistration *)self enabled];
              BOOL v18 = v17 ^ [(HMDActionSetNotificationRegistration *)v6 enabled] ^ 1;
            }
            else
            {
              LOBYTE(v18) = 0;
            }
          }
          else
          {
            LOBYTE(v18) = 0;
          }
        }
        else
        {
          LOBYTE(v18) = 0;
        }
      }
      else
      {
        LOBYTE(v18) = 0;
      }
    }
    else
    {
      LOBYTE(v18) = 0;
    }
  }
  return v18;
}

- (HMDActionSetNotificationRegistration)initWithActionSetUUID:(id)a3 deviceIdsDestination:(id)a4 userUUID:(id)a5 lastModified:(id)a6 enabled:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDActionSetNotificationRegistration;
  BOOL v17 = [(HMDActionSetNotificationRegistration *)&v20 init];
  BOOL v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_actionSetUUID, a3);
    objc_storeStrong((id *)&v18->_deviceIdsDestination, a4);
    objc_storeStrong((id *)&v18->_userUUID, a5);
    objc_storeStrong((id *)&v18->_lastModified, a6);
    v18->_enabled = a7;
  }

  return v18;
}

@end