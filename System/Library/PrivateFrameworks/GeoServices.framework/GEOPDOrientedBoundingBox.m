@interface GEOPDOrientedBoundingBox
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDepth;
- (BOOL)hasHeight;
- (BOOL)hasPosition;
- (BOOL)hasWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDOrientedBoundingBox)initWithDictionary:(id)a3;
- (GEOPDOrientedBoundingBox)initWithJSON:(id)a3;
- (GEOPDOrientedPosition)position;
- (double)depth;
- (double)height;
- (double)width;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDepth:(double)a3;
- (void)setHasDepth:(BOOL)a3;
- (void)setHasHeight:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)setHeight:(double)a3;
- (void)setPosition:(id)a3;
- (void)setWidth:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDOrientedBoundingBox

- (BOOL)hasPosition
{
  return self->_position != 0;
}

- (GEOPDOrientedPosition)position
{
  return self->_position;
}

- (void)setPosition:(id)a3
{
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasWidth
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHeight
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)depth
{
  return self->_depth;
}

- (void)setDepth:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_depth = a3;
}

- (void)setHasDepth:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDepth
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDOrientedBoundingBox;
  v4 = [(GEOPDOrientedBoundingBox *)&v8 description];
  v5 = [(GEOPDOrientedBoundingBox *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDOrientedBoundingBox _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_14;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 position];
  v6 = v5;
  if (v5)
  {
    if (a2) {
      [v5 jsonRepresentation];
    }
    else {
    v7 = [v5 dictionaryRepresentation];
    }
    [v4 setObject:v7 forKey:@"position"];
  }
  char v8 = *(unsigned char *)(a1 + 40);
  if ((v8 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 40) & 2) == 0) {
      goto LABEL_9;
    }
LABEL_12:
    v10 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
    [v4 setObject:v10 forKey:@"height"];

    if ((*(unsigned char *)(a1 + 40) & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v9 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  [v4 setObject:v9 forKey:@"width"];

  char v8 = *(unsigned char *)(a1 + 40);
  if ((v8 & 2) != 0) {
    goto LABEL_12;
  }
LABEL_9:
  if (v8)
  {
LABEL_13:
    v11 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
    [v4 setObject:v11 forKey:@"depth"];
  }
LABEL_14:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDOrientedBoundingBox _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDOrientedBoundingBox)initWithDictionary:(id)a3
{
  return (GEOPDOrientedBoundingBox *)-[GEOPDOrientedBoundingBox _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"position"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [GEOPDOrientedPosition alloc];
        if (a3) {
          uint64_t v8 = [(GEOPDOrientedPosition *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOPDOrientedPosition *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setPosition:v8];
      }
      v10 = [v5 objectForKeyedSubscript:@"width"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v10 doubleValue];
        objc_msgSend(a1, "setWidth:");
      }

      v11 = [v5 objectForKeyedSubscript:@"height"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v11 doubleValue];
        objc_msgSend(a1, "setHeight:");
      }

      v12 = [v5 objectForKeyedSubscript:@"depth"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 doubleValue];
        objc_msgSend(a1, "setDepth:");
      }
    }
  }

  return a1;
}

- (GEOPDOrientedBoundingBox)initWithJSON:(id)a3
{
  return (GEOPDOrientedBoundingBox *)-[GEOPDOrientedBoundingBox _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDOrientedBoundingBoxIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDOrientedBoundingBoxReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_position)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
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
  [(GEOPDOrientedBoundingBox *)self readAll:0];
  if (self->_position) {
    objc_msgSend(v5, "setPosition:");
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((void *)v5 + 4) = *(void *)&self->_width;
    *((unsigned char *)v5 + 40) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v5 + 2) = *(void *)&self->_height;
  *((unsigned char *)v5 + 40) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_6:
    *((void *)v5 + 1) = *(void *)&self->_depth;
    *((unsigned char *)v5 + 40) |= 1u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOPDOrientedPosition *)self->_position copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(double *)(v5 + 16) = self->_height;
    *(unsigned char *)(v5 + 40) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(double *)(v5 + 32) = self->_width;
  *(unsigned char *)(v5 + 40) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_depth;
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
  [(GEOPDOrientedBoundingBox *)self readAll:1];
  [v4 readAll:1];
  position = self->_position;
  if ((unint64_t)position | *((void *)v4 + 3))
  {
    if (!-[GEOPDOrientedPosition isEqual:](position, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_width != *((double *)v4 + 4)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_height != *((double *)v4 + 2)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_depth != *((double *)v4 + 1)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPDOrientedBoundingBox *)self readAll:1];
  unint64_t v3 = [(GEOPDOrientedPosition *)self->_position hash];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    double width = self->_width;
    double v7 = -width;
    if (width >= 0.0) {
      double v7 = self->_width;
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
  if ((flags & 2) != 0)
  {
    double height = self->_height;
    double v12 = -height;
    if (height >= 0.0) {
      double v12 = self->_height;
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
    double depth = self->_depth;
    double v17 = -depth;
    if (depth >= 0.0) {
      double v17 = self->_depth;
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
  double v7 = (double *)a3;
  [v7 readAll:0];
  position = self->_position;
  uint64_t v5 = *((void *)v7 + 3);
  if (position)
  {
    if (v5) {
      -[GEOPDOrientedPosition mergeFrom:](position, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOPDOrientedBoundingBox setPosition:](self, "setPosition:");
  }
  char v6 = *((unsigned char *)v7 + 40);
  if ((v6 & 4) != 0)
  {
    self->_double width = v7[4];
    *(unsigned char *)&self->_flags |= 4u;
    char v6 = *((unsigned char *)v7 + 40);
    if ((v6 & 2) == 0)
    {
LABEL_8:
      if ((v6 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if (((_BYTE)v7[5] & 2) == 0)
  {
    goto LABEL_8;
  }
  self->_double height = v7[2];
  *(unsigned char *)&self->_flags |= 2u;
  if ((_BYTE)v7[5])
  {
LABEL_9:
    self->_double depth = v7[1];
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_10:
}

- (void).cxx_destruct
{
}

@end