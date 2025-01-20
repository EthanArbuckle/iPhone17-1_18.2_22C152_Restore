@interface GEOInterpolationParameters
+ (BOOL)isValid:(id)a3;
- (BOOL)hasFractionalDistance;
- (BOOL)hasSideOfLine;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOInterpolationParameters)initWithDictionary:(id)a3;
- (GEOInterpolationParameters)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (double)fractionalDistance;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)sideOfLine;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFractionalDistance:(double)a3;
- (void)setHasFractionalDistance:(BOOL)a3;
- (void)setHasSideOfLine:(BOOL)a3;
- (void)setSideOfLine:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOInterpolationParameters

- (double)fractionalDistance
{
  return self->_fractionalDistance;
}

- (void)setFractionalDistance:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_fractionalDistance = a3;
}

- (void)setHasFractionalDistance:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFractionalDistance
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)sideOfLine
{
  return self->_sideOfLine;
}

- (void)setSideOfLine:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_sideOfLine = a3;
}

- (void)setHasSideOfLine:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSideOfLine
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOInterpolationParameters;
  v4 = [(GEOInterpolationParameters *)&v8 description];
  v5 = [(GEOInterpolationParameters *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOInterpolationParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 28);
    if (v5)
    {
      v6 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
      if (a2) {
        v7 = @"fractionalDistance";
      }
      else {
        v7 = @"fractional_distance";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 28);
    }
    if ((v5 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      if (a2) {
        v9 = @"sideOfLine";
      }
      else {
        v9 = @"side_of_line";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = [v10 dictionaryRepresentation];
      v12 = v11;
      if (a2)
      {
        v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __56__GEOInterpolationParameters__dictionaryRepresentation___block_invoke;
        v17[3] = &unk_1E53D8860;
        id v14 = v13;
        id v18 = v14;
        [v12 enumerateKeysAndObjectsUsingBlock:v17];
        id v15 = v14;

        v12 = v15;
      }
      [v4 setObject:v12 forKey:@"Unknown Fields"];
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
  return -[GEOInterpolationParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOInterpolationParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOInterpolationParameters)initWithDictionary:(id)a3
{
  return (GEOInterpolationParameters *)-[GEOInterpolationParameters _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"fractionalDistance";
      }
      else {
        v6 = @"fractional_distance";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 doubleValue];
        objc_msgSend(a1, "setFractionalDistance:");
      }

      if (a3) {
        objc_super v8 = @"sideOfLine";
      }
      else {
        objc_super v8 = @"side_of_line";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSideOfLine:", objc_msgSend(v9, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOInterpolationParameters)initWithJSON:(id)a3
{
  return (GEOInterpolationParameters *)-[GEOInterpolationParameters _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOInterpolationParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOInterpolationParametersReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteDoubleField();
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOInterpolationParameters *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[2] = *(void *)&self->_fractionalDistance;
    *((unsigned char *)v5 + 28) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_sideOfLine;
    *((unsigned char *)v5 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(double *)(v4 + 16) = self->_fractionalDistance;
    *(unsigned char *)(v4 + 28) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 24) = self->_sideOfLine;
    *(unsigned char *)(v4 + 28) |= 2u;
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
  [(GEOInterpolationParameters *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_fractionalDistance != *((double *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_sideOfLine != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOInterpolationParameters *)self readAll:1];
  char flags = (char)self->_flags;
  if (flags)
  {
    double fractionalDistance = self->_fractionalDistance;
    double v6 = -fractionalDistance;
    if (fractionalDistance >= 0.0) {
      double v6 = self->_fractionalDistance;
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
  if ((flags & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_sideOfLine;
  }
  else {
    uint64_t v9 = 0;
  }
  return v9 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 28);
  if (v4)
  {
    self->_double fractionalDistance = *((double *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 28);
  }
  if ((v4 & 2) != 0)
  {
    self->_sideOfLine = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_flags |= 2u;
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
    [(GEOInterpolationParameters *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end