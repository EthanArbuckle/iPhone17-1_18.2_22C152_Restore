@interface GEOPBTransitPaymentMethodSuggestion
+ (BOOL)isValid:(id)a3;
- (BOOL)hasPaymentMethodSuggestionDetails;
- (BOOL)hasPurpose;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBTransitPaymentMethodSuggestion)init;
- (GEOPBTransitPaymentMethodSuggestion)initWithData:(id)a3;
- (GEOPBTransitPaymentMethodSuggestion)initWithDictionary:(id)a3;
- (GEOPBTransitPaymentMethodSuggestion)initWithJSON:(id)a3;
- (GEOPBTransitPaymentMethodSuggestionDetails)paymentMethodSuggestionDetails;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)purposeAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsPurpose:(id)a3;
- (int)StringAsType:(id)a3;
- (int)purpose;
- (int)type;
- (unint64_t)hash;
- (unint64_t)paymentMethodIndexsCount;
- (unsigned)paymentMethodIndexAtIndex:(unint64_t)a3;
- (unsigned)paymentMethodIndexs;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readPaymentMethodIndexs;
- (void)_readPaymentMethodSuggestionDetails;
- (void)addPaymentMethodIndex:(unsigned int)a3;
- (void)clearPaymentMethodIndexs;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasPurpose:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setPaymentMethodIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPaymentMethodSuggestionDetails:(id)a3;
- (void)setPurpose:(int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitPaymentMethodSuggestion

- (GEOPBTransitPaymentMethodSuggestion)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitPaymentMethodSuggestion;
  v2 = [(GEOPBTransitPaymentMethodSuggestion *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitPaymentMethodSuggestion)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitPaymentMethodSuggestion;
  v3 = [(GEOPBTransitPaymentMethodSuggestion *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEOPBTransitPaymentMethodSuggestion;
  [(GEOPBTransitPaymentMethodSuggestion *)&v3 dealloc];
}

- (void)_readPaymentMethodIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodSuggestionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPaymentMethodIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)paymentMethodIndexsCount
{
  return self->_paymentMethodIndexs.count;
}

- (unsigned)paymentMethodIndexs
{
  return self->_paymentMethodIndexs.list;
}

- (void)clearPaymentMethodIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;

  PBRepeatedUInt32Clear();
}

- (void)addPaymentMethodIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (unsigned)paymentMethodIndexAtIndex:(unint64_t)a3
{
  -[GEOPBTransitPaymentMethodSuggestion _readPaymentMethodIndexs]((uint64_t)self);
  p_paymentMethodIndexs = &self->_paymentMethodIndexs;
  unint64_t count = self->_paymentMethodIndexs.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_paymentMethodIndexs->list[a3];
}

- (void)setPaymentMethodIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;

  MEMORY[0x1F4147400](&self->_paymentMethodIndexs, a3, a4);
}

- (void)_readPaymentMethodSuggestionDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodSuggestionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPaymentMethodSuggestionDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPaymentMethodSuggestionDetails
{
  return self->_paymentMethodSuggestionDetails != 0;
}

- (GEOPBTransitPaymentMethodSuggestionDetails)paymentMethodSuggestionDetails
{
  -[GEOPBTransitPaymentMethodSuggestion _readPaymentMethodSuggestionDetails]((uint64_t)self);
  paymentMethodSuggestionDetails = self->_paymentMethodSuggestionDetails;

  return paymentMethodSuggestionDetails;
}

- (void)setPaymentMethodSuggestionDetails:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_paymentMethodSuggestionDetails, a3);
}

- (int)purpose
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_purpose;
  }
  else {
    return 0;
  }
}

- (void)setPurpose:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_purpose = a3;
}

- (void)setHasPurpose:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasPurpose
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)purposeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E5F38[a3];
  }

  return v3;
}

