@interface CKDPZoneRetrieveResponseZoneSummary
- (BOOL)expired;
- (BOOL)hasAssetQuotaUsage;
- (BOOL)hasCapabilities;
- (BOOL)hasClientChangeToken;
- (BOOL)hasCurrentServerContinuationToken;
- (BOOL)hasDeviceCount;
- (BOOL)hasExpirationTime;
- (BOOL)hasExpired;
- (BOOL)hasMetadataQuotaUsage;
- (BOOL)hasTargetZone;
- (BOOL)hasZoneKeyRollAllowed;
- (BOOL)hasZonePcsModificationDevice;
- (BOOL)hasZonePcsModificationTime;
- (BOOL)hasZoneishPcsNeedsRolled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)zoneKeyRollAllowed;
- (BOOL)zoneishPcsNeedsRolled;
- (CKDPDate)expirationTime;
- (CKDPDate)zonePcsModificationTime;
- (CKDPZone)targetZone;
- (CKDPZoneCapabilities)capabilities;
- (NSData)clientChangeToken;
- (NSData)currentServerContinuationToken;
- (NSString)zonePcsModificationDevice;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)deviceCount;
- (int64_t)assetQuotaUsage;
- (int64_t)metadataQuotaUsage;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetQuotaUsage:(int64_t)a3;
- (void)setCapabilities:(id)a3;
- (void)setClientChangeToken:(id)a3;
- (void)setCurrentServerContinuationToken:(id)a3;
- (void)setDeviceCount:(int)a3;
- (void)setExpirationTime:(id)a3;
- (void)setExpired:(BOOL)a3;
- (void)setHasAssetQuotaUsage:(BOOL)a3;
- (void)setHasDeviceCount:(BOOL)a3;
- (void)setHasExpired:(BOOL)a3;
- (void)setHasMetadataQuotaUsage:(BOOL)a3;
- (void)setHasZoneKeyRollAllowed:(BOOL)a3;
- (void)setHasZoneishPcsNeedsRolled:(BOOL)a3;
- (void)setMetadataQuotaUsage:(int64_t)a3;
- (void)setTargetZone:(id)a3;
- (void)setZoneKeyRollAllowed:(BOOL)a3;
- (void)setZonePcsModificationDevice:(id)a3;
- (void)setZonePcsModificationTime:(id)a3;
- (void)setZoneishPcsNeedsRolled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPZoneRetrieveResponseZoneSummary

- (BOOL)hasTargetZone
{
  return self->_targetZone != 0;
}

- (BOOL)hasCurrentServerContinuationToken
{
  return self->_currentServerContinuationToken != 0;
}

- (BOOL)hasClientChangeToken
{
  return self->_clientChangeToken != 0;
}

- (void)setDeviceCount:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_deviceCount = a3;
}

- (void)setHasDeviceCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeviceCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAssetQuotaUsage:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_assetQuotaUsage = a3;
}

- (void)setHasAssetQuotaUsage:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAssetQuotaUsage
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMetadataQuotaUsage:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_metadataQuotaUsage = a3;
}

- (void)setHasMetadataQuotaUsage:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMetadataQuotaUsage
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasCapabilities
{
  return self->_capabilities != 0;
}

- (void)setZoneishPcsNeedsRolled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_zoneishPcsNeedsRolled = a3;
}

- (void)setHasZoneishPcsNeedsRolled:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasZoneishPcsNeedsRolled
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setZoneKeyRollAllowed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_zoneKeyRollAllowed = a3;
}

- (void)setHasZoneKeyRollAllowed:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasZoneKeyRollAllowed
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasZonePcsModificationTime
{
  return self->_zonePcsModificationTime != 0;
}

- (BOOL)hasZonePcsModificationDevice
{
  return self->_zonePcsModificationDevice != 0;
}

- (void)setExpired:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_expired = a3;
}

- (void)setHasExpired:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasExpired
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasExpirationTime
{
  return self->_expirationTime != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPZoneRetrieveResponseZoneSummary;
  v4 = [(CKDPZoneRetrieveResponseZoneSummary *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  targetZone = self->_targetZone;
  if (targetZone)
  {
    v8 = objc_msgSend_dictionaryRepresentation(targetZone, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"targetZone");
  }
  currentServerContinuationToken = self->_currentServerContinuationToken;
  if (currentServerContinuationToken) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)currentServerContinuationToken, @"currentServerContinuationToken");
  }
  clientChangeToken = self->_clientChangeToken;
  if (clientChangeToken) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)clientChangeToken, @"clientChangeToken");
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v33 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_deviceCount);
    objc_msgSend_setObject_forKey_(v6, v34, (uint64_t)v33, @"deviceCount");

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  v35 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_assetQuotaUsage);
  objc_msgSend_setObject_forKey_(v6, v36, (uint64_t)v35, @"assetQuotaUsage");

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_10:
    v13 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_metadataQuotaUsage);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"metadataQuotaUsage");
  }
