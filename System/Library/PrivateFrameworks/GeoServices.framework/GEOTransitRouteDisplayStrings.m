@interface GEOTransitRouteDisplayStrings
+ (BOOL)isValid:(id)a3;
+ (Class)advisoryType;
- (BOOL)hasBadge;
- (BOOL)hasDuration;
- (BOOL)hasDurationList;
- (BOOL)hasPlanningDescription;
- (BOOL)hasTravelDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)badge;
- (GEOFormattedString)duration;
- (GEOFormattedString)durationList;
- (GEOFormattedString)planningDescription;
- (GEOFormattedString)travelDescription;
- (GEOServerFormattedString)pickingDurationFormatString;
- (GEOServerFormattedString)planningDescriptionFormatString;
- (GEOServerFormattedString)previewDurationFormatString;
- (GEOServerFormattedString)transitDescriptionFormatString;
- (GEOServerFormattedString)transitRouteBadge;
- (GEOTransitRouteDisplayStrings)init;
- (GEOTransitRouteDisplayStrings)initWithData:(id)a3;
- (GEOTransitRouteDisplayStrings)initWithDictionary:(id)a3;
- (GEOTransitRouteDisplayStrings)initWithJSON:(id)a3;
- (NSMutableArray)advisorys;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)advisoryAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)advisorysCount;
- (unint64_t)hash;
- (void)_addNoFlagsAdvisory:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAdvisorys;
- (void)_readBadge;
- (void)_readDuration;
- (void)_readDurationList;
- (void)_readPlanningDescription;
- (void)_readTravelDescription;
- (void)addAdvisory:(id)a3;
- (void)clearAdvisorys;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAdvisorys:(id)a3;
- (void)setBadge:(id)a3;
- (void)setDuration:(id)a3;
- (void)setDurationList:(id)a3;
- (void)setPlanningDescription:(id)a3;
- (void)setTravelDescription:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitRouteDisplayStrings

- (GEOTransitRouteDisplayStrings)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitRouteDisplayStrings;
  v2 = [(GEOTransitRouteDisplayStrings *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitRouteDisplayStrings)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitRouteDisplayStrings;
  v3 = [(GEOTransitRouteDisplayStrings *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPlanningDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteDisplayStringsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlanningDescription_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasPlanningDescription
{
  return self->_planningDescription != 0;
}

- (GEOFormattedString)planningDescription
{
  -[GEOTransitRouteDisplayStrings _readPlanningDescription]((uint64_t)self);
  planningDescription = self->_planningDescription;

  return planningDescription;
}

- (void)setPlanningDescription:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_planningDescription, a3);
}

- (void)_readDuration
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteDisplayStringsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDuration_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDuration
{
  return self->_duration != 0;
}

- (GEOFormattedString)duration
{
  -[GEOTransitRouteDisplayStrings _readDuration]((uint64_t)self);
  duration = self->_duration;

  return duration;
}

- (void)setDuration:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_duration, a3);
}

- (void)_readDurationList
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteDisplayStringsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDurationList_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDurationList
{
  return self->_durationList != 0;
}

- (GEOFormattedString)durationList
{
  -[GEOTransitRouteDisplayStrings _readDurationList]((uint64_t)self);
  durationList = self->_durationList;

  return durationList;
}

- (void)setDurationList:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_durationList, a3);
}

- (void)_readTravelDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteDisplayStringsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTravelDescription_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTravelDescription
{
  return self->_travelDescription != 0;
}

- (GEOFormattedString)travelDescription
{
  -[GEOTransitRouteDisplayStrings _readTravelDescription]((uint64_t)self);
  travelDescription = self->_travelDescription;

  return travelDescription;
}

- (void)setTravelDescription:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_travelDescription, a3);
}

- (void)_readAdvisorys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteDisplayStringsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdvisorys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)advisorys
{
  -[GEOTransitRouteDisplayStrings _readAdvisorys]((uint64_t)self);
  advisorys = self->_advisorys;

  return advisorys;
}

- (void)setAdvisorys:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  advisorys = self->_advisorys;
  self->_advisorys = v4;
}

- (void)clearAdvisorys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  advisorys = self->_advisorys;

  [(NSMutableArray *)advisorys removeAllObjects];
}

