@interface GEOMapItemStorageUserValues
+ (BOOL)isValid:(id)a3;
- (BOOL)hasName;
- (BOOL)hasPhoneNumber;
- (BOOL)hasTimeZoneData;
- (BOOL)hasTimeZoneName;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapItemStorageUserValues)init;
- (GEOMapItemStorageUserValues)initWithData:(id)a3;
- (GEOMapItemStorageUserValues)initWithDictionary:(id)a3;
- (GEOMapItemStorageUserValues)initWithJSON:(id)a3;
- (NSData)timeZoneData;
- (NSString)name;
- (NSString)phoneNumber;
- (NSString)timeZoneName;
- (NSString)url;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readName;
- (void)_readPhoneNumber;
- (void)_readTimeZoneData;
- (void)_readTimeZoneName;
- (void)_readUrl;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setTimeZoneData:(id)a3;
- (void)setTimeZoneName:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapItemStorageUserValues

- (void)setName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (GEOMapItemStorageUserValues)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapItemStorageUserValues;
  v2 = [(GEOMapItemStorageUserValues *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOMapItemStorageUserValues _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageUserValuesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_1215);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_timeZoneData, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOMapItemStorageUserValues)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMapItemStorageUserValues;
  id v3 = [(GEOMapItemStorageUserValues *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPhoneNumber
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageUserValuesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoneNumber_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPhoneNumber
{
  return self->_phoneNumber != 0;
}

- (NSString)phoneNumber
{
  -[GEOMapItemStorageUserValues _readPhoneNumber]((uint64_t)self);
  phoneNumber = self->_phoneNumber;

  return phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (void)_readUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageUserValuesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrl_tags_7);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (NSString)url
{
  -[GEOMapItemStorageUserValues _readUrl]((uint64_t)self);
  url = self->_url;

  return url;
}

- (void)setUrl:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_url, a3);
}

- (void)_readTimeZoneName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageUserValuesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimeZoneName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasTimeZoneName
{
  return self->_timeZoneName != 0;
}

- (NSString)timeZoneName
{
  -[GEOMapItemStorageUserValues _readTimeZoneName]((uint64_t)self);
  timeZoneName = self->_timeZoneName;

  return timeZoneName;
}

- (void)setTimeZoneName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_timeZoneName, a3);
}

- (void)_readTimeZoneData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageUserValuesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimeZoneData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasTimeZoneData
{
  return self->_timeZoneData != 0;
}

- (NSData)timeZoneData
{
  -[GEOMapItemStorageUserValues _readTimeZoneData]((uint64_t)self);
  timeZoneData = self->_timeZoneData;

  return timeZoneData;
}

- (void)setTimeZoneData:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_timeZoneData, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapItemStorageUserValues;
  v4 = [(GEOMapItemStorageUserValues *)&v8 description];
  v5 = [(GEOMapItemStorageUserValues *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapItemStorageUserValues _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 name];
    if (v5) {
      [v4 setObject:v5 forKey:@"name"];
    }

    objc_super v6 = [a1 phoneNumber];
    if (v6)
    {
      if (a2) {
        objc_super v7 = @"phoneNumber";
      }
      else {
        objc_super v7 = @"phone_number";
      }
      [v4 setObject:v6 forKey:v7];
    }

    objc_super v8 = [a1 url];
    if (v8) {
      [v4 setObject:v8 forKey:@"url"];
    }

    v9 = [a1 timeZoneName];
    if (v9)
    {
      if (a2) {
        v10 = @"timeZoneName";
      }
      else {
        v10 = @"time_zone_name";
      }
      [v4 setObject:v9 forKey:v10];
    }

    v11 = [a1 timeZoneData];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 base64EncodedStringWithOptions:0];
        [v4 setObject:v13 forKey:@"timeZoneData"];
      }
      else
      {
        [v4 setObject:v11 forKey:@"time_zone_data"];
      }
    }

    v14 = (void *)a1[2];
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __57__GEOMapItemStorageUserValues__dictionaryRepresentation___block_invoke;
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
  return -[GEOMapItemStorageUserValues _dictionaryRepresentation:](self, 1);
}

