@interface GEOTransitBaseFare
+ (BOOL)isValid:(id)a3;
+ (Class)supportedPaymentMethodType;
- (BOOL)cashOnly;
- (BOOL)hasCashOnly;
- (BOOL)hasNumberOfLegs;
- (BOOL)hasPaymentType;
- (BOOL)hasPrice;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitBaseFare)init;
- (GEOTransitBaseFare)initWithData:(id)a3;
- (GEOTransitBaseFare)initWithDictionary:(id)a3;
- (GEOTransitBaseFare)initWithJSON:(id)a3;
- (GEOTransitPrice)price;
- (NSArray)supportedICCardProviders;
- (NSDecimalNumber)value;
- (NSMutableArray)supportedPaymentMethods;
- (NSString)currencyCode;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)paymentTypeAsString:(int)a3;
- (id)supportedPaymentMethodAtIndex:(unint64_t)a3;
- (int)StringAsPaymentType:(id)a3;
- (int)paymentType;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)supportedPaymentMethodIndexsCount;
- (unint64_t)supportedPaymentMethodsCount;
- (unsigned)numberOfLegs;
- (unsigned)supportedPaymentMethodIndexAtIndex:(unint64_t)a3;
- (unsigned)supportedPaymentMethodIndexs;
- (void)_addNoFlagsSupportedPaymentMethod:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readPrice;
- (void)_readSupportedPaymentMethodIndexs;
- (void)_readSupportedPaymentMethods;
- (void)addSupportedPaymentMethod:(id)a3;
- (void)addSupportedPaymentMethodIndex:(unsigned int)a3;
- (void)clearSupportedPaymentMethodIndexs;
- (void)clearSupportedPaymentMethods;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCashOnly:(BOOL)a3;
- (void)setHasCashOnly:(BOOL)a3;
- (void)setHasNumberOfLegs:(BOOL)a3;
- (void)setHasPaymentType:(BOOL)a3;
- (void)setNumberOfLegs:(unsigned int)a3;
- (void)setPaymentType:(int)a3;
- (void)setPrice:(id)a3;
- (void)setSupportedPaymentMethodIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSupportedPaymentMethods:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitBaseFare

- (GEOTransitBaseFare)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitBaseFare;
  v2 = [(GEOTransitBaseFare *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitBaseFare)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitBaseFare;
  v3 = [(GEOTransitBaseFare *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTransitBaseFare;
  [(GEOTransitBaseFare *)&v3 dealloc];
}

- (void)_readPrice
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBaseFareReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrice_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPrice
{
  return self->_price != 0;
}

- (GEOTransitPrice)price
{
  -[GEOTransitBaseFare _readPrice]((uint64_t)self);
  price = self->_price;

  return price;
}

- (void)setPrice:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_price, a3);
}

- (int)paymentType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_paymentType;
  }
  else {
    return 0;
  }
}

- (void)setPaymentType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_paymentType = a3;
}

- (void)setHasPaymentType:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
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

- (unsigned)numberOfLegs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_numberOfLegs;
  }
  else {
    return 1;
  }
}

- (void)setNumberOfLegs:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_numberOfLegs = a3;
}

- (void)setHasNumberOfLegs:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasNumberOfLegs
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readSupportedPaymentMethods
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBaseFareReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedPaymentMethods_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)supportedPaymentMethods
{
  -[GEOTransitBaseFare _readSupportedPaymentMethods]((uint64_t)self);
  supportedPaymentMethods = self->_supportedPaymentMethods;

  return supportedPaymentMethods;
}

- (void)setSupportedPaymentMethods:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  supportedPaymentMethods = self->_supportedPaymentMethods;
  self->_supportedPaymentMethods = v4;
}

- (void)clearSupportedPaymentMethods
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  supportedPaymentMethods = self->_supportedPaymentMethods;

  [(NSMutableArray *)supportedPaymentMethods removeAllObjects];
}

- (void)addSupportedPaymentMethod:(id)a3
{
  id v4 = a3;
  -[GEOTransitBaseFare _readSupportedPaymentMethods]((uint64_t)self);
  -[GEOTransitBaseFare _addNoFlagsSupportedPaymentMethod:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsSupportedPaymentMethod:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)supportedPaymentMethodsCount
{
  -[GEOTransitBaseFare _readSupportedPaymentMethods]((uint64_t)self);
  supportedPaymentMethods = self->_supportedPaymentMethods;

  return [(NSMutableArray *)supportedPaymentMethods count];
}

- (id)supportedPaymentMethodAtIndex:(unint64_t)a3
{
  -[GEOTransitBaseFare _readSupportedPaymentMethods]((uint64_t)self);
  supportedPaymentMethods = self->_supportedPaymentMethods;

  return (id)[(NSMutableArray *)supportedPaymentMethods objectAtIndex:a3];
}

+ (Class)supportedPaymentMethodType
{
  return (Class)objc_opt_class();
}

- (BOOL)cashOnly
{
  return self->_cashOnly;
}

- (void)setCashOnly:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  self->_cashOnly = a3;
}

