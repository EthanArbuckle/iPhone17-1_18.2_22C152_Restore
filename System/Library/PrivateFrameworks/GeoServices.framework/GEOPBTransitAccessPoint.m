@interface GEOPBTransitAccessPoint
+ (BOOL)isValid:(id)a3;
+ (Class)entranceZoomNameType;
+ (Class)exitZoomNameType;
- (BOOL)hasAccessPointIndex;
- (BOOL)hasEntranceNameDisplayString;
- (BOOL)hasExitNameDisplayString;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocation;
- (BOOL)hasMuid;
- (BOOL)hasStationIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)location;
- (GEOPBTransitAccessPoint)init;
- (GEOPBTransitAccessPoint)initWithData:(id)a3;
- (GEOPBTransitAccessPoint)initWithDictionary:(id)a3;
- (GEOPBTransitAccessPoint)initWithJSON:(id)a3;
- (NSMutableArray)entranceZoomNames;
- (NSMutableArray)exitZoomNames;
- (NSString)entranceNameDisplayString;
- (NSString)exitNameDisplayString;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)bestEntranceName;
- (id)bestExitName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entranceZoomNameAtIndex:(unint64_t)a3;
- (id)exitZoomNameAtIndex:(unint64_t)a3;
- (id)identifier;
- (id)jsonRepresentation;
- (unint64_t)entranceZoomNamesCount;
- (unint64_t)exitZoomNamesCount;
- (unint64_t)hash;
- (unint64_t)muid;
- (unsigned)accessPointIndex;
- (unsigned)stationIndex;
- (void)_addNoFlagsEntranceZoomName:(uint64_t)a1;
- (void)_addNoFlagsExitZoomName:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readEntranceNameDisplayString;
- (void)_readEntranceZoomNames;
- (void)_readExitNameDisplayString;
- (void)_readExitZoomNames;
- (void)_readLocation;
- (void)addEntranceZoomName:(id)a3;
- (void)addExitZoomName:(id)a3;
- (void)clearEntranceZoomNames;
- (void)clearExitZoomNames;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAccessPointIndex:(unsigned int)a3;
- (void)setEntranceNameDisplayString:(id)a3;
- (void)setEntranceZoomNames:(id)a3;
- (void)setExitNameDisplayString:(id)a3;
- (void)setExitZoomNames:(id)a3;
- (void)setHasAccessPointIndex:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasStationIndex:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setStationIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitAccessPoint

- (void)_readLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitAccessPointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags_7);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPBTransitAccessPointReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_26;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBTransitAccessPoint *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_accessPointIndex;
    *(_WORD *)(v5 + 92) |= 2u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 64) = self->_muid;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  id v10 = [(GEOLatLng *)self->_location copyWithZone:a3];
  v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_stationIndex;
    *(_WORD *)(v5 + 92) |= 4u;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v12 = self->_entranceZoomNames;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addEntranceZoomName:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v13);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v17 = self->_exitZoomNames;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v17);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * j), "copyWithZone:", a3, (void)v28);
        [(id)v5 addExitZoomName:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v18);
  }

  uint64_t v22 = [(NSString *)self->_entranceNameDisplayString copyWithZone:a3];
  v23 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v22;

  uint64_t v24 = [(NSString *)self->_exitNameDisplayString copyWithZone:a3];
  v25 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v24;

  v26 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v26;
