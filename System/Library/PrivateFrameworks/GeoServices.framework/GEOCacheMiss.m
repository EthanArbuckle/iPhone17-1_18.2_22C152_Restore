@interface GEOCacheMiss
+ (BOOL)isValid:(id)a3;
+ (Class)errorsType;
- (BOOL)hasBytes;
- (BOOL)hasCount;
- (BOOL)hasHttpStatus;
- (BOOL)hasMissType;
- (BOOL)hasRequestorType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCacheMiss)initWithDictionary:(id)a3;
- (GEOCacheMiss)initWithJSON:(id)a3;
- (NSMutableArray)errors;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorsAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)missTypeAsString:(int)a3;
- (id)requestorTypeAsString:(int)a3;
- (int)StringAsMissType:(id)a3;
- (int)StringAsRequestorType:(id)a3;
- (int)missType;
- (int)requestorType;
- (unint64_t)errorsCount;
- (unint64_t)hash;
- (unsigned)bytes;
- (unsigned)count;
- (unsigned)httpStatus;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addErrors:(id)a3;
- (void)clearErrors;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBytes:(unsigned int)a3;
- (void)setCount:(unsigned int)a3;
- (void)setErrors:(id)a3;
- (void)setHasBytes:(BOOL)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasHttpStatus:(BOOL)a3;
- (void)setHasMissType:(BOOL)a3;
- (void)setHasRequestorType:(BOOL)a3;
- (void)setHttpStatus:(unsigned int)a3;
- (void)setMissType:(int)a3;
- (void)setRequestorType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCacheMiss

- (int)requestorType
{
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    return self->_requestorType;
  }
  else {
    return 0;
  }
}

- (void)setRequestorType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_requestorType = a3;
}

- (void)setHasRequestorType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasRequestorType
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)requestorTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7518[a3];
  }

  return v3;
}

- (int)StringAsRequestorType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"INTERACTIVE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NAV"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PROACTIVE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_REGION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_REFRESH"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_REGION_AND_REFRESH"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)missType
{
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    return self->_missType;
  }
  else {
    return 0;
  }
}

- (void)setMissType:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_missType = a3;
}

- (void)setHasMissType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasMissType
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)missTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7550[a3];
  }

  return v3;
}

- (int)StringAsMissType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UNAVAILABLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STALE_UNUSABLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"STALE_USABLE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCount
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)bytes
{
  return self->_bytes;
}

- (void)setBytes:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_bytes = a3;
}

- (void)setHasBytes:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasBytes
{
  return *(unsigned char *)&self->_flags & 1;
}

- (NSMutableArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (void)clearErrors
{
}

- (void)addErrors:(id)a3
{
  id v4 = a3;
  errors = self->_errors;
  id v8 = v4;
  if (!errors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_errors;
    self->_errors = v6;

    id v4 = v8;
    errors = self->_errors;
  }
  [(NSMutableArray *)errors addObject:v4];
}

- (unint64_t)errorsCount
{
  return [(NSMutableArray *)self->_errors count];
}

- (id)errorsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_errors objectAtIndex:a3];
}

+ (Class)errorsType
{
  return (Class)objc_opt_class();
}

- (unsigned)httpStatus
{
  return self->_httpStatus;
}

- (void)setHttpStatus:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_httpStatus = a3;
}

- (void)setHasHttpStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasHttpStatus
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCacheMiss;
  id v4 = [(GEOCacheMiss *)&v8 description];
  v5 = [(GEOCacheMiss *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCacheMiss _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 36);
    if ((v5 & 0x10) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 32);
      if (v6 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53F7518[v6];
      }
      if (a2) {
        objc_super v8 = @"requestorType";
      }
      else {
        objc_super v8 = @"requestor_type";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 36);
    }
    if ((v5 & 8) != 0)
    {
      uint64_t v9 = *(int *)(a1 + 28);
      if (v9 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 28));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53F7550[v9];
      }
      if (a2) {
        v11 = @"missType";
      }
      else {
        v11 = @"miss_type";
      }
      [v4 setObject:v10 forKey:v11];

      char v5 = *(unsigned char *)(a1 + 36);
    }
    if ((v5 & 2) != 0)
    {
      v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
      [v4 setObject:v12 forKey:@"count"];

      char v5 = *(unsigned char *)(a1 + 36);
    }
    if (v5)
    {
      v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
      [v4 setObject:v13 forKey:@"bytes"];
    }
    if ([*(id *)(a1 + 8) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v15 = *(id *)(a1 + 8);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v17);
      }

      [v4 setObject:v14 forKey:@"errors"];
    }
    if ((*(unsigned char *)(a1 + 36) & 4) != 0)
    {
      v22 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      if (a2) {
        v23 = @"httpStatus";
      }
      else {
        v23 = @"http_status";
      }
      [v4 setObject:v22 forKey:v23];
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
  return -[GEOCacheMiss _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCacheMiss)initWithDictionary:(id)a3
{
  return (GEOCacheMiss *)-[GEOCacheMiss _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_67;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_67;
  }
  if (a3) {
    uint64_t v6 = @"requestorType";
  }
  else {
    uint64_t v6 = @"requestor_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"INTERACTIVE"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"NAV"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"PROACTIVE"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_REGION"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_REFRESH"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_REGION_AND_REFRESH"])
    {
      uint64_t v9 = 6;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setRequestorType:v9];
LABEL_26:

  if (a3) {
    v10 = @"missType";
  }
  else {
    v10 = @"miss_type";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"UNAVAILABLE"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"STALE_UNUSABLE"])
    {
      uint64_t v13 = 2;
    }
    else if ([v12 isEqualToString:@"STALE_USABLE"])
    {
      uint64_t v13 = 3;
    }
    else
    {
      uint64_t v13 = 0;
    }

    goto LABEL_42;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v11 intValue];
