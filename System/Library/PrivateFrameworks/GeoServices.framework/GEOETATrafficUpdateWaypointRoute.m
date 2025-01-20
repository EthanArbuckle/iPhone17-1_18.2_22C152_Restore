@interface GEOETATrafficUpdateWaypointRoute
+ (BOOL)isValid:(id)a3;
+ (Class)incidentsOnUserWaypointRouteType;
+ (Class)newWaypointRoutesType;
+ (Class)routeLegType;
+ (Class)trafficBannerTextType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIdentifier;
- (BOOL)hasNavigabilityInfo;
- (BOOL)hasTraversalTimes;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOETATrafficUpdateWaypointRoute)init;
- (GEOETATrafficUpdateWaypointRoute)initWithData:(id)a3;
- (GEOETATrafficUpdateWaypointRoute)initWithDictionary:(id)a3;
- (GEOETATrafficUpdateWaypointRoute)initWithJSON:(id)a3;
- (GEONavigabilityInfo)navigabilityInfo;
- (GEOTraversalTimes)traversalTimes;
- (NSMutableArray)incidentsOnUserWaypointRoutes;
- (NSMutableArray)newWaypointRoutes;
- (NSMutableArray)routeLegs;
- (NSMutableArray)trafficBannerTexts;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)incidentsOnUserWaypointRouteAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)newWaypointRoutesAtIndex:(unint64_t)a3;
- (id)routeLegAtIndex:(unint64_t)a3;
- (id)trafficBannerTextAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)incidentsOnUserWaypointRoutesCount;
- (unint64_t)newWaypointRoutesCount;
- (unint64_t)routeLegsCount;
- (unint64_t)trafficBannerTextsCount;
- (unsigned)identifier;
- (void)_addNoFlagsIncidentsOnUserWaypointRoute:(uint64_t)a1;
- (void)_addNoFlagsNewWaypointRoutes:(uint64_t)a1;
- (void)_addNoFlagsRouteLeg:(uint64_t)a1;
- (void)_addNoFlagsTrafficBannerText:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readIncidentsOnUserWaypointRoutes;
- (void)_readNavigabilityInfo;
- (void)_readNewWaypointRoutes;
- (void)_readRouteLegs;
- (void)_readTrafficBannerTexts;
- (void)_readTraversalTimes;
- (void)addIncidentsOnUserWaypointRoute:(id)a3;
- (void)addNewWaypointRoutes:(id)a3;
- (void)addRouteLeg:(id)a3;
- (void)addTrafficBannerText:(id)a3;
- (void)clearIncidentsOnUserWaypointRoutes;
- (void)clearNewWaypointRoutes;
- (void)clearRouteLegs;
- (void)clearTrafficBannerTexts;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setIdentifier:(unsigned int)a3;
- (void)setIncidentsOnUserWaypointRoutes:(id)a3;
- (void)setNavigabilityInfo:(id)a3;
- (void)setNewWaypointRoutes:(id)a3;
- (void)setRouteLegs:(id)a3;
- (void)setTrafficBannerTexts:(id)a3;
- (void)setTraversalTimes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOETATrafficUpdateWaypointRoute

- (GEOETATrafficUpdateWaypointRoute)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOETATrafficUpdateWaypointRoute;
  v2 = [(GEOETATrafficUpdateWaypointRoute *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOETATrafficUpdateWaypointRoute)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOETATrafficUpdateWaypointRoute;
  v3 = [(GEOETATrafficUpdateWaypointRoute *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasIdentifier
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readRouteLegs
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
        GEOETATrafficUpdateWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteLegs_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)routeLegs
{
  -[GEOETATrafficUpdateWaypointRoute _readRouteLegs]((uint64_t)self);
  routeLegs = self->_routeLegs;

  return routeLegs;
}

- (void)setRouteLegs:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  routeLegs = self->_routeLegs;
  self->_routeLegs = v4;
}

- (void)clearRouteLegs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  routeLegs = self->_routeLegs;

  [(NSMutableArray *)routeLegs removeAllObjects];
}

