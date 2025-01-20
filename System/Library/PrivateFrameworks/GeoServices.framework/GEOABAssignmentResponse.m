@interface GEOABAssignmentResponse
+ (BOOL)isValid:(id)a3;
+ (Class)assignmentType;
- (BOOL)hasBranchExpirationTtlHours;
- (BOOL)hasClientConfig;
- (BOOL)hasInvalidatePoiCache;
- (BOOL)hasInvalidateTileCache;
- (BOOL)hasMapsAbClientMetadata;
- (BOOL)hasParsecClientMetadata;
- (BOOL)hasRapClientMetadata;
- (BOOL)hasRefreshIntervalSeconds;
- (BOOL)hasRequestGuid;
- (BOOL)hasSiriClientMetadata;
- (BOOL)hasSourceURL;
- (BOOL)hasTimestamp;
- (BOOL)invalidatePoiCache;
- (BOOL)invalidateTileCache;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOABAssignmentResponse)init;
- (GEOABAssignmentResponse)initWithData:(id)a3;
- (GEOABAssignmentResponse)initWithDictionary:(id)a3;
- (GEOABAssignmentResponse)initWithJSON:(id)a3;
- (GEOABClientConfig)clientConfig;
- (GEOABSecondPartyPlaceRequestClientMetaData)mapsAbClientMetadata;
- (GEOABSecondPartyPlaceRequestClientMetaData)parsecClientMetadata;
- (GEOABSecondPartyPlaceRequestClientMetaData)rapClientMetadata;
- (GEOABSecondPartyPlaceRequestClientMetaData)siriClientMetadata;
- (NSMutableArray)assignments;
- (NSString)requestGuid;
- (NSString)sourceURL;
- (PBUnknownFields)unknownFields;
- (double)timestamp;
- (id)_clientConfigValueForKey:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)assignmentAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)assignmentsCount;
- (unint64_t)branchExpirationTtlHours;
- (unint64_t)hash;
- (unint64_t)refreshIntervalSeconds;
- (void)_addNoFlagsAssignment:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAssignments;
- (void)_readClientConfig;
- (void)_readMapsAbClientMetadata;
- (void)_readParsecClientMetadata;
- (void)_readRapClientMetadata;
- (void)_readRequestGuid;
- (void)_readSiriClientMetadata;
- (void)_readSourceURL;
- (void)addAssignment:(id)a3;
- (void)clearAssignments;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAssignments:(id)a3;
- (void)setBranchExpirationTtlHours:(unint64_t)a3;
- (void)setClientConfig:(id)a3;
- (void)setHasBranchExpirationTtlHours:(BOOL)a3;
- (void)setHasInvalidatePoiCache:(BOOL)a3;
- (void)setHasInvalidateTileCache:(BOOL)a3;
- (void)setHasRefreshIntervalSeconds:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInvalidatePoiCache:(BOOL)a3;
- (void)setInvalidateTileCache:(BOOL)a3;
- (void)setMapsAbClientMetadata:(id)a3;
- (void)setParsecClientMetadata:(id)a3;
- (void)setRapClientMetadata:(id)a3;
- (void)setRefreshIntervalSeconds:(unint64_t)a3;
- (void)setRequestGuid:(id)a3;
- (void)setSiriClientMetadata:(id)a3;
- (void)setSourceURL:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOABAssignmentResponse

- (id)_clientConfigValueForKey:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v5 = [(GEOABAssignmentResponse *)self clientConfig];
  v6 = [v5 configKeyValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v12 = [v11 abConfigKey];
        int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          v14 = [v11 abConfigValue];
          int v15 = [v11 abConfigValueType] - 1;
          if (!(!v17 & v16))
          {
            switch(v15)
            {
              case 0:
                uint64_t v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v14, "intValue"));
                break;
              case 1:
                v20 = NSNumber;
                [v14 doubleValue];
                uint64_t v19 = objc_msgSend(v20, "numberWithDouble:");
                break;
              case 2:
                uint64_t v19 = [v14 stringValue];
                break;
              case 3:
                uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v14, "BOOLValue"));
                break;
              default:
                JUMPOUT(0);
            }
            v18 = (void *)v19;

            goto LABEL_20;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      v18 = 0;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    v18 = 0;
  }
LABEL_20:

  return v18;
}

- (GEOABClientConfig)clientConfig
{
  -[GEOABAssignmentResponse _readClientConfig]((uint64_t)self);
  clientConfig = self->_clientConfig;

  return clientConfig;
}

- (void)_readClientConfig
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientConfig_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (GEOABSecondPartyPlaceRequestClientMetaData)siriClientMetadata
{
  -[GEOABAssignmentResponse _readSiriClientMetadata]((uint64_t)self);
  siriClientMetadata = self->_siriClientMetadata;

  return siriClientMetadata;
}

