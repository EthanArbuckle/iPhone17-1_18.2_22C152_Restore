@interface GEOPDDepartureSequence
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDDepartureSequence)init;
- (GEOPDDepartureSequence)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)departureFrequencys;
- (id)departures;
- (id)description;
- (id)dictionaryRepresentation;
- (id)directionNameString;
- (id)displayName;
- (id)headsignString;
- (id)jsonRepresentation;
- (id)originName;
- (uint64_t)_initWithDictionary:(uint64_t)a3 isJSON:;
- (uint64_t)_reserveOperatingHours:(uint64_t)result;
- (uint64_t)clearUnknownFields:(uint64_t)result;
- (uint64_t)nextStopIdAtIndex:(uint64_t)result;
- (uint64_t)operatingHoursAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsDeparture:(uint64_t)a1;
- (void)_addNoFlagsDepartureFrequency:(uint64_t)a1;
- (void)_readDepartureFrequencys;
- (void)_readDepartures;
- (void)_readDirectionNameString;
- (void)_readDisplayName;
- (void)_readHeadsignString;
- (void)_readNextStopIds;
- (void)_readOperatingHours;
- (void)_readOriginName;
- (void)addDeparture:(uint64_t)a1;
- (void)addDepartureFrequency:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDDepartureSequence

- (GEOPDDepartureSequence)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDDepartureSequence;
  v2 = [(GEOPDDepartureSequence *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDDepartureSequence)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDDepartureSequence;
  v3 = [(GEOPDDepartureSequence *)&v7 initWithData:a3];
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
  if (self)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)&self->_flags |= 0x20u;
    os_unfair_lock_unlock(&self->_readerLock);
    *(_WORD *)&self->_flags |= 0x2000u;
    self->_operatingHoursSpace = 0;
    self->_operatingHoursCount = 0;
    free(self->_operatingHours);
    self->_operatingHours = 0;
  }
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDDepartureSequence;
  [(GEOPDDepartureSequence *)&v3 dealloc];
}

- (void)_readDepartures
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 164) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDepartures_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (id)departures
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDDepartureSequence _readDepartures]((uint64_t)a1);
    a1 = (id *)v2[11];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addDeparture:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDDepartureSequence _readDepartures](a1);
    -[GEOPDDepartureSequence _addNoFlagsDeparture:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 164) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    *(_WORD *)(a1 + 164) |= 0x2000u;
  }
}

- (void)_addNoFlagsDeparture:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readDepartureFrequencys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 164) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDepartureFrequencys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (id)departureFrequencys
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDDepartureSequence _readDepartureFrequencys]((uint64_t)a1);
    a1 = (id *)v2[10];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addDepartureFrequency:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDDepartureSequence _readDepartureFrequencys](a1);
    -[GEOPDDepartureSequence _addNoFlagsDepartureFrequency:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 164) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    *(_WORD *)(a1 + 164) |= 0x2000u;
  }
}

- (void)_addNoFlagsDepartureFrequency:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readOperatingHours
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 164) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOperatingHours_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (uint64_t)_reserveOperatingHours:(uint64_t)result
{
  if (result)
  {
    v2 = (void *)result;
    unint64_t v3 = *(void *)(result + 56);
    unint64_t v4 = v3 + a2;
    if (v3 + a2 <= v3) {
      return 0;
    }
    unint64_t v5 = *(void *)(result + 64);
    if (v5 >= v4) {
      return 1;
    }
    unint64_t v6 = v5 + a2;
    if (v5 + a2)
    {
      unint64_t v7 = 1;
      while (1)
      {
        unint64_t v8 = v7;
        if (v7 >= v6) {
          break;
        }
        v7 *= 2;
        if ((v8 & 0x8000000000000000) != 0)
        {
          unint64_t v8 = -1;
          goto LABEL_11;
        }
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
    if (v8 < a2) {
      return 0;
    }
LABEL_11:
    if (12 * v8 < v8) {
      return 0;
    }
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 48), 12 * v8, 0xDF10DD53uLL);
    if (result)
    {
      v2[8] = v8;
      v2[6] = result;
      bzero((void *)(result + 12 * v2[7]), 12 * (v8 - v2[7]));
      return 1;
    }
  }
  return result;
}

