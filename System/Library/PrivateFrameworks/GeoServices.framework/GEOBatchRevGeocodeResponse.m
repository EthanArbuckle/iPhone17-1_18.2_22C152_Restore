@interface GEOBatchRevGeocodeResponse
+ (BOOL)isValid:(id)a3;
+ (Class)batchPlaceResultType;
+ (Class)clusterType;
+ (Class)versionDomainType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasStatusCode;
- (BOOL)hasTimestamp;
- (BOOL)hasTtl;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOBatchRevGeocodeResponse)init;
- (GEOBatchRevGeocodeResponse)initWithData:(id)a3;
- (GEOBatchRevGeocodeResponse)initWithDictionary:(id)a3;
- (GEOBatchRevGeocodeResponse)initWithJSON:(id)a3;
- (NSMutableArray)batchPlaceResults;
- (NSMutableArray)clusters;
- (NSMutableArray)versionDomains;
- (double)timestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)batchPlaceResultAtIndex:(unint64_t)a3;
- (id)clusterAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)statusCodeAsString:(int)a3;
- (id)versionDomainAtIndex:(unint64_t)a3;
- (int)StringAsStatusCode:(id)a3;
- (int)statusCode;
- (unint64_t)batchPlaceResultsCount;
- (unint64_t)clustersCount;
- (unint64_t)hash;
- (unint64_t)versionDomainsCount;
- (unsigned)ttl;
- (unsigned)version;
- (void)_addNoFlagsBatchPlaceResult:(uint64_t)a1;
- (void)_addNoFlagsCluster:(uint64_t)a1;
- (void)_addNoFlagsVersionDomain:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readBatchPlaceResults;
- (void)_readClusters;
- (void)_readVersionDomains;
- (void)addBatchPlaceResult:(id)a3;
- (void)addCluster:(id)a3;
- (void)addVersionDomain:(id)a3;
- (void)clearBatchPlaceResults;
- (void)clearClusters;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearVersionDomains;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBatchPlaceResults:(id)a3;
- (void)setClusters:(id)a3;
- (void)setHasStatusCode:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTtl:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setStatusCode:(int)a3;
- (void)setTimestamp:(double)a3;
- (void)setTtl:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setVersionDomains:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOBatchRevGeocodeResponse

- (GEOBatchRevGeocodeResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOBatchRevGeocodeResponse;
  v2 = [(GEOBatchRevGeocodeResponse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOBatchRevGeocodeResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOBatchRevGeocodeResponse;
  v3 = [(GEOBatchRevGeocodeResponse *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)statusCode
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_statusCode;
  }
  else {
    return 0;
  }
}

- (void)setStatusCode:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_statusCode = a3;
}

- (void)setHasStatusCode:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStatusCode
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)statusCodeAsString:(int)a3
{
  if (a3 <= 29)
  {
    v4 = @"STATUS_SUCCESS";
    switch(a3)
    {
      case 0:
        goto LABEL_22;
      case 1:
        v4 = @"STATUS_FAILED";
        break;
      case 2:
        v4 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_21;
      case 5:
        v4 = @"INVALID_REQUEST";
        break;
      default:
        if (a3 != 20) {
          goto LABEL_21;
        }
        v4 = @"FAILED_NO_RESULT";
        break;
    }
    return v4;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      v4 = @"STATUS_DEDUPED";
    }
    else
    {
      if (a3 != 60) {
        goto LABEL_21;
      }
      v4 = @"VERSION_MISMATCH";
    }
  }
  else
  {
    if (a3 != 30)
    {
      if (a3 == 40)
      {
        v4 = @"FAILED_NOT_AUTHORIZED";
        return v4;
      }
LABEL_21:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      return v4;
    }
    v4 = @"NEEDS_REFINEMENT";
  }
  return v4;
}

- (int)StringAsStatusCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATUS_SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATUS_FAILED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATUS_INCOMPLETE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INVALID_REQUEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FAILED_NO_RESULT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"NEEDS_REFINEMENT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"STATUS_DEDUPED"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"VERSION_MISMATCH"])
  {
    int v4 = 60;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readClusters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClusters_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)clusters
{
  -[GEOBatchRevGeocodeResponse _readClusters]((uint64_t)self);
  clusters = self->_clusters;

  return clusters;
}

- (void)setClusters:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  clusters = self->_clusters;
  self->_clusters = v4;
}

- (void)clearClusters
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  clusters = self->_clusters;

  [(NSMutableArray *)clusters removeAllObjects];
}

- (void)addCluster:(id)a3
{
  id v4 = a3;
  -[GEOBatchRevGeocodeResponse _readClusters]((uint64_t)self);
  -[GEOBatchRevGeocodeResponse _addNoFlagsCluster:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsCluster:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)clustersCount
{
  -[GEOBatchRevGeocodeResponse _readClusters]((uint64_t)self);
  clusters = self->_clusters;

  return [(NSMutableArray *)clusters count];
}

- (id)clusterAtIndex:(unint64_t)a3
{
  -[GEOBatchRevGeocodeResponse _readClusters]((uint64_t)self);
  clusters = self->_clusters;

  return (id)[(NSMutableArray *)clusters objectAtIndex:a3];
}

+ (Class)clusterType
{
  return (Class)objc_opt_class();
}

- (void)_readBatchPlaceResults
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchPlaceResults_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)batchPlaceResults
{
  -[GEOBatchRevGeocodeResponse _readBatchPlaceResults]((uint64_t)self);
  batchPlaceResults = self->_batchPlaceResults;

  return batchPlaceResults;
}

