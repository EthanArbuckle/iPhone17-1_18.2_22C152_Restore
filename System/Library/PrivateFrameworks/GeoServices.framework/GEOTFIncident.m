@interface GEOTFIncident
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTFIncident)init;
- (GEOTFIncident)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsInfo:(uint64_t)a1;
- (void)addInfo:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOTFIncident

- (GEOTFIncident)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTFIncident;
  v2 = [(GEOTFIncident *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTFIncident)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTFIncident;
  v3 = [(GEOTFIncident *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTFIncident;
  [(GEOTFIncident *)&v3 dealloc];
}

- (void)addInfo:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 211) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOTFIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInfos_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    -[GEOTFIncident _addNoFlagsInfo:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 208) |= 0x4000000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    *(_DWORD *)(a1 + 208) |= 0x40000000u;
  }
}

- (void)_addNoFlagsInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTFIncident;
  v4 = [(GEOTFIncident *)&v8 description];
  id v5 = [(GEOTFIncident *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTFIncident _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOTFIncident readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 210) & 2) != 0)
    {
      unsigned int v5 = *(_DWORD *)(a1 + 196) - 3;
      if (v5 < 0xE && ((0x3FF3u >> v5) & 1) != 0)
      {
        objc_super v6 = off_1E53DA370[v5];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 196));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    if (*(void *)(a1 + 24))
    {
      id v7 = PBRepeatedInt64NSArray();
      [v4 setObject:v7 forKey:@"geoid"];
    }
    if ([*(id *)(a1 + 72) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v9 = *(id *)(a1 + 72);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v82 objects:v86 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v83;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v83 != v11) {
              objc_enumerationMutation(v9);
            }
            v13 = *(void **)(*((void *)&v82 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            id v14 = [v13 dictionaryRepresentation];
            }

            [v8 addObject:v14];
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v82 objects:v86 count:16];
        }
        while (v10);
      }

      [v4 setObject:v8 forKey:@"info"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 211) & 2) == 0)
    {
      v15 = *(void **)(a1 + 8);
      if (v15)
      {
        id v16 = v15;
        objc_sync_enter(v16);
        GEOTFIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentId_tags);
        objc_sync_exit(v16);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v17 = *(id *)(a1 + 64);
    if (v17)
    {
      if (a2) {
        v18 = @"incidentId";
      }
      else {
        v18 = @"incident_id";
      }
      [v4 setObject:v17 forKey:v18];
    }

    int v19 = *(_DWORD *)(a1 + 208);
    if ((v19 & 4) != 0)
    {
      v20 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
      [v4 setObject:v20 forKey:@"latitude"];

      int v19 = *(_DWORD *)(a1 + 208);
    }
    if ((v19 & 8) != 0)
    {
      v21 = [NSNumber numberWithDouble:*(double *)(a1 + 88)];
      [v4 setObject:v21 forKey:@"longitude"];

      int v19 = *(_DWORD *)(a1 + 208);
    }
    if ((v19 & 0x20) != 0)
    {
      v22 = [NSNumber numberWithLongLong:*(void *)(a1 + 112)];
      if (a2) {
        v23 = @"startTime";
      }
      else {
        v23 = @"start_time";
      }
      [v4 setObject:v22 forKey:v23];

      int v19 = *(_DWORD *)(a1 + 208);
    }
    if ((v19 & 0x40) != 0)
    {
      v24 = [NSNumber numberWithLongLong:*(void *)(a1 + 128)];
      if (a2) {
        v25 = @"updateTime";
      }
      else {
        v25 = @"update_time";
      }
      [v4 setObject:v24 forKey:v25];

      int v19 = *(_DWORD *)(a1 + 208);
    }
    if ((v19 & 0x40000) != 0)
    {
      v26 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 200)];
      [v4 setObject:v26 forKey:@"blocked"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 211) & 0x10) == 0)
    {
      v27 = *(void **)(a1 + 8);
      if (v27)
      {
        id v28 = v27;
        objc_sync_enter(v28);
        GEOTFIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStreet_tags);
        objc_sync_exit(v28);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v29 = *(id *)(a1 + 120);
    if (v29) {
      [v4 setObject:v29 forKey:@"street"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 211) & 1) == 0)
    {
      v30 = *(void **)(a1 + 8);
      if (v30)
      {
        id v31 = v30;
        objc_sync_enter(v31);
        GEOTFIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCrossStreet_tags);
        objc_sync_exit(v31);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v32 = *(id *)(a1 + 40);
    if (v32)
    {
      if (a2) {
        v33 = @"crossStreet";
      }
      else {
        v33 = @"cross_street";
      }
      [v4 setObject:v32 forKey:v33];
    }

    int v35 = *(_DWORD *)(a1 + 208);
    if ((v35 & 0x400) != 0)
    {
      v36 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 168)];
      if (a2) {
        v37 = @"laneClosureCount";
      }
      else {
        v37 = @"lane_closure_count";
      }
      [v4 setObject:v36 forKey:v37];

      int v35 = *(_DWORD *)(a1 + 208);
    }
    if ((v35 & 0x80000) != 0)
    {
      v38 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 201)];
      if (a2) {
        v39 = @"endTimeReliable";
      }
      else {
        v39 = @"end_time_reliable";
      }
      [v4 setObject:v38 forKey:v39];

      int v35 = *(_DWORD *)(a1 + 208);
    }
    if ((v35 & 0x800) != 0)
    {
      unsigned int v40 = *(_DWORD *)(a1 + 172) - 1;
      if (v40 >= 9)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 172));
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v41 = off_1E53DA3E0[v40];
      }
      if (a2) {
        v42 = @"laneClosureType";
      }
      else {
        v42 = @"lane_closure_type";
      }
      [v4 setObject:v41 forKey:v42];

      int v35 = *(_DWORD *)(a1 + 208);
    }
    if ((v35 & 0x100000) != 0)
    {
      v43 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 202)];
      if (a2) {
        v44 = @"hardBlocked";
      }
      else {
        v44 = @"hard_blocked";
      }
      [v4 setObject:v43 forKey:v44];

      int v35 = *(_DWORD *)(a1 + 208);
    }
    if ((v35 & 0x10) != 0)
    {
      v45 = [NSNumber numberWithDouble:*(double *)(a1 + 104)];
      if (a2) {
        v46 = @"startOffset";
      }
      else {
        v46 = @"start_offset";
      }
      [v4 setObject:v45 forKey:v46];

      int v35 = *(_DWORD *)(a1 + 208);
    }
    if ((v35 & 2) != 0)
    {
      v47 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
      if (a2) {
        v48 = @"endOffset";
      }
      else {
        v48 = @"end_offset";
      }
      [v4 setObject:v47 forKey:v48];

      int v35 = *(_DWORD *)(a1 + 208);
    }
    if ((v35 & 0x200) != 0)
    {
      LODWORD(v34) = *(_DWORD *)(a1 + 164);
      v49 = [NSNumber numberWithFloat:v34];
      [v4 setObject:v49 forKey:@"delay"];

      int v35 = *(_DWORD *)(a1 + 208);
    }
    if ((v35 & 0x4000) != 0)
    {
      uint64_t v50 = *(int *)(a1 + 184);
      if (v50 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 184));
        v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v51 = off_1E53DA428[v50];
      }
      [v4 setObject:v51 forKey:@"significance"];

      int v35 = *(_DWORD *)(a1 + 208);
    }
    if ((v35 & 0x2000) != 0)
    {
      v52 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 180)];
      if (a2) {
        v53 = @"minZoomLevel";
      }
      else {
        v53 = @"min_zoom_level";
      }
      [v4 setObject:v52 forKey:v53];

      int v35 = *(_DWORD *)(a1 + 208);
    }
    if ((v35 & 0x1000) != 0)
    {
      v54 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 176)];
      if (a2) {
        v55 = @"maxZoomLevel";
      }
      else {
        v55 = @"max_zoom_level";
      }
      [v4 setObject:v54 forKey:v55];

      int v35 = *(_DWORD *)(a1 + 208);
    }
    if ((v35 & 0x8000) != 0)
    {
      LODWORD(v34) = *(_DWORD *)(a1 + 188);
      v56 = [NSNumber numberWithFloat:v34];
      [v4 setObject:v56 forKey:@"speed"];

      int v35 = *(_DWORD *)(a1 + 208);
    }
    if ((v35 & 0x200000) != 0)
    {
      v57 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 203)];
      [v4 setObject:v57 forKey:@"hidden"];

      int v35 = *(_DWORD *)(a1 + 208);
    }
    if ((v35 & 0x10000) != 0)
    {
      uint64_t v58 = *(int *)(a1 + 192);
      if (v58 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 192));
        v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v59 = off_1E53DA458[v58];
      }
      if (a2) {
        v60 = @"trafficTrend";
      }
      else {
        v60 = @"traffic_trend";
      }
      [v4 setObject:v59 forKey:v60];

      int v35 = *(_DWORD *)(a1 + 208);
    }
    if ((v35 & 0x100) != 0)
    {
      uint64_t v61 = *(int *)(a1 + 160);
      if (v61 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 160));
        v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v62 = off_1E53DA478[v61];
      }
      [v4 setObject:v62 forKey:@"color"];

      int v35 = *(_DWORD *)(a1 + 208);
    }
    if (v35)
    {
      v63 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
      if (a2) {
        v64 = @"durationMin";
      }
      else {
        v64 = @"duration_min";
      }
      [v4 setObject:v63 forKey:v64];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 211) & 0x20) == 0)
    {
      v65 = *(void **)(a1 + 8);
      if (v65)
      {
        id v66 = v65;
        objc_sync_enter(v66);
        GEOTFIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readZilch_tags);
        objc_sync_exit(v66);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v67 = *(id *)(a1 + 136);
    v68 = v67;
    if (v67)
    {
      if (a2)
      {
        v69 = [v67 base64EncodedStringWithOptions:0];
        [v4 setObject:v69 forKey:@"zilch"];
      }
      else
      {
        [v4 setObject:v67 forKey:@"zilch"];
      }
    }

    int v70 = *(_DWORD *)(a1 + 208);
    if ((v70 & 0x80) != 0)
    {
      v71 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 156)];
      if (a2) {
        v72 = @"alertCCode";
      }
      else {
        v72 = @"alert_c_code";
      }
      [v4 setObject:v71 forKey:v72];

      int v70 = *(_DWORD *)(a1 + 208);
    }
    if ((v70 & 0x400000) != 0)
    {
      v73 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 204)];
      if (a2) {
        v74 = @"navigationAlert";
      }
      else {
        v74 = @"navigation_alert";
      }
      [v4 setObject:v73 forKey:v74];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 211) & 8) == 0)
    {
      v75 = *(void **)(a1 + 8);
      if (v75)
      {
        id v76 = v75;
        objc_sync_enter(v76);
        GEOTFIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOpenlr_tags_125);
        objc_sync_exit(v76);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v77 = *(id *)(a1 + 96);
    v78 = v77;
    if (v77)
    {
      if (a2)
      {
        v79 = [v77 base64EncodedStringWithOptions:0];
        [v4 setObject:v79 forKey:@"openlr"];
      }
      else
      {
        [v4 setObject:v77 forKey:@"openlr"];
      }
    }

    id v80 = v4;
  }
  else
  {
    id v80 = 0;
  }

  return v80;
}

