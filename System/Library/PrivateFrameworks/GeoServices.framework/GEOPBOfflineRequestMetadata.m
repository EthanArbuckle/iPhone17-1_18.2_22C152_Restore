@interface GEOPBOfflineRequestMetadata
+ (BOOL)isValid:(id)a3;
+ (Class)downloadedRegionsType;
- (BOOL)debugLog;
- (BOOL)hasDebugLog;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMessageType;
- (BOOL)hasPerformanceMetrics;
- (BOOL)hasRequestIdentifier;
- (BOOL)hasRequestStartTimeMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)performanceMetrics;
- (BOOL)readFrom:(id)a3;
- (GEOPBOfflineRequestMetadata)init;
- (GEOPBOfflineRequestMetadata)initWithData:(id)a3;
- (GEOPBOfflineRequestMetadata)initWithDictionary:(id)a3;
- (GEOPBOfflineRequestMetadata)initWithJSON:(id)a3;
- (NSMutableArray)downloadedRegions;
- (NSString)requestIdentifier;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)downloadedRegionsAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)messageTypeAsString:(int)a3;
- (int)StringAsMessageType:(id)a3;
- (int)messageType;
- (unint64_t)downloadedRegionsCount;
- (unint64_t)hash;
- (unint64_t)requestStartTimeMs;
- (void)_addNoFlagsDownloadedRegions:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDownloadedRegions;
- (void)_readRequestIdentifier;
- (void)addDownloadedRegions:(id)a3;
- (void)clearDownloadedRegions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDebugLog:(BOOL)a3;
- (void)setDownloadedRegions:(id)a3;
- (void)setHasDebugLog:(BOOL)a3;
- (void)setHasMessageType:(BOOL)a3;
- (void)setHasPerformanceMetrics:(BOOL)a3;
- (void)setHasRequestStartTimeMs:(BOOL)a3;
- (void)setMessageType:(int)a3;
- (void)setPerformanceMetrics:(BOOL)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setRequestStartTimeMs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBOfflineRequestMetadata

- (GEOPBOfflineRequestMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBOfflineRequestMetadata;
  v2 = [(GEOPBOfflineRequestMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBOfflineRequestMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBOfflineRequestMetadata;
  v3 = [(GEOPBOfflineRequestMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)messageType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_messageType;
  }
  else {
    return 0;
  }
}

- (void)setMessageType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_messageType = a3;
}

- (void)setHasMessageType:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasMessageType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)messageTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F5A30[a3];
  }

  return v3;
}

- (int)StringAsMessageType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PLACE_REQUEST"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_REQUEST"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ETA_REQUEST"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ETA_TRAFFIC_UPDATE_REQUEST"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TRANSIT_ROUTE_UPDATE_REQUEST"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)requestStartTimeMs
{
  return self->_requestStartTimeMs;
}

- (void)setRequestStartTimeMs:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_requestStartTimeMs = a3;
}

- (void)setHasRequestStartTimeMs:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasRequestStartTimeMs
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)debugLog
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 4) != 0 && self->_debugLog;
}

- (void)setDebugLog:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  self->_debugLog = a3;
}

- (void)setHasDebugLog:(BOOL)a3
{
  if (a3) {
    char v3 = 68;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasDebugLog
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readRequestIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBOfflineRequestMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (NSString)requestIdentifier
{
  -[GEOPBOfflineRequestMetadata _readRequestIdentifier]((uint64_t)self);
  requestIdentifier = self->_requestIdentifier;

  return requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (BOOL)performanceMetrics
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 8) != 0 && self->_performanceMetrics;
}

- (void)setPerformanceMetrics:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  self->_performanceMetrics = a3;
}

- (void)setHasPerformanceMetrics:(BOOL)a3
{
  if (a3) {
    char v3 = 72;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasPerformanceMetrics
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (void)_readDownloadedRegions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBOfflineRequestMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDownloadedRegions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)downloadedRegions
{
  -[GEOPBOfflineRequestMetadata _readDownloadedRegions]((uint64_t)self);
  downloadedRegions = self->_downloadedRegions;

  return downloadedRegions;
}

- (void)setDownloadedRegions:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  downloadedRegions = self->_downloadedRegions;
  self->_downloadedRegions = v4;
}

- (void)clearDownloadedRegions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  downloadedRegions = self->_downloadedRegions;

  [(NSMutableArray *)downloadedRegions removeAllObjects];
}

