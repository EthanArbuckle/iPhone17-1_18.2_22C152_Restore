@interface GEOPDRecentRouteInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDRecentRouteInfo)init;
- (GEOPDRecentRouteInfo)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)zilchPointSegments;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)_addNoFlagsZilchPointSegment:(uint64_t)a1;
- (void)_readEtaFilter;
- (void)_readZilchPointSegments;
- (void)addZilchPointSegment:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setEtaFilter:(uint64_t)a1;
- (void)setEvChargingMetadata:(uint64_t)a1;
- (void)setOriginalWaypointRoute:(uint64_t)a1;
- (void)setRouteId:(uint64_t)a1;
- (void)setSessionState:(uint64_t)a1;
- (void)setZilchPoints:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDRecentRouteInfo

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  -[GEOPDRecentRouteInfo readAll:]((uint64_t)v3, 0);
  v4 = (void *)*((void *)v3 + 9);
  if (v4) {
    -[GEOPDRecentRouteInfo setZilchPoints:](a1, v4);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = *((id *)v3 + 8);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOPDRecentRouteInfo addZilchPointSegment:](a1, *(void **)(*((void *)&v15 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v10 = (void *)*((void *)v3 + 5);
  if (v10) {
    -[GEOPDRecentRouteInfo setOriginalWaypointRoute:](a1, v10);
  }
  v11 = (void *)*((void *)v3 + 7);
  if (v11) {
    -[GEOPDRecentRouteInfo setSessionState:](a1, v11);
  }
  v12 = (void *)*((void *)v3 + 6);
  if (v12) {
    -[GEOPDRecentRouteInfo setRouteId:](a1, v12);
  }
  if (*((_WORD *)v3 + 48))
  {
    *(_DWORD *)(a1 + 92) = *((_DWORD *)v3 + 23);
    *(_WORD *)(a1 + 96) |= 1u;
  }
  v13 = (void *)*((void *)v3 + 3);
  if (v13) {
    -[GEOPDRecentRouteInfo setEtaFilter:](a1, v13);
  }
  v14 = (void *)*((void *)v3 + 4);
  if (v14) {
    -[GEOPDRecentRouteInfo setEvChargingMetadata:](a1, v14);
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 2u;
    *(_WORD *)(a1 + 96) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDRecentRouteInfo readAll:](a1, 0);
  }
}

- (GEOPDRecentRouteInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDRecentRouteInfo;
  v2 = [(GEOPDRecentRouteInfo *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDRecentRouteInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDRecentRouteInfo;
  id v3 = [(GEOPDRecentRouteInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)setZilchPoints:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 96) |= 0x100u;
  *(_WORD *)(a1 + 96) |= 0x200u;
  objc_storeStrong((id *)(a1 + 72), a2);
}

- (void)_readZilchPointSegments
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDRecentRouteInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readZilchPointSegments_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)zilchPointSegments
{
  -[GEOPDRecentRouteInfo _readZilchPointSegments](a1);
  v2 = *(void **)(a1 + 64);

  return v2;
}

- (void)addZilchPointSegment:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDRecentRouteInfo _readZilchPointSegments](a1);
    -[GEOPDRecentRouteInfo _addNoFlagsZilchPointSegment:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 96) |= 0x200u;
  }
}

- (void)_addNoFlagsZilchPointSegment:(uint64_t)a1
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

- (void)setOriginalWaypointRoute:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 0x10u;
    *(_WORD *)(a1 + 96) |= 0x200u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setSessionState:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 0x40u;
    *(_WORD *)(a1 + 96) |= 0x200u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)setRouteId:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 0x20u;
    *(_WORD *)(a1 + 96) |= 0x200u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)_readEtaFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDRecentRouteInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtaFilter_tags_6438);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)setEtaFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 4u;
    *(_WORD *)(a1 + 96) |= 0x200u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setEvChargingMetadata:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 96) |= 8u;
  *(_WORD *)(a1 + 96) |= 0x200u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDRecentRouteInfo;
  id v4 = [(GEOPDRecentRouteInfo *)&v8 description];
  id v5 = [(GEOPDRecentRouteInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDRecentRouteInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_66;
  }
  -[GEOPDRecentRouteInfo readAll:](a1, 1);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
  {
    id v5 = *(void **)(a1 + 8);
    if (v5)
    {
      id v6 = v5;
      objc_sync_enter(v6);
      GEOPDRecentRouteInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readZilchPoints_tags_0);
      objc_sync_exit(v6);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  id v7 = *(id *)(a1 + 72);
  if (!v7)
  {
    if (!*(void *)(a1 + 64)) {
      goto LABEL_21;
    }
    if (a2)
    {
LABEL_11:
      v10 = (void *)MEMORY[0x1E4F1CA48];
      v11 = -[GEOPDRecentRouteInfo zilchPointSegments](a1);
      v12 = objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));

      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v13 = -[GEOPDRecentRouteInfo zilchPointSegments](a1);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v55 != v15) {
              objc_enumerationMutation(v13);
            }
            long long v17 = [*(id *)(*((void *)&v54 + 1) + 8 * i) base64EncodedStringWithOptions:0];
            [v12 addObject:v17];
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v54 objects:v58 count:16];
        }
        while (v14);
      }

      [v4 setObject:v12 forKey:@"zilchPointSegment"];
      goto LABEL_21;
    }