- (id)jsonRepresentation
{
  return -[GEOTFIncident _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_243;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_244;
      }
      GEOTFIncidentReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOTFIncidentCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOTFIncidentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*((_WORD *)&self->_flags + 1) & 0x7F80) == 0))
  {
    id v14 = self->_reader;
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
    -[GEOTFIncident readAll:]((uint64_t)self, 0);
    if ((*((unsigned char *)&self->_flags + 2) & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_geoids.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt64Field();
        ++v6;
      }
      while (v6 < self->_geoids.count);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = self->_infos;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    if (self->_incidentId) {
      PBDataWriterWriteStringField();
    }
    $8FFB56B7DD62BB34225F045795A24924 flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) != 0)
    {
      PBDataWriterWriteDoubleField();
      $8FFB56B7DD62BB34225F045795A24924 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      PBDataWriterWriteDoubleField();
      $8FFB56B7DD62BB34225F045795A24924 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x20) != 0)
    {
      PBDataWriterWriteInt64Field();
      $8FFB56B7DD62BB34225F045795A24924 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x40) != 0)
    {
      PBDataWriterWriteInt64Field();
      $8FFB56B7DD62BB34225F045795A24924 flags = self->_flags;
    }
    if ((*(_DWORD *)&flags & 0x40000) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_street) {
      PBDataWriterWriteStringField();
    }
    if (self->_crossStreet) {
      PBDataWriterWriteStringField();
    }
    $8FFB56B7DD62BB34225F045795A24924 v12 = self->_flags;
    if ((*(_WORD *)&v12 & 0x400) != 0)
    {
      PBDataWriterWriteUint32Field();
      $8FFB56B7DD62BB34225F045795A24924 v12 = self->_flags;
    }
    if ((*(_DWORD *)&v12 & 0x80000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $8FFB56B7DD62BB34225F045795A24924 v12 = self->_flags;
    }
    if ((*(_WORD *)&v12 & 0x800) != 0)
    {
      PBDataWriterWriteInt32Field();
      $8FFB56B7DD62BB34225F045795A24924 v12 = self->_flags;
    }
    if ((*(_DWORD *)&v12 & 0x100000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $8FFB56B7DD62BB34225F045795A24924 v12 = self->_flags;
    }
    if ((*(unsigned char *)&v12 & 0x10) != 0)
    {
      PBDataWriterWriteDoubleField();
      $8FFB56B7DD62BB34225F045795A24924 v12 = self->_flags;
    }
    if ((*(unsigned char *)&v12 & 2) != 0)
    {
      PBDataWriterWriteDoubleField();
      $8FFB56B7DD62BB34225F045795A24924 v12 = self->_flags;
    }
    if ((*(_WORD *)&v12 & 0x200) != 0)
    {
      PBDataWriterWriteFloatField();
      $8FFB56B7DD62BB34225F045795A24924 v12 = self->_flags;
    }
    if ((*(_WORD *)&v12 & 0x4000) != 0)
    {
      PBDataWriterWriteInt32Field();
      $8FFB56B7DD62BB34225F045795A24924 v12 = self->_flags;
    }
    if ((*(_WORD *)&v12 & 0x2000) != 0)
    {
      PBDataWriterWriteUint32Field();
      $8FFB56B7DD62BB34225F045795A24924 v12 = self->_flags;
    }
    if ((*(_WORD *)&v12 & 0x1000) != 0)
    {
      PBDataWriterWriteUint32Field();
      $8FFB56B7DD62BB34225F045795A24924 v12 = self->_flags;
    }
    if ((*(_WORD *)&v12 & 0x8000) != 0)
    {
      PBDataWriterWriteFloatField();
      $8FFB56B7DD62BB34225F045795A24924 v12 = self->_flags;
    }
    if ((*(_DWORD *)&v12 & 0x200000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $8FFB56B7DD62BB34225F045795A24924 v12 = self->_flags;
    }
    if ((*(_DWORD *)&v12 & 0x10000) != 0)
    {
      PBDataWriterWriteInt32Field();
      $8FFB56B7DD62BB34225F045795A24924 v12 = self->_flags;
    }
    if ((*(_WORD *)&v12 & 0x100) != 0)
    {
      PBDataWriterWriteInt32Field();
      $8FFB56B7DD62BB34225F045795A24924 v12 = self->_flags;
    }
    if (*(unsigned char *)&v12) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_zilch) {
      PBDataWriterWriteDataField();
    }
    $8FFB56B7DD62BB34225F045795A24924 v13 = self->_flags;
    if ((*(unsigned char *)&v13 & 0x80) != 0)
    {
      PBDataWriterWriteUint32Field();
      $8FFB56B7DD62BB34225F045795A24924 v13 = self->_flags;
    }
    if ((*(_DWORD *)&v13 & 0x400000) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_openlr) {
      PBDataWriterWriteDataField();
    }
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
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 3) & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTFIncidentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_41;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTFIncident readAll:]((uint64_t)self, 0);
  if ((*((unsigned char *)&self->_flags + 2) & 2) != 0)
  {
    *(_DWORD *)(v5 + 196) = self->_type;
    *(_DWORD *)(v5 + 208) |= 0x20000u;
  }
  PBRepeatedInt64Copy();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = self->_infos;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v9);
        }
        $8FFB56B7DD62BB34225F045795A24924 v13 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (void)v27);
        -[GEOTFIncident addInfo:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_incidentId copyWithZone:a3];
  v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  $8FFB56B7DD62BB34225F045795A24924 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    *(double *)(v5 + 80) = self->_latitude;
    *(_DWORD *)(v5 + 208) |= 4u;
    $8FFB56B7DD62BB34225F045795A24924 flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
