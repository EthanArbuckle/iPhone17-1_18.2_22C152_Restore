@interface GEOMapItemRoutineAttributes
+ (BOOL)isValid:(id)a3;
- (BOOL)hasEventDate;
- (BOOL)hasEventName;
- (BOOL)hasIsEventAllDay;
- (BOOL)hasLoiIdentifierString;
- (BOOL)hasLoiType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEventAllDay;
- (BOOL)readFrom:(id)a3;
- (GEOMapItemRoutineAttributes)init;
- (GEOMapItemRoutineAttributes)initWithData:(id)a3;
- (GEOMapItemRoutineAttributes)initWithDictionary:(id)a3;
- (GEOMapItemRoutineAttributes)initWithJSON:(id)a3;
- (NSString)eventName;
- (NSString)loiIdentifierString;
- (NSUUID)loiIdentifier;
- (PBUnknownFields)unknownFields;
- (double)eventDate;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)loiTypeAsString:(int)a3;
- (int)StringAsLoiType:(id)a3;
- (int)loiType;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readEventName;
- (void)_readLoiIdentifierString;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEventDate:(double)a3;
- (void)setEventName:(id)a3;
- (void)setHasEventDate:(BOOL)a3;
- (void)setHasIsEventAllDay:(BOOL)a3;
- (void)setHasLoiType:(BOOL)a3;
- (void)setIsEventAllDay:(BOOL)a3;
- (void)setLoiIdentifier:(id)a3;
- (void)setLoiIdentifierString:(id)a3;
- (void)setLoiType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapItemRoutineAttributes

- (NSUUID)loiIdentifier
{
  v3 = [(GEOMapItemRoutineAttributes *)self loiIdentifierString];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29128]);
    v5 = [(GEOMapItemRoutineAttributes *)self loiIdentifierString];
    v6 = (void *)[v4 initWithUUIDString:v5];
  }
  else
  {
    v6 = 0;
  }

  return (NSUUID *)v6;
}

- (void)setLoiIdentifier:(id)a3
{
  id v4 = [a3 UUIDString];
  [(GEOMapItemRoutineAttributes *)self setLoiIdentifierString:v4];
}

- (GEOMapItemRoutineAttributes)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapItemRoutineAttributes;
  v2 = [(GEOMapItemRoutineAttributes *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOMapItemRoutineAttributes)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMapItemRoutineAttributes;
  v3 = [(GEOMapItemRoutineAttributes *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)loiType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_loiType;
  }
  else {
    return 0;
  }
}

- (void)setLoiType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_loiType = a3;
}

- (void)setHasLoiType:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLoiType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)loiTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E7938[a3];
  }

  return v3;
}

- (int)StringAsLoiType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Home"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Work"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"School"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Gym"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readEventName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemRoutineAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEventName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasEventName
{
  return self->_eventName != 0;
}

- (NSString)eventName
{
  -[GEOMapItemRoutineAttributes _readEventName]((uint64_t)self);
  eventName = self->_eventName;

  return eventName;
}

- (void)setEventName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_eventName, a3);
}

- (double)eventDate
{
  return self->_eventDate;
}

- (void)setEventDate:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_eventDate = a3;
}

- (void)setHasEventDate:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasEventDate
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)isEventAllDay
{
  return self->_isEventAllDay;
}

- (void)setIsEventAllDay:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  self->_isEventAllDay = a3;
}

- (void)setHasIsEventAllDay:(BOOL)a3
{
  if (a3) {
    char v3 = 68;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsEventAllDay
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readLoiIdentifierString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemRoutineAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLoiIdentifierString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLoiIdentifierString
{
  return self->_loiIdentifierString != 0;
}

- (NSString)loiIdentifierString
{
  -[GEOMapItemRoutineAttributes _readLoiIdentifierString]((uint64_t)self);
  loiIdentifierString = self->_loiIdentifierString;

  return loiIdentifierString;
}

- (void)setLoiIdentifierString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_loiIdentifierString, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapItemRoutineAttributes;
  int v4 = [(GEOMapItemRoutineAttributes *)&v8 description];
  v5 = [(GEOMapItemRoutineAttributes *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapItemRoutineAttributes _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 68) & 2) != 0)
    {
      uint64_t v5 = *(int *)(a1 + 60);
      if (v5 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E7938[v5];
      }
      [v4 setObject:v6 forKey:@"loiType"];
    }
    objc_super v7 = [(id)a1 eventName];
    if (v7) {
      [v4 setObject:v7 forKey:@"eventName"];
    }

    char v8 = *(unsigned char *)(a1 + 68);
    if (v8)
    {
      v9 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      [v4 setObject:v9 forKey:@"eventDate"];

      char v8 = *(unsigned char *)(a1 + 68);
    }
    if ((v8 & 4) != 0)
    {
      v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
      [v4 setObject:v10 forKey:@"isEventAllDay"];
    }
    v11 = [(id)a1 loiIdentifierString];
    if (v11) {
      [v4 setObject:v11 forKey:@"loiIdentifierString"];
    }

    v12 = *(void **)(a1 + 16);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __57__GEOMapItemRoutineAttributes__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v4 setObject:v14 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapItemRoutineAttributes _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOMapItemRoutineAttributes__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    char v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    char v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOMapItemRoutineAttributes)initWithDictionary:(id)a3
{
  return (GEOMapItemRoutineAttributes *)-[GEOMapItemRoutineAttributes _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_28;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_28;
  }
  int v4 = [v3 objectForKeyedSubscript:@"loiType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isEqualToString:@"Unknown"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"Home"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"Work"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"School"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"Gym"])
    {
      uint64_t v6 = 4;
    }
    else
    {
      uint64_t v6 = 0;
    }

    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v4 intValue];
LABEL_18:
    [a1 setLoiType:v6];
  }

  objc_super v7 = [v3 objectForKeyedSubscript:@"eventName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v8 = (void *)[v7 copy];
    [a1 setEventName:v8];
  }
  v9 = [v3 objectForKeyedSubscript:@"eventDate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 doubleValue];
    objc_msgSend(a1, "setEventDate:");
  }

  id v10 = [v3 objectForKeyedSubscript:@"isEventAllDay"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsEventAllDay:", objc_msgSend(v10, "BOOLValue"));
  }

  v11 = [v3 objectForKeyedSubscript:@"loiIdentifierString"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = (void *)[v11 copy];
    [a1 setLoiIdentifierString:v12];
  }
