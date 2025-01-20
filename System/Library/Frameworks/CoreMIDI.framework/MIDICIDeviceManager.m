@interface MIDICIDeviceManager
+ (MIDICIDeviceManager)sharedInstance;
+ (id)description;
- (BOOL)postNotificationName:(id)a3 device:(id)a4 profile:(id)a5;
- (BOOL)removeDevice:(unsigned int)a3;
- (BOOL)removeProfile:(unsigned int)a3;
- (MIDICIDeviceManager)init;
- (NSArray)discoveredCIDevices;
- (NSMutableArray)devices;
- (NSMutableArray)profiles;
- (id)findDevice:(unsigned int)a3;
- (id)findProfile:(unsigned int)a3;
- (optional<std::pair<MIDICIDevice)findProfileAndDevice:(MIDICIDeviceManager *)self;
- (unsigned)serverMUID;
- (void)addDevice:(id)a3;
- (void)addProfile:(id)a3;
- (void)setDevices:(id)a3;
- (void)setProfiles:(id)a3;
- (void)setServerMUID:(unsigned int)a3;
- (void)updateDevice:(unsigned int)a3 description:(id)a4;
- (void)updateProfile:(unsigned int)a3 description:(id)a4;
@end

@implementation MIDICIDeviceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profiles, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

- (unsigned)serverMUID
{
  return self->_serverMUID;
}

- (void)setProfiles:(id)a3
{
}

- (NSMutableArray)profiles
{
  return self->_profiles;
}

- (void)setDevices:(id)a3
{
}

- (NSMutableArray)devices
{
  return self->_devices;
}

- (void)setServerMUID:(unsigned int)a3
{
  self->_serverMUID = a3;
}

- (void)updateDevice:(unsigned int)a3 description:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  v6 = [(MIDICIDeviceManager *)self findDevice:v4];
  v7 = v6;
  if (v6) {
    [v6 deserialize:v8];
  }
}

- (BOOL)removeDevice:(unsigned int)a3
{
  uint64_t v4 = [(MIDICIDeviceManager *)self findDevice:*(void *)&a3];
  if (v4)
  {
    [(NSMutableArray *)self->_devices removeObject:v4];
    [(MIDICIDeviceManager *)self postNotificationName:@"MIDICIDeviceWasAddedNotification" device:v4 profile:0];
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10842 userInfo:0];

    id v7 = v6;
    BOOL v5 = v7 == 0;
  }

  return v5;
}

- (void)addDevice:(id)a3
{
  id v5 = a3;
  uint64_t v4 = -[MIDICIDeviceManager findDevice:](self, "findDevice:", [v5 objectRef]);

  if (!v4)
  {
    [(NSMutableArray *)self->_devices addObject:v5];
    [(MIDICIDeviceManager *)self postNotificationName:@"MIDICIDeviceWasAddedNotification" device:v5 profile:0];
  }
}

- (id)findDevice:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_devices;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "objectRef", (void)v11) == a3)
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (void)updateProfile:(unsigned int)a3 description:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  [(MIDICIDeviceManager *)self findProfileAndDevice:v4];
  if (v9)
  {
    if ([v8 deserialize:v6]) {
      [(MIDICIDeviceManager *)self postNotificationName:@"MIDICIProfileWasUpdatedNotification" device:v7 profile:v8];
    }
  }
}

- (BOOL)removeProfile:(unsigned int)a3
{
  [(MIDICIDeviceManager *)self findProfileAndDevice:*(void *)&a3];
  if (v7)
  {
    [(NSMutableArray *)self->_profiles removeObject:v6];
    [(MIDICIDeviceManager *)self postNotificationName:@"MIDICIProfileWasRemovedNotification" device:v5 profile:v6];
  }
  return v7 != 0;
}

- (void)addProfile:(id)a3
{
  id v5 = a3;
  uint64_t v4 = -[MIDICIDeviceManager findProfile:](self, "findProfile:", [v5 objectRef]);

  if (!v4) {
    [(NSMutableArray *)self->_profiles addObject:v5];
  }
}

