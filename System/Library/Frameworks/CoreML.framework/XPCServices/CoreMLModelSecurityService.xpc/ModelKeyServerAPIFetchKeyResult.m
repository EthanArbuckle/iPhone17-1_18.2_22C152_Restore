@interface ModelKeyServerAPIFetchKeyResult
- (BOOL)hasKey;
- (BOOL)hasKeyId;
- (BOOL)hasModelName;
- (BOOL)hasRawKey;
- (BOOL)hasSignedKey;
- (BOOL)hasTeamId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ModelKeyServerAPIRawKey)rawKey;
- (ModelKeyServerAPISignedKey)signedKey;
- (NSString)keyId;
- (NSString)modelName;
- (NSString)teamId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyAsString:(int)a3;
- (int)StringAsKey:(id)a3;
- (int)key;
- (unint64_t)hash;
- (void)clearOneofValuesForKey;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasKey:(BOOL)a3;
- (void)setKey:(int)a3;
- (void)setKeyId:(id)a3;
- (void)setModelName:(id)a3;
- (void)setRawKey:(id)a3;
- (void)setSignedKey:(id)a3;
- (void)setTeamId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ModelKeyServerAPIFetchKeyResult

- (BOOL)hasKeyId
{
  return self->_keyId != 0;
}

- (BOOL)hasModelName
{
  return self->_modelName != 0;
}

- (BOOL)hasTeamId
{
  return self->_teamId != 0;
}

- (BOOL)hasSignedKey
{
  return self->_signedKey != 0;
}

- (void)setSignedKey:(id)a3
{
  v4 = (ModelKeyServerAPISignedKey *)a3;
  [(ModelKeyServerAPIFetchKeyResult *)self clearOneofValuesForKey];
  *(unsigned char *)&self->_has |= 1u;
  self->_key = 1;
  signedKey = self->_signedKey;
  self->_signedKey = v4;
}

- (BOOL)hasRawKey
{
  return self->_rawKey != 0;
}

- (void)setRawKey:(id)a3
{
  v4 = (ModelKeyServerAPIRawKey *)a3;
  [(ModelKeyServerAPIFetchKeyResult *)self clearOneofValuesForKey];
  *(unsigned char *)&self->_has |= 1u;
  self->_key = 2;
  rawKey = self->_rawKey;
  self->_rawKey = v4;
}

- (int)key
{
  if (*(unsigned char *)&self->_has) {
    return self->_key;
  }
  else {
    return 0;
  }
}

- (void)setKey:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_key = a3;
}

- (void)setHasKey:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKey
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)keyAsString:(int)a3
{
  if (a3 >= 3)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_100010348[a3];
  }

  return v3;
}

