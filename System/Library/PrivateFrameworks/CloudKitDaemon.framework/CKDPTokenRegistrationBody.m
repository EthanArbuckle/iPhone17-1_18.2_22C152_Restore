@interface CKDPTokenRegistrationBody
- (BOOL)hasApnsEnv;
- (BOOL)hasBundleIdentifier;
- (BOOL)hasSkipBundleIDCheck;
- (BOOL)hasToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)skipBundleIDCheck;
- (NSData)token;
- (NSString)bundleIdentifier;
- (id)apnsEnvAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsApnsEnv:(id)a3;
- (int)apnsEnv;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApnsEnv:(int)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setHasApnsEnv:(BOOL)a3;
- (void)setHasSkipBundleIDCheck:(BOOL)a3;
- (void)setSkipBundleIDCheck:(BOOL)a3;
- (void)setToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPTokenRegistrationBody

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (int)apnsEnv
{
  if (*(unsigned char *)&self->_has) {
    return self->_apnsEnv;
  }
  else {
    return 0;
  }
}

- (void)setApnsEnv:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_apnsEnv = a3;
}

- (void)setHasApnsEnv:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasApnsEnv
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)apnsEnvAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"development";
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"production";
  }
  return v4;
}

- (int)StringAsApnsEnv:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"production")) {
    int isEqualToString = 0;
  }
  else {
    int isEqualToString = objc_msgSend_isEqualToString_(v3, v5, @"development");
  }

  return isEqualToString;
}

- (void)setSkipBundleIDCheck:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_skipBundleIDCheck = a3;
}

- (void)setHasSkipBundleIDCheck:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSkipBundleIDCheck
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPTokenRegistrationBody;
  v4 = [(CKDPTokenRegistrationBody *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  token = self->_token;
  if (token) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)token, @"token");
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)bundleIdentifier, @"bundleIdentifier");
  }
  char has = (char)self->_has;
  if (has)
  {
    int apnsEnv = self->_apnsEnv;
    if (apnsEnv)
    {
      if (apnsEnv == 1)
      {
        objc_super v11 = @"development";
        objc_msgSend_setObject_forKey_(v6, v5, @"development", @"apnsEnv");
      }
      else
      {
        objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_apnsEnv);
        objc_super v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"apnsEnv");
      }
    }
    else
    {
      objc_super v11 = @"production";
      objc_msgSend_setObject_forKey_(v6, v5, @"production", @"apnsEnv");
    }

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v13 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v5, self->_skipBundleIDCheck);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"skipBundleIDCheck");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E80684((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_token)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  token = self->_token;
  id v9 = v4;
  if (token)
  {
    objc_msgSend_setToken_(v4, v5, (uint64_t)token);
    id v4 = v9;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
  {
    objc_msgSend_setBundleIdentifier_(v9, v5, (uint64_t)bundleIdentifier);
    id v4 = v9;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_apnsEnv;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 32) = self->_skipBundleIDCheck;
    *((unsigned char *)v4 + 36) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_token, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_bundleIdentifier, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v15;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v10 + 8) = self->_apnsEnv;
    *(unsigned char *)(v10 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v10 + 32) = self->_skipBundleIDCheck;
    *(unsigned char *)(v10 + 36) |= 2u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_13;
  }
  token = self->_token;
  uint64_t v9 = v4[3];
  if ((unint64_t)token | v9)
  {
    if (!objc_msgSend_isEqual_(token, v7, v9)) {
      goto LABEL_13;
    }
  }
  bundleIdentifier = self->_bundleIdentifier;
  uint64_t v11 = v4[2];
  if ((unint64_t)bundleIdentifier | v11)
  {
    if (!objc_msgSend_isEqual_(bundleIdentifier, v7, v11)) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_apnsEnv != *((_DWORD *)v4 + 2)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_13;
  }
  BOOL v12 = (*((unsigned char *)v4 + 36) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0)
    {
LABEL_13:
      BOOL v12 = 0;
      goto LABEL_14;
    }
    if (self->_skipBundleIDCheck)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_13;
    }
    BOOL v12 = 1;
  }
LABEL_14:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_token, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_bundleIdentifier, v5, v6);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = 2654435761 * self->_apnsEnv;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    return v7 ^ v4 ^ v8 ^ v9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = 2654435761 * self->_skipBundleIDCheck;
  return v7 ^ v4 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v6 = *((void *)v4 + 3);
  id v9 = v4;
  if (v6)
  {
    objc_msgSend_setToken_(self, v5, v6);
    id v4 = v9;
  }
  uint64_t v7 = *((void *)v4 + 2);
  if (v7)
  {
    objc_msgSend_setBundleIdentifier_(self, v5, v7);
    id v4 = v9;
  }
  char v8 = *((unsigned char *)v4 + 36);
  if (v8)
  {
    self->_int apnsEnv = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v8 = *((unsigned char *)v4 + 36);
  }
  if ((v8 & 2) != 0)
  {
    self->_skipBundleIDCheck = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (BOOL)skipBundleIDCheck
{
  return self->_skipBundleIDCheck;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end