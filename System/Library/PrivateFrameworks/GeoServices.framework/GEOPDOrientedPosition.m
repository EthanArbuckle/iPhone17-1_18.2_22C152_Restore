@interface GEOPDOrientedPosition
+ (BOOL)isValid:(id)a3;
- (BOOL)hasPitch;
- (BOOL)hasRoll;
- (BOOL)hasX;
- (BOOL)hasY;
- (BOOL)hasYaw;
- (BOOL)hasZ;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDOrientedPosition)initWithDictionary:(id)a3;
- (GEOPDOrientedPosition)initWithJSON:(id)a3;
- (double)pitch;
- (double)roll;
- (double)x;
- (double)y;
- (double)yaw;
- (double)z;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPitch:(BOOL)a3;
- (void)setHasRoll:(BOOL)a3;
- (void)setHasX:(BOOL)a3;
- (void)setHasY:(BOOL)a3;
- (void)setHasYaw:(BOOL)a3;
- (void)setHasZ:(BOOL)a3;
- (void)setPitch:(double)a3;
- (void)setRoll:(double)a3;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
- (void)setYaw:(double)a3;
- (void)setZ:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDOrientedPosition

- (double)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_x = a3;
}

- (void)setHasX:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasX
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (double)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_y = a3;
}

- (void)setHasY:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasY
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (double)z
{
  return self->_z;
}

- (void)setZ:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_z = a3;
}

- (void)setHasZ:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasZ
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (double)yaw
{
  return self->_yaw;
}

- (void)setYaw:(double)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_yaw = a3;
}

- (void)setHasYaw:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasYaw
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_pitch = a3;
}

- (void)setHasPitch:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasPitch
{
  return *(unsigned char *)&self->_flags & 1;
}

- (double)roll
{
  return self->_roll;
}

- (void)setRoll:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_roll = a3;
}

- (void)setHasRoll:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRoll
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDOrientedPosition;
  v4 = [(GEOPDOrientedPosition *)&v8 description];
  v5 = [(GEOPDOrientedPosition *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v2 = 0;
    goto LABEL_15;
  }
  [(id)a1 readAll:1];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  char v3 = *(unsigned char *)(a1 + 56);
  if ((v3 & 4) != 0)
  {
    v4 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    [v2 setObject:v4 forKey:@"x"];

    char v3 = *(unsigned char *)(a1 + 56);
  }
  if ((v3 & 0x10) != 0)
  {
    v5 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
    [v2 setObject:v5 forKey:@"y"];

    char v3 = *(unsigned char *)(a1 + 56);
    if ((v3 & 0x20) == 0)
    {
LABEL_6:
      if ((v3 & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_6;
  }
  v6 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  [v2 setObject:v6 forKey:@"z"];

  char v3 = *(unsigned char *)(a1 + 56);
  if ((v3 & 8) == 0)
  {
LABEL_7:
    if ((v3 & 1) == 0) {
      goto LABEL_8;
    }
LABEL_13:
    objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
    [v2 setObject:v8 forKey:@"pitch"];

    if ((*(unsigned char *)(a1 + 56) & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_12:
  v7 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  [v2 setObject:v7 forKey:@"yaw"];

  char v3 = *(unsigned char *)(a1 + 56);
  if (v3) {
    goto LABEL_13;
  }
LABEL_8:
  if ((v3 & 2) != 0)
  {
LABEL_14:
    v9 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
    [v2 setObject:v9 forKey:@"roll"];
  }
LABEL_15:

  return v2;
}

- (GEOPDOrientedPosition)initWithDictionary:(id)a3
{
  return (GEOPDOrientedPosition *)-[GEOPDOrientedPosition _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"x"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v4 doubleValue];
        objc_msgSend(a1, "setX:");
      }

      v5 = [v3 objectForKeyedSubscript:@"y"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v5 doubleValue];
        objc_msgSend(a1, "setY:");
      }

      v6 = [v3 objectForKeyedSubscript:@"z"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 doubleValue];
        objc_msgSend(a1, "setZ:");
      }

      v7 = [v3 objectForKeyedSubscript:@"yaw"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 doubleValue];
        objc_msgSend(a1, "setYaw:");
      }

      objc_super v8 = [v3 objectForKeyedSubscript:@"pitch"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 doubleValue];
        objc_msgSend(a1, "setPitch:");
      }

      v9 = [v3 objectForKeyedSubscript:@"roll"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 doubleValue];
        objc_msgSend(a1, "setRoll:");
      }
    }
  }

  return a1;
}

