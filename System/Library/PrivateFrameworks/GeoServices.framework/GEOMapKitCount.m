@interface GEOMapKitCount
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAppCount;
- (BOOL)hasAppType;
- (BOOL)hasCountType;
- (BOOL)hasUseCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapKitCount)initWithDictionary:(id)a3;
- (GEOMapKitCount)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)appTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)countTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsAppType:(id)a3;
- (int)StringAsCountType:(id)a3;
- (int)appType;
- (int)countType;
- (unint64_t)hash;
- (unsigned)appCount;
- (unsigned)useCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppCount:(unsigned int)a3;
- (void)setAppType:(int)a3;
- (void)setCountType:(int)a3;
- (void)setHasAppCount:(BOOL)a3;
- (void)setHasAppType:(BOOL)a3;
- (void)setHasCountType:(BOOL)a3;
- (void)setHasUseCount:(BOOL)a3;
- (void)setUseCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapKitCount

- (int)countType
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_countType;
  }
  else {
    return 0;
  }
}

- (void)setCountType:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_countType = a3;
}

- (void)setHasCountType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasCountType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)countTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F8458[a3];
  }

  return v3;
}

- (int)StringAsCountType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MAP_VIEW_FOREGROUNDED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SNAPSHOTTER_USED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PLACECARD_SHOWN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"END_SENTINEL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)appType
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_appType;
  }
  else {
    return 0;
  }
}

- (void)setAppType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_appType = a3;
}

- (void)setHasAppType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAppType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)appTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F8478[a3];
  }

  return v3;
}

- (int)StringAsAppType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FIRST_PARTY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SECOND_PARTY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"THIRD_PARTY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DAEMONS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"END_SENTINEL"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)useCount
{
  return self->_useCount;
}

- (void)setUseCount:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_useCount = a3;
}

- (void)setHasUseCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasUseCount
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)appCount
{
  return self->_appCount;
}

- (void)setAppCount:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_appCount = a3;
}

- (void)setHasAppCount:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAppCount
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapKitCount;
  int v4 = [(GEOMapKitCount *)&v8 description];
  v5 = [(GEOMapKitCount *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapKitCount _dictionaryRepresentation:]((uint64_t)self, 0);
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
      if (v6 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53F8458[v6];
      }
      if (a2) {
        objc_super v8 = @"countType";
      }
      else {
        objc_super v8 = @"count_type";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if ((v5 & 2) != 0)
    {
      uint64_t v9 = *(int *)(a1 + 12);
      if (v9 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 12));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53F8478[v9];
      }
      if (a2) {
        v11 = @"appType";
      }
      else {
        v11 = @"app_type";
      }
      [v4 setObject:v10 forKey:v11];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if ((v5 & 8) != 0)
    {
      v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
      [v4 setObject:v12 forKey:@"useCount"];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if (v5)
    {
      v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 8)];
      [v4 setObject:v13 forKey:@"appCount"];
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
  return -[GEOMapKitCount _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOMapKitCount)initWithDictionary:(id)a3
{
  return (GEOMapKitCount *)-[GEOMapKitCount _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_44;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_44;
  }
  if (a3) {
    uint64_t v6 = @"countType";
  }
  else {
    uint64_t v6 = @"count_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"MAP_VIEW_FOREGROUNDED"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"SNAPSHOTTER_USED"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"PLACECARD_SHOWN"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"END_SENTINEL"])
    {
      uint64_t v9 = 3;
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
      goto LABEL_20;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setCountType:v9];
LABEL_20:

  if (a3) {
    v10 = @"appType";
  }
  else {
    v10 = @"app_type";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"FIRST_PARTY"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"SECOND_PARTY"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"THIRD_PARTY"])
    {
      uint64_t v13 = 2;
    }
    else if ([v12 isEqualToString:@"DAEMONS"])
    {
      uint64_t v13 = 3;
    }
    else if ([v12 isEqualToString:@"END_SENTINEL"])
    {
      uint64_t v13 = 4;
    }
    else
    {
      uint64_t v13 = 0;
    }

    goto LABEL_38;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v11 intValue];
LABEL_38:
    [a1 setAppType:v13];
  }

  v14 = [v5 objectForKeyedSubscript:@"useCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setUseCount:", objc_msgSend(v14, "unsignedIntValue"));
  }

  v15 = [v5 objectForKeyedSubscript:@"appCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAppCount:", objc_msgSend(v15, "unsignedIntValue"));
  }

LABEL_44:
  return a1;
}

- (GEOMapKitCount)initWithJSON:(id)a3
{
  return (GEOMapKitCount *)-[GEOMapKitCount _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapKitCountIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapKitCountReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
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
  [(GEOMapKitCount *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[4] = self->_countType;
    *((unsigned char *)v5 + 24) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[3] = self->_appType;
  *((unsigned char *)v5 + 24) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v5[5] = self->_useCount;
  *((unsigned char *)v5 + 24) |= 8u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_5:
    v5[2] = self->_appCount;
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
    *((_DWORD *)result + 4) = self->_countType;
    *((unsigned char *)result + 24) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_appType;
  *((unsigned char *)result + 24) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 5) = self->_useCount;
  *((unsigned char *)result + 24) |= 8u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 2) = self->_appCount;
  *((unsigned char *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOMapKitCount *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_countType != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_appType != *((_DWORD *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0 || self->_useCount != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_appCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  [(GEOMapKitCount *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_countType;
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_appType;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
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
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_useCount;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_appCount;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 4) != 0)
  {
    self->_countType = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 24);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v5 + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_appType = *((_DWORD *)v5 + 3);
  *(unsigned char *)&self->_flags |= 2u;
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_useCount = *((_DWORD *)v5 + 5);
  *(unsigned char *)&self->_flags |= 8u;
  if (*((unsigned char *)v5 + 24))
  {
LABEL_5:
    self->_appCount = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_6:
}

@end