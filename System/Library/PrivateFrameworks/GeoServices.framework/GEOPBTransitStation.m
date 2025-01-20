@interface GEOPBTransitStation
+ (BOOL)isValid:(id)a3;
+ (Class)zoomNameType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocation;
- (BOOL)hasMuid;
- (BOOL)hasNameDisplayString;
- (BOOL)hasStationIndex;
- (BOOL)hasStructureType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)location;
- (GEOPBTransitStation)init;
- (GEOPBTransitStation)initWithData:(id)a3;
- (GEOPBTransitStation)initWithDictionary:(id)a3;
- (GEOPBTransitStation)initWithJSON:(id)a3;
- (NSMutableArray)zoomNames;
- (NSString)description;
- (NSString)nameDisplayString;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)identifier;
- (id)jsonRepresentation;
- (id)structureTypeAsString:(int)a3;
- (id)zoomNameAtIndex:(unint64_t)a3;
- (int)StringAsStructureType:(id)a3;
- (int)structureType;
- (unint64_t)hash;
- (unint64_t)muid;
- (unint64_t)zoomNamesCount;
- (unsigned)stationIndex;
- (void)_addNoFlagsZoomName:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLocation;
- (void)_readNameDisplayString;
- (void)_readZoomNames;
- (void)addZoomName:(id)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearZoomNames;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasStationIndex:(BOOL)a3;
- (void)setHasStructureType:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setNameDisplayString:(id)a3;
- (void)setStationIndex:(unsigned int)a3;
- (void)setStructureType:(int)a3;
- (void)setZoomNames:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitStation

- (GEOPBTransitStation)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitStation;
  v2 = [(GEOPBTransitStation *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitStation)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitStation;
  v3 = [(GEOPBTransitStation *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)stationIndex
{
  return self->_stationIndex;
}

- (void)setStationIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_stationIndex = a3;
}

- (void)setHasStationIndex:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStationIndex
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasMuid
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitStationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags_1004);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLatLng)location
{
  -[GEOPBTransitStation _readLocation]((uint64_t)self);
  location = self->_location;

  return location;
}

- (void)setLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (int)structureType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_structureType;
  }
  else {
    return -1;
  }
}

- (void)setStructureType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  self->_structureType = a3;
}

- (void)setHasStructureType:(BOOL)a3
{
  if (a3) {
    char v3 = -124;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasStructureType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)structureTypeAsString:(int)a3
{
  if ((a3 + 1) >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E5F78[a3 + 1];
  }

  return v3;
}

- (int)StringAsStructureType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TRANSIT_STRUCTURE_TYPE_UNKOWN"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"TRANSIT_STRUCTURE_TYPE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SHELTER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BUILDING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"UNDERGROUND"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ELEVATED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (void)_readZoomNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitStationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readZoomNames_tags_1005);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)zoomNames
{
  -[GEOPBTransitStation _readZoomNames]((uint64_t)self);
  zoomNames = self->_zoomNames;

  return zoomNames;
}

- (void)setZoomNames:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  zoomNames = self->_zoomNames;
  self->_zoomNames = v4;
}

- (void)clearZoomNames
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  zoomNames = self->_zoomNames;

  [(NSMutableArray *)zoomNames removeAllObjects];
}

- (void)addZoomName:(id)a3
{
  id v4 = a3;
  -[GEOPBTransitStation _readZoomNames]((uint64_t)self);
  -[GEOPBTransitStation _addNoFlagsZoomName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsZoomName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)zoomNamesCount
{
  -[GEOPBTransitStation _readZoomNames]((uint64_t)self);
  zoomNames = self->_zoomNames;

  return [(NSMutableArray *)zoomNames count];
}

- (id)zoomNameAtIndex:(unint64_t)a3
{
  -[GEOPBTransitStation _readZoomNames]((uint64_t)self);
  zoomNames = self->_zoomNames;

  return (id)[(NSMutableArray *)zoomNames objectAtIndex:a3];
}

+ (Class)zoomNameType
{
  return (Class)objc_opt_class();
}

- (void)_readNameDisplayString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitStationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNameDisplayString_tags_1006);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasNameDisplayString
{
  return self->_nameDisplayString != 0;
}

- (NSString)nameDisplayString
{
  -[GEOPBTransitStation _readNameDisplayString]((uint64_t)self);
  nameDisplayString = self->_nameDisplayString;

  return nameDisplayString;
}