- (void)setBatchPlaceResults:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  batchPlaceResults = self->_batchPlaceResults;
  self->_batchPlaceResults = v4;
}

- (void)clearBatchPlaceResults
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  batchPlaceResults = self->_batchPlaceResults;

  [(NSMutableArray *)batchPlaceResults removeAllObjects];
}

- (void)addBatchPlaceResult:(id)a3
{
  id v4 = a3;
  -[GEOBatchRevGeocodeResponse _readBatchPlaceResults]((uint64_t)self);
  -[GEOBatchRevGeocodeResponse _addNoFlagsBatchPlaceResult:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsBatchPlaceResult:(uint64_t)a1
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

- (unint64_t)batchPlaceResultsCount
{
  -[GEOBatchRevGeocodeResponse _readBatchPlaceResults]((uint64_t)self);
  batchPlaceResults = self->_batchPlaceResults;

  return [(NSMutableArray *)batchPlaceResults count];
}

- (id)batchPlaceResultAtIndex:(unint64_t)a3
{
  -[GEOBatchRevGeocodeResponse _readBatchPlaceResults]((uint64_t)self);
  batchPlaceResults = self->_batchPlaceResults;

  return (id)[(NSMutableArray *)batchPlaceResults objectAtIndex:a3];
}

+ (Class)batchPlaceResultType
{
  return (Class)objc_opt_class();
}

- (unsigned)ttl
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_ttl;
  }
  else {
    return 15768000;
  }
}

- (void)setTtl:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  self->_ttl = a3;
}

- (void)setHasTtl:(BOOL)a3
{
  if (a3) {
    char v3 = -124;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTtl
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readVersionDomains
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 72) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVersionDomains_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)versionDomains
{
  -[GEOBatchRevGeocodeResponse _readVersionDomains]((uint64_t)self);
  versionDomains = self->_versionDomains;

  return versionDomains;
}

- (void)setVersionDomains:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  versionDomains = self->_versionDomains;
  self->_versionDomains = v4;
}

- (void)clearVersionDomains
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  versionDomains = self->_versionDomains;

  [(NSMutableArray *)versionDomains removeAllObjects];
}

