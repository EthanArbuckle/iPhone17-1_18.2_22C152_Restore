@interface GEOPDReverseGeocodingParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDReverseGeocodingParameters)init;
- (GEOPDReverseGeocodingParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)extendedLocations;
- (id)jsonRepresentation;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1;
- (unint64_t)hash;
- (void)_addNoFlagsExtendedLocation:(uint64_t)a1;
- (void)_addNoFlagsLocation:(uint64_t)a1;
- (void)_readExtendedLocations;
- (void)_readLocations;
- (void)addExtendedLocation:(uint64_t)a1;
- (void)addLocation:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDReverseGeocodingParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_extendedLocations, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)extendedLocations
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDReverseGeocodingParameters _readExtendedLocations]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (unint64_t)hash
{
  -[GEOPDReverseGeocodingParameters readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_locations hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v4 = 2654435761 * self->_placeTypeLimit;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_extendedLocations hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_preserveOriginalLocation;
  return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_extendedLocations hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDReverseGeocodingParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDReverseGeocodingParameters readAll:]((uint64_t)self, 0);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v9 = self->_locations;
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
        -[GEOPDReverseGeocodingParameters addLocation:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 52) = self->_placeTypeLimit;
    *(unsigned char *)(v5 + 60) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 56) = self->_preserveOriginalLocation;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v15 = self->_extendedLocations;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (void)v22);
        -[GEOPDReverseGeocodingParameters addExtendedLocation:](v5, v19);
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  v20 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v20;
LABEL_24:

  return (id)v5;
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    uint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_6586;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_6587;
      }
      GEOPDReverseGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDReverseGeocodingParametersCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (GEOPDReverseGeocodingParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDReverseGeocodingParameters;
  v2 = [(GEOPDReverseGeocodingParameters *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = v2;
  }

  return v3;
}

- (void)addExtendedLocation:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDReverseGeocodingParameters _readExtendedLocations](a1);
    -[GEOPDReverseGeocodingParameters _addNoFlagsExtendedLocation:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 60) |= 0x20u;
  }
}

- (void)_readExtendedLocations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDReverseGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExtendedLocations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)_addNoFlagsExtendedLocation:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      uint64_t v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDReverseGeocodingParametersIsDirty((uint64_t)self) & 1) == 0)
  {
    v15 = self->_reader;
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
    -[GEOPDReverseGeocodingParameters readAll:]((uint64_t)self, 0);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    objc_super v6 = self->_locations;
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

    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = self->_extendedLocations;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  -[GEOPDReverseGeocodingParameters _readExtendedLocations](a1);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = *(id *)(a1 + 24);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
LABEL_4:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(v4);
      }
      if ([*(id *)(*((void *)&v19 + 1) + 8 * v8) hasGreenTeaWithValue:a2]) {
        goto LABEL_19;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v6) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  -[GEOPDReverseGeocodingParameters _readLocations](a1);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v9 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_12:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v4);
      }
      if (objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "hasGreenTeaWithValue:", a2, (void)v15)) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v10) {
          goto LABEL_12;
        }
        goto LABEL_18;
      }
    }
LABEL_19:
    uint64_t v13 = 1;
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v13 = 0;
LABEL_20:

  return v13;
}

- (GEOPDReverseGeocodingParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDReverseGeocodingParameters;
  id v3 = [(GEOPDReverseGeocodingParameters *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readLocations
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDReverseGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocations_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
}

- (void)addLocation:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDReverseGeocodingParameters _readLocations](a1);
    -[GEOPDReverseGeocodingParameters _addNoFlagsLocation:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 60) |= 0x20u;
  }
}

