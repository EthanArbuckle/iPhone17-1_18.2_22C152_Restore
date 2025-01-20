@interface GEOStopWaypoint
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMuid;
- (BOOL)hasName;
- (BOOL)hasPosition;
- (BOOL)hasStyleAttributes;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)position;
- (GEOStopWaypoint)init;
- (GEOStopWaypoint)initWithData:(id)a3;
- (GEOStopWaypoint)initWithDictionary:(id)a3;
- (GEOStopWaypoint)initWithJSON:(id)a3;
- (GEOStyleAttributes)styleAttributes;
- (NSString)name;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readName;
- (void)_readPosition;
- (void)_readStyleAttributes;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setPosition:(id)a3;
- (void)setStyleAttributes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOStopWaypoint

- (GEOStopWaypoint)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOStopWaypoint;
  v2 = [(GEOStopWaypoint *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOStopWaypoint)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOStopWaypoint;
  v3 = [(GEOStopWaypoint *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasMuid
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStopWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_7496);
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
  -[GEOStopWaypoint _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)setName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readPosition
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStopWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPosition_tags_7497);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPosition
{
  return self->_position != 0;
}

- (GEOLatLng)position
{
  -[GEOStopWaypoint _readPosition]((uint64_t)self);
  position = self->_position;

  return position;
}

- (void)setPosition:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_position, a3);
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStopWaypointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_7498);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasStyleAttributes
{
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOStopWaypoint _readStyleAttributes]((uint64_t)self);
  styleAttributes = self->_styleAttributes;

  return styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOStopWaypoint;
  v4 = [(GEOStopWaypoint *)&v8 description];
  v5 = [(GEOStopWaypoint *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStopWaypoint _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 68))
    {
      v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      [v4 setObject:v5 forKey:@"muid"];
    }
    objc_super v6 = [(id)a1 name];
    if (v6) {
      [v4 setObject:v6 forKey:@"name"];
    }

    objc_super v7 = [(id)a1 position];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"position"];
    }
    v10 = [(id)a1 styleAttributes];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"styleAttributes";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"style_attributes";
      }
      [v4 setObject:v12 forKey:v13];
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
        v21[2] = __45__GEOStopWaypoint__dictionaryRepresentation___block_invoke;
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
  return -[GEOStopWaypoint _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOStopWaypoint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOStopWaypoint)initWithDictionary:(id)a3
{
  return (GEOStopWaypoint *)-[GEOStopWaypoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"muid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMuid:", objc_msgSend(v6, "unsignedLongLongValue"));
      }

      objc_super v7 = [v5 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setName:v8];
      }
      v9 = [v5 objectForKeyedSubscript:@"position"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v11 = [(GEOLatLng *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEOLatLng *)v10 initWithDictionary:v9];
        }
        v12 = (void *)v11;
        [a1 setPosition:v11];
      }
      if (a3) {
        v13 = @"styleAttributes";
      }
      else {
        v13 = @"style_attributes";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = [GEOStyleAttributes alloc];
        if (a3) {
          uint64_t v16 = [(GEOStyleAttributes *)v15 initWithJSON:v14];
        }
        else {
          uint64_t v16 = [(GEOStyleAttributes *)v15 initWithDictionary:v14];
        }
        v17 = (void *)v16;
        [a1 setStyleAttributes:v16];
      }
    }
  }

  return a1;
}

- (GEOStopWaypoint)initWithJSON:(id)a3
{
  return (GEOStopWaypoint *)-[GEOStopWaypoint _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_7499;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_7500;
    }
    GEOStopWaypointReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOLatLng *)self->_position readAll:1];
    [(GEOStyleAttributes *)self->_styleAttributes readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStopWaypointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStopWaypointReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3C) == 0))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOStopWaypoint *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    id v5 = v8;
    if (self->_name)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_position)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_styleAttributes)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOStopWaypoint _readPosition]((uint64_t)self);
  position = self->_position;

  return [(GEOLatLng *)position hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOStopWaypoint *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    v5[3] = self->_muid;
    *((unsigned char *)v5 + 68) |= 1u;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    v4 = v5;
  }
  if (self->_position)
  {
    objc_msgSend(v5, "setPosition:");
    v4 = v5;
  }
  if (self->_styleAttributes)
  {
    objc_msgSend(v5, "setStyleAttributes:");
    v4 = v5;
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
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOStopWaypointReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOStopWaypoint *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 24) = self->_muid;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEOLatLng *)self->_position copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  id v13 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
  v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  v15 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOStopWaypoint *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_muid != *((void *)v4 + 3)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 4) && !-[NSString isEqual:](name, "isEqual:")) {
    goto LABEL_13;
  }
  position = self->_position;
  if ((unint64_t)position | *((void *)v4 + 5))
  {
    if (!-[GEOLatLng isEqual:](position, "isEqual:")) {
      goto LABEL_13;
    }
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 6)) {
    char v8 = -[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  [(GEOStopWaypoint *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  unint64_t v5 = [(GEOLatLng *)self->_position hash];
  return v4 ^ v5 ^ [(GEOStyleAttributes *)self->_styleAttributes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v9 = (unint64_t *)a3;
  [v9 readAll:0];
  NSUInteger v4 = v9;
  if (*((unsigned char *)v9 + 68))
  {
    self->_muid = v9[3];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (v9[4])
  {
    -[GEOStopWaypoint setName:](self, "setName:");
    NSUInteger v4 = v9;
  }
  position = self->_position;
  unint64_t v6 = v4[5];
  if (position)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOLatLng mergeFrom:](position, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOStopWaypoint setPosition:](self, "setPosition:");
  }
  NSUInteger v4 = v9;
LABEL_11:
  styleAttributes = self->_styleAttributes;
  unint64_t v8 = v4[6];
  if (styleAttributes)
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[GEOStopWaypoint setStyleAttributes:](self, "setStyleAttributes:");
  }
  NSUInteger v4 = v9;
LABEL_17:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOStopWaypointReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_7504);
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
  *(unsigned char *)&self->_flags |= 0x22u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOStopWaypoint *)self readAll:0];
    [(GEOLatLng *)self->_position clearUnknownFields:1];
    styleAttributes = self->_styleAttributes;
    [(GEOStyleAttributes *)styleAttributes clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end