LABEL_26:

  return (id)v5;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v5 = *(_WORD *)(a1 + 92);
    if ((v5 & 2) != 0)
    {
      v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
      if (a2) {
        v7 = @"accessPointIndex";
      }
      else {
        v7 = @"access_point_index";
      }
      [v4 setObject:v6 forKey:v7];

      __int16 v5 = *(_WORD *)(a1 + 92);
    }
    if (v5)
    {
      id v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64)];
      [v4 setObject:v8 forKey:@"muid"];
    }
    v9 = [(id)a1 location];
    id v10 = v9;
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
    if ((*(_WORD *)(a1 + 92) & 4) != 0)
    {
      v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 88)];
      if (a2) {
        uint64_t v13 = @"stationIndex";
      }
      else {
        uint64_t v13 = @"station_index";
      }
      [v4 setObject:v12 forKey:v13];
    }
    if ([*(id *)(a1 + 32) count])
    {
      uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v50 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v49 objects:v54 count:16];
        }
        while (v17);
      }

      if (a2) {
        uint64_t v22 = @"entranceZoomName";
      }
      else {
        uint64_t v22 = @"entrance_zoom_name";
      }
      [v4 setObject:v14 forKey:v22];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v24 = *(id *)(a1 + 48);
      uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v46;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v46 != v27) {
              objc_enumerationMutation(v24);
            }
            long long v29 = *(void **)(*((void *)&v45 + 1) + 8 * j);
            if (a2) {
              [v29 jsonRepresentation];
            }
            else {
            long long v30 = [v29 dictionaryRepresentation];
            }
            [v23 addObject:v30];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v45 objects:v53 count:16];
        }
        while (v26);
      }

      if (a2) {
        long long v31 = @"exitZoomName";
      }
      else {
        long long v31 = @"exit_zoom_name";
      }
      [v4 setObject:v23 forKey:v31];
    }
    long long v32 = [(id)a1 entranceNameDisplayString];
    if (v32)
    {
      if (a2) {
        long long v33 = @"entranceNameDisplayString";
      }
      else {
        long long v33 = @"entrance_name_display_string";
      }
      [v4 setObject:v32 forKey:v33];
    }

    long long v34 = [(id)a1 exitNameDisplayString];
    if (v34)
    {
      if (a2) {
        long long v35 = @"exitNameDisplayString";
      }
      else {
        long long v35 = @"exit_name_display_string";
      }
      [v4 setObject:v34 forKey:v35];
    }

    v36 = *(void **)(a1 + 16);
    if (v36)
    {
      v37 = [v36 dictionaryRepresentation];
      uint64_t v38 = v37;
      if (a2)
      {
        v39 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __53__GEOPBTransitAccessPoint__dictionaryRepresentation___block_invoke;
        v43[3] = &unk_1E53D8860;
        id v40 = v39;
        id v44 = v40;
        [v38 enumerateKeysAndObjectsUsingBlock:v43];
        id v41 = v40;

        uint64_t v38 = v41;
      }
      [v4 setObject:v38 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)hash
{
  [(GEOPBTransitAccessPoint *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_accessPointIndex;
    if (flags) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (flags)
    {
LABEL_3:
      unint64_t v5 = 2654435761u * self->_muid;
      goto LABEL_6;
    }
  }
  unint64_t v5 = 0;
LABEL_6:
  unint64_t v6 = [(GEOLatLng *)self->_location hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_stationIndex;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v5 ^ v4 ^ v7 ^ v6 ^ [(NSMutableArray *)self->_entranceZoomNames hash];
  uint64_t v9 = [(NSMutableArray *)self->_exitZoomNames hash];
  NSUInteger v10 = v8 ^ v9 ^ [(NSString *)self->_entranceNameDisplayString hash];
  return v10 ^ [(NSString *)self->_exitNameDisplayString hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  [(GEOPBTransitAccessPoint *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 46);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_accessPointIndex != *((_DWORD *)v4 + 21)) {
      goto LABEL_28;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_28;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_muid != *((void *)v4 + 8)) {
      goto LABEL_28;
    }
  }
  else if (v6)
  {
    goto LABEL_28;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 7))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:"))
    {
LABEL_28:
      char v12 = 0;
      goto LABEL_29;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v6 = *((_WORD *)v4 + 46);
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_stationIndex != *((_DWORD *)v4 + 22)) {
      goto LABEL_28;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_28;
  }
  entranceZoomNames = self->_entranceZoomNames;
  if ((unint64_t)entranceZoomNames | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](entranceZoomNames, "isEqual:"))
  {
    goto LABEL_28;
  }
  exitZoomNames = self->_exitZoomNames;
  if ((unint64_t)exitZoomNames | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](exitZoomNames, "isEqual:")) {
      goto LABEL_28;
    }
  }
  entranceNameDisplayString = self->_entranceNameDisplayString;
  if ((unint64_t)entranceNameDisplayString | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](entranceNameDisplayString, "isEqual:")) {
      goto LABEL_28;
    }
  }
  exitNameDisplayString = self->_exitNameDisplayString;
  if ((unint64_t)exitNameDisplayString | *((void *)v4 + 5)) {
    char v12 = -[NSString isEqual:](exitNameDisplayString, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_29:

  return v12;
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_45;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_45;
    }
    GEOPBTransitAccessPointReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPBTransitAccessPointCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOPBTransitAccessPoint)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitAccessPoint;
  v2 = [(GEOPBTransitAccessPoint *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPBTransitAccessPoint)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitAccessPoint;
  BOOL v3 = [(GEOPBTransitAccessPoint *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    unint64_t v5 = v3;
  }

  return v4;
}

- (unsigned)accessPointIndex
{
  return self->_accessPointIndex;
}

- (void)setAccessPointIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_accessPointIndex = a3;
}

