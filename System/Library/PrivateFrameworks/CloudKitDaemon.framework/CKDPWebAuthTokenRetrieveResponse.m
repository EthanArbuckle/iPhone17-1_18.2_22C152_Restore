@interface CKDPWebAuthTokenRetrieveResponse
- (BOOL)hasContainerScopedUserId;
- (BOOL)hasToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)containerScopedUserId;
- (NSString)token;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContainerScopedUserId:(id)a3;
- (void)setToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPWebAuthTokenRetrieveResponse

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (BOOL)hasContainerScopedUserId
{
  return self->_containerScopedUserId != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPWebAuthTokenRetrieveResponse;
  v4 = [(CKDPWebAuthTokenRetrieveResponse *)&v11 description];
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
  containerScopedUserId = self->_containerScopedUserId;
  if (containerScopedUserId) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)containerScopedUserId, @"containerScopedUserId");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E8946C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_token)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_containerScopedUserId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  token = self->_token;
  id v8 = v4;
  if (token)
  {
    objc_msgSend_setToken_(v4, v5, (uint64_t)token);
    id v4 = v8;
  }
  containerScopedUserId = self->_containerScopedUserId;
  if (containerScopedUserId)
  {
    objc_msgSend_setContainerScopedUserId_(v8, v5, (uint64_t)containerScopedUserId);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_token, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_containerScopedUserId, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((token = self->_token, uint64_t v9 = v4[2], !((unint64_t)token | v9))
     || objc_msgSend_isEqual_(token, v7, v9)))
  {
    containerScopedUserId = self->_containerScopedUserId;
    uint64_t v11 = v4[1];
    if ((unint64_t)containerScopedUserId | v11) {
      char isEqual = objc_msgSend_isEqual_(containerScopedUserId, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_token, a2, v2);
  return objc_msgSend_hash(self->_containerScopedUserId, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v6 = v4[2];
  id v8 = v4;
  if (v6)
  {
    objc_msgSend_setToken_(self, v5, v6);
    uint64_t v4 = v8;
  }
  uint64_t v7 = v4[1];
  if (v7)
  {
    objc_msgSend_setContainerScopedUserId_(self, v5, v7);
    uint64_t v4 = v8;
  }
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSString)containerScopedUserId
{
  return self->_containerScopedUserId;
}

- (void)setContainerScopedUserId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_containerScopedUserId, 0);
}

@end