- (void)addDownloadedRegions:(id)a3
{
  id v4 = a3;
  -[GEOPBOfflineRequestMetadata _readDownloadedRegions]((uint64_t)self);
  -[GEOPBOfflineRequestMetadata _addNoFlagsDownloadedRegions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsDownloadedRegions:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)downloadedRegionsCount
{
  -[GEOPBOfflineRequestMetadata _readDownloadedRegions]((uint64_t)self);
  downloadedRegions = self->_downloadedRegions;

  return [(NSMutableArray *)downloadedRegions count];
}

- (id)downloadedRegionsAtIndex:(unint64_t)a3
{
  -[GEOPBOfflineRequestMetadata _readDownloadedRegions]((uint64_t)self);
  downloadedRegions = self->_downloadedRegions;

  return (id)[(NSMutableArray *)downloadedRegions objectAtIndex:a3];
}

+ (Class)downloadedRegionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBOfflineRequestMetadata;
  id v4 = [(GEOPBOfflineRequestMetadata *)&v8 description];
  id v5 = [(GEOPBOfflineRequestMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineRequestMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 60);
    if ((v5 & 2) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 52);
      if (v6 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v7 = off_1E53F5A30[v6];
      }
      if (a2) {
        objc_super v8 = @"messageType";
      }
      else {
        objc_super v8 = @"message_type";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 60);
    }
    if (v5)
    {
      v9 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      if (a2) {
        v10 = @"requestStartTimeMs";
      }
      else {
        v10 = @"request_start_time_ms";
      }
      [v4 setObject:v9 forKey:v10];

      char v5 = *(unsigned char *)(a1 + 60);
    }
    if ((v5 & 4) != 0)
    {
      v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
      if (a2) {
        v12 = @"debugLog";
      }
      else {
        v12 = @"debug_log";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [(id)a1 requestIdentifier];
    if (v13)
    {
      if (a2) {
        v14 = @"requestIdentifier";
      }
      else {
        v14 = @"request_identifier";
      }
      [v4 setObject:v13 forKey:v14];
    }

    if ((*(unsigned char *)(a1 + 60) & 8) != 0)
    {
      v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 57)];
      if (a2) {
        v16 = @"performanceMetrics";
      }
      else {
        v16 = @"performance_metrics";
      }
      [v4 setObject:v15 forKey:v16];
    }
    if ([*(id *)(a1 + 16) count])
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v18 = *(id *)(a1 + 16);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v28 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            v24 = [v23 dictionaryRepresentation];
            }
            [v17 addObject:v24];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v20);
      }

      if (a2) {
        v25 = @"downloadedRegions";
      }
      else {
        v25 = @"downloaded_regions";
      }
      [v4 setObject:v17 forKey:v25];
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
  return -[GEOPBOfflineRequestMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPBOfflineRequestMetadata)initWithDictionary:(id)a3
{
  return (GEOPBOfflineRequestMetadata *)-[GEOPBOfflineRequestMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_62;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_62;
  }
  if (a3) {
    uint64_t v6 = @"messageType";
  }
  else {
    uint64_t v6 = @"message_type";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"PLACE_REQUEST"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"DIRECTIONS_REQUEST"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"ETA_REQUEST"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"ETA_TRAFFIC_UPDATE_REQUEST"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"TRANSIT_ROUTE_UPDATE_REQUEST"])
    {
      uint64_t v9 = 5;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_23:
    [a1 setMessageType:v9];
  }

  if (a3) {
    v10 = @"requestStartTimeMs";
  }
  else {
    v10 = @"request_start_time_ms";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRequestStartTimeMs:", objc_msgSend(v11, "unsignedLongLongValue"));
  }

  if (a3) {
    v12 = @"debugLog";
  }
  else {
    v12 = @"debug_log";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDebugLog:", objc_msgSend(v13, "BOOLValue"));
  }

  if (a3) {
    v14 = @"requestIdentifier";
  }
  else {
    v14 = @"request_identifier";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = (void *)[v15 copy];
    [a1 setRequestIdentifier:v16];
  }
  if (a3) {
    v17 = @"performanceMetrics";
  }
  else {
    v17 = @"performance_metrics";
  }
  id v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPerformanceMetrics:", objc_msgSend(v18, "BOOLValue"));
  }

  if (a3) {
    uint64_t v19 = @"downloadedRegions";
  }
  else {
    uint64_t v19 = @"downloaded_regions";
  }
  uint64_t v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v31 = v5;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v27 = [GEOMapRegion alloc];
            if (a3) {
              uint64_t v28 = [(GEOMapRegion *)v27 initWithJSON:v26];
            }
            else {
              uint64_t v28 = [(GEOMapRegion *)v27 initWithDictionary:v26];
            }
            long long v29 = (void *)v28;
            [a1 addDownloadedRegions:v28];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v23);
    }

    id v5 = v31;
  }

LABEL_62:
  return a1;
}

- (GEOPBOfflineRequestMetadata)initWithJSON:(id)a3
{
  return (GEOPBOfflineRequestMetadata *)-[GEOPBOfflineRequestMetadata _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_115;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_116;
    }
    GEOPBOfflineRequestMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPBOfflineRequestMetadataCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBOfflineRequestMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBOfflineRequestMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 0x70) == 0)
    {
      v11 = self->_reader;
      objc_sync_enter(v11);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v12];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v11);
      goto LABEL_23;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBOfflineRequestMetadata *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_5;
    }
