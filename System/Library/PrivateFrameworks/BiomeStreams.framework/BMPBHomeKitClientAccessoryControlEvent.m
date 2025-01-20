@interface BMPBHomeKitClientAccessoryControlEvent
+ (Class)zoneNamesType;
+ (Class)zoneUniqueIdentifiersType;
- (BMPBAccessoryState)accessoryState;
- (BMPBHomeKitClientBase)base;
- (BOOL)hasAccessoryName;
- (BOOL)hasAccessoryState;
- (BOOL)hasAccessoryUniqueIdentifier;
- (BOOL)hasBase;
- (BOOL)hasCharacteristicType;
- (BOOL)hasHomeName;
- (BOOL)hasRoomName;
- (BOOL)hasRoomUniqueIdentifier;
- (BOOL)hasServiceGroupName;
- (BOOL)hasServiceGroupUniqueIdentifier;
- (BOOL)hasServiceName;
- (BOOL)hasServiceType;
- (BOOL)hasServiceUniqueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)zoneNames;
- (NSMutableArray)zoneUniqueIdentifiers;
- (NSString)accessoryName;
- (NSString)accessoryUniqueIdentifier;
- (NSString)characteristicType;
- (NSString)homeName;
- (NSString)roomName;
- (NSString)roomUniqueIdentifier;
- (NSString)serviceGroupName;
- (NSString)serviceGroupUniqueIdentifier;
- (NSString)serviceName;
- (NSString)serviceType;
- (NSString)serviceUniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)zoneNamesAtIndex:(unint64_t)a3;
- (id)zoneUniqueIdentifiersAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)zoneNamesCount;
- (unint64_t)zoneUniqueIdentifiersCount;
- (void)addZoneNames:(id)a3;
- (void)addZoneUniqueIdentifiers:(id)a3;
- (void)clearZoneNames;
- (void)clearZoneUniqueIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessoryName:(id)a3;
- (void)setAccessoryState:(id)a3;
- (void)setAccessoryUniqueIdentifier:(id)a3;
- (void)setBase:(id)a3;
- (void)setCharacteristicType:(id)a3;
- (void)setHomeName:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setRoomUniqueIdentifier:(id)a3;
- (void)setServiceGroupName:(id)a3;
- (void)setServiceGroupUniqueIdentifier:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setServiceUniqueIdentifier:(id)a3;
- (void)setZoneNames:(id)a3;
- (void)setZoneUniqueIdentifiers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBHomeKitClientAccessoryControlEvent

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasAccessoryUniqueIdentifier
{
  return self->_accessoryUniqueIdentifier != 0;
}

- (BOOL)hasAccessoryState
{
  return self->_accessoryState != 0;
}

- (BOOL)hasServiceUniqueIdentifier
{
  return self->_serviceUniqueIdentifier != 0;
}

- (BOOL)hasServiceType
{
  return self->_serviceType != 0;
}

- (BOOL)hasCharacteristicType
{
  return self->_characteristicType != 0;
}

- (BOOL)hasServiceGroupUniqueIdentifier
{
  return self->_serviceGroupUniqueIdentifier != 0;
}

- (void)clearZoneUniqueIdentifiers
{
}

- (void)addZoneUniqueIdentifiers:(id)a3
{
  id v4 = a3;
  zoneUniqueIdentifiers = self->_zoneUniqueIdentifiers;
  id v8 = v4;
  if (!zoneUniqueIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_zoneUniqueIdentifiers;
    self->_zoneUniqueIdentifiers = v6;

    id v4 = v8;
    zoneUniqueIdentifiers = self->_zoneUniqueIdentifiers;
  }
  [(NSMutableArray *)zoneUniqueIdentifiers addObject:v4];
}

- (unint64_t)zoneUniqueIdentifiersCount
{
  return [(NSMutableArray *)self->_zoneUniqueIdentifiers count];
}

- (id)zoneUniqueIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_zoneUniqueIdentifiers objectAtIndex:a3];
}

+ (Class)zoneUniqueIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRoomUniqueIdentifier
{
  return self->_roomUniqueIdentifier != 0;
}

- (BOOL)hasAccessoryName
{
  return self->_accessoryName != 0;
}

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (BOOL)hasRoomName
{
  return self->_roomName != 0;
}

- (BOOL)hasServiceGroupName
{
  return self->_serviceGroupName != 0;
}

- (void)clearZoneNames
{
}