- (void)addRouteLeg:(id)a3
{
  id v4 = a3;
  -[GEOETATrafficUpdateWaypointRoute _readRouteLegs]((uint64_t)self);
  -[GEOETATrafficUpdateWaypointRoute _addNoFlagsRouteLeg:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsRouteLeg:(uint64_t)a1
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

- (unint64_t)routeLegsCount
{
  -[GEOETATrafficUpdateWaypointRoute _readRouteLegs]((uint64_t)self);
  routeLegs = self->_routeLegs;

  return [(NSMutableArray *)routeLegs count];
}

- (id)routeLegAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateWaypointRoute _readRouteLegs]((uint64_t)self);
  routeLegs = self->_routeLegs;

  return (id)[(NSMutableArray *)routeLegs objectAtIndex:a3];
}

+ (Class)routeLegType
{
  return (Class)objc_opt_class();
}

- (void)_readTraversalTimes
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
        GEOETATrafficUpdateWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTraversalTimes_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTraversalTimes
{
  return self->_traversalTimes != 0;
}

- (GEOTraversalTimes)traversalTimes
{
  -[GEOETATrafficUpdateWaypointRoute _readTraversalTimes]((uint64_t)self);
  traversalTimes = self->_traversalTimes;

  return traversalTimes;
}

- (void)setTraversalTimes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_traversalTimes, a3);
}

- (void)_readIncidentsOnUserWaypointRoutes
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
        GEOETATrafficUpdateWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentsOnUserWaypointRoutes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)incidentsOnUserWaypointRoutes
{
  -[GEOETATrafficUpdateWaypointRoute _readIncidentsOnUserWaypointRoutes]((uint64_t)self);
  incidentsOnUserWaypointRoutes = self->_incidentsOnUserWaypointRoutes;

  return incidentsOnUserWaypointRoutes;
}

- (void)setIncidentsOnUserWaypointRoutes:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  incidentsOnUserWaypointRoutes = self->_incidentsOnUserWaypointRoutes;
  self->_incidentsOnUserWaypointRoutes = v4;
}

- (void)clearIncidentsOnUserWaypointRoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  incidentsOnUserWaypointRoutes = self->_incidentsOnUserWaypointRoutes;

  [(NSMutableArray *)incidentsOnUserWaypointRoutes removeAllObjects];
}

- (void)addIncidentsOnUserWaypointRoute:(id)a3
{
  id v4 = a3;
  -[GEOETATrafficUpdateWaypointRoute _readIncidentsOnUserWaypointRoutes]((uint64_t)self);
  -[GEOETATrafficUpdateWaypointRoute _addNoFlagsIncidentsOnUserWaypointRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsIncidentsOnUserWaypointRoute:(uint64_t)a1
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

- (unint64_t)incidentsOnUserWaypointRoutesCount
{
  -[GEOETATrafficUpdateWaypointRoute _readIncidentsOnUserWaypointRoutes]((uint64_t)self);
  incidentsOnUserWaypointRoutes = self->_incidentsOnUserWaypointRoutes;

  return [(NSMutableArray *)incidentsOnUserWaypointRoutes count];
}

- (id)incidentsOnUserWaypointRouteAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateWaypointRoute _readIncidentsOnUserWaypointRoutes]((uint64_t)self);
  incidentsOnUserWaypointRoutes = self->_incidentsOnUserWaypointRoutes;

  return (id)[(NSMutableArray *)incidentsOnUserWaypointRoutes objectAtIndex:a3];
}

+ (Class)incidentsOnUserWaypointRouteType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficBannerTexts
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
        GEOETATrafficUpdateWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficBannerTexts_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)trafficBannerTexts
{
  -[GEOETATrafficUpdateWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  trafficBannerTexts = self->_trafficBannerTexts;

  return trafficBannerTexts;
}

- (void)setTrafficBannerTexts:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  trafficBannerTexts = self->_trafficBannerTexts;
  self->_trafficBannerTexts = v4;
}

