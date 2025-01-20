@interface CKCDPCodeServiceRequestAccountConfig
- (BOOL)corporateSharingEnabled;
- (BOOL)hasAccountFlags;
- (BOOL)hasCorporateSharingEnabled;
- (BOOL)hasCountryCode;
- (BOOL)hasLastWebActivityUTCMills;
- (BOOL)hasPhotosWebAccessTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)countryCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)lastWebActivityUTCMills;
- (int64_t)photosWebAccessTimestamp;
- (unint64_t)accountFlags;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountFlags:(unint64_t)a3;
- (void)setCorporateSharingEnabled:(BOOL)a3;
- (void)setCountryCode:(id)a3;
- (void)setHasAccountFlags:(BOOL)a3;
- (void)setHasCorporateSharingEnabled:(BOOL)a3;
- (void)setHasLastWebActivityUTCMills:(BOOL)a3;
- (void)setHasPhotosWebAccessTimestamp:(BOOL)a3;
- (void)setLastWebActivityUTCMills:(int64_t)a3;
- (void)setPhotosWebAccessTimestamp:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKCDPCodeServiceRequestAccountConfig

- (void)setCorporateSharingEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_corporateSharingEnabled = a3;
}

- (void)setHasCorporateSharingEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCorporateSharingEnabled
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLastWebActivityUTCMills:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lastWebActivityUTCMills = a3;
}

- (void)setHasLastWebActivityUTCMills:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastWebActivityUTCMills
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (void)setPhotosWebAccessTimestamp:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_photosWebAccessTimestamp = a3;
}

- (void)setHasPhotosWebAccessTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPhotosWebAccessTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAccountFlags:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_accountFlags = a3;
}

- (void)setHasAccountFlags:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAccountFlags
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKCDPCodeServiceRequestAccountConfig;
  v4 = [(CKCDPCodeServiceRequestAccountConfig *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v7 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_corporateSharingEnabled);
    objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, @"corporateSharingEnabled");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_lastWebActivityUTCMills);
    objc_msgSend_setObject_forKey_(v5, v10, (uint64_t)v9, @"lastWebActivityUTCMills");
  }
  countryCode = self->_countryCode;
  if (countryCode) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)countryCode, @"countryCode");
  }
  char v12 = (char)self->_has;
  if ((v12 & 4) != 0)
  {
    v13 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_photosWebAccessTimestamp);
    objc_msgSend_setObject_forKey_(v5, v14, (uint64_t)v13, @"photosWebAccessTimestamp");

    char v12 = (char)self->_has;
  }
  if (v12)
  {
    v15 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v4, self->_accountFlags);
    objc_msgSend_setObject_forKey_(v5, v16, (uint64_t)v15, @"accountFlags");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E24F08((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    char v5 = (char)self->_has;
  }
  if (v5) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[40] = self->_corporateSharingEnabled;
    v4[44] |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_lastWebActivityUTCMills;
    v4[44] |= 2u;
  }
  countryCode = self->_countryCode;
  if (countryCode)
  {
    v9 = v4;
    objc_msgSend_setCountryCode_(v4, v5, (uint64_t)countryCode);
    v4 = v9;
  }
  char v8 = (char)self->_has;
  if ((v8 & 4) != 0)
  {
    *((void *)v4 + 3) = self->_photosWebAccessTimestamp;
    v4[44] |= 4u;
    char v8 = (char)self->_has;
  }
  if (v8)
  {
    *((void *)v4 + 1) = self->_accountFlags;
    v4[44] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = v10;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v10 + 40) = self->_corporateSharingEnabled;
    *(unsigned char *)(v10 + 44) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v10 + 16) = self->_lastWebActivityUTCMills;
    *(unsigned char *)(v10 + 44) |= 2u;
  }
  uint64_t v14 = objc_msgSend_copyWithZone_(self->_countryCode, v11, (uint64_t)a3);
  v15 = *(void **)(v12 + 32);
  *(void *)(v12 + 32) = v14;

  char v16 = (char)self->_has;
  if ((v16 & 4) != 0)
  {
    *(void *)(v12 + 24) = self->_photosWebAccessTimestamp;
    *(unsigned char *)(v12 + 44) |= 4u;
    char v16 = (char)self->_has;
  }
  if (v16)
  {
    *(void *)(v12 + 8) = self->_accountFlags;
    *(unsigned char *)(v12 + 44) |= 1u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_27;
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 44);
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0) {
      goto LABEL_27;
    }
    if (self->_corporateSharingEnabled)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_lastWebActivityUTCMills != v4[2]) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_27;
  }
  countryCode = self->_countryCode;
  uint64_t v11 = v4[4];
  if ((unint64_t)countryCode | v11)
  {
    if (objc_msgSend_isEqual_(countryCode, v7, v11))
    {
      char has = (char)self->_has;
      char v9 = *((unsigned char *)v4 + 44);
      goto LABEL_18;
    }
LABEL_27:
    BOOL v12 = 0;
    goto LABEL_28;
  }
LABEL_18:
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_photosWebAccessTimestamp != v4[3]) {
      goto LABEL_27;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_27;
  }
  BOOL v12 = (v9 & 1) == 0;
  if (has)
  {
    if ((v9 & 1) == 0 || self->_accountFlags != v4[1]) {
      goto LABEL_27;
    }
    BOOL v12 = 1;
  }
LABEL_28:

  return v12;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_corporateSharingEnabled;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_lastWebActivityUTCMills;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  uint64_t v6 = objc_msgSend_hash(self->_countryCode, a2, v2);
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v7 = 2654435761 * self->_photosWebAccessTimestamp;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_8;
    }
LABEL_10:
    unint64_t v8 = 0;
    return v5 ^ v4 ^ v7 ^ v8 ^ v6;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_accountFlags;
  return v5 ^ v4 ^ v7 ^ v8 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v6 = *((unsigned char *)v4 + 44);
  if ((v6 & 8) != 0)
  {
    self->_corporateSharingEnabled = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)v4 + 44);
  }
  if ((v6 & 2) != 0)
  {
    self->_lastWebActivityUTCMills = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v7 = *((void *)v4 + 4);
  if (v7)
  {
    id v9 = v4;
    objc_msgSend_setCountryCode_(self, v5, v7);
    id v4 = v9;
  }
  char v8 = *((unsigned char *)v4 + 44);
  if ((v8 & 4) != 0)
  {
    self->_photosWebAccessTimestamp = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v8 = *((unsigned char *)v4 + 44);
  }
  if (v8)
  {
    self->_accountFlags = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)corporateSharingEnabled
{
  return self->_corporateSharingEnabled;
}

- (int64_t)lastWebActivityUTCMills
{
  return self->_lastWebActivityUTCMills;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (int64_t)photosWebAccessTimestamp
{
  return self->_photosWebAccessTimestamp;
}

- (unint64_t)accountFlags
{
  return self->_accountFlags;
}

- (void).cxx_destruct
{
}

@end