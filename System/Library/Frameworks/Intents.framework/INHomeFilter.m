@interface INHomeFilter
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)hasAllQuantifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExcludeFilter;
- (INHomeFilter)initWithCoder:(id)a3;
- (INHomeFilter)initWithEntityIdentifiers:(id)a3 entityName:(id)a4 entityType:(int64_t)a5 outerDeviceType:(int64_t)a6 innerDeviceName:(id)a7 innerDeviceType:(int64_t)a8 home:(id)a9 zone:(id)a10 group:(id)a11 room:(id)a12 isExcludeFilter:(BOOL)a13;
- (INHomeFilter)initWithEntityIdentifiers:(id)a3 entityName:(id)a4 entityType:(int64_t)a5 outerDeviceType:(int64_t)a6 outerDeviceName:(id)a7 deviceType:(int64_t)a8 home:(id)a9 zone:(id)a10 group:(id)a11 room:(id)a12 isExcludeFilter:(BOOL)a13;
- (INHomeFilter)initWithEntityIdentifiers:(id)a3 entityName:(id)a4 entityType:(int64_t)a5 outerDeviceType:(int64_t)a6 outerDeviceName:(id)a7 deviceType:(int64_t)a8 home:(id)a9 zone:(id)a10 group:(id)a11 room:(id)a12 isExcludeFilter:(BOOL)a13 hasAllQuantifier:(BOOL)a14;
- (INHomeFilter)initWithEntityIdentifiers:(id)a3 home:(id)a4 scene:(id)a5 homeZone:(id)a6 group:(id)a7 room:(id)a8 accessory:(id)a9 entityType:(int64_t)a10 serviceType:(int64_t)a11 subServiceType:(int64_t)a12 isExcludeFilter:(BOOL)a13 entityName:(id)a14;
- (INHomeFilter)initWithEntityIdentifiers:(id)a3 home:(id)a4 scene:(id)a5 homeZone:(id)a6 group:(id)a7 room:(id)a8 accessory:(id)a9 service:(id)a10 entityType:(int64_t)a11 serviceType:(int64_t)a12 subServiceType:(int64_t)a13;
- (INHomeFilter)initWithEntityIdentifiers:(id)a3 home:(id)a4 scene:(id)a5 homeZone:(id)a6 group:(id)a7 room:(id)a8 accessory:(id)a9 service:(id)a10 entityType:(int64_t)a11 serviceType:(int64_t)a12 subServiceType:(int64_t)a13 isExcludeFilter:(BOOL)a14;
- (INSpeakableString)accessory;
- (INSpeakableString)entityName;
- (INSpeakableString)group;
- (INSpeakableString)home;
- (INSpeakableString)outerDeviceName;
- (INSpeakableString)room;
- (INSpeakableString)zone;
- (NSArray)entityIdentifiers;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)deviceType;
- (int64_t)entityType;
- (int64_t)outerDeviceType;
- (int64_t)serviceType;
- (int64_t)subServiceType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INHomeFilter

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  v6 = [(INHomeFilter *)self entityName];

  if (v6)
  {
    v7 = [(INHomeFilter *)self entityName];
LABEL_3:
    v8 = v7;
    v9 = objc_msgSend(v7, "_intents_readableTitleWithLocalizer:", v5);

    goto LABEL_6;
  }
  if ([(INHomeFilter *)self outerDeviceType]) {
    goto LABEL_5;
  }
  v11 = [(INHomeFilter *)self outerDeviceName];

  if (v11)
  {
    v7 = [(INHomeFilter *)self outerDeviceName];
    goto LABEL_3;
  }
  v12 = [(INHomeFilter *)self group];

  if (v12)
  {
    v7 = [(INHomeFilter *)self group];
    goto LABEL_3;
  }
  v13 = [(INHomeFilter *)self room];

  if (v13)
  {
    v7 = [(INHomeFilter *)self room];
    goto LABEL_3;
  }
  v14 = [(INHomeFilter *)self zone];

  if (v14)
  {
    v7 = [(INHomeFilter *)self zone];
    goto LABEL_3;
  }
  v15 = [(INHomeFilter *)self home];

  if (v15)
  {
    v7 = [(INHomeFilter *)self home];
    goto LABEL_3;
  }
  if (![(INHomeFilter *)self entityType])
  {
LABEL_5:
    v9 = 0;
  }
  else
  {
    v9 = INHomeEntityTypeGetLocalizedName([(INHomeFilter *)self entityType], v5);
  }
