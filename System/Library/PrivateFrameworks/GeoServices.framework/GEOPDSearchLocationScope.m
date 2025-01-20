@interface GEOPDSearchLocationScope
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchLocationScope)init;
- (GEOPDSearchLocationScope)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchLocationScope

- (GEOPDSearchLocationScope)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchLocationScope;
  v2 = [(GEOPDSearchLocationScope *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchLocationScope)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchLocationScope;
  v3 = [(GEOPDSearchLocationScope *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchLocationScope;
  v4 = [(GEOPDSearchLocationScope *)&v8 description];
  v5 = [(GEOPDSearchLocationScope *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchLocationScope _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_105;
  }
  -[GEOPDSearchLocationScope readAll:](a1, 1);
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(unsigned char *)(a1 + 113) & 0x20) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      id v6 = v5;
      objc_sync_enter(v6);
      GEOPDSearchLocationScopeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags);
      objc_sync_exit(v6);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  id v7 = *(id *)(a1 + 16);
  objc_super v8 = v7;
  if (v7)
  {
    if (a2) {
      [v7 jsonRepresentation];
    }
    else {
    v9 = [v7 dictionaryRepresentation];
    }
    [v4 setObject:v9 forKey:@"center"];
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(unsigned char *)(a1 + 113) & 0x40) == 0)
  {
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      id v11 = v10;
      objc_sync_enter(v11);
      GEOPDSearchLocationScopeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags);
      objc_sync_exit(v11);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  id v12 = *(id *)(a1 + 32);
  v13 = v12;
  if (v12)
  {
    if (a2)
    {
      v14 = [v12 jsonRepresentation];
      v15 = @"mapRegion";
    }
    else
    {
      v14 = [v12 dictionaryRepresentation];
      v15 = @"map_region";
    }
    [v4 setObject:v14 forKey:v15];
  }
  int v16 = *(_DWORD *)(a1 + 112);
  if ((v16 & 2) != 0)
  {
    v17 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    if (a2) {
      v18 = @"scopeDistanceLimitKm";
    }
    else {
      v18 = @"scope_distance_limit_km";
    }
    [v4 setObject:v17 forKey:v18];

    int v16 = *(_DWORD *)(a1 + 112);
    if ((v16 & 8) == 0)
    {
LABEL_20:
      if ((v16 & 4) == 0) {
        goto LABEL_37;
      }
      goto LABEL_33;
    }
  }
  else if ((v16 & 8) == 0)
  {
    goto LABEL_20;
  }
  uint64_t v19 = *(int *)(a1 + 80);
  if (v19 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 80));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_1E53DB860[v19];
  }
  if (a2) {
    v21 = @"scopeDistanceType";
  }
  else {
    v21 = @"scope_distance_type";
  }
  [v4 setObject:v20 forKey:v21];

  if ((*(_DWORD *)(a1 + 112) & 4) != 0)
  {
LABEL_33:
    uint64_t v22 = *(int *)(a1 + 76);
    if (v22 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E53DB880[v22];
    }
    [v4 setObject:v23 forKey:@"locationScopeType"];
  }
