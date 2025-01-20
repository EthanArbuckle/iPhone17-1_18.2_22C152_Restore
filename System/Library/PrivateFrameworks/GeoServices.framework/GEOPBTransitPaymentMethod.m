@interface GEOPBTransitPaymentMethod
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAddValueName;
- (BOOL)hasIdentifier;
- (BOOL)hasMuid;
- (BOOL)hasName;
- (BOOL)hasPaymentMethodType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBTransitPaymentMethod)init;
- (GEOPBTransitPaymentMethod)initWithData:(id)a3;
- (GEOPBTransitPaymentMethod)initWithDictionary:(id)a3;
- (GEOPBTransitPaymentMethod)initWithJSON:(id)a3;
- (NSString)identifier;
- (NSString)name;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)addValueNameAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)paymentMethodTypeAsString:(int)a3;
- (int)StringAsAddValueName:(id)a3;
- (int)StringAsPaymentMethodType:(id)a3;
- (int)addValueName;
- (int)paymentMethodType;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readIdentifier;
- (void)_readName;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddValueName:(int)a3;
- (void)setHasAddValueName:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasPaymentMethodType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setPaymentMethodType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitPaymentMethod

- (GEOPBTransitPaymentMethod)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitPaymentMethod;
  v2 = [(GEOPBTransitPaymentMethod *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitPaymentMethod)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitPaymentMethod;
  v3 = [(GEOPBTransitPaymentMethod *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIdentifier_tags_6);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOPBTransitPaymentMethod _readIdentifier]((uint64_t)self);
  identifier = self->_identifier;

  return identifier;
}

- (void)setIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasMuid
{
  return *(unsigned char *)&self->_flags & 1;
}

- (int)paymentMethodType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_paymentMethodType;
  }
  else {
    return 0;
  }
}

- (void)setPaymentMethodType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  self->_paymentMethodType = a3;
}

- (void)setHasPaymentMethodType:(BOOL)a3
{
  if (a3) {
    char v3 = 68;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasPaymentMethodType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)paymentMethodTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E5EF0[a3];
  }

  return v3;
}

- (int)StringAsPaymentMethodType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PAYMENT_METHOD_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PAYMENT_METHOD_TYPE_OPEN_LOOP"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PAYMENT_METHOD_TYPE_CLOSED_LOOP_DCI"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PAYMENT_METHOD_TYPE_CASH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PAYMENT_METHOD_TYPE_CLOSED_LOOP_NON_DCI"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)addValueName
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_addValueName;
  }
  else {
    return 0;
  }
}

- (void)setAddValueName:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_addValueName = a3;
}

- (void)setHasAddValueName:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAddValueName
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)addValueNameAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E5F18[a3];
  }

  return v3;
}

