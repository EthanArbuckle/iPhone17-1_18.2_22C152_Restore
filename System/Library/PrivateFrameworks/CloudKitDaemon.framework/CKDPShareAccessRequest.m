@interface CKDPShareAccessRequest
+ (id)options;
- (BOOL)hasRoutingKey;
- (BOOL)hasShortTokenHash;
- (BOOL)hasUserInformationRequestAccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPUserInformationRequestAccess)userInformationRequestAccess;
- (Class)responseClass;
- (NSData)shortTokenHash;
- (NSString)routingKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRoutingKey:(id)a3;
- (void)setShortTokenHash:(id)a3;
- (void)setUserInformationRequestAccess:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPShareAccessRequest

+ (id)options
{
  if (qword_1EBBCDD30 != -1) {
    dispatch_once(&qword_1EBBCDD30, &unk_1F2043250);
  }
  v2 = (void *)qword_1EBBCDD28;
  return v2;
}

- (BOOL)hasRoutingKey
{
  return self->_routingKey != 0;
}

- (BOOL)hasShortTokenHash
{
  return self->_shortTokenHash != 0;
}

- (BOOL)hasUserInformationRequestAccess
{
  return self->_userInformationRequestAccess != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPShareAccessRequest;
  v4 = [(CKDPShareAccessRequest *)&v11 description];
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
  userInformationRequestAccess = self->_userInformationRequestAccess;
  if (userInformationRequestAccess)
  {
    v10 = objc_msgSend_dictionaryRepresentation(userInformationRequestAccess, v5, (uint64_t)shortTokenHash);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"userInformationRequestAccess");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E010EC((uint64_t)self, (uint64_t)a3);
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
  if (self->_userInformationRequestAccess)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (unsigned)requestTypeCode
{
  return 90;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  routingKey = self->_routingKey;
  id v9 = v4;
  if (routingKey)
  {
    objc_msgSend_setRoutingKey_(v4, v5, (uint64_t)routingKey);
    id v4 = v9;
  }
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash)
  {
    objc_msgSend_setShortTokenHash_(v9, v5, (uint64_t)shortTokenHash);
    id v4 = v9;
  }
  userInformationRequestAccess = self->_userInformationRequestAccess;
  if (userInformationRequestAccess)
  {
    objc_msgSend_setUserInformationRequestAccess_(v9, v5, (uint64_t)userInformationRequestAccess);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_routingKey, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_shortTokenHash, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_userInformationRequestAccess, v17, (uint64_t)a3);
  v19 = (void *)v10[3];
  v10[3] = v18;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((routingKey = self->_routingKey, uint64_t v9 = v4[1], !((unint64_t)routingKey | v9))
     || objc_msgSend_isEqual_(routingKey, v7, v9))
    && ((shortTokenHash = self->_shortTokenHash, uint64_t v11 = v4[2], !((unint64_t)shortTokenHash | v11))
     || objc_msgSend_isEqual_(shortTokenHash, v7, v11)))
  {
    userInformationRequestAccess = self->_userInformationRequestAccess;
    uint64_t v13 = v4[3];
    if ((unint64_t)userInformationRequestAccess | v13) {
      char isEqual = objc_msgSend_isEqual_(userInformationRequestAccess, v7, v13);
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
  uint64_t v4 = objc_msgSend_hash(self->_routingKey, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_shortTokenHash, v5, v6) ^ v4;
  return v7 ^ objc_msgSend_hash(self->_userInformationRequestAccess, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = v4[1];
  uint64_t v9 = v4;
  if (v5)
  {
    objc_msgSend_setRoutingKey_(self, (const char *)v4, v5);
    uint64_t v4 = v9;
  }
  uint64_t v6 = v4[2];
  if (v6)
  {
    objc_msgSend_setShortTokenHash_(self, (const char *)v4, v6);
    uint64_t v4 = v9;
  }
  userInformationRequestAccess = self->_userInformationRequestAccess;
  uint64_t v8 = v4[3];
  if (userInformationRequestAccess)
  {
    if (v8) {
      objc_msgSend_mergeFrom_(userInformationRequestAccess, (const char *)v4, v8);
    }
  }
  else if (v8)
  {
    objc_msgSend_setUserInformationRequestAccess_(self, (const char *)v4, v8);
  }
  MEMORY[0x1F41817F8]();
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

- (CKDPUserInformationRequestAccess)userInformationRequestAccess
{
  return self->_userInformationRequestAccess;
}

- (void)setUserInformationRequestAccess:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInformationRequestAccess, 0);
  objc_storeStrong((id *)&self->_shortTokenHash, 0);
  objc_storeStrong((id *)&self->_routingKey, 0);
}

@end