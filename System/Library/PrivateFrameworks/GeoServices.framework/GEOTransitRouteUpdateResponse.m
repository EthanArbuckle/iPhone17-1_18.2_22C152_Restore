@interface GEOTransitRouteUpdateResponse
+ (BOOL)isValid:(id)a3;
+ (Class)routeUpdateType;
- (BOOL)hasDatasetAbStatus;
- (BOOL)hasResponseId;
- (BOOL)hasRouteUpdateConfiguration;
- (BOOL)hasStatus;
- (BOOL)hasTimepointUsed;
- (BOOL)hasTransitDataVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDDatasetABStatus)datasetAbStatus;
- (GEOTimepoint)timepointUsed;
- (GEOTransitRouteUpdateConfiguration)routeUpdateConfiguration;
- (GEOTransitRouteUpdateResponse)init;
- (GEOTransitRouteUpdateResponse)initWithData:(id)a3;
- (GEOTransitRouteUpdateResponse)initWithDictionary:(id)a3;
- (GEOTransitRouteUpdateResponse)initWithJSON:(id)a3;
- (NSData)responseId;
- (NSMutableArray)routeUpdates;
- (NSString)transitDataVersion;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)routeUpdateAtIndex:(unint64_t)a3;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (unint64_t)routeUpdatesCount;
- (void)_addNoFlagsRouteUpdate:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDatasetAbStatus;
- (void)_readResponseId;
- (void)_readRouteUpdateConfiguration;
- (void)_readRouteUpdates;
- (void)_readTransitDataVersion;
- (void)addRouteUpdate:(id)a3;
- (void)clearRouteUpdates;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDatasetAbStatus:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasTimepointUsed:(BOOL)a3;
- (void)setResponseId:(id)a3;
- (void)setRouteUpdateConfiguration:(id)a3;
- (void)setRouteUpdates:(id)a3;
- (void)setStatus:(int)a3;
- (void)setTimepointUsed:(GEOTimepoint *)a3;
- (void)setTransitDataVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitRouteUpdateResponse

- (GEOTransitRouteUpdateResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitRouteUpdateResponse;
  v2 = [(GEOTransitRouteUpdateResponse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitRouteUpdateResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitRouteUpdateResponse;
  v3 = [(GEOTransitRouteUpdateResponse *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRouteUpdates
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteUpdates_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (NSMutableArray)routeUpdates
{
  -[GEOTransitRouteUpdateResponse _readRouteUpdates]((uint64_t)self);
  routeUpdates = self->_routeUpdates;

  return routeUpdates;
}

- (void)setRouteUpdates:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  routeUpdates = self->_routeUpdates;
  self->_routeUpdates = v4;
}

- (void)clearRouteUpdates
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  routeUpdates = self->_routeUpdates;

  [(NSMutableArray *)routeUpdates removeAllObjects];
}

- (void)addRouteUpdate:(id)a3
{
  id v4 = a3;
  -[GEOTransitRouteUpdateResponse _readRouteUpdates]((uint64_t)self);
  -[GEOTransitRouteUpdateResponse _addNoFlagsRouteUpdate:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsRouteUpdate:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)routeUpdatesCount
{
  -[GEOTransitRouteUpdateResponse _readRouteUpdates]((uint64_t)self);
  routeUpdates = self->_routeUpdates;

  return [(NSMutableArray *)routeUpdates count];
}

- (id)routeUpdateAtIndex:(unint64_t)a3
{
  -[GEOTransitRouteUpdateResponse _readRouteUpdates]((uint64_t)self);
  routeUpdates = self->_routeUpdates;

  return (id)[(NSMutableArray *)routeUpdates objectAtIndex:a3];
}

+ (Class)routeUpdateType
{
  return (Class)objc_opt_class();
}

- (void)_readResponseId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResponseId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasResponseId
{
  return self->_responseId != 0;
}

- (NSData)responseId
{
  -[GEOTransitRouteUpdateResponse _readResponseId]((uint64_t)self);
  responseId = self->_responseId;

  return responseId;
}

- (void)setResponseId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_responseId, a3);
}

- (int)status
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 258;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasStatus
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 <= 29)
  {
    id v4 = @"STATUS_SUCCESS";
    switch(a3)
    {
      case 0:
        goto LABEL_22;
      case 1:
        id v4 = @"STATUS_FAILED";
        break;
      case 2:
        id v4 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_21;
      case 5:
        id v4 = @"INVALID_REQUEST";
        break;
      default:
        if (a3 != 20) {
          goto LABEL_21;
        }
        id v4 = @"FAILED_NO_RESULT";
        break;
    }
    return v4;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      id v4 = @"STATUS_DEDUPED";
    }
    else
    {
      if (a3 != 60) {
        goto LABEL_21;
      }
      id v4 = @"VERSION_MISMATCH";
    }
  }
  else
  {
    if (a3 != 30)
    {
      if (a3 == 40)
      {
        id v4 = @"FAILED_NOT_AUTHORIZED";
        return v4;
      }
LABEL_21:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      return v4;
    }
    id v4 = @"NEEDS_REFINEMENT";
  }
  return v4;
}

