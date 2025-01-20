@interface BMPBHomeKitClientMediaAccessoryControlEvent
+ (Class)accessoryStateType;
+ (Class)zoneNamesType;
+ (Class)zoneUniqueIdentifiersType;
- (BMPBHomeKitClientBase)base;
- (BOOL)hasAccessoryMediaRouteIdentifier;
- (BOOL)hasAccessoryName;
- (BOOL)hasAccessoryUniqueIdentifier;
- (BOOL)hasBase;
- (BOOL)hasHomeName;
- (BOOL)hasRoomName;
- (BOOL)hasRoomUniqueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)accessoryStates;
- (NSMutableArray)zoneNames;
- (NSMutableArray)zoneUniqueIdentifiers;
- (NSString)accessoryMediaRouteIdentifier;
- (NSString)accessoryName;
- (NSString)accessoryUniqueIdentifier;
- (NSString)homeName;
- (NSString)roomName;
- (NSString)roomUniqueIdentifier;
- (id)accessoryStateAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)zoneNamesAtIndex:(unint64_t)a3;
- (id)zoneUniqueIdentifiersAtIndex:(unint64_t)a3;
- (unint64_t)accessoryStatesCount;
- (unint64_t)hash;
- (unint64_t)zoneNamesCount;
- (unint64_t)zoneUniqueIdentifiersCount;
- (void)addAccessoryState:(id)a3;
- (void)addZoneNames:(id)a3;
- (void)addZoneUniqueIdentifiers:(id)a3;
- (void)clearAccessoryStates;
- (void)clearZoneNames;
- (void)clearZoneUniqueIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessoryMediaRouteIdentifier:(id)a3;
- (void)setAccessoryName:(id)a3;
- (void)setAccessoryStates:(id)a3;
- (void)setAccessoryUniqueIdentifier:(id)a3;
- (void)setBase:(id)a3;
- (void)setHomeName:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setRoomUniqueIdentifier:(id)a3;
- (void)setZoneNames:(id)a3;
- (void)setZoneUniqueIdentifiers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBHomeKitClientMediaAccessoryControlEvent

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasAccessoryUniqueIdentifier
{
  return self->_accessoryUniqueIdentifier != 0;
}

- (void)clearAccessoryStates
{
}

- (void)addAccessoryState:(id)a3
{
  id v4 = a3;
  accessoryStates = self->_accessoryStates;
  id v8 = v4;
  if (!accessoryStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_accessoryStates;
    self->_accessoryStates = v6;

    id v4 = v8;
    accessoryStates = self->_accessoryStates;
  }
  [(NSMutableArray *)accessoryStates addObject:v4];
}

- (unint64_t)accessoryStatesCount
{
  return [(NSMutableArray *)self->_accessoryStates count];
}

- (id)accessoryStateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_accessoryStates objectAtIndex:a3];
}

