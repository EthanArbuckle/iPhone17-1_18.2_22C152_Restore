@interface HDCodableFHIRCredential
- (BOOL)deleted;
- (BOOL)hasAccountSyncIdentifier;
- (BOOL)hasDeleted;
- (BOOL)hasExpirationDate;
- (BOOL)hasIdentifier;
- (BOOL)hasMessageVersion;
- (BOOL)hasPatientID;
- (BOOL)hasReceivedDate;
- (BOOL)hasRequestedScopeString;
- (BOOL)hasScopeString;
- (BOOL)hasSyncIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableMessageVersion)messageVersion;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)accountSyncIdentifier;
- (NSData)identifier;
- (NSString)patientID;
- (NSString)requestedScopeString;
- (NSString)scopeString;
- (double)expirationDate;
- (double)receivedDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountSyncIdentifier:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setExpirationDate:(double)a3;
- (void)setHasDeleted:(BOOL)a3;
- (void)setHasExpirationDate:(BOOL)a3;
- (void)setHasReceivedDate:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setMessageVersion:(id)a3;
- (void)setPatientID:(id)a3;
- (void)setReceivedDate:(double)a3;
- (void)setRequestedScopeString:(id)a3;
- (void)setScopeString:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableFHIRCredential

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasAccountSyncIdentifier
{
  return self->_accountSyncIdentifier != 0;
}

- (BOOL)hasScopeString
{
  return self->_scopeString != 0;
}

- (BOOL)hasRequestedScopeString
{
  return self->_requestedScopeString != 0;
}

- (BOOL)hasPatientID
{
  return self->_patientID != 0;
}

- (void)setReceivedDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_receivedDate = a3;
}

- (void)setHasReceivedDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReceivedDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setExpirationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_expirationDate = a3;
}

- (void)setHasExpirationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpirationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeleted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasMessageVersion
{
  return self->_messageVersion != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableFHIRCredential;
  v4 = [(HDCodableFHIRCredential *)&v8 description];
  v5 = [(HDCodableFHIRCredential *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  accountSyncIdentifier = self->_accountSyncIdentifier;
  if (accountSyncIdentifier) {
    [v4 setObject:accountSyncIdentifier forKey:@"accountSyncIdentifier"];
  }
  scopeString = self->_scopeString;
  if (scopeString) {
    [v4 setObject:scopeString forKey:@"scopeString"];
  }
  requestedScopeString = self->_requestedScopeString;
  if (requestedScopeString) {
    [v4 setObject:requestedScopeString forKey:@"requestedScopeString"];
  }
  patientID = self->_patientID;
  if (patientID) {
    [v4 setObject:patientID forKey:@"patientID"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v17 = [NSNumber numberWithDouble:self->_receivedDate];
    [v4 setObject:v17 forKey:@"receivedDate"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_13;
  }
  v18 = [NSNumber numberWithDouble:self->_expirationDate];
  [v4 setObject:v18 forKey:@"expirationDate"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_14:
    v11 = [NSNumber numberWithBool:self->_deleted];
    [v4 setObject:v11 forKey:@"deleted"];
  }
LABEL_15:
  messageVersion = self->_messageVersion;
  if (messageVersion)
  {
    v13 = [(HDCodableMessageVersion *)messageVersion dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"messageVersion"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v15 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v15 forKey:@"syncIdentity"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableFHIRCredentialReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_accountSyncIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_scopeString)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_requestedScopeString)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_patientID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_14:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_15:
  if (self->_messageVersion)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v6;
  }
  if (self->_accountSyncIdentifier)
  {
    objc_msgSend(v6, "setAccountSyncIdentifier:");
    id v4 = v6;
  }
  if (self->_scopeString)
  {
    objc_msgSend(v6, "setScopeString:");
    id v4 = v6;
  }
  if (self->_requestedScopeString)
  {
    objc_msgSend(v6, "setRequestedScopeString:");
    id v4 = v6;
  }
  if (self->_patientID)
  {
    objc_msgSend(v6, "setPatientID:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_receivedDate;
    *((unsigned char *)v4 + 84) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_13;
  }
  *((void *)v4 + 1) = *(void *)&self->_expirationDate;
  *((unsigned char *)v4 + 84) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_14:
    *((unsigned char *)v4 + 80) = self->_deleted;
    *((unsigned char *)v4 + 84) |= 4u;
  }
LABEL_15:
  if (self->_messageVersion)
  {
    objc_msgSend(v6, "setMessageVersion:");
    id v4 = v6;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v6, "setSyncIdentity:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSData *)self->_accountSyncIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_scopeString copyWithZone:a3];
  v11 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v10;

  uint64_t v12 = [(NSString *)self->_requestedScopeString copyWithZone:a3];
  v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  uint64_t v14 = [(NSString *)self->_patientID copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(double *)(v5 + 8) = self->_expirationDate;
    *(unsigned char *)(v5 + 84) |= 1u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(double *)(v5 + 16) = self->_receivedDate;
  *(unsigned char *)(v5 + 84) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 80) = self->_deleted;
    *(unsigned char *)(v5 + 84) |= 4u;
  }
LABEL_5:
  id v17 = [(HDCodableMessageVersion *)self->_messageVersion copyWithZone:a3];
  v18 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v17;

  id v19 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v20 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v19;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](identifier, "isEqual:")) {
      goto LABEL_34;
    }
  }
  accountSyncIdentifier = self->_accountSyncIdentifier;
  if ((unint64_t)accountSyncIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](accountSyncIdentifier, "isEqual:")) {
      goto LABEL_34;
    }
  }
  scopeString = self->_scopeString;
  if ((unint64_t)scopeString | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](scopeString, "isEqual:")) {
      goto LABEL_34;
    }
  }
  requestedScopeString = self->_requestedScopeString;
  if ((unint64_t)requestedScopeString | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](requestedScopeString, "isEqual:")) {
      goto LABEL_34;
    }
  }
  patientID = self->_patientID;
  if ((unint64_t)patientID | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](patientID, "isEqual:")) {
      goto LABEL_34;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) == 0 || self->_receivedDate != *((double *)v4 + 2)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 2) != 0)
  {
    goto LABEL_34;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_expirationDate != *((double *)v4 + 1)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 4) != 0)
    {
      if (self->_deleted)
      {
        if (!*((unsigned char *)v4 + 80)) {
          goto LABEL_34;
        }
        goto LABEL_30;
      }
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_30;
      }
    }
