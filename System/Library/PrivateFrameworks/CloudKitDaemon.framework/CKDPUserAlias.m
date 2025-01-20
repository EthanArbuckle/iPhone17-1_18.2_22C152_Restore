@interface CKDPUserAlias
- (BOOL)hasIdentifier;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPUserAlias

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F4598[a3 - 1];
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"hashedEmailAddressType"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"containerUserIdentifier"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"hashedCanonicalPhoneNumber"))
  {
    int v6 = 3;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPUserAlias;
  v4 = [(CKDPUserAlias *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  identifier = self->_identifier;
  if (identifier) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)identifier, @"identifier");
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v8 = self->_type - 1;
    if (v8 >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_type);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E64F4598[v8];
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v9, @"type");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E7A6E8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  if (identifier)
  {
    id v7 = v4;
    objc_msgSend_setIdentifier_(v4, v5, (uint64_t)identifier);
    id v4 = v7;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_type;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  id v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_identifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 16) = self->_type;
    *(unsigned char *)(v10 + 20) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_8;
  }
  identifier = self->_identifier;
  uint64_t v9 = v4[1];
  if ((unint64_t)identifier | v9)
  {
    if (!objc_msgSend_isEqual_(identifier, v7, v9)) {
      goto LABEL_8;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_type == *((_DWORD *)v4 + 4))
    {
      BOOL v10 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v10 = 0;
  }
LABEL_9:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_identifier, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_type;
  }
  else {
    uint64_t v5 = 0;
  }
  return v5 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v6 = *((void *)v4 + 1);
  if (v6)
  {
    id v7 = v4;
    objc_msgSend_setIdentifier_(self, v5, v6);
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 20))
  {
    self->_type = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end