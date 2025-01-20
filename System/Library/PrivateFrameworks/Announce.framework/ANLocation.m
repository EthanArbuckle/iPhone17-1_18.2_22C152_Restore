@interface ANLocation
+ (BOOL)supportsSecureCoding;
- (ANLocation)initWithCoder:(id)a3;
- (ANLocation)initWithHomeID:(id)a3;
- (ANLocation)initWithMessage:(id)a3;
- (NSArray)deviceIDs;
- (NSArray)roomUUIDs;
- (NSArray)userUUIDs;
- (NSArray)zoneUUIDs;
- (NSNumber)homeLocationStatus;
- (NSUUID)homeUUID;
- (id)copy;
- (id)message;
- (unint64_t)flags;
- (unint64_t)target;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceIDs:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setHomeLocationStatus:(id)a3;
- (void)setHomeUUID:(id)a3;
- (void)setRoomUUIDs:(id)a3;
- (void)setUserUUIDs:(id)a3;
- (void)setZoneUUIDs:(id)a3;
@end

@implementation ANLocation

- (ANLocation)initWithHomeID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ANLocation;
  v6 = [(ANLocation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_homeUUID, a3);
  }

  return v7;
}

- (id)copy
{
  v3 = objc_opt_new();
  v4 = [(ANLocation *)self homeUUID];
  [v3 setHomeUUID:v4];

  id v5 = [(ANLocation *)self roomUUIDs];
  v6 = (void *)[v5 copy];
  [v3 setRoomUUIDs:v6];

  v7 = [(ANLocation *)self zoneUUIDs];
  v8 = (void *)[v7 copy];
  [v3 setZoneUUIDs:v8];

  objc_super v9 = [(ANLocation *)self userUUIDs];
  v10 = (void *)[v9 copy];
  [v3 setUserUUIDs:v10];

  v11 = [(ANLocation *)self deviceIDs];
  v12 = (void *)[v11 copy];
  [v3 setDeviceIDs:v12];

  objc_msgSend(v3, "setFlags:", -[ANLocation flags](self, "flags"));
  v13 = [(ANLocation *)self homeLocationStatus];
  [v3 setHomeLocationStatus:v13];

  return v3;
}

- (unint64_t)target
{
  v3 = [(ANLocation *)self zoneUUIDs];
  unint64_t v4 = [v3 count];

  if (v4 <= 1)
  {
    v6 = [(ANLocation *)self zoneUUIDs];
    BOOL v7 = [v6 count] == 1;

    uint64_t v5 = 4 * v7;
  }
  else
  {
    uint64_t v5 = 8;
  }
  v8 = [(ANLocation *)self roomUUIDs];
  unint64_t v9 = [v8 count];

  if (v9 <= 1)
  {
    v11 = [(ANLocation *)self roomUUIDs];
    uint64_t v10 = [v11 count] == 1;
  }
  else
  {
    uint64_t v10 = 2;
  }
  return v5 | v10;
}

