@interface CKDPUser
- (BOOL)hasAlias;
- (BOOL)hasFirstName;
- (BOOL)hasIdentifier;
- (BOOL)hasIsInNetwork;
- (BOOL)hasLastName;
- (BOOL)hasProtectionInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInNetwork;
- (BOOL)readFrom:(id)a3;
- (CKDPIdentifier)identifier;
- (CKDPProtectionInfo)protectionInfo;
- (CKDPUserAlias)alias;
- (NSString)firstName;
- (NSString)lastName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlias:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setHasIsInNetwork:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsInNetwork:(BOOL)a3;
- (void)setLastName:(id)a3;
- (void)setProtectionInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPUser

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasAlias
{
  return self->_alias != 0;
}

- (BOOL)hasFirstName
{
  return self->_firstName != 0;
}

- (BOOL)hasLastName
{
  return self->_lastName != 0;
}

- (BOOL)hasProtectionInfo
{
  return self->_protectionInfo != 0;
}

- (BOOL)isInNetwork
{
  return (*(unsigned char *)&self->_has & 1) != 0 && self->_isInNetwork;
}

- (void)setIsInNetwork:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isInNetwork = a3;
}

- (void)setHasIsInNetwork:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsInNetwork
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPUser;
  v4 = [(CKDPUser *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  identifier = self->_identifier;
  if (identifier)
  {
    v8 = objc_msgSend_dictionaryRepresentation(identifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"identifier");
  }
  alias = self->_alias;
  if (alias)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(alias, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"alias");
  }
  firstName = self->_firstName;
  if (firstName) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)firstName, @"firstName");
  }
  lastName = self->_lastName;
  if (lastName) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)lastName, @"lastName");
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    v16 = objc_msgSend_dictionaryRepresentation(protectionInfo, v4, (uint64_t)lastName);
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, @"protectionInfo");
  }
  if (*(unsigned char *)&self->_has)
  {
    v18 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_isInNetwork);
    objc_msgSend_setObject_forKey_(v6, v19, (uint64_t)v18, @"isInNetwork");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4EBFF88((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_alias)
  {
    PBDataWriterWriteSubmessage();
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
  if (self->_protectionInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  objc_super v11 = v4;
  if (identifier)
  {
    objc_msgSend_setIdentifier_(v4, v5, (uint64_t)identifier);
    id v4 = v11;
  }
  alias = self->_alias;
  if (alias)
  {
    objc_msgSend_setAlias_(v11, v5, (uint64_t)alias);
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
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    objc_msgSend_setProtectionInfo_(v11, v5, (uint64_t)protectionInfo);
    id v4 = v11;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[48] = self->_isInNetwork;
    v4[52] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_identifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_alias, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_firstName, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_lastName, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v21;

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_protectionInfo, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v24;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v10 + 48) = self->_isInNetwork;
    *(unsigned char *)(v10 + 52) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_14;
  }
  identifier = self->_identifier;
  uint64_t v9 = v4[3];
  if ((unint64_t)identifier | v9)
  {
    if (!objc_msgSend_isEqual_(identifier, v7, v9)) {
      goto LABEL_14;
    }
  }
  alias = self->_alias;
  uint64_t v11 = v4[1];
  if ((unint64_t)alias | v11)
  {
    if (!objc_msgSend_isEqual_(alias, v7, v11)) {
      goto LABEL_14;
    }
  }
  firstName = self->_firstName;
  uint64_t v13 = v4[2];
  if ((unint64_t)firstName | v13)
  {
    if (!objc_msgSend_isEqual_(firstName, v7, v13)) {
      goto LABEL_14;
    }
  }
  lastName = self->_lastName;
  uint64_t v15 = v4[4];
  if ((unint64_t)lastName | v15)
  {
    if (!objc_msgSend_isEqual_(lastName, v7, v15)) {
      goto LABEL_14;
    }
  }
  protectionInfo = self->_protectionInfo;
  uint64_t v17 = v4[5];
  if ((unint64_t)protectionInfo | v17)
  {
    if (!objc_msgSend_isEqual_(protectionInfo, v7, v17)) {
      goto LABEL_14;
    }
  }
  BOOL v18 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0)
    {
LABEL_14:
      BOOL v18 = 0;
      goto LABEL_15;
    }
    if (self->_isInNetwork)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_14;
    }
    BOOL v18 = 1;
  }
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_identifier, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_alias, v5, v6);
  uint64_t v10 = objc_msgSend_hash(self->_firstName, v8, v9);
  uint64_t v13 = objc_msgSend_hash(self->_lastName, v11, v12);
  uint64_t v16 = objc_msgSend_hash(self->_protectionInfo, v14, v15);
  if (*(unsigned char *)&self->_has) {
    uint64_t v17 = 2654435761 * self->_isInNetwork;
  }
  else {
    uint64_t v17 = 0;
  }
  return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  uint64_t v6 = *((void *)v4 + 3);
  id v13 = v4;
  if (identifier)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(identifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setIdentifier_(self, (const char *)v4, v6);
  }
  id v4 = v13;
LABEL_7:
  alias = self->_alias;
  uint64_t v8 = *((void *)v4 + 1);
  if (alias)
  {
    if (!v8) {
      goto LABEL_13;
    }
    objc_msgSend_mergeFrom_(alias, (const char *)v4, v8);
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    objc_msgSend_setAlias_(self, (const char *)v4, v8);
  }
  id v4 = v13;
LABEL_13:
  uint64_t v9 = *((void *)v4 + 2);
  if (v9)
  {
    objc_msgSend_setFirstName_(self, (const char *)v4, v9);
    id v4 = v13;
  }
  uint64_t v10 = *((void *)v4 + 4);
  if (v10)
  {
    objc_msgSend_setLastName_(self, (const char *)v4, v10);
    id v4 = v13;
  }
  protectionInfo = self->_protectionInfo;
  uint64_t v12 = *((void *)v4 + 5);
  if (protectionInfo)
  {
    if (!v12) {
      goto LABEL_23;
    }
    objc_msgSend_mergeFrom_(protectionInfo, (const char *)v4, v12);
  }
  else
  {
    if (!v12) {
      goto LABEL_23;
    }
    objc_msgSend_setProtectionInfo_(self, (const char *)v4, v12);
  }
  id v4 = v13;
LABEL_23:
  if (*((unsigned char *)v4 + 52))
  {
    self->_isInNetwork = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CKDPUserAlias)alias
{
  return self->_alias;
}

- (void)setAlias:(id)a3
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

- (CKDPProtectionInfo)protectionInfo
{
  return self->_protectionInfo;
}

- (void)setProtectionInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionInfo, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_alias, 0);
}

@end