- (int)StringAsAddValueName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PAYMENT_METHOD_ADD_VALUE_NAME_RELOAD"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PAYMENT_METHOD_ADD_VALUE_NAME_TOP_UP"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PAYMENT_METHOD_ADD_VALUE_NAME_REFILL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PAYMENT_METHOD_ADD_VALUE_NAME_LOAD"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_12);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOPBTransitPaymentMethod _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)setName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitPaymentMethod;
  int v4 = [(GEOPBTransitPaymentMethod *)&v8 description];
  v5 = [(GEOPBTransitPaymentMethod *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitPaymentMethod _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_29;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 identifier];
  if (v5) {
    [v4 setObject:v5 forKey:@"identifier"];
  }

  char v6 = *(unsigned char *)(a1 + 68);
  if ((v6 & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 68) & 4) == 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v8 = *(int *)(a1 + 64);
    if (v8 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 64));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E53E5EF0[v8];
    }
    if (a2) {
      v10 = @"paymentMethodType";
    }
    else {
      v10 = @"payment_method_type";
    }
    [v4 setObject:v9 forKey:v10];

    if ((*(unsigned char *)(a1 + 68) & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_16;
  }
  objc_super v7 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  [v4 setObject:v7 forKey:@"muid"];

  char v6 = *(unsigned char *)(a1 + 68);
  if ((v6 & 4) != 0) {
    goto LABEL_9;
  }
LABEL_6:
  if ((v6 & 2) != 0)
  {
LABEL_16:
    uint64_t v11 = *(int *)(a1 + 60);
    if (v11 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E53E5F18[v11];
    }
    if (a2) {
      v13 = @"addValueName";
    }
    else {
      v13 = @"add_value_name";
    }
    [v4 setObject:v12 forKey:v13];
  }
LABEL_23:
  v14 = [(id)a1 name];
  if (v14) {
    [v4 setObject:v14 forKey:@"name"];
  }

  v15 = *(void **)(a1 + 16);
  if (v15)
  {
    v16 = [v15 dictionaryRepresentation];
    v17 = v16;
    if (a2)
    {
      v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __55__GEOPBTransitPaymentMethod__dictionaryRepresentation___block_invoke;
      v22[3] = &unk_1E53D8860;
      id v19 = v18;
      id v23 = v19;
      [v17 enumerateKeysAndObjectsUsingBlock:v22];
      id v20 = v19;

      v17 = v20;
    }
    [v4 setObject:v17 forKey:@"Unknown Fields"];
  }
LABEL_29:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitPaymentMethod _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOPBTransitPaymentMethod__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPBTransitPaymentMethod)initWithDictionary:(id)a3
{
  return (GEOPBTransitPaymentMethod *)-[GEOPBTransitPaymentMethod _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_46;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_46;
  }
  char v6 = [v5 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = (void *)[v6 copy];
    [a1 setIdentifier:v7];
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:@"muid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMuid:", objc_msgSend(v8, "unsignedLongLongValue"));
  }

  if (a3) {
    v9 = @"paymentMethodType";
  }
  else {
    v9 = @"payment_method_type";
  }
  id v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    if ([v11 isEqualToString:@"PAYMENT_METHOD_TYPE_UNKNOWN"])
    {
      uint64_t v12 = 0;
    }
    else if ([v11 isEqualToString:@"PAYMENT_METHOD_TYPE_OPEN_LOOP"])
    {
      uint64_t v12 = 1;
    }
    else if ([v11 isEqualToString:@"PAYMENT_METHOD_TYPE_CLOSED_LOOP_DCI"])
    {
      uint64_t v12 = 2;
    }
    else if ([v11 isEqualToString:@"PAYMENT_METHOD_TYPE_CASH"])
    {
      uint64_t v12 = 3;
    }
    else if ([v11 isEqualToString:@"PAYMENT_METHOD_TYPE_CLOSED_LOOP_NON_DCI"])
    {
      uint64_t v12 = 4;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
    uint64_t v12 = [v10 intValue];
  }
  [a1 setPaymentMethodType:v12];
LABEL_26:

  if (a3) {
    v13 = @"addValueName";
  }
  else {
    v13 = @"add_value_name";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    if ([v15 isEqualToString:@"PAYMENT_METHOD_ADD_VALUE_NAME_RELOAD"])
    {
      uint64_t v16 = 0;
    }
    else if ([v15 isEqualToString:@"PAYMENT_METHOD_ADD_VALUE_NAME_TOP_UP"])
    {
      uint64_t v16 = 1;
    }
    else if ([v15 isEqualToString:@"PAYMENT_METHOD_ADD_VALUE_NAME_REFILL"])
    {
      uint64_t v16 = 2;
    }
    else if ([v15 isEqualToString:@"PAYMENT_METHOD_ADD_VALUE_NAME_LOAD"])
    {
      uint64_t v16 = 3;
    }
    else
    {
      uint64_t v16 = 0;
    }

    goto LABEL_42;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v14 intValue];
LABEL_42:
    [a1 setAddValueName:v16];
  }

  v17 = [v5 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = (void *)[v17 copy];
    [a1 setName:v18];
  }
LABEL_46:

  return a1;
}

