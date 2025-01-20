@interface GEOPDHours
+ (BOOL)currentOperatingHoursAvailableForPlaceData:(id)a3 withTimeZone:(id)a4;
+ (BOOL)isValid:(id)a3;
+ (BOOL)operatingHoursAvailableForPlaceData:(id)a3;
+ (id)_allHoursForPlaceData:(id)a3;
+ (id)completeOperatingHoursForPlaceData:(id)a3 date:(id)a4 withTimeZone:(id)a5;
- (BOOL)hasHoursThreshold;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDHours)init;
- (GEOPDHours)initWithData:(id)a3;
- (GEOPDHours)initWithDictionary:(id)a3;
- (GEOPDHours)initWithJSON:(id)a3;
- (GEOPDHoursThreshold)hoursThreshold;
- (GEOPDLocalTimeRange)timeRangeAtIndex:(unint64_t)a3;
- (GEOPDLocalTimeRange)timeRanges;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)daysAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsDays:(id)a3;
- (int)dayAtIndex:(unint64_t)a3;
- (int)days;
- (uint64_t)_reserveTimeRanges:(uint64_t)a1;
- (unint64_t)daysCount;
- (unint64_t)hash;
- (unint64_t)timeRangesCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDays;
- (void)_readHoursThreshold;
- (void)_readTimeRanges;
- (void)addDay:(int)a3;
- (void)addTimeRange:(GEOPDLocalTimeRange)a3;
- (void)clearDays;
- (void)clearTimeRanges;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDays:(int *)a3 count:(unint64_t)a4;
- (void)setHoursThreshold:(id)a3;
- (void)setTimeRanges:(GEOPDLocalTimeRange *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDHours

+ (BOOL)operatingHoursAvailableForPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__GEOPDHours_PlaceDataExtras__operatingHoursAvailableForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:9 usingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __67__GEOPDHours_PlaceDataExtras__operatingHoursAvailableForPlaceData___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  -[GEOPDComponentValue hours](a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if ([v5 daysCount] || objc_msgSend(v5, "timeRangesCount"))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

+ (id)_allHoursForPlaceData:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = [v3 array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__GEOPDHours_PlaceDataExtras___allHoursForPlaceData___block_invoke;
  v8[3] = &unk_1E53E1940;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateValidComponentValuesOfType:9 usingBlock:v8];

  return v6;
}

void __53__GEOPDHours_PlaceDataExtras___allHoursForPlaceData___block_invoke(uint64_t a1, id *a2)
{
  id v3 = -[GEOPDComponentValue hours](a2);
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

+ (BOOL)currentOperatingHoursAvailableForPlaceData:(id)a3 withTimeZone:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a1 _allHoursForPlaceData:a3];
  if ([v7 count])
  {
    v8 = [MEMORY[0x1E4F1C9C8] date];
    char HasOperatingHours = _geoHasOperatingHours(v7, v8, v6);
  }
  else
  {
    char HasOperatingHours = 0;
  }

  return HasOperatingHours;
}

+ (id)completeOperatingHoursForPlaceData:(id)a3 date:(id)a4 withTimeZone:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 _allHoursForPlaceData:v8];
  if ([v11 count])
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__37;
    v20 = __Block_byref_object_dispose__37;
    id v21 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__GEOPDHours_PlaceDataExtras__completeOperatingHoursForPlaceData_date_withTimeZone___block_invoke;
    v15[3] = &unk_1E53E1988;
    v15[4] = &v16;
    v12 = (void *)MEMORY[0x18C120660](v15);
    _geoNormalizedAndViewHourModelsForPDHours(v11, v9, v10, 0, 0, v12);
    id v13 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __84__GEOPDHours_PlaceDataExtras__completeOperatingHoursForPlaceData_date_withTimeZone___block_invoke(uint64_t a1, void *a2)
{
}

- (GEOPDHours)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDHours;
  v2 = [(GEOPDHours *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDHours)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDHours;
  id v3 = [(GEOPDHours *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  [(GEOPDHours *)self clearTimeRanges];
  v3.receiver = self;
  v3.super_class = (Class)GEOPDHours;
  [(GEOPDHours *)&v3 dealloc];
}

- (void)_readDays
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDHoursReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDays_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)daysCount
{
  return self->_days.count;
}

- (int)days
{
  return self->_days.list;
}

- (void)clearDays
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedInt32Clear();
}