- (void)clearTrafficBannerTexts
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  trafficBannerTexts = self->_trafficBannerTexts;

  [(NSMutableArray *)trafficBannerTexts removeAllObjects];
}

- (void)addTrafficBannerText:(id)a3
{
  id v4 = a3;
  -[GEOETATrafficUpdateWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  -[GEOETATrafficUpdateWaypointRoute _addNoFlagsTrafficBannerText:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsTrafficBannerText:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)trafficBannerTextsCount
{
  -[GEOETATrafficUpdateWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  trafficBannerTexts = self->_trafficBannerTexts;

  return [(NSMutableArray *)trafficBannerTexts count];
}

- (id)trafficBannerTextAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  trafficBannerTexts = self->_trafficBannerTexts;

  return (id)[(NSMutableArray *)trafficBannerTexts objectAtIndex:a3];
}

+ (Class)trafficBannerTextType
{
  return (Class)objc_opt_class();
}

- (void)_readNewWaypointRoutes
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
        GEOETATrafficUpdateWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNewWaypointRoutes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)newWaypointRoutes
{
  -[GEOETATrafficUpdateWaypointRoute _readNewWaypointRoutes]((uint64_t)self);
  newWaypointRoutes = self->_newWaypointRoutes;

  return newWaypointRoutes;
}

- (void)setNewWaypointRoutes:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  newWaypointRoutes = self->_newWaypointRoutes;
  self->_newWaypointRoutes = v4;
}

- (void)clearNewWaypointRoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  newWaypointRoutes = self->_newWaypointRoutes;

  [(NSMutableArray *)newWaypointRoutes removeAllObjects];
}

