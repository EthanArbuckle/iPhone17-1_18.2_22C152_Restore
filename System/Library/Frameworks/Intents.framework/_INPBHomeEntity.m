@interface _INPBHomeEntity
+ (BOOL)supportsSecureCoding;
+ (Class)zonesType;
- (BOOL)hasDeviceType;
- (BOOL)hasEntityIdentifier;
- (BOOL)hasEntityName;
- (BOOL)hasEntityType;
- (BOOL)hasGroup;
- (BOOL)hasHome;
- (BOOL)hasName;
- (BOOL)hasRoom;
- (BOOL)hasSceneType;
- (BOOL)hasZone;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)zones;
- (NSString)entityIdentifier;
- (_INPBDataString)entityName;
- (_INPBDataString)group;
- (_INPBDataString)home;
- (_INPBDataString)room;
- (_INPBDataString)zone;
- (_INPBHomeEntity)initWithCoder:(id)a3;
- (_INPBString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deviceTypeAsString:(int)a3;
- (id)deviceTypesAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)entityTypeAsString:(int)a3;
- (id)sceneTypeAsString:(int)a3;
- (id)zonesAtIndex:(unint64_t)a3;
- (int)StringAsDeviceType:(id)a3;
- (int)StringAsDeviceTypes:(id)a3;
- (int)StringAsEntityType:(id)a3;
- (int)StringAsSceneType:(id)a3;
- (int)deviceType;
- (int)deviceTypes;
- (int)deviceTypesAtIndex:(unint64_t)a3;
- (int)entityType;
- (int)sceneType;
- (unint64_t)deviceTypesCount;
- (unint64_t)hash;
- (unint64_t)zonesCount;
- (void)addDeviceTypes:(int)a3;
- (void)addZones:(id)a3;
- (void)clearDeviceTypes;
- (void)clearZones;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceType:(int)a3;
- (void)setDeviceTypes:(int *)a3 count:(unint64_t)a4;
- (void)setEntityIdentifier:(id)a3;
- (void)setEntityName:(id)a3;
- (void)setEntityType:(int)a3;
- (void)setGroup:(id)a3;
- (void)setHasDeviceType:(BOOL)a3;
- (void)setHasEntityType:(BOOL)a3;
- (void)setHasSceneType:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setName:(id)a3;
- (void)setRoom:(id)a3;
- (void)setSceneType:(int)a3;
- (void)setZone:(id)a3;
- (void)setZones:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBHomeEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zones, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_entityName, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSArray)zones
{
  return self->_zones;
}

- (_INPBDataString)zone
{
  return self->_zone;
}

- (int)sceneType
{
  return self->_sceneType;
}

- (_INPBDataString)room
{
  return self->_room;
}

- (_INPBString)name
{
  return self->_name;
}

- (_INPBDataString)home
{
  return self->_home;
}

- (_INPBDataString)group
{
  return self->_group;
}

- (int)entityType
{
  return self->_entityType;
}

