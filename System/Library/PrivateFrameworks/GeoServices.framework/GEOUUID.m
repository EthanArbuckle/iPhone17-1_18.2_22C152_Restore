@interface GEOUUID
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(uint64_t)a1 isJSON:(void *)a2;
- (unint64_t)hash;
- (void)mergeFrom:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOUUID

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOUUID;
  v4 = [(GEOUUID *)&v8 description];
  v5 = [(GEOUUID *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOUUID _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 32);
    if (v5)
    {
      v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
      [v4 setObject:v6 forKey:@"high"];

      char v5 = *(unsigned char *)(a1 + 32);
    }
    if ((v5 & 2) != 0)
    {
      v7 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      [v4 setObject:v7 forKey:@"low"];
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
        v15[2] = __37__GEOUUID__dictionaryRepresentation___block_invoke;
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
  return -[GEOUUID _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __37__GEOUUID__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(uint64_t)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"high"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v5 = [v4 unsignedLongLongValue];
        *(unsigned char *)(a1 + 32) |= 1u;
        *(void *)(a1 + 16) = v5;
      }

      v6 = [v3 objectForKeyedSubscript:@"low"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [v6 unsignedLongLongValue];
        *(unsigned char *)(a1 + 32) |= 2u;
        *(void *)(a1 + 24) = v7;
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOUUIDReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteUint64Field();
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0) {
    PBDataWriterWriteUint64Field();
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
    *(void *)(v4 + 16) = self->_high;
    *(unsigned char *)(v4 + 32) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(void *)(v4 + 24) = self->_low;
    *(unsigned char *)(v4 + 32) |= 2u;
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
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_high != *((void *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_low != *((void *)v4 + 3)) {
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
    unint64_t v2 = 2654435761u * self->_high;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2;
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_low;
  return v3 ^ v2;
}

- (void)mergeFrom:(uint64_t)a1
{
  unint64_t v3 = a2;
  if (a1)
  {
    char v4 = v3[32];
    if (v4)
    {
      *(void *)(a1 + 16) = *((void *)v3 + 2);
      *(unsigned char *)(a1 + 32) |= 1u;
      char v4 = v3[32];
    }
    if ((v4 & 2) != 0)
    {
      *(void *)(a1 + 24) = *((void *)v3 + 3);
      *(unsigned char *)(a1 + 32) |= 2u;
    }
  }
}

- (void).cxx_destruct
{
}

@end