LABEL_37:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(unsigned char *)(a1 + 113) & 0x80) == 0)
  {
    v24 = *(void **)(a1 + 8);
    if (v24)
    {
      id v25 = v24;
      objc_sync_enter(v25);
      GEOPDSearchLocationScopeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMultiMapRegion_tags);
      objc_sync_exit(v25);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  id v26 = *(id *)(a1 + 40);
  v27 = v26;
  if (v26)
  {
    if (a2)
    {
      v28 = [v26 jsonRepresentation];
      v29 = @"multiMapRegion";
    }
    else
    {
      v28 = [v26 dictionaryRepresentation];
      v29 = @"multi_map_region";
    }
    [v4 setObject:v28 forKey:v29];
  }
  int v30 = *(_DWORD *)(a1 + 112);
  if (v30)
  {
    v39 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    if (a2) {
      v40 = @"displayRegionLimitKm";
    }
    else {
      v40 = @"display_region_limit_km";
    }
    [v4 setObject:v39 forKey:v40];

    int v30 = *(_DWORD *)(a1 + 112);
    if ((v30 & 0x800) == 0)
    {
LABEL_47:
      if ((v30 & 0x1000) == 0) {
        goto LABEL_48;
      }
      goto LABEL_76;
    }
  }
  else if ((v30 & 0x800) == 0)
  {
    goto LABEL_47;
  }
  v41 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 109)];
  if (a2) {
    v42 = @"isBlendingScope";
  }
  else {
    v42 = @"is_blending_scope";
  }
  [v4 setObject:v41 forKey:v42];

  int v30 = *(_DWORD *)(a1 + 112);
  if ((v30 & 0x1000) == 0)
  {
LABEL_48:
    if ((v30 & 0x400) == 0) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
LABEL_76:
  v43 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 110)];
  if (a2) {
    v44 = @"isMixedIntent";
  }
  else {
    v44 = @"is_mixed_intent";
  }
  [v4 setObject:v43 forKey:v44];

  if ((*(_DWORD *)(a1 + 112) & 0x400) != 0)
  {
LABEL_49:
    v31 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 108)];
    if (a2) {
      v32 = @"hasBelowStreetGeo";
    }
    else {
      v32 = @"has_below_street_geo";
    }
    [v4 setObject:v31 forKey:v32];
  }
LABEL_53:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(unsigned char *)(a1 + 114) & 1) == 0)
  {
    v33 = *(void **)(a1 + 8);
    if (v33)
    {
      id v34 = v33;
      objc_sync_enter(v34);
      GEOPDSearchLocationScopeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWinDistanceGeohash4_tags);
      objc_sync_exit(v34);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  id v35 = *(id *)(a1 + 56);
  if (v35)
  {
    if (a2) {
      v36 = @"winDistanceGeohash4";
    }
    else {
      v36 = @"win_distance_geohash4";
    }
    [v4 setObject:v35 forKey:v36];
  }

  int v38 = *(_DWORD *)(a1 + 112);
  if ((v38 & 0x10) != 0)
  {
    LODWORD(v37) = *(_DWORD *)(a1 + 84);
    v45 = [NSNumber numberWithFloat:v37];
    if (a2) {
      v46 = @"winDistanceKmMean";
    }
    else {
      v46 = @"win_distance_km_mean";
    }
    [v4 setObject:v45 forKey:v46];

    int v38 = *(_DWORD *)(a1 + 112);
    if ((v38 & 0x20) == 0)
    {
LABEL_63:
      if ((v38 & 0x40) == 0) {
        goto LABEL_64;
      }
      goto LABEL_89;
    }
  }
  else if ((v38 & 0x20) == 0)
  {
    goto LABEL_63;
  }
  LODWORD(v37) = *(_DWORD *)(a1 + 88);
  v47 = [NSNumber numberWithFloat:v37];
  if (a2) {
    v48 = @"winDistanceKmP50";
  }
  else {
    v48 = @"win_distance_km_p50";
  }
  [v4 setObject:v47 forKey:v48];

  int v38 = *(_DWORD *)(a1 + 112);
  if ((v38 & 0x40) == 0)
  {
LABEL_64:
    if ((v38 & 0x80) == 0) {
      goto LABEL_65;
    }
    goto LABEL_93;
  }
LABEL_89:
  LODWORD(v37) = *(_DWORD *)(a1 + 92);
  v49 = [NSNumber numberWithFloat:v37];
  if (a2) {
    v50 = @"winDistanceKmP80";
  }
  else {
    v50 = @"win_distance_km_p80";
  }
  [v4 setObject:v49 forKey:v50];

  int v38 = *(_DWORD *)(a1 + 112);
  if ((v38 & 0x80) == 0)
  {
LABEL_65:
    if ((v38 & 0x100) == 0) {
      goto LABEL_66;
    }
LABEL_97:
    LODWORD(v37) = *(_DWORD *)(a1 + 100);
    v53 = [NSNumber numberWithFloat:v37];
    if (a2) {
      v54 = @"winDistanceKmP95";
    }
    else {
      v54 = @"win_distance_km_p95";
    }
    [v4 setObject:v53 forKey:v54];

    if ((*(_DWORD *)(a1 + 112) & 0x200) == 0) {
      goto LABEL_105;
    }
    goto LABEL_101;
  }
LABEL_93:
  LODWORD(v37) = *(_DWORD *)(a1 + 96);
  v51 = [NSNumber numberWithFloat:v37];
  if (a2) {
    v52 = @"winDistanceKmP90";
  }
  else {
    v52 = @"win_distance_km_p90";
  }
  [v4 setObject:v51 forKey:v52];

  int v38 = *(_DWORD *)(a1 + 112);
  if ((v38 & 0x100) != 0) {
    goto LABEL_97;
  }
LABEL_66:
  if ((v38 & 0x200) != 0)
  {
LABEL_101:
    LODWORD(v37) = *(_DWORD *)(a1 + 104);
    v55 = [NSNumber numberWithFloat:v37];
    if (a2) {
      v56 = @"winDistanceKmP99";
    }
    else {
      v56 = @"win_distance_km_p99";
    }
    [v4 setObject:v55 forKey:v56];
  }
LABEL_105:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchLocationScope _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_9;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_9;
      }
      GEOPDSearchLocationScopeReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      [*(id *)(a1 + 16) readAll:1];
      [*(id *)(a1 + 32) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchLocationScopeReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0x3E000) == 0)
    {
      objc_super v8 = self->_reader;
      objc_sync_enter(v8);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v10 writeData:v9];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v8);
      goto LABEL_41;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchLocationScope readAll:]((uint64_t)self, 0);
  if (self->_center) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_mapRegion) {
    PBDataWriterWriteSubmessage();
  }
  $45F5D1E4115E45601B8BB285A9200E71 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    $45F5D1E4115E45601B8BB285A9200E71 flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&flags & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_flags & 4) != 0) {
LABEL_10:
  }
    PBDataWriterWriteInt32Field();
