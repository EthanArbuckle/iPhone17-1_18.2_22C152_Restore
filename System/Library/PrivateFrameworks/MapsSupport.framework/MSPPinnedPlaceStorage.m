@interface MSPPinnedPlaceStorage
+ (Class)contactStorageType;
- (BOOL)hasCustomName;
- (BOOL)hasHidden;
- (BOOL)hasIdentifier;
- (BOOL)hasMapItemStorage;
- (BOOL)hasOriginatingAddressString;
- (BOOL)hasType;
- (BOOL)hidden;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapItemStorage)mapItemStorage;
- (NSMutableArray)contactStorages;
- (NSString)customName;
- (NSString)identifier;
- (NSString)originatingAddressString;
- (PBUnknownFields)unknownFields;
- (id)contactStorageAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)contactStoragesCount;
- (unint64_t)hash;
- (void)addContactStorage:(id)a3;
- (void)clearContactStorages;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContactStorages:(id)a3;
- (void)setCustomName:(id)a3;
- (void)setHasHidden:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setMapItemStorage:(id)a3;
- (void)setOriginatingAddressString:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPPinnedPlaceStorage

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E617C960[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MAP_ITEM"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HOME"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WORK"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PARKED_CAR"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SCHOOL"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasCustomName
{
  return self->_customName != 0;
}

- (BOOL)hasMapItemStorage
{
  return self->_mapItemStorage != 0;
}

- (void)clearContactStorages
{
}

- (void)addContactStorage:(id)a3
{
  id v4 = a3;
  contactStorages = self->_contactStorages;
  id v8 = v4;
  if (!contactStorages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_contactStorages;
    self->_contactStorages = v6;

    id v4 = v8;
    contactStorages = self->_contactStorages;
  }
  [(NSMutableArray *)contactStorages addObject:v4];
}

- (unint64_t)contactStoragesCount
{
  return [(NSMutableArray *)self->_contactStorages count];
}

- (id)contactStorageAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contactStorages objectAtIndex:a3];
}

+ (Class)contactStorageType
{
  return (Class)objc_opt_class();
}

- (void)setHidden:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_hidden = a3;
}

- (void)setHasHidden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHidden
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasOriginatingAddressString
{
  return self->_originatingAddressString != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPPinnedPlaceStorage;
  id v4 = [(MSPPinnedPlaceStorage *)&v8 description];
  v5 = [(MSPPinnedPlaceStorage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t type = self->_type;
    if (type >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E617C960[type];
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  customName = self->_customName;
  if (customName) {
    [v3 setObject:customName forKey:@"customName"];
  }
  mapItemStorage = self->_mapItemStorage;
  if (mapItemStorage)
  {
    v9 = [(GEOMapItemStorage *)mapItemStorage dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"mapItemStorage"];
  }
  if ([(NSMutableArray *)self->_contactStorages count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_contactStorages, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v11 = self->_contactStorages;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v22 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"contactStorage"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v17 = [NSNumber numberWithBool:self->_hidden];
    [v3 setObject:v17 forKey:@"hidden"];
  }
  originatingAddressString = self->_originatingAddressString;
  if (originatingAddressString) {
    [v3 setObject:originatingAddressString forKey:@"originatingAddressString"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v20 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPPinnedPlaceStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_customName) {
    PBDataWriterWriteStringField();
  }
  if (self->_mapItemStorage) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_contactStorages;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_originatingAddressString) {
    PBDataWriterWriteStringField();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[14] = self->_type;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  long long v10 = v4;
  if (self->_identifier) {
    objc_msgSend(v4, "setIdentifier:");
  }
  if (self->_customName) {
    objc_msgSend(v10, "setCustomName:");
  }
  if (self->_mapItemStorage) {
    objc_msgSend(v10, "setMapItemStorage:");
  }
  if ([(MSPPinnedPlaceStorage *)self contactStoragesCount])
  {
    [v10 clearContactStorages];
    unint64_t v5 = [(MSPPinnedPlaceStorage *)self contactStoragesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(MSPPinnedPlaceStorage *)self contactStorageAtIndex:i];
        [v10 addContactStorage:v8];
      }
    }
  }
  uint64_t v9 = v10;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10[60] = self->_hidden;
    v10[64] |= 2u;
  }
  if (self->_originatingAddressString)
  {
    objc_msgSend(v10, "setOriginatingAddressString:");
    uint64_t v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 56) = self->_type;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  uint64_t v9 = [(NSString *)self->_customName copyWithZone:a3];
  long long v10 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v9;

  uint64_t v11 = [(GEOMapItemStorage *)self->_mapItemStorage copyWithZone:a3];
  long long v12 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v11;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v13 = self->_contactStorages;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (void)v22);
        [(id)v6 addContactStorage:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 60) = self->_hidden;
    *(unsigned char *)(v6 + 64) |= 2u;
  }
  uint64_t v19 = -[NSString copyWithZone:](self->_originatingAddressString, "copyWithZone:", a3, (void)v22);
  v20 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v19;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_type != *((_DWORD *)v4 + 14)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_19;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 4) && !-[NSString isEqual:](identifier, "isEqual:")) {
    goto LABEL_19;
  }
  customName = self->_customName;
  if ((unint64_t)customName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](customName, "isEqual:")) {
      goto LABEL_19;
    }
  }
  mapItemStorage = self->_mapItemStorage;
  if ((unint64_t)mapItemStorage | *((void *)v4 + 5))
  {
    if (!-[GEOMapItemStorage isEqual:](mapItemStorage, "isEqual:")) {
      goto LABEL_19;
    }
  }
  contactStorages = self->_contactStorages;
  if ((unint64_t)contactStorages | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](contactStorages, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0) {
      goto LABEL_25;
    }