LABEL_11:
  capabilities = self->_capabilities;
  if (capabilities)
  {
    v16 = objc_msgSend_dictionaryRepresentation(capabilities, v4, (uint64_t)clientChangeToken);
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, @"capabilities");
  }
  char v18 = (char)self->_has;
  if ((v18 & 0x20) != 0)
  {
    v19 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_zoneishPcsNeedsRolled);
    objc_msgSend_setObject_forKey_(v6, v20, (uint64_t)v19, @"zoneishPcsNeedsRolled");

    char v18 = (char)self->_has;
  }
  if ((v18 & 0x10) != 0)
  {
    v21 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_zoneKeyRollAllowed);
    objc_msgSend_setObject_forKey_(v6, v22, (uint64_t)v21, @"zoneKeyRollAllowed");
  }
  zonePcsModificationTime = self->_zonePcsModificationTime;
  if (zonePcsModificationTime)
  {
    v24 = objc_msgSend_dictionaryRepresentation(zonePcsModificationTime, v4, (uint64_t)clientChangeToken);
    objc_msgSend_setObject_forKey_(v6, v25, (uint64_t)v24, @"zonePcsModificationTime");
  }
  zonePcsModificationDevice = self->_zonePcsModificationDevice;
  if (zonePcsModificationDevice) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)zonePcsModificationDevice, @"zonePcsModificationDevice");
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v27 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_expired);
    objc_msgSend_setObject_forKey_(v6, v28, (uint64_t)v27, @"expired");
  }
  expirationTime = self->_expirationTime;
  if (expirationTime)
  {
    v30 = objc_msgSend_dictionaryRepresentation(expirationTime, v4, (uint64_t)zonePcsModificationDevice);
    objc_msgSend_setObject_forKey_(v6, v31, (uint64_t)v30, @"expirationTime");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E35588((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_targetZone)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_currentServerContinuationToken)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (self->_clientChangeToken)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt64Field();
    id v4 = v7;
  }
LABEL_11:
  if (self->_capabilities)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
  if (self->_zonePcsModificationTime)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_zonePcsModificationDevice)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
  if (self->_expirationTime)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  targetZone = self->_targetZone;
  id v15 = v4;
  if (targetZone)
  {
    objc_msgSend_setTargetZone_(v4, v5, (uint64_t)targetZone);
    id v4 = v15;
  }
  currentServerContinuationToken = self->_currentServerContinuationToken;
  if (currentServerContinuationToken)
  {
    objc_msgSend_setCurrentServerContinuationToken_(v15, v5, (uint64_t)currentServerContinuationToken);
    id v4 = v15;
  }
  clientChangeToken = self->_clientChangeToken;
  if (clientChangeToken)
  {
    objc_msgSend_setClientChangeToken_(v15, v5, (uint64_t)clientChangeToken);
    id v4 = v15;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_deviceCount;
    *((unsigned char *)v4 + 92) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v4 + 1) = self->_assetQuotaUsage;
  *((unsigned char *)v4 + 92) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_10:
    *((void *)v4 + 2) = self->_metadataQuotaUsage;
    *((unsigned char *)v4 + 92) |= 2u;
  }