LABEL_28:

  return a1;
}

- (GEOMapItemRoutineAttributes)initWithJSON:(id)a3
{
  return (GEOMapItemRoutineAttributes *)-[GEOMapItemRoutineAttributes _initWithDictionary:isJSON:](self, a3);
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
      char v8 = (int *)&readAll__recursiveTag_1043;
    }
    else {
      char v8 = (int *)&readAll__nonRecursiveTag_1044;
    }
    GEOMapItemRoutineAttributesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapItemRoutineAttributesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapItemRoutineAttributesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x70) == 0))
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    char v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOMapItemRoutineAttributes *)self readAll:0];
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v9;
    if (self->_eventName)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteDoubleField();
      id v5 = v9;
      char flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v9;
    }
    if (self->_loiIdentifierString)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v6 = (id *)a3;
  [(GEOMapItemRoutineAttributes *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v6;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v6 + 15) = self->_loiType;
    *((unsigned char *)v6 + 68) |= 2u;
  }
  if (self->_eventName)
  {
    objc_msgSend(v6, "setEventName:");
    int v4 = v6;
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    v4[3] = *(id *)&self->_eventDate;
    *((unsigned char *)v4 + 68) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((unsigned char *)v4 + 64) = self->_isEventAllDay;
    *((unsigned char *)v4 + 68) |= 4u;
  }
  if (self->_loiIdentifierString)
  {
    objc_msgSend(v6, "setLoiIdentifierString:");
    int v4 = v6;
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
      GEOMapItemRoutineAttributesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOMapItemRoutineAttributes *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_loiType;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_eventName copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(double *)(v5 + 24) = self->_eventDate;
    *(unsigned char *)(v5 + 68) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 64) = self->_isEventAllDay;
    *(unsigned char *)(v5 + 68) |= 4u;
  }
  uint64_t v12 = [(NSString *)self->_loiIdentifierString copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  v14 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v14;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEOMapItemRoutineAttributes *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 68);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_loiType != *((_DWORD *)v4 + 15)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_19;
  }
  eventName = self->_eventName;
  if ((unint64_t)eventName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](eventName, "isEqual:")) {
      goto LABEL_19;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 68);
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_eventDate != *((double *)v4 + 3)) {
      goto LABEL_19;
    }
  }
  else if (v6)
  {
    goto LABEL_19;
  }
  if ((flags & 4) == 0)
  {
    if ((v6 & 4) == 0) {
      goto LABEL_25;
    }
LABEL_19:
    char v8 = 0;
    goto LABEL_20;
  }
  if ((v6 & 4) == 0) {
    goto LABEL_19;
  }
  if (!self->_isEventAllDay)
  {
    if (!*((unsigned char *)v4 + 64)) {
      goto LABEL_25;
    }
    goto LABEL_19;
  }
  if (!*((unsigned char *)v4 + 64)) {
    goto LABEL_19;
  }
LABEL_25:
  loiIdentifierString = self->_loiIdentifierString;
  if ((unint64_t)loiIdentifierString | *((void *)v4 + 5)) {
    char v8 = -[NSString isEqual:](loiIdentifierString, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  [(GEOMapItemRoutineAttributes *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_loiType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_eventName hash];
  char flags = (char)self->_flags;
  if (flags)
  {
    double eventDate = self->_eventDate;
    double v8 = -eventDate;
    if (eventDate >= 0.0) {
      double v8 = self->_eventDate;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((flags & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_isEventAllDay;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ [(NSString *)self->_loiIdentifierString hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v6 = (int *)a3;
  [v6 readAll:0];
  NSUInteger v4 = v6;
  if ((v6[17] & 2) != 0)
  {
    self->_loiType = v6[15];
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (*((void *)v6 + 4))
  {
    -[GEOMapItemRoutineAttributes setEventName:](self, "setEventName:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 68);
  if (v5)
  {
    self->_double eventDate = *((double *)v4 + 3);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v4 + 68);
  }
  if ((v5 & 4) != 0)
  {
    self->_isEventAllDay = *((unsigned char *)v4 + 64);
    *(unsigned char *)&self->_flags |= 4u;
  }
  if (*((void *)v4 + 5))
  {
    -[GEOMapItemRoutineAttributes setLoiIdentifierString:](self, "setLoiIdentifierString:");
    NSUInteger v4 = v6;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      char v5 = reader;
      objc_sync_enter(v5);
      GEOMapItemRoutineAttributesReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1048);
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
  *(unsigned char *)&self->_flags |= 0x48u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOMapItemRoutineAttributes *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loiIdentifierString, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end