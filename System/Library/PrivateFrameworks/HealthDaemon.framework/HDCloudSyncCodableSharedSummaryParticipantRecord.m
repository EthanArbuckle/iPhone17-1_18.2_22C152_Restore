@interface HDCloudSyncCodableSharedSummaryParticipantRecord
+ (Class)allContactIdentifiersType;
- (BOOL)hasAuthorizationRecordIdentifier;
- (BOOL)hasCloudKitIdentifier;
- (BOOL)hasContactIdentifier;
- (BOOL)hasDirection;
- (BOOL)hasEntryAcceptanceDate;
- (BOOL)hasEntryInvitationDate;
- (BOOL)hasEntryModificationDate;
- (BOOL)hasFirstName;
- (BOOL)hasInvitationUUID;
- (BOOL)hasLastName;
- (BOOL)hasNotificationStatus;
- (BOOL)hasOwnerParticipant;
- (BOOL)hasSetupMetadata;
- (BOOL)hasStatus;
- (BOOL)hasType;
- (BOOL)hasUserWheelchairMode;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)ownerParticipant;
- (NSData)setupMetadata;
- (NSMutableArray)allContactIdentifiers;
- (NSString)authorizationRecordIdentifier;
- (NSString)cloudKitIdentifier;
- (NSString)contactIdentifier;
- (NSString)firstName;
- (NSString)invitationUUID;
- (NSString)lastName;
- (NSString)uuid;
- (double)entryAcceptanceDate;
- (double)entryInvitationDate;
- (double)entryModificationDate;
- (id)allContactIdentifiersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)direction;
- (int64_t)notificationStatus;
- (int64_t)status;
- (int64_t)type;
- (int64_t)userWheelchairMode;
- (unint64_t)allContactIdentifiersCount;
- (unint64_t)hash;
- (void)addAllContactIdentifiers:(id)a3;
- (void)clearAllContactIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllContactIdentifiers:(id)a3;
- (void)setAuthorizationRecordIdentifier:(id)a3;
- (void)setCloudKitIdentifier:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setEntryAcceptanceDate:(double)a3;
- (void)setEntryInvitationDate:(double)a3;
- (void)setEntryModificationDate:(double)a3;
- (void)setFirstName:(id)a3;
- (void)setHasDirection:(BOOL)a3;
- (void)setHasEntryAcceptanceDate:(BOOL)a3;
- (void)setHasEntryInvitationDate:(BOOL)a3;
- (void)setHasEntryModificationDate:(BOOL)a3;
- (void)setHasNotificationStatus:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasUserWheelchairMode:(BOOL)a3;
- (void)setInvitationUUID:(id)a3;
- (void)setLastName:(id)a3;
- (void)setNotificationStatus:(int64_t)a3;
- (void)setOwnerParticipant:(id)a3;
- (void)setSetupMetadata:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setUserWheelchairMode:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCloudSyncCodableSharedSummaryParticipantRecord

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasContactIdentifier
{
  return self->_contactIdentifier != 0;
}

- (BOOL)hasAuthorizationRecordIdentifier
{
  return self->_authorizationRecordIdentifier != 0;
}

- (BOOL)hasCloudKitIdentifier
{
  return self->_cloudKitIdentifier != 0;
}

- (BOOL)hasInvitationUUID
{
  return self->_invitationUUID != 0;
}

- (BOOL)hasFirstName
{
  return self->_firstName != 0;
}

- (BOOL)hasLastName
{
  return self->_lastName != 0;
}

- (void)clearAllContactIdentifiers
{
}

- (void)addAllContactIdentifiers:(id)a3
{
  id v4 = a3;
  allContactIdentifiers = self->_allContactIdentifiers;
  id v8 = v4;
  if (!allContactIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_allContactIdentifiers;
    self->_allContactIdentifiers = v6;

    id v4 = v8;
    allContactIdentifiers = self->_allContactIdentifiers;
  }
  [(NSMutableArray *)allContactIdentifiers addObject:v4];
}