LABEL_11:
  if (self->_multiMapRegion) {
    PBDataWriterWriteSubmessage();
  }
  $45F5D1E4115E45601B8BB285A9200E71 v6 = self->_flags;
  if (*(unsigned char *)&v6)
  {
    PBDataWriterWriteDoubleField();
    $45F5D1E4115E45601B8BB285A9200E71 v6 = self->_flags;
    if ((*(_WORD *)&v6 & 0x800) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&v6 & 0x1000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&v6 & 0x800) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteBOOLField();
  $45F5D1E4115E45601B8BB285A9200E71 v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_32:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_flags & 0x400) != 0) {
LABEL_17:
  }
    PBDataWriterWriteBOOLField();
LABEL_18:
  if (self->_winDistanceGeohash4) {
    PBDataWriterWriteStringField();
  }
  $45F5D1E4115E45601B8BB285A9200E71 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x10) != 0)
  {
    PBDataWriterWriteFloatField();
    $45F5D1E4115E45601B8BB285A9200E71 v7 = self->_flags;
    if ((*(unsigned char *)&v7 & 0x20) == 0)
    {
LABEL_22:
      if ((*(unsigned char *)&v7 & 0x40) == 0) {
        goto LABEL_23;
      }
      goto LABEL_36;
    }
  }
  else if ((*(unsigned char *)&v7 & 0x20) == 0)
  {
    goto LABEL_22;
  }
  PBDataWriterWriteFloatField();
  $45F5D1E4115E45601B8BB285A9200E71 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v7 & 0x80) == 0) {
      goto LABEL_24;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteFloatField();
  $45F5D1E4115E45601B8BB285A9200E71 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x80) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v7 & 0x100) == 0) {
      goto LABEL_25;
    }
LABEL_38:
    PBDataWriterWriteFloatField();
    if ((*(_DWORD *)&self->_flags & 0x200) == 0) {
      goto LABEL_41;
    }
    goto LABEL_39;
  }
LABEL_37:
  PBDataWriterWriteFloatField();
  $45F5D1E4115E45601B8BB285A9200E71 v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x100) != 0) {
    goto LABEL_38;
  }
LABEL_25:
  if ((*(_WORD *)&v7 & 0x200) != 0) {
LABEL_39:
  }
    PBDataWriterWriteFloatField();
