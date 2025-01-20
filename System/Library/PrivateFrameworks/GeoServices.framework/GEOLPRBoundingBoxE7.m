@interface GEOLPRBoundingBoxE7
+ (BOOL)isValid:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)center;
- (BOOL)hasEastLngE7;
- (BOOL)hasNorthLatE7;
- (BOOL)hasSouthLatE7;
- (BOOL)hasWestLngE7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
- (GEOLPRBoundingBoxE7)initWithDictionary:(id)a3;
- (GEOLPRBoundingBoxE7)initWithJSON:(id)a3;
- (GEOMapRegion)mapRegion;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)centerLatE7;
- (int)centerLngE7;
- (int)eastLngE7;
- (int)northLatE7;
- (int)southLatE7;
- (int)westLngE7;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEastLngE7:(int)a3;
- (void)setHasEastLngE7:(BOOL)a3;
- (void)setHasNorthLatE7:(BOOL)a3;
- (void)setHasSouthLatE7:(BOOL)a3;
- (void)setHasWestLngE7:(BOOL)a3;
- (void)setNorthLatE7:(int)a3;
- (void)setSouthLatE7:(int)a3;
- (void)setWestLngE7:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRBoundingBoxE7

- (int)centerLatE7
{
  int v3 = [(GEOLPRBoundingBoxE7 *)self southLatE7];
  uint64_t v4 = [(GEOLPRBoundingBoxE7 *)self northLatE7] + (uint64_t)v3;
  return (v4 + (unint64_t)(v4 < 0)) >> 1;
}

- (int)centerLngE7
{
  int v3 = [(GEOLPRBoundingBoxE7 *)self westLngE7];
  uint64_t v4 = [(GEOLPRBoundingBoxE7 *)self eastLngE7] + (uint64_t)v3;
  return (v4 + (unint64_t)(v4 < 0)) >> 1;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)center
{
  double v3 = (double)[(GEOLPRBoundingBoxE7 *)self centerLatE7] * 0.0000001;
  double v4 = (double)[(GEOLPRBoundingBoxE7 *)self centerLngE7] * 0.0000001;
  double v5 = v3;
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

- (GEOMapRegion)mapRegion
{
  if ([(GEOLPRBoundingBoxE7 *)self isValid])
  {
    double v3 = objc_alloc_init(GEOMapRegion);
    [(GEOMapRegion *)v3 setSouthLat:(double)[(GEOLPRBoundingBoxE7 *)self southLatE7] * 0.0000001];
    [(GEOMapRegion *)v3 setWestLng:(double)[(GEOLPRBoundingBoxE7 *)self westLngE7] * 0.0000001];
    [(GEOMapRegion *)v3 setNorthLat:(double)[(GEOLPRBoundingBoxE7 *)self northLatE7] * 0.0000001];
    [(GEOMapRegion *)v3 setEastLng:(double)[(GEOLPRBoundingBoxE7 *)self eastLngE7] * 0.0000001];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (BOOL)isValid
{
  if (![(GEOLPRBoundingBoxE7 *)self hasNorthLatE7]
    || ![(GEOLPRBoundingBoxE7 *)self hasSouthLatE7]
    || ![(GEOLPRBoundingBoxE7 *)self hasEastLngE7])
  {
    return 0;
  }

  return [(GEOLPRBoundingBoxE7 *)self hasWestLngE7];
}

- (int)southLatE7
{
  return self->_southLatE7;
}

- (void)setSouthLatE7:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_southLatE7 = a3;
}

- (void)setHasSouthLatE7:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSouthLatE7
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)westLngE7
{
  return self->_westLngE7;
}

- (void)setWestLngE7:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_westLngE7 = a3;
}

- (void)setHasWestLngE7:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasWestLngE7
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (int)northLatE7
{
  return self->_northLatE7;
}

- (void)setNorthLatE7:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_northLatE7 = a3;
}

- (void)setHasNorthLatE7:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasNorthLatE7
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)eastLngE7
{
  return self->_eastLngE7;
}

- (void)setEastLngE7:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_eastLngE7 = a3;
}

