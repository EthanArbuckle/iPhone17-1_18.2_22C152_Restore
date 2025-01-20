@interface GEORPTdmFraudRequestInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAnonymousId;
- (BOOL)hasFsrData;
- (BOOL)hasKeyId;
- (BOOL)hasTdmNamespace;
- (BOOL)hasTdmUserMapsStatus;
- (BOOL)hasTransactionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPTdmFraudRequestInfo)init;
- (GEORPTdmFraudRequestInfo)initWithData:(id)a3;
- (GEORPTdmFraudRequestInfo)initWithDictionary:(id)a3;
- (GEORPTdmFraudRequestInfo)initWithJSON:(id)a3;
- (GEORPTdmUserMapsStatus)tdmUserMapsStatus;
- (NSString)anonymousId;
- (NSString)fsrData;
- (NSString)keyId;
- (NSString)tdmNamespace;
- (NSString)transactionId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAnonymousId;
- (void)_readFsrData;
- (void)_readKeyId;
- (void)_readTdmNamespace;
- (void)_readTdmUserMapsStatus;
- (void)_readTransactionId;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAnonymousId:(id)a3;
- (void)setFsrData:(id)a3;
- (void)setKeyId:(id)a3;
- (void)setTdmNamespace:(id)a3;
- (void)setTdmUserMapsStatus:(id)a3;
- (void)setTransactionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPTdmFraudRequestInfo

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 tdmNamespace];
    if (v5)
    {
      if (a2) {
        v6 = @"tdmNamespace";
      }
      else {
        v6 = @"tdm_namespace";
      }
      [v4 setObject:v5 forKey:v6];
    }

    v7 = [a1 transactionId];
    if (v7)
    {
      if (a2) {
        v8 = @"transactionId";
      }
      else {
        v8 = @"transaction_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [a1 anonymousId];
    if (v9)
    {
      if (a2) {
        v10 = @"anonymousId";
      }
      else {
        v10 = @"anonymous_id";
      }
      [v4 setObject:v9 forKey:v10];
    }

    v11 = [a1 fsrData];
    if (v11)
    {
      if (a2) {
        v12 = @"fsrData";
      }
      else {
        v12 = @"fsr_data";
      }
      [v4 setObject:v11 forKey:v12];
    }

    v13 = [a1 keyId];
    if (v13)
    {
      if (a2) {
        v14 = @"keyId";
      }
      else {
        v14 = @"key_id";
      }
      [v4 setObject:v13 forKey:v14];
    }

    v15 = [a1 tdmUserMapsStatus];
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"tdmUserMapsStatus";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"tdm_user_maps_status";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = (void *)a1[2];
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __54__GEORPTdmFraudRequestInfo__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (GEORPTdmFraudRequestInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPTdmFraudRequestInfo;
  v2 = [(GEORPTdmFraudRequestInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
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
        objc_super v6 = @"tdmNamespace";
      }
      else {
        objc_super v6 = @"tdm_namespace";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = (void *)[v7 copy];
        [a1 setTdmNamespace:v8];
      }
      if (a3) {
        v9 = @"transactionId";
      }
      else {
        v9 = @"transaction_id";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setTransactionId:v11];
      }
      if (a3) {
        v12 = @"anonymousId";
      }
      else {
        v12 = @"anonymous_id";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setAnonymousId:v14];
      }
      if (a3) {
        v15 = @"fsrData";
      }
      else {
        v15 = @"fsr_data";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = (void *)[v16 copy];
        [a1 setFsrData:v17];
      }
      if (a3) {
        v18 = @"keyId";
      }
      else {
        v18 = @"key_id";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = (void *)[v19 copy];
        [a1 setKeyId:v20];
      }
      if (a3) {
        v21 = @"tdmUserMapsStatus";
      }
      else {
        v21 = @"tdm_user_maps_status";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = [GEORPTdmUserMapsStatus alloc];
        if (a3) {
          uint64_t v24 = [(GEORPTdmUserMapsStatus *)v23 initWithJSON:v22];
        }
        else {
          uint64_t v24 = [(GEORPTdmUserMapsStatus *)v23 initWithDictionary:v22];
        }
        v25 = (void *)v24;
        [a1 setTdmUserMapsStatus:v24];
      }
    }
  }

  return a1;
}