- (void)addDay:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (int)dayAtIndex:(unint64_t)a3
{
  -[GEOPDHours _readDays]((uint64_t)self);
  p_days = &self->_days;
  unint64_t count = self->_days.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_days->list[a3];
}

- (void)setDays:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F4147390](&self->_days, a3, a4);
}

- (id)daysAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E3AA0[a3];
  }

  return v3;
}

- (int)StringAsDays:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EVERYDAY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SUNDAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MONDAY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TUESDAY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WEDNESDAY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"THURSDAY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FRIDAY"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SATURDAY"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readTimeRanges
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDHoursReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimeRanges_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)timeRangesCount
{
  return self->_timeRangesCount;
}

- (GEOPDLocalTimeRange)timeRanges
{
  return self->_timeRanges;
}

- (uint64_t)_reserveTimeRanges:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 56);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 64);
    if (v6 >= v5) {
      return 1;
    }
    unint64_t v7 = v6 + a2;
    if (v6 + a2)
    {
      unint64_t v8 = 1;
      while (1)
      {
        unint64_t v9 = v8;
        if (v8 >= v7) {
          break;
        }
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          unint64_t v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (v9 < a2) {
      return 0;
    }
LABEL_12:
    if (12 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 48), 12 * v9, 0x436556D9uLL);
    if (result)
    {
      *(void *)(a1 + 64) = v9;
      *(void *)(a1 + 48) = result;
      bzero((void *)(result + 12 * *(void *)(a1 + 56)), 12 * (v9 - *(void *)(a1 + 56)));
      return 1;
    }
  }
  return result;
}

- (void)clearTimeRanges
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_timeRangesSpace = 0;
  self->_timeRangesCount = 0;
  free(self->_timeRanges);
  self->_timeRanges = 0;
}

- (void)addTimeRange:(GEOPDLocalTimeRange)a3
{
  $7D24B5AD5894795FD85A0EE1D817D743 var2 = a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  -[GEOPDHours _readTimeRanges]((uint64_t)self);
  if (self && -[GEOPDHours _reserveTimeRanges:]((uint64_t)self, 1uLL))
  {
    unint64_t v6 = &self->_timeRanges[self->_timeRangesCount];
    *(void *)&v6->var0 = v4;
    v6->$7D24B5AD5894795FD85A0EE1D817D743 var2 = var2;
    ++self->_timeRangesCount;
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (GEOPDLocalTimeRange)timeRangeAtIndex:(unint64_t)a3
{
  -[GEOPDHours _readTimeRanges]((uint64_t)self);
  unint64_t timeRangesCount = self->_timeRangesCount;
  if (timeRangesCount <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, timeRangesCount);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  id v10 = &self->_timeRanges[a3];
  uint64_t v11 = *(void *)&v10->var0;
  $7D24B5AD5894795FD85A0EE1D817D743 var2 = v10->var2;
  result.var0 = v11;
  result.var1 = HIDWORD(v11);
  result.$7D24B5AD5894795FD85A0EE1D817D743 var2 = var2;
  return result;
}

- (void)setTimeRanges:(GEOPDLocalTimeRange *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  [(GEOPDHours *)self clearTimeRanges];
  if (-[GEOPDHours _reserveTimeRanges:]((uint64_t)self, a4))
  {
    memcpy(self->_timeRanges, a3, 12 * a4);
    self->_unint64_t timeRangesCount = a4;
  }
}

- (void)_readHoursThreshold
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDHoursReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHoursThreshold_tags_5766);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasHoursThreshold
{
  return self->_hoursThreshold != 0;
}

- (GEOPDHoursThreshold)hoursThreshold
{
  -[GEOPDHours _readHoursThreshold]((uint64_t)self);
  hoursThreshold = self->_hoursThreshold;

  return hoursThreshold;
}

- (void)setHoursThreshold:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_hoursThreshold, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDHours;
  uint64_t v4 = [(GEOPDHours *)&v8 description];
  unint64_t v5 = [(GEOPDHours *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDHours _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[4])
    {
      unint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      unint64_t v6 = a1 + 3;
      if (a1[4])
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(int *)(*v6 + 4 * v7);
          if (v8 >= 8)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
            unint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            unint64_t v9 = off_1E53E3AA0[v8];
          }
          [v5 addObject:v9];

          ++v7;
          unint64_t v6 = a1 + 3;
        }
        while (v7 < a1[4]);
      }
      [v4 setObject:v5 forKey:@"day"];
    }
    if (a1[7])
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a1[7]];
      if (a1[7])
      {
        uint64_t v11 = 0;
        unint64_t v12 = 0;
        do
        {
          id v13 = _GEOWiFiQualityTimeRangeDictionaryRepresentation((unsigned int *)(a1[6] + v11));
          [v10 addObject:v13];

          ++v12;
          v11 += 12;
        }
        while (v12 < a1[7]);
      }
      if (a2) {
        v14 = @"timeRange";
      }
      else {
        v14 = @"time_range";
      }
      [v4 setObject:v10 forKey:v14];
    }
    v15 = [a1 hoursThreshold];
    uint64_t v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        uint64_t v18 = @"hoursThreshold";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        uint64_t v18 = @"hours_threshold";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = (void *)a1[2];
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      id v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __40__GEOPDHours__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        id v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDHours _dictionaryRepresentation:](self, 1);
}