- (void)addAdvisory:(id)a3
{
  id v4 = a3;
  -[GEOTransitRouteDisplayStrings _readAdvisorys]((uint64_t)self);
  -[GEOTransitRouteDisplayStrings _addNoFlagsAdvisory:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsAdvisory:(uint64_t)a1
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

- (unint64_t)advisorysCount
{
  -[GEOTransitRouteDisplayStrings _readAdvisorys]((uint64_t)self);
  advisorys = self->_advisorys;

  return [(NSMutableArray *)advisorys count];
}

- (id)advisoryAtIndex:(unint64_t)a3
{
  -[GEOTransitRouteDisplayStrings _readAdvisorys]((uint64_t)self);
  advisorys = self->_advisorys;

  return (id)[(NSMutableArray *)advisorys objectAtIndex:a3];
}

+ (Class)advisoryType
{
  return (Class)objc_opt_class();
}

- (void)_readBadge
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteDisplayStringsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBadge_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasBadge
{
  return self->_badge != 0;
}

- (GEOFormattedString)badge
{
  -[GEOTransitRouteDisplayStrings _readBadge]((uint64_t)self);
  badge = self->_badge;

  return badge;
}

- (void)setBadge:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_badge, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitRouteDisplayStrings;
  id v4 = [(GEOTransitRouteDisplayStrings *)&v8 description];
  id v5 = [(GEOTransitRouteDisplayStrings *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitRouteDisplayStrings _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 planningDescription];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"planningDescription";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"planning_description";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 duration];
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"duration"];
    }
    v12 = [(id)a1 durationList];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"durationList";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"duration_list";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = [(id)a1 travelDescription];
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"travelDescription";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"travel_description";
      }
      [v4 setObject:v18 forKey:v19];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v21 = *(id *)(a1 + 24);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v41 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            if (a2) {
              [v26 jsonRepresentation];
            }
            else {
            v27 = [v26 dictionaryRepresentation];
            }
            [v20 addObject:v27];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v23);
      }

      [v4 setObject:v20 forKey:@"advisory"];
    }
    v28 = [(id)a1 badge];
    v29 = v28;
    if (v28)
    {
      if (a2) {
        [v28 jsonRepresentation];
      }
      else {
      v30 = [v28 dictionaryRepresentation];
      }
      [v4 setObject:v30 forKey:@"badge"];
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
        v38[2] = __59__GEOTransitRouteDisplayStrings__dictionaryRepresentation___block_invoke;
        v38[3] = &unk_1E53D8860;
        id v35 = v34;
        id v39 = v35;
        [v33 enumerateKeysAndObjectsUsingBlock:v38];
        id v36 = v35;

        v33 = v36;
      }
      [v4 setObject:v33 forKey:@"Unknown Fields"];
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
  return -[GEOTransitRouteDisplayStrings _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOTransitRouteDisplayStrings__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOTransitRouteDisplayStrings)initWithDictionary:(id)a3
{
  return (GEOTransitRouteDisplayStrings *)-[GEOTransitRouteDisplayStrings _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"planningDescription";
      }
      else {
        objc_super v6 = @"planning_description";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v9 = [(GEOFormattedString *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOFormattedString *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setPlanningDescription:v9];
      }
      v11 = [v5 objectForKeyedSubscript:@"duration"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v13 = [(GEOFormattedString *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOFormattedString *)v12 initWithDictionary:v11];
        }
        v14 = (void *)v13;
        [a1 setDuration:v13];
      }
      if (a3) {
        v15 = @"durationList";
      }
      else {
        v15 = @"duration_list";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v18 = [(GEOFormattedString *)v17 initWithJSON:v16];
        }
        else {
          uint64_t v18 = [(GEOFormattedString *)v17 initWithDictionary:v16];
        }
        v19 = (void *)v18;
        [a1 setDurationList:v18];
      }
      if (a3) {
        v20 = @"travelDescription";
      }
      else {
        v20 = @"travel_description";
      }
      id v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v22 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v23 = [(GEOFormattedString *)v22 initWithJSON:v21];
        }
        else {
          uint64_t v23 = [(GEOFormattedString *)v22 initWithDictionary:v21];
        }
        uint64_t v24 = (void *)v23;
        [a1 setTravelDescription:v23];
      }
      v25 = [v5 objectForKeyedSubscript:@"advisory"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v40 = v5;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v26 = v25;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v42 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v31 = *(void *)(*((void *)&v41 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v32 = [GEOTransitAdvisory alloc];
                if (a3) {
                  uint64_t v33 = [(GEOTransitAdvisory *)v32 initWithJSON:v31];
                }
                else {
                  uint64_t v33 = [(GEOTransitAdvisory *)v32 initWithDictionary:v31];
                }
                v34 = (void *)v33;
                [a1 addAdvisory:v33];
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v45 count:16];
          }
          while (v28);
        }

        id v5 = v40;
      }

      id v35 = [v5 objectForKeyedSubscript:@"badge"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v36 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v37 = [(GEOFormattedString *)v36 initWithJSON:v35];
        }
        else {
          uint64_t v37 = [(GEOFormattedString *)v36 initWithDictionary:v35];
        }
        v38 = (void *)v37;
        [a1 setBadge:v37];
      }
    }
  }

  return a1;
}

