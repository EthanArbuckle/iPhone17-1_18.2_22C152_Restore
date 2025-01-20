@interface GEORPAddressCorrections
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAccessPoint;
- (BOOL)hasAddressFields;
- (BOOL)hasCoordinate;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMapLocation;
- (BOOL)hasOriginalAddressFields;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPAccessPointCorrections)accessPoint;
- (GEORPAddressCorrections)init;
- (GEORPAddressCorrections)initWithData:(id)a3;
- (GEORPAddressCorrections)initWithDictionary:(id)a3;
- (GEORPAddressCorrections)initWithJSON:(id)a3;
- (GEORPCorrectedCoordinate)coordinate;
- (GEORPFeedbackAddressFields)addressFields;
- (GEORPFeedbackAddressFields)originalAddressFields;
- (GEORPMapLocation)mapLocation;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAccessPoint;
- (void)_readAddressFields;
- (void)_readCoordinate;
- (void)_readMapLocation;
- (void)_readOriginalAddressFields;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAccessPoint:(id)a3;
- (void)setAddressFields:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setMapLocation:(id)a3;
- (void)setOriginalAddressFields:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPAddressCorrections

- (GEORPAddressCorrections)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPAddressCorrections;
  v2 = [(GEORPAddressCorrections *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPAddressCorrections)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPAddressCorrections;
  v3 = [(GEORPAddressCorrections *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAddressFields
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
        GEORPAddressCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressFields_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasAddressFields
{
  return self->_addressFields != 0;
}

- (GEORPFeedbackAddressFields)addressFields
{
  -[GEORPAddressCorrections _readAddressFields]((uint64_t)self);
  addressFields = self->_addressFields;

  return addressFields;
}

- (void)setAddressFields:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_addressFields, a3);
}

- (void)_readCoordinate
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
        GEORPAddressCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCoordinate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (GEORPCorrectedCoordinate)coordinate
{
  -[GEORPAddressCorrections _readCoordinate]((uint64_t)self);
  coordinate = self->_coordinate;

  return coordinate;
}

- (void)setCoordinate:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (void)_readMapLocation
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
        GEORPAddressCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasMapLocation
{
  return self->_mapLocation != 0;
}

- (GEORPMapLocation)mapLocation
{
  -[GEORPAddressCorrections _readMapLocation]((uint64_t)self);
  mapLocation = self->_mapLocation;

  return mapLocation;
}

- (void)setMapLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_mapLocation, a3);
}

- (void)_readAccessPoint
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
        GEORPAddressCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAccessPoint_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasAccessPoint
{
  return self->_accessPoint != 0;
}

- (GEORPAccessPointCorrections)accessPoint
{
  -[GEORPAddressCorrections _readAccessPoint]((uint64_t)self);
  accessPoint = self->_accessPoint;

  return accessPoint;
}

- (void)setAccessPoint:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_accessPoint, a3);
}

- (void)_readOriginalAddressFields
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
        GEORPAddressCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalAddressFields_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasOriginalAddressFields
{
  return self->_originalAddressFields != 0;
}

- (GEORPFeedbackAddressFields)originalAddressFields
{
  -[GEORPAddressCorrections _readOriginalAddressFields]((uint64_t)self);
  originalAddressFields = self->_originalAddressFields;

  return originalAddressFields;
}

- (void)setOriginalAddressFields:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_originalAddressFields, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPAddressCorrections;
  v4 = [(GEORPAddressCorrections *)&v8 description];
  v5 = [(GEORPAddressCorrections *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPAddressCorrections _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 addressFields];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"addressFields";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"address_fields";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 coordinate];
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"coordinate"];
    }
    v12 = [a1 mapLocation];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"mapLocation";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"map_location";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = [a1 accessPoint];
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"accessPoint";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"access_point";
      }
      [v4 setObject:v18 forKey:v19];
    }
    v20 = [a1 originalAddressFields];
    v21 = v20;
    if (v20)
    {
      if (a2)
      {
        v22 = [v20 jsonRepresentation];
        v23 = @"originalAddressFields";
      }
      else
      {
        v22 = [v20 dictionaryRepresentation];
        v23 = @"original_address_fields";
      }
      [v4 setObject:v22 forKey:v23];
    }
    v24 = (void *)a1[2];
    if (v24)
    {
      v25 = [v24 dictionaryRepresentation];
      v26 = v25;
      if (a2)
      {
        v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __53__GEORPAddressCorrections__dictionaryRepresentation___block_invoke;
        v31[3] = &unk_1E53D8860;
        id v28 = v27;
        id v32 = v28;
        [v26 enumerateKeysAndObjectsUsingBlock:v31];
        id v29 = v28;

        v26 = v29;
      }
      [v4 setObject:v26 forKey:@"Unknown Fields"];
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
  return -[GEORPAddressCorrections _dictionaryRepresentation:](self, 1);
}