- (id)findProfile:(unsigned int)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v4 = self->_devices;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        char v9 = objc_msgSend(v8, "profiles", 0);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v17;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v9);
              }
              long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * j);
              if ([v13 objectRef] == a3)
              {
                id v14 = v13;

                goto LABEL_19;
              }
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
      id v14 = 0;
    }
    while (v5);
  }
  else
  {
    id v14 = 0;
  }
LABEL_19:

  return v14;
}

- (optional<std::pair<MIDICIDevice)findProfileAndDevice:(MIDICIDeviceManager *)self
{
  long long v18 = retstr;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v5 = self->_devices;
  long long v19 = v5;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v5);
        }
        char v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v10 = objc_msgSend(v9, "profiles", v18);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v21;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v10);
              }
              id v14 = *(void **)(*((void *)&v20 + 1) + 8 * j);
              if ([v14 objectRef] == a4)
              {
                id v16 = v9;
                id v17 = v14;
                v18->var0.var1.var0 = v16;
                v18->var0.var1.var1 = v17;
                v18->var1 = 1;

                return result;
              }
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v5 = v19;
      }
      uint64_t v6 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  v18->var0.var0 = 0;
  v18->var1 = 0;
  return result;
}

- (BOOL)postNotificationName:(id)a3 device:(id)a4 profile:(id)a5
{
  id v8 = a3;
  unint64_t v9 = (unint64_t)a4;
  unint64_t v10 = (unint64_t)a5;
  if (v9 | v10)
  {
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = v11;
    if (v9) {
      [v11 setValue:v9 forKey:@"MIDICIDeviceObjectKey"];
    }
    if (v10) {
      [v12 setValue:v10 forKey:@"MIDICIProfileObjectKey"];
    }
    long long v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:v8 object:self userInfo:v12];
  }
  return (v9 | v10) != 0;
}

- (NSArray)discoveredCIDevices
{
  v2 = (void *)[(NSMutableArray *)self->_devices copy];

  return (NSArray *)v2;
}

- (MIDICIDeviceManager)init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)MIDICIDeviceManager;
  v2 = [(MIDICIDeviceManager *)&v21 init];
  if (v2)
  {
    id v20 = 0;
    if (!UMPCIGlobalState((MIDIServer *)&v20))
    {
      v3 = [v20 objectForKey:@"device_manager_muid"];
      uint64_t v4 = v3;
      if (v3) {
        v2->_serverMUID = [v3 unsignedIntValue];
      }

      uint64_t v5 = [v20 objectForKey:@"midi_ci_devices"];
      uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v17;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v7);
            }
            id v11 = *(id *)(*((void *)&v16 + 1) + 8 * v10);
            uint64_t v12 = [MIDICIDevice alloc];
            long long v13 = -[MIDICIDevice initWithDescription:](v12, "initWithDescription:", v11, (void)v16);
            [(NSMutableArray *)v6 addObject:v13];

            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
        }
        while (v8);
      }

      devices = v2->_devices;
      v2->_devices = v6;
    }
  }
  return v2;
}

+ (MIDICIDeviceManager)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__MIDICIDeviceManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[MIDICIDeviceManager sharedInstance]::onceToken != -1) {
    dispatch_once(&+[MIDICIDeviceManager sharedInstance]::onceToken, block);
  }
  v2 = (void *)+[MIDICIDeviceManager sharedInstance]::theInstance;

  return (MIDICIDeviceManager *)v2;
}

uint64_t __37__MIDICIDeviceManager_sharedInstance__block_invoke(Class *a1)
{
  UMPCIClients::instance((UMPCIClients *)a1);
  +[MIDICIDeviceManager sharedInstance]::theInstance = (uint64_t)objc_alloc_init(a1[4]);

  return MEMORY[0x1F41817F8]();
}

+ (id)description
{
  return @"MIDI-CI Device Manager";
}

@end