@interface CKCodeProto2Any
- (BOOL)hasTypeUrl;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)value;
- (NSString)typeUrl;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTypeUrl:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKCodeProto2Any

- (BOOL)hasTypeUrl
{
  return self->_typeUrl != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKCodeProto2Any;
  v4 = [(CKCodeProto2Any *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  uint64_t v7 = v5;
  typeUrl = self->_typeUrl;
  if (typeUrl) {
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)typeUrl, @"type_url");
  }
  value = self->_value;
  if (value) {
    objc_msgSend_setObject_forKey_(v7, v6, (uint64_t)value, @"value");
  }

  return v7;
}

- (BOOL)readFrom:(id)a3
{
  return CKCodeProto2AnyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_typeUrl)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_value)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  typeUrl = self->_typeUrl;
  id v9 = v4;
  if (typeUrl)
  {
    objc_msgSend_setTypeUrl_(v4, v5, (uint64_t)typeUrl, v6);
    id v4 = v9;
  }
  value = self->_value;
  if (value)
  {
    objc_msgSend_setValue_(v9, v5, (uint64_t)value, v6);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_typeUrl, v13, (uint64_t)a3, v14);
  v16 = (void *)v12[1];
  v12[1] = v15;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_value, v17, (uint64_t)a3, v18);
  v20 = (void *)v12[2];
  v12[2] = v19;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && ((typeUrl = self->_typeUrl, uint64_t v11 = v4[1], !((unint64_t)typeUrl | v11))
     || objc_msgSend_isEqual_(typeUrl, v8, v11, v9)))
  {
    value = self->_value;
    uint64_t v13 = v4[2];
    if ((unint64_t)value | v13) {
      char isEqual = objc_msgSend_isEqual_(value, v8, v13, v9);
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
  uint64_t v5 = objc_msgSend_hash(self->_typeUrl, a2, v2, v3);
  return objc_msgSend_hash(self->_value, v6, v7, v8) ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v7 = v4[1];
  uint64_t v9 = v4;
  if (v7)
  {
    objc_msgSend_setTypeUrl_(self, v5, v7, v6);
    id v4 = v9;
  }
  uint64_t v8 = v4[2];
  if (v8)
  {
    objc_msgSend_setValue_(self, v5, v8, v6);
    id v4 = v9;
  }
}

- (NSString)typeUrl
{
  return self->_typeUrl;
}

- (void)setTypeUrl:(id)a3
{
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_typeUrl, 0);
}

@end