- (int)StringAsStatus:(id)a3
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

- (void)_readDatasetAbStatus
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDatasetAbStatus_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasDatasetAbStatus
{
  return self->_datasetAbStatus != 0;
}

- (GEOPDDatasetABStatus)datasetAbStatus
{
  -[GEOTransitRouteUpdateResponse _readDatasetAbStatus]((uint64_t)self);
  datasetAbStatus = self->_datasetAbStatus;

  return datasetAbStatus;
}

- (void)setDatasetAbStatus:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_datasetAbStatus, a3);
}

- (void)_readRouteUpdateConfiguration
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteUpdateConfiguration_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasRouteUpdateConfiguration
{
  return self->_routeUpdateConfiguration != 0;
}

- (GEOTransitRouteUpdateConfiguration)routeUpdateConfiguration
{
  -[GEOTransitRouteUpdateResponse _readRouteUpdateConfiguration]((uint64_t)self);
  routeUpdateConfiguration = self->_routeUpdateConfiguration;

  return routeUpdateConfiguration;
}

- (void)setRouteUpdateConfiguration:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_routeUpdateConfiguration, a3);
}

- (GEOTimepoint)timepointUsed
{
  *retstr = self[1];
  return self;
}

- (void)setTimepointUsed:(GEOTimepoint *)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  uint64_t v3 = *(void *)&a3->_type;
  *(_OWORD *)&self->_timepointUsed._currentUserTime = *(_OWORD *)&a3->_currentUserTime;
  *(void *)&self->_timepointUsed._type = v3;
}

- (void)setHasTimepointUsed:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasTimepointUsed
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readTransitDataVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitDataVersion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasTransitDataVersion
{
  return self->_transitDataVersion != 0;
}

- (NSString)transitDataVersion
{
  -[GEOTransitRouteUpdateResponse _readTransitDataVersion]((uint64_t)self);
  transitDataVersion = self->_transitDataVersion;

  return transitDataVersion;
}