- (NSString)fsrData
{
  -[GEORPTdmFraudRequestInfo _readFsrData]((uint64_t)self);
  fsrData = self->_fsrData;

  return fsrData;
}

- (GEORPTdmFraudRequestInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPTdmFraudRequestInfo;
  v3 = [(GEORPTdmFraudRequestInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readTdmNamespace
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudRequestInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTdmNamespace_tags_3612);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTdmNamespace
{
  return self->_tdmNamespace != 0;
}

- (NSString)tdmNamespace
{
  -[GEORPTdmFraudRequestInfo _readTdmNamespace]((uint64_t)self);
  tdmNamespace = self->_tdmNamespace;

  return tdmNamespace;
}

- (void)setTdmNamespace:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_tdmNamespace, a3);
}

- (void)_readTransactionId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudRequestInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransactionId_tags_3613);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTransactionId
{
  return self->_transactionId != 0;
}

- (NSString)transactionId
{
  -[GEORPTdmFraudRequestInfo _readTransactionId]((uint64_t)self);
  transactionId = self->_transactionId;

  return transactionId;
}

- (void)setTransactionId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_transactionId, a3);
}

- (void)_readAnonymousId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudRequestInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnonymousId_tags_3614);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasAnonymousId
{
  return self->_anonymousId != 0;
}

- (NSString)anonymousId
{
  -[GEORPTdmFraudRequestInfo _readAnonymousId]((uint64_t)self);
  anonymousId = self->_anonymousId;

  return anonymousId;
}

- (void)setAnonymousId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  objc_storeStrong((id *)&self->_anonymousId, a3);
}

- (void)_readFsrData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudRequestInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFsrData_tags_3615);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasFsrData
{
  return self->_fsrData != 0;
}

- (void)setFsrData:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_fsrData, a3);
}

- (void)_readKeyId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudRequestInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKeyId_tags_3616);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasKeyId
{
  return self->_keyId != 0;
}

- (NSString)keyId
{
  -[GEORPTdmFraudRequestInfo _readKeyId]((uint64_t)self);
  keyId = self->_keyId;

  return keyId;
}

- (void)setKeyId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_keyId, a3);
}

- (void)_readTdmUserMapsStatus
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudRequestInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTdmUserMapsStatus_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTdmUserMapsStatus
{
  return self->_tdmUserMapsStatus != 0;
}

- (GEORPTdmUserMapsStatus)tdmUserMapsStatus
{
  -[GEORPTdmFraudRequestInfo _readTdmUserMapsStatus]((uint64_t)self);
  tdmUserMapsStatus = self->_tdmUserMapsStatus;

  return tdmUserMapsStatus;
}

- (void)setTdmUserMapsStatus:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_tdmUserMapsStatus, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPTdmFraudRequestInfo;
  v4 = [(GEORPTdmFraudRequestInfo *)&v8 description];
  id v5 = [(GEORPTdmFraudRequestInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPTdmFraudRequestInfo _dictionaryRepresentation:](self, 0);
}

- (id)jsonRepresentation
{
  return -[GEORPTdmFraudRequestInfo _dictionaryRepresentation:](self, 1);
}

void __54__GEORPTdmFraudRequestInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPTdmFraudRequestInfo)initWithDictionary:(id)a3
{
  return (GEORPTdmFraudRequestInfo *)-[GEORPTdmFraudRequestInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEORPTdmFraudRequestInfo)initWithJSON:(id)a3
{
  return (GEORPTdmFraudRequestInfo *)-[GEORPTdmFraudRequestInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3624;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3625;
    }
    GEORPTdmFraudRequestInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEORPTdmUserMapsStatus *)self->_tdmUserMapsStatus readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPTdmFraudRequestInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPTdmFraudRequestInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 1u))
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
    [(GEORPTdmFraudRequestInfo *)self readAll:0];
    if (self->_tdmNamespace) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_transactionId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_anonymousId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_fsrData)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_keyId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_tdmUserMapsStatus)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPTdmFraudRequestInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 18) = self->_readerMarkPos;
  *((_DWORD *)v5 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_tdmNamespace) {
    objc_msgSend(v5, "setTdmNamespace:");
  }
  if (self->_transactionId) {
    objc_msgSend(v5, "setTransactionId:");
  }
  v4 = v5;
  if (self->_anonymousId)
  {
    objc_msgSend(v5, "setAnonymousId:");
    v4 = v5;
  }
  if (self->_fsrData)
  {
    objc_msgSend(v5, "setFsrData:");
    v4 = v5;
  }
  if (self->_keyId)
  {
    objc_msgSend(v5, "setKeyId:");
    v4 = v5;
  }
  if (self->_tdmUserMapsStatus)
  {
    objc_msgSend(v5, "setTdmUserMapsStatus:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPTdmFraudRequestInfo *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_tdmNamespace copyWithZone:a3];
    v9 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v8;

    uint64_t v10 = [(NSString *)self->_transactionId copyWithZone:a3];
    v11 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v10;

    uint64_t v12 = [(NSString *)self->_anonymousId copyWithZone:a3];
    v13 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v12;

    uint64_t v14 = [(NSString *)self->_fsrData copyWithZone:a3];
    v15 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v14;

    uint64_t v16 = [(NSString *)self->_keyId copyWithZone:a3];
    v17 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v16;

    id v18 = [(GEORPTdmUserMapsStatus *)self->_tdmUserMapsStatus copyWithZone:a3];
    v19 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v18;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPTdmFraudRequestInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPTdmFraudRequestInfo *)self readAll:1],
         [v4 readAll:1],
         tdmNamespace = self->_tdmNamespace,
         !((unint64_t)tdmNamespace | v4[6]))
     || -[NSString isEqual:](tdmNamespace, "isEqual:"))
    && ((transactionId = self->_transactionId, !((unint64_t)transactionId | v4[8]))
     || -[NSString isEqual:](transactionId, "isEqual:"))
    && ((anonymousId = self->_anonymousId, !((unint64_t)anonymousId | v4[3]))
     || -[NSString isEqual:](anonymousId, "isEqual:"))
    && ((fsrData = self->_fsrData, !((unint64_t)fsrData | v4[4]))
     || -[NSString isEqual:](fsrData, "isEqual:"))
    && ((keyId = self->_keyId, !((unint64_t)keyId | v4[5]))
     || -[NSString isEqual:](keyId, "isEqual:")))
  {
    tdmUserMapsStatus = self->_tdmUserMapsStatus;
    if ((unint64_t)tdmUserMapsStatus | v4[7]) {
      char v11 = -[GEORPTdmUserMapsStatus isEqual:](tdmUserMapsStatus, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  [(GEORPTdmFraudRequestInfo *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_tdmNamespace hash];
  NSUInteger v4 = [(NSString *)self->_transactionId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_anonymousId hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_fsrData hash];
  NSUInteger v7 = [(NSString *)self->_keyId hash];
  return v6 ^ v7 ^ [(GEORPTdmUserMapsStatus *)self->_tdmUserMapsStatus hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v6 = a3;
  [v6 readAll:0];
  if (v6[6]) {
    -[GEORPTdmFraudRequestInfo setTdmNamespace:](self, "setTdmNamespace:");
  }
  if (v6[8]) {
    -[GEORPTdmFraudRequestInfo setTransactionId:](self, "setTransactionId:");
  }
  if (v6[3]) {
    -[GEORPTdmFraudRequestInfo setAnonymousId:](self, "setAnonymousId:");
  }
  if (v6[4]) {
    -[GEORPTdmFraudRequestInfo setFsrData:](self, "setFsrData:");
  }
  if (v6[5]) {
    -[GEORPTdmFraudRequestInfo setKeyId:](self, "setKeyId:");
  }
  tdmUserMapsStatus = self->_tdmUserMapsStatus;
  uint64_t v5 = v6[7];
  if (tdmUserMapsStatus)
  {
    if (v5) {
      -[GEORPTdmUserMapsStatus mergeFrom:](tdmUserMapsStatus, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPTdmFraudRequestInfo setTdmUserMapsStatus:](self, "setTdmUserMapsStatus:");
  }
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPTdmFraudRequestInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3629);
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
  *(unsigned char *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPTdmFraudRequestInfo *)self readAll:0];
    tdmUserMapsStatus = self->_tdmUserMapsStatus;
    [(GEORPTdmUserMapsStatus *)tdmUserMapsStatus clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_tdmUserMapsStatus, 0);
  objc_storeStrong((id *)&self->_tdmNamespace, 0);
  objc_storeStrong((id *)&self->_keyId, 0);
  objc_storeStrong((id *)&self->_fsrData, 0);
  objc_storeStrong((id *)&self->_anonymousId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end