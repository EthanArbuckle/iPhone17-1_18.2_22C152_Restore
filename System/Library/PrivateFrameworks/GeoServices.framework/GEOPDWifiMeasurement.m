@interface GEOPDWifiMeasurement
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDWifiMeasurement)init;
- (GEOPDWifiMeasurement)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)locations;
- (unint64_t)hash;
- (void)_addNoFlagsLocation:(uint64_t)a1;
- (void)_addNoFlagsWifiAccessPoint:(uint64_t)a1;
- (void)_readLocations;
- (void)_readWifiAccessPoints;
- (void)addLocation:(uint64_t)a1;
- (void)addWifiAccessPoint:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDWifiMeasurement

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDWifiMeasurement readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 40) count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v6 = *(id *)(a1 + 40);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v41 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"location"];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v14 = *(id *)(a1 + 48);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v37 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v36 + 1) + 8 * j);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            v20 = [v19 dictionaryRepresentation];
            }
            [v13 addObject:v20];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v16);
      }

      if (a2) {
        v21 = @"wifiAccessPoint";
      }
      else {
        v21 = @"wifi_access_point";
      }
      [v4 setObject:v13 forKey:v21];
    }
    char v22 = *(unsigned char *)(a1 + 68);
    if (v22)
    {
      v23 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      if (a2) {
        v24 = @"entryTime";
      }
      else {
        v24 = @"entry_time";
      }
      [v4 setObject:v23 forKey:v24];

      char v22 = *(unsigned char *)(a1 + 68);
    }
    if ((v22 & 2) != 0)
    {
      v25 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      if (a2) {
        v26 = @"exitTime";
      }
      else {
        v26 = @"exit_time";
      }
      [v4 setObject:v25 forKey:v26];
    }
    v27 = *(void **)(a1 + 16);
    if (v27)
    {
      v28 = [v27 dictionaryRepresentation];
      v29 = v28;
      if (a2)
      {
        v30 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __50__GEOPDWifiMeasurement__dictionaryRepresentation___block_invoke;
        v34[3] = &unk_1E53D8860;
        id v31 = v30;
        id v35 = v31;
        [v29 enumerateKeysAndObjectsUsingBlock:v34];
        id v32 = v31;

        v29 = v32;
      }
      [v4 setObject:v29 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    uint64_t v15 = self->_reader;
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
    -[GEOPDWifiMeasurement readAll:]((uint64_t)self, 0);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = self->_locations;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v10 = self->_wifiAccessPoints;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v11);
    }

    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint64Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteUint64Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDWifiMeasurementReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDWifiMeasurement readAll:]((uint64_t)self, 0);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = self->_locations;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDWifiMeasurement addLocation:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = self->_wifiAccessPoints;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (void)v22);
        -[GEOPDWifiMeasurement addWifiAccessPoint:](v5, v18);
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v15);
  }

  char flags = (char)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 24) = self->_entryTime;
    *(unsigned char *)(v5 + 68) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(void *)(v5 + 32) = self->_exitTime;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  long long v20 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v20;
LABEL_24:

  return (id)v5;
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_7616;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_7617;
      }
      GEOPDWifiMeasurementReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDWifiMeasurementCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (GEOPDWifiMeasurement)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDWifiMeasurement;
  v2 = [(GEOPDWifiMeasurement *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDWifiMeasurement)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDWifiMeasurement;
  v3 = [(GEOPDWifiMeasurement *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readLocations
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
        GEOPDWifiMeasurementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocations_tags_7596);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)locations
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDWifiMeasurement _readLocations]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addLocation:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDWifiMeasurement _readLocations](a1);
    -[GEOPDWifiMeasurement _addNoFlagsLocation:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsLocation:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readWifiAccessPoints
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
        GEOPDWifiMeasurementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWifiAccessPoints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)addWifiAccessPoint:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDWifiMeasurement _readWifiAccessPoints](a1);
    -[GEOPDWifiMeasurement _addNoFlagsWifiAccessPoint:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsWifiAccessPoint:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDWifiMeasurement;
  id v4 = [(GEOPDWifiMeasurement *)&v8 description];
  id v5 = [(GEOPDWifiMeasurement *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDWifiMeasurement _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDWifiMeasurement _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOPDWifiMeasurement__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDWifiMeasurementReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  -[GEOPDWifiMeasurement readAll:]((uint64_t)self, 1);
  -[GEOPDWifiMeasurement readAll:]((uint64_t)v4, 1);
  locations = self->_locations;
  if ((unint64_t)locations | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](locations, "isEqual:")) {
      goto LABEL_15;
    }
  }
  wifiAccessPoints = self->_wifiAccessPoints;
  if ((unint64_t)wifiAccessPoints | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](wifiAccessPoints, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_entryTime != *((void *)v4 + 3)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 68) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_exitTime != *((void *)v4 + 4)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDWifiMeasurement readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_locations hash];
  uint64_t v4 = [(NSMutableArray *)self->_wifiAccessPoints hash];
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v5 = 2654435761u * self->_entryTime;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v6 = 2654435761u * self->_exitTime;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiAccessPoints, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end