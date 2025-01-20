@interface GEOTimeToLeaveMapLaunch
+ (BOOL)isValid:(id)a3;
- (BOOL)hasMinutesUntilEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTimeToLeaveMapLaunch)initWithDictionary:(id)a3;
- (GEOTimeToLeaveMapLaunch)initWithJSON:(id)a3;
- (double)minutesUntilEvent;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMinutesUntilEvent:(BOOL)a3;
- (void)setMinutesUntilEvent:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTimeToLeaveMapLaunch

- (double)minutesUntilEvent
{
  return self->_minutesUntilEvent;
}

- (void)setMinutesUntilEvent:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_minutesUntilEvent = a3;
}

- (void)setHasMinutesUntilEvent:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasMinutesUntilEvent
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTimeToLeaveMapLaunch;
  v4 = [(GEOTimeToLeaveMapLaunch *)&v8 description];
  v5 = [(GEOTimeToLeaveMapLaunch *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTimeToLeaveMapLaunch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 16))
    {
      v5 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
      if (a2) {
        v6 = @"minutesUntilEvent";
      }
      else {
        v6 = @"minutes_until_event";
      }
      [v4 setObject:v5 forKey:v6];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTimeToLeaveMapLaunch _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOTimeToLeaveMapLaunch)initWithDictionary:(id)a3
{
  return (GEOTimeToLeaveMapLaunch *)-[GEOTimeToLeaveMapLaunch _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"minutesUntilEvent";
      }
      else {
        v6 = @"minutes_until_event";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 doubleValue];
        objc_msgSend(a1, "setMinutesUntilEvent:");
      }
    }
  }

  return a1;
}

- (GEOTimeToLeaveMapLaunch)initWithJSON:(id)a3
{
  return (GEOTimeToLeaveMapLaunch *)-[GEOTimeToLeaveMapLaunch _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTimeToLeaveMapLaunchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTimeToLeaveMapLaunchReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  [(GEOTimeToLeaveMapLaunch *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[1] = *(void *)&self->_minutesUntilEvent;
    *((unsigned char *)v4 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_flags)
  {
    *((void *)result + 1) = *(void *)&self->_minutesUntilEvent;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEOTimeToLeaveMapLaunch *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) != 0 && self->_minutesUntilEvent == *((double *)v4 + 1))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  [(GEOTimeToLeaveMapLaunch *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return 0;
  }
  double minutesUntilEvent = self->_minutesUntilEvent;
  double v5 = -minutesUntilEvent;
  if (minutesUntilEvent >= 0.0) {
    double v5 = self->_minutesUntilEvent;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t result = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      result += (unint64_t)v7;
    }
  }
  else
  {
    result -= (unint64_t)fabs(v7);
  }
  return result;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  [v4 readAll:0];
  if ((_BYTE)v4[2])
  {
    self->_double minutesUntilEvent = v4[1];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end