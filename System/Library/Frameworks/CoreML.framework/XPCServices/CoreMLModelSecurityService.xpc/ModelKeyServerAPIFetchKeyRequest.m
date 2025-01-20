@interface ModelKeyServerAPIFetchKeyRequest
- (BOOL)hasKeyId;
- (BOOL)hasRawRequest;
- (BOOL)hasSignedKeyRequest;
- (BOOL)hasTeamId;
- (BOOL)isEqual:(id)a3;
- (BOOL)rawRequest;
- (BOOL)readFrom:(id)a3;
- (NSData)signedKeyRequest;
- (NSString)description;
- (NSString)keyId;
- (NSString)teamId;
- (id)copyWithZone:(_NSZone *)a3;
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

- (BOOL)hasKeyId
{
  return self->_keyId != 0;
}

- (BOOL)hasTeamId
{
  return self->_teamId != 0;
}

- (BOOL)hasSignedKeyRequest
{
  return self->_signedKeyRequest != 0;
}

- (void)setRawRequest:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_rawRequest = a3;
}

- (void)setHasRawRequest:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRawRequest
{
  return *(unsigned char *)&self->_has & 1;
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)ModelKeyServerAPIFetchKeyRequest;
  v3 = [(ModelKeyServerAPIFetchKeyRequest *)&v7 description];
  v4 = [(ModelKeyServerAPIFetchKeyRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return (NSString *)v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
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
    v8 = +[NSNumber numberWithBool:self->_rawRequest];
    [v4 setObject:v8 forKey:@"raw_request"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ModelKeyServerAPIFetchKeyRequestReadFrom((uint64_t)self, (uint64_t)a3);
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

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
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

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_keyId copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_teamId copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(NSData *)self->_signedKeyRequest copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v5 + 32) = self->_rawRequest;
    *((unsigned char *)v5 + 36) |= 1u;
  }
  return v5;
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

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_keyId hash];
  NSUInteger v4 = [(NSString *)self->_teamId hash];
  unint64_t v5 = (unint64_t)[(NSData *)self->_signedKeyRequest hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_rawRequest;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  unint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[ModelKeyServerAPIFetchKeyRequest setKeyId:](self, "setKeyId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[ModelKeyServerAPIFetchKeyRequest setTeamId:](self, "setTeamId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[ModelKeyServerAPIFetchKeyRequest setSignedKeyRequest:](self, "setSignedKeyRequest:");
    NSUInteger v4 = v5;
  }
  if (v4[36])
  {
    self->_rawRequest = v4[32];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)keyId
{
  return self->_keyId;
}

- (void)setKeyId:(id)a3
{
}

- (NSString)teamId
{
  return self->_teamId;
}

- (void)setTeamId:(id)a3
{
}

- (NSData)signedKeyRequest
{
  return self->_signedKeyRequest;
}

- (void)setSignedKeyRequest:(id)a3
{
}

- (BOOL)rawRequest
{
  return self->_rawRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_signedKeyRequest, 0);

  objc_storeStrong((id *)&self->_keyId, 0);
}

@end