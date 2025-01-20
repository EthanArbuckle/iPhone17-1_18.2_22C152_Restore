@interface GEOTransitSurcharge
+ (BOOL)isValid:(id)a3;
+ (Class)surchargeUnitType;
- (BOOL)hasNumberOfLegs;
- (BOOL)hasPaymentType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitSurcharge)initWithDictionary:(id)a3;
- (GEOTransitSurcharge)initWithJSON:(id)a3;
- (NSMutableArray)surchargeUnits;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)paymentTypeAsString:(int)a3;
- (id)surchargeUnitAtIndex:(unint64_t)a3;
- (int)StringAsPaymentType:(id)a3;
- (int)paymentType;
- (unint64_t)hash;
- (unint64_t)surchargeUnitsCount;
- (unsigned)numberOfLegs;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addSurchargeUnit:(id)a3;
- (void)clearSurchargeUnits;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNumberOfLegs:(BOOL)a3;
- (void)setHasPaymentType:(BOOL)a3;
- (void)setNumberOfLegs:(unsigned int)a3;
- (void)setPaymentType:(int)a3;
- (void)setSurchargeUnits:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitSurcharge

- (NSMutableArray)surchargeUnits
{
  return self->_surchargeUnits;
}

- (void)setSurchargeUnits:(id)a3
{
}

- (void)clearSurchargeUnits
{
}

- (void)addSurchargeUnit:(id)a3
{
  id v4 = a3;
  surchargeUnits = self->_surchargeUnits;
  id v8 = v4;
  if (!surchargeUnits)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_surchargeUnits;
    self->_surchargeUnits = v6;

    id v4 = v8;
    surchargeUnits = self->_surchargeUnits;
  }
  [(NSMutableArray *)surchargeUnits addObject:v4];
}

- (unint64_t)surchargeUnitsCount
{
  return [(NSMutableArray *)self->_surchargeUnits count];
}

- (id)surchargeUnitAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_surchargeUnits objectAtIndex:a3];
}

+ (Class)surchargeUnitType
{
  return (Class)objc_opt_class();
}

- (int)paymentType
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_paymentType;
  }
  else {
    return 0;
  }
}

- (void)setPaymentType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_paymentType = a3;
}

- (void)setHasPaymentType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasPaymentType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)paymentTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"PAYMENT_TYPE_IC_CARD";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"PAYMENT_TYPE_UNKNOWN";
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

- (unsigned)numberOfLegs
{
  if (*(unsigned char *)&self->_flags) {
    return self->_numberOfLegs;
  }
  else {
    return 1;
  }
}

- (void)setNumberOfLegs:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_numberOfLegs = a3;
}

