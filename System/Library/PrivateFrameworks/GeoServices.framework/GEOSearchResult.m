@interface GEOSearchResult
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBusinessId;
- (BOOL)hasIsEnrichedItem;
- (BOOL)hasLocalSearchProviderId;
- (BOOL)hasResultIndex;
- (BOOL)hasResultType;
- (BOOL)isEnrichedItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSearchResult)initWithDictionary:(id)a3;
- (GEOSearchResult)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)resultTypeAsString:(int)a3;
- (int)StringAsResultType:(id)a3;
- (int)resultType;
- (unint64_t)businessId;
- (unint64_t)hash;
- (unsigned)localSearchProviderId;
- (unsigned)resultIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBusinessId:(unint64_t)a3;
- (void)setHasBusinessId:(BOOL)a3;
- (void)setHasIsEnrichedItem:(BOOL)a3;
- (void)setHasLocalSearchProviderId:(BOOL)a3;
- (void)setHasResultIndex:(BOOL)a3;
- (void)setHasResultType:(BOOL)a3;
- (void)setIsEnrichedItem:(BOOL)a3;
- (void)setLocalSearchProviderId:(unsigned int)a3;
- (void)setResultIndex:(unsigned int)a3;
- (void)setResultType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSearchResult

- (int)resultType
{
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    return self->_resultType;
  }
  else {
    return 0;
  }
}

- (void)setResultType:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_resultType = a3;
}

- (void)setHasResultType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasResultType
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)resultTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F8BC0[a3];
  }

  return v3;
}

- (int)StringAsResultType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SEARCH_RESULTS_RESULT_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULTS_RESULT_TYPE_ENRICHED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULTS_RESULT_TYPE_MAPS_RESULT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULTS_RESULT_TYPE_GUIDE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
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

- (unsigned)localSearchProviderId
{
  return self->_localSearchProviderId;
}

- (void)setLocalSearchProviderId:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_localSearchProviderId = a3;
}

- (void)setHasLocalSearchProviderId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLocalSearchProviderId
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)resultIndex
{
  return self->_resultIndex;
}

- (void)setResultIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_resultIndex = a3;
}

- (void)setHasResultIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasResultIndex
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)isEnrichedItem
{
  return self->_isEnrichedItem;
}

- (void)setIsEnrichedItem:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_isEnrichedItem = a3;
}

- (void)setHasIsEnrichedItem:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIsEnrichedItem
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSearchResult;
  int v4 = [(GEOSearchResult *)&v8 description];
  v5 = [(GEOSearchResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSearchResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_31;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 8) != 0)
  {
    uint64_t v6 = *(int *)(a1 + 24);
    if (v6 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E53F8BC0[v6];
    }
    if (a2) {
      objc_super v8 = @"resultType";
    }
    else {
      objc_super v8 = @"result_type";
    }
    [v4 setObject:v7 forKey:v8];

    char v5 = *(unsigned char *)(a1 + 32);
  }
  if (v5)
  {
    v9 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
    if (a2) {
      v10 = @"businessId";
    }
    else {
      v10 = @"business_id";
    }
    [v4 setObject:v9 forKey:v10];

    char v5 = *(unsigned char *)(a1 + 32);
    if ((v5 & 2) == 0)
    {
LABEL_12:
      if ((v5 & 4) == 0) {
        goto LABEL_13;
      }
LABEL_23:
      v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
      if (a2) {
        v14 = @"resultIndex";
      }
      else {
        v14 = @"result_index";
      }
      [v4 setObject:v13 forKey:v14];

      if ((*(unsigned char *)(a1 + 32) & 0x10) == 0) {
        goto LABEL_31;
      }
      goto LABEL_27;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_12;
  }
  v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
  if (a2) {
    v12 = @"localSearchProviderId";
  }
  else {
    v12 = @"local_search_provider_id";
  }
  [v4 setObject:v11 forKey:v12];

  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 4) != 0) {
    goto LABEL_23;
  }
LABEL_13:
  if ((v5 & 0x10) != 0)
  {
LABEL_27:
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 28)];
    if (a2) {
      v16 = @"isEnrichedItem";
    }
    else {
      v16 = @"is_enriched_item";
    }
    [v4 setObject:v15 forKey:v16];
  }
LABEL_31:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSearchResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOSearchResult)initWithDictionary:(id)a3
{
  return (GEOSearchResult *)-[GEOSearchResult _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_41;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_41;
  }
  if (a3) {
    uint64_t v6 = @"resultType";
  }
  else {
    uint64_t v6 = @"result_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"SEARCH_RESULTS_RESULT_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"SEARCH_RESULTS_RESULT_TYPE_ENRICHED"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"SEARCH_RESULTS_RESULT_TYPE_MAPS_RESULT"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"SEARCH_RESULTS_RESULT_TYPE_GUIDE"])
    {
      uint64_t v9 = 3;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_19:
    [a1 setResultType:v9];
  }

  if (a3) {
    v10 = @"businessId";
  }
  else {
    v10 = @"business_id";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBusinessId:", objc_msgSend(v11, "unsignedLongLongValue"));
  }

  if (a3) {
    v12 = @"localSearchProviderId";
  }
  else {
    v12 = @"local_search_provider_id";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLocalSearchProviderId:", objc_msgSend(v13, "unsignedIntValue"));
  }

  if (a3) {
    v14 = @"resultIndex";
  }
  else {
    v14 = @"result_index";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setResultIndex:", objc_msgSend(v15, "unsignedIntValue"));
  }

  if (a3) {
    v16 = @"isEnrichedItem";
  }
  else {
    v16 = @"is_enriched_item";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsEnrichedItem:", objc_msgSend(v17, "BOOLValue"));
  }

LABEL_41:
  return a1;
}

- (GEOSearchResult)initWithJSON:(id)a3
{
  return (GEOSearchResult *)-[GEOSearchResult _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSearchResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSearchResultReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOSearchResult *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v5[6] = self->_resultType;
    *((unsigned char *)v5 + 32) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v5 + 1) = self->_businessId;
  *((unsigned char *)v5 + 32) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v5[4] = self->_localSearchProviderId;
  *((unsigned char *)v5 + 32) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v5[5] = self->_resultIndex;
  *((unsigned char *)v5 + 32) |= 4u;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_6:
    *((unsigned char *)v5 + 28) = self->_isEnrichedItem;
    *((unsigned char *)v5 + 32) |= 0x10u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)result + 6) = self->_resultType;
    *((unsigned char *)result + 32) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = self->_businessId;
  *((unsigned char *)result + 32) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 4) = self->_localSearchProviderId;
  *((unsigned char *)result + 32) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 5) = self->_resultIndex;
  *((unsigned char *)result + 32) |= 4u;
  if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
    return result;
  }
LABEL_6:
  *((unsigned char *)result + 28) = self->_isEnrichedItem;
  *((unsigned char *)result + 32) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  [(GEOSearchResult *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_resultType != *((_DWORD *)v4 + 6)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_businessId != *((void *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_localSearchProviderId != *((_DWORD *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_resultIndex != *((_DWORD *)v4 + 5)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_24;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 0x10) == 0;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) == 0)
    {
LABEL_24:
      BOOL v5 = 0;
      goto LABEL_25;
    }
    if (self->_isEnrichedItem)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_24;
    }
    BOOL v5 = 1;
  }
LABEL_25:

  return v5;
}

- (unint64_t)hash
{
  [(GEOSearchResult *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v3 = 2654435761 * self->_resultType;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_businessId;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_localSearchProviderId;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
LABEL_9:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_resultIndex;
  if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_isEnrichedItem;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 8) != 0)
  {
    self->_resultType = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_flags |= 8u;
    char v4 = *((unsigned char *)v5 + 32);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v5 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_businessId = *((void *)v5 + 1);
  *(unsigned char *)&self->_flags |= 1u;
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_localSearchProviderId = *((_DWORD *)v5 + 4);
  *(unsigned char *)&self->_flags |= 2u;
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 4) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_resultIndex = *((_DWORD *)v5 + 5);
  *(unsigned char *)&self->_flags |= 4u;
  if ((*((unsigned char *)v5 + 32) & 0x10) != 0)
  {
LABEL_6:
    self->_isEnrichedItem = *((unsigned char *)v5 + 28);
    *(unsigned char *)&self->_flags |= 0x10u;
  }
LABEL_7:
}

@end