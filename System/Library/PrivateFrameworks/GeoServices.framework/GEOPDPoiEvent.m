@interface GEOPDPoiEvent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPoiEvent)init;
- (GEOPDPoiEvent)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventCategorys;
- (id)eventDateTimes;
- (id)eventId;
- (id)jsonRepresentation;
- (id)name;
- (id)performers;
- (id)poiIds;
- (id)timezone;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1;
- (unint64_t)hash;
- (void)_addNoFlagsEventCategory:(uint64_t)a1;
- (void)_addNoFlagsEventDateTime:(uint64_t)a1;
- (void)_addNoFlagsPerformer:(uint64_t)a1;
- (void)_addNoFlagsPoiId:(uint64_t)a1;
- (void)_readEventCategorys;
- (void)_readEventDateTimes;
- (void)_readEventId;
- (void)_readName;
- (void)_readPerformers;
- (void)_readPoiIds;
- (void)_readTimezone;
- (void)addEventCategory:(uint64_t)a1;
- (void)addEventDateTime:(uint64_t)a1;
- (void)addPerformer:(uint64_t)a1;
- (void)addPoiId:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPoiEvent

- (void)_readPerformers
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPoiEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPerformers_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDPoiEvent readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDPoiEvent eventId]((id *)a1);
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        v8 = @"eventId";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        v8 = @"event_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = -[GEOPDPoiEvent name]((id *)a1);
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"name"];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v13 = *(id *)(a1 + 24);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v73 objects:v80 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v74;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v74 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v73 + 1) + 8 * i);
            if (a2) {
              [v18 jsonRepresentation];
            }
            else {
            v19 = [v18 dictionaryRepresentation];
            }
            [v12 addObject:v19];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v73 objects:v80 count:16];
        }
        while (v15);
      }

      if (a2) {
        v20 = @"eventCategory";
      }
      else {
        v20 = @"event_category";
      }
      [v4 setObject:v12 forKey:v20];
    }
    if ([*(id *)(a1 + 64) count])
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v22 = *(id *)(a1 + 64);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v69 objects:v79 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v70;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v70 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v69 + 1) + 8 * j);
            if (a2) {
              [v27 jsonRepresentation];
            }
            else {
            v28 = [v27 dictionaryRepresentation];
            }
            [v21 addObject:v28];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v69 objects:v79 count:16];
        }
        while (v24);
      }

      if (a2) {
        v29 = @"poiId";
      }
      else {
        v29 = @"poi_id";
      }
      [v4 setObject:v21 forKey:v29];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v31 = *(id *)(a1 + 32);
      uint64_t v32 = [v31 countByEnumeratingWithState:&v65 objects:v78 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v66;
        do
        {
          for (uint64_t k = 0; k != v33; ++k)
          {
            if (*(void *)v66 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = *(void **)(*((void *)&v65 + 1) + 8 * k);
            if (a2) {
              [v36 jsonRepresentation];
            }
            else {
            v37 = [v36 dictionaryRepresentation];
            }
            [v30 addObject:v37];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v65 objects:v78 count:16];
        }
        while (v33);
      }

      if (a2) {
        v38 = @"eventDateTime";
      }
      else {
        v38 = @"event_date_time";
      }
      [v4 setObject:v30 forKey:v38];
    }
    v39 = -[GEOPDPoiEvent timezone]((id *)a1);
    v40 = v39;
    if (v39)
    {
      if (a2) {
        [v39 jsonRepresentation];
      }
      else {
      v41 = [v39 dictionaryRepresentation];
      }
      [v4 setObject:v41 forKey:@"timezone"];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v43 = *(id *)(a1 + 56);
      uint64_t v44 = [v43 countByEnumeratingWithState:&v61 objects:v77 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v62;
        do
        {
          for (uint64_t m = 0; m != v45; ++m)
          {
            if (*(void *)v62 != v46) {
              objc_enumerationMutation(v43);
            }
            v48 = *(void **)(*((void *)&v61 + 1) + 8 * m);
            if (a2) {
              [v48 jsonRepresentation];
            }
            else {
            v49 = [v48 dictionaryRepresentation];
            }
            [v42 addObject:v49];
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v61 objects:v77 count:16];
        }
        while (v45);
      }

      [v4 setObject:v42 forKey:@"performer"];
    }
    if (*(_WORD *)(a1 + 96))
    {
      v50 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 92)];
      if (a2) {
        v51 = @"expectedAttendance";
      }
      else {
        v51 = @"expected_attendance";
      }
      [v4 setObject:v50 forKey:v51];
    }
    v52 = *(void **)(a1 + 16);
    if (v52)
    {
      v53 = [v52 dictionaryRepresentation];
      v54 = v53;
      if (a2)
      {
        v55 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v53, "count"));
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __43__GEOPDPoiEvent__dictionaryRepresentation___block_invoke;
        v59[3] = &unk_1E53D8860;
        id v56 = v55;
        id v60 = v56;
        [v54 enumerateKeysAndObjectsUsingBlock:v59];
        id v57 = v56;

        v54 = v57;
      }
      [v4 setObject:v54 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)name
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPoiEvent _readName]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addEventDateTime:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPoiEvent _readEventDateTimes](a1);
    -[GEOPDPoiEvent _addNoFlagsEventDateTime:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 96) |= 0x200u;
  }
}