- (void)addZoneNames:(id)a3
{
  id v4 = a3;
  zoneNames = self->_zoneNames;
  id v8 = v4;
  if (!zoneNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_zoneNames;
    self->_zoneNames = v6;

    id v4 = v8;
    zoneNames = self->_zoneNames;
  }
  [(NSMutableArray *)zoneNames addObject:v4];
}

- (unint64_t)zoneNamesCount
{
  return [(NSMutableArray *)self->_zoneNames count];
}

- (id)zoneNamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_zoneNames objectAtIndex:a3];
}

+ (Class)zoneNamesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasHomeName
{
  return self->_homeName != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBHomeKitClientAccessoryControlEvent;
  id v4 = [(BMPBHomeKitClientAccessoryControlEvent *)&v8 description];
  v5 = [(BMPBHomeKitClientAccessoryControlEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  base = self->_base;
  if (base)
  {
    v5 = [(BMPBHomeKitClientBase *)base dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"base"];
  }
  accessoryUniqueIdentifier = self->_accessoryUniqueIdentifier;
  if (accessoryUniqueIdentifier) {
    [v3 setObject:accessoryUniqueIdentifier forKey:@"accessoryUniqueIdentifier"];
  }
  accessoryState = self->_accessoryState;
  if (accessoryState)
  {
    objc_super v8 = [(BMPBAccessoryState *)accessoryState dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"accessoryState"];
  }
  serviceUniqueIdentifier = self->_serviceUniqueIdentifier;
  if (serviceUniqueIdentifier) {
    [v3 setObject:serviceUniqueIdentifier forKey:@"serviceUniqueIdentifier"];
  }
  serviceType = self->_serviceType;
  if (serviceType) {
    [v3 setObject:serviceType forKey:@"serviceType"];
  }
  characteristicType = self->_characteristicType;
  if (characteristicType) {
    [v3 setObject:characteristicType forKey:@"characteristicType"];
  }
  serviceGroupUniqueIdentifier = self->_serviceGroupUniqueIdentifier;
  if (serviceGroupUniqueIdentifier) {
    [v3 setObject:serviceGroupUniqueIdentifier forKey:@"serviceGroupUniqueIdentifier"];
  }
  zoneUniqueIdentifiers = self->_zoneUniqueIdentifiers;
  if (zoneUniqueIdentifiers) {
    [v3 setObject:zoneUniqueIdentifiers forKey:@"zoneUniqueIdentifiers"];
  }
  roomUniqueIdentifier = self->_roomUniqueIdentifier;
  if (roomUniqueIdentifier) {
    [v3 setObject:roomUniqueIdentifier forKey:@"roomUniqueIdentifier"];
  }
  accessoryName = self->_accessoryName;
  if (accessoryName) {
    [v3 setObject:accessoryName forKey:@"accessoryName"];
  }
  serviceName = self->_serviceName;
  if (serviceName) {
    [v3 setObject:serviceName forKey:@"serviceName"];
  }
  roomName = self->_roomName;
  if (roomName) {
    [v3 setObject:roomName forKey:@"roomName"];
  }
  serviceGroupName = self->_serviceGroupName;
  if (serviceGroupName) {
    [v3 setObject:serviceGroupName forKey:@"serviceGroupName"];
  }
  zoneNames = self->_zoneNames;
  if (zoneNames) {
    [v3 setObject:zoneNames forKey:@"zoneNames"];
  }
  homeName = self->_homeName;
  if (homeName) {
    [v3 setObject:homeName forKey:@"homeName"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBHomeKitClientAccessoryControlEventReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_accessoryUniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_accessoryState) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_serviceUniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_serviceType) {
    PBDataWriterWriteStringField();
  }
  if (self->_characteristicType) {
    PBDataWriterWriteStringField();
  }
  if (self->_serviceGroupUniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_zoneUniqueIdentifiers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (self->_roomUniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_accessoryName) {
    PBDataWriterWriteStringField();
  }
  if (self->_serviceName) {
    PBDataWriterWriteStringField();
  }
  if (self->_roomName) {
    PBDataWriterWriteStringField();
  }
  if (self->_serviceGroupName) {
    PBDataWriterWriteStringField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_zoneNames;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_homeName) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_base) {
    objc_msgSend(v12, "setBase:");
  }
  if (self->_accessoryUniqueIdentifier) {
    objc_msgSend(v12, "setAccessoryUniqueIdentifier:");
  }
  if (self->_accessoryState) {
    objc_msgSend(v12, "setAccessoryState:");
  }
  if (self->_serviceUniqueIdentifier) {
    objc_msgSend(v12, "setServiceUniqueIdentifier:");
  }
  if (self->_serviceType) {
    objc_msgSend(v12, "setServiceType:");
  }
  if (self->_characteristicType) {
    objc_msgSend(v12, "setCharacteristicType:");
  }
  if (self->_serviceGroupUniqueIdentifier) {
    objc_msgSend(v12, "setServiceGroupUniqueIdentifier:");
  }
  if ([(BMPBHomeKitClientAccessoryControlEvent *)self zoneUniqueIdentifiersCount])
  {
    [v12 clearZoneUniqueIdentifiers];
    unint64_t v4 = [(BMPBHomeKitClientAccessoryControlEvent *)self zoneUniqueIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(BMPBHomeKitClientAccessoryControlEvent *)self zoneUniqueIdentifiersAtIndex:i];
        [v12 addZoneUniqueIdentifiers:v7];
      }
    }
  }
  if (self->_roomUniqueIdentifier) {
    objc_msgSend(v12, "setRoomUniqueIdentifier:");
  }
  if (self->_accessoryName) {
    objc_msgSend(v12, "setAccessoryName:");
  }
  if (self->_serviceName) {
    objc_msgSend(v12, "setServiceName:");
  }
  if (self->_roomName) {
    objc_msgSend(v12, "setRoomName:");
  }
  if (self->_serviceGroupName) {
    objc_msgSend(v12, "setServiceGroupName:");
  }
  if ([(BMPBHomeKitClientAccessoryControlEvent *)self zoneNamesCount])
  {
    [v12 clearZoneNames];
    unint64_t v8 = [(BMPBHomeKitClientAccessoryControlEvent *)self zoneNamesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(BMPBHomeKitClientAccessoryControlEvent *)self zoneNamesAtIndex:j];
        [v12 addZoneNames:v11];
      }
    }
  }
  if (self->_homeName) {
    objc_msgSend(v12, "setHomeName:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(BMPBHomeKitClientBase *)self->_base copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_accessoryUniqueIdentifier copyWithZone:a3];
  unint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(BMPBAccessoryState *)self->_accessoryState copyWithZone:a3];
  uint64_t v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSString *)self->_serviceUniqueIdentifier copyWithZone:a3];
  uint64_t v13 = (void *)v5[13];
  v5[13] = v12;

  uint64_t v14 = [(NSString *)self->_serviceType copyWithZone:a3];
  long long v15 = (void *)v5[12];
  v5[12] = v14;

  uint64_t v16 = [(NSString *)self->_characteristicType copyWithZone:a3];
  long long v17 = (void *)v5[5];
  v5[5] = v16;

  uint64_t v18 = [(NSString *)self->_serviceGroupUniqueIdentifier copyWithZone:a3];
  long long v19 = (void *)v5[10];
  v5[10] = v18;

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v20 = self->_zoneUniqueIdentifiers;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v50;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v50 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = (void *)[*(id *)(*((void *)&v49 + 1) + 8 * v24) copyWithZone:a3];
        [v5 addZoneUniqueIdentifiers:v25];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v22);
  }

  uint64_t v26 = [(NSString *)self->_roomUniqueIdentifier copyWithZone:a3];
  v27 = (void *)v5[8];
  v5[8] = v26;

  uint64_t v28 = [(NSString *)self->_accessoryName copyWithZone:a3];
  v29 = (void *)v5[1];
  v5[1] = v28;

  uint64_t v30 = [(NSString *)self->_serviceName copyWithZone:a3];
  v31 = (void *)v5[11];
  v5[11] = v30;

  uint64_t v32 = [(NSString *)self->_roomName copyWithZone:a3];
  v33 = (void *)v5[7];
  v5[7] = v32;

  uint64_t v34 = [(NSString *)self->_serviceGroupName copyWithZone:a3];
  v35 = (void *)v5[9];
  v5[9] = v34;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v36 = self->_zoneNames;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v46;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v46 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * v40), "copyWithZone:", a3, (void)v45);
        [v5 addZoneNames:v41];

        ++v40;
      }
      while (v38 != v40);
      uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v38);
  }

  uint64_t v42 = [(NSString *)self->_homeName copyWithZone:a3];
  v43 = (void *)v5[6];
  v5[6] = v42;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  base = self->_base;
  if ((unint64_t)base | v4[4])
  {
    if (!-[BMPBHomeKitClientBase isEqual:](base, "isEqual:")) {
      goto LABEL_32;
    }
  }
  accessoryUniqueIdentifier = self->_accessoryUniqueIdentifier;
  if ((unint64_t)accessoryUniqueIdentifier | v4[3]
    && !-[NSString isEqual:](accessoryUniqueIdentifier, "isEqual:"))
  {
    goto LABEL_32;
  }
  accessoryState = self->_accessoryState;
  if ((unint64_t)accessoryState | v4[2] && !-[BMPBAccessoryState isEqual:](accessoryState, "isEqual:")) {
    goto LABEL_32;
  }
  serviceUniqueIdentifier = self->_serviceUniqueIdentifier;
  if ((unint64_t)serviceUniqueIdentifier | v4[13]
    && !-[NSString isEqual:](serviceUniqueIdentifier, "isEqual:"))
  {
    goto LABEL_32;
  }
  serviceType = self->_serviceType;
  if ((unint64_t)serviceType | v4[12] && !-[NSString isEqual:](serviceType, "isEqual:")) {
    goto LABEL_32;
  }
  characteristicType = self->_characteristicType;
  if ((unint64_t)characteristicType | v4[5]
    && !-[NSString isEqual:](characteristicType, "isEqual:"))
  {
    goto LABEL_32;
  }
  serviceGroupUniqueIdentifier = self->_serviceGroupUniqueIdentifier;
  if ((unint64_t)serviceGroupUniqueIdentifier | v4[10]
    && !-[NSString isEqual:](serviceGroupUniqueIdentifier, "isEqual:"))
  {
    goto LABEL_32;
  }
  if (((zoneUniqueIdentifiers = self->_zoneUniqueIdentifiers, !((unint64_t)zoneUniqueIdentifiers | v4[15]))
     || -[NSMutableArray isEqual:](zoneUniqueIdentifiers, "isEqual:"))
    && ((roomUniqueIdentifier = self->_roomUniqueIdentifier, !((unint64_t)roomUniqueIdentifier | v4[8]))
     || -[NSString isEqual:](roomUniqueIdentifier, "isEqual:"))
    && ((accessoryName = self->_accessoryName, !((unint64_t)accessoryName | v4[1]))
     || -[NSString isEqual:](accessoryName, "isEqual:"))
    && ((serviceName = self->_serviceName, !((unint64_t)serviceName | v4[11]))
     || -[NSString isEqual:](serviceName, "isEqual:"))
    && ((roomName = self->_roomName, !((unint64_t)roomName | v4[7]))
     || -[NSString isEqual:](roomName, "isEqual:"))
    && ((serviceGroupName = self->_serviceGroupName, !((unint64_t)serviceGroupName | v4[9]))
     || -[NSString isEqual:](serviceGroupName, "isEqual:"))
    && ((zoneNames = self->_zoneNames, !((unint64_t)zoneNames | v4[14]))
     || -[NSMutableArray isEqual:](zoneNames, "isEqual:")))
  {
    homeName = self->_homeName;
    if ((unint64_t)homeName | v4[6]) {
      char v20 = -[NSString isEqual:](homeName, "isEqual:");
    }
    else {
      char v20 = 1;
    }
  }
  else
  {
LABEL_32:
    char v20 = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BMPBHomeKitClientBase *)self->_base hash];
  NSUInteger v4 = [(NSString *)self->_accessoryUniqueIdentifier hash] ^ v3;
  unint64_t v5 = [(BMPBAccessoryState *)self->_accessoryState hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_serviceUniqueIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_serviceType hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_characteristicType hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_serviceGroupUniqueIdentifier hash];
  uint64_t v10 = [(NSMutableArray *)self->_zoneUniqueIdentifiers hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_roomUniqueIdentifier hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_accessoryName hash];
  NSUInteger v13 = v9 ^ v12 ^ [(NSString *)self->_serviceName hash];
  NSUInteger v14 = [(NSString *)self->_roomName hash];
  NSUInteger v15 = v14 ^ [(NSString *)self->_serviceGroupName hash];
  uint64_t v16 = v15 ^ [(NSMutableArray *)self->_zoneNames hash];
  return v13 ^ v16 ^ [(NSString *)self->_homeName hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  base = self->_base;
  uint64_t v6 = *((void *)v4 + 4);
  if (base)
  {
    if (v6) {
      -[BMPBHomeKitClientBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[BMPBHomeKitClientAccessoryControlEvent setBase:](self, "setBase:");
  }
  if (*((void *)v4 + 3)) {
    -[BMPBHomeKitClientAccessoryControlEvent setAccessoryUniqueIdentifier:](self, "setAccessoryUniqueIdentifier:");
  }
  accessoryState = self->_accessoryState;
  uint64_t v8 = *((void *)v4 + 2);
  if (accessoryState)
  {
    if (v8) {
      -[BMPBAccessoryState mergeFrom:](accessoryState, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[BMPBHomeKitClientAccessoryControlEvent setAccessoryState:](self, "setAccessoryState:");
  }
  if (*((void *)v4 + 13)) {
    -[BMPBHomeKitClientAccessoryControlEvent setServiceUniqueIdentifier:](self, "setServiceUniqueIdentifier:");
  }
  if (*((void *)v4 + 12)) {
    -[BMPBHomeKitClientAccessoryControlEvent setServiceType:](self, "setServiceType:");
  }
  if (*((void *)v4 + 5)) {
    -[BMPBHomeKitClientAccessoryControlEvent setCharacteristicType:](self, "setCharacteristicType:");
  }
  if (*((void *)v4 + 10)) {
    -[BMPBHomeKitClientAccessoryControlEvent setServiceGroupUniqueIdentifier:](self, "setServiceGroupUniqueIdentifier:");
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = *((id *)v4 + 15);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        [(BMPBHomeKitClientAccessoryControlEvent *)self addZoneUniqueIdentifiers:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v11);
  }

  if (*((void *)v4 + 8)) {
    -[BMPBHomeKitClientAccessoryControlEvent setRoomUniqueIdentifier:](self, "setRoomUniqueIdentifier:");
  }
  if (*((void *)v4 + 1)) {
    -[BMPBHomeKitClientAccessoryControlEvent setAccessoryName:](self, "setAccessoryName:");
  }
  if (*((void *)v4 + 11)) {
    -[BMPBHomeKitClientAccessoryControlEvent setServiceName:](self, "setServiceName:");
  }
  if (*((void *)v4 + 7)) {
    -[BMPBHomeKitClientAccessoryControlEvent setRoomName:](self, "setRoomName:");
  }
  if (*((void *)v4 + 9)) {
    -[BMPBHomeKitClientAccessoryControlEvent setServiceGroupName:](self, "setServiceGroupName:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = *((id *)v4 + 14);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[BMPBHomeKitClientAccessoryControlEvent addZoneNames:](self, "addZoneNames:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }

  if (*((void *)v4 + 6)) {
    -[BMPBHomeKitClientAccessoryControlEvent setHomeName:](self, "setHomeName:");
  }
}

- (BMPBHomeKitClientBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
}

- (NSString)accessoryUniqueIdentifier
{
  return self->_accessoryUniqueIdentifier;
}

- (void)setAccessoryUniqueIdentifier:(id)a3
{
}

- (BMPBAccessoryState)accessoryState
{
  return self->_accessoryState;
}

- (void)setAccessoryState:(id)a3
{
}

- (NSString)serviceUniqueIdentifier
{
  return self->_serviceUniqueIdentifier;
}

- (void)setServiceUniqueIdentifier:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (void)setCharacteristicType:(id)a3
{
}

- (NSString)serviceGroupUniqueIdentifier
{
  return self->_serviceGroupUniqueIdentifier;
}

- (void)setServiceGroupUniqueIdentifier:(id)a3
{
}

- (NSMutableArray)zoneUniqueIdentifiers
{
  return self->_zoneUniqueIdentifiers;
}

- (void)setZoneUniqueIdentifiers:(id)a3
{
}

- (NSString)roomUniqueIdentifier
{
  return self->_roomUniqueIdentifier;
}

- (void)setRoomUniqueIdentifier:(id)a3
{
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
}

- (NSString)serviceGroupName
{
  return self->_serviceGroupName;
}

- (void)setServiceGroupName:(id)a3
{
}

- (NSMutableArray)zoneNames
{
  return self->_zoneNames;
}

- (void)setZoneNames:(id)a3
{
}

- (NSString)homeName
{
  return self->_homeName;
}

- (void)setHomeName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_serviceUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_serviceGroupUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceGroupName, 0);
  objc_storeStrong((id *)&self->_roomUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryState, 0);

  objc_storeStrong((id *)&self->_accessoryName, 0);
}

@end