@interface CKDPZoneRetrieveChangesResponseChangedZone
- (BOOL)hasAnonymousZoneInfo;
- (BOOL)hasCapabilities;
- (BOOL)hasChangeType;
- (BOOL)hasDeleteType;
- (BOOL)hasIsAnonymous;
- (BOOL)hasZoneIdentifier;
- (BOOL)isAnonymous;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPAnonymousZoneInfo)anonymousZoneInfo;
- (CKDPRecordZoneIdentifier)zoneIdentifier;
- (CKDPZoneCapabilities)capabilities;
- (id)changeTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deleteTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsChangeType:(id)a3;
- (int)StringAsDeleteType:(id)a3;
- (int)changeType;
- (int)deleteType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnonymousZoneInfo:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setChangeType:(int)a3;
- (void)setDeleteType:(int)a3;
- (void)setHasChangeType:(BOOL)a3;
- (void)setHasDeleteType:(BOOL)a3;
- (void)setHasIsAnonymous:(BOOL)a3;
- (void)setIsAnonymous:(BOOL)a3;
- (void)setZoneIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPZoneRetrieveChangesResponseChangedZone

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (int)changeType
{
  if (*(unsigned char *)&self->_has) {
    return self->_changeType;
  }
  else {
    return 1;
  }
}

- (void)setChangeType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_changeType = a3;
}

- (void)setHasChangeType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChangeType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)changeTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"updated";
  }
  else if (a3 == 2)
  {
    v4 = @"deleted";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsChangeType:(id)a3
{
  id v3 = a3;
  int v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, @"updated") & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, @"deleted")) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
  }

  return v6;
}

- (int)deleteType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_deleteType;
  }
  else {
    return 1;
  }
}

- (void)setDeleteType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_deleteType = a3;
}

- (void)setHasDeleteType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeleteType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)deleteTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E64F66C8[a3 - 1];
  }
  return v3;
}

- (int)StringAsDeleteType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"normal"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"userPurged"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"userDidResetEncryptedData"))
  {
    int v6 = 3;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (BOOL)hasCapabilities
{
  return self->_capabilities != 0;
}

- (void)setIsAnonymous:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isAnonymous = a3;
}

- (void)setHasIsAnonymous:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsAnonymous
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasAnonymousZoneInfo
{
  return self->_anonymousZoneInfo != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPZoneRetrieveChangesResponseChangedZone;
  v4 = [(CKDPZoneRetrieveChangesResponseChangedZone *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    v8 = objc_msgSend_dictionaryRepresentation(zoneIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"zoneIdentifier");
  }
  char has = (char)self->_has;
  if (has)
  {
    int changeType = self->_changeType;
    if (changeType == 1)
    {
      v12 = @"updated";
      objc_msgSend_setObject_forKey_(v6, v4, @"updated", @"changeType");
    }
    else if (changeType == 2)
    {
      v12 = @"deleted";
      objc_msgSend_setObject_forKey_(v6, v4, @"deleted", @"changeType");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_changeType);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, @"changeType");
    }

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v14 = self->_deleteType - 1;
    if (v14 >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_deleteType);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E64F66C8[v14];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v15, @"deleteType");
  }
  capabilities = self->_capabilities;
  if (capabilities)
  {
    v17 = objc_msgSend_dictionaryRepresentation(capabilities, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, @"capabilities");
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v19 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_isAnonymous);
    objc_msgSend_setObject_forKey_(v6, v20, (uint64_t)v19, @"isAnonymous");
  }
  anonymousZoneInfo = self->_anonymousZoneInfo;
  if (anonymousZoneInfo)
  {
    v22 = objc_msgSend_dictionaryRepresentation(anonymousZoneInfo, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v23, (uint64_t)v22, @"anonymousZoneInfo");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F345BC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
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
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_capabilities)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_anonymousZoneInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  id v10 = v4;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v4, v5, (uint64_t)zoneIdentifier);
    id v4 = v10;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 6) = self->_changeType;
    *((unsigned char *)v4 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 7) = self->_deleteType;
    *((unsigned char *)v4 + 44) |= 2u;
  }
  capabilities = self->_capabilities;
  if (capabilities)
  {
    objc_msgSend_setCapabilities_(v10, v5, (uint64_t)capabilities);
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 40) = self->_isAnonymous;
    *((unsigned char *)v4 + 44) |= 4u;
  }
  anonymousZoneInfo = self->_anonymousZoneInfo;
  if (anonymousZoneInfo)
  {
    objc_msgSend_setAnonymousZoneInfo_(v10, v5, (uint64_t)anonymousZoneInfo);
    id v4 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v12;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v10 + 24) = self->_changeType;
    *(unsigned char *)(v10 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 28) = self->_deleteType;
    *(unsigned char *)(v10 + 44) |= 2u;
  }
  uint64_t v16 = objc_msgSend_copyWithZone_(self->_capabilities, v14, (uint64_t)a3);
  v17 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v16;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v10 + 40) = self->_isAnonymous;
    *(unsigned char *)(v10 + 44) |= 4u;
  }
  uint64_t v19 = objc_msgSend_copyWithZone_(self->_anonymousZoneInfo, v18, (uint64_t)a3);
  v20 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v19;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_21;
  }
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v9 = v4[4];
  if ((unint64_t)zoneIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(zoneIdentifier, v7, v9)) {
      goto LABEL_21;
    }
  }
  char has = (char)self->_has;
  char v11 = *((unsigned char *)v4 + 44);
  if (has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_changeType != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_deleteType != *((_DWORD *)v4 + 7)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_21;
  }
  capabilities = self->_capabilities;
  uint64_t v13 = v4[2];
  if ((unint64_t)capabilities | v13)
  {
    if (!objc_msgSend_isEqual_(capabilities, v7, v13)) {
      goto LABEL_21;
    }
    char has = (char)self->_has;
    char v11 = *((unsigned char *)v4 + 44);
  }
  if ((has & 4) == 0)
  {
    if ((v11 & 4) == 0) {
      goto LABEL_27;
    }
LABEL_21:
    char isEqual = 0;
    goto LABEL_22;
  }
  if ((v11 & 4) == 0) {
    goto LABEL_21;
  }
  if (!self->_isAnonymous)
  {
    if (!*((unsigned char *)v4 + 40)) {
      goto LABEL_27;
    }
    goto LABEL_21;
  }
  if (!*((unsigned char *)v4 + 40)) {
    goto LABEL_21;
  }
