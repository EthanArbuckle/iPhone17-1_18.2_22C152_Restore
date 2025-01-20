@interface GEOTimestampData
+ (BOOL)isValid:(id)a3;
- (BOOL)displayTimeZone;
- (BOOL)displayTimezone;
- (BOOL)hasDisplayTimezone;
- (BOOL)hasFormatPattern;
- (BOOL)hasTimestampVal;
- (BOOL)hasTimezone;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTimestampData)init;
- (GEOTimestampData)initWithData:(id)a3;
- (GEOTimestampData)initWithDictionary:(id)a3;
- (GEOTimestampData)initWithJSON:(id)a3;
- (NSString)description;
- (NSString)formatPattern;
- (NSString)timezone;
- (NSTimeZone)timeZone;
- (PBUnknownFields)unknownFields;
- (double)timeStamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)timestampVal;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readFormatPattern;
- (void)_readTimezone;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDisplayTimezone:(BOOL)a3;
- (void)setFormatPattern:(id)a3;
- (void)setHasDisplayTimezone:(BOOL)a3;
- (void)setHasTimestampVal:(BOOL)a3;
- (void)setTimestampVal:(unsigned int)a3;
- (void)setTimezone:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTimestampData

- (GEOTimestampData)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTimestampData;
  v2 = [(GEOTimestampData *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTimestampData)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTimestampData;
  v3 = [(GEOTimestampData *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)timestampVal
{
  return self->_timestampVal;
}

- (void)setTimestampVal:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_timestampVal = a3;
}

- (void)setHasTimestampVal:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasTimestampVal
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readTimezone
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTimestampDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimezone_tags_7595);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTimezone
{
  return self->_timezone != 0;
}

- (NSString)timezone
{
  -[GEOTimestampData _readTimezone]((uint64_t)self);
  timezone = self->_timezone;

  return timezone;
}

- (void)setTimezone:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_timezone, a3);
}

- (BOOL)displayTimezone
{
  return self->_displayTimezone;
}

- (void)setDisplayTimezone:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_displayTimezone = a3;
}

- (void)setHasDisplayTimezone:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDisplayTimezone
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readFormatPattern
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTimestampDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormatPattern_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasFormatPattern
{
  return self->_formatPattern != 0;
}

- (NSString)formatPattern
{
  -[GEOTimestampData _readFormatPattern]((uint64_t)self);
  if (self->_formatPattern) {
    formatPattern = (__CFString *)self->_formatPattern;
  }
  else {
    formatPattern = @"jjmm";
  }

  return (NSString *)formatPattern;
}

- (void)setFormatPattern:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_formatPattern, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTimestampData;
  v4 = [(GEOTimestampData *)&v8 description];
  v5 = [(GEOTimestampData *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTimestampData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 60))
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        objc_super v6 = @"timestampVal";
      }
      else {
        objc_super v6 = @"timestamp_val";
      }
      [v4 setObject:v5 forKey:v6];
    }
    objc_super v7 = [(id)a1 timezone];
    if (v7) {
      [v4 setObject:v7 forKey:@"timezone"];
    }

    if ((*(unsigned char *)(a1 + 60) & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
      if (a2) {
        v9 = @"displayTimezone";
      }
      else {
        v9 = @"display_timezone";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = [(id)a1 formatPattern];
    if (v10)
    {
      if (a2) {
        v11 = @"formatPattern";
      }
      else {
        v11 = @"format_pattern";
      }
      [v4 setObject:v10 forKey:v11];
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
        v19[2] = __46__GEOTimestampData__dictionaryRepresentation___block_invoke;
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
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTimestampData _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOTimestampData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTimestampData)initWithDictionary:(id)a3
{
  return (GEOTimestampData *)-[GEOTimestampData _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"timestampVal";
      }
      else {
        objc_super v6 = @"timestamp_val";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTimestampVal:", objc_msgSend(v7, "unsignedIntValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"timezone"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = (void *)[v8 copy];
        [a1 setTimezone:v9];
      }
      if (a3) {
        id v10 = @"displayTimezone";
      }
      else {
        id v10 = @"display_timezone";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDisplayTimezone:", objc_msgSend(v11, "BOOLValue"));
      }

      if (a3) {
        v12 = @"formatPattern";
      }
      else {
        v12 = @"format_pattern";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setFormatPattern:v14];
      }
    }
  }

  return a1;
}

