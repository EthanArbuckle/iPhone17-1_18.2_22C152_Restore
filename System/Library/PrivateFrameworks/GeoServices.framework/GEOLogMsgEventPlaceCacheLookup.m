@interface GEOLogMsgEventPlaceCacheLookup
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBusinessId;
- (BOOL)hasBytes;
- (BOOL)hasLocalSearchProviderID;
- (BOOL)hasLookupResult;
- (BOOL)hasRequestAppIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventPlaceCacheLookup)initWithDictionary:(id)a3;
- (GEOLogMsgEventPlaceCacheLookup)initWithJSON:(id)a3;
- (NSString)requestAppIdentifier;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)lookupResultAsString:(int)a3;
- (int)StringAsLookupResult:(id)a3;
- (int)localSearchProviderID;
- (int)lookupResult;
- (unint64_t)businessId;
- (unint64_t)hash;
- (unsigned)bytes;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBusinessId:(unint64_t)a3;
- (void)setBytes:(unsigned int)a3;
- (void)setHasBusinessId:(BOOL)a3;
- (void)setHasBytes:(BOOL)a3;
- (void)setHasLocalSearchProviderID:(BOOL)a3;
- (void)setHasLookupResult:(BOOL)a3;
- (void)setLocalSearchProviderID:(int)a3;
- (void)setLookupResult:(int)a3;
- (void)setRequestAppIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventPlaceCacheLookup

- (BOOL)hasRequestAppIdentifier
{
  return self->_requestAppIdentifier != 0;
}

- (NSString)requestAppIdentifier
{
  return self->_requestAppIdentifier;
}

- (void)setRequestAppIdentifier:(id)a3
{
}

- (unint64_t)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_businessId = a3;
}

- (void)setHasBusinessId:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasBusinessId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (int)localSearchProviderID
{
  return self->_localSearchProviderID;
}

- (void)setLocalSearchProviderID:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_localSearchProviderID = a3;
}

- (void)setHasLocalSearchProviderID:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasLocalSearchProviderID
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)bytes
{
  return self->_bytes;
}

- (void)setBytes:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_bytes = a3;
}

- (void)setHasBytes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasBytes
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)lookupResult
{
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    return self->_lookupResult;
  }
  else {
    return 0;
  }
}

- (void)setLookupResult:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_lookupResult = a3;
}

- (void)setHasLookupResult:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasLookupResult
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)lookupResultAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7990[a3];
  }

  return v3;
}

- (int)StringAsLookupResult:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PLACE_CACHE_LOOKUP_RESULT_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PLACE_CACHE_LOOKUP_RESULT_UNAVAILABLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PLACE_CACHE_LOOKUP_RESULT_UNUSABLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PLACE_CACHE_LOOKUP_RESULT_USABLE"])
  {
    int v4 = 3;
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
  v8.super_class = (Class)GEOLogMsgEventPlaceCacheLookup;
  int v4 = [(GEOLogMsgEventPlaceCacheLookup *)&v8 description];
  v5 = [(GEOLogMsgEventPlaceCacheLookup *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventPlaceCacheLookup _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_25;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 requestAppIdentifier];
  if (v5)
  {
    if (a2) {
      v6 = @"requestAppIdentifier";
    }
    else {
      v6 = @"request_app_identifier";
    }
    [v4 setObject:v5 forKey:v6];
  }

  char v7 = *(unsigned char *)(a1 + 36);
  if (v7)
  {
    objc_super v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
    if (a2) {
      v9 = @"businessId";
    }
    else {
      v9 = @"business_id";
    }
    [v4 setObject:v8 forKey:v9];

    char v7 = *(unsigned char *)(a1 + 36);
  }
  if ((v7 & 4) == 0)
  {
    if ((v7 & 2) == 0) {
      goto LABEL_14;
    }
LABEL_17:
    v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    [v4 setObject:v11 forKey:@"bytes"];

    if ((*(unsigned char *)(a1 + 36) & 8) == 0) {
      goto LABEL_25;
    }
LABEL_18:
    uint64_t v12 = *(int *)(a1 + 32);
    if (v12 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E53F7990[v12];
    }
    if (a2) {
      v14 = @"lookupResult";
    }
    else {
      v14 = @"lookup_result";
    }
    [v4 setObject:v13 forKey:v14];

    goto LABEL_25;
  }
  v10 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 28)];
  [v4 setObject:v10 forKey:@"localSearchProviderID"];

  char v7 = *(unsigned char *)(a1 + 36);
  if ((v7 & 2) != 0) {
    goto LABEL_17;
  }
LABEL_14:
  if ((v7 & 8) != 0) {
    goto LABEL_18;
  }