- (void)addVersionDomain:(id)a3
{
  id v4 = a3;
  -[GEOBatchRevGeocodeResponse _readVersionDomains]((uint64_t)self);
  -[GEOBatchRevGeocodeResponse _addNoFlagsVersionDomain:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsVersionDomain:(uint64_t)a1
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

- (unint64_t)versionDomainsCount
{
  -[GEOBatchRevGeocodeResponse _readVersionDomains]((uint64_t)self);
  versionDomains = self->_versionDomains;

  return [(NSMutableArray *)versionDomains count];
}

- (id)versionDomainAtIndex:(unint64_t)a3
{
  -[GEOBatchRevGeocodeResponse _readVersionDomains]((uint64_t)self);
  versionDomains = self->_versionDomains;

  return (id)[(NSMutableArray *)versionDomains objectAtIndex:a3];
}

+ (Class)versionDomainType
{
  return (Class)objc_opt_class();
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = -120;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOBatchRevGeocodeResponse;
  id v4 = [(GEOBatchRevGeocodeResponse *)&v8 description];
  id v5 = [(GEOBatchRevGeocodeResponse *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOBatchRevGeocodeResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_56;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)(a1 + 72) & 2) != 0)
  {
    int v5 = *(_DWORD *)(a1 + 60);
    if (v5 <= 29)
    {
      objc_super v6 = @"STATUS_SUCCESS";
      switch(v5)
      {
        case 0:
          goto LABEL_20;
        case 1:
          objc_super v6 = @"STATUS_FAILED";
          break;
        case 2:
          objc_super v6 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          objc_super v6 = @"INVALID_REQUEST";
          break;
        default:
          if (v5 != 20) {
            goto LABEL_15;
          }
          objc_super v6 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_20;
    }
    if (v5 > 49)
    {
      if (v5 == 50)
      {
        objc_super v6 = @"STATUS_DEDUPED";
        goto LABEL_20;
      }
      if (v5 == 60)
      {
        objc_super v6 = @"VERSION_MISMATCH";
        goto LABEL_20;
      }
    }
    else
    {
      if (v5 == 30)
      {
        objc_super v6 = @"NEEDS_REFINEMENT";
        goto LABEL_20;
      }
      if (v5 == 40)
      {
        objc_super v6 = @"FAILED_NOT_AUTHORIZED";
LABEL_20:
        [v4 setObject:v6 forKey:@"statusCode"];

        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 60));
    objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  if ([*(id *)(a1 + 24) count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v8 = *(id *)(a1 + 24);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (a2) {
            [v13 jsonRepresentation];
          }
          else {
          v14 = [v13 dictionaryRepresentation];
          }
          [v7 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"cluster"];
  }
  if ([*(id *)(a1 + 16) count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v16 = *(id *)(a1 + 16);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          if (a2) {
            [v21 jsonRepresentation];
          }
          else {
          v22 = [v21 dictionaryRepresentation];
          }
          [v15 addObject:v22];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v18);
    }

    [v4 setObject:v15 forKey:@"batchPlaceResult"];
  }
  if ((*(unsigned char *)(a1 + 72) & 4) != 0)
  {
    v23 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64)];
    [v4 setObject:v23 forKey:@"ttl"];
  }
  if (*(void *)(a1 + 40))
  {
    v24 = [(id)a1 versionDomains];
    if (a2) {
      v25 = @"versionDomain";
    }
    else {
      v25 = @"version_domain";
    }
    [v4 setObject:v24 forKey:v25];
  }
  char v26 = *(unsigned char *)(a1 + 72);
  if ((v26 & 8) != 0)
  {
    v27 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
    [v4 setObject:v27 forKey:@"version"];

    char v26 = *(unsigned char *)(a1 + 72);
  }
  if (v26)
  {
    v28 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    [v4 setObject:v28 forKey:@"timestamp"];
  }
LABEL_56:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOBatchRevGeocodeResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOBatchRevGeocodeResponse)initWithDictionary:(id)a3
{
  return (GEOBatchRevGeocodeResponse *)-[GEOBatchRevGeocodeResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v51 = a2;
  if (!a1 || (v59 = (void *)[a1 init]) == 0)
  {
    v59 = 0;
    goto LABEL_129;
  }
  id v4 = [v51 objectForKeyedSubscript:@"statusCode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isEqualToString:@"STATUS_SUCCESS"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"STATUS_FAILED"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"INVALID_REQUEST"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"FAILED_NO_RESULT"])
    {
      uint64_t v6 = 20;
    }
    else if ([v5 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      uint64_t v6 = 30;
    }
    else if ([v5 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      uint64_t v6 = 40;
    }
    else if ([v5 isEqualToString:@"STATUS_DEDUPED"])
    {
      uint64_t v6 = 50;
    }
    else if ([v5 isEqualToString:@"VERSION_MISMATCH"])
    {
      uint64_t v6 = 60;
    }
    else
    {
      uint64_t v6 = 0;
    }

    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v4 intValue];
LABEL_27:
    [v59 setStatusCode:v6];
  }

  v50 = [v51 objectForKeyedSubscript:@"cluster"];
  objc_opt_class();
  id v7 = v50;
  if (objc_opt_isKindOfClass())
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    obuint64_t j = v50;
    uint64_t v55 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
    if (v55)
    {
      uint64_t v54 = *(void *)v71;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v71 != v54)
          {
            uint64_t v9 = v8;
            objc_enumerationMutation(obj);
            id v8 = v9;
          }
          v60 = v8;
          uint64_t v10 = *(void **)(*((void *)&v70 + 1) + 8 * (void)v8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v11 = [GEOCluster alloc];
            if (v11)
            {
              id v57 = v10;
              uint64_t v12 = [(GEOCluster *)v11 init];
              if (v12)
              {
                v13 = [v57 objectForKeyedSubscript:@"container"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v14 = [GEOPlaceResult alloc];
                  if (a3) {
                    v15 = [(GEOPlaceResult *)v14 initWithJSON:v13];
                  }
                  else {
                    v15 = [(GEOPlaceResult *)v14 initWithDictionary:v13];
                  }
                  id v16 = v15;
                  -[GEOCluster setContainer:](v12, v15);
                }
                v56 = [v57 objectForKeyedSubscript:@"index"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v76 = 0u;
                  long long v77 = 0u;
                  long long v74 = 0u;
                  long long v75 = 0u;
                  id v17 = v56;
                  uint64_t v18 = [v17 countByEnumeratingWithState:&v74 objects:v81 count:16];
                  if (v18)
                  {
                    uint64_t v19 = *(void *)v75;
                    do
                    {
                      for (uint64_t i = 0; i != v18; ++i)
                      {
                        if (*(void *)v75 != v19) {
                          objc_enumerationMutation(v17);
                        }
                        v21 = *(void **)(*((void *)&v74 + 1) + 8 * i);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          [v21 intValue];
                          os_unfair_lock_lock((os_unfair_lock_t)(v12 + 56));
                          if ((*(unsigned char *)(v12 + 60) & 1) == 0)
                          {
                            v22 = *(void **)(v12 + 8);
                            if (v22)
                            {
                              id v23 = v22;
                              objc_sync_enter(v23);
                              GEOClusterReadSpecified(v12, *(void *)(v12 + 8), (int *)&_readIndexs_tags);
                              objc_sync_exit(v23);
                            }
                          }
                          os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 56));
                          PBRepeatedInt32Add();
                          os_unfair_lock_lock_with_options();
                          *(unsigned char *)(v12 + 60) |= 1u;
                          os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 56));
                          *(unsigned char *)(v12 + 60) |= 4u;
                        }
                      }
                      uint64_t v18 = [v17 countByEnumeratingWithState:&v74 objects:v81 count:16];
                    }
                    while (v18);
                  }
                }
              }
            }
            else
            {
              uint64_t v12 = 0;
            }
            objc_msgSend(v59, "addCluster:", v12, v50);
          }
          id v8 = v60 + 1;
        }
        while (v60 + 1 != (char *)v55);
        uint64_t v24 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
        uint64_t v55 = v24;
      }
      while (v24);
    }

    id v7 = v50;
  }

  v58 = [v51 objectForKeyedSubscript:@"batchPlaceResult"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v61 = v58;
    uint64_t v25 = [v61 countByEnumeratingWithState:&v66 objects:v79 count:16];
    if (!v25) {
      goto LABEL_107;
    }
    uint64_t v26 = *(void *)v67;
    while (1)
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v67 != v26) {
          objc_enumerationMutation(v61);
        }
        v28 = *(void **)(*((void *)&v66 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v29 = [GEOBatchPlaceResult alloc];
          if (v29)
          {
            id v30 = v28;
            v29 = [(GEOBatchPlaceResult *)v29 init];
            if (v29)
            {
              long long v31 = [v30 objectForKeyedSubscript:@"statusCode"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v32 = v31;
                if ([v32 isEqualToString:@"STATUS_SUCCESS"])
                {
                  int v33 = 0;
                }
                else if ([v32 isEqualToString:@"STATUS_FAILED"])
                {
                  int v33 = 1;
                }
                else if ([v32 isEqualToString:@"STATUS_INCOMPLETE"])
                {
                  int v33 = 2;
                }
                else if ([v32 isEqualToString:@"INVALID_REQUEST"])
                {
                  int v33 = 5;
                }
                else if ([v32 isEqualToString:@"FAILED_NO_RESULT"])
                {
                  int v33 = 20;
                }
                else if ([v32 isEqualToString:@"NEEDS_REFINEMENT"])
                {
                  int v33 = 30;
                }
                else if ([v32 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
                {
                  int v33 = 40;
                }
                else if ([v32 isEqualToString:@"STATUS_DEDUPED"])
                {
                  int v33 = 50;
                }
                else if ([v32 isEqualToString:@"VERSION_MISMATCH"])
                {
                  int v33 = 60;
                }
                else
                {
                  int v33 = 0;
                }

LABEL_96:
                *(unsigned char *)&v29->_flags |= 1u;
                v29->_statusCode = v33;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v33 = [v31 intValue];
                  goto LABEL_96;
                }
              }

              long long v34 = [v30 objectForKeyedSubscript:@"placeResult"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v35 = [GEOPlaceResult alloc];
                if (a3) {
                  long long v36 = [(GEOPlaceResult *)v35 initWithJSON:v34];
                }
                else {
                  long long v36 = [(GEOPlaceResult *)v35 initWithDictionary:v34];
                }
                long long v37 = v36;
                -[GEOBatchPlaceResult setPlaceResult:]((uint64_t)v29, v36);
              }
            }
          }
          objc_msgSend(v59, "addBatchPlaceResult:", v29, v50);

          continue;
        }
      }
      uint64_t v25 = [v61 countByEnumeratingWithState:&v66 objects:v79 count:16];
      if (!v25)
      {
LABEL_107:

        break;
      }
    }
  }

  v38 = [v51 objectForKeyedSubscript:@"ttl"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v59, "setTtl:", objc_msgSend(v38, "unsignedIntValue"));
  }

  if (a3) {
    v39 = @"versionDomain";
  }
  else {
    v39 = @"version_domain";
  }
  uint64_t v40 = objc_msgSend(v51, "objectForKeyedSubscript:", v39, v50);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v41 = v40;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v62 objects:v78 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v63;
      do
      {
        for (uint64_t k = 0; k != v42; ++k)
        {
          if (*(void *)v63 != v43) {
            objc_enumerationMutation(v41);
          }
          v45 = *(void **)(*((void *)&v62 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v46 = (void *)[v45 copy];
            [v59 addVersionDomain:v46];
          }
        }
        uint64_t v42 = [v41 countByEnumeratingWithState:&v62 objects:v78 count:16];
      }
      while (v42);
    }
  }
  v47 = [v51 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v59, "setVersion:", objc_msgSend(v47, "unsignedIntValue"));
  }

  v48 = [v51 objectForKeyedSubscript:@"timestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v48 doubleValue];
    objc_msgSend(v59, "setTimestamp:");
  }

