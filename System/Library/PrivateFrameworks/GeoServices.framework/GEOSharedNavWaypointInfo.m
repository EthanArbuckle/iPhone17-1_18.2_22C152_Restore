@interface GEOSharedNavWaypointInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasChargingStationInfo;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMapItemStorage;
- (BOOL)hasUniqueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapItemStorage)mapItemStorage;
- (GEOSharedNavChargingStationInfo)chargingStationInfo;
- (GEOSharedNavWaypointInfo)init;
- (GEOSharedNavWaypointInfo)initWithData:(id)a3;
- (GEOSharedNavWaypointInfo)initWithDictionary:(id)a3;
- (GEOSharedNavWaypointInfo)initWithJSON:(id)a3;
- (NSString)uniqueIdentifier;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readChargingStationInfo;
- (void)_readMapItemStorage;
- (void)_readUniqueIdentifier;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setChargingStationInfo:(id)a3;
- (void)setMapItemStorage:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSharedNavWaypointInfo

- (GEOSharedNavWaypointInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSharedNavWaypointInfo;
  v2 = [(GEOSharedNavWaypointInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSharedNavWaypointInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSharedNavWaypointInfo;
  v3 = [(GEOSharedNavWaypointInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMapItemStorage
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
        GEOSharedNavWaypointInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapItemStorage_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasMapItemStorage
{
  return self->_mapItemStorage != 0;
}

- (GEOMapItemStorage)mapItemStorage
{
  -[GEOSharedNavWaypointInfo _readMapItemStorage]((uint64_t)self);
  mapItemStorage = self->_mapItemStorage;

  return mapItemStorage;
}

- (void)setMapItemStorage:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_mapItemStorage, a3);
}

- (void)_readChargingStationInfo
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
        GEOSharedNavWaypointInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChargingStationInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasChargingStationInfo
{
  return self->_chargingStationInfo != 0;
}

- (GEOSharedNavChargingStationInfo)chargingStationInfo
{
  -[GEOSharedNavWaypointInfo _readChargingStationInfo]((uint64_t)self);
  chargingStationInfo = self->_chargingStationInfo;

  return chargingStationInfo;
}

- (void)setChargingStationInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_chargingStationInfo, a3);
}

- (void)_readUniqueIdentifier
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
        GEOSharedNavWaypointInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUniqueIdentifier_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (NSString)uniqueIdentifier
{
  -[GEOSharedNavWaypointInfo _readUniqueIdentifier]((uint64_t)self);
  uniqueIdentifier = self->_uniqueIdentifier;

  return uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSharedNavWaypointInfo;
  v4 = [(GEOSharedNavWaypointInfo *)&v8 description];
  v5 = [(GEOSharedNavWaypointInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSharedNavWaypointInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 mapItemStorage];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"mapItemStorage";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"map_item_storage";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 chargingStationInfo];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"chargingStationInfo";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"charging_station_info";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [a1 uniqueIdentifier];
    if (v13)
    {
      if (a2) {
        v14 = @"uniqueIdentifier";
      }
      else {
        v14 = @"unique_identifier";
      }
      [v4 setObject:v13 forKey:v14];
    }

    v15 = (void *)a1[2];
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __54__GEOSharedNavWaypointInfo__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
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
  return -[GEOSharedNavWaypointInfo _dictionaryRepresentation:](self, 1);
}

void __54__GEOSharedNavWaypointInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSharedNavWaypointInfo)initWithDictionary:(id)a3
{
  return (GEOSharedNavWaypointInfo *)-[GEOSharedNavWaypointInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"mapItemStorage";
      }
      else {
        objc_super v6 = @"map_item_storage";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOMapItemStorage alloc];
        if (a3) {
          uint64_t v9 = [(GEOMapItemStorage *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOMapItemStorage *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setMapItemStorage:v9];
      }
      if (a3) {
        v11 = @"chargingStationInfo";
      }
      else {
        v11 = @"charging_station_info";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOSharedNavChargingStationInfo alloc];
        if (a3) {
          uint64_t v14 = [(GEOSharedNavChargingStationInfo *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOSharedNavChargingStationInfo *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setChargingStationInfo:v14];
      }
      if (a3) {
        v16 = @"uniqueIdentifier";
      }
      else {
        v16 = @"unique_identifier";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = (void *)[v17 copy];
        [a1 setUniqueIdentifier:v18];
      }
    }
  }

  return a1;
}