LABEL_16:
      if ((*(unsigned char *)&flags & 0x20) == 0) {
        goto LABEL_17;
      }
      goto LABEL_44;
    }
  }
  else if ((*(unsigned char *)&flags & 8) == 0)
  {
    goto LABEL_16;
  }
  *(double *)(v5 + 88) = self->_longitude;
  *(_DWORD *)(v5 + 208) |= 8u;
  $8FFB56B7DD62BB34225F045795A24924 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&flags & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(void *)(v5 + 112) = self->_startTime;
  *(_DWORD *)(v5 + 208) |= 0x20u;
  $8FFB56B7DD62BB34225F045795A24924 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&flags & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_45:
  *(void *)(v5 + 128) = self->_updateTime;
  *(_DWORD *)(v5 + 208) |= 0x40u;
  if ((*(_DWORD *)&self->_flags & 0x40000) != 0)
  {
LABEL_19:
    *(unsigned char *)(v5 + 200) = self->_blocked;
    *(_DWORD *)(v5 + 208) |= 0x40000u;
  }
LABEL_20:
  uint64_t v17 = -[NSString copyWithZone:](self->_street, "copyWithZone:", a3, (void)v27);
  long long v18 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v17;

  uint64_t v19 = [(NSString *)self->_crossStreet copyWithZone:a3];
  v20 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v19;

  $8FFB56B7DD62BB34225F045795A24924 v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x400) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_laneClosureCount;
    *(_DWORD *)(v5 + 208) |= 0x400u;
    $8FFB56B7DD62BB34225F045795A24924 v21 = self->_flags;
    if ((*(_DWORD *)&v21 & 0x80000) == 0)
    {
LABEL_22:
      if ((*(_WORD *)&v21 & 0x800) == 0) {
        goto LABEL_23;
      }
      goto LABEL_49;
    }
  }
  else if ((*(_DWORD *)&v21 & 0x80000) == 0)
  {
    goto LABEL_22;
  }
  *(unsigned char *)(v5 + 201) = self->_endTimeReliable;
  *(_DWORD *)(v5 + 208) |= 0x80000u;
  $8FFB56B7DD62BB34225F045795A24924 v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x800) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v21 & 0x100000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v5 + 172) = self->_laneClosureType;
  *(_DWORD *)(v5 + 208) |= 0x800u;
  $8FFB56B7DD62BB34225F045795A24924 v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x100000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v21 & 0x10) == 0) {
      goto LABEL_25;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(unsigned char *)(v5 + 202) = self->_hardBlocked;
  *(_DWORD *)(v5 + 208) |= 0x100000u;
  $8FFB56B7DD62BB34225F045795A24924 v21 = self->_flags;
  if ((*(unsigned char *)&v21 & 0x10) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v21 & 2) == 0) {
      goto LABEL_26;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(double *)(v5 + 104) = self->_startOffset;
  *(_DWORD *)(v5 + 208) |= 0x10u;
  $8FFB56B7DD62BB34225F045795A24924 v21 = self->_flags;
  if ((*(unsigned char *)&v21 & 2) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v21 & 0x200) == 0) {
      goto LABEL_27;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(double *)(v5 + 56) = self->_endOffset;
  *(_DWORD *)(v5 + 208) |= 2u;
  $8FFB56B7DD62BB34225F045795A24924 v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x200) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v21 & 0x4000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(float *)(v5 + 164) = self->_delay;
  *(_DWORD *)(v5 + 208) |= 0x200u;
  $8FFB56B7DD62BB34225F045795A24924 v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x4000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v21 & 0x2000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v5 + 184) = self->_significance;
  *(_DWORD *)(v5 + 208) |= 0x4000u;
  $8FFB56B7DD62BB34225F045795A24924 v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x2000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v21 & 0x1000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v5 + 180) = self->_minZoomLevel;
  *(_DWORD *)(v5 + 208) |= 0x2000u;
  $8FFB56B7DD62BB34225F045795A24924 v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x1000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v21 & 0x8000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(_DWORD *)(v5 + 176) = self->_maxZoomLevel;
  *(_DWORD *)(v5 + 208) |= 0x1000u;
  $8FFB56B7DD62BB34225F045795A24924 v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x8000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v21 & 0x200000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(float *)(v5 + 188) = self->_speed;
  *(_DWORD *)(v5 + 208) |= 0x8000u;
  $8FFB56B7DD62BB34225F045795A24924 v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x200000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v21 & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(unsigned char *)(v5 + 203) = self->_hidden;
  *(_DWORD *)(v5 + 208) |= 0x200000u;
  $8FFB56B7DD62BB34225F045795A24924 v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x10000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v21 & 0x100) == 0) {
      goto LABEL_34;
    }