- (int)StringAsPurpose:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PAYMENT_METHOD_PURPOSE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PAYMENT_METHOD_PURPOSE_PRIMARY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PAYMENT_METHOD_PURPOSE_COVERAGE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E5F50[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PAYMENT_SUGGESTION_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PAYMENT_SUGGESTION_TYPE_OPEN_LOOP_EXPRESS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PAYMENT_SUGGESTION_TYPE_OPEN_LOOP_NON_EXPRESS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PAYMENT_SUGGESTION_TYPE_CLOSED_LOOP_DCI"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PAYMENT_SUGGESTION_TYPE_CLOSED_LOOP_NON_DCI"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitPaymentMethodSuggestion;
  int v4 = [(GEOPBTransitPaymentMethodSuggestion *)&v8 description];
  v5 = [(GEOPBTransitPaymentMethodSuggestion *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitPaymentMethodSuggestion _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 32))
    {
      v5 = PBRepeatedUInt32NSArray();
      if (a2) {
        objc_super v6 = @"paymentMethodIndex";
      }
      else {
        objc_super v6 = @"payment_method_index";
      }
      [v4 setObject:v5 forKey:v6];
    }
    objc_super v7 = [(id)a1 paymentMethodSuggestionDetails];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"paymentMethodSuggestionDetails";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"payment_method_suggestion_details";
      }
      [v4 setObject:v9 forKey:v10];
    }
    char v11 = *(unsigned char *)(a1 + 76);
    if (v11)
    {
      uint64_t v12 = *(int *)(a1 + 68);
      if (v12 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E53E5F38[v12];
      }
      [v4 setObject:v13 forKey:@"purpose"];

      char v11 = *(unsigned char *)(a1 + 76);
    }
    if ((v11 & 2) != 0)
    {
      uint64_t v14 = *(int *)(a1 + 72);
      if (v14 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 72));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = off_1E53E5F50[v14];
      }
      [v4 setObject:v15 forKey:@"type"];
    }
    v16 = *(void **)(a1 + 16);
    if (v16)
    {
      v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __65__GEOPBTransitPaymentMethodSuggestion__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
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
  return -[GEOPBTransitPaymentMethodSuggestion _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __65__GEOPBTransitPaymentMethodSuggestion__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEOPBTransitPaymentMethodSuggestion)initWithDictionary:(id)a3
{
  return (GEOPBTransitPaymentMethodSuggestion *)-[GEOPBTransitPaymentMethodSuggestion _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"paymentMethodIndex";
      }
      else {
        objc_super v6 = @"payment_method_index";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v27 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addPaymentMethodIndex:", objc_msgSend(v13, "unsignedIntValue", (void)v26));
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v10);
        }
      }
      if (a3) {
        uint64_t v14 = @"paymentMethodSuggestionDetails";
      }
      else {
        uint64_t v14 = @"payment_method_suggestion_details";
      }
      v15 = objc_msgSend(v5, "objectForKeyedSubscript:", v14, (void)v26);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [GEOPBTransitPaymentMethodSuggestionDetails alloc];
        if (a3) {
          uint64_t v17 = [(GEOPBTransitPaymentMethodSuggestionDetails *)v16 initWithJSON:v15];
        }
        else {
          uint64_t v17 = [(GEOPBTransitPaymentMethodSuggestionDetails *)v16 initWithDictionary:v15];
        }
        v18 = (void *)v17;
        [a1 setPaymentMethodSuggestionDetails:v17];
      }
      v19 = [v5 objectForKeyedSubscript:@"purpose"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = v19;
        if ([v20 isEqualToString:@"PAYMENT_METHOD_PURPOSE_UNKNOWN"])
        {
          uint64_t v21 = 0;
        }
        else if ([v20 isEqualToString:@"PAYMENT_METHOD_PURPOSE_PRIMARY"])
        {
          uint64_t v21 = 1;
        }
        else if ([v20 isEqualToString:@"PAYMENT_METHOD_PURPOSE_COVERAGE"])
        {
          uint64_t v21 = 2;
        }
        else
        {
          uint64_t v21 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_37;
        }
        uint64_t v21 = [v19 intValue];
      }
      [a1 setPurpose:v21];
LABEL_37:

      v22 = [v5 objectForKeyedSubscript:@"type"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v22;
        if ([v23 isEqualToString:@"PAYMENT_SUGGESTION_TYPE_UNKNOWN"])
        {
          uint64_t v24 = 0;
        }
        else if ([v23 isEqualToString:@"PAYMENT_SUGGESTION_TYPE_OPEN_LOOP_EXPRESS"])
        {
          uint64_t v24 = 1;
        }
        else if ([v23 isEqualToString:@"PAYMENT_SUGGESTION_TYPE_OPEN_LOOP_NON_EXPRESS"])
        {
          uint64_t v24 = 2;
        }
        else if ([v23 isEqualToString:@"PAYMENT_SUGGESTION_TYPE_CLOSED_LOOP_DCI"])
        {
          uint64_t v24 = 3;
        }
        else if ([v23 isEqualToString:@"PAYMENT_SUGGESTION_TYPE_CLOSED_LOOP_NON_DCI"])
        {
          uint64_t v24 = 4;
        }
        else
        {
          uint64_t v24 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_53:

          goto LABEL_54;
        }
        uint64_t v24 = [v22 intValue];
      }
      [a1 setType:v24];
      goto LABEL_53;
    }
  }
LABEL_54:

  return a1;
}

