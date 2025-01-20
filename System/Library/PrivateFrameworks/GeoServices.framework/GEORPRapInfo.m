@interface GEORPRapInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsReviewed;
- (BOOL)hasRapDisplayMenu;
- (BOOL)hasRapId;
- (BOOL)hasRapResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReviewed;
- (BOOL)readFrom:(id)a3;
- (GEORPRapInfo)init;
- (GEORPRapInfo)initWithData:(id)a3;
- (GEORPRapInfo)initWithDictionary:(id)a3;
- (GEORPRapInfo)initWithJSON:(id)a3;
- (GEORPRapResponse)rapResponse;
- (NSString)rapId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)rapDisplayMenuAsString:(int)a3;
- (int)StringAsRapDisplayMenu:(id)a3;
- (int)rapDisplayMenu;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readRapId;
- (void)_readRapResponse;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasIsReviewed:(BOOL)a3;
- (void)setHasRapDisplayMenu:(BOOL)a3;
- (void)setIsReviewed:(BOOL)a3;
- (void)setRapDisplayMenu:(int)a3;
- (void)setRapId:(id)a3;
- (void)setRapResponse:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPRapInfo

- (GEORPRapInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPRapInfo;
  v2 = [(GEORPRapInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPRapInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPRapInfo;
  v3 = [(GEORPRapInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)isReviewed
{
  return self->_isReviewed;
}

- (void)setIsReviewed:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_isReviewed = a3;
}

- (void)setHasIsReviewed:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsReviewed
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readRapId
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
        GEORPRapInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRapId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasRapId
{
  return self->_rapId != 0;
}

- (NSString)rapId
{
  -[GEORPRapInfo _readRapId]((uint64_t)self);
  rapId = self->_rapId;

  return rapId;
}

- (void)setRapId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_rapId, a3);
}

- (void)_readRapResponse
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
        GEORPRapInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRapResponse_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasRapResponse
{
  return self->_rapResponse != 0;
}

- (GEORPRapResponse)rapResponse
{
  -[GEORPRapInfo _readRapResponse]((uint64_t)self);
  rapResponse = self->_rapResponse;

  return rapResponse;
}

- (void)setRapResponse:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_rapResponse, a3);
}

- (int)rapDisplayMenu
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_rapDisplayMenu;
  }
  else {
    return 0;
  }
}

- (void)setRapDisplayMenu:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_rapDisplayMenu = a3;
}

- (void)setHasRapDisplayMenu:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasRapDisplayMenu
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)rapDisplayMenuAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F6888[a3];
  }

  return v3;
}