LABEL_42:
    [a1 setMissType:v13];
  }

  v14 = [v5 objectForKeyedSubscript:@"count"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCount:", objc_msgSend(v14, "unsignedIntValue"));
  }

  id v15 = [v5 objectForKeyedSubscript:@"bytes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBytes:", objc_msgSend(v15, "unsignedIntValue"));
  }

  uint64_t v16 = [v5 objectForKeyedSubscript:@"errors"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v29 = v5;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v23 = [GEOCacheMissLoadError alloc];
            if (a3) {
              uint64_t v24 = [(GEOCacheMissLoadError *)v23 initWithJSON:v22];
            }
            else {
              uint64_t v24 = [(GEOCacheMissLoadError *)v23 initWithDictionary:v22];
            }
            long long v25 = (void *)v24;
            [a1 addErrors:v24];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v19);
    }

    id v5 = v29;
  }

  if (a3) {
    long long v26 = @"httpStatus";
  }
  else {
    long long v26 = @"http_status";
  }
  long long v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setHttpStatus:", objc_msgSend(v27, "unsignedIntValue"));
  }

LABEL_67:
  return a1;
}

- (GEOCacheMiss)initWithJSON:(id)a3
{
  return (GEOCacheMiss *)-[GEOCacheMiss _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCacheMissIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCacheMissReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_flags) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = self->_errors;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = a3;
  [(GEOCacheMiss *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v9[8] = self->_requestorType;
    *((unsigned char *)v9 + 36) |= 0x10u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
LABEL_17:
      v9[5] = self->_count;
      *((unsigned char *)v9 + 36) |= 2u;
      if ((*(unsigned char *)&self->_flags & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v9[7] = self->_missType;
  *((unsigned char *)v9 + 36) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_17;
  }
LABEL_4:
  if (flags)
  {
LABEL_5:
    v9[4] = self->_bytes;
    *((unsigned char *)v9 + 36) |= 1u;
  }
LABEL_6:
  if ([(GEOCacheMiss *)self errorsCount])
  {
    [v9 clearErrors];
    unint64_t v5 = [(GEOCacheMiss *)self errorsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOCacheMiss *)self errorsAtIndex:i];
        [v9 addErrors:v8];
      }
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    v9[6] = self->_httpStatus;
    *((unsigned char *)v9 + 36) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_requestorType;
    *(unsigned char *)(v5 + 36) |= 0x10u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_missType;
  *(unsigned char *)(v5 + 36) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_18:
  *(_DWORD *)(v5 + 20) = self->_count;
  *(unsigned char *)(v5 + 36) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_5:
    *(_DWORD *)(v5 + 16) = self->_bytes;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
LABEL_6:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_errors;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [(id)v6 addErrors:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_httpStatus;
    *(unsigned char *)(v6 + 36) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  [(GEOCacheMiss *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 36);
  if ((flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) == 0 || self->_requestorType != *((_DWORD *)v4 + 8)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_missType != *((_DWORD *)v4 + 7)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_count != *((_DWORD *)v4 + 5)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_bytes != *((_DWORD *)v4 + 4)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_29;
  }
  errors = self->_errors;
  if ((unint64_t)errors | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](errors, "isEqual:"))
    {
LABEL_29:
      BOOL v8 = 0;
      goto LABEL_30;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 36);
  }
  BOOL v8 = (v6 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_httpStatus != *((_DWORD *)v4 + 6)) {
      goto LABEL_29;
    }
    BOOL v8 = 1;
  }
LABEL_30:

  return v8;
}

- (unint64_t)hash
{
  [(GEOCacheMiss *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    uint64_t v3 = 2654435761 * self->_requestorType;
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_missType;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if (*(unsigned char *)&self->_flags) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_count;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_bytes;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v6 = 0;
LABEL_10:
  uint64_t v7 = [(NSMutableArray *)self->_errors hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_httpStatus;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x10) != 0)
  {
    self->_requestorType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_flags |= 0x10u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_missType = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_flags |= 8u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_18:
  self->_count = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_flags |= 2u;
  if (*((unsigned char *)v4 + 36))
  {
LABEL_5:
    self->_bytes = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_6:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEOCacheMiss addErrors:](self, "addErrors:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    self->_httpStatus = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_flags |= 4u;
  }
}

- (void).cxx_destruct
{
}

@end