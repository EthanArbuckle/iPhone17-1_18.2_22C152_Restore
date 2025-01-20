@interface GEOCollectionPlace
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAddress;
- (BOOL)hasCoordinate;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMuid;
- (BOOL)hasName;
- (BOOL)hasProviderId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCollectionPlace)init;
- (GEOCollectionPlace)initWithData:(id)a3;
- (GEOCollectionPlace)initWithDictionary:(id)a3;
- (GEOCollectionPlace)initWithJSON:(id)a3;
- (GEOLatLng)coordinate;
- (NSString)address;
- (NSString)name;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)providerId;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAddress;
- (void)_readCoordinate;
- (void)_readName;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddress:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasProviderId:(BOOL)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setProviderId:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCollectionPlace

- (GEOCollectionPlace)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCollectionPlace;
  v2 = [(GEOCollectionPlace *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCollectionPlace)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCollectionPlace;
  v3 = [(GEOCollectionPlace *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)providerId
{
  return self->_providerId;
}

- (void)setProviderId:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_providerId = a3;
}

- (void)setHasProviderId:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasProviderId
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasMuid
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCollectionPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddress_tags_8);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAddress
{
  return self->_address != 0;
}

- (NSString)address
{
  -[GEOCollectionPlace _readAddress]((uint64_t)self);
  address = self->_address;

  return address;
}

- (void)setAddress:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_address, a3);
}

- (void)_readCoordinate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCollectionPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCoordinate_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (GEOLatLng)coordinate
{
  -[GEOCollectionPlace _readCoordinate]((uint64_t)self);
  coordinate = self->_coordinate;

  return coordinate;
}

- (void)setCoordinate:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCollectionPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_15);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOCollectionPlace _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)setName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCollectionPlace;
  v4 = [(GEOCollectionPlace *)&v8 description];
  v5 = [(GEOCollectionPlace *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCollectionPlace _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 72);
    if ((v5 & 2) != 0)
    {
      objc_super v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
      if (a2) {
        objc_super v7 = @"providerId";
      }
      else {
        objc_super v7 = @"provider_id";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 72);
    }
    if (v5)
    {
      objc_super v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
      [v4 setObject:v8 forKey:@"muid"];
    }
    v9 = [(id)a1 address];
    if (v9) {
      [v4 setObject:v9 forKey:@"address"];
    }

    v10 = [(id)a1 coordinate];
    v11 = v10;
    if (v10)
    {
      if (a2) {
        [v10 jsonRepresentation];
      }
      else {
      v12 = [v10 dictionaryRepresentation];
      }
      [v4 setObject:v12 forKey:@"coordinate"];
    }
    v13 = [(id)a1 name];
    if (v13) {
      [v4 setObject:v13 forKey:@"name"];
    }

    v14 = *(void **)(a1 + 16);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __48__GEOCollectionPlace__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCollectionPlace _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOCollectionPlace__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOCollectionPlace)initWithDictionary:(id)a3
{
  return (GEOCollectionPlace *)-[GEOCollectionPlace _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"providerId";
      }
      else {
        objc_super v6 = @"provider_id";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setProviderId:", objc_msgSend(v7, "intValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"muid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMuid:", objc_msgSend(v8, "unsignedLongLongValue"));
      }

      v9 = [v5 objectForKeyedSubscript:@"address"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = (void *)[v9 copy];
        [a1 setAddress:v10];
      }
      v11 = [v5 objectForKeyedSubscript:@"coordinate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v13 = [(GEOLatLng *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOLatLng *)v12 initWithDictionary:v11];
        }
        v14 = (void *)v13;
        [a1 setCoordinate:v13];
      }
      v15 = [v5 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = (void *)[v15 copy];
        [a1 setName:v16];
      }
    }
  }

  return a1;
}

- (GEOCollectionPlace)initWithJSON:(id)a3
{
  return (GEOCollectionPlace *)-[GEOCollectionPlace _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_691_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_692_0;
    }
    GEOCollectionPlaceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOLatLng *)self->_coordinate readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCollectionPlaceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCollectionPlaceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x78) == 0))
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOCollectionPlace *)self readAll:0];
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    id v6 = v9;
    if (flags)
    {
      PBDataWriterWriteUint64Field();
      id v6 = v9;
    }
    if (self->_address)
    {
      PBDataWriterWriteStringField();
      id v6 = v9;
    }
    if (self->_coordinate)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if (self->_name)
    {
      PBDataWriterWriteStringField();
      id v6 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOCollectionPlace _readCoordinate]((uint64_t)self);
  coordinate = self->_coordinate;

  return [(GEOLatLng *)coordinate hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v6 = (id *)a3;
  [(GEOCollectionPlace *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 17) = self->_providerId;
    *((unsigned char *)v6 + 72) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v6[5] = self->_muid;
    *((unsigned char *)v6 + 72) |= 1u;
  }
  if (self->_address)
  {
    objc_msgSend(v6, "setAddress:");
    v4 = v6;
  }
  if (self->_coordinate)
  {
    objc_msgSend(v6, "setCoordinate:");
    v4 = v6;
  }
  if (self->_name)
  {
    objc_msgSend(v6, "setName:");
    v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOCollectionPlaceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCollectionPlace *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_providerId;
    *(unsigned char *)(v5 + 72) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 40) = self->_muid;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_address copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  id v12 = [(GEOLatLng *)self->_coordinate copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  uint64_t v14 = [(NSString *)self->_name copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEOCollectionPlace *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_providerId != *((_DWORD *)v4 + 17)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_muid != *((void *)v4 + 5)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_18;
  }
  address = self->_address;
  if ((unint64_t)address | *((void *)v4 + 3) && !-[NSString isEqual:](address, "isEqual:")) {
    goto LABEL_18;
  }
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((void *)v4 + 4))
  {
    if (!-[GEOLatLng isEqual:](coordinate, "isEqual:")) {
      goto LABEL_18;
    }
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 6)) {
    char v8 = -[NSString isEqual:](name, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  [(GEOCollectionPlace *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_providerId;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_muid;
LABEL_6:
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_address hash];
  unint64_t v6 = [(GEOLatLng *)self->_coordinate hash];
  return v5 ^ v6 ^ [(NSString *)self->_name hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  unint64_t v4 = v8;
  char v5 = *((unsigned char *)v8 + 72);
  if ((v5 & 2) != 0)
  {
    self->_providerId = *((_DWORD *)v8 + 17);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v8 + 72);
  }
  if (v5)
  {
    self->_muid = *((void *)v8 + 5);
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v8 + 3))
  {
    -[GEOCollectionPlace setAddress:](self, "setAddress:");
    unint64_t v4 = v8;
  }
  coordinate = self->_coordinate;
  uint64_t v7 = v4[4];
  if (coordinate)
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[GEOLatLng mergeFrom:](coordinate, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[GEOCollectionPlace setCoordinate:](self, "setCoordinate:");
  }
  unint64_t v4 = v8;
LABEL_13:
  if (v4[6])
  {
    -[GEOCollectionPlace setName:](self, "setName:");
    unint64_t v4 = v8;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      char v5 = reader;
      objc_sync_enter(v5);
      GEOCollectionPlaceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_696);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x44u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOCollectionPlace *)self readAll:0];
    coordinate = self->_coordinate;
    [(GEOLatLng *)coordinate clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end