- (void)_addNoFlagsLocation:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDReverseGeocodingParameters;
  id v4 = [(GEOPDReverseGeocodingParameters *)&v8 description];
  id v5 = [(GEOPDReverseGeocodingParameters *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDReverseGeocodingParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDReverseGeocodingParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 32) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v42 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            uint64_t v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"location"];
    }
    char v13 = *(unsigned char *)(a1 + 60);
    if (v13)
    {
      int v14 = *(_DWORD *)(a1 + 52);
      switch(v14)
      {
        case '#':
          long long v15 = @"TIME_ZONE";
          break;
        case '$':
        case '%':
        case '&':
        case '\'':
        case '(':
        case ')':
        case '*':
        case '4':
        case '5':
        case '8':
        case ':':
        case ';':
        case '<':
        case '>':
LABEL_21:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 52));
          long long v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
        case '+':
          long long v15 = @"SUB_LOCALITY";
          break;
        case ',':
          long long v15 = @"OCEAN";
          break;
        case '-':
          long long v15 = @"AOI";
          break;
        case '.':
          long long v15 = @"INLAND_WATER";
          break;
        case '/':
          long long v15 = @"BUSINESS";
          break;
        case '0':
          long long v15 = @"ISLAND";
          break;
        case '1':
          long long v15 = @"STREET";
          break;
        case '2':
          long long v15 = @"ADMIN";
          break;
        case '3':
          long long v15 = @"POSTAL";
          break;
        case '6':
          long long v15 = @"INTERSECTION";
          break;
        case '7':
          long long v15 = @"BUILDING";
          break;
        case '9':
          long long v15 = @"ADDRESS";
          break;
        case '=':
          long long v15 = @"CONTINENT";
          break;
        case '?':
          long long v15 = @"REGION";
          break;
        case '@':
          long long v15 = @"DIVISION";
          break;
        case 'A':
          long long v15 = @"PHYSICAL_FEATURE";
          break;
        default:
          long long v15 = @"UNKNOWN_PLACE_TYPE";
          switch(v14)
          {
            case 0:
              goto LABEL_40;
            case 1:
              long long v15 = @"COUNTRY";
              break;
            case 2:
              long long v15 = @"ADMINISTRATIVE_AREA";
              break;
            case 3:
              goto LABEL_21;
            case 4:
              long long v15 = @"SUB_ADMINISTRATIVE_AREA";
              break;
            default:
              if (v14 != 16) {
                goto LABEL_21;
              }
              long long v15 = @"LOCALITY";
              break;
          }
          break;
      }
LABEL_40:
      if (a2) {
        long long v16 = @"placeTypeLimit";
      }
      else {
        long long v16 = @"place_type_limit";
      }
      [v4 setObject:v15 forKey:v16];

      char v13 = *(unsigned char *)(a1 + 60);
    }
    if ((v13 & 2) != 0)
    {
      long long v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
      if (a2) {
        long long v18 = @"preserveOriginalLocation";
      }
      else {
        long long v18 = @"preserve_original_location";
      }
      [v4 setObject:v17 forKey:v18];
    }
    if ([*(id *)(a1 + 24) count])
    {
      long long v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v20 = *(id *)(a1 + 24);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v38 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void **)(*((void *)&v37 + 1) + 8 * j);
            if (a2) {
              [v25 jsonRepresentation];
            }
            else {
            long long v26 = [v25 dictionaryRepresentation];
            }
            [v19 addObject:v26];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v22);
      }

      if (a2) {
        uint64_t v27 = @"extendedLocation";
      }
      else {
        uint64_t v27 = @"extended_location";
      }
      [v4 setObject:v19 forKey:v27];
    }
    long long v28 = *(void **)(a1 + 16);
    if (v28)
    {
      long long v29 = [v28 dictionaryRepresentation];
      v30 = v29;
      if (a2)
      {
        v31 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v29, "count"));
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __61__GEOPDReverseGeocodingParameters__dictionaryRepresentation___block_invoke;
        v35[3] = &unk_1E53D8860;
        id v32 = v31;
        id v36 = v32;
        [v30 enumerateKeysAndObjectsUsingBlock:v35];
        id v33 = v32;

        v30 = v33;
      }
      [v4 setObject:v30 forKey:@"Unknown Fields"];
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
  return -[GEOPDReverseGeocodingParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __61__GEOPDReverseGeocodingParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDReverseGeocodingParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  -[GEOPDReverseGeocodingParameters readAll:]((uint64_t)self, 1);
  -[GEOPDReverseGeocodingParameters readAll:]((uint64_t)v4, 1);
  locations = self->_locations;
  if ((unint64_t)locations | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](locations, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_placeTypeLimit != *((_DWORD *)v4 + 13)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_13;
  }
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0) {
      goto LABEL_19;
    }
LABEL_13:
    char v6 = 0;
    goto LABEL_14;
  }
  if ((*((unsigned char *)v4 + 60) & 2) == 0) {
    goto LABEL_13;
  }
  if (!self->_preserveOriginalLocation)
  {
    if (!*((unsigned char *)v4 + 56)) {
      goto LABEL_19;
    }
    goto LABEL_13;
  }
  if (!*((unsigned char *)v4 + 56)) {
    goto LABEL_13;
  }
LABEL_19:
  extendedLocations = self->_extendedLocations;
  if ((unint64_t)extendedLocations | *((void *)v4 + 3)) {
    char v6 = -[NSMutableArray isEqual:](extendedLocations, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_14:

  return v6;
}

@end