+ (Class)accessoryStateType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAccessoryMediaRouteIdentifier
{
  return self->_accessoryMediaRouteIdentifier != 0;
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

- (BOOL)hasRoomName
{
  return self->_roomName != 0;
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
  v8.super_class = (Class)BMPBHomeKitClientMediaAccessoryControlEvent;
  id v4 = [(BMPBHomeKitClientMediaAccessoryControlEvent *)&v8 description];
  v5 = [(BMPBHomeKitClientMediaAccessoryControlEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
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
  if ([(NSMutableArray *)self->_accessoryStates count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_accessoryStates, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    objc_super v8 = self->_accessoryStates;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (void)v22);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"accessoryState"];
  }
  accessoryMediaRouteIdentifier = self->_accessoryMediaRouteIdentifier;
  if (accessoryMediaRouteIdentifier) {
    [v3 setObject:accessoryMediaRouteIdentifier forKey:@"accessoryMediaRouteIdentifier"];
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
  roomName = self->_roomName;
  if (roomName) {
    [v3 setObject:roomName forKey:@"roomName"];
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
  return BMPBHomeKitClientMediaAccessoryControlEventReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_accessoryUniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = self->_accessoryStates;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  if (self->_accessoryMediaRouteIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = self->_zoneUniqueIdentifiers;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  if (self->_roomUniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_accessoryName) {
    PBDataWriterWriteStringField();
  }
  if (self->_roomName) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v15 = self->_zoneNames;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }

  if (self->_homeName) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  if (self->_base) {
    objc_msgSend(v16, "setBase:");
  }
  if (self->_accessoryUniqueIdentifier) {
    objc_msgSend(v16, "setAccessoryUniqueIdentifier:");
  }
  if ([(BMPBHomeKitClientMediaAccessoryControlEvent *)self accessoryStatesCount])
  {
    [v16 clearAccessoryStates];
    unint64_t v4 = [(BMPBHomeKitClientMediaAccessoryControlEvent *)self accessoryStatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(BMPBHomeKitClientMediaAccessoryControlEvent *)self accessoryStateAtIndex:i];
        [v16 addAccessoryState:v7];
      }
    }
  }
  if (self->_accessoryMediaRouteIdentifier) {
    objc_msgSend(v16, "setAccessoryMediaRouteIdentifier:");
  }
  if ([(BMPBHomeKitClientMediaAccessoryControlEvent *)self zoneUniqueIdentifiersCount])
  {
    [v16 clearZoneUniqueIdentifiers];
    unint64_t v8 = [(BMPBHomeKitClientMediaAccessoryControlEvent *)self zoneUniqueIdentifiersCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(BMPBHomeKitClientMediaAccessoryControlEvent *)self zoneUniqueIdentifiersAtIndex:j];
        [v16 addZoneUniqueIdentifiers:v11];
      }
    }
  }
  if (self->_roomUniqueIdentifier) {
    objc_msgSend(v16, "setRoomUniqueIdentifier:");
  }
  if (self->_accessoryName) {
    objc_msgSend(v16, "setAccessoryName:");
  }
  if (self->_roomName) {
    objc_msgSend(v16, "setRoomName:");
  }
  if ([(BMPBHomeKitClientMediaAccessoryControlEvent *)self zoneNamesCount])
  {
    [v16 clearZoneNames];
    unint64_t v12 = [(BMPBHomeKitClientMediaAccessoryControlEvent *)self zoneNamesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        v15 = [(BMPBHomeKitClientMediaAccessoryControlEvent *)self zoneNamesAtIndex:k];
        [v16 addZoneNames:v15];
      }
    }
  }
  if (self->_homeName) {
    objc_msgSend(v16, "setHomeName:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(BMPBHomeKitClientBase *)self->_base copyWithZone:a3];
  uint64_t v7 = (void *)v5[5];
  v5[5] = v6;

  uint64_t v8 = [(NSString *)self->_accessoryUniqueIdentifier copyWithZone:a3];
  unint64_t v9 = (void *)v5[4];
  v5[4] = v8;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v10 = self->_accessoryStates;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v48;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * v14) copyWithZone:a3];
        [v5 addAccessoryState:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(NSString *)self->_accessoryMediaRouteIdentifier copyWithZone:a3];
  uint64_t v17 = (void *)v5[1];
  v5[1] = v16;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v18 = self->_zoneUniqueIdentifiers;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v44;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * v22) copyWithZone:a3];
        [v5 addZoneUniqueIdentifiers:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v20);
  }

  uint64_t v24 = [(NSString *)self->_roomUniqueIdentifier copyWithZone:a3];
  long long v25 = (void *)v5[8];
  v5[8] = v24;

  uint64_t v26 = [(NSString *)self->_accessoryName copyWithZone:a3];
  long long v27 = (void *)v5[2];
  v5[2] = v26;

  uint64_t v28 = [(NSString *)self->_roomName copyWithZone:a3];
  long long v29 = (void *)v5[7];
  v5[7] = v28;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v30 = self->_zoneNames;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v40;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v40 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * v34), "copyWithZone:", a3, (void)v39);
        [v5 addZoneNames:v35];

        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v32);
  }

  uint64_t v36 = [(NSString *)self->_homeName copyWithZone:a3];
  v37 = (void *)v5[6];
  v5[6] = v36;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  base = self->_base;
  if ((unint64_t)base | v4[5])
  {
    if (!-[BMPBHomeKitClientBase isEqual:](base, "isEqual:")) {
      goto LABEL_22;
    }
  }
  accessoryUniqueIdentifier = self->_accessoryUniqueIdentifier;
  if ((unint64_t)accessoryUniqueIdentifier | v4[4]
    && !-[NSString isEqual:](accessoryUniqueIdentifier, "isEqual:"))
  {
    goto LABEL_22;
  }
  if (((accessoryStates = self->_accessoryStates, !((unint64_t)accessoryStates | v4[3]))
     || -[NSMutableArray isEqual:](accessoryStates, "isEqual:"))
    && ((accessoryMediaRouteIdentifier = self->_accessoryMediaRouteIdentifier,
         !((unint64_t)accessoryMediaRouteIdentifier | v4[1]))
     || -[NSString isEqual:](accessoryMediaRouteIdentifier, "isEqual:"))
    && ((zoneUniqueIdentifiers = self->_zoneUniqueIdentifiers, !((unint64_t)zoneUniqueIdentifiers | v4[10]))
     || -[NSMutableArray isEqual:](zoneUniqueIdentifiers, "isEqual:"))
    && ((roomUniqueIdentifier = self->_roomUniqueIdentifier, !((unint64_t)roomUniqueIdentifier | v4[8]))
     || -[NSString isEqual:](roomUniqueIdentifier, "isEqual:"))
    && ((accessoryName = self->_accessoryName, !((unint64_t)accessoryName | v4[2]))
     || -[NSString isEqual:](accessoryName, "isEqual:"))
    && ((roomName = self->_roomName, !((unint64_t)roomName | v4[7]))
     || -[NSString isEqual:](roomName, "isEqual:"))
    && ((zoneNames = self->_zoneNames, !((unint64_t)zoneNames | v4[9]))
     || -[NSMutableArray isEqual:](zoneNames, "isEqual:")))
  {
    homeName = self->_homeName;
    if ((unint64_t)homeName | v4[6]) {
      char v15 = -[NSString isEqual:](homeName, "isEqual:");
    }
    else {
      char v15 = 1;
    }
  }
  else
  {
LABEL_22:
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BMPBHomeKitClientBase *)self->_base hash];
  NSUInteger v4 = [(NSString *)self->_accessoryUniqueIdentifier hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_accessoryStates hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_accessoryMediaRouteIdentifier hash];
  uint64_t v7 = [(NSMutableArray *)self->_zoneUniqueIdentifiers hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_roomUniqueIdentifier hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_accessoryName hash];
  NSUInteger v10 = [(NSString *)self->_roomName hash];
  uint64_t v11 = v10 ^ [(NSMutableArray *)self->_zoneNames hash];
  return v9 ^ v11 ^ [(NSString *)self->_homeName hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  base = self->_base;
  uint64_t v6 = *((void *)v4 + 5);
  if (base)
  {
    if (v6) {
      -[BMPBHomeKitClientBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[BMPBHomeKitClientMediaAccessoryControlEvent setBase:](self, "setBase:");
  }
  if (*((void *)v4 + 4)) {
    -[BMPBHomeKitClientMediaAccessoryControlEvent setAccessoryUniqueIdentifier:](self, "setAccessoryUniqueIdentifier:");
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = *((id *)v4 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        [(BMPBHomeKitClientMediaAccessoryControlEvent *)self addAccessoryState:*(void *)(*((void *)&v30 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 1)) {
    [(BMPBHomeKitClientMediaAccessoryControlEvent *)self setAccessoryMediaRouteIdentifier:"setAccessoryMediaRouteIdentifier:"];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = *((id *)v4 + 10);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        [(BMPBHomeKitClientMediaAccessoryControlEvent *)self addZoneUniqueIdentifiers:*(void *)(*((void *)&v26 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v14);
  }

  if (*((void *)v4 + 8)) {
    -[BMPBHomeKitClientMediaAccessoryControlEvent setRoomUniqueIdentifier:](self, "setRoomUniqueIdentifier:");
  }
  if (*((void *)v4 + 2)) {
    -[BMPBHomeKitClientMediaAccessoryControlEvent setAccessoryName:](self, "setAccessoryName:");
  }
  if (*((void *)v4 + 7)) {
    -[BMPBHomeKitClientMediaAccessoryControlEvent setRoomName:](self, "setRoomName:");
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v17 = *((id *)v4 + 9);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        -[BMPBHomeKitClientMediaAccessoryControlEvent addZoneNames:](self, "addZoneNames:", *(void *)(*((void *)&v22 + 1) + 8 * k), (void)v22);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v19);
  }

  if (*((void *)v4 + 6)) {
    -[BMPBHomeKitClientMediaAccessoryControlEvent setHomeName:](self, "setHomeName:");
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

- (NSMutableArray)accessoryStates
{
  return self->_accessoryStates;
}

- (void)setAccessoryStates:(id)a3
{
}

- (NSString)accessoryMediaRouteIdentifier
{
  return self->_accessoryMediaRouteIdentifier;
}

- (void)setAccessoryMediaRouteIdentifier:(id)a3
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

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
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
  objc_storeStrong((id *)&self->_roomUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryStates, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);

  objc_storeStrong((id *)&self->_accessoryMediaRouteIdentifier, 0);
}

@end