- (GEOPDOrientedPosition)initWithJSON:(id)a3
{
  return (GEOPDOrientedPosition *)-[GEOPDOrientedPosition _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDOrientedPositionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDOrientedPositionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
LABEL_7:
  }
    PBDataWriterWriteDoubleField();
LABEL_8:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPDOrientedPosition *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[3] = *(void *)&self->_x;
    *((unsigned char *)v5 + 56) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v5[5] = *(void *)&self->_y;
  *((unsigned char *)v5 + 56) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v5[6] = *(void *)&self->_z;
  *((unsigned char *)v5 + 56) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v5[4] = *(void *)&self->_yaw;
  *((unsigned char *)v5 + 56) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v5[1] = *(void *)&self->_pitch;
  *((unsigned char *)v5 + 56) |= 1u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_7:
    v5[2] = *(void *)&self->_roll;
    *((unsigned char *)v5 + 56) |= 2u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((void *)result + 3) = *(void *)&self->_x;
    *((unsigned char *)result + 56) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 5) = *(void *)&self->_y;
  *((unsigned char *)result + 56) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((void *)result + 6) = *(void *)&self->_z;
  *((unsigned char *)result + 56) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)result + 4) = *(void *)&self->_yaw;
  *((unsigned char *)result + 56) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((void *)result + 1) = *(void *)&self->_pitch;
  *((unsigned char *)result + 56) |= 1u;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    return result;
  }
LABEL_7:
  *((void *)result + 2) = *(void *)&self->_roll;
  *((unsigned char *)result + 56) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  [(GEOPDOrientedPosition *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_x != *((double *)v4 + 3)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
LABEL_31:
    BOOL v5 = 0;
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x10) == 0 || self->_y != *((double *)v4 + 5)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x20) == 0 || self->_z != *((double *)v4 + 6)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_yaw != *((double *)v4 + 4)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_pitch != *((double *)v4 + 1)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_31;
  }
  BOOL v5 = (*((unsigned char *)v4 + 56) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_roll != *((double *)v4 + 2)) {
      goto LABEL_31;
    }
    BOOL v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  [(GEOPDOrientedPosition *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    double x = self->_x;
    double v6 = -x;
    if (x >= 0.0) {
      double v6 = self->_x;
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
  if ((flags & 0x10) != 0)
  {
    double y = self->_y;
    double v11 = -y;
    if (y >= 0.0) {
      double v11 = self->_y;
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
  if ((flags & 0x20) != 0)
  {
    double z = self->_z;
    double v16 = -z;
    if (z >= 0.0) {
      double v16 = self->_z;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((flags & 8) != 0)
  {
    double yaw = self->_yaw;
    double v21 = -yaw;
    if (yaw >= 0.0) {
      double v21 = self->_yaw;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if (flags)
  {
    double pitch = self->_pitch;
    double v26 = -pitch;
    if (pitch >= 0.0) {
      double v26 = self->_pitch;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((flags & 2) != 0)
  {
    double roll = self->_roll;
    double v31 = -roll;
    if (roll >= 0.0) {
      double v31 = self->_roll;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (double *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 56);
  if ((v4 & 4) != 0)
  {
    self->_double x = v5[3];
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 56);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if (((_BYTE)v5[7] & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_double y = v5[5];
  *(unsigned char *)&self->_flags |= 0x10u;
  char v4 = *((unsigned char *)v5 + 56);
  if ((v4 & 0x20) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_double z = v5[6];
  *(unsigned char *)&self->_flags |= 0x20u;
  char v4 = *((unsigned char *)v5 + 56);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_double yaw = v5[4];
  *(unsigned char *)&self->_flags |= 8u;
  char v4 = *((unsigned char *)v5 + 56);
  if ((v4 & 1) == 0)
  {
LABEL_6:
    if ((v4 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_double pitch = v5[1];
  *(unsigned char *)&self->_flags |= 1u;
  if (((_BYTE)v5[7] & 2) != 0)
  {
LABEL_7:
    self->_double roll = v5[2];
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_8:
}

@end