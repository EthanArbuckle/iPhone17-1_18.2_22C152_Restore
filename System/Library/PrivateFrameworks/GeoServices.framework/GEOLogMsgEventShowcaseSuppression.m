@interface GEOLogMsgEventShowcaseSuppression
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAdamId;
- (BOOL)hasBusinessId;
- (BOOL)hasLocalSearchProviderID;
- (BOOL)hasShowcaseId;
- (BOOL)hasSuppressionReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventShowcaseSuppression)init;
- (GEOLogMsgEventShowcaseSuppression)initWithData:(id)a3;
- (GEOLogMsgEventShowcaseSuppression)initWithDictionary:(id)a3;
- (GEOLogMsgEventShowcaseSuppression)initWithJSON:(id)a3;
- (NSString)adamId;
- (NSString)showcaseId;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)suppressionReasonAsString:(int)a3;
- (int)StringAsSuppressionReason:(id)a3;
- (int)localSearchProviderID;
- (int)suppressionReason;
- (unint64_t)businessId;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAdamId;
- (void)_readShowcaseId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAdamId:(id)a3;
- (void)setBusinessId:(unint64_t)a3;
- (void)setHasBusinessId:(BOOL)a3;
- (void)setHasLocalSearchProviderID:(BOOL)a3;
- (void)setHasSuppressionReason:(BOOL)a3;
- (void)setLocalSearchProviderID:(int)a3;
- (void)setShowcaseId:(id)a3;
- (void)setSuppressionReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventShowcaseSuppression

- (GEOLogMsgEventShowcaseSuppression)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventShowcaseSuppression;
  v2 = [(GEOLogMsgEventShowcaseSuppression *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventShowcaseSuppression)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventShowcaseSuppression;
  v3 = [(GEOLogMsgEventShowcaseSuppression *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_businessId = a3;
}

- (void)setHasBusinessId:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
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
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_localSearchProviderID = a3;
}

- (void)setHasLocalSearchProviderID:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLocalSearchProviderID
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readShowcaseId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventShowcaseSuppressionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShowcaseId_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasShowcaseId
{
  return self->_showcaseId != 0;
}

- (NSString)showcaseId
{
  -[GEOLogMsgEventShowcaseSuppression _readShowcaseId]((uint64_t)self);
  showcaseId = self->_showcaseId;

  return showcaseId;
}

- (void)setShowcaseId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_showcaseId, a3);
}

- (int)suppressionReason
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_suppressionReason;
  }
  else {
    return 0;
  }
}

- (void)setSuppressionReason:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  self->_suppressionReason = a3;
}

- (void)setHasSuppressionReason:(BOOL)a3
{
  if (a3) {
    char v3 = 36;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSuppressionReason
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)suppressionReasonAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7BF0[a3];
  }

  return v3;
}

- (int)StringAsSuppressionReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SHOWCASE_OTHER_SUPPRESSION_REASON"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SHOWCASE_DIRECTIONS_UNAVAILABLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SHOWCASE_APP_EXTENSION_UNAVAILABLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SHOWCASE_APP_CLIP_UNAVAILABLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SHOWCASE_APP_QUICK_LINK_UNAVAILABLE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SHOWCASE_PHONE_NUMBER_UNAVAILABLE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SHOWCASE_MESSAGE_URL_UNAVAILABLE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SHOWCASE_WEBSITE_URL_UNAVAILABLE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SHOWCASE_ARP_RATING_UNSUPPORTED"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SHOWCASE_ARP_PHOTOS_UNSUPPORTED"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readAdamId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventShowcaseSuppressionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdamId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAdamId
{
  return self->_adamId != 0;
}

- (NSString)adamId
{
  -[GEOLogMsgEventShowcaseSuppression _readAdamId]((uint64_t)self);
  adamId = self->_adamId;

  return adamId;
}