- (void)setHasCashOnly:(BOOL)a3
{
  if (a3) {
    char v3 = -124;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasCashOnly
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readSupportedPaymentMethodIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBaseFareReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedPaymentMethodIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)supportedPaymentMethodIndexsCount
{
  return self->_supportedPaymentMethodIndexs.count;
}

- (unsigned)supportedPaymentMethodIndexs
{
  return self->_supportedPaymentMethodIndexs.list;
}

- (void)clearSupportedPaymentMethodIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;

  PBRepeatedUInt32Clear();
}

- (void)addSupportedPaymentMethodIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (unsigned)supportedPaymentMethodIndexAtIndex:(unint64_t)a3
{
  -[GEOTransitBaseFare _readSupportedPaymentMethodIndexs]((uint64_t)self);
  p_supportedPaymentMethodIndexs = &self->_supportedPaymentMethodIndexs;
  unint64_t count = self->_supportedPaymentMethodIndexs.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_supportedPaymentMethodIndexs->list[a3];
}

- (void)setSupportedPaymentMethodIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;

  MEMORY[0x1F4147400](&self->_supportedPaymentMethodIndexs, a3, a4);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitBaseFare;
  id v4 = [(GEOTransitBaseFare *)&v8 description];
  id v5 = [(GEOTransitBaseFare *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitBaseFare _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 price];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      id v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"price"];
    }
    char v8 = *(unsigned char *)(a1 + 88);
    if ((v8 & 2) != 0)
    {
      int v9 = *(_DWORD *)(a1 + 80);
      if (v9)
      {
        if (v9 == 1)
        {
          v10 = @"PAYMENT_TYPE_IC_CARD";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 80));
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v10 = @"PAYMENT_TYPE_UNKNOWN";
      }
      if (a2) {
        v11 = @"paymentType";
      }
      else {
        v11 = @"payment_type";
      }
      [v4 setObject:v10 forKey:v11];

      char v8 = *(unsigned char *)(a1 + 88);
    }
    if (v8)
    {
      v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
      if (a2) {
        v13 = @"numberOfLegs";
      }
      else {
        v13 = @"number_of_legs";
      }
      [v4 setObject:v12 forKey:v13];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v15 = *(id *)(a1 + 56);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v37 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"supportedPaymentMethod";
      }
      else {
        v22 = @"supported_payment_method";
      }
      [v4 setObject:v14 forKey:v22];
    }
    if ((*(unsigned char *)(a1 + 88) & 4) != 0)
    {
      v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 84)];
      if (a2) {
        v24 = @"cashOnly";
      }
      else {
        v24 = @"cash_only";
      }
      [v4 setObject:v23 forKey:v24];
    }
    if (*(void *)(a1 + 32))
    {
      v25 = PBRepeatedUInt32NSArray();
      if (a2) {
        v26 = @"supportedPaymentMethodIndex";
      }
      else {
        v26 = @"supported_payment_method_index";
      }
      [v4 setObject:v25 forKey:v26];
    }
    v27 = *(void **)(a1 + 16);
    if (v27)
    {
      v28 = [v27 dictionaryRepresentation];
      v29 = v28;
      if (a2)
      {
        v30 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __48__GEOTransitBaseFare__dictionaryRepresentation___block_invoke;
        v34[3] = &unk_1E53D8860;
        id v31 = v30;
        id v35 = v31;
        [v29 enumerateKeysAndObjectsUsingBlock:v34];
        id v32 = v31;

        v29 = v32;
      }
      [v4 setObject:v29 forKey:@"Unknown Fields"];
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
  return -[GEOTransitBaseFare _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOTransitBaseFare__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    char v8 = [v5 base64EncodedStringWithOptions:0];
    int v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    char v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOTransitBaseFare)initWithDictionary:(id)a3
{
  return (GEOTransitBaseFare *)-[GEOTransitBaseFare _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_61;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_61;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"price"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [GEOTransitPrice alloc];
    if (a3) {
      uint64_t v8 = [(GEOTransitPrice *)v7 initWithJSON:v6];
    }
    else {
      uint64_t v8 = [(GEOTransitPrice *)v7 initWithDictionary:v6];
    }
    int v9 = (void *)v8;
    [a1 setPrice:v8];
  }
  if (a3) {
    id v10 = @"paymentType";
  }
  else {
    id v10 = @"payment_type";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"PAYMENT_TYPE_UNKNOWN"]) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = [v12 isEqualToString:@"PAYMENT_TYPE_IC_CARD"];
    }

    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v11 intValue];
