@interface CKDPFieldCryptoFeatureSet
- (BOOL)hasAssetKeyEncryptionType;
- (BOOL)hasEncryptedFieldContextType;
- (BOOL)hasMinimumSchemaVersion;
- (BOOL)hasMmcsVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)assetKeyEncryptionType;
- (int)encryptedFieldContextType;
- (int)minimumSchemaVersion;
- (int)mmcsVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetKeyEncryptionType:(int)a3;
- (void)setEncryptedFieldContextType:(int)a3;
- (void)setHasAssetKeyEncryptionType:(BOOL)a3;
- (void)setHasEncryptedFieldContextType:(BOOL)a3;
- (void)setHasMinimumSchemaVersion:(BOOL)a3;
- (void)setHasMmcsVersion:(BOOL)a3;
- (void)setMinimumSchemaVersion:(int)a3;
- (void)setMmcsVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPFieldCryptoFeatureSet

- (int)minimumSchemaVersion
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_minimumSchemaVersion;
  }
  else {
    return 1;
  }
}

- (void)setMinimumSchemaVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_minimumSchemaVersion = a3;
}

- (void)setHasMinimumSchemaVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinimumSchemaVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMmcsVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_mmcsVersion = a3;
}

- (void)setHasMmcsVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMmcsVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEncryptedFieldContextType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_encryptedFieldContextType = a3;
}

- (void)setHasEncryptedFieldContextType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEncryptedFieldContextType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAssetKeyEncryptionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_assetKeyEncryptionType = a3;
}

- (void)setHasAssetKeyEncryptionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAssetKeyEncryptionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPFieldCryptoFeatureSet;
  v4 = [(CKDPFieldCryptoFeatureSet *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v10 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_minimumSchemaVersion);
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)v10, @"minimumSchemaVersion");

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v12 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_mmcsVersion);
  objc_msgSend_setObject_forKey_(v5, v13, (uint64_t)v12, @"mmcsVersion");

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v14 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_encryptedFieldContextType);
  objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, @"encryptedFieldContextType");

  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v7 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_assetKeyEncryptionType);
    objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, @"assetKeyEncryptionType");
  }
LABEL_6:
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4EF8440((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[4] = self->_minimumSchemaVersion;
    *((unsigned char *)v4 + 24) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_mmcsVersion;
  *((unsigned char *)v4 + 24) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v4[3] = self->_encryptedFieldContextType;
  *((unsigned char *)v4 + 24) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v4[2] = self->_assetKeyEncryptionType;
    *((unsigned char *)v4 + 24) |= 1u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id result = (id)objc_msgSend_init(v7, v8, v9);
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_minimumSchemaVersion;
    *((unsigned char *)result + 24) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_mmcsVersion;
  *((unsigned char *)result + 24) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 3) = self->_encryptedFieldContextType;
  *((unsigned char *)result + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 2) = self->_assetKeyEncryptionType;
  *((unsigned char *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_minimumSchemaVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
LABEL_21:
    BOOL v7 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0 || self->_mmcsVersion != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_encryptedFieldContextType != *((_DWORD *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_21;
  }
  BOOL v7 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_assetKeyEncryptionType != *((_DWORD *)v4 + 2)) {
      goto LABEL_21;
    }
    BOOL v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v2 = 2654435761 * self->_minimumSchemaVersion;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_mmcsVersion;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_encryptedFieldContextType;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_assetKeyEncryptionType;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 4) != 0)
  {
    self->_minimumSchemaVersion = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_mmcsVersion = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_encryptedFieldContextType = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 24))
  {
LABEL_5:
    self->_assetKeyEncryptionType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_6:
}

- (int)mmcsVersion
{
  return self->_mmcsVersion;
}

- (int)encryptedFieldContextType
{
  return self->_encryptedFieldContextType;
}

- (int)assetKeyEncryptionType
{
  return self->_assetKeyEncryptionType;
}

@end