- (void)setAdamId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_adamId, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventShowcaseSuppression;
  int v4 = [(GEOLogMsgEventShowcaseSuppression *)&v8 description];
  v5 = [(GEOLogMsgEventShowcaseSuppression *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventShowcaseSuppression _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 60);
    if (v5)
    {
      objc_super v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      if (a2) {
        objc_super v7 = @"businessId";
      }
      else {
        objc_super v7 = @"business_id";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 60);
    }
    if ((v5 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
      [v4 setObject:v8 forKey:@"localSearchProviderID"];
    }
    v9 = [(id)a1 showcaseId];
    if (v9)
    {
      if (a2) {
        v10 = @"showcaseId";
      }
      else {
        v10 = @"showcase_id";
      }
      [v4 setObject:v9 forKey:v10];
    }

    if ((*(unsigned char *)(a1 + 60) & 4) != 0)
    {
      uint64_t v11 = *(int *)(a1 + 56);
      if (v11 >= 0xA)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 56));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_1E53F7BF0[v11];
      }
      if (a2) {
        v13 = @"suppressionReason";
      }
      else {
        v13 = @"suppression_reason";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = [(id)a1 adamId];
    if (v14)
    {
      if (a2) {
        v15 = @"adamId";
      }
      else {
        v15 = @"adam_id";
      }
      [v4 setObject:v14 forKey:v15];
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
  return -[GEOLogMsgEventShowcaseSuppression _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventShowcaseSuppression)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventShowcaseSuppression *)-[GEOLogMsgEventShowcaseSuppression _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_50;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_50;
  }
  if (a3) {
    objc_super v6 = @"businessId";
  }
  else {
    objc_super v6 = @"business_id";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBusinessId:", objc_msgSend(v7, "unsignedLongLongValue"));
  }

  objc_super v8 = [v5 objectForKeyedSubscript:@"localSearchProviderID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLocalSearchProviderID:", objc_msgSend(v8, "intValue"));
  }

  if (a3) {
    v9 = @"showcaseId";
  }
  else {
    v9 = @"showcase_id";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = (void *)[v10 copy];
    [a1 setShowcaseId:v11];
  }
  if (a3) {
    v12 = @"suppressionReason";
  }
  else {
    v12 = @"suppression_reason";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v13;
    if ([v14 isEqualToString:@"SHOWCASE_OTHER_SUPPRESSION_REASON"])
    {
      uint64_t v15 = 0;
    }
    else if ([v14 isEqualToString:@"SHOWCASE_DIRECTIONS_UNAVAILABLE"])
    {
      uint64_t v15 = 1;
    }
    else if ([v14 isEqualToString:@"SHOWCASE_APP_EXTENSION_UNAVAILABLE"])
    {
      uint64_t v15 = 2;
    }
    else if ([v14 isEqualToString:@"SHOWCASE_APP_CLIP_UNAVAILABLE"])
    {
      uint64_t v15 = 3;
    }
    else if ([v14 isEqualToString:@"SHOWCASE_APP_QUICK_LINK_UNAVAILABLE"])
    {
      uint64_t v15 = 4;
    }
    else if ([v14 isEqualToString:@"SHOWCASE_PHONE_NUMBER_UNAVAILABLE"])
    {
      uint64_t v15 = 5;
    }
    else if ([v14 isEqualToString:@"SHOWCASE_MESSAGE_URL_UNAVAILABLE"])
    {
      uint64_t v15 = 6;
    }
    else if ([v14 isEqualToString:@"SHOWCASE_WEBSITE_URL_UNAVAILABLE"])
    {
      uint64_t v15 = 7;
    }
    else if ([v14 isEqualToString:@"SHOWCASE_ARP_RATING_UNSUPPORTED"])
    {
      uint64_t v15 = 8;
    }
    else if ([v14 isEqualToString:@"SHOWCASE_ARP_PHOTOS_UNSUPPORTED"])
    {
      uint64_t v15 = 9;
    }
    else
    {
      uint64_t v15 = 0;
    }

    goto LABEL_43;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = [v13 intValue];
LABEL_43:
    [a1 setSuppressionReason:v15];
  }

  if (a3) {
    v16 = @"adamId";
  }
  else {
    v16 = @"adam_id";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = (void *)[v17 copy];
    [a1 setAdamId:v18];
  }
