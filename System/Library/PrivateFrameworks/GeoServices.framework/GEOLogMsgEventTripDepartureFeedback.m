@interface GEOLogMsgEventTripDepartureFeedback
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDistanceFromOrigin;
- (BOOL)hasTimeFromOrigin;
- (BOOL)hasTransportMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventTripDepartureFeedback)initWithDictionary:(id)a3;
- (GEOLogMsgEventTripDepartureFeedback)initWithJSON:(id)a3;
- (double)distanceFromOrigin;
- (double)timeFromOrigin;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)transportModeAsString:(int)a3;
- (int)StringAsTransportMode:(id)a3;
- (int)transportMode;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDistanceFromOrigin:(double)a3;
- (void)setHasDistanceFromOrigin:(BOOL)a3;
- (void)setHasTimeFromOrigin:(BOOL)a3;
- (void)setHasTransportMode:(BOOL)a3;
- (void)setTimeFromOrigin:(double)a3;
- (void)setTransportMode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventTripDepartureFeedback

- (int)transportMode
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_transportMode;
  }
  else {
    return 0;
  }
}

- (void)setTransportMode:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_transportMode = a3;
}

- (void)setHasTransportMode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTransportMode
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)transportModeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F85F8[a3];
  }

  return v3;
}

- (int)StringAsTransportMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_MODE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DRIVING_MODE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING_MODE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRANSIT_MODE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RIDESHARE_MODE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CYCLING_MODE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (double)distanceFromOrigin
{
  return self->_distanceFromOrigin;
}

- (void)setDistanceFromOrigin:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_distanceFromOrigin = a3;
}

- (void)setHasDistanceFromOrigin:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDistanceFromOrigin
{
  return *(unsigned char *)&self->_flags & 1;
}

- (double)timeFromOrigin
{
  return self->_timeFromOrigin;
}

- (void)setTimeFromOrigin:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_timeFromOrigin = a3;
}

- (void)setHasTimeFromOrigin:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTimeFromOrigin
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventTripDepartureFeedback;
  int v4 = [(GEOLogMsgEventTripDepartureFeedback *)&v8 description];
  v5 = [(GEOLogMsgEventTripDepartureFeedback *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventTripDepartureFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 28);
    if ((v5 & 4) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 24);
      if (v6 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53F85F8[v6];
      }
      if (a2) {
        objc_super v8 = @"transportMode";
      }
      else {
        objc_super v8 = @"transport_mode";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 28);
    }
    if (v5)
    {
      v9 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
      if (a2) {
        v10 = @"distanceFromOrigin";
      }
      else {
        v10 = @"distance_from_origin";
      }
      [v4 setObject:v9 forKey:v10];

      char v5 = *(unsigned char *)(a1 + 28);
    }
    if ((v5 & 2) != 0)
    {
      v11 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
      if (a2) {
        v12 = @"timeFromOrigin";
      }
      else {
        v12 = @"time_from_origin";
      }
      [v4 setObject:v11 forKey:v12];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventTripDepartureFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventTripDepartureFeedback)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventTripDepartureFeedback *)-[GEOLogMsgEventTripDepartureFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_35;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_35;
  }
  if (a3) {
    uint64_t v6 = @"transportMode";
  }
  else {
    uint64_t v6 = @"transport_mode";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"UNKNOWN_TRANSPORT_MODE"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"DRIVING_MODE"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"WALKING_MODE"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"TRANSIT_MODE"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"RIDESHARE_MODE"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"CYCLING_MODE"])
    {
      uint64_t v9 = 5;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_23:
    [a1 setTransportMode:v9];
  }

  if (a3) {
    v10 = @"distanceFromOrigin";
  }
  else {
    v10 = @"distance_from_origin";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 doubleValue];
    objc_msgSend(a1, "setDistanceFromOrigin:");
  }

  if (a3) {
    v12 = @"timeFromOrigin";
  }
  else {
    v12 = @"time_from_origin";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v13 doubleValue];
    objc_msgSend(a1, "setTimeFromOrigin:");
  }

LABEL_35:
  return a1;
}

- (GEOLogMsgEventTripDepartureFeedback)initWithJSON:(id)a3
{
  return (GEOLogMsgEventTripDepartureFeedback *)-[GEOLogMsgEventTripDepartureFeedback _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventTripDepartureFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventTripDepartureFeedbackReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgEventTripDepartureFeedback *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[6] = self->_transportMode;
    *((unsigned char *)v5 + 28) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v5 + 1) = *(void *)&self->_distanceFromOrigin;
  *((unsigned char *)v5 + 28) |= 1u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    *((void *)v5 + 2) = *(void *)&self->_timeFromOrigin;
    *((unsigned char *)v5 + 28) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 6) = self->_transportMode;
    *((unsigned char *)result + 28) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = *(void *)&self->_distanceFromOrigin;
  *((unsigned char *)result + 28) |= 1u;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 2) = *(void *)&self->_timeFromOrigin;
  *((unsigned char *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOLogMsgEventTripDepartureFeedback *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_transportMode != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_distanceFromOrigin != *((double *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_timeFromOrigin != *((double *)v4 + 2)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventTripDepartureFeedback *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_transportMode;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double distanceFromOrigin = self->_distanceFromOrigin;
  double v6 = -distanceFromOrigin;
  if (distanceFromOrigin >= 0.0) {
    double v6 = self->_distanceFromOrigin;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((flags & 2) != 0)
  {
    double timeFromOrigin = self->_timeFromOrigin;
    double v12 = -timeFromOrigin;
    if (timeFromOrigin >= 0.0) {
      double v12 = self->_timeFromOrigin;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  return v9 ^ v4 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 4) != 0)
  {
    self->_transportMode = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 28);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v5 + 28) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double distanceFromOrigin = *((double *)v5 + 1);
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v5 + 28) & 2) != 0)
  {
LABEL_4:
    self->_double timeFromOrigin = *((double *)v5 + 2);
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_5:
}

@end