LABEL_129:
  return v59;
}

- (GEOBatchRevGeocodeResponse)initWithJSON:(id)a3
{
  return (GEOBatchRevGeocodeResponse *)-[GEOBatchRevGeocodeResponse _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_191_0;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_192_0;
    }
    GEOBatchRevGeocodeResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = self->_clusters;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v9);
          }
          -[GEOCluster readAll:](*(void *)(*((void *)&v20 + 1) + 8 * i), 1);
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v10);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v13 = self->_batchPlaceResults;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v17;
      while (1)
      {
        if (*(void *)v17 != v15) {
          objc_enumerationMutation(v13);
        }
        if (!--v14)
        {
          uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (!v14) {
            break;
          }
        }
      }
    }
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  [a3 position];
  [a3 length];
  id v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
LABEL_137:
    BOOL v75 = *((unsigned char *)a3 + *v6) == 0;
    PBReaderRecallMark();
  }
  else
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (*((unsigned char *)a3 + *v6)) {
        goto LABEL_137;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v4;
        uint64_t v12 = *(void *)((char *)a3 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v12);
        *(void *)((char *)a3 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          uint64_t v16 = *v6;
          int v17 = *((unsigned __int8 *)a3 + v16);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      uint64_t v16 = *v6;
      int v17 = *((unsigned __int8 *)a3 + v16);
      if (*((unsigned char *)a3 + v16)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v18 = v10 & 7;
      if (v17 || v18 == 4) {
        goto LABEL_137;
      }
      switch((v10 >> 3))
      {
        case 1u:
          if ((v10 & 7) != 0) {
            goto LABEL_139;
          }
          unsigned int v20 = 0;
          while (1)
          {
            uint64_t v21 = *v4;
            uint64_t v22 = *(void *)((char *)a3 + v21);
            unint64_t v23 = v22 + 1;
            if (v22 == -1 || v23 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_129;
            }
            int v24 = *(char *)(*(void *)((char *)a3 + *v7) + v22);
            *(void *)((char *)a3 + v21) = v23;
            if (v24 < 0)
            {
              BOOL v25 = v20++ > 8;
              if (!v25) {
                continue;
              }
            }
            goto LABEL_131;
          }
        case 2u:
          if (v18 != 2 || !PBReaderPlaceMark()) {
            goto LABEL_139;
          }
          objc_msgSend(a3, "position", 0, 0);
          [a3 length];
LABEL_30:
          while (2)
          {
            if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5) || *((unsigned char *)a3 + *v6)) {
              goto LABEL_108;
            }
            char v26 = 0;
            unsigned int v27 = 0;
            unint64_t v28 = 0;
            while (1)
            {
              uint64_t v29 = *v4;
              uint64_t v30 = *(void *)((char *)a3 + v29);
              unint64_t v31 = v30 + 1;
              if (v30 == -1 || v31 > *(void *)((char *)a3 + *v5)) {
                break;
              }
              char v32 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v30);
              *(void *)((char *)a3 + v29) = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if ((v32 & 0x80) == 0) {
                goto LABEL_40;
              }
              v26 += 7;
              BOOL v15 = v27++ >= 9;
              if (v15)
              {
                unint64_t v28 = 0;
                int v33 = *((unsigned __int8 *)a3 + *v6);
                goto LABEL_42;
              }
            }
            *((unsigned char *)a3 + *v6) = 1;
LABEL_40:
            int v33 = *((unsigned __int8 *)a3 + *v6);
            if (*((unsigned char *)a3 + *v6)) {
              unint64_t v28 = 0;
            }
LABEL_42:
            int v34 = v28 & 7;
            if (v33 || v34 == 4) {
              goto LABEL_108;
            }
            if ((v28 >> 3) == 2)
            {
              if (v34 == 2)
              {
                if (PBReaderPlaceMark())
                {
LABEL_62:
                  while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5))
                  {
                    unsigned int v41 = *((unsigned __int8 *)a3 + *v6);
                    if (*((unsigned char *)a3 + *v6)) {
                      break;
                    }
                    while (1)
                    {
                      uint64_t v42 = *v4;
                      uint64_t v43 = *(void *)((char *)a3 + v42);
                      unint64_t v44 = v43 + 1;
                      if (v43 == -1 || v44 > *(void *)((char *)a3 + *v5)) {
                        break;
                      }
                      int v45 = *(char *)(*(void *)((char *)a3 + *v7) + v43);
                      *(void *)((char *)a3 + v42) = v44;
                      if (v45 < 0)
                      {
                        BOOL v15 = v41++ >= 9;
                        if (!v15) {
                          continue;
                        }
                      }
                      goto LABEL_62;
                    }
                    *((unsigned char *)a3 + *v6) = 1;
                  }
                  goto LABEL_51;
                }
              }
              else if ((v28 & 7) == 0)
              {
                do
                {
                  uint64_t v36 = *v4;
                  uint64_t v37 = *(void *)((char *)a3 + v36);
                  unint64_t v38 = v37 + 1;
                  if (v37 == -1 || v38 > *(void *)((char *)a3 + *v5))
                  {
                    *((unsigned char *)a3 + *v6) = 1;
                    goto LABEL_30;
                  }
                  int v39 = *(char *)(*(void *)((char *)a3 + *v7) + v37);
                  *(void *)((char *)a3 + v36) = v38;
                  if ((v39 & 0x80000000) == 0) {
                    break;
                  }
                  unsigned int v40 = v34++;
                }
                while (v40 <= 8);
                continue;
              }
            }
            else
            {
              if ((v28 >> 3) != 1)
              {
                if ((PBReaderSkipValueWithTag() & 1) == 0) {
                  break;
                }
                continue;
              }
              if (v34 == 2 && PBReaderPlaceMark() && GEOPlaceResultIsValid((char *)a3))
              {
LABEL_51:
                PBReaderRecallMark();
                continue;
              }
            }
            break;
          }