LABEL_20:
    long long v18 = -[GEOPDRecentRouteInfo zilchPointSegments](a1);
    [v4 setObject:v18 forKey:@"zilch_point_segment"];

    goto LABEL_21;
  }
  objc_super v8 = v7;
  if ((a2 & 1) == 0)
  {
    [v4 setObject:v7 forKey:@"zilch_points"];

    if (!*(void *)(a1 + 64)) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  uint64_t v9 = [v7 base64EncodedStringWithOptions:0];
  [v4 setObject:v9 forKey:@"zilchPoints"];

  if (*(void *)(a1 + 64)) {
    goto LABEL_11;
  }
LABEL_21:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 96) & 0x10) == 0)
  {
    v19 = *(void **)(a1 + 8);
    if (v19)
    {
      id v20 = v19;
      objc_sync_enter(v20);
      GEOPDRecentRouteInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalWaypointRoute_tags);
      objc_sync_exit(v20);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  id v21 = *(id *)(a1 + 40);
  v22 = v21;
  if (v21)
  {
    if (a2)
    {
      v23 = [v21 base64EncodedStringWithOptions:0];
      [v4 setObject:v23 forKey:@"originalWaypointRoute"];
    }
    else
    {
      [v4 setObject:v21 forKey:@"original_waypoint_route"];
    }
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
  {
    v24 = *(void **)(a1 + 8);
    if (v24)
    {
      id v25 = v24;
      objc_sync_enter(v25);
      GEOPDRecentRouteInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSessionState_tags);
      objc_sync_exit(v25);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  id v26 = *(id *)(a1 + 56);
  v27 = v26;
  if (v26)
  {
    if (a2)
    {
      v28 = [v26 base64EncodedStringWithOptions:0];
      [v4 setObject:v28 forKey:@"sessionState"];
    }
    else
    {
      [v4 setObject:v26 forKey:@"session_state"];
    }
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 96) & 0x20) == 0)
  {
    v29 = *(void **)(a1 + 8);
    if (v29)
    {
      id v30 = v29;
      objc_sync_enter(v30);
      GEOPDRecentRouteInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteId_tags);
      objc_sync_exit(v30);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  id v31 = *(id *)(a1 + 48);
  v32 = v31;
  if (v31)
  {
    if (a2)
    {
      v33 = [v31 base64EncodedStringWithOptions:0];
      [v4 setObject:v33 forKey:@"routeId"];
    }
    else
    {
      [v4 setObject:v31 forKey:@"route_id"];
    }
  }

  if (*(_WORD *)(a1 + 96))
  {
    uint64_t v34 = *(int *)(a1 + 92);
    if (v34 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 92));
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = off_1E53DD198[v34];
    }
    if (a2) {
      v36 = @"preferredTransportType";
    }
    else {
      v36 = @"preferred_transport_type";
    }
    [v4 setObject:v35 forKey:v36];
  }
  -[GEOPDRecentRouteInfo _readEtaFilter](a1);
  id v37 = *(id *)(a1 + 24);
  v38 = v37;
  if (v37)
  {
    if (a2)
    {
      v39 = [v37 base64EncodedStringWithOptions:0];
      [v4 setObject:v39 forKey:@"etaFilter"];
    }
    else
    {
      [v4 setObject:v37 forKey:@"eta_filter"];
    }
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 96) & 8) == 0)
  {
    v40 = *(void **)(a1 + 8);
    if (v40)
    {
      id v41 = v40;
      objc_sync_enter(v41);
      GEOPDRecentRouteInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvChargingMetadata_tags);
      objc_sync_exit(v41);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  id v42 = *(id *)(a1 + 32);
  v43 = v42;
  if (v42)
  {
    if (a2)
    {
      v44 = [v42 base64EncodedStringWithOptions:0];
      [v4 setObject:v44 forKey:@"evChargingMetadata"];
    }
    else
    {
      [v4 setObject:v42 forKey:@"ev_charging_metadata"];
    }
  }

  v45 = *(void **)(a1 + 16);
  if (v45)
  {
    v46 = [v45 dictionaryRepresentation];
    v47 = v46;
    if (a2)
    {
      v48 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v46, "count"));
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __50__GEOPDRecentRouteInfo__dictionaryRepresentation___block_invoke;
      v52[3] = &unk_1E53D8860;
      id v49 = v48;
      id v53 = v49;
      [v47 enumerateKeysAndObjectsUsingBlock:v52];
      id v50 = v49;
    }
    else
    {
      id v50 = v46;
    }
    [v4 setObject:v50 forKey:@"Unknown Fields"];
  }