- (BOOL)readFrom:(id)a3
{
  return GEOABAssignmentResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (GEOABSecondPartyPlaceRequestClientMetaData)parsecClientMetadata
{
  -[GEOABAssignmentResponse _readParsecClientMetadata]((uint64_t)self);
  parsecClientMetadata = self->_parsecClientMetadata;

  return parsecClientMetadata;
}

- (void)_readParsecClientMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readParsecClientMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (GEOABAssignmentResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOABAssignmentResponse;
  id v3 = [(GEOABAssignmentResponse *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (GEOABSecondPartyPlaceRequestClientMetaData)mapsAbClientMetadata
{
  -[GEOABAssignmentResponse _readMapsAbClientMetadata]((uint64_t)self);
  mapsAbClientMetadata = self->_mapsAbClientMetadata;

  return mapsAbClientMetadata;
}

- (void)_readMapsAbClientMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsAbClientMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (void)_readSiriClientMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSiriClientMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (GEOABAssignmentResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOABAssignmentResponse;
  v2 = [(GEOABAssignmentResponse *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void)_readRequestGuid
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestGuid_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasRequestGuid
{
  return self->_requestGuid != 0;
}

- (NSString)requestGuid
{
  -[GEOABAssignmentResponse _readRequestGuid]((uint64_t)self);
  requestGuid = self->_requestGuid;

  return requestGuid;
}

- (void)setRequestGuid:(id)a3
{
  *(_WORD *)&self->_flags |= 0x4800u;
  objc_storeStrong((id *)&self->_requestGuid, a3);
}

- (void)_readAssignments
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAssignments_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)assignments
{
  -[GEOABAssignmentResponse _readAssignments]((uint64_t)self);
  assignments = self->_assignments;

  return assignments;
}

- (void)setAssignments:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  assignments = self->_assignments;
  self->_assignments = v4;
}

- (void)clearAssignments
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  assignments = self->_assignments;

  [(NSMutableArray *)assignments removeAllObjects];
}

- (void)addAssignment:(id)a3
{
  id v4 = a3;
  -[GEOABAssignmentResponse _readAssignments]((uint64_t)self);
  -[GEOABAssignmentResponse _addNoFlagsAssignment:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsAssignment:(uint64_t)a1
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

- (unint64_t)assignmentsCount
{
  -[GEOABAssignmentResponse _readAssignments]((uint64_t)self);
  assignments = self->_assignments;

  return [(NSMutableArray *)assignments count];
}

- (id)assignmentAtIndex:(unint64_t)a3
{
  -[GEOABAssignmentResponse _readAssignments]((uint64_t)self);
  assignments = self->_assignments;

  return (id)[(NSMutableArray *)assignments objectAtIndex:a3];
}

+ (Class)assignmentType
{
  return (Class)objc_opt_class();
}

- (BOOL)invalidateTileCache
{
  return self->_invalidateTileCache;
}

- (void)setInvalidateTileCache:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x4010u;
  self->_invalidateTileCache = a3;
}

- (void)setHasInvalidateTileCache:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16400;
  }
  else {
    __int16 v3 = 0x4000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasInvalidateTileCache
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (BOOL)invalidatePoiCache
{
  return self->_invalidatePoiCache;
}

- (void)setInvalidatePoiCache:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x4008u;
  self->_invalidatePoiCache = a3;
}

- (void)setHasInvalidatePoiCache:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16392;
  }
  else {
    __int16 v3 = 0x4000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasInvalidatePoiCache
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unint64_t)refreshIntervalSeconds
{
  return self->_refreshIntervalSeconds;
}

- (void)setRefreshIntervalSeconds:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x4002u;
  self->_refreshIntervalSeconds = a3;
}

- (void)setHasRefreshIntervalSeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16386;
  }
  else {
    __int16 v3 = 0x4000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasRefreshIntervalSeconds
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)hasClientConfig
{
  return self->_clientConfig != 0;
}

- (void)setClientConfig:(id)a3
{
  *(_WORD *)&self->_flags |= 0x4080u;
  objc_storeStrong((id *)&self->_clientConfig, a3);
}

- (BOOL)hasParsecClientMetadata
{
  return self->_parsecClientMetadata != 0;
}

- (void)setParsecClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x4200u;
  objc_storeStrong((id *)&self->_parsecClientMetadata, a3);
}

- (BOOL)hasSiriClientMetadata
{
  return self->_siriClientMetadata != 0;
}

- (void)setSiriClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x5000u;
  objc_storeStrong((id *)&self->_siriClientMetadata, a3);
}

- (void)_readRapClientMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRapClientMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasRapClientMetadata
{
  return self->_rapClientMetadata != 0;
}

