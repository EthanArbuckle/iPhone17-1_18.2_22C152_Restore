@interface GEOWiFiQualityHours
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOWiFiQualityHours)init;
- (GEOWiFiQualityHours)initWithData:(id)a3;
- (GEOWiFiQualityHours)initWithDictionary:(id)a3;
- (GEOWiFiQualityHours)initWithJSON:(id)a3;
- (GEOWiFiQualityTimeRange)timeRanges;
- (GEOWiFiQualityTimeRange)timeRangesAtIndex:(unint64_t)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)daysAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsDays:(id)a3;
- (int)days;
- (int)daysAtIndex:(unint64_t)a3;
- (uint64_t)_reserveTimeRanges:(uint64_t)a1;
- (unint64_t)daysCount;
- (unint64_t)hash;
- (unint64_t)timeRangesCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDays;
- (void)_readTimeRanges;
- (void)addDays:(int)a3;
- (void)addTimeRanges:(GEOWiFiQualityTimeRange)a3;
- (void)clearDays;
- (void)clearTimeRanges;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDays:(int *)a3 count:(unint64_t)a4;
- (void)setTimeRanges:(GEOWiFiQualityTimeRange *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiQualityHours

- (GEOWiFiQualityHours)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiQualityHours;
  v2 = [(GEOWiFiQualityHours *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiQualityHours)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiQualityHours;
  v3 = [(GEOWiFiQualityHours *)&v7 initWithData:a3];
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
  PBRepeatedInt32Clear();
  [(GEOWiFiQualityHours *)self clearTimeRanges];
  v3.receiver = self;
  v3.super_class = (Class)GEOWiFiQualityHours;
  [(GEOWiFiQualityHours *)&v3 dealloc];
}

- (void)_readDays
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiQualityHoursReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDays_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
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
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;

  PBRepeatedInt32Clear();
}

- (void)addDays:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (int)daysAtIndex:(unint64_t)a3
{
  -[GEOWiFiQualityHours _readDays]((uint64_t)self);
  p_days = &self->_days;
  unint64_t count = self->_days.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_days->list[a3];
}

- (void)setDays:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;

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
    id v3 = off_1E53E1F68[a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiQualityHoursReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimeRanges_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)timeRangesCount
{
  return self->_timeRangesCount;
}

- (GEOWiFiQualityTimeRange)timeRanges
{
  return self->_timeRanges;
}

- (uint64_t)_reserveTimeRanges:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 48);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 56);
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
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 40), 12 * v9, 0xE2BA7521uLL);
    if (result)
    {
      *(void *)(a1 + 56) = v9;
      *(void *)(a1 + 40) = result;
      bzero((void *)(result + 12 * *(void *)(a1 + 48)), 12 * (v9 - *(void *)(a1 + 48)));
      return 1;
    }
  }
  return result;
}

- (void)clearTimeRanges
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  self->_timeRangesSpace = 0;
  self->_timeRangesCount = 0;
  free(self->_timeRanges);
  self->_timeRanges = 0;
}