LABEL_138:
          PBReaderRecallMark();
LABEL_139:
          PBReaderRecallMark();
          BOOL v75 = 0;
          break;
        case 3u:
          if (v18 != 2 || !PBReaderPlaceMark()) {
            goto LABEL_139;
          }
          objc_msgSend(a3, "position", 0, 0);
          [a3 length];
LABEL_75:
          while (2)
          {
            if (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5) && !*((unsigned char *)a3 + *v6))
            {
              char v46 = 0;
              unsigned int v47 = 0;
              unint64_t v48 = 0;
              while (1)
              {
                uint64_t v49 = *v4;
                uint64_t v50 = *(void *)((char *)a3 + v49);
                unint64_t v51 = v50 + 1;
                if (v50 == -1 || v51 > *(void *)((char *)a3 + *v5)) {
                  break;
                }
                char v52 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v50);
                *(void *)((char *)a3 + v49) = v51;
                v48 |= (unint64_t)(v52 & 0x7F) << v46;
                if ((v52 & 0x80) == 0) {
                  goto LABEL_85;
                }
                v46 += 7;
                BOOL v15 = v47++ >= 9;
                if (v15)
                {
                  unint64_t v48 = 0;
                  int v53 = *((unsigned __int8 *)a3 + *v6);
                  goto LABEL_87;
                }
              }
              *((unsigned char *)a3 + *v6) = 1;
