@interface GEOURLExtraStorage
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMapRegion;
- (BOOL)hasPhoneNumber;
- (BOOL)hasStyleAttributes;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapRegion)mapRegion;
- (GEOStyleAttributes)styleAttributes;
- (GEOURLExtraStorage)init;
- (GEOURLExtraStorage)initWithData:(id)a3;
- (GEOURLExtraStorage)initWithDictionary:(id)a3;
- (GEOURLExtraStorage)initWithJSON:(id)a3;
- (NSString)phoneNumber;
- (NSString)url;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readMapRegion;
- (void)_readPhoneNumber;
- (void)_readStyleAttributes;
- (void)_readUrl;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setMapRegion:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOURLExtraStorage

- (GEOURLExtraStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOURLExtraStorage;
  v2 = [(GEOURLExtraStorage *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOURLExtraStorage)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOURLExtraStorage;
  v3 = [(GEOURLExtraStorage *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readStyleAttributes
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
        GEOURLExtraStorageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_7);
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
  -[GEOURLExtraStorage _readStyleAttributes]((uint64_t)self);
  styleAttributes = self->_styleAttributes;

  return styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLExtraStorageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags_3975);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMapRegion
{
  return self->_mapRegion != 0;
}

- (GEOMapRegion)mapRegion
{
  -[GEOURLExtraStorage _readMapRegion]((uint64_t)self);
  mapRegion = self->_mapRegion;

  return mapRegion;
}

- (void)setMapRegion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)_readPhoneNumber
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
        GEOURLExtraStorageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoneNumber_tags_3976);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPhoneNumber
{
  return self->_phoneNumber != 0;
}

- (NSString)phoneNumber
{
  -[GEOURLExtraStorage _readPhoneNumber]((uint64_t)self);
  phoneNumber = self->_phoneNumber;

  return phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (void)_readUrl
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
        GEOURLExtraStorageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrl_tags_3977);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (NSString)url
{
  -[GEOURLExtraStorage _readUrl]((uint64_t)self);
  url = self->_url;

  return url;
}

- (void)setUrl:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_url, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOURLExtraStorage;
  v4 = [(GEOURLExtraStorage *)&v8 description];
  v5 = [(GEOURLExtraStorage *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOURLExtraStorage _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 styleAttributes];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"styleAttributes";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"style_attributes";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 mapRegion];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"mapRegion";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"map_region";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [a1 phoneNumber];
    if (v13)
    {
      if (a2) {
        v14 = @"phoneNumber";
      }
      else {
        v14 = @"phone_number";
      }
      [v4 setObject:v13 forKey:v14];
    }

    v15 = [a1 url];
    if (v15) {
      [v4 setObject:v15 forKey:@"url"];
    }

    v16 = (void *)a1[2];
    if (v16)
    {
      v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __48__GEOURLExtraStorage__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
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
  return -[GEOURLExtraStorage _dictionaryRepresentation:](self, 1);
}

void __48__GEOURLExtraStorage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOURLExtraStorage)initWithDictionary:(id)a3
{
  return (GEOURLExtraStorage *)-[GEOURLExtraStorage _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"styleAttributes";
      }
      else {
        objc_super v6 = @"style_attributes";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOStyleAttributes alloc];
        if (a3) {
          uint64_t v9 = [(GEOStyleAttributes *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOStyleAttributes *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setStyleAttributes:v9];
      }
      if (a3) {
        v11 = @"mapRegion";
      }
      else {
        v11 = @"map_region";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOMapRegion alloc];
        if (a3) {
          uint64_t v14 = [(GEOMapRegion *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOMapRegion *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setMapRegion:v14];
      }
      if (a3) {
        v16 = @"phoneNumber";
      }
      else {
        v16 = @"phone_number";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = (void *)[v17 copy];
        [a1 setPhoneNumber:v18];
      }
      v19 = [v5 objectForKeyedSubscript:@"url"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = (void *)[v19 copy];
        [a1 setUrl:v20];
      }
    }
  }

  return a1;
}

- (GEOURLExtraStorage)initWithJSON:(id)a3
{
  return (GEOURLExtraStorage *)-[GEOURLExtraStorage _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3988;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3989;
    }
    GEOURLExtraStorageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOStyleAttributes *)self->_styleAttributes readAll:1];
    [(GEOMapRegion *)self->_mapRegion readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOURLExtraStorageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOURLExtraStorageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3E) == 0))
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
    [(GEOURLExtraStorage *)self readAll:0];
    if (self->_styleAttributes) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_mapRegion)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
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
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOURLExtraStorage _readMapRegion]((uint64_t)self);
  mapRegion = self->_mapRegion;

  return [(GEOMapRegion *)mapRegion hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOURLExtraStorage *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_styleAttributes) {
    objc_msgSend(v5, "setStyleAttributes:");
  }
  if (self->_mapRegion) {
    objc_msgSend(v5, "setMapRegion:");
  }
  v4 = v5;
  if (self->_phoneNumber)
  {
    objc_msgSend(v5, "setPhoneNumber:");
    v4 = v5;
  }
  if (self->_url)
  {
    objc_msgSend(v5, "setUrl:");
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
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOURLExtraStorage *)self readAll:0];
    id v8 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v8;

    id v10 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    uint64_t v12 = [(NSString *)self->_phoneNumber copyWithZone:a3];
    v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    uint64_t v14 = [(NSString *)self->_url copyWithZone:a3];
    v15 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOURLExtraStorageReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOURLExtraStorage *)self readAll:1],
         [v4 readAll:1],
         styleAttributes = self->_styleAttributes,
         !((unint64_t)styleAttributes | v4[5]))
     || -[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
    && ((mapRegion = self->_mapRegion, !((unint64_t)mapRegion | v4[3]))
     || -[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
    && ((phoneNumber = self->_phoneNumber, !((unint64_t)phoneNumber | v4[4]))
     || -[NSString isEqual:](phoneNumber, "isEqual:")))
  {
    url = self->_url;
    if ((unint64_t)url | v4[6]) {
      char v9 = -[NSString isEqual:](url, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  [(GEOURLExtraStorage *)self readAll:1];
  unint64_t v3 = [(GEOStyleAttributes *)self->_styleAttributes hash];
  unint64_t v4 = [(GEOMapRegion *)self->_mapRegion hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_phoneNumber hash];
  return v4 ^ v5 ^ [(NSString *)self->_url hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  styleAttributes = self->_styleAttributes;
  uint64_t v5 = v8[5];
  if (styleAttributes)
  {
    if (v5) {
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOURLExtraStorage setStyleAttributes:](self, "setStyleAttributes:");
  }
  mapRegion = self->_mapRegion;
  uint64_t v7 = v8[3];
  if (mapRegion)
  {
    if (v7) {
      -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOURLExtraStorage setMapRegion:](self, "setMapRegion:");
  }
  if (v8[4]) {
    -[GEOURLExtraStorage setPhoneNumber:](self, "setPhoneNumber:");
  }
  if (v8[6]) {
    -[GEOURLExtraStorage setUrl:](self, "setUrl:");
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
      GEOURLExtraStorageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3993);
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
  *(unsigned char *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOURLExtraStorage *)self readAll:0];
    [(GEOStyleAttributes *)self->_styleAttributes clearUnknownFields:1];
    mapRegion = self->_mapRegion;
    [(GEOMapRegion *)mapRegion clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end