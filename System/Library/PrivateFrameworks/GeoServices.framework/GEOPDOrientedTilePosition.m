@interface GEOPDOrientedTilePosition
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAltitude;
- (BOOL)hasPitch;
- (BOOL)hasRoll;
- (BOOL)hasX;
- (BOOL)hasY;
- (BOOL)hasYaw;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDOrientedTilePosition)initWithDictionary:(id)a3;
- (GEOPDOrientedTilePosition)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)altitude;
- (unint64_t)hash;
- (unsigned)pitch;
- (unsigned)roll;
- (unsigned)x;
- (unsigned)y;
- (unsigned)yaw;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAltitude:(int)a3;
- (void)setHasAltitude:(BOOL)a3;
- (void)setHasPitch:(BOOL)a3;
- (void)setHasRoll:(BOOL)a3;
- (void)setHasX:(BOOL)a3;
- (void)setHasY:(BOOL)a3;
- (void)setHasYaw:(BOOL)a3;
- (void)setPitch:(unsigned int)a3;
- (void)setRoll:(unsigned int)a3;
- (void)setX:(unsigned int)a3;
- (void)setY:(unsigned int)a3;
- (void)setYaw:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDOrientedTilePosition

- (unsigned)x
{
  return self->_x;
}

- (void)setX:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_x = a3;
}

- (void)setHasX:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasX
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)y
{
  return self->_y;
}

- (void)setY:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_y = a3;
}

- (void)setHasY:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasY
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (int)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_altitude = a3;
}

- (void)setHasAltitude:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAltitude
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)yaw
{
  return self->_yaw;
}

- (void)setYaw:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_yaw = a3;
}

- (void)setHasYaw:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasYaw
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (unsigned)pitch
{
  return self->_pitch;
}

- (void)setPitch:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_pitch = a3;
}

- (void)setHasPitch:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasPitch
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)roll
{
  return self->_roll;
}

- (void)setRoll:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_roll = a3;
}

- (void)setHasRoll:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasRoll
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDOrientedTilePosition;
  v4 = [(GEOPDOrientedTilePosition *)&v8 description];
  v5 = [(GEOPDOrientedTilePosition *)self dictionaryRepresentation];
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
  char v3 = *(unsigned char *)(a1 + 32);
  if ((v3 & 8) != 0)
  {
    v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
    [v2 setObject:v4 forKey:@"x"];

    char v3 = *(unsigned char *)(a1 + 32);
  }
  if ((v3 & 0x20) != 0)
  {
    v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
    [v2 setObject:v5 forKey:@"y"];

    char v3 = *(unsigned char *)(a1 + 32);
    if ((v3 & 1) == 0)
    {
LABEL_6:
      if ((v3 & 0x10) == 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else if ((v3 & 1) == 0)
  {
    goto LABEL_6;
  }
  v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 8)];
  [v2 setObject:v6 forKey:@"altitude"];

  char v3 = *(unsigned char *)(a1 + 32);
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 2) == 0) {
      goto LABEL_8;
    }
LABEL_13:
    objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 12)];
    [v2 setObject:v8 forKey:@"pitch"];

    if ((*(unsigned char *)(a1 + 32) & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_12:
  v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
  [v2 setObject:v7 forKey:@"yaw"];

  char v3 = *(unsigned char *)(a1 + 32);
  if ((v3 & 2) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if ((v3 & 4) != 0)
  {
LABEL_14:
    v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
    [v2 setObject:v9 forKey:@"roll"];
  }
LABEL_15:

  return v2;
}

- (GEOPDOrientedTilePosition)initWithDictionary:(id)a3
{
  return (GEOPDOrientedTilePosition *)-[GEOPDOrientedTilePosition _initWithDictionary:isJSON:](self, a3);
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
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setX:", objc_msgSend(v4, "unsignedIntValue"));
      }

      v5 = [v3 objectForKeyedSubscript:@"y"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setY:", objc_msgSend(v5, "unsignedIntValue"));
      }

      v6 = [v3 objectForKeyedSubscript:@"altitude"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAltitude:", objc_msgSend(v6, "intValue"));
      }

      v7 = [v3 objectForKeyedSubscript:@"yaw"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setYaw:", objc_msgSend(v7, "unsignedIntValue"));
      }

      objc_super v8 = [v3 objectForKeyedSubscript:@"pitch"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setPitch:", objc_msgSend(v8, "unsignedIntValue"));
      }

      v9 = [v3 objectForKeyedSubscript:@"roll"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRoll:", objc_msgSend(v9, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOPDOrientedTilePosition)initWithJSON:(id)a3
{
  return (GEOPDOrientedTilePosition *)-[GEOPDOrientedTilePosition _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDOrientedTilePositionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDOrientedTilePositionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPDOrientedTilePosition *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v5[5] = self->_x;
    *((unsigned char *)v5 + 32) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v5[7] = self->_y;
  *((unsigned char *)v5 + 32) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v5[2] = self->_altitude;
  *((unsigned char *)v5 + 32) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v5[6] = self->_yaw;
  *((unsigned char *)v5 + 32) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v5[3] = self->_pitch;
  *((unsigned char *)v5 + 32) |= 2u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_7:
    v5[4] = self->_roll;
    *((unsigned char *)v5 + 32) |= 4u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)result + 5) = self->_x;
    *((unsigned char *)result + 32) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_y;
  *((unsigned char *)result + 32) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 2) = self->_altitude;
  *((unsigned char *)result + 32) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 6) = self->_yaw;
  *((unsigned char *)result + 32) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 3) = self->_pitch;
  *((unsigned char *)result + 32) |= 2u;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    return result;
  }
LABEL_7:
  *((_DWORD *)result + 4) = self->_roll;
  *((unsigned char *)result + 32) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  [(GEOPDOrientedTilePosition *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_x != *((_DWORD *)v4 + 5)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
LABEL_31:
    BOOL v5 = 0;
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x20) == 0 || self->_y != *((_DWORD *)v4 + 7)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_altitude != *((_DWORD *)v4 + 2)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) == 0 || self->_yaw != *((_DWORD *)v4 + 6)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_pitch != *((_DWORD *)v4 + 3)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_31;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_roll != *((_DWORD *)v4 + 4)) {
      goto LABEL_31;
    }
    BOOL v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  [(GEOPDOrientedTilePosition *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v3 = 2654435761 * self->_x;
    if ((*(unsigned char *)&self->_flags & 0x20) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_y;
      if (*(unsigned char *)&self->_flags) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_altitude;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_yaw;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_pitch;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_roll;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 8) != 0)
  {
    self->_x = *((_DWORD *)v5 + 5);
    *(unsigned char *)&self->_flags |= 8u;
    char v4 = *((unsigned char *)v5 + 32);
    if ((v4 & 0x20) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v5 + 32) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_y = *((_DWORD *)v5 + 7);
  *(unsigned char *)&self->_flags |= 0x20u;
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 1) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_altitude = *((_DWORD *)v5 + 2);
  *(unsigned char *)&self->_flags |= 1u;
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_yaw = *((_DWORD *)v5 + 6);
  *(unsigned char *)&self->_flags |= 0x10u;
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 2) == 0)
  {
LABEL_6:
    if ((v4 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_pitch = *((_DWORD *)v5 + 3);
  *(unsigned char *)&self->_flags |= 2u;
  if ((*((unsigned char *)v5 + 32) & 4) != 0)
  {
LABEL_7:
    self->_roll = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_8:
}

@end