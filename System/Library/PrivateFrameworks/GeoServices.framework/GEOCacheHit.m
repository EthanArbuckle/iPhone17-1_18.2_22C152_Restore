@interface GEOCacheHit
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBytes;
- (BOOL)hasCount;
- (BOOL)hasRequestorType;
- (BOOL)hasTileSourceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCacheHit)initWithDictionary:(id)a3;
- (GEOCacheHit)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)requestorTypeAsString:(int)a3;
- (id)tileSourceTypeAsString:(int)a3;
- (int)StringAsRequestorType:(id)a3;
- (int)StringAsTileSourceType:(id)a3;
- (int)requestorType;
- (int)tileSourceType;
- (unint64_t)hash;
- (unsigned)bytes;
- (unsigned)count;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBytes:(unsigned int)a3;
- (void)setCount:(unsigned int)a3;
- (void)setHasBytes:(BOOL)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasRequestorType:(BOOL)a3;
- (void)setHasTileSourceType:(BOOL)a3;
- (void)setRequestorType:(int)a3;
- (void)setTileSourceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCacheHit

- (int)requestorType
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_requestorType;
  }
  else {
    return 0;
  }
}

- (void)setRequestorType:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_requestorType = a3;
}

- (void)setHasRequestorType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasRequestorType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
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

- (int)tileSourceType
{
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    return self->_tileSourceType;
  }
  else {
    return 0;
  }
}

- (void)setTileSourceType:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_tileSourceType = a3;
}

- (void)setHasTileSourceType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasTileSourceType
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)tileSourceTypeAsString:(int)a3
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

- (int)StringAsTileSourceType:(id)a3
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCacheHit;
  int v4 = [(GEOCacheHit *)&v8 description];
  v5 = [(GEOCacheHit *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCacheHit _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 24);
    if ((v5 & 4) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 16);
      if (v6 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
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

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if ((v5 & 8) != 0)
    {
      uint64_t v9 = *(int *)(a1 + 20);
      if (v9 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53F7518[v9];
      }
      if (a2) {
        v11 = @"tileSourceType";
      }
      else {
        v11 = @"tile_source_type";
      }
      [v4 setObject:v10 forKey:v11];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if ((v5 & 2) != 0)
    {
      v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 12)];
      [v4 setObject:v12 forKey:@"count"];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if (v5)
    {
      v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 8)];
      [v4 setObject:v13 forKey:@"bytes"];
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
  return -[GEOCacheHit _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCacheHit)initWithDictionary:(id)a3
{
  return (GEOCacheHit *)-[GEOCacheHit _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_54;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_54;
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
    v10 = @"tileSourceType";
  }
  else {
    v10 = @"tile_source_type";
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
    else if ([v12 isEqualToString:@"INTERACTIVE"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"NAV"])
    {
      uint64_t v13 = 2;
    }
    else if ([v12 isEqualToString:@"PROACTIVE"])
    {
      uint64_t v13 = 3;
    }
    else if ([v12 isEqualToString:@"PROACTIVE_REGION"])
    {
      uint64_t v13 = 4;
    }
    else if ([v12 isEqualToString:@"PROACTIVE_REFRESH"])
    {
      uint64_t v13 = 5;
    }
    else if ([v12 isEqualToString:@"PROACTIVE_REGION_AND_REFRESH"])
    {
      uint64_t v13 = 6;
    }
    else
    {
      uint64_t v13 = 0;
    }

    goto LABEL_48;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v11 intValue];
LABEL_48:
    [a1 setTileSourceType:v13];
  }

  v14 = [v5 objectForKeyedSubscript:@"count"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCount:", objc_msgSend(v14, "unsignedIntValue"));
  }

  v15 = [v5 objectForKeyedSubscript:@"bytes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBytes:", objc_msgSend(v15, "unsignedIntValue"));
  }

LABEL_54:
  return a1;
}

- (GEOCacheHit)initWithJSON:(id)a3
{
  return (GEOCacheHit *)-[GEOCacheHit _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCacheHitIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCacheHitReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
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
LABEL_11:
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_flags) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOCacheHit *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[4] = self->_requestorType;
    *((unsigned char *)v5 + 24) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[5] = self->_tileSourceType;
  *((unsigned char *)v5 + 24) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v5[3] = self->_count;
  *((unsigned char *)v5 + 24) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_5:
    v5[2] = self->_bytes;
    *((unsigned char *)v5 + 24) |= 1u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_requestorType;
    *((unsigned char *)result + 24) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_tileSourceType;
  *((unsigned char *)result + 24) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 3) = self->_count;
  *((unsigned char *)result + 24) |= 2u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 2) = self->_bytes;
  *((unsigned char *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOCacheHit *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_requestorType != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0 || self->_tileSourceType != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_count != *((_DWORD *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_bytes != *((_DWORD *)v4 + 2)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  [(GEOCacheHit *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_requestorType;
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_tileSourceType;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if (*(unsigned char *)&self->_flags) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
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
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_bytes;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 4) != 0)
  {
    self->_requestorType = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 24);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v5 + 24) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_tileSourceType = *((_DWORD *)v5 + 5);
  *(unsigned char *)&self->_flags |= 8u;
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_count = *((_DWORD *)v5 + 3);
  *(unsigned char *)&self->_flags |= 2u;
  if (*((unsigned char *)v5 + 24))
  {
LABEL_5:
    self->_bytes = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_6:
}

@end