- (uint64_t)operatingHoursAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDDepartureSequence _readOperatingHours](result);
    unint64_t v4 = *(void *)(v3 + 56);
    if (v4 <= a2)
    {
      unint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      unint64_t v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(void *)(*(void *)(v3 + 48) + 12 * a2);
  }
  return result;
}

- (void)_readDirectionNameString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 164) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionNameString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (id)directionNameString
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDDepartureSequence _readDirectionNameString]((uint64_t)a1);
    a1 = (id *)v2[12];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readHeadsignString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 164) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHeadsignString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (id)headsignString
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDDepartureSequence _readHeadsignString]((uint64_t)a1);
    a1 = (id *)v2[14];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readNextStopIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 164) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNextStopIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (uint64_t)nextStopIdAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDDepartureSequence _readNextStopIds](result);
    unint64_t v4 = *(void *)(v3 + 32);
    if (v4 <= a2)
    {
      unint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      unint64_t v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(void *)(*(void *)(v3 + 24) + 8 * a2);
  }
  return result;
}

- (void)_readDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 164) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (id)displayName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDDepartureSequence _readDisplayName]((uint64_t)a1);
    a1 = (id *)v2[13];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readOriginName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 164) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (id)originName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDDepartureSequence _readOriginName]((uint64_t)a1);
    a1 = (id *)v2[16];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDDepartureSequence;
  unint64_t v4 = [(GEOPDDepartureSequence *)&v8 description];
  unint64_t v5 = [(GEOPDDepartureSequence *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDepartureSequence _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDDepartureSequence readAll:](a1, 1);
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v5 = *(_WORD *)(a1 + 164);
    if (v5)
    {
      uint64_t v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 120)];
      if (a2) {
        unint64_t v7 = @"lineId";
      }
      else {
        unint64_t v7 = @"line_id";
      }
      [v4 setObject:v6 forKey:v7];

      __int16 v5 = *(_WORD *)(a1 + 164);
    }
    if ((v5 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 136)];
      if (a2) {
        v9 = @"stopId";
      }
      else {
        v9 = @"stop_id";
      }
      [v4 setObject:v8 forKey:v9];
    }
    if ([*(id *)(a1 + 88) count])
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v11 = *(id *)(a1 + 88);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v60 objects:v65 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v61 != v13) {
              objc_enumerationMutation(v11);
            }
            v15 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            v16 = [v15 dictionaryRepresentation];
            }
            [v10 addObject:v16];
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v60 objects:v65 count:16];
        }
        while (v12);
      }

      [v4 setObject:v10 forKey:@"departure"];
    }
    if ([*(id *)(a1 + 80) count])
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v18 = *(id *)(a1 + 80);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v56 objects:v64 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v57 != v20) {
              objc_enumerationMutation(v18);
            }
            v22 = *(void **)(*((void *)&v56 + 1) + 8 * j);
            if (a2) {
              [v22 jsonRepresentation];
            }
            else {
            v23 = [v22 dictionaryRepresentation];
            }
            [v17 addObject:v23];
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v56 objects:v64 count:16];
        }
        while (v19);
      }

      if (a2) {
        v24 = @"departureFrequency";
      }
      else {
        v24 = @"departure_frequency";
      }
      [v4 setObject:v17 forKey:v24];
    }
    if (*(void *)(a1 + 56))
    {
      v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 56)];
      if (*(void *)(a1 + 56))
      {
        uint64_t v26 = 0;
        unint64_t v27 = 0;
        do
        {
          v28 = _GEOPDTimeRangeDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 48) + v26), a2);
          [v25 addObject:v28];

          ++v27;
          v26 += 12;
        }
        while (v27 < *(void *)(a1 + 56));
      }
      if (a2) {
        v29 = @"operatingHours";
      }
      else {
        v29 = @"operating_hours";
      }
      [v4 setObject:v25 forKey:v29];
    }
    v30 = -[GEOPDDepartureSequence directionNameString]((id *)a1);
    if (v30)
    {
      if (a2) {
        v31 = @"directionNameString";
      }
      else {
        v31 = @"direction_name_string";
      }
      [v4 setObject:v30 forKey:v31];
    }

    v32 = -[GEOPDDepartureSequence headsignString]((id *)a1);
    if (v32)
    {
      if (a2) {
        v33 = @"headsignString";
      }
      else {
        v33 = @"headsign_string";
      }
      [v4 setObject:v32 forKey:v33];
    }

    if (*(void *)(a1 + 32))
    {
      v34 = PBRepeatedUInt64NSArray();
      if (a2) {
        v35 = @"nextStopId";
      }
      else {
        v35 = @"next_stop_id";
      }
      [v4 setObject:v34 forKey:v35];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 164) & 0x40) == 0)
    {
      v36 = *(void **)(a1 + 8);
      if (v36)
      {
        id v37 = v36;
        objc_sync_enter(v37);
        GEOPDDepartureSequenceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtwork_tags_2);
        objc_sync_exit(v37);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    id v38 = *(id *)(a1 + 72);
    v39 = v38;
    if (v38)
    {
      if (a2) {
        [v38 jsonRepresentation];
      }
      else {
      v40 = [v38 dictionaryRepresentation];
      }
      [v4 setObject:v40 forKey:@"artwork"];
    }
    if ((*(_WORD *)(a1 + 164) & 4) != 0)
    {
      v41 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 144)];
      if (a2) {
        v42 = @"transitId";
      }
      else {
        v42 = @"transit_id";
      }
      [v4 setObject:v41 forKey:v42];
    }
    v43 = -[GEOPDDepartureSequence displayName]((id *)a1);
    if (v43)
    {
      if (a2) {
        v44 = @"displayName";
      }
      else {
        v44 = @"display_name";
      }
      [v4 setObject:v43 forKey:v44];
    }

    v45 = -[GEOPDDepartureSequence originName]((id *)a1);
    if (v45)
    {
      if (a2) {
        v46 = @"originName";
      }
      else {
        v46 = @"origin_name";
      }
      [v4 setObject:v45 forKey:v46];
    }

    v47 = *(void **)(a1 + 16);
    if (v47)
    {
      v48 = [v47 dictionaryRepresentation];
      v49 = v48;
      if (a2)
      {
        v50 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v48, "count"));
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __52__GEOPDDepartureSequence__dictionaryRepresentation___block_invoke;
        v54[3] = &unk_1E53D8860;
        id v51 = v50;
        id v55 = v51;
        [v49 enumerateKeysAndObjectsUsingBlock:v54];
        id v52 = v51;
      }
      else
      {
        id v52 = v48;
      }
      [v4 setObject:v52 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDDepartureSequence _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_3972;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_3973;
      }
      GEOPDDepartureSequenceReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDDepartureSequenceCallReadAllRecursiveWithoutSynchronized((id *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

void __52__GEOPDDepartureSequence__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
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

- (uint64_t)_initWithDictionary:(uint64_t)a3 isJSON:
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      unint64_t v7 = @"lineId";
    }
    else {
      unint64_t v7 = @"line_id";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v8 unsignedLongLongValue];
      *(_WORD *)(v6 + 164) |= 0x2000u;
      *(_WORD *)(v6 + 164) |= 1u;
      *(void *)(v6 + 120) = v9;
    }

    if (a3) {
      id v10 = @"stopId";
    }
    else {
      id v10 = @"stop_id";
    }
    id v11 = [v5 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [v11 unsignedLongLongValue];
      *(_WORD *)(v6 + 164) |= 0x2000u;
      *(_WORD *)(v6 + 164) |= 2u;
      *(void *)(v6 + 136) = v12;
    }

    uint64_t v13 = [v5 objectForKeyedSubscript:@"departure"];
    objc_opt_class();
    id v81 = v5;
    if (objc_opt_isKindOfClass())
    {
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v96 objects:v103 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v97;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v97 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v96 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v20 = [GEOPDDeparture alloc];
              if (a3) {
                v21 = [(GEOPDDeparture *)v20 initWithJSON:v19];
              }
              else {
                v21 = [(GEOPDDeparture *)v20 initWithDictionary:v19];
              }
              v22 = v21;
              -[GEOPDDepartureSequence addDeparture:](v6, v21);
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v96 objects:v103 count:16];
        }
        while (v16);
      }

      id v5 = v81;
    }

    if (a3) {
      v23 = @"departureFrequency";
    }
    else {
      v23 = @"departure_frequency";
    }
    v24 = [v5 objectForKeyedSubscript:v23];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v25 = v24;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v92 objects:v102 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v93;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v93 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v92 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v31 = [GEOPDDepartureFrequency alloc];
              if (a3) {
                v32 = [(GEOPDDepartureFrequency *)v31 initWithJSON:v30];
              }
              else {
                v32 = [(GEOPDDepartureFrequency *)v31 initWithDictionary:v30];
              }
              v33 = v32;
              -[GEOPDDepartureSequence addDepartureFrequency:](v6, v32);
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v92 objects:v102 count:16];
        }
        while (v27);
      }

      id v5 = v81;
    }

    if (a3) {
      v34 = @"operatingHours";
    }
    else {
      v34 = @"operating_hours";
    }
    v35 = [v5 objectForKeyedSubscript:v34];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      v79 = v35;
      id v36 = v35;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v88 objects:v101 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v89;
        do
        {
          for (uint64_t k = 0; k != v38; ++k)
          {
            if (*(void *)v89 != v39) {
              objc_enumerationMutation(v36);
            }
            v41 = *(void **)(*((void *)&v88 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v87 = 0;
              uint64_t v86 = 0;
              uint64_t v42 = a3;
              _GEOPDTimeRangeFromDictionaryRepresentation(v41, (uint64_t)&v86, a3);
              uint64_t v43 = v86;
              int v44 = v87;
              -[GEOPDDepartureSequence _readOperatingHours](v6);
              if (-[GEOPDDepartureSequence _reserveOperatingHours:](v6, 1uLL))
              {
                uint64_t v45 = *(void *)(v6 + 48) + 12 * *(void *)(v6 + 56);
                *(void *)uint64_t v45 = v43;
                *(_DWORD *)(v45 + 8) = v44;
                ++*(void *)(v6 + 56);
              }
              os_unfair_lock_lock_with_options();
              *(_WORD *)(v6 + 164) |= 0x20u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 160));
              *(_WORD *)(v6 + 164) |= 0x2000u;
              a3 = v42;
            }
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v88 objects:v101 count:16];
        }
        while (v38);
      }

      id v5 = v81;
    }

    if (a3) {
      v46 = @"directionNameString";
    }
    else {
      v46 = @"direction_name_string";
    }
    v47 = objc_msgSend(v5, "objectForKeyedSubscript:", v46, v79);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v48 = (void *)[v47 copy];
      id v49 = v48;
      *(_WORD *)(v6 + 164) |= 0x200u;
      *(_WORD *)(v6 + 164) |= 0x2000u;
      objc_storeStrong((id *)(v6 + 96), v48);
    }
    if (a3) {
      v50 = @"headsignString";
    }
    else {
      v50 = @"headsign_string";
    }
    id v51 = [v5 objectForKeyedSubscript:v50];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v52 = (void *)[v51 copy];
      id v53 = v52;
      *(_WORD *)(v6 + 164) |= 0x800u;
      *(_WORD *)(v6 + 164) |= 0x2000u;
      objc_storeStrong((id *)(v6 + 112), v52);
    }
    if (a3) {
      v54 = @"nextStopId";
    }
    else {
      v54 = @"next_stop_id";
    }
    id v55 = [v5 objectForKeyedSubscript:v54];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      v80 = v55;
      id v56 = v55;
      uint64_t v57 = [v56 countByEnumeratingWithState:&v82 objects:v100 count:16];
      if (v57)
      {
        uint64_t v58 = v57;
        uint64_t v59 = *(void *)v83;
        do
        {
          for (uint64_t m = 0; m != v58; ++m)
          {
            if (*(void *)v83 != v59) {
              objc_enumerationMutation(v56);
            }
            long long v61 = *(void **)(*((void *)&v82 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v61 unsignedLongLongValue];
              -[GEOPDDepartureSequence _readNextStopIds](v6);
              PBRepeatedUInt64Add();
              os_unfair_lock_lock_with_options();
              *(_WORD *)(v6 + 164) |= 0x10u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 160));
              *(_WORD *)(v6 + 164) |= 0x2000u;
            }
          }
          uint64_t v58 = [v56 countByEnumeratingWithState:&v82 objects:v100 count:16];
        }
        while (v58);
      }

      id v5 = v81;
    }

    long long v62 = [v5 objectForKeyedSubscript:@"artwork"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v63 = [GEOPBTransitArtwork alloc];
      if (a3) {
        v64 = [(GEOPBTransitArtwork *)v63 initWithJSON:v62];
      }
      else {
        v64 = [(GEOPBTransitArtwork *)v63 initWithDictionary:v62];
      }
      v65 = v64;
      uint64_t v66 = v64;
      *(_WORD *)(v6 + 164) |= 0x40u;
      *(_WORD *)(v6 + 164) |= 0x2000u;
      objc_storeStrong((id *)(v6 + 72), v65);
    }
    if (a3) {
      v67 = @"transitId";
    }
    else {
      v67 = @"transit_id";
    }
    v68 = objc_msgSend(v5, "objectForKeyedSubscript:", v67, v80);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v69 = [v68 unsignedLongLongValue];
      *(_WORD *)(v6 + 164) |= 0x2000u;
      *(_WORD *)(v6 + 164) |= 4u;
      *(void *)(v6 + 144) = v69;
    }

    if (a3) {
      v70 = @"displayName";
    }
    else {
      v70 = @"display_name";
    }
    v71 = [v5 objectForKeyedSubscript:v70];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v72 = (void *)[v71 copy];
      id v73 = v72;
      *(_WORD *)(v6 + 164) |= 0x400u;
      *(_WORD *)(v6 + 164) |= 0x2000u;
      objc_storeStrong((id *)(v6 + 104), v72);
    }
    if (a3) {
      v74 = @"originName";
    }
    else {
      v74 = @"origin_name";
    }
    v75 = [v5 objectForKeyedSubscript:v74];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v76 = (void *)[v75 copy];
      id v77 = v76;
      *(_WORD *)(v6 + 164) |= 0x1000u;
      *(_WORD *)(v6 + 164) |= 0x2000u;
      objc_storeStrong((id *)(v6 + 128), v76);
    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDDepartureSequenceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  v42[16] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  uint64_t v6 = &OBJC_IVAR___GEOPDAddressComponent__unknownFields;
  if (!self->_reader) {
    goto LABEL_7;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x2BB0) != 0) {
    goto LABEL_7;
  }
  if ((flags & 0x40) != 0)
  {
    if (GEOPBTransitArtworkIsDirty((os_unfair_lock_s *)self->_artwork))
    {
LABEL_7:
      os_unfair_lock_unlock(&self->_readerLock);
      -[GEOPDDepartureSequence readAll:]((uint64_t)self, 0);
      __int16 v8 = (__int16)self->_flags;
      if (v8)
      {
        PBDataWriterWriteUint64Field();
        __int16 v8 = (__int16)self->_flags;
      }
      if ((v8 & 2) != 0) {
        PBDataWriterWriteUint64Field();
      }
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v9 = self->_departures;
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v33 != v11) {
              objc_enumerationMutation(v9);
            }
            PBDataWriterWriteSubmessage();
          }
          uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v32 objects:v41 count:16];
        }
        while (v10);
      }

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v13 = self->_departureFrequencys;
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v29;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v29 != v15) {
              objc_enumerationMutation(v13);
            }
            PBDataWriterWriteSubmessage();
          }
          uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v40 count:16];
        }
        while (v14);
      }

      if (self->_operatingHoursCount)
      {
        uint64_t v17 = 0;
        unint64_t v18 = 0;
        do
        {
          v42[0] = 0;
          PBDataWriterPlaceMark();
          GEOPDTimeRangeWriteTo((uint64_t)&self->_operatingHours[v17]);
          PBDataWriterRecallMark();
          ++v18;
          ++v17;
        }
        while (v18 < self->_operatingHoursCount);
      }
      if (self->_directionNameString) {
        PBDataWriterWriteStringField();
      }
      if (self->_headsignString) {
        PBDataWriterWriteStringField();
      }
      if (self->_nextStopIds.count)
      {
        unint64_t v19 = 0;
        do
        {
          PBDataWriterWriteUint64Field();
          ++v19;
        }
        while (v19 < self->_nextStopIds.count);
      }
      if (*(Class *)((char *)&self->super.super.isa + v6[316])) {
        PBDataWriterWriteSubmessage();
      }
      if ((*(_WORD *)&self->_flags & 4) != 0) {
        PBDataWriterWriteUint64Field();
      }
      if (self->_displayName) {
        PBDataWriterWriteStringField();
      }
      if (self->_originName) {
        PBDataWriterWriteStringField();
      }
      [(PBUnknownFields *)self->_unknownFields writeTo:v4];
      goto LABEL_44;
    }
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 0x1400) != 0) {
    goto LABEL_7;
  }
  if ((flags & 0x100) != 0)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obuint64_t j = self->_departures;
    uint64_t v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v37;
      while (2)
      {
        for (uint64_t k = 0; k != v20; ++k)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(obj);
          }
          v23 = *(os_unfair_lock_s **)(*((void *)&v36 + 1) + 8 * k);
          if (v23)
          {
            os_unfair_lock_lock_with_options();
            char IsDirty = _GEOPDDepartureIsDirty((uint64_t)v23);
            os_unfair_lock_unlock(v23 + 20);
            if (IsDirty)
            {

              uint64_t v6 = &OBJC_IVAR___GEOPDAddressComponent__unknownFields;
              goto LABEL_7;
            }
          }
        }
        uint64_t v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v36 objects:v42 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
  }
  id v25 = self->_reader;
  objc_sync_enter(v25);
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  uint64_t v26 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
  [v4 writeData:v26];
  os_unfair_lock_unlock(p_readerLock);

  objc_sync_exit(v25);
