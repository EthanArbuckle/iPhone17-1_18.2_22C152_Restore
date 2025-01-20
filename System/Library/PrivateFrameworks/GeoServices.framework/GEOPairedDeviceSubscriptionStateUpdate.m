@interface GEOPairedDeviceSubscriptionStateUpdate
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDownloadState;
- (BOOL)hasIdentifier;
- (BOOL)hasLoadState;
- (BOOL)hasProgress;
- (BOOL)hasUserInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPairedDeviceProgress)progress;
- (GEOPairedDeviceSubscriptionStateUpdate)init;
- (GEOPairedDeviceSubscriptionStateUpdate)initWithData:(id)a3;
- (GEOPairedDeviceSubscriptionStateUpdate)initWithDictionary:(id)a3;
- (GEOPairedDeviceSubscriptionStateUpdate)initWithJSON:(id)a3;
- (GEOPairedDeviceSubscriptionStateUserInfo)userInfo;
- (NSString)identifier;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)downloadState;
- (unsigned)loadState;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readIdentifier;
- (void)_readProgress;
- (void)_readUserInfo;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDownloadState:(unsigned int)a3;
- (void)setHasDownloadState:(BOOL)a3;
- (void)setHasLoadState:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLoadState:(unsigned int)a3;
- (void)setProgress:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPairedDeviceSubscriptionStateUpdate

- (GEOPairedDeviceSubscriptionStateUpdate)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPairedDeviceSubscriptionStateUpdate;
  v2 = [(GEOPairedDeviceSubscriptionStateUpdate *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPairedDeviceSubscriptionStateUpdate)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPairedDeviceSubscriptionStateUpdate;
  v3 = [(GEOPairedDeviceSubscriptionStateUpdate *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPairedDeviceSubscriptionStateUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIdentifier_tags_9);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOPairedDeviceSubscriptionStateUpdate _readIdentifier]((uint64_t)self);
  identifier = self->_identifier;

  return identifier;
}

- (void)setIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unsigned)loadState
{
  return self->_loadState;
}

- (void)setLoadState:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_loadState = a3;
}

- (void)setHasLoadState:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLoadState
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)downloadState
{
  return self->_downloadState;
}

- (void)setDownloadState:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_downloadState = a3;
}

- (void)setHasDownloadState:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasDownloadState
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readProgress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPairedDeviceSubscriptionStateUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProgress_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasProgress
{
  return self->_progress != 0;
}

- (GEOPairedDeviceProgress)progress
{
  -[GEOPairedDeviceSubscriptionStateUpdate _readProgress]((uint64_t)self);
  progress = self->_progress;

  return progress;
}

- (void)setProgress:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void)_readUserInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPairedDeviceSubscriptionStateUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasUserInfo
{
  return self->_userInfo != 0;
}

- (GEOPairedDeviceSubscriptionStateUserInfo)userInfo
{
  -[GEOPairedDeviceSubscriptionStateUpdate _readUserInfo]((uint64_t)self);
  userInfo = self->_userInfo;

  return userInfo;
}

- (void)setUserInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPairedDeviceSubscriptionStateUpdate;
  v4 = [(GEOPairedDeviceSubscriptionStateUpdate *)&v8 description];
  v5 = [(GEOPairedDeviceSubscriptionStateUpdate *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceSubscriptionStateUpdate _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 identifier];
    if (v5) {
      [v4 setObject:v5 forKey:@"identifier"];
    }

    char v6 = *(unsigned char *)(a1 + 68);
    if ((v6 & 2) != 0)
    {
      objc_super v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64)];
      if (a2) {
        objc_super v8 = @"loadState";
      }
      else {
        objc_super v8 = @"load_state";
      }
      [v4 setObject:v7 forKey:v8];

      char v6 = *(unsigned char *)(a1 + 68);
    }
    if (v6)
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 60)];
      if (a2) {
        v10 = @"downloadState";
      }
      else {
        v10 = @"download_state";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = [(id)a1 progress];
    v12 = v11;
    if (v11)
    {
      if (a2) {
        [v11 jsonRepresentation];
      }
      else {
      v13 = [v11 dictionaryRepresentation];
      }
      [v4 setObject:v13 forKey:@"progress"];
    }
    v14 = [(id)a1 userInfo];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"userInfo";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"user_info";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = *(void **)(a1 + 16);
    if (v18)
    {
      v19 = [v18 dictionaryRepresentation];
      v20 = v19;
      if (a2)
      {
        v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __68__GEOPairedDeviceSubscriptionStateUpdate__dictionaryRepresentation___block_invoke;
        v25[3] = &unk_1E53D8860;
        id v22 = v21;
        id v26 = v22;
        [v20 enumerateKeysAndObjectsUsingBlock:v25];
        id v23 = v22;

        v20 = v23;
      }
      [v4 setObject:v20 forKey:@"Unknown Fields"];
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
  return -[GEOPairedDeviceSubscriptionStateUpdate _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __68__GEOPairedDeviceSubscriptionStateUpdate__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPairedDeviceSubscriptionStateUpdate)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceSubscriptionStateUpdate *)-[GEOPairedDeviceSubscriptionStateUpdate _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      char v6 = [v5 objectForKeyedSubscript:@"identifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[v6 copy];
        [a1 setIdentifier:v7];
      }
      if (a3) {
        objc_super v8 = @"loadState";
      }
      else {
        objc_super v8 = @"load_state";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLoadState:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        id v10 = @"downloadState";
      }
      else {
        id v10 = @"download_state";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDownloadState:", objc_msgSend(v11, "unsignedIntValue"));
      }

      v12 = [v5 objectForKeyedSubscript:@"progress"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOPairedDeviceProgress alloc];
        if (a3) {
          uint64_t v14 = [(GEOPairedDeviceProgress *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOPairedDeviceProgress *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setProgress:v14];
      }
      if (a3) {
        v16 = @"userInfo";
      }
      else {
        v16 = @"user_info";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [GEOPairedDeviceSubscriptionStateUserInfo alloc];
        if (a3) {
          uint64_t v19 = [(GEOPairedDeviceSubscriptionStateUserInfo *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEOPairedDeviceSubscriptionStateUserInfo *)v18 initWithDictionary:v17];
        }
        v20 = (void *)v19;
        [a1 setUserInfo:v19];
      }
    }
  }

  return a1;
}

