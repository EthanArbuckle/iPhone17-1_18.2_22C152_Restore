@interface _INPBHomeFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAccessory;
- (BOOL)hasAllQuantifier;
- (BOOL)hasDeviceType;
- (BOOL)hasEntityName;
- (BOOL)hasEntityType;
- (BOOL)hasGroup;
- (BOOL)hasHasAllQuantifier;
- (BOOL)hasHome;
- (BOOL)hasIsExcludeFilter;
- (BOOL)hasOuterDeviceName;
- (BOOL)hasOuterDeviceType;
- (BOOL)hasRoom;
- (BOOL)hasScene;
- (BOOL)hasService;
- (BOOL)hasServiceType;
- (BOOL)hasSubServiceType;
- (BOOL)hasZone;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExcludeFilter;
- (BOOL)readFrom:(id)a3;
- (NSArray)entityIdentifiers;
- (_INPBDataString)accessory;
- (_INPBDataString)entityName;
- (_INPBDataString)group;
- (_INPBDataString)home;
- (_INPBDataString)outerDeviceName;
- (_INPBDataString)room;
- (_INPBDataString)scene;
- (_INPBDataString)service;
- (_INPBDataString)zone;
- (_INPBHomeFilter)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deviceTypeAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)entityIdentifiersAtIndex:(unint64_t)a3;
- (id)entityTypeAsString:(int)a3;
- (id)outerDeviceTypeAsString:(int)a3;
- (id)serviceTypeAsString:(int)a3;
- (id)subServiceTypeAsString:(int)a3;
- (int)StringAsDeviceType:(id)a3;
- (int)StringAsEntityType:(id)a3;
- (int)StringAsOuterDeviceType:(id)a3;
- (int)StringAsServiceType:(id)a3;
- (int)StringAsSubServiceType:(id)a3;
- (int)deviceType;
- (int)entityType;
- (int)outerDeviceType;
- (int)serviceType;
- (int)subServiceType;
- (unint64_t)entityIdentifiersCount;
- (unint64_t)hash;
- (void)addEntityIdentifiers:(id)a3;
- (void)clearEntityIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setDeviceType:(int)a3;
- (void)setEntityIdentifiers:(id)a3;
- (void)setEntityName:(id)a3;
- (void)setEntityType:(int)a3;
- (void)setGroup:(id)a3;
- (void)setHasAllQuantifier:(BOOL)a3;
- (void)setHasDeviceType:(BOOL)a3;
- (void)setHasEntityType:(BOOL)a3;
- (void)setHasHasAllQuantifier:(BOOL)a3;
- (void)setHasIsExcludeFilter:(BOOL)a3;
- (void)setHasOuterDeviceType:(BOOL)a3;
- (void)setHasServiceType:(BOOL)a3;
- (void)setHasSubServiceType:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setIsExcludeFilter:(BOOL)a3;
- (void)setOuterDeviceName:(id)a3;
- (void)setOuterDeviceType:(int)a3;
- (void)setRoom:(id)a3;
- (void)setScene:(id)a3;
- (void)setService:(id)a3;
- (void)setServiceType:(int)a3;
- (void)setSubServiceType:(int)a3;
- (void)setZone:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBHomeFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_outerDeviceName, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_entityIdentifiers, 0);

  objc_storeStrong((id *)&self->_accessory, 0);
}

- (_INPBDataString)zone
{
  return self->_zone;
}

- (int)subServiceType
{
  return self->_subServiceType;
}

- (int)serviceType
{
  return self->_serviceType;
}

- (_INPBDataString)service
{
  return self->_service;
}

- (_INPBDataString)scene
{
  return self->_scene;
}

- (_INPBDataString)room
{
  return self->_room;
}

- (int)outerDeviceType
{
  return self->_outerDeviceType;
}

- (_INPBDataString)outerDeviceName
{
  return self->_outerDeviceName;
}

- (BOOL)isExcludeFilter
{
  return self->_isExcludeFilter;
}

- (_INPBDataString)home
{
  return self->_home;
}

