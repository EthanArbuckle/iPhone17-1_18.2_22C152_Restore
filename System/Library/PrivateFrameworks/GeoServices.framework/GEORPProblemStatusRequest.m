@interface GEORPProblemStatusRequest
+ (BOOL)isValid:(id)a3;
+ (Class)problemIdType;
- (BOOL)hasAbAssignmentMetadata;
- (BOOL)hasAnalyticMetadata;
- (BOOL)hasClientCapabilities;
- (BOOL)hasServicesState;
- (BOOL)hasStatusNotificationId;
- (BOOL)hasSuppressLogging;
- (BOOL)hasUserCredentials;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)suppressLogging;
- (Class)responseClass;
- (GEOABSecondPartyPlaceRequestClientMetaData)abAssignmentMetadata;
- (GEOPDAnalyticMetadata)analyticMetadata;
- (GEORPClientCapabilities)clientCapabilities;
- (GEORPProblemStatusRequest)init;
- (GEORPProblemStatusRequest)initWithData:(id)a3;
- (GEORPProblemStatusRequest)initWithDictionary:(id)a3;
- (GEORPProblemStatusRequest)initWithJSON:(id)a3;
- (GEORPUserCredentials)userCredentials;
- (GEOServicesState)servicesState;
- (NSMutableArray)problemIds;
- (NSString)statusNotificationId;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)problemIdAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)problemIdsCount;
- (unsigned)requestTypeCode;
- (void)_addNoFlagsProblemId:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAbAssignmentMetadata;
- (void)_readAnalyticMetadata;
- (void)_readClientCapabilities;
- (void)_readProblemIds;
- (void)_readServicesState;
- (void)_readStatusNotificationId;
- (void)_readUserCredentials;
- (void)addProblemId:(id)a3;
- (void)clearProblemIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)populateAnalyticsMetadata;
- (void)readAll:(BOOL)a3;
- (void)setAbAssignmentMetadata:(id)a3;
- (void)setAnalyticMetadata:(id)a3;
- (void)setClientCapabilities:(id)a3;
- (void)setHasSuppressLogging:(BOOL)a3;
- (void)setProblemIds:(id)a3;
- (void)setServicesState:(id)a3;
- (void)setStatusNotificationId:(id)a3;
- (void)setSuppressLogging:(BOOL)a3;
- (void)setUserCredentials:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPProblemStatusRequest

- (GEORPProblemStatusRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPProblemStatusRequest;
  v2 = [(GEORPProblemStatusRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPProblemStatusRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPProblemStatusRequest;
  v3 = [(GEORPProblemStatusRequest *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readUserCredentials
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserCredentials_tags_2985);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasUserCredentials
{
  return self->_userCredentials != 0;
}

- (GEORPUserCredentials)userCredentials
{
  -[GEORPProblemStatusRequest _readUserCredentials]((uint64_t)self);
  userCredentials = self->_userCredentials;

  return userCredentials;
}

- (void)setUserCredentials:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_userCredentials, a3);
}

- (void)_readStatusNotificationId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStatusNotificationId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasStatusNotificationId
{
  return self->_statusNotificationId != 0;
}

- (NSString)statusNotificationId
{
  -[GEORPProblemStatusRequest _readStatusNotificationId]((uint64_t)self);
  statusNotificationId = self->_statusNotificationId;

  return statusNotificationId;
}

- (void)setStatusNotificationId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_statusNotificationId, a3);
}

- (void)_readProblemIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)problemIds
{
  -[GEORPProblemStatusRequest _readProblemIds]((uint64_t)self);
  problemIds = self->_problemIds;

  return problemIds;
}

- (void)setProblemIds:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  problemIds = self->_problemIds;
  self->_problemIds = v4;
}

- (void)clearProblemIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  problemIds = self->_problemIds;

  [(NSMutableArray *)problemIds removeAllObjects];
}

