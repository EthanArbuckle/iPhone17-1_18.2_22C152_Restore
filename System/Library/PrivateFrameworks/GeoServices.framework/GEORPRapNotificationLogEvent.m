@interface GEORPRapNotificationLogEvent
+ (BOOL)isValid:(id)a3;
- (BOOL)hasOriginalRapId;
- (BOOL)hasResponseId;
- (BOOL)hasUserInteractedWithNotification;
- (BOOL)hasUserShownNotification;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)userInteractedWithNotification;
- (BOOL)userShownNotification;
- (GEORPRapNotificationLogEvent)init;
- (GEORPRapNotificationLogEvent)initWithData:(id)a3;
- (GEORPRapNotificationLogEvent)initWithDictionary:(id)a3;
- (GEORPRapNotificationLogEvent)initWithJSON:(id)a3;
- (NSString)originalRapId;
- (NSString)responseId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readOriginalRapId;
- (void)_readResponseId;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasUserInteractedWithNotification:(BOOL)a3;
- (void)setHasUserShownNotification:(BOOL)a3;
- (void)setOriginalRapId:(id)a3;
- (void)setResponseId:(id)a3;
- (void)setUserInteractedWithNotification:(BOOL)a3;
- (void)setUserShownNotification:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPRapNotificationLogEvent

- (GEORPRapNotificationLogEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPRapNotificationLogEvent;
  v2 = [(GEORPRapNotificationLogEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPRapNotificationLogEvent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPRapNotificationLogEvent;
  v3 = [(GEORPRapNotificationLogEvent *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOriginalRapId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPRapNotificationLogEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalRapId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasOriginalRapId
{
  return self->_originalRapId != 0;
}

- (NSString)originalRapId
{
  -[GEORPRapNotificationLogEvent _readOriginalRapId]((uint64_t)self);
  originalRapId = self->_originalRapId;

  return originalRapId;
}

- (void)setOriginalRapId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_originalRapId, a3);
}

- (void)_readResponseId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPRapNotificationLogEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResponseId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasResponseId
{
  return self->_responseId != 0;
}

- (NSString)responseId
{
  -[GEORPRapNotificationLogEvent _readResponseId]((uint64_t)self);
  responseId = self->_responseId;

  return responseId;
}

- (void)setResponseId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_responseId, a3);
}

- (BOOL)userShownNotification
{
  return self->_userShownNotification;
}

- (void)setUserShownNotification:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_userShownNotification = a3;
}

- (void)setHasUserShownNotification:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasUserShownNotification
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)userInteractedWithNotification
{
  return self->_userInteractedWithNotification;
}

- (void)setUserInteractedWithNotification:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_userInteractedWithNotification = a3;
}