- (void)setHasEastLngE7:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEastLngE7
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRBoundingBoxE7;
  double v4 = [(GEOLPRBoundingBoxE7 *)&v8 description];
  double v5 = [(GEOLPRBoundingBoxE7 *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v2 = 0;
    goto LABEL_11;
  }
  [(id)a1 readAll:1];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  char v3 = *(unsigned char *)(a1 + 24);
  if ((v3 & 4) != 0)
  {
    double v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 16)];
    [v2 setObject:v4 forKey:@"southLatE7"];

    char v3 = *(unsigned char *)(a1 + 24);
  }
  if ((v3 & 8) == 0)
  {
    if ((v3 & 2) == 0) {
      goto LABEL_6;
    }
LABEL_9:
    v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 12)];
    [v2 setObject:v6 forKey:@"northLatE7"];

    if ((*(unsigned char *)(a1 + 24) & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  double v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 20)];
  [v2 setObject:v5 forKey:@"westLngE7"];

  char v3 = *(unsigned char *)(a1 + 24);
  if ((v3 & 2) != 0) {
    goto LABEL_9;
  }
LABEL_6:
  if (v3)
  {
LABEL_10:
    v7 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 8)];
    [v2 setObject:v7 forKey:@"eastLngE7"];
  }
LABEL_11:

  return v2;
}

- (GEOLPRBoundingBoxE7)initWithDictionary:(id)a3
{
  return (GEOLPRBoundingBoxE7 *)-[GEOLPRBoundingBoxE7 _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      double v4 = [v3 objectForKeyedSubscript:@"southLatE7"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSouthLatE7:", objc_msgSend(v4, "intValue"));
      }

      double v5 = [v3 objectForKeyedSubscript:@"westLngE7"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setWestLngE7:", objc_msgSend(v5, "intValue"));
      }

      v6 = [v3 objectForKeyedSubscript:@"northLatE7"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNorthLatE7:", objc_msgSend(v6, "intValue"));
      }

      v7 = [v3 objectForKeyedSubscript:@"eastLngE7"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setEastLngE7:", objc_msgSend(v7, "intValue"));
      }
    }
  }

  return a1;
}

- (GEOLPRBoundingBoxE7)initWithJSON:(id)a3
{
  return (GEOLPRBoundingBoxE7 *)-[GEOLPRBoundingBoxE7 _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRBoundingBoxE7IsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRBoundingBoxE7ReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteSfixed32Field();
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSfixed32Field();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteSfixed32Field();
  if (*(unsigned char *)&self->_flags) {
LABEL_5:
  }
    PBDataWriterWriteSfixed32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLPRBoundingBoxE7 *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[4] = self->_southLatE7;
    *((unsigned char *)v5 + 24) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[5] = self->_westLngE7;
  *((unsigned char *)v5 + 24) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v5[3] = self->_northLatE7;
  *((unsigned char *)v5 + 24) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_5:
    v5[2] = self->_eastLngE7;
    *((unsigned char *)v5 + 24) |= 1u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_southLatE7;
    *((unsigned char *)result + 24) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_westLngE7;
  *((unsigned char *)result + 24) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 3) = self->_northLatE7;
  *((unsigned char *)result + 24) |= 2u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 2) = self->_eastLngE7;
  *((unsigned char *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOLPRBoundingBoxE7 *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_southLatE7 != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0 || self->_westLngE7 != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_northLatE7 != *((_DWORD *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_eastLngE7 != *((_DWORD *)v4 + 2)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLPRBoundingBoxE7 *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_southLatE7;
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_westLngE7;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if (*(unsigned char *)&self->_flags) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_northLatE7;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_eastLngE7;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 4) != 0)
  {
    self->_southLatE7 = v5[4];
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 24);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((v5[6] & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_westLngE7 = v5[5];
  *(unsigned char *)&self->_flags |= 8u;
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_northLatE7 = v5[3];
  *(unsigned char *)&self->_flags |= 2u;
  if (v5[6])
  {
LABEL_5:
    self->_eastLngE7 = v5[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_6:
}

@end