- (GEOPairedDeviceSubscriptionStateUpdate)initWithJSON:(id)a3
{
  return (GEOPairedDeviceSubscriptionStateUpdate *)-[GEOPairedDeviceSubscriptionStateUpdate _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_622;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_623;
    }
    GEOPairedDeviceSubscriptionStateUpdateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOPairedDeviceProgress *)self->_progress readAll:1];
    [(GEOPairedDeviceSubscriptionStateUserInfo *)self->_userInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceSubscriptionStateUpdateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceSubscriptionStateUpdateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x78) == 0))
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
    [(GEOPairedDeviceSubscriptionStateUpdate *)self readAll:0];
    if (self->_identifier) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    id v6 = v9;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      id v6 = v9;
      char flags = (char)self->_flags;
    }
    if (flags)
    {
      PBDataWriterWriteUint32Field();
      id v6 = v9;
    }
    if (self->_progress)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if (self->_userInfo)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (void)copyTo:(id)a3
{
  id v6 = (id *)a3;
  [(GEOPairedDeviceSubscriptionStateUpdate *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_identifier) {
    objc_msgSend(v6, "setIdentifier:");
  }
  char flags = (char)self->_flags;
  id v5 = v6;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 16) = self->_loadState;
    *((unsigned char *)v6 + 68) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v6 + 15) = self->_downloadState;
    *((unsigned char *)v6 + 68) |= 1u;
  }
  if (self->_progress)
  {
    objc_msgSend(v6, "setProgress:");
    id v5 = v6;
  }
  if (self->_userInfo)
  {
    objc_msgSend(v6, "setUserInfo:");
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
      GEOPairedDeviceSubscriptionStateUpdateReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPairedDeviceSubscriptionStateUpdate *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_identifier copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_loadState;
    *(unsigned char *)(v5 + 68) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 60) = self->_downloadState;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  id v12 = [(GEOPairedDeviceProgress *)self->_progress copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  id v14 = [(GEOPairedDeviceSubscriptionStateUserInfo *)self->_userInfo copyWithZone:a3];
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
  [(GEOPairedDeviceSubscriptionStateUpdate *)self readAll:1];
  [v4 readAll:1];
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_loadState != *((_DWORD *)v4 + 16)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_downloadState != *((_DWORD *)v4 + 15)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_18;
  }
  progress = self->_progress;
  if ((unint64_t)progress | *((void *)v4 + 4) && !-[GEOPairedDeviceProgress isEqual:](progress, "isEqual:")) {
    goto LABEL_18;
  }
  userInfo = self->_userInfo;
  if ((unint64_t)userInfo | *((void *)v4 + 5)) {
    char v8 = -[GEOPairedDeviceSubscriptionStateUserInfo isEqual:](userInfo, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  [(GEOPairedDeviceSubscriptionStateUpdate *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_loadState;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_downloadState;
LABEL_6:
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(GEOPairedDeviceProgress *)self->_progress hash];
  return v6 ^ [(GEOPairedDeviceSubscriptionStateUserInfo *)self->_userInfo hash];
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  [v10 readAll:0];
  uint64_t v4 = v10;
  if (v10[3])
  {
    -[GEOPairedDeviceSubscriptionStateUpdate setIdentifier:](self, "setIdentifier:");
    uint64_t v4 = v10;
  }
  char v5 = *((unsigned char *)v4 + 68);
  if ((v5 & 2) != 0)
  {
    self->_loadState = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v4 + 68);
  }
  if (v5)
  {
    self->_downloadState = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 1u;
  }
  progress = self->_progress;
  uint64_t v7 = v4[4];
  if (progress)
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[GEOPairedDeviceProgress mergeFrom:](progress, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[GEOPairedDeviceSubscriptionStateUpdate setProgress:](self, "setProgress:");
  }
  uint64_t v4 = v10;
LABEL_13:
  userInfo = self->_userInfo;
  uint64_t v9 = v4[5];
  if (userInfo)
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[GEOPairedDeviceSubscriptionStateUserInfo mergeFrom:](userInfo, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[GEOPairedDeviceSubscriptionStateUpdate setUserInfo:](self, "setUserInfo:");
  }
  uint64_t v4 = v10;
LABEL_19:
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
      GEOPairedDeviceSubscriptionStateUpdateReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_627);
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
    [(GEOPairedDeviceSubscriptionStateUpdate *)self readAll:0];
    [(GEOPairedDeviceProgress *)self->_progress clearUnknownFields:1];
    userInfo = self->_userInfo;
    [(GEOPairedDeviceSubscriptionStateUserInfo *)userInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end