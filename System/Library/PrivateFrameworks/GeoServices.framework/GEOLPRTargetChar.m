@interface GEOLPRTargetChar
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCharIndex;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRTargetChar)initWithDictionary:(id)a3;
- (GEOLPRTargetChar)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)charIndex;
- (int)type;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCharIndex:(int)a3;
- (void)setHasCharIndex:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRTargetChar

- (int)type
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53DDB30[a3 - 1];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ANY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ALPHABET"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NUMERIC"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (int)charIndex
{
  return self->_charIndex;
}

- (void)setCharIndex:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_charIndex = a3;
}

- (void)setHasCharIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCharIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRTargetChar;
  int v4 = [(GEOLPRTargetChar *)&v8 description];
  v5 = [(GEOLPRTargetChar *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRTargetChar _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 16);
    if ((v5 & 2) != 0)
    {
      unsigned int v6 = *(_DWORD *)(a1 + 12) - 1;
      if (v6 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 12));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53DDB30[v6];
      }
      [v4 setObject:v7 forKey:@"type"];

      char v5 = *(unsigned char *)(a1 + 16);
    }
    if (v5)
    {
      objc_super v8 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 8)];
      if (a2) {
        v9 = @"charIndex";
      }
      else {
        v9 = @"char_index";
      }
      [v4 setObject:v8 forKey:v9];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRTargetChar _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRTargetChar)initWithDictionary:(id)a3
{
  return (GEOLPRTargetChar *)-[GEOLPRTargetChar _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_21;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_21;
  }
  unsigned int v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"ANY"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"ALPHABET"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"NUMERIC"])
    {
      uint64_t v8 = 3;
    }
    else
    {
      uint64_t v8 = 1;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_14:
    [a1 setType:v8];
  }

  if (a3) {
    v9 = @"charIndex";
  }
  else {
    v9 = @"char_index";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCharIndex:", objc_msgSend(v10, "intValue"));
  }

LABEL_21:
  return a1;
}

- (GEOLPRTargetChar)initWithJSON:(id)a3
{
  return (GEOLPRTargetChar *)-[GEOLPRTargetChar _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRTargetCharIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRTargetCharReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteSint32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLPRTargetChar *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = self->_type;
    *((unsigned char *)v5 + 16) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[2] = self->_charIndex;
    *((unsigned char *)v5 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_type;
    *((unsigned char *)result + 16) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)result + 2) = self->_charIndex;
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
  [(GEOLPRTargetChar *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_type != *((_DWORD *)v4 + 3)) {
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
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_charIndex != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLPRTargetChar *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_type;
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
  uint64_t v4 = 2654435761 * self->_charIndex;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 16);
  if ((v4 & 2) != 0)
  {
    self->_type = v5[3];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 16);
  }
  if (v4)
  {
    self->_charIndex = v5[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end