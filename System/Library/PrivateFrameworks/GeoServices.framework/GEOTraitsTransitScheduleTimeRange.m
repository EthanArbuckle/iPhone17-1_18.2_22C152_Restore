@interface GEOTraitsTransitScheduleTimeRange
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDuration;
- (BOOL)hasStartTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTraitsTransitScheduleTimeRange)initWithDictionary:(id)a3;
- (GEOTraitsTransitScheduleTimeRange)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (double)duration;
- (double)startTime;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setStartTime:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTraitsTransitScheduleTimeRange

- (void).cxx_destruct
{
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteDoubleField();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(double *)(v4 + 24) = self->_startTime;
    *(unsigned char *)(v4 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(double *)(v4 + 16) = self->_duration;
    *(unsigned char *)(v4 + 32) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)hasStartTime
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)setStartTime:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_startTime = a3;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_duration = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)duration
{
  return self->_duration;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTraitsTransitScheduleTimeRange;
  uint64_t v4 = [(GEOTraitsTransitScheduleTimeRange *)&v8 description];
  id v5 = [(GEOTraitsTransitScheduleTimeRange *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTraitsTransitScheduleTimeRange _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 32);
    if ((v5 & 2) != 0)
    {
      v6 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      if (a2) {
        v7 = @"startTime";
      }
      else {
        v7 = @"start_time";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 32);
    }
    if (v5)
    {
      objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
      [v4 setObject:v8 forKey:@"duration"];
    }
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = [v9 dictionaryRepresentation];
      v11 = v10;
      if (a2)
      {
        v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __63__GEOTraitsTransitScheduleTimeRange__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
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
  return -[GEOTraitsTransitScheduleTimeRange _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __63__GEOTraitsTransitScheduleTimeRange__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTraitsTransitScheduleTimeRange)initWithDictionary:(id)a3
{
  return (GEOTraitsTransitScheduleTimeRange *)-[GEOTraitsTransitScheduleTimeRange _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"startTime";
      }
      else {
        v6 = @"start_time";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 doubleValue];
        objc_msgSend(a1, "setStartTime:");
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"duration"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 doubleValue];
        objc_msgSend(a1, "setDuration:");
      }
    }
  }

  return a1;
}

- (GEOTraitsTransitScheduleTimeRange)initWithJSON:(id)a3
{
  return (GEOTraitsTransitScheduleTimeRange *)-[GEOTraitsTransitScheduleTimeRange _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTraitsTransitScheduleTimeRangeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTraitsTransitScheduleTimeRangeReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOTraitsTransitScheduleTimeRange *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = *(void *)&self->_startTime;
    *((unsigned char *)v5 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[2] = *(void *)&self->_duration;
    *((unsigned char *)v5 + 32) |= 1u;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOTraitsTransitScheduleTimeRange *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_startTime != *((double *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_duration != *((double *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOTraitsTransitScheduleTimeRange *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    double startTime = self->_startTime;
    double v6 = -startTime;
    if (startTime >= 0.0) {
      double v6 = self->_startTime;
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
  if (flags)
  {
    double duration = self->_duration;
    double v11 = -duration;
    if (duration >= 0.0) {
      double v11 = self->_duration;
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
  return v9 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (double *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 2) != 0)
  {
    self->_double startTime = v5[3];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 32);
  }
  if (v4)
  {
    self->_double duration = v5[2];
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
    [(GEOTraitsTransitScheduleTimeRange *)self readAll:0];
  }
}

@end