LABEL_41:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchLocationScope readAll:]((uint64_t)self, 0);
    id v9 = [(GEOLatLng *)self->_center copyWithZone:a3];
    id v10 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v9;

    id v11 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
    id v12 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v11;

    $45F5D1E4115E45601B8BB285A9200E71 flags = self->_flags;
    if ((*(unsigned char *)&flags & 2) != 0)
    {
      *(double *)(v5 + 48) = self->_scopeDistanceLimitKm;
      *(_DWORD *)(v5 + 112) |= 2u;
      $45F5D1E4115E45601B8BB285A9200E71 flags = self->_flags;
      if ((*(unsigned char *)&flags & 8) == 0)
      {
LABEL_7:
        if ((*(unsigned char *)&flags & 4) == 0) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
    else if ((*(unsigned char *)&flags & 8) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 80) = self->_scopeDistanceType;
    *(_DWORD *)(v5 + 112) |= 8u;
    if ((*(_DWORD *)&self->_flags & 4) == 0)
    {
LABEL_9:
      id v14 = [(GEOPDSearchMultiMapRegion *)self->_multiMapRegion copyWithZone:a3];
      v15 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v14;

      $45F5D1E4115E45601B8BB285A9200E71 v16 = self->_flags;
      if (*(unsigned char *)&v16)
      {
        *(double *)(v5 + 24) = self->_displayRegionLimitKm;
        *(_DWORD *)(v5 + 112) |= 1u;
        $45F5D1E4115E45601B8BB285A9200E71 v16 = self->_flags;
        if ((*(_WORD *)&v16 & 0x800) == 0)
        {
LABEL_11:
          if ((*(_WORD *)&v16 & 0x1000) == 0) {
            goto LABEL_12;
          }
          goto LABEL_27;
        }
      }
      else if ((*(_WORD *)&v16 & 0x800) == 0)
      {
        goto LABEL_11;
      }
      *(unsigned char *)(v5 + 109) = self->_isBlendingScope;
      *(_DWORD *)(v5 + 112) |= 0x800u;
      $45F5D1E4115E45601B8BB285A9200E71 v16 = self->_flags;
      if ((*(_WORD *)&v16 & 0x1000) == 0)
      {
LABEL_12:
        if ((*(_WORD *)&v16 & 0x400) == 0) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
LABEL_27:
      *(unsigned char *)(v5 + 110) = self->_isMixedIntent;
      *(_DWORD *)(v5 + 112) |= 0x1000u;
      if ((*(_DWORD *)&self->_flags & 0x400) == 0)
      {
LABEL_14:
        uint64_t v17 = [(NSString *)self->_winDistanceGeohash4 copyWithZone:a3];
        v18 = *(void **)(v5 + 56);
        *(void *)(v5 + 56) = v17;

        $45F5D1E4115E45601B8BB285A9200E71 v19 = self->_flags;
        if ((*(unsigned char *)&v19 & 0x10) != 0)
        {
          *(float *)(v5 + 84) = self->_winDistanceKmMean;
          *(_DWORD *)(v5 + 112) |= 0x10u;
          $45F5D1E4115E45601B8BB285A9200E71 v19 = self->_flags;
          if ((*(unsigned char *)&v19 & 0x20) == 0)
          {
LABEL_16:
            if ((*(unsigned char *)&v19 & 0x40) == 0) {
              goto LABEL_17;
            }
            goto LABEL_31;
          }
        }
        else if ((*(unsigned char *)&v19 & 0x20) == 0)
        {
          goto LABEL_16;
        }
        *(float *)(v5 + 88) = self->_winDistanceKmP50;
        *(_DWORD *)(v5 + 112) |= 0x20u;
        $45F5D1E4115E45601B8BB285A9200E71 v19 = self->_flags;
        if ((*(unsigned char *)&v19 & 0x40) == 0)
        {
LABEL_17:
          if ((*(unsigned char *)&v19 & 0x80) == 0) {
            goto LABEL_18;
          }
          goto LABEL_32;
        }
LABEL_31:
        *(float *)(v5 + 92) = self->_winDistanceKmP80;
        *(_DWORD *)(v5 + 112) |= 0x40u;
        $45F5D1E4115E45601B8BB285A9200E71 v19 = self->_flags;
        if ((*(unsigned char *)&v19 & 0x80) == 0)
        {
LABEL_18:
          if ((*(_WORD *)&v19 & 0x100) == 0) {
            goto LABEL_19;
          }
          goto LABEL_33;
        }
LABEL_32:
        *(float *)(v5 + 96) = self->_winDistanceKmP90;
        *(_DWORD *)(v5 + 112) |= 0x80u;
        $45F5D1E4115E45601B8BB285A9200E71 v19 = self->_flags;
        if ((*(_WORD *)&v19 & 0x100) == 0)
        {
LABEL_19:
          if ((*(_WORD *)&v19 & 0x200) == 0) {
            return (id)v5;
          }
LABEL_20:
          *(float *)(v5 + 104) = self->_winDistanceKmP99;
          *(_DWORD *)(v5 + 112) |= 0x200u;
          return (id)v5;
        }
LABEL_33:
        *(float *)(v5 + 100) = self->_winDistanceKmP95;
        *(_DWORD *)(v5 + 112) |= 0x100u;
        if ((*(_DWORD *)&self->_flags & 0x200) == 0) {
          return (id)v5;
        }
        goto LABEL_20;
      }
LABEL_13:
      *(unsigned char *)(v5 + 108) = self->_hasBelowStreetGeo;
      *(_DWORD *)(v5 + 112) |= 0x400u;
      goto LABEL_14;
    }
LABEL_8:
    *(_DWORD *)(v5 + 76) = self->_locationScopeType;
    *(_DWORD *)(v5 + 112) |= 4u;
    goto LABEL_9;
  }
  $45F5D1E4115E45601B8BB285A9200E71 v7 = reader;
  objc_sync_enter(v7);
  if ((*((unsigned char *)&self->_flags + 2) & 2) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDSearchLocationScopeReadAllFrom(v5, self->_reader);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_86;
  }
  -[GEOPDSearchLocationScope readAll:]((uint64_t)self, 1);
  -[GEOPDSearchLocationScope readAll:]((uint64_t)v4, 1);
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:")) {
      goto LABEL_86;
    }
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 4))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
      goto LABEL_86;
    }
  }
  $45F5D1E4115E45601B8BB285A9200E71 flags = self->_flags;
  int v8 = *((_DWORD *)v4 + 28);
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_scopeDistanceLimitKm != *((double *)v4 + 6)) {
      goto LABEL_86;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_86;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_scopeDistanceType != *((_DWORD *)v4 + 20)) {
      goto LABEL_86;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_86;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_locationScopeType != *((_DWORD *)v4 + 19)) {
      goto LABEL_86;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_86;
  }
  multiMapRegion = self->_multiMapRegion;
  if ((unint64_t)multiMapRegion | *((void *)v4 + 5))
  {
    if (!-[GEOPDSearchMultiMapRegion isEqual:](multiMapRegion, "isEqual:")) {
      goto LABEL_86;
    }
    $45F5D1E4115E45601B8BB285A9200E71 flags = self->_flags;
    int v8 = *((_DWORD *)v4 + 28);
  }
  if (*(unsigned char *)&flags)
  {
    if ((v8 & 1) == 0 || self->_displayRegionLimitKm != *((double *)v4 + 3)) {
      goto LABEL_86;
    }
  }
  else if (v8)
  {
    goto LABEL_86;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0) {
      goto LABEL_86;
    }
    if (self->_isBlendingScope)
    {
      if (!*((unsigned char *)v4 + 109)) {
        goto LABEL_86;
      }
    }
    else if (*((unsigned char *)v4 + 109))
    {
      goto LABEL_86;
    }
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_86;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v8 & 0x1000) == 0) {
      goto LABEL_86;
    }
    if (self->_isMixedIntent)
    {
      if (!*((unsigned char *)v4 + 110)) {
        goto LABEL_86;
      }
    }
    else if (*((unsigned char *)v4 + 110))
    {
      goto LABEL_86;
    }
  }
  else if ((v8 & 0x1000) != 0)
  {
    goto LABEL_86;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0) {
      goto LABEL_86;
    }
    if (self->_hasBelowStreetGeo)
    {
      if (!*((unsigned char *)v4 + 108)) {
        goto LABEL_86;
      }
    }
    else if (*((unsigned char *)v4 + 108))
    {
      goto LABEL_86;
    }
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_86;
  }
  winDistanceGeohash4 = self->_winDistanceGeohash4;
  if (!((unint64_t)winDistanceGeohash4 | *((void *)v4 + 7))) {
    goto LABEL_56;
  }
  if (!-[NSString isEqual:](winDistanceGeohash4, "isEqual:"))
  {
LABEL_86:
    BOOL v11 = 0;
    goto LABEL_87;
  }
  $45F5D1E4115E45601B8BB285A9200E71 flags = self->_flags;
  int v8 = *((_DWORD *)v4 + 28);