LABEL_85:
              int v53 = *((unsigned __int8 *)a3 + *v6);
              if (*((unsigned char *)a3 + *v6)) {
                unint64_t v48 = 0;
              }
LABEL_87:
              int v54 = v48 & 7;
              if (!v53 && v54 != 4)
              {
                if ((v48 >> 3) == 2)
                {
                  if (v54 == 2 && PBReaderPlaceMark() && GEOPlaceResultIsValid((char *)a3))
                  {
                    PBReaderRecallMark();
                    continue;
                  }
                }
                else
                {
                  if ((v48 >> 3) != 1)
                  {
                    if ((PBReaderSkipValueWithTag() & 1) == 0) {
                      goto LABEL_138;
                    }
                    continue;
                  }
                  if ((v48 & 7) == 0)
                  {
                    unsigned int v56 = 0;
                    do
                    {
                      uint64_t v57 = *v4;
                      uint64_t v58 = *(void *)((char *)a3 + v57);
                      unint64_t v59 = v58 + 1;
                      if (v58 == -1 || v59 > *(void *)((char *)a3 + *v5))
                      {
                        *((unsigned char *)a3 + *v6) = 1;
                        goto LABEL_75;
                      }
                      int v60 = *(char *)(*(void *)((char *)a3 + *v7) + v58);
                      *(void *)((char *)a3 + v57) = v59;
                      if ((v60 & 0x80000000) == 0) {
                        break;
                      }
                      BOOL v25 = v56++ > 8;
                    }
                    while (!v25);
                    continue;
                  }
                }
                goto LABEL_138;
              }
            }
            break;
          }
LABEL_108:
          int v61 = *((unsigned __int8 *)a3 + *v6);
          PBReaderRecallMark();
          if (v61) {
            goto LABEL_139;
          }
          PBReaderRecallMark();
LABEL_131:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_137;
          }
          continue;
        case 4u:
          if ((v10 & 7) != 0) {
            goto LABEL_139;
          }
          unsigned int v62 = 0;
          while (1)
          {
            uint64_t v63 = *v4;
            uint64_t v64 = *(void *)((char *)a3 + v63);
            unint64_t v65 = v64 + 1;
            if (v64 == -1 || v65 > *(void *)((char *)a3 + *v5)) {
              goto LABEL_129;
            }
            int v66 = *(char *)(*(void *)((char *)a3 + *v7) + v64);
            *(void *)((char *)a3 + v63) = v65;
            if (v66 < 0)
            {
              BOOL v25 = v62++ > 8;
              if (!v25) {
                continue;
              }
            }
            goto LABEL_131;
          }
        case 5u:
          if (v18 == 2) {
            goto LABEL_119;
          }
          goto LABEL_139;
        case 6u:
          if ((v10 & 7) != 0) {
            goto LABEL_139;
          }
          unsigned int v67 = 0;
          while (1)
          {
            uint64_t v68 = *v4;
            uint64_t v69 = *(void *)((char *)a3 + v68);
            unint64_t v70 = v69 + 1;
            if (v69 == -1 || v70 > *(void *)((char *)a3 + *v5)) {
              break;
            }
            int v71 = *(char *)(*(void *)((char *)a3 + *v7) + v69);
            *(void *)((char *)a3 + v68) = v70;
            if (v71 < 0)
            {
              BOOL v25 = v67++ > 8;
              if (!v25) {
                continue;
              }
            }
            goto LABEL_131;
          }
