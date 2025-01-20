@interface GEOPDSInferredValue
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)setAttribute:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSInferredValue

- (void)setAttribute:(uint64_t)a1
{
  id v4 = a2;
  objc_storeStrong((id *)(a1 + 16), a2);
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSInferredValue;
  id v4 = [(GEOPDSInferredValue *)&v8 description];
  v5 = [(GEOPDSInferredValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSInferredValue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 36);
    if (v5)
    {
      uint64_t v6 = *(int *)(a1 + 24);
      if (v6 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53DD9E8[v6];
      }
      if (a2) {
        objc_super v8 = @"priceRange";
      }
      else {
        objc_super v8 = @"price_range";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 36);
    }
    if ((v5 & 2) != 0)
    {
      uint64_t v9 = *(int *)(a1 + 28);
      if (v9 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 28));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53DDA10[v9];
      }
      if (a2) {
        v11 = @"tradingHours";
      }
      else {
        v11 = @"trading_hours";
      }
      [v4 setObject:v10 forKey:v11];
    }
    id v12 = *(id *)(a1 + 16);
    v13 = v12;
    if (v12)
    {
      if (a2) {
        [v12 jsonRepresentation];
      }
      else {
      v14 = [v12 dictionaryRepresentation];
      }
      [v4 setObject:v14 forKey:@"attribute"];
    }
    if ((*(unsigned char *)(a1 + 36) & 4) != 0)
    {
      v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
      if (a2) {
        v16 = @"negateInferredValue";
      }
      else {
        v16 = @"negate_inferred_value";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = *(void **)(a1 + 8);
    if (v17)
    {
      v18 = [v17 dictionaryRepresentation];
      v19 = v18;
      if (a2)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __49__GEOPDSInferredValue__dictionaryRepresentation___block_invoke;
        v24[3] = &unk_1E53D8860;
        id v21 = v20;
        id v25 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];
        id v22 = v21;

        v19 = v22;
      }
      [v4 setObject:v19 forKey:@"Unknown Fields"];
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
  return -[GEOPDSInferredValue _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOPDSInferredValue__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
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
  return GEOPDSInferredValueReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_attribute) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_priceRange;
    *(unsigned char *)(v5 + 36) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_tradingHours;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
  id v8 = [(GEOPDSRawAttribute *)self->_attribute copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(unsigned char *)(v6 + 32) = self->_negateInferredValue;
    *(unsigned char *)(v6 + 36) |= 4u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 36);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_priceRange != *((_DWORD *)v4 + 6)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_tradingHours != *((_DWORD *)v4 + 7)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_17;
  }
  attribute = self->_attribute;
  if ((unint64_t)attribute | *((void *)v4 + 2))
  {
    if (!-[GEOPDSRawAttribute isEqual:](attribute, "isEqual:")) {
      goto LABEL_17;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 36);
  }
  BOOL v8 = (v6 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) != 0)
    {
      if (self->_negateInferredValue)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_17;
        }
      }
      else if (*((unsigned char *)v4 + 32))
      {
        goto LABEL_17;
      }
      BOOL v8 = 1;
      goto LABEL_18;
    }
LABEL_17:
    BOOL v8 = 0;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_priceRange;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_tradingHours;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = [(GEOPDSRawAttribute *)self->_attribute hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_negateInferredValue;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribute, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end