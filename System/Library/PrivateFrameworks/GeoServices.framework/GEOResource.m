@interface GEOResource
+ (BOOL)isValid:(id)a3;
+ (Class)filterType;
- (BOOL)_geo_isExplicit;
- (BOOL)_geo_isRelevantForScales:(id)a3 scenarios:(id)a4;
- (BOOL)hasAlternateResourceURLIndex;
- (BOOL)hasChecksum;
- (BOOL)hasConnectionType;
- (BOOL)hasFilename;
- (BOOL)hasPreferWiFiAllowedStaleThreshold;
- (BOOL)hasResourceType;
- (BOOL)hasTimeToLiveSeconds;
- (BOOL)hasUpdateMethod;
- (BOOL)hasValidationMethod;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOResource)init;
- (GEOResource)initWithData:(id)a3;
- (GEOResource)initWithDictionary:(id)a3;
- (GEOResource)initWithJSON:(id)a3;
- (GEOTileSetRegion)regionAtIndex:(SEL)a3;
- (GEOTileSetRegion)regions;
- (NSData)checksum;
- (NSMutableArray)filters;
- (NSString)filename;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)connectionTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)filterAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)resourceTypeAsString:(int)a3;
- (id)updateMethodAsString:(int)a3;
- (id)validationMethodAsString:(int)a3;
- (int)StringAsConnectionType:(id)a3;
- (int)StringAsResourceType:(id)a3;
- (int)StringAsUpdateMethod:(id)a3;
- (int)StringAsValidationMethod:(id)a3;
- (int)connectionType;
- (int)resourceType;
- (int)updateMethod;
- (int)validationMethod;
- (uint64_t)_reserveRegions:(uint64_t)a1;
- (unint64_t)filtersCount;
- (unint64_t)hash;
- (unint64_t)regionsCount;
- (unsigned)alternateResourceURLIndex;
- (unsigned)preferWiFiAllowedStaleThreshold;
- (unsigned)timeToLiveSeconds;
- (void)_addNoFlagsFilter:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readChecksum;
- (void)_readFilename;
- (void)_readFilters;
- (void)_readRegions;
- (void)addFilter:(id)a3;
- (void)addRegion:(GEOTileSetRegion *)a3;
- (void)clearFilters;
- (void)clearRegions;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAlternateResourceURLIndex:(unsigned int)a3;
- (void)setChecksum:(id)a3;
- (void)setConnectionType:(int)a3;
- (void)setFilename:(id)a3;
- (void)setFilters:(id)a3;
- (void)setHasAlternateResourceURLIndex:(BOOL)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasPreferWiFiAllowedStaleThreshold:(BOOL)a3;
- (void)setHasResourceType:(BOOL)a3;
- (void)setHasTimeToLiveSeconds:(BOOL)a3;
- (void)setHasUpdateMethod:(BOOL)a3;
- (void)setHasValidationMethod:(BOOL)a3;
- (void)setPreferWiFiAllowedStaleThreshold:(unsigned int)a3;
- (void)setRegions:(GEOTileSetRegion *)a3 count:(unint64_t)a4;
- (void)setResourceType:(int)a3;
- (void)setTimeToLiveSeconds:(unsigned int)a3;
- (void)setUpdateMethod:(int)a3;
- (void)setValidationMethod:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOResource

- (BOOL)isEqual:(id)a3
{
  v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOResource *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 56);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    if ((v5 & 8) == 0 || self->_resourceType != *((_DWORD *)v4 + 24)) {
      goto LABEL_13;
    }
  }
  else if ((v5 & 8) != 0)
  {
    goto LABEL_13;
  }
  filename = self->_filename;
  if ((unint64_t)filename | (unint64_t)v4[7] && !-[NSString isEqual:](filename, "isEqual:")) {
    goto LABEL_13;
  }
  checksum = self->_checksum;
  if ((unint64_t)checksum | (unint64_t)v4[6])
  {
    if (!-[NSData isEqual:](checksum, "isEqual:")) {
      goto LABEL_13;
    }
  }
  unint64_t regionsCount = self->_regionsCount;
  if ((const void *)regionsCount != v4[4]) {
    goto LABEL_13;
  }
  if (memcmp(self->_regions, v4[3], 24 * regionsCount)) {
    goto LABEL_13;
  }
  filters = self->_filters;
  if ((unint64_t)filters | (unint64_t)v4[8])
  {
    if (!-[NSMutableArray isEqual:](filters, "isEqual:")) {
      goto LABEL_13;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v13 = *((_WORD *)v4 + 56);
  if ((flags & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_connectionType != *((_DWORD *)v4 + 22)) {
      goto LABEL_13;
    }
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_13;
  }
  if ((flags & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_preferWiFiAllowedStaleThreshold != *((_DWORD *)v4 + 23)) {
      goto LABEL_13;
    }
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_13;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v13 & 0x40) == 0 || self->_validationMethod != *((_DWORD *)v4 + 27)) {
      goto LABEL_13;
    }
  }
  else if ((v13 & 0x40) != 0)
  {
    goto LABEL_13;
  }
  if (flags)
  {
    if ((v13 & 1) == 0 || self->_alternateResourceURLIndex != *((_DWORD *)v4 + 21)) {
      goto LABEL_13;
    }
  }
  else if (v13)
  {
    goto LABEL_13;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0 || self->_updateMethod != *((_DWORD *)v4 + 26)) {
      goto LABEL_13;
    }
  }
  else if ((v13 & 0x20) != 0)
  {
    goto LABEL_13;
  }
  if ((flags & 0x10) == 0)
  {
    BOOL v9 = (v13 & 0x10) == 0;
    goto LABEL_14;
  }
  if ((v13 & 0x10) != 0 && self->_timeToLiveSeconds == *((_DWORD *)v4 + 25))
  {
    BOOL v9 = 1;
    goto LABEL_14;
  }
LABEL_13:
  BOOL v9 = 0;
LABEL_14:

  return v9;
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
      v8 = (int *)&readAll__recursiveTag_575;
    }
    else {
      v8 = (int *)&readAll__nonRecursiveTag_576;
    }
    GEOResourceReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOResourceCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (unint64_t)hash
{
  [(GEOResource *)self readAll:1];
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    uint64_t v3 = 2654435761 * self->_resourceType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_filename hash];
  uint64_t v5 = [(NSData *)self->_checksum hash];
  uint64_t v6 = PBHashBytes();
  uint64_t v7 = [(NSMutableArray *)self->_filters hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    uint64_t v9 = 2654435761 * self->_connectionType;
    if ((flags & 4) != 0)
    {
LABEL_6:
      uint64_t v10 = 2654435761 * self->_preferWiFiAllowedStaleThreshold;
      if ((flags & 0x40) != 0) {
        goto LABEL_7;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v10 = 0;
  if ((flags & 0x40) != 0)
  {
LABEL_7:
    uint64_t v11 = 2654435761 * self->_validationMethod;
    if (flags) {
      goto LABEL_8;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v11 = 0;
  if (flags)
  {
LABEL_8:
    uint64_t v12 = 2654435761 * self->_alternateResourceURLIndex;
    if ((flags & 0x20) != 0) {
      goto LABEL_9;
    }
LABEL_15:
    uint64_t v13 = 0;
    if ((flags & 0x10) != 0) {
      goto LABEL_10;
    }
LABEL_16:
    uint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v6 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_14:
  uint64_t v12 = 0;
  if ((flags & 0x20) == 0) {
    goto LABEL_15;
  }
LABEL_9:
  uint64_t v13 = 2654435761 * self->_updateMethod;
  if ((flags & 0x10) == 0) {
    goto LABEL_16;
  }
LABEL_10:
  uint64_t v14 = 2654435761 * self->_timeToLiveSeconds;
  return v4 ^ v3 ^ v5 ^ v7 ^ v6 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (NSString)filename
{
  -[GEOResource _readFilename]((uint64_t)self);
  filename = self->_filename;

  return filename;
}

- (void)_readFilename
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 112) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFilename_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (int)updateMethod
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20) != 0) {
    return self->_updateMethod;
  }
  else {
    return 0;
  }
}

- (BOOL)hasValidationMethod
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (int)validationMethod
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0) {
    return self->_validationMethod;
  }
  else {
    return 0;
  }
}

- (NSData)checksum
{
  -[GEOResource _readChecksum]((uint64_t)self);
  checksum = self->_checksum;

  return checksum;
}

- (void)_readChecksum
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 112) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChecksum_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (int)resourceType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0) {
    return self->_resourceType;
  }
  else {
    return 0;
  }
}

