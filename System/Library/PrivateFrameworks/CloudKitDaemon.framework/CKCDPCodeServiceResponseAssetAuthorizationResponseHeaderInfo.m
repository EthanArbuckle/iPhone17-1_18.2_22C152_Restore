@interface CKCDPCodeServiceResponseAssetAuthorizationResponseHeaderInfo
- (BOOL)hasHeaderKey;
- (BOOL)hasHeaderValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)headerKey;
- (NSString)headerValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHeaderKey:(id)a3;
- (void)setHeaderValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKCDPCodeServiceResponseAssetAuthorizationResponseHeaderInfo

- (BOOL)hasHeaderKey
{
  return self->_headerKey != 0;
}

- (BOOL)hasHeaderValue
{
  return self->_headerValue != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKCDPCodeServiceResponseAssetAuthorizationResponseHeaderInfo;
  v4 = [(CKCDPCodeServiceResponseAssetAuthorizationResponseHeaderInfo *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  headerKey = self->_headerKey;
  if (headerKey) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)headerKey, @"headerKey");
  }
  headerValue = self->_headerValue;
  if (headerValue) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)headerValue, @"headerValue");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E60C14((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_headerKey)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_headerValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  headerKey = self->_headerKey;
  id v8 = v4;
  if (headerKey)
  {
    objc_msgSend_setHeaderKey_(v4, v5, (uint64_t)headerKey);
    id v4 = v8;
  }
  headerValue = self->_headerValue;
  if (headerValue)
  {
    objc_msgSend_setHeaderValue_(v8, v5, (uint64_t)headerValue);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_headerKey, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_headerValue, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((headerKey = self->_headerKey, uint64_t v9 = v4[1], !((unint64_t)headerKey | v9))
     || objc_msgSend_isEqual_(headerKey, v7, v9)))
  {
    headerValue = self->_headerValue;
    uint64_t v11 = v4[2];
    if ((unint64_t)headerValue | v11) {
      char isEqual = objc_msgSend_isEqual_(headerValue, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_headerKey, a2, v2);
  return objc_msgSend_hash(self->_headerValue, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v6 = v4[1];
  id v8 = v4;
  if (v6)
  {
    objc_msgSend_setHeaderKey_(self, v5, v6);
    uint64_t v4 = v8;
  }
  uint64_t v7 = v4[2];
  if (v7)
  {
    objc_msgSend_setHeaderValue_(self, v5, v7);
    uint64_t v4 = v8;
  }
}

- (NSString)headerKey
{
  return self->_headerKey;
}

- (void)setHeaderKey:(id)a3
{
}

- (NSString)headerValue
{
  return self->_headerValue;
}

- (void)setHeaderValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerValue, 0);
  objc_storeStrong((id *)&self->_headerKey, 0);
}

@end