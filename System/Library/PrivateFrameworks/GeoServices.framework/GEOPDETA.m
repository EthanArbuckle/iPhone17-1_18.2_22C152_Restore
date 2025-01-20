@interface GEOPDETA
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDETA)init;
- (GEOPDETA)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsEtaRouteIncident:(uint64_t)a1;
- (void)_readEtaRouteIncidents;
- (void)addEtaRouteIncident:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDETA

- (GEOPDETA)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDETA;
  v2 = [(GEOPDETA *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDETA)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDETA;
  v3 = [(GEOPDETA *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEtaRouteIncidents
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(_WORD *)(a1 + 72) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDETAReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtaRouteIncidents_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
}

- (void)addEtaRouteIncident:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDETA _readEtaRouteIncidents](a1);
    -[GEOPDETA _addNoFlagsEtaRouteIncident:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 72) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(_WORD *)(a1 + 72) |= 0x100u;
  }
}

- (void)_addNoFlagsEtaRouteIncident:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDETA;
  v4 = [(GEOPDETA *)&v8 description];
  id v5 = [(GEOPDETA *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDETA _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDETA readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v5 = *(_WORD *)(a1 + 72);
    if ((v5 & 8) != 0)
    {
      objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64)];
      [v4 setObject:v6 forKey:@"time"];

      __int16 v5 = *(_WORD *)(a1 + 72);
    }
    if (v5)
    {
      id v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
      [v4 setObject:v7 forKey:@"distance"];

      __int16 v5 = *(_WORD *)(a1 + 72);
    }
    if ((v5 & 0x10) != 0)
    {
      uint64_t v8 = *(int *)(a1 + 68);
      if (v8 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E53E3898[v8];
      }
      if (a2) {
        v10 = @"transportType";
      }
      else {
        v10 = @"transport_type";
      }
      [v4 setObject:v9 forKey:v10];

      __int16 v5 = *(_WORD *)(a1 + 72);
    }
    if ((v5 & 2) != 0)
    {
      v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
      if (a2) {
        v12 = @"historicTravelTime";
      }
      else {
        v12 = @"historic_travel_time";
      }
      [v4 setObject:v11 forKey:v12];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_WORD *)(a1 + 72) & 0x80) == 0)
    {
      v13 = *(void **)(a1 + 8);
      if (v13)
      {
        id v14 = v13;
        objc_sync_enter(v14);
        GEOPDETAReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteTrafficDetail_tags);
        objc_sync_exit(v14);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v15 = *(id *)(a1 + 32);
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"routeTrafficDetail";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"route_traffic_detail";
      }
      [v4 setObject:v17 forKey:v18];
    }
    if ((*(_WORD *)(a1 + 72) & 4) != 0)
    {
      uint64_t v19 = *(int *)(a1 + 60);
      if (v19 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = off_1E53E3858[v19];
      }
      if (a2) {
        v21 = @"licensePlateRestrictionImpact";
      }
      else {
        v21 = @"license_plate_restriction_impact";
      }
      [v4 setObject:v20 forKey:v21];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v23 = *(id *)(a1 + 24);
      uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v40 != v25) {
              objc_enumerationMutation(v23);
            }
            v27 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if (a2) {
              [v27 jsonRepresentation];
            }
            else {
            v28 = [v27 dictionaryRepresentation];
            }
            [v22 addObject:v28];
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v24);
      }

      if (a2) {
        v29 = @"etaRouteIncident";
      }
      else {
        v29 = @"eta_route_incident";
      }
      [v4 setObject:v22 forKey:v29];
    }
    v30 = *(void **)(a1 + 16);
    if (v30)
    {
      v31 = [v30 dictionaryRepresentation];
      v32 = v31;
      if (a2)
      {
        v33 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __38__GEOPDETA__dictionaryRepresentation___block_invoke;
        v37[3] = &unk_1E53D8860;
        id v34 = v33;
        id v38 = v34;
        [v32 enumerateKeysAndObjectsUsingBlock:v37];
        id v35 = v34;
      }
      else
      {
        id v35 = v31;
      }
      [v4 setObject:v35 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDETA _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_4121;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_4122;
      }
      GEOPDETAReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDETACallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __38__GEOPDETA__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDETAReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x100) == 0)
    {
      if ((flags & 0x80) != 0)
      {
        if (GEORouteTrafficDetailIsDirty((uint64_t)self->_routeTrafficDetail)) {
          goto LABEL_8;
        }
        __int16 flags = (__int16)self->_flags;
      }
      if ((flags & 0x40) == 0)
      {
        id v7 = self->_reader;
        objc_sync_enter(v7);
        *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
        [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
        uint64_t v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
        [v4 writeData:v8];
        os_unfair_lock_unlock(p_readerLock);

        objc_sync_exit(v7);
        goto LABEL_25;
      }
    }
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDETA readAll:]((uint64_t)self, 0);
  __int16 v9 = (__int16)self->_flags;
  if ((v9 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v9 = (__int16)self->_flags;
    if ((v9 & 1) == 0)
    {
LABEL_10:
      if ((v9 & 0x10) == 0) {
        goto LABEL_11;
      }
LABEL_28:
      PBDataWriterWriteInt32Field();
      if ((*(_WORD *)&self->_flags & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((v9 & 1) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field();
  __int16 v9 = (__int16)self->_flags;
  if ((v9 & 0x10) != 0) {
    goto LABEL_28;
  }
LABEL_11:
  if ((v9 & 2) != 0) {
LABEL_12:
  }
    PBDataWriterWriteUint32Field();
LABEL_13:
  if (self->_routeTrafficDetail) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v10 = self->_etaRouteIncidents;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
LABEL_25:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDETAReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_20;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDETA readAll:]((uint64_t)self, 0);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_time;
    *(_WORD *)(v5 + 72) |= 8u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0) {
        goto LABEL_8;
      }
LABEL_23:
      *(_DWORD *)(v5 + 68) = self->_transportType;
      *(_WORD *)(v5 + 72) |= 0x10u;
      if ((*(_WORD *)&self->_flags & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 52) = self->_distance;
  *(_WORD *)(v5 + 72) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_23;
  }
LABEL_8:
  if ((flags & 2) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 56) = self->_historicTravelTime;
    *(_WORD *)(v5 + 72) |= 2u;
  }
LABEL_10:
  id v10 = [(GEORouteTrafficDetail *)self->_routeTrafficDetail copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_licensePlateRestrictionImpact;
    *(_WORD *)(v5 + 72) |= 4u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = self->_etaRouteIncidents;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (void)v19);
        -[GEOPDETA addEtaRouteIncident:](v5, v16);
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  long long v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_20:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  -[GEOPDETA readAll:]((uint64_t)self, 1);
  -[GEOPDETA readAll:]((uint64_t)v4, 1);
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 36);
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_time != *((_DWORD *)v4 + 16)) {
      goto LABEL_32;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_32;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_distance != *((_DWORD *)v4 + 13)) {
      goto LABEL_32;
    }
  }
  else if (v6)
  {
    goto LABEL_32;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_transportType != *((_DWORD *)v4 + 17)) {
      goto LABEL_32;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_32;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_historicTravelTime != *((_DWORD *)v4 + 14)) {
      goto LABEL_32;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_32;
  }
  routeTrafficDetail = self->_routeTrafficDetail;
  if ((unint64_t)routeTrafficDetail | *((void *)v4 + 4))
  {
    if (!-[GEORouteTrafficDetail isEqual:](routeTrafficDetail, "isEqual:"))
    {
LABEL_32:
      char v9 = 0;
      goto LABEL_33;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v6 = *((_WORD *)v4 + 36);
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_licensePlateRestrictionImpact != *((_DWORD *)v4 + 15)) {
      goto LABEL_32;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_32;
  }
  etaRouteIncidents = self->_etaRouteIncidents;
  if ((unint64_t)etaRouteIncidents | *((void *)v4 + 3)) {
    char v9 = -[NSMutableArray isEqual:](etaRouteIncidents, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_33:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDETA readAll:]((uint64_t)self, 1);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_time;
    if (flags)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_distance;
      if ((flags & 0x10) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((flags & 2) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (flags) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((flags & 0x10) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_transportType;
  if ((flags & 2) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_historicTravelTime;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v7 = 0;
LABEL_10:
  unint64_t v8 = [(GEORouteTrafficDetail *)self->_routeTrafficDetail hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v9 = 2654435761 * self->_licensePlateRestrictionImpact;
  }
  else {
    uint64_t v9 = 0;
  }
  return v5 ^ v4 ^ v6 ^ v7 ^ v9 ^ v8 ^ [(NSMutableArray *)self->_etaRouteIncidents hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeTrafficDetail, 0);
  objc_storeStrong((id *)&self->_etaRouteIncidents, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end