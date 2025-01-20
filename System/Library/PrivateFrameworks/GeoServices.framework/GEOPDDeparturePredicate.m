@interface GEOPDDeparturePredicate
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDDeparturePredicate)initWithTraitsTransitModeFilter:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDDeparturePredicate

- (unint64_t)hash
{
  char flags = (char)self->_flags;
  if (flags)
  {
    uint64_t v4 = PBHashBytes();
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v5 ^ v4;
  }
  uint64_t v4 = 0;
  if ((flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_numAdditionalDepartures;
  return v5 ^ v4;
}

- (void).cxx_destruct
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterPlaceMark();
    GEOPDTimeRangeWriteTo((uint64_t)&self->_timeRange);
    PBDataWriterRecallMark();
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (GEOPDDeparturePredicate)initWithTraitsTransitModeFilter:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOPDDeparturePredicate;
  uint64_t v5 = [(GEOPDDeparturePredicate *)&v20 init];
  if (v5)
  {
    if ([v4 hasTimeRange])
    {
      v6 = [v4 timeRange];
      int v7 = [v6 hasStartTime];

      if (v7)
      {
        v8 = [v4 timeRange];
        [v8 startTime];
        uint64_t v10 = v9;

        uint64_t v11 = v10 << 32;
        int v12 = 2;
      }
      else
      {
        uint64_t v11 = 0;
        int v12 = 0;
      }
      v13 = [v4 timeRange];
      int v14 = [v13 hasDuration];

      if (v14)
      {
        v15 = [v4 timeRange];
        [v15 duration];
        uint64_t v17 = v16;
        v12 |= 1u;
      }
      else
      {
        uint64_t v17 = 0;
      }
      *(unsigned char *)&v5->_flags |= 1u;
      *(void *)&v5->_timeRange._duration = v17 | v11;
      v5->_timeRange._has = ($B85216D09A238EDB5177F50F3CAD2EB5)v12;
    }
    if ([v4 hasNumAdditionalDepartures])
    {
      unsigned int v18 = [v4 numAdditionalDepartures];
      *(unsigned char *)&v5->_flags |= 2u;
      v5->_numAdditionalDepartures = v18;
    }
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDDeparturePredicate;
  id v4 = [(GEOPDDeparturePredicate *)&v8 description];
  uint64_t v5 = [(GEOPDDeparturePredicate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDeparturePredicate _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 32);
    if (v5)
    {
      if (a2) {
        v6 = @"timeRange";
      }
      else {
        v6 = @"time_range";
      }
      int v7 = _GEOPDTimeRangeDictionaryRepresentation((unsigned int *)(a1 + 16), a2);
      [v4 setObject:v7 forKey:v6];

      char v5 = *(unsigned char *)(a1 + 32);
    }
    if ((v5 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
      if (a2) {
        double v9 = @"numAdditionalDepartures";
      }
      else {
        double v9 = @"num_additional_departures";
      }
      [v4 setObject:v8 forKey:v9];
    }
    uint64_t v10 = *(void **)(a1 + 8);
    if (v10)
    {
      uint64_t v11 = [v10 dictionaryRepresentation];
      int v12 = v11;
      if (a2)
      {
        v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __53__GEOPDDeparturePredicate__dictionaryRepresentation___block_invoke;
        v17[3] = &unk_1E53D8860;
        id v14 = v13;
        id v18 = v14;
        [v12 enumerateKeysAndObjectsUsingBlock:v17];
        id v15 = v14;

        int v12 = v15;
      }
      [v4 setObject:v12 forKey:@"Unknown Fields"];
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
  return -[GEOPDDeparturePredicate _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOPDDeparturePredicate__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    double v9 = [v10 description];
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
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      int v7 = @"timeRange";
    }
    else {
      int v7 = @"time_range";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v16 = 0;
      uint64_t v15 = 0;
      _GEOPDTimeRangeFromDictionaryRepresentation(v8, (uint64_t)&v15, a3);
      uint64_t v9 = v15;
      *(unsigned char *)(v6 + 32) |= 1u;
      int v10 = v16;
      *(void *)(v6 + 16) = v9;
      *(_DWORD *)(v6 + 24) = v10;
    }

    if (a3) {
      uint64_t v11 = @"numAdditionalDepartures";
    }
    else {
      uint64_t v11 = @"num_additional_departures";
    }
    int v12 = [v5 objectForKeyedSubscript:v11];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v13 = [v12 unsignedIntValue];
      *(unsigned char *)(v6 + 32) |= 2u;
      *(_DWORD *)(v6 + 28) = v13;
    }
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDDeparturePredicateReadAllFrom((uint64_t)self, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if (flags)
  {
    $B85216D09A238EDB5177F50F3CAD2EB5 has = self->_timeRange._has;
    *(void *)(v4 + 16) = *(void *)&self->_timeRange._duration;
    *($B85216D09A238EDB5177F50F3CAD2EB5 *)(v4 + 24) = has;
    *(unsigned char *)(v4 + 32) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 28) = self->_numAdditionalDepartures;
    *(unsigned char *)(v4 + 32) |= 2u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[8] & 1) == 0) {
      goto LABEL_15;
    }
    if (*(void *)&self->_timeRange._duration != *((void *)v4 + 2)
      || *(_DWORD *)&self->_timeRange._has != (unint64_t)v4[6])
    {
      goto LABEL_15;
    }
  }
  else if (v4[8])
  {
LABEL_15:
    BOOL v6 = 0;
    goto LABEL_16;
  }
  BOOL v6 = (v4[8] & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[8] & 2) == 0 || self->_numAdditionalDepartures != v4[7]) {
      goto LABEL_15;
    }
    BOOL v6 = 1;
  }
LABEL_16:

  return v6;
}

@end