- (int)StringAsRapDisplayMenu:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RAP_DISPLAY_MENU_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RAP_DISPLAY_MENU_IN_REVIEW"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RAP_DISPLAY_MENU_REVIEWED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RAP_DISPLAY_MENU_TELL_US_MORE"])
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
  v8.super_class = (Class)GEORPRapInfo;
  int v4 = [(GEORPRapInfo *)&v8 description];
  v5 = [(GEORPRapInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPRapInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 60) & 2) != 0)
    {
      v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
      if (a2) {
        objc_super v6 = @"isReviewed";
      }
      else {
        objc_super v6 = @"is_reviewed";
      }
      [v4 setObject:v5 forKey:v6];
    }
    objc_super v7 = [(id)a1 rapId];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"rapId";
      }
      else {
        objc_super v8 = @"rap_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [(id)a1 rapResponse];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"rapResponse";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"rap_response";
      }
      [v4 setObject:v11 forKey:v12];
    }
    if (*(unsigned char *)(a1 + 60))
    {
      uint64_t v13 = *(int *)(a1 + 52);
      if (v13 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = off_1E53F6888[v13];
      }
      if (a2) {
        v15 = @"rapDisplayMenu";
      }
      else {
        v15 = @"rap_display_menu";
      }
      [v4 setObject:v14 forKey:v15];
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
        v23[2] = __42__GEORPRapInfo__dictionaryRepresentation___block_invoke;
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
  return -[GEORPRapInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __42__GEORPRapInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPRapInfo)initWithDictionary:(id)a3
{
  return (GEORPRapInfo *)-[GEORPRapInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"isReviewed";
      }
      else {
        objc_super v6 = @"is_reviewed";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsReviewed:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"rapId";
      }
      else {
        objc_super v8 = @"rap_id";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = (void *)[v9 copy];
        [a1 setRapId:v10];
      }
      if (a3) {
        v11 = @"rapResponse";
      }
      else {
        v11 = @"rap_response";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [GEORPRapResponse alloc];
        if (a3) {
          uint64_t v14 = [(GEORPRapResponse *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEORPRapResponse *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setRapResponse:v14];
      }
      if (a3) {
        v16 = @"rapDisplayMenu";
      }
      else {
        v16 = @"rap_display_menu";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v17;
        if ([v18 isEqualToString:@"RAP_DISPLAY_MENU_UNKNOWN"])
        {
          uint64_t v19 = 0;
        }
        else if ([v18 isEqualToString:@"RAP_DISPLAY_MENU_IN_REVIEW"])
        {
          uint64_t v19 = 1;
        }
        else if ([v18 isEqualToString:@"RAP_DISPLAY_MENU_REVIEWED"])
        {
          uint64_t v19 = 2;
        }
        else if ([v18 isEqualToString:@"RAP_DISPLAY_MENU_TELL_US_MORE"])
        {
          uint64_t v19 = 3;
        }
        else
        {
          uint64_t v19 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_38:

          goto LABEL_39;
        }
        uint64_t v19 = [v17 intValue];
      }
      [a1 setRapDisplayMenu:v19];
      goto LABEL_38;
    }
  }
LABEL_39:

  return a1;
}

- (GEORPRapInfo)initWithJSON:(id)a3
{
  return (GEORPRapInfo *)-[GEORPRapInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_871;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_872;
    }
    GEORPRapInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEORPRapResponse *)self->_rapResponse readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPRapInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPRapInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPRapInfoIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORPRapInfo *)self readAll:0];
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    id v5 = v8;
    if (self->_rapId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_rapResponse)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPRapInfo _readRapResponse]((uint64_t)self);
  rapResponse = self->_rapResponse;

  return [(GEORPRapResponse *)rapResponse hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  int v4 = (id *)a3;
  [(GEORPRapInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((unsigned char *)v4 + 56) = self->_isReviewed;
    *((unsigned char *)v4 + 60) |= 2u;
  }
  if (self->_rapId) {
    objc_msgSend(v4, "setRapId:");
  }
  if (self->_rapResponse) {
    objc_msgSend(v4, "setRapResponse:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 13) = self->_rapDisplayMenu;
    *((unsigned char *)v4 + 60) |= 1u;
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
      GEORPRapInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPRapInfo *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 56) = self->_isReviewed;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_rapId copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEORPRapResponse *)self->_rapResponse copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_rapDisplayMenu;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  uint64_t v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEORPRapInfo *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) != 0)
    {
      if (self->_isReviewed)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_18;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_10;
      }
    }
LABEL_18:
    BOOL v7 = 0;
    goto LABEL_19;
  }
  if ((*((unsigned char *)v4 + 60) & 2) != 0) {
    goto LABEL_18;
  }
LABEL_10:
  rapId = self->_rapId;
  if ((unint64_t)rapId | *((void *)v4 + 3) && !-[NSString isEqual:](rapId, "isEqual:")) {
    goto LABEL_18;
  }
  rapResponse = self->_rapResponse;
  if ((unint64_t)rapResponse | *((void *)v4 + 4))
  {
    if (!-[GEORPRapResponse isEqual:](rapResponse, "isEqual:")) {
      goto LABEL_18;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_rapDisplayMenu != *((_DWORD *)v4 + 13)) {
      goto LABEL_18;
    }
    BOOL v7 = 1;
  }
LABEL_19:

  return v7;
}

- (unint64_t)hash
{
  [(GEORPRapInfo *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_isReviewed;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_rapId hash];
  unint64_t v5 = [(GEORPRapResponse *)self->_rapResponse hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_rapDisplayMenu;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  BOOL v7 = (BOOL *)a3;
  [v7 readAll:0];
  NSUInteger v4 = v7;
  if ((v7[60] & 2) != 0)
  {
    self->_isReviewed = v7[56];
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (*((void *)v7 + 3))
  {
    -[GEORPRapInfo setRapId:](self, "setRapId:");
    NSUInteger v4 = v7;
  }
  rapResponse = self->_rapResponse;
  uint64_t v6 = *((void *)v4 + 4);
  if (rapResponse)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEORPRapResponse mergeFrom:](rapResponse, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEORPRapInfo setRapResponse:](self, "setRapResponse:");
  }
  NSUInteger v4 = v7;
LABEL_11:
  if (v4[60])
  {
    self->_rapDisplayMenu = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
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
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPRapInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_876);
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
    [(GEORPRapInfo *)self readAll:0];
    rapResponse = self->_rapResponse;
    [(GEORPRapResponse *)rapResponse clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapResponse, 0);
  objc_storeStrong((id *)&self->_rapId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end