- (void)setTransitDataVersion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_transitDataVersion, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitRouteUpdateResponse;
  int v4 = [(GEOTransitRouteUpdateResponse *)&v8 description];
  id v5 = [(GEOTransitRouteUpdateResponse *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitRouteUpdateResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_64;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([*(id *)(a1 + 72) count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v6 = *(id *)(a1 + 72);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v44 count:16];
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
        uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v8);
    }

    if (a2) {
      v13 = @"routeUpdate";
    }
    else {
      v13 = @"route_update";
    }
    [v4 setObject:v5 forKey:v13];
  }
  v14 = [(id)a1 responseId];
  v15 = v14;
  if (v14)
  {
    if (a2)
    {
      v16 = [v14 base64EncodedStringWithOptions:0];
      [v4 setObject:v16 forKey:@"responseId"];
    }
    else
    {
      [v4 setObject:v14 forKey:@"response_id"];
    }
  }

  if ((*(_WORD *)(a1 + 104) & 2) != 0)
  {
    int v17 = *(_DWORD *)(a1 + 100);
    if (v17 <= 29)
    {
      v18 = @"STATUS_SUCCESS";
      switch(v17)
      {
        case 0:
          goto LABEL_39;
        case 1:
          v18 = @"STATUS_FAILED";
          break;
        case 2:
          v18 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_34;
        case 5:
          v18 = @"INVALID_REQUEST";
          break;
        default:
          if (v17 != 20) {
            goto LABEL_34;
          }
          v18 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_39;
    }
    if (v17 > 49)
    {
      if (v17 == 50)
      {
        v18 = @"STATUS_DEDUPED";
        goto LABEL_39;
      }
      if (v17 == 60)
      {
        v18 = @"VERSION_MISMATCH";
        goto LABEL_39;
      }
    }
    else
    {
      if (v17 == 30)
      {
        v18 = @"NEEDS_REFINEMENT";
        goto LABEL_39;
      }
      if (v17 == 40)
      {
        v18 = @"FAILED_NOT_AUTHORIZED";
LABEL_39:
        [v4 setObject:v18 forKey:@"status"];

        goto LABEL_40;
      }
    }
LABEL_34:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 100));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
LABEL_40:
  v19 = [(id)a1 datasetAbStatus];
  v20 = v19;
  if (v19)
  {
    if (a2)
    {
      v21 = [v19 jsonRepresentation];
      v22 = @"datasetAbStatus";
    }
    else
    {
      v21 = [v19 dictionaryRepresentation];
      v22 = @"dataset_ab_status";
    }
    [v4 setObject:v21 forKey:v22];
  }
  v23 = [(id)a1 routeUpdateConfiguration];
  v24 = v23;
  if (v23)
  {
    if (a2)
    {
      v25 = [v23 jsonRepresentation];
      v26 = @"routeUpdateConfiguration";
    }
    else
    {
      v25 = [v23 dictionaryRepresentation];
      v26 = @"route_update_configuration";
    }
    [v4 setObject:v25 forKey:v26];
  }
  if (*(_WORD *)(a1 + 104))
  {
    if (a2) {
      v27 = @"timepointUsed";
    }
    else {
      v27 = @"timepoint_used";
    }
    v28 = _GEOTimepointDictionaryRepresentation(a1 + 24, a2);
    [v4 setObject:v28 forKey:v27];
  }
  v29 = [(id)a1 transitDataVersion];
  if (v29)
  {
    if (a2) {
      v30 = @"transitDataVersion";
    }
    else {
      v30 = @"transit_data_version";
    }
    [v4 setObject:v29 forKey:v30];
  }

  v31 = *(void **)(a1 + 16);
  if (v31)
  {
    v32 = [v31 dictionaryRepresentation];
    v33 = v32;
    if (a2)
    {
      v34 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __59__GEOTransitRouteUpdateResponse__dictionaryRepresentation___block_invoke;
      v38[3] = &unk_1E53D8860;
      id v35 = v34;
      id v39 = v35;
      [v33 enumerateKeysAndObjectsUsingBlock:v38];
      id v36 = v35;

      v33 = v36;
    }
    [v4 setObject:v33 forKey:@"Unknown Fields"];
  }
