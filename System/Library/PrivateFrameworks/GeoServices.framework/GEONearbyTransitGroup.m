@interface GEONearbyTransitGroup
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLines;
- (BOOL)hasLinesShown;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEONearbyTransitGroup)initWithDictionary:(id)a3;
- (GEONearbyTransitGroup)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)lines;
- (unsigned)linesShown;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLines:(BOOL)a3;
- (void)setHasLinesShown:(BOOL)a3;
- (void)setLines:(unsigned int)a3;
- (void)setLinesShown:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONearbyTransitGroup

- (unsigned)lines
{
  return self->_lines;
}

- (void)setLines:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_lines = a3;
}

- (void)setHasLines:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLines
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)linesShown
{
  return self->_linesShown;
}

- (void)setLinesShown:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_linesShown = a3;
}

- (void)setHasLinesShown:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLinesShown
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONearbyTransitGroup;
  v4 = [(GEONearbyTransitGroup *)&v8 description];
  v5 = [(GEONearbyTransitGroup *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONearbyTransitGroup _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 16);
    if ((v5 & 2) != 0)
    {
      v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 12)];
      [v4 setObject:v6 forKey:@"lines"];

      char v5 = *(unsigned char *)(a1 + 16);
    }
    if (v5)
    {
      v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 8)];
      if (a2) {
        objc_super v8 = @"linesShown";
      }
      else {
        objc_super v8 = @"lines_shown";
      }
      [v4 setObject:v7 forKey:v8];
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
  return -[GEONearbyTransitGroup _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEONearbyTransitGroup)initWithDictionary:(id)a3
{
  return (GEONearbyTransitGroup *)-[GEONearbyTransitGroup _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"lines"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLines:", objc_msgSend(v6, "unsignedIntValue"));
      }

      if (a3) {
        v7 = @"linesShown";
      }
      else {
        v7 = @"lines_shown";
      }
      objc_super v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLinesShown:", objc_msgSend(v8, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEONearbyTransitGroup)initWithJSON:(id)a3
{
  return (GEONearbyTransitGroup *)-[GEONearbyTransitGroup _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONearbyTransitGroupIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONearbyTransitGroupReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEONearbyTransitGroup *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = self->_lines;
    *((unsigned char *)v5 + 16) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[2] = self->_linesShown;
    *((unsigned char *)v5 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_lines;
    *((unsigned char *)result + 16) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)result + 2) = self->_linesShown;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEONearbyTransitGroup *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_lines != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_linesShown != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEONearbyTransitGroup *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_lines;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_linesShown;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (unsigned int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 16);
  if ((v4 & 2) != 0)
  {
    self->_lines = v5[3];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 16);
  }
  if (v4)
  {
    self->_linesShown = v5[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end