LABEL_18:
    [a1 setPaymentType:v13];
  }

  if (a3) {
    v14 = @"numberOfLegs";
  }
  else {
    v14 = @"number_of_legs";
  }
  id v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setNumberOfLegs:", objc_msgSend(v15, "unsignedIntValue"));
  }

  if (a3) {
    uint64_t v16 = @"supportedPaymentMethod";
  }
  else {
    uint64_t v16 = @"supported_payment_method";
  }
  uint64_t v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v38 = v17;
    id v39 = v5;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v45 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v24 = [GEOPBTransitPaymentMethod alloc];
            if (a3) {
              uint64_t v25 = [(GEOPBTransitPaymentMethod *)v24 initWithJSON:v23];
            }
            else {
              uint64_t v25 = [(GEOPBTransitPaymentMethod *)v24 initWithDictionary:v23];
            }
            v26 = (void *)v25;
            objc_msgSend(a1, "addSupportedPaymentMethod:", v25, v38, v39);
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v20);
    }

    uint64_t v17 = v38;
    id v5 = v39;
  }

  if (a3) {
    v27 = @"cashOnly";
  }
  else {
    v27 = @"cash_only";
  }
  v28 = objc_msgSend(v5, "objectForKeyedSubscript:", v27, v38, v39);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCashOnly:", objc_msgSend(v28, "BOOLValue"));
  }

  if (a3) {
    v29 = @"supportedPaymentMethodIndex";
  }
  else {
    v29 = @"supported_payment_method_index";
  }
  v30 = [v5 objectForKeyedSubscript:v29];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v31 = v30;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v41 != v34) {
            objc_enumerationMutation(v31);
          }
          long long v36 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(a1, "addSupportedPaymentMethodIndex:", objc_msgSend(v36, "unsignedIntValue"));
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v33);
    }
  }
LABEL_61:

  return a1;
}

- (GEOTransitBaseFare)initWithJSON:(id)a3
{
  return (GEOTransitBaseFare *)-[GEOTransitBaseFare _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_182;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_183;
    }
    GEOTransitBaseFareReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTransitBaseFareCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitBaseFareIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitBaseFareReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 0xFu))
  {
    id v12 = self->_reader;
    objc_sync_enter(v12);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v13];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitBaseFare *)self readAll:0];
    if (self->_price) {
      PBDataWriterWriteSubmessage();
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
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = self->_supportedPaymentMethods;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_supportedPaymentMethodIndexs.count)
    {
      unint64_t v11 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v11;
      }
      while (v11 < self->_supportedPaymentMethodIndexs.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = (id *)a3;
  [(GEOTransitBaseFare *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 16) = self->_readerMarkPos;
  *((_DWORD *)v12 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_price) {
    objc_msgSend(v12, "setPrice:");
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v12 + 20) = self->_paymentType;
    *((unsigned char *)v12 + 88) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v12 + 19) = self->_numberOfLegs;
    *((unsigned char *)v12 + 88) |= 1u;
  }
  if ([(GEOTransitBaseFare *)self supportedPaymentMethodsCount])
  {
    [v12 clearSupportedPaymentMethods];
    unint64_t v5 = [(GEOTransitBaseFare *)self supportedPaymentMethodsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOTransitBaseFare *)self supportedPaymentMethodAtIndex:i];
        [v12 addSupportedPaymentMethod:v8];
      }
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *((unsigned char *)v12 + 84) = self->_cashOnly;
    *((unsigned char *)v12 + 88) |= 4u;
  }
  if ([(GEOTransitBaseFare *)self supportedPaymentMethodIndexsCount])
  {
    [v12 clearSupportedPaymentMethodIndexs];
    unint64_t v9 = [(GEOTransitBaseFare *)self supportedPaymentMethodIndexsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        objc_msgSend(v12, "addSupportedPaymentMethodIndex:", -[GEOTransitBaseFare supportedPaymentMethodIndexAtIndex:](self, "supportedPaymentMethodIndexAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTransitBaseFareReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitBaseFare *)self readAll:0];
  id v9 = [(GEOTransitPrice *)self->_price copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_paymentType;
    *(unsigned char *)(v5 + 88) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 76) = self->_numberOfLegs;
    *(unsigned char *)(v5 + 88) |= 1u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = self->_supportedPaymentMethods;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (void)v19);
        [(id)v5 addSupportedPaymentMethod:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 84) = self->_cashOnly;
    *(unsigned char *)(v5 + 88) |= 4u;
  }
  PBRepeatedUInt32Copy();
  long long v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOTransitBaseFare *)self readAll:1];
  [v4 readAll:1];
  price = self->_price;
  if ((unint64_t)price | *((void *)v4 + 6))
  {
    if (!-[GEOTransitPrice isEqual:](price, "isEqual:")) {
      goto LABEL_21;
    }
  }
  char flags = (char)self->_flags;
  char v7 = *((unsigned char *)v4 + 88);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_paymentType != *((_DWORD *)v4 + 20)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_numberOfLegs != *((_DWORD *)v4 + 19)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
    goto LABEL_21;
  }
  supportedPaymentMethods = self->_supportedPaymentMethods;
  if ((unint64_t)supportedPaymentMethods | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](supportedPaymentMethods, "isEqual:")) {
      goto LABEL_21;
    }
    char flags = (char)self->_flags;
    char v7 = *((unsigned char *)v4 + 88);
  }
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) != 0)
    {
      if (self->_cashOnly)
      {
        if (!*((unsigned char *)v4 + 84)) {
          goto LABEL_21;
        }
      }
      else if (*((unsigned char *)v4 + 84))
      {
        goto LABEL_21;
      }
LABEL_27:
      char IsEqual = PBRepeatedUInt32IsEqual();
      goto LABEL_22;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_27;
  }
