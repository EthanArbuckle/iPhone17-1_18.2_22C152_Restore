@interface CKDPIdentifier
- (BOOL)hasName;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)name;
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
- (void)setName:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPIdentifier

- (BOOL)hasName
{
  return self->_name != 0;
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
  if ((a3 - 1) >= 8)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v3, a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E5464E68[a3 - 1];
  }

  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"record", v5))
  {
    int v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v6, @"device", v7))
  {
    int v8 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"subscription", v10))
  {
    int v8 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"share", v12))
  {
    int v8 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v3, v13, @"comment", v14))
  {
    int v8 = 5;
  }
  else if (objc_msgSend_isEqualToString_(v3, v15, @"recordZone", v16))
  {
    int v8 = 6;
  }
  else if (objc_msgSend_isEqualToString_(v3, v17, @"user", v18))
  {
    int v8 = 7;
  }
  else if (objc_msgSend_isEqualToString_(v3, v19, @"mergeableValue", v20))
  {
    int v8 = 8;
  }
  else
  {
    int v8 = 1;
  }

  return v8;
}

- (id)description
{
  id v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKDPIdentifier;
  v4 = [(CKDPIdentifier *)&v13 description];
  int v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  int v8 = v5;
  name = self->_name;
  if (name) {
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)name, @"name");
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v10 = self->_type - 1;
    if (v10 >= 8)
    {
      objc_msgSend_stringWithFormat_(NSString, v6, @"(unknown: %i)", v7, self->_type);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E5464E68[v10];
    }
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)v11, @"type");
  }

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
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
  name = self->_name;
  if (name)
  {
    id v8 = v4;
    objc_msgSend_setName_(v4, v5, (uint64_t)name, v6);
    id v4 = v8;
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
  id v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_name, v13, (uint64_t)a3, v14);
  uint64_t v16 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = v15;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v12 + 16) = self->_type;
    *(unsigned char *)(v12 + 20) |= 1u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_8;
  }
  name = self->_name;
  uint64_t v11 = v4[1];
  if ((unint64_t)name | v11)
  {
    if (!objc_msgSend_isEqual_(name, v8, v11, v9)) {
      goto LABEL_8;
    }
  }
  BOOL v12 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_type == *((_DWORD *)v4 + 4))
    {
      BOOL v12 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v12 = 0;
  }
LABEL_9:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_name, a2, v2, v3);
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_type;
  }
  else {
    uint64_t v6 = 0;
  }
  return v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v7 = *((void *)v4 + 1);
  if (v7)
  {
    id v8 = v4;
    objc_msgSend_setName_(self, v5, v7, v6);
    id v4 = v8;
  }
  if (*((unsigned char *)v4 + 20))
  {
    self->_type = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end