- (void)_addNoFlagsPoiId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_addNoFlagsEventDateTime:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_poiIds, 0);
  objc_storeStrong((id *)&self->_performers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_eventDateTimes, 0);
  objc_storeStrong((id *)&self->_eventCategorys, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  -[GEOPDPoiEvent _readEventId](a1);
  if ([*(id *)(a1 + 40) hasGreenTeaWithValue:a2]) {
    return 1;
  }
  -[GEOPDPoiEvent _readPoiIds](a1);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *(id *)(a1 + 64);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", a2, (void)v11))
        {
          uint64_t v4 = 1;
          goto LABEL_14;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v4 = 0;
LABEL_14:

  return v4;
}

- (GEOPDPoiEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPoiEvent;
  v2 = [(GEOPDPoiEvent *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = v2;
  }

  return v3;
}

- (GEOPDPoiEvent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPoiEvent;
  id v3 = [(GEOPDPoiEvent *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readEventId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPoiEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEventId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)eventId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPoiEvent _readEventId]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPoiEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_7761);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)_readEventCategorys
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
        GEOPDPoiEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEventCategorys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)eventCategorys
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPoiEvent _readEventCategorys]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addEventCategory:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPoiEvent _readEventCategorys](a1);
    -[GEOPDPoiEvent _addNoFlagsEventCategory:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 96) |= 0x200u;
  }
}

- (void)_addNoFlagsEventCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      uint64_t v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readPoiIds
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
        GEOPDPoiEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)poiIds
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPoiEvent _readPoiIds]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addPoiId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPoiEvent _readPoiIds](a1);
    -[GEOPDPoiEvent _addNoFlagsPoiId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 96) |= 0x200u;
  }
}

- (void)_readEventDateTimes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPoiEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEventDateTimes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)eventDateTimes
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPoiEvent _readEventDateTimes]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readTimezone
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPoiEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimezone_tags_7764);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)timezone
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPoiEvent _readTimezone]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)performers
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPoiEvent _readPerformers]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addPerformer:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPoiEvent _readPerformers](a1);
    -[GEOPDPoiEvent _addNoFlagsPerformer:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 96) |= 0x200u;
  }
}

