@interface GEOPDAutocompleteEntryBusiness
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDistance;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMapsId;
- (BOOL)hasMuid;
- (BOOL)hasPlace;
- (BOOL)hasResultProviderId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAutocompleteEntryBusiness)init;
- (GEOPDAutocompleteEntryBusiness)initWithData:(id)a3;
- (GEOPDAutocompleteEntryBusiness)initWithDictionary:(id)a3;
- (GEOPDAutocompleteEntryBusiness)initWithJSON:(id)a3;
- (GEOPDMapsIdentifier)mapsId;
- (GEOPDPlace)place;
- (PBUnknownFields)unknownFields;
- (double)distance;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)resultProviderId;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readMapsId;
- (void)_readPlace;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDistance:(double)a3;
- (void)setHasDistance:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasResultProviderId:(BOOL)a3;
- (void)setMapsId:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setPlace:(id)a3;
- (void)setResultProviderId:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteEntryBusiness

- (GEOPDAutocompleteEntryBusiness)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteEntryBusiness;
  v2 = [(GEOPDAutocompleteEntryBusiness *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteEntryBusiness)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteEntryBusiness;
  v3 = [(GEOPDAutocompleteEntryBusiness *)&v7 initWithData:a3];
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
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasMuid
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)resultProviderId
{
  return self->_resultProviderId;
}

- (void)setResultProviderId:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  self->_resultProviderId = a3;
}

- (void)setHasResultProviderId:(BOOL)a3
{
  if (a3) {
    char v3 = 68;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasResultProviderId
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readPlace
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
        GEOPDAutocompleteEntryBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlace_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlace
{
  return self->_place != 0;
}

- (GEOPDPlace)place
{
  -[GEOPDAutocompleteEntryBusiness _readPlace]((uint64_t)self);
  place = self->_place;

  return place;
}

- (void)setPlace:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasDistance
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readMapsId
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
        GEOPDAutocompleteEntryBusinessReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsId_tags_484);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMapsId
{
  return self->_mapsId != 0;
}

- (GEOPDMapsIdentifier)mapsId
{
  -[GEOPDAutocompleteEntryBusiness _readMapsId]((uint64_t)self);
  mapsId = self->_mapsId;

  return mapsId;
}

- (void)setMapsId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_mapsId, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteEntryBusiness;
  v4 = [(GEOPDAutocompleteEntryBusiness *)&v8 description];
  v5 = [(GEOPDAutocompleteEntryBusiness *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteEntryBusiness _dictionaryRepresentation:]((uint64_t)self, 0);
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
      objc_super v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
      [v4 setObject:v6 forKey:@"muid"];

      char v5 = *(unsigned char *)(a1 + 72);
    }
    if ((v5 & 4) != 0)
    {
      objc_super v7 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
      if (a2) {
        objc_super v8 = @"resultProviderId";
      }
      else {
        objc_super v8 = @"result_provider_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 place];
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"place"];
    }
    if (*(unsigned char *)(a1 + 72))
    {
      v12 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      [v4 setObject:v12 forKey:@"distance"];
    }
    v13 = [(id)a1 mapsId];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"mapsId";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"maps_id";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = *(void **)(a1 + 16);
    if (v17)
    {
      v18 = [v17 dictionaryRepresentation];
      v19 = v18;
      if (a2)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __60__GEOPDAutocompleteEntryBusiness__dictionaryRepresentation___block_invoke;
        v24[3] = &unk_1E53D8860;
        id v21 = v20;
        id v25 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];
        id v22 = v21;

        v19 = v22;
      }
      [v4 setObject:v19 forKey:@"Unknown Fields"];
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
  return -[GEOPDAutocompleteEntryBusiness _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEOPDAutocompleteEntryBusiness__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteEntryBusiness)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteEntryBusiness *)-[GEOPDAutocompleteEntryBusiness _initWithDictionary:isJSON:](self, a3, 0);
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

      if (a3) {
        objc_super v7 = @"resultProviderId";
      }
      else {
        objc_super v7 = @"result_provider_id";
      }
      objc_super v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setResultProviderId:", objc_msgSend(v8, "intValue"));
      }

      v9 = [v5 objectForKeyedSubscript:@"place"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [GEOPDPlace alloc];
        if (a3) {
          uint64_t v11 = [(GEOPDPlace *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEOPDPlace *)v10 initWithDictionary:v9];
        }
        v12 = (void *)v11;
        [a1 setPlace:v11];
      }
      v13 = [v5 objectForKeyedSubscript:@"distance"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v13 doubleValue];
        objc_msgSend(a1, "setDistance:");
      }

      if (a3) {
        v14 = @"mapsId";
      }
      else {
        v14 = @"maps_id";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [GEOPDMapsIdentifier alloc];
        if (a3) {
          uint64_t v17 = [(GEOPDMapsIdentifier *)v16 initWithJSON:v15];
        }
        else {
          uint64_t v17 = [(GEOPDMapsIdentifier *)v16 initWithDictionary:v15];
        }
        v18 = (void *)v17;
        [a1 setMapsId:v17];
      }
    }
  }

  return a1;
}