- (GEOSharedNavWaypointInfo)initWithJSON:(id)a3
{
  return (GEOSharedNavWaypointInfo *)-[GEOSharedNavWaypointInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3774;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3775;
    }
    GEOSharedNavWaypointInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOMapItemStorage *)self->_mapItemStorage readAll:1];
    [(GEOSharedNavChargingStationInfo *)self->_chargingStationInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSharedNavWaypointInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSharedNavWaypointInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOSharedNavWaypointInfoIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOSharedNavWaypointInfo *)self readAll:0];
    if (self->_mapItemStorage) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_chargingStationInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_uniqueIdentifier)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOSharedNavWaypointInfo _readMapItemStorage]((uint64_t)self);
  mapItemStorage = self->_mapItemStorage;

  return [(GEOMapItemStorage *)mapItemStorage hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOSharedNavWaypointInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_mapItemStorage) {
    objc_msgSend(v5, "setMapItemStorage:");
  }
  if (self->_chargingStationInfo) {
    objc_msgSend(v5, "setChargingStationInfo:");
  }
  v4 = v5;
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v5, "setUniqueIdentifier:");
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
    [(GEOSharedNavWaypointInfo *)self readAll:0];
    id v8 = [(GEOMapItemStorage *)self->_mapItemStorage copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEOSharedNavChargingStationInfo *)self->_chargingStationInfo copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    uint64_t v12 = [(NSString *)self->_uniqueIdentifier copyWithZone:a3];
    v13 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOSharedNavWaypointInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOSharedNavWaypointInfo *)self readAll:1],
         [v4 readAll:1],
         mapItemStorage = self->_mapItemStorage,
         !((unint64_t)mapItemStorage | v4[4]))
     || -[GEOMapItemStorage isEqual:](mapItemStorage, "isEqual:"))
    && ((chargingStationInfo = self->_chargingStationInfo, !((unint64_t)chargingStationInfo | v4[3]))
     || -[GEOSharedNavChargingStationInfo isEqual:](chargingStationInfo, "isEqual:")))
  {
    uniqueIdentifier = self->_uniqueIdentifier;
    if ((unint64_t)uniqueIdentifier | v4[5]) {
      char v8 = -[NSString isEqual:](uniqueIdentifier, "isEqual:");
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
  [(GEOSharedNavWaypointInfo *)self readAll:1];
  unint64_t v3 = [(GEOMapItemStorage *)self->_mapItemStorage hash];
  unint64_t v4 = [(GEOSharedNavChargingStationInfo *)self->_chargingStationInfo hash] ^ v3;
  return v4 ^ [(NSString *)self->_uniqueIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  char v8 = a3;
  [v8 readAll:0];
  mapItemStorage = self->_mapItemStorage;
  uint64_t v5 = v8[4];
  if (mapItemStorage)
  {
    if (v5) {
      -[GEOMapItemStorage mergeFrom:](mapItemStorage, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOSharedNavWaypointInfo setMapItemStorage:](self, "setMapItemStorage:");
  }
  chargingStationInfo = self->_chargingStationInfo;
  uint64_t v7 = v8[3];
  if (chargingStationInfo)
  {
    if (v7) {
      -[GEOSharedNavChargingStationInfo mergeFrom:](chargingStationInfo, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOSharedNavWaypointInfo setChargingStationInfo:](self, "setChargingStationInfo:");
  }
  if (v8[5]) {
    -[GEOSharedNavWaypointInfo setUniqueIdentifier:](self, "setUniqueIdentifier:");
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
      GEOSharedNavWaypointInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3779);
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
    [(GEOSharedNavWaypointInfo *)self readAll:0];
    [(GEOMapItemStorage *)self->_mapItemStorage clearUnknownFields:1];
    chargingStationInfo = self->_chargingStationInfo;
    [(GEOSharedNavChargingStationInfo *)chargingStationInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_mapItemStorage, 0);
  objc_storeStrong((id *)&self->_chargingStationInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end