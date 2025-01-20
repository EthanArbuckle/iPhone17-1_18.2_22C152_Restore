@interface GEOCompanionRouteContext
+ (BOOL)isValid:(id)a3;
+ (id)context;
+ (int)defaultOrigin;
- (BOOL)hasLegacyTimestamp;
- (BOOL)hasOrigin;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForeignOrigin;
- (BOOL)isStaleComparedToContext:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCompanionRouteContext)initWithDictionary:(id)a3;
- (GEOCompanionRouteContext)initWithJSON:(id)a3;
- (double)timestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)originAsString:(int)a3;
- (id)simpleDescription;
- (int)StringAsOrigin:(id)a3;
- (int)origin;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unsigned)legacyTimestamp;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLegacyTimestamp:(BOOL)a3;
- (void)setHasOrigin:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLegacyTimestamp:(unsigned int)a3;
- (void)setOrigin:(int)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCompanionRouteContext

- (unsigned)legacyTimestamp
{
  return self->_legacyTimestamp;
}

- (void)setLegacyTimestamp:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_legacyTimestamp = a3;
}

- (void)setHasLegacyTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLegacyTimestamp
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)origin
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_origin;
  }
  else {
    return 0;
  }
}

- (void)setOrigin:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_origin = a3;
}

- (void)setHasOrigin:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasOrigin
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)originAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53DF090[a3];
  }

  return v3;
}

