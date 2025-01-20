@interface CKDPSiteIdentifier
- (BOOL)hasIdentifier;
- (BOOL)hasModifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)identifier;
- (NSData)modifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setModifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPSiteIdentifier

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasModifier
{
  return self->_modifier != 0;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKDPSiteIdentifier;
  v4 = [(CKDPSiteIdentifier *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  uint64_t v7 = v5;
  identifier = self->_identifier;
  if (identifier) {
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)identifier, @"identifier");
  }
  modifier = self->_modifier;
  if (modifier) {
    objc_msgSend_setObject_forKey_(v7, v6, (uint64_t)modifier, @"modifier");
  }

  return v7;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPSiteIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_modifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  id v9 = v4;
  if (identifier)
  {
    objc_msgSend_setIdentifier_(v4, v5, (uint64_t)identifier, v6);
    id v4 = v9;
  }
  modifier = self->_modifier;
  if (modifier)
  {
    objc_msgSend_setModifier_(v9, v5, (uint64_t)modifier, v6);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_identifier, v13, (uint64_t)a3, v14);
  v16 = (void *)v12[1];
  v12[1] = v15;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_modifier, v17, (uint64_t)a3, v18);
  v20 = (void *)v12[2];
  v12[2] = v19;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && ((identifier = self->_identifier, uint64_t v11 = v4[1], !((unint64_t)identifier | v11))
     || objc_msgSend_isEqual_(identifier, v8, v11, v9)))
  {
    modifier = self->_modifier;
    uint64_t v13 = v4[2];
    if ((unint64_t)modifier | v13) {
      char isEqual = objc_msgSend_isEqual_(modifier, v8, v13, v9);
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
  uint64_t v5 = objc_msgSend_hash(self->_identifier, a2, v2, v3);
  return objc_msgSend_hash(self->_modifier, v6, v7, v8) ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v7 = v4[1];
  uint64_t v9 = v4;
  if (v7)
  {
    objc_msgSend_setIdentifier_(self, v5, v7, v6);
    id v4 = v9;
  }
  uint64_t v8 = v4[2];
  if (v8)
  {
    objc_msgSend_setModifier_(self, v5, v8, v6);
    id v4 = v9;
  }
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)modifier
{
  return self->_modifier;
}

- (void)setModifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end