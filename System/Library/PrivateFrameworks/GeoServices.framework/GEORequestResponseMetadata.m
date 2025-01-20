@interface GEORequestResponseMetadata
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCollectionTime;
- (BOOL)hasEventMetadata;
- (BOOL)hasSessionBatchIdBits;
- (BOOL)hasStateOffline;
- (BOOL)hasStateUserSession;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventServiceMetadata)eventMetadata;
- (GEOLogMsgStateOffline)stateOffline;
- (GEOLogMsgStateUserSession)stateUserSession;
- (GEORequestResponseMetadata)init;
- (GEORequestResponseMetadata)initWithData:(id)a3;
- (GEORequestResponseMetadata)initWithDictionary:(id)a3;
- (GEORequestResponseMetadata)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (double)collectionTime;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)sessionBatchIdBits;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readEventMetadata;
- (void)_readStateOffline;
- (void)_readStateUserSession;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCollectionTime:(double)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasCollectionTime:(BOOL)a3;
- (void)setHasSessionBatchIdBits:(BOOL)a3;
- (void)setSessionBatchIdBits:(unsigned int)a3;
- (void)setStateOffline:(id)a3;
- (void)setStateUserSession:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORequestResponseMetadata

- (GEORequestResponseMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORequestResponseMetadata;
  v2 = [(GEORequestResponseMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORequestResponseMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORequestResponseMetadata;
  v3 = [(GEORequestResponseMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEventMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORequestResponseMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEventMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (GEOLogMsgEventServiceMetadata)eventMetadata
{
  -[GEORequestResponseMetadata _readEventMetadata]((uint64_t)self);
  eventMetadata = self->_eventMetadata;

  return eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (void)_readStateUserSession
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORequestResponseMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStateUserSession_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasStateUserSession
{
  return self->_stateUserSession != 0;
}

- (GEOLogMsgStateUserSession)stateUserSession
{
  -[GEORequestResponseMetadata _readStateUserSession]((uint64_t)self);
  stateUserSession = self->_stateUserSession;

  return stateUserSession;
}

- (void)setStateUserSession:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_stateUserSession, a3);
}

- (unsigned)sessionBatchIdBits
{
  return self->_sessionBatchIdBits;
}

- (void)setSessionBatchIdBits:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_sessionBatchIdBits = a3;
}

- (void)setHasSessionBatchIdBits:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSessionBatchIdBits
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)collectionTime
{
  return self->_collectionTime;
}

- (void)setCollectionTime:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_collectionTime = a3;
}

- (void)setHasCollectionTime:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasCollectionTime
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readStateOffline
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORequestResponseMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStateOffline_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasStateOffline
{
  return self->_stateOffline != 0;
}

- (GEOLogMsgStateOffline)stateOffline
{
  -[GEORequestResponseMetadata _readStateOffline]((uint64_t)self);
  stateOffline = self->_stateOffline;

  return stateOffline;
}

- (void)setStateOffline:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_stateOffline, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORequestResponseMetadata;
  v4 = [(GEORequestResponseMetadata *)&v8 description];
  v5 = [(GEORequestResponseMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORequestResponseMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 eventMetadata];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"eventMetadata";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"event_metadata";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 stateUserSession];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"stateUserSession";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"state_user_session";
      }
      [v4 setObject:v11 forKey:v12];
    }
    char v13 = *(unsigned char *)(a1 + 72);
    if ((v13 & 2) != 0)
    {
      v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
      if (a2) {
        v15 = @"sessionBatchIdBits";
      }
      else {
        v15 = @"session_batch_id_bits";
      }
      [v4 setObject:v14 forKey:v15];

      char v13 = *(unsigned char *)(a1 + 72);
    }
    if (v13)
    {
      v16 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      if (a2) {
        v17 = @"collectionTime";
      }
      else {
        v17 = @"collection_time";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = [(id)a1 stateOffline];
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"stateOffline";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"state_offline";
      }
      [v4 setObject:v20 forKey:v21];
    }
    v22 = *(void **)(a1 + 16);
    if (v22)
    {
      v23 = [v22 dictionaryRepresentation];
      v24 = v23;
      if (a2)
      {
        v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __56__GEORequestResponseMetadata__dictionaryRepresentation___block_invoke;
        v29[3] = &unk_1E53D8860;
        id v26 = v25;
        id v30 = v26;
        [v24 enumerateKeysAndObjectsUsingBlock:v29];
        id v27 = v26;

        v24 = v27;
      }
      [v4 setObject:v24 forKey:@"Unknown Fields"];
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
  return -[GEORequestResponseMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEORequestResponseMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORequestResponseMetadata)initWithDictionary:(id)a3
{
  return (GEORequestResponseMetadata *)-[GEORequestResponseMetadata _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"eventMetadata";
      }
      else {
        objc_super v6 = @"event_metadata";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOLogMsgEventServiceMetadata alloc];
        if (a3) {
          uint64_t v9 = [(GEOLogMsgEventServiceMetadata *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOLogMsgEventServiceMetadata *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setEventMetadata:v9];
      }
      if (a3) {
        v11 = @"stateUserSession";
      }
      else {
        v11 = @"state_user_session";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v13 = [GEOLogMsgStateUserSession alloc];
        if (a3) {
          uint64_t v14 = [(GEOLogMsgStateUserSession *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOLogMsgStateUserSession *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setStateUserSession:v14];
      }
      if (a3) {
        v16 = @"sessionBatchIdBits";
      }
      else {
        v16 = @"session_batch_id_bits";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSessionBatchIdBits:", objc_msgSend(v17, "unsignedIntValue"));
      }

      if (a3) {
        v18 = @"collectionTime";
      }
      else {
        v18 = @"collection_time";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v19 doubleValue];
        objc_msgSend(a1, "setCollectionTime:");
      }

      if (a3) {
        v20 = @"stateOffline";
      }
      else {
        v20 = @"state_offline";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [GEOLogMsgStateOffline alloc];
        if (a3) {
          uint64_t v23 = [(GEOLogMsgStateOffline *)v22 initWithJSON:v21];
        }
        else {
          uint64_t v23 = [(GEOLogMsgStateOffline *)v22 initWithDictionary:v21];
        }
        v24 = (void *)v23;
        [a1 setStateOffline:v23];
      }
    }
  }

  return a1;
}

- (GEORequestResponseMetadata)initWithJSON:(id)a3
{
  return (GEORequestResponseMetadata *)-[GEORequestResponseMetadata _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3090;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3091;
    }
    GEORequestResponseMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOLogMsgEventServiceMetadata *)self->_eventMetadata readAll:1];
    [(GEOLogMsgStateUserSession *)self->_stateUserSession readAll:1];
    [(GEOLogMsgStateOffline *)self->_stateOffline readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORequestResponseMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORequestResponseMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORequestResponseMetadataIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORequestResponseMetadata *)self readAll:0];
    if (self->_eventMetadata) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v9;
    if (self->_stateUserSession)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v9;
      char flags = (char)self->_flags;
    }
    if (flags)
    {
      PBDataWriterWriteDoubleField();
      id v5 = v9;
    }
    if (self->_stateOffline)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEORequestResponseMetadata *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_eventMetadata) {
    objc_msgSend(v6, "setEventMetadata:");
  }
  if (self->_stateUserSession) {
    objc_msgSend(v6, "setStateUserSession:");
  }
  char flags = (char)self->_flags;
  id v5 = v6;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 17) = self->_sessionBatchIdBits;
    *((unsigned char *)v6 + 72) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v6[3] = *(id *)&self->_collectionTime;
    *((unsigned char *)v6 + 72) |= 1u;
  }
  if (self->_stateOffline)
  {
    objc_msgSend(v6, "setStateOffline:");
    id v5 = v6;
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
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORequestResponseMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORequestResponseMetadata *)self readAll:0];
  id v9 = [(GEOLogMsgEventServiceMetadata *)self->_eventMetadata copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEOLogMsgStateUserSession *)self->_stateUserSession copyWithZone:a3];
  v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_sessionBatchIdBits;
    *(unsigned char *)(v5 + 72) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(double *)(v5 + 24) = self->_collectionTime;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  id v14 = [(GEOLogMsgStateOffline *)self->_stateOffline copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEORequestResponseMetadata *)self readAll:1];
  [v4 readAll:1];
  eventMetadata = self->_eventMetadata;
  if ((unint64_t)eventMetadata | *((void *)v4 + 4))
  {
    if (!-[GEOLogMsgEventServiceMetadata isEqual:](eventMetadata, "isEqual:")) {
      goto LABEL_18;
    }
  }
  stateUserSession = self->_stateUserSession;
  if ((unint64_t)stateUserSession | *((void *)v4 + 6))
  {
    if (!-[GEOLogMsgStateUserSession isEqual:](stateUserSession, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_sessionBatchIdBits != *((_DWORD *)v4 + 17)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_collectionTime != *((double *)v4 + 3)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_18;
  }
  stateOffline = self->_stateOffline;
  if ((unint64_t)stateOffline | *((void *)v4 + 5)) {
    char v8 = -[GEOLogMsgStateOffline isEqual:](stateOffline, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  [(GEORequestResponseMetadata *)self readAll:1];
  unint64_t v3 = [(GEOLogMsgEventServiceMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(GEOLogMsgStateUserSession *)self->_stateUserSession hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_sessionBatchIdBits;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v10 ^ [(GEOLogMsgStateOffline *)self->_stateOffline hash];
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double collectionTime = self->_collectionTime;
  double v7 = -collectionTime;
  if (collectionTime >= 0.0) {
    double v7 = self->_collectionTime;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ [(GEOLogMsgStateOffline *)self->_stateOffline hash];
}

- (void)mergeFrom:(id)a3
{
  v12 = a3;
  [v12 readAll:0];
  unint64_t v4 = v12;
  eventMetadata = self->_eventMetadata;
  uint64_t v6 = v12[4];
  if (eventMetadata)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOLogMsgEventServiceMetadata mergeFrom:](eventMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEORequestResponseMetadata setEventMetadata:](self, "setEventMetadata:");
  }
  unint64_t v4 = v12;
LABEL_7:
  stateUserSession = self->_stateUserSession;
  uint64_t v8 = v4[6];
  if (stateUserSession)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOLogMsgStateUserSession mergeFrom:](stateUserSession, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEORequestResponseMetadata setStateUserSession:](self, "setStateUserSession:");
  }
  unint64_t v4 = v12;
LABEL_13:
  char v9 = *((unsigned char *)v4 + 72);
  if ((v9 & 2) != 0)
  {
    self->_sessionBatchIdBits = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_flags |= 2u;
    char v9 = *((unsigned char *)v4 + 72);
  }
  if (v9)
  {
    self->_double collectionTime = (double)v4[3];
    *(unsigned char *)&self->_flags |= 1u;
  }
  stateOffline = self->_stateOffline;
  uint64_t v11 = v4[5];
  if (stateOffline)
  {
    if (!v11) {
      goto LABEL_23;
    }
    -[GEOLogMsgStateOffline mergeFrom:](stateOffline, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_23;
    }
    -[GEORequestResponseMetadata setStateOffline:](self, "setStateOffline:");
  }
  unint64_t v4 = v12;
LABEL_23:
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORequestResponseMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3095);
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
  *(unsigned char *)&self->_flags |= 0x44u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORequestResponseMetadata *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateUserSession, 0);
  objc_storeStrong((id *)&self->_stateOffline, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end