LABEL_60:
    *(_DWORD *)(v5 + 160) = self->_color;
    *(_DWORD *)(v5 + 208) |= 0x100u;
    if ((*(_DWORD *)&self->_flags & 1) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_59:
  *(_DWORD *)(v5 + 192) = self->_trafficTrend;
  *(_DWORD *)(v5 + 208) |= 0x10000u;
  $8FFB56B7DD62BB34225F045795A24924 v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x100) != 0) {
    goto LABEL_60;
  }
LABEL_34:
  if (*(unsigned char *)&v21)
  {
LABEL_35:
    *(void *)(v5 + 48) = self->_durationMin;
    *(_DWORD *)(v5 + 208) |= 1u;
  }
LABEL_36:
  uint64_t v22 = [(NSData *)self->_zilch copyWithZone:a3];
  v23 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v22;

  $8FFB56B7DD62BB34225F045795A24924 v24 = self->_flags;
  if ((*(unsigned char *)&v24 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 156) = self->_alertCCode;
    *(_DWORD *)(v5 + 208) |= 0x80u;
    $8FFB56B7DD62BB34225F045795A24924 v24 = self->_flags;
  }
  if ((*(_DWORD *)&v24 & 0x400000) != 0)
  {
    *(unsigned char *)(v5 + 204) = self->_navigationAlert;
    *(_DWORD *)(v5 + 208) |= 0x400000u;
  }
  uint64_t v25 = [(NSData *)self->_openlr copyWithZone:a3];
  id v8 = *(id *)(v5 + 96);
  *(void *)(v5 + 96) = v25;