- (GEOResource)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOResource;
  id v3 = [(GEOResource *)&v7 initWithData:a3];
  NSUInteger v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  [(GEOResource *)self clearRegions];
  v3.receiver = self;
  v3.super_class = (Class)GEOResource;
  [(GEOResource *)&v3 dealloc];
}

- (void)clearRegions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  self->_regionsSpace = 0;
  self->_unint64_t regionsCount = 0;
  free(self->_regions);
  self->_regions = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_checksum, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)_geo_isRelevantForScales:(id)a3 scenarios:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v8 = [(GEOResource *)self filters];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v9)
  {
    BOOL v22 = 1;
    goto LABEL_19;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v26;
  uint64_t v24 = *(void *)v26;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      if ([v13 scalesCount])
      {
        uint64_t v14 = 0;
        do
        {
          uint64_t v15 = [v13 scaleAtIndex:v14];
          v16 = [NSNumber numberWithInt:v15];
          char v17 = [v6 containsObject:v16];

          if ((v17 & 1) == 0) {
            goto LABEL_17;
          }
        }
        while (++v14 < (unint64_t)[v13 scalesCount]);
      }
      if ([v13 scenariosCount])
      {
        uint64_t v18 = 0;
        while (1)
        {
          uint64_t v19 = [v13 scenarioAtIndex:v18];
          v20 = [NSNumber numberWithInt:v19];
          char v21 = [v7 containsObject:v20];

          if ((v21 & 1) == 0) {
            break;
          }
          if (++v18 >= (unint64_t)[v13 scenariosCount]) {
            goto LABEL_14;
          }
        }
LABEL_17:
        BOOL v22 = 0;
        goto LABEL_19;
      }
LABEL_14:
      uint64_t v11 = v24;
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    BOOL v22 = 1;
    if (v10) {
      continue;
    }
    break;
  }
LABEL_19:

  return v22;
}

- (NSMutableArray)filters
{
  -[GEOResource _readFilters]((uint64_t)self);
  filters = self->_filters;

  return filters;
}

- (void)addFilter:(id)a3
{
  id v4 = a3;
  -[GEOResource _readFilters]((uint64_t)self);
  -[GEOResource _addNoFlagsFilter:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_readFilters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 112) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFilters_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOResource *)self readAll:0];
    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      *(_DWORD *)(v5 + 96) = self->_resourceType;
      *(_WORD *)(v5 + 112) |= 8u;
    }
    uint64_t v9 = [(NSString *)self->_filename copyWithZone:a3];
    uint64_t v10 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v9;

    uint64_t v11 = [(NSData *)self->_checksum copyWithZone:a3];
    uint64_t v12 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v11;

    unint64_t regionsCount = self->_regionsCount;
    if (regionsCount)
    {
      -[GEOResource _reserveRegions:](v5, regionsCount);
      memcpy(*(void **)(v5 + 24), self->_regions, 24 * self->_regionsCount);
      *(void *)(v5 + 32) = self->_regionsCount;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v14 = self->_filters;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (void)v22);
          [(id)v5 addFilter:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 88) = self->_connectionType;
      *(_WORD *)(v5 + 112) |= 2u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_18:
        if ((flags & 0x40) == 0) {
          goto LABEL_19;
        }
        goto LABEL_27;
      }
    }
    else if ((flags & 4) == 0)
    {
      goto LABEL_18;
    }
    *(_DWORD *)(v5 + 92) = self->_preferWiFiAllowedStaleThreshold;
    *(_WORD *)(v5 + 112) |= 4u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_19:
      if ((flags & 1) == 0) {
        goto LABEL_20;
      }
      goto LABEL_28;
    }
LABEL_27:
    *(_DWORD *)(v5 + 108) = self->_validationMethod;
    *(_WORD *)(v5 + 112) |= 0x40u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_20:
      if ((flags & 0x20) == 0) {
        goto LABEL_21;
      }
      goto LABEL_29;
    }
LABEL_28:
    *(_DWORD *)(v5 + 84) = self->_alternateResourceURLIndex;
    *(_WORD *)(v5 + 112) |= 1u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_21:
      if ((flags & 0x10) == 0)
      {
LABEL_23:
        v20 = self->_unknownFields;
        id v8 = *(id *)(v5 + 16);
        *(void *)(v5 + 16) = v20;
        goto LABEL_24;
      }