LABEL_6:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_outerDeviceName, 0);
  objc_storeStrong((id *)&self->_entityName, 0);

  objc_storeStrong((id *)&self->_entityIdentifiers, 0);
}

- (BOOL)hasAllQuantifier
{
  return self->_hasAllQuantifier;
}

- (int64_t)subServiceType
{
  return self->_subServiceType;
}

- (INSpeakableString)accessory
{
  return self->_accessory;
}

- (BOOL)isExcludeFilter
{
  return self->_isExcludeFilter;
}

- (INSpeakableString)room
{
  return self->_room;
}

- (INSpeakableString)group
{
  return self->_group;
}

- (INSpeakableString)zone
{
  return self->_zone;
}

- (INSpeakableString)home
{
  return self->_home;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (INSpeakableString)outerDeviceName
{
  return self->_outerDeviceName;
}

- (int64_t)outerDeviceType
{
  return self->_outerDeviceType;
}

- (int64_t)entityType
{
  return self->_entityType;
}

- (INSpeakableString)entityName
{
  return self->_entityName;
}

- (NSArray)entityIdentifiers
{
  return self->_entityIdentifiers;
}

- (id)_dictionaryRepresentation
{
  v30[12] = *MEMORY[0x1E4F143B8];
  uint64_t entityIdentifiers = (uint64_t)self->_entityIdentifiers;
  uint64_t v28 = entityIdentifiers;
  v29[0] = @"entityIdentifiers";
  if (!entityIdentifiers)
  {
    uint64_t entityIdentifiers = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)entityIdentifiers;
  v30[0] = entityIdentifiers;
  v29[1] = @"entityName";
  uint64_t entityName = (uint64_t)self->_entityName;
  uint64_t v27 = entityName;
  if (!entityName)
  {
    uint64_t entityName = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)entityName;
  v30[1] = entityName;
  v29[2] = @"entityType";
  v26 = [NSNumber numberWithInteger:self->_entityType];
  v30[2] = v26;
  v29[3] = @"outerDeviceType";
  v25 = [NSNumber numberWithInteger:self->_outerDeviceType];
  v30[3] = v25;
  v29[4] = @"outerDeviceName";
  uint64_t outerDeviceName = (uint64_t)self->_outerDeviceName;
  uint64_t v24 = outerDeviceName;
  if (!outerDeviceName)
  {
    uint64_t outerDeviceName = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)outerDeviceName;
  v30[4] = outerDeviceName;
  v29[5] = @"deviceType";
  v23 = [NSNumber numberWithInteger:self->_deviceType];
  v30[5] = v23;
  v29[6] = @"home";
  home = self->_home;
  uint64_t v7 = (uint64_t)home;
  if (!home)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v18 = v7;
  v30[6] = v7;
  v29[7] = @"zone";
  zone = self->_zone;
  v9 = zone;
  if (!zone)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v7);
  }
  v30[7] = v9;
  v29[8] = @"group";
  group = self->_group;
  v11 = group;
  if (!group)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[8] = v11;
  v29[9] = @"room";
  room = self->_room;
  v13 = room;
  if (!room)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[9] = v13;
  v29[10] = @"isExcludeFilter";
  v14 = objc_msgSend(NSNumber, "numberWithBool:", self->_isExcludeFilter, v18);
  v30[10] = v14;
  v29[11] = @"hasAllQuantifier";
  v15 = [NSNumber numberWithBool:self->_hasAllQuantifier];
  v30[11] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:12];

  if (room)
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
      if (zone) {
        goto LABEL_18;
      }
LABEL_30:

      if (home) {
        goto LABEL_19;
      }
      goto LABEL_31;
    }
  }

  if (!zone) {
    goto LABEL_30;
  }
LABEL_18:
  if (home) {
    goto LABEL_19;
  }
LABEL_31:

LABEL_19:
  if (!v24) {

  }
  if (!v27) {
  if (!v28)
  }

  return v16;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INHomeFilter;
  v6 = [(INHomeFilter *)&v11 description];
  uint64_t v7 = [(INHomeFilter *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INHomeFilter *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  uint64_t v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_entityIdentifiers];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"entityIdentifiers");

  v9 = [v6 encodeObject:self->_entityName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"entityName");

  unint64_t v10 = self->_entityType - 1;
  if (v10 > 9) {
    objc_super v11 = @"unknown";
  }
  else {
    objc_super v11 = off_1E5518728[v10];
  }
  v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"entityType");

  unint64_t v13 = self->_outerDeviceType - 1;
  if (v13 > 0x2C) {
    v14 = @"unknown";
  }
  else {
    v14 = off_1E5518E78[v13];
  }
  v15 = v14;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"outerDeviceType");

  v16 = [v6 encodeObject:self->_outerDeviceName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, @"outerDeviceName");

  unint64_t v17 = self->_deviceType - 1;
  if (v17 > 0x2C) {
    uint64_t v18 = @"unknown";
  }
  else {
    uint64_t v18 = off_1E5518E78[v17];
  }
  v19 = v18;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, @"deviceType");

  v20 = [v6 encodeObject:self->_home];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v20, @"home");

  v21 = [v6 encodeObject:self->_zone];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v21, @"zone");

  v22 = [v6 encodeObject:self->_group];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v22, @"group");

  v23 = [v6 encodeObject:self->_room];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v23, @"room");
  uint64_t v24 = [NSNumber numberWithBool:self->_isExcludeFilter];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v24, @"isExcludeFilter");

  v25 = [NSNumber numberWithBool:self->_hasAllQuantifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v25, @"hasAllQuantifier");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t entityIdentifiers = self->_entityIdentifiers;
  id v5 = a3;
  [v5 encodeObject:entityIdentifiers forKey:@"entityIdentifiers"];
  [v5 encodeObject:self->_entityName forKey:@"entityName"];
  [v5 encodeInteger:self->_entityType forKey:@"entityType"];
  [v5 encodeInteger:self->_outerDeviceType forKey:@"outerDeviceType"];
  [v5 encodeObject:self->_outerDeviceName forKey:@"outerDeviceName"];
  [v5 encodeInteger:self->_deviceType forKey:@"deviceType"];
  [v5 encodeObject:self->_home forKey:@"home"];
  [v5 encodeObject:self->_zone forKey:@"zone"];
  [v5 encodeObject:self->_group forKey:@"group"];
  [v5 encodeObject:self->_room forKey:@"room"];
  [v5 encodeBool:self->_isExcludeFilter forKey:@"isExcludeFilter"];
  [v5 encodeBool:self->_hasAllQuantifier forKey:@"hasAllQuantifier"];
}

- (INHomeFilter)initWithCoder:(id)a3
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  id v6 = [v3 setWithArray:v5];
  v21 = [v4 decodeObjectOfClasses:v6 forKey:@"entityIdentifiers"];

  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityName"];
  uint64_t v20 = [v4 decodeIntegerForKey:@"entityType"];
  uint64_t v19 = [v4 decodeIntegerForKey:@"outerDeviceType"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outerDeviceName"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"deviceType"];
  unint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
  objc_super v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zone"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"group"];
  unint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"room"];
  char v14 = [v4 decodeBoolForKey:@"isExcludeFilter"];
  char v15 = [v4 decodeBoolForKey:@"hasAllQuantifier"];

  BYTE1(v18) = v15;
  LOBYTE(v18) = v14;
  v16 = -[INHomeFilter initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:](self, "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", v21, v7, v20, v19, v8, v9, v10, v11, v12, v13, v18);

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INHomeFilter *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t entityIdentifiers = self->_entityIdentifiers;
      BOOL v13 = (entityIdentifiers == v5->_entityIdentifiers
          || -[NSArray isEqual:](entityIdentifiers, "isEqual:"))
         && ((uint64_t entityName = self->_entityName, entityName == v5->_entityName)
          || -[INSpeakableString isEqual:](entityName, "isEqual:"))
         && self->_entityType == v5->_entityType
         && self->_outerDeviceType == v5->_outerDeviceType
         && ((uint64_t outerDeviceName = self->_outerDeviceName, outerDeviceName == v5->_outerDeviceName)
          || -[INSpeakableString isEqual:](outerDeviceName, "isEqual:"))
         && self->_deviceType == v5->_deviceType
         && ((home = self->_home, home == v5->_home) || -[INSpeakableString isEqual:](home, "isEqual:"))
         && ((zone = self->_zone, zone == v5->_zone) || -[INSpeakableString isEqual:](zone, "isEqual:"))
         && ((group = self->_group, group == v5->_group) || -[INSpeakableString isEqual:](group, "isEqual:"))
         && ((room = self->_room, room == v5->_room) || -[INSpeakableString isEqual:](room, "isEqual:"))
         && self->_isExcludeFilter == v5->_isExcludeFilter
         && self->_hasAllQuantifier == v5->_hasAllQuantifier;
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
  uint64_t v3 = [(NSArray *)self->_entityIdentifiers hash];
  unint64_t v4 = [(INSpeakableString *)self->_entityName hash] ^ v3;
  id v5 = [NSNumber numberWithInteger:self->_entityType];
  uint64_t v6 = v4 ^ [v5 hash];
  uint64_t v7 = [NSNumber numberWithInteger:self->_outerDeviceType];
  uint64_t v8 = [v7 hash];
  unint64_t v9 = v6 ^ v8 ^ [(INSpeakableString *)self->_outerDeviceName hash];
  unint64_t v10 = [NSNumber numberWithInteger:self->_deviceType];
  uint64_t v11 = [v10 hash];
  unint64_t v12 = v11 ^ [(INSpeakableString *)self->_home hash];
  unint64_t v13 = v9 ^ v12 ^ [(INSpeakableString *)self->_zone hash];
  unint64_t v14 = [(INSpeakableString *)self->_group hash];
  unint64_t v15 = v14 ^ [(INSpeakableString *)self->_room hash];
  v16 = [NSNumber numberWithBool:self->_isExcludeFilter];
  uint64_t v17 = v15 ^ [v16 hash];
  uint64_t v18 = [NSNumber numberWithBool:self->_hasAllQuantifier];
  unint64_t v19 = v13 ^ v17 ^ [v18 hash];

  return v19;
}