LABEL_66:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDRecentRouteInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_6481;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_6482;
      }
      GEOPDRecentRouteInfoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

void __50__GEOPDRecentRouteInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_68;
  }
  if (a3) {
    id v7 = @"zilchPoints";
  }
  else {
    id v7 = @"zilch_points";
  }
  objc_super v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
    -[GEOPDRecentRouteInfo setZilchPoints:](v6, v9);
  }
  if (a3) {
    id v10 = @"zilchPointSegment";
  }
  else {
    id v10 = @"zilch_point_segment";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v39 = a3;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v41;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v41 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v40 + 1) + 8 * v16);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v17 options:0];
            -[GEOPDRecentRouteInfo addZilchPointSegment:](v6, v18);
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v14);
    }

    a3 = v39;
  }

  if (a3) {
    v19 = @"originalWaypointRoute";
  }
  else {
    v19 = @"original_waypoint_route";
  }
  id v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v20 options:0];
    -[GEOPDRecentRouteInfo setOriginalWaypointRoute:](v6, v21);
  }
  if (a3) {
    v22 = @"sessionState";
  }
  else {
    v22 = @"session_state";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v23 options:0];
    -[GEOPDRecentRouteInfo setSessionState:](v6, v24);
  }
  if (a3) {
    id v25 = @"routeId";
  }
  else {
    id v25 = @"route_id";
  }
  id v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v26 options:0];
    -[GEOPDRecentRouteInfo setRouteId:](v6, v27);
  }
  if (a3) {
    v28 = @"preferredTransportType";
  }
  else {
    v28 = @"preferred_transport_type";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = v29;
    if ([v30 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_NONE"])
    {
      int v31 = 0;
    }
    else if ([v30 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_DRIVING"])
    {
      int v31 = 1;
    }
    else if ([v30 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_WALKING"])
    {
      int v31 = 2;
    }
    else if ([v30 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_TRANSIT"])
    {
      int v31 = 3;
    }
    else if ([v30 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_RIDESHARE"])
    {
      int v31 = 4;
    }
    else if ([v30 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_CYCLING"])
    {
      int v31 = 5;
    }
    else
    {
      int v31 = 0;
    }

    goto LABEL_56;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v31 = [v29 intValue];
LABEL_56:
    *(_WORD *)(v6 + 96) |= 0x200u;
    *(_WORD *)(v6 + 96) |= 1u;
    *(_DWORD *)(v6 + 92) = v31;
  }

  if (a3) {
    v32 = @"etaFilter";
  }
  else {
    v32 = @"eta_filter";
  }
  v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v33 options:0];
    -[GEOPDRecentRouteInfo setEtaFilter:](v6, v34);
  }
  if (a3) {
    v35 = @"evChargingMetadata";
  }
  else {
    v35 = @"ev_charging_metadata";
  }
  v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v37 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v36 options:0];
    -[GEOPDRecentRouteInfo setEvChargingMetadata:](v6, v37);
  }
LABEL_68:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDRecentRouteInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3FC) == 0))
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
    -[GEOPDRecentRouteInfo readAll:]((uint64_t)self, 0);
    if (self->_zilchPoints) {
      PBDataWriterWriteDataField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = self->_zilchPointSegments;
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
          PBDataWriterWriteDataField();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_originalWaypointRoute) {
      PBDataWriterWriteDataField();
    }
    if (self->_sessionState) {
      PBDataWriterWriteDataField();
    }
    if (self->_routeId) {
      PBDataWriterWriteDataField();
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_etaFilter) {
      PBDataWriterWriteDataField();
    }
    if (self->_evChargingMetadata) {
      PBDataWriterWriteDataField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDRecentRouteInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDRecentRouteInfo readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSData *)self->_zilchPoints copyWithZone:a3];
  id v10 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v9;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v11 = self->_zilchPointSegments;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "copyWithZone:", a3, (void)v28);
        -[GEOPDRecentRouteInfo addZilchPointSegment:](v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(NSData *)self->_originalWaypointRoute copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v16;

  uint64_t v18 = [(NSData *)self->_sessionState copyWithZone:a3];
  v19 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v18;

  uint64_t v20 = [(NSData *)self->_routeId copyWithZone:a3];
  id v21 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v20;

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 92) = self->_preferredTransportType;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  uint64_t v22 = -[NSData copyWithZone:](self->_etaFilter, "copyWithZone:", a3, (void)v28);
  v23 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v22;

  uint64_t v24 = [(NSData *)self->_evChargingMetadata copyWithZone:a3];
  id v25 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v24;

  id v26 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v26;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  -[GEOPDRecentRouteInfo readAll:]((uint64_t)self, 1);
  -[GEOPDRecentRouteInfo readAll:]((uint64_t)v4, 1);
  zilchPoints = self->_zilchPoints;
  if ((unint64_t)zilchPoints | *((void *)v4 + 9))
  {
    if (!-[NSData isEqual:](zilchPoints, "isEqual:")) {
      goto LABEL_21;
    }
  }
  zilchPointSegments = self->_zilchPointSegments;
  if ((unint64_t)zilchPointSegments | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](zilchPointSegments, "isEqual:")) {
      goto LABEL_21;
    }
  }
  originalWaypointRoute = self->_originalWaypointRoute;
  if ((unint64_t)originalWaypointRoute | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](originalWaypointRoute, "isEqual:")) {
      goto LABEL_21;
    }
  }
  sessionState = self->_sessionState;
  if ((unint64_t)sessionState | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](sessionState, "isEqual:")) {
      goto LABEL_21;
    }
  }
  routeId = self->_routeId;
  if ((unint64_t)routeId | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](routeId, "isEqual:")) {
      goto LABEL_21;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 48);
  if (*(_WORD *)&self->_flags)
  {
    if ((v10 & 1) == 0 || self->_preferredTransportType != *((_DWORD *)v4 + 23)) {
      goto LABEL_21;
    }
  }
  else if (v10)
  {
LABEL_21:
    char v13 = 0;
    goto LABEL_22;
  }
  etaFilter = self->_etaFilter;
  if ((unint64_t)etaFilter | *((void *)v4 + 3) && !-[NSData isEqual:](etaFilter, "isEqual:")) {
    goto LABEL_21;
  }
  evChargingMetadata = self->_evChargingMetadata;
  if ((unint64_t)evChargingMetadata | *((void *)v4 + 4)) {
    char v13 = -[NSData isEqual:](evChargingMetadata, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_22:

  return v13;
}

- (unint64_t)hash
{
  -[GEOPDRecentRouteInfo readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSData *)self->_zilchPoints hash];
  uint64_t v4 = [(NSMutableArray *)self->_zilchPointSegments hash];
  uint64_t v5 = [(NSData *)self->_originalWaypointRoute hash];
  uint64_t v6 = [(NSData *)self->_sessionState hash];
  uint64_t v7 = [(NSData *)self->_routeId hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v8 = 2654435761 * self->_preferredTransportType;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7;
  uint64_t v10 = v8 ^ [(NSData *)self->_etaFilter hash];
  return v9 ^ v10 ^ [(NSData *)self->_evChargingMetadata hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilchPoints, 0);
  objc_storeStrong((id *)&self->_zilchPointSegments, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_routeId, 0);
  objc_storeStrong((id *)&self->_originalWaypointRoute, 0);
  objc_storeStrong((id *)&self->_evChargingMetadata, 0);
  objc_storeStrong((id *)&self->_etaFilter, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end