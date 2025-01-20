@interface GEOPrice
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAmount;
- (BOOL)hasCurrencyCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPrice)initWithDictionary:(id)a3;
- (GEOPrice)initWithJSON:(id)a3;
- (NSString)currencyCode;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (double)value;
- (float)amount;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAmount:(float)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setHasAmount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPrice

- (float)amount
{
  return self->_amount;
}

- (void)setAmount:(float)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_amount = a3;
}

- (void)setHasAmount:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAmount
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

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPrice;
  v4 = [(GEOPrice *)&v8 description];
  v5 = [(GEOPrice *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPrice _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 28))
    {
      LODWORD(v5) = *(_DWORD *)(a1 + 24);
      v6 = [NSNumber numberWithFloat:v5];
      [v4 setObject:v6 forKey:@"amount"];
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

    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = [v9 dictionaryRepresentation];
      v11 = v10;
      if (a2)
      {
        v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __38__GEOPrice__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
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
  return -[GEOPrice _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __38__GEOPrice__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPrice)initWithDictionary:(id)a3
{
  return (GEOPrice *)-[GEOPrice _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"amount"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 floatValue];
        objc_msgSend(a1, "setAmount:");
      }

      if (a3) {
        v7 = @"currencyCode";
      }
      else {
        v7 = @"currency_code";
      }
      objc_super v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = (void *)[v8 copy];
        [a1 setCurrencyCode:v9];
      }
    }
  }

  return a1;
}

- (GEOPrice)initWithJSON:(id)a3
{
  return (GEOPrice *)-[GEOPrice _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPriceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPriceReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_currencyCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPrice *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 6) = LODWORD(self->_amount);
    *((unsigned char *)v5 + 28) |= 1u;
  }
  if (self->_currencyCode)
  {
    objc_msgSend(v5, "setCurrencyCode:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(float *)(v5 + 24) = self->_amount;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_currencyCode copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEOPrice *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_amount != *((float *)v4 + 6)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  currencyCode = self->_currencyCode;
  if ((unint64_t)currencyCode | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](currencyCode, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPrice *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    float amount = self->_amount;
    double v5 = amount;
    if (amount < 0.0) {
      double v5 = -amount;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  return [(NSString *)self->_currencyCode hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  double v5 = (float *)a3;
  [v5 readAll:0];
  id v4 = v5;
  if ((_BYTE)v5[7])
  {
    self->_float amount = v5[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 2))
  {
    -[GEOPrice setCurrencyCode:](self, "setCurrencyCode:");
    id v4 = v5;
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
    [(GEOPrice *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (double)value
{
  [(GEOPrice *)self amount];
  return v2;
}

@end