LABEL_20:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_20;
  }
LABEL_5:
  if ((flags & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
  if (self->_requestIdentifier) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->_downloadedRegions;
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

LABEL_23:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOPBOfflineRequestMetadata _readDownloadedRegions]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_downloadedRegions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  BOOL v10 = (id *)a3;
  [(GEOPBOfflineRequestMetadata *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 10) = self->_readerMarkPos;
  *((_DWORD *)v10 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  id v4 = v10;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v10 + 13) = self->_messageType;
    *((unsigned char *)v10 + 60) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v10[4] = self->_requestStartTimeMs;
  *((unsigned char *)v10 + 60) |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    *((unsigned char *)v10 + 56) = self->_debugLog;
    *((unsigned char *)v10 + 60) |= 4u;
  }
LABEL_5:
  if (self->_requestIdentifier)
  {
    objc_msgSend(v10, "setRequestIdentifier:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *((unsigned char *)v4 + 57) = self->_performanceMetrics;
    *((unsigned char *)v4 + 60) |= 8u;
  }
  if ([(GEOPBOfflineRequestMetadata *)self downloadedRegionsCount])
  {
    [v10 clearDownloadedRegions];
    unint64_t v6 = [(GEOPBOfflineRequestMetadata *)self downloadedRegionsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(GEOPBOfflineRequestMetadata *)self downloadedRegionsAtIndex:i];
        [v10 addDownloadedRegions:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
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
      GEOPBOfflineRequestMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_18;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBOfflineRequestMetadata *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_7;
    }
LABEL_20:
    *(void *)(v5 + 32) = self->_requestStartTimeMs;
    *(unsigned char *)(v5 + 60) |= 1u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 52) = self->_messageType;
  *(unsigned char *)(v5 + 60) |= 2u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_20;
  }
LABEL_7:
  if ((flags & 4) != 0)
  {
LABEL_8:
    *(unsigned char *)(v5 + 56) = self->_debugLog;
    *(unsigned char *)(v5 + 60) |= 4u;
  }
LABEL_9:
  uint64_t v10 = [(NSString *)self->_requestIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(unsigned char *)(v5 + 57) = self->_performanceMetrics;
    *(unsigned char *)(v5 + 60) |= 8u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = self->_downloadedRegions;
  uint64_t v12 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v8);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [(id)v5 addDownloadedRegions:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
LABEL_18:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  [(GEOPBOfflineRequestMetadata *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 60);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_messageType != *((_DWORD *)v4 + 13)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_requestStartTimeMs != *((void *)v4 + 4)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0) {
      goto LABEL_27;
    }
    if (self->_debugLog)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_27;
  }
  requestIdentifier = self->_requestIdentifier;
  if ((unint64_t)requestIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](requestIdentifier, "isEqual:")) {
      goto LABEL_27;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 60);
  }
  if ((flags & 8) == 0)
  {
    if ((v6 & 8) == 0) {
      goto LABEL_33;
    }
LABEL_27:
    char v8 = 0;
    goto LABEL_28;
  }
  if ((v6 & 8) == 0) {
    goto LABEL_27;
  }
  if (!self->_performanceMetrics)
  {
    if (!*((unsigned char *)v4 + 57)) {
      goto LABEL_33;
    }
    goto LABEL_27;
  }
  if (!*((unsigned char *)v4 + 57)) {
    goto LABEL_27;
  }
LABEL_33:
  downloadedRegions = self->_downloadedRegions;
  if ((unint64_t)downloadedRegions | *((void *)v4 + 2)) {
    char v8 = -[NSMutableArray isEqual:](downloadedRegions, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_28:

  return v8;
}

- (unint64_t)hash
{
  [(GEOPBOfflineRequestMetadata *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 2654435761 * self->_messageType;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_requestStartTimeMs;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_debugLog;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  NSUInteger v6 = [(NSString *)self->_requestIdentifier hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v7 = 2654435761 * self->_performanceMetrics;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v6 ^ [(NSMutableArray *)self->_downloadedRegions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 2) != 0)
  {
    self->_messageType = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v4 + 60);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_requestStartTimeMs = *((void *)v4 + 4);
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
LABEL_4:
    self->_debugLog = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_5:
  if (*((void *)v4 + 3)) {
    -[GEOPBOfflineRequestMetadata setRequestIdentifier:](self, "setRequestIdentifier:");
  }
  if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    self->_performanceMetrics = *((unsigned char *)v4 + 57);
    *(unsigned char *)&self->_flags |= 8u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEOPBOfflineRequestMetadata addDownloadedRegions:](self, "addDownloadedRegions:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_downloadedRegions, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end