@interface ModelKeyServerAPIFetchKeyRequest
- (BOOL)hasKeyId;
- (BOOL)hasRawRequest;
- (BOOL)hasSignedKeyRequest;
- (BOOL)hasTeamId;
- (BOOL)isEqual:(id)a3;
- (BOOL)rawRequest;
- (BOOL)readFrom:(id)a3;
- (NSData)signedKeyRequest;
- (NSString)keyId;
- (NSString)teamId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRawRequest:(BOOL)a3;
- (void)setKeyId:(id)a3;
- (void)setRawRequest:(BOOL)a3;
- (void)setSignedKeyRequest:(id)a3;
- (void)setTeamId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ModelKeyServerAPIFetchKeyRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_signedKeyRequest, 0);

  objc_storeStrong((id *)&self->_keyId, 0);
}

- (BOOL)rawRequest
{
  return self->_rawRequest;
}

- (void)setSignedKeyRequest:(id)a3
{
}

- (NSData)signedKeyRequest
{
  return self->_signedKeyRequest;
}

- (void)setTeamId:(id)a3
{
}

- (NSString)teamId
{
  return self->_teamId;
}

- (void)setKeyId:(id)a3
{
}

- (NSString)keyId
{
  return self->_keyId;
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[ModelKeyServerAPIFetchKeyRequest setKeyId:](self, "setKeyId:");
    v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[ModelKeyServerAPIFetchKeyRequest setTeamId:](self, "setTeamId:");
    v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[ModelKeyServerAPIFetchKeyRequest setSignedKeyRequest:](self, "setSignedKeyRequest:");
    v4 = v5;
  }
  if (v4[36])
  {
    self->_rawRequest = v4[32];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_keyId hash];
  NSUInteger v4 = [(NSString *)self->_teamId hash];
  uint64_t v5 = [(NSData *)self->_signedKeyRequest hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_rawRequest;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  keyId = self->_keyId;
  if ((unint64_t)keyId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](keyId, "isEqual:")) {
      goto LABEL_10;
    }
  }
  teamId = self->_teamId;
  if ((unint64_t)teamId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](teamId, "isEqual:")) {
      goto LABEL_10;
    }
  }
  signedKeyRequest = self->_signedKeyRequest;
  if ((unint64_t)signedKeyRequest | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](signedKeyRequest, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0)
    {
LABEL_10:
      BOOL v8 = 0;
      goto LABEL_11;
    }
    if (self->_rawRequest)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_10;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_10;
    }
    BOOL v8 = 1;
  }
LABEL_11:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_keyId copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_teamId copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSData *)self->_signedKeyRequest copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 32) = self->_rawRequest;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_keyId)
  {
    objc_msgSend(v4, "setKeyId:");
    id v4 = v5;
  }
  if (self->_teamId)
  {
    objc_msgSend(v5, "setTeamId:");
    id v4 = v5;
  }
  if (self->_signedKeyRequest)
  {
    objc_msgSend(v5, "setSignedKeyRequest:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[32] = self->_rawRequest;
    v4[36] |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_keyId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_teamId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_signedKeyRequest)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v8 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v15 = v10++ >= 9;
        if (v15)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      switch((v11 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = 8;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = 24;
          goto LABEL_24;
        case 3u:
          PBReaderReadData();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = 16;
LABEL_24:
          v21 = *(Class *)((char *)&self->super.super.super.isa + v19);
          *(Class *)((char *)&self->super.super.super.isa + v19) = v18;

          continue;
        case 4u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          *(unsigned char *)&self->_has |= 1u;
          break;
        default:
          int v20 = PBReaderSkipValueWithTag();
          if (!v20) {
            return v20;
          }
          continue;
      }
      while (1)
      {
        uint64_t v25 = *v4;
        unint64_t v26 = *(void *)((char *)a3 + v25);
        if (v26 == -1 || v26 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v27 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v26);
        *(void *)((char *)a3 + v25) = v26 + 1;
        v24 |= (unint64_t)(v27 & 0x7F) << v22;
        if ((v27 & 0x80) == 0) {
          goto LABEL_33;
        }
        v22 += 7;
        BOOL v15 = v23++ >= 9;
        if (v15)
        {
          uint64_t v24 = 0;
          goto LABEL_35;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_33:
      if (*((unsigned char *)a3 + *v6)) {
        uint64_t v24 = 0;
      }
LABEL_35:
      self->_rawRequest = v24 != 0;
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v20) = *((unsigned char *)a3 + *v6) == 0;
  return v20;
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  keyId = self->_keyId;
  if (keyId) {
    [v3 setObject:keyId forKey:@"key_id"];
  }
  teamId = self->_teamId;
  if (teamId) {
    [v4 setObject:teamId forKey:@"team_id"];
  }
  signedKeyRequest = self->_signedKeyRequest;
  if (signedKeyRequest) {
    [v4 setObject:signedKeyRequest forKey:@"signed_key_request"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = [NSNumber numberWithBool:self->_rawRequest];
    [v4 setObject:v8 forKey:@"raw_request"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ModelKeyServerAPIFetchKeyRequest;
  id v4 = [(ModelKeyServerAPIFetchKeyRequest *)&v8 description];
  id v5 = [(ModelKeyServerAPIFetchKeyRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasRawRequest
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRawRequest:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRawRequest:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_rawRequest = a3;
}

- (BOOL)hasSignedKeyRequest
{
  return self->_signedKeyRequest != 0;
}

- (BOOL)hasTeamId
{
  return self->_teamId != 0;
}

- (BOOL)hasKeyId
{
  return self->_keyId != 0;
}

@end