LABEL_22:
      *(_DWORD *)(v5 + 100) = self->_timeToLiveSeconds;
      *(_WORD *)(v5 + 112) |= 0x10u;
      goto LABEL_23;
    }
LABEL_29:
    *(_DWORD *)(v5 + 104) = self->_updateMethod;
    *(_WORD *)(v5 + 112) |= 0x20u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOResourceReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_24:
  return (id)v5;
}

- (GEOResource)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOResource;
  v2 = [(GEOResource *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void)_addNoFlagsFilter:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unsigned)alternateResourceURLIndex
{
  return self->_alternateResourceURLIndex;
}

- (BOOL)hasUpdateMethod
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (BOOL)hasAlternateResourceURLIndex
{
  return *(_WORD *)&self->_flags & 1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOResourceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOResourceIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v13 = self->_reader;
    objc_sync_enter(v13);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v14 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v14];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOResource *)self readAll:0];
    if ((*(_WORD *)&self->_flags & 8) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_filename) {
      PBDataWriterWriteStringField();
    }
    if (self->_checksum) {
      PBDataWriterWriteDataField();
    }
    if (self->_regionsCount)
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        uint64_t v19 = 0;
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v7;
        v6 += 24;
      }
      while (v7 < self->_regionsCount);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = self->_filters;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          PBDataWriterWriteSubmessage();
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x40) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x20) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0) {
      PBDataWriterWriteUint32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v15);
  }
}

- (void)setResourceType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_resourceType = a3;
}

- (void)setHasResourceType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4104;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasResourceType
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)resourceTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53DE0E0[a3];
  }

  return v3;
}

- (int)StringAsResourceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESOURCE_TYPE_STYLESHEET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESOURCE_TYPE_TEXTURE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESOURCE_TYPE_FONT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESOURCE_TYPE_ICON"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RESOURCE_TYPE_XML"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RESOURCE_TYPE_ATTRIBUTION_LOGO"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RESOURCE_TYPE_ATTRIBUTION_BADGE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RESOURCE_TYPE_OTHER"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasFilename
{
  return self->_filename != 0;
}

- (void)setFilename:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1400u;
  objc_storeStrong((id *)&self->_filename, a3);
}

- (BOOL)hasChecksum
{
  return self->_checksum != 0;
}

- (void)setChecksum:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_checksum, a3);
}

- (void)_readRegions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 112) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOResourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegions_tags_543);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (unint64_t)regionsCount
{
  return self->_regionsCount;
}

- (GEOTileSetRegion)regions
{
  return self->_regions;
}

- (uint64_t)_reserveRegions:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 40);
    if (v6 >= v5) {
      return 1;
    }
    unint64_t v7 = v6 + a2;
    if (v6 + a2)
    {
      unint64_t v8 = 1;
      while (1)
      {
        unint64_t v9 = v8;
        if (v8 >= v7) {
          break;
        }
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          unint64_t v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (v9 < a2) {
      return 0;
    }
LABEL_12:
    if (24 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 24 * v9, 0x5887C87EuLL);
    if (result)
    {
      *(void *)(a1 + 40) = v9;
      *(void *)(a1 + 24) = result;
      bzero((void *)(result + 24 * *(void *)(a1 + 32)), 24 * (v9 - *(void *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (void)addRegion:(GEOTileSetRegion *)a3
{
  -[GEOResource _readRegions]((uint64_t)self);
  GEOTileSetRegion v5 = *a3;
  if (self && -[GEOResource _reserveRegions:]((uint64_t)self, 1uLL)) {
    self->_regions[self->_regionsCount++] = v5;
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (GEOTileSetRegion)regionAtIndex:(SEL)a3
{
  -[GEOResource _readRegions]((uint64_t)self);
  unint64_t regionsCount = self->_regionsCount;
  if (regionsCount <= a4)
  {
    unint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C4A8];
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a4, regionsCount);
    uint64_t v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];
    [v12 raise];
  }
  uint64_t v13 = &self->_regions[a4];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v13->var0;
  *(void *)&retstr->var4 = *(void *)&v13->var4;
  return result;
}

- (void)setRegions:(GEOTileSetRegion *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  [(GEOResource *)self clearRegions];
  if (-[GEOResource _reserveRegions:]((uint64_t)self, a4))
  {
    memcpy(self->_regions, a3, 24 * a4);
    self->_unint64_t regionsCount = a4;
  }
}

- (void)setFilters:(id)a3
{
  unint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  filters = self->_filters;
  self->_filters = v4;
}

- (void)clearFilters
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  filters = self->_filters;

  [(NSMutableArray *)filters removeAllObjects];
}

- (unint64_t)filtersCount
{
  -[GEOResource _readFilters]((uint64_t)self);
  filters = self->_filters;

  return [(NSMutableArray *)filters count];
}

- (id)filterAtIndex:(unint64_t)a3
{
  -[GEOResource _readFilters]((uint64_t)self);
  filters = self->_filters;

  return (id)[(NSMutableArray *)filters objectAtIndex:a3];
}

+ (Class)filterType
{
  return (Class)objc_opt_class();
}

- (int)connectionType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_connectionType;
  }
  else {
    return 1;
  }
}

- (void)setConnectionType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4098;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)connectionTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53DE120[a3];
  }

  return v3;
}

