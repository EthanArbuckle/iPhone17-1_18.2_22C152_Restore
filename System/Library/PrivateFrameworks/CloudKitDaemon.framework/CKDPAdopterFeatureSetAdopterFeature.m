@interface CKDPAdopterFeatureSetAdopterFeature
- (BOOL)hasKey;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (NSString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPAdopterFeatureSetAdopterFeature

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPAdopterFeatureSetAdopterFeature;
  v4 = [(CKDPAdopterFeatureSetAdopterFeature *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  key = self->_key;
  if (key) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)key, @"key");
  }
  value = self->_value;
  if (value) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)value, @"value");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E87184((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_value)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  key = self->_key;
  id v8 = v4;
  if (key)
  {
    objc_msgSend_setKey_(v4, v5, (uint64_t)key);
    id v4 = v8;
  }
  value = self->_value;
  if (value)
  {
    objc_msgSend_setValue_(v8, v5, (uint64_t)value);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_key, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_value, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((key = self->_key, uint64_t v9 = v4[1], !((unint64_t)key | v9)) || objc_msgSend_isEqual_(key, v7, v9)))
  {
    value = self->_value;
    uint64_t v11 = v4[2];
    if ((unint64_t)value | v11) {
      char isEqual = objc_msgSend_isEqual_(value, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_key, a2, v2);
  return objc_msgSend_hash(self->_value, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v6 = v4[1];
  id v8 = v4;
  if (v6)
  {
    objc_msgSend_setKey_(self, v5, v6);
    uint64_t v4 = v8;
  }
  uint64_t v7 = v4[2];
  if (v7)
  {
    objc_msgSend_setValue_(self, v5, v7);
    uint64_t v4 = v8;
  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end