LABEL_11:
  capabilities = self->_capabilities;
  if (capabilities)
  {
    objc_msgSend_setCapabilities_(v15, v5, (uint64_t)capabilities);
    id v4 = v15;
  }
  char v11 = (char)self->_has;
  if ((v11 & 0x20) != 0)
  {
    *((unsigned char *)v4 + 90) = self->_zoneishPcsNeedsRolled;
    *((unsigned char *)v4 + 92) |= 0x20u;
    char v11 = (char)self->_has;
  }
  if ((v11 & 0x10) != 0)
  {
    *((unsigned char *)v4 + 89) = self->_zoneKeyRollAllowed;
    *((unsigned char *)v4 + 92) |= 0x10u;
  }
  zonePcsModificationTime = self->_zonePcsModificationTime;
  if (zonePcsModificationTime)
  {
    objc_msgSend_setZonePcsModificationTime_(v15, v5, (uint64_t)zonePcsModificationTime);
    id v4 = v15;
  }
  zonePcsModificationDevice = self->_zonePcsModificationDevice;
  if (zonePcsModificationDevice)
  {
    objc_msgSend_setZonePcsModificationDevice_(v15, v5, (uint64_t)zonePcsModificationDevice);
    id v4 = v15;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v4 + 88) = self->_expired;
    *((unsigned char *)v4 + 92) |= 8u;
  }
  expirationTime = self->_expirationTime;
  if (expirationTime)
  {
    objc_msgSend_setExpirationTime_(v15, v5, (uint64_t)expirationTime);
    id v4 = v15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  id v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_targetZone, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 64);
  *(void *)(v10 + 64) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_currentServerContinuationToken, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_clientChangeToken, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v18;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v10 + 48) = self->_deviceCount;
    *(unsigned char *)(v10 + 92) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v10 + 8) = self->_assetQuotaUsage;
  *(unsigned char *)(v10 + 92) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(void *)(v10 + 16) = self->_metadataQuotaUsage;
    *(unsigned char *)(v10 + 92) |= 2u;
  }
LABEL_5:
  uint64_t v22 = objc_msgSend_copyWithZone_(self->_capabilities, v20, (uint64_t)a3);
  v23 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v22;

  char v25 = (char)self->_has;
  if ((v25 & 0x20) != 0)
  {
    *(unsigned char *)(v10 + 90) = self->_zoneishPcsNeedsRolled;
    *(unsigned char *)(v10 + 92) |= 0x20u;
    char v25 = (char)self->_has;
  }
  if ((v25 & 0x10) != 0)
  {
    *(unsigned char *)(v10 + 89) = self->_zoneKeyRollAllowed;
    *(unsigned char *)(v10 + 92) |= 0x10u;
  }
  uint64_t v26 = objc_msgSend_copyWithZone_(self->_zonePcsModificationTime, v24, (uint64_t)a3);
  v27 = *(void **)(v10 + 80);
  *(void *)(v10 + 80) = v26;

  uint64_t v29 = objc_msgSend_copyWithZone_(self->_zonePcsModificationDevice, v28, (uint64_t)a3);
  v30 = *(void **)(v10 + 72);
  *(void *)(v10 + 72) = v29;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v10 + 88) = self->_expired;
    *(unsigned char *)(v10 + 92) |= 8u;
  }
  uint64_t v32 = objc_msgSend_copyWithZone_(self->_expirationTime, v31, (uint64_t)a3);
  v33 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = v32;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_50;
  }
  targetZone = self->_targetZone;
  uint64_t v9 = v4[8];
  if ((unint64_t)targetZone | v9)
  {
    if (!objc_msgSend_isEqual_(targetZone, v7, v9)) {
      goto LABEL_50;
    }
  }
  currentServerContinuationToken = self->_currentServerContinuationToken;
  uint64_t v11 = v4[5];
  if ((unint64_t)currentServerContinuationToken | v11)
  {
    if (!objc_msgSend_isEqual_(currentServerContinuationToken, v7, v11)) {
      goto LABEL_50;
    }
  }
  clientChangeToken = self->_clientChangeToken;
  uint64_t v13 = v4[4];
  if ((unint64_t)clientChangeToken | v13)
  {
    if (!objc_msgSend_isEqual_(clientChangeToken, v7, v13)) {
      goto LABEL_50;
    }
  }
  char has = (char)self->_has;
  char v15 = *((unsigned char *)v4 + 92);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 4) == 0 || self->_deviceCount != *((_DWORD *)v4 + 12)) {
      goto LABEL_50;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 4) != 0)
  {
    goto LABEL_50;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 92) & 1) == 0 || self->_assetQuotaUsage != v4[1]) {
      goto LABEL_50;
    }
  }
  else if (*((unsigned char *)v4 + 92))
  {
    goto LABEL_50;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 2) == 0 || self->_metadataQuotaUsage != v4[2]) {
      goto LABEL_50;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 2) != 0)
  {
    goto LABEL_50;
  }
  capabilities = self->_capabilities;
  uint64_t v17 = v4[3];
  if ((unint64_t)capabilities | v17)
  {
    if (!objc_msgSend_isEqual_(capabilities, v7, v17)) {
      goto LABEL_50;
    }
    char has = (char)self->_has;
    char v15 = *((unsigned char *)v4 + 92);
  }
  if ((has & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0) {
      goto LABEL_50;
    }
    if (self->_zoneishPcsNeedsRolled)
    {
      if (!*((unsigned char *)v4 + 90)) {
        goto LABEL_50;
      }
    }
    else if (*((unsigned char *)v4 + 90))
    {
      goto LABEL_50;
    }
  }
  else if ((v15 & 0x20) != 0)
  {
    goto LABEL_50;
  }
  if ((has & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0) {
      goto LABEL_50;
    }
    if (self->_zoneKeyRollAllowed)
    {
      if (!*((unsigned char *)v4 + 89)) {
        goto LABEL_50;
      }
    }
    else if (*((unsigned char *)v4 + 89))
    {
      goto LABEL_50;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_50;
  }
  zonePcsModificationTime = self->_zonePcsModificationTime;
  uint64_t v19 = v4[10];
  if ((unint64_t)zonePcsModificationTime | v19
    && !objc_msgSend_isEqual_(zonePcsModificationTime, v7, v19))
  {
    goto LABEL_50;
  }
  zonePcsModificationDevice = self->_zonePcsModificationDevice;
  uint64_t v21 = v4[9];
  if ((unint64_t)zonePcsModificationDevice | v21)
  {
    if (!objc_msgSend_isEqual_(zonePcsModificationDevice, v7, v21)) {
      goto LABEL_50;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    if ((*((unsigned char *)v4 + 92) & 8) == 0) {
      goto LABEL_56;
    }
LABEL_50:
    char isEqual = 0;
    goto LABEL_51;
  }
  if ((*((unsigned char *)v4 + 92) & 8) == 0) {
    goto LABEL_50;
  }
  if (!self->_expired)
  {
    if (!*((unsigned char *)v4 + 88)) {
      goto LABEL_56;
    }
    goto LABEL_50;
  }
  if (!*((unsigned char *)v4 + 88)) {
    goto LABEL_50;
  }
LABEL_56:
  expirationTime = self->_expirationTime;
  uint64_t v25 = v4[7];
  if ((unint64_t)expirationTime | v25) {
    char isEqual = objc_msgSend_isEqual_(expirationTime, v7, v25);
  }
  else {
    char isEqual = 1;
  }
LABEL_51:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v29 = objc_msgSend_hash(self->_targetZone, a2, v2);
  uint64_t v28 = objc_msgSend_hash(self->_currentServerContinuationToken, v4, v5);
  uint64_t v27 = objc_msgSend_hash(self->_clientChangeToken, v6, v7);
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v25 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v25 = 2654435761 * self->_deviceCount;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v10 = 2654435761 * self->_assetQuotaUsage;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v11 = 2654435761 * self->_metadataQuotaUsage;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v11 = 0;
LABEL_8:
  uint64_t v14 = objc_msgSend_hash(self->_capabilities, v8, v9, v25);
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v15 = 2654435761 * self->_zoneishPcsNeedsRolled;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_10:
      uint64_t v16 = 2654435761 * self->_zoneKeyRollAllowed;
      goto LABEL_13;
    }
  }
  uint64_t v16 = 0;