- (void)setHasNumberOfLegs:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasNumberOfLegs
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitSurcharge;
  int v4 = [(GEOTransitSurcharge *)&v8 description];
  v5 = [(GEOTransitSurcharge *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitSurcharge _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 16) count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v6 = *(id *)(a1 + 16);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v30 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"surchargeUnit";
      }
      else {
        v13 = @"surcharge_unit";
      }
      [v4 setObject:v5 forKey:v13];
    }
    char v14 = *(unsigned char *)(a1 + 32);
    if ((v14 & 2) != 0)
    {
      int v15 = *(_DWORD *)(a1 + 28);
      if (v15)
      {
        if (v15 == 1)
        {
          v16 = @"PAYMENT_TYPE_IC_CARD";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 28));
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v16 = @"PAYMENT_TYPE_UNKNOWN";
      }
      if (a2) {
        v17 = @"paymentType";
      }
      else {
        v17 = @"payment_type";
      }
      [v4 setObject:v16 forKey:v17];

      char v14 = *(unsigned char *)(a1 + 32);
    }
    if (v14)
    {
      v18 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      if (a2) {
        v19 = @"numberOfLegs";
      }
      else {
        v19 = @"number_of_legs";
      }
      [v4 setObject:v18 forKey:v19];
    }
    v20 = *(void **)(a1 + 8);
    if (v20)
    {
      v21 = [v20 dictionaryRepresentation];
      v22 = v21;
      if (a2)
      {
        v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __49__GEOTransitSurcharge__dictionaryRepresentation___block_invoke;
        v27[3] = &unk_1E53D8860;
        id v24 = v23;
        id v28 = v24;
        [v22 enumerateKeysAndObjectsUsingBlock:v27];
        id v25 = v24;

        v22 = v25;
      }
      [v4 setObject:v22 forKey:@"Unknown Fields"];
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
  return -[GEOTransitSurcharge _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOTransitSurcharge__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOTransitSurcharge)initWithDictionary:(id)a3
{
  return (GEOTransitSurcharge *)-[GEOTransitSurcharge _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_37;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_37;
  }
  if (a3) {
    id v6 = @"surchargeUnit";
  }
  else {
    id v6 = @"surcharge_unit";
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = v5;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v14 = [GEOTransitSurchargeUnit alloc];
            if (a3) {
              uint64_t v15 = [(GEOTransitSurchargeUnit *)v14 initWithJSON:v13];
            }
            else {
              uint64_t v15 = [(GEOTransitSurchargeUnit *)v14 initWithDictionary:v13];
            }
            v16 = (void *)v15;
            [a1 addSurchargeUnit:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    id v5 = v24;
  }

  if (a3) {
    v17 = @"paymentType";
  }
  else {
    v17 = @"payment_type";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v18;
    if ([v19 isEqualToString:@"PAYMENT_TYPE_UNKNOWN"]) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = [v19 isEqualToString:@"PAYMENT_TYPE_IC_CARD"];
    }

    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = [v18 intValue];
LABEL_30:
    [a1 setPaymentType:v20];
  }

  if (a3) {
    v21 = @"numberOfLegs";
  }
  else {
    v21 = @"number_of_legs";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setNumberOfLegs:", objc_msgSend(v22, "unsignedIntValue"));
  }

LABEL_37:
  return a1;
}

- (GEOTransitSurcharge)initWithJSON:(id)a3
{
  return (GEOTransitSurcharge *)-[GEOTransitSurcharge _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitSurchargeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitSurchargeReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_surchargeUnits;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteUint32Field();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  [(GEOTransitSurcharge *)self readAll:0];
  if ([(GEOTransitSurcharge *)self surchargeUnitsCount])
  {
    [v9 clearSurchargeUnits];
    unint64_t v4 = [(GEOTransitSurcharge *)self surchargeUnitsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOTransitSurcharge *)self surchargeUnitAtIndex:i];
        [v9 addSurchargeUnit:v7];
      }
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v9 + 7) = self->_paymentType;
    *((unsigned char *)v9 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v9 + 6) = self->_numberOfLegs;
    *((unsigned char *)v9 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_surchargeUnits;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (void)v14);
        [(id)v5 addSurchargeUnit:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_paymentType;
    *(unsigned char *)(v5 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_numberOfLegs;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOTransitSurcharge *)self readAll:1];
  [v4 readAll:1];
  surchargeUnits = self->_surchargeUnits;
  if ((unint64_t)surchargeUnits | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](surchargeUnits, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_paymentType != *((_DWORD *)v4 + 7)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_numberOfLegs != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  [(GEOTransitSurcharge *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_surchargeUnits hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_paymentType;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_numberOfLegs;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOTransitSurcharge addSurchargeUnit:](self, "addSurchargeUnit:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 32);
  if ((v10 & 2) != 0)
  {
    self->_paymentType = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_flags |= 2u;
    char v10 = *((unsigned char *)v4 + 32);
  }
  if (v10)
  {
    self->_numberOfLegs = *((_DWORD *)v4 + 6);
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
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitSurcharge *)self readAll:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_surchargeUnits;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "clearUnknownFields:", 1, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surchargeUnits, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end