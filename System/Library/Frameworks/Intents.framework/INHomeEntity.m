@interface INHomeEntity
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INHomeEntity)initWithCoder:(id)a3;
- (INHomeEntity)initWithEntityName:(id)a3 type:(int64_t)a4 entityIdentifier:(id)a5 deviceTypes:(id)a6 sceneType:(int64_t)a7 room:(id)a8 home:(id)a9 group:(id)a10 zones:(id)a11;
- (INHomeEntity)initWithEntityName:(id)a3 type:(int64_t)a4 entityIdentifier:(id)a5 deviceTypes:(id)a6 sceneType:(int64_t)a7 room:(id)a8 zone:(id)a9 home:(id)a10 group:(id)a11;
- (INHomeEntity)initWithName:(id)a3 type:(int64_t)a4 deviceType:(int64_t)a5;
- (INSpeakableString)entityName;
- (INSpeakableString)group;
- (INSpeakableString)home;
- (INSpeakableString)room;
- (INSpeakableString)zone;
- (NSArray)deviceTypes;
- (NSArray)zones;
- (NSString)description;
- (NSString)entityIdentifier;
- (NSString)name;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)deviceType;
- (int64_t)sceneType;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INHomeEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zones, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_deviceTypes, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);

  objc_storeStrong((id *)&self->_entityName, 0);
}

- (NSArray)zones
{
  return self->_zones;
}

- (INSpeakableString)group
{
  return self->_group;
}

- (INSpeakableString)home
{
  return self->_home;
}

- (INSpeakableString)zone
{
  return self->_zone;
}

- (INSpeakableString)room
{
  return self->_room;
}

- (int64_t)sceneType
{
  return self->_sceneType;
}

- (NSArray)deviceTypes
{
  return self->_deviceTypes;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (INSpeakableString)entityName
{
  return self->_entityName;
}

- (id)_dictionaryRepresentation
{
  v25[9] = *MEMORY[0x1E4F143B8];
  uint64_t entityName = (uint64_t)self->_entityName;
  uint64_t v23 = entityName;
  v24[0] = @"entityName";
  if (!entityName)
  {
    uint64_t entityName = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)entityName;
  v25[0] = entityName;
  v24[1] = @"type";
  v22 = [NSNumber numberWithInteger:self->_type];
  v25[1] = v22;
  v24[2] = @"entityIdentifier";
  uint64_t entityIdentifier = (uint64_t)self->_entityIdentifier;
  uint64_t v21 = entityIdentifier;
  if (!entityIdentifier)
  {
    uint64_t entityIdentifier = [MEMORY[0x1E4F1CA98] null];
  }
  v18 = (void *)entityIdentifier;
  v25[2] = entityIdentifier;
  v24[3] = @"deviceTypes";
  deviceTypes = self->_deviceTypes;
  uint64_t v6 = (uint64_t)deviceTypes;
  if (!deviceTypes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v17 = (void *)v6;
  v25[3] = v6;
  v24[4] = @"sceneType";
  v20 = [NSNumber numberWithInteger:self->_sceneType];
  v25[4] = v20;
  v24[5] = @"room";
  room = self->_room;
  v8 = room;
  if (!room)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[5] = v8;
  v24[6] = @"home";
  home = self->_home;
  v10 = home;
  if (!home)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[6] = v10;
  v24[7] = @"group";
  group = self->_group;
  v12 = group;
  if (!group)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[7] = v12;
  v24[8] = @"zones";
  zones = self->_zones;
  v14 = zones;
  if (!zones)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[8] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:9];
  if (zones)
  {
    if (group) {
      goto LABEL_17;
    }
  }
  else
  {

    if (group)
    {
LABEL_17:
      if (home) {
        goto LABEL_18;
      }
LABEL_30:

      if (room) {
        goto LABEL_19;
      }
      goto LABEL_31;
    }
  }

  if (!home) {
    goto LABEL_30;
  }
LABEL_18:
  if (room) {
    goto LABEL_19;
  }
LABEL_31:

LABEL_19:
  if (!deviceTypes) {

  }
  if (!v21) {
  if (!v23)
  }

  return v15;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INHomeEntity;
  uint64_t v6 = [(INHomeEntity *)&v11 description];
  v7 = [(INHomeEntity *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INHomeEntity *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  v7 = [v5 encodeObject:self->_entityName];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v7, @"entityName");

  unint64_t v8 = self->_type - 1;
  if (v8 > 9) {
    v9 = @"unknown";
  }
  else {
    v9 = off_1E5518728[v8];
  }
  v10 = v9;
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v10, @"type");

  v29 = v5;
  objc_super v11 = [v5 encodeObject:self->_entityIdentifier];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v11, @"entityIdentifier");

  v12 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v13 = self->_deviceTypes;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [*(id *)(*((void *)&v30 + 1) + 8 * i) integerValue];
        v19 = @"unknown";
        if ((unint64_t)(v18 - 1) <= 0x2C) {
          v19 = off_1E5518E78[v18 - 1];
        }
        v20 = v19;
        [v12 addObject:v20];
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v15);
  }

  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v12, @"deviceTypes");
  unint64_t v21 = self->_sceneType - 1;
  if (v21 > 4) {
    v22 = @"unknown";
  }
  else {
    v22 = *(&off_1E551F6C8 + v21);
  }
  uint64_t v23 = v22;
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v23, @"sceneType");

  v24 = [v29 encodeObject:self->_room];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v24, @"room");

  v25 = [v29 encodeObject:self->_home];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v25, @"home");

  v26 = [v29 encodeObject:self->_group];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v26, @"group");

  v27 = [v29 encodeObject:self->_zones];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v27, @"zones");

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t entityName = self->_entityName;
  id v5 = a3;
  [v5 encodeObject:entityName forKey:@"entityName"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_entityIdentifier forKey:@"entityIdentifier"];
  [v5 encodeObject:self->_deviceTypes forKey:@"deviceTypes"];
  [v5 encodeInteger:self->_sceneType forKey:@"sceneType"];
  [v5 encodeObject:self->_room forKey:@"room"];
  [v5 encodeObject:self->_home forKey:@"home"];
  [v5 encodeObject:self->_group forKey:@"group"];
  [v5 encodeObject:self->_zones forKey:@"zones"];
}