LABEL_13:
  uint64_t v17 = objc_msgSend_hash(self->_zonePcsModificationTime, v12, v13);
  uint64_t v20 = objc_msgSend_hash(self->_zonePcsModificationDevice, v18, v19);
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v23 = 2654435761 * self->_expired;
  }
  else {
    uint64_t v23 = 0;
  }
  return v28 ^ v29 ^ v27 ^ v26 ^ v10 ^ v11 ^ v14 ^ v15 ^ v16 ^ v17 ^ v20 ^ v23 ^ objc_msgSend_hash(self->_expirationTime, v21, v22);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  targetZone = self->_targetZone;
  uint64_t v6 = *((void *)v4 + 8);
  id v18 = v4;
  if (targetZone)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(targetZone, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setTargetZone_(self, (const char *)v4, v6);
  }
  id v4 = v18;
LABEL_7:
  uint64_t v7 = *((void *)v4 + 5);
  if (v7)
  {
    objc_msgSend_setCurrentServerContinuationToken_(self, (const char *)v4, v7);
    id v4 = v18;
  }
  uint64_t v8 = *((void *)v4 + 4);
  if (v8)
  {
    objc_msgSend_setClientChangeToken_(self, (const char *)v4, v8);
    id v4 = v18;
  }
  char v9 = *((unsigned char *)v4 + 92);
  if ((v9 & 4) != 0)
  {
    self->_deviceCount = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 4u;
    char v9 = *((unsigned char *)v4 + 92);
    if ((v9 & 1) == 0)
    {
LABEL_13:
      if ((v9 & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 1) == 0)
  {
    goto LABEL_13;
  }
  self->_assetQuotaUsage = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 92) & 2) != 0)
  {
LABEL_14:
    self->_metadataQuotaUsage = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_15:
  capabilities = self->_capabilities;
  uint64_t v11 = *((void *)v4 + 3);
  if (capabilities)
  {
    if (!v11) {
      goto LABEL_24;
    }
    objc_msgSend_mergeFrom_(capabilities, (const char *)v4, v11);
  }
  else
  {
    if (!v11) {
      goto LABEL_24;
    }
    objc_msgSend_setCapabilities_(self, (const char *)v4, v11);
  }
  id v4 = v18;
LABEL_24:
  char v12 = *((unsigned char *)v4 + 92);
  if ((v12 & 0x20) != 0)
  {
    self->_zoneishPcsNeedsRolled = *((unsigned char *)v4 + 90);
    *(unsigned char *)&self->_has |= 0x20u;
    char v12 = *((unsigned char *)v4 + 92);
  }
  if ((v12 & 0x10) != 0)
  {
    self->_zoneKeyRollAllowed = *((unsigned char *)v4 + 89);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  zonePcsModificationTime = self->_zonePcsModificationTime;
  uint64_t v14 = *((void *)v4 + 10);
  if (zonePcsModificationTime)
  {
    if (!v14) {
      goto LABEL_34;
    }
    objc_msgSend_mergeFrom_(zonePcsModificationTime, (const char *)v4, v14);
  }
  else
  {
    if (!v14) {
      goto LABEL_34;
    }
    objc_msgSend_setZonePcsModificationTime_(self, (const char *)v4, v14);
  }
  id v4 = v18;
LABEL_34:
  uint64_t v15 = *((void *)v4 + 9);
  if (v15)
  {
    objc_msgSend_setZonePcsModificationDevice_(self, (const char *)v4, v15);
    id v4 = v18;
  }
  if ((*((unsigned char *)v4 + 92) & 8) != 0)
  {
    self->_expired = *((unsigned char *)v4 + 88);
    *(unsigned char *)&self->_has |= 8u;
  }
  expirationTime = self->_expirationTime;
  uint64_t v17 = *((void *)v4 + 7);
  if (expirationTime)
  {
    if (v17) {
      objc_msgSend_mergeFrom_(expirationTime, (const char *)v4, v17);
    }
  }
  else if (v17)
  {
    objc_msgSend_setExpirationTime_(self, (const char *)v4, v17);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPZone)targetZone
{
  return self->_targetZone;
}

- (void)setTargetZone:(id)a3
{
}

- (NSData)currentServerContinuationToken
{
  return self->_currentServerContinuationToken;
}

- (void)setCurrentServerContinuationToken:(id)a3
{
}

- (NSData)clientChangeToken
{
  return self->_clientChangeToken;
}

- (void)setClientChangeToken:(id)a3
{
}

- (int)deviceCount
{
  return self->_deviceCount;
}

- (int64_t)assetQuotaUsage
{
  return self->_assetQuotaUsage;
}

- (int64_t)metadataQuotaUsage
{
  return self->_metadataQuotaUsage;
}

- (CKDPZoneCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BOOL)zoneishPcsNeedsRolled
{
  return self->_zoneishPcsNeedsRolled;
}

- (BOOL)zoneKeyRollAllowed
{
  return self->_zoneKeyRollAllowed;
}

- (CKDPDate)zonePcsModificationTime
{
  return self->_zonePcsModificationTime;
}

- (void)setZonePcsModificationTime:(id)a3
{
}

- (NSString)zonePcsModificationDevice
{
  return self->_zonePcsModificationDevice;
}

- (void)setZonePcsModificationDevice:(id)a3
{
}

- (BOOL)expired
{
  return self->_expired;
}

- (CKDPDate)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zonePcsModificationTime, 0);
  objc_storeStrong((id *)&self->_zonePcsModificationDevice, 0);
  objc_storeStrong((id *)&self->_targetZone, 0);
  objc_storeStrong((id *)&self->_expirationTime, 0);
  objc_storeStrong((id *)&self->_currentServerContinuationToken, 0);
  objc_storeStrong((id *)&self->_clientChangeToken, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end