- (GEOABSecondPartyPlaceRequestClientMetaData)rapClientMetadata
{
  -[GEOABAssignmentResponse _readRapClientMetadata]((uint64_t)self);
  rapClientMetadata = self->_rapClientMetadata;

  return rapClientMetadata;
}

- (void)setRapClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x4400u;
  objc_storeStrong((id *)&self->_rapClientMetadata, a3);
}

- (BOOL)hasMapsAbClientMetadata
{
  return self->_mapsAbClientMetadata != 0;
}

- (void)setMapsAbClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x4100u;
  objc_storeStrong((id *)&self->_mapsAbClientMetadata, a3);
}

- (unint64_t)branchExpirationTtlHours
{
  return self->_branchExpirationTtlHours;
}

- (void)setBranchExpirationTtlHours:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x4001u;
  self->_branchExpirationTtlHours = a3;
}

- (void)setHasBranchExpirationTtlHours:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x4000;
}

- (BOOL)hasBranchExpirationTtlHours
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOABAssignmentResponse;
  id v4 = [(GEOABAssignmentResponse *)&v8 description];
  id v5 = [(GEOABAssignmentResponse *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOABAssignmentResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_73;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 requestGuid];
  if (v5)
  {
    if (a2) {
      objc_super v6 = @"requestGuid";
    }
    else {
      objc_super v6 = @"request_guid";
    }
    [v4 setObject:v5 forKey:v6];
  }

  if ([*(id *)(a1 + 24) count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v8 = *(id *)(a1 + 24);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v57 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          if (a2) {
            [v13 jsonRepresentation];
          }
          else {
          v14 = [v13 dictionaryRepresentation];
          }
          [v7 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"assignment"];
  }
  __int16 v15 = *(_WORD *)(a1 + 128);
  if ((v15 & 0x10) == 0)
  {
    if ((v15 & 8) == 0) {
      goto LABEL_21;
    }
LABEL_33:
    long long v24 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 124)];
    if (a2) {
      long long v25 = @"invalidatePoiCache";
    }
    else {
      long long v25 = @"invalidate_poi_cache";
    }
    [v4 setObject:v24 forKey:v25];

    if ((*(_WORD *)(a1 + 128) & 2) == 0) {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
  long long v22 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 125)];
  if (a2) {
    long long v23 = @"invalidateTileCache";
  }
  else {
    long long v23 = @"invalidate_tile_cache";
  }
  [v4 setObject:v22 forKey:v23];

  __int16 v15 = *(_WORD *)(a1 + 128);
  if ((v15 & 8) != 0) {
    goto LABEL_33;
  }
LABEL_21:
  if ((v15 & 2) != 0)
  {
LABEL_22:
    char v16 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 72)];
    if (a2) {
      char v17 = @"refreshIntervalSeconds";
    }
    else {
      char v17 = @"refresh_interval_seconds";
    }
    [v4 setObject:v16 forKey:v17];
  }
LABEL_26:
  v18 = [(id)a1 clientConfig];
  uint64_t v19 = v18;
  if (v18)
  {
    if (a2)
    {
      v20 = [v18 jsonRepresentation];
      v21 = @"clientConfig";
    }
    else
    {
      v20 = [v18 dictionaryRepresentation];
      v21 = @"client_config";
    }
    [v4 setObject:v20 forKey:v21];
  }
  v26 = [(id)a1 parsecClientMetadata];
  uint64_t v27 = v26;
  if (v26)
  {
    if (a2)
    {
      v28 = [v26 jsonRepresentation];
      v29 = @"parsecClientMetadata";
    }
    else
    {
      v28 = [v26 dictionaryRepresentation];
      v29 = @"parsec_client_metadata";
    }
    [v4 setObject:v28 forKey:v29];
  }
  v30 = [(id)a1 siriClientMetadata];
  v31 = v30;
  if (v30)
  {
    if (a2)
    {
      v32 = [v30 jsonRepresentation];
      v33 = @"siriClientMetadata";
    }
    else
    {
      v32 = [v30 dictionaryRepresentation];
      v33 = @"siri_client_metadata";
    }
    [v4 setObject:v32 forKey:v33];
  }
  v34 = [(id)a1 rapClientMetadata];
  v35 = v34;
  if (v34)
  {
    if (a2)
    {
      v36 = [v34 jsonRepresentation];
      v37 = @"rapClientMetadata";
    }
    else
    {
      v36 = [v34 dictionaryRepresentation];
      v37 = @"rap_client_metadata";
    }
    [v4 setObject:v36 forKey:v37];
  }
  v38 = [(id)a1 mapsAbClientMetadata];
  v39 = v38;
  if (v38)
  {
    if (a2)
    {
      v40 = [v38 jsonRepresentation];
      v41 = @"mapsAbClientMetadata";
    }
    else
    {
      v40 = [v38 dictionaryRepresentation];
      v41 = @"maps_ab_client_metadata";
    }
    [v4 setObject:v40 forKey:v41];
  }
  __int16 v42 = *(_WORD *)(a1 + 128);
  if (v42)
  {
    v43 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
    if (a2) {
      v44 = @"branchExpirationTtlHours";
    }
    else {
      v44 = @"branch_expiration_ttl_hours";
    }
    [v4 setObject:v43 forKey:v44];

    __int16 v42 = *(_WORD *)(a1 + 128);
  }
  if ((v42 & 4) != 0)
  {
    v45 = [NSNumber numberWithDouble:*(double *)(a1 + 104)];
    [v4 setObject:v45 forKey:@"timestamp"];
  }
  v46 = [(id)a1 sourceURL];
  if (v46) {
    [v4 setObject:v46 forKey:@"sourceURL"];
  }

  v47 = *(void **)(a1 + 16);
  if (v47)
  {
    v48 = [v47 dictionaryRepresentation];
    v49 = v48;
    if (a2)
    {
      v50 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v48, "count"));
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __53__GEOABAssignmentResponse__dictionaryRepresentation___block_invoke;
      v54[3] = &unk_1E53D8860;
      id v51 = v50;
      id v55 = v51;
      [v49 enumerateKeysAndObjectsUsingBlock:v54];
      id v52 = v51;

      v49 = v52;
    }
    [v4 setObject:v49 forKey:@"Unknown Fields"];
  }