- (int)StringAsConnectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESOURCE_DOWNLOAD_CONNECTION_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESOURCE_DOWNLOAD_CONNECTION_TYPE_CELLULAR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESOURCE_DOWNLOAD_CONNECTION_TYPE_PREFER_WIFI"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESOURCE_DOWNLOAD_CONNECTION_TYPE_WIFI_ONLY"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)preferWiFiAllowedStaleThreshold
{
  return self->_preferWiFiAllowedStaleThreshold;
}

- (void)setPreferWiFiAllowedStaleThreshold:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_preferWiFiAllowedStaleThreshold = a3;
}

- (void)setHasPreferWiFiAllowedStaleThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4100;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasPreferWiFiAllowedStaleThreshold
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)setValidationMethod:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1040u;
  self->_validationMethod = a3;
}

- (void)setHasValidationMethod:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4160;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (id)validationMethodAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"CMS";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"SHA1";
  }
  return v4;
}

- (int)StringAsValidationMethod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SHA1"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"CMS"];
  }

  return v4;
}

- (void)setAlternateResourceURLIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_alternateResourceURLIndex = a3;
}

- (void)setHasAlternateResourceURLIndex:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (void)setUpdateMethod:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  self->_updateMethod = a3;
}

- (void)setHasUpdateMethod:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4128;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (id)updateMethodAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"ETAG";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"VERSIONED";
  }
  return v4;
}

- (int)StringAsUpdateMethod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VERSIONED"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"ETAG"];
  }

  return v4;
}

- (unsigned)timeToLiveSeconds
{
  return self->_timeToLiveSeconds;
}

- (void)setTimeToLiveSeconds:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1010u;
  self->_timeToLiveSeconds = a3;
}