LABEL_41:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_140;
  }
  -[GEOTFIncident readAll:]((uint64_t)self, 1);
  -[GEOTFIncident readAll:]((uint64_t)v4, 1);
  int v5 = *((_DWORD *)v4 + 52);
  if ((*((unsigned char *)&self->_flags + 2) & 2) != 0)
  {
    if ((v5 & 0x20000) == 0 || self->_type != *((_DWORD *)v4 + 49)) {
      goto LABEL_140;
    }
  }
  else if ((v5 & 0x20000) != 0)
  {
    goto LABEL_140;
  }
  if (!PBRepeatedInt64IsEqual()) {
    goto LABEL_140;
  }
  infos = self->_infos;
  if ((unint64_t)infos | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](infos, "isEqual:")) {
      goto LABEL_140;
    }
  }
  incidentId = self->_incidentId;
  if ((unint64_t)incidentId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](incidentId, "isEqual:")) {
      goto LABEL_140;
    }
  }
  $8FFB56B7DD62BB34225F045795A24924 flags = self->_flags;
  int v9 = *((_DWORD *)v4 + 52);
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_latitude != *((double *)v4 + 10)) {
      goto LABEL_140;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_140;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_longitude != *((double *)v4 + 11)) {
      goto LABEL_140;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_140;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_startTime != *((void *)v4 + 14)) {
      goto LABEL_140;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_140;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_updateTime != *((void *)v4 + 16)) {
      goto LABEL_140;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
    if ((v9 & 0x40000) == 0) {
      goto LABEL_140;
    }
    if (self->_blocked)
    {
      if (!*((unsigned char *)v4 + 200)) {
        goto LABEL_140;
      }
    }
    else if (*((unsigned char *)v4 + 200))
    {
      goto LABEL_140;
    }
  }
  else if ((v9 & 0x40000) != 0)
  {
    goto LABEL_140;
  }
  street = self->_street;
  if ((unint64_t)street | *((void *)v4 + 15) && !-[NSString isEqual:](street, "isEqual:")) {
    goto LABEL_140;
  }
  crossStreet = self->_crossStreet;
  if ((unint64_t)crossStreet | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](crossStreet, "isEqual:")) {
      goto LABEL_140;
    }
  }
  $8FFB56B7DD62BB34225F045795A24924 v12 = self->_flags;
  int v13 = *((_DWORD *)v4 + 52);
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    if ((v13 & 0x400) == 0 || self->_laneClosureCount != *((_DWORD *)v4 + 42)) {
      goto LABEL_140;
    }
  }
  else if ((v13 & 0x400) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_DWORD *)&v12 & 0x80000) != 0)
  {
    if ((v13 & 0x80000) == 0) {
      goto LABEL_140;
    }
    if (self->_endTimeReliable)
    {
      if (!*((unsigned char *)v4 + 201)) {
        goto LABEL_140;
      }
    }
    else if (*((unsigned char *)v4 + 201))
    {
      goto LABEL_140;
    }
  }
  else if ((v13 & 0x80000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&v12 & 0x800) != 0)
  {
    if ((v13 & 0x800) == 0 || self->_laneClosureType != *((_DWORD *)v4 + 43)) {
      goto LABEL_140;
    }
  }
  else if ((v13 & 0x800) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
    if ((v13 & 0x100000) == 0) {
      goto LABEL_140;
    }
    if (self->_hardBlocked)
    {
      if (!*((unsigned char *)v4 + 202)) {
        goto LABEL_140;
      }
    }
    else if (*((unsigned char *)v4 + 202))
    {
      goto LABEL_140;
    }
  }
  else if ((v13 & 0x100000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(unsigned char *)&v12 & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_startOffset != *((double *)v4 + 13)) {
      goto LABEL_140;
    }
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_140;
  }
  if ((*(unsigned char *)&v12 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_endOffset != *((double *)v4 + 7)) {
      goto LABEL_140;
    }
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
    if ((v13 & 0x200) == 0 || self->_delay != *((float *)v4 + 41)) {
      goto LABEL_140;
    }
  }
  else if ((v13 & 0x200) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
    if ((v13 & 0x4000) == 0 || self->_significance != *((_DWORD *)v4 + 46)) {
      goto LABEL_140;
    }
  }
  else if ((v13 & 0x4000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
    if ((v13 & 0x2000) == 0 || self->_minZoomLevel != *((_DWORD *)v4 + 45)) {
      goto LABEL_140;
    }
  }
  else if ((v13 & 0x2000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&v12 & 0x1000) != 0)
  {
    if ((v13 & 0x1000) == 0 || self->_maxZoomLevel != *((_DWORD *)v4 + 44)) {
      goto LABEL_140;
    }
  }
  else if ((v13 & 0x1000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&v12 & 0x8000) != 0)
  {
    if ((v13 & 0x8000) == 0 || self->_speed != *((float *)v4 + 47)) {
      goto LABEL_140;
    }
  }
  else if ((v13 & 0x8000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_DWORD *)&v12 & 0x200000) != 0)
  {
    if ((v13 & 0x200000) == 0) {
      goto LABEL_140;
    }
    if (self->_hidden)
    {
      if (!*((unsigned char *)v4 + 203)) {
        goto LABEL_140;
      }
    }
    else if (*((unsigned char *)v4 + 203))
    {
      goto LABEL_140;
    }
  }
  else if ((v13 & 0x200000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_DWORD *)&v12 & 0x10000) != 0)
  {
    if ((v13 & 0x10000) == 0 || self->_trafficTrend != *((_DWORD *)v4 + 48)) {
      goto LABEL_140;
    }
  }
  else if ((v13 & 0x10000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&v12 & 0x100) != 0)
  {
    if ((v13 & 0x100) == 0 || self->_color != *((_DWORD *)v4 + 40)) {
      goto LABEL_140;
    }
  }
  else if ((v13 & 0x100) != 0)
  {
    goto LABEL_140;
  }
  if (*(unsigned char *)&v12)
  {
    if ((v13 & 1) == 0 || self->_durationMin != *((void *)v4 + 6)) {
      goto LABEL_140;
    }
  }
  else if (v13)
  {
    goto LABEL_140;
  }
  zilch = self->_zilch;
  if ((unint64_t)zilch | *((void *)v4 + 17))
  {
    if (!-[NSData isEqual:](zilch, "isEqual:")) {
      goto LABEL_140;
    }
    $8FFB56B7DD62BB34225F045795A24924 v12 = self->_flags;
    int v13 = *((_DWORD *)v4 + 52);
  }
  if ((*(unsigned char *)&v12 & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_alertCCode != *((_DWORD *)v4 + 39)) {
      goto LABEL_140;
    }
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_DWORD *)&v12 & 0x400000) == 0)
  {
    if ((v13 & 0x400000) == 0) {
      goto LABEL_146;
    }
LABEL_140:
    char v15 = 0;
    goto LABEL_141;
  }
  if ((v13 & 0x400000) == 0) {
    goto LABEL_140;
  }
  if (!self->_navigationAlert)
  {
    if (!*((unsigned char *)v4 + 204)) {
      goto LABEL_146;
    }
    goto LABEL_140;
  }
  if (!*((unsigned char *)v4 + 204)) {
    goto LABEL_140;
  }
