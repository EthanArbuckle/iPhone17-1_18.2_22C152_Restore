@interface GEOVLFUsageTileID
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBuildId;
- (BOOL)hasUncertainty;
- (BOOL)hasXCoordinate;
- (BOOL)hasYCoordinate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFUsageTileID)initWithDictionary:(id)a3;
- (GEOVLFUsageTileID)initWithJSON:(id)a3;
- (NSString)buildId;
- (double)uncertainty;
- (double)xCoordinate;
- (double)yCoordinate;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuildId:(id)a3;
- (void)setHasUncertainty:(BOOL)a3;
- (void)setHasXCoordinate:(BOOL)a3;
- (void)setHasYCoordinate:(BOOL)a3;
- (void)setUncertainty:(double)a3;
- (void)setXCoordinate:(double)a3;
- (void)setYCoordinate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFUsageTileID

- (BOOL)hasBuildId
{
  return self->_buildId != 0;
}

- (NSString)buildId
{
  return self->_buildId;
}

- (void)setBuildId:(id)a3
{
}

- (double)xCoordinate
{
  return self->_xCoordinate;
}

- (void)setXCoordinate:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_xCoordinate = a3;
}

- (void)setHasXCoordinate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasXCoordinate
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)yCoordinate
{
  return self->_yCoordinate;
}

- (void)setYCoordinate:(double)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_yCoordinate = a3;
}

- (void)setHasYCoordinate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasYCoordinate
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (double)uncertainty
{
  return self->_uncertainty;
}

- (void)setUncertainty:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_uncertainty = a3;
}

- (void)setHasUncertainty:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasUncertainty
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLFUsageTileID;
  v4 = [(GEOVLFUsageTileID *)&v8 description];
  v5 = [(GEOVLFUsageTileID *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFUsageTileID _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_20;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 buildId];
  if (v5)
  {
    if (a2) {
      v6 = @"buildId";
    }
    else {
      v6 = @"build_id";
    }
    [v4 setObject:v5 forKey:v6];
  }

  char v7 = *(unsigned char *)(a1 + 40);
  if ((v7 & 2) == 0)
  {
    if ((*(unsigned char *)(a1 + 40) & 4) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    v10 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    if (a2) {
      v11 = @"yCoordinate";
    }
    else {
      v11 = @"y_coordinate";
    }
    [v4 setObject:v10 forKey:v11];

    if ((*(unsigned char *)(a1 + 40) & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
  if (a2) {
    v9 = @"xCoordinate";
  }
  else {
    v9 = @"x_coordinate";
  }
  [v4 setObject:v8 forKey:v9];

  char v7 = *(unsigned char *)(a1 + 40);
  if ((v7 & 4) != 0) {
    goto LABEL_15;
  }
LABEL_9:
  if (v7)
  {
LABEL_19:
    v12 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
    [v4 setObject:v12 forKey:@"uncertainty"];
  }
LABEL_20:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFUsageTileID _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFUsageTileID)initWithDictionary:(id)a3
{
  return (GEOVLFUsageTileID *)-[GEOVLFUsageTileID _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"buildId";
      }
      else {
        v6 = @"build_id";
      }
      char v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setBuildId:v8];
      }
      if (a3) {
        v9 = @"xCoordinate";
      }
      else {
        v9 = @"x_coordinate";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v10 doubleValue];
        objc_msgSend(a1, "setXCoordinate:");
      }

      if (a3) {
        v11 = @"yCoordinate";
      }
      else {
        v11 = @"y_coordinate";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 doubleValue];
        objc_msgSend(a1, "setYCoordinate:");
      }

      v13 = [v5 objectForKeyedSubscript:@"uncertainty"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v13 doubleValue];
        objc_msgSend(a1, "setUncertainty:");
      }
    }
  }

  return a1;
}

- (GEOVLFUsageTileID)initWithJSON:(id)a3
{
  return (GEOVLFUsageTileID *)-[GEOVLFUsageTileID _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFUsageTileIDIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFUsageTileIDReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_buildId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_7:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOVLFUsageTileID *)self readAll:0];
  if (self->_buildId) {
    objc_msgSend(v5, "setBuildId:");
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((void *)v5 + 3) = *(void *)&self->_xCoordinate;
    *((unsigned char *)v5 + 40) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v5 + 4) = *(void *)&self->_yCoordinate;
  *((unsigned char *)v5 + 40) |= 4u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_6:
    *((void *)v5 + 2) = *(void *)&self->_uncertainty;
    *((unsigned char *)v5 + 40) |= 1u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_buildId copyWithZone:a3];
  char v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(double *)(v5 + 32) = self->_yCoordinate;
    *(unsigned char *)(v5 + 40) |= 4u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(double *)(v5 + 24) = self->_xCoordinate;
  *(unsigned char *)(v5 + 40) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_uncertainty;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEOVLFUsageTileID *)self readAll:1];
  [v4 readAll:1];
  buildId = self->_buildId;
  if ((unint64_t)buildId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](buildId, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_xCoordinate != *((double *)v4 + 3)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_yCoordinate != *((double *)v4 + 4)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_uncertainty != *((double *)v4 + 2)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  [(GEOVLFUsageTileID *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_buildId hash];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    double xCoordinate = self->_xCoordinate;
    double v7 = -xCoordinate;
    if (xCoordinate >= 0.0) {
      double v7 = self->_xCoordinate;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((flags & 4) != 0)
  {
    double yCoordinate = self->_yCoordinate;
    double v12 = -yCoordinate;
    if (yCoordinate >= 0.0) {
      double v12 = self->_yCoordinate;
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
  if (flags)
  {
    double uncertainty = self->_uncertainty;
    double v17 = -uncertainty;
    if (uncertainty >= 0.0) {
      double v17 = self->_uncertainty;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v5 = (double *)a3;
  [v5 readAll:0];
  if (*((void *)v5 + 1)) {
    -[GEOVLFUsageTileID setBuildId:](self, "setBuildId:");
  }
  char v4 = *((unsigned char *)v5 + 40);
  if ((v4 & 2) != 0)
  {
    self->_double xCoordinate = v5[3];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 40);
    if ((v4 & 4) == 0)
    {
LABEL_5:
      if ((v4 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if (((_BYTE)v5[5] & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_double yCoordinate = v5[4];
  *(unsigned char *)&self->_flags |= 4u;
  if ((_BYTE)v5[5])
  {
LABEL_6:
    self->_double uncertainty = v5[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_7:
}

- (void).cxx_destruct
{
}

@end