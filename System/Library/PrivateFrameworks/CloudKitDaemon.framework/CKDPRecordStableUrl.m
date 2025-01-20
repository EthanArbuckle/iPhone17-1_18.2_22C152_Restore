@interface CKDPRecordStableUrl
- (BOOL)hasDisplayedHostname;
- (BOOL)hasEncryptedPublicSharingKey;
- (BOOL)hasProtectedFullToken;
- (BOOL)hasRoutingKey;
- (BOOL)hasShortTokenHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptedPublicSharingKey;
- (NSData)protectedFullToken;
- (NSData)shortTokenHash;
- (NSString)displayedHostname;
- (NSString)routingKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayedHostname:(id)a3;
- (void)setEncryptedPublicSharingKey:(id)a3;
- (void)setProtectedFullToken:(id)a3;
- (void)setRoutingKey:(id)a3;
- (void)setShortTokenHash:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordStableUrl

- (BOOL)hasRoutingKey
{
  return self->_routingKey != 0;
}

- (BOOL)hasShortTokenHash
{
  return self->_shortTokenHash != 0;
}

- (BOOL)hasProtectedFullToken
{
  return self->_protectedFullToken != 0;
}

- (BOOL)hasEncryptedPublicSharingKey
{
  return self->_encryptedPublicSharingKey != 0;
}

- (BOOL)hasDisplayedHostname
{
  return self->_displayedHostname != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordStableUrl;
  v4 = [(CKDPRecordStableUrl *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  routingKey = self->_routingKey;
  if (routingKey) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)routingKey, @"routingKey");
  }
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)shortTokenHash, @"shortTokenHash");
  }
  protectedFullToken = self->_protectedFullToken;
  if (protectedFullToken) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)protectedFullToken, @"protectedFullToken");
  }
  encryptedPublicSharingKey = self->_encryptedPublicSharingKey;
  if (encryptedPublicSharingKey) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)encryptedPublicSharingKey, @"encryptedPublicSharingKey");
  }
  displayedHostname = self->_displayedHostname;
  if (displayedHostname) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)displayedHostname, @"displayedHostname");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordStableUrlReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_routingKey)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_shortTokenHash)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_protectedFullToken)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_encryptedPublicSharingKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_displayedHostname)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  routingKey = self->_routingKey;
  id v11 = v4;
  if (routingKey)
  {
    objc_msgSend_setRoutingKey_(v4, v5, (uint64_t)routingKey);
    id v4 = v11;
  }
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash)
  {
    objc_msgSend_setShortTokenHash_(v11, v5, (uint64_t)shortTokenHash);
    id v4 = v11;
  }
  protectedFullToken = self->_protectedFullToken;
  if (protectedFullToken)
  {
    objc_msgSend_setProtectedFullToken_(v11, v5, (uint64_t)protectedFullToken);
    id v4 = v11;
  }
  encryptedPublicSharingKey = self->_encryptedPublicSharingKey;
  if (encryptedPublicSharingKey)
  {
    objc_msgSend_setEncryptedPublicSharingKey_(v11, v5, (uint64_t)encryptedPublicSharingKey);
    id v4 = v11;
  }
  displayedHostname = self->_displayedHostname;
  if (displayedHostname)
  {
    objc_msgSend_setDisplayedHostname_(v11, v5, (uint64_t)displayedHostname);
    id v4 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_routingKey, v11, (uint64_t)a3);
  v13 = (void *)v10[4];
  v10[4] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_shortTokenHash, v14, (uint64_t)a3);
  v16 = (void *)v10[5];
  v10[5] = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_protectedFullToken, v17, (uint64_t)a3);
  v19 = (void *)v10[3];
  v10[3] = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_encryptedPublicSharingKey, v20, (uint64_t)a3);
  v22 = (void *)v10[2];
  v10[2] = v21;

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_displayedHostname, v23, (uint64_t)a3);
  v25 = (void *)v10[1];
  v10[1] = v24;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_12;
  }
  routingKey = self->_routingKey;
  uint64_t v9 = v4[4];
  if ((unint64_t)routingKey | v9)
  {
    if (!objc_msgSend_isEqual_(routingKey, v7, v9)) {
      goto LABEL_12;
    }
  }
  if (((shortTokenHash = self->_shortTokenHash, uint64_t v11 = v4[5], !((unint64_t)shortTokenHash | v11))
     || objc_msgSend_isEqual_(shortTokenHash, v7, v11))
    && ((protectedFullToken = self->_protectedFullToken, uint64_t v13 = v4[3], !((unint64_t)protectedFullToken | v13))
     || objc_msgSend_isEqual_(protectedFullToken, v7, v13))
    && ((encryptedPublicSharingKey = self->_encryptedPublicSharingKey,
         uint64_t v15 = v4[2],
         !((unint64_t)encryptedPublicSharingKey | v15))
     || objc_msgSend_isEqual_(encryptedPublicSharingKey, v7, v15)))
  {
    displayedHostname = self->_displayedHostname;
    uint64_t v17 = v4[1];
    if ((unint64_t)displayedHostname | v17) {
      char isEqual = objc_msgSend_isEqual_(displayedHostname, v7, v17);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
LABEL_12:
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_routingKey, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_shortTokenHash, v5, v6) ^ v4;
  uint64_t v10 = objc_msgSend_hash(self->_protectedFullToken, v8, v9);
  uint64_t v13 = v7 ^ v10 ^ objc_msgSend_hash(self->_encryptedPublicSharingKey, v11, v12);
  return v13 ^ objc_msgSend_hash(self->_displayedHostname, v14, v15);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v10 = a3;
  uint64_t v5 = v10[4];
  if (v5) {
    objc_msgSend_setRoutingKey_(self, v4, v5);
  }
  uint64_t v6 = v10[5];
  if (v6) {
    objc_msgSend_setShortTokenHash_(self, v4, v6);
  }
  uint64_t v7 = v10[3];
  if (v7) {
    objc_msgSend_setProtectedFullToken_(self, v4, v7);
  }
  uint64_t v8 = v10[2];
  if (v8) {
    objc_msgSend_setEncryptedPublicSharingKey_(self, v4, v8);
  }
  uint64_t v9 = v10[1];
  if (v9) {
    objc_msgSend_setDisplayedHostname_(self, v4, v9);
  }
}

- (NSString)routingKey
{
  return self->_routingKey;
}

- (void)setRoutingKey:(id)a3
{
}

- (NSData)shortTokenHash
{
  return self->_shortTokenHash;
}

- (void)setShortTokenHash:(id)a3
{
}

- (NSData)protectedFullToken
{
  return self->_protectedFullToken;
}

- (void)setProtectedFullToken:(id)a3
{
}

- (NSData)encryptedPublicSharingKey
{
  return self->_encryptedPublicSharingKey;
}

- (void)setEncryptedPublicSharingKey:(id)a3
{
}

- (NSString)displayedHostname
{
  return self->_displayedHostname;
}

- (void)setDisplayedHostname:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortTokenHash, 0);
  objc_storeStrong((id *)&self->_routingKey, 0);
  objc_storeStrong((id *)&self->_protectedFullToken, 0);
  objc_storeStrong((id *)&self->_encryptedPublicSharingKey, 0);
  objc_storeStrong((id *)&self->_displayedHostname, 0);
}

@end