- (void)setNameDisplayString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_nameDisplayString, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitStation;
  id v4 = [(GEOPBTransitStation *)&v8 description];
  id v5 = [(GEOPBTransitStation *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitStation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 76);
    if ((v5 & 2) != 0)
    {
      objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
      if (a2) {
        id v7 = @"stationIndex";
      }
      else {
        id v7 = @"station_index";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 76);
    }
    if (v5)
    {
      objc_super v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      [v4 setObject:v8 forKey:@"muid"];
    }
    v9 = [(id)a1 location];
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"location"];
    }
    if ((*(unsigned char *)(a1 + 76) & 4) != 0)
    {
      unsigned int v12 = *(_DWORD *)(a1 + 72) + 1;
      if (v12 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 72));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E53E5F78[v12];
      }
      if (a2) {
        v14 = @"structureType";
      }
      else {
        v14 = @"structure_type";
      }
      [v4 setObject:v13 forKey:v14];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v16 = *(id *)(a1 + 48);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v36 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            if (a2) {
              [v21 jsonRepresentation];
            }
            else {
            v22 = [v21 dictionaryRepresentation];
            }
            [v15 addObject:v22];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v18);
      }

      if (a2) {
        v23 = @"zoomName";
      }
      else {
        v23 = @"zoom_name";
      }
      [v4 setObject:v15 forKey:v23];
    }
    v24 = [(id)a1 nameDisplayString];
    if (v24)
    {
      if (a2) {
        v25 = @"nameDisplayString";
      }
      else {
        v25 = @"name_display_string";
      }
      [v4 setObject:v24 forKey:v25];
    }

    v26 = *(void **)(a1 + 16);
    if (v26)
    {
      v27 = [v26 dictionaryRepresentation];
      v28 = v27;
      if (a2)
      {
        v29 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __49__GEOPBTransitStation__dictionaryRepresentation___block_invoke;
        v33[3] = &unk_1E53D8860;
        id v30 = v29;
        id v34 = v30;
        [v28 enumerateKeysAndObjectsUsingBlock:v33];
        id v31 = v30;

        v28 = v31;
      }
      [v4 setObject:v28 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitStation _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOPBTransitStation__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (GEOPBTransitStation)initWithDictionary:(id)a3
{
  return (GEOPBTransitStation *)-[GEOPBTransitStation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_59;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_59;
  }
  if (a3) {
    objc_super v6 = @"stationIndex";
  }
  else {
    objc_super v6 = @"station_index";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStationIndex:", objc_msgSend(v7, "unsignedIntValue"));
  }

  objc_super v8 = [v5 objectForKeyedSubscript:@"muid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMuid:", objc_msgSend(v8, "unsignedLongLongValue"));
  }

  v9 = [v5 objectForKeyedSubscript:@"location"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v11 = [(GEOLatLng *)v10 initWithJSON:v9];
    }
    else {
      uint64_t v11 = [(GEOLatLng *)v10 initWithDictionary:v9];
    }
    unsigned int v12 = (void *)v11;
    [a1 setLocation:v11];
  }
  if (a3) {
    v13 = @"structureType";
  }
  else {
    v13 = @"structure_type";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    if ([v15 isEqualToString:@"TRANSIT_STRUCTURE_TYPE_UNKOWN"])
    {
      uint64_t v16 = 0xFFFFFFFFLL;
    }
    else if ([v15 isEqualToString:@"TRANSIT_STRUCTURE_TYPE_NONE"])
    {
      uint64_t v16 = 0;
    }
    else if ([v15 isEqualToString:@"SHELTER"])
    {
      uint64_t v16 = 1;
    }
    else if ([v15 isEqualToString:@"BUILDING"])
    {
      uint64_t v16 = 2;
    }
    else if ([v15 isEqualToString:@"UNDERGROUND"])
    {
      uint64_t v16 = 3;
    }
    else if ([v15 isEqualToString:@"ELEVATED"])
    {
      uint64_t v16 = 4;
    }
    else
    {
      uint64_t v16 = 0xFFFFFFFFLL;
    }

    goto LABEL_35;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v14 intValue];
LABEL_35:
    [a1 setStructureType:v16];
  }

  if (a3) {
    uint64_t v17 = @"zoomName";
  }
  else {
    uint64_t v17 = @"zoom_name";
  }
  uint64_t v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v32 = v5;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v25 = [GEOPBTransitZoomRangeString alloc];
            if (a3) {
              uint64_t v26 = [(GEOPBTransitZoomRangeString *)v25 initWithJSON:v24];
            }
            else {
              uint64_t v26 = [(GEOPBTransitZoomRangeString *)v25 initWithDictionary:v24];
            }
            v27 = (void *)v26;
            [a1 addZoomName:v26];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v21);
    }

    id v5 = v32;
  }

  if (a3) {
    v28 = @"nameDisplayString";
  }
  else {
    v28 = @"name_display_string";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = (void *)[v29 copy];
    [a1 setNameDisplayString:v30];
  }
