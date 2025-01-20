@interface CKCDPTrustedTargetCryptoMetadata
- (BOOL)hasEncryptedInvocationKey;
- (BOOL)hasKeyVersion;
- (BOOL)hasProtectionSource;
- (BOOL)hasScheme;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptedInvocationKey;
- (NSString)protectionSource;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)schemeAsString:(int)a3;
- (int)StringAsScheme:(id)a3;
- (int)scheme;
- (int64_t)keyVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptedInvocationKey:(id)a3;
- (void)setHasKeyVersion:(BOOL)a3;
- (void)setHasScheme:(BOOL)a3;
- (void)setKeyVersion:(int64_t)a3;
- (void)setProtectionSource:(id)a3;
- (void)setScheme:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKCDPTrustedTargetCryptoMetadata

- (BOOL)hasEncryptedInvocationKey
{
  return self->_encryptedInvocationKey != 0;
}

- (BOOL)hasProtectionSource
{
  return self->_protectionSource != 0;
}

- (void)setKeyVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_keyVersion = a3;
}

- (void)setHasKeyVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKeyVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)scheme
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_scheme;
  }
  else {
    return 0;
  }
}

- (void)setScheme:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_scheme = a3;
}

- (void)setHasScheme:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScheme
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)schemeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"cloudMediaProcessing";
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"unspecified";
  }
  return v4;
}

- (int)StringAsScheme:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"unspecified")) {
    int isEqualToString = 0;
  }
  else {
    int isEqualToString = objc_msgSend_isEqualToString_(v3, v5, @"cloudMediaProcessing");
  }

  return isEqualToString;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKCDPTrustedTargetCryptoMetadata;
  v4 = [(CKCDPTrustedTargetCryptoMetadata *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  encryptedInvocationKey = self->_encryptedInvocationKey;
  if (encryptedInvocationKey) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)encryptedInvocationKey, @"encryptedInvocationKey");
  }
  protectionSource = self->_protectionSource;
  if (protectionSource) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)protectionSource, @"protectionSource");
  }
  char has = (char)self->_has;
  if (has)
  {
    v10 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v5, self->_keyVersion);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"keyVersion");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    int scheme = self->_scheme;
    if (scheme)
    {
      if (scheme == 1)
      {
        v13 = @"cloudMediaProcessing";
        objc_msgSend_setObject_forKey_(v6, v5, @"cloudMediaProcessing", @"scheme");
      }
      else
      {
        objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_scheme);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"scheme");
      }
    }
    else
    {
      v13 = @"unspecified";
      objc_msgSend_setObject_forKey_(v6, v5, @"unspecified", @"scheme");
    }
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4FFF4E0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_encryptedInvocationKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_protectionSource)
  {
    PBDataWriterWriteStringField();
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
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  encryptedInvocationKey = self->_encryptedInvocationKey;
  id v9 = v4;
  if (encryptedInvocationKey)
  {
    objc_msgSend_setEncryptedInvocationKey_(v4, v5, (uint64_t)encryptedInvocationKey);
    id v4 = v9;
  }
  protectionSource = self->_protectionSource;
  if (protectionSource)
  {
    objc_msgSend_setProtectionSource_(v9, v5, (uint64_t)protectionSource);
    id v4 = v9;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_keyVersion;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_scheme;
    *((unsigned char *)v4 + 36) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_encryptedInvocationKey, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_protectionSource, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v15;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v10 + 8) = self->_keyVersion;
    *(unsigned char *)(v10 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 32) = self->_scheme;
    *(unsigned char *)(v10 + 36) |= 2u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_15;
  }
  encryptedInvocationKey = self->_encryptedInvocationKey;
  uint64_t v9 = v4[2];
  if ((unint64_t)encryptedInvocationKey | v9)
  {
    if (!objc_msgSend_isEqual_(encryptedInvocationKey, v7, v9)) {
      goto LABEL_15;
    }
  }
  protectionSource = self->_protectionSource;
  uint64_t v11 = v4[3];
  if ((unint64_t)protectionSource | v11)
  {
    if (!objc_msgSend_isEqual_(protectionSource, v7, v11)) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_keyVersion != v4[1]) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_15:
    BOOL v12 = 0;
    goto LABEL_16;
  }
  BOOL v12 = (*((unsigned char *)v4 + 36) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_scheme != *((_DWORD *)v4 + 8)) {
      goto LABEL_15;
    }
    BOOL v12 = 1;
  }
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_encryptedInvocationKey, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_protectionSource, v5, v6);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = 2654435761 * self->_keyVersion;
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
  uint64_t v9 = 2654435761 * self->_scheme;
  return v7 ^ v4 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v6 = *((void *)v4 + 2);
  id v9 = v4;
  if (v6)
  {
    objc_msgSend_setEncryptedInvocationKey_(self, v5, v6);
    id v4 = v9;
  }
  uint64_t v7 = *((void *)v4 + 3);
  if (v7)
  {
    objc_msgSend_setProtectionSource_(self, v5, v7);
    id v4 = v9;
  }
  char v8 = *((unsigned char *)v4 + 36);
  if (v8)
  {
    self->_keyVersion = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v8 = *((unsigned char *)v4 + 36);
  }
  if ((v8 & 2) != 0)
  {
    self->_int scheme = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSData)encryptedInvocationKey
{
  return self->_encryptedInvocationKey;
}

- (void)setEncryptedInvocationKey:(id)a3
{
}

- (NSString)protectionSource
{
  return self->_protectionSource;
}

- (void)setProtectionSource:(id)a3
{
}

- (int64_t)keyVersion
{
  return self->_keyVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionSource, 0);
  objc_storeStrong((id *)&self->_encryptedInvocationKey, 0);
}

@end