- (void)addProblemId:(id)a3
{
  id v4 = a3;
  -[GEORPProblemStatusRequest _readProblemIds]((uint64_t)self);
  -[GEORPProblemStatusRequest _addNoFlagsProblemId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsProblemId:(uint64_t)a1
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

- (unint64_t)problemIdsCount
{
  -[GEORPProblemStatusRequest _readProblemIds]((uint64_t)self);
  problemIds = self->_problemIds;

  return [(NSMutableArray *)problemIds count];
}

- (id)problemIdAtIndex:(unint64_t)a3
{
  -[GEORPProblemStatusRequest _readProblemIds]((uint64_t)self);
  problemIds = self->_problemIds;

  return (id)[(NSMutableArray *)problemIds objectAtIndex:a3];
}

+ (Class)problemIdType
{
  return (Class)objc_opt_class();
}

- (void)_readClientCapabilities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientCapabilities_tags_2986);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasClientCapabilities
{
  return self->_clientCapabilities != 0;
}

- (GEORPClientCapabilities)clientCapabilities
{
  -[GEORPProblemStatusRequest _readClientCapabilities]((uint64_t)self);
  clientCapabilities = self->_clientCapabilities;

  return clientCapabilities;
}

- (void)setClientCapabilities:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_clientCapabilities, a3);
}

- (void)_readAnalyticMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnalyticMetadata_tags_2987);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasAnalyticMetadata
{
  return self->_analyticMetadata != 0;
}

- (GEOPDAnalyticMetadata)analyticMetadata
{
  -[GEORPProblemStatusRequest _readAnalyticMetadata]((uint64_t)self);
  analyticMetadata = self->_analyticMetadata;

  return analyticMetadata;
}

- (void)setAnalyticMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  objc_storeStrong((id *)&self->_analyticMetadata, a3);
}

- (void)_readAbAssignmentMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbAssignmentMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasAbAssignmentMetadata
{
  return self->_abAssignmentMetadata != 0;
}

- (GEOABSecondPartyPlaceRequestClientMetaData)abAssignmentMetadata
{
  -[GEORPProblemStatusRequest _readAbAssignmentMetadata]((uint64_t)self);
  abAssignmentMetadata = self->_abAssignmentMetadata;

  return abAssignmentMetadata;
}

- (void)setAbAssignmentMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  objc_storeStrong((id *)&self->_abAssignmentMetadata, a3);
}

- (void)_readServicesState
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServicesState_tags_2988);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasServicesState
{
  return self->_servicesState != 0;
}

- (GEOServicesState)servicesState
{
  -[GEORPProblemStatusRequest _readServicesState]((uint64_t)self);
  servicesState = self->_servicesState;

  return servicesState;
}

- (void)setServicesState:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_servicesState, a3);
}

- (BOOL)suppressLogging
{
  return self->_suppressLogging;
}

- (void)setSuppressLogging:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_suppressLogging = a3;
}

