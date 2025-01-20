@interface GEOTransitRouteUpdate
+ (BOOL)isValid:(id)a3;
+ (Class)alertType;
+ (Class)stepUpdateType;
- (BOOL)hasDisplayStrings;
- (BOOL)hasRouteIdentifier;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitRouteDisplayStrings)displayStrings;
- (GEOTransitRouteIdentifier)routeIdentifier;
- (GEOTransitRouteUpdate)init;
- (GEOTransitRouteUpdate)initWithData:(id)a3;
- (GEOTransitRouteUpdate)initWithDictionary:(id)a3;
- (GEOTransitRouteUpdate)initWithJSON:(id)a3;
- (NSMutableArray)alerts;
- (NSMutableArray)stepUpdates;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_logDescription;
- (id)alertAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)statusAsString:(int)a3;
- (id)stepUpdateAtIndex:(unint64_t)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)alertsCount;
- (unint64_t)hash;
- (unint64_t)stepUpdatesCount;
- (void)_addNoFlagsAlert:(uint64_t)a1;
- (void)_addNoFlagsStepUpdate:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAlerts;
- (void)_readDisplayStrings;
- (void)_readRouteIdentifier;
- (void)_readStepUpdates;
- (void)addAlert:(id)a3;
- (void)addStepUpdate:(id)a3;
- (void)clearAlerts;
- (void)clearStepUpdates;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAlerts:(id)a3;
- (void)setDisplayStrings:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setRouteIdentifier:(id)a3;
- (void)setStatus:(int)a3;
- (void)setStepUpdates:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitRouteUpdate

- (GEOTransitRouteUpdate)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitRouteUpdate;
  v2 = [(GEOTransitRouteUpdate *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitRouteUpdate)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitRouteUpdate;
  v3 = [(GEOTransitRouteUpdate *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRouteIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasRouteIdentifier
{
  return self->_routeIdentifier != 0;
}

- (GEOTransitRouteIdentifier)routeIdentifier
{
  -[GEOTransitRouteUpdate _readRouteIdentifier]((uint64_t)self);
  routeIdentifier = self->_routeIdentifier;

  return routeIdentifier;
}

- (void)setRouteIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_routeIdentifier, a3);
}

- (int)status
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53D8880[a3];
  }

  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_FAILURE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SUCCESS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FAILURE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_ROUTE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MISSING_REAL_TIME_DATA"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readDisplayStrings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayStrings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasDisplayStrings
{
  return self->_displayStrings != 0;
}

- (GEOTransitRouteDisplayStrings)displayStrings
{
  -[GEOTransitRouteUpdate _readDisplayStrings]((uint64_t)self);
  displayStrings = self->_displayStrings;

  return displayStrings;
}

- (void)setDisplayStrings:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_displayStrings, a3);
}

- (void)_readStepUpdates
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStepUpdates_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)stepUpdates
{
  -[GEOTransitRouteUpdate _readStepUpdates]((uint64_t)self);
  stepUpdates = self->_stepUpdates;

  return stepUpdates;
}

- (void)setStepUpdates:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  stepUpdates = self->_stepUpdates;
  self->_stepUpdates = v4;
}

- (void)clearStepUpdates
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  stepUpdates = self->_stepUpdates;

  [(NSMutableArray *)stepUpdates removeAllObjects];
}

- (void)addStepUpdate:(id)a3
{
  id v4 = a3;
  -[GEOTransitRouteUpdate _readStepUpdates]((uint64_t)self);
  -[GEOTransitRouteUpdate _addNoFlagsStepUpdate:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsStepUpdate:(uint64_t)a1
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

- (unint64_t)stepUpdatesCount
{
  -[GEOTransitRouteUpdate _readStepUpdates]((uint64_t)self);
  stepUpdates = self->_stepUpdates;

  return [(NSMutableArray *)stepUpdates count];
}

- (id)stepUpdateAtIndex:(unint64_t)a3
{
  -[GEOTransitRouteUpdate _readStepUpdates]((uint64_t)self);
  stepUpdates = self->_stepUpdates;

  return (id)[(NSMutableArray *)stepUpdates objectAtIndex:a3];
}

+ (Class)stepUpdateType
{
  return (Class)objc_opt_class();
}

- (void)_readAlerts
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAlerts_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)alerts
{
  -[GEOTransitRouteUpdate _readAlerts]((uint64_t)self);
  alerts = self->_alerts;

  return alerts;
}

- (void)setAlerts:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  alerts = self->_alerts;
  self->_alerts = v4;
}

