@interface GEOMapsSearchResult
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAddress;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMapsId;
- (BOOL)hasMuid;
- (BOOL)hasPlaceActionDetails;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAddress)address;
- (GEOMapsSearchResult)init;
- (GEOMapsSearchResult)initWithData:(id)a3;
- (GEOMapsSearchResult)initWithDictionary:(id)a3;
- (GEOMapsSearchResult)initWithJSON:(id)a3;
- (GEOPDMapsIdentifier)mapsId;
- (GEOPlaceActionDetails)placeActionDetails;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAddress;
- (void)_readMapsId;
- (void)_readPlaceActionDetails;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddress:(id)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setMapsId:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setPlaceActionDetails:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapsSearchResult

- (BOOL)hasMapsId
{
  return self->_mapsId != 0;
}

- (void)_readMapsId
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
        GEOMapsSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsId_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (GEOMapsSearchResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapsSearchResult;
  v2 = [(GEOMapsSearchResult *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMapsSearchResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMapsSearchResult;
  id v3 = [(GEOMapsSearchResult *)&v7 initWithData:a3];
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
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasMuid
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readAddress
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
        GEOMapsSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddress_tags_5);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAddress
{
  return self->_address != 0;
}

- (GEOAddress)address
{
  -[GEOMapsSearchResult _readAddress]((uint64_t)self);
  address = self->_address;

  return address;
}

- (void)setAddress:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_address, a3);
}

- (void)_readPlaceActionDetails
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
        GEOMapsSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceActionDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasPlaceActionDetails
{
  return self->_placeActionDetails != 0;
}

- (GEOPlaceActionDetails)placeActionDetails
{
  -[GEOMapsSearchResult _readPlaceActionDetails]((uint64_t)self);
  placeActionDetails = self->_placeActionDetails;

  return placeActionDetails;
}

- (void)setPlaceActionDetails:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_placeActionDetails, a3);
}

- (GEOPDMapsIdentifier)mapsId
{
  -[GEOMapsSearchResult _readMapsId]((uint64_t)self);
  mapsId = self->_mapsId;

  return mapsId;
}

- (void)setMapsId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_mapsId, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapsSearchResult;
  v4 = [(GEOMapsSearchResult *)&v8 description];
  v5 = [(GEOMapsSearchResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapsSearchResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 60))
    {
      v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      [v4 setObject:v5 forKey:@"muid"];
    }
    objc_super v6 = [(id)a1 address];
    objc_super v7 = v6;
    if (v6)
    {
      if (a2) {
        [v6 jsonRepresentation];
      }
      else {
      objc_super v8 = [v6 dictionaryRepresentation];
      }
      [v4 setObject:v8 forKey:@"address"];
    }
    v9 = [(id)a1 placeActionDetails];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"placeActionDetails";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"place_action_details";
      }
      [v4 setObject:v11 forKey:v12];
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
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapsSearchResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOMapsSearchResult)initWithDictionary:(id)a3
{
  return (GEOMapsSearchResult *)-[GEOMapsSearchResult _initWithDictionary:isJSON:](self, a3, 0);
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

      objc_super v7 = [v5 objectForKeyedSubscript:@"address"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOAddress alloc];
        if (a3) {
          uint64_t v9 = [(GEOAddress *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOAddress *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setAddress:v9];
      }
      if (a3) {
        v11 = @"placeActionDetails";
      }
      else {
        v11 = @"place_action_details";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOPlaceActionDetails alloc];
        if (a3) {
          uint64_t v14 = [(GEOPlaceActionDetails *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOPlaceActionDetails *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setPlaceActionDetails:v14];
      }
      if (a3) {
        v16 = @"mapsId";
      }
      else {
        v16 = @"maps_id";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [GEOPDMapsIdentifier alloc];
        if (a3) {
          uint64_t v19 = [(GEOPDMapsIdentifier *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEOPDMapsIdentifier *)v18 initWithDictionary:v17];
        }
        v20 = (void *)v19;
        [a1 setMapsId:v19];
      }
    }
  }

  return a1;
}

- (GEOMapsSearchResult)initWithJSON:(id)a3
{
  return (GEOMapsSearchResult *)-[GEOMapsSearchResult _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_629;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_630;
    }
    GEOMapsSearchResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOAddress *)self->_address readAll:1];
    [(GEOPlaceActionDetails *)self->_placeActionDetails readAll:1];
    [(GEOPDMapsIdentifier *)self->_mapsId readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapsSearchResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapsSearchResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOMapsSearchResultIsDirty((uint64_t)self) & 1) == 0)
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOMapsSearchResult *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_address) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeActionDetails) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapsId) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOMapsSearchResult _readMapsId]((uint64_t)self);
  mapsId = self->_mapsId;

  return [(GEOPDMapsIdentifier *)mapsId hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOMapsSearchResult *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    v5[4] = self->_muid;
    *((unsigned char *)v5 + 60) |= 1u;
  }
  if (self->_address)
  {
    objc_msgSend(v5, "setAddress:");
    v4 = v5;
  }
  if (self->_placeActionDetails)
  {
    objc_msgSend(v5, "setPlaceActionDetails:");
    v4 = v5;
  }
  if (self->_mapsId)
  {
    objc_msgSend(v5, "setMapsId:");
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
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOMapsSearchResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOMapsSearchResult *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 32) = self->_muid;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  id v9 = [(GEOAddress *)self->_address copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  id v11 = [(GEOPlaceActionDetails *)self->_placeActionDetails copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  id v13 = [(GEOPDMapsIdentifier *)self->_mapsId copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOMapsSearchResult *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_muid != *((void *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  address = self->_address;
  if ((unint64_t)address | *((void *)v4 + 2) && !-[GEOAddress isEqual:](address, "isEqual:")) {
    goto LABEL_13;
  }
  placeActionDetails = self->_placeActionDetails;
  if ((unint64_t)placeActionDetails | *((void *)v4 + 5))
  {
    if (!-[GEOPlaceActionDetails isEqual:](placeActionDetails, "isEqual:")) {
      goto LABEL_13;
    }
  }
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((void *)v4 + 3)) {
    char v8 = -[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  [(GEOMapsSearchResult *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOAddress *)self->_address hash] ^ v3;
  unint64_t v5 = [(GEOPlaceActionDetails *)self->_placeActionDetails hash];
  return v4 ^ v5 ^ [(GEOPDMapsIdentifier *)self->_mapsId hash];
}

- (void)mergeFrom:(id)a3
{
  id v11 = (unint64_t *)a3;
  [v11 readAll:0];
  unint64_t v4 = v11;
  if (*((unsigned char *)v11 + 60))
  {
    self->_muid = v11[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
  address = self->_address;
  unint64_t v6 = v11[2];
  if (address)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOAddress mergeFrom:](address, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOMapsSearchResult setAddress:](self, "setAddress:");
  }
  unint64_t v4 = v11;
LABEL_9:
  placeActionDetails = self->_placeActionDetails;
  unint64_t v8 = v4[5];
  if (placeActionDetails)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOPlaceActionDetails mergeFrom:](placeActionDetails, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOMapsSearchResult setPlaceActionDetails:](self, "setPlaceActionDetails:");
  }
  unint64_t v4 = v11;
LABEL_15:
  mapsId = self->_mapsId;
  unint64_t v10 = v4[3];
  if (mapsId)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOPDMapsIdentifier mergeFrom:](mapsId, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOMapsSearchResult setMapsId:](self, "setMapsId:");
  }
  unint64_t v4 = v11;
LABEL_21:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeActionDetails, 0);
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_address, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end