- (GEOPBTransitPaymentMethodSuggestion)initWithJSON:(id)a3
{
  return (GEOPBTransitPaymentMethodSuggestion *)-[GEOPBTransitPaymentMethodSuggestion _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_735;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_736;
    }
    GEOPBTransitPaymentMethodSuggestionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOPBTransitPaymentMethodSuggestionDetails *)self->_paymentMethodSuggestionDetails readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitPaymentMethodSuggestionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitPaymentMethodSuggestionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPBTransitPaymentMethodSuggestionIsDirty((uint64_t)self) & 1) == 0)
  {
    id v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPBTransitPaymentMethodSuggestion *)self readAll:0];
    id v5 = v10;
    if (self->_paymentMethodIndexs.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        id v5 = v10;
        ++v6;
      }
      while (v6 < self->_paymentMethodIndexs.count);
    }
    if (self->_paymentMethodSuggestionDetails)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v10;
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v10;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v8 = (id *)a3;
  [(GEOPBTransitPaymentMethodSuggestion *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 14) = self->_readerMarkPos;
  *((_DWORD *)v8 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOPBTransitPaymentMethodSuggestion *)self paymentMethodIndexsCount])
  {
    [v8 clearPaymentMethodIndexs];
    unint64_t v4 = [(GEOPBTransitPaymentMethodSuggestion *)self paymentMethodIndexsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v8, "addPaymentMethodIndex:", -[GEOPBTransitPaymentMethodSuggestion paymentMethodIndexAtIndex:](self, "paymentMethodIndexAtIndex:", i));
    }
  }
  if (self->_paymentMethodSuggestionDetails) {
    objc_msgSend(v8, "setPaymentMethodSuggestionDetails:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v8 + 17) = self->_purpose;
    *((unsigned char *)v8 + 76) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v8 + 18) = self->_type;
    *((unsigned char *)v8 + 76) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPBTransitPaymentMethodSuggestionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBTransitPaymentMethodSuggestion *)self readAll:0];
  PBRepeatedUInt32Copy();
  id v9 = [(GEOPBTransitPaymentMethodSuggestionDetails *)self->_paymentMethodSuggestionDetails copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 68) = self->_purpose;
    *(unsigned char *)(v5 + 76) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_type;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  uint64_t v12 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v12;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOPBTransitPaymentMethodSuggestion *)self readAll:1];
  [v4 readAll:1];
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_14;
  }
  paymentMethodSuggestionDetails = self->_paymentMethodSuggestionDetails;
  if ((unint64_t)paymentMethodSuggestionDetails | *((void *)v4 + 6))
  {
    if (!-[GEOPBTransitPaymentMethodSuggestionDetails isEqual:](paymentMethodSuggestionDetails, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_purpose != *((_DWORD *)v4 + 17)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
LABEL_14:
    BOOL v6 = 0;
    goto LABEL_15;
  }
  BOOL v6 = (*((unsigned char *)v4 + 76) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_type != *((_DWORD *)v4 + 18)) {
      goto LABEL_14;
    }
    BOOL v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPBTransitPaymentMethodSuggestion *)self readAll:1];
  uint64_t v3 = PBRepeatedUInt32Hash();
  unint64_t v4 = [(GEOPBTransitPaymentMethodSuggestionDetails *)self->_paymentMethodSuggestionDetails hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v5 = 2654435761 * self->_purpose;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_type;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v11 = a3;
  [v11 readAll:0];
  uint64_t v4 = [v11 paymentMethodIndexsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOPBTransitPaymentMethodSuggestion addPaymentMethodIndex:](self, "addPaymentMethodIndex:", [v11 paymentMethodIndexAtIndex:i]);
  }
  paymentMethodSuggestionDetails = self->_paymentMethodSuggestionDetails;
  id v8 = v11;
  uint64_t v9 = v11[6];
  if (paymentMethodSuggestionDetails)
  {
    if (!v9) {
      goto LABEL_10;
    }
    -[GEOPBTransitPaymentMethodSuggestionDetails mergeFrom:](paymentMethodSuggestionDetails, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_10;
    }
    -[GEOPBTransitPaymentMethodSuggestion setPaymentMethodSuggestionDetails:](self, "setPaymentMethodSuggestionDetails:");
  }
  id v8 = v11;
LABEL_10:
  char v10 = *((unsigned char *)v8 + 76);
  if (v10)
  {
    self->_purpose = *((_DWORD *)v8 + 17);
    *(unsigned char *)&self->_flags |= 1u;
    char v10 = *((unsigned char *)v8 + 76);
  }
  if ((v10 & 2) != 0)
  {
    self->_type = *((_DWORD *)v8 + 18);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPBTransitPaymentMethodSuggestionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_740);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x24u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPBTransitPaymentMethodSuggestion *)self readAll:0];
    paymentMethodSuggestionDetails = self->_paymentMethodSuggestionDetails;
    [(GEOPBTransitPaymentMethodSuggestionDetails *)paymentMethodSuggestionDetails clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethodSuggestionDetails, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end