- (_INPBDataString)entityName
{
  return self->_entityName;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (id)dictionaryRepresentation
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBHomeEntity *)self hasDeviceType])
  {
    uint64_t v4 = [(_INPBHomeEntity *)self deviceType];
    if v4 < 0x32 && ((0x3FFFFF79FFEEFuLL >> v4))
    {
      v5 = *(&off_1E5516B50 + v4);
    }
    else
    {
      v5 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
    }
    [v3 setObject:v5 forKeyedSubscript:@"deviceType"];
  }
  if (self->_deviceTypes.count)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBHomeEntity deviceTypesCount](self, "deviceTypesCount"));
    if ([(_INPBHomeEntity *)self deviceTypesCount])
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = self->_deviceTypes.list[v7];
        if v8 < 0x32 && ((0x3FFFFF79FFEEFuLL >> v8))
        {
          v9 = *(&off_1E5516B50 + v8);
        }
        else
        {
          v9 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_deviceTypes.list[v7]);
        }
        [v6 addObject:v9];

        ++v7;
      }
      while (v7 < [(_INPBHomeEntity *)self deviceTypesCount]);
    }
    [v3 setObject:v6 forKeyedSubscript:@"deviceTypes"];
  }
  if (self->_entityIdentifier)
  {
    v10 = [(_INPBHomeEntity *)self entityIdentifier];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"entityIdentifier"];
  }
  v12 = [(_INPBHomeEntity *)self entityName];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"entityName"];

  if ([(_INPBHomeEntity *)self hasEntityType])
  {
    uint64_t v14 = [(_INPBHomeEntity *)self entityType];
    if (v14 >= 7)
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
    }
    else
    {
      v15 = *(&off_1E5516CE0 + v14);
    }
    [v3 setObject:v15 forKeyedSubscript:@"entityType"];
  }
  v16 = [(_INPBHomeEntity *)self group];
  v17 = [v16 dictionaryRepresentation];
  [v3 setObject:v17 forKeyedSubscript:@"group"];

  v18 = [(_INPBHomeEntity *)self home];
  v19 = [v18 dictionaryRepresentation];
  [v3 setObject:v19 forKeyedSubscript:@"home"];

  v20 = [(_INPBHomeEntity *)self name];
  v21 = [v20 dictionaryRepresentation];
  [v3 setObject:v21 forKeyedSubscript:@"name"];

  v22 = [(_INPBHomeEntity *)self room];
  v23 = [v22 dictionaryRepresentation];
  [v3 setObject:v23 forKeyedSubscript:@"room"];

  if ([(_INPBHomeEntity *)self hasSceneType])
  {
    uint64_t v24 = [(_INPBHomeEntity *)self sceneType];
    if (v24 >= 5)
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v24);
    }
    else
    {
      v25 = *(&off_1E5516D18 + v24);
    }
    [v3 setObject:v25 forKeyedSubscript:@"sceneType"];
  }
  v26 = [(_INPBHomeEntity *)self zone];
  v27 = [v26 dictionaryRepresentation];
  [v3 setObject:v27 forKeyedSubscript:@"zone"];

  if ([(NSArray *)self->_zones count])
  {
    v28 = [MEMORY[0x1E4F1CA48] array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v29 = self->_zones;
    uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v37 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dictionaryRepresentation];
          [v28 addObject:v34];
        }
        uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v31);
    }

    [v3 setObject:v28 forKeyedSubscript:@"zones"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBHomeEntity *)self hasDeviceType]) {
    uint64_t v15 = 2654435761 * self->_deviceType;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v3 = PBRepeatedInt32Hash();
  NSUInteger v4 = [(NSString *)self->_entityIdentifier hash];
  unint64_t v5 = [(_INPBDataString *)self->_entityName hash];
  if ([(_INPBHomeEntity *)self hasEntityType]) {
    uint64_t v6 = 2654435761 * self->_entityType;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(_INPBDataString *)self->_group hash];
  unint64_t v8 = [(_INPBDataString *)self->_home hash];
  unint64_t v9 = [(_INPBString *)self->_name hash];
  unint64_t v10 = [(_INPBDataString *)self->_room hash];
  if ([(_INPBHomeEntity *)self hasSceneType]) {
    uint64_t v11 = 2654435761 * self->_sceneType;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = v3 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  unint64_t v13 = v10 ^ v11 ^ [(_INPBDataString *)self->_zone hash];
  return v12 ^ v13 ^ [(NSArray *)self->_zones hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_55;
  }
  int v5 = [(_INPBHomeEntity *)self hasDeviceType];
  if (v5 != [v4 hasDeviceType]) {
    goto LABEL_55;
  }
  if ([(_INPBHomeEntity *)self hasDeviceType])
  {
    if ([v4 hasDeviceType])
    {
      int deviceType = self->_deviceType;
      if (deviceType != [v4 deviceType]) {
        goto LABEL_55;
      }
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_55;
  }
  unint64_t v7 = [(_INPBHomeEntity *)self entityIdentifier];
  unint64_t v8 = [v4 entityIdentifier];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_54;
  }
  uint64_t v9 = [(_INPBHomeEntity *)self entityIdentifier];
  if (v9)
  {
    unint64_t v10 = (void *)v9;
    uint64_t v11 = [(_INPBHomeEntity *)self entityIdentifier];
    NSUInteger v12 = [v4 entityIdentifier];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_55;
    }
  }
  else
  {
  }
  unint64_t v7 = [(_INPBHomeEntity *)self entityName];
  unint64_t v8 = [v4 entityName];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_54;
  }
  uint64_t v14 = [(_INPBHomeEntity *)self entityName];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    v16 = [(_INPBHomeEntity *)self entityName];
    v17 = [v4 entityName];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_55;
    }
  }
  else
  {
  }
  int v19 = [(_INPBHomeEntity *)self hasEntityType];
  if (v19 != [v4 hasEntityType]) {
    goto LABEL_55;
  }
  if ([(_INPBHomeEntity *)self hasEntityType])
  {
    if ([v4 hasEntityType])
    {
      int entityType = self->_entityType;
      if (entityType != [v4 entityType]) {
        goto LABEL_55;
      }
    }
  }
  unint64_t v7 = [(_INPBHomeEntity *)self group];
  unint64_t v8 = [v4 group];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_54;
  }
  uint64_t v21 = [(_INPBHomeEntity *)self group];
  if (v21)
  {
    v22 = (void *)v21;
    v23 = [(_INPBHomeEntity *)self group];
    uint64_t v24 = [v4 group];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_55;
    }
  }
  else
  {
  }
  unint64_t v7 = [(_INPBHomeEntity *)self home];
  unint64_t v8 = [v4 home];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_54;
  }
  uint64_t v26 = [(_INPBHomeEntity *)self home];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(_INPBHomeEntity *)self home];
    v29 = [v4 home];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_55;
    }
  }
  else
  {
  }
  unint64_t v7 = [(_INPBHomeEntity *)self name];
  unint64_t v8 = [v4 name];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_54;
  }
  uint64_t v31 = [(_INPBHomeEntity *)self name];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    v33 = [(_INPBHomeEntity *)self name];
    v34 = [v4 name];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_55;
    }
  }
  else
  {
  }
  unint64_t v7 = [(_INPBHomeEntity *)self room];
  unint64_t v8 = [v4 room];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_54;
  }
  uint64_t v36 = [(_INPBHomeEntity *)self room];
  if (v36)
  {
    long long v37 = (void *)v36;
    long long v38 = [(_INPBHomeEntity *)self room];
    long long v39 = [v4 room];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_55;
    }
  }
  else
  {
  }
  int v41 = [(_INPBHomeEntity *)self hasSceneType];
  if (v41 != [v4 hasSceneType]) {
    goto LABEL_55;
  }
  if ([(_INPBHomeEntity *)self hasSceneType])
  {
    if ([v4 hasSceneType])
    {
      int sceneType = self->_sceneType;
      if (sceneType != [v4 sceneType]) {
        goto LABEL_55;
      }
    }
  }
  unint64_t v7 = [(_INPBHomeEntity *)self zone];
  unint64_t v8 = [v4 zone];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_54;
  }
  uint64_t v43 = [(_INPBHomeEntity *)self zone];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(_INPBHomeEntity *)self zone];
    v46 = [v4 zone];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_55;
    }
  }
  else
  {
  }
  unint64_t v7 = [(_INPBHomeEntity *)self zones];
  unint64_t v8 = [v4 zones];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v48 = [(_INPBHomeEntity *)self zones];
    if (!v48)
    {

LABEL_58:
      BOOL v53 = 1;
      goto LABEL_56;
    }
    v49 = (void *)v48;
    v50 = [(_INPBHomeEntity *)self zones];
    v51 = [v4 zones];
    char v52 = [v50 isEqual:v51];

    if (v52) {
      goto LABEL_58;
    }
  }
  else
  {
LABEL_54:
  }
