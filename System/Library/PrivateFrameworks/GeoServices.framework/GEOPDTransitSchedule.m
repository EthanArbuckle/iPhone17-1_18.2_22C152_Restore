@interface GEOPDTransitSchedule
+ (id)transitScheduleForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDTransitSchedule)init;
- (GEOPDTransitSchedule)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)departurePredicateCountdown;
- (id)departurePredicateStamp;
- (id)departureSequenceAtIndex:(id *)a1;
- (id)departureSequenceContainerAtIndex:(id *)a1;
- (id)departureSequenceContainers;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsDepartureSequence:(uint64_t)a1;
- (void)_addNoFlagsDepartureSequenceContainer:(uint64_t)a1;
- (void)_readDeparturePredicateCountdown;
- (void)_readDeparturePredicateStamp;
- (void)_readDepartureSequenceContainers;
- (void)_readDepartureSequences;
- (void)addDepartureSequence:(uint64_t)a1;
- (void)addDepartureSequenceContainer:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTransitSchedule

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDTransitSchedule readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 48) count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v6 = *(id *)(a1 + 48);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v50 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v49 objects:v54 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"departureSequence";
      }
      else {
        v13 = @"departure_sequence";
      }
      [v4 setObject:v5 forKey:v13];
    }
    v14 = -[GEOPDTransitSchedule departurePredicateCountdown]((id *)a1);
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"departurePredicateCountdown";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"departure_predicate_countdown";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = -[GEOPDTransitSchedule departurePredicateStamp]((id *)a1);
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"departurePredicateStamp";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"departure_predicate_stamp";
      }
      [v4 setObject:v20 forKey:v21];
    }
    char v22 = *(unsigned char *)(a1 + 92);
    if (v22)
    {
      if (a2) {
        v23 = @"operatingHoursRange";
      }
      else {
        v23 = @"operating_hours_range";
      }
      v24 = _GEOPDTimeRangeDictionaryRepresentation((unsigned int *)(a1 + 56), a2);
      [v4 setObject:v24 forKey:v23];

      char v22 = *(unsigned char *)(a1 + 92);
    }
    if ((v22 & 2) != 0)
    {
      v25 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 72)];
      if (a2) {
        v26 = @"ttlSeconds";
      }
      else {
        v26 = @"ttl_seconds";
      }
      [v4 setObject:v25 forKey:v26];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v28 = *(id *)(a1 + 40);
      uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v46;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v46 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v45 + 1) + 8 * j);
            if (a2) {
              [v33 jsonRepresentation];
            }
            else {
            v34 = [v33 dictionaryRepresentation];
            }
            [v27 addObject:v34];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v45 objects:v53 count:16];
        }
        while (v30);
      }

      if (a2) {
        v35 = @"departureSequenceContainer";
      }
      else {
        v35 = @"departure_sequence_container";
      }
      [v4 setObject:v27 forKey:v35];
    }
    v36 = *(void **)(a1 + 16);
    if (v36)
    {
      v37 = [v36 dictionaryRepresentation];
      v38 = v37;
      if (a2)
      {
        v39 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __50__GEOPDTransitSchedule__dictionaryRepresentation___block_invoke;
        v43[3] = &unk_1E53D8860;
        id v40 = v39;
        id v44 = v40;
        [v38 enumerateKeysAndObjectsUsingBlock:v43];
        id v41 = v40;

        v38 = v41;
      }
      [v4 setObject:v38 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
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
      GEOPDTransitScheduleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTransitSchedule readAll:]((uint64_t)self, 0);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v9 = self->_departureSequences;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDTransitSchedule addDepartureSequence:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v10);
  }

  id v14 = [(GEOPDDeparturePredicate *)self->_departurePredicateCountdown copyWithZone:a3];
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  id v16 = [(GEOPDDeparturePredicate *)self->_departurePredicateStamp copyWithZone:a3];
  v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  char flags = (char)self->_flags;
  if (flags)
  {
    $B85216D09A238EDB5177F50F3CAD2EB5 has = self->_operatingHoursRange._has;
    *(void *)(v5 + 56) = *(void *)&self->_operatingHoursRange._duration;
    *($B85216D09A238EDB5177F50F3CAD2EB5 *)(v5 + 64) = has;
    *(unsigned char *)(v5 + 92) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(void *)(v5 + 72) = self->_ttlSeconds;
    *(unsigned char *)(v5 + 92) |= 2u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v20 = self->_departureSequenceContainers;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v20);
        }
        v24 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (void)v27);
        -[GEOPDTransitSchedule addDepartureSequenceContainer:](v5, v24);
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v21);
  }

  v25 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v25;
LABEL_24:

  return (id)v5;
}

- (void)_addNoFlagsDepartureSequenceContainer:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

+ (id)transitScheduleForPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__37;
  uint64_t v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__GEOPDTransitSchedule_PlaceDataExtras__transitScheduleForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:11 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __69__GEOPDTransitSchedule_PlaceDataExtras__transitScheduleForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue transitSchedule](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (GEOPDTransitSchedule)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDTransitSchedule;
  v2 = [(GEOPDTransitSchedule *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDTransitSchedule)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDTransitSchedule;
  id v3 = [(GEOPDTransitSchedule *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readDepartureSequences
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDepartureSequences_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)addDepartureSequence:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTransitSchedule _readDepartureSequences](a1);
    -[GEOPDTransitSchedule _addNoFlagsDepartureSequence:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 92) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(unsigned char *)(a1 + 92) |= 0x80u;
  }
}

