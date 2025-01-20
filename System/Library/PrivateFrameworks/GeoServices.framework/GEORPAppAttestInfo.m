@interface GEORPAppAttestInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAnonymousUserId;
- (BOOL)hasAssertion;
- (BOOL)hasAttestation;
- (BOOL)hasKeyId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPAppAttestInfo)init;
- (GEORPAppAttestInfo)initWithData:(id)a3;
- (GEORPAppAttestInfo)initWithDictionary:(id)a3;
- (GEORPAppAttestInfo)initWithJSON:(id)a3;
- (NSData)assertion;
- (NSData)attestation;
- (NSString)anonymousUserId;
- (NSString)keyId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAnonymousUserId;
- (void)_readAssertion;
- (void)_readAttestation;
- (void)_readKeyId;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAnonymousUserId:(id)a3;
- (void)setAssertion:(id)a3;
- (void)setAttestation:(id)a3;
- (void)setKeyId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPAppAttestInfo

- (GEORPAppAttestInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPAppAttestInfo;
  v2 = [(GEORPAppAttestInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPAppAttestInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPAppAttestInfo;
  v3 = [(GEORPAppAttestInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAnonymousUserId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPAppAttestInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnonymousUserId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAnonymousUserId
{
  return self->_anonymousUserId != 0;
}

- (NSString)anonymousUserId
{
  -[GEORPAppAttestInfo _readAnonymousUserId]((uint64_t)self);
  anonymousUserId = self->_anonymousUserId;

  return anonymousUserId;
}

- (void)setAnonymousUserId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_anonymousUserId, a3);
}

- (void)_readAttestation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPAppAttestInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttestation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAttestation
{
  return self->_attestation != 0;
}

- (NSData)attestation
{
  -[GEORPAppAttestInfo _readAttestation]((uint64_t)self);
  attestation = self->_attestation;

  return attestation;
}

- (void)setAttestation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_attestation, a3);
}

- (void)_readAssertion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPAppAttestInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAssertion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAssertion
{
  return self->_assertion != 0;
}

- (NSData)assertion
{
  -[GEORPAppAttestInfo _readAssertion]((uint64_t)self);
  assertion = self->_assertion;

  return assertion;
}

- (void)setAssertion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (void)_readKeyId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPAppAttestInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKeyId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasKeyId
{
  return self->_keyId != 0;
}

- (NSString)keyId
{
  -[GEORPAppAttestInfo _readKeyId]((uint64_t)self);
  keyId = self->_keyId;

  return keyId;
}

- (void)setKeyId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_keyId, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPAppAttestInfo;
  v4 = [(GEORPAppAttestInfo *)&v8 description];
  v5 = [(GEORPAppAttestInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPAppAttestInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 anonymousUserId];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"anonymousUserId";
      }
      else {
        objc_super v6 = @"anonymous_user_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 attestation];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 base64EncodedStringWithOptions:0];
        [v4 setObject:v9 forKey:@"attestation"];
      }
      else
      {
        [v4 setObject:v7 forKey:@"attestation"];
      }
    }

    v10 = [a1 assertion];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 base64EncodedStringWithOptions:0];
        [v4 setObject:v12 forKey:@"assertion"];
      }
      else
      {
        [v4 setObject:v10 forKey:@"assertion"];
      }
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

    v15 = (void *)a1[2];
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __48__GEORPAppAttestInfo__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
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
  return -[GEORPAppAttestInfo _dictionaryRepresentation:](self, 1);
}

void __48__GEORPAppAttestInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPAppAttestInfo)initWithDictionary:(id)a3
{
  return (GEORPAppAttestInfo *)-[GEORPAppAttestInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"anonymousUserId";
      }
      else {
        objc_super v6 = @"anonymous_user_id";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setAnonymousUserId:v8];
      }
      v9 = [v5 objectForKeyedSubscript:@"attestation"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v9 options:0];
        [a1 setAttestation:v10];
      }
      v11 = [v5 objectForKeyedSubscript:@"assertion"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v11 options:0];
        [a1 setAssertion:v12];
      }
      if (a3) {
        v13 = @"keyId";
      }
      else {
        v13 = @"key_id";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = (void *)[v14 copy];
        [a1 setKeyId:v15];
      }
    }
  }

  return a1;
}

- (GEORPAppAttestInfo)initWithJSON:(id)a3
{
  return (GEORPAppAttestInfo *)-[GEORPAppAttestInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_312;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_313;
    }
    GEORPAppAttestInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPAppAttestInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPAppAttestInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3E) == 0))
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
    [(GEORPAppAttestInfo *)self readAll:0];
    if (self->_anonymousUserId) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_attestation)
    {
      PBDataWriterWriteDataField();
      id v5 = v8;
    }
    if (self->_assertion)
    {
      PBDataWriterWriteDataField();
      id v5 = v8;
    }
    if (self->_keyId)
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
  [(GEORPAppAttestInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_anonymousUserId) {
    objc_msgSend(v5, "setAnonymousUserId:");
  }
  if (self->_attestation) {
    objc_msgSend(v5, "setAttestation:");
  }
  v4 = v5;
  if (self->_assertion)
  {
    objc_msgSend(v5, "setAssertion:");
    v4 = v5;
  }
  if (self->_keyId)
  {
    objc_msgSend(v5, "setKeyId:");
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
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPAppAttestInfo *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_anonymousUserId copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    uint64_t v10 = [(NSData *)self->_attestation copyWithZone:a3];
    v11 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;

    uint64_t v12 = [(NSData *)self->_assertion copyWithZone:a3];
    v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    uint64_t v14 = [(NSString *)self->_keyId copyWithZone:a3];
    v15 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPAppAttestInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPAppAttestInfo *)self readAll:1],
         [v4 readAll:1],
         anonymousUserId = self->_anonymousUserId,
         !((unint64_t)anonymousUserId | v4[3]))
     || -[NSString isEqual:](anonymousUserId, "isEqual:"))
    && ((attestation = self->_attestation, !((unint64_t)attestation | v4[5]))
     || -[NSData isEqual:](attestation, "isEqual:"))
    && ((assertion = self->_assertion, !((unint64_t)assertion | v4[4]))
     || -[NSData isEqual:](assertion, "isEqual:")))
  {
    keyId = self->_keyId;
    if ((unint64_t)keyId | v4[6]) {
      char v9 = -[NSString isEqual:](keyId, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  [(GEORPAppAttestInfo *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_anonymousUserId hash];
  uint64_t v4 = [(NSData *)self->_attestation hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_assertion hash];
  return v4 ^ v5 ^ [(NSString *)self->_keyId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  [v4 readAll:0];
  if (v4[3]) {
    -[GEORPAppAttestInfo setAnonymousUserId:](self, "setAnonymousUserId:");
  }
  if (v4[5]) {
    -[GEORPAppAttestInfo setAttestation:](self, "setAttestation:");
  }
  if (v4[4]) {
    -[GEORPAppAttestInfo setAssertion:](self, "setAssertion:");
  }
  if (v4[6]) {
    -[GEORPAppAttestInfo setKeyId:](self, "setKeyId:");
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
      GEORPAppAttestInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_317);
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
  *(unsigned char *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPAppAttestInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyId, 0);
  objc_storeStrong((id *)&self->_attestation, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_anonymousUserId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end