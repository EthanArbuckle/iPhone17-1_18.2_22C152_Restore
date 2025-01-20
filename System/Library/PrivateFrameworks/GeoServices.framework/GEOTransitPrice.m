@interface GEOTransitPrice
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAmountInCents;
- (BOOL)hasCurrencyCode;
- (BOOL)hasSubunit;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitPrice)initWithDictionary:(id)a3;
- (GEOTransitPrice)initWithJSON:(id)a3;
- (NSString)currencyCode;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)amountInCents;
- (unint64_t)hash;
- (unsigned)subunit;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAmountInCents:(int)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setHasAmountInCents:(BOOL)a3;
- (void)setHasSubunit:(BOOL)a3;
- (void)setSubunit:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitPrice

- (int)amountInCents
{
  return self->_amountInCents;
}

- (void)setAmountInCents:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_amountInCents = a3;
}

- (void)setHasAmountInCents:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAmountInCents
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasCurrencyCode
{
  return self->_currencyCode != 0;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (unsigned)subunit
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_subunit;
  }
  else {
    return 100;
  }
}

- (void)setSubunit:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_subunit = a3;
}

- (void)setHasSubunit:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSubunit
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitPrice;
  v4 = [(GEOTransitPrice *)&v8 description];
  v5 = [(GEOTransitPrice *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitPrice _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 32))
    {
      v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 24)];
      if (a2) {
        v6 = @"amountInCents";
      }
      else {
        v6 = @"amount_in_cents";
      }
      [v4 setObject:v5 forKey:v6];
    }
    v7 = [(id)a1 currencyCode];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"currencyCode";
      }
      else {
        objc_super v8 = @"currency_code";
      }
      [v4 setObject:v7 forKey:v8];
    }

    if ((*(unsigned char *)(a1 + 32) & 2) != 0)
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
      [v4 setObject:v9 forKey:@"subunit"];
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
        v17[2] = __45__GEOTransitPrice__dictionaryRepresentation___block_invoke;
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
  return -[GEOTransitPrice _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOTransitPrice__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitPrice)initWithDictionary:(id)a3
{
  return (GEOTransitPrice *)-[GEOTransitPrice _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"amountInCents";
      }
      else {
        v6 = @"amount_in_cents";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAmountInCents:", objc_msgSend(v7, "intValue"));
      }

      if (a3) {
        objc_super v8 = @"currencyCode";
      }
      else {
        objc_super v8 = @"currency_code";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = (void *)[v9 copy];
        [a1 setCurrencyCode:v10];
      }
      v11 = [v5 objectForKeyedSubscript:@"subunit"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSubunit:", objc_msgSend(v11, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOTransitPrice)initWithJSON:(id)a3
{
  return (GEOTransitPrice *)-[GEOTransitPrice _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitPriceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitPriceReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_currencyCode) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOTransitPrice *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    v5[6] = self->_amountInCents;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  if (self->_currencyCode)
  {
    objc_msgSend(v5, "setCurrencyCode:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v4[7] = self->_subunit;
    *((unsigned char *)v4 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_amountInCents;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_currencyCode copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_subunit;
    *(unsigned char *)(v6 + 32) |= 2u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOTransitPrice *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 32);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_amountInCents != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_14;
  }
  currencyCode = self->_currencyCode;
  if ((unint64_t)currencyCode | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](currencyCode, "isEqual:"))
    {
LABEL_14:
      BOOL v8 = 0;
      goto LABEL_15;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 32);
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_subunit != *((_DWORD *)v4 + 7)) {
      goto LABEL_14;
    }
    BOOL v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  [(GEOTransitPrice *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_amountInCents;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_currencyCode hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_subunit;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (int *)a3;
  [v5 readAll:0];
  NSUInteger v4 = v5;
  if (v5[8])
  {
    self->_amountInCents = v5[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 2))
  {
    -[GEOTransitPrice setCurrencyCode:](self, "setCurrencyCode:");
    NSUInteger v4 = v5;
  }
  if ((v4[8] & 2) != 0)
  {
    self->_subunit = v4[7];
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
    [(GEOTransitPrice *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end