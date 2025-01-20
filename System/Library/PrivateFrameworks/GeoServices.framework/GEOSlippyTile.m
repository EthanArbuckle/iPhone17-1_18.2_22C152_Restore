@interface GEOSlippyTile
+ (BOOL)isValid:(id)a3;
- (BOOL)hasX;
- (BOOL)hasY;
- (BOOL)hasZ;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSlippyTile)initWithDictionary:(id)a3;
- (GEOSlippyTile)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)x;
- (unsigned)y;
- (unsigned)z;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasX:(BOOL)a3;
- (void)setHasY:(BOOL)a3;
- (void)setHasZ:(BOOL)a3;
- (void)setX:(unsigned int)a3;
- (void)setY:(unsigned int)a3;
- (void)setZ:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSlippyTile

- (unsigned)x
{
  return self->_x;
}

- (void)setX:(unsigned int)a3
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

- (unsigned)y
{
  return self->_y;
}

- (void)setY:(unsigned int)a3
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

- (unsigned)z
{
  return self->_z;
}

- (void)setZ:(unsigned int)a3
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
  v8.super_class = (Class)GEOSlippyTile;
  v4 = [(GEOSlippyTile *)&v8 description];
  v5 = [(GEOSlippyTile *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSlippyTile _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_10;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 28);
  if (v5)
  {
    v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
    [v4 setObject:v14 forKey:@"x"];

    char v5 = *(unsigned char *)(a1 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_4:
      if ((v5 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)(a1 + 28) & 2) == 0)
  {
    goto LABEL_4;
  }
  v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
  [v4 setObject:v15 forKey:@"y"];

  if ((*(unsigned char *)(a1 + 28) & 4) != 0)
  {
LABEL_5:
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    [v4 setObject:v6 forKey:@"z"];
  }
LABEL_6:
  v7 = *(void **)(a1 + 8);
  if (v7)
  {
    objc_super v8 = [v7 dictionaryRepresentation];
    v9 = v8;
    if (a2)
    {
      v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __43__GEOSlippyTile__dictionaryRepresentation___block_invoke;
      v16[3] = &unk_1E53D8860;
      id v11 = v10;
      id v17 = v11;
      [v9 enumerateKeysAndObjectsUsingBlock:v16];
      id v12 = v11;

      v9 = v12;
    }
    [v4 setObject:v9 forKey:@"Unknown Fields"];
  }
LABEL_10:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSlippyTile _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __43__GEOSlippyTile__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSlippyTile)initWithDictionary:(id)a3
{
  return (GEOSlippyTile *)-[GEOSlippyTile _initWithDictionary:isJSON:](self, a3);
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

      id v5 = [v3 objectForKeyedSubscript:@"y"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setY:", objc_msgSend(v5, "unsignedIntValue"));
      }

      v6 = [v3 objectForKeyedSubscript:@"z"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setZ:", objc_msgSend(v6, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOSlippyTile)initWithJSON:(id)a3
{
  return (GEOSlippyTile *)-[GEOSlippyTile _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSlippyTileIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSlippyTileReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteUint32Field();
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
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOSlippyTile *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[4] = self->_x;
    *((unsigned char *)v5 + 28) |= 1u;
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
  v5[5] = self->_y;
  *((unsigned char *)v5 + 28) |= 2u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    v5[6] = self->_z;
    *((unsigned char *)v5 + 28) |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v4 + 20) = self->_y;
    *(unsigned char *)(v4 + 28) |= 2u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 16) = self->_x;
  *(unsigned char *)(v4 + 28) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v4 + 24) = self->_z;
    *(unsigned char *)(v4 + 28) |= 4u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOSlippyTile *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_x != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_y != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_z != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  [(GEOSlippyTile *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v3 = 2654435761 * self->_x;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_y;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_z;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (unsigned int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 28);
  if (v4)
  {
    self->_x = v5[4];
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 28);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5[7] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_y = v5[5];
  *(unsigned char *)&self->_flags |= 2u;
  if ((v5[7] & 4) != 0)
  {
LABEL_4:
    self->_z = v5[6];
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_5:
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
    [(GEOSlippyTile *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end