- (void)_addNoFlagsPerformer:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      uint64_t v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPoiEvent;
  uint64_t v4 = [(GEOPDPoiEvent *)&v8 description];
  id v5 = [(GEOPDPoiEvent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPoiEvent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDPoiEvent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    uint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_7799;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_7800;
      }
      GEOPDPoiEventReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDPoiEventCallReadAllRecursiveWithoutSynchronized((id *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

void __43__GEOPDPoiEvent__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDPoiEventReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_7;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x210) != 0) {
    goto LABEL_7;
  }
  if ((flags & 0x20) != 0)
  {
    if (GEOLocalizedStringIsDirty((uint64_t)self->_name))
    {
LABEL_7:
      os_unfair_lock_unlock(&self->_readerLock);
      -[GEOPDPoiEvent readAll:]((uint64_t)self, 0);
      if (self->_eventId) {
        PBDataWriterWriteSubmessage();
      }
      if (self->_name) {
        PBDataWriterWriteSubmessage();
      }
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v7 = self->_eventCategorys;
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v43 objects:v54 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v44 != v9) {
              objc_enumerationMutation(v7);
            }
            PBDataWriterWriteSubmessage();
          }
          uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v43 objects:v54 count:16];
        }
        while (v8);
      }

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v11 = self->_poiIds;
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v39 objects:v53 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v40;
        do
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v40 != v13) {
              objc_enumerationMutation(v11);
            }
            PBDataWriterWriteSubmessage();
          }
          uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v39 objects:v53 count:16];
        }
        while (v12);
      }

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v15 = self->_eventDateTimes;
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v35 objects:v52 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v36;
        do
        {
          for (uint64_t k = 0; k != v16; ++k)
          {
            if (*(void *)v36 != v17) {
              objc_enumerationMutation(v15);
            }
            PBDataWriterWriteSubmessage();
          }
          uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v35 objects:v52 count:16];
        }
        while (v16);
      }

      if (self->_timezone) {
        PBDataWriterWriteSubmessage();
      }
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v19 = self->_performers;
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v31 objects:v51 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v32;
        do
        {
          for (uint64_t m = 0; m != v20; ++m)
          {
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v19);
            }
            PBDataWriterWriteSubmessage();
          }
          uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v31 objects:v51 count:16];
        }
        while (v20);
      }

      if (*(_WORD *)&self->_flags) {
        PBDataWriterWriteInt32Field();
      }
      [(PBUnknownFields *)self->_unknownFields writeTo:v4];
      goto LABEL_44;
    }
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 0x1CC) != 0) {
    goto LABEL_7;
  }
  if ((flags & 0x40) != 0)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obuint64_t j = self->_performers;
    uint64_t v30 = [(NSMutableArray *)obj countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v30)
    {
      uint64_t v29 = *(void *)v48;
      while (2)
      {
        for (uint64_t n = 0; n != v30; ++n)
        {
          if (*(void *)v48 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(os_unfair_lock_s **)(*((void *)&v47 + 1) + 8 * n);
          if (v24)
          {
            os_unfair_lock_lock_with_options();
            char IsDirty = _GEOPDPerformerIsDirty((uint64_t)v24);
            os_unfair_lock_unlock(v24 + 16);
            if (IsDirty)
            {

              goto LABEL_7;
            }
          }
        }
        uint64_t v30 = [(NSMutableArray *)obj countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }
  }
  v26 = self->_reader;
  objc_sync_enter(v26);
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  v27 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
  [v4 writeData:v27];
  os_unfair_lock_unlock(p_readerLock);

  objc_sync_exit(v26);
LABEL_44:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPoiEventReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_36;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPoiEvent readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDMapsIdentifier *)self->_eventId copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  id v11 = [(GEOLocalizedString *)self->_name copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v13 = self->_eventCategorys;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v49 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDPoiEvent addEventCategory:](v5, v17);
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v14);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v18 = self->_poiIds;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v46 != v20) {
          objc_enumerationMutation(v18);
        }
        id v22 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * j) copyWithZone:a3];
        -[GEOPDPoiEvent addPoiId:](v5, v22);
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v45 objects:v55 count:16];
    }
    while (v19);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v23 = self->_eventDateTimes;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v42 != v25) {
          objc_enumerationMutation(v23);
        }
        v27 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * k) copyWithZone:a3];
        -[GEOPDPoiEvent addEventDateTime:](v5, v27);
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v41 objects:v54 count:16];
    }
    while (v24);
  }

  id v28 = [(GEOTimezone *)self->_timezone copyWithZone:a3];
  uint64_t v29 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v28;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v30 = self->_performers;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v37 objects:v53 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v38;
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v38 != v32) {
          objc_enumerationMutation(v30);
        }
        long long v34 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * m), "copyWithZone:", a3, (void)v37);
        -[GEOPDPoiEvent addPerformer:](v5, v34);
      }
      uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v37 objects:v53 count:16];
    }
    while (v31);
  }

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 92) = self->_expectedAttendance;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  long long v35 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v35;
LABEL_36:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  -[GEOPDPoiEvent readAll:]((uint64_t)self, 1);
  -[GEOPDPoiEvent readAll:]((uint64_t)v4, 1);
  eventId = self->_eventId;
  if ((unint64_t)eventId | *((void *)v4 + 5))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](eventId, "isEqual:")) {
      goto LABEL_20;
    }
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 6))
  {
    if (!-[GEOLocalizedString isEqual:](name, "isEqual:")) {
      goto LABEL_20;
    }
  }
  eventCategorys = self->_eventCategorys;
  if ((unint64_t)eventCategorys | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](eventCategorys, "isEqual:")) {
      goto LABEL_20;
    }
  }
  poiIds = self->_poiIds;
  if ((unint64_t)poiIds | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](poiIds, "isEqual:")) {
      goto LABEL_20;
    }
  }
  eventDateTimes = self->_eventDateTimes;
  if ((unint64_t)eventDateTimes | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](eventDateTimes, "isEqual:")) {
      goto LABEL_20;
    }
  }
  timezone = self->_timezone;
  if ((unint64_t)timezone | *((void *)v4 + 9))
  {
    if (!-[GEOTimezone isEqual:](timezone, "isEqual:")) {
      goto LABEL_20;
    }
  }
  performers = self->_performers;
  if ((unint64_t)performers | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](performers, "isEqual:")) {
      goto LABEL_20;
    }
  }
  __int16 v12 = *((_WORD *)v4 + 48);
  BOOL v13 = (v12 & 1) == 0;
  if (*(_WORD *)&self->_flags)
  {
    if ((v12 & 1) != 0 && self->_expectedAttendance == *((_DWORD *)v4 + 23))
    {
      BOOL v13 = 1;
      goto LABEL_21;
    }
LABEL_20:
    BOOL v13 = 0;
  }
LABEL_21:

  return v13;
}

- (unint64_t)hash
{
  -[GEOPDPoiEvent readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDMapsIdentifier *)self->_eventId hash];
  unint64_t v4 = [(GEOLocalizedString *)self->_name hash];
  uint64_t v5 = [(NSMutableArray *)self->_eventCategorys hash];
  uint64_t v6 = [(NSMutableArray *)self->_poiIds hash];
  uint64_t v7 = [(NSMutableArray *)self->_eventDateTimes hash];
  unint64_t v8 = [(GEOTimezone *)self->_timezone hash];
  uint64_t v9 = [(NSMutableArray *)self->_performers hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v10 = 2654435761 * self->_expectedAttendance;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

@end