- (void)setHasUserInteractedWithNotification:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasUserInteractedWithNotification
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPRapNotificationLogEvent;
  v4 = [(GEORPRapNotificationLogEvent *)&v8 description];
  v5 = [(GEORPRapNotificationLogEvent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPRapNotificationLogEvent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 originalRapId];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"originalRapId";
      }
      else {
        objc_super v6 = @"original_rap_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [(id)a1 responseId];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"responseId";
      }
      else {
        objc_super v8 = @"response_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    char v9 = *(unsigned char *)(a1 + 56);
    if ((v9 & 2) != 0)
    {
      v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 53)];
      if (a2) {
        v11 = @"userShownNotification";
      }
      else {
        v11 = @"user_shown_notification";
      }
      [v4 setObject:v10 forKey:v11];

      char v9 = *(unsigned char *)(a1 + 56);
    }
    if (v9)
    {
      v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 52)];
      if (a2) {
        v13 = @"userInteractedWithNotification";
      }
      else {
        v13 = @"user_interacted_with_notification";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = *(void **)(a1 + 16);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __58__GEORPRapNotificationLogEvent__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPRapNotificationLogEvent _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __58__GEORPRapNotificationLogEvent__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    char v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPRapNotificationLogEvent)initWithDictionary:(id)a3
{
  return (GEORPRapNotificationLogEvent *)-[GEORPRapNotificationLogEvent _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"originalRapId";
      }
      else {
        objc_super v6 = @"original_rap_id";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setOriginalRapId:v8];
      }
      if (a3) {
        char v9 = @"responseId";
      }
      else {
        char v9 = @"response_id";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setResponseId:v11];
      }
      if (a3) {
        v12 = @"userShownNotification";
      }
      else {
        v12 = @"user_shown_notification";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setUserShownNotification:", objc_msgSend(v13, "BOOLValue"));
      }

      if (a3) {
        v14 = @"userInteractedWithNotification";
      }
      else {
        v14 = @"user_interacted_with_notification";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setUserInteractedWithNotification:", objc_msgSend(v15, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEORPRapNotificationLogEvent)initWithJSON:(id)a3
{
  return (GEORPRapNotificationLogEvent *)-[GEORPRapNotificationLogEvent _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3296;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3297;
    }
    GEORPRapNotificationLogEventReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPRapNotificationLogEventIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPRapNotificationLogEventReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPRapNotificationLogEvent *)self readAll:0];
    if (self->_originalRapId) {
      PBDataWriterWriteStringField();
    }
    id v5 = v9;
    if (self->_responseId)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v9;
      char flags = (char)self->_flags;
    }
    if (flags)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPRapNotificationLogEvent *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_originalRapId) {
    objc_msgSend(v5, "setOriginalRapId:");
  }
  if (self->_responseId) {
    objc_msgSend(v5, "setResponseId:");
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v5 + 53) = self->_userShownNotification;
    *((unsigned char *)v5 + 56) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((unsigned char *)v5 + 52) = self->_userInteractedWithNotification;
    *((unsigned char *)v5 + 56) |= 1u;
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
      GEORPRapNotificationLogEventReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPRapNotificationLogEvent *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_originalRapId copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_responseId copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 53) = self->_userShownNotification;
    *(unsigned char *)(v5 + 56) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(unsigned char *)(v5 + 52) = self->_userInteractedWithNotification;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  v14 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v14;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEORPRapNotificationLogEvent *)self readAll:1];
  [v4 readAll:1];
  originalRapId = self->_originalRapId;
  if ((unint64_t)originalRapId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](originalRapId, "isEqual:")) {
      goto LABEL_16;
    }
  }
  responseId = self->_responseId;
  if ((unint64_t)responseId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](responseId, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0) {
      goto LABEL_16;
    }
    if (self->_userShownNotification)
    {
      if (!*((unsigned char *)v4 + 53)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)v4 + 53))
    {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 56))
    {
      if (self->_userInteractedWithNotification)
      {
        if (!*((unsigned char *)v4 + 52)) {
          goto LABEL_16;
        }
      }
      else if (*((unsigned char *)v4 + 52))
      {
        goto LABEL_16;
      }
      BOOL v7 = 1;
      goto LABEL_17;
    }
LABEL_16:
    BOOL v7 = 0;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  [(GEORPRapNotificationLogEvent *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_originalRapId hash];
  NSUInteger v4 = [(NSString *)self->_responseId hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_userShownNotification;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_userInteractedWithNotification;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v6 = a3;
  [v6 readAll:0];
  NSUInteger v4 = v6;
  if (v6[3])
  {
    -[GEORPRapNotificationLogEvent setOriginalRapId:](self, "setOriginalRapId:");
    NSUInteger v4 = v6;
  }
  if (v4[4])
  {
    -[GEORPRapNotificationLogEvent setResponseId:](self, "setResponseId:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 2) != 0)
  {
    self->_userShownNotification = *((unsigned char *)v4 + 53);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v4 + 56);
  }
  if (v5)
  {
    self->_userInteractedWithNotification = *((unsigned char *)v4 + 52);
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
      char v5 = reader;
      objc_sync_enter(v5);
      GEORPRapNotificationLogEventReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3301);
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
    [(GEORPRapNotificationLogEvent *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseId, 0);
  objc_storeStrong((id *)&self->_originalRapId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end