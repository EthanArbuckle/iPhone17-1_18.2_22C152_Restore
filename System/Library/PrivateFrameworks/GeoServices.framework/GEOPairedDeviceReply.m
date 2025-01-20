@interface GEOPairedDeviceReply
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPairedDeviceConfigureSubscriptionShouldSyncReply)configureSubscriptionShouldSync;
- (GEOPairedDeviceGetStorageInfoReply)getStorageInfo;
- (GEOPairedDevicePingReply)ping;
- (GEOPairedDeviceReply)init;
- (GEOPairedDeviceReply)initWithData:(id)a3;
- (GEOPairedDeviceReply)initWithDictionary:(id)a3;
- (GEOPairedDeviceReply)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)whichPayload;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)resetPayload;
- (void)setConfigureSubscriptionShouldSync:(id)a3;
- (void)setGetStorageInfo:(id)a3;
- (void)setPing:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPairedDeviceReply

- (GEOPairedDeviceReply)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPairedDeviceReply;
  v2 = [(GEOPairedDeviceReply *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPairedDeviceReply)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPairedDeviceReply;
  v3 = [(GEOPairedDeviceReply *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)resetPayload
{
  ping = self->_ping;
  self->_ping = 0;

  getStorageInfo = self->_getStorageInfo;
  self->_getStorageInfo = 0;

  configureSubscriptionShouldSync = self->_configureSubscriptionShouldSync;
  self->_configureSubscriptionShouldSync = 0;

  self->_whichPayload = 0;
}

- (GEOPairedDevicePingReply)ping
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceReplyReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readPing_tags_400);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 1) {
    v5 = self->_ping;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)setPing:(id)a3
{
  v4 = (GEOPairedDevicePingReply *)a3;
  *(unsigned char *)&self->_flags |= 0x18u;
  [(GEOPairedDeviceReply *)self resetPayload];
  ping = self->_ping;
  self->_ping = v4;

  if (v4) {
    self->_whichPayload = 1;
  }
}

- (GEOPairedDeviceGetStorageInfoReply)getStorageInfo
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceReplyReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readGetStorageInfo_tags_401);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 2) {
    v5 = self->_getStorageInfo;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)setGetStorageInfo:(id)a3
{
  v4 = (GEOPairedDeviceGetStorageInfoReply *)a3;
  *(unsigned char *)&self->_flags |= 0x14u;
  [(GEOPairedDeviceReply *)self resetPayload];
  getStorageInfo = self->_getStorageInfo;
  self->_getStorageInfo = v4;

  if (v4) {
    self->_whichPayload = 2;
  }
}

- (GEOPairedDeviceConfigureSubscriptionShouldSyncReply)configureSubscriptionShouldSync
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 2) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceReplyReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readConfigureSubscriptionShouldSync_tags_402);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 3) {
    v5 = self->_configureSubscriptionShouldSync;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)setConfigureSubscriptionShouldSync:(id)a3
{
  v4 = (GEOPairedDeviceConfigureSubscriptionShouldSyncReply *)a3;
  *(unsigned char *)&self->_flags |= 0x12u;
  [(GEOPairedDeviceReply *)self resetPayload];
  configureSubscriptionShouldSync = self->_configureSubscriptionShouldSync;
  self->_configureSubscriptionShouldSync = v4;

  if (v4) {
    self->_whichPayload = 3;
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPairedDeviceReply;
  v4 = [(GEOPairedDeviceReply *)&v8 description];
  v5 = [(GEOPairedDeviceReply *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceReply _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_24;
  }
  [a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = a1[8];
  if (v5 == 3)
  {
    v11 = [a1 configureSubscriptionShouldSync];
    objc_super v7 = v11;
    if (!v11) {
      goto LABEL_19;
    }
    if (a2)
    {
      v9 = [v11 jsonRepresentation];
      v10 = @"configureSubscriptionShouldSync";
    }
    else
    {
      v9 = [v11 dictionaryRepresentation];
      v10 = @"configure_subscription_should_sync";
    }
    goto LABEL_18;
  }
  if (v5 == 2)
  {
    objc_super v8 = [a1 getStorageInfo];
    objc_super v7 = v8;
    if (!v8) {
      goto LABEL_19;
    }
    if (a2)
    {
      v9 = [v8 jsonRepresentation];
      v10 = @"getStorageInfo";
    }
    else
    {
      v9 = [v8 dictionaryRepresentation];
      v10 = @"get_storage_info";
    }
LABEL_18:
    [v4 setObject:v9 forKey:v10];

    goto LABEL_19;
  }
  if (v5 != 1) {
    goto LABEL_20;
  }
  objc_super v6 = [a1 ping];
  objc_super v7 = v6;
  if (v6)
  {
    if (a2) {
      [v6 jsonRepresentation];
    }
    else {
    v9 = [v6 dictionaryRepresentation];
    }
    v10 = @"ping";
    goto LABEL_18;
  }
LABEL_19:

LABEL_20:
  v12 = (void *)a1[2];
  if (v12)
  {
    v13 = [v12 dictionaryRepresentation];
    v14 = v13;
    if (a2)
    {
      v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __50__GEOPairedDeviceReply__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E53D8860;
      id v16 = v15;
      id v20 = v16;
      [v14 enumerateKeysAndObjectsUsingBlock:v19];
      id v17 = v16;

      v14 = v17;
    }
    [v4 setObject:v14 forKey:@"Unknown Fields"];
  }
LABEL_24:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPairedDeviceReply _dictionaryRepresentation:](self, 1);
}

void __50__GEOPairedDeviceReply__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPairedDeviceReply)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceReply *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
}