- (void)setHasAccessPointIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 514;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasAccessPointIndex
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasMuid
{
  return *(_WORD *)&self->_flags & 1;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLatLng)location
{
  -[GEOPBTransitAccessPoint _readLocation]((uint64_t)self);
  location = self->_location;

  return location;
}

- (void)setLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (unsigned)stationIndex
{
  return self->_stationIndex;
}

- (void)setStationIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_stationIndex = a3;
}

- (void)setHasStationIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 516;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasStationIndex
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readEntranceZoomNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitAccessPointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEntranceZoomNames_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)entranceZoomNames
{
  -[GEOPBTransitAccessPoint _readEntranceZoomNames]((uint64_t)self);
  entranceZoomNames = self->_entranceZoomNames;

  return entranceZoomNames;
}

- (void)setEntranceZoomNames:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  entranceZoomNames = self->_entranceZoomNames;
  self->_entranceZoomNames = v4;
}

- (void)clearEntranceZoomNames
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  entranceZoomNames = self->_entranceZoomNames;

  [(NSMutableArray *)entranceZoomNames removeAllObjects];
}

- (void)addEntranceZoomName:(id)a3
{
  id v4 = a3;
  -[GEOPBTransitAccessPoint _readEntranceZoomNames]((uint64_t)self);
  -[GEOPBTransitAccessPoint _addNoFlagsEntranceZoomName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsEntranceZoomName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)entranceZoomNamesCount
{
  -[GEOPBTransitAccessPoint _readEntranceZoomNames]((uint64_t)self);
  entranceZoomNames = self->_entranceZoomNames;

  return [(NSMutableArray *)entranceZoomNames count];
}

- (id)entranceZoomNameAtIndex:(unint64_t)a3
{
  -[GEOPBTransitAccessPoint _readEntranceZoomNames]((uint64_t)self);
  entranceZoomNames = self->_entranceZoomNames;

  return (id)[(NSMutableArray *)entranceZoomNames objectAtIndex:a3];
}

+ (Class)entranceZoomNameType
{
  return (Class)objc_opt_class();
}

- (void)_readExitZoomNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitAccessPointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExitZoomNames_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)exitZoomNames
{
  -[GEOPBTransitAccessPoint _readExitZoomNames]((uint64_t)self);
  exitZoomNames = self->_exitZoomNames;

  return exitZoomNames;
}

- (void)setExitZoomNames:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  exitZoomNames = self->_exitZoomNames;
  self->_exitZoomNames = v4;
}

- (void)clearExitZoomNames
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  exitZoomNames = self->_exitZoomNames;

  [(NSMutableArray *)exitZoomNames removeAllObjects];
}

- (void)addExitZoomName:(id)a3
{
  id v4 = a3;
  -[GEOPBTransitAccessPoint _readExitZoomNames]((uint64_t)self);
  -[GEOPBTransitAccessPoint _addNoFlagsExitZoomName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsExitZoomName:(uint64_t)a1
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

- (unint64_t)exitZoomNamesCount
{
  -[GEOPBTransitAccessPoint _readExitZoomNames]((uint64_t)self);
  exitZoomNames = self->_exitZoomNames;

  return [(NSMutableArray *)exitZoomNames count];
}

- (id)exitZoomNameAtIndex:(unint64_t)a3
{
  -[GEOPBTransitAccessPoint _readExitZoomNames]((uint64_t)self);
  exitZoomNames = self->_exitZoomNames;

  return (id)[(NSMutableArray *)exitZoomNames objectAtIndex:a3];
}

+ (Class)exitZoomNameType
{
  return (Class)objc_opt_class();
}

- (void)_readEntranceNameDisplayString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitAccessPointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEntranceNameDisplayString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasEntranceNameDisplayString
{
  return self->_entranceNameDisplayString != 0;
}

- (NSString)entranceNameDisplayString
{
  -[GEOPBTransitAccessPoint _readEntranceNameDisplayString]((uint64_t)self);
  entranceNameDisplayString = self->_entranceNameDisplayString;

  return entranceNameDisplayString;
}

- (void)setEntranceNameDisplayString:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_entranceNameDisplayString, a3);
}