LABEL_27:
  anonymousZoneInfo = self->_anonymousZoneInfo;
  uint64_t v17 = v4[1];
  if ((unint64_t)anonymousZoneInfo | v17) {
    char isEqual = objc_msgSend_isEqual_(anonymousZoneInfo, v7, v17);
  }
  else {
    char isEqual = 1;
  }
LABEL_22:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_zoneIdentifier, a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = 2654435761 * self->_changeType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v8 = 2654435761 * self->_deleteType;
      goto LABEL_6;
    }
  }
  uint64_t v8 = 0;
LABEL_6:
  uint64_t v9 = objc_msgSend_hash(self->_capabilities, v4, v5);
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v12 = 2654435761 * self->_isAnonymous;
  }
  else {
    uint64_t v12 = 0;
  }
  return v7 ^ v6 ^ v8 ^ v9 ^ v12 ^ objc_msgSend_hash(self->_anonymousZoneInfo, v10, v11);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v6 = *((void *)v4 + 4);
  id v12 = v4;
  if (zoneIdentifier)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(zoneIdentifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setZoneIdentifier_(self, (const char *)v4, v6);
  }
  id v4 = v12;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 44);
  if (v7)
  {
    self->_int changeType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 44);
  }
  if ((v7 & 2) != 0)
  {
    self->_deleteType = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 2u;
  }
  capabilities = self->_capabilities;
  uint64_t v9 = *((void *)v4 + 2);
  if (capabilities)
  {
    if (!v9) {
      goto LABEL_17;
    }
    objc_msgSend_mergeFrom_(capabilities, (const char *)v4, v9);
  }
  else
  {
    if (!v9) {
      goto LABEL_17;
    }
    objc_msgSend_setCapabilities_(self, (const char *)v4, v9);
  }
  id v4 = v12;
LABEL_17:
  if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    self->_isAnonymous = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 4u;
  }
  anonymousZoneInfo = self->_anonymousZoneInfo;
  uint64_t v11 = *((void *)v4 + 1);
  if (anonymousZoneInfo)
  {
    if (v11) {
      objc_msgSend_mergeFrom_(anonymousZoneInfo, (const char *)v4, v11);
    }
  }
  else if (v11)
  {
    objc_msgSend_setAnonymousZoneInfo_(self, (const char *)v4, v11);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
}

- (CKDPZoneCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BOOL)isAnonymous
{
  return self->_isAnonymous;
}

- (CKDPAnonymousZoneInfo)anonymousZoneInfo
{
  return self->_anonymousZoneInfo;
}

- (void)setAnonymousZoneInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_anonymousZoneInfo, 0);
}

@end