- (int)StringAsKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"signed_key"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"raw_key"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForKey
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_key = 0;
  signedKey = self->_signedKey;
  self->_signedKey = 0;

  rawKey = self->_rawKey;
  self->_rawKey = 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ModelKeyServerAPIFetchKeyResult;
  id v3 = [(ModelKeyServerAPIFetchKeyResult *)&v7 description];
  int v4 = [(ModelKeyServerAPIFetchKeyResult *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  keyId = self->_keyId;
  if (keyId) {
    [v3 setObject:keyId forKey:@"key_id"];
  }
  modelName = self->_modelName;
  if (modelName) {
    [v4 setObject:modelName forKey:@"model_name"];
  }
  teamId = self->_teamId;
  if (teamId) {
    [v4 setObject:teamId forKey:@"team_id"];
  }
  signedKey = self->_signedKey;
  if (signedKey)
  {
    v9 = [(ModelKeyServerAPISignedKey *)signedKey dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"signed_key"];
  }
  rawKey = self->_rawKey;
  if (rawKey)
  {
    v11 = [(ModelKeyServerAPIRawKey *)rawKey dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"raw_key"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t key = self->_key;
    if (key >= 3)
    {
      v13 = +[NSString stringWithFormat:@"(unknown: %i)", self->_key];
    }
    else
    {
      v13 = off_100010348[key];
    }
    [v4 setObject:v13 forKey:@"Key"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ModelKeyServerAPIFetchKeyResultReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_modelName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_teamId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_signedKey)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_rawKey)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_key;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  id v5 = v4;
  if (self->_keyId)
  {
    objc_msgSend(v4, "setKeyId:");
    id v4 = v5;
  }
  if (self->_modelName)
  {
    objc_msgSend(v5, "setModelName:");
    id v4 = v5;
  }
  if (self->_teamId)
  {
    objc_msgSend(v5, "setTeamId:");
    id v4 = v5;
  }
  if (self->_signedKey)
  {
    objc_msgSend(v5, "setSignedKey:");
    id v4 = v5;
  }
  if (self->_rawKey)
  {
    objc_msgSend(v5, "setRawKey:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 2) = self->_key;
    *((unsigned char *)v5 + 56) |= 1u;
  }
  id v7 = [(NSString *)self->_keyId copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(NSString *)self->_modelName copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  id v11 = [(NSString *)self->_teamId copyWithZone:a3];
  v12 = (void *)v6[6];
  v6[6] = v11;

  id v13 = [(ModelKeyServerAPISignedKey *)self->_signedKey copyWithZone:a3];
  v14 = (void *)v6[5];
  v6[5] = v13;

  id v15 = [(ModelKeyServerAPIRawKey *)self->_rawKey copyWithZone:a3];
  v16 = (void *)v6[4];
  v6[4] = v15;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_key != *((_DWORD *)v4 + 2)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_17:
    unsigned __int8 v10 = 0;
    goto LABEL_18;
  }
  keyId = self->_keyId;
  if ((unint64_t)keyId | *((void *)v4 + 2) && !-[NSString isEqual:](keyId, "isEqual:")) {
    goto LABEL_17;
  }
  modelName = self->_modelName;
  if ((unint64_t)modelName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](modelName, "isEqual:")) {
      goto LABEL_17;
    }
  }
  teamId = self->_teamId;
  if ((unint64_t)teamId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](teamId, "isEqual:")) {
      goto LABEL_17;
    }
  }
  signedKey = self->_signedKey;
  if ((unint64_t)signedKey | *((void *)v4 + 5))
  {
    if (!-[ModelKeyServerAPISignedKey isEqual:](signedKey, "isEqual:")) {
      goto LABEL_17;
    }
  }
  rawKey = self->_rawKey;
  if ((unint64_t)rawKey | *((void *)v4 + 4)) {
    unsigned __int8 v10 = -[ModelKeyServerAPIRawKey isEqual:](rawKey, "isEqual:");
  }
  else {
    unsigned __int8 v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_key;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(NSString *)self->_keyId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_modelName hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_teamId hash];
  unint64_t v7 = [(ModelKeyServerAPISignedKey *)self->_signedKey hash];
  return v6 ^ v7 ^ [(ModelKeyServerAPIRawKey *)self->_rawKey hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = v4;
  if (*((unsigned char *)v4 + 56))
  {
    self->_uint64_t key = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  unsigned __int8 v10 = v4;
  if (*((void *)v4 + 2))
  {
    -[ModelKeyServerAPIFetchKeyResult setKeyId:](self, "setKeyId:");
    NSUInteger v5 = v10;
  }
  if (v5[3])
  {
    -[ModelKeyServerAPIFetchKeyResult setModelName:](self, "setModelName:");
    NSUInteger v5 = v10;
  }
  if (v5[6])
  {
    -[ModelKeyServerAPIFetchKeyResult setTeamId:](self, "setTeamId:");
    NSUInteger v5 = v10;
  }
  signedKey = self->_signedKey;
  uint64_t v7 = v5[5];
  if (signedKey)
  {
    if (!v7) {
      goto LABEL_15;
    }
    -[ModelKeyServerAPISignedKey mergeFrom:](signedKey, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_15;
    }
    -[ModelKeyServerAPIFetchKeyResult setSignedKey:](self, "setSignedKey:");
  }
  NSUInteger v5 = v10;
LABEL_15:
  rawKey = self->_rawKey;
  uint64_t v9 = v5[4];
  if (rawKey)
  {
    if (v9) {
      -[ModelKeyServerAPIRawKey mergeFrom:](rawKey, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[ModelKeyServerAPIFetchKeyResult setRawKey:](self, "setRawKey:");
  }

  _objc_release_x1();
}

- (NSString)keyId
{
  return self->_keyId;
}

- (void)setKeyId:(id)a3
{
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (NSString)teamId
{
  return self->_teamId;
}

- (void)setTeamId:(id)a3
{
}

- (ModelKeyServerAPISignedKey)signedKey
{
  return self->_signedKey;
}

- (ModelKeyServerAPIRawKey)rawKey
{
  return self->_rawKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_signedKey, 0);
  objc_storeStrong((id *)&self->_rawKey, 0);
  objc_storeStrong((id *)&self->_modelName, 0);

  objc_storeStrong((id *)&self->_keyId, 0);
}

@end