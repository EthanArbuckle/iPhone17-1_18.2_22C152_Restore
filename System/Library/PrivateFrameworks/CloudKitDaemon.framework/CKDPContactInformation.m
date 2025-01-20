@interface CKDPContactInformation
- (BOOL)hasContainerScopedUserId;
- (BOOL)hasEmailAddress;
- (BOOL)hasFirstName;
- (BOOL)hasLastName;
- (BOOL)hasPhoneNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)containerScopedUserId;
- (NSString)emailAddress;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)phoneNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContainerScopedUserId:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPContactInformation

- (BOOL)hasEmailAddress
{
  return self->_emailAddress != 0;
}

- (BOOL)hasContainerScopedUserId
{
  return self->_containerScopedUserId != 0;
}

- (BOOL)hasFirstName
{
  return self->_firstName != 0;
}

- (BOOL)hasLastName
{
  return self->_lastName != 0;
}

- (BOOL)hasPhoneNumber
{
  return self->_phoneNumber != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPContactInformation;
  v4 = [(CKDPContactInformation *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  emailAddress = self->_emailAddress;
  if (emailAddress) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)emailAddress, @"emailAddress");
  }
  containerScopedUserId = self->_containerScopedUserId;
  if (containerScopedUserId) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)containerScopedUserId, @"containerScopedUserId");
  }
  firstName = self->_firstName;
  if (firstName) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)firstName, @"firstName");
  }
  lastName = self->_lastName;
  if (lastName) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)lastName, @"lastName");
  }
  phoneNumber = self->_phoneNumber;
  if (phoneNumber) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)phoneNumber, @"phoneNumber");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPContactInformationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_emailAddress)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_containerScopedUserId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_firstName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_lastName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_phoneNumber)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  emailAddress = self->_emailAddress;
  id v11 = v4;
  if (emailAddress)
  {
    objc_msgSend_setEmailAddress_(v4, v5, (uint64_t)emailAddress);
    id v4 = v11;
  }
  containerScopedUserId = self->_containerScopedUserId;
  if (containerScopedUserId)
  {
    objc_msgSend_setContainerScopedUserId_(v11, v5, (uint64_t)containerScopedUserId);
    id v4 = v11;
  }
  firstName = self->_firstName;
  if (firstName)
  {
    objc_msgSend_setFirstName_(v11, v5, (uint64_t)firstName);
    id v4 = v11;
  }
  lastName = self->_lastName;
  if (lastName)
  {
    objc_msgSend_setLastName_(v11, v5, (uint64_t)lastName);
    id v4 = v11;
  }
  phoneNumber = self->_phoneNumber;
  if (phoneNumber)
  {
    objc_msgSend_setPhoneNumber_(v11, v5, (uint64_t)phoneNumber);
    id v4 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_emailAddress, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_containerScopedUserId, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_firstName, v17, (uint64_t)a3);
  v19 = (void *)v10[3];
  v10[3] = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_lastName, v20, (uint64_t)a3);
  v22 = (void *)v10[4];
  v10[4] = v21;

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_phoneNumber, v23, (uint64_t)a3);
  v25 = (void *)v10[5];
  v10[5] = v24;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_12;
  }
  emailAddress = self->_emailAddress;
  uint64_t v9 = v4[2];
  if ((unint64_t)emailAddress | v9)
  {
    if (!objc_msgSend_isEqual_(emailAddress, v7, v9)) {
      goto LABEL_12;
    }
  }
  if (((containerScopedUserId = self->_containerScopedUserId,
         uint64_t v11 = v4[1],
         !((unint64_t)containerScopedUserId | v11))
     || objc_msgSend_isEqual_(containerScopedUserId, v7, v11))
    && ((firstName = self->_firstName, uint64_t v13 = v4[3], !((unint64_t)firstName | v13))
     || objc_msgSend_isEqual_(firstName, v7, v13))
    && ((lastName = self->_lastName, uint64_t v15 = v4[4], !((unint64_t)lastName | v15))
     || objc_msgSend_isEqual_(lastName, v7, v15)))
  {
    phoneNumber = self->_phoneNumber;
    uint64_t v17 = v4[5];
    if ((unint64_t)phoneNumber | v17) {
      char isEqual = objc_msgSend_isEqual_(phoneNumber, v7, v17);
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
  uint64_t v4 = objc_msgSend_hash(self->_emailAddress, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_containerScopedUserId, v5, v6) ^ v4;
  uint64_t v10 = objc_msgSend_hash(self->_firstName, v8, v9);
  uint64_t v13 = v7 ^ v10 ^ objc_msgSend_hash(self->_lastName, v11, v12);
  return v13 ^ objc_msgSend_hash(self->_phoneNumber, v14, v15);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v10 = a3;
  uint64_t v5 = v10[2];
  if (v5) {
    objc_msgSend_setEmailAddress_(self, v4, v5);
  }
  uint64_t v6 = v10[1];
  if (v6) {
    objc_msgSend_setContainerScopedUserId_(self, v4, v6);
  }
  uint64_t v7 = v10[3];
  if (v7) {
    objc_msgSend_setFirstName_(self, v4, v7);
  }
  uint64_t v8 = v10[4];
  if (v8) {
    objc_msgSend_setLastName_(self, v4, v8);
  }
  uint64_t v9 = v10[5];
  if (v9) {
    objc_msgSend_setPhoneNumber_(self, v4, v9);
  }
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)containerScopedUserId
{
  return self->_containerScopedUserId;
}

- (void)setContainerScopedUserId:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_containerScopedUserId, 0);
}

@end