void __40__GEOPDHours__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    unint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDHours)initWithDictionary:(id)a3
{
  return (GEOPDHours *)-[GEOPDHours _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (!a1)
  {
    unint64_t v7 = 0;
    goto LABEL_56;
  }
  unint64_t v7 = (void *)[a1 init];
  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"day"];
    objc_opt_class();
    int v31 = a3;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_34;
    }
    v29 = v8;
    id v30 = v6;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    unint64_t v3 = v8;
    uint64_t v9 = [(id)v3 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (!v9) {
      goto LABEL_33;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v39;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation((id)v3);
        }
        id v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          if ([v14 isEqualToString:@"EVERYDAY"])
          {
            uint64_t v15 = 0;
          }
          else if ([v14 isEqualToString:@"SUNDAY"])
          {
            uint64_t v15 = 1;
          }
          else if ([v14 isEqualToString:@"MONDAY"])
          {
            uint64_t v15 = 2;
          }
          else if ([v14 isEqualToString:@"TUESDAY"])
          {
            uint64_t v15 = 3;
          }
          else if ([v14 isEqualToString:@"WEDNESDAY"])
          {
            uint64_t v15 = 4;
          }
          else if ([v14 isEqualToString:@"THURSDAY"])
          {
            uint64_t v15 = 5;
          }
          else if ([v14 isEqualToString:@"FRIDAY"])
          {
            uint64_t v15 = 6;
          }
          else if ([v14 isEqualToString:@"SATURDAY"])
          {
            uint64_t v15 = 7;
          }
          else
          {
            uint64_t v15 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v15 = [v13 intValue];
        }
        [v7 addDay:v15];
      }
      uint64_t v10 = [(id)v3 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (!v10)
      {
LABEL_33:

        uint64_t v8 = v29;
        id v6 = v30;
LABEL_34:

        if (a3) {
          uint64_t v16 = @"timeRange";
        }
        else {
          uint64_t v16 = @"time_range";
        }
        v17 = [v6 objectForKeyedSubscript:v16];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v18 = v17;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v35;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v35 != v21) {
                  objc_enumerationMutation(v18);
                }
                id v23 = *(void **)(*((void *)&v34 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  unsigned int v33 = 0;
                  uint64_t v32 = 0;
                  _GEOWiFiQualityTimeRangeFromDictionaryRepresentation(v23, (uint64_t)&v32);
                  unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v33;
                  objc_msgSend(v7, "addTimeRange:", v32, v3);
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }
            while (v20);
          }

          a3 = v31;
        }

        if (a3) {
          id v24 = @"hoursThreshold";
        }
        else {
          id v24 = @"hours_threshold";
        }
        v25 = [v6 objectForKeyedSubscript:v24];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v26 = [GEOPDHoursThreshold alloc];
          if (v26) {
            id v27 = (void *)-[GEOPDHoursThreshold _initWithDictionary:isJSON:](v26, v25, a3);
          }
          else {
            id v27 = 0;
          }
          [v7 setHoursThreshold:v27];
        }
        break;
      }
    }
  }
LABEL_56:

  return v7;
}

