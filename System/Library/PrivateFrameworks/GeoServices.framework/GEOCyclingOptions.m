@interface GEOCyclingOptions
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCyclingUserPreferences;
- (BOOL)hasCyclingVehicleSpecifications;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCyclingOptions)init;
- (GEOCyclingOptions)initWithData:(id)a3;
- (GEOCyclingOptions)initWithDictionary:(id)a3;
- (GEOCyclingOptions)initWithJSON:(id)a3;
- (GEOCyclingUserPreferences)cyclingUserPreferences;
- (GEOCyclingVehicleSpecifications)cyclingVehicleSpecifications;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCyclingUserPreferences;
- (void)_readCyclingVehicleSpecifications;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCyclingUserPreferences:(id)a3;
- (void)setCyclingVehicleSpecifications:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCyclingOptions

- (void)setCyclingVehicleSpecifications:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_cyclingVehicleSpecifications, a3);
}

- (void)setCyclingUserPreferences:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_cyclingUserPreferences, a3);
}

- (GEOCyclingOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCyclingOptions;
  v2 = [(GEOCyclingOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOCyclingOptions *)self readAll:0];
    if (self->_cyclingUserPreferences) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_cyclingVehicleSpecifications)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_1319;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_1320;
    }
    GEOCyclingOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOCyclingUserPreferences *)self->_cyclingUserPreferences readAll:1];
    [(GEOCyclingVehicleSpecifications *)self->_cyclingVehicleSpecifications readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cyclingVehicleSpecifications, 0);
  objc_storeStrong((id *)&self->_cyclingUserPreferences, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOCyclingOptions)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCyclingOptions;
  BOOL v3 = [(GEOCyclingOptions *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readCyclingUserPreferences
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCyclingOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCyclingUserPreferences_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasCyclingUserPreferences
{
  return self->_cyclingUserPreferences != 0;
}

- (GEOCyclingUserPreferences)cyclingUserPreferences
{
  -[GEOCyclingOptions _readCyclingUserPreferences]((uint64_t)self);
  cyclingUserPreferences = self->_cyclingUserPreferences;

  return cyclingUserPreferences;
}

- (void)_readCyclingVehicleSpecifications
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCyclingOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCyclingVehicleSpecifications_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasCyclingVehicleSpecifications
{
  return self->_cyclingVehicleSpecifications != 0;
}

- (GEOCyclingVehicleSpecifications)cyclingVehicleSpecifications
{
  -[GEOCyclingOptions _readCyclingVehicleSpecifications]((uint64_t)self);
  cyclingVehicleSpecifications = self->_cyclingVehicleSpecifications;

  return cyclingVehicleSpecifications;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCyclingOptions;
  v4 = [(GEOCyclingOptions *)&v8 description];
  id v5 = [(GEOCyclingOptions *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCyclingOptions _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 cyclingUserPreferences];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"cyclingUserPreferences";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"cycling_user_preferences";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 cyclingVehicleSpecifications];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"cyclingVehicleSpecifications";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"cycling_vehicle_specifications";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = (void *)a1[2];
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __47__GEOCyclingOptions__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
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
  return -[GEOCyclingOptions _dictionaryRepresentation:](self, 1);
}

void __47__GEOCyclingOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOCyclingOptions)initWithDictionary:(id)a3
{
  return (GEOCyclingOptions *)-[GEOCyclingOptions _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"cyclingUserPreferences";
      }
      else {
        objc_super v6 = @"cycling_user_preferences";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOCyclingUserPreferences alloc];
        if (a3) {
          uint64_t v9 = [(GEOCyclingUserPreferences *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOCyclingUserPreferences *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setCyclingUserPreferences:v9];
      }
      if (a3) {
        v11 = @"cyclingVehicleSpecifications";
      }
      else {
        v11 = @"cycling_vehicle_specifications";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOCyclingVehicleSpecifications alloc];
        if (a3) {
          uint64_t v14 = [(GEOCyclingVehicleSpecifications *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOCyclingVehicleSpecifications *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setCyclingVehicleSpecifications:v14];
      }
    }
  }

  return a1;
}

- (GEOCyclingOptions)initWithJSON:(id)a3
{
  return (GEOCyclingOptions *)-[GEOCyclingOptions _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCyclingOptionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCyclingOptionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOCyclingOptions *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_cyclingUserPreferences) {
    objc_msgSend(v4, "setCyclingUserPreferences:");
  }
  if (self->_cyclingVehicleSpecifications) {
    objc_msgSend(v4, "setCyclingVehicleSpecifications:");
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
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOCyclingOptions *)self readAll:0];
    id v8 = [(GEOCyclingUserPreferences *)self->_cyclingUserPreferences copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    id v10 = [(GEOCyclingVehicleSpecifications *)self->_cyclingVehicleSpecifications copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOCyclingOptionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOCyclingOptions *)self readAll:1],
         [v4 readAll:1],
         cyclingUserPreferences = self->_cyclingUserPreferences,
         !((unint64_t)cyclingUserPreferences | v4[3]))
     || -[GEOCyclingUserPreferences isEqual:](cyclingUserPreferences, "isEqual:")))
  {
    cyclingVehicleSpecifications = self->_cyclingVehicleSpecifications;
    if ((unint64_t)cyclingVehicleSpecifications | v4[4]) {
      char v7 = -[GEOCyclingVehicleSpecifications isEqual:](cyclingVehicleSpecifications, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  [(GEOCyclingOptions *)self readAll:1];
  unint64_t v3 = [(GEOCyclingUserPreferences *)self->_cyclingUserPreferences hash];
  return [(GEOCyclingVehicleSpecifications *)self->_cyclingVehicleSpecifications hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  cyclingUserPreferences = self->_cyclingUserPreferences;
  uint64_t v5 = v8[3];
  if (cyclingUserPreferences)
  {
    if (v5) {
      -[GEOCyclingUserPreferences mergeFrom:](cyclingUserPreferences, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOCyclingOptions setCyclingUserPreferences:](self, "setCyclingUserPreferences:");
  }
  cyclingVehicleSpecifications = self->_cyclingVehicleSpecifications;
  uint64_t v7 = v8[4];
  if (cyclingVehicleSpecifications)
  {
    if (v7) {
      -[GEOCyclingVehicleSpecifications mergeFrom:](cyclingVehicleSpecifications, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOCyclingOptions setCyclingVehicleSpecifications:](self, "setCyclingVehicleSpecifications:");
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
      GEOCyclingOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1324);
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
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOCyclingOptions *)self readAll:0];
    [(GEOCyclingUserPreferences *)self->_cyclingUserPreferences clearUnknownFields:1];
    cyclingVehicleSpecifications = self->_cyclingVehicleSpecifications;
    [(GEOCyclingVehicleSpecifications *)cyclingVehicleSpecifications clearUnknownFields:1];
  }
}

@end