- (unint64_t)allContactIdentifiersCount
{
  return [(NSMutableArray *)self->_allContactIdentifiers count];
}

- (id)allContactIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_allContactIdentifiers objectAtIndex:a3];
}

+ (Class)allContactIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)setType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setDirection:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_direction = a3;
}

- (void)setHasDirection:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDirection
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStatus:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setNotificationStatus:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_notificationStatus = a3;
}

- (void)setHasNotificationStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNotificationStatus
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setEntryModificationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_entryModificationDate = a3;
}

- (void)setHasEntryModificationDate:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEntryModificationDate
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEntryInvitationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_entryInvitationDate = a3;
}

- (void)setHasEntryInvitationDate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEntryInvitationDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEntryAcceptanceDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_entryAcceptanceDate = a3;
}

- (void)setHasEntryAcceptanceDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEntryAcceptanceDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasOwnerParticipant
{
  return self->_ownerParticipant != 0;
}

- (BOOL)hasSetupMetadata
{
  return self->_setupMetadata != 0;
}

- (void)setUserWheelchairMode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_userWheelchairMode = a3;
}

- (void)setHasUserWheelchairMode:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasUserWheelchairMode
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableSharedSummaryParticipantRecord;
  id v4 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)&v8 description];
  v5 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  contactIdentifier = self->_contactIdentifier;
  if (contactIdentifier) {
    [v4 setObject:contactIdentifier forKey:@"contactIdentifier"];
  }
  authorizationRecordIdentifier = self->_authorizationRecordIdentifier;
  if (authorizationRecordIdentifier) {
    [v4 setObject:authorizationRecordIdentifier forKey:@"authorizationRecordIdentifier"];
  }
  cloudKitIdentifier = self->_cloudKitIdentifier;
  if (cloudKitIdentifier) {
    [v4 setObject:cloudKitIdentifier forKey:@"cloudKitIdentifier"];
  }
  invitationUUID = self->_invitationUUID;
  if (invitationUUID) {
    [v4 setObject:invitationUUID forKey:@"invitationUUID"];
  }
  firstName = self->_firstName;
  if (firstName) {
    [v4 setObject:firstName forKey:@"firstName"];
  }
  lastName = self->_lastName;
  if (lastName) {
    [v4 setObject:lastName forKey:@"lastName"];
  }
  allContactIdentifiers = self->_allContactIdentifiers;
  if (allContactIdentifiers) {
    [v4 setObject:allContactIdentifiers forKey:@"allContactIdentifiers"];
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v19 = [NSNumber numberWithLongLong:self->_type];
    [v4 setObject:v19 forKey:@"type"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_19:
      if ((has & 0x20) == 0) {
        goto LABEL_20;
      }
      goto LABEL_36;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_19;
  }
  v20 = [NSNumber numberWithLongLong:self->_direction];
  [v4 setObject:v20 forKey:@"direction"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_20:
    if ((has & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_37;
  }
LABEL_36:
  v21 = [NSNumber numberWithLongLong:self->_status];
  [v4 setObject:v21 forKey:@"status"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_21:
    if ((has & 8) == 0) {
      goto LABEL_22;
    }
    goto LABEL_38;
  }
LABEL_37:
  v22 = [NSNumber numberWithLongLong:self->_notificationStatus];
  [v4 setObject:v22 forKey:@"notificationStatus"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_22:
    if ((has & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_39;
  }
LABEL_38:
  v23 = [NSNumber numberWithDouble:self->_entryModificationDate];
  [v4 setObject:v23 forKey:@"entryModificationDate"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_23:
    if ((has & 2) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_39:
  v24 = [NSNumber numberWithDouble:self->_entryInvitationDate];
  [v4 setObject:v24 forKey:@"entryInvitationDate"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_24:
    v14 = [NSNumber numberWithDouble:self->_entryAcceptanceDate];
    [v4 setObject:v14 forKey:@"entryAcceptanceDate"];
  }
LABEL_25:
  ownerParticipant = self->_ownerParticipant;
  if (ownerParticipant) {
    [v4 setObject:ownerParticipant forKey:@"ownerParticipant"];
  }
  setupMetadata = self->_setupMetadata;
  if (setupMetadata) {
    [v4 setObject:setupMetadata forKey:@"setupMetadata"];
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    v17 = [NSNumber numberWithLongLong:self->_userWheelchairMode];
    [v4 setObject:v17 forKey:@"userWheelchairMode"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableSharedSummaryParticipantRecordReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_contactIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_authorizationRecordIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_cloudKitIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_invitationUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_firstName) {
    PBDataWriterWriteStringField();
  }
  if (self->_lastName) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_allContactIdentifiers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_24:
      if ((has & 0x20) == 0) {
        goto LABEL_25;
      }
      goto LABEL_39;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_24;
  }
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_25:
    if ((has & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_26:
    if ((has & 8) == 0) {
      goto LABEL_27;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_27:
    if ((has & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_28:
    if ((has & 2) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_42:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_29:
  }
    PBDataWriterWriteDoubleField();
LABEL_30:
  if (self->_ownerParticipant) {
    PBDataWriterWriteDataField();
  }
  if (self->_setupMetadata) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    PBDataWriterWriteInt64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v10 = a3;
  if (self->_uuid) {
    objc_msgSend(v10, "setUuid:");
  }
  if (self->_contactIdentifier) {
    objc_msgSend(v10, "setContactIdentifier:");
  }
  if (self->_authorizationRecordIdentifier) {
    objc_msgSend(v10, "setAuthorizationRecordIdentifier:");
  }
  if (self->_cloudKitIdentifier) {
    objc_msgSend(v10, "setCloudKitIdentifier:");
  }
  if (self->_invitationUUID) {
    objc_msgSend(v10, "setInvitationUUID:");
  }
  if (self->_firstName) {
    objc_msgSend(v10, "setFirstName:");
  }
  if (self->_lastName) {
    objc_msgSend(v10, "setLastName:");
  }
  if ([(HDCloudSyncCodableSharedSummaryParticipantRecord *)self allContactIdentifiersCount])
  {
    [v10 clearAllContactIdentifiers];
    unint64_t v4 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self allContactIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self allContactIdentifiersAtIndex:i];
        [v10 addAllContactIdentifiers:v7];
      }
    }
  }
  char has = (char)self->_has;
  v9 = v10;
  if ((has & 0x40) != 0)
  {
    *((void *)v10 + 7) = self->_type;
    *((unsigned char *)v10 + 152) |= 0x40u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_21:
      if ((has & 0x20) == 0) {
        goto LABEL_22;
      }
      goto LABEL_38;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_21;
  }
  *((void *)v10 + 1) = self->_direction;
  *((unsigned char *)v10 + 152) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_22:
    if ((has & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)v10 + 6) = self->_status;
  *((unsigned char *)v10 + 152) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_23:
    if ((has & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)v10 + 5) = self->_notificationStatus;
  *((unsigned char *)v10 + 152) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_24:
    if ((has & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)v10 + 4) = *(void *)&self->_entryModificationDate;
  *((unsigned char *)v10 + 152) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_25:
    if ((has & 2) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_41:
  *((void *)v10 + 3) = *(void *)&self->_entryInvitationDate;
  *((unsigned char *)v10 + 152) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_26:
    *((void *)v10 + 2) = *(void *)&self->_entryAcceptanceDate;
    *((unsigned char *)v10 + 152) |= 2u;
  }
LABEL_27:
  if (self->_ownerParticipant)
  {
    objc_msgSend(v10, "setOwnerParticipant:");
    v9 = v10;
  }
  if (self->_setupMetadata)
  {
    objc_msgSend(v10, "setSetupMetadata:");
    v9 = v10;
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    v9[8] = self->_userWheelchairMode;
    *((unsigned char *)v9 + 152) |= 0x80u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuid copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v6;

  uint64_t v8 = [(NSString *)self->_contactIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v8;

  uint64_t v10 = [(NSString *)self->_authorizationRecordIdentifier copyWithZone:a3];
  long long v11 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v10;

  uint64_t v12 = [(NSString *)self->_cloudKitIdentifier copyWithZone:a3];
  long long v13 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v12;

  uint64_t v14 = [(NSString *)self->_invitationUUID copyWithZone:a3];
  v15 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v14;

  uint64_t v16 = [(NSString *)self->_firstName copyWithZone:a3];
  v17 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v16;

  uint64_t v18 = [(NSString *)self->_lastName copyWithZone:a3];
  v19 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v18;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v20 = self->_allContactIdentifiers;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "copyWithZone:", a3, (void)v32);
        [(id)v5 addAllContactIdentifiers:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v22);
  }

  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *(void *)(v5 + 56) = self->_type;
    *(unsigned char *)(v5 + 152) |= 0x40u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_10:
      if ((has & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_10;
  }
  *(void *)(v5 + 8) = self->_direction;
  *(unsigned char *)(v5 + 152) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(void *)(v5 + 48) = self->_status;
  *(unsigned char *)(v5 + 152) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(void *)(v5 + 40) = self->_notificationStatus;
  *(unsigned char *)(v5 + 152) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(double *)(v5 + 32) = self->_entryModificationDate;
  *(unsigned char *)(v5 + 152) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_24:
  *(double *)(v5 + 24) = self->_entryInvitationDate;
  *(unsigned char *)(v5 + 152) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_15:
    *(double *)(v5 + 16) = self->_entryAcceptanceDate;
    *(unsigned char *)(v5 + 152) |= 2u;
  }
LABEL_16:
  uint64_t v27 = -[NSData copyWithZone:](self->_ownerParticipant, "copyWithZone:", a3, (void)v32);
  v28 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v27;

  uint64_t v29 = [(NSData *)self->_setupMetadata copyWithZone:a3];
  v30 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v29;

  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *(void *)(v5 + 64) = self->_userWheelchairMode;
    *(unsigned char *)(v5 + 152) |= 0x80u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_62;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:")) {
      goto LABEL_62;
    }
  }
  contactIdentifier = self->_contactIdentifier;
  if ((unint64_t)contactIdentifier | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](contactIdentifier, "isEqual:")) {
      goto LABEL_62;
    }
  }
  authorizationRecordIdentifier = self->_authorizationRecordIdentifier;
  if ((unint64_t)authorizationRecordIdentifier | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](authorizationRecordIdentifier, "isEqual:")) {
      goto LABEL_62;
    }
  }
  cloudKitIdentifier = self->_cloudKitIdentifier;
  if ((unint64_t)cloudKitIdentifier | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](cloudKitIdentifier, "isEqual:")) {
      goto LABEL_62;
    }
  }
  invitationUUID = self->_invitationUUID;
  if ((unint64_t)invitationUUID | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](invitationUUID, "isEqual:")) {
      goto LABEL_62;
    }
  }
  firstName = self->_firstName;
  if ((unint64_t)firstName | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](firstName, "isEqual:")) {
      goto LABEL_62;
    }
  }
  lastName = self->_lastName;
  if ((unint64_t)lastName | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](lastName, "isEqual:")) {
      goto LABEL_62;
    }
  }
  allContactIdentifiers = self->_allContactIdentifiers;
  if ((unint64_t)allContactIdentifiers | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](allContactIdentifiers, "isEqual:")) {
      goto LABEL_62;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[152] & 0x40) == 0 || self->_type != *((void *)v4 + 7)) {
      goto LABEL_62;
    }
  }
  else if ((v4[152] & 0x40) != 0)
  {
LABEL_62:
    BOOL v16 = 0;
    goto LABEL_63;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[152] & 1) == 0 || self->_direction != *((void *)v4 + 1)) {
      goto LABEL_62;
    }
  }
  else if (v4[152])
  {
    goto LABEL_62;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v4[152] & 0x20) == 0 || self->_status != *((void *)v4 + 6)) {
      goto LABEL_62;
    }
  }
  else if ((v4[152] & 0x20) != 0)
  {
    goto LABEL_62;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[152] & 0x10) == 0 || self->_notificationStatus != *((void *)v4 + 5)) {
      goto LABEL_62;
    }
  }
  else if ((v4[152] & 0x10) != 0)
  {
    goto LABEL_62;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[152] & 8) == 0 || self->_entryModificationDate != *((double *)v4 + 4)) {
      goto LABEL_62;
    }
  }
  else if ((v4[152] & 8) != 0)
  {
    goto LABEL_62;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[152] & 4) == 0 || self->_entryInvitationDate != *((double *)v4 + 3)) {
      goto LABEL_62;
    }
  }
  else if ((v4[152] & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[152] & 2) == 0 || self->_entryAcceptanceDate != *((double *)v4 + 2)) {
      goto LABEL_62;
    }
  }
  else if ((v4[152] & 2) != 0)
  {
    goto LABEL_62;
  }
  ownerParticipant = self->_ownerParticipant;
  if ((unint64_t)ownerParticipant | *((void *)v4 + 16)
    && !-[NSData isEqual:](ownerParticipant, "isEqual:"))
  {
    goto LABEL_62;
  }
  setupMetadata = self->_setupMetadata;
  if ((unint64_t)setupMetadata | *((void *)v4 + 17))
  {
    if (!-[NSData isEqual:](setupMetadata, "isEqual:")) {
      goto LABEL_62;
    }
  }
  int v15 = v4[152];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    if ((v15 & 0x80000000) == 0 || self->_userWheelchairMode != *((void *)v4 + 8)) {
      goto LABEL_62;
    }
    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = v15 >= 0;
  }