LABEL_64:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitRouteUpdateResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOTransitRouteUpdateResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitRouteUpdateResponse)initWithDictionary:(id)a3
{
  return (GEOTransitRouteUpdateResponse *)-[GEOTransitRouteUpdateResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_76;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_76;
  }
  if (a3) {
    id v6 = @"routeUpdate";
  }
  else {
    id v6 = @"route_update";
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v39 = v5;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v45 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v14 = [GEOTransitRouteUpdate alloc];
            if (a3) {
              uint64_t v15 = [(GEOTransitRouteUpdate *)v14 initWithJSON:v13];
            }
            else {
              uint64_t v15 = [(GEOTransitRouteUpdate *)v14 initWithDictionary:v13];
            }
            v16 = (void *)v15;
            [a1 addRouteUpdate:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v10);
    }

    id v5 = v39;
  }

  if (a3) {
    int v17 = @"responseId";
  }
  else {
    int v17 = @"response_id";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v18 options:0];
    [a1 setResponseId:v19];
  }
  v20 = [v5 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v20;
    if ([v21 isEqualToString:@"STATUS_SUCCESS"])
    {
      uint64_t v22 = 0;
    }
    else if ([v21 isEqualToString:@"STATUS_FAILED"])
    {
      uint64_t v22 = 1;
    }
    else if ([v21 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      uint64_t v22 = 2;
    }
    else if ([v21 isEqualToString:@"INVALID_REQUEST"])
    {
      uint64_t v22 = 5;
    }
    else if ([v21 isEqualToString:@"FAILED_NO_RESULT"])
    {
      uint64_t v22 = 20;
    }
    else if ([v21 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      uint64_t v22 = 30;
    }
    else if ([v21 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      uint64_t v22 = 40;
    }
    else if ([v21 isEqualToString:@"STATUS_DEDUPED"])
    {
      uint64_t v22 = 50;
    }
    else if ([v21 isEqualToString:@"VERSION_MISMATCH"])
    {
      uint64_t v22 = 60;
    }
    else
    {
      uint64_t v22 = 0;
    }

    goto LABEL_48;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v22 = [v20 intValue];
LABEL_48:
    [a1 setStatus:v22];
  }

  if (a3) {
    v23 = @"datasetAbStatus";
  }
  else {
    v23 = @"dataset_ab_status";
  }
  v24 = [v5 objectForKeyedSubscript:v23];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = [GEOPDDatasetABStatus alloc];
    if (a3) {
      uint64_t v26 = [(GEOPDDatasetABStatus *)v25 initWithJSON:v24];
    }
    else {
      uint64_t v26 = [(GEOPDDatasetABStatus *)v25 initWithDictionary:v24];
    }
    v27 = (void *)v26;
    [a1 setDatasetAbStatus:v26];
  }
  if (a3) {
    v28 = @"routeUpdateConfiguration";
  }
  else {
    v28 = @"route_update_configuration";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [GEOTransitRouteUpdateConfiguration alloc];
    if (a3) {
      uint64_t v31 = [(GEOTransitRouteUpdateConfiguration *)v30 initWithJSON:v29];
    }
    else {
      uint64_t v31 = [(GEOTransitRouteUpdateConfiguration *)v30 initWithDictionary:v29];
    }
    v32 = (void *)v31;
    [a1 setRouteUpdateConfiguration:v31];
  }
  if (a3) {
    v33 = @"timepointUsed";
  }
  else {
    v33 = @"timepoint_used";
  }
  v34 = [v5 objectForKeyedSubscript:v33];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v42 = 0uLL;
    uint64_t v43 = 0;
    _GEOTimepointFromDictionaryRepresentation(v34, (uint64_t)&v42, a3);
    long long v40 = v42;
    uint64_t v41 = v43;
    [a1 setTimepointUsed:&v40];
  }

  if (a3) {
    id v35 = @"transitDataVersion";
  }
  else {
    id v35 = @"transit_data_version";
  }
  id v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v37 = (void *)[v36 copy];
    [a1 setTransitDataVersion:v37];
  }
LABEL_76:

  return a1;
}