LABEL_73:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOABAssignmentResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOABAssignmentResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOABAssignmentResponse)initWithDictionary:(id)a3
{
  return (GEOABAssignmentResponse *)-[GEOABAssignmentResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"requestGuid";
      }
      else {
        objc_super v6 = @"request_guid";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = (void *)[v7 copy];
        [a1 setRequestGuid:v8];
      }
      uint64_t v9 = [v5 objectForKeyedSubscript:@"assignment"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v56 = v5;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v57 objects:v61 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v58;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v58 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v57 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v16 = [GEOABExperimentAssignment alloc];
                if (a3) {
                  uint64_t v17 = [(GEOABExperimentAssignment *)v16 initWithJSON:v15];
                }
                else {
                  uint64_t v17 = [(GEOABExperimentAssignment *)v16 initWithDictionary:v15];
                }
                v18 = (void *)v17;
                [a1 addAssignment:v17];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v57 objects:v61 count:16];
          }
          while (v12);
        }

        id v5 = v56;
      }

      if (a3) {
        uint64_t v19 = @"invalidateTileCache";
      }
      else {
        uint64_t v19 = @"invalidate_tile_cache";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setInvalidateTileCache:", objc_msgSend(v20, "BOOLValue"));
      }

      if (a3) {
        v21 = @"invalidatePoiCache";
      }
      else {
        v21 = @"invalidate_poi_cache";
      }
      long long v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setInvalidatePoiCache:", objc_msgSend(v22, "BOOLValue"));
      }

      if (a3) {
        long long v23 = @"refreshIntervalSeconds";
      }
      else {
        long long v23 = @"refresh_interval_seconds";
      }
      long long v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRefreshIntervalSeconds:", objc_msgSend(v24, "unsignedLongLongValue"));
      }

      if (a3) {
        long long v25 = @"clientConfig";
      }
      else {
        long long v25 = @"client_config";
      }
      v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v27 = [GEOABClientConfig alloc];
        if (a3) {
          uint64_t v28 = [(GEOABClientConfig *)v27 initWithJSON:v26];
        }
        else {
          uint64_t v28 = [(GEOABClientConfig *)v27 initWithDictionary:v26];
        }
        v29 = (void *)v28;
        [a1 setClientConfig:v28];
      }
      if (a3) {
        v30 = @"parsecClientMetadata";
      }
      else {
        v30 = @"parsec_client_metadata";
      }
      v31 = [v5 objectForKeyedSubscript:v30];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v32 = [GEOABSecondPartyPlaceRequestClientMetaData alloc];
        if (a3) {
          uint64_t v33 = [(GEOABSecondPartyPlaceRequestClientMetaData *)v32 initWithJSON:v31];
        }
        else {
          uint64_t v33 = [(GEOABSecondPartyPlaceRequestClientMetaData *)v32 initWithDictionary:v31];
        }
        v34 = (void *)v33;
        [a1 setParsecClientMetadata:v33];
      }
      if (a3) {
        v35 = @"siriClientMetadata";
      }
      else {
        v35 = @"siri_client_metadata";
      }
      v36 = [v5 objectForKeyedSubscript:v35];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v37 = [GEOABSecondPartyPlaceRequestClientMetaData alloc];
        if (a3) {
          uint64_t v38 = [(GEOABSecondPartyPlaceRequestClientMetaData *)v37 initWithJSON:v36];
        }
        else {
          uint64_t v38 = [(GEOABSecondPartyPlaceRequestClientMetaData *)v37 initWithDictionary:v36];
        }
        v39 = (void *)v38;
        [a1 setSiriClientMetadata:v38];
      }
      if (a3) {
        v40 = @"rapClientMetadata";
      }
      else {
        v40 = @"rap_client_metadata";
      }
      v41 = [v5 objectForKeyedSubscript:v40];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v42 = [GEOABSecondPartyPlaceRequestClientMetaData alloc];
        if (a3) {
          uint64_t v43 = [(GEOABSecondPartyPlaceRequestClientMetaData *)v42 initWithJSON:v41];
        }
        else {
          uint64_t v43 = [(GEOABSecondPartyPlaceRequestClientMetaData *)v42 initWithDictionary:v41];
        }
        v44 = (void *)v43;
        [a1 setRapClientMetadata:v43];
      }
      if (a3) {
        v45 = @"mapsAbClientMetadata";
      }
      else {
        v45 = @"maps_ab_client_metadata";
      }
      v46 = [v5 objectForKeyedSubscript:v45];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v47 = [GEOABSecondPartyPlaceRequestClientMetaData alloc];
        if (a3) {
          uint64_t v48 = [(GEOABSecondPartyPlaceRequestClientMetaData *)v47 initWithJSON:v46];
        }
        else {
          uint64_t v48 = [(GEOABSecondPartyPlaceRequestClientMetaData *)v47 initWithDictionary:v46];
        }
        v49 = (void *)v48;
        [a1 setMapsAbClientMetadata:v48];
      }
      if (a3) {
        v50 = @"branchExpirationTtlHours";
      }
      else {
        v50 = @"branch_expiration_ttl_hours";
      }
      id v51 = [v5 objectForKeyedSubscript:v50];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setBranchExpirationTtlHours:", objc_msgSend(v51, "unsignedLongLongValue"));
      }

      id v52 = [v5 objectForKeyedSubscript:@"timestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v52 doubleValue];
        objc_msgSend(a1, "setTimestamp:");
      }

      v53 = [v5 objectForKeyedSubscript:@"sourceURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v54 = (void *)[v53 copy];
        [a1 setSourceURL:v54];
      }
    }
  }

  return a1;
}