- (GEOTimestampData)initWithJSON:(id)a3
{
  return (GEOTimestampData *)-[GEOTimestampData _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_7617;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_7618;
    }
    GEOTimestampDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTimestampDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTimestampDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
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
    [(GEOTimestampData *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    id v5 = v8;
    if (self->_timezone)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v8;
    }
    if (self->_formatPattern)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOTimestampData *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 13) = self->_timestampVal;
    *((unsigned char *)v5 + 60) |= 1u;
  }
  if (self->_timezone)
  {
    objc_msgSend(v5, "setTimezone:");
    v4 = v5;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((unsigned char *)v4 + 56) = self->_displayTimezone;
    *((unsigned char *)v4 + 60) |= 2u;
  }
  if (self->_formatPattern)
  {
    objc_msgSend(v5, "setFormatPattern:");
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
      GEOTimestampDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTimestampData *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_timestampVal;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_timezone copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 56) = self->_displayTimezone;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  uint64_t v11 = [(NSString *)self->_formatPattern copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOTimestampData *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 60);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_timestampVal != *((_DWORD *)v4 + 13)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_14;
  }
  timezone = self->_timezone;
  if ((unint64_t)timezone | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](timezone, "isEqual:")) {
      goto LABEL_14;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 60);
  }
  if ((flags & 2) == 0)
  {
    if ((v6 & 2) == 0) {
      goto LABEL_20;
    }
LABEL_14:
    char v8 = 0;
    goto LABEL_15;
  }
  if ((v6 & 2) == 0) {
    goto LABEL_14;
  }
  if (!self->_displayTimezone)
  {
    if (!*((unsigned char *)v4 + 56)) {
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  if (!*((unsigned char *)v4 + 56)) {
    goto LABEL_14;
  }
LABEL_20:
  formatPattern = self->_formatPattern;
  if ((unint64_t)formatPattern | *((void *)v4 + 3)) {
    char v8 = -[NSString isEqual:](formatPattern, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  [(GEOTimestampData *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_timestampVal;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_timezone hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_displayTimezone;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_formatPattern hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (unsigned int *)a3;
  [v5 readAll:0];
  NSUInteger v4 = v5;
  if (v5[15])
  {
    self->_timestampVal = v5[13];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 4))
  {
    -[GEOTimestampData setTimezone:](self, "setTimezone:");
    NSUInteger v4 = v5;
  }
  if ((v4[15] & 2) != 0)
  {
    self->_displayTimezone = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    -[GEOTimestampData setFormatPattern:](self, "setFormatPattern:");
    NSUInteger v4 = v5;
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTimestampDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_7622);
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
  *(unsigned char *)&self->_flags |= 0x24u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTimestampData *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_formatPattern, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)displayTimeZone
{
  BOOL v3 = [(GEOTimestampData *)self hasDisplayTimezone];
  if (v3)
  {
    LOBYTE(v3) = [(GEOTimestampData *)self displayTimezone];
  }
  return v3;
}

- (double)timeStamp
{
  return (double)[(GEOTimestampData *)self timestampVal];
}

- (NSTimeZone)timeZone
{
  BOOL v3 = [(GEOTimestampData *)self timezone];
  if ([v3 length])
  {
    NSUInteger v4 = (void *)MEMORY[0x1E4F1CAF0];
    uint64_t v5 = [(GEOTimestampData *)self timezone];
    char v6 = [v4 timeZoneWithName:v5];
  }
  else
  {
    char v6 = 0;
  }

  return (NSTimeZone *)v6;
}

@end