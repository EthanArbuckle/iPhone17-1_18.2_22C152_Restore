@interface CKDPUserPrivacySettingsUpdateRequest
+ (id)options;
- (BOOL)hasBundleIdentifier;
- (BOOL)hasUserPrivacySettings;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPUserPrivacySettings)userPrivacySettings;
- (Class)responseClass;
- (NSString)bundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setUserPrivacySettings:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPUserPrivacySettingsUpdateRequest

+ (id)options
{
  if (qword_1EBBCDE80 != -1) {
    dispatch_once(&qword_1EBBCDE80, &unk_1F2043F30);
  }
  v2 = (void *)qword_1EBBCDE78;
  return v2;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (BOOL)hasUserPrivacySettings
{
  return self->_userPrivacySettings != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPUserPrivacySettingsUpdateRequest;
  v4 = [(CKDPUserPrivacySettingsUpdateRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)bundleIdentifier, @"bundleIdentifier");
  }
  userPrivacySettings = self->_userPrivacySettings;
  if (userPrivacySettings)
  {
    v9 = objc_msgSend_dictionaryRepresentation(userPrivacySettings, v5, (uint64_t)bundleIdentifier);
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, @"userPrivacySettings");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4EFC124((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_userPrivacySettings)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (unsigned)requestTypeCode
{
  return 16;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  bundleIdentifier = self->_bundleIdentifier;
  id v8 = v4;
  if (bundleIdentifier)
  {
    objc_msgSend_setBundleIdentifier_(v4, v5, (uint64_t)bundleIdentifier);
    id v4 = v8;
  }
  userPrivacySettings = self->_userPrivacySettings;
  if (userPrivacySettings)
  {
    objc_msgSend_setUserPrivacySettings_(v8, v5, (uint64_t)userPrivacySettings);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_bundleIdentifier, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_userPrivacySettings, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((bundleIdentifier = self->_bundleIdentifier, uint64_t v9 = v4[1], !((unint64_t)bundleIdentifier | v9))
     || objc_msgSend_isEqual_(bundleIdentifier, v7, v9)))
  {
    userPrivacySettings = self->_userPrivacySettings;
    uint64_t v11 = v4[2];
    if ((unint64_t)userPrivacySettings | v11) {
      char isEqual = objc_msgSend_isEqual_(userPrivacySettings, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_bundleIdentifier, a2, v2);
  return objc_msgSend_hash(self->_userPrivacySettings, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = v4[1];
  id v8 = v4;
  if (v5)
  {
    objc_msgSend_setBundleIdentifier_(self, (const char *)v4, v5);
    uint64_t v4 = v8;
  }
  userPrivacySettings = self->_userPrivacySettings;
  uint64_t v7 = v4[2];
  if (userPrivacySettings)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(userPrivacySettings, (const char *)v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setUserPrivacySettings_(self, (const char *)v4, v7);
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (CKDPUserPrivacySettings)userPrivacySettings
{
  return self->_userPrivacySettings;
}

- (void)setUserPrivacySettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPrivacySettings, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end