- (void)setHasTimeToLiveSeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4112;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasTimeToLiveSeconds
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOResource;
  int v4 = [(GEOResource *)&v8 description];
  GEOTileSetRegion v5 = [(GEOResource *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOResource _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_45;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(_WORD *)(a1 + 112) & 8) != 0)
  {
    uint64_t v5 = *(int *)(a1 + 96);
    if (v5 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 96));
      unint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v6 = off_1E53DE0E0[v5];
    }
    [v4 setObject:v6 forKey:@"resourceType"];
  }
  unint64_t v7 = [(id)a1 filename];
  if (v7) {
    [v4 setObject:v7 forKey:@"filename"];
  }

  objc_super v8 = [(id)a1 checksum];
  unint64_t v9 = v8;
  if (v8)
  {
    if (a2)
    {
      uint64_t v10 = [v8 base64EncodedStringWithOptions:0];
      [v4 setObject:v10 forKey:@"checksum"];
    }
    else
    {
      [v4 setObject:v8 forKey:@"checksum"];
    }
  }

  if (*(void *)(a1 + 32))
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 32))
    {
      uint64_t v12 = 0;
      unint64_t v13 = 0;
      do
      {
        uint64_t v14 = _GEOTileSetRegionDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 24) + v12));
        [v11 addObject:v14];

        ++v13;
        v12 += 24;
      }
      while (v13 < *(void *)(a1 + 32));
    }
    [v4 setObject:v11 forKey:@"region"];
  }
  if ([*(id *)(a1 + 64) count])
  {
    long long v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v16 = *(id *)(a1 + 64);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if (a2) {
            [v21 jsonRepresentation];
          }
          else {
          long long v22 = [v21 dictionaryRepresentation];
          }
          [v15 addObject:v22];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v18);
    }

    [v4 setObject:v15 forKey:@"filter"];
  }
  __int16 v23 = *(_WORD *)(a1 + 112);
  if ((v23 & 2) != 0)
  {
    uint64_t v24 = *(int *)(a1 + 88);
    if (v24 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 88));
      long long v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v25 = off_1E53DE120[v24];
    }
    [v4 setObject:v25 forKey:@"connectionType"];

    __int16 v23 = *(_WORD *)(a1 + 112);
  }
  if ((v23 & 4) != 0)
  {
    v34 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
    [v4 setObject:v34 forKey:@"preferWiFiAllowedStaleThreshold"];

    __int16 v23 = *(_WORD *)(a1 + 112);
    if ((v23 & 0x40) == 0)
    {
LABEL_37:
      if ((v23 & 1) == 0) {
        goto LABEL_38;
      }
      goto LABEL_55;
    }
  }
  else if ((v23 & 0x40) == 0)
  {
    goto LABEL_37;
  }
  int v35 = *(_DWORD *)(a1 + 108);
  if (v35)
  {
    if (v35 == 1)
    {
      v36 = @"CMS";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 108));
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v36 = @"SHA1";
  }
  [v4 setObject:v36 forKey:@"validationMethod"];

  __int16 v23 = *(_WORD *)(a1 + 112);
  if ((v23 & 1) == 0)
  {
LABEL_38:
    if ((v23 & 0x20) == 0) {
      goto LABEL_39;
    }
    goto LABEL_56;
  }
LABEL_55:
  v37 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
  [v4 setObject:v37 forKey:@"alternateResourceURLIndex"];

  __int16 v23 = *(_WORD *)(a1 + 112);
  if ((v23 & 0x20) == 0)
  {
LABEL_39:
    if ((v23 & 0x10) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_56:
  int v38 = *(_DWORD *)(a1 + 104);
  if (v38)
  {
    if (v38 == 1)
    {
      v39 = @"ETAG";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 104));
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v39 = @"VERSIONED";
  }
  [v4 setObject:v39 forKey:@"updateMethod"];

  if ((*(_WORD *)(a1 + 112) & 0x10) != 0)
  {
LABEL_40:
    long long v26 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 100)];
    [v4 setObject:v26 forKey:@"timeToLiveSeconds"];
  }
LABEL_41:
  uint64_t v27 = *(void **)(a1 + 16);
  if (v27)
  {
    long long v28 = [v27 dictionaryRepresentation];
    v29 = v28;
    if (a2)
    {
      uint64_t v30 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __41__GEOResource__dictionaryRepresentation___block_invoke;
      v40[3] = &unk_1E53D8860;
      id v31 = v30;
      id v41 = v31;
      [v29 enumerateKeysAndObjectsUsingBlock:v40];
      id v32 = v31;

      v29 = v32;
    }
    [v4 setObject:v29 forKey:@"Unknown Fields"];
  }
