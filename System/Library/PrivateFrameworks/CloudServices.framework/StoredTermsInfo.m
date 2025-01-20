@interface StoredTermsInfo
- (BOOL)hasStorageVersion;
- (BOOL)hasTermsInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SecureBackupTermsInfo)termsInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)storageVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStorageVersion:(BOOL)a3;
- (void)setStorageVersion:(unint64_t)a3;
- (void)setTermsInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation StoredTermsInfo

- (void)setStorageVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_storageVersion = a3;
}

- (void)setHasStorageVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStorageVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasTermsInfo
{
  return self->_termsInfo != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)StoredTermsInfo;
  v4 = [(StoredTermsInfo *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    v7 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v4, self->_storageVersion);
    objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, @"storageVersion");
  }
  termsInfo = self->_termsInfo;
  if (termsInfo)
  {
    v10 = objc_msgSend_dictionaryRepresentation(termsInfo, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"termsInfo");
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_218135F48((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_termsInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_storageVersion;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  termsInfo = self->_termsInfo;
  if (termsInfo)
  {
    v7 = v4;
    objc_msgSend_setTermsInfo_(v4, v5, (uint64_t)termsInfo);
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (void *)v10;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v10 + 8) = self->_storageVersion;
    *(unsigned char *)(v10 + 24) |= 1u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_termsInfo, v11, (uint64_t)a3);
  v14 = (void *)v12[2];
  v12[2] = v13;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[3] & 1) == 0 || self->_storageVersion != v4[1]) {
      goto LABEL_9;
    }
  }
  else if (v4[3])
  {
LABEL_9:
    char isEqual = 0;
    goto LABEL_10;
  }
  termsInfo = self->_termsInfo;
  uint64_t v9 = v4[2];
  if ((unint64_t)termsInfo | v9) {
    char isEqual = objc_msgSend_isEqual_(termsInfo, v7, v9);
  }
  else {
    char isEqual = 1;
  }
LABEL_10:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_storageVersion;
  }
  else {
    unint64_t v3 = 0;
  }
  return objc_msgSend_hash(self->_termsInfo, a2, v2) ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (const char *)a3;
  uint64_t v5 = v4;
  if (v4[24])
  {
    self->_storageVersion = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  termsInfo = self->_termsInfo;
  uint64_t v7 = *((void *)v5 + 2);
  if (termsInfo)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(termsInfo, v5, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setTermsInfo_(self, v5, v7);
  }

  MEMORY[0x270F9A758]();
}

- (unint64_t)storageVersion
{
  return self->_storageVersion;
}

- (SecureBackupTermsInfo)termsInfo
{
  return self->_termsInfo;
}

- (void)setTermsInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end