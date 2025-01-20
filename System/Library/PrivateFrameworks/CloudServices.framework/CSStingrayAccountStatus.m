@interface CSStingrayAccountStatus
- (BOOL)hasGfRecord;
- (BOOL)hasStingrayRecord;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSStingrayRecord)gfRecord;
- (CSStingrayRecord)stingrayRecord;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGfRecord:(id)a3;
- (void)setStingrayRecord:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSStingrayAccountStatus

- (BOOL)hasStingrayRecord
{
  return self->_stingrayRecord != 0;
}

- (BOOL)hasGfRecord
{
  return self->_gfRecord != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CSStingrayAccountStatus;
  v4 = [(CSStingrayAccountStatus *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  stingrayRecord = self->_stingrayRecord;
  if (stingrayRecord)
  {
    v8 = objc_msgSend_dictionaryRepresentation(stingrayRecord, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"stingrayRecord");
  }
  gfRecord = self->_gfRecord;
  if (gfRecord)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(gfRecord, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"gfRecord");
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CSStingrayAccountStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_stingrayRecord)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_gfRecord)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  stingrayRecord = self->_stingrayRecord;
  id v8 = v4;
  if (stingrayRecord)
  {
    objc_msgSend_setStingrayRecord_(v4, v5, (uint64_t)stingrayRecord);
    id v4 = v8;
  }
  gfRecord = self->_gfRecord;
  if (gfRecord)
  {
    objc_msgSend_setGfRecord_(v8, v5, (uint64_t)gfRecord);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_stingrayRecord, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_gfRecord, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((stingrayRecord = self->_stingrayRecord, uint64_t v9 = v4[2], !((unint64_t)stingrayRecord | v9))
     || objc_msgSend_isEqual_(stingrayRecord, v7, v9)))
  {
    gfRecord = self->_gfRecord;
    uint64_t v11 = v4[1];
    if ((unint64_t)gfRecord | v11) {
      char isEqual = objc_msgSend_isEqual_(gfRecord, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_stingrayRecord, a2, v2);
  return objc_msgSend_hash(self->_gfRecord, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  stingrayRecord = self->_stingrayRecord;
  uint64_t v6 = v4[2];
  uint64_t v9 = v4;
  if (stingrayRecord)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(stingrayRecord, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setStingrayRecord_(self, (const char *)v4, v6);
  }
  uint64_t v4 = v9;
LABEL_7:
  gfRecord = self->_gfRecord;
  uint64_t v8 = v4[1];
  if (gfRecord)
  {
    if (v8) {
      objc_msgSend_mergeFrom_(gfRecord, (const char *)v4, v8);
    }
  }
  else if (v8)
  {
    objc_msgSend_setGfRecord_(self, (const char *)v4, v8);
  }

  MEMORY[0x270F9A758]();
}

- (CSStingrayRecord)stingrayRecord
{
  return self->_stingrayRecord;
}

- (void)setStingrayRecord:(id)a3
{
}

- (CSStingrayRecord)gfRecord
{
  return self->_gfRecord;
}

- (void)setGfRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stingrayRecord, 0);

  objc_storeStrong((id *)&self->_gfRecord, 0);
}

@end