- (GEOPBTransitPaymentMethod)initWithJSON:(id)a3
{
  return (GEOPBTransitPaymentMethod *)-[GEOPBTransitPaymentMethod _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_673;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_674;
    }
    GEOPBTransitPaymentMethodReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitPaymentMethodIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitPaymentMethodReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 0x70) == 0)
    {
      objc_super v7 = self->_reader;
      objc_sync_enter(v7);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      uint64_t v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v9 writeData:v8];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v7);
      goto LABEL_16;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBTransitPaymentMethod *)self readAll:0];
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  char flags = (char)self->_flags;
  id v6 = v9;
  if ((flags & 1) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    PBDataWriterWriteInt32Field();
    id v6 = v9;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  PBDataWriterWriteUint64Field();
  id v6 = v9;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_13;
  }
LABEL_7:
  if ((flags & 2) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    id v6 = v9;
  }
LABEL_9:
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v6 = v9;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
LABEL_16:
}

- (void)copyTo:(id)a3
{
  id v6 = (id *)a3;
  [(GEOPBTransitPaymentMethod *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_identifier) {
    objc_msgSend(v6, "setIdentifier:");
  }
  char flags = (char)self->_flags;
  id v5 = v6;
  if (flags)
  {
    v6[4] = self->_muid;
    *((unsigned char *)v6 + 68) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 16) = self->_paymentMethodType;
  *((unsigned char *)v6 + 68) |= 4u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v6 + 15) = self->_addValueName;
    *((unsigned char *)v6 + 68) |= 2u;
  }
LABEL_7:
  if (self->_name)
  {
    objc_msgSend(v6, "setName:");
    id v5 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPBTransitPaymentMethod *)self readAll:0];
    uint64_t v9 = [(NSString *)self->_identifier copyWithZone:a3];
    id v10 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v9;

    char flags = (char)self->_flags;
    if (flags)
    {
      *(void *)(v5 + 32) = self->_muid;
      *(unsigned char *)(v5 + 68) |= 1u;
      char flags = (char)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_7:
        if ((flags & 2) == 0)
        {
LABEL_9:
          uint64_t v12 = [(NSString *)self->_name copyWithZone:a3];
          v13 = *(void **)(v5 + 40);
          *(void *)(v5 + 40) = v12;

          v14 = self->_unknownFields;
          id v8 = *(id *)(v5 + 16);
          *(void *)(v5 + 16) = v14;
          goto LABEL_10;
        }
LABEL_8:
        *(_DWORD *)(v5 + 60) = self->_addValueName;
        *(unsigned char *)(v5 + 68) |= 2u;
        goto LABEL_9;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 64) = self->_paymentMethodType;
    *(unsigned char *)(v5 + 68) |= 4u;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPBTransitPaymentMethodReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_10:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOPBTransitPaymentMethod *)self readAll:1];
  [v4 readAll:1];
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_muid != *((void *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_21:
    char v7 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_paymentMethodType != *((_DWORD *)v4 + 16)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_addValueName != *((_DWORD *)v4 + 15)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_21;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 5)) {
    char v7 = -[NSString isEqual:](name, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPBTransitPaymentMethod *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_name hash];
  }
  unint64_t v4 = 2654435761u * self->_muid;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_paymentMethodType;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_addValueName;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_name hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v6 = a3;
  [v6 readAll:0];
  unint64_t v4 = v6;
  if (v6[3])
  {
    -[GEOPBTransitPaymentMethod setIdentifier:](self, "setIdentifier:");
    unint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 68);
  if (v5)
  {
    self->_muid = v4[4];
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v4 + 68);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_paymentMethodType = *((_DWORD *)v4 + 16);
  *(unsigned char *)&self->_flags |= 4u;
  if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
LABEL_6:
    self->_addValueName = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_7:
  if (v4[5])
  {
    -[GEOPBTransitPaymentMethod setName:](self, "setName:");
    unint64_t v4 = v6;
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
      char v5 = reader;
      objc_sync_enter(v5);
      GEOPBTransitPaymentMethodReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_678);
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
  *(unsigned char *)&self->_flags |= 0x48u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPBTransitPaymentMethod *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end