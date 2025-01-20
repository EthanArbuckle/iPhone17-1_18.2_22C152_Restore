@interface GEOURLTimePoint
+ (BOOL)isValid:(id)a3;
- (BOOL)hasTime;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOURLTimePoint)initWithDictionary:(id)a3;
- (GEOURLTimePoint)initWithJSON:(id)a3;
- (double)time;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTime:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setTime:(double)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOURLTimePoint

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_time = a3;
}

- (void)setHasTime:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTime
{
  return *(unsigned char *)&self->_flags & 1;
}

- (int)type
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"Arrival";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"Departure";
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Departure"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Arrival"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOURLTimePoint;
  int v4 = [(GEOURLTimePoint *)&v8 description];
  v5 = [(GEOURLTimePoint *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    char v3 = *(unsigned char *)(a1 + 20);
    if (v3)
    {
      int v4 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
      [v2 setObject:v4 forKey:@"time"];

      char v3 = *(unsigned char *)(a1 + 20);
    }
    if ((v3 & 2) != 0)
    {
      int v5 = *(_DWORD *)(a1 + 16);
      if (v5)
      {
        if (v5 == 1)
        {
          v6 = @"Arrival";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 16));
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v6 = @"Departure";
      }
      [v2 setObject:v6 forKey:@"type"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEOURLTimePoint)initWithDictionary:(id)a3
{
  return (GEOURLTimePoint *)-[GEOURLTimePoint _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      int v4 = [v3 objectForKeyedSubscript:@"time"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v4 doubleValue];
        objc_msgSend(a1, "setTime:");
      }

      int v5 = [v3 objectForKeyedSubscript:@"type"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        if ([v6 isEqualToString:@"Departure"]) {
          uint64_t v7 = 0;
        }
        else {
          uint64_t v7 = [v6 isEqualToString:@"Arrival"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_13:

          goto LABEL_14;
        }
        uint64_t v7 = [v5 intValue];
      }
      [a1 setType:v7];
      goto LABEL_13;
    }
  }
LABEL_14:

  return a1;
}

- (GEOURLTimePoint)initWithJSON:(id)a3
{
  return (GEOURLTimePoint *)-[GEOURLTimePoint _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOURLTimePointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOURLTimePointReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  int v5 = a3;
  [(GEOURLTimePoint *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[1] = *(void *)&self->_time;
    *((unsigned char *)v5 + 20) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_type;
    *((unsigned char *)v5 + 20) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((void *)result + 1) = *(void *)&self->_time;
    *((unsigned char *)result + 20) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_type;
    *((unsigned char *)result + 20) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOURLTimePoint *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_time != *((double *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_type != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOURLTimePoint *)self readAll:1];
  char flags = (char)self->_flags;
  if (flags)
  {
    double time = self->_time;
    double v6 = -time;
    if (time >= 0.0) {
      double v6 = self->_time;
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
  if ((flags & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_type;
  }
  else {
    uint64_t v9 = 0;
  }
  return v9 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 20);
  if (v4)
  {
    self->_double time = *((double *)v5 + 1);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 20);
  }
  if ((v4 & 2) != 0)
  {
    self->_type = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

@end