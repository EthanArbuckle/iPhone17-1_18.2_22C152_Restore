@interface GEOTraitsTransitScheduleModeFilter
+ (BOOL)isValid:(id)a3;
- (BOOL)hasNumAdditionalDepartures;
- (BOOL)hasTimeRange;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTraitsTransitScheduleModeFilter)initWithDictionary:(id)a3;
- (GEOTraitsTransitScheduleModeFilter)initWithJSON:(id)a3;
- (GEOTraitsTransitScheduleTimeRange)timeRange;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)numAdditionalDepartures;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)configureWithDefaultStartTime:(double)a3 duration:(double)a4 numAdditionalDepartures:(unsigned int)a5;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNumAdditionalDepartures:(BOOL)a3;
- (void)setNumAdditionalDepartures:(unsigned int)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTraitsTransitScheduleModeFilter

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOTraitsTransitScheduleTimeRange *)self->_timeRange copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_numAdditionalDepartures;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_timeRange)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)setNumAdditionalDepartures:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_numAdditionalDepartures = a3;
}

- (void)configureWithDefaultStartTime:(double)a3 duration:(double)a4 numAdditionalDepartures:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (![(GEOTraitsTransitScheduleModeFilter *)self hasTimeRange])
  {
    v9 = objc_alloc_init(GEOTraitsTransitScheduleTimeRange);
    [(GEOTraitsTransitScheduleModeFilter *)self setTimeRange:v9];
  }
  v10 = [(GEOTraitsTransitScheduleModeFilter *)self timeRange];
  char v11 = [v10 hasStartTime];

  if ((v11 & 1) == 0)
  {
    v12 = [(GEOTraitsTransitScheduleModeFilter *)self timeRange];
    [v12 setStartTime:a3];
  }
  v13 = [(GEOTraitsTransitScheduleModeFilter *)self timeRange];
  char v14 = [v13 hasDuration];

  if ((v14 & 1) == 0)
  {
    v15 = [(GEOTraitsTransitScheduleModeFilter *)self timeRange];
    [v15 setDuration:a4];
  }
  if (![(GEOTraitsTransitScheduleModeFilter *)self hasNumAdditionalDepartures])
  {
    [(GEOTraitsTransitScheduleModeFilter *)self setNumAdditionalDepartures:v5];
  }
}

- (GEOTraitsTransitScheduleTimeRange)timeRange
{
  return self->_timeRange;
}

- (BOOL)hasTimeRange
{
  return self->_timeRange != 0;
}

- (BOOL)hasNumAdditionalDepartures
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)setTimeRange:(id)a3
{
}

- (unsigned)numAdditionalDepartures
{
  return self->_numAdditionalDepartures;
}

- (void)setHasNumAdditionalDepartures:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTraitsTransitScheduleModeFilter;
  id v4 = [(GEOTraitsTransitScheduleModeFilter *)&v8 description];
  uint64_t v5 = [(GEOTraitsTransitScheduleModeFilter *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTraitsTransitScheduleModeFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = [(id)a1 timeRange];
    id v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"timeRange";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"time_range";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(unsigned char *)(a1 + 28))
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      if (a2) {
        v10 = @"numAdditionalDepartures";
      }
      else {
        v10 = @"num_additional_departures";
      }
      [v4 setObject:v9 forKey:v10];
    }
    char v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        char v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __64__GEOTraitsTransitScheduleModeFilter__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOTraitsTransitScheduleModeFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __64__GEOTraitsTransitScheduleModeFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (GEOTraitsTransitScheduleModeFilter)initWithDictionary:(id)a3
{
  return (GEOTraitsTransitScheduleModeFilter *)-[GEOTraitsTransitScheduleModeFilter _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"timeRange";
      }
      else {
        id v6 = @"time_range";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOTraitsTransitScheduleTimeRange alloc];
        if (a3) {
          uint64_t v9 = [(GEOTraitsTransitScheduleTimeRange *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOTraitsTransitScheduleTimeRange *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setTimeRange:v9];
      }
      if (a3) {
        char v11 = @"numAdditionalDepartures";
      }
      else {
        char v11 = @"num_additional_departures";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNumAdditionalDepartures:", objc_msgSend(v12, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOTraitsTransitScheduleModeFilter)initWithJSON:(id)a3
{
  return (GEOTraitsTransitScheduleModeFilter *)-[GEOTraitsTransitScheduleModeFilter _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTraitsTransitScheduleModeFilterIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTraitsTransitScheduleModeFilterReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOTraitsTransitScheduleModeFilter *)self readAll:0];
  if (self->_timeRange) {
    objc_msgSend(v4, "setTimeRange:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 6) = self->_numAdditionalDepartures;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEOTraitsTransitScheduleModeFilter *)self readAll:1];
  [v4 readAll:1];
  timeRange = self->_timeRange;
  if ((unint64_t)timeRange | *((void *)v4 + 2))
  {
    if (!-[GEOTraitsTransitScheduleTimeRange isEqual:](timeRange, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_numAdditionalDepartures == *((_DWORD *)v4 + 6))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  [(GEOTraitsTransitScheduleModeFilter *)self readAll:1];
  unint64_t v3 = [(GEOTraitsTransitScheduleTimeRange *)self->_timeRange hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_numAdditionalDepartures;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v6 = (unsigned int *)a3;
  [v6 readAll:0];
  timeRange = self->_timeRange;
  uint64_t v5 = *((void *)v6 + 2);
  if (timeRange)
  {
    if (v5) {
      -[GEOTraitsTransitScheduleTimeRange mergeFrom:](timeRange, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOTraitsTransitScheduleModeFilter setTimeRange:](self, "setTimeRange:");
  }
  if (v6[7])
  {
    self->_numAdditionalDepartures = v6[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTraitsTransitScheduleModeFilter *)self readAll:0];
    timeRange = self->_timeRange;
    [(GEOTraitsTransitScheduleTimeRange *)timeRange clearUnknownFields:1];
  }
}

@end