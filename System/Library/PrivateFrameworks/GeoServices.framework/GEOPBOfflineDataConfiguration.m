@interface GEOPBOfflineDataConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBOfflineDataConfiguration)init;
- (GEOPBOfflineDataConfiguration)initWithData:(id)a3;
- (__n128)_addNoFlagsActiveVersion:(uint64_t)a1;
- (__n128)_addNoFlagsLatestAvailableVersion:(uint64_t)a1;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)tileMetadata;
- (uint64_t)_reserveActiveVersions:(uint64_t)a1;
- (uint64_t)_reserveLatestAvailableVersions:(uint64_t)a1;
- (unint64_t)hash;
- (void)_readActiveVersions;
- (void)_readLatestAvailableVersions;
- (void)_readTileMetadata;
- (void)addActiveVersion:(uint64_t)a1;
- (void)addLatestAvailableVersion:(uint64_t)a1;
- (void)clearActiveVersions;
- (void)clearLatestAvailableVersions;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)setTileMetadata:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBOfflineDataConfiguration

- (GEOPBOfflineDataConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBOfflineDataConfiguration;
  v2 = [(GEOPBOfflineDataConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBOfflineDataConfiguration)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBOfflineDataConfiguration;
  v3 = [(GEOPBOfflineDataConfiguration *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  -[GEOPBOfflineDataConfiguration clearActiveVersions]((uint64_t)self);
  -[GEOPBOfflineDataConfiguration clearLatestAvailableVersions]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)GEOPBOfflineDataConfiguration;
  [(GEOPBOfflineDataConfiguration *)&v3 dealloc];
}

- (void)clearActiveVersions
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 108) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(unsigned char *)(a1 + 108) |= 0x40u;
    *(void *)(a1 + 40) = 0;
    *(void *)(a1 + 32) = 0;
    free(*(void **)(a1 + 24));
    *(void *)(a1 + 24) = 0;
  }
}

- (void)clearLatestAvailableVersions
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 108) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(unsigned char *)(a1 + 108) |= 0x40u;
    *(void *)(a1 + 64) = 0;
    *(void *)(a1 + 56) = 0;
    free(*(void **)(a1 + 48));
    *(void *)(a1 + 48) = 0;
  }
}

- (void)_readActiveVersions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 108) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBOfflineDataConfigurationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readActiveVersions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (uint64_t)_reserveActiveVersions:(uint64_t)a1
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
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 24 * v9, 0xA08072F3uLL);
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

- (void)addActiveVersion:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPBOfflineDataConfiguration _readActiveVersions](a1);
    __n128 v4 = *a2;
    unint64_t v5 = a2[1].n128_u64[0];
    -[GEOPBOfflineDataConfiguration _addNoFlagsActiveVersion:](a1, &v4);
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 108) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(unsigned char *)(a1 + 108) |= 0x40u;
  }
}

- (__n128)_addNoFlagsActiveVersion:(uint64_t)a1
{
  if (a1)
  {
    if (-[GEOPBOfflineDataConfiguration _reserveActiveVersions:](a1, 1uLL))
    {
      uint64_t v5 = *(void *)(a1 + 24) + 24 * *(void *)(a1 + 32);
      unint64_t v6 = a2[1].n128_u64[0];
      __n128 result = *a2;
      *(__n128 *)uint64_t v5 = *a2;
      *(void *)(v5 + 16) = v6;
      ++*(void *)(a1 + 32);
    }
  }
  return result;
}

- (void)_readLatestAvailableVersions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 108) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBOfflineDataConfigurationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLatestAvailableVersions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (uint64_t)_reserveLatestAvailableVersions:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 56);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 64);
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
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 48), 24 * v9, 0xEE84AC6CuLL);
    if (result)
    {
      *(void *)(a1 + 64) = v9;
      *(void *)(a1 + 48) = result;
      bzero((void *)(result + 24 * *(void *)(a1 + 56)), 24 * (v9 - *(void *)(a1 + 56)));
      return 1;
    }
  }
  return result;
}

- (void)addLatestAvailableVersion:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPBOfflineDataConfiguration _readLatestAvailableVersions](a1);
    __n128 v4 = *a2;
    unint64_t v5 = a2[1].n128_u64[0];
    -[GEOPBOfflineDataConfiguration _addNoFlagsLatestAvailableVersion:](a1, &v4);
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 108) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(unsigned char *)(a1 + 108) |= 0x40u;
  }
}