LABEL_44:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x2000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDDepartureSequenceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_28;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDDepartureSequence readAll:]((uint64_t)self, 0);
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 120) = self->_lineId;
    *(_WORD *)(v5 + 164) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(void *)(v5 + 136) = self->_stopId;
    *(_WORD *)(v5 + 164) |= 2u;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v10 = self->_departures;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDDepartureSequence addDeparture:](v5, v14);
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v11);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v15 = self->_departureFrequencys;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v15);
        }
        unint64_t v19 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "copyWithZone:", a3, (void)v33);
        -[GEOPDDepartureSequence addDepartureFrequency:](v5, v19);
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v16);
  }

  unint64_t operatingHoursCount = self->_operatingHoursCount;
  if (operatingHoursCount)
  {
    -[GEOPDDepartureSequence _reserveOperatingHours:](v5, operatingHoursCount);
    memcpy(*(void **)(v5 + 48), self->_operatingHours, 12 * self->_operatingHoursCount);
    *(void *)(v5 + 56) = self->_operatingHoursCount;
  }
  uint64_t v21 = -[NSString copyWithZone:](self->_directionNameString, "copyWithZone:", a3, (void)v33);
  v22 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v21;

  uint64_t v23 = [(NSString *)self->_headsignString copyWithZone:a3];
  v24 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v23;

  PBRepeatedUInt64Copy();
  id v25 = [(GEOPBTransitArtwork *)self->_artwork copyWithZone:a3];
  uint64_t v26 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v25;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(void *)(v5 + 144) = self->_transitId;
    *(_WORD *)(v5 + 164) |= 4u;
  }
  uint64_t v27 = [(NSString *)self->_displayName copyWithZone:a3];
  long long v28 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v27;

  uint64_t v29 = [(NSString *)self->_originName copyWithZone:a3];
  long long v30 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v29;

  long long v31 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v31;