LABEL_146:
  openlr = self->_openlr;
  if ((unint64_t)openlr | *((void *)v4 + 12)) {
    char v15 = -[NSData isEqual:](openlr, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_141:

  return v15;
}

- (unint64_t)hash
{
  -[GEOTFIncident readAll:]((uint64_t)self, 1);
  if ((*((unsigned char *)&self->_flags + 2) & 2) != 0) {
    uint64_t v62 = 2654435761 * self->_type;
  }
  else {
    uint64_t v62 = 0;
  }
  uint64_t v61 = PBRepeatedInt64Hash();
  uint64_t v60 = [(NSMutableArray *)self->_infos hash];
  NSUInteger v59 = [(NSString *)self->_incidentId hash];
  $8FFB56B7DD62BB34225F045795A24924 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    double latitude = self->_latitude;
    double v6 = -latitude;
    if (latitude >= 0.0) {
      double v6 = self->_latitude;
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
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    double longitude = self->_longitude;
    double v11 = -longitude;
    if (longitude >= 0.0) {
      double v11 = self->_longitude;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    uint64_t v57 = 2654435761 * self->_startTime;
    if ((*(unsigned char *)&flags & 0x40) != 0) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v57 = 0;
    if ((*(unsigned char *)&flags & 0x40) != 0)
    {
LABEL_22:
      uint64_t v56 = 2654435761 * self->_updateTime;
      goto LABEL_25;
    }
  }
  uint64_t v56 = 0;
LABEL_25:
  unint64_t v58 = v9;
  if ((*(_DWORD *)&flags & 0x40000) != 0) {
    uint64_t v55 = 2654435761 * self->_blocked;
  }
  else {
    uint64_t v55 = 0;
  }
  NSUInteger v54 = [(NSString *)self->_street hash];
  NSUInteger v53 = [(NSString *)self->_crossStreet hash];
  $8FFB56B7DD62BB34225F045795A24924 v14 = self->_flags;
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
    uint64_t v52 = 2654435761 * self->_laneClosureCount;
    if ((*(_DWORD *)&v14 & 0x80000) != 0)
    {
LABEL_30:
      uint64_t v51 = 2654435761 * self->_endTimeReliable;
      if ((*(_WORD *)&v14 & 0x800) != 0) {
        goto LABEL_31;
      }
      goto LABEL_39;
    }
  }
  else
  {
    uint64_t v52 = 0;
    if ((*(_DWORD *)&v14 & 0x80000) != 0) {
      goto LABEL_30;
    }
  }
  uint64_t v51 = 0;
  if ((*(_WORD *)&v14 & 0x800) != 0)
  {
LABEL_31:
    uint64_t v50 = 2654435761 * self->_laneClosureType;
    if ((*(_DWORD *)&v14 & 0x100000) != 0) {
      goto LABEL_32;
    }
LABEL_40:
    uint64_t v49 = 0;
    if ((*(unsigned char *)&v14 & 0x10) != 0) {
      goto LABEL_33;
    }
LABEL_41:
    unint64_t v19 = 0;
    goto LABEL_44;
  }
LABEL_39:
  uint64_t v50 = 0;
  if ((*(_DWORD *)&v14 & 0x100000) == 0) {
    goto LABEL_40;
  }
LABEL_32:
  uint64_t v49 = 2654435761 * self->_hardBlocked;
  if ((*(unsigned char *)&v14 & 0x10) == 0) {
    goto LABEL_41;
  }
LABEL_33:
  double startOffset = self->_startOffset;
  double v16 = -startOffset;
  if (startOffset >= 0.0) {
    double v16 = self->_startOffset;
  }
  long double v17 = floor(v16 + 0.5);
  double v18 = (v16 - v17) * 1.84467441e19;
  unint64_t v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0) {
      v19 += (unint64_t)v18;
    }
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
LABEL_44:
  if ((*(unsigned char *)&v14 & 2) != 0)
  {
    double endOffset = self->_endOffset;
    double v22 = -endOffset;
    if (endOffset >= 0.0) {
      double v22 = self->_endOffset;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    float delay = self->_delay;
    double v27 = delay;
    if (delay < 0.0) {
      double v27 = -delay;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v25 += (unint64_t)v29;
      }
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    unint64_t v25 = 0;
  }
  if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
    uint64_t v47 = 0;
    if ((*(_WORD *)&v14 & 0x2000) != 0) {
      goto LABEL_62;
    }
LABEL_65:
    uint64_t v46 = 0;
    if ((*(_WORD *)&v14 & 0x1000) != 0) {
      goto LABEL_63;
    }
    goto LABEL_66;
  }
  uint64_t v47 = 2654435761 * self->_significance;
  if ((*(_WORD *)&v14 & 0x2000) == 0) {
    goto LABEL_65;
  }
LABEL_62:
  uint64_t v46 = 2654435761 * self->_minZoomLevel;
  if ((*(_WORD *)&v14 & 0x1000) != 0)
  {
LABEL_63:
    uint64_t v45 = 2654435761 * self->_maxZoomLevel;
    goto LABEL_67;
  }
LABEL_66:
  uint64_t v45 = 0;
LABEL_67:
  unint64_t v48 = v19;
  if ((*(_WORD *)&v14 & 0x8000) != 0)
  {
    float speed = self->_speed;
    double v32 = speed;
    if (speed < 0.0) {
      double v32 = -speed;
    }
    long double v33 = floor(v32 + 0.5);
    double v34 = (v32 - v33) * 1.84467441e19;
    unint64_t v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0) {
        v30 += (unint64_t)v34;
      }
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    unint64_t v30 = 0;
  }
  if ((*(_DWORD *)&v14 & 0x200000) != 0)
  {
    uint64_t v43 = 2654435761 * self->_hidden;
    if ((*(_DWORD *)&v14 & 0x10000) != 0)
    {
LABEL_77:
      uint64_t v35 = 2654435761 * self->_trafficTrend;
      if ((*(_WORD *)&v14 & 0x100) != 0) {
        goto LABEL_78;
      }
LABEL_82:
      uint64_t v36 = 0;
      if (*(unsigned char *)&v14) {
        goto LABEL_79;
      }
      goto LABEL_83;
    }
  }
  else
  {
    uint64_t v43 = 0;
    if ((*(_DWORD *)&v14 & 0x10000) != 0) {
      goto LABEL_77;
    }
  }
  uint64_t v35 = 0;
  if ((*(_WORD *)&v14 & 0x100) == 0) {
    goto LABEL_82;
  }