- (void)setHasSuppressLogging:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasSuppressLogging
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPProblemStatusRequest;
  id v4 = [(GEORPProblemStatusRequest *)&v8 description];
  id v5 = [(GEORPProblemStatusRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemStatusRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 userCredentials];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"userCredentials";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"user_credentials";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 statusNotificationId];
    if (v9)
    {
      if (a2) {
        v10 = @"statusNotificationId";
      }
      else {
        v10 = @"status_notification_id";
      }
      [v4 setObject:v9 forKey:v10];
    }

    if (*(void *)(a1 + 40))
    {
      v11 = [(id)a1 problemIds];
      if (a2) {
        v12 = @"problemId";
      }
      else {
        v12 = @"problem_id";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [(id)a1 clientCapabilities];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"clientCapabilities";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"client_capabilities";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = [(id)a1 analyticMetadata];
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"analyticMetadata";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"analytic_metadata";
      }
      [v4 setObject:v19 forKey:v20];
    }
    v21 = [(id)a1 abAssignmentMetadata];
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 jsonRepresentation];
        v24 = @"abAssignmentMetadata";
      }
      else
      {
        v23 = [v21 dictionaryRepresentation];
        v24 = @"ab_assignment_metadata";
      }
      [v4 setObject:v23 forKey:v24];
    }
    v25 = [(id)a1 servicesState];
    v26 = v25;
    if (v25)
    {
      if (a2)
      {
        v27 = [v25 jsonRepresentation];
        v28 = @"servicesState";
      }
      else
      {
        v27 = [v25 dictionaryRepresentation];
        v28 = @"services_state";
      }
      [v4 setObject:v27 forKey:v28];
    }
    if (*(_WORD *)(a1 + 88))
    {
      v29 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 84)];
      if (a2) {
        v30 = @"suppressLogging";
      }
      else {
        v30 = @"suppress_logging";
      }
      [v4 setObject:v29 forKey:v30];
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
  return -[GEORPProblemStatusRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPProblemStatusRequest)initWithDictionary:(id)a3
{
  return (GEORPProblemStatusRequest *)-[GEORPProblemStatusRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"userCredentials";
      }
      else {
        objc_super v6 = @"user_credentials";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEORPUserCredentials alloc];
        if (a3) {
          uint64_t v9 = [(GEORPUserCredentials *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEORPUserCredentials *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setUserCredentials:v9];
      }
      if (a3) {
        v11 = @"statusNotificationId";
      }
      else {
        v11 = @"status_notification_id";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = (void *)[v12 copy];
        [a1 setStatusNotificationId:v13];
      }
      if (a3) {
        v14 = @"problemId";
      }
      else {
        v14 = @"problem_id";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v47 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v22 = objc_msgSend(v21, "copy", (void)v46);
                [a1 addProblemId:v22];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v46 objects:v50 count:16];
          }
          while (v18);
        }
      }
      if (a3) {
        v23 = @"clientCapabilities";
      }
      else {
        v23 = @"client_capabilities";
      }
      v24 = objc_msgSend(v5, "objectForKeyedSubscript:", v23, (void)v46);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = [GEORPClientCapabilities alloc];
        if (a3) {
          uint64_t v26 = [(GEORPClientCapabilities *)v25 initWithJSON:v24];
        }
        else {
          uint64_t v26 = [(GEORPClientCapabilities *)v25 initWithDictionary:v24];
        }
        v27 = (void *)v26;
        [a1 setClientCapabilities:v26];
      }
      if (a3) {
        v28 = @"analyticMetadata";
      }
      else {
        v28 = @"analytic_metadata";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30 = [GEOPDAnalyticMetadata alloc];
        if (a3) {
          uint64_t v31 = [(GEOPDAnalyticMetadata *)v30 initWithJSON:v29];
        }
        else {
          uint64_t v31 = [(GEOPDAnalyticMetadata *)v30 initWithDictionary:v29];
        }
        v32 = (void *)v31;
        [a1 setAnalyticMetadata:v31];
      }
      if (a3) {
        v33 = @"abAssignmentMetadata";
      }
      else {
        v33 = @"ab_assignment_metadata";
      }
      v34 = [v5 objectForKeyedSubscript:v33];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v35 = [GEOABSecondPartyPlaceRequestClientMetaData alloc];
        if (a3) {
          uint64_t v36 = [(GEOABSecondPartyPlaceRequestClientMetaData *)v35 initWithJSON:v34];
        }
        else {
          uint64_t v36 = [(GEOABSecondPartyPlaceRequestClientMetaData *)v35 initWithDictionary:v34];
        }
        v37 = (void *)v36;
        [a1 setAbAssignmentMetadata:v36];
      }
      if (a3) {
        v38 = @"servicesState";
      }
      else {
        v38 = @"services_state";
      }
      v39 = [v5 objectForKeyedSubscript:v38];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v40 = [GEOServicesState alloc];
        if (a3) {
          uint64_t v41 = [(GEOServicesState *)v40 initWithJSON:v39];
        }
        else {
          uint64_t v41 = [(GEOServicesState *)v40 initWithDictionary:v39];
        }
        v42 = (void *)v41;
        [a1 setServicesState:v41];
      }
      if (a3) {
        v43 = @"suppressLogging";
      }
      else {
        v43 = @"suppress_logging";
      }
      v44 = [v5 objectForKeyedSubscript:v43];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSuppressLogging:", objc_msgSend(v44, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEORPProblemStatusRequest)initWithJSON:(id)a3
{
  return (GEORPProblemStatusRequest *)-[GEORPProblemStatusRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3008;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3009;
    }
    GEORPProblemStatusRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPProblemStatusRequestCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemStatusRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemStatusRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPProblemStatusRequestIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
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
    [(GEORPProblemStatusRequest *)self readAll:0];
    if (self->_userCredentials) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_statusNotificationId) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_problemIds;
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
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_clientCapabilities) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_analyticMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_abAssignmentMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_servicesState) {
      PBDataWriterWriteSubmessage();
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
  }
}