void __53__GEORPAddressCorrections__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPAddressCorrections)initWithDictionary:(id)a3
{
  return (GEORPAddressCorrections *)-[GEORPAddressCorrections _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"addressFields";
      }
      else {
        objc_super v6 = @"address_fields";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEORPFeedbackAddressFields alloc];
        if (a3) {
          uint64_t v9 = [(GEORPFeedbackAddressFields *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEORPFeedbackAddressFields *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setAddressFields:v9];
      }
      v11 = [v5 objectForKeyedSubscript:@"coordinate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEORPCorrectedCoordinate alloc];
        if (a3) {
          uint64_t v13 = [(GEORPCorrectedCoordinate *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEORPCorrectedCoordinate *)v12 initWithDictionary:v11];
        }
        v14 = (void *)v13;
        [a1 setCoordinate:v13];
      }
      if (a3) {
        v15 = @"mapLocation";
      }
      else {
        v15 = @"map_location";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [GEORPMapLocation alloc];
        if (a3) {
          uint64_t v18 = [(GEORPMapLocation *)v17 initWithJSON:v16];
        }
        else {
          uint64_t v18 = [(GEORPMapLocation *)v17 initWithDictionary:v16];
        }
        v19 = (void *)v18;
        [a1 setMapLocation:v18];
      }
      if (a3) {
        v20 = @"accessPoint";
      }
      else {
        v20 = @"access_point";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [GEORPAccessPointCorrections alloc];
        if (a3) {
          uint64_t v23 = [(GEORPAccessPointCorrections *)v22 initWithJSON:v21];
        }
        else {
          uint64_t v23 = [(GEORPAccessPointCorrections *)v22 initWithDictionary:v21];
        }
        v24 = (void *)v23;
        [a1 setAccessPoint:v23];
      }
      if (a3) {
        v25 = @"originalAddressFields";
      }
      else {
        v25 = @"original_address_fields";
      }
      v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v27 = [GEORPFeedbackAddressFields alloc];
        if (a3) {
          uint64_t v28 = [(GEORPFeedbackAddressFields *)v27 initWithJSON:v26];
        }
        else {
          uint64_t v28 = [(GEORPFeedbackAddressFields *)v27 initWithDictionary:v26];
        }
        id v29 = (void *)v28;
        [a1 setOriginalAddressFields:v28];
      }
    }
  }

  return a1;
}