- (void)addNewWaypointRoutes:(id)a3
{
  id v4 = a3;
  -[GEOETATrafficUpdateWaypointRoute _readNewWaypointRoutes]((uint64_t)self);
  -[GEOETATrafficUpdateWaypointRoute _addNoFlagsNewWaypointRoutes:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsNewWaypointRoutes:(uint64_t)a1
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

- (unint64_t)newWaypointRoutesCount
{
  -[GEOETATrafficUpdateWaypointRoute _readNewWaypointRoutes]((uint64_t)self);
  newWaypointRoutes = self->_newWaypointRoutes;

  return [(NSMutableArray *)newWaypointRoutes count];
}

- (id)newWaypointRoutesAtIndex:(unint64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)newWaypointRoutesType
{
  return (Class)objc_claimAutoreleasedReturnValue();
}

- (void)_readNavigabilityInfo
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
        GEOETATrafficUpdateWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNavigabilityInfo_tags_1750);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasNavigabilityInfo
{
  return self->_navigabilityInfo != 0;
}

- (GEONavigabilityInfo)navigabilityInfo
{
  -[GEOETATrafficUpdateWaypointRoute _readNavigabilityInfo]((uint64_t)self);
  navigabilityInfo = self->_navigabilityInfo;

  return navigabilityInfo;
}

- (void)setNavigabilityInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_navigabilityInfo, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOETATrafficUpdateWaypointRoute;
  id v4 = [(GEOETATrafficUpdateWaypointRoute *)&v8 description];
  id v5 = [(GEOETATrafficUpdateWaypointRoute *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETATrafficUpdateWaypointRoute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(_WORD *)(a1 + 88))
    {
      id v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
      [v4 setObject:v5 forKey:@"identifier"];
    }
    if ([*(id *)(a1 + 48) count])
    {
      objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v7 = *(id *)(a1 + 48);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v71 objects:v78 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v72;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v72 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            v13 = [v12 dictionaryRepresentation];
            }
            [v6 addObject:v13];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v71 objects:v78 count:16];
        }
        while (v9);
      }

      if (a2) {
        v14 = @"routeLeg";
      }
      else {
        v14 = @"route_leg";
      }
      [v4 setObject:v6 forKey:v14];
    }
    v15 = [(id)a1 traversalTimes];
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"traversalTimes";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"traversal_times";
      }
      [v4 setObject:v17 forKey:v18];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v20 = *(id *)(a1 + 24);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v67 objects:v77 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v68;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v68 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v67 + 1) + 8 * j);
            if (a2) {
              [v25 jsonRepresentation];
            }
            else {
            v26 = [v25 dictionaryRepresentation];
            }
            [v19 addObject:v26];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v67 objects:v77 count:16];
        }
        while (v22);
      }

      if (a2) {
        v27 = @"incidentsOnUserWaypointRoute";
      }
      else {
        v27 = @"incidents_on_user_waypoint_route";
      }
      [v4 setObject:v19 forKey:v27];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v29 = *(id *)(a1 + 56);
      uint64_t v30 = [v29 countByEnumeratingWithState:&v63 objects:v76 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v64;
        do
        {
          for (uint64_t k = 0; k != v31; ++k)
          {
            if (*(void *)v64 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v63 + 1) + 8 * k);
            if (a2) {
              [v34 jsonRepresentation];
            }
            else {
            v35 = [v34 dictionaryRepresentation];
            }
            [v28 addObject:v35];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v63 objects:v76 count:16];
        }
        while (v31);
      }

      if (a2) {
        v36 = @"trafficBannerText";
      }
      else {
        v36 = @"traffic_banner_text";
      }
      [v4 setObject:v28 forKey:v36];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v38 = *(id *)(a1 + 40);
      uint64_t v39 = [v38 countByEnumeratingWithState:&v59 objects:v75 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v60;
        do
        {
          for (uint64_t m = 0; m != v40; ++m)
          {
            if (*(void *)v60 != v41) {
              objc_enumerationMutation(v38);
            }
            v43 = *(void **)(*((void *)&v59 + 1) + 8 * m);
            if (a2) {
              [v43 jsonRepresentation];
            }
            else {
            v44 = [v43 dictionaryRepresentation];
            }
            [v37 addObject:v44];
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v59 objects:v75 count:16];
        }
        while (v40);
      }

      if (a2) {
        v45 = @"newWaypointRoutes";
      }
      else {
        v45 = @"new_waypoint_routes";
      }
      [v4 setObject:v37 forKey:v45];
    }
    v46 = [(id)a1 navigabilityInfo];
    v47 = v46;
    if (v46)
    {
      if (a2)
      {
        v48 = [v46 jsonRepresentation];
        v49 = @"navigabilityInfo";
      }
      else
      {
        v48 = [v46 dictionaryRepresentation];
        v49 = @"navigability_info";
      }
      [v4 setObject:v48 forKey:v49];
    }
    v50 = *(void **)(a1 + 16);
    if (v50)
    {
      v51 = [v50 dictionaryRepresentation];
      v52 = v51;
      if (a2)
      {
        v53 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v51, "count"));
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __62__GEOETATrafficUpdateWaypointRoute__dictionaryRepresentation___block_invoke;
        v57[3] = &unk_1E53D8860;
        id v54 = v53;
        id v58 = v54;
        [v52 enumerateKeysAndObjectsUsingBlock:v57];
        id v55 = v54;

        v52 = v55;
      }
      [v4 setObject:v52 forKey:@"Unknown Fields"];
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
  return -[GEOETATrafficUpdateWaypointRoute _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __62__GEOETATrafficUpdateWaypointRoute__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (GEOETATrafficUpdateWaypointRoute)initWithDictionary:(id)a3
{
  return (GEOETATrafficUpdateWaypointRoute *)-[GEOETATrafficUpdateWaypointRoute _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"identifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIdentifier:", objc_msgSend(v6, "unsignedIntValue"));
      }

      if (a3) {
        id v7 = @"routeLeg";
      }
      else {
        id v7 = @"route_leg";
      }
      uint64_t v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      id v62 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v75 objects:v82 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v76;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v76 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v75 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v15 = [GEOETARoute alloc];
                if (a3) {
                  uint64_t v16 = [(GEOETARoute *)v15 initWithJSON:v14];
                }
                else {
                  uint64_t v16 = [(GEOETARoute *)v15 initWithDictionary:v14];
                }
                v17 = (void *)v16;
                [a1 addRouteLeg:v16];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v75 objects:v82 count:16];
          }
          while (v11);
        }

        id v5 = v62;
      }

      if (a3) {
        v18 = @"traversalTimes";
      }
      else {
        v18 = @"traversal_times";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = [GEOTraversalTimes alloc];
        if (a3) {
          uint64_t v21 = [(GEOTraversalTimes *)v20 initWithJSON:v19];
        }
        else {
          uint64_t v21 = [(GEOTraversalTimes *)v20 initWithDictionary:v19];
        }
        uint64_t v22 = (void *)v21;
        [a1 setTraversalTimes:v21];
      }
      if (a3) {
        uint64_t v23 = @"incidentsOnUserWaypointRoute";
      }
      else {
        uint64_t v23 = @"incidents_on_user_waypoint_route";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v71 objects:v81 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v72;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v72 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v71 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v31 = [GEORouteIncident alloc];
                if (a3) {
                  uint64_t v32 = [(GEORouteIncident *)v31 initWithJSON:v30];
                }
                else {
                  uint64_t v32 = [(GEORouteIncident *)v31 initWithDictionary:v30];
                }
                v33 = (void *)v32;
                [a1 addIncidentsOnUserWaypointRoute:v32];
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v71 objects:v81 count:16];
          }
          while (v27);
        }

        id v5 = v62;
      }

      if (a3) {
        v34 = @"trafficBannerText";
      }
      else {
        v34 = @"traffic_banner_text";
      }
      v35 = [v5 objectForKeyedSubscript:v34];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v36 = v35;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v67 objects:v80 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v68;
          do
          {
            for (uint64_t k = 0; k != v38; ++k)
            {
              if (*(void *)v68 != v39) {
                objc_enumerationMutation(v36);
              }
              uint64_t v41 = *(void *)(*((void *)&v67 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v42 = [GEOTrafficBannerText alloc];
                if (a3) {
                  uint64_t v43 = [(GEOTrafficBannerText *)v42 initWithJSON:v41];
                }
                else {
                  uint64_t v43 = [(GEOTrafficBannerText *)v42 initWithDictionary:v41];
                }
                v44 = (void *)v43;
                [a1 addTrafficBannerText:v43];
              }
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v67 objects:v80 count:16];
          }
          while (v38);
        }

        id v5 = v62;
      }

      if (a3) {
        v45 = @"newWaypointRoutes";
      }
      else {
        v45 = @"new_waypoint_routes";
      }
      v46 = [v5 objectForKeyedSubscript:v45];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v47 = v46;
        uint64_t v48 = [v47 countByEnumeratingWithState:&v63 objects:v79 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v64;
          do
          {
            for (uint64_t m = 0; m != v49; ++m)
            {
              if (*(void *)v64 != v50) {
                objc_enumerationMutation(v47);
              }
              uint64_t v52 = *(void *)(*((void *)&v63 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v53 = [GEOWaypointRoute alloc];
                if (a3) {
                  uint64_t v54 = [(GEOWaypointRoute *)v53 initWithJSON:v52];
                }
                else {
                  uint64_t v54 = [(GEOWaypointRoute *)v53 initWithDictionary:v52];
                }
                id v55 = (void *)v54;
                [a1 addNewWaypointRoutes:v54];
              }
            }
            uint64_t v49 = [v47 countByEnumeratingWithState:&v63 objects:v79 count:16];
          }
          while (v49);
        }

        id v5 = v62;
      }

      if (a3) {
        v56 = @"navigabilityInfo";
      }
      else {
        v56 = @"navigability_info";
      }
      v57 = [v5 objectForKeyedSubscript:v56];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v58 = [GEONavigabilityInfo alloc];
        if (a3) {
          uint64_t v59 = [(GEONavigabilityInfo *)v58 initWithJSON:v57];
        }
        else {
          uint64_t v59 = [(GEONavigabilityInfo *)v58 initWithDictionary:v57];
        }
        long long v60 = (void *)v59;
        [a1 setNavigabilityInfo:v59];
      }
    }
  }

  return a1;
}