- (unsigned)requestTypeCode
{
  return 1010;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEORPProblemStatusRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 18) = self->_readerMarkPos;
  *((_DWORD *)v9 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_userCredentials) {
    objc_msgSend(v9, "setUserCredentials:");
  }
  if (self->_statusNotificationId) {
    objc_msgSend(v9, "setStatusNotificationId:");
  }
  if ([(GEORPProblemStatusRequest *)self problemIdsCount])
  {
    [v9 clearProblemIds];
    unint64_t v4 = [(GEORPProblemStatusRequest *)self problemIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPProblemStatusRequest *)self problemIdAtIndex:i];
        [v9 addProblemId:v7];
      }
    }
  }
  if (self->_clientCapabilities) {
    objc_msgSend(v9, "setClientCapabilities:");
  }
  uint64_t v8 = v9;
  if (self->_analyticMetadata)
  {
    objc_msgSend(v9, "setAnalyticMetadata:");
    uint64_t v8 = v9;
  }
  if (self->_abAssignmentMetadata)
  {
    objc_msgSend(v9, "setAbAssignmentMetadata:");
    uint64_t v8 = v9;
  }
  if (self->_servicesState)
  {
    objc_msgSend(v9, "setServicesState:");
    uint64_t v8 = v9;
  }
  if (*(_WORD *)&self->_flags)
  {
    *((unsigned char *)v8 + 84) = self->_suppressLogging;
    *((_WORD *)v8 + 44) |= 1u;
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
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPProblemStatusRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPProblemStatusRequest *)self readAll:0];
  id v9 = [(GEORPUserCredentials *)self->_userCredentials copyWithZone:a3];
  v10 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v9;

  uint64_t v11 = [(NSString *)self->_statusNotificationId copyWithZone:a3];
  long long v12 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v11;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v13 = self->_problemIds;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (void)v27);
        [(id)v5 addProblemId:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }

  id v18 = [(GEORPClientCapabilities *)self->_clientCapabilities copyWithZone:a3];
  uint64_t v19 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v18;

  id v20 = [(GEOPDAnalyticMetadata *)self->_analyticMetadata copyWithZone:a3];
  v21 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v20;

  id v22 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_abAssignmentMetadata copyWithZone:a3];
  v23 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v22;

  id v24 = [(GEOServicesState *)self->_servicesState copyWithZone:a3];
  v25 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v24;

  if (*(_WORD *)&self->_flags)
  {
    *(unsigned char *)(v5 + 84) = self->_suppressLogging;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEORPProblemStatusRequest *)self readAll:1];
  [v4 readAll:1];
  userCredentials = self->_userCredentials;
  if ((unint64_t)userCredentials | *((void *)v4 + 8))
  {
    if (!-[GEORPUserCredentials isEqual:](userCredentials, "isEqual:")) {
      goto LABEL_18;
    }
  }
  statusNotificationId = self->_statusNotificationId;
  if ((unint64_t)statusNotificationId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](statusNotificationId, "isEqual:")) {
      goto LABEL_18;
    }
  }
  problemIds = self->_problemIds;
  if ((unint64_t)problemIds | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](problemIds, "isEqual:")) {
      goto LABEL_18;
    }
  }
  clientCapabilities = self->_clientCapabilities;
  if ((unint64_t)clientCapabilities | *((void *)v4 + 4))
  {
    if (!-[GEORPClientCapabilities isEqual:](clientCapabilities, "isEqual:")) {
      goto LABEL_18;
    }
  }
  analyticMetadata = self->_analyticMetadata;
  if ((unint64_t)analyticMetadata | *((void *)v4 + 3))
  {
    if (!-[GEOPDAnalyticMetadata isEqual:](analyticMetadata, "isEqual:")) {
      goto LABEL_18;
    }
  }
  abAssignmentMetadata = self->_abAssignmentMetadata;
  if ((unint64_t)abAssignmentMetadata | *((void *)v4 + 2))
  {
    if (!-[GEOABSecondPartyPlaceRequestClientMetaData isEqual:](abAssignmentMetadata, "isEqual:")) {
      goto LABEL_18;
    }
  }
  servicesState = self->_servicesState;
  if ((unint64_t)servicesState | *((void *)v4 + 6))
  {
    if (!-[GEOServicesState isEqual:](servicesState, "isEqual:")) {
      goto LABEL_18;
    }
  }
  __int16 v12 = *((_WORD *)v4 + 44);
  BOOL v13 = (v12 & 1) == 0;
  if (*(_WORD *)&self->_flags)
  {
    if ((v12 & 1) == 0)
    {
LABEL_18:
      BOOL v13 = 0;
      goto LABEL_19;
    }
    if (self->_suppressLogging)
    {
      if (!*((unsigned char *)v4 + 84)) {
        goto LABEL_18;
      }
    }
    else if (*((unsigned char *)v4 + 84))
    {
      goto LABEL_18;
    }
    BOOL v13 = 1;
  }
