@interface GEOLocationInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLocalityName;
- (BOOL)hasLocationName;
- (BOOL)hasSecondaryLocationName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocationInfo)init;
- (GEOLocationInfo)initWithData:(id)a3;
- (GEOLocationInfo)initWithDictionary:(id)a3;
- (GEOLocationInfo)initWithJSON:(id)a3;
- (NSString)localityName;
- (NSString)locationName;
- (NSString)secondaryLocationName;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLocalityName;
- (void)_readLocationName;
- (void)_readSecondaryLocationName;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setLocalityName:(id)a3;
- (void)setLocationName:(id)a3;
- (void)setSecondaryLocationName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLocationInfo

- (GEOLocationInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLocationInfo;
  v2 = [(GEOLocationInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLocationInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLocationInfo;
  v3 = [(GEOLocationInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocationName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocationInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationName_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLocationName
{
  return self->_locationName != 0;
}

- (NSString)locationName
{
  -[GEOLocationInfo _readLocationName]((uint64_t)self);
  locationName = self->_locationName;

  return locationName;
}

- (void)setLocationName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_locationName, a3);
}

- (void)_readSecondaryLocationName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocationInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSecondaryLocationName_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSecondaryLocationName
{
  return self->_secondaryLocationName != 0;
}

- (NSString)secondaryLocationName
{
  -[GEOLocationInfo _readSecondaryLocationName]((uint64_t)self);
  secondaryLocationName = self->_secondaryLocationName;

  return secondaryLocationName;
}

- (void)setSecondaryLocationName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_secondaryLocationName, a3);
}

- (void)_readLocalityName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocationInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalityName_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLocalityName
{
  return self->_localityName != 0;
}

- (NSString)localityName
{
  -[GEOLocationInfo _readLocalityName]((uint64_t)self);
  localityName = self->_localityName;

  return localityName;
}

- (void)setLocalityName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_localityName, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLocationInfo;
  v4 = [(GEOLocationInfo *)&v8 description];
  v5 = [(GEOLocationInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLocationInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 locationName];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"locationName";
      }
      else {
        objc_super v6 = @"location_name";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 secondaryLocationName];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"secondaryLocationName";
      }
      else {
        objc_super v8 = @"secondary_location_name";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [a1 localityName];
    if (v9)
    {
      if (a2) {
        v10 = @"localityName";
      }
      else {
        v10 = @"locality_name";
      }
      [v4 setObject:v9 forKey:v10];
    }

    v11 = (void *)a1[2];
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __45__GEOLocationInfo__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOLocationInfo _dictionaryRepresentation:](self, 1);
}

void __45__GEOLocationInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLocationInfo)initWithDictionary:(id)a3
{
  return (GEOLocationInfo *)-[GEOLocationInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"locationName";
      }
      else {
        objc_super v6 = @"location_name";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setLocationName:v8];
      }
      if (a3) {
        v9 = @"secondaryLocationName";
      }
      else {
        v9 = @"secondary_location_name";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setSecondaryLocationName:v11];
      }
      if (a3) {
        v12 = @"localityName";
      }
      else {
        v12 = @"locality_name";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setLocalityName:v14];
      }
    }
  }

  return a1;
}

- (GEOLocationInfo)initWithJSON:(id)a3
{
  return (GEOLocationInfo *)-[GEOLocationInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_758_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_759_0;
    }
    GEOLocationInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLocationInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLocationInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
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
    [(GEOLocationInfo *)self readAll:0];
    if (self->_locationName) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_secondaryLocationName)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_localityName)
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
  [(GEOLocationInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_locationName) {
    objc_msgSend(v5, "setLocationName:");
  }
  if (self->_secondaryLocationName) {
    objc_msgSend(v5, "setSecondaryLocationName:");
  }
  v4 = v5;
  if (self->_localityName)
  {
    objc_msgSend(v5, "setLocalityName:");
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
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLocationInfo *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_locationName copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    uint64_t v10 = [(NSString *)self->_secondaryLocationName copyWithZone:a3];
    v11 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;

    uint64_t v12 = [(NSString *)self->_localityName copyWithZone:a3];
    v13 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLocationInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLocationInfo *)self readAll:1],
         [v4 readAll:1],
         locationName = self->_locationName,
         !((unint64_t)locationName | v4[4]))
     || -[NSString isEqual:](locationName, "isEqual:"))
    && ((secondaryLocationName = self->_secondaryLocationName, !((unint64_t)secondaryLocationName | v4[5]))
     || -[NSString isEqual:](secondaryLocationName, "isEqual:")))
  {
    localityName = self->_localityName;
    if ((unint64_t)localityName | v4[3]) {
      char v8 = -[NSString isEqual:](localityName, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  [(GEOLocationInfo *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_locationName hash];
  NSUInteger v4 = [(NSString *)self->_secondaryLocationName hash] ^ v3;
  return v4 ^ [(NSString *)self->_localityName hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  [v4 readAll:0];
  if (v4[4]) {
    -[GEOLocationInfo setLocationName:](self, "setLocationName:");
  }
  if (v4[5]) {
    -[GEOLocationInfo setSecondaryLocationName:](self, "setSecondaryLocationName:");
  }
  if (v4[3]) {
    -[GEOLocationInfo setLocalityName:](self, "setLocalityName:");
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOLocationInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_763);
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
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOLocationInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLocationName, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_localityName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end