LABEL_55:
  BOOL v53 = 0;
LABEL_56:

  return v53;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBHomeEntity allocWithZone:](_INPBHomeEntity, "allocWithZone:") init];
  if ([(_INPBHomeEntity *)self hasDeviceType]) {
    [(_INPBHomeEntity *)v5 setDeviceType:[(_INPBHomeEntity *)self deviceType]];
  }
  PBRepeatedInt32Copy();
  uint64_t v6 = (void *)[(NSString *)self->_entityIdentifier copyWithZone:a3];
  [(_INPBHomeEntity *)v5 setEntityIdentifier:v6];

  id v7 = [(_INPBDataString *)self->_entityName copyWithZone:a3];
  [(_INPBHomeEntity *)v5 setEntityName:v7];

  if ([(_INPBHomeEntity *)self hasEntityType]) {
    [(_INPBHomeEntity *)v5 setEntityType:[(_INPBHomeEntity *)self entityType]];
  }
  id v8 = [(_INPBDataString *)self->_group copyWithZone:a3];
  [(_INPBHomeEntity *)v5 setGroup:v8];

  id v9 = [(_INPBDataString *)self->_home copyWithZone:a3];
  [(_INPBHomeEntity *)v5 setHome:v9];

  id v10 = [(_INPBString *)self->_name copyWithZone:a3];
  [(_INPBHomeEntity *)v5 setName:v10];

  id v11 = [(_INPBDataString *)self->_room copyWithZone:a3];
  [(_INPBHomeEntity *)v5 setRoom:v11];

  if ([(_INPBHomeEntity *)self hasSceneType]) {
    [(_INPBHomeEntity *)v5 setSceneType:[(_INPBHomeEntity *)self sceneType]];
  }
  id v12 = [(_INPBDataString *)self->_zone copyWithZone:a3];
  [(_INPBHomeEntity *)v5 setZone:v12];

  int v13 = (void *)[(NSArray *)self->_zones copyWithZone:a3];
  [(_INPBHomeEntity *)v5 setZones:v13];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBHomeEntity *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBHomeEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBHomeEntity *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBHomeEntity *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBHomeEntity *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBHomeEntity *)self clearDeviceTypes];
  v3.receiver = self;
  v3.super_class = (Class)_INPBHomeEntity;
  [(_INPBHomeEntity *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBHomeEntity *)self hasDeviceType]) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_deviceTypes.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_deviceTypes.count);
  }
  id v6 = [(_INPBHomeEntity *)self entityIdentifier];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBHomeEntity *)self entityName];

  if (v7)
  {
    id v8 = [(_INPBHomeEntity *)self entityName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBHomeEntity *)self hasEntityType]) {
    PBDataWriterWriteInt32Field();
  }
  id v9 = [(_INPBHomeEntity *)self group];

  if (v9)
  {
    id v10 = [(_INPBHomeEntity *)self group];
    PBDataWriterWriteSubmessage();
  }
  id v11 = [(_INPBHomeEntity *)self home];

  if (v11)
  {
    id v12 = [(_INPBHomeEntity *)self home];
    PBDataWriterWriteSubmessage();
  }
  int v13 = [(_INPBHomeEntity *)self name];

  if (v13)
  {
    uint64_t v14 = [(_INPBHomeEntity *)self name];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v15 = [(_INPBHomeEntity *)self room];

  if (v15)
  {
    v16 = [(_INPBHomeEntity *)self room];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBHomeEntity *)self hasSceneType]) {
    PBDataWriterWriteInt32Field();
  }
  v17 = [(_INPBHomeEntity *)self zone];

  if (v17)
  {
    int v18 = [(_INPBHomeEntity *)self zone];
    PBDataWriterWriteSubmessage();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int v19 = self->_zones;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v21);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHomeEntityReadFrom(self, (uint64_t)a3);
}