- (BOOL)hasAllQuantifier
{
  return self->_hasAllQuantifier;
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

- (NSArray)entityIdentifiers
{
  return self->_entityIdentifiers;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (_INPBDataString)accessory
{
  return self->_accessory;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBHomeFilter *)self accessory];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"accessory"];

  if ([(_INPBHomeFilter *)self hasDeviceType])
  {
    uint64_t v6 = [(_INPBHomeFilter *)self deviceType];
    if v6 < 0x32 && ((0x3FFFFF79FFEEFuLL >> v6))
    {
      v7 = off_1E55160A8[v6];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v7 forKeyedSubscript:@"deviceType"];
  }
  if (self->_entityIdentifiers)
  {
    v8 = [(_INPBHomeFilter *)self entityIdentifiers];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"entityIdentifiers"];
  }
  v10 = [(_INPBHomeFilter *)self entityName];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"entityName"];

  if ([(_INPBHomeFilter *)self hasEntityType])
  {
    uint64_t v12 = [(_INPBHomeFilter *)self entityType];
    if (v12 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E5516070[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"entityType"];
  }
  v14 = [(_INPBHomeFilter *)self group];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"group"];

  if ([(_INPBHomeFilter *)self hasHasAllQuantifier])
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBHomeFilter hasAllQuantifier](self, "hasAllQuantifier"));
    [v3 setObject:v16 forKeyedSubscript:@"hasAllQuantifier"];
  }
  v17 = [(_INPBHomeFilter *)self home];
  v18 = [v17 dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:@"home"];

  if ([(_INPBHomeFilter *)self hasIsExcludeFilter])
  {
    v19 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBHomeFilter isExcludeFilter](self, "isExcludeFilter"));
    [v3 setObject:v19 forKeyedSubscript:@"isExcludeFilter"];
  }
  v20 = [(_INPBHomeFilter *)self outerDeviceName];
  v21 = [v20 dictionaryRepresentation];
  [v3 setObject:v21 forKeyedSubscript:@"outerDeviceName"];

  if ([(_INPBHomeFilter *)self hasOuterDeviceType])
  {
    uint64_t v22 = [(_INPBHomeFilter *)self outerDeviceType];
    if v22 < 0x32 && ((0x3FFFFF79FFEEFuLL >> v22))
    {
      v23 = off_1E55160A8[v22];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v22);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v23 forKeyedSubscript:@"outerDeviceType"];
  }
  v24 = [(_INPBHomeFilter *)self room];
  v25 = [v24 dictionaryRepresentation];
  [v3 setObject:v25 forKeyedSubscript:@"room"];

  v26 = [(_INPBHomeFilter *)self scene];
  v27 = [v26 dictionaryRepresentation];
  [v3 setObject:v27 forKeyedSubscript:@"scene"];

  v28 = [(_INPBHomeFilter *)self service];
  v29 = [v28 dictionaryRepresentation];
  [v3 setObject:v29 forKeyedSubscript:@"service"];

  if ([(_INPBHomeFilter *)self hasServiceType])
  {
    uint64_t v30 = [(_INPBHomeFilter *)self serviceType];
    if (v30 >= 0x27)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v30);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E5516238[v30];
    }
    [v3 setObject:v31 forKeyedSubscript:@"serviceType"];
  }
  if ([(_INPBHomeFilter *)self hasSubServiceType])
  {
    uint64_t v32 = [(_INPBHomeFilter *)self subServiceType];
    if ((v32 - 1) >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v32);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = off_1E5516370[(v32 - 1)];
    }
    [v3 setObject:v33 forKeyedSubscript:@"subServiceType"];
  }
  v34 = [(_INPBHomeFilter *)self zone];
  v35 = [v34 dictionaryRepresentation];
  [v3 setObject:v35 forKeyedSubscript:@"zone"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v19 = [(_INPBDataString *)self->_accessory hash];
  if ([(_INPBHomeFilter *)self hasDeviceType]) {
    uint64_t v18 = 2654435761 * self->_deviceType;
  }
  else {
    uint64_t v18 = 0;
  }
  uint64_t v17 = [(NSArray *)self->_entityIdentifiers hash];
  unint64_t v16 = [(_INPBDataString *)self->_entityName hash];
  if ([(_INPBHomeFilter *)self hasEntityType]) {
    uint64_t v15 = 2654435761 * self->_entityType;
  }
  else {
    uint64_t v15 = 0;
  }
  unint64_t v14 = [(_INPBDataString *)self->_group hash];
  if ([(_INPBHomeFilter *)self hasHasAllQuantifier]) {
    uint64_t v13 = 2654435761 * self->_hasAllQuantifier;
  }
  else {
    uint64_t v13 = 0;
  }
  unint64_t v3 = [(_INPBDataString *)self->_home hash];
  if ([(_INPBHomeFilter *)self hasIsExcludeFilter]) {
    uint64_t v4 = 2654435761 * self->_isExcludeFilter;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(_INPBDataString *)self->_outerDeviceName hash];
  if ([(_INPBHomeFilter *)self hasOuterDeviceType]) {
    uint64_t v6 = 2654435761 * self->_outerDeviceType;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(_INPBDataString *)self->_room hash];
  unint64_t v8 = [(_INPBDataString *)self->_scene hash];
  unint64_t v9 = [(_INPBDataString *)self->_service hash];
  if ([(_INPBHomeFilter *)self hasServiceType]) {
    uint64_t v10 = 2654435761 * self->_serviceType;
  }
  else {
    uint64_t v10 = 0;
  }
  if ([(_INPBHomeFilter *)self hasSubServiceType]) {
    uint64_t v11 = 2654435761 * self->_subServiceType;
  }
  else {
    uint64_t v11 = 0;
  }
  return v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(_INPBDataString *)self->_zone hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_80;
  }
  unint64_t v5 = [(_INPBHomeFilter *)self accessory];
  uint64_t v6 = [v4 accessory];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_79;
  }
  uint64_t v7 = [(_INPBHomeFilter *)self accessory];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_INPBHomeFilter *)self accessory];
    uint64_t v10 = [v4 accessory];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_80;
    }
  }
  else
  {
  }
  int v12 = [(_INPBHomeFilter *)self hasDeviceType];
  if (v12 != [v4 hasDeviceType]) {
    goto LABEL_80;
  }
  if ([(_INPBHomeFilter *)self hasDeviceType])
  {
    if ([v4 hasDeviceType])
    {
      int deviceType = self->_deviceType;
      if (deviceType != [v4 deviceType]) {
        goto LABEL_80;
      }
    }
  }
  unint64_t v5 = [(_INPBHomeFilter *)self entityIdentifiers];
  uint64_t v6 = [v4 entityIdentifiers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_79;
  }
  uint64_t v14 = [(_INPBHomeFilter *)self entityIdentifiers];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    unint64_t v16 = [(_INPBHomeFilter *)self entityIdentifiers];
    uint64_t v17 = [v4 entityIdentifiers];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_80;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBHomeFilter *)self entityName];
  uint64_t v6 = [v4 entityName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_79;
  }
  uint64_t v19 = [(_INPBHomeFilter *)self entityName];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBHomeFilter *)self entityName];
    uint64_t v22 = [v4 entityName];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_80;
    }
  }
  else
  {
  }
  int v24 = [(_INPBHomeFilter *)self hasEntityType];
  if (v24 != [v4 hasEntityType]) {
    goto LABEL_80;
  }
  if ([(_INPBHomeFilter *)self hasEntityType])
  {
    if ([v4 hasEntityType])
    {
      int entityType = self->_entityType;
      if (entityType != [v4 entityType]) {
        goto LABEL_80;
      }
    }
  }
  unint64_t v5 = [(_INPBHomeFilter *)self group];
  uint64_t v6 = [v4 group];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_79;
  }
  uint64_t v26 = [(_INPBHomeFilter *)self group];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(_INPBHomeFilter *)self group];
    v29 = [v4 group];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_80;
    }
  }
  else
  {
  }
  int v31 = [(_INPBHomeFilter *)self hasHasAllQuantifier];
  if (v31 != [v4 hasHasAllQuantifier]) {
    goto LABEL_80;
  }
  if ([(_INPBHomeFilter *)self hasHasAllQuantifier])
  {
    if ([v4 hasHasAllQuantifier])
    {
      int hasAllQuantifier = self->_hasAllQuantifier;
      if (hasAllQuantifier != [v4 hasAllQuantifier]) {
        goto LABEL_80;
      }
    }
  }
  unint64_t v5 = [(_INPBHomeFilter *)self home];
  uint64_t v6 = [v4 home];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_79;
  }
  uint64_t v33 = [(_INPBHomeFilter *)self home];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(_INPBHomeFilter *)self home];
    v36 = [v4 home];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_80;
    }
  }
  else
  {
  }
  int v38 = [(_INPBHomeFilter *)self hasIsExcludeFilter];
  if (v38 != [v4 hasIsExcludeFilter]) {
    goto LABEL_80;
  }
  if ([(_INPBHomeFilter *)self hasIsExcludeFilter])
  {
    if ([v4 hasIsExcludeFilter])
    {
      int isExcludeFilter = self->_isExcludeFilter;
      if (isExcludeFilter != [v4 isExcludeFilter]) {
        goto LABEL_80;
      }
    }
  }
  unint64_t v5 = [(_INPBHomeFilter *)self outerDeviceName];
  uint64_t v6 = [v4 outerDeviceName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_79;
  }
  uint64_t v40 = [(_INPBHomeFilter *)self outerDeviceName];
  if (v40)
  {
    v41 = (void *)v40;
    v42 = [(_INPBHomeFilter *)self outerDeviceName];
    v43 = [v4 outerDeviceName];
    int v44 = [v42 isEqual:v43];

    if (!v44) {
      goto LABEL_80;
    }
  }
  else
  {
  }
  int v45 = [(_INPBHomeFilter *)self hasOuterDeviceType];
  if (v45 != [v4 hasOuterDeviceType]) {
    goto LABEL_80;
  }
  if ([(_INPBHomeFilter *)self hasOuterDeviceType])
  {
    if ([v4 hasOuterDeviceType])
    {
      int outerDeviceType = self->_outerDeviceType;
      if (outerDeviceType != [v4 outerDeviceType]) {
        goto LABEL_80;
      }
    }
  }
  unint64_t v5 = [(_INPBHomeFilter *)self room];
  uint64_t v6 = [v4 room];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_79;
  }
  uint64_t v47 = [(_INPBHomeFilter *)self room];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(_INPBHomeFilter *)self room];
    v50 = [v4 room];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_80;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBHomeFilter *)self scene];
  uint64_t v6 = [v4 scene];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_79;
  }
  uint64_t v52 = [(_INPBHomeFilter *)self scene];
  if (v52)
  {
    v53 = (void *)v52;
    v54 = [(_INPBHomeFilter *)self scene];
    v55 = [v4 scene];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_80;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBHomeFilter *)self service];
  uint64_t v6 = [v4 service];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_79;
  }
  uint64_t v57 = [(_INPBHomeFilter *)self service];
  if (v57)
  {
    v58 = (void *)v57;
    v59 = [(_INPBHomeFilter *)self service];
    v60 = [v4 service];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_80;
    }
  }
  else
  {
  }
  int v62 = [(_INPBHomeFilter *)self hasServiceType];
  if (v62 != [v4 hasServiceType]) {
    goto LABEL_80;
  }
  if ([(_INPBHomeFilter *)self hasServiceType])
  {
    if ([v4 hasServiceType])
    {
      int serviceType = self->_serviceType;
      if (serviceType != [v4 serviceType]) {
        goto LABEL_80;
      }
    }
  }
  int v64 = [(_INPBHomeFilter *)self hasSubServiceType];
  if (v64 != [v4 hasSubServiceType]) {
    goto LABEL_80;
  }
  if ([(_INPBHomeFilter *)self hasSubServiceType])
  {
    if ([v4 hasSubServiceType])
    {
      int subServiceType = self->_subServiceType;
      if (subServiceType != [v4 subServiceType]) {
        goto LABEL_80;
      }
    }
  }
  unint64_t v5 = [(_INPBHomeFilter *)self zone];
  uint64_t v6 = [v4 zone];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v66 = [(_INPBHomeFilter *)self zone];
    if (!v66)
    {

LABEL_83:
      BOOL v71 = 1;
      goto LABEL_81;
    }
    v67 = (void *)v66;
    v68 = [(_INPBHomeFilter *)self zone];
    v69 = [v4 zone];
    char v70 = [v68 isEqual:v69];

    if (v70) {
      goto LABEL_83;
    }
  }
  else
  {
LABEL_79:
  }