- (GEOTransitRouteDisplayStrings)initWithJSON:(id)a3
{
  return (GEOTransitRouteDisplayStrings *)-[GEOTransitRouteDisplayStrings _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1136;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1137;
    }
    GEOTransitRouteDisplayStringsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTransitRouteDisplayStringsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitRouteDisplayStringsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitRouteDisplayStringsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitRouteDisplayStringsIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOTransitRouteDisplayStrings *)self readAll:0];
    if (self->_planningDescription) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_duration) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_durationList) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_travelDescription) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_advisorys;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_badge) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOTransitRouteDisplayStrings *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 18) = self->_readerMarkPos;
  *((_DWORD *)v8 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_planningDescription) {
    objc_msgSend(v8, "setPlanningDescription:");
  }
  if (self->_duration) {
    objc_msgSend(v8, "setDuration:");
  }
  if (self->_durationList) {
    objc_msgSend(v8, "setDurationList:");
  }
  if (self->_travelDescription) {
    objc_msgSend(v8, "setTravelDescription:");
  }
  if ([(GEOTransitRouteDisplayStrings *)self advisorysCount])
  {
    [v8 clearAdvisorys];
    unint64_t v4 = [(GEOTransitRouteDisplayStrings *)self advisorysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOTransitRouteDisplayStrings *)self advisoryAtIndex:i];
        [v8 addAdvisory:v7];
      }
    }
  }
  if (self->_badge) {
    objc_msgSend(v8, "setBadge:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
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
      GEOTransitRouteDisplayStringsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitRouteDisplayStrings *)self readAll:0];
  id v8 = [(GEOFormattedString *)self->_planningDescription copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  id v10 = [(GEOFormattedString *)self->_duration copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  id v12 = [(GEOFormattedString *)self->_durationList copyWithZone:a3];
  long long v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  id v14 = [(GEOFormattedString *)self->_travelDescription copyWithZone:a3];
  long long v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v16 = self->_advisorys;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v19), "copyWithZone:", a3, (void)v24);
        [(id)v5 addAdvisory:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v17);
  }

  id v21 = [(GEOFormattedString *)self->_badge copyWithZone:a3];
  uint64_t v22 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v21;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOTransitRouteDisplayStrings *)self readAll:1],
         [v4 readAll:1],
         planningDescription = self->_planningDescription,
         !((unint64_t)planningDescription | v4[7]))
     || -[GEOFormattedString isEqual:](planningDescription, "isEqual:"))
    && ((duration = self->_duration, !((unint64_t)duration | v4[6]))
     || -[GEOFormattedString isEqual:](duration, "isEqual:"))
    && ((durationList = self->_durationList, !((unint64_t)durationList | v4[5]))
     || -[GEOFormattedString isEqual:](durationList, "isEqual:"))
    && ((travelDescription = self->_travelDescription, !((unint64_t)travelDescription | v4[8]))
     || -[GEOFormattedString isEqual:](travelDescription, "isEqual:"))
    && ((advisorys = self->_advisorys, !((unint64_t)advisorys | v4[3]))
     || -[NSMutableArray isEqual:](advisorys, "isEqual:")))
  {
    badge = self->_badge;
    if ((unint64_t)badge | v4[4]) {
      char v11 = -[GEOFormattedString isEqual:](badge, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  [(GEOTransitRouteDisplayStrings *)self readAll:1];
  unint64_t v3 = [(GEOFormattedString *)self->_planningDescription hash];
  unint64_t v4 = [(GEOFormattedString *)self->_duration hash] ^ v3;
  unint64_t v5 = [(GEOFormattedString *)self->_durationList hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOFormattedString *)self->_travelDescription hash];
  uint64_t v7 = [(NSMutableArray *)self->_advisorys hash];
  return v6 ^ v7 ^ [(GEOFormattedString *)self->_badge hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  planningDescription = self->_planningDescription;
  id v6 = v4[7];
  if (planningDescription)
  {
    if (v6) {
      -[GEOFormattedString mergeFrom:](planningDescription, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOTransitRouteDisplayStrings setPlanningDescription:](self, "setPlanningDescription:");
  }
  duration = self->_duration;
  id v8 = v4[6];
  if (duration)
  {
    if (v8) {
      -[GEOFormattedString mergeFrom:](duration, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEOTransitRouteDisplayStrings setDuration:](self, "setDuration:");
  }
  durationList = self->_durationList;
  id v10 = v4[5];
  if (durationList)
  {
    if (v10) {
      -[GEOFormattedString mergeFrom:](durationList, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[GEOTransitRouteDisplayStrings setDurationList:](self, "setDurationList:");
  }
  travelDescription = self->_travelDescription;
  id v12 = v4[8];
  if (travelDescription)
  {
    if (v12) {
      -[GEOFormattedString mergeFrom:](travelDescription, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[GEOTransitRouteDisplayStrings setTravelDescription:](self, "setTravelDescription:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v4[3];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        -[GEOTransitRouteDisplayStrings addAdvisory:](self, "addAdvisory:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  badge = self->_badge;
  id v19 = v4[4];
  if (badge)
  {
    if (v19) {
      -[GEOFormattedString mergeFrom:](badge, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[GEOTransitRouteDisplayStrings setBadge:](self, "setBadge:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTransitRouteDisplayStringsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1141);
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
  *(unsigned char *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitRouteDisplayStrings *)self readAll:0];
    [(GEOFormattedString *)self->_planningDescription clearUnknownFields:1];
    [(GEOFormattedString *)self->_duration clearUnknownFields:1];
    [(GEOFormattedString *)self->_durationList clearUnknownFields:1];
    [(GEOFormattedString *)self->_travelDescription clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_advisorys;
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

    [(GEOFormattedString *)self->_badge clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_travelDescription, 0);
  objc_storeStrong((id *)&self->_planningDescription, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_durationList, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_advisorys, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOServerFormattedString)planningDescriptionFormatString
{
  if ([(GEOTransitRouteDisplayStrings *)self hasPlanningDescription])
  {
    BOOL v3 = [(GEOTransitRouteDisplayStrings *)self planningDescription];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (GEOServerFormattedString *)v3;
}

- (GEOServerFormattedString)previewDurationFormatString
{
  if ([(GEOTransitRouteDisplayStrings *)self hasDuration])
  {
    BOOL v3 = [(GEOTransitRouteDisplayStrings *)self duration];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (GEOServerFormattedString *)v3;
}

- (GEOServerFormattedString)pickingDurationFormatString
{
  if ([(GEOTransitRouteDisplayStrings *)self hasDurationList])
  {
    BOOL v3 = [(GEOTransitRouteDisplayStrings *)self durationList];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (GEOServerFormattedString *)v3;
}

- (GEOServerFormattedString)transitDescriptionFormatString
{
  if ([(GEOTransitRouteDisplayStrings *)self hasTravelDescription])
  {
    BOOL v3 = [(GEOTransitRouteDisplayStrings *)self travelDescription];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (GEOServerFormattedString *)v3;
}

- (GEOServerFormattedString)transitRouteBadge
{
  if ([(GEOTransitRouteDisplayStrings *)self hasBadge])
  {
    BOOL v3 = [(GEOTransitRouteDisplayStrings *)self badge];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (GEOServerFormattedString *)v3;
}

@end