- (id)zonesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_zones objectAtIndexedSubscript:a3];
}

- (unint64_t)zonesCount
{
  return [(NSArray *)self->_zones count];
}

- (void)addZones:(id)a3
{
  id v4 = a3;
  zones = self->_zones;
  id v8 = v4;
  if (!zones)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_zones;
    self->_zones = v6;

    id v4 = v8;
    zones = self->_zones;
  }
  [(NSArray *)zones addObject:v4];
}

- (void)clearZones
{
}

- (void)setZones:(id)a3
{
  self->_zones = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasZone
{
  return self->_zone != 0;
}

- (void)setZone:(id)a3
{
}

- (int)StringAsSceneType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"USER_DEFINED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GOOD_MORNING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IM_LEAVING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"IM_HOME"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GOOD_NIGHT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)sceneTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5516D18 + a3);
  }

  return v3;
}

- (void)setHasSceneType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSceneType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSceneType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_int sceneType = a3;
  }
}

- (BOOL)hasRoom
{
  return self->_room != 0;
}

- (void)setRoom:(id)a3
{
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setName:(id)a3
{
}

- (BOOL)hasHome
{
  return self->_home != 0;
}

- (void)setHome:(id)a3
{
}

- (BOOL)hasGroup
{
  return self->_group != 0;
}

- (void)setGroup:(id)a3
{
}

- (int)StringAsEntityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"HOME"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ZONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ROOM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GROUP"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SCENE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TRIGGER"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DEVICE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)entityTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5516CE0 + a3);
  }

  return v3;
}