void __57__GEOMapItemStorageUserValues__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOMapItemStorageUserValues)initWithDictionary:(id)a3
{
  return (GEOMapItemStorageUserValues *)-[GEOMapItemStorageUserValues _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[v6 copy];
        [a1 setName:v7];
      }
      if (a3) {
        objc_super v8 = @"phoneNumber";
      }
      else {
        objc_super v8 = @"phone_number";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = (void *)[v9 copy];
        [a1 setPhoneNumber:v10];
      }
      v11 = [v5 objectForKeyedSubscript:@"url"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = (void *)[v11 copy];
        [a1 setUrl:v12];
      }
      if (a3) {
        v13 = @"timeZoneName";
      }
      else {
        v13 = @"time_zone_name";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = (void *)[v14 copy];
        [a1 setTimeZoneName:v15];
      }
      if (a3) {
        v16 = @"timeZoneData";
      }
      else {
        v16 = @"time_zone_data";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v17 options:0];
        [a1 setTimeZoneData:v18];
      }
    }
  }

  return a1;
}

- (GEOMapItemStorageUserValues)initWithJSON:(id)a3
{
  return (GEOMapItemStorageUserValues *)-[GEOMapItemStorageUserValues _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1237;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1238;
    }
    GEOMapItemStorageUserValuesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapItemStorageUserValuesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapItemStorageUserValuesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7E) == 0))
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
    [(GEOMapItemStorageUserValues *)self readAll:0];
    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_phoneNumber)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_url)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_timeZoneName)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_timeZoneData)
    {
      PBDataWriterWriteDataField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOMapItemStorageUserValues *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_name) {
    objc_msgSend(v5, "setName:");
  }
  if (self->_phoneNumber) {
    objc_msgSend(v5, "setPhoneNumber:");
  }
  v4 = v5;
  if (self->_url)
  {
    objc_msgSend(v5, "setUrl:");
    v4 = v5;
  }
  if (self->_timeZoneName)
  {
    objc_msgSend(v5, "setTimeZoneName:");
    v4 = v5;
  }
  if (self->_timeZoneData)
  {
    objc_msgSend(v5, "setTimeZoneData:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOMapItemStorageUserValues *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_name copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    uint64_t v10 = [(NSString *)self->_phoneNumber copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    uint64_t v12 = [(NSString *)self->_url copyWithZone:a3];
    v13 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v12;

    uint64_t v14 = [(NSString *)self->_timeZoneName copyWithZone:a3];
    v15 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v14;

    uint64_t v16 = [(NSData *)self->_timeZoneData copyWithZone:a3];
    v17 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v16;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOMapItemStorageUserValuesReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOMapItemStorageUserValues *)self readAll:1],
         [v4 readAll:1],
         name = self->_name,
         !((unint64_t)name | v4[3]))
     || -[NSString isEqual:](name, "isEqual:"))
    && ((phoneNumber = self->_phoneNumber, !((unint64_t)phoneNumber | v4[4]))
     || -[NSString isEqual:](phoneNumber, "isEqual:"))
    && ((url = self->_url, !((unint64_t)url | v4[7])) || -[NSString isEqual:](url, "isEqual:"))
    && ((timeZoneName = self->_timeZoneName, !((unint64_t)timeZoneName | v4[6]))
     || -[NSString isEqual:](timeZoneName, "isEqual:")))
  {
    timeZoneData = self->_timeZoneData;
    if ((unint64_t)timeZoneData | v4[5]) {
      char v10 = -[NSData isEqual:](timeZoneData, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  [(GEOMapItemStorageUserValues *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_phoneNumber hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_url hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_timeZoneName hash];
  return v6 ^ [(NSData *)self->_timeZoneData hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  [v4 readAll:0];
  if (v4[3]) {
    -[GEOMapItemStorageUserValues setName:](self, "setName:");
  }
  if (v4[4]) {
    -[GEOMapItemStorageUserValues setPhoneNumber:](self, "setPhoneNumber:");
  }
  if (v4[7]) {
    -[GEOMapItemStorageUserValues setUrl:](self, "setUrl:");
  }
  if (v4[6]) {
    -[GEOMapItemStorageUserValues setTimeZoneName:](self, "setTimeZoneName:");
  }
  if (v4[5]) {
    -[GEOMapItemStorageUserValues setTimeZoneData:](self, "setTimeZoneData:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      NSUInteger v5 = reader;
      objc_sync_enter(v5);
      GEOMapItemStorageUserValuesReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1242);
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
  *(unsigned char *)&self->_flags |= 0x41u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOMapItemStorageUserValues *)self readAll:0];
  }
}

@end