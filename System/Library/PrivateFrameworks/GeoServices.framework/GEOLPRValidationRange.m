@interface GEOLPRValidationRange
+ (BOOL)isValid:(id)a3;
- (BOOL)hasEnd;
- (BOOL)hasStart;
- (BOOL)hasValidCharacters;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRValidationRange)initWithDictionary:(id)a3;
- (GEOLPRValidationRange)initWithJSON:(id)a3;
- (NSString)validCharacters;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)end;
- (int)start;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEnd:(int)a3;
- (void)setHasEnd:(BOOL)a3;
- (void)setHasStart:(BOOL)a3;
- (void)setStart:(int)a3;
- (void)setValidCharacters:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRValidationRange

- (int)start
{
  return self->_start;
}

- (void)setStart:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_start = a3;
}

- (void)setHasStart:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStart
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)end
{
  return self->_end;
}

- (void)setEnd:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_end = a3;
}

- (void)setHasEnd:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEnd
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasValidCharacters
{
  return self->_validCharacters != 0;
}

- (NSString)validCharacters
{
  return self->_validCharacters;
}

- (void)setValidCharacters:(id)a3
{
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRValidationRange;
  v4 = [(GEOLPRValidationRange *)&v8 description];
  v5 = [(GEOLPRValidationRange *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRValidationRange _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 24);
    if ((v5 & 2) != 0)
    {
      v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 20)];
      [v4 setObject:v6 forKey:@"start"];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if (v5)
    {
      v7 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 16)];
      [v4 setObject:v7 forKey:@"end"];
    }
    objc_super v8 = [(id)a1 validCharacters];
    if (v8)
    {
      if (a2) {
        v9 = @"validCharacters";
      }
      else {
        v9 = @"valid_characters";
      }
      [v4 setObject:v8 forKey:v9];
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
  return -[GEOLPRValidationRange _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRValidationRange)initWithDictionary:(id)a3
{
  return (GEOLPRValidationRange *)-[GEOLPRValidationRange _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"start"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStart:", objc_msgSend(v6, "intValue"));
      }

      v7 = [v5 objectForKeyedSubscript:@"end"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setEnd:", objc_msgSend(v7, "intValue"));
      }

      if (a3) {
        objc_super v8 = @"validCharacters";
      }
      else {
        objc_super v8 = @"valid_characters";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = (void *)[v9 copy];
        [a1 setValidCharacters:v10];
      }
    }
  }

  return a1;
}

- (GEOLPRValidationRange)initWithJSON:(id)a3
{
  return (GEOLPRValidationRange *)-[GEOLPRValidationRange _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRValidationRangeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRValidationRangeReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteSint32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteSint32Field();
    id v4 = v6;
  }
  if (self->_validCharacters)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEOLPRValidationRange *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 5) = self->_start;
    *((unsigned char *)v6 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v6 + 4) = self->_end;
    *((unsigned char *)v6 + 24) |= 1u;
  }
  if (self->_validCharacters)
  {
    objc_msgSend(v6, "setValidCharacters:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_start;
    *(unsigned char *)(v5 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 16) = self->_end;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_validCharacters copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOLPRValidationRange *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_start != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_end != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_14;
  }
  validCharacters = self->_validCharacters;
  if ((unint64_t)validCharacters | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](validCharacters, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLPRValidationRange *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_start;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3 ^ [(NSString *)self->_validCharacters hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_end;
  return v4 ^ v3 ^ [(NSString *)self->_validCharacters hash];
}

- (void)mergeFrom:(id)a3
{
  char v6 = (int *)a3;
  [v6 readAll:0];
  uint64_t v4 = v6;
  char v5 = *((unsigned char *)v6 + 24);
  if ((v5 & 2) != 0)
  {
    self->_start = v6[5];
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v6 + 24);
  }
  if (v5)
  {
    self->_end = v6[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v6 + 1))
  {
    -[GEOLPRValidationRange setValidCharacters:](self, "setValidCharacters:");
    uint64_t v4 = v6;
  }
}

- (void).cxx_destruct
{
}

@end