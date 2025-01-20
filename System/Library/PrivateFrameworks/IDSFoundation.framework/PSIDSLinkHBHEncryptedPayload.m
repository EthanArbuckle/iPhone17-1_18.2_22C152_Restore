@interface PSIDSLinkHBHEncryptedPayload
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)authenticationTag;
- (NSData)cipherText;
- (NSData)initializationVector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthenticationTag:(id)a3;
- (void)setCipherText:(id)a3;
- (void)setInitializationVector:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSIDSLinkHBHEncryptedPayload

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)PSIDSLinkHBHEncryptedPayload;
  v4 = [(PSIDSLinkHBHEncryptedPayload *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  v8 = v5;
  initializationVector = self->_initializationVector;
  if (initializationVector) {
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)initializationVector, v7, @"initializationVector");
  }
  cipherText = self->_cipherText;
  if (cipherText) {
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)cipherText, v7, @"cipherText");
  }
  authenticationTag = self->_authenticationTag;
  if (authenticationTag) {
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)authenticationTag, v7, @"authenticationTag");
  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return sub_19DA2DBE0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_initializationVector) {
    sub_19DB78844();
  }
  PBDataWriterWriteDataField();
  if (!self->_cipherText) {
    sub_19DB78870();
  }
  PBDataWriterWriteDataField();
  if (!self->_authenticationTag) {
    sub_19DB7889C();
  }
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  initializationVector = self->_initializationVector;
  id v11 = a3;
  objc_msgSend_setInitializationVector_(v11, v5, (uint64_t)initializationVector, v6);
  objc_msgSend_setCipherText_(v11, v7, (uint64_t)self->_cipherText, v8);
  objc_msgSend_setAuthenticationTag_(v11, v9, (uint64_t)self->_authenticationTag, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  double v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_initializationVector, v13, (uint64_t)a3, v14);
  v16 = (void *)v12[3];
  v12[3] = v15;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_cipherText, v17, (uint64_t)a3, v18);
  v20 = (void *)v12[2];
  v12[2] = v19;

  uint64_t v23 = objc_msgSend_copyWithZone_(self->_authenticationTag, v21, (uint64_t)a3, v22);
  v24 = (void *)v12[1];
  v12[1] = v23;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && ((initializationVector = self->_initializationVector, uint64_t v11 = v4[3],
                                                             !((unint64_t)initializationVector | v11))
     || objc_msgSend_isEqual_(initializationVector, v8, v11, v9))
    && ((cipherText = self->_cipherText, uint64_t v13 = v4[2], !((unint64_t)cipherText | v13))
     || objc_msgSend_isEqual_(cipherText, v8, v13, v9)))
  {
    authenticationTag = self->_authenticationTag;
    uint64_t v15 = v4[1];
    if ((unint64_t)authenticationTag | v15) {
      char isEqual = objc_msgSend_isEqual_(authenticationTag, v8, v15, v9);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_initializationVector, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(self->_cipherText, v6, v7, v8) ^ v5;
  return v9 ^ objc_msgSend_hash(self->_authenticationTag, v10, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v9 = a3;
  uint64_t v6 = v9[3];
  if (v6) {
    objc_msgSend_setInitializationVector_(self, v4, v6, v5);
  }
  uint64_t v7 = v9[2];
  if (v7) {
    objc_msgSend_setCipherText_(self, v4, v7, v5);
  }
  uint64_t v8 = v9[1];
  if (v8) {
    objc_msgSend_setAuthenticationTag_(self, v4, v8, v5);
  }
}

- (NSData)initializationVector
{
  return self->_initializationVector;
}

- (void)setInitializationVector:(id)a3
{
}

- (NSData)cipherText
{
  return self->_cipherText;
}

- (void)setCipherText:(id)a3
{
}

- (NSData)authenticationTag
{
  return self->_authenticationTag;
}

- (void)setAuthenticationTag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializationVector, 0);
  objc_storeStrong((id *)&self->_cipherText, 0);
  objc_storeStrong((id *)&self->_authenticationTag, 0);
}

@end