- (void)_readExitNameDisplayString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitAccessPointReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExitNameDisplayString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasExitNameDisplayString
{
  return self->_exitNameDisplayString != 0;
}

- (NSString)exitNameDisplayString
{
  -[GEOPBTransitAccessPoint _readExitNameDisplayString]((uint64_t)self);
  exitNameDisplayString = self->_exitNameDisplayString;

  return exitNameDisplayString;
}

- (void)setExitNameDisplayString:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_exitNameDisplayString, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitAccessPoint;
  id v4 = [(GEOPBTransitAccessPoint *)&v8 description];
  id v5 = [(GEOPBTransitAccessPoint *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitAccessPoint _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitAccessPoint _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOPBTransitAccessPoint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPBTransitAccessPoint)initWithDictionary:(id)a3
{
  return (GEOPBTransitAccessPoint *)-[GEOPBTransitAccessPoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"accessPointIndex";
      }
      else {
        objc_super v6 = @"access_point_index";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAccessPointIndex:", objc_msgSend(v7, "unsignedIntValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"muid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMuid:", objc_msgSend(v8, "unsignedLongLongValue"));
      }

      uint64_t v9 = [v5 objectForKeyedSubscript:@"location"];
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
        char v12 = (void *)v11;
        [a1 setLocation:v11];
      }
      if (a3) {
        uint64_t v13 = @"stationIndex";
      }
      else {
        uint64_t v13 = @"station_index";
      }
      uint64_t v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStationIndex:", objc_msgSend(v14, "unsignedIntValue"));
      }

      if (a3) {
        id v15 = @"entranceZoomName";
      }
      else {
        id v15 = @"entrance_zoom_name";
      }
      uint64_t v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      id v44 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v49 objects:v54 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v50 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v49 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v23 = [GEOPBTransitZoomRangeString alloc];
                if (a3) {
                  uint64_t v24 = [(GEOPBTransitZoomRangeString *)v23 initWithJSON:v22];
                }
                else {
                  uint64_t v24 = [(GEOPBTransitZoomRangeString *)v23 initWithDictionary:v22];
                }
                uint64_t v25 = (void *)v24;
                [a1 addEntranceZoomName:v24];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v49 objects:v54 count:16];
          }
          while (v19);
        }

        id v5 = v44;
      }

      if (a3) {
        uint64_t v26 = @"exitZoomName";
      }
      else {
        uint64_t v26 = @"exit_zoom_name";
      }
      uint64_t v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v28 = v27;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v46;
          do
          {
            for (uint64_t j = 0; j != v30; ++j)
            {
              if (*(void *)v46 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = *(void *)(*((void *)&v45 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v34 = [GEOPBTransitZoomRangeString alloc];
                if (a3) {
                  uint64_t v35 = [(GEOPBTransitZoomRangeString *)v34 initWithJSON:v33];
                }
                else {
                  uint64_t v35 = [(GEOPBTransitZoomRangeString *)v34 initWithDictionary:v33];
                }
                v36 = (void *)v35;
                [a1 addExitZoomName:v35];
              }
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v45 objects:v53 count:16];
          }
          while (v30);
        }

        id v5 = v44;
      }

      if (a3) {
        v37 = @"entranceNameDisplayString";
      }
      else {
        v37 = @"entrance_name_display_string";
      }
      uint64_t v38 = [v5 objectForKeyedSubscript:v37];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v39 = (void *)[v38 copy];
        [a1 setEntranceNameDisplayString:v39];
      }
      if (a3) {
        id v40 = @"exitNameDisplayString";
      }
      else {
        id v40 = @"exit_name_display_string";
      }
      id v41 = [v5 objectForKeyedSubscript:v40];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v42 = (void *)[v41 copy];
        [a1 setExitNameDisplayString:v42];
      }
    }
  }

  return a1;
}