- (__n128)_addNoFlagsLatestAvailableVersion:(uint64_t)a1
{
  if (a1)
  {
    if (-[GEOPBOfflineDataConfiguration _reserveLatestAvailableVersions:](a1, 1uLL))
    {
      uint64_t v5 = *(void *)(a1 + 48) + 24 * *(void *)(a1 + 56);
      unint64_t v6 = a2[1].n128_u64[0];
      __n128 result = *a2;
      *(__n128 *)uint64_t v5 = *a2;
      *(void *)(v5 + 16) = v6;
      ++*(void *)(a1 + 56);
    }
  }
  return result;
}

- (void)_readTileMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 108) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBOfflineDataConfigurationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTileMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)tileMetadata
{
  if (a1)
  {
    v2 = a1;
    -[GEOPBOfflineDataConfiguration _readTileMetadata]((uint64_t)a1);
    a1 = (id *)v2[11];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setTileMetadata:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 108) |= 0x20u;
    *(unsigned char *)(a1 + 108) |= 0x40u;
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBOfflineDataConfiguration;
  id v4 = [(GEOPBOfflineDataConfiguration *)&v8 description];
  uint64_t v5 = [(GEOPBOfflineDataConfiguration *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineDataConfiguration _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPBOfflineDataConfiguration readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 32))
    {
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 32)];
      if (*(void *)(a1 + 32))
      {
        uint64_t v6 = 0;
        unint64_t v7 = 0;
        do
        {
          objc_super v8 = _GEOPBOfflineDataLayerVersionDictionaryRepresentation((int *)(*(void *)(a1 + 24) + v6));
          [v5 addObject:v8];

          ++v7;
          v6 += 24;
        }
        while (v7 < *(void *)(a1 + 32));
      }
      if (a2) {
        unint64_t v9 = @"activeVersion";
      }
      else {
        unint64_t v9 = @"active_version";
      }
      [v4 setObject:v5 forKey:v9];
    }
    if (*(unsigned char *)(a1 + 108))
    {
      v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 72)];
      if (a2) {
        v11 = @"activeReleaseDataVersion";
      }
      else {
        v11 = @"active_release_data_version";
      }
      [v4 setObject:v10 forKey:v11];
    }
    if (*(void *)(a1 + 56))
    {
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 56)];
      if (*(void *)(a1 + 56))
      {
        uint64_t v13 = 0;
        unint64_t v14 = 0;
        do
        {
          v15 = _GEOPBOfflineDataLayerVersionDictionaryRepresentation((int *)(*(void *)(a1 + 48) + v13));
          [v12 addObject:v15];

          ++v14;
          v13 += 24;
        }
        while (v14 < *(void *)(a1 + 56));
      }
      if (a2) {
        v16 = @"latestAvailableVersion";
      }
      else {
        v16 = @"latest_available_version";
      }
      [v4 setObject:v12 forKey:v16];
    }
    if ((*(unsigned char *)(a1 + 108) & 2) != 0)
    {
      v17 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 80)];
      if (a2) {
        v18 = @"lastUpdateTimestamp";
      }
      else {
        v18 = @"last_update_timestamp";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = -[GEOPBOfflineDataConfiguration tileMetadata]((id *)a1);
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"tileMetadata";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"tile_metadata";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = *(void **)(a1 + 16);
    if (v23)
    {
      v24 = [v23 dictionaryRepresentation];
      v25 = v24;
      if (a2)
      {
        v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __59__GEOPBOfflineDataConfiguration__dictionaryRepresentation___block_invoke;
        v30[3] = &unk_1E53D8860;
        id v27 = v26;
        id v31 = v27;
        [v25 enumerateKeysAndObjectsUsingBlock:v30];
        id v28 = v27;

        v25 = v28;
      }
      [v4 setObject:v25 forKey:@"Unknown Fields"];
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
  return -[GEOPBOfflineDataConfiguration _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_275;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_276;
      }
      GEOPBOfflineDataConfigurationReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

void __59__GEOPBOfflineDataConfiguration__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPBOfflineDataConfigurationReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x78) == 0))
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPBOfflineDataConfiguration readAll:]((uint64_t)self, 0);
    if (self->_activeVersionsCount)
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        PBDataWriterPlaceMark();
        GEOPBOfflineDataLayerVersionWriteTo((uint64_t)&self->_activeVersions[v6]);
        PBDataWriterRecallMark();
        ++v7;
        ++v6;
      }
      while (v7 < self->_activeVersionsCount);
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_latestAvailableVersionsCount)
    {
      uint64_t v8 = 0;
      unint64_t v9 = 0;
      do
      {
        PBDataWriterPlaceMark();
        GEOPBOfflineDataLayerVersionWriteTo((uint64_t)&self->_latestAvailableVersions[v8]);
        PBDataWriterRecallMark();
        ++v9;
        ++v8;
      }
      while (v9 < self->_latestAvailableVersionsCount);
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_tileMetadata) {
      PBDataWriterWriteSubmessage();
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPBOfflineDataConfigurationReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBOfflineDataConfiguration readAll:]((uint64_t)self, 0);
  unint64_t activeVersionsCount = self->_activeVersionsCount;
  if (activeVersionsCount)
  {
    -[GEOPBOfflineDataConfiguration _reserveActiveVersions:](v5, activeVersionsCount);
    memcpy(*(void **)(v5 + 24), self->_activeVersions, 24 * self->_activeVersionsCount);
    *(void *)(v5 + 32) = self->_activeVersionsCount;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 72) = self->_activeReleaseDataVersion;
    *(unsigned char *)(v5 + 108) |= 1u;
  }
  unint64_t latestAvailableVersionsCount = self->_latestAvailableVersionsCount;
  if (latestAvailableVersionsCount)
  {
    -[GEOPBOfflineDataConfiguration _reserveLatestAvailableVersions:](v5, latestAvailableVersionsCount);
    memcpy(*(void **)(v5 + 48), self->_latestAvailableVersions, 24 * self->_latestAvailableVersionsCount);
    *(void *)(v5 + 56) = self->_latestAvailableVersionsCount;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(void *)(v5 + 80) = self->_lastUpdateTimestamp;
    *(unsigned char *)(v5 + 108) |= 2u;
  }
  id v11 = [(GEOPBOfflineTileMetadata *)self->_tileMetadata copyWithZone:a3];
  v12 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v11;

  uint64_t v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_4;
  }
  -[GEOPBOfflineDataConfiguration readAll:]((uint64_t)self, 1);
  -[GEOPBOfflineDataConfiguration readAll:]((uint64_t)v4, 1);
  unint64_t activeVersionsCount = self->_activeVersionsCount;
  if ((const void *)activeVersionsCount != v4[4] || memcmp(self->_activeVersions, v4[3], 24 * activeVersionsCount)) {
    goto LABEL_4;
  }
  char flags = (char)self->_flags;
  char v9 = *((unsigned char *)v4 + 108);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 108) & 1) == 0 || (const void *)self->_activeReleaseDataVersion != v4[9]) {
      goto LABEL_4;
    }
  }
  else if (*((unsigned char *)v4 + 108))
  {
    goto LABEL_4;
  }
  unint64_t latestAvailableVersionsCount = self->_latestAvailableVersionsCount;
  if ((const void *)latestAvailableVersionsCount != v4[7]
    || memcmp(self->_latestAvailableVersions, v4[6], 24 * latestAvailableVersionsCount))
  {
    goto LABEL_4;
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) != 0 && (const void *)self->_lastUpdateTimestamp == v4[10]) {
      goto LABEL_18;
    }
LABEL_4:
    char v6 = 0;
    goto LABEL_5;
  }
  if ((v9 & 2) != 0) {
    goto LABEL_4;
  }
LABEL_18:
  tileMetadata = self->_tileMetadata;
  if ((unint64_t)tileMetadata | (unint64_t)v4[11]) {
    char v6 = -[GEOPBOfflineTileMetadata isEqual:](tileMetadata, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_5:

  return v6;
}

- (unint64_t)hash
{
  -[GEOPBOfflineDataConfiguration readAll:]((uint64_t)self, 1);
  uint64_t v3 = PBHashBytes();
  if (*(unsigned char *)&self->_flags) {
    unint64_t v4 = 2654435761u * self->_activeReleaseDataVersion;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = PBHashBytes();
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    unint64_t v6 = 2654435761u * self->_lastUpdateTimestamp;
  }
  else {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(GEOPBOfflineTileMetadata *)self->_tileMetadata hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end