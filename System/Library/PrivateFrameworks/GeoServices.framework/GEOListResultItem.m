@interface GEOListResultItem
+ (BOOL)isValid:(id)a3;
- (BOOL)eventuallyVisible;
- (BOOL)hasBusinessId;
- (BOOL)hasEventuallyVisible;
- (BOOL)hasInitiallyVisible;
- (BOOL)hasLatency;
- (BOOL)hasResultType;
- (BOOL)hasTappedCount;
- (BOOL)initiallyVisible;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOListResultItem)initWithDictionary:(id)a3;
- (GEOListResultItem)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)resultTypeAsString:(int)a3;
- (int)StringAsResultType:(id)a3;
- (int)resultType;
- (int)tappedCount;
- (int64_t)latency;
- (unint64_t)businessId;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBusinessId:(unint64_t)a3;
- (void)setEventuallyVisible:(BOOL)a3;
- (void)setHasBusinessId:(BOOL)a3;
- (void)setHasEventuallyVisible:(BOOL)a3;
- (void)setHasInitiallyVisible:(BOOL)a3;
- (void)setHasLatency:(BOOL)a3;
- (void)setHasResultType:(BOOL)a3;
- (void)setHasTappedCount:(BOOL)a3;
- (void)setInitiallyVisible:(BOOL)a3;
- (void)setLatency:(int64_t)a3;
- (void)setResultType:(int)a3;
- (void)setTappedCount:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOListResultItem

- (int)resultType
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_resultType;
  }
  else {
    return 0;
  }
}

- (void)setResultType:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_resultType = a3;
}

- (void)setHasResultType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasResultType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
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
    char v3 = off_1E53EBE18[a3];
  }

  return v3;
}

- (int)StringAsResultType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESULT_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESULT_TYPE_SERVER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESULT_TYPE_CLIENT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESULT_TYPE_PROACTIVE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)initiallyVisible
{
  return self->_initiallyVisible;
}

- (void)setInitiallyVisible:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_initiallyVisible = a3;
}

- (void)setHasInitiallyVisible:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasInitiallyVisible
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (BOOL)eventuallyVisible
{
  return self->_eventuallyVisible;
}

- (void)setEventuallyVisible:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_eventuallyVisible = a3;
}

- (void)setHasEventuallyVisible:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasEventuallyVisible
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (int64_t)latency
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_latency;
  }
  else {
    return -1;
  }
}

- (void)setLatency:(int64_t)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_latency = a3;
}

- (void)setHasLatency:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLatency
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)tappedCount
{
  return self->_tappedCount;
}

- (void)setTappedCount:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_tappedCount = a3;
}

