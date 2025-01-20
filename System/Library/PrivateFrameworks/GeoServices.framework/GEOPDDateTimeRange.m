@interface GEOPDDateTimeRange
- (BOOL)hasValidStartAndEndDates;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)_reserveTimeRanges:(uint64_t)result;
- (uint64_t)timeRangeAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDDateTimeRange

- (void)dealloc
{
  if (self)
  {
    self->_timeRangesSpace = 0;
    self->_timeRangesCount = 0;
    free(self->_timeRanges);
    self->_timeRanges = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOPDDateTimeRange;
  [(GEOPDDateTimeRange *)&v3 dealloc];
}

- (uint64_t)_reserveTimeRanges:(uint64_t)result
{
  if (result)
  {
    v2 = (void *)result;
    unint64_t v3 = *(void *)(result + 24);
    unint64_t v4 = v3 + a2;
    if (v3 + a2 <= v3) {
      return 0;
    }
    unint64_t v5 = *(void *)(result + 32);
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
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 16), 12 * v8, 0x33AC38B2uLL);
    if (result)
    {
      v2[4] = v8;
      v2[2] = result;
      bzero((void *)(result + 12 * v2[3]), 12 * (v8 - v2[3]));
      return 1;
    }
  }
  return result;
}

- (uint64_t)timeRangeAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    unint64_t v4 = *(void *)(result + 24);
    if (v4 <= a2)
    {
      unint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      unint64_t v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(void *)(*(void *)(v3 + 16) + 12 * a2);
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDDateTimeRange;
  unint64_t v4 = [(GEOPDDateTimeRange *)&v8 description];
  unint64_t v5 = [(GEOPDDateTimeRange *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDateTimeRange _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 56);
    if ((v5 & 2) != 0)
    {
      uint64_t v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
      if (a2) {
        unint64_t v7 = @"startDate";
      }
      else {
        unint64_t v7 = @"start_date";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 56);
    }
    if (v5)
    {
      objc_super v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
      if (a2) {
        v9 = @"endDate";
      }
      else {
        v9 = @"end_date";
      }
      [v4 setObject:v8 forKey:v9];
    }
    if (*(void *)(a1 + 24))
    {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 24)];
      if (*(void *)(a1 + 24))
      {
        uint64_t v11 = 0;
        unint64_t v12 = 0;
        do
        {
          v13 = _GEOWiFiQualityTimeRangeDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 16) + v11));
          [v10 addObject:v13];

          ++v12;
          v11 += 12;
        }
        while (v12 < *(void *)(a1 + 24));
      }
      if (a2) {
        v14 = @"timeRange";
      }
      else {
        v14 = @"time_range";
      }
      [v4 setObject:v10 forKey:v14];
    }
    v15 = *(void **)(a1 + 8);
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __48__GEOPDDateTimeRange__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
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
  return -[GEOPDDateTimeRange _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOPDDateTimeRange__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      unint64_t v7 = @"startDate";
    }
    else {
      unint64_t v7 = @"start_date";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v8 unsignedLongLongValue];
      *(unsigned char *)(v6 + 56) |= 2u;
      *(void *)(v6 + 48) = v9;
    }

    if (a3) {
      id v10 = @"endDate";
    }
    else {
      id v10 = @"end_date";
    }
    uint64_t v11 = [v5 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [v11 unsignedLongLongValue];
      *(unsigned char *)(v6 + 56) |= 1u;
      *(void *)(v6 + 40) = v12;
    }

    if (a3) {
      v13 = @"timeRange";
    }
    else {
      v13 = @"time_range";
    }
    v14 = [v5 objectForKeyedSubscript:v13];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = v14;
      id v26 = v5;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v30 != v18) {
              objc_enumerationMutation(v15);
            }
            id v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v28 = 0;
              uint64_t v27 = 0;
              _GEOWiFiQualityTimeRangeFromDictionaryRepresentation(v20, (uint64_t)&v27);
              uint64_t v21 = v27;
              int v22 = v28;
              if (-[GEOPDDateTimeRange _reserveTimeRanges:](v6, 1uLL))
              {
                uint64_t v23 = *(void *)(v6 + 16) + 12 * *(void *)(v6 + 24);
                *(void *)uint64_t v23 = v21;
                *(_DWORD *)(v23 + 8) = v22;
                ++*(void *)(v6 + 24);
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v17);
      }

      v14 = v25;
      id v5 = v26;
    }
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDDateTimeRangeReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_timeRangesCount)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      PBDataWriterPlaceMark();
      GEOPDLocalTimeRangeWriteTo((uint64_t)&self->_timeRanges[v6]);
      PBDataWriterRecallMark();
      ++v7;
      ++v6;
    }
    while (v7 < self->_timeRangesCount);
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(void *)(v4 + 48) = self->_startDate;
    *(unsigned char *)(v4 + 56) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(void *)(v4 + 40) = self->_endDate;
    *(unsigned char *)(v4 + 56) |= 1u;
  }
  unint64_t timeRangesCount = self->_timeRangesCount;
  if (timeRangesCount)
  {
    -[GEOPDDateTimeRange _reserveTimeRanges:](v4, timeRangesCount);
    memcpy(*(void **)(v5 + 16), self->_timeRanges, 12 * self->_timeRangesCount);
    *(void *)(v5 + 24) = self->_timeRangesCount;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if (((_BYTE)v4[7] & 2) == 0 || (const void *)self->_startDate != v4[6]) {
      goto LABEL_14;
    }
  }
  else if (((_BYTE)v4[7] & 2) != 0)
  {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if (((_BYTE)v4[7] & 1) == 0 || (const void *)self->_endDate != v4[5]) {
      goto LABEL_14;
    }
  }
  else if ((_BYTE)v4[7])
  {
    goto LABEL_14;
  }
  unint64_t timeRangesCount = self->_timeRangesCount;
  if ((const void *)timeRangesCount != v4[3])
  {
LABEL_14:
    BOOL v6 = 0;
    goto LABEL_15;
  }
  BOOL v6 = memcmp(self->_timeRanges, v4[2], 12 * timeRangesCount) == 0;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    unint64_t v2 = 2654435761u * self->_startDate;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2 ^ PBHashBytes();
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_endDate;
  return v3 ^ v2 ^ PBHashBytes();
}

- (void).cxx_destruct
{
}

- (BOOL)hasValidStartAndEndDates
{
  if (self) {
    LOBYTE(self) = (~*(unsigned char *)&self->_flags & 3) == 0 && self->_startDate <= self->_endDate;
  }
  return (char)self;
}

@end