LABEL_78:
  uint64_t v36 = 2654435761 * self->_color;
  if (*(unsigned char *)&v14)
  {
LABEL_79:
    unint64_t v37 = 2654435761u * self->_durationMin;
    goto LABEL_84;
  }
LABEL_83:
  unint64_t v37 = 0;
LABEL_84:
  uint64_t v38 = [(NSData *)self->_zilch hash];
  $8FFB56B7DD62BB34225F045795A24924 v39 = self->_flags;
  if ((*(unsigned char *)&v39 & 0x80) != 0)
  {
    uint64_t v40 = 2654435761 * self->_alertCCode;
    if ((*(_DWORD *)&v39 & 0x400000) != 0) {
      goto LABEL_86;
    }
LABEL_88:
    uint64_t v41 = 0;
    return v61 ^ v62 ^ v60 ^ v59 ^ v4 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v20 ^ v25 ^ v47 ^ v46 ^ v45 ^ v30 ^ v44 ^ v35 ^ v36 ^ v37 ^ v38 ^ v40 ^ v41 ^ [(NSData *)self->_openlr hash];
  }
  uint64_t v40 = 0;
  if ((*(_DWORD *)&v39 & 0x400000) == 0) {
    goto LABEL_88;
  }
LABEL_86:
  uint64_t v41 = 2654435761 * self->_navigationAlert;
  return v61 ^ v62 ^ v60 ^ v59 ^ v4 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v20 ^ v25 ^ v47 ^ v46 ^ v45 ^ v30 ^ v44 ^ v35 ^ v36 ^ v37 ^ v38 ^ v40 ^ v41 ^ [(NSData *)self->_openlr hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilch, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_openlr, 0);
  objc_storeStrong((id *)&self->_infos, 0);
  objc_storeStrong((id *)&self->_incidentId, 0);
  objc_storeStrong((id *)&self->_crossStreet, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end