- (void)clearAlerts
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  alerts = self->_alerts;

  [(NSMutableArray *)alerts removeAllObjects];
}

- (void)addAlert:(id)a3
{
  id v4 = a3;
  -[GEOTransitRouteUpdate _readAlerts]((uint64_t)self);
  -[GEOTransitRouteUpdate _addNoFlagsAlert:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsAlert:(uint64_t)a1
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

- (unint64_t)alertsCount
{
  -[GEOTransitRouteUpdate _readAlerts]((uint64_t)self);
  alerts = self->_alerts;

  return [(NSMutableArray *)alerts count];
}

- (id)alertAtIndex:(unint64_t)a3
{
  -[GEOTransitRouteUpdate _readAlerts]((uint64_t)self);
  alerts = self->_alerts;

  return (id)[(NSMutableArray *)alerts objectAtIndex:a3];
}

+ (Class)alertType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitRouteUpdate;
  id v4 = [(GEOTransitRouteUpdate *)&v8 description];
  id v5 = [(GEOTransitRouteUpdate *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitRouteUpdate _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 routeIdentifier];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"routeIdentifier";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"route_identifier";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v9 = *(int *)(a1 + 68);
      if (v9 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53D8880[v9];
      }
      [v4 setObject:v10 forKey:@"status"];
    }
    v11 = [(id)a1 displayStrings];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"displayStrings";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"display_strings";
      }
      [v4 setObject:v13 forKey:v14];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v16 = *(id *)(a1 + 48);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v46 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            if (a2) {
              [v21 jsonRepresentation];
            }
            else {
            v22 = [v21 dictionaryRepresentation];
            }
            [v15 addObject:v22];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v18);
      }

      if (a2) {
        v23 = @"stepUpdate";
      }
      else {
        v23 = @"step_update";
      }
      [v4 setObject:v15 forKey:v23];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v25 = *(id *)(a1 + 24);
      uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v42 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v41 + 1) + 8 * j);
            if (a2) {
              [v30 jsonRepresentation];
            }
            else {
            v31 = [v30 dictionaryRepresentation];
            }
            [v24 addObject:v31];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v49 count:16];
        }
        while (v27);
      }

      [v4 setObject:v24 forKey:@"alert"];
    }
    v32 = *(void **)(a1 + 16);
    if (v32)
    {
      v33 = [v32 dictionaryRepresentation];
      v34 = v33;
      if (a2)
      {
        v35 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v33, "count"));
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __51__GEOTransitRouteUpdate__dictionaryRepresentation___block_invoke;
        v39[3] = &unk_1E53D8860;
        id v36 = v35;
        id v40 = v36;
        [v34 enumerateKeysAndObjectsUsingBlock:v39];
        id v37 = v36;

        v34 = v37;
      }
      [v4 setObject:v34 forKey:@"Unknown Fields"];
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
  return -[GEOTransitRouteUpdate _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOTransitRouteUpdate__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitRouteUpdate)initWithDictionary:(id)a3
{
  return (GEOTransitRouteUpdate *)-[GEOTransitRouteUpdate _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_67;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_67;
  }
  if (a3) {
    objc_super v6 = @"routeIdentifier";
  }
  else {
    objc_super v6 = @"route_identifier";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [GEOTransitRouteIdentifier alloc];
    if (a3) {
      uint64_t v9 = [(GEOTransitRouteIdentifier *)v8 initWithJSON:v7];
    }
    else {
      uint64_t v9 = [(GEOTransitRouteIdentifier *)v8 initWithDictionary:v7];
    }
    id v10 = (void *)v9;
    [a1 setRouteIdentifier:v9];
  }
  v11 = [v5 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"UNKNOWN_FAILURE"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"SUCCESS"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"FAILURE"])
    {
      uint64_t v13 = 2;
    }
    else if ([v12 isEqualToString:@"UNKNOWN_ROUTE"])
    {
      uint64_t v13 = 3;
    }
    else if ([v12 isEqualToString:@"MISSING_REAL_TIME_DATA"])
    {
      uint64_t v13 = 4;
    }
    else
    {
      uint64_t v13 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v11 intValue];
