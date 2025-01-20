@interface GEORPTdmFraudNotificationParameters
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAnonymousId;
- (BOOL)hasFsrData;
- (BOOL)hasTdmNamespace;
- (BOOL)hasToken;
- (BOOL)hasTransactionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPTdmFraudNotificationParameters)init;
- (GEORPTdmFraudNotificationParameters)initWithData:(id)a3;
- (GEORPTdmFraudNotificationParameters)initWithDictionary:(id)a3;
- (GEORPTdmFraudNotificationParameters)initWithJSON:(id)a3;
- (NSString)anonymousId;
- (NSString)fsrData;
- (NSString)tdmNamespace;
- (NSString)token;
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
- (void)_readTdmNamespace;
- (void)_readToken;
- (void)_readTransactionId;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAnonymousId:(id)a3;
- (void)setFsrData:(id)a3;
- (void)setTdmNamespace:(id)a3;
- (void)setToken:(id)a3;
- (void)setTransactionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPTdmFraudNotificationParameters

- (GEORPTdmFraudNotificationParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPTdmFraudNotificationParameters;
  v2 = [(GEORPTdmFraudNotificationParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPTdmFraudNotificationParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPTdmFraudNotificationParameters;
  v3 = [(GEORPTdmFraudNotificationParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTdmNamespace
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudNotificationParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTdmNamespace_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasTdmNamespace
{
  return self->_tdmNamespace != 0;
}

- (NSString)tdmNamespace
{
  -[GEORPTdmFraudNotificationParameters _readTdmNamespace]((uint64_t)self);
  tdmNamespace = self->_tdmNamespace;

  return tdmNamespace;
}

- (void)setTdmNamespace:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_tdmNamespace, a3);
}

- (void)_readAnonymousId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudNotificationParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnonymousId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasAnonymousId
{
  return self->_anonymousId != 0;
}

- (NSString)anonymousId
{
  -[GEORPTdmFraudNotificationParameters _readAnonymousId]((uint64_t)self);
  anonymousId = self->_anonymousId;

  return anonymousId;
}

- (void)setAnonymousId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_anonymousId, a3);
}

- (void)_readToken
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudNotificationParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readToken_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (NSString)token
{
  -[GEORPTdmFraudNotificationParameters _readToken]((uint64_t)self);
  token = self->_token;

  return token;
}

- (void)setToken:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_token, a3);
}

- (void)_readFsrData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudNotificationParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFsrData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasFsrData
{
  return self->_fsrData != 0;
}

- (NSString)fsrData
{
  -[GEORPTdmFraudNotificationParameters _readFsrData]((uint64_t)self);
  fsrData = self->_fsrData;

  return fsrData;
}

- (void)setFsrData:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_fsrData, a3);
}

- (void)_readTransactionId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudNotificationParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransactionId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasTransactionId
{
  return self->_transactionId != 0;
}

- (NSString)transactionId
{
  -[GEORPTdmFraudNotificationParameters _readTransactionId]((uint64_t)self);
  transactionId = self->_transactionId;

  return transactionId;
}

- (void)setTransactionId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_transactionId, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPTdmFraudNotificationParameters;
  v4 = [(GEORPTdmFraudNotificationParameters *)&v8 description];
  v5 = [(GEORPTdmFraudNotificationParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPTdmFraudNotificationParameters _dictionaryRepresentation:](self, 0);
}

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
        objc_super v6 = @"tdmNamespace";
      }
      else {
        objc_super v6 = @"tdm_namespace";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 anonymousId];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"anonymousId";
      }
      else {
        objc_super v8 = @"anonymous_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [a1 token];
    if (v9) {
      [v4 setObject:v9 forKey:@"token"];
    }

    v10 = [a1 fsrData];
    if (v10)
    {
      if (a2) {
        v11 = @"fsrData";
      }
      else {
        v11 = @"fsr_data";
      }
      [v4 setObject:v10 forKey:v11];
    }

    v12 = [a1 transactionId];
    if (v12)
    {
      if (a2) {
        v13 = @"transactionId";
      }
      else {
        v13 = @"transaction_id";
      }
      [v4 setObject:v12 forKey:v13];
    }

    v14 = (void *)a1[2];
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __65__GEORPTdmFraudNotificationParameters__dictionaryRepresentation___block_invoke;
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
  return -[GEORPTdmFraudNotificationParameters _dictionaryRepresentation:](self, 1);
}

void __65__GEORPTdmFraudNotificationParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPTdmFraudNotificationParameters)initWithDictionary:(id)a3
{
  return (GEORPTdmFraudNotificationParameters *)-[GEORPTdmFraudNotificationParameters _initWithDictionary:isJSON:](self, a3, 0);
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
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setTdmNamespace:v8];
      }
      if (a3) {
        v9 = @"anonymousId";
      }
      else {
        v9 = @"anonymous_id";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setAnonymousId:v11];
      }
      v12 = [v5 objectForKeyedSubscript:@"token"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = (void *)[v12 copy];
        [a1 setToken:v13];
      }
      if (a3) {
        v14 = @"fsrData";
      }
      else {
        v14 = @"fsr_data";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = (void *)[v15 copy];
        [a1 setFsrData:v16];
      }
      if (a3) {
        v17 = @"transactionId";
      }
      else {
        v17 = @"transaction_id";
      }
      id v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = (void *)[v18 copy];
        [a1 setTransactionId:v19];
      }
    }
  }

  return a1;
}

- (GEORPTdmFraudNotificationParameters)initWithJSON:(id)a3
{
  return (GEORPTdmFraudNotificationParameters *)-[GEORPTdmFraudNotificationParameters _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3569;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3570;
    }
    GEORPTdmFraudNotificationParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPTdmFraudNotificationParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPTdmFraudNotificationParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7E) == 0))
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
    [(GEORPTdmFraudNotificationParameters *)self readAll:0];
    if (self->_tdmNamespace) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_anonymousId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_token)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_fsrData)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_transactionId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPTdmFraudNotificationParameters *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_tdmNamespace) {
    objc_msgSend(v5, "setTdmNamespace:");
  }
  if (self->_anonymousId) {
    objc_msgSend(v5, "setAnonymousId:");
  }
  v4 = v5;
  if (self->_token)
  {
    objc_msgSend(v5, "setToken:");
    v4 = v5;
  }
  if (self->_fsrData)
  {
    objc_msgSend(v5, "setFsrData:");
    v4 = v5;
  }
  if (self->_transactionId)
  {
    objc_msgSend(v5, "setTransactionId:");
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
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPTdmFraudNotificationParameters *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_tdmNamespace copyWithZone:a3];
    v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v8;

    uint64_t v10 = [(NSString *)self->_anonymousId copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    uint64_t v12 = [(NSString *)self->_token copyWithZone:a3];
    v13 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v12;

    uint64_t v14 = [(NSString *)self->_fsrData copyWithZone:a3];
    v15 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v14;

    uint64_t v16 = [(NSString *)self->_transactionId copyWithZone:a3];
    v17 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v16;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPTdmFraudNotificationParametersReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPTdmFraudNotificationParameters *)self readAll:1],
         [v4 readAll:1],
         tdmNamespace = self->_tdmNamespace,
         !((unint64_t)tdmNamespace | v4[5]))
     || -[NSString isEqual:](tdmNamespace, "isEqual:"))
    && ((anonymousId = self->_anonymousId, !((unint64_t)anonymousId | v4[3]))
     || -[NSString isEqual:](anonymousId, "isEqual:"))
    && ((token = self->_token, !((unint64_t)token | v4[6]))
     || -[NSString isEqual:](token, "isEqual:"))
    && ((fsrData = self->_fsrData, !((unint64_t)fsrData | v4[4]))
     || -[NSString isEqual:](fsrData, "isEqual:")))
  {
    transactionId = self->_transactionId;
    if ((unint64_t)transactionId | v4[7]) {
      char v10 = -[NSString isEqual:](transactionId, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  [(GEORPTdmFraudNotificationParameters *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_tdmNamespace hash];
  NSUInteger v4 = [(NSString *)self->_anonymousId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_token hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_fsrData hash];
  return v6 ^ [(NSString *)self->_transactionId hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  [v4 readAll:0];
  if (v4[5]) {
    -[GEORPTdmFraudNotificationParameters setTdmNamespace:](self, "setTdmNamespace:");
  }
  if (v4[3]) {
    -[GEORPTdmFraudNotificationParameters setAnonymousId:](self, "setAnonymousId:");
  }
  if (v4[6]) {
    -[GEORPTdmFraudNotificationParameters setToken:](self, "setToken:");
  }
  if (v4[4]) {
    -[GEORPTdmFraudNotificationParameters setFsrData:](self, "setFsrData:");
  }
  if (v4[7]) {
    -[GEORPTdmFraudNotificationParameters setTransactionId:](self, "setTransactionId:");
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
      NSUInteger v5 = reader;
      objc_sync_enter(v5);
      GEORPTdmFraudNotificationParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3574);
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
  *(unsigned char *)&self->_flags |= 0x41u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPTdmFraudNotificationParameters *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_tdmNamespace, 0);
  objc_storeStrong((id *)&self->_fsrData, 0);
  objc_storeStrong((id *)&self->_anonymousId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end