LABEL_129:
          uint64_t v16 = *v6;
LABEL_130:
          *((unsigned char *)a3 + v16) = 1;
          goto LABEL_131;
        case 7u:
          if (v18 != 1) {
            goto LABEL_139;
          }
          uint64_t v72 = *v4;
          unint64_t v73 = *(void *)((char *)a3 + v72);
          if (v73 > 0xFFFFFFFFFFFFFFF7) {
            goto LABEL_130;
          }
          unint64_t v74 = v73 + 8;
          if (v74 > *(void *)((char *)a3 + *v5)) {
            goto LABEL_130;
          }
          *(void *)((char *)a3 + v72) = v74;
          goto LABEL_131;
        default:
LABEL_119:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_139;
          }
          goto LABEL_131;
      }
      break;
    }
  }
  return v75;
}

- (BOOL)readFrom:(id)a3
{
  return GEOBatchRevGeocodeResponseReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 0xFu))
  {
    long long v19 = self->_reader;
    objc_sync_enter(v19);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    unsigned int v20 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v20];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOBatchRevGeocodeResponse *)self readAll:0];
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v6 = self->_clusters;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v7);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    unint64_t v10 = self->_batchPlaceResults;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v11);
    }

    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    char v14 = self->_versionDomains;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
      }
      while (v15);
    }

    char flags = (char)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteDoubleField();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  -[GEOBatchRevGeocodeResponse _readClusters]((uint64_t)self);
  if ([(NSMutableArray *)self->_clusters count])
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [(NSMutableArray *)self->_clusters objectAtIndexedSubscript:v5];
      uint64_t v7 = v6;
      if (v6)
      {
        uint64_t v8 = -[GEOCluster container](v6);
        unsigned int v9 = GEOPlaceResultHasSensitiveFields(v8);

        if (v9)
        {
          unint64_t v10 = (void *)[v7 copy];
          GEOClusterClearSensitiveFields((uint64_t)v10, a3, 0);
          [(NSMutableArray *)self->_clusters replaceObjectAtIndex:v5 withObject:v10];
        }
        else
        {
          GEOClusterClearSensitiveFields((uint64_t)v7, a3, 1);
        }
      }

      ++v5;
    }
    while (v5 < [(NSMutableArray *)self->_clusters count]);
  }
  -[GEOBatchRevGeocodeResponse _readBatchPlaceResults]((uint64_t)self);
  if ([(NSMutableArray *)self->_batchPlaceResults count])
  {
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = [(NSMutableArray *)self->_batchPlaceResults objectAtIndexedSubscript:v11];
      unint64_t v13 = (void *)v12;
      if (v12)
      {
        if (GEOPlaceResultHasSensitiveFields(*(void **)(v12 + 8)))
        {
          char v14 = (id *)[v13 copy];
          GEOBatchPlaceResultClearSensitiveFields(v14, a3, 0);
          [(NSMutableArray *)self->_batchPlaceResults replaceObjectAtIndex:v11 withObject:v14];
        }
        else
        {
          GEOBatchPlaceResultClearSensitiveFields((id *)v13, a3, 1);
        }
      }

      ++v11;
    }
    while (v11 < [(NSMutableArray *)self->_batchPlaceResults count]);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  -[GEOBatchRevGeocodeResponse _readBatchPlaceResults]((uint64_t)self);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  unint64_t v5 = self->_batchPlaceResults;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v23 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * v9);
      if (v10)
      {
        if ([*(id *)(v10 + 8) hasGreenTeaWithValue:v3]) {
          goto LABEL_20;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEOBatchRevGeocodeResponse _readClusters]((uint64_t)self);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v5 = self->_clusters;
  uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
LABEL_12:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v5);
      }
      uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
      if (v15)
      {
        -[GEOCluster _readContainer](*(void *)(*((void *)&v18 + 1) + 8 * v14));
        if (objc_msgSend(*(id *)(v15 + 40), "hasGreenTeaWithValue:", v3, (void)v18)) {
          break;
        }
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12) {
          goto LABEL_12;
        }
        goto LABEL_19;
      }
    }
LABEL_20:
    BOOL v16 = 1;
    goto LABEL_21;
  }
LABEL_19:
  BOOL v16 = 0;
LABEL_21:

  return v16;
}

