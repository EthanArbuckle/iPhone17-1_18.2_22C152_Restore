@interface GEOVLFImagePosition
+ (BOOL)isValid:(id)a3;
- (BOOL)hasX;
- (BOOL)hasY;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFImagePosition)initWithDictionary:(id)a3;
- (GEOVLFImagePosition)initWithJSON:(id)a3;
- (float)x;
- (float)y;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasX:(BOOL)a3;
- (void)setHasY:(BOOL)a3;
- (void)setX:(float)a3;
- (void)setY:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFImagePosition

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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLFImagePosition;
  v4 = [(GEOVLFImagePosition *)&v8 description];
  v5 = [(GEOVLFImagePosition *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    char v4 = *(unsigned char *)(a1 + 16);
    if (v4)
    {
      LODWORD(v3) = *(_DWORD *)(a1 + 8);
      v5 = [NSNumber numberWithFloat:v3];
      [v2 setObject:v5 forKey:@"x"];

      char v4 = *(unsigned char *)(a1 + 16);
    }
    if ((v4 & 2) != 0)
    {
      LODWORD(v3) = *(_DWORD *)(a1 + 12);
      v6 = [NSNumber numberWithFloat:v3];
      [v2 setObject:v6 forKey:@"y"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEOVLFImagePosition)initWithDictionary:(id)a3
{
  return (GEOVLFImagePosition *)-[GEOVLFImagePosition _initWithDictionary:isJSON:](self, a3);
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
    }
  }

  return a1;
}

- (GEOVLFImagePosition)initWithJSON:(id)a3
{
  return (GEOVLFImagePosition *)-[GEOVLFImagePosition _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFImagePositionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFImagePositionReadAllFrom((uint64_t)self, a3);
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
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [(GEOVLFImagePosition *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[2] = LODWORD(self->_x);
    *((unsigned char *)v5 + 16) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[3] = LODWORD(self->_y);
    *((unsigned char *)v5 + 16) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)result + 2) = LODWORD(self->_x);
    *((unsigned char *)result + 16) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = LODWORD(self->_y);
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOVLFImagePosition *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_x != *((float *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_y != *((float *)v4 + 3)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOVLFImagePosition *)self readAll:1];
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
  return v9 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (float *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 16);
  if (v4)
  {
    self->_float x = v5[2];
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 16);
  }
  if ((v4 & 2) != 0)
  {
    self->_float y = v5[3];
    *(unsigned char *)&self->_flags |= 2u;
  }
}

@end