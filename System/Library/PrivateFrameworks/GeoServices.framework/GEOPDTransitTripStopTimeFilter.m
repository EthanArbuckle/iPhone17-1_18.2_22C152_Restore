@interface GEOPDTransitTripStopTimeFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDTransitTripStopTimeFilter)init;
- (GEOPDTransitTripStopTimeFilter)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)setDeparturePredicateCountdown:(uint64_t)a1;
- (void)setDeparturePredicateStamp:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTransitTripStopTimeFilter

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 60));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_9703;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_9704;
      }
      GEOPDTransitTripStopTimeFilterReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
  }
}

- (GEOPDTransitTripStopTimeFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDTransitTripStopTimeFilter;
  v2 = [(GEOPDTransitTripStopTimeFilter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDTransitTripStopTimeFilter)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDTransitTripStopTimeFilter;
  v3 = [(GEOPDTransitTripStopTimeFilter *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)setDeparturePredicateCountdown:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 68) |= 8u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setDeparturePredicateStamp:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 68) |= 0x10u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTransitTripStopTimeFilter;
  id v4 = [(GEOPDTransitTripStopTimeFilter *)&v8 description];
  id v5 = [(GEOPDTransitTripStopTimeFilter *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitTripStopTimeFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDTransitTripStopTimeFilter readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 60));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDTransitTripStopTimeFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeparturePredicateCountdown_tags_9701);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
    id v7 = *(id *)(a1 + 24);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"departurePredicateCountdown";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"departure_predicate_countdown";
      }
      [v4 setObject:v9 forKey:v10];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 60));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOPDTransitTripStopTimeFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeparturePredicateStamp_tags_9702);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
    id v13 = *(id *)(a1 + 32);
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"departurePredicateStamp";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"departure_predicate_stamp";
      }
      [v4 setObject:v15 forKey:v16];
    }
    char v17 = *(unsigned char *)(a1 + 68);
    if (v17)
    {
      if (a2) {
        v18 = @"operatingHoursRange";
      }
      else {
        v18 = @"operating_hours_range";
      }
      v19 = _GEOPDTimeRangeDictionaryRepresentation((unsigned int *)(a1 + 40), a2);
      [v4 setObject:v19 forKey:v18];

      char v17 = *(unsigned char *)(a1 + 68);
    }
    if ((v17 & 2) != 0)
    {
      v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
      if (a2) {
        v21 = @"includeRealTimeDepartures";
      }
      else {
        v21 = @"include_real_time_departures";
      }
      [v4 setObject:v20 forKey:v21];
    }
    v22 = *(void **)(a1 + 16);
    if (v22)
    {
      v23 = [v22 dictionaryRepresentation];
      v24 = v23;
      if (a2)
      {
        v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __60__GEOPDTransitTripStopTimeFilter__dictionaryRepresentation___block_invoke;
        v29[3] = &unk_1E53D8860;
        id v26 = v25;
        id v30 = v26;
        [v24 enumerateKeysAndObjectsUsingBlock:v29];
        id v27 = v26;

        v24 = v27;
      }
      [v4 setObject:v24 forKey:@"Unknown Fields"];
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
  return -[GEOPDTransitTripStopTimeFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEOPDTransitTripStopTimeFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitTripStopTimeFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    id v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDTransitTripStopTimeFilter readAll:]((uint64_t)self, 0);
    if (self->_departurePredicateCountdown) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_departurePredicateStamp) {
      PBDataWriterWriteSubmessage();
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterPlaceMark();
      GEOPDTimeRangeWriteTo((uint64_t)&self->_operatingHoursRange);
      PBDataWriterRecallMark();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDTransitTripStopTimeFilterReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTransitTripStopTimeFilter readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDDeparturePredicate *)self->_departurePredicateCountdown copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOPDDeparturePredicate *)self->_departurePredicateStamp copyWithZone:a3];
  id v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  char flags = (char)self->_flags;
  if (flags)
  {
    $B85216D09A238EDB5177F50F3CAD2EB5 has = self->_operatingHoursRange._has;
    *(void *)(v5 + 40) = *(void *)&self->_operatingHoursRange._duration;
    *($B85216D09A238EDB5177F50F3CAD2EB5 *)(v5 + 48) = has;
    *(unsigned char *)(v5 + 68) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 64) = self->_includeRealTimeDepartures;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  v15 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v15;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned int *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  -[GEOPDTransitTripStopTimeFilter readAll:]((uint64_t)self, 1);
  -[GEOPDTransitTripStopTimeFilter readAll:]((uint64_t)v4, 1);
  departurePredicateCountdown = self->_departurePredicateCountdown;
  if ((unint64_t)departurePredicateCountdown | *((void *)v4 + 3))
  {
    if (!-[GEOPDDeparturePredicate isEqual:](departurePredicateCountdown, "isEqual:")) {
      goto LABEL_17;
    }
  }
  departurePredicateStamp = self->_departurePredicateStamp;
  if ((unint64_t)departurePredicateStamp | *((void *)v4 + 4))
  {
    if (!-[GEOPDDeparturePredicate isEqual:](departurePredicateStamp, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[17] & 1) == 0) {
      goto LABEL_17;
    }
    if (*(void *)&self->_operatingHoursRange._duration != *((void *)v4 + 5)
      || *(_DWORD *)&self->_operatingHoursRange._has != (unint64_t)v4[12])
    {
      goto LABEL_17;
    }
  }
  else if (v4[17])
  {
    goto LABEL_17;
  }
  BOOL v8 = (v4[17] & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[17] & 2) == 0)
    {
LABEL_17:
      BOOL v8 = 0;
      goto LABEL_18;
    }
    if (self->_includeRealTimeDepartures)
    {
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 64))
    {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDTransitTripStopTimeFilter readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDDeparturePredicate *)self->_departurePredicateCountdown hash];
  unint64_t v4 = [(GEOPDDeparturePredicate *)self->_departurePredicateStamp hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v5 = PBHashBytes();
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_includeRealTimeDepartures;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departurePredicateStamp, 0);
  objc_storeStrong((id *)&self->_departurePredicateCountdown, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end