LABEL_50:

  return a1;
}

- (GEOLogMsgEventShowcaseSuppression)initWithJSON:(id)a3
{
  return (GEOLogMsgEventShowcaseSuppression *)-[GEOLogMsgEventShowcaseSuppression _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_4827;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_4828;
    }
    GEOLogMsgEventShowcaseSuppressionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventShowcaseSuppressionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventShowcaseSuppressionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventShowcaseSuppression *)self readAll:0];
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint64Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_showcaseId) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_adamId) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOLogMsgEventShowcaseSuppression *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 10) = self->_readerMarkPos;
  *((_DWORD *)v6 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v6;
  char flags = (char)self->_flags;
  if (flags)
  {
    v6[3] = self->_businessId;
    *((unsigned char *)v6 + 60) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 13) = self->_localSearchProviderID;
    *((unsigned char *)v6 + 60) |= 2u;
  }
  if (self->_showcaseId)
  {
    objc_msgSend(v6, "setShowcaseId:");
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_suppressionReason;
    *((unsigned char *)v4 + 60) |= 4u;
  }
  if (self->_adamId)
  {
    objc_msgSend(v6, "setAdamId:");
    int v4 = v6;
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
      GEOLogMsgEventShowcaseSuppressionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventShowcaseSuppression *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 24) = self->_businessId;
    *(unsigned char *)(v5 + 60) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_localSearchProviderID;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  uint64_t v10 = [(NSString *)self->_showcaseId copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_suppressionReason;
    *(unsigned char *)(v5 + 60) |= 4u;
  }
  uint64_t v12 = [(NSString *)self->_adamId copyWithZone:a3];
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v12;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  [(GEOLogMsgEventShowcaseSuppression *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 60);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_businessId != *((void *)v4 + 3)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_localSearchProviderID != *((_DWORD *)v4 + 13)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_22;
  }
  showcaseId = self->_showcaseId;
  if ((unint64_t)showcaseId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](showcaseId, "isEqual:"))
    {
LABEL_22:
      char v9 = 0;
      goto LABEL_23;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 60);
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_suppressionReason != *((_DWORD *)v4 + 14)) {
      goto LABEL_22;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_22;
  }
  adamId = self->_adamId;
  if ((unint64_t)adamId | *((void *)v4 + 2)) {
    char v9 = -[NSString isEqual:](adamId, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_23:

  return v9;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventShowcaseSuppression *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v3 = 2654435761u * self->_businessId;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_localSearchProviderID;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_showcaseId hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_suppressionReason;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5 ^ [(NSString *)self->_adamId hash];
}

- (void)mergeFrom:(id)a3
{
  id v6 = a3;
  [v6 readAll:0];
  uint64_t v4 = v6;
  char v5 = *((unsigned char *)v6 + 60);
  if (v5)
  {
    self->_businessId = *((void *)v6 + 3);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v6 + 60);
  }
  if ((v5 & 2) != 0)
  {
    self->_localSearchProviderID = *((_DWORD *)v6 + 13);
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (*((void *)v6 + 4))
  {
    -[GEOLogMsgEventShowcaseSuppression setShowcaseId:](self, "setShowcaseId:");
    uint64_t v4 = v6;
  }
  if ((v4[15] & 4) != 0)
  {
    self->_suppressionReason = v4[14];
    *(unsigned char *)&self->_flags |= 4u;
  }
  if (*((void *)v4 + 2))
  {
    -[GEOLogMsgEventShowcaseSuppression setAdamId:](self, "setAdamId:");
    uint64_t v4 = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showcaseId, 0);
  objc_storeStrong((id *)&self->_adamId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end