- (GEOETATrafficUpdateWaypointRoute)initWithJSON:(id)a3
{
  return (GEOETATrafficUpdateWaypointRoute *)-[GEOETATrafficUpdateWaypointRoute _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_1779;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_1780;
    }
    GEOETATrafficUpdateWaypointRouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOETATrafficUpdateWaypointRouteCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOETATrafficUpdateWaypointRouteIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOETATrafficUpdateWaypointRouteReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOETATrafficUpdateWaypointRouteIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v22 = self->_reader;
    objc_sync_enter(v22);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v23 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v23];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v22);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOETATrafficUpdateWaypointRoute *)self readAll:0];
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    objc_super v6 = self->_routeLegs;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v37 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v7);
    }

    if (self->_traversalTimes) {
      PBDataWriterWriteSubmessage();
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v10 = self->_incidentsOnUserWaypointRoutes;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v11);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v14 = self->_trafficBannerTexts;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v41 count:16];
      }
      while (v15);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v18 = self->_newWaypointRoutes;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t m = 0; m != v19; ++m)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v40 count:16];
      }
      while (v19);
    }

    if (self->_navigabilityInfo) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v24);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  -[GEOETATrafficUpdateWaypointRoute _readIncidentsOnUserWaypointRoutes]((uint64_t)self);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = self->_incidentsOnUserWaypointRoutes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v37 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v36 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        goto LABEL_34;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v36 objects:v43 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEOETATrafficUpdateWaypointRoute _readNewWaypointRoutes]((uint64_t)self);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = self->_newWaypointRoutes;
  uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