- (ANLocation)initWithMessage:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [v4 objectForKey:@"home"];
    if (v5)
    {
      v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v5];
      if (v6)
      {
        BOOL v7 = [(ANLocation *)self initWithHomeID:v6];
        if (v7)
        {
          v44 = v6;
          v45 = v5;
          v8 = [v4 objectForKey:@"flags"];
          unint64_t v9 = v8;
          if (v8) {
            v7->_flags = [v8 unsignedIntegerValue];
          }
          v43 = v9;
          v47 = v7;
          uint64_t v10 = [v4 objectForKey:@"zones"];
          v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v12 = v10;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:v62 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v57;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v57 != v15) {
                  objc_enumerationMutation(v12);
                }
                v17 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(*((void *)&v56 + 1) + 8 * i)];
                if (v17) {
                  [v11 addObject:v17];
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v56 objects:v62 count:16];
            }
            while (v14);
          }
          v42 = v12;

          objc_storeStrong((id *)&v47->_zoneUUIDs, v11);
          v18 = [v4 objectForKey:@"rooms"];
          v19 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v18, "count"));
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v20 = v18;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v52 objects:v61 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v53;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v53 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = objc_msgSend(objc_alloc(MEMORY[0x263F08C38]), "initWithUUIDString:", *(void *)(*((void *)&v52 + 1) + 8 * j), v42);
                if (v25) {
                  [v19 addObject:v25];
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v52 objects:v61 count:16];
            }
            while (v22);
          }

          objc_storeStrong((id *)&v47->_roomUUIDs, v19);
          v46 = v4;
          v26 = [v4 objectForKey:@"users"];
          objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v26, "count"));
          v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v28 = v26;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v48 objects:v60 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v49;
            do
            {
              for (uint64_t k = 0; k != v30; ++k)
              {
                if (*(void *)v49 != v31) {
                  objc_enumerationMutation(v28);
                }
                v33 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(*((void *)&v48 + 1) + 8 * k)];
                if (v33) {
                  [(NSArray *)v27 addObject:v33];
                }
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v48 objects:v60 count:16];
            }
            while (v30);
          }

          BOOL v7 = v47;
          userUUIDs = v47->_userUUIDs;
          v47->_userUUIDs = v27;
          v35 = v27;

          id v4 = v46;
          uint64_t v36 = [v46 objectForKey:@"devices"];
          deviceIDs = v47->_deviceIDs;
          v47->_deviceIDs = (NSArray *)v36;

          uint64_t v38 = [v46 objectForKey:@"homeLocationStatus"];
          homeLocationStatus = v47->_homeLocationStatus;
          v47->_homeLocationStatus = (NSNumber *)v38;

          v6 = v44;
          uint64_t v5 = v45;
        }
        self = v7;
        v40 = self;
      }
      else
      {
        v40 = 0;
      }
    }
    else
    {
      v40 = 0;
    }
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (id)message
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:4];
  id v4 = [(NSUUID *)self->_homeUUID UUIDString];
  [v3 setValue:v4 forKey:@"home"];

  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_flags];
  [v3 setValue:v5 forKey:@"flags"];

  v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_zoneUUIDs, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  BOOL v7 = self->_zoneUUIDs;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v36 + 1) + 8 * i) UUIDString];
        [v6 addObject:v12];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v9);
  }

  [v3 setValue:v6 forKey:@"zones"];
  uint64_t v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_roomUUIDs, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v14 = self->_roomUUIDs;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v32 + 1) + 8 * j) UUIDString];
        [v13 addObject:v19];
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v16);
  }

  [v3 setValue:v13 forKey:@"rooms"];
  id v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_userUUIDs, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v21 = self->_userUUIDs;
  uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * k), "UUIDString", (void)v28);
        [v20 addObject:v26];
      }
      uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v23);
  }

  [v3 setValue:v20 forKey:@"users"];
  [v3 setValue:self->_deviceIDs forKey:@"devices"];
  [v3 setValue:self->_homeLocationStatus forKey:@"homeLocationStatus"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ANLocation *)self homeUUID];
  [v4 encodeObject:v5 forKey:@"home"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ANLocation flags](self, "flags"));
  [v4 encodeObject:v6 forKey:@"flags"];

  BOOL v7 = [(ANLocation *)self zoneUUIDs];
  [v4 encodeObject:v7 forKey:@"zones"];

  uint64_t v8 = [(ANLocation *)self roomUUIDs];
  [v4 encodeObject:v8 forKey:@"rooms"];

  uint64_t v9 = [(ANLocation *)self userUUIDs];
  [v4 encodeObject:v9 forKey:@"users"];

  id v10 = [(ANLocation *)self deviceIDs];
  [v4 encodeObject:v10 forKey:@"devices"];
}

- (ANLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
  if (v5)
  {
    v6 = [(ANLocation *)self initWithHomeID:v5];
    if (v6)
    {
      BOOL v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flags"];
      uint64_t v8 = v7;
      if (v7) {
        v6->_flags = [v7 unsignedIntegerValue];
      }
      uint64_t v9 = (void *)MEMORY[0x263EFFA08];
      uint64_t v10 = objc_opt_class();
      v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
      uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"zones"];
      zoneUUIDs = v6->_zoneUUIDs;
      v6->_zoneUUIDs = (NSArray *)v12;

      uint64_t v14 = [v4 decodeObjectOfClasses:v11 forKey:@"rooms"];
      roomUUIDs = v6->_roomUUIDs;
      v6->_roomUUIDs = (NSArray *)v14;

      uint64_t v16 = [v4 decodeObjectOfClasses:v11 forKey:@"users"];
      userUUIDs = v6->_userUUIDs;
      v6->_userUUIDs = (NSArray *)v16;

      v18 = (void *)MEMORY[0x263EFFA08];
      uint64_t v19 = objc_opt_class();
      id v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
      uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"devices"];
      deviceIDs = v6->_deviceIDs;
      v6->_deviceIDs = (NSArray *)v21;
    }
    self = v6;
    uint64_t v23 = self;
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (void)setHomeUUID:(id)a3
{
}

- (NSArray)roomUUIDs
{
  return self->_roomUUIDs;
}

- (void)setRoomUUIDs:(id)a3
{
}

- (NSArray)zoneUUIDs
{
  return self->_zoneUUIDs;
}

- (void)setZoneUUIDs:(id)a3
{
}

- (NSArray)userUUIDs
{
  return self->_userUUIDs;
}

- (void)setUserUUIDs:(id)a3
{
}

- (NSArray)deviceIDs
{
  return self->_deviceIDs;
}

- (void)setDeviceIDs:(id)a3
{
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSNumber)homeLocationStatus
{
  return self->_homeLocationStatus;
}

- (void)setHomeLocationStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeLocationStatus, 0);
  objc_storeStrong((id *)&self->_deviceIDs, 0);
  objc_storeStrong((id *)&self->_userUUIDs, 0);
  objc_storeStrong((id *)&self->_zoneUUIDs, 0);
  objc_storeStrong((id *)&self->_roomUUIDs, 0);

  objc_storeStrong((id *)&self->_homeUUID, 0);
}

@end