LABEL_28:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  -[GEOPDDepartureSequence readAll:]((uint64_t)self, 1);
  -[GEOPDDepartureSequence readAll:]((uint64_t)v4, 1);
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 82);
  if (flags)
  {
    if ((v6 & 1) == 0 || (const void *)self->_lineId != v4[15]) {
      goto LABEL_18;
    }
  }
  else if (v6)
  {
    goto LABEL_18;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || (const void *)self->_stopId != v4[17]) {
      goto LABEL_18;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_18;
  }
  departures = self->_departures;
  if ((unint64_t)departures | (unint64_t)v4[11]
    && !-[NSMutableArray isEqual:](departures, "isEqual:"))
  {
    goto LABEL_18;
  }
  departureFrequencys = self->_departureFrequencys;
  if ((unint64_t)departureFrequencys | (unint64_t)v4[10])
  {
    if (!-[NSMutableArray isEqual:](departureFrequencys, "isEqual:")) {
      goto LABEL_18;
    }
  }
  unint64_t operatingHoursCount = self->_operatingHoursCount;
  if ((const void *)operatingHoursCount != v4[7]) {
    goto LABEL_18;
  }
  if (memcmp(self->_operatingHours, v4[6], 12 * operatingHoursCount)) {
    goto LABEL_18;
  }
  directionNameString = self->_directionNameString;
  if ((unint64_t)directionNameString | (unint64_t)v4[12])
  {
    if (!-[NSString isEqual:](directionNameString, "isEqual:")) {
      goto LABEL_18;
    }
  }
  headsignString = self->_headsignString;
  if ((unint64_t)headsignString | (unint64_t)v4[14])
  {
    if (!-[NSString isEqual:](headsignString, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_18;
  }
  artworuint64_t k = self->_artwork;
  if ((unint64_t)artwork | (unint64_t)v4[9])
  {
    if (!-[GEOPBTransitArtwork isEqual:](artwork, "isEqual:")) {
      goto LABEL_18;
    }
  }
  __int16 v15 = *((_WORD *)v4 + 82);
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v15 & 4) == 0 || (const void *)self->_transitId != v4[18]) {
      goto LABEL_18;
    }
  }
  else if ((v15 & 4) != 0)
  {
LABEL_18:
    char v10 = 0;
    goto LABEL_19;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | (unint64_t)v4[13]
    && !-[NSString isEqual:](displayName, "isEqual:"))
  {
    goto LABEL_18;
  }
  originName = self->_originName;
  if ((unint64_t)originName | (unint64_t)v4[16]) {
    char v10 = -[NSString isEqual:](originName, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_19:

  return v10;
}

- (unint64_t)hash
{
  -[GEOPDDepartureSequence readAll:]((uint64_t)self, 1);
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    unint64_t v15 = 2654435761u * self->_lineId;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v15 = 0;
    if ((flags & 2) != 0)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_stopId;
      goto LABEL_6;
    }
  }
  unint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSMutableArray *)self->_departures hash];
  uint64_t v6 = [(NSMutableArray *)self->_departureFrequencys hash];
  uint64_t v7 = PBHashBytes();
  NSUInteger v8 = [(NSString *)self->_directionNameString hash];
  NSUInteger v9 = [(NSString *)self->_headsignString hash];
  uint64_t v10 = PBRepeatedUInt64Hash();
  unint64_t v11 = [(GEOPBTransitArtwork *)self->_artwork hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    unint64_t v12 = 2654435761u * self->_transitId;
  }
  else {
    unint64_t v12 = 0;
  }
  NSUInteger v13 = v4 ^ v15 ^ v5 ^ v6 ^ v8 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(NSString *)self->_displayName hash];
  return v13 ^ [(NSString *)self->_originName hash];
}

- (uint64_t)clearUnknownFields:(uint64_t)result
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    *(_WORD *)(v1 + 164) |= 8u;
    *(_WORD *)(v1 + 164) |= 0x2000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 160));
    v2 = *(void **)(v1 + 16);
    *(void *)(v1 + 16) = 0;

    -[GEOPDDepartureSequence readAll:](v1, 0);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v3 = *(id *)(v1 + 88);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v7++) clearUnknownFields:1];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v5);
    }

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = *(id *)(v1 + 80);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "clearUnknownFields:", 1, (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v10);
    }

    return [*(id *)(v1 + 72) clearUnknownFields:1];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originName, 0);
  objc_storeStrong((id *)&self->_headsignString, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_directionNameString, 0);
  objc_storeStrong((id *)&self->_departures, 0);
  objc_storeStrong((id *)&self->_departureFrequencys, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end