LABEL_11:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v33 != v12) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v32 + 1) + 8 * v13) hasGreenTeaWithValue:v3]) {
        goto LABEL_34;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v32 objects:v42 count:16];
        if (v11) {
          goto LABEL_11;
        }
        break;
      }
    }
  }

  -[GEOETATrafficUpdateWaypointRoute _readRouteLegs]((uint64_t)self);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = self->_routeLegs;
  uint64_t v14 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v41 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
LABEL_19:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v29 != v16) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v28 + 1) + 8 * v17) hasGreenTeaWithValue:v3]) {
        goto LABEL_34;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v41 count:16];
        if (v15) {
          goto LABEL_19;
        }
        break;
      }
    }
  }

  -[GEOETATrafficUpdateWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = self->_trafficBannerTexts;
  uint64_t v18 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
LABEL_27:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v25 != v20) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v21), "hasGreenTeaWithValue:", v3, (void)v24)) {
        break;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v40 count:16];
        if (v19) {
          goto LABEL_27;
        }
        goto LABEL_33;
      }
    }
LABEL_34:
    BOOL v22 = 1;
    goto LABEL_35;
  }
LABEL_33:
  BOOL v22 = 0;
LABEL_35:

  return v22;
}

- (void)copyTo:(id)a3
{
  uint64_t v20 = (id *)a3;
  [(GEOETATrafficUpdateWaypointRoute *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v20 + 1, self->_reader);
  *((_DWORD *)v20 + 18) = self->_readerMarkPos;
  *((_DWORD *)v20 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(_WORD *)&self->_flags)
  {
    *((_DWORD *)v20 + 21) = self->_identifier;
    *((_WORD *)v20 + 44) |= 1u;
  }
  if ([(GEOETATrafficUpdateWaypointRoute *)self routeLegsCount])
  {
    [v20 clearRouteLegs];
    unint64_t v4 = [(GEOETATrafficUpdateWaypointRoute *)self routeLegsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOETATrafficUpdateWaypointRoute *)self routeLegAtIndex:i];
        [v20 addRouteLeg:v7];
      }
    }
  }
  if (self->_traversalTimes) {
    objc_msgSend(v20, "setTraversalTimes:");
  }
  if ([(GEOETATrafficUpdateWaypointRoute *)self incidentsOnUserWaypointRoutesCount])
  {
    [v20 clearIncidentsOnUserWaypointRoutes];
    unint64_t v8 = [(GEOETATrafficUpdateWaypointRoute *)self incidentsOnUserWaypointRoutesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOETATrafficUpdateWaypointRoute *)self incidentsOnUserWaypointRouteAtIndex:j];
        [v20 addIncidentsOnUserWaypointRoute:v11];
      }
    }
  }
  if ([(GEOETATrafficUpdateWaypointRoute *)self trafficBannerTextsCount])
  {
    [v20 clearTrafficBannerTexts];
    unint64_t v12 = [(GEOETATrafficUpdateWaypointRoute *)self trafficBannerTextsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOETATrafficUpdateWaypointRoute *)self trafficBannerTextAtIndex:k];
        [v20 addTrafficBannerText:v15];
      }
    }
  }
  if ([(GEOETATrafficUpdateWaypointRoute *)self newWaypointRoutesCount])
  {
    [v20 clearNewWaypointRoutes];
    unint64_t v16 = [(GEOETATrafficUpdateWaypointRoute *)self newWaypointRoutesCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        id v19 = [(GEOETATrafficUpdateWaypointRoute *)self newWaypointRoutesAtIndex:m];
        [v20 addNewWaypointRoutes:v19];
      }
    }
  }
  if (self->_navigabilityInfo) {
    objc_msgSend(v20, "setNavigabilityInfo:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
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
      GEOETATrafficUpdateWaypointRouteReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_36;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOETATrafficUpdateWaypointRoute *)self readAll:0];
  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 84) = self->_identifier;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  unint64_t v9 = self->_routeLegs;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v48 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addRouteLeg:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v10);
  }

  id v14 = [(GEOTraversalTimes *)self->_traversalTimes copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  unint64_t v16 = self->_incidentsOnUserWaypointRoutes;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v44 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addIncidentsOnUserWaypointRoute:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v17);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v21 = self->_trafficBannerTexts;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(v21);
        }
        long long v25 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addTrafficBannerText:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v22);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v26 = self->_newWaypointRoutes;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v35 objects:v51 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v36;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(v26);
        }
        long long v30 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * m), "copyWithZone:", a3, (void)v35);
        [(id)v5 addNewWaypointRoutes:v30];
      }
      uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v35 objects:v51 count:16];
    }
    while (v27);
  }

  id v31 = [(GEONavigabilityInfo *)self->_navigabilityInfo copyWithZone:a3];
  long long v32 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v31;

  long long v33 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v33;