- (GEOPDHours)initWithJSON:(id)a3
{
  return (GEOPDHours *)-[GEOPDHours _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_5770;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_5771;
    }
    GEOPDHoursReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDHoursIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDHoursReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
  {
    uint64_t v9 = self->_reader;
    objc_sync_enter(v9);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v10];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDHours *)self readAll:0];
    if (self->_days.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_days.count);
    }
    if (self->_timeRangesCount)
    {
      uint64_t v7 = 0;
      unint64_t v8 = 0;
      do
      {
        PBDataWriterPlaceMark();
        GEOPDLocalTimeRangeWriteTo((uint64_t)&self->_timeRanges[v7]);
        PBDataWriterRecallMark();
        ++v8;
        ++v7;
      }
      while (v8 < self->_timeRangesCount);
    }
    if (self->_hoursThreshold) {
      PBDataWriterWriteSubmessage();
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v12 = (id *)a3;
  [(GEOPDHours *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 20) = self->_readerMarkPos;
  *((_DWORD *)v12 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOPDHours *)self daysCount])
  {
    [v12 clearDays];
    unint64_t v4 = [(GEOPDHours *)self daysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v12, "addDay:", -[GEOPDHours dayAtIndex:](self, "dayAtIndex:", i));
    }
  }
  if ([(GEOPDHours *)self timeRangesCount])
  {
    [v12 clearTimeRanges];
    unint64_t v7 = [(GEOPDHours *)self timeRangesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        uint64_t v10 = [(GEOPDHours *)self timeRangeAtIndex:j];
        objc_msgSend(v12, "addTimeRange:", v10, v11);
      }
    }
  }
  if (self->_hoursThreshold) {
    objc_msgSend(v12, "setHoursThreshold:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDHoursReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDHours *)self readAll:0];
  PBRepeatedInt32Copy();
  unint64_t timeRangesCount = self->_timeRangesCount;
  if (timeRangesCount)
  {
    -[GEOPDHours _reserveTimeRanges:](v5, timeRangesCount);
    memcpy(*(void **)(v5 + 48), self->_timeRanges, 12 * self->_timeRangesCount);
    *(void *)(v5 + 56) = self->_timeRangesCount;
  }
  id v9 = [(GEOPDHoursThreshold *)self->_hoursThreshold copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v9;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEOPDHours *)self readAll:1],
        [v4 readAll:1],
        PBRepeatedInt32IsEqual())
    && (unint64_t timeRangesCount = self->_timeRangesCount, timeRangesCount == *((void *)v4 + 7))
    && !memcmp(self->_timeRanges, *((const void **)v4 + 6), 12 * timeRangesCount))
  {
    hoursThreshold = self->_hoursThreshold;
    if ((unint64_t)hoursThreshold | *((void *)v4 + 9)) {
      char v6 = -[GEOPDHoursThreshold isEqual:](hoursThreshold, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  [(GEOPDHours *)self readAll:1];
  uint64_t v3 = PBRepeatedInt32Hash();
  uint64_t v4 = PBHashBytes();
  return v4 ^ v3 ^ [(GEOPDHoursThreshold *)self->_hoursThreshold hash];
}

- (void)mergeFrom:(id)a3
{
  v17 = a3;
  [v17 readAll:0];
  uint64_t v4 = [v17 daysCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOPDHours addDay:](self, "addDay:", [v17 dayAtIndex:i]);
  }
  uint64_t v7 = [v17 timeRangesCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
    {
      uint64_t v10 = [v17 timeRangeAtIndex:j];
      -[GEOPDHours addTimeRange:](self, "addTimeRange:", v10, v11);
    }
  }
  hoursThreshold = self->_hoursThreshold;
  id v13 = v17;
  id v14 = (void *)v17[9];
  if (hoursThreshold)
  {
    if (!v14) {
      goto LABEL_17;
    }
    id v15 = v14;
    char v16 = *((unsigned char *)v15 + 24);
    if ((v16 & 2) != 0)
    {
      hoursThreshold->_openingSoonMessageThresholdSecond = *((_DWORD *)v15 + 5);
      *(unsigned char *)&hoursThreshold->_flags |= 2u;
      char v16 = *((unsigned char *)v15 + 24);
    }
    if (v16)
    {
      hoursThreshold->_closingSoonMessageThresholdSecond = *((_DWORD *)v15 + 4);
      *(unsigned char *)&hoursThreshold->_flags |= 1u;
    }
  }
  else
  {
    if (!v14) {
      goto LABEL_17;
    }
    -[GEOPDHours setHoursThreshold:](self, "setHoursThreshold:");
  }
  id v13 = v17;
LABEL_17:
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPDHoursReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_5775);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDHours *)self readAll:0];
    hoursThreshold = self->_hoursThreshold;
    if (hoursThreshold)
    {
      uint64_t v8 = hoursThreshold->_unknownFields;
      hoursThreshold->_unknownFields = 0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoursThreshold, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end