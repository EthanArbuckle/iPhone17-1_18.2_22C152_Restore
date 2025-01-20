@interface CKDPUserInformationBlockedRequestAccess
- (BOOL)hasContactInformation;
- (BOOL)hasUserId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPContactInformation)contactInformation;
- (NSString)userId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContactInformation:(id)a3;
- (void)setUserId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPUserInformationBlockedRequestAccess

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (BOOL)hasContactInformation
{
  return self->_contactInformation != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPUserInformationBlockedRequestAccess;
  v4 = [(CKDPUserInformationBlockedRequestAccess *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  userId = self->_userId;
  if (userId) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)userId, @"userId");
  }
  contactInformation = self->_contactInformation;
  if (contactInformation)
  {
    v9 = objc_msgSend_dictionaryRepresentation(contactInformation, v5, (uint64_t)userId);
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, @"contactInformation");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPUserInformationBlockedRequestAccessReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_userId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_contactInformation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  userId = self->_userId;
  id v8 = v4;
  if (userId)
  {
    objc_msgSend_setUserId_(v4, v5, (uint64_t)userId);
    id v4 = v8;
  }
  contactInformation = self->_contactInformation;
  if (contactInformation)
  {
    objc_msgSend_setContactInformation_(v8, v5, (uint64_t)contactInformation);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_userId, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_contactInformation, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((userId = self->_userId, uint64_t v9 = v4[2], !((unint64_t)userId | v9))
     || objc_msgSend_isEqual_(userId, v7, v9)))
  {
    contactInformation = self->_contactInformation;
    uint64_t v11 = v4[1];
    if ((unint64_t)contactInformation | v11) {
      char isEqual = objc_msgSend_isEqual_(contactInformation, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_userId, a2, v2);
  return objc_msgSend_hash(self->_contactInformation, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = v4[2];
  id v8 = v4;
  if (v5)
  {
    objc_msgSend_setUserId_(self, (const char *)v4, v5);
    uint64_t v4 = v8;
  }
  contactInformation = self->_contactInformation;
  uint64_t v7 = v4[1];
  if (contactInformation)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(contactInformation, (const char *)v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setContactInformation_(self, (const char *)v4, v7);
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
}

- (CKDPContactInformation)contactInformation
{
  return self->_contactInformation;
}

- (void)setContactInformation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_contactInformation, 0);
}

@end