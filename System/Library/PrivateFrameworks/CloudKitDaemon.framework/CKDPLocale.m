@interface CKDPLocale
- (BOOL)hasLanguageCode;
- (BOOL)hasRegionCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)languageCode;
- (NSString)regionCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setRegionCode:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPLocale

- (BOOL)hasLanguageCode
{
  return self->_languageCode != 0;
}

- (BOOL)hasRegionCode
{
  return self->_regionCode != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPLocale;
  v4 = [(CKDPLocale *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  languageCode = self->_languageCode;
  if (languageCode) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)languageCode, @"languageCode");
  }
  regionCode = self->_regionCode;
  if (regionCode) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)regionCode, @"regionCode");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F35368((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_languageCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_regionCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  languageCode = self->_languageCode;
  id v8 = v4;
  if (languageCode)
  {
    objc_msgSend_setLanguageCode_(v4, v5, (uint64_t)languageCode);
    id v4 = v8;
  }
  regionCode = self->_regionCode;
  if (regionCode)
  {
    objc_msgSend_setRegionCode_(v8, v5, (uint64_t)regionCode);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_languageCode, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_regionCode, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((languageCode = self->_languageCode, uint64_t v9 = v4[1], !((unint64_t)languageCode | v9))
     || objc_msgSend_isEqual_(languageCode, v7, v9)))
  {
    regionCode = self->_regionCode;
    uint64_t v11 = v4[2];
    if ((unint64_t)regionCode | v11) {
      char isEqual = objc_msgSend_isEqual_(regionCode, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_languageCode, a2, v2);
  return objc_msgSend_hash(self->_regionCode, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v6 = v4[1];
  id v8 = v4;
  if (v6)
  {
    objc_msgSend_setLanguageCode_(self, v5, v6);
    uint64_t v4 = v8;
  }
  uint64_t v7 = v4[2];
  if (v7)
  {
    objc_msgSend_setRegionCode_(self, v5, v7);
    uint64_t v4 = v8;
  }
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

@end