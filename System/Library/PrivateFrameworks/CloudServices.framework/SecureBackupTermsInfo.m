@interface SecureBackupTermsInfo
- (BOOL)hasAltDSID;
- (BOOL)hasCountryCode;
- (BOOL)hasIcloudVersion;
- (BOOL)hasMetadata;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)altDSID;
- (NSString)countryCode;
- (NSString)icloudVersion;
- (NSString)metadata;
- (NSString)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setIcloudVersion:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SecureBackupTermsInfo

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (BOOL)hasIcloudVersion
{
  return self->_icloudVersion != 0;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (BOOL)hasAltDSID
{
  return self->_altDSID != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)SecureBackupTermsInfo;
  v4 = [(SecureBackupTermsInfo *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  uint64_t v6 = v4;
  version = self->_version;
  if (version) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)version, @"version");
  }
  icloudVersion = self->_icloudVersion;
  if (icloudVersion) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)icloudVersion, @"icloudVersion");
  }
  countryCode = self->_countryCode;
  if (countryCode) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)countryCode, @"countryCode");
  }
  metadata = self->_metadata;
  if (metadata) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)metadata, @"metadata");
  }
  altDSID = self->_altDSID;
  if (altDSID) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)altDSID, @"altDSID");
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return SecureBackupTermsInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_version)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_icloudVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_countryCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_metadata)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_altDSID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  version = self->_version;
  id v11 = v4;
  if (version)
  {
    objc_msgSend_setVersion_(v4, v5, (uint64_t)version);
    id v4 = v11;
  }
  icloudVersion = self->_icloudVersion;
  if (icloudVersion)
  {
    objc_msgSend_setIcloudVersion_(v11, v5, (uint64_t)icloudVersion);
    id v4 = v11;
  }
  countryCode = self->_countryCode;
  if (countryCode)
  {
    objc_msgSend_setCountryCode_(v11, v5, (uint64_t)countryCode);
    id v4 = v11;
  }
  metadata = self->_metadata;
  if (metadata)
  {
    objc_msgSend_setMetadata_(v11, v5, (uint64_t)metadata);
    id v4 = v11;
  }
  altDSID = self->_altDSID;
  if (altDSID)
  {
    objc_msgSend_setAltDSID_(v11, v5, (uint64_t)altDSID);
    id v4 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_version, v11, (uint64_t)a3);
  v13 = (void *)v10[5];
  v10[5] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_icloudVersion, v14, (uint64_t)a3);
  v16 = (void *)v10[3];
  v10[3] = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_countryCode, v17, (uint64_t)a3);
  v19 = (void *)v10[2];
  v10[2] = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_metadata, v20, (uint64_t)a3);
  v22 = (void *)v10[4];
  v10[4] = v21;

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_altDSID, v23, (uint64_t)a3);
  v25 = (void *)v10[1];
  v10[1] = v24;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_12;
  }
  version = self->_version;
  uint64_t v9 = v4[5];
  if ((unint64_t)version | v9)
  {
    if (!objc_msgSend_isEqual_(version, v7, v9)) {
      goto LABEL_12;
    }
  }
  if (((icloudVersion = self->_icloudVersion, uint64_t v11 = v4[3], !((unint64_t)icloudVersion | v11))
     || objc_msgSend_isEqual_(icloudVersion, v7, v11))
    && ((countryCode = self->_countryCode, uint64_t v13 = v4[2], !((unint64_t)countryCode | v13))
     || objc_msgSend_isEqual_(countryCode, v7, v13))
    && ((metadata = self->_metadata, uint64_t v15 = v4[4], !((unint64_t)metadata | v15))
     || objc_msgSend_isEqual_(metadata, v7, v15)))
  {
    altDSID = self->_altDSID;
    uint64_t v17 = v4[1];
    if ((unint64_t)altDSID | v17) {
      char isEqual = objc_msgSend_isEqual_(altDSID, v7, v17);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
LABEL_12:
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_version, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_icloudVersion, v5, v6) ^ v4;
  uint64_t v10 = objc_msgSend_hash(self->_countryCode, v8, v9);
  uint64_t v13 = v7 ^ v10 ^ objc_msgSend_hash(self->_metadata, v11, v12);
  return v13 ^ objc_msgSend_hash(self->_altDSID, v14, v15);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v10 = a3;
  uint64_t v5 = v10[5];
  if (v5) {
    objc_msgSend_setVersion_(self, v4, v5);
  }
  uint64_t v6 = v10[3];
  if (v6) {
    objc_msgSend_setIcloudVersion_(self, v4, v6);
  }
  uint64_t v7 = v10[2];
  if (v7) {
    objc_msgSend_setCountryCode_(self, v4, v7);
  }
  uint64_t v8 = v10[4];
  if (v8) {
    objc_msgSend_setMetadata_(self, v4, v8);
  }
  uint64_t v9 = v10[1];
  if (v9) {
    objc_msgSend_setAltDSID_(self, v4, v9);
  }
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)icloudVersion
{
  return self->_icloudVersion;
}

- (void)setIcloudVersion:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_icloudVersion, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);

  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end