- (void)copyTo:(id)a3
{
  int v17 = (id *)a3;
  [(GEOBatchRevGeocodeResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v17 + 1, self->_reader);
  *((_DWORD *)v17 + 12) = self->_readerMarkPos;
  *((_DWORD *)v17 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v17 + 15) = self->_statusCode;
    *((unsigned char *)v17 + 72) |= 2u;
  }
  if ([(GEOBatchRevGeocodeResponse *)self clustersCount])
  {
    [v17 clearClusters];
    unint64_t v4 = [(GEOBatchRevGeocodeResponse *)self clustersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOBatchRevGeocodeResponse *)self clusterAtIndex:i];
        [v17 addCluster:v7];
      }
    }
  }
  if ([(GEOBatchRevGeocodeResponse *)self batchPlaceResultsCount])
  {
    [v17 clearBatchPlaceResults];
    unint64_t v8 = [(GEOBatchRevGeocodeResponse *)self batchPlaceResultsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOBatchRevGeocodeResponse *)self batchPlaceResultAtIndex:j];
        [v17 addBatchPlaceResult:v11];
      }
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v17 + 16) = self->_ttl;
    *((unsigned char *)v17 + 72) |= 4u;
  }
  if ([(GEOBatchRevGeocodeResponse *)self versionDomainsCount])
  {
    [v17 clearVersionDomains];
    unint64_t v12 = [(GEOBatchRevGeocodeResponse *)self versionDomainsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOBatchRevGeocodeResponse *)self versionDomainAtIndex:k];
        [v17 addVersionDomain:v15];
      }
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v17 + 17) = self->_version;
    *((unsigned char *)v17 + 72) |= 8u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v17[4] = *(id *)&self->_timestamp;
    *((unsigned char *)v17 + 72) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOBatchRevGeocodeResponseReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOBatchRevGeocodeResponse *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_statusCode;
    *(unsigned char *)(v5 + 72) |= 2u;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v9 = self->_clusters;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addCluster:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v10);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v14 = self->_batchPlaceResults;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addBatchPlaceResult:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v15);
  }

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_ttl;
    *(unsigned char *)(v5 + 72) |= 4u;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v19 = self->_versionDomains;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * k), "copyWithZone:", a3, (void)v26);
        [(id)v5 addVersionDomain:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v20);
  }

  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_version;
    *(unsigned char *)(v5 + 72) |= 8u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(double *)(v5 + 32) = self->_timestamp;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  [(GEOBatchRevGeocodeResponse *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_statusCode != *((_DWORD *)v4 + 15)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_28;
  }
  clusters = self->_clusters;
  if ((unint64_t)clusters | *((void *)v4 + 3)
    && !-[NSMutableArray isEqual:](clusters, "isEqual:"))
  {
    goto LABEL_28;
  }
  batchPlaceResults = self->_batchPlaceResults;
  if ((unint64_t)batchPlaceResults | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](batchPlaceResults, "isEqual:")) {
      goto LABEL_28;
    }
  }
  char flags = (char)self->_flags;
  char v8 = *((unsigned char *)v4 + 72);
  if ((flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_ttl != *((_DWORD *)v4 + 16)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_28;
  }
  versionDomains = self->_versionDomains;
  if ((unint64_t)versionDomains | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](versionDomains, "isEqual:"))
    {
LABEL_28:
      BOOL v10 = 0;
      goto LABEL_29;
    }
    char flags = (char)self->_flags;
    char v8 = *((unsigned char *)v4 + 72);
  }
  if ((flags & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_version != *((_DWORD *)v4 + 17)) {
      goto LABEL_28;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_28;
  }
  BOOL v10 = (v8 & 1) == 0;
  if (flags)
  {
    if ((v8 & 1) == 0 || self->_timestamp != *((double *)v4 + 4)) {
      goto LABEL_28;
    }
    BOOL v10 = 1;
  }
LABEL_29:

  return v10;
}

- (unint64_t)hash
{
  [(GEOBatchRevGeocodeResponse *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_statusCode;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_clusters hash];
  uint64_t v5 = [(NSMutableArray *)self->_batchPlaceResults hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_ttl;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSMutableArray *)self->_versionDomains hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v8 = 2654435761 * self->_version;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_9;
    }
LABEL_14:
    unint64_t v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v13;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  double timestamp = self->_timestamp;
  double v10 = -timestamp;
  if (timestamp >= 0.0) {
    double v10 = self->_timestamp;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    self->_statusCode = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 2u;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOBatchRevGeocodeResponse *)self addCluster:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = *((id *)v4 + 2);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOBatchRevGeocodeResponse *)self addBatchPlaceResult:*(void *)(*((void *)&v25 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v12);
  }

  if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    self->_ttl = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_flags |= 4u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = *((id *)v4 + 5);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        -[GEOBatchRevGeocodeResponse addVersionDomain:](self, "addVersionDomain:", *(void *)(*((void *)&v21 + 1) + 8 * k), (void)v21);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v17);
  }

  char v20 = *((unsigned char *)v4 + 72);
  if ((v20 & 8) != 0)
  {
    self->_version = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_flags |= 8u;
    char v20 = *((unsigned char *)v4 + 72);
  }
  if (v20)
  {
    self->_double timestamp = *((double *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionDomains, 0);
  objc_storeStrong((id *)&self->_clusters, 0);
  objc_storeStrong((id *)&self->_batchPlaceResults, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end