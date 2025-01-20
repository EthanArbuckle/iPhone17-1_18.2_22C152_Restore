@interface CSStingrayRecordClientMetadata
- (BOOL)hasIcdp;
- (BOOL)hasIcloudIdentityPublicData;
- (BOOL)hasKeyRegistry;
- (BOOL)hasPasswordGeneration;
- (BOOL)hasPasswordIterations;
- (BOOL)hasPasswordProtocol;
- (BOOL)hasStableMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSStingrayRecordClientMetadataICloudDataProtection)icdp;
- (CSStingrayRecordClientMetadataKeyRegistry)keyRegistry;
- (CSStingrayRecordClientMetadataStableMetadata)stableMetadata;
- (NSData)icloudIdentityPublicData;
- (NSString)passwordProtocol;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)passwordGeneration;
- (int64_t)passwordIterations;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPasswordGeneration:(BOOL)a3;
- (void)setHasPasswordIterations:(BOOL)a3;
- (void)setIcdp:(id)a3;
- (void)setIcloudIdentityPublicData:(id)a3;
- (void)setKeyRegistry:(id)a3;
- (void)setPasswordGeneration:(int64_t)a3;
- (void)setPasswordIterations:(int64_t)a3;
- (void)setPasswordProtocol:(id)a3;
- (void)setStableMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSStingrayRecordClientMetadata

- (BOOL)hasIcdp
{
  return self->_icdp != 0;
}

- (BOOL)hasKeyRegistry
{
  return self->_keyRegistry != 0;
}

- (BOOL)hasStableMetadata
{
  return self->_stableMetadata != 0;
}

- (BOOL)hasIcloudIdentityPublicData
{
  return self->_icloudIdentityPublicData != 0;
}

- (void)setPasswordGeneration:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_passwordGeneration = a3;
}

- (void)setHasPasswordGeneration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPasswordGeneration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPasswordIterations:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_passwordIterations = a3;
}

- (void)setHasPasswordIterations:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPasswordIterations
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasPasswordProtocol
{
  return self->_passwordProtocol != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CSStingrayRecordClientMetadata;
  v4 = [(CSStingrayRecordClientMetadata *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  icdp = self->_icdp;
  if (icdp)
  {
    v8 = objc_msgSend_dictionaryRepresentation(icdp, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"icdp");
  }
  keyRegistry = self->_keyRegistry;
  if (keyRegistry)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(keyRegistry, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"keyRegistry");
  }
  stableMetadata = self->_stableMetadata;
  if (stableMetadata)
  {
    v14 = objc_msgSend_dictionaryRepresentation(stableMetadata, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"stableMetadata");
  }
  icloudIdentityPublicData = self->_icloudIdentityPublicData;
  if (icloudIdentityPublicData) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)icloudIdentityPublicData, @"icloudIdentityPublicData");
  }
  char has = (char)self->_has;
  if (has)
  {
    v18 = objc_msgSend_numberWithLongLong_(NSNumber, v4, self->_passwordGeneration);
    objc_msgSend_setObject_forKey_(v6, v19, (uint64_t)v18, @"passwordGeneration");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v20 = objc_msgSend_numberWithLongLong_(NSNumber, v4, self->_passwordIterations);
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, @"passwordIterations");
  }
  passwordProtocol = self->_passwordProtocol;
  if (passwordProtocol) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)passwordProtocol, @"passwordProtocol");
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CSStingrayRecordClientMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_icdp)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_keyRegistry)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_stableMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_icloudIdentityPublicData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_passwordProtocol)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  icdp = self->_icdp;
  id v12 = v4;
  if (icdp)
  {
    objc_msgSend_setIcdp_(v4, v5, (uint64_t)icdp);
    id v4 = v12;
  }
  keyRegistry = self->_keyRegistry;
  if (keyRegistry)
  {
    objc_msgSend_setKeyRegistry_(v12, v5, (uint64_t)keyRegistry);
    id v4 = v12;
  }
  stableMetadata = self->_stableMetadata;
  if (stableMetadata)
  {
    objc_msgSend_setStableMetadata_(v12, v5, (uint64_t)stableMetadata);
    id v4 = v12;
  }
  icloudIdentityPublicData = self->_icloudIdentityPublicData;
  if (icloudIdentityPublicData)
  {
    objc_msgSend_setIcloudIdentityPublicData_(v12, v5, (uint64_t)icloudIdentityPublicData);
    id v4 = v12;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_passwordGeneration;
    *((unsigned char *)v4 + 64) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_passwordIterations;
    *((unsigned char *)v4 + 64) |= 2u;
  }
  passwordProtocol = self->_passwordProtocol;
  if (passwordProtocol)
  {
    objc_msgSend_setPasswordProtocol_(v12, v5, (uint64_t)passwordProtocol);
    id v4 = v12;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_icdp, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_keyRegistry, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_stableMetadata, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_icloudIdentityPublicData, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v21;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v10 + 8) = self->_passwordGeneration;
    *(unsigned char *)(v10 + 64) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v10 + 16) = self->_passwordIterations;
    *(unsigned char *)(v10 + 64) |= 2u;
  }
  uint64_t v25 = objc_msgSend_copyWithZone_(self->_passwordProtocol, v23, (uint64_t)a3);
  v26 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v25;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_22;
  }
  icdp = self->_icdp;
  uint64_t v9 = v4[3];
  if ((unint64_t)icdp | v9)
  {
    if (!objc_msgSend_isEqual_(icdp, v7, v9)) {
      goto LABEL_22;
    }
  }
  keyRegistry = self->_keyRegistry;
  uint64_t v11 = v4[5];
  if ((unint64_t)keyRegistry | v11)
  {
    if (!objc_msgSend_isEqual_(keyRegistry, v7, v11)) {
      goto LABEL_22;
    }
  }
  stableMetadata = self->_stableMetadata;
  uint64_t v13 = v4[7];
  if ((unint64_t)stableMetadata | v13)
  {
    if (!objc_msgSend_isEqual_(stableMetadata, v7, v13)) {
      goto LABEL_22;
    }
  }
  icloudIdentityPublicData = self->_icloudIdentityPublicData;
  uint64_t v15 = v4[4];
  if ((unint64_t)icloudIdentityPublicData | v15)
  {
    if (!objc_msgSend_isEqual_(icloudIdentityPublicData, v7, v15)) {
      goto LABEL_22;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[8] & 1) == 0 || self->_passwordGeneration != v4[1]) {
      goto LABEL_22;
    }
  }
  else if (v4[8])
  {
LABEL_22:
    char isEqual = 0;
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[8] & 2) == 0 || self->_passwordIterations != v4[2]) {
      goto LABEL_22;
    }
  }
  else if ((v4[8] & 2) != 0)
  {
    goto LABEL_22;
  }
  passwordProtocol = self->_passwordProtocol;
  uint64_t v17 = v4[6];
  if ((unint64_t)passwordProtocol | v17) {
    char isEqual = objc_msgSend_isEqual_(passwordProtocol, v7, v17);
  }
  else {
    char isEqual = 1;
  }