LABEL_26:
    [a1 setStatus:v13];
  }

  if (a3) {
    v14 = @"displayStrings";
  }
  else {
    v14 = @"display_strings";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = [GEOTransitRouteDisplayStrings alloc];
    if (a3) {
      uint64_t v17 = [(GEOTransitRouteDisplayStrings *)v16 initWithJSON:v15];
    }
    else {
      uint64_t v17 = [(GEOTransitRouteDisplayStrings *)v16 initWithDictionary:v15];
    }
    uint64_t v18 = (void *)v17;
    [a1 setDisplayStrings:v17];
  }
  if (a3) {
    uint64_t v19 = @"stepUpdate";
  }
  else {
    uint64_t v19 = @"step_update";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  id v41 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v47 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v27 = [GEOTransitStepUpdate alloc];
            if (a3) {
              uint64_t v28 = [(GEOTransitStepUpdate *)v27 initWithJSON:v26];
            }
            else {
              uint64_t v28 = [(GEOTransitStepUpdate *)v27 initWithDictionary:v26];
            }
            v29 = (void *)v28;
            [a1 addStepUpdate:v28];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v23);
    }

    id v5 = v41;
  }

  v30 = [v5 objectForKeyedSubscript:@"alert"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v31 = v30;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v43 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void *)(*((void *)&v42 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v37 = [GEOTransitRouteUpdateAlert alloc];
            if (a3) {
              uint64_t v38 = [(GEOTransitRouteUpdateAlert *)v37 initWithJSON:v36];
            }
            else {
              uint64_t v38 = [(GEOTransitRouteUpdateAlert *)v37 initWithDictionary:v36];
            }
            v39 = (void *)v38;
            [a1 addAlert:v38];
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v33);
    }

    id v5 = v41;
  }

LABEL_67:
  return a1;
}