- (void)addTimeRanges:(GEOWiFiQualityTimeRange)a3
{
  $7D24B5AD5894795FD85A0EE1D817D743 var2 = a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  -[GEOWiFiQualityHours _readTimeRanges]((uint64_t)self);
  if (self && -[GEOWiFiQualityHours _reserveTimeRanges:]((uint64_t)self, 1uLL))
  {
    unint64_t v6 = &self->_timeRanges[self->_timeRangesCount];
    *(void *)&v6->var0 = v4;
    v6->$7D24B5AD5894795FD85A0EE1D817D743 var2 = var2;
    ++self->_timeRangesCount;
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (GEOWiFiQualityTimeRange)timeRangesAtIndex:(unint64_t)a3
{
  -[GEOWiFiQualityHours _readTimeRanges]((uint64_t)self);
  unint64_t timeRangesCount = self->_timeRangesCount;
  if (timeRangesCount <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, timeRangesCount);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  v10 = &self->_timeRanges[a3];
  uint64_t v11 = *(void *)&v10->var0;
  $7D24B5AD5894795FD85A0EE1D817D743 var2 = v10->var2;
  result.var0 = v11;
  result.var1 = HIDWORD(v11);
  result.$7D24B5AD5894795FD85A0EE1D817D743 var2 = var2;
  return result;
}

- (void)setTimeRanges:(GEOWiFiQualityTimeRange *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  [(GEOWiFiQualityHours *)self clearTimeRanges];
  if (-[GEOWiFiQualityHours _reserveTimeRanges:]((uint64_t)self, a4))
  {
    memcpy(self->_timeRanges, a3, 12 * a4);
    self->_unint64_t timeRangesCount = a4;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiQualityHours;
  uint64_t v4 = [(GEOWiFiQualityHours *)&v8 description];
  unint64_t v5 = [(GEOWiFiQualityHours *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiQualityHours _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[3])
    {
      int v5 = a2;
      unint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      uint64_t v7 = a1 + 2;
      if (a1[3])
      {
        unint64_t v8 = 0;
        do
        {
          uint64_t v9 = *(int *)(*v7 + 4 * v8);
          if (v9 >= 8)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v10 = off_1E53E1F68[v9];
          }
          [v6 addObject:v10];

          ++v8;
          uint64_t v7 = a1 + 2;
        }
        while (v8 < a1[3]);
      }
      [v4 setObject:v6 forKey:@"days"];

      a2 = v5;
    }
    if (a1[6])
    {
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a1[6]];
      if (a1[6])
      {
        uint64_t v12 = 0;
        unint64_t v13 = 0;
        do
        {
          v14 = _GEOWiFiQualityTimeRangeDictionaryRepresentation((unsigned int *)(a1[5] + v12));
          [v11 addObject:v14];

          ++v13;
          v12 += 12;
        }
        while (v13 < a1[6]);
      }
      if (a2) {
        v15 = @"timeRanges";
      }
      else {
        v15 = @"time_ranges";
      }
      [v4 setObject:v11 forKey:v15];
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
  return -[GEOWiFiQualityHours _dictionaryRepresentation:](self, 1);
}

- (GEOWiFiQualityHours)initWithDictionary:(id)a3
{
  return (GEOWiFiQualityHours *)-[GEOWiFiQualityHours _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (!a1)
  {
    uint64_t v7 = 0;
    goto LABEL_49;
  }
  uint64_t v7 = (void *)[a1 init];
  if (v7)
  {
    unint64_t v8 = [v6 objectForKeyedSubscript:@"days"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_34;
    }
    id v26 = v6;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v25 = v8;
    unint64_t v3 = v8;
    uint64_t v9 = [(id)v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (!v9) {
      goto LABEL_33;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation((id)v3);
        }
        unint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
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
        [v7 addDays:v15];
      }
      uint64_t v10 = [(id)v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (!v10)
      {
LABEL_33:

        id v6 = v26;
        unint64_t v8 = v25;
LABEL_34:

        if (a3) {
          v16 = @"timeRanges";
        }
        else {
          v16 = @"time_ranges";
        }
        v17 = [v6 objectForKeyedSubscript:v16];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v18 = v17;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v30;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v30 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = *(void **)(*((void *)&v29 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  unsigned int v28 = 0;
                  uint64_t v27 = 0;
                  _GEOWiFiQualityTimeRangeFromDictionaryRepresentation(v23, (uint64_t)&v27);
                  unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v28;
                  objc_msgSend(v7, "addTimeRanges:", v27, v3);
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
            }
            while (v20);
          }
        }
        break;
      }
    }
  }
LABEL_49:

  return v7;
}

- (GEOWiFiQualityHours)initWithJSON:(id)a3
{
  return (GEOWiFiQualityHours *)-[GEOWiFiQualityHours _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      unint64_t v8 = (int *)&readAll__recursiveTag_288_0;
    }
    else {
      unint64_t v8 = (int *)&readAll__nonRecursiveTag_289_0;
    }
    GEOWiFiQualityHoursReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiQualityHoursIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiQualityHoursReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
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
    [(GEOWiFiQualityHours *)self readAll:0];
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
        GEOWiFiQualityTimeRangeWriteTo((uint64_t)&self->_timeRanges[v7]);
        PBDataWriterRecallMark();
        ++v8;
        ++v7;
      }
      while (v8 < self->_timeRangesCount);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOWiFiQualityHours *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 16) = self->_readerMarkPos;
  *((_DWORD *)v12 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOWiFiQualityHours *)self daysCount])
  {
    [v12 clearDays];
    unint64_t v4 = [(GEOWiFiQualityHours *)self daysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v12, "addDays:", -[GEOWiFiQualityHours daysAtIndex:](self, "daysAtIndex:", i));
    }
  }
  if ([(GEOWiFiQualityHours *)self timeRangesCount])
  {
    [v12 clearTimeRanges];
    unint64_t v7 = [(GEOWiFiQualityHours *)self timeRangesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        uint64_t v10 = [(GEOWiFiQualityHours *)self timeRangesAtIndex:j];
        objc_msgSend(v12, "addTimeRanges:", v10, v11);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v6 = reader;
    objc_sync_enter(v6);
    if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOWiFiQualityHoursReadAllFrom(v4, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v6);

      return (id)v4;
    }
    objc_sync_exit(v6);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWiFiQualityHours *)self readAll:0];
  PBRepeatedInt32Copy();
  unint64_t timeRangesCount = self->_timeRangesCount;
  if (timeRangesCount)
  {
    -[GEOWiFiQualityHours _reserveTimeRanges:](v4, timeRangesCount);
    memcpy(*(void **)(v4 + 40), self->_timeRanges, 12 * self->_timeRangesCount);
    *(void *)(v4 + 48) = self->_timeRangesCount;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (const void **)a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ([(GEOWiFiQualityHours *)self readAll:1],
        [v4 readAll:1],
        PBRepeatedInt32IsEqual())
    && (unint64_t timeRangesCount = self->_timeRangesCount, (const void *)timeRangesCount == v4[6])
    && memcmp(self->_timeRanges, v4[5], 12 * timeRangesCount) == 0;

  return v6;
}

- (unint64_t)hash
{
  [(GEOWiFiQualityHours *)self readAll:1];
  uint64_t v2 = PBRepeatedInt32Hash();
  return PBHashBytes() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v12 = a3;
  [v12 readAll:0];
  uint64_t v4 = [v12 daysCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOWiFiQualityHours addDays:](self, "addDays:", [v12 daysAtIndex:i]);
  }
  uint64_t v7 = [v12 timeRangesCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
    {
      uint64_t v10 = [v12 timeRangesAtIndex:j];
      -[GEOWiFiQualityHours addTimeRanges:](self, "addTimeRanges:", v10, v11);
    }
  }
}

- (void).cxx_destruct
{
}

@end