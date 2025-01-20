@interface GEOTraitsPhotoSize
+ (BOOL)isValid:(id)a3;
- (BOOL)hasHeight;
- (BOOL)hasWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTraitsPhotoSize)initWithDictionary:(id)a3;
- (GEOTraitsPhotoSize)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)height;
- (unsigned)width;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHeight:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)setHeight:(unsigned int)a3;
- (void)setWidth:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTraitsPhotoSize

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 20) = self->_width;
    *(unsigned char *)(v4 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v4 + 16) = self->_height;
    *(unsigned char *)(v4 + 24) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteUint32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOTraitsPhotoSize *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_width != *((_DWORD *)v4 + 5)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_height != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (void)setWidth:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_width = a3;
}

- (void)setHeight:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_height = a3;
}

- (unsigned)width
{
  return self->_width;
}

- (unsigned)height
{
  return self->_height;
}

- (void)setHasWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasWidth
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)setHasHeight:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasHeight
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTraitsPhotoSize;
  id v4 = [(GEOTraitsPhotoSize *)&v8 description];
  BOOL v5 = [(GEOTraitsPhotoSize *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTraitsPhotoSize _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 24);
    if ((v5 & 2) != 0)
    {
      v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
      [v4 setObject:v6 forKey:@"width"];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if (v5)
    {
      v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
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
        v15[2] = __48__GEOTraitsPhotoSize__dictionaryRepresentation___block_invoke;
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
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTraitsPhotoSize _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOTraitsPhotoSize__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTraitsPhotoSize)initWithDictionary:(id)a3
{
  return (GEOTraitsPhotoSize *)-[GEOTraitsPhotoSize _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v4 = [v3 objectForKeyedSubscript:@"width"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setWidth:", objc_msgSend(v4, "unsignedIntValue"));
      }

      id v5 = [v3 objectForKeyedSubscript:@"height"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHeight:", objc_msgSend(v5, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOTraitsPhotoSize)initWithJSON:(id)a3
{
  return (GEOTraitsPhotoSize *)-[GEOTraitsPhotoSize _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTraitsPhotoSizeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTraitsPhotoSizeReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOTraitsPhotoSize *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[5] = self->_width;
    *((unsigned char *)v5 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[4] = self->_height;
    *((unsigned char *)v5 + 24) |= 1u;
  }
}

- (unint64_t)hash
{
  [(GEOTraitsPhotoSize *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_width;
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
  uint64_t v4 = 2654435761 * self->_height;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v5 = (unsigned int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 2) != 0)
  {
    self->_width = v5[5];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 24);
  }
  if (v4)
  {
    self->_height = v5[4];
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
    [(GEOTraitsPhotoSize *)self readAll:0];
  }
}

@end