LABEL_80:
  BOOL v71 = 0;
LABEL_81:

  return v71;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBHomeFilter allocWithZone:](_INPBHomeFilter, "allocWithZone:") init];
  id v6 = [(_INPBDataString *)self->_accessory copyWithZone:a3];
  [(_INPBHomeFilter *)v5 setAccessory:v6];

  if ([(_INPBHomeFilter *)self hasDeviceType]) {
    [(_INPBHomeFilter *)v5 setDeviceType:[(_INPBHomeFilter *)self deviceType]];
  }
  uint64_t v7 = (void *)[(NSArray *)self->_entityIdentifiers copyWithZone:a3];
  [(_INPBHomeFilter *)v5 setEntityIdentifiers:v7];

  id v8 = [(_INPBDataString *)self->_entityName copyWithZone:a3];
  [(_INPBHomeFilter *)v5 setEntityName:v8];

  if ([(_INPBHomeFilter *)self hasEntityType]) {
    [(_INPBHomeFilter *)v5 setEntityType:[(_INPBHomeFilter *)self entityType]];
  }
  id v9 = [(_INPBDataString *)self->_group copyWithZone:a3];
  [(_INPBHomeFilter *)v5 setGroup:v9];

  if ([(_INPBHomeFilter *)self hasHasAllQuantifier]) {
    [(_INPBHomeFilter *)v5 setHasAllQuantifier:[(_INPBHomeFilter *)self hasAllQuantifier]];
  }
  id v10 = [(_INPBDataString *)self->_home copyWithZone:a3];
  [(_INPBHomeFilter *)v5 setHome:v10];

  if ([(_INPBHomeFilter *)self hasIsExcludeFilter]) {
    [(_INPBHomeFilter *)v5 setIsExcludeFilter:[(_INPBHomeFilter *)self isExcludeFilter]];
  }
  id v11 = [(_INPBDataString *)self->_outerDeviceName copyWithZone:a3];
  [(_INPBHomeFilter *)v5 setOuterDeviceName:v11];

  if ([(_INPBHomeFilter *)self hasOuterDeviceType]) {
    [(_INPBHomeFilter *)v5 setOuterDeviceType:[(_INPBHomeFilter *)self outerDeviceType]];
  }
  id v12 = [(_INPBDataString *)self->_room copyWithZone:a3];
  [(_INPBHomeFilter *)v5 setRoom:v12];

  id v13 = [(_INPBDataString *)self->_scene copyWithZone:a3];
  [(_INPBHomeFilter *)v5 setScene:v13];

  id v14 = [(_INPBDataString *)self->_service copyWithZone:a3];
  [(_INPBHomeFilter *)v5 setService:v14];

  if ([(_INPBHomeFilter *)self hasServiceType]) {
    [(_INPBHomeFilter *)v5 setServiceType:[(_INPBHomeFilter *)self serviceType]];
  }
  if ([(_INPBHomeFilter *)self hasSubServiceType]) {
    [(_INPBHomeFilter *)v5 setSubServiceType:[(_INPBHomeFilter *)self subServiceType]];
  }
  id v15 = [(_INPBDataString *)self->_zone copyWithZone:a3];
  [(_INPBHomeFilter *)v5 setZone:v15];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBHomeFilter *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBHomeFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBHomeFilter *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBHomeFilter *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBHomeFilter *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_INPBHomeFilter *)self accessory];

  if (v5)
  {
    id v6 = [(_INPBHomeFilter *)self accessory];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBHomeFilter *)self hasDeviceType]) {
    PBDataWriterWriteInt32Field();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v7 = self->_entityIdentifiers;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v9);
  }

  id v12 = [(_INPBHomeFilter *)self entityName];

  if (v12)
  {
    id v13 = [(_INPBHomeFilter *)self entityName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBHomeFilter *)self hasEntityType]) {
    PBDataWriterWriteInt32Field();
  }
  id v14 = [(_INPBHomeFilter *)self group];

  if (v14)
  {
    id v15 = [(_INPBHomeFilter *)self group];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBHomeFilter *)self hasHasAllQuantifier]) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v16 = [(_INPBHomeFilter *)self home];

  if (v16)
  {
    uint64_t v17 = [(_INPBHomeFilter *)self home];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBHomeFilter *)self hasIsExcludeFilter]) {
    PBDataWriterWriteBOOLField();
  }
  int v18 = [(_INPBHomeFilter *)self outerDeviceName];

  if (v18)
  {
    uint64_t v19 = [(_INPBHomeFilter *)self outerDeviceName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBHomeFilter *)self hasOuterDeviceType]) {
    PBDataWriterWriteInt32Field();
  }
  v20 = [(_INPBHomeFilter *)self room];

  if (v20)
  {
    v21 = [(_INPBHomeFilter *)self room];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v22 = [(_INPBHomeFilter *)self scene];

  if (v22)
  {
    int v23 = [(_INPBHomeFilter *)self scene];
    PBDataWriterWriteSubmessage();
  }
  int v24 = [(_INPBHomeFilter *)self service];

  if (v24)
  {
    v25 = [(_INPBHomeFilter *)self service];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBHomeFilter *)self hasServiceType]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBHomeFilter *)self hasSubServiceType]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v26 = [(_INPBHomeFilter *)self zone];

  if (v26)
  {
    v27 = [(_INPBHomeFilter *)self zone];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHomeFilterReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasZone
{
  return self->_zone != 0;
}

- (void)setZone:(id)a3
{
}

- (int)StringAsSubServiceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GENERIC_VALVE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IRRIGATION_VALVE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SHOWERHEAD_VALVE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FAUCET_VALVE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)subServiceTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5516370[a3 - 1];
  }

  return v3;
}