LABEL_19:
    char v9 = 0;
    goto LABEL_20;
  }
  if ((*((unsigned char *)v4 + 64) & 2) == 0) {
    goto LABEL_19;
  }
  if (!self->_hidden)
  {
    if (!*((unsigned char *)v4 + 60)) {
      goto LABEL_25;
    }
    goto LABEL_19;
  }
  if (!*((unsigned char *)v4 + 60)) {
    goto LABEL_19;
  }
LABEL_25:
  originatingAddressString = self->_originatingAddressString;
  if ((unint64_t)originatingAddressString | *((void *)v4 + 6)) {
    char v9 = -[NSString isEqual:](originatingAddressString, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_identifier hash];
  NSUInteger v5 = [(NSString *)self->_customName hash];
  uint64_t v6 = [(GEOMapItemStorage *)self->_mapItemStorage hash];
  uint64_t v7 = [(NSMutableArray *)self->_contactStorages hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_hidden;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_originatingAddressString hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = a3;
  id v5 = v4;
  if (v4[16])
  {
    self->_uint64_t type = v4[14];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4)) {
    -[MSPPinnedPlaceStorage setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)v5 + 3)) {
    -[MSPPinnedPlaceStorage setCustomName:](self, "setCustomName:");
  }
  mapItemStorage = self->_mapItemStorage;
  uint64_t v7 = *((void *)v5 + 5);
  if (mapItemStorage)
  {
    if (v7) {
      -[GEOMapItemStorage mergeFrom:](mapItemStorage, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[MSPPinnedPlaceStorage setMapItemStorage:](self, "setMapItemStorage:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v5 + 2);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[MSPPinnedPlaceStorage addContactStorage:](self, "addContactStorage:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  if ((*((unsigned char *)v5 + 64) & 2) != 0)
  {
    self->_hidden = *((unsigned char *)v5 + 60);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 6)) {
    -[MSPPinnedPlaceStorage setOriginatingAddressString:](self, "setOriginatingAddressString:");
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)customName
{
  return self->_customName;
}

- (void)setCustomName:(id)a3
{
}

- (GEOMapItemStorage)mapItemStorage
{
  return self->_mapItemStorage;
}

- (void)setMapItemStorage:(id)a3
{
}

- (NSMutableArray)contactStorages
{
  return self->_contactStorages;
}

- (void)setContactStorages:(id)a3
{
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (NSString)originatingAddressString
{
  return self->_originatingAddressString;
}

- (void)setOriginatingAddressString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingAddressString, 0);
  objc_storeStrong((id *)&self->_mapItemStorage, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_customName, 0);
  objc_storeStrong((id *)&self->_contactStorages, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end