- (GEOTransitRouteUpdateResponse)initWithJSON:(id)a3
{
  return (GEOTransitRouteUpdateResponse *)-[GEOTransitRouteUpdateResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_457;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_458;
    }
    GEOTransitRouteUpdateResponseReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTransitRouteUpdateResponseCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitRouteUpdateResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitRouteUpdateResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1F8) == 0))
  {
    uint64_t v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitRouteUpdateResponse *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_routeUpdates;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_responseId) {
      PBDataWriterWriteDataField();
    }
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_datasetAbStatus) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_routeUpdateConfiguration) {
      PBDataWriterWriteSubmessage();
    }
    if (*(_WORD *)&self->_flags)
    {
      PBDataWriterPlaceMark();
      GEOTimepointWriteTo((uint64_t)&self->_timepointUsed);
      PBDataWriterRecallMark();
    }
    if (self->_transitDataVersion) {
      PBDataWriterWriteStringField();
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v10 = (id *)a3;
  [(GEOTransitRouteUpdateResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 22) = self->_readerMarkPos;
  *((_DWORD *)v10 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOTransitRouteUpdateResponse *)self routeUpdatesCount])
  {
    [v10 clearRouteUpdates];
    unint64_t v4 = [(GEOTransitRouteUpdateResponse *)self routeUpdatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOTransitRouteUpdateResponse *)self routeUpdateAtIndex:i];
        [v10 addRouteUpdate:v7];
      }
    }
  }
  if (self->_responseId) {
    objc_msgSend(v10, "setResponseId:");
  }
  uint64_t v8 = v10;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v10 + 25) = self->_status;
    *((_WORD *)v10 + 52) |= 2u;
  }
  if (self->_datasetAbStatus)
  {
    objc_msgSend(v10, "setDatasetAbStatus:");
    uint64_t v8 = v10;
  }
  if (self->_routeUpdateConfiguration)
  {
    objc_msgSend(v10, "setRouteUpdateConfiguration:");
    uint64_t v8 = v10;
  }
  if (*(_WORD *)&self->_flags)
  {
    uint64_t v9 = *(void **)&self->_timepointUsed._type;
    *(_OWORD *)(v8 + 3) = *(_OWORD *)&self->_timepointUsed._currentUserTime;
    v8[5] = v9;
    *((_WORD *)v8 + 52) |= 1u;
  }
  if (self->_transitDataVersion)
  {
    objc_msgSend(v10, "setTransitDataVersion:");
    uint64_t v8 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTransitRouteUpdateResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitRouteUpdateResponse *)self readAll:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = self->_routeUpdates;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "copyWithZone:", a3, (void)v25);
        [(id)v5 addRouteUpdate:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSData *)self->_responseId copyWithZone:a3];
  long long v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_status;
    *(_WORD *)(v5 + 104) |= 2u;
  }
  id v16 = -[GEOPDDatasetABStatus copyWithZone:](self->_datasetAbStatus, "copyWithZone:", a3, (void)v25);
  uint64_t v17 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v16;

  id v18 = [(GEOTransitRouteUpdateConfiguration *)self->_routeUpdateConfiguration copyWithZone:a3];
  v19 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v18;

  if (*(_WORD *)&self->_flags)
  {
    uint64_t v20 = *(void *)&self->_timepointUsed._type;
    *(_OWORD *)(v5 + 24) = *(_OWORD *)&self->_timepointUsed._currentUserTime;
    *(void *)(v5 + 40) = v20;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  uint64_t v21 = [(NSString *)self->_transitDataVersion copyWithZone:a3];
  uint64_t v22 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v21;

  v23 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v23;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  [(GEOTransitRouteUpdateResponse *)self readAll:1];
  [v4 readAll:1];
  routeUpdates = self->_routeUpdates;
  if ((unint64_t)routeUpdates | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](routeUpdates, "isEqual:")) {
      goto LABEL_26;
    }
  }
  responseId = self->_responseId;
  if ((unint64_t)responseId | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](responseId, "isEqual:")) {
      goto LABEL_26;
    }
  }
  __int16 v7 = *((_WORD *)v4 + 52);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_status != *((_DWORD *)v4 + 25)) {
      goto LABEL_26;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_26;
  }
  datasetAbStatus = self->_datasetAbStatus;
  if ((unint64_t)datasetAbStatus | *((void *)v4 + 6)
    && !-[GEOPDDatasetABStatus isEqual:](datasetAbStatus, "isEqual:"))
  {
    goto LABEL_26;
  }
  routeUpdateConfiguration = self->_routeUpdateConfiguration;
  if ((unint64_t)routeUpdateConfiguration | *((void *)v4 + 8))
  {
    if (!-[GEOTransitRouteUpdateConfiguration isEqual:](routeUpdateConfiguration, "isEqual:")) {
      goto LABEL_26;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 52);
  if (*(_WORD *)&self->_flags)
  {
    if ((v10 & 1) == 0) {
      goto LABEL_26;
    }
    BOOL v11 = *(void *)&self->_timepointUsed._currentUserTime == *((void *)v4 + 3)
       && *(void *)&self->_timepointUsed._time == *((void *)v4 + 4);
    if (!v11 || *(void *)&self->_timepointUsed._type != *((void *)v4 + 5)) {
      goto LABEL_26;
    }
  }
  else if (v10)
  {
LABEL_26:
    char v13 = 0;
    goto LABEL_27;
  }
  transitDataVersion = self->_transitDataVersion;
  if ((unint64_t)transitDataVersion | *((void *)v4 + 10)) {
    char v13 = -[NSString isEqual:](transitDataVersion, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_27:

  return v13;
}

- (unint64_t)hash
{
  [(GEOTransitRouteUpdateResponse *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_routeUpdates hash];
  uint64_t v4 = [(NSData *)self->_responseId hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_status;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(GEOPDDatasetABStatus *)self->_datasetAbStatus hash];
  unint64_t v7 = [(GEOTransitRouteUpdateConfiguration *)self->_routeUpdateConfiguration hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v8 = PBHashBytes();
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_transitDataVersion hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (char *)a3;
  [v4 readAll:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = *((id *)v4 + 9);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOTransitRouteUpdateResponse addRouteUpdate:](self, "addRouteUpdate:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 7)) {
    -[GEOTransitRouteUpdateResponse setResponseId:](self, "setResponseId:");
  }
  if ((*((_WORD *)v4 + 52) & 2) != 0)
  {
    self->_status = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 2u;
  }
  datasetAbStatus = self->_datasetAbStatus;
  uint64_t v11 = *((void *)v4 + 6);
  if (datasetAbStatus)
  {
    if (v11) {
      -[GEOPDDatasetABStatus mergeFrom:](datasetAbStatus, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOTransitRouteUpdateResponse setDatasetAbStatus:](self, "setDatasetAbStatus:");
  }
  routeUpdateConfiguration = self->_routeUpdateConfiguration;
  uint64_t v13 = *((void *)v4 + 8);
  if (routeUpdateConfiguration)
  {
    if (v13) {
      -[GEOTransitRouteUpdateConfiguration mergeFrom:](routeUpdateConfiguration, "mergeFrom:");
    }
  }
  else if (v13)
  {
    [(GEOTransitRouteUpdateResponse *)self setRouteUpdateConfiguration:"setRouteUpdateConfiguration:"];
  }
  if (*((_WORD *)v4 + 52))
  {
    uint64_t v14 = *((void *)v4 + 5);
    *(_OWORD *)&self->_timepointUsed._currentUserTime = *(_OWORD *)(v4 + 24);
    *(void *)&self->_timepointUsed._type = v14;
    *(_WORD *)&self->_flags |= 1u;
  }
  if (*((void *)v4 + 10)) {
    -[GEOTransitRouteUpdateResponse setTransitDataVersion:](self, "setTransitDataVersion:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOTransitRouteUpdateResponseReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_462);
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
  *(_WORD *)&self->_flags |= 0x104u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitRouteUpdateResponse *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_routeUpdates;
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

    [(GEOPDDatasetABStatus *)self->_datasetAbStatus clearUnknownFields:1];
    [(GEOTransitRouteUpdateConfiguration *)self->_routeUpdateConfiguration clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitDataVersion, 0);
  objc_storeStrong((id *)&self->_routeUpdates, 0);
  objc_storeStrong((id *)&self->_routeUpdateConfiguration, 0);
  objc_storeStrong((id *)&self->_responseId, 0);
  objc_storeStrong((id *)&self->_datasetAbStatus, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end