LABEL_56:
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_winDistanceKmMean != *((float *)v4 + 21)) {
      goto LABEL_86;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_86;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_winDistanceKmP50 != *((float *)v4 + 22)) {
      goto LABEL_86;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_86;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_winDistanceKmP80 != *((float *)v4 + 23)) {
      goto LABEL_86;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_86;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_winDistanceKmP90 != *((float *)v4 + 24)) {
      goto LABEL_86;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_86;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_winDistanceKmP95 != *((float *)v4 + 25)) {
      goto LABEL_86;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_86;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_winDistanceKmP99 != *((float *)v4 + 26)) {
      goto LABEL_86;
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = (v8 & 0x200) == 0;
  }
LABEL_87:

  return v11;
}

- (unint64_t)hash
{
  -[GEOPDSearchLocationScope readAll:]((uint64_t)self, 1);
  unint64_t v56 = [(GEOLatLng *)self->_center hash];
  unint64_t v55 = [(GEOMapRegion *)self->_mapRegion hash];
  $45F5D1E4115E45601B8BB285A9200E71 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    double scopeDistanceLimitKm = self->_scopeDistanceLimitKm;
    double v6 = -scopeDistanceLimitKm;
    if (scopeDistanceLimitKm >= 0.0) {
      double v6 = self->_scopeDistanceLimitKm;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((*(unsigned char *)&flags & 8) != 0) {
    uint64_t v53 = 2654435761 * self->_scopeDistanceType;
  }
  else {
    uint64_t v53 = 0;
  }
  unint64_t v54 = v4;
  if ((*(unsigned char *)&flags & 4) != 0) {
    uint64_t v52 = 2654435761 * self->_locationScopeType;
  }
  else {
    uint64_t v52 = 0;
  }
  unint64_t v51 = [(GEOPDSearchMultiMapRegion *)self->_multiMapRegion hash];
  $45F5D1E4115E45601B8BB285A9200E71 v9 = self->_flags;
  if (*(unsigned char *)&v9)
  {
    double displayRegionLimitKm = self->_displayRegionLimitKm;
    double v12 = -displayRegionLimitKm;
    if (displayRegionLimitKm >= 0.0) {
      double v12 = self->_displayRegionLimitKm;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((*(_WORD *)&v9 & 0x800) == 0)
  {
    uint64_t v50 = 0;
    if ((*(_WORD *)&v9 & 0x1000) != 0) {
      goto LABEL_25;
    }
LABEL_28:
    uint64_t v49 = 0;
    if ((*(_WORD *)&v9 & 0x400) != 0) {
      goto LABEL_26;
    }
    goto LABEL_29;
  }
  uint64_t v50 = 2654435761 * self->_isBlendingScope;
  if ((*(_WORD *)&v9 & 0x1000) == 0) {
    goto LABEL_28;
  }
LABEL_25:
  uint64_t v49 = 2654435761 * self->_isMixedIntent;
  if ((*(_WORD *)&v9 & 0x400) != 0)
  {
LABEL_26:
    uint64_t v48 = 2654435761 * self->_hasBelowStreetGeo;
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v48 = 0;
LABEL_30:
  NSUInteger v15 = [(NSString *)self->_winDistanceGeohash4 hash];
  $45F5D1E4115E45601B8BB285A9200E71 v16 = self->_flags;
  if ((*(unsigned char *)&v16 & 0x10) != 0)
  {
    float winDistanceKmMean = self->_winDistanceKmMean;
    double v19 = winDistanceKmMean;
    if (winDistanceKmMean < 0.0) {
      double v19 = -winDistanceKmMean;
    }
    long double v20 = floor(v19 + 0.5);
    double v21 = (v19 - v20) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0) {
        v17 += (unint64_t)v21;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    unint64_t v17 = 0;
  }
  if ((*(unsigned char *)&v16 & 0x20) != 0)
  {
    float winDistanceKmP50 = self->_winDistanceKmP50;
    double v24 = winDistanceKmP50;
    if (winDistanceKmP50 < 0.0) {
      double v24 = -winDistanceKmP50;
    }
    long double v25 = floor(v24 + 0.5);
    double v26 = (v24 - v25) * 1.84467441e19;
    unint64_t v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0) {
        v22 += (unint64_t)v26;
      }
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    unint64_t v22 = 0;
  }
  if ((*(unsigned char *)&v16 & 0x40) != 0)
  {
    float winDistanceKmP80 = self->_winDistanceKmP80;
    double v29 = winDistanceKmP80;
    if (winDistanceKmP80 < 0.0) {
      double v29 = -winDistanceKmP80;
    }
    long double v30 = floor(v29 + 0.5);
    double v31 = (v29 - v30) * 1.84467441e19;
    unint64_t v27 = 2654435761u * (unint64_t)fmod(v30, 1.84467441e19);
    if (v31 >= 0.0)
    {
      if (v31 > 0.0) {
        v27 += (unint64_t)v31;
      }
    }
    else
    {
      v27 -= (unint64_t)fabs(v31);
    }
  }
  else
  {
    unint64_t v27 = 0;
  }
  if ((*(unsigned char *)&v16 & 0x80) != 0)
  {
    float winDistanceKmP90 = self->_winDistanceKmP90;
    double v34 = winDistanceKmP90;
    if (winDistanceKmP90 < 0.0) {
      double v34 = -winDistanceKmP90;
    }
    long double v35 = floor(v34 + 0.5);
    double v36 = (v34 - v35) * 1.84467441e19;
    unint64_t v32 = 2654435761u * (unint64_t)fmod(v35, 1.84467441e19);
    if (v36 >= 0.0)
    {
      if (v36 > 0.0) {
        v32 += (unint64_t)v36;
      }
    }
    else
    {
      v32 -= (unint64_t)fabs(v36);
    }
  }
  else
  {
    unint64_t v32 = 0;
  }
  if ((*(_WORD *)&v16 & 0x100) != 0)
  {
    float winDistanceKmP95 = self->_winDistanceKmP95;
    double v39 = winDistanceKmP95;
    if (winDistanceKmP95 < 0.0) {
      double v39 = -winDistanceKmP95;
    }
    long double v40 = floor(v39 + 0.5);
    double v41 = (v39 - v40) * 1.84467441e19;
    unint64_t v37 = 2654435761u * (unint64_t)fmod(v40, 1.84467441e19);
    if (v41 >= 0.0)
    {
      if (v41 > 0.0) {
        v37 += (unint64_t)v41;
      }
    }
    else
    {
      v37 -= (unint64_t)fabs(v41);
    }
  }
  else
  {
    unint64_t v37 = 0;
  }
  if ((*(_WORD *)&v16 & 0x200) != 0)
  {
    float winDistanceKmP99 = self->_winDistanceKmP99;
    double v44 = winDistanceKmP99;
    if (winDistanceKmP99 < 0.0) {
      double v44 = -winDistanceKmP99;
    }
    long double v45 = floor(v44 + 0.5);
    double v46 = (v44 - v45) * 1.84467441e19;
    unint64_t v42 = 2654435761u * (unint64_t)fmod(v45, 1.84467441e19);
    if (v46 >= 0.0)
    {
      if (v46 > 0.0) {
        v42 += (unint64_t)v46;
      }
    }
    else
    {
      v42 -= (unint64_t)fabs(v46);
    }
  }
  else
  {
    unint64_t v42 = 0;
  }
  return v55 ^ v56 ^ v54 ^ v53 ^ v52 ^ v51 ^ v10 ^ v50 ^ v49 ^ v48 ^ v15 ^ v17 ^ v22 ^ v27 ^ v32 ^ v37 ^ v42;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_winDistanceGeohash4, 0);
  objc_storeStrong((id *)&self->_multiMapRegion, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_center, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end