LABEL_63:

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v34 = [(NSString *)self->_uuid hash];
  NSUInteger v33 = [(NSString *)self->_contactIdentifier hash];
  NSUInteger v32 = [(NSString *)self->_authorizationRecordIdentifier hash];
  NSUInteger v31 = [(NSString *)self->_cloudKitIdentifier hash];
  NSUInteger v30 = [(NSString *)self->_invitationUUID hash];
  NSUInteger v29 = [(NSString *)self->_firstName hash];
  NSUInteger v28 = [(NSString *)self->_lastName hash];
  uint64_t v27 = [(NSMutableArray *)self->_allContactIdentifiers hash];
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t v26 = 2654435761 * self->_type;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_direction;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v26 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_status;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
LABEL_13:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_14:
    unint64_t v11 = 0;
    goto LABEL_17;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_notificationStatus;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_14;
  }
LABEL_6:
  double entryModificationDate = self->_entryModificationDate;
  double v8 = -entryModificationDate;
  if (entryModificationDate >= 0.0) {
    double v8 = self->_entryModificationDate;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_17:
  if ((has & 4) != 0)
  {
    double entryInvitationDate = self->_entryInvitationDate;
    double v14 = -entryInvitationDate;
    if (entryInvitationDate >= 0.0) {
      double v14 = self->_entryInvitationDate;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if ((has & 2) != 0)
  {
    double entryAcceptanceDate = self->_entryAcceptanceDate;
    double v19 = -entryAcceptanceDate;
    if (entryAcceptanceDate >= 0.0) {
      double v19 = self->_entryAcceptanceDate;
    }
    long double v20 = floor(v19 + 0.5);
    double v21 = (v19 - v20) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0) {
        v17 += (unint64_t)v21;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    unint64_t v17 = 0;
  }
  uint64_t v22 = [(NSData *)self->_ownerParticipant hash];
  uint64_t v23 = [(NSData *)self->_setupMetadata hash];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    uint64_t v24 = 2654435761 * self->_userWheelchairMode;
  }
  else {
    uint64_t v24 = 0;
  }
  return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v4 ^ v5 ^ v6 ^ v11 ^ v12 ^ v17 ^ v22 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (char *)a3;
  if (*((void *)v4 + 18)) {
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setUuid:](self, "setUuid:");
  }
  if (*((void *)v4 + 12)) {
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setContactIdentifier:](self, "setContactIdentifier:");
  }
  if (*((void *)v4 + 10)) {
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setAuthorizationRecordIdentifier:](self, "setAuthorizationRecordIdentifier:");
  }
  if (*((void *)v4 + 11)) {
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setCloudKitIdentifier:](self, "setCloudKitIdentifier:");
  }
  if (*((void *)v4 + 14)) {
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setInvitationUUID:](self, "setInvitationUUID:");
  }
  if (*((void *)v4 + 13)) {
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setFirstName:](self, "setFirstName:");
  }
  if (*((void *)v4 + 15)) {
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setLastName:](self, "setLastName:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *((id *)v4 + 9);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HDCloudSyncCodableSharedSummaryParticipantRecord addAllContactIdentifiers:](self, "addAllContactIdentifiers:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = v4[152];
  if ((v10 & 0x40) != 0)
  {
    self->_type = *((void *)v4 + 7);
    *(unsigned char *)&self->_has |= 0x40u;
    char v10 = v4[152];
    if ((v10 & 1) == 0)
    {
LABEL_24:
      if ((v10 & 0x20) == 0) {
        goto LABEL_25;
      }
      goto LABEL_39;
    }
  }
  else if ((v4[152] & 1) == 0)
  {
    goto LABEL_24;
  }
  self->_direction = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v10 = v4[152];
  if ((v10 & 0x20) == 0)
  {
LABEL_25:
    if ((v10 & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_status = *((void *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x20u;
  char v10 = v4[152];
  if ((v10 & 0x10) == 0)
  {
LABEL_26:
    if ((v10 & 8) == 0) {
      goto LABEL_27;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_notificationStatus = *((void *)v4 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  char v10 = v4[152];
  if ((v10 & 8) == 0)
  {
LABEL_27:
    if ((v10 & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_double entryModificationDate = *((double *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v10 = v4[152];
  if ((v10 & 4) == 0)
  {
LABEL_28:
    if ((v10 & 2) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_42:
  self->_double entryInvitationDate = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((v4[152] & 2) != 0)
  {
LABEL_29:
    self->_double entryAcceptanceDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_30:
  if (*((void *)v4 + 16)) {
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setOwnerParticipant:](self, "setOwnerParticipant:");
  }
  if (*((void *)v4 + 17)) {
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setSetupMetadata:](self, "setSetupMetadata:");
  }
  if (v4[152] < 0)
  {
    self->_userWheelchairMode = *((void *)v4 + 8);
    *(unsigned char *)&self->_has |= 0x80u;
  }
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)authorizationRecordIdentifier
{
  return self->_authorizationRecordIdentifier;
}

- (void)setAuthorizationRecordIdentifier:(id)a3
{
}

- (NSString)cloudKitIdentifier
{
  return self->_cloudKitIdentifier;
}

- (void)setCloudKitIdentifier:(id)a3
{
}

- (NSString)invitationUUID
{
  return self->_invitationUUID;
}

- (void)setInvitationUUID:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSMutableArray)allContactIdentifiers
{
  return self->_allContactIdentifiers;
}

- (void)setAllContactIdentifiers:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)direction
{
  return self->_direction;
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)notificationStatus
{
  return self->_notificationStatus;
}

- (double)entryModificationDate
{
  return self->_entryModificationDate;
}

- (double)entryInvitationDate
{
  return self->_entryInvitationDate;
}

- (double)entryAcceptanceDate
{
  return self->_entryAcceptanceDate;
}

- (NSData)ownerParticipant
{
  return self->_ownerParticipant;
}

- (void)setOwnerParticipant:(id)a3
{
}

- (NSData)setupMetadata
{
  return self->_setupMetadata;
}

- (void)setSetupMetadata:(id)a3
{
}

- (int64_t)userWheelchairMode
{
  return self->_userWheelchairMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_setupMetadata, 0);
  objc_storeStrong((id *)&self->_ownerParticipant, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_invitationUUID, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudKitIdentifier, 0);
  objc_storeStrong((id *)&self->_authorizationRecordIdentifier, 0);

  objc_storeStrong((id *)&self->_allContactIdentifiers, 0);
}

@end