- (int64_t)serviceType
{
  int64_t v2 = [(INHomeFilter *)self outerDeviceType];
  if ((unint64_t)(v2 - 1) > 0x1B) {
    return 0;
  }
  else {
    return qword_18CFC4E58[v2 - 1];
  }
}

- (INHomeFilter)initWithEntityIdentifiers:(id)a3 entityName:(id)a4 entityType:(int64_t)a5 outerDeviceType:(int64_t)a6 outerDeviceName:(id)a7 deviceType:(int64_t)a8 home:(id)a9 zone:(id)a10 group:(id)a11 room:(id)a12 isExcludeFilter:(BOOL)a13
{
  LOWORD(v14) = a13;
  return -[INHomeFilter initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:](self, "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, v14);
}

- (INHomeFilter)initWithEntityIdentifiers:(id)a3 entityName:(id)a4 entityType:(int64_t)a5 outerDeviceType:(int64_t)a6 innerDeviceName:(id)a7 innerDeviceType:(int64_t)a8 home:(id)a9 zone:(id)a10 group:(id)a11 room:(id)a12 isExcludeFilter:(BOOL)a13
{
  LOWORD(v14) = a13;
  return -[INHomeFilter initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:](self, "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, v14);
}

- (INHomeFilter)initWithEntityIdentifiers:(id)a3 home:(id)a4 scene:(id)a5 homeZone:(id)a6 group:(id)a7 room:(id)a8 accessory:(id)a9 entityType:(int64_t)a10 serviceType:(int64_t)a11 subServiceType:(int64_t)a12 isExcludeFilter:(BOOL)a13 entityName:(id)a14
{
  id v14 = a14;
  if (!a14) {
    id v14 = a5;
  }
  return -[INHomeFilter initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:](self, "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", a3, v14, a10, 0, 0, 0);
}

- (INHomeFilter)initWithEntityIdentifiers:(id)a3 home:(id)a4 scene:(id)a5 homeZone:(id)a6 group:(id)a7 room:(id)a8 accessory:(id)a9 service:(id)a10 entityType:(int64_t)a11 serviceType:(int64_t)a12 subServiceType:(int64_t)a13 isExcludeFilter:(BOOL)a14
{
  id v14 = a10;
  if (!a10) {
    id v14 = a5;
  }
  return -[INHomeFilter initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:](self, "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", a3, v14, a11, 0, 0, 0);
}

- (INHomeFilter)initWithEntityIdentifiers:(id)a3 home:(id)a4 scene:(id)a5 homeZone:(id)a6 group:(id)a7 room:(id)a8 accessory:(id)a9 service:(id)a10 entityType:(int64_t)a11 serviceType:(int64_t)a12 subServiceType:(int64_t)a13
{
  id v13 = a10;
  if (!a10) {
    id v13 = a5;
  }
  return -[INHomeFilter initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:](self, "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", a3, v13, a11, 0, 0, 0);
}

- (INHomeFilter)initWithEntityIdentifiers:(id)a3 entityName:(id)a4 entityType:(int64_t)a5 outerDeviceType:(int64_t)a6 outerDeviceName:(id)a7 deviceType:(int64_t)a8 home:(id)a9 zone:(id)a10 group:(id)a11 room:(id)a12 isExcludeFilter:(BOOL)a13 hasAllQuantifier:(BOOL)a14
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a7;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  v43.receiver = self;
  v43.super_class = (Class)INHomeFilter;
  v26 = [(INHomeFilter *)&v43 init];
  if (v26)
  {
    uint64_t v27 = [v19 copy];
    uint64_t entityIdentifiers = v26->_entityIdentifiers;
    v26->_uint64_t entityIdentifiers = (NSArray *)v27;

    uint64_t v29 = [v20 copy];
    uint64_t entityName = v26->_entityName;
    v26->_uint64_t entityName = (INSpeakableString *)v29;

    v26->_entityType = a5;
    v26->_outerDeviceType = a6;
    uint64_t v31 = [v21 copy];
    uint64_t outerDeviceName = v26->_outerDeviceName;
    v26->_uint64_t outerDeviceName = (INSpeakableString *)v31;

    v26->_deviceType = a8;
    uint64_t v33 = [v22 copy];
    home = v26->_home;
    v26->_home = (INSpeakableString *)v33;

    uint64_t v35 = [v23 copy];
    zone = v26->_zone;
    v26->_zone = (INSpeakableString *)v35;

    uint64_t v37 = [v24 copy];
    group = v26->_group;
    v26->_group = (INSpeakableString *)v37;

    uint64_t v39 = [v25 copy];
    room = v26->_room;
    v26->_room = (INSpeakableString *)v39;

    v26->_isExcludeFilter = a13;
    v26->_hasAllQuantifier = a14;
  }

  return v26;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v41 = [v8 objectForKeyedSubscript:@"entityIdentifiers"];
    v40 = (objc_class *)a1;
    uint64_t v9 = objc_opt_class();
    unint64_t v10 = [v8 objectForKeyedSubscript:@"entityName"];
    uint64_t v39 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v11 = [v8 objectForKeyedSubscript:@"entityType"];
    uint64_t v38 = INHomeEntityTypeWithString(v11);

    unint64_t v12 = [v8 objectForKeyedSubscript:@"outerDeviceType"];
    uint64_t v37 = INHomeDeviceTypeWithString(v12);

    uint64_t v13 = objc_opt_class();
    id v14 = [v8 objectForKeyedSubscript:@"outerDeviceName"];
    unint64_t v15 = [v7 decodeObjectOfClass:v13 from:v14];

    v16 = [v8 objectForKeyedSubscript:@"deviceType"];
    uint64_t v36 = INHomeDeviceTypeWithString(v16);

    uint64_t v17 = objc_opt_class();
    uint64_t v18 = [v8 objectForKeyedSubscript:@"home"];
    id v19 = [v7 decodeObjectOfClass:v17 from:v18];

    uint64_t v20 = objc_opt_class();
    id v21 = [v8 objectForKeyedSubscript:@"zone"];
    id v22 = [v7 decodeObjectOfClass:v20 from:v21];

    uint64_t v23 = objc_opt_class();
    id v24 = [v8 objectForKeyedSubscript:@"group"];
    id v25 = [v7 decodeObjectOfClass:v23 from:v24];

    uint64_t v26 = objc_opt_class();
    uint64_t v27 = [v8 objectForKeyedSubscript:@"room"];
    uint64_t v28 = [v7 decodeObjectOfClass:v26 from:v27];

    uint64_t v29 = [v8 objectForKeyedSubscript:@"isExcludeFilter"];
    char v30 = [v29 BOOLValue];

    uint64_t v31 = [v8 objectForKeyedSubscript:@"hasAllQuantifier"];
    char v32 = [v31 BOOLValue];

    BYTE1(v35) = v32;
    LOBYTE(v35) = v30;
    uint64_t v33 = objc_msgSend([v40 alloc], "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", v41, v39, v38, v37, v15, v36, v19, v22, v25, v28, v35);
  }
  else
  {
    uint64_t v33 = 0;
  }

  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end