- (int)StringAsOrigin:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GIZMO"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"COMPANION"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCompanionRouteContext;
  int v4 = [(GEOCompanionRouteContext *)&v8 description];
  v5 = [(GEOCompanionRouteContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v2 = 0;
    goto LABEL_12;
  }
  [(id)a1 readAll:1];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  char v3 = *(unsigned char *)(a1 + 24);
  if ((v3 & 2) == 0)
  {
    if ((*(unsigned char *)(a1 + 24) & 4) == 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = *(int *)(a1 + 20);
    if (v5 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E53DF090[v5];
    }
    [v2 setObject:v6 forKey:@"origin"];

    if ((*(unsigned char *)(a1 + 24) & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  int v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
  [v2 setObject:v4 forKey:@"legacyTimestamp"];

  char v3 = *(unsigned char *)(a1 + 24);
  if ((v3 & 4) != 0) {
    goto LABEL_7;
  }
LABEL_4:
  if (v3)
  {
LABEL_11:
    v7 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
    [v2 setObject:v7 forKey:@"timestamp"];
  }
LABEL_12:

  return v2;
}

- (GEOCompanionRouteContext)initWithDictionary:(id)a3
{
  return (GEOCompanionRouteContext *)-[GEOCompanionRouteContext _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_20;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_20;
  }
  int v4 = [v3 objectForKeyedSubscript:@"legacyTimestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLegacyTimestamp:", objc_msgSend(v4, "unsignedIntValue"));
  }

  uint64_t v5 = [v3 objectForKeyedSubscript:@"origin"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    if ([v6 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v7 = 0;
    }
    else if ([v6 isEqualToString:@"GIZMO"])
    {
      uint64_t v7 = 1;
    }
    else if ([v6 isEqualToString:@"COMPANION"])
    {
      uint64_t v7 = 2;
    }
    else
    {
      uint64_t v7 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v5 intValue];
LABEL_16:
    [a1 setOrigin:v7];
  }

  objc_super v8 = [v3 objectForKeyedSubscript:@"timestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 doubleValue];
    objc_msgSend(a1, "setTimestamp:");
  }

LABEL_20:
  return a1;
}

- (GEOCompanionRouteContext)initWithJSON:(id)a3
{
  return (GEOCompanionRouteContext *)-[GEOCompanionRouteContext _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionRouteContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionRouteContextReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  uint64_t v5 = a3;
  [(GEOCompanionRouteContext *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[4] = self->_legacyTimestamp;
    *((unsigned char *)v5 + 24) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[5] = self->_origin;
  *((unsigned char *)v5 + 24) |= 4u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    *((void *)v5 + 1) = *(void *)&self->_timestamp;
    *((unsigned char *)v5 + 24) |= 1u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_legacyTimestamp;
    *((unsigned char *)result + 24) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_origin;
  *((unsigned char *)result + 24) |= 4u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 1) = *(void *)&self->_timestamp;
  *((unsigned char *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOCompanionRouteContext *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_legacyTimestamp != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_origin != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  [(GEOCompanionRouteContext *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9;
  }
  uint64_t v3 = 2654435761 * self->_legacyTimestamp;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_origin;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double timestamp = self->_timestamp;
  double v6 = -timestamp;
  if (timestamp >= 0.0) {
    double v6 = self->_timestamp;
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
  return v4 ^ v3 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 2) != 0)
  {
    self->_legacyTimestamp = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 24);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v5 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_origin = *((_DWORD *)v5 + 5);
  *(unsigned char *)&self->_flags |= 4u;
  if (*((unsigned char *)v5 + 24))
  {
LABEL_4:
    self->_double timestamp = *((double *)v5 + 1);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_5:
}

+ (id)context
{
  id v2 = objc_alloc_init((Class)a1);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(v2, "setTimestamp:");
  [v2 timestamp];
  [v2 setLegacyTimestamp:v3];
  objc_msgSend(v2, "setOrigin:", objc_msgSend((id)objc_opt_class(), "defaultOrigin"));

  return v2;
}

- (BOOL)isForeignOrigin
{
  int v2 = [(GEOCompanionRouteContext *)self origin];
  return v2 != [(id)objc_opt_class() defaultOrigin];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  if ([(GEOCompanionRouteContext *)self hasTimestamp])
  {
    [(GEOCompanionRouteContext *)self timestamp];
    double v6 = v5;
  }
  else
  {
    double v6 = (double)[(GEOCompanionRouteContext *)self legacyTimestamp];
  }
  if ([v4 hasTimestamp])
  {
    [v4 timestamp];
    double v8 = v7;
  }
  else
  {
    double v8 = (double)[v4 legacyTimestamp];
  }
  if ([(GEOCompanionRouteContext *)self hasTimestamp])
  {
    char v9 = [v4 hasTimestamp];
    double v10 = floor(v6);
    double v11 = floor(v8);
    if ((v9 & 1) == 0)
    {
      double v6 = v10;
      double v8 = v11;
    }
  }
  else
  {
    double v6 = floor(v6);
    double v8 = floor(v8);
  }
  if (-[GEOCompanionRouteContext origin](self, "origin") && [v4 origin])
  {
    if (v6 >= v8) {
      int64_t v12 = v6 > v8;
    }
    else {
      int64_t v12 = -1;
    }
  }
  else if (v6 == v8)
  {
    int64_t v12 = 0;
  }
  else
  {
    int64_t v12 = -1;
  }

  return v12;
}

- (BOOL)isStaleComparedToContext:(id)a3
{
  return [a3 compare:self] == 1;
}

+ (int)defaultOrigin
{
  return 2;
}

- (id)simpleDescription
{
  if ([(GEOCompanionRouteContext *)self hasTimestamp])
  {
    [(GEOCompanionRouteContext *)self timestamp];
    double v4 = v3;
    double v5 = "";
  }
  else
  {
    double v4 = (double)[(GEOCompanionRouteContext *)self legacyTimestamp];
    double v5 = " (legacy)";
  }
  double v6 = NSString;
  uint64_t v7 = [(GEOCompanionRouteContext *)self origin];
  if (v7 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
    double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v8 = off_1E53E59D0[(int)v7];
  }
  char v9 = [NSNumber numberWithDouble:v4];
  double v10 = [v6 stringWithFormat:@"{%@:%@%s}", v8, v9, v5];

  return v10;
}

@end