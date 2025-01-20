@interface CKDPRecordFieldIdentifier
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordFieldIdentifier

- (BOOL)hasName
{
  return self->_name != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordFieldIdentifier;
  v4 = [(CKDPRecordFieldIdentifier *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  name = self->_name;
  if (name) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)name, @"name");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordFieldIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  name = self->_name;
  if (name) {
    objc_msgSend_setName_(a3, a2, (uint64_t)name);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_name, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5))
  {
    name = self->_name;
    uint64_t v9 = v4[1];
    if ((unint64_t)name | v9) {
      char isEqual = objc_msgSend_isEqual_(name, v7, v9);
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
  return objc_msgSend_hash(self->_name, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3 = *((void *)a3 + 1);
  if (v3) {
    objc_msgSend_setName_(self, a2, v3);
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

- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4
{
  id v5 = a3;
  objc_msgSend_name(self, v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeString_(v5, v8, (uint64_t)v9);
}

@end