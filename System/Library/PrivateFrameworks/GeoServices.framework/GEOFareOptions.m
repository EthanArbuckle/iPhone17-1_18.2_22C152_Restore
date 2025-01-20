@interface GEOFareOptions
+ (BOOL)isValid:(id)a3;
- (BOOL)hasPaymentType;
- (BOOL)hasPreferredSurchargeType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFareOptions)initWithDictionary:(id)a3;
- (GEOFareOptions)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)paymentTypeAsString:(int)a3;
- (int)StringAsPaymentType:(id)a3;
- (int)paymentType;
- (int)preferredSurchargeType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPaymentType:(BOOL)a3;
- (void)setHasPreferredSurchargeType:(BOOL)a3;
- (void)setPaymentType:(int)a3;
- (void)setPreferredSurchargeType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOFareOptions

- (void)setPaymentType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_paymentType = a3;
}

- (void).cxx_destruct
{
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteInt32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (int)preferredSurchargeType
{
  return self->_preferredSurchargeType;
}

- (void)setPreferredSurchargeType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_preferredSurchargeType = a3;
}

- (void)setHasPreferredSurchargeType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasPreferredSurchargeType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)paymentType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_paymentType;
  }
  else {
    return 0;
  }
}

- (void)setHasPaymentType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasPaymentType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)paymentTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"PAYMENT_TYPE_IC_CARD";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"PAYMENT_TYPE_UNKNOWN";
  }
  return v4;
}

- (int)StringAsPaymentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PAYMENT_TYPE_UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"PAYMENT_TYPE_IC_CARD"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOFareOptions;
  int v4 = [(GEOFareOptions *)&v8 description];
  id v5 = [(GEOFareOptions *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOFareOptions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 24);
    if ((v5 & 2) != 0)
    {
      v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 20)];
      if (a2) {
        v7 = @"preferredSurchargeType";
      }
      else {
        v7 = @"preferred_surcharge_type";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if (v5)
    {
      int v8 = *(_DWORD *)(a1 + 16);
      if (v8)
      {
        if (v8 == 1)
        {
          v9 = @"PAYMENT_TYPE_IC_CARD";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 16));
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v9 = @"PAYMENT_TYPE_UNKNOWN";
      }
      if (a2) {
        v10 = @"paymentType";
      }
      else {
        v10 = @"payment_type";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __44__GEOFareOptions__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOFareOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOFareOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    int v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    int v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOFareOptions)initWithDictionary:(id)a3
{
  return (GEOFareOptions *)-[GEOFareOptions _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"preferredSurchargeType";
      }
      else {
        v6 = @"preferred_surcharge_type";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setPreferredSurchargeType:", objc_msgSend(v7, "intValue"));
      }

      if (a3) {
        int v8 = @"paymentType";
      }
      else {
        int v8 = @"payment_type";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;
        if ([v10 isEqualToString:@"PAYMENT_TYPE_UNKNOWN"]) {
          uint64_t v11 = 0;
        }
        else {
          uint64_t v11 = [v10 isEqualToString:@"PAYMENT_TYPE_IC_CARD"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_19:

          goto LABEL_20;
        }
        uint64_t v11 = [v9 intValue];
      }
      [a1 setPaymentType:v11];
      goto LABEL_19;
    }
  }
LABEL_20:

  return a1;
}

- (GEOFareOptions)initWithJSON:(id)a3
{
  return (GEOFareOptions *)-[GEOFareOptions _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOFareOptionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOFareOptionsReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOFareOptions *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[5] = self->_preferredSurchargeType;
    *((unsigned char *)v5 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[4] = self->_paymentType;
    *((unsigned char *)v5 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 20) = self->_preferredSurchargeType;
    *(unsigned char *)(v4 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v4 + 16) = self->_paymentType;
    *(unsigned char *)(v4 + 24) |= 1u;
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
  [(GEOFareOptions *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_preferredSurchargeType != *((_DWORD *)v4 + 5)) {
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
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_paymentType != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOFareOptions *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_preferredSurchargeType;
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
  uint64_t v4 = 2654435761 * self->_paymentType;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 2) != 0)
  {
    self->_preferredSurchargeType = v5[5];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 24);
  }
  if (v4)
  {
    self->_paymentType = v5[4];
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
    [(GEOFareOptions *)self readAll:0];
  }
}

@end