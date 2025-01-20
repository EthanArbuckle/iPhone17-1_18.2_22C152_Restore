@interface CKDPProtectionInfo
- (BOOL)hasProtectionInfo;
- (BOOL)hasProtectionInfoTag;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)protectionInfo;
- (NSString)protectionInfoTag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setProtectionInfo:(id)a3;
- (void)setProtectionInfoTag:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPProtectionInfo

- (BOOL)hasProtectionInfo
{
  return self->_protectionInfo != 0;
}

- (BOOL)hasProtectionInfoTag
{
  return self->_protectionInfoTag != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPProtectionInfo;
  v4 = [(CKDPProtectionInfo *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  protectionInfo = self->_protectionInfo;
  if (protectionInfo) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)protectionInfo, @"protectionInfo");
  }
  protectionInfoTag = self->_protectionInfoTag;
  if (protectionInfoTag) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)protectionInfoTag, @"protectionInfoTag");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4D5BCB4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_protectionInfo)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_protectionInfoTag)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  protectionInfo = self->_protectionInfo;
  id v8 = v4;
  if (protectionInfo)
  {
    objc_msgSend_setProtectionInfo_(v4, v5, (uint64_t)protectionInfo);
    id v4 = v8;
  }
  protectionInfoTag = self->_protectionInfoTag;
  if (protectionInfoTag)
  {
    objc_msgSend_setProtectionInfoTag_(v8, v5, (uint64_t)protectionInfoTag);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_protectionInfo, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_protectionInfoTag, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((protectionInfo = self->_protectionInfo, uint64_t v9 = v4[1], !((unint64_t)protectionInfo | v9))
     || objc_msgSend_isEqual_(protectionInfo, v7, v9)))
  {
    protectionInfoTag = self->_protectionInfoTag;
    uint64_t v11 = v4[2];
    if ((unint64_t)protectionInfoTag | v11) {
      char isEqual = objc_msgSend_isEqual_(protectionInfoTag, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_protectionInfo, a2, v2);
  return objc_msgSend_hash(self->_protectionInfoTag, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v6 = v4[1];
  id v8 = v4;
  if (v6)
  {
    objc_msgSend_setProtectionInfo_(self, v5, v6);
    uint64_t v4 = v8;
  }
  uint64_t v7 = v4[2];
  if (v7)
  {
    objc_msgSend_setProtectionInfoTag_(self, v5, v7);
    uint64_t v4 = v8;
  }
}

- (NSData)protectionInfo
{
  return self->_protectionInfo;
}

- (void)setProtectionInfo:(id)a3
{
}

- (NSString)protectionInfoTag
{
  return self->_protectionInfoTag;
}

- (void)setProtectionInfoTag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionInfoTag, 0);
  objc_storeStrong((id *)&self->_protectionInfo, 0);
}

@end