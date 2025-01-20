@interface CKDPAssetUploadTokenRetrieveResponseUploadToken
- (BOOL)duplicateAsset;
- (BOOL)hasAsset;
- (BOOL)hasDuplicateAsset;
- (BOOL)hasToken;
- (BOOL)hasTokenExpiration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPAsset)asset;
- (NSString)token;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)tokenExpiration;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAsset:(id)a3;
- (void)setDuplicateAsset:(BOOL)a3;
- (void)setHasDuplicateAsset:(BOOL)a3;
- (void)setHasTokenExpiration:(BOOL)a3;
- (void)setToken:(id)a3;
- (void)setTokenExpiration:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPAssetUploadTokenRetrieveResponseUploadToken

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (BOOL)hasAsset
{
  return self->_asset != 0;
}

- (void)setTokenExpiration:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_tokenExpiration = a3;
}

- (void)setHasTokenExpiration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTokenExpiration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDuplicateAsset:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_duplicateAsset = a3;
}

- (void)setHasDuplicateAsset:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuplicateAsset
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPAssetUploadTokenRetrieveResponseUploadToken;
  v4 = [(CKDPAssetUploadTokenRetrieveResponseUploadToken *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  token = self->_token;
  if (token) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)token, @"token");
  }
  asset = self->_asset;
  if (asset)
  {
    v9 = objc_msgSend_dictionaryRepresentation(asset, v5, (uint64_t)token);
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, @"asset");
  }
  char has = (char)self->_has;
  if (has)
  {
    v12 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v5, self->_tokenExpiration);
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, @"tokenExpiration");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v14 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v5, self->_duplicateAsset);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"duplicateAsset");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E26A00((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_token)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_asset)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  token = self->_token;
  id v9 = v4;
  if (token)
  {
    objc_msgSend_setToken_(v4, v5, (uint64_t)token);
    id v4 = v9;
  }
  asset = self->_asset;
  if (asset)
  {
    objc_msgSend_setAsset_(v9, v5, (uint64_t)asset);
    id v4 = v9;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_tokenExpiration;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 32) = self->_duplicateAsset;
    *((unsigned char *)v4 + 36) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_token, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_asset, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v15;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v10 + 8) = self->_tokenExpiration;
    *(unsigned char *)(v10 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v10 + 32) = self->_duplicateAsset;
    *(unsigned char *)(v10 + 36) |= 2u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_13;
  }
  token = self->_token;
  uint64_t v9 = v4[3];
  if ((unint64_t)token | v9)
  {
    if (!objc_msgSend_isEqual_(token, v7, v9)) {
      goto LABEL_13;
    }
  }
  asset = self->_asset;
  uint64_t v11 = v4[2];
  if ((unint64_t)asset | v11)
  {
    if (!objc_msgSend_isEqual_(asset, v7, v11)) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_tokenExpiration != v4[1]) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_13;
  }
  BOOL v12 = (*((unsigned char *)v4 + 36) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0)
    {
LABEL_13:
      BOOL v12 = 0;
      goto LABEL_14;
    }
    if (self->_duplicateAsset)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_13;
    }
    BOOL v12 = 1;
  }
LABEL_14:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_token, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_asset, v5, v6);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = 2654435761 * self->_tokenExpiration;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    return v7 ^ v4 ^ v8 ^ v9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = 2654435761 * self->_duplicateAsset;
  return v7 ^ v4 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *((void *)v4 + 3);
  id v9 = v4;
  if (v5)
  {
    objc_msgSend_setToken_(self, (const char *)v4, v5);
    id v4 = v9;
  }
  asset = self->_asset;
  uint64_t v7 = *((void *)v4 + 2);
  if (asset)
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_mergeFrom_(asset, (const char *)v4, v7);
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_setAsset_(self, (const char *)v4, v7);
  }
  id v4 = v9;
LABEL_9:
  char v8 = *((unsigned char *)v4 + 36);
  if (v8)
  {
    self->_tokenExpiration = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v8 = *((unsigned char *)v4 + 36);
  }
  if ((v8 & 2) != 0)
  {
    self->_duplicateAsset = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (CKDPAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (int64_t)tokenExpiration
{
  return self->_tokenExpiration;
}

- (BOOL)duplicateAsset
{
  return self->_duplicateAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end