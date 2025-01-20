@interface GEOVLFPoint3D
+ (BOOL)isValid:(id)a3;
- (BOOL)hasX;
- (BOOL)hasY;
- (BOOL)hasZ;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFPoint3D)initWithDictionary:(id)a3;
- (GEOVLFPoint3D)initWithJSON:(id)a3;
- (float)x;
- (float)y;
- (float)z;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasX:(BOOL)a3;
- (void)setHasY:(BOOL)a3;
- (void)setHasZ:(BOOL)a3;
- (void)setX:(float)a3;
- (void)setY:(float)a3;
- (void)setZ:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFPoint3D

- (float)x
{
  return self->_x;
}

- (void)setX:(float)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_x = a3;
}

- (void)setHasX:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasX
{
  return *(unsigned char *)&self->_flags & 1;
}

- (float)y
{
  return self->_y;
}

- (void)setY:(float)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_y = a3;
}

- (void)setHasY:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasY
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (float)z
{
  return self->_z;
}

- (void)setZ:(float)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_z = a3;
}

- (void)setHasZ:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasZ
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLFPoint3D;
  v4 = [(GEOVLFPoint3D *)&v8 description];
  v5 = [(GEOVLFPoint3D *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v2 = 0;
    goto LABEL_9;
  }
  [(id)a1 readAll:1];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  char v4 = *(unsigned char *)(a1 + 20);
  if ((v4 & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 20) & 2) == 0) {
      goto LABEL_4;
    }
LABEL_7:
    LODWORD(v3) = *(_DWORD *)(a1 + 12);
    v6 = [NSNumber numberWithFloat:v3];
    [v2 setObject:v6 forKey:@"y"];

    if ((*(unsigned char *)(a1 + 20) & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  LODWORD(v3) = *(_DWORD *)(a1 + 8);
  v5 = [NSNumber numberWithFloat:v3];
  [v2 setObject:v5 forKey:@"x"];

  char v4 = *(unsigned char *)(a1 + 20);
  if ((v4 & 2) != 0) {
    goto LABEL_7;
  }
LABEL_4:
  if ((v4 & 4) != 0)
  {
LABEL_8:
    LODWORD(v3) = *(_DWORD *)(a1 + 16);
    v7 = [NSNumber numberWithFloat:v3];
    [v2 setObject:v7 forKey:@"z"];
  }
LABEL_9:

  return v2;
}

- (GEOVLFPoint3D)initWithDictionary:(id)a3
{
  return (GEOVLFPoint3D *)-[GEOVLFPoint3D _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      char v4 = [v3 objectForKeyedSubscript:@"x"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v4 floatValue];
        objc_msgSend(a1, "setX:");
      }

      v5 = [v3 objectForKeyedSubscript:@"y"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v5 floatValue];
        objc_msgSend(a1, "setY:");
      }

      v6 = [v3 objectForKeyedSubscript:@"z"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 floatValue];
        objc_msgSend(a1, "setZ:");
      }
    }
  }

  return a1;
}

- (GEOVLFPoint3D)initWithJSON:(id)a3
{
  return (GEOVLFPoint3D *)-[GEOVLFPoint3D _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFPoint3DIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFPoint3DReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [(GEOVLFPoint3D *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[2] = LODWORD(self->_x);
    *((unsigned char *)v5 + 20) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[3] = LODWORD(self->_y);
  *((unsigned char *)v5 + 20) |= 2u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    v5[4] = LODWORD(self->_z);
    *((unsigned char *)v5 + 20) |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)result + 2) = LODWORD(self->_x);
    *((unsigned char *)result + 20) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = LODWORD(self->_y);
  *((unsigned char *)result + 20) |= 2u;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 4) = LODWORD(self->_z);
  *((unsigned char *)result + 20) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOVLFPoint3D *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_x != *((float *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_y != *((float *)v4 + 3)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0 || self->_z != *((float *)v4 + 4)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  [(GEOVLFPoint3D *)self readAll:1];
  char flags = (char)self->_flags;
  if (flags)
  {
    float x = self->_x;
    double v6 = x;
    if (x < 0.0) {
      double v6 = -x;
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
  if ((flags & 2) != 0)
  {
    float y = self->_y;
    double v11 = y;
    if (y < 0.0) {
      double v11 = -y;
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
  if ((flags & 4) != 0)
  {
    float z = self->_z;
    double v16 = z;
    if (z < 0.0) {
      double v16 = -z;
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
  return v9 ^ v4 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (float *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 20);
  if (v4)
  {
    self->_float x = v5[2];
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 20);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (((_BYTE)v5[5] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_float y = v5[3];
  *(unsigned char *)&self->_flags |= 2u;
  if (((_BYTE)v5[5] & 4) != 0)
  {
LABEL_4:
    self->_float z = v5[4];
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_5:
}

@end