- (void)setHasEntityType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEntityType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEntityType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int entityType = a3;
  }
}

- (BOOL)hasEntityName
{
  return self->_entityName != 0;
}

- (void)setEntityName:(id)a3
{
}

- (BOOL)hasEntityIdentifier
{
  return self->_entityIdentifier != 0;
}

- (void)setEntityIdentifier:(id)a3
{
  self->_entityIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (int)StringAsDeviceTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LIGHTBULB"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SWITCH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"THERMOSTAT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GARAGE_DOOR_OPENER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FAN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"OUTLET"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DOOR_LOCK"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AIR_QUALITY_SENSOR"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"BATTERY"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CARBON_DIOXIDE_SENSOR"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"CARBON_MONOXIDE_SENSOR"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"CONTACT_SENSOR"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"DOOR"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"HUMIDITY_SENSOR"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"LEAK_SENSOR"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"LIGHT_SENSOR"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"MOTION_SENSOR"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"OCCUPANCY_SENSOR"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"SECURITY_SYSTEM"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"SMOKE_SENSOR"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"TEMPERATURE_SENSOR"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"WINDOW"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"SHADES"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"IP_CAMERA"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"MICROPHONE"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"SPEAKER"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"MOTORIZED_DOOR"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"MOTORIZED_WINDOW"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"HEATER_COOLER"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"HUMIDIFIER_DEHUMIDIFIER"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"SLAT"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"SPRINKLER"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"VALVE"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"FAUCET"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"SHOWER"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"TELEVISION"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"CUSTOM"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"DOOR_BELL"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"AIR_PURIFIER"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"FILTER"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"APPLE_TV"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"CAMERA_RECORDING"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"SENSOR"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"AIRPORT_EXPRESS"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"SINK"])
  {
    int v4 = 49;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)deviceTypesAsString:(int)a3
{
  if a3 < 0x32 && ((0x3FFFFF79FFEEFuLL >> a3))
  {
    id v3 = *(&off_1E5516B50 + a3);
  }
  else
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }

  return v3;
}

- (int)deviceTypesAtIndex:(unint64_t)a3
{
  return self->_deviceTypes.list[a3];
}

- (unint64_t)deviceTypesCount
{
  return self->_deviceTypes.count;
}

- (void)addDeviceTypes:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearDeviceTypes
{
}

- (int)deviceTypes
{
  return self->_deviceTypes.list;
}

- (void)setDeviceTypes:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsDeviceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LIGHTBULB"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SWITCH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"THERMOSTAT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GARAGE_DOOR_OPENER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FAN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"OUTLET"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DOOR_LOCK"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AIR_QUALITY_SENSOR"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"BATTERY"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CARBON_DIOXIDE_SENSOR"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"CARBON_MONOXIDE_SENSOR"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"CONTACT_SENSOR"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"DOOR"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"HUMIDITY_SENSOR"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"LEAK_SENSOR"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"LIGHT_SENSOR"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"MOTION_SENSOR"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"OCCUPANCY_SENSOR"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"SECURITY_SYSTEM"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"SMOKE_SENSOR"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"TEMPERATURE_SENSOR"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"WINDOW"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"SHADES"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"IP_CAMERA"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"MICROPHONE"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"SPEAKER"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"MOTORIZED_DOOR"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"MOTORIZED_WINDOW"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"HEATER_COOLER"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"HUMIDIFIER_DEHUMIDIFIER"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"SLAT"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"SPRINKLER"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"VALVE"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"FAUCET"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"SHOWER"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"TELEVISION"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"CUSTOM"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"DOOR_BELL"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"AIR_PURIFIER"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"FILTER"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"APPLE_TV"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"CAMERA_RECORDING"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"SENSOR"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"AIRPORT_EXPRESS"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"SINK"])
  {
    int v4 = 49;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)deviceTypeAsString:(int)a3
{
  if a3 < 0x32 && ((0x3FFFFF79FFEEFuLL >> a3))
  {
    id v3 = *(&off_1E5516B50 + a3);
  }
  else
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }

  return v3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeviceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeviceType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int deviceType = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)zonesType
{
  return (Class)objc_opt_class();
}

@end