LABEL_45:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOResource _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOResource__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    unint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOResource)initWithDictionary:(id)a3
{
  return (GEOResource *)-[GEOResource _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_91;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_91;
  }
  unint64_t v6 = [v5 objectForKeyedSubscript:@"resourceType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"RESOURCE_TYPE_STYLESHEET"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"RESOURCE_TYPE_TEXTURE"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"RESOURCE_TYPE_FONT"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"RESOURCE_TYPE_ICON"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"RESOURCE_TYPE_XML"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"RESOURCE_TYPE_ATTRIBUTION_LOGO"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"RESOURCE_TYPE_ATTRIBUTION_BADGE"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"RESOURCE_TYPE_OTHER"])
    {
      uint64_t v8 = 7;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_25;
    }
    uint64_t v8 = [v6 intValue];
  }
  [a1 setResourceType:v8];
LABEL_25:

  unint64_t v9 = [v5 objectForKeyedSubscript:@"filename"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = (void *)[v9 copy];
    [a1 setFilename:v10];
  }
  uint64_t v11 = [v5 objectForKeyedSubscript:@"checksum"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v11 options:0];
    [a1 setChecksum:v12];
  }
  unint64_t v13 = [v5 objectForKeyedSubscript:@"region"];
  objc_opt_class();
  id v43 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v53 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v50 = 0uLL;
            uint64_t v51 = 0;
            _GEOTileSetRegionFromDictionaryRepresentation(v19, &v50);
            long long v48 = v50;
            uint64_t v49 = v51;
            [a1 addRegion:&v48];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v16);
    }

    id v5 = v43;
  }

  v20 = [v5 objectForKeyedSubscript:@"filter"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v45 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v44 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v27 = [GEOResourceFilter alloc];
            if (a3) {
              uint64_t v28 = [(GEOResourceFilter *)v27 initWithJSON:v26];
            }
            else {
              uint64_t v28 = [(GEOResourceFilter *)v27 initWithDictionary:v26];
            }
            v29 = (void *)v28;
            [a1 addFilter:v28];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v44 objects:v56 count:16];
      }
      while (v23);
    }

    id v5 = v43;
  }

  uint64_t v30 = [v5 objectForKeyedSubscript:@"connectionType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v31 = v30;
    if ([v31 isEqualToString:@"RESOURCE_DOWNLOAD_CONNECTION_TYPE_UNKNOWN"])
    {
      uint64_t v32 = 0;
    }
    else if ([v31 isEqualToString:@"RESOURCE_DOWNLOAD_CONNECTION_TYPE_CELLULAR"])
    {
      uint64_t v32 = 1;
    }
    else if ([v31 isEqualToString:@"RESOURCE_DOWNLOAD_CONNECTION_TYPE_PREFER_WIFI"])
    {
      uint64_t v32 = 2;
    }
    else if ([v31 isEqualToString:@"RESOURCE_DOWNLOAD_CONNECTION_TYPE_WIFI_ONLY"])
    {
      uint64_t v32 = 3;
    }
    else
    {
      uint64_t v32 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_68;
    }
    uint64_t v32 = [v30 intValue];
  }
  [a1 setConnectionType:v32];
LABEL_68:

  v33 = [v5 objectForKeyedSubscript:@"preferWiFiAllowedStaleThreshold"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPreferWiFiAllowedStaleThreshold:", objc_msgSend(v33, "unsignedIntValue"));
  }

  v34 = [v5 objectForKeyedSubscript:@"validationMethod"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = v34;
    if ([v35 isEqualToString:@"SHA1"]) {
      uint64_t v36 = 0;
    }
    else {
      uint64_t v36 = [v35 isEqualToString:@"CMS"];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_78;
    }
    uint64_t v36 = [v34 intValue];
  }
  [a1 setValidationMethod:v36];
LABEL_78:

  v37 = [v5 objectForKeyedSubscript:@"alternateResourceURLIndex"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAlternateResourceURLIndex:", objc_msgSend(v37, "unsignedIntValue"));
  }

  int v38 = [v5 objectForKeyedSubscript:@"updateMethod"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v39 = v38;
    if ([v39 isEqualToString:@"VERSIONED"]) {
      uint64_t v40 = 0;
    }
    else {
      uint64_t v40 = [v39 isEqualToString:@"ETAG"];
    }

    goto LABEL_87;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v40 = [v38 intValue];
LABEL_87:
    [a1 setUpdateMethod:v40];
  }

  id v41 = [v5 objectForKeyedSubscript:@"timeToLiveSeconds"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTimeToLiveSeconds:", objc_msgSend(v41, "unsignedIntValue"));
  }

LABEL_91:
  return a1;
}