LABEL_59:

  return a1;
}

- (GEOPBTransitStation)initWithJSON:(id)a3
{
  return (GEOPBTransitStation *)-[GEOPBTransitStation _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_1013;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1014;
    }
    GEOPBTransitStationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPBTransitStationCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitStationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitStationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 0xFu))
  {
    uint64_t v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    unsigned int v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPBTransitStation *)self readAll:0];
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_location) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->_zoomNames;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    if (self->_nameDisplayString) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPBTransitStation _readLocation]((uint64_t)self);
  location = self->_location;

  return [(GEOLatLng *)location hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v10 = (id *)a3;
  [(GEOPBTransitStation *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 14) = self->_readerMarkPos;
  *((_DWORD *)v10 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  id v4 = v10;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v10 + 17) = self->_stationIndex;
    *((unsigned char *)v10 + 76) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v10[4] = self->_muid;
    *((unsigned char *)v10 + 76) |= 1u;
  }
  if (self->_location)
  {
    objc_msgSend(v10, "setLocation:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_structureType;
    *((unsigned char *)v4 + 76) |= 4u;
  }
  if ([(GEOPBTransitStation *)self zoomNamesCount])
  {
    [v10 clearZoomNames];
    unint64_t v6 = [(GEOPBTransitStation *)self zoomNamesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(GEOPBTransitStation *)self zoomNameAtIndex:i];
        [v10 addZoomName:v9];
      }
    }
  }
  if (self->_nameDisplayString) {
    objc_msgSend(v10, "setNameDisplayString:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPBTransitStationReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBTransitStation *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_stationIndex;
    *(unsigned char *)(v5 + 76) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 32) = self->_muid;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  id v10 = [(GEOLatLng *)self->_location copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_structureType;
    *(unsigned char *)(v5 + 76) |= 4u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unsigned int v12 = self->_zoomNames;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (void)v21);
        [(id)v5 addZoomName:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  uint64_t v17 = [(NSString *)self->_nameDisplayString copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v17;

  id v19 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v19;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  [(GEOPBTransitStation *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 76);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_stationIndex != *((_DWORD *)v4 + 17)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_muid != *((void *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_24;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:"))
    {
LABEL_24:
      char v10 = 0;
      goto LABEL_25;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 76);
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_structureType != *((_DWORD *)v4 + 18)) {
      goto LABEL_24;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_24;
  }
  zoomNames = self->_zoomNames;
  if ((unint64_t)zoomNames | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](zoomNames, "isEqual:"))
  {
    goto LABEL_24;
  }
  nameDisplayString = self->_nameDisplayString;
  if ((unint64_t)nameDisplayString | *((void *)v4 + 5)) {
    char v10 = -[NSString isEqual:](nameDisplayString, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_25:

  return v10;
}

- (unint64_t)hash
{
  [(GEOPBTransitStation *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_stationIndex;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_muid;
      goto LABEL_6;
    }
  }
  unint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = [(GEOLatLng *)self->_location hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_structureType;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = v4 ^ v3 ^ v6 ^ v5 ^ [(NSMutableArray *)self->_zoomNames hash];
  return v7 ^ [(NSString *)self->_nameDisplayString hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 76);
  if ((v5 & 2) != 0)
  {
    self->_stationIndex = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v4 + 76);
  }
  if (v5)
  {
    self->_muid = *((void *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
  location = self->_location;
  uint64_t v7 = *((void *)v4 + 3);
  if (location)
  {
    if (v7) {
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOPBTransitStation setLocation:](self, "setLocation:");
  }
  if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
    self->_structureType = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_flags |= 4u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v4 + 6);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEOPBTransitStation addZoomName:](self, "addZoomName:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  if (*((void *)v4 + 5)) {
    -[GEOPBTransitStation setNameDisplayString:](self, "setNameDisplayString:");
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
      GEOPBTransitStationReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1018);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x88u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPBTransitStation *)self readAll:0];
    [(GEOLatLng *)self->_location clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_zoomNames;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomNames, 0);
  objc_storeStrong((id *)&self->_nameDisplayString, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)identifier
{
  if ([(GEOPBTransitStation *)self hasLocation])
  {
    BOOL v3 = [(GEOPBTransitStation *)self location];
    [v3 coordinate];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v7 = -180.0;
    double v5 = -180.0;
  }
  uint64_t v8 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([GEOMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", [(GEOPBTransitStation *)self muid], 0, v5, v7);

  return v8;
}

@end