- (GEOABAssignmentResponse)initWithJSON:(id)a3
{
  return (GEOABAssignmentResponse *)-[GEOABAssignmentResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_188_0;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_189_0;
    }
    GEOABAssignmentResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOABAssignmentResponseCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOABAssignmentResponseIsValid((char *)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOABAssignmentResponseIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v12 = self->_reader;
    objc_sync_enter(v12);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v13];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOABAssignmentResponse *)self readAll:0];
    if (self->_requestGuid) {
      PBDataWriterWriteStringField();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v6 = self->_assignments;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_clientConfig) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_parsecClientMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_siriClientMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_rapClientMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapsAbClientMetadata) {
      PBDataWriterWriteSubmessage();
    }
    __int16 v11 = (__int16)self->_flags;
    if (v11)
    {
      PBDataWriterWriteUint64Field();
      __int16 v11 = (__int16)self->_flags;
    }
    if ((v11 & 4) != 0) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_sourceURL) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }
}

- (void)copyTo:(id)a3
{
  __int16 v11 = (id *)a3;
  [(GEOABAssignmentResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 28) = self->_readerMarkPos;
  *((_DWORD *)v11 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_requestGuid) {
    objc_msgSend(v11, "setRequestGuid:");
  }
  if ([(GEOABAssignmentResponse *)self assignmentsCount])
  {
    [v11 clearAssignments];
    unint64_t v4 = [(GEOABAssignmentResponse *)self assignmentsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOABAssignmentResponse *)self assignmentAtIndex:i];
        [v11 addAssignment:v7];
      }
    }
  }
  __int16 flags = (__int16)self->_flags;
  uint64_t v9 = v11;
  if ((flags & 0x10) != 0)
  {
    *((unsigned char *)v11 + 125) = self->_invalidateTileCache;
    *((_WORD *)v11 + 64) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_9:
      if ((flags & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_9;
  }
  *((unsigned char *)v11 + 124) = self->_invalidatePoiCache;
  *((_WORD *)v11 + 64) |= 8u;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
LABEL_10:
    v11[9] = self->_refreshIntervalSeconds;
    *((_WORD *)v11 + 64) |= 2u;
  }
LABEL_11:
  if (self->_clientConfig)
  {
    objc_msgSend(v11, "setClientConfig:");
    uint64_t v9 = v11;
  }
  if (self->_parsecClientMetadata)
  {
    objc_msgSend(v11, "setParsecClientMetadata:");
    uint64_t v9 = v11;
  }
  if (self->_siriClientMetadata)
  {
    objc_msgSend(v11, "setSiriClientMetadata:");
    uint64_t v9 = v11;
  }
  if (self->_rapClientMetadata)
  {
    objc_msgSend(v11, "setRapClientMetadata:");
    uint64_t v9 = v11;
  }
  if (self->_mapsAbClientMetadata)
  {
    objc_msgSend(v11, "setMapsAbClientMetadata:");
    uint64_t v9 = v11;
  }
  __int16 v10 = (__int16)self->_flags;
  if (v10)
  {
    v9[4] = self->_branchExpirationTtlHours;
    *((_WORD *)v9 + 64) |= 1u;
    __int16 v10 = (__int16)self->_flags;
  }
  if ((v10 & 4) != 0)
  {
    v9[13] = *(id *)&self->_timestamp;
    *((_WORD *)v9 + 64) |= 4u;
  }
  if (self->_sourceURL)
  {
    objc_msgSend(v11, "setSourceURL:");
    uint64_t v9 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x4000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOABAssignmentResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOABAssignmentResponse *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_requestGuid copyWithZone:a3];
  __int16 v10 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v9;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  __int16 v11 = self->_assignments;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "copyWithZone:", a3, (void)v32);
        [(id)v5 addAssignment:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v12);
  }

  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
    if ((flags & 8) == 0) {
      goto LABEL_14;
    }