- (void)_addNoFlagsDepartureSequence:(uint64_t)a1
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

- (id)departureSequenceAtIndex:(id *)a1
{
  if (a1)
  {
    id v4 = a1;
    -[GEOPDTransitSchedule _readDepartureSequences]((uint64_t)a1);
    a1 = [v4[6] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)_readDeparturePredicateCountdown
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 8) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeparturePredicateCountdown_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)departurePredicateCountdown
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDTransitSchedule _readDeparturePredicateCountdown]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readDeparturePredicateStamp
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 0x10) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeparturePredicateStamp_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)departurePredicateStamp
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDTransitSchedule _readDeparturePredicateStamp]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readDepartureSequenceContainers
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 0x20) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDepartureSequenceContainers_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)departureSequenceContainers
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDTransitSchedule _readDepartureSequenceContainers]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addDepartureSequenceContainer:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTransitSchedule _readDepartureSequenceContainers](a1);
    -[GEOPDTransitSchedule _addNoFlagsDepartureSequenceContainer:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 92) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(unsigned char *)(a1 + 92) |= 0x80u;
  }
}

- (id)departureSequenceContainerAtIndex:(id *)a1
{
  if (a1)
  {
    id v4 = a1;
    -[GEOPDTransitSchedule _readDepartureSequenceContainers]((uint64_t)a1);
    a1 = [v4[5] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTransitSchedule;
  id v4 = [(GEOPDTransitSchedule *)&v8 description];
  id v5 = [(GEOPDTransitSchedule *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitSchedule _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDTransitSchedule _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_9515;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_9516;
      }
      GEOPDTransitScheduleReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDTransitScheduleCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

void __50__GEOPDTransitSchedule__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDTransitScheduleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 7u))
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDTransitSchedule readAll:]((uint64_t)self, 0);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    objc_super v6 = self->_departureSequences;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v7);
    }

    if (self->_departurePredicateCountdown) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_departurePredicateStamp) {
      PBDataWriterWriteSubmessage();
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      uint64_t v21 = 0;
      PBDataWriterPlaceMark();
      GEOPDTimeRangeWriteTo((uint64_t)&self->_operatingHoursRange);
      PBDataWriterRecallMark();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteUint64Field();
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = self->_departureSequenceContainers;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v26 count:16];
      }
      while (v12);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned int *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  -[GEOPDTransitSchedule readAll:]((uint64_t)self, 1);
  -[GEOPDTransitSchedule readAll:]((uint64_t)v4, 1);
  departureSequences = self->_departureSequences;
  if ((unint64_t)departureSequences | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](departureSequences, "isEqual:")) {
      goto LABEL_24;
    }
  }
  departurePredicateCountdown = self->_departurePredicateCountdown;
  if ((unint64_t)departurePredicateCountdown | *((void *)v4 + 3))
  {
    if (!-[GEOPDDeparturePredicate isEqual:](departurePredicateCountdown, "isEqual:")) {
      goto LABEL_24;
    }
  }
  departurePredicateStamp = self->_departurePredicateStamp;
  if ((unint64_t)departurePredicateStamp | *((void *)v4 + 4))
  {
    if (!-[GEOPDDeparturePredicate isEqual:](departurePredicateStamp, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[23] & 1) == 0) {
      goto LABEL_24;
    }
    if (*(void *)&self->_operatingHoursRange._duration != *((void *)v4 + 7)
      || *(_DWORD *)&self->_operatingHoursRange._has != (unint64_t)v4[16])
    {
      goto LABEL_24;
    }
  }
  else if (v4[23])
  {
LABEL_24:
    char v10 = 0;
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[23] & 2) == 0 || self->_ttlSeconds != *((void *)v4 + 9)) {
      goto LABEL_24;
    }
  }
  else if ((v4[23] & 2) != 0)
  {
    goto LABEL_24;
  }
  departureSequenceContainers = self->_departureSequenceContainers;
  if ((unint64_t)departureSequenceContainers | *((void *)v4 + 5)) {
    char v10 = -[NSMutableArray isEqual:](departureSequenceContainers, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_25:

  return v10;
}

- (unint64_t)hash
{
  -[GEOPDTransitSchedule readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_departureSequences hash];
  unint64_t v4 = [(GEOPDDeparturePredicate *)self->_departurePredicateCountdown hash];
  unint64_t v5 = [(GEOPDDeparturePredicate *)self->_departurePredicateStamp hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v6 = PBHashBytes();
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSMutableArray *)self->_departureSequenceContainers hash];
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v7 = 2654435761u * self->_ttlSeconds;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSMutableArray *)self->_departureSequenceContainers hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departureSequences, 0);
  objc_storeStrong((id *)&self->_departureSequenceContainers, 0);
  objc_storeStrong((id *)&self->_departurePredicateStamp, 0);
  objc_storeStrong((id *)&self->_departurePredicateCountdown, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end