- (GEOPBTransitAccessPoint)initWithJSON:(id)a3
{
  return (GEOPBTransitAccessPoint *)-[GEOPBTransitAccessPoint _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitAccessPointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitAccessPointReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPBTransitAccessPointIsDirty((uint64_t)self) & 1) == 0)
  {
    id v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPBTransitAccessPoint *)self readAll:0];
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_location) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(_WORD *)&self->_flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = self->_entranceZoomNames;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = self->_exitZoomNames;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }

    if (self->_entranceNameDisplayString) {
      PBDataWriterWriteStringField();
    }
    if (self->_exitNameDisplayString) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPBTransitAccessPoint _readLocation]((uint64_t)self);
  location = self->_location;

  return [(GEOLatLng *)location hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v15 = (id *)a3;
  [(GEOPBTransitAccessPoint *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 18) = self->_readerMarkPos;
  *((_DWORD *)v15 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  id v4 = v15;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v15 + 21) = self->_accessPointIndex;
    *((_WORD *)v15 + 46) |= 2u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    v15[8] = self->_muid;
    *((_WORD *)v15 + 46) |= 1u;
  }
  if (self->_location)
  {
    objc_msgSend(v15, "setLocation:");
    id v4 = v15;
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_stationIndex;
    *((_WORD *)v4 + 46) |= 4u;
  }
  if ([(GEOPBTransitAccessPoint *)self entranceZoomNamesCount])
  {
    [v15 clearEntranceZoomNames];
    unint64_t v6 = [(GEOPBTransitAccessPoint *)self entranceZoomNamesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(GEOPBTransitAccessPoint *)self entranceZoomNameAtIndex:i];
        [v15 addEntranceZoomName:v9];
      }
    }
  }
  if ([(GEOPBTransitAccessPoint *)self exitZoomNamesCount])
  {
    [v15 clearExitZoomNames];
    unint64_t v10 = [(GEOPBTransitAccessPoint *)self exitZoomNamesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(GEOPBTransitAccessPoint *)self exitZoomNameAtIndex:j];
        [v15 addExitZoomName:v13];
      }
    }
  }
  if (self->_entranceNameDisplayString) {
    objc_msgSend(v15, "setEntranceNameDisplayString:");
  }
  uint64_t v14 = v15;
  if (self->_exitNameDisplayString)
  {
    objc_msgSend(v15, "setExitNameDisplayString:");
    uint64_t v14 = v15;
  }
}

- (void)mergeFrom:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  __int16 v5 = *((_WORD *)v4 + 46);
  if ((v5 & 2) != 0)
  {
    self->_accessPointIndex = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 2u;
    __int16 v5 = *((_WORD *)v4 + 46);
  }
  if (v5)
  {
    self->_muid = *((void *)v4 + 8);
    *(_WORD *)&self->_flags |= 1u;
  }
  location = self->_location;
  uint64_t v7 = *((void *)v4 + 7);
  if (location)
  {
    if (v7) {
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOPBTransitAccessPoint setLocation:](self, "setLocation:");
  }
  if ((*((_WORD *)v4 + 46) & 4) != 0)
  {
    self->_stationIndex = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 4u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = *((id *)v4 + 4);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        [(GEOPBTransitAccessPoint *)self addEntranceZoomName:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = *((id *)v4 + 6);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[GEOPBTransitAccessPoint addExitZoomName:](self, "addExitZoomName:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }

  if (*((void *)v4 + 3)) {
    -[GEOPBTransitAccessPoint setEntranceNameDisplayString:](self, "setEntranceNameDisplayString:");
  }
  if (*((void *)v4 + 5)) {
    -[GEOPBTransitAccessPoint setExitNameDisplayString:](self, "setExitNameDisplayString:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      __int16 v5 = reader;
      objc_sync_enter(v5);
      GEOPBTransitAccessPointReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_8);
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x208u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPBTransitAccessPoint *)self readAll:0];
    [(GEOLatLng *)self->_location clearUnknownFields:1];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_entranceZoomNames;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = self->_exitZoomNames;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_exitZoomNames, 0);
  objc_storeStrong((id *)&self->_exitNameDisplayString, 0);
  objc_storeStrong((id *)&self->_entranceZoomNames, 0);
  objc_storeStrong((id *)&self->_entranceNameDisplayString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)bestEntranceName
{
  return [(GEOPBTransitAccessPoint *)self bestEntranceNameWithLocale:0];
}

- (id)bestExitName
{
  return [(GEOPBTransitAccessPoint *)self bestExitNameWithLocale:0];
}

- (id)identifier
{
  if ([(GEOPBTransitAccessPoint *)self hasLocation])
  {
    BOOL v3 = [(GEOPBTransitAccessPoint *)self location];
    [v3 coordinate];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v7 = -180.0;
    double v5 = -180.0;
  }
  uint64_t v8 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([GEOMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", [(GEOPBTransitAccessPoint *)self muid], 0, v5, v7);

  return v8;
}

@end