LABEL_19:

  return v13;
}

- (unint64_t)hash
{
  [(GEORPProblemStatusRequest *)self readAll:1];
  unint64_t v3 = [(GEORPUserCredentials *)self->_userCredentials hash];
  NSUInteger v4 = [(NSString *)self->_statusNotificationId hash];
  uint64_t v5 = [(NSMutableArray *)self->_problemIds hash];
  unint64_t v6 = [(GEORPClientCapabilities *)self->_clientCapabilities hash];
  unint64_t v7 = [(GEOPDAnalyticMetadata *)self->_analyticMetadata hash];
  unint64_t v8 = [(GEOABSecondPartyPlaceRequestClientMetaData *)self->_abAssignmentMetadata hash];
  unint64_t v9 = [(GEOServicesState *)self->_servicesState hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v10 = 2654435761 * self->_suppressLogging;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  userCredentials = self->_userCredentials;
  uint64_t v6 = *((void *)v4 + 8);
  if (userCredentials)
  {
    if (v6) {
      -[GEORPUserCredentials mergeFrom:](userCredentials, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPProblemStatusRequest setUserCredentials:](self, "setUserCredentials:");
  }
  if (*((void *)v4 + 7)) {
    -[GEORPProblemStatusRequest setStatusNotificationId:](self, "setStatusNotificationId:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = *((id *)v4 + 5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEORPProblemStatusRequest addProblemId:](self, "addProblemId:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  clientCapabilities = self->_clientCapabilities;
  uint64_t v13 = *((void *)v4 + 4);
  if (clientCapabilities)
  {
    if (v13) {
      -[GEORPClientCapabilities mergeFrom:](clientCapabilities, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEORPProblemStatusRequest setClientCapabilities:](self, "setClientCapabilities:");
  }
  analyticMetadata = self->_analyticMetadata;
  uint64_t v15 = *((void *)v4 + 3);
  if (analyticMetadata)
  {
    if (v15) {
      -[GEOPDAnalyticMetadata mergeFrom:](analyticMetadata, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEORPProblemStatusRequest setAnalyticMetadata:](self, "setAnalyticMetadata:");
  }
  abAssignmentMetadata = self->_abAssignmentMetadata;
  uint64_t v17 = *((void *)v4 + 2);
  if (abAssignmentMetadata)
  {
    if (v17) {
      -[GEOABSecondPartyPlaceRequestClientMetaData mergeFrom:](abAssignmentMetadata, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEORPProblemStatusRequest setAbAssignmentMetadata:](self, "setAbAssignmentMetadata:");
  }
  servicesState = self->_servicesState;
  uint64_t v19 = *((void *)v4 + 6);
  if (servicesState)
  {
    if (v19) {
      -[GEOServicesState mergeFrom:](servicesState, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[GEORPProblemStatusRequest setServicesState:](self, "setServicesState:");
  }
  if (*((_WORD *)v4 + 44))
  {
    self->_suppressLogging = *((unsigned char *)v4 + 84);
    *(_WORD *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userCredentials, 0);
  objc_storeStrong((id *)&self->_statusNotificationId, 0);
  objc_storeStrong((id *)&self->_servicesState, 0);
  objc_storeStrong((id *)&self->_problemIds, 0);
  objc_storeStrong((id *)&self->_clientCapabilities, 0);
  objc_storeStrong((id *)&self->_analyticMetadata, 0);
  objc_storeStrong((id *)&self->_abAssignmentMetadata, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)populateAnalyticsMetadata
{
  unint64_t v3 = [GEOPDAnalyticMetadata alloc];
  id v6 = +[GEOMapService sharedService];
  id v4 = [v6 defaultTraits];
  uint64_t v5 = [(GEOPDAnalyticMetadata *)v3 initWithTraits:v4];
  [(GEORPProblemStatusRequest *)self setAnalyticMetadata:v5];
}

@end