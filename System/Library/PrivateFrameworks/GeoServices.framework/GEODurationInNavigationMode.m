@interface GEODurationInNavigationMode
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDuration;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEODurationInNavigationMode)initWithDictionary:(id)a3;
- (GEODurationInNavigationMode)initWithJSON:(id)a3;
- (double)duration;
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
- (void)setDuration:(double)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEODurationInNavigationMode

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F7588[a3];
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEODurationInNavigationMode *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_type != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_duration != *((double *)v4 + 1)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
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

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NAV_MODE_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NAV_MODE_TYPE_LIGHT_GUIDANCE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NAV_MODE_TYPE_FULL_GUIDANCE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEODurationInNavigationMode;
  int v4 = [(GEODurationInNavigationMode *)&v8 description];
  BOOL v5 = [(GEODurationInNavigationMode *)self dictionaryRepresentation];
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
    if ((v3 & 2) != 0)
    {
      uint64_t v4 = *(int *)(a1 + 16);
      if (v4 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v5 = off_1E53F7588[v4];
      }
      [v2 setObject:v5 forKey:@"type"];

      char v3 = *(unsigned char *)(a1 + 20);
    }
    if (v3)
    {
      v6 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
      [v2 setObject:v6 forKey:@"duration"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEODurationInNavigationMode)initWithDictionary:(id)a3
{
  return (GEODurationInNavigationMode *)-[GEODurationInNavigationMode _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_18;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_18;
  }
  uint64_t v4 = [v3 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isEqualToString:@"NAV_MODE_TYPE_UNKNOWN"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"NAV_MODE_TYPE_LIGHT_GUIDANCE"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"NAV_MODE_TYPE_FULL_GUIDANCE"])
    {
      uint64_t v6 = 2;
    }
    else
    {
      uint64_t v6 = 0;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v4 intValue];
LABEL_14:
    [a1 setType:v6];
  }

  v7 = [v3 objectForKeyedSubscript:@"duration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 doubleValue];
    objc_msgSend(a1, "setDuration:");
  }

LABEL_18:
  return a1;
}

- (GEODurationInNavigationMode)initWithJSON:(id)a3
{
  return (GEODurationInNavigationMode *)-[GEODurationInNavigationMode _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEODurationInNavigationModeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODurationInNavigationModeReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEODurationInNavigationMode *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[4] = self->_type;
    *((unsigned char *)v5 + 20) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((void *)v5 + 1) = *(void *)&self->_duration;
    *((unsigned char *)v5 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_type;
    *((unsigned char *)result + 20) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((void *)result + 1) = *(void *)&self->_duration;
    *((unsigned char *)result + 20) |= 1u;
  }
  return result;
}

- (unint64_t)hash
{
  [(GEODurationInNavigationMode *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_type;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    return v8 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double duration = self->_duration;
  double v5 = -duration;
  if (duration >= 0.0) {
    double v5 = self->_duration;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v8 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 20);
  if ((v4 & 2) != 0)
  {
    self->_type = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 20);
  }
  if (v4)
  {
    self->_double duration = *((double *)v5 + 1);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end