@interface GEOScreenDimension
+ (BOOL)isValid:(id)a3;
- (BOOL)hasHeight;
- (BOOL)hasWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOScreenDimension)initWithDictionary:(id)a3;
- (GEOScreenDimension)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (double)height;
- (double)width;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHeight:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)setHeight:(double)a3;
- (void)setWidth:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOScreenDimension

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasWidth
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasHeight
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOScreenDimension;
  v4 = [(GEOScreenDimension *)&v8 description];
  v5 = [(GEOScreenDimension *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOScreenDimension _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 32);
    if ((v5 & 2) != 0)
    {
      v6 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      [v4 setObject:v6 forKey:@"width"];

      char v5 = *(unsigned char *)(a1 + 32);
    }
    if (v5)
    {
      v7 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
      [v4 setObject:v7 forKey:@"height"];
    }
    objc_super v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = [v8 dictionaryRepresentation];
      v10 = v9;
      if (a2)
      {
        v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __48__GEOScreenDimension__dictionaryRepresentation___block_invoke;
        v15[3] = &unk_1E53D8860;
        id v12 = v11;
        id v16 = v12;
        [v10 enumerateKeysAndObjectsUsingBlock:v15];
        id v13 = v12;

        v10 = v13;
      }
      [v4 setObject:v10 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOScreenDimension _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOScreenDimension__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOScreenDimension)initWithDictionary:(id)a3
{
  return (GEOScreenDimension *)-[GEOScreenDimension _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"width"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v4 doubleValue];
        objc_msgSend(a1, "setWidth:");
      }

      id v5 = [v3 objectForKeyedSubscript:@"height"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v5 doubleValue];
        objc_msgSend(a1, "setHeight:");
      }
    }
  }

  return a1;
}

- (GEOScreenDimension)initWithJSON:(id)a3
{
  return (GEOScreenDimension *)-[GEOScreenDimension _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOScreenDimensionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOScreenDimensionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteDoubleField();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOScreenDimension *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = *(void *)&self->_width;
    *((unsigned char *)v5 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[2] = *(void *)&self->_height;
    *((unsigned char *)v5 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(double *)(v4 + 24) = self->_width;
    *(unsigned char *)(v4 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(double *)(v4 + 16) = self->_height;
    *(unsigned char *)(v4 + 32) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOScreenDimension *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_width != *((double *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_height != *((double *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOScreenDimension *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    double width = self->_width;
    double v6 = -width;
    if (width >= 0.0) {
      double v6 = self->_width;
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
  if (flags)
  {
    double height = self->_height;
    double v11 = -height;
    if (height >= 0.0) {
      double v11 = self->_height;
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
  BOOL v5 = (double *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 2) != 0)
  {
    self->_double width = v5[3];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 32);
  }
  if (v4)
  {
    self->_double height = v5[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOScreenDimension *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end