LABEL_23:
    *(unsigned char *)(v5 + 124) = self->_invalidatePoiCache;
    *(_WORD *)(v5 + 128) |= 8u;
    if ((*(_WORD *)&self->_flags & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  *(unsigned char *)(v5 + 125) = self->_invalidateTileCache;
  *(_WORD *)(v5 + 128) |= 0x10u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_23;
  }
LABEL_14:
  if ((flags & 2) != 0)
  {
LABEL_15:
    *(void *)(v5 + 72) = self->_refreshIntervalSeconds;
    *(_WORD *)(v5 + 128) |= 2u;
  }
LABEL_16:
  id v17 = -[GEOABClientConfig copyWithZone:](self->_clientConfig, "copyWithZone:", a3, (void)v32);
  v18 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v17;

  id v19 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_parsecClientMetadata copyWithZone:a3];
  v20 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v19;

  id v21 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_siriClientMetadata copyWithZone:a3];
  long long v22 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v21;

  id v23 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_rapClientMetadata copyWithZone:a3];
  long long v24 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v23;

  id v25 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_mapsAbClientMetadata copyWithZone:a3];
  v26 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v25;

  __int16 v27 = (__int16)self->_flags;
  if (v27)
  {
    *(void *)(v5 + 32) = self->_branchExpirationTtlHours;
    *(_WORD *)(v5 + 128) |= 1u;
    __int16 v27 = (__int16)self->_flags;
  }
  if ((v27 & 4) != 0)
  {
    *(double *)(v5 + 104) = self->_timestamp;
    *(_WORD *)(v5 + 128) |= 4u;
  }
  uint64_t v28 = [(NSString *)self->_sourceURL copyWithZone:a3];
  v29 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v28;

  v30 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v30;
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  [(GEOABAssignmentResponse *)self readAll:1];
  [v4 readAll:1];
  requestGuid = self->_requestGuid;
  if ((unint64_t)requestGuid | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](requestGuid, "isEqual:")) {
      goto LABEL_49;
    }
  }
  assignments = self->_assignments;
  if ((unint64_t)assignments | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](assignments, "isEqual:")) {
      goto LABEL_49;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v8 = *((_WORD *)v4 + 64);
  if ((flags & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0) {
      goto LABEL_49;
    }
    if (self->_invalidateTileCache)
    {
      if (!*((unsigned char *)v4 + 125)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 125))
    {
      goto LABEL_49;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 8) != 0)
  {
    if ((v8 & 8) != 0)
    {
      if (self->_invalidatePoiCache)
      {
        if (!*((unsigned char *)v4 + 124)) {
          goto LABEL_49;
        }
        goto LABEL_22;
      }
      if (!*((unsigned char *)v4 + 124)) {
        goto LABEL_22;
      }
    }
LABEL_49:
    char v17 = 0;
    goto LABEL_50;
  }
  if ((v8 & 8) != 0) {
    goto LABEL_49;
  }
LABEL_22:
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_refreshIntervalSeconds != *((void *)v4 + 9)) {
      goto LABEL_49;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_49;
  }
  clientConfig = self->_clientConfig;
  if ((unint64_t)clientConfig | *((void *)v4 + 5) && !-[GEOABClientConfig isEqual:](clientConfig, "isEqual:")) {
    goto LABEL_49;
  }
  parsecClientMetadata = self->_parsecClientMetadata;
  if ((unint64_t)parsecClientMetadata | *((void *)v4 + 7))
  {
    if (!-[GEOABSecondPartyPlaceRequestClientMetaData isEqual:](parsecClientMetadata, "isEqual:")) {
      goto LABEL_49;
    }
  }
  siriClientMetadata = self->_siriClientMetadata;
  if ((unint64_t)siriClientMetadata | *((void *)v4 + 11))
  {
    if (!-[GEOABSecondPartyPlaceRequestClientMetaData isEqual:](siriClientMetadata, "isEqual:")) {
      goto LABEL_49;
    }
  }
  rapClientMetadata = self->_rapClientMetadata;
  if ((unint64_t)rapClientMetadata | *((void *)v4 + 8))
  {
    if (!-[GEOABSecondPartyPlaceRequestClientMetaData isEqual:](rapClientMetadata, "isEqual:")) {
      goto LABEL_49;
    }
  }
  mapsAbClientMetadata = self->_mapsAbClientMetadata;
  if ((unint64_t)mapsAbClientMetadata | *((void *)v4 + 6))
  {
    if (!-[GEOABSecondPartyPlaceRequestClientMetaData isEqual:](mapsAbClientMetadata, "isEqual:")) {
      goto LABEL_49;
    }
  }
  __int16 v14 = (__int16)self->_flags;
  __int16 v15 = *((_WORD *)v4 + 64);
  if (v14)
  {
    if ((v15 & 1) == 0 || self->_branchExpirationTtlHours != *((void *)v4 + 4)) {
      goto LABEL_49;
    }
  }
  else if (v15)
  {
    goto LABEL_49;
  }
  if ((v14 & 4) != 0)
  {
    if ((v15 & 4) == 0 || self->_timestamp != *((double *)v4 + 13)) {
      goto LABEL_49;
    }
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_49;
  }
  sourceURL = self->_sourceURL;
  if ((unint64_t)sourceURL | *((void *)v4 + 12)) {
    char v17 = -[NSString isEqual:](sourceURL, "isEqual:");
  }
  else {
    char v17 = 1;
  }
