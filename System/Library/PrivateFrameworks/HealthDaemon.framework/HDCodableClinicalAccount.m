@interface HDCodableClinicalAccount
- (BOOL)hasAccountIdentifier;
- (BOOL)hasClinicalSharingFirstSharedDate;
- (BOOL)hasClinicalSharingLastSharedDate;
- (BOOL)hasClinicalSharingMultiDeviceStatus;
- (BOOL)hasClinicalSharingPrimaryDeviceName;
- (BOOL)hasClinicalSharingUserStatus;
- (BOOL)hasCreationDate;
- (BOOL)hasCredentialSyncIdentifier;
- (BOOL)hasFailedFetchAttemptsCount;
- (BOOL)hasGatewayExternalID;
- (BOOL)hasLastFailedFetchDate;
- (BOOL)hasLastFetchDate;
- (BOOL)hasLastFullFetchDate;
- (BOOL)hasMessageVersion;
- (BOOL)hasModificationDate;
- (BOOL)hasPatientHash;
- (BOOL)hasSignedClinicalDataIssuerIdentifier;
- (BOOL)hasSyncIdentifier;
- (BOOL)hasSyncIdentity;
- (BOOL)hasUserEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)userEnabled;
- (HDCodableMessageVersion)messageVersion;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)credentialSyncIdentifier;
- (NSData)syncIdentifier;
- (NSString)accountIdentifier;
- (NSString)clinicalSharingPrimaryDeviceName;
- (NSString)gatewayExternalID;
- (NSString)patientHash;
- (NSString)signedClinicalDataIssuerIdentifier;
- (double)clinicalSharingFirstSharedDate;
- (double)clinicalSharingLastSharedDate;
- (double)creationDate;
- (double)lastFailedFetchDate;
- (double)lastFetchDate;
- (double)lastFullFetchDate;
- (double)modificationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)clinicalSharingMultiDeviceStatus;
- (int64_t)clinicalSharingUserStatus;
- (int64_t)failedFetchAttemptsCount;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setClinicalSharingFirstSharedDate:(double)a3;
- (void)setClinicalSharingLastSharedDate:(double)a3;
- (void)setClinicalSharingMultiDeviceStatus:(int64_t)a3;
- (void)setClinicalSharingPrimaryDeviceName:(id)a3;
- (void)setClinicalSharingUserStatus:(int64_t)a3;
- (void)setCreationDate:(double)a3;
- (void)setCredentialSyncIdentifier:(id)a3;
- (void)setFailedFetchAttemptsCount:(int64_t)a3;
- (void)setGatewayExternalID:(id)a3;
- (void)setHasClinicalSharingFirstSharedDate:(BOOL)a3;
- (void)setHasClinicalSharingLastSharedDate:(BOOL)a3;
- (void)setHasClinicalSharingMultiDeviceStatus:(BOOL)a3;
- (void)setHasClinicalSharingUserStatus:(BOOL)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasFailedFetchAttemptsCount:(BOOL)a3;
- (void)setHasLastFailedFetchDate:(BOOL)a3;
- (void)setHasLastFetchDate:(BOOL)a3;
- (void)setHasLastFullFetchDate:(BOOL)a3;
- (void)setHasModificationDate:(BOOL)a3;
- (void)setHasUserEnabled:(BOOL)a3;
- (void)setLastFailedFetchDate:(double)a3;
- (void)setLastFetchDate:(double)a3;
- (void)setLastFullFetchDate:(double)a3;
- (void)setMessageVersion:(id)a3;
- (void)setModificationDate:(double)a3;
- (void)setPatientHash:(id)a3;
- (void)setSignedClinicalDataIssuerIdentifier:(id)a3;
- (void)setSyncIdentifier:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setUserEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableClinicalAccount

- (BOOL)hasGatewayExternalID
{
  return self->_gatewayExternalID != 0;
}

- (void)setUserEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_userEnabled = a3;
}

- (void)setHasUserEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasUserEnabled
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setCreationDate:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasCreationDate
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setModificationDate:(double)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_modificationDate = a3;
}

- (void)setHasModificationDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasModificationDate
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setLastFetchDate:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_lastFetchDate = a3;
}

- (void)setHasLastFetchDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasLastFetchDate
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasSyncIdentifier
{
  return self->_syncIdentifier != 0;
}

- (void)setLastFullFetchDate:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_lastFullFetchDate = a3;
}

- (void)setHasLastFullFetchDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasLastFullFetchDate
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasAccountIdentifier
{
  return self->_accountIdentifier != 0;
}

- (BOOL)hasPatientHash
{
  return self->_patientHash != 0;
}

- (BOOL)hasMessageVersion
{
  return self->_messageVersion != 0;
}

- (BOOL)hasSignedClinicalDataIssuerIdentifier
{
  return self->_signedClinicalDataIssuerIdentifier != 0;
}

- (void)setClinicalSharingFirstSharedDate:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_clinicalSharingFirstSharedDate = a3;
}

- (void)setHasClinicalSharingFirstSharedDate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasClinicalSharingFirstSharedDate
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setClinicalSharingLastSharedDate:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_clinicalSharingLastSharedDate = a3;
}

- (void)setHasClinicalSharingLastSharedDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasClinicalSharingLastSharedDate
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setClinicalSharingUserStatus:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_clinicalSharingUserStatus = a3;
}

- (void)setHasClinicalSharingUserStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasClinicalSharingUserStatus
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setClinicalSharingMultiDeviceStatus:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_clinicalSharingMultiDeviceStatus = a3;
}

- (void)setHasClinicalSharingMultiDeviceStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasClinicalSharingMultiDeviceStatus
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasClinicalSharingPrimaryDeviceName
{
  return self->_clinicalSharingPrimaryDeviceName != 0;
}

- (void)setLastFailedFetchDate:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_lastFailedFetchDate = a3;
}

- (void)setHasLastFailedFetchDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLastFailedFetchDate
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setFailedFetchAttemptsCount:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_failedFetchAttemptsCount = a3;
}

- (void)setHasFailedFetchAttemptsCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFailedFetchAttemptsCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasCredentialSyncIdentifier
{
  return self->_credentialSyncIdentifier != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableClinicalAccount;
  v4 = [(HDCodableClinicalAccount *)&v8 description];
  v5 = [(HDCodableClinicalAccount *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  gatewayExternalID = self->_gatewayExternalID;
  if (gatewayExternalID) {
    [v3 setObject:gatewayExternalID forKey:@"gatewayExternalID"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v25 = [NSNumber numberWithBool:self->_userEnabled];
    [v4 setObject:v25 forKey:@"userEnabled"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0) {
        goto LABEL_6;
      }
      goto LABEL_40;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  v26 = [NSNumber numberWithDouble:self->_creationDate];
  [v4 setObject:v26 forKey:@"creationDate"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_40:
  v27 = [NSNumber numberWithDouble:self->_modificationDate];
  [v4 setObject:v27 forKey:@"modificationDate"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    v7 = [NSNumber numberWithDouble:self->_lastFetchDate];
    [v4 setObject:v7 forKey:@"lastFetchDate"];
  }
LABEL_8:
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier) {
    [v4 setObject:syncIdentifier forKey:@"syncIdentifier"];
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v9 = [NSNumber numberWithDouble:self->_lastFullFetchDate];
    [v4 setObject:v9 forKey:@"lastFullFetchDate"];
  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier) {
    [v4 setObject:accountIdentifier forKey:@"accountIdentifier"];
  }
  patientHash = self->_patientHash;
  if (patientHash) {
    [v4 setObject:patientHash forKey:@"patientHash"];
  }
  messageVersion = self->_messageVersion;
  if (messageVersion)
  {
    v13 = [(HDCodableMessageVersion *)messageVersion dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"messageVersion"];
  }
  signedClinicalDataIssuerIdentifier = self->_signedClinicalDataIssuerIdentifier;
  if (signedClinicalDataIssuerIdentifier) {
    [v4 setObject:signedClinicalDataIssuerIdentifier forKey:@"signedClinicalDataIssuerIdentifier"];
  }
  __int16 v15 = (__int16)self->_has;
  if (v15)
  {
    v28 = [NSNumber numberWithDouble:self->_clinicalSharingFirstSharedDate];
    [v4 setObject:v28 forKey:@"clinicalSharingFirstSharedDate"];

    __int16 v15 = (__int16)self->_has;
    if ((v15 & 2) == 0)
    {
LABEL_22:
      if ((v15 & 8) == 0) {
        goto LABEL_23;
      }
      goto LABEL_44;
    }
  }
  else if ((v15 & 2) == 0)
  {
    goto LABEL_22;
  }
  v29 = [NSNumber numberWithDouble:self->_clinicalSharingLastSharedDate];
  [v4 setObject:v29 forKey:@"clinicalSharingLastSharedDate"];

  __int16 v15 = (__int16)self->_has;
  if ((v15 & 8) == 0)
  {
LABEL_23:
    if ((v15 & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_44:
  v30 = [NSNumber numberWithLongLong:self->_clinicalSharingUserStatus];
  [v4 setObject:v30 forKey:@"clinicalSharingUserStatus"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_24:
    v16 = [NSNumber numberWithLongLong:self->_clinicalSharingMultiDeviceStatus];
    [v4 setObject:v16 forKey:@"clinicalSharingMultiDeviceStatus"];
  }
LABEL_25:
  clinicalSharingPrimaryDeviceName = self->_clinicalSharingPrimaryDeviceName;
  if (clinicalSharingPrimaryDeviceName) {
    [v4 setObject:clinicalSharingPrimaryDeviceName forKey:@"clinicalSharingPrimaryDeviceName"];
  }
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x40) != 0)
  {
    v19 = [NSNumber numberWithDouble:self->_lastFailedFetchDate];
    [v4 setObject:v19 forKey:@"lastFailedFetchDate"];

    __int16 v18 = (__int16)self->_has;
  }
  if ((v18 & 0x20) != 0)
  {
    v20 = [NSNumber numberWithLongLong:self->_failedFetchAttemptsCount];
    [v4 setObject:v20 forKey:@"failedFetchAttemptsCount"];
  }
  credentialSyncIdentifier = self->_credentialSyncIdentifier;
  if (credentialSyncIdentifier) {
    [v4 setObject:credentialSyncIdentifier forKey:@"credentialSyncIdentifier"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v23 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v23 forKey:@"syncIdentity"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableClinicalAccountReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_gatewayExternalID)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0) {
        goto LABEL_6;
      }
      goto LABEL_40;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_40:
  PBDataWriterWriteDoubleField();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    PBDataWriterWriteDoubleField();
    id v4 = v8;
  }
LABEL_8:
  if (self->_syncIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v8;
  }
  if (self->_accountIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_patientHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_messageVersion)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  if (self->_signedClinicalDataIssuerIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if (v6)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v8;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_22:
      if ((v6 & 8) == 0) {
        goto LABEL_23;
      }
      goto LABEL_44;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_22;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v8;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_23:
    if ((v6 & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_44:
  PBDataWriterWriteInt64Field();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_24:
    PBDataWriterWriteInt64Field();
    id v4 = v8;
  }
LABEL_25:
  if (self->_clinicalSharingPrimaryDeviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v8;
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v8;
  }
  if (self->_credentialSyncIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v8;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_gatewayExternalID)
  {
    objc_msgSend(v4, "setGatewayExternalID:");
    id v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((unsigned char *)v4 + 160) = self->_userEnabled;
    *((_WORD *)v4 + 82) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0) {
        goto LABEL_6;
      }
      goto LABEL_40;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 5) = *(void *)&self->_creationDate;
  *((_WORD *)v4 + 82) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_40:
  *((void *)v4 + 10) = *(void *)&self->_modificationDate;
  *((_WORD *)v4 + 82) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    *((void *)v4 + 8) = *(void *)&self->_lastFetchDate;
    *((_WORD *)v4 + 82) |= 0x80u;
  }
LABEL_8:
  if (self->_syncIdentifier)
  {
    objc_msgSend(v8, "setSyncIdentifier:");
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((void *)v4 + 9) = *(void *)&self->_lastFullFetchDate;
    *((_WORD *)v4 + 82) |= 0x100u;
  }
  if (self->_accountIdentifier)
  {
    objc_msgSend(v8, "setAccountIdentifier:");
    id v4 = v8;
  }
  if (self->_patientHash)
  {
    objc_msgSend(v8, "setPatientHash:");
    id v4 = v8;
  }
  if (self->_messageVersion)
  {
    objc_msgSend(v8, "setMessageVersion:");
    id v4 = v8;
  }
  if (self->_signedClinicalDataIssuerIdentifier)
  {
    objc_msgSend(v8, "setSignedClinicalDataIssuerIdentifier:");
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if (v6)
  {
    *((void *)v4 + 1) = *(void *)&self->_clinicalSharingFirstSharedDate;
    *((_WORD *)v4 + 82) |= 1u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_22:
      if ((v6 & 8) == 0) {
        goto LABEL_23;
      }
      goto LABEL_44;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_22;
  }
  *((void *)v4 + 2) = *(void *)&self->_clinicalSharingLastSharedDate;
  *((_WORD *)v4 + 82) |= 2u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_23:
    if ((v6 & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_44:
  *((void *)v4 + 4) = self->_clinicalSharingUserStatus;
  *((_WORD *)v4 + 82) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_24:
    *((void *)v4 + 3) = self->_clinicalSharingMultiDeviceStatus;
    *((_WORD *)v4 + 82) |= 4u;
  }
LABEL_25:
  if (self->_clinicalSharingPrimaryDeviceName)
  {
    objc_msgSend(v8, "setClinicalSharingPrimaryDeviceName:");
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    *((void *)v4 + 7) = *(void *)&self->_lastFailedFetchDate;
    *((_WORD *)v4 + 82) |= 0x40u;
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x20) != 0)
  {
    *((void *)v4 + 6) = self->_failedFetchAttemptsCount;
    *((_WORD *)v4 + 82) |= 0x20u;
  }
  if (self->_credentialSyncIdentifier)
  {
    objc_msgSend(v8, "setCredentialSyncIdentifier:");
    id v4 = v8;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v8, "setSyncIdentity:");
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_gatewayExternalID copyWithZone:a3];
  __int16 v7 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 160) = self->_userEnabled;
    *(_WORD *)(v5 + 164) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 40) = self->_creationDate;
  *(_WORD *)(v5 + 164) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_20:
  *(double *)(v5 + 80) = self->_modificationDate;
  *(_WORD *)(v5 + 164) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_5:
    *(double *)(v5 + 64) = self->_lastFetchDate;
    *(_WORD *)(v5 + 164) |= 0x80u;
  }
LABEL_6:
  uint64_t v9 = [(NSData *)self->_syncIdentifier copyWithZone:a3];
  v10 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v9;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(double *)(v5 + 72) = self->_lastFullFetchDate;
    *(_WORD *)(v5 + 164) |= 0x100u;
  }
  uint64_t v11 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  v12 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v11;

  uint64_t v13 = [(NSString *)self->_patientHash copyWithZone:a3];
  v14 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v13;

  id v15 = [(HDCodableMessageVersion *)self->_messageVersion copyWithZone:a3];
  v16 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v15;

  uint64_t v17 = [(NSString *)self->_signedClinicalDataIssuerIdentifier copyWithZone:a3];
  __int16 v18 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v17;

  __int16 v19 = (__int16)self->_has;
  if (v19)
  {
    *(double *)(v5 + 8) = self->_clinicalSharingFirstSharedDate;
    *(_WORD *)(v5 + 164) |= 1u;
    __int16 v19 = (__int16)self->_has;
    if ((v19 & 2) == 0)
    {
LABEL_10:
      if ((v19 & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_24;
    }
  }
  else if ((v19 & 2) == 0)
  {
    goto LABEL_10;
  }
  *(double *)(v5 + 16) = self->_clinicalSharingLastSharedDate;
  *(_WORD *)(v5 + 164) |= 2u;
  __int16 v19 = (__int16)self->_has;
  if ((v19 & 8) == 0)
  {
LABEL_11:
    if ((v19 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_24:
  *(void *)(v5 + 32) = self->_clinicalSharingUserStatus;
  *(_WORD *)(v5 + 164) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    *(void *)(v5 + 24) = self->_clinicalSharingMultiDeviceStatus;
    *(_WORD *)(v5 + 164) |= 4u;
  }
LABEL_13:
  uint64_t v20 = [(NSString *)self->_clinicalSharingPrimaryDeviceName copyWithZone:a3];
  v21 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v20;

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x40) != 0)
  {
    *(double *)(v5 + 56) = self->_lastFailedFetchDate;
    *(_WORD *)(v5 + 164) |= 0x40u;
    __int16 v22 = (__int16)self->_has;
  }
  if ((v22 & 0x20) != 0)
  {
    *(void *)(v5 + 48) = self->_failedFetchAttemptsCount;
    *(_WORD *)(v5 + 164) |= 0x20u;
  }
  uint64_t v23 = [(NSData *)self->_credentialSyncIdentifier copyWithZone:a3];
  v24 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v23;

  id v25 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v26 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v25;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_80;
  }
  gatewayExternalID = self->_gatewayExternalID;
  if ((unint64_t)gatewayExternalID | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](gatewayExternalID, "isEqual:")) {
      goto LABEL_80;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 82);
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x400) == 0) {
      goto LABEL_80;
    }
    if (self->_userEnabled)
    {
      if (!*((unsigned char *)v4 + 160)) {
        goto LABEL_80;
      }
    }
    else if (*((unsigned char *)v4 + 160))
    {
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)v4 + 82) & 0x400) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_creationDate != *((double *)v4 + 5)) {
      goto LABEL_80;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x200) == 0 || self->_modificationDate != *((double *)v4 + 10)) {
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)v4 + 82) & 0x200) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_lastFetchDate != *((double *)v4 + 8)) {
      goto LABEL_80;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_80;
  }
  syncIdentifier = self->_syncIdentifier;
  if ((unint64_t)syncIdentifier | *((void *)v4 + 18))
  {
    if (!-[NSData isEqual:](syncIdentifier, "isEqual:")) {
      goto LABEL_80;
    }
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)v4 + 82);
  }
  if ((has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_lastFullFetchDate != *((double *)v4 + 9)) {
      goto LABEL_80;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_80;
  }
  accountIdentifier = self->_accountIdentifier;
  if ((unint64_t)accountIdentifier | *((void *)v4 + 11)
    && !-[NSString isEqual:](accountIdentifier, "isEqual:"))
  {
    goto LABEL_80;
  }
  patientHash = self->_patientHash;
  if ((unint64_t)patientHash | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](patientHash, "isEqual:")) {
      goto LABEL_80;
    }
  }
  messageVersion = self->_messageVersion;
  if ((unint64_t)messageVersion | *((void *)v4 + 15))
  {
    if (!-[HDCodableMessageVersion isEqual:](messageVersion, "isEqual:")) {
      goto LABEL_80;
    }
  }
  signedClinicalDataIssuerIdentifier = self->_signedClinicalDataIssuerIdentifier;
  if ((unint64_t)signedClinicalDataIssuerIdentifier | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](signedClinicalDataIssuerIdentifier, "isEqual:")) {
      goto LABEL_80;
    }
  }
  __int16 v13 = (__int16)self->_has;
  __int16 v14 = *((_WORD *)v4 + 82);
  if (v13)
  {
    if ((v14 & 1) == 0 || self->_clinicalSharingFirstSharedDate != *((double *)v4 + 1)) {
      goto LABEL_80;
    }
  }
  else if (v14)
  {
    goto LABEL_80;
  }
  if ((v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_clinicalSharingLastSharedDate != *((double *)v4 + 2)) {
      goto LABEL_80;
    }
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_80;
  }
  if ((v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_clinicalSharingUserStatus != *((void *)v4 + 4)) {
      goto LABEL_80;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_80;
  }
  if ((v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_clinicalSharingMultiDeviceStatus != *((void *)v4 + 3)) {
      goto LABEL_80;
    }
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_80;
  }
  clinicalSharingPrimaryDeviceName = self->_clinicalSharingPrimaryDeviceName;
  if ((unint64_t)clinicalSharingPrimaryDeviceName | *((void *)v4 + 12))
  {
    if (-[NSString isEqual:](clinicalSharingPrimaryDeviceName, "isEqual:"))
    {
      __int16 v13 = (__int16)self->_has;
      __int16 v14 = *((_WORD *)v4 + 82);
      goto LABEL_66;
    }
LABEL_80:
    char v18 = 0;
    goto LABEL_81;
  }
LABEL_66:
  if ((v13 & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0 || self->_lastFailedFetchDate != *((double *)v4 + 7)) {
      goto LABEL_80;
    }
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_80;
  }
  if ((v13 & 0x20) != 0)
  {
    if ((v14 & 0x20) == 0 || self->_failedFetchAttemptsCount != *((void *)v4 + 6)) {
      goto LABEL_80;
    }
  }
  else if ((v14 & 0x20) != 0)
  {
    goto LABEL_80;
  }
  credentialSyncIdentifier = self->_credentialSyncIdentifier;
  if ((unint64_t)credentialSyncIdentifier | *((void *)v4 + 13)
    && !-[NSData isEqual:](credentialSyncIdentifier, "isEqual:"))
  {
    goto LABEL_80;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 19)) {
    char v18 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  }
  else {
    char v18 = 1;
  }
LABEL_81:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v55 = [(NSString *)self->_gatewayExternalID hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    uint64_t v54 = 2654435761 * self->_userEnabled;
    if ((has & 0x10) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v54 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double creationDate = self->_creationDate;
  double v5 = -creationDate;
  if (creationDate >= 0.0) {
    double v5 = self->_creationDate;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  if ((has & 0x200) != 0)
  {
    double modificationDate = self->_modificationDate;
    double v11 = -modificationDate;
    if (modificationDate >= 0.0) {
      double v11 = self->_modificationDate;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  unint64_t v53 = v9;
  if ((has & 0x80) != 0)
  {
    double lastFetchDate = self->_lastFetchDate;
    double v16 = -lastFetchDate;
    if (lastFetchDate >= 0.0) {
      double v16 = self->_lastFetchDate;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  unint64_t v52 = v14;
  uint64_t v51 = [(NSData *)self->_syncIdentifier hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    double lastFullFetchDate = self->_lastFullFetchDate;
    double v21 = -lastFullFetchDate;
    if (lastFullFetchDate >= 0.0) {
      double v21 = self->_lastFullFetchDate;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  NSUInteger v50 = [(NSString *)self->_accountIdentifier hash];
  NSUInteger v49 = [(NSString *)self->_patientHash hash];
  unint64_t v48 = [(HDCodableMessageVersion *)self->_messageVersion hash];
  NSUInteger v47 = [(NSString *)self->_signedClinicalDataIssuerIdentifier hash];
  __int16 v24 = (__int16)self->_has;
  if (v24)
  {
    double clinicalSharingFirstSharedDate = self->_clinicalSharingFirstSharedDate;
    double v27 = -clinicalSharingFirstSharedDate;
    if (clinicalSharingFirstSharedDate >= 0.0) {
      double v27 = self->_clinicalSharingFirstSharedDate;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v25 += (unint64_t)v29;
      }
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    unint64_t v25 = 0;
  }
  if ((v24 & 2) != 0)
  {
    double clinicalSharingLastSharedDate = self->_clinicalSharingLastSharedDate;
    double v32 = -clinicalSharingLastSharedDate;
    if (clinicalSharingLastSharedDate >= 0.0) {
      double v32 = self->_clinicalSharingLastSharedDate;
    }
    long double v33 = floor(v32 + 0.5);
    double v34 = (v32 - v33) * 1.84467441e19;
    unint64_t v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0) {
        v30 += (unint64_t)v34;
      }
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    unint64_t v30 = 0;
  }
  if ((v24 & 8) != 0)
  {
    uint64_t v35 = 2654435761 * self->_clinicalSharingUserStatus;
    if ((v24 & 4) != 0) {
      goto LABEL_53;
    }
  }
  else
  {
    uint64_t v35 = 0;
    if ((v24 & 4) != 0)
    {
LABEL_53:
      uint64_t v36 = 2654435761 * self->_clinicalSharingMultiDeviceStatus;
      goto LABEL_56;
    }
  }
  uint64_t v36 = 0;
LABEL_56:
  NSUInteger v37 = [(NSString *)self->_clinicalSharingPrimaryDeviceName hash];
  __int16 v38 = (__int16)self->_has;
  if ((v38 & 0x40) != 0)
  {
    double lastFailedFetchDate = self->_lastFailedFetchDate;
    double v41 = -lastFailedFetchDate;
    if (lastFailedFetchDate >= 0.0) {
      double v41 = self->_lastFailedFetchDate;
    }
    long double v42 = floor(v41 + 0.5);
    double v43 = (v41 - v42) * 1.84467441e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  if ((v38 & 0x20) != 0) {
    uint64_t v44 = 2654435761 * self->_failedFetchAttemptsCount;
  }
  else {
    uint64_t v44 = 0;
  }
  uint64_t v45 = v54 ^ v55 ^ v8 ^ v53 ^ v52 ^ v51 ^ v19 ^ v50 ^ v49 ^ v48 ^ v47 ^ v25 ^ v30 ^ v35 ^ v36 ^ v37 ^ v39 ^ v44 ^ [(NSData *)self->_credentialSyncIdentifier hash];
  return v45 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (*((void *)v4 + 14))
  {
    -[HDCodableClinicalAccount setGatewayExternalID:](self, "setGatewayExternalID:");
    id v4 = v12;
  }
  __int16 v5 = *((_WORD *)v4 + 82);
  if ((v5 & 0x400) != 0)
  {
    self->_userEnabled = *((unsigned char *)v4 + 160);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v5 = *((_WORD *)v4 + 82);
    if ((v5 & 0x10) == 0)
    {
LABEL_5:
      if ((v5 & 0x200) == 0) {
        goto LABEL_6;
      }
      goto LABEL_21;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_5;
  }
  self->_double creationDate = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 82);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_21:
  self->_double modificationDate = *((double *)v4 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 82) & 0x80) != 0)
  {
LABEL_7:
    self->_double lastFetchDate = *((double *)v4 + 8);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_8:
  if (*((void *)v4 + 18))
  {
    -[HDCodableClinicalAccount setSyncIdentifier:](self, "setSyncIdentifier:");
    id v4 = v12;
  }
  if ((*((_WORD *)v4 + 82) & 0x100) != 0)
  {
    self->_double lastFullFetchDate = *((double *)v4 + 9);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v4 + 11))
  {
    -[HDCodableClinicalAccount setAccountIdentifier:](self, "setAccountIdentifier:");
    id v4 = v12;
  }
  if (*((void *)v4 + 16))
  {
    -[HDCodableClinicalAccount setPatientHash:](self, "setPatientHash:");
    id v4 = v12;
  }
  messageVersion = self->_messageVersion;
  uint64_t v7 = *((void *)v4 + 15);
  if (messageVersion)
  {
    if (!v7) {
      goto LABEL_26;
    }
    -[HDCodableMessageVersion mergeFrom:](messageVersion, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_26;
    }
    -[HDCodableClinicalAccount setMessageVersion:](self, "setMessageVersion:");
  }
  id v4 = v12;
LABEL_26:
  if (*((void *)v4 + 17))
  {
    -[HDCodableClinicalAccount setSignedClinicalDataIssuerIdentifier:](self, "setSignedClinicalDataIssuerIdentifier:");
    id v4 = v12;
  }
  __int16 v8 = *((_WORD *)v4 + 82);
  if (v8)
  {
    self->_double clinicalSharingFirstSharedDate = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v8 = *((_WORD *)v4 + 82);
    if ((v8 & 2) == 0)
    {
LABEL_30:
      if ((v8 & 8) == 0) {
        goto LABEL_31;
      }
      goto LABEL_46;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_30;
  }
  self->_double clinicalSharingLastSharedDate = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v8 = *((_WORD *)v4 + 82);
  if ((v8 & 8) == 0)
  {
LABEL_31:
    if ((v8 & 4) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_46:
  self->_clinicalSharingUserStatus = *((void *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 82) & 4) != 0)
  {
LABEL_32:
    self->_clinicalSharingMultiDeviceStatus = *((void *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_33:
  if (*((void *)v4 + 12))
  {
    -[HDCodableClinicalAccount setClinicalSharingPrimaryDeviceName:](self, "setClinicalSharingPrimaryDeviceName:");
    id v4 = v12;
  }
  __int16 v9 = *((_WORD *)v4 + 82);
  if ((v9 & 0x40) != 0)
  {
    self->_double lastFailedFetchDate = *((double *)v4 + 7);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v9 = *((_WORD *)v4 + 82);
  }
  if ((v9 & 0x20) != 0)
  {
    self->_failedFetchAttemptsCount = *((void *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 13))
  {
    -[HDCodableClinicalAccount setCredentialSyncIdentifier:](self, "setCredentialSyncIdentifier:");
    id v4 = v12;
  }
  syncIdentity = self->_syncIdentity;
  uint64_t v11 = *((void *)v4 + 19);
  if (syncIdentity)
  {
    if (!v11) {
      goto LABEL_51;
    }
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_51;
    }
    -[HDCodableClinicalAccount setSyncIdentity:](self, "setSyncIdentity:");
  }
  id v4 = v12;
LABEL_51:
}

- (NSString)gatewayExternalID
{
  return self->_gatewayExternalID;
}

- (void)setGatewayExternalID:(id)a3
{
}

- (BOOL)userEnabled
{
  return self->_userEnabled;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (double)lastFetchDate
{
  return self->_lastFetchDate;
}

- (NSData)syncIdentifier
{
  return self->_syncIdentifier;
}

- (void)setSyncIdentifier:(id)a3
{
}

- (double)lastFullFetchDate
{
  return self->_lastFullFetchDate;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)patientHash
{
  return self->_patientHash;
}

- (void)setPatientHash:(id)a3
{
}

- (HDCodableMessageVersion)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
}

- (NSString)signedClinicalDataIssuerIdentifier
{
  return self->_signedClinicalDataIssuerIdentifier;
}

- (void)setSignedClinicalDataIssuerIdentifier:(id)a3
{
}

- (double)clinicalSharingFirstSharedDate
{
  return self->_clinicalSharingFirstSharedDate;
}

- (double)clinicalSharingLastSharedDate
{
  return self->_clinicalSharingLastSharedDate;
}

- (int64_t)clinicalSharingUserStatus
{
  return self->_clinicalSharingUserStatus;
}

- (int64_t)clinicalSharingMultiDeviceStatus
{
  return self->_clinicalSharingMultiDeviceStatus;
}

- (NSString)clinicalSharingPrimaryDeviceName
{
  return self->_clinicalSharingPrimaryDeviceName;
}

- (void)setClinicalSharingPrimaryDeviceName:(id)a3
{
}

- (double)lastFailedFetchDate
{
  return self->_lastFailedFetchDate;
}

- (int64_t)failedFetchAttemptsCount
{
  return self->_failedFetchAttemptsCount;
}

- (NSData)credentialSyncIdentifier
{
  return self->_credentialSyncIdentifier;
}

- (void)setCredentialSyncIdentifier:(id)a3
{
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_signedClinicalDataIssuerIdentifier, 0);
  objc_storeStrong((id *)&self->_patientHash, 0);
  objc_storeStrong((id *)&self->_messageVersion, 0);
  objc_storeStrong((id *)&self->_gatewayExternalID, 0);
  objc_storeStrong((id *)&self->_credentialSyncIdentifier, 0);
  objc_storeStrong((id *)&self->_clinicalSharingPrimaryDeviceName, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end