- (GEOTransitRouteUpdate)initWithJSON:(id)a3
{
  return (GEOTransitRouteUpdate *)-[GEOTransitRouteUpdate _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_113;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_114;
    }
    GEOTransitRouteUpdateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTransitRouteUpdateCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitRouteUpdateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitRouteUpdateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitRouteUpdateIsDirty((uint64_t)self) & 1) == 0)
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitRouteUpdate *)self readAll:0];
    if (self->_routeIdentifier) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_displayStrings) {
      PBDataWriterWriteSubmessage();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_stepUpdates;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = self->_alerts;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOTransitRouteUpdate *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 14) = self->_readerMarkPos;
  *((_DWORD *)v12 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_routeIdentifier) {
    objc_msgSend(v12, "setRouteIdentifier:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v12 + 17) = self->_status;
    *((unsigned char *)v12 + 72) |= 1u;
  }
  if (self->_displayStrings) {
    objc_msgSend(v12, "setDisplayStrings:");
  }
  if ([(GEOTransitRouteUpdate *)self stepUpdatesCount])
  {
    [v12 clearStepUpdates];
    unint64_t v4 = [(GEOTransitRouteUpdate *)self stepUpdatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOTransitRouteUpdate *)self stepUpdateAtIndex:i];
        [v12 addStepUpdate:v7];
      }
    }
  }
  if ([(GEOTransitRouteUpdate *)self alertsCount])
  {
    [v12 clearAlerts];
    unint64_t v8 = [(GEOTransitRouteUpdate *)self alertsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOTransitRouteUpdate *)self alertAtIndex:j];
        [v12 addAlert:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTransitRouteUpdateReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitRouteUpdate *)self readAll:0];
  id v9 = [(GEOTransitRouteIdentifier *)self->_routeIdentifier copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_status;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  id v11 = [(GEOTransitRouteDisplayStrings *)self->_displayStrings copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v13 = self->_stepUpdates;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addStepUpdate:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v14);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v18 = self->_alerts;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v18);
        }
        long long v22 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "copyWithZone:", a3, (void)v25);
        [(id)v5 addAlert:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v19);
  }

  long long v23 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v23;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEOTransitRouteUpdate *)self readAll:1];
  [v4 readAll:1];
  routeIdentifier = self->_routeIdentifier;
  if ((unint64_t)routeIdentifier | *((void *)v4 + 5))
  {
    if (!-[GEOTransitRouteIdentifier isEqual:](routeIdentifier, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_status != *((_DWORD *)v4 + 17)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  displayStrings = self->_displayStrings;
  if ((unint64_t)displayStrings | *((void *)v4 + 4)
    && !-[GEOTransitRouteDisplayStrings isEqual:](displayStrings, "isEqual:"))
  {
    goto LABEL_15;
  }
  stepUpdates = self->_stepUpdates;
  if ((unint64_t)stepUpdates | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](stepUpdates, "isEqual:")) {
      goto LABEL_15;
    }
  }
  alerts = self->_alerts;
  if ((unint64_t)alerts | *((void *)v4 + 3)) {
    char v9 = -[NSMutableArray isEqual:](alerts, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  [(GEOTransitRouteUpdate *)self readAll:1];
  unint64_t v3 = [(GEOTransitRouteIdentifier *)self->_routeIdentifier hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_status;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  unint64_t v6 = [(GEOTransitRouteDisplayStrings *)self->_displayStrings hash];
  uint64_t v7 = v5 ^ v6 ^ [(NSMutableArray *)self->_stepUpdates hash];
  return v7 ^ [(NSMutableArray *)self->_alerts hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  routeIdentifier = self->_routeIdentifier;
  uint64_t v6 = *((void *)v4 + 5);
  if (routeIdentifier)
  {
    if (v6) {
      -[GEOTransitRouteIdentifier mergeFrom:](routeIdentifier, "mergeFrom:");
    }
  }
  else if (v6)
  {
    [(GEOTransitRouteUpdate *)self setRouteIdentifier:"setRouteIdentifier:"];
  }
  if (*((unsigned char *)v4 + 72))
  {
    self->_status = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_flags |= 1u;
  }
  displayStrings = self->_displayStrings;
  uint64_t v8 = *((void *)v4 + 4);
  if (displayStrings)
  {
    if (v8) {
      -[GEOTransitRouteDisplayStrings mergeFrom:](displayStrings, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEOTransitRouteUpdate setDisplayStrings:](self, "setDisplayStrings:");
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = *((id *)v4 + 6);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        [(GEOTransitRouteUpdate *)self addStepUpdate:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v11);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = *((id *)v4 + 3);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[GEOTransitRouteUpdate addAlert:](self, "addAlert:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTransitRouteUpdateReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_118);
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
  *(unsigned char *)&self->_flags |= 0x42u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitRouteUpdate *)self readAll:0];
    [(GEOTransitRouteIdentifier *)self->_routeIdentifier clearUnknownFields:1];
    [(GEOTransitRouteDisplayStrings *)self->_displayStrings clearUnknownFields:1];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_stepUpdates;
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
    uint64_t v12 = self->_alerts;
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
  objc_storeStrong((id *)&self->_stepUpdates, 0);
  objc_storeStrong((id *)&self->_routeIdentifier, 0);
  objc_storeStrong((id *)&self->_displayStrings, 0);
  objc_storeStrong((id *)&self->_alerts, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)_logDescription
{
  BOOL v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(GEOTransitRouteUpdate *)self status];
  if (v6 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v7 = off_1E53DB218[(int)v6];
  }
  uint64_t v8 = [(GEOTransitRouteUpdate *)self routeIdentifier];
  uint64_t v9 = [v8 clientRouteID];
  uint64_t v10 = [(GEOTransitRouteUpdate *)self stepUpdates];
  uint64_t v11 = [v10 valueForKeyPath:@"updateIdentifier"];
  uint64_t v12 = [(GEOTransitRouteUpdate *)self alerts];
  uint64_t v13 = [v3 stringWithFormat:@"<%@:%p %@ route:%@ stepIdentifiers:%@ alertsCount:%lu>", v5, self, v7, v9, v11, objc_msgSend(v12, "count")];

  return v13;
}

@end