- (GEORPAddressCorrections)initWithJSON:(id)a3
{
  return (GEORPAddressCorrections *)-[GEORPAddressCorrections _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_155;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_156;
    }
    GEORPAddressCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPAddressCorrectionsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPAddressCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPAddressCorrectionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPAddressCorrectionsIsDirty((uint64_t)self))
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
    [(GEORPAddressCorrections *)self readAll:0];
    if (self->_addressFields) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_coordinate)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_mapLocation)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_accessPoint)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_originalAddressFields)
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
  -[GEORPAddressCorrections _readAccessPoint]((uint64_t)self);
  if ([(GEORPAccessPointCorrections *)self->_accessPoint hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPAddressCorrections _readCoordinate]((uint64_t)self);
  if ([(GEORPCorrectedCoordinate *)self->_coordinate hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPAddressCorrections _readMapLocation]((uint64_t)self);
  mapLocation = self->_mapLocation;

  return [(GEORPMapLocation *)mapLocation hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPAddressCorrections *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_addressFields) {
    objc_msgSend(v5, "setAddressFields:");
  }
  if (self->_coordinate) {
    objc_msgSend(v5, "setCoordinate:");
  }
  v4 = v5;
  if (self->_mapLocation)
  {
    objc_msgSend(v5, "setMapLocation:");
    v4 = v5;
  }
  if (self->_accessPoint)
  {
    objc_msgSend(v5, "setAccessPoint:");
    v4 = v5;
  }
  if (self->_originalAddressFields)
  {
    objc_msgSend(v5, "setOriginalAddressFields:");
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
    [(GEORPAddressCorrections *)self readAll:0];
    id v8 = [(GEORPFeedbackAddressFields *)self->_addressFields copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEORPCorrectedCoordinate *)self->_coordinate copyWithZone:a3];
    v11 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;

    id v12 = [(GEORPMapLocation *)self->_mapLocation copyWithZone:a3];
    uint64_t v13 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v12;

    id v14 = [(GEORPAccessPointCorrections *)self->_accessPoint copyWithZone:a3];
    v15 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v14;

    id v16 = [(GEORPFeedbackAddressFields *)self->_originalAddressFields copyWithZone:a3];
    v17 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v16;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPAddressCorrectionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPAddressCorrections *)self readAll:1],
         [v4 readAll:1],
         addressFields = self->_addressFields,
         !((unint64_t)addressFields | v4[4]))
     || -[GEORPFeedbackAddressFields isEqual:](addressFields, "isEqual:"))
    && ((coordinate = self->_coordinate, !((unint64_t)coordinate | v4[5]))
     || -[GEORPCorrectedCoordinate isEqual:](coordinate, "isEqual:"))
    && ((mapLocation = self->_mapLocation, !((unint64_t)mapLocation | v4[6]))
     || -[GEORPMapLocation isEqual:](mapLocation, "isEqual:"))
    && ((accessPoint = self->_accessPoint, !((unint64_t)accessPoint | v4[3]))
     || -[GEORPAccessPointCorrections isEqual:](accessPoint, "isEqual:")))
  {
    originalAddressFields = self->_originalAddressFields;
    if ((unint64_t)originalAddressFields | v4[7]) {
      char v10 = -[GEORPFeedbackAddressFields isEqual:](originalAddressFields, "isEqual:");
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
  [(GEORPAddressCorrections *)self readAll:1];
  unint64_t v3 = [(GEORPFeedbackAddressFields *)self->_addressFields hash];
  unint64_t v4 = [(GEORPCorrectedCoordinate *)self->_coordinate hash] ^ v3;
  unint64_t v5 = [(GEORPMapLocation *)self->_mapLocation hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEORPAccessPointCorrections *)self->_accessPoint hash];
  return v6 ^ [(GEORPFeedbackAddressFields *)self->_originalAddressFields hash];
}

- (void)mergeFrom:(id)a3
{
  id v14 = a3;
  [v14 readAll:0];
  addressFields = self->_addressFields;
  uint64_t v5 = v14[4];
  if (addressFields)
  {
    if (v5) {
      -[GEORPFeedbackAddressFields mergeFrom:](addressFields, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPAddressCorrections setAddressFields:](self, "setAddressFields:");
  }
  coordinate = self->_coordinate;
  uint64_t v7 = v14[5];
  if (coordinate)
  {
    if (v7) {
      -[GEORPCorrectedCoordinate mergeFrom:](coordinate, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPAddressCorrections setCoordinate:](self, "setCoordinate:");
  }
  mapLocation = self->_mapLocation;
  uint64_t v9 = v14[6];
  if (mapLocation)
  {
    if (v9) {
      -[GEORPMapLocation mergeFrom:](mapLocation, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEORPAddressCorrections setMapLocation:](self, "setMapLocation:");
  }
  accessPoint = self->_accessPoint;
  uint64_t v11 = v14[3];
  if (accessPoint)
  {
    if (v11) {
      -[GEORPAccessPointCorrections mergeFrom:](accessPoint, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEORPAddressCorrections setAccessPoint:](self, "setAccessPoint:");
  }
  originalAddressFields = self->_originalAddressFields;
  uint64_t v13 = v14[7];
  if (originalAddressFields)
  {
    if (v13) {
      -[GEORPFeedbackAddressFields mergeFrom:](originalAddressFields, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEORPAddressCorrections setOriginalAddressFields:](self, "setOriginalAddressFields:");
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
      GEORPAddressCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_160);
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
    [(GEORPAddressCorrections *)self readAll:0];
    accessPoint = self->_accessPoint;
    [(GEORPAccessPointCorrections *)accessPoint clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalAddressFields, 0);
  objc_storeStrong((id *)&self->_mapLocation, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
  objc_storeStrong((id *)&self->_addressFields, 0);
  objc_storeStrong((id *)&self->_accessPoint, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end