LABEL_25:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventPlaceCacheLookup _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventPlaceCacheLookup)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventPlaceCacheLookup *)-[GEOLogMsgEventPlaceCacheLookup _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"requestAppIdentifier";
      }
      else {
        v6 = @"request_app_identifier";
      }
      char v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setRequestAppIdentifier:v8];
      }
      if (a3) {
        v9 = @"businessId";
      }
      else {
        v9 = @"business_id";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setBusinessId:", objc_msgSend(v10, "unsignedLongLongValue"));
      }

      v11 = [v5 objectForKeyedSubscript:@"localSearchProviderID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLocalSearchProviderID:", objc_msgSend(v11, "intValue"));
      }

      uint64_t v12 = [v5 objectForKeyedSubscript:@"bytes"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setBytes:", objc_msgSend(v12, "unsignedIntValue"));
      }

      if (a3) {
        v13 = @"lookupResult";
      }
      else {
        v13 = @"lookup_result";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
        if ([v15 isEqualToString:@"PLACE_CACHE_LOOKUP_RESULT_UNKNOWN"])
        {
          uint64_t v16 = 0;
        }
        else if ([v15 isEqualToString:@"PLACE_CACHE_LOOKUP_RESULT_UNAVAILABLE"])
        {
          uint64_t v16 = 1;
        }
        else if ([v15 isEqualToString:@"PLACE_CACHE_LOOKUP_RESULT_UNUSABLE"])
        {
          uint64_t v16 = 2;
        }
        else if ([v15 isEqualToString:@"PLACE_CACHE_LOOKUP_RESULT_USABLE"])
        {
          uint64_t v16 = 3;
        }
        else
        {
          uint64_t v16 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_34:

          goto LABEL_35;
        }
        uint64_t v16 = [v14 intValue];
      }
      [a1 setLookupResult:v16];
      goto LABEL_34;
    }
  }
LABEL_35:

  return a1;
}

- (GEOLogMsgEventPlaceCacheLookup)initWithJSON:(id)a3
{
  return (GEOLogMsgEventPlaceCacheLookup *)-[GEOLogMsgEventPlaceCacheLookup _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventPlaceCacheLookupIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventPlaceCacheLookupReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_requestAppIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_8:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgEventPlaceCacheLookup *)self readAll:0];
  if (self->_requestAppIdentifier) {
    objc_msgSend(v5, "setRequestAppIdentifier:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    *((void *)v5 + 1) = self->_businessId;
    *((unsigned char *)v5 + 36) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v5 + 7) = self->_localSearchProviderID;
  *((unsigned char *)v5 + 36) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)v5 + 6) = self->_bytes;
  *((unsigned char *)v5 + 36) |= 2u;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 8) = self->_lookupResult;
    *((unsigned char *)v5 + 36) |= 8u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestAppIdentifier copyWithZone:a3];
  char v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 8) = self->_businessId;
    *(unsigned char *)(v5 + 36) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 24) = self->_bytes;
      *(unsigned char *)(v5 + 36) |= 2u;
      if ((*(unsigned char *)&self->_flags & 8) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_localSearchProviderID;
  *(unsigned char *)(v5 + 36) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((flags & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 32) = self->_lookupResult;
    *(unsigned char *)(v5 + 36) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  [(GEOLogMsgEventPlaceCacheLookup *)self readAll:1];
  [v4 readAll:1];
  requestAppIdentifier = self->_requestAppIdentifier;
  if ((unint64_t)requestAppIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](requestAppIdentifier, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_businessId != *((void *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_23:
    BOOL v6 = 0;
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_localSearchProviderID != *((_DWORD *)v4 + 7)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_bytes != *((_DWORD *)v4 + 6)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_23;
  }
  BOOL v6 = (*((unsigned char *)v4 + 36) & 8) == 0;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_lookupResult != *((_DWORD *)v4 + 8)) {
      goto LABEL_23;
    }
    BOOL v6 = 1;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventPlaceCacheLookup *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_requestAppIdentifier hash];
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v4 = 2654435761u * self->_businessId;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_localSearchProviderID;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_bytes;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_lookupResult;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  if (*((void *)v5 + 2)) {
    -[GEOLogMsgEventPlaceCacheLookup setRequestAppIdentifier:](self, "setRequestAppIdentifier:");
  }
  char v4 = *((unsigned char *)v5 + 36);
  if (v4)
  {
    self->_businessId = *((void *)v5 + 1);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 36);
    if ((v4 & 4) == 0)
    {
LABEL_5:
      if ((v4 & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v5 + 36) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_localSearchProviderID = *((_DWORD *)v5 + 7);
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v5 + 36);
  if ((v4 & 2) == 0)
  {
LABEL_6:
    if ((v4 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  self->_bytes = *((_DWORD *)v5 + 6);
  *(unsigned char *)&self->_flags |= 2u;
  if ((*((unsigned char *)v5 + 36) & 8) != 0)
  {
LABEL_7:
    self->_lookupResult = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_flags |= 8u;
  }
LABEL_8:
}

- (void).cxx_destruct
{
}

@end