- (INHomeEntity)initWithCoder:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"entityName"];
  uint64_t v22 = [v3 decodeIntegerForKey:@"type"];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v7 = [v3 decodeObjectOfClasses:v6 forKey:@"entityIdentifier"];

  unint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v10 = [v8 setWithArray:v9];
  objc_super v11 = [v3 decodeObjectOfClasses:v10 forKey:@"deviceTypes"];

  uint64_t v12 = [v3 decodeIntegerForKey:@"sceneType"];
  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"room"];
  uint64_t v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
  uint64_t v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"group"];
  uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  uint64_t v18 = [v16 setWithArray:v17];
  v19 = [v3 decodeObjectOfClasses:v18 forKey:@"zones"];

  v20 = [(INHomeEntity *)self initWithEntityName:v23 type:v22 entityIdentifier:v7 deviceTypes:v11 sceneType:v12 room:v13 home:v14 group:v15 zones:v19];
  return v20;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INHomeEntity *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t entityName = self->_entityName;
      BOOL v13 = 0;
      if ((entityName == v5->_entityName || -[INSpeakableString isEqual:](entityName, "isEqual:"))
        && self->_type == v5->_type)
      {
        uint64_t entityIdentifier = self->_entityIdentifier;
        if (entityIdentifier == v5->_entityIdentifier
          || -[NSString isEqual:](entityIdentifier, "isEqual:"))
        {
          deviceTypes = self->_deviceTypes;
          if ((deviceTypes == v5->_deviceTypes || -[NSArray isEqual:](deviceTypes, "isEqual:"))
            && self->_sceneType == v5->_sceneType)
          {
            room = self->_room;
            if (room == v5->_room || -[INSpeakableString isEqual:](room, "isEqual:"))
            {
              home = self->_home;
              if (home == v5->_home || -[INSpeakableString isEqual:](home, "isEqual:"))
              {
                group = self->_group;
                if (group == v5->_group || -[INSpeakableString isEqual:](group, "isEqual:"))
                {
                  zones = self->_zones;
                  if (zones == v5->_zones || -[NSArray isEqual:](zones, "isEqual:")) {
                    BOOL v13 = 1;
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INSpeakableString *)self->_entityName hash];
  v4 = [NSNumber numberWithInteger:self->_type];
  uint64_t v5 = [v4 hash];
  NSUInteger v6 = v3 ^ [(NSString *)self->_entityIdentifier hash];
  uint64_t v7 = v5 ^ v6 ^ [(NSArray *)self->_deviceTypes hash];
  unint64_t v8 = [NSNumber numberWithInteger:self->_sceneType];
  uint64_t v9 = [v8 hash];
  unint64_t v10 = v7 ^ v9 ^ [(INSpeakableString *)self->_room hash];
  unint64_t v11 = [(INSpeakableString *)self->_home hash];
  unint64_t v12 = v11 ^ [(INSpeakableString *)self->_group hash];
  unint64_t v13 = v10 ^ v12 ^ [(NSArray *)self->_zones hash];

  return v13;
}

- (NSString)name
{
  v2 = [(INHomeEntity *)self entityName];
  unint64_t v3 = [v2 spokenPhrase];

  return (NSString *)v3;
}

- (int64_t)deviceType
{
  v2 = [(INHomeEntity *)self deviceTypes];
  unint64_t v3 = [v2 firstObject];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (INHomeEntity)initWithEntityName:(id)a3 type:(int64_t)a4 entityIdentifier:(id)a5 deviceTypes:(id)a6 sceneType:(int64_t)a7 room:(id)a8 zone:(id)a9 home:(id)a10 group:(id)a11
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v17 = a9;
  uint64_t v18 = v17;
  if (v17)
  {
    v38[0] = v17;
    v19 = (void *)MEMORY[0x1E4F1C978];
    id v20 = a11;
    id v21 = a10;
    id v22 = a8;
    id v23 = a6;
    id v24 = a5;
    id v25 = a3;
    v26 = [v19 arrayWithObjects:v38 count:1];
    v27 = [(INHomeEntity *)self initWithEntityName:v25 type:a4 entityIdentifier:v24 deviceTypes:v23 sceneType:a7 room:v22 home:v21 group:v20 zones:v26];

    v28 = v27;
  }
  else
  {
    id v29 = a11;
    id v30 = a10;
    id v31 = a8;
    id v32 = a6;
    id v33 = a5;
    id v34 = a3;
    uint64_t v35 = [(INHomeEntity *)self initWithEntityName:v34 type:a4 entityIdentifier:v33 deviceTypes:v32 sceneType:a7 room:v31 home:v30 group:v29 zones:MEMORY[0x1E4F1CBF0]];

    v28 = v35;
  }

  return v28;
}

- (INHomeEntity)initWithName:(id)a3 type:(int64_t)a4 deviceType:(int64_t)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [[INSpeakableString alloc] initWithSpokenPhrase:v8];

  unint64_t v10 = [NSNumber numberWithInteger:a5];
  v14[0] = v10;
  unint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  unint64_t v12 = [(INHomeEntity *)self initWithEntityName:v9 type:a4 entityIdentifier:0 deviceTypes:v11 sceneType:0 room:0 zone:0 home:0 group:0];

  return v12;
}

- (INHomeEntity)initWithEntityName:(id)a3 type:(int64_t)a4 entityIdentifier:(id)a5 deviceTypes:(id)a6 sceneType:(int64_t)a7 room:(id)a8 home:(id)a9 group:(id)a10 zones:(id)a11
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  v40.receiver = self;
  v40.super_class = (Class)INHomeEntity;
  id v24 = [(INHomeEntity *)&v40 init];
  if (v24)
  {
    uint64_t v25 = [v17 copy];
    uint64_t entityName = v24->_entityName;
    v24->_uint64_t entityName = (INSpeakableString *)v25;

    v24->_type = a4;
    uint64_t v27 = [v18 copy];
    uint64_t entityIdentifier = v24->_entityIdentifier;
    v24->_uint64_t entityIdentifier = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    deviceTypes = v24->_deviceTypes;
    v24->_deviceTypes = (NSArray *)v29;

    v24->_sceneType = a7;
    uint64_t v31 = [v20 copy];
    room = v24->_room;
    v24->_room = (INSpeakableString *)v31;

    uint64_t v33 = [v21 copy];
    home = v24->_home;
    v24->_home = (INSpeakableString *)v33;

    uint64_t v35 = [v22 copy];
    group = v24->_group;
    v24->_group = (INSpeakableString *)v35;

    uint64_t v37 = [v23 copy];
    zones = v24->_zones;
    v24->_zones = (NSArray *)v37;
  }
  return v24;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v38 = (objc_class *)a1;
    uint64_t v9 = objc_opt_class();
    unint64_t v10 = [v8 objectForKeyedSubscript:@"entityName"];
    uint64_t v37 = [v7 decodeObjectOfClass:v9 from:v10];

    unint64_t v11 = [v8 objectForKeyedSubscript:@"type"];
    uint64_t v35 = INHomeEntityTypeWithString(v11);

    v36 = [v8 objectForKeyedSubscript:@"entityIdentifier"];
    unint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    unint64_t v13 = [v8 objectForKeyedSubscript:@"deviceTypes"];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = [NSNumber numberWithInteger:INHomeDeviceTypeWithString(*(void **)(*((void *)&v39 + 1) + 8 * i))];
          [v12 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v15);
    }

    id v19 = [v8 objectForKeyedSubscript:@"sceneType"];
    uint64_t v34 = INHomeSceneTypeWithString(v19);

    uint64_t v20 = objc_opt_class();
    id v21 = [v8 objectForKeyedSubscript:@"room"];
    id v22 = [v7 decodeObjectOfClass:v20 from:v21];

    uint64_t v23 = objc_opt_class();
    id v24 = [v8 objectForKeyedSubscript:@"home"];
    uint64_t v25 = [v7 decodeObjectOfClass:v23 from:v24];

    uint64_t v26 = objc_opt_class();
    uint64_t v27 = [v8 objectForKeyedSubscript:@"group"];
    v28 = [v7 decodeObjectOfClass:v26 from:v27];

    uint64_t v29 = objc_opt_class();
    id v30 = [v8 objectForKeyedSubscript:@"zones"];
    uint64_t v31 = [v7 decodeObjectsOfClass:v29 from:v30];

    id v32 = (void *)[[v38 alloc] initWithEntityName:v37 type:v35 entityIdentifier:v36 deviceTypes:v12 sceneType:v34 room:v22 home:v25 group:v28 zones:v31];
  }
  else
  {
    id v32 = 0;
  }

  return v32;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end