- (void)setHasSubServiceType:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSubServiceType
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setSubServiceType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xBF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x40;
    self->_int subServiceType = a3;
  }
}

- (int)StringAsServiceType:(id)a3
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
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"OUTLET"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"DOOR_LOCK"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MOTORIZED_DOOR"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SECURITY_SYSTEM"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"MOTORIZED_WINDOW"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SHADES"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SPEAKER"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"HEATER_COOLER"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"HUMIDIFIER_DEHUMIDIFIER"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SLAT"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"IRRIGATION_SYSTEM"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"VALVE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"FAUCET"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"TELEVISION"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"IP_CAMERA"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"CUSTOM"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"TEMPERATURE_SENSOR"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"HUMIDITY_SENSOR"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"AIR_QUALITY_SENSOR"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"SMOKE_SENSOR"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"CARBON_MONOXIDE_SENSOR"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"CARBON_DIOXIDE_SENSOR"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"CONTACT_SENSOR"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"OCCUPANCY_SENSOR"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"MOTION_SENSOR"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"LIGHT_SENSOR"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"LEAK_SENSOR"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"BATTERY_SERVICE"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"DOOR_BELL"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"AIR_PURIFIER"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"FILTER_MAINTENANCE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"APPLE_TV"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"AIRPORT_EXPRESS"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"CAMERA_RECORDING"])
  {
    int v4 = 38;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)serviceTypeAsString:(int)a3
{
  if (a3 >= 0x27)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5516238[a3];
  }

  return v3;
}