LABEL_23:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_icdp, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_keyRegistry, v5, v6);
  uint64_t v10 = objc_msgSend_hash(self->_stableMetadata, v8, v9);
  uint64_t v13 = objc_msgSend_hash(self->_icloudIdentityPublicData, v11, v12);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v16 = 2654435761 * self->_passwordGeneration;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v17 = 0;
    return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v17 ^ objc_msgSend_hash(self->_passwordProtocol, v14, v15);
  }
  uint64_t v16 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v17 = 2654435761 * self->_passwordIterations;
  return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v17 ^ objc_msgSend_hash(self->_passwordProtocol, v14, v15);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  icdp = self->_icdp;
  uint64_t v6 = v4[3];
  v14 = v4;
  if (icdp)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(icdp, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setIcdp_(self, (const char *)v4, v6);
  }
  uint64_t v4 = v14;
LABEL_7:
  keyRegistry = self->_keyRegistry;
  uint64_t v8 = v4[5];
  if (keyRegistry)
  {
    if (!v8) {
      goto LABEL_13;
    }
    objc_msgSend_mergeFrom_(keyRegistry, (const char *)v4, v8);
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    objc_msgSend_setKeyRegistry_(self, (const char *)v4, v8);
  }
  uint64_t v4 = v14;
LABEL_13:
  stableMetadata = self->_stableMetadata;
  uint64_t v10 = v4[7];
  if (stableMetadata)
  {
    if (!v10) {
      goto LABEL_19;
    }
    objc_msgSend_mergeFrom_(stableMetadata, (const char *)v4, v10);
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    objc_msgSend_setStableMetadata_(self, (const char *)v4, v10);
  }
  uint64_t v4 = v14;
LABEL_19:
  uint64_t v11 = v4[4];
  if (v11)
  {
    objc_msgSend_setIcloudIdentityPublicData_(self, (const char *)v4, v11);
    uint64_t v4 = v14;
  }
  char v12 = *((unsigned char *)v4 + 64);
  if (v12)
  {
    self->_passwordGeneration = v4[1];
    *(unsigned char *)&self->_has |= 1u;
    char v12 = *((unsigned char *)v4 + 64);
  }
  if ((v12 & 2) != 0)
  {
    self->_passwordIterations = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v13 = v4[6];
  if (v13) {
    objc_msgSend_setPasswordProtocol_(self, (const char *)v4, v13);
  }

  MEMORY[0x270F9A758]();
}

- (CSStingrayRecordClientMetadataICloudDataProtection)icdp
{
  return self->_icdp;
}

- (void)setIcdp:(id)a3
{
}

- (CSStingrayRecordClientMetadataKeyRegistry)keyRegistry
{
  return self->_keyRegistry;
}

- (void)setKeyRegistry:(id)a3
{
}

- (CSStingrayRecordClientMetadataStableMetadata)stableMetadata
{
  return self->_stableMetadata;
}

- (void)setStableMetadata:(id)a3
{
}

- (NSData)icloudIdentityPublicData
{
  return self->_icloudIdentityPublicData;
}

- (void)setIcloudIdentityPublicData:(id)a3
{
}

- (int64_t)passwordGeneration
{
  return self->_passwordGeneration;
}

- (int64_t)passwordIterations
{
  return self->_passwordIterations;
}

- (NSString)passwordProtocol
{
  return self->_passwordProtocol;
}

- (void)setPasswordProtocol:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableMetadata, 0);
  objc_storeStrong((id *)&self->_passwordProtocol, 0);
  objc_storeStrong((id *)&self->_keyRegistry, 0);
  objc_storeStrong((id *)&self->_icloudIdentityPublicData, 0);

  objc_storeStrong((id *)&self->_icdp, 0);
}

@end