LABEL_21:
  char IsEqual = 0;
LABEL_22:

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOTransitBaseFare *)self readAll:1];
  unint64_t v3 = [(GEOTransitPrice *)self->_price hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_paymentType;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_numberOfLegs;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  uint64_t v6 = [(NSMutableArray *)self->_supportedPaymentMethods hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_cashOnly;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  price = self->_price;
  uint64_t v6 = *((void *)v4 + 6);
  if (price)
  {
    if (v6) {
      -[GEOTransitPrice mergeFrom:](price, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOTransitBaseFare setPrice:](self, "setPrice:");
  }
  char v7 = *((unsigned char *)v4 + 88);
  if ((v7 & 2) != 0)
  {
    self->_paymentType = *((_DWORD *)v4 + 20);
    *(unsigned char *)&self->_flags |= 2u;
    char v7 = *((unsigned char *)v4 + 88);
  }
  if (v7)
  {
    self->_numberOfLegs = *((_DWORD *)v4 + 19);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = *((id *)v4 + 7);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEOTransitBaseFare addSupportedPaymentMethod:](self, "addSupportedPaymentMethod:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  if ((*((unsigned char *)v4 + 88) & 4) != 0)
  {
    self->_cashOnly = *((unsigned char *)v4 + 84);
    *(unsigned char *)&self->_flags |= 4u;
  }
  uint64_t v13 = objc_msgSend(v4, "supportedPaymentMethodIndexsCount", (void)v16);
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t j = 0; j != v14; ++j)
      -[GEOTransitBaseFare addSupportedPaymentMethodIndex:](self, "addSupportedPaymentMethodIndex:", [v4 supportedPaymentMethodIndexAtIndex:j]);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTransitBaseFareReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_187);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x88u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitBaseFare *)self readAll:0];
    [(GEOTransitPrice *)self->_price clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    char v7 = self->_supportedPaymentMethods;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedPaymentMethods, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (NSDecimalNumber)value
{
  if ([(GEOTransitBaseFare *)self hasPrice])
  {
    BOOL v3 = [(GEOTransitBaseFare *)self price];
    double v4 = (double)(int)[v3 amountInCents];
    if ([v3 subunit]) {
      double v5 = (double)[v3 subunit];
    }
    else {
      double v5 = 1.0;
    }
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C28]) initWithDouble:v4 / v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSDecimalNumber *)v6;
}

- (NSString)currencyCode
{
  v2 = [(GEOTransitBaseFare *)self price];
  BOOL v3 = [v2 currencyCode];

  return (NSString *)v3;
}

- (int64_t)type
{
  return [(GEOTransitBaseFare *)self hasPaymentType]
      && [(GEOTransitBaseFare *)self paymentType] == 1;
}

- (NSArray)supportedICCardProviders
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[GEOTransitBaseFare supportedPaymentMethodsCount](self, "supportedPaymentMethodsCount"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v4 = [(GEOTransitBaseFare *)self supportedPaymentMethods];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [v9 identifier];
        uint64_t v11 = [v10 length];

        if (v11)
        {
          long long v12 = [v9 identifier];
          [v3 addObject:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  long long v13 = (void *)[v3 copy];

  return (NSArray *)v13;
}

@end