- (void)setHasServiceType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasServiceType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setServiceType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xDF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x20;
    self->_int serviceType = a3;
  }
}

- (BOOL)hasService
{
  return self->_service != 0;
}

- (void)setService:(id)a3
{
}

- (BOOL)hasScene
{
  return self->_scene != 0;
}

- (void)setScene:(id)a3
{
}

- (BOOL)hasRoom
{
  return self->_room != 0;
}

- (void)setRoom:(id)a3
{
}

- (int)StringAsOuterDeviceType:(id)a3
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

- (id)outerDeviceTypeAsString:(int)a3
{
  if a3 < 0x32 && ((0x3FFFFF79FFEEFuLL >> a3))
  {
    id v3 = off_1E55160A8[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)setHasOuterDeviceType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOuterDeviceType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setOuterDeviceType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xEF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x10;
    self->_int outerDeviceType = a3;
  }
}

- (BOOL)hasOuterDeviceName
{
  return self->_outerDeviceName != 0;
}

- (void)setOuterDeviceName:(id)a3
{
}

- (void)setHasIsExcludeFilter:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsExcludeFilter
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsExcludeFilter:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isExcludeFilter = a3;
}

- (BOOL)hasHome
{
  return self->_home != 0;
}

- (void)setHome:(id)a3
{
}

- (void)setHasHasAllQuantifier:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHasAllQuantifier
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasAllQuantifier:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int hasAllQuantifier = a3;
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
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5516070[a3];
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

- (id)entityIdentifiersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_entityIdentifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)entityIdentifiersCount
{
  return [(NSArray *)self->_entityIdentifiers count];
}

- (void)addEntityIdentifiers:(id)a3
{
  id v4 = a3;
  entityIdentifiers = self->_entityIdentifiers;
  id v8 = v4;
  if (!entityIdentifiers)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_entityIdentifiers;
    self->_entityIdentifiers = v6;

    id v4 = v8;
    entityIdentifiers = self->_entityIdentifiers;
  }
  [(NSArray *)entityIdentifiers addObject:v4];
}

- (void)clearEntityIdentifiers
{
}

- (void)setEntityIdentifiers:(id)a3
{
  self->_entityIdentifiers = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
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
    id v3 = off_1E55160A8[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
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

- (BOOL)hasAccessory
{
  return self->_accessory != 0;
}

- (void)setAccessory:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end