- (GEOPairedDeviceReply)initWithJSON:(id)a3
{
  return (GEOPairedDeviceReply *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
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
      objc_super v8 = (int *)&readAll__recursiveTag_403;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_404;
    }
    GEOPairedDeviceReplyReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOPairedDevicePingReply *)self->_ping readAll:1];
    [(GEOPairedDeviceGetStorageInfoReply *)self->_getStorageInfo readAll:1];
    [(GEOPairedDeviceConfigureSubscriptionShouldSyncReply *)self->_configureSubscriptionShouldSync readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceReplyIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceReplyReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
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
    [(GEOPairedDeviceReply *)self readAll:0];
    unint64_t whichPayload = self->_whichPayload;
    if (whichPayload == 1)
    {
      PBDataWriterWriteSubmessage();
      unint64_t whichPayload = self->_whichPayload;
    }
    id v6 = v9;
    if (whichPayload == 2)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
      unint64_t whichPayload = self->_whichPayload;
    }
    if (whichPayload == 3)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (void)copyTo:(id)a3
{
  objc_super v8 = (id *)a3;
  [(GEOPairedDeviceReply *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPairedDeviceReply *)self resetPayload];
  unint64_t whichPayload = self->_whichPayload;
  if (whichPayload - 1 <= 2)
  {
    uint64_t v5 = *off_1E53ED4F8[whichPayload - 1];
    id v6 = *(id *)((char *)&self->super.super.isa + v5);
    objc_super v7 = *(id *)((char *)v8 + v5);
    *(id *)((char *)v8 + v5) = v6;

    unint64_t whichPayload = self->_whichPayload;
  }
  v8[8] = (id)whichPayload;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPairedDeviceReply *)self readAll:0];
    unint64_t whichPayload = self->_whichPayload;
    switch(whichPayload)
    {
      case 3uLL:
        uint64_t v9 = 24;
        break;
      case 2uLL:
        uint64_t v9 = 32;
        break;
      case 1uLL:
        uint64_t v9 = 40;
        break;
      default:
LABEL_12:
        *(void *)(v5 + 64) = whichPayload;
        objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
        return (id)v5;
    }
    uint64_t v10 = [*(id *)((char *)&self->super.super.isa + v9) copyWithZone:a3];
    v11 = *(void **)(v5 + v9);
    *(void *)(v5 + v9) = v10;

    unint64_t whichPayload = self->_whichPayload;
    goto LABEL_12;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPairedDeviceReplyReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEOPairedDeviceReply *)self readAll:1];
  [v4 readAll:1];
  unint64_t whichPayload = self->_whichPayload;
  if (whichPayload != v4[8]) {
    goto LABEL_8;
  }
  if (whichPayload == 3)
  {
    if (![(GEOPairedDeviceConfigureSubscriptionShouldSyncReply *)self->_configureSubscriptionShouldSync isEqual:v4[3]])goto LABEL_8; {
    goto LABEL_12;
    }
  }
  if (whichPayload != 2)
  {
    if (whichPayload == 1)
    {
      uint64_t v6 = 5;
      goto LABEL_11;
    }
LABEL_12:
    BOOL v7 = 1;
    goto LABEL_9;
  }
  uint64_t v6 = 4;
LABEL_11:
  if ([*(id *)((char *)&self->super.super.isa + v6 * 8) isEqual:v4[v6]]) {
    goto LABEL_12;
  }
LABEL_8:
  BOOL v7 = 0;
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPairedDeviceReply *)self readAll:1];
  unint64_t whichPayload = self->_whichPayload;
  unint64_t v4 = 2654435761u * whichPayload;
  unint64_t v5 = whichPayload - 1;
  if (v5 <= 2) {
    v4 ^= [*(id *)((char *)&self->super.super.isa + *off_1E53ED460[v5]) hash];
  }
  return v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v9 = a3;
  [v9 readAll:0];
  [(GEOPairedDeviceReply *)self resetPayload];
  unint64_t v4 = v9;
  unint64_t v5 = v9[8];
  if (v5 - 1 <= 2)
  {
    uint64_t v6 = *off_1E53ED510[v5 - 1];
    BOOL v7 = (objc_class *)*(id *)((char *)v9 + v6);
    objc_super v8 = *(Class *)((char *)&self->super.super.isa + v6);
    *(Class *)((char *)&self->super.super.isa + v6) = v7;

    unint64_t v4 = v9;
    unint64_t v5 = v9[8];
  }
  self->_unint64_t whichPayload = v5;
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPairedDeviceReplyReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_408);
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
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPairedDeviceReply *)self readAll:0];
    [(GEOPairedDevicePingReply *)self->_ping clearUnknownFields:1];
    [(GEOPairedDeviceGetStorageInfoReply *)self->_getStorageInfo clearUnknownFields:1];
    configureSubscriptionShouldSync = self->_configureSubscriptionShouldSync;
    [(GEOPairedDeviceConfigureSubscriptionShouldSyncReply *)configureSubscriptionShouldSync clearUnknownFields:1];
  }
}

- (unint64_t)whichPayload
{
  return self->_whichPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ping, 0);
  objc_storeStrong((id *)&self->_getStorageInfo, 0);
  objc_storeStrong((id *)&self->_configureSubscriptionShouldSync, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end