LABEL_50:

  return v17;
}

- (unint64_t)hash
{
  [(GEOABAssignmentResponse *)self readAll:1];
  NSUInteger v21 = [(NSString *)self->_requestGuid hash];
  uint64_t v20 = [(NSMutableArray *)self->_assignments hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
    uint64_t v19 = 0;
    if ((flags & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v19 = 2654435761 * self->_invalidateTileCache;
  if ((flags & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_invalidatePoiCache;
  if ((flags & 2) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_refreshIntervalSeconds;
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v5 = 0;
LABEL_8:
  unint64_t v6 = [(GEOABClientConfig *)self->_clientConfig hash];
  unint64_t v7 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_parsecClientMetadata hash];
  unint64_t v8 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_siriClientMetadata hash];
  unint64_t v9 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_rapClientMetadata hash];
  unint64_t v10 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_mapsAbClientMetadata hash];
  __int16 v11 = (__int16)self->_flags;
  if (v11)
  {
    unint64_t v12 = 2654435761u * self->_branchExpirationTtlHours;
    if ((v11 & 4) != 0) {
      goto LABEL_10;
    }
LABEL_15:
    unint64_t v17 = 0;
    return v20 ^ v21 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v17 ^ [(NSString *)self->_sourceURL hash];
  }
  unint64_t v12 = 0;
  if ((v11 & 4) == 0) {
    goto LABEL_15;
  }
LABEL_10:
  double timestamp = self->_timestamp;
  double v14 = -timestamp;
  if (timestamp >= 0.0) {
    double v14 = self->_timestamp;
  }
  long double v15 = floor(v14 + 0.5);
  double v16 = (v14 - v15) * 1.84467441e19;
  unint64_t v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0) {
      v17 += (unint64_t)v16;
    }
  }
  else
  {
    v17 -= (unint64_t)fabs(v16);
  }
  return v20 ^ v21 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v17 ^ [(NSString *)self->_sourceURL hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 10)) {
    -[GEOABAssignmentResponse setRequestGuid:](self, "setRequestGuid:");
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOABAssignmentResponse addAssignment:](self, "addAssignment:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  __int16 v10 = *((_WORD *)v4 + 64);
  if ((v10 & 0x10) != 0)
  {
    self->_invalidateTileCache = *((unsigned char *)v4 + 125);
    *(_WORD *)&self->_flags |= 0x10u;
    __int16 v10 = *((_WORD *)v4 + 64);
    if ((v10 & 8) == 0)
    {
LABEL_12:
      if ((v10 & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((v10 & 8) == 0)
  {
    goto LABEL_12;
  }
  self->_invalidatePoiCache = *((unsigned char *)v4 + 124);
  *(_WORD *)&self->_flags |= 8u;
  if ((*((_WORD *)v4 + 64) & 2) != 0)
  {
LABEL_13:
    self->_refreshIntervalSeconds = *((void *)v4 + 9);
    *(_WORD *)&self->_flags |= 2u;
  }
LABEL_14:
  clientConfig = self->_clientConfig;
  uint64_t v12 = *((void *)v4 + 5);
  if (clientConfig)
  {
    if (v12) {
      -[GEOABClientConfig mergeFrom:](clientConfig, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[GEOABAssignmentResponse setClientConfig:](self, "setClientConfig:");
  }
  parsecClientMetadata = self->_parsecClientMetadata;
  uint64_t v14 = *((void *)v4 + 7);
  if (parsecClientMetadata)
  {
    if (v14) {
      -[GEOABSecondPartyPlaceRequestClientMetaData mergeFrom:](parsecClientMetadata, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[GEOABAssignmentResponse setParsecClientMetadata:](self, "setParsecClientMetadata:");
  }
  siriClientMetadata = self->_siriClientMetadata;
  uint64_t v16 = *((void *)v4 + 11);
  if (siriClientMetadata)
  {
    if (v16) {
      -[GEOABSecondPartyPlaceRequestClientMetaData mergeFrom:](siriClientMetadata, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[GEOABAssignmentResponse setSiriClientMetadata:](self, "setSiriClientMetadata:");
  }
  rapClientMetadata = self->_rapClientMetadata;
  uint64_t v18 = *((void *)v4 + 8);
  if (rapClientMetadata)
  {
    if (v18) {
      -[GEOABSecondPartyPlaceRequestClientMetaData mergeFrom:](rapClientMetadata, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[GEOABAssignmentResponse setRapClientMetadata:](self, "setRapClientMetadata:");
  }
  mapsAbClientMetadata = self->_mapsAbClientMetadata;
  uint64_t v20 = *((void *)v4 + 6);
  if (mapsAbClientMetadata)
  {
    if (v20) {
      -[GEOABSecondPartyPlaceRequestClientMetaData mergeFrom:](mapsAbClientMetadata, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[GEOABAssignmentResponse setMapsAbClientMetadata:](self, "setMapsAbClientMetadata:");
  }
  __int16 v21 = *((_WORD *)v4 + 64);
  if (v21)
  {
    self->_branchExpirationTtlHours = *((void *)v4 + 4);
    *(_WORD *)&self->_flags |= 1u;
    __int16 v21 = *((_WORD *)v4 + 64);
  }
  if ((v21 & 4) != 0)
  {
    self->_double timestamp = *((double *)v4 + 13);
    *(_WORD *)&self->_flags |= 4u;
  }
  if (*((void *)v4 + 12)) {
    -[GEOABAssignmentResponse setSourceURL:](self, "setSourceURL:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOABAssignmentResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_193_0);
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
  *(_WORD *)&self->_flags |= 0x4020u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOABAssignmentResponse *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_assignments;
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

    [(GEOABClientConfig *)self->_clientConfig clearUnknownFields:1];
    [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_parsecClientMetadata clearUnknownFields:1];
    [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_siriClientMetadata clearUnknownFields:1];
    [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_rapClientMetadata clearUnknownFields:1];
    [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_mapsAbClientMetadata clearUnknownFields:1];
  }
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x4004u;
  self->_double timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16388;
  }
  else {
    __int16 v3 = 0x4000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readSourceURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSourceURL_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasSourceURL
{
  return self->_sourceURL != 0;
}

- (NSString)sourceURL
{
  -[GEOABAssignmentResponse _readSourceURL]((uint64_t)self);
  sourceURL = self->_sourceURL;

  return sourceURL;
}

- (void)setSourceURL:(id)a3
{
  *(_WORD *)&self->_flags |= 0x6000u;
  objc_storeStrong((id *)&self->_sourceURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_siriClientMetadata, 0);
  objc_storeStrong((id *)&self->_requestGuid, 0);
  objc_storeStrong((id *)&self->_rapClientMetadata, 0);
  objc_storeStrong((id *)&self->_parsecClientMetadata, 0);
  objc_storeStrong((id *)&self->_mapsAbClientMetadata, 0);
  objc_storeStrong((id *)&self->_clientConfig, 0);
  objc_storeStrong((id *)&self->_assignments, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end