- (GEOResource)initWithJSON:(id)a3
{
  return (GEOResource *)-[GEOResource _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOResourceIsValid((char *)a3);
}

- (void)copyTo:(id)a3
{
  int v4 = (id *)a3;
  [(GEOResource *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 18) = self->_readerMarkPos;
  *((_DWORD *)v4 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_resourceType;
    *((_WORD *)v4 + 56) |= 8u;
  }
  if (self->_filename) {
    objc_msgSend(v4, "setFilename:");
  }
  if (self->_checksum) {
    objc_msgSend(v4, "setChecksum:");
  }
  if ([(GEOResource *)self regionsCount])
  {
    [v4 clearRegions];
    unint64_t v5 = [(GEOResource *)self regionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        [(GEOResource *)self regionAtIndex:i];
        [v4 addRegion:v13];
      }
    }
  }
  if ([(GEOResource *)self filtersCount])
  {
    [v4 clearFilters];
    unint64_t v8 = [(GEOResource *)self filtersCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOResource *)self filterAtIndex:j];
        [v4 addFilter:v11];
      }
    }
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_connectionType;
    *((_WORD *)v4 + 56) |= 2u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_17:
      if ((flags & 0x40) == 0) {
        goto LABEL_18;
      }
      goto LABEL_25;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v4 + 23) = self->_preferWiFiAllowedStaleThreshold;
  *((_WORD *)v4 + 56) |= 4u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_18:
    if ((flags & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 27) = self->_validationMethod;
  *((_WORD *)v4 + 56) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_19:
    if ((flags & 0x20) == 0) {
      goto LABEL_20;
    }
LABEL_27:
    *((_DWORD *)v4 + 26) = self->_updateMethod;
    *((_WORD *)v4 + 56) |= 0x20u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_26:
  *((_DWORD *)v4 + 21) = self->_alternateResourceURLIndex;
  *((_WORD *)v4 + 56) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0) {
    goto LABEL_27;
  }
LABEL_20:
  if ((flags & 0x10) != 0)
  {
LABEL_21:
    *((_DWORD *)v4 + 25) = self->_timeToLiveSeconds;
    *((_WORD *)v4 + 56) |= 0x10u;
  }
LABEL_22:
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((_WORD *)v4 + 56) & 8) != 0)
  {
    self->_resourceType = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_flags |= 8u;
  }
  if (*((void *)v4 + 7)) {
    -[GEOResource setFilename:](self, "setFilename:");
  }
  if (*((void *)v4 + 6)) {
    -[GEOResource setChecksum:](self, "setChecksum:");
  }
  uint64_t v5 = [v4 regionsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      [v4 regionAtIndex:i];
      [(GEOResource *)self addRegion:v18];
    }
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = *((id *)v4 + 8);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEOResource addFilter:](self, "addFilter:", *(void *)(*((void *)&v14 + 1) + 8 * j), (void)v14);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }

  __int16 v13 = *((_WORD *)v4 + 56);
  if ((v13 & 2) != 0)
  {
    self->_connectionType = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 2u;
    __int16 v13 = *((_WORD *)v4 + 56);
    if ((v13 & 4) == 0)
    {
LABEL_19:
      if ((v13 & 0x40) == 0) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
  }
  else if ((v13 & 4) == 0)
  {
    goto LABEL_19;
  }
  self->_preferWiFiAllowedStaleThreshold = *((_DWORD *)v4 + 23);
  *(_WORD *)&self->_flags |= 4u;
  __int16 v13 = *((_WORD *)v4 + 56);
  if ((v13 & 0x40) == 0)
  {
LABEL_20:
    if ((v13 & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_validationMethod = *((_DWORD *)v4 + 27);
  *(_WORD *)&self->_flags |= 0x40u;
  __int16 v13 = *((_WORD *)v4 + 56);
  if ((v13 & 1) == 0)
  {
LABEL_21:
    if ((v13 & 0x20) == 0) {
      goto LABEL_22;
    }
LABEL_29:
    self->_updateMethod = *((_DWORD *)v4 + 26);
    *(_WORD *)&self->_flags |= 0x20u;
    if ((*((_WORD *)v4 + 56) & 0x10) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_28:
  self->_alternateResourceURLIndex = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_flags |= 1u;
  __int16 v13 = *((_WORD *)v4 + 56);
  if ((v13 & 0x20) != 0) {
    goto LABEL_29;
  }
LABEL_22:
  if ((v13 & 0x10) != 0)
  {
LABEL_23:
    self->_timeToLiveSeconds = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_24:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x80) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOResourceReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_580);
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
  *(_WORD *)&self->_flags |= 0x1080u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOResource *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = self->_filters;
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

- (BOOL)_geo_isExplicit
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(GEOResource *)self filters];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v7 scenariosCount])
        {
          uint64_t v8 = 0;
          while ([v7 scenarioAtIndex:v8] != 4)
          {
            if (++v8 >= (unint64_t)[v7 scenariosCount]) {
              goto LABEL_10;
            }
          }
          BOOL v9 = 1;
          goto LABEL_15;
        }
LABEL_10:
        ;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v9 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_15:

  return v9;
}

@end