LABEL_36:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEOETATrafficUpdateWaypointRoute *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 44);
  if (*(_WORD *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_identifier != *((_DWORD *)v4 + 21)) {
      goto LABEL_19;
    }
  }
  else if (v5)
  {
LABEL_19:
    char v12 = 0;
    goto LABEL_20;
  }
  routeLegs = self->_routeLegs;
  if ((unint64_t)routeLegs | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](routeLegs, "isEqual:"))
  {
    goto LABEL_19;
  }
  traversalTimes = self->_traversalTimes;
  if ((unint64_t)traversalTimes | *((void *)v4 + 8))
  {
    if (!-[GEOTraversalTimes isEqual:](traversalTimes, "isEqual:")) {
      goto LABEL_19;
    }
  }
  incidentsOnUserWaypointRoutes = self->_incidentsOnUserWaypointRoutes;
  if ((unint64_t)incidentsOnUserWaypointRoutes | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](incidentsOnUserWaypointRoutes, "isEqual:")) {
      goto LABEL_19;
    }
  }
  trafficBannerTexts = self->_trafficBannerTexts;
  if ((unint64_t)trafficBannerTexts | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](trafficBannerTexts, "isEqual:")) {
      goto LABEL_19;
    }
  }
  newWaypointRoutes = self->_newWaypointRoutes;
  if ((unint64_t)newWaypointRoutes | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](newWaypointRoutes, "isEqual:")) {
      goto LABEL_19;
    }
  }
  navigabilityInfo = self->_navigabilityInfo;
  if ((unint64_t)navigabilityInfo | *((void *)v4 + 4)) {
    char v12 = -[GEONavigabilityInfo isEqual:](navigabilityInfo, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_20:

  return v12;
}

- (unint64_t)hash
{
  [(GEOETATrafficUpdateWaypointRoute *)self readAll:1];
  if (*(_WORD *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_identifier;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_routeLegs hash] ^ v3;
  unint64_t v5 = [(GEOTraversalTimes *)self->_traversalTimes hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_incidentsOnUserWaypointRoutes hash];
  uint64_t v7 = [(NSMutableArray *)self->_trafficBannerTexts hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_newWaypointRoutes hash];
  return v6 ^ v8 ^ [(GEONavigabilityInfo *)self->_navigabilityInfo hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((_WORD *)v4 + 44))
  {
    self->_identifier = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 1u;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v5 = *((id *)v4 + 6);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOETATrafficUpdateWaypointRoute *)self addRouteLeg:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v7);
  }

  traversalTimes = self->_traversalTimes;
  uint64_t v11 = *((void *)v4 + 8);
  if (traversalTimes)
  {
    if (v11) {
      -[GEOTraversalTimes mergeFrom:](traversalTimes, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOETATrafficUpdateWaypointRoute setTraversalTimes:](self, "setTraversalTimes:");
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v12 = *((id *)v4 + 3);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v12);
        }
        [(GEOETATrafficUpdateWaypointRoute *)self addIncidentsOnUserWaypointRoute:*(void *)(*((void *)&v37 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v14);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v17 = *((id *)v4 + 7);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        [(GEOETATrafficUpdateWaypointRoute *)self addTrafficBannerText:*(void *)(*((void *)&v33 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v19);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v22 = *((id *)v4 + 5);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        -[GEOETATrafficUpdateWaypointRoute addNewWaypointRoutes:](self, "addNewWaypointRoutes:", *(void *)(*((void *)&v29 + 1) + 8 * m), (void)v29);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v45 count:16];
    }
    while (v24);
  }

  navigabilityInfo = self->_navigabilityInfo;
  uint64_t v28 = *((void *)v4 + 4);
  if (navigabilityInfo)
  {
    if (v28) {
      -[GEONavigabilityInfo mergeFrom:](navigabilityInfo, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[GEOETATrafficUpdateWaypointRoute setNavigabilityInfo:](self, "setNavigabilityInfo:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOETATrafficUpdateWaypointRouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1784);
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
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x102u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOETATrafficUpdateWaypointRoute *)self readAll:0];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v7 = self->_routeLegs;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v9);
    }

    [(GEOTraversalTimes *)self->_traversalTimes clearUnknownFields:1];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = self->_incidentsOnUserWaypointRoutes;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v14);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v17 = self->_trafficBannerTexts;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * v21++) clearUnknownFields:1];
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
      }
      while (v19);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v22 = self->_newWaypointRoutes;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v28;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(v22);
          }
          objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v26++), "clearUnknownFields:", 1, (void)v27);
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
      }
      while (v24);
    }

    [(GEONavigabilityInfo *)self->_navigabilityInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traversalTimes, 0);
  objc_storeStrong((id *)&self->_trafficBannerTexts, 0);
  objc_storeStrong((id *)&self->_routeLegs, 0);
  objc_storeStrong((id *)&self->_newWaypointRoutes, 0);
  objc_storeStrong((id *)&self->_navigabilityInfo, 0);
  objc_storeStrong((id *)&self->_incidentsOnUserWaypointRoutes, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end