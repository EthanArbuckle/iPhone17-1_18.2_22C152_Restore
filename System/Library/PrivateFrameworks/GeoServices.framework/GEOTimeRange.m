@interface GEOTimeRange
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTimeRange)initWithPlaceDataTimeRange:(GEOPDLocalTimeRange *)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOTimeRange

- (GEOTimeRange)initWithPlaceDataTimeRange:(GEOPDLocalTimeRange *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GEOTimeRange;
  v4 = [(GEOTimeRange *)&v11 init];
  v5 = v4;
  if (v4)
  {
    char var2 = (char)a3->var2;
    if (var2)
    {
      unsigned int var0 = a3->var0;
      *(unsigned char *)&v4->_flags |= 1u;
      v4->_from = var0;
      char var2 = (char)a3->var2;
    }
    if ((var2 & 2) != 0)
    {
      unsigned int var1 = a3->var1;
      *(unsigned char *)&v4->_flags |= 2u;
      v4->_to = var1;
    }
    v9 = v4;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTimeRange;
  v4 = [(GEOTimeRange *)&v8 description];
  v5 = [(GEOTimeRange *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTimeRange _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 24);
    if (v5)
    {
      v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
      [v4 setObject:v6 forKey:@"from"];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if ((v5 & 2) != 0)
    {
      v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
      [v4 setObject:v7 forKey:@"to"];
    }
    objc_super v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = [v8 dictionaryRepresentation];
      v10 = v9;
      if (a2)
      {
        objc_super v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __42__GEOTimeRange__dictionaryRepresentation___block_invoke;
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
  return -[GEOTimeRange _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __42__GEOTimeRange__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOTimeRangeReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v4 + 16) = self->_from;
    *(unsigned char *)(v4 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 20) = self->_to;
    *(unsigned char *)(v4 + 24) |= 2u;
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
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_from != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_to != *((_DWORD *)v4 + 5)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v2 = 2654435761 * self->_from;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_to;
  return v3 ^ v2;
}

- (void).cxx_destruct
{
}

@end