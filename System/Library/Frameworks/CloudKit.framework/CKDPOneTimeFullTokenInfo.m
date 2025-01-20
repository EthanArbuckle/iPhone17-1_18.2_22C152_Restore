@interface CKDPOneTimeFullTokenInfo
- (BOOL)hasSharingKeyBytes;
- (BOOL)hasSharingKeySeed;
- (BOOL)hasSharingKeyType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)sharingKeyBytes;
- (NSData)sharingKeySeed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)sharingKeyType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSharingKeyType:(BOOL)a3;
- (void)setSharingKeyBytes:(id)a3;
- (void)setSharingKeySeed:(id)a3;
- (void)setSharingKeyType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPOneTimeFullTokenInfo

- (BOOL)hasSharingKeyBytes
{
  return self->_sharingKeyBytes != 0;
}

- (void)setSharingKeyType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sharingKeyType = a3;
}

- (void)setHasSharingKeyType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSharingKeyType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSharingKeySeed
{
  return self->_sharingKeySeed != 0;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKDPOneTimeFullTokenInfo;
  v4 = [(CKDPOneTimeFullTokenInfo *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  v8 = v5;
  sharingKeyBytes = self->_sharingKeyBytes;
  if (sharingKeyBytes) {
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)sharingKeyBytes, @"sharingKeyBytes");
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v10 = objc_msgSend_numberWithInt_(NSNumber, v6, self->_sharingKeyType, v7);
    objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, @"sharingKeyType");
  }
  sharingKeySeed = self->_sharingKeySeed;
  if (sharingKeySeed) {
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)sharingKeySeed, @"sharingKeySeed");
  }

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPOneTimeFullTokenInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sharingKeyBytes)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_sharingKeySeed)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  sharingKeyBytes = self->_sharingKeyBytes;
  id v9 = v4;
  if (sharingKeyBytes)
  {
    objc_msgSend_setSharingKeyBytes_(v4, v5, (uint64_t)sharingKeyBytes, v6);
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_sharingKeyType;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  sharingKeySeed = self->_sharingKeySeed;
  if (sharingKeySeed)
  {
    objc_msgSend_setSharingKeySeed_(v9, v5, (uint64_t)sharingKeySeed, v6);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_sharingKeyBytes, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = v15;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v12 + 24) = self->_sharingKeyType;
    *(unsigned char *)(v12 + 28) |= 1u;
  }
  uint64_t v19 = objc_msgSend_copyWithZone_(self->_sharingKeySeed, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v19;

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_11;
  }
  sharingKeyBytes = self->_sharingKeyBytes;
  uint64_t v11 = v4[1];
  if ((unint64_t)sharingKeyBytes | v11)
  {
    if (!objc_msgSend_isEqual_(sharingKeyBytes, v8, v11, v9)) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_sharingKeyType != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    char isEqual = 0;
    goto LABEL_12;
  }
  sharingKeySeed = self->_sharingKeySeed;
  uint64_t v13 = v4[2];
  if ((unint64_t)sharingKeySeed | v13) {
    char isEqual = objc_msgSend_isEqual_(sharingKeySeed, v8, v13, v9);
  }
  else {
    char isEqual = 1;
  }
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_sharingKeyBytes, a2, v2, v3);
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_sharingKeyType;
  }
  else {
    uint64_t v9 = 0;
  }
  return v9 ^ v5 ^ objc_msgSend_hash(self->_sharingKeySeed, v6, v7, v8);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v7 = *((void *)v4 + 1);
  id v9 = v4;
  if (v7)
  {
    objc_msgSend_setSharingKeyBytes_(self, v5, v7, v6);
    id v4 = v9;
  }
  if (*((unsigned char *)v4 + 28))
  {
    self->_sharingKeyType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v8 = *((void *)v4 + 2);
  if (v8)
  {
    objc_msgSend_setSharingKeySeed_(self, v5, v8, v6);
    id v4 = v9;
  }
}

- (NSData)sharingKeyBytes
{
  return self->_sharingKeyBytes;
}

- (void)setSharingKeyBytes:(id)a3
{
}

- (int)sharingKeyType
{
  return self->_sharingKeyType;
}

- (NSData)sharingKeySeed
{
  return self->_sharingKeySeed;
}

- (void)setSharingKeySeed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingKeySeed, 0);

  objc_storeStrong((id *)&self->_sharingKeyBytes, 0);
}

@end