- (GEOPDAutocompleteEntryBusiness)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteEntryBusiness *)-[GEOPDAutocompleteEntryBusiness _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_498;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_499;
    }
    GEOPDAutocompleteEntryBusinessReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOPDPlace *)self->_place readAll:1];
    [(GEOPDMapsIdentifier *)self->_mapsId readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteEntryBusinessIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteEntryBusinessReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDAutocompleteEntryBusinessIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOPDAutocompleteEntryBusiness *)self readAll:0];
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      char flags = (char)self->_flags;
    }
    id v6 = v9;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v6 = v9;
    }
    if (self->_place)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteDoubleField();
      id v6 = v9;
    }
    if (self->_mapsId)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPDAutocompleteEntryBusiness _readMapsId]((uint64_t)self);
  if ([(GEOPDMapsIdentifier *)self->_mapsId hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDAutocompleteEntryBusiness _readPlace]((uint64_t)self);
  place = self->_place;

  return [(GEOPDPlace *)place hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v6 = (id *)a3;
  [(GEOPDAutocompleteEntryBusiness *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v6[5] = self->_muid;
    *((unsigned char *)v6 + 72) |= 2u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v6 + 17) = self->_resultProviderId;
    *((unsigned char *)v6 + 72) |= 4u;
  }
  if (self->_place)
  {
    objc_msgSend(v6, "setPlace:");
    v4 = v6;
  }
  if (*(unsigned char *)&self->_flags)
  {
    v4[3] = *(id *)&self->_distance;
    *((unsigned char *)v4 + 72) |= 1u;
  }
  if (self->_mapsId)
  {
    objc_msgSend(v6, "setMapsId:");
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
      GEOPDAutocompleteEntryBusinessReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDAutocompleteEntryBusiness *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(void *)(v5 + 40) = self->_muid;
    *(unsigned char *)(v5 + 72) |= 2u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_resultProviderId;
    *(unsigned char *)(v5 + 72) |= 4u;
  }
  id v10 = [(GEOPDPlace *)self->_place copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 24) = self->_distance;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  id v12 = [(GEOPDMapsIdentifier *)self->_mapsId copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

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
    goto LABEL_22;
  }
  [(GEOPDAutocompleteEntryBusiness *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 72);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_muid != *((void *)v4 + 5)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_resultProviderId != *((_DWORD *)v4 + 17)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_22;
  }
  place = self->_place;
  if ((unint64_t)place | *((void *)v4 + 6))
  {
    if (!-[GEOPDPlace isEqual:](place, "isEqual:"))
    {
LABEL_22:
      char v9 = 0;
      goto LABEL_23;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 72);
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_distance != *((double *)v4 + 3)) {
      goto LABEL_22;
    }
  }
  else if (v6)
  {
    goto LABEL_22;
  }
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((void *)v4 + 4)) {
    char v9 = -[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_23:

  return v9;
}

- (unint64_t)hash
{
  [(GEOPDAutocompleteEntryBusiness *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_muid;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_resultProviderId;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = [(GEOPDPlace *)self->_place hash];
  if (*(unsigned char *)&self->_flags)
  {
    double distance = self->_distance;
    double v8 = -distance;
    if (distance >= 0.0) {
      double v8 = self->_distance;
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
  return v4 ^ v3 ^ v6 ^ v5 ^ [(GEOPDMapsIdentifier *)self->_mapsId hash];
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  [v10 readAll:0];
  uint64_t v4 = (double *)v10;
  char v5 = *((unsigned char *)v10 + 72);
  if ((v5 & 2) != 0)
  {
    self->_muid = *((void *)v10 + 5);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v10 + 72);
  }
  if ((v5 & 4) != 0)
  {
    self->_resultProviderId = *((_DWORD *)v10 + 17);
    *(unsigned char *)&self->_flags |= 4u;
  }
  place = self->_place;
  uint64_t v7 = *((void *)v10 + 6);
  if (place)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOPDAutocompleteEntryBusiness setPlace:](self, "setPlace:");
  }
  uint64_t v4 = (double *)v10;
LABEL_11:
  if ((_BYTE)v4[9])
  {
    self->_double distance = v4[3];
    *(unsigned char *)&self->_flags |= 1u;
  }
  mapsId = self->_mapsId;
  uint64_t v9 = *((void *)v4 + 4);
  if (mapsId)
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[GEOPDMapsIdentifier mergeFrom:](mapsId, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[GEOPDAutocompleteEntryBusiness setMapsId:](self, "setMapsId:");
  }
  uint64_t v4 = (double *)v10;
LABEL_19:
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
      GEOPDAutocompleteEntryBusinessReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_503);
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
    [(GEOPDAutocompleteEntryBusiness *)self readAll:0];
    [(GEOPDPlace *)self->_place clearUnknownFields:1];
    mapsId = self->_mapsId;
    [(GEOPDMapsIdentifier *)mapsId clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end