- (void)setHasTappedCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasTappedCount
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOListResultItem;
  int v4 = [(GEOListResultItem *)&v8 description];
  v5 = [(GEOListResultItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOListResultItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_33;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 36);
  if ((v5 & 4) != 0)
  {
    uint64_t v6 = *(int *)(a1 + 24);
    if (v6 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E53EBE18[v6];
    }
    if (a2) {
      objc_super v8 = @"resultType";
    }
    else {
      objc_super v8 = @"result_type";
    }
    [v4 setObject:v7 forKey:v8];

    char v5 = *(unsigned char *)(a1 + 36);
  }
  if ((v5 & 0x20) != 0)
  {
    v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 33)];
    if (a2) {
      v10 = @"initiallyVisible";
    }
    else {
      v10 = @"initially_visible";
    }
    [v4 setObject:v9 forKey:v10];

    char v5 = *(unsigned char *)(a1 + 36);
    if ((v5 & 0x10) == 0)
    {
LABEL_12:
      if ((v5 & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_24;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_12;
  }
  v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  if (a2) {
    v12 = @"eventuallyVisible";
  }
  else {
    v12 = @"eventually_visible";
  }
  [v4 setObject:v11 forKey:v12];

  char v5 = *(unsigned char *)(a1 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_13:
    if ((v5 & 8) == 0) {
      goto LABEL_14;
    }
LABEL_25:
    v14 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 28)];
    if (a2) {
      v15 = @"tappedCount";
    }
    else {
      v15 = @"tapped_count";
    }
    [v4 setObject:v14 forKey:v15];

    if ((*(unsigned char *)(a1 + 36) & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_29;
  }
LABEL_24:
  v13 = [NSNumber numberWithLongLong:*(void *)(a1 + 16)];
  [v4 setObject:v13 forKey:@"latency"];

  char v5 = *(unsigned char *)(a1 + 36);
  if ((v5 & 8) != 0) {
    goto LABEL_25;
  }
LABEL_14:
  if (v5)
  {
LABEL_29:
    v16 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
    if (a2) {
      v17 = @"businessId";
    }
    else {
      v17 = @"business_id";
    }
    [v4 setObject:v16 forKey:v17];
  }
LABEL_33:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOListResultItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOListResultItem)initWithDictionary:(id)a3
{
  return (GEOListResultItem *)-[GEOListResultItem _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_43;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_43;
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
    if ([v8 isEqualToString:@"RESULT_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"RESULT_TYPE_SERVER"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"RESULT_TYPE_CLIENT"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"RESULT_TYPE_PROACTIVE"])
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
    v10 = @"initiallyVisible";
  }
  else {
    v10 = @"initially_visible";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setInitiallyVisible:", objc_msgSend(v11, "BOOLValue"));
  }

  if (a3) {
    v12 = @"eventuallyVisible";
  }
  else {
    v12 = @"eventually_visible";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEventuallyVisible:", objc_msgSend(v13, "BOOLValue"));
  }

  v14 = [v5 objectForKeyedSubscript:@"latency"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLatency:", objc_msgSend(v14, "longLongValue"));
  }

  if (a3) {
    v15 = @"tappedCount";
  }
  else {
    v15 = @"tapped_count";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTappedCount:", objc_msgSend(v16, "intValue"));
  }

  if (a3) {
    v17 = @"businessId";
  }
  else {
    v17 = @"business_id";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBusinessId:", objc_msgSend(v18, "unsignedLongLongValue"));
  }

LABEL_43:
  return a1;
}

- (GEOListResultItem)initWithJSON:(id)a3
{
  return (GEOListResultItem *)-[GEOListResultItem _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOListResultItemIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOListResultItemReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt64Field();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_flags) {
LABEL_7:
  }
    PBDataWriterWriteUint64Field();
LABEL_8:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOListResultItem *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[6] = self->_resultType;
    *((unsigned char *)v5 + 36) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v5 + 33) = self->_initiallyVisible;
  *((unsigned char *)v5 + 36) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)v5 + 32) = self->_eventuallyVisible;
  *((unsigned char *)v5 + 36) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)v5 + 2) = self->_latency;
  *((unsigned char *)v5 + 36) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v5[7] = self->_tappedCount;
  *((unsigned char *)v5 + 36) |= 8u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_7:
    *((void *)v5 + 1) = self->_businessId;
    *((unsigned char *)v5 + 36) |= 1u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 6) = self->_resultType;
    *((unsigned char *)result + 36) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 33) = self->_initiallyVisible;
  *((unsigned char *)result + 36) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((unsigned char *)result + 32) = self->_eventuallyVisible;
  *((unsigned char *)result + 36) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)result + 2) = self->_latency;
  *((unsigned char *)result + 36) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 7) = self->_tappedCount;
  *((unsigned char *)result + 36) |= 8u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_7:
  *((void *)result + 1) = self->_businessId;
  *((unsigned char *)result + 36) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  [(GEOListResultItem *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_resultType != *((_DWORD *)v4 + 6)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x20) == 0) {
      goto LABEL_37;
    }
    if (self->_initiallyVisible)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_37;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x20) != 0)
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
    {
      if (self->_eventuallyVisible)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_37;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_23;
      }
    }
LABEL_37:
    BOOL v5 = 0;
    goto LABEL_38;
  }
  if ((*((unsigned char *)v4 + 36) & 0x10) != 0) {
    goto LABEL_37;
  }
LABEL_23:
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_latency != *((void *)v4 + 2)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_tappedCount != *((_DWORD *)v4 + 7)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_37;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_businessId != *((void *)v4 + 1)) {
      goto LABEL_37;
    }
    BOOL v5 = 1;
  }
LABEL_38:

  return v5;
}

- (unint64_t)hash
{
  [(GEOListResultItem *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_resultType;
    if ((*(unsigned char *)&self->_flags & 0x20) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_initiallyVisible;
      if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_eventuallyVisible;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_latency;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_7;
    }
LABEL_13:
    unint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_tappedCount;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  unint64_t v8 = 2654435761u * self->_businessId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 36);
  if ((v4 & 4) != 0)
  {
    self->_resultType = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 36);
    if ((v4 & 0x20) == 0)
    {
LABEL_3:
      if ((v4 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v5 + 36) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_initiallyVisible = *((unsigned char *)v5 + 33);
  *(unsigned char *)&self->_flags |= 0x20u;
  char v4 = *((unsigned char *)v5 + 36);
  if ((v4 & 0x10) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_eventuallyVisible = *((unsigned char *)v5 + 32);
  *(unsigned char *)&self->_flags |= 0x10u;
  char v4 = *((unsigned char *)v5 + 36);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_latency = *((void *)v5 + 2);
  *(unsigned char *)&self->_flags |= 2u;
  char v4 = *((unsigned char *)v5 + 36);
  if ((v4 & 8) == 0)
  {
LABEL_6:
    if ((v4 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_tappedCount = *((_DWORD *)v5 + 7);
  *(unsigned char *)&self->_flags |= 8u;
  if (*((unsigned char *)v5 + 36))
  {
LABEL_7:
    self->_businessId = *((void *)v5 + 1);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_8:
}

@end