LABEL_34:
    char v12 = 0;
    goto LABEL_35;
  }
  if ((*((unsigned char *)v4 + 84) & 4) != 0) {
    goto LABEL_34;
  }
LABEL_30:
  messageVersion = self->_messageVersion;
  if ((unint64_t)messageVersion | *((void *)v4 + 5)
    && !-[HDCodableMessageVersion isEqual:](messageVersion, "isEqual:"))
  {
    goto LABEL_34;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 9)) {
    char v12 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_35:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_identifier hash];
  uint64_t v4 = [(NSData *)self->_accountSyncIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_scopeString hash];
  NSUInteger v6 = [(NSString *)self->_requestedScopeString hash];
  NSUInteger v7 = [(NSString *)self->_patientID hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double receivedDate = self->_receivedDate;
    double v11 = -receivedDate;
    if (receivedDate >= 0.0) {
      double v11 = self->_receivedDate;
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
  if (has)
  {
    double expirationDate = self->_expirationDate;
    double v16 = -expirationDate;
    if (expirationDate >= 0.0) {
      double v16 = self->_expirationDate;
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
  if ((has & 4) != 0) {
    uint64_t v19 = 2654435761 * self->_deleted;
  }
  else {
    uint64_t v19 = 0;
  }
  NSUInteger v20 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v14;
  unint64_t v21 = v19 ^ [(HDCodableMessageVersion *)self->_messageVersion hash];
  return v20 ^ v21 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (*((void *)v4 + 4))
  {
    -[HDCodableFHIRCredential setIdentifier:](self, "setIdentifier:");
    id v4 = v10;
  }
  if (*((void *)v4 + 3))
  {
    -[HDCodableFHIRCredential setAccountSyncIdentifier:](self, "setAccountSyncIdentifier:");
    id v4 = v10;
  }
  if (*((void *)v4 + 8))
  {
    -[HDCodableFHIRCredential setScopeString:](self, "setScopeString:");
    id v4 = v10;
  }
  if (*((void *)v4 + 7))
  {
    -[HDCodableFHIRCredential setRequestedScopeString:](self, "setRequestedScopeString:");
    id v4 = v10;
  }
  if (*((void *)v4 + 6))
  {
    -[HDCodableFHIRCredential setPatientID:](self, "setPatientID:");
    id v4 = v10;
  }
  char v5 = *((unsigned char *)v4 + 84);
  if ((v5 & 2) != 0)
  {
    self->_double receivedDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 84);
    if ((v5 & 1) == 0)
    {
LABEL_13:
      if ((v5 & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 1) == 0)
  {
    goto LABEL_13;
  }
  self->_double expirationDate = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 84) & 4) != 0)
  {
LABEL_14:
    self->_deleted = *((unsigned char *)v4 + 80);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_15:
  messageVersion = self->_messageVersion;
  uint64_t v7 = *((void *)v4 + 5);
  if (messageVersion)
  {
    if (!v7) {
      goto LABEL_24;
    }
    -[HDCodableMessageVersion mergeFrom:](messageVersion, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_24;
    }
    -[HDCodableFHIRCredential setMessageVersion:](self, "setMessageVersion:");
  }
  id v4 = v10;
LABEL_24:
  syncIdentity = self->_syncIdentity;
  uint64_t v9 = *((void *)v4 + 9);
  if (syncIdentity)
  {
    if (!v9) {
      goto LABEL_30;
    }
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_30;
    }
    -[HDCodableFHIRCredential setSyncIdentity:](self, "setSyncIdentity:");
  }
  id v4 = v10;
LABEL_30:
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)accountSyncIdentifier
{
  return self->_accountSyncIdentifier;
}

- (void)setAccountSyncIdentifier:(id)a3
{
}

- (NSString)scopeString
{
  return self->_scopeString;
}

- (void)setScopeString:(id)a3
{
}

- (NSString)requestedScopeString
{
  return self->_requestedScopeString;
}

- (void)setRequestedScopeString:(id)a3
{
}

- (NSString)patientID
{
  return self->_patientID;
}

- (void)setPatientID:(id)a3
{
}

- (double)receivedDate
{
  return self->_receivedDate;
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (HDCodableMessageVersion)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
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
  objc_storeStrong((id *)&self->_scopeString, 0);
  objc_storeStrong((id *)&self->_requestedScopeString, 0);
  objc_storeStrong((id *)&self->_patientID, 0);
  objc_storeStrong((id *)&self->_messageVersion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_accountSyncIdentifier, 0);
}

@end