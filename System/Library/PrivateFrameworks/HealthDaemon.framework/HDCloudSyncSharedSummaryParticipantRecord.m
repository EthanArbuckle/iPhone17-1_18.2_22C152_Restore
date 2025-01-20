@interface HDCloudSyncSharedSummaryParticipantRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isParticipantRecord:(id)a3;
+ (BOOL)requiresUnderlyingMessage;
+ (BOOL)shouldSerializeUnderlyingMessageAsProtected;
+ (id)codableRecordFromRecord:(id)a3;
+ (id)fieldsForUnprotectedSerialization;
+ (id)recordIDWithZoneID:(id)a3 UUID:(id)a4;
+ (id)recordType;
+ (id)recordWithCKRecord:(id)a3 error:(id *)a4;
- (BOOL)updateWithLocalEntry:(id)a3 error:(id *)a4;
- (CKShareParticipant)ownerParticipant;
- (HDCloudSyncSharedSummaryParticipantRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (HDCodableSharingSetupMetadata)shareSetupMetadata;
- (NSArray)allContactIdentifiers;
- (NSDate)entryAcceptanceDate;
- (NSDate)entryInvitationDate;
- (NSDate)entryModificationDate;
- (NSNumber)notificationStatus;
- (NSNumber)relationshipDirection;
- (NSNumber)relationshipStatus;
- (NSNumber)relationshipType;
- (NSNumber)userWheelchairMode;
- (NSString)cloudKitIdentifier;
- (NSString)contactIdentifier;
- (NSString)firstName;
- (NSString)lastName;
- (NSUUID)UUID;
- (NSUUID)authorizationRecordIdentifier;
- (NSUUID)invitationUUID;
- (id)description;
- (id)initInZone:(id)a3 codableEntry:(id)a4;
- (id)printDescription;
- (id)serializeUnderlyingMessage;
- (int64_t)mergeWithLocalEntry:(id)a3 error:(id *)a4;
- (void)setAllContactIdentifiers:(id)a3;
- (void)setAuthorizationRecord:(id)a3;
- (void)setCloudKitIdentifier:(id)a3;
- (void)setEntryAcceptanceDate:(id)a3;
- (void)setEntryInvitationDate:(id)a3;
- (void)setEntryModificationDate:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setInvitationUUID:(id)a3;
- (void)setLastName:(id)a3;
- (void)setNotificationStatus:(id)a3;
- (void)setOwnerParticipant:(id)a3;
- (void)setRelationshipDirection:(id)a3;
- (void)setRelationshipStatus:(id)a3;
- (void)setRelationshipType:(id)a3;
- (void)setShareSetupMetadata:(id)a3;
- (void)setUserWheelchairMode:(id)a3;
@end

@implementation HDCloudSyncSharedSummaryParticipantRecord

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return @"SharedSummaryParticipantRecordType";
}

+ (BOOL)hasFutureSchema:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"Version"];
  v4 = v3;
  BOOL v5 = v3 && [v3 integerValue] > 1;

  return v5;
}

+ (id)recordIDWithZoneID:(id)a3 UUID:(id)a4
{
  BOOL v5 = NSString;
  id v6 = a3;
  v7 = [a4 UUIDString];
  v8 = [v5 stringWithFormat:@"%@/%@", @"SharedSummaryParticipantRecord", v7];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v8 zoneID:v6];

  return v9;
}

+ (BOOL)isParticipantRecord:(id)a3
{
  v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"SharedSummaryParticipantRecordType"];

  return v4;
}

- (id)initInZone:(id)a3 codableEntry:(id)a4
{
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E4F29128];
  id v8 = a3;
  id v9 = [v7 alloc];
  v10 = [v6 uuid];
  v11 = (void *)[v9 initWithUUIDString:v10];

  v12 = [(id)objc_opt_class() recordIDWithZoneID:v8 UUID:v11];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"SharedSummaryParticipantRecordType" recordID:v12];
  v14 = [(HDCloudSyncSharedSummaryParticipantRecord *)self initWithCKRecord:v13 schemaVersion:1];
  if (v14)
  {
    v15 = [v11 UUIDString];
    v16 = (void *)[v15 copy];
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v14->_underlyingSummaryParticipantRecord setUuid:v16];

    v17 = [v6 invitationUUID];
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v14->_underlyingSummaryParticipantRecord setInvitationUUID:v17];

    v18 = [v6 primaryContactIdentifier];
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v14->_underlyingSummaryParticipantRecord setContactIdentifier:v18];

    v19 = [v6 cloudKitIdentifier];
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v14->_underlyingSummaryParticipantRecord setCloudKitIdentifier:v19];

    v20 = [v6 firstName];
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v14->_underlyingSummaryParticipantRecord setFirstName:v20];

    v21 = [v6 lastName];
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v14->_underlyingSummaryParticipantRecord setLastName:v21];

    -[HDCloudSyncCodableSharedSummaryParticipantRecord setUserWheelchairMode:](v14->_underlyingSummaryParticipantRecord, "setUserWheelchairMode:", (int)[v6 userWheelchairMode]);
    v22 = [v6 allContactIdentifiers];
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v14->_underlyingSummaryParticipantRecord setAllContactIdentifiers:v22];

    -[HDCloudSyncCodableSharedSummaryParticipantRecord setType:](v14->_underlyingSummaryParticipantRecord, "setType:", (int)[v6 type]);
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setDirection:](v14->_underlyingSummaryParticipantRecord, "setDirection:", (int)[v6 direction]);
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setStatus:](v14->_underlyingSummaryParticipantRecord, "setStatus:", (int)[v6 status]);
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setNotificationStatus:](v14->_underlyingSummaryParticipantRecord, "setNotificationStatus:", (int)[v6 notificationStatus]);
    if ([v6 hasDateModified])
    {
      [v6 dateModified];
      -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryModificationDate:](v14->_underlyingSummaryParticipantRecord, "setEntryModificationDate:");
    }
    if ([v6 hasDateInvited])
    {
      [v6 dateInvited];
      -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryInvitationDate:](v14->_underlyingSummaryParticipantRecord, "setEntryInvitationDate:");
    }
    if ([v6 hasDateAccepted])
    {
      [v6 dateAccepted];
      -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryAcceptanceDate:](v14->_underlyingSummaryParticipantRecord, "setEntryAcceptanceDate:");
    }
    if ([v6 hasSharingSetupMetadata])
    {
      v23 = [v6 sharingSetupMetadata];
      v24 = [v23 data];
      [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v14->_underlyingSummaryParticipantRecord setSetupMetadata:v24];
    }
    if ([v6 hasOwnerParticipant])
    {
      v25 = [v6 ownerParticipant];
      [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v14->_underlyingSummaryParticipantRecord setOwnerParticipant:v25];
    }
    if ([v6 hasCloudKitIdentifier])
    {
      v26 = [v6 cloudKitIdentifier];
      [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v14->_underlyingSummaryParticipantRecord setCloudKitIdentifier:v26];
    }
  }

  return v14;
}

- (HDCloudSyncSharedSummaryParticipantRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)HDCloudSyncSharedSummaryParticipantRecord;
  char v4 = [(HDCloudSyncRecord *)&v14 initWithCKRecord:a3 schemaVersion:a4];
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  id v6 = [(HDCloudSyncRecord *)v4 underlyingMessage];
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableSharedSummaryParticipantRecord);
    underlyingSummaryParticipantRecord = v5->_underlyingSummaryParticipantRecord;
    v5->_underlyingSummaryParticipantRecord = v11;

    goto LABEL_8;
  }
  v7 = [[HDCloudSyncCodableSharedSummaryParticipantRecord alloc] initWithData:v6];
  id v8 = v5->_underlyingSummaryParticipantRecord;
  v5->_underlyingSummaryParticipantRecord = v7;

  if (v5->_underlyingSummaryParticipantRecord)
  {
LABEL_8:

LABEL_9:
    v10 = v5;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  id v9 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v5;
    _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "[summary-sharing] %{public}@: Failed to decode underlying record.", buf, 0xCu);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)updateWithLocalEntry:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = [v7 uuid];
  id v9 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord uuid];
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = objc_opt_class();
    v18 = @"Cannot update with mismatched UUID.";
    goto LABEL_7;
  }
  if (![v7 hasInvitationUUID])
  {
LABEL_9:
    BOOL v20 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasStatus];
    int v21 = [v7 status];
    if (v20)
    {
      switch(v21)
      {
        case 1:
          if (![(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord status])
          {
            uint64_t v22 = 1;
            goto LABEL_14;
          }
          break;
        case 2:
          if (![(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord status]|| [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord status] == 1)
          {
            uint64_t v22 = 2;
            goto LABEL_14;
          }
          break;
        case 3:
          if (![(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord status])
          {
            uint64_t v22 = 3;
            goto LABEL_14;
          }
          break;
        case 4:
          if (![(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord status]|| [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord status] == 1)
          {
            uint64_t v22 = 4;
            goto LABEL_14;
          }
          break;
        default:
          break;
      }
    }
    else
    {
      uint64_t v22 = v21;
LABEL_14:
      [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setStatus:v22];
    }
    BOOL v23 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasNotificationStatus];
    int v24 = [v7 notificationStatus];
    if (v23)
    {
      if (v24 == 2)
      {
        uint64_t v25 = 2;
      }
      else
      {
        if (v24 != 1
          || [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord notificationStatus])
        {
LABEL_23:
          if ([(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasType])
          {
            int64_t v26 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord type];
            if (v26 != (int)[v7 type])
            {
              v16 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v17 = objc_opt_class();
              v18 = @"Invitation types do not match.";
              goto LABEL_7;
            }
          }
          else
          {
            -[HDCloudSyncCodableSharedSummaryParticipantRecord setType:](self->_underlyingSummaryParticipantRecord, "setType:", (int)[v7 type]);
          }
          if ([(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasDirection])
          {
            int64_t v27 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord direction];
            if (v27 != (int)[v7 direction])
            {
              v16 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v17 = objc_opt_class();
              v18 = @"Invitation directions do not match.";
              goto LABEL_7;
            }
          }
          else
          {
            -[HDCloudSyncCodableSharedSummaryParticipantRecord setDirection:](self->_underlyingSummaryParticipantRecord, "setDirection:", (int)[v7 direction]);
          }
          BOOL v19 = 1;
          goto LABEL_32;
        }
        uint64_t v25 = 1;
      }
    }
    else
    {
      uint64_t v25 = v24;
    }
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setNotificationStatus:v25];
    goto LABEL_23;
  }
  BOOL v11 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasInvitationUUID];
  v12 = [v7 invitationUUID];
  underlyingSummaryParticipantRecord = self->_underlyingSummaryParticipantRecord;
  if (!v11)
  {
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)underlyingSummaryParticipantRecord setInvitationUUID:v12];

    goto LABEL_9;
  }
  objc_super v14 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)underlyingSummaryParticipantRecord invitationUUID];
  char v15 = [v12 isEqualToString:v14];

  if (v15) {
    goto LABEL_9;
  }
  v16 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v17 = objc_opt_class();
  v18 = @"Invitation UUIDs do not match.";
LABEL_7:
  objc_msgSend(v16, "hk_assignError:invalidArgument:class:selector:", a4, v18, v17, a2);
  BOOL v19 = 0;
LABEL_32:

  return v19;
}

- (int64_t)mergeWithLocalEntry:(id)a3 error:(id *)a4
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v7 = (HDCloudSyncCodableSharedSummaryParticipantRecord *)a3;
  id v8 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 uuid];
  id v9 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord uuid];
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = objc_opt_class();
    BOOL v20 = @"Cannot update with mismatched UUID.";
    goto LABEL_7;
  }
  int v11 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 hasInvitationUUID];
  BOOL v12 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasInvitationUUID];
  BOOL v13 = v12;
  if (!v11)
  {
    if (!v12) {
      goto LABEL_11;
    }
    objc_super v14 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord invitationUUID];
    underlyingSummaryParticipantRecord = v7;
LABEL_10:
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)underlyingSummaryParticipantRecord setInvitationUUID:v14];
    int v22 = v11 ^ 1;

    goto LABEL_12;
  }
  objc_super v14 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 invitationUUID];
  underlyingSummaryParticipantRecord = self->_underlyingSummaryParticipantRecord;
  if (!v13) {
    goto LABEL_10;
  }
  v16 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)underlyingSummaryParticipantRecord invitationUUID];
  char v17 = [v14 isEqualToString:v16];

  if (v17)
  {
LABEL_11:
    int v22 = 0;
    int v11 = 0;
LABEL_12:
    BOOL v23 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasType];
    BOOL v24 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 hasType];
    BOOL v25 = v24;
    if (!v23)
    {
      if (v24)
      {
        [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setType:HDSharingTypeFromCodableType([(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 type])];
        int v11 = 1;
      }
      goto LABEL_25;
    }
    int64_t v26 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord type];
    int64_t v27 = v26;
    if (v25)
    {
      if (v26 != HDSharingTypeFromCodableType([(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 type]))
      {
        v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v19 = objc_opt_class();
        BOOL v20 = @"Invitation types do not match.";
        goto LABEL_7;
      }
LABEL_25:
      BOOL v30 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasDirection];
      BOOL v31 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 hasDirection];
      BOOL v32 = v31;
      if (!v30)
      {
        if (v31)
        {
          [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setDirection:HDSharingMessageDirectionFromCodableDirection([(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 direction])];
          int v11 = 1;
        }
        goto LABEL_38;
      }
      int64_t v33 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord direction];
      int64_t v34 = v33;
      if (v32)
      {
        if (v33 != HDSharingMessageDirectionFromCodableDirection([(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 direction]))
        {
          v18 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v19 = objc_opt_class();
          BOOL v20 = @"Invitation directions do not match.";
          goto LABEL_7;
        }
LABEL_38:
        BOOL v37 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasStatus];
        BOOL v38 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 hasStatus];
        if (v37)
        {
          if (v38)
          {
            uint64_t v39 = HDSharingStatusFromCodableStatus([(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 status]);
            unint64_t v40 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord status];
            unint64_t v41 = HDMergedSharingStatus(v39, v40);
            unint64_t v42 = v41;
            if (v41 != v39)
            {
              [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 setStatus:HDCodableSharingStatusFromStatus(v41)];
              int v22 = 1;
            }
            if (v42 != v40)
            {
              v43 = self->_underlyingSummaryParticipantRecord;
              uint64_t v44 = v42;
LABEL_46:
              [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v43 setStatus:v44];
              int v11 = 1;
            }
          }
          else
          {
            [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 setStatus:HDCodableSharingStatusFromStatus([(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord status])];
            int v22 = 1;
          }
LABEL_48:
          BOOL v45 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasNotificationStatus];
          BOOL v46 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 hasNotificationStatus];
          if (!v45)
          {
            if (!v46) {
              goto LABEL_66;
            }
            uint64_t v51 = HDSharingNotificationStatusFromCodableStatus([(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 notificationStatus]);
            v52 = self->_underlyingSummaryParticipantRecord;
            goto LABEL_65;
          }
          if (!v46)
          {
            [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 setNotificationStatus:HDCodableSharingNotificationStatusFromStatus([(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord notificationStatus])];
            int v22 = 1;
            goto LABEL_66;
          }
          uint64_t v47 = HDSharingNotificationStatusFromCodableStatus([(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 notificationStatus]);
          unint64_t v48 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord notificationStatus];
          unint64_t v49 = v48;
          if (v47)
          {
            if (v47 != 2)
            {
              if (v47 == 1)
              {
                if (v48 < 3)
                {
                  unint64_t v50 = qword_1BD326AC8[v48];
                  goto LABEL_60;
                }
                uint64_t v47 = 1;
              }
LABEL_63:
              if (v47 == v49) {
                goto LABEL_66;
              }
              v52 = self->_underlyingSummaryParticipantRecord;
              uint64_t v51 = v47;
LABEL_65:
              [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v52 setNotificationStatus:v51];
              int v11 = 1;
LABEL_66:
              BOOL v53 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasEntryModificationDate];
              int v54 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 hasDateModified];
              int v55 = v54;
              if (v53)
              {
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord entryModificationDate];
                double v57 = v56;
                if (!v55) {
                  goto LABEL_73;
                }
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 dateModified];
                if (v57 < v58) {
                  double v57 = v58;
                }
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord entryModificationDate];
                if (v57 != v59)
                {
                  [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setEntryModificationDate:v57];
                  int v11 = 1;
                }
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 dateModified];
                if (v57 != v60)
                {
LABEL_73:
                  [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 setDateModified:v57];
                  int v22 = 1;
                }
              }
              else if (v54)
              {
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 dateModified];
                -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryModificationDate:](self->_underlyingSummaryParticipantRecord, "setEntryModificationDate:");
                int v11 = 1;
              }
              BOOL v61 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasEntryInvitationDate];
              int v62 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 hasDateInvited];
              int v63 = v62;
              if (v61)
              {
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord entryInvitationDate];
                double v65 = v64;
                if (!v63) {
                  goto LABEL_83;
                }
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 dateInvited];
                if (v65 >= v66) {
                  double v65 = v66;
                }
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord entryInvitationDate];
                if (v65 != v67)
                {
                  [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setEntryInvitationDate:v65];
                  int v11 = 1;
                }
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 dateInvited];
                if (v65 != v68)
                {
LABEL_83:
                  [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 setDateInvited:v65];
                  int v22 = 1;
                }
              }
              else if (v62)
              {
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 dateInvited];
                -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryInvitationDate:](self->_underlyingSummaryParticipantRecord, "setEntryInvitationDate:");
                int v11 = 1;
              }
              BOOL v69 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasEntryAcceptanceDate];
              int v70 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 hasDateAccepted];
              int v71 = v70;
              if (v69)
              {
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord entryAcceptanceDate];
                double v73 = v72;
                if (!v71) {
                  goto LABEL_93;
                }
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 dateAccepted];
                if (v73 >= v74) {
                  double v73 = v74;
                }
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord entryAcceptanceDate];
                if (v73 != v75)
                {
                  [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setEntryAcceptanceDate:v73];
                  int v11 = 1;
                }
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 dateAccepted];
                if (v73 != v76)
                {
LABEL_93:
                  [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 setDateAccepted:v73];
                  int v22 = 1;
                }
              }
              else if (v70)
              {
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 dateAccepted];
                -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryAcceptanceDate:](self->_underlyingSummaryParticipantRecord, "setEntryAcceptanceDate:");
                int v11 = 1;
              }
              BOOL v77 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasOwnerParticipant];
              BOOL v78 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 hasOwnerParticipant];
              if (v77)
              {
                if (v78) {
                  goto LABEL_102;
                }
                v79 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord ownerParticipant];
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 setOwnerParticipant:v79];
                int v22 = 1;
              }
              else
              {
                if (!v78) {
                  goto LABEL_102;
                }
                v79 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 ownerParticipant];
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setOwnerParticipant:v79];
                int v11 = 1;
              }

LABEL_102:
              BOOL v80 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasCloudKitIdentifier];
              BOOL v81 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 hasCloudKitIdentifier];
              if (v80)
              {
                if (v81) {
                  goto LABEL_108;
                }
                v82 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord cloudKitIdentifier];
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 setCloudKitIdentifier:v82];
                int v22 = 1;
              }
              else
              {
                if (!v81) {
                  goto LABEL_108;
                }
                v82 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 cloudKitIdentifier];
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setCloudKitIdentifier:v82];
                int v11 = 1;
              }

LABEL_108:
              id v83 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              v84 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord allContactIdentifiers];

              if (v84)
              {
                v85 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord allContactIdentifiers];
                [v83 addObjectsFromArray:v85];
              }
              v86 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 allContactIdentifiers];

              if (v86)
              {
                v87 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 allContactIdentifiers];
                [v83 addObjectsFromArray:v87];
              }
              v88 = [v83 allObjects];
              v89 = [v88 sortedArrayUsingSelector:sel_compare_];

              v90 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord allContactIdentifiers];
              if (v90 == v89)
              {
                v94 = v89;
              }
              else
              {
                v91 = v90;
                if (v89)
                {
                  v92 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord allContactIdentifiers];
                  char v93 = [v92 isEqual:v89];

                  if (v93)
                  {
LABEL_120:
                    v95 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 allContactIdentifiers];
                    if (v95 == v89)
                    {
                      v99 = v89;
                    }
                    else
                    {
                      v96 = v95;
                      if (v89)
                      {
                        v97 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 allContactIdentifiers];
                        char v98 = [v97 isEqual:v89];

                        if (v98)
                        {
LABEL_128:
                          v100 = [(HDCloudSyncRecord *)self record];
                          v101 = [v100 objectForKeyedSubscript:@"RelationshipRecord"];

                          if (v101)
                          {
                            v102 = [(HDCloudSyncRecord *)self record];
                            [v102 setObject:0 forKeyedSubscript:@"RelationshipRecord"];
                          }
                          else if (!v11)
                          {
                            if (v22) {
                              int64_t v21 = 2;
                            }
                            else {
                              int64_t v21 = 4;
                            }
                            goto LABEL_134;
                          }
                          if (v22) {
                            int64_t v21 = 3;
                          }
                          else {
                            int64_t v21 = 1;
                          }
LABEL_134:

                          goto LABEL_135;
                        }
                      }
                      else
                      {
                      }
                      v99 = (void *)[v89 mutableCopy];
                      [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 setAllContactIdentifiers:v99];
                      int v22 = 1;
                    }

                    goto LABEL_128;
                  }
                }
                else
                {
                }
                v94 = (void *)[v89 mutableCopy];
                [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setAllContactIdentifiers:v94];
                int v11 = 1;
              }

              goto LABEL_120;
            }
            unint64_t v50 = 2;
          }
          else
          {
            unint64_t v50 = v48;
          }
LABEL_60:
          if (v50 != v47)
          {
            [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 setNotificationStatus:HDCodableSharingNotificationStatusFromStatus(v50)];
            int v22 = 1;
            uint64_t v47 = v50;
          }
          goto LABEL_63;
        }
        if (!v38) {
          goto LABEL_48;
        }
        uint64_t v44 = HDSharingStatusFromCodableStatus([(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 status]);
        v43 = self->_underlyingSummaryParticipantRecord;
        goto LABEL_46;
      }
      if (v33 != 1)
      {
        if (!v33)
        {
          uint64_t v35 = 0;
LABEL_37:
          [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 setDirection:v35];
          int v22 = 1;
          goto LABEL_38;
        }
        _HKInitializeLogging();
        v36 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
        {
          int v104 = 134217984;
          int64_t v105 = v34;
          _os_log_fault_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_FAULT, "Unexpected direction %ld", (uint8_t *)&v104, 0xCu);
        }
      }
      uint64_t v35 = 1;
      goto LABEL_37;
    }
    if (v26)
    {
      if (v26 == 1)
      {
        uint64_t v28 = 1;
LABEL_24:
        [(HDCloudSyncCodableSharedSummaryParticipantRecord *)v7 setType:v28];
        int v22 = 1;
        goto LABEL_25;
      }
      _HKInitializeLogging();
      v29 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
      {
        int v104 = 134217984;
        int64_t v105 = v27;
        _os_log_fault_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_FAULT, "Unexpected type %ld", (uint8_t *)&v104, 0xCu);
      }
    }
    uint64_t v28 = 0;
    goto LABEL_24;
  }
  v18 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v19 = objc_opt_class();
  BOOL v20 = @"Invitation UUIDs do not match.";
LABEL_7:
  objc_msgSend(v18, "hk_assignError:invalidArgument:class:selector:", a4, v20, v19, a2);
  int64_t v21 = 5;
LABEL_135:

  return v21;
}

- (NSUUID)UUID
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  char v4 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord uuid];
  BOOL v5 = (void *)[v3 initWithUUIDString:v4];

  return (NSUUID *)v5;
}

- (NSString)contactIdentifier
{
  return [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord contactIdentifier];
}

- (void)setAuthorizationRecord:(id)a3
{
  id v6 = [a3 UUID];
  char v4 = [v6 UUIDString];
  BOOL v5 = (void *)[v4 copy];
  [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setAuthorizationRecordIdentifier:v5];
}

- (NSUUID)authorizationRecordIdentifier
{
  if ([(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasAuthorizationRecordIdentifier])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29128]);
    char v4 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord authorizationRecordIdentifier];
    BOOL v5 = (void *)[v3 initWithUUIDString:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return (NSUUID *)v5;
}

- (NSUUID)invitationUUID
{
  v2 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord invitationUUID];
  if (v2) {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v2];
  }
  else {
    id v3 = 0;
  }

  return (NSUUID *)v3;
}

- (void)setInvitationUUID:(id)a3
{
  id v4 = [a3 UUIDString];
  [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setInvitationUUID:v4];
}

- (NSString)cloudKitIdentifier
{
  return [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord cloudKitIdentifier];
}

- (void)setCloudKitIdentifier:(id)a3
{
  id v4 = (id)[a3 copy];
  [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setCloudKitIdentifier:v4];
}

- (NSString)firstName
{
  return [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord firstName];
}

- (void)setFirstName:(id)a3
{
  id v4 = (id)[a3 copy];
  [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setFirstName:v4];
}

- (NSString)lastName
{
  return [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord lastName];
}

- (void)setLastName:(id)a3
{
  id v4 = (id)[a3 copy];
  [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setLastName:v4];
}

- (NSArray)allContactIdentifiers
{
  v2 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord allContactIdentifiers];
  id v3 = (void *)[v2 copy];
  id v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  BOOL v5 = v3;

  return v5;
}

- (void)setAllContactIdentifiers:(id)a3
{
  id v4 = (id)[a3 mutableCopy];
  [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setAllContactIdentifiers:v4];
}

- (NSNumber)userWheelchairMode
{
  if ([(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasUserWheelchairMode])
  {
    id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HDCloudSyncCodableSharedSummaryParticipantRecord userWheelchairMode](self->_underlyingSummaryParticipantRecord, "userWheelchairMode"));
  }
  else
  {
    id v3 = 0;
  }

  return (NSNumber *)v3;
}

- (void)setUserWheelchairMode:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 longLongValue];
    underlyingSummaryParticipantRecord = self->_underlyingSummaryParticipantRecord;
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)underlyingSummaryParticipantRecord setUserWheelchairMode:v4];
  }
  else
  {
    id v6 = self->_underlyingSummaryParticipantRecord;
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setHasUserWheelchairMode:](v6, "setHasUserWheelchairMode:");
  }
}

- (NSNumber)relationshipType
{
  if ([(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasType])
  {
    id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HDCloudSyncCodableSharedSummaryParticipantRecord type](self->_underlyingSummaryParticipantRecord, "type"));
  }
  else
  {
    id v3 = 0;
  }

  return (NSNumber *)v3;
}

- (void)setRelationshipType:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 longLongValue];
    underlyingSummaryParticipantRecord = self->_underlyingSummaryParticipantRecord;
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)underlyingSummaryParticipantRecord setType:v4];
  }
  else
  {
    id v6 = self->_underlyingSummaryParticipantRecord;
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setHasType:](v6, "setHasType:");
  }
}

- (NSNumber)relationshipDirection
{
  if ([(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasDirection])
  {
    id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HDCloudSyncCodableSharedSummaryParticipantRecord direction](self->_underlyingSummaryParticipantRecord, "direction"));
  }
  else
  {
    id v3 = 0;
  }

  return (NSNumber *)v3;
}

- (void)setRelationshipDirection:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 longLongValue];
    underlyingSummaryParticipantRecord = self->_underlyingSummaryParticipantRecord;
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)underlyingSummaryParticipantRecord setDirection:v4];
  }
  else
  {
    id v6 = self->_underlyingSummaryParticipantRecord;
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setHasDirection:](v6, "setHasDirection:");
  }
}

- (NSNumber)relationshipStatus
{
  if ([(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasStatus])
  {
    id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HDCloudSyncCodableSharedSummaryParticipantRecord status](self->_underlyingSummaryParticipantRecord, "status"));
  }
  else
  {
    id v3 = 0;
  }

  return (NSNumber *)v3;
}

- (void)setRelationshipStatus:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 longLongValue];
    underlyingSummaryParticipantRecord = self->_underlyingSummaryParticipantRecord;
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)underlyingSummaryParticipantRecord setStatus:v4];
  }
  else
  {
    id v6 = self->_underlyingSummaryParticipantRecord;
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setHasStatus:](v6, "setHasStatus:");
  }
}

- (NSNumber)notificationStatus
{
  if ([(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasNotificationStatus])
  {
    id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HDCloudSyncCodableSharedSummaryParticipantRecord notificationStatus](self->_underlyingSummaryParticipantRecord, "notificationStatus"));
  }
  else
  {
    id v3 = 0;
  }

  return (NSNumber *)v3;
}

- (void)setNotificationStatus:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 longLongValue];
    underlyingSummaryParticipantRecord = self->_underlyingSummaryParticipantRecord;
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)underlyingSummaryParticipantRecord setNotificationStatus:v4];
  }
  else
  {
    id v6 = self->_underlyingSummaryParticipantRecord;
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setHasNotificationStatus:](v6, "setHasNotificationStatus:");
  }
}

- (NSDate)entryModificationDate
{
  if ([(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasEntryModificationDate])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord entryModificationDate];
    uint64_t v4 = objc_msgSend(v3, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setEntryModificationDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    underlyingSummaryParticipantRecord = self->_underlyingSummaryParticipantRecord;
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryModificationDate:](underlyingSummaryParticipantRecord, "setEntryModificationDate:");
  }
  else
  {
    BOOL v5 = self->_underlyingSummaryParticipantRecord;
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setHasEntryModificationDate:](v5, "setHasEntryModificationDate:");
  }
}

- (NSDate)entryInvitationDate
{
  if ([(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasEntryInvitationDate])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord entryInvitationDate];
    uint64_t v4 = objc_msgSend(v3, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setEntryInvitationDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    underlyingSummaryParticipantRecord = self->_underlyingSummaryParticipantRecord;
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryInvitationDate:](underlyingSummaryParticipantRecord, "setEntryInvitationDate:");
  }
  else
  {
    BOOL v5 = self->_underlyingSummaryParticipantRecord;
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setHasEntryInvitationDate:](v5, "setHasEntryInvitationDate:");
  }
}

- (NSDate)entryAcceptanceDate
{
  if ([(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord hasEntryAcceptanceDate])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord entryAcceptanceDate];
    uint64_t v4 = objc_msgSend(v3, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setEntryAcceptanceDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    underlyingSummaryParticipantRecord = self->_underlyingSummaryParticipantRecord;
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setEntryAcceptanceDate:](underlyingSummaryParticipantRecord, "setEntryAcceptanceDate:");
  }
  else
  {
    BOOL v5 = self->_underlyingSummaryParticipantRecord;
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setHasEntryAcceptanceDate:](v5, "setHasEntryAcceptanceDate:");
  }
}

- (HDCodableSharingSetupMetadata)shareSetupMetadata
{
  id v3 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setupMetadata];

  if (v3)
  {
    uint64_t v4 = [HDCodableSharingSetupMetadata alloc];
    BOOL v5 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setupMetadata];
    id v6 = [(HDCodableSharingSetupMetadata *)v4 initWithData:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setShareSetupMetadata:(id)a3
{
  id v4 = [a3 data];
  [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setSetupMetadata:v4];
}

- (CKShareParticipant)ownerParticipant
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord ownerParticipant];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = objc_opt_class();
    id v6 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord ownerParticipant];
    id v13 = 0;
    id v3 = [v4 unarchivedObjectOfClass:v5 fromData:v6 error:&v13];
    id v7 = v13;

    if (!v3)
    {
      _HKInitializeLogging();
      id v8 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        underlyingSummaryParticipantRecord = self->_underlyingSummaryParticipantRecord;
        int v11 = v8;
        BOOL v12 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)underlyingSummaryParticipantRecord ownerParticipant];
        *(_DWORD *)buf = 138543618;
        char v15 = v12;
        __int16 v16 = 2114;
        id v17 = v7;
        _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "Failed to unarchive share participant %{public}@: %{public}@", buf, 0x16u);
      }
    }
  }

  return (CKShareParticipant *)v3;
}

- (void)setOwnerParticipant:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v9 = 0;
    uint64_t v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v9];
    id v6 = v9;
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setOwnerParticipant:v5];

    id v7 = [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord ownerParticipant];

    if (!v7)
    {
      _HKInitializeLogging();
      id v8 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        int v11 = self;
        __int16 v12 = 2114;
        id v13 = v4;
        __int16 v14 = 2114;
        id v15 = v6;
        _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to archive owner participant %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    [(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord setOwnerParticipant:0];
  }
}

+ (id)codableRecordFromRecord:(id)a3
{
  id v3 = (void *)[*((id *)a3 + 3) copy];

  return v3;
}

- (id)serializeUnderlyingMessage
{
  return (id)[(HDCloudSyncCodableSharedSummaryParticipantRecord *)self->_underlyingSummaryParticipantRecord data];
}

+ (id)recordWithCKRecord:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = [v7 recordType];
  id v9 = [a1 recordType];
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = objc_opt_class();
    int v11 = [v7 recordType];
    id v15 = [a1 recordType];
    objc_msgSend(v13, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v14, a2, @"record has type (%@), but expected (%@)"", v11, v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      if (a4) {
        *a4 = v16;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_11;
  }
  int v11 = objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"Version", objc_opt_class(), a4);
  if (!v11)
  {
LABEL_11:
    __int16 v12 = 0;
    goto LABEL_12;
  }
  if (![a1 requiresUnderlyingMessage]
    || (objc_msgSend(v7, "hd_requiredEncryptedValueForKey:type:error:", @"UnderlyingMessage", objc_opt_class(), a4), __int16 v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    __int16 v12 = objc_msgSend(objc_alloc((Class)a1), "initWithCKRecord:schemaVersion:", v7, objc_msgSend(v11, "integerValue"));
  }
LABEL_12:

  return v12;
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
}

+ (id)fieldsForUnprotectedSerialization
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HDCloudSyncSharedSummaryParticipantRecord;
  v2 = objc_msgSendSuper2(&v8, sel_fieldsForUnprotectedSerialization);
  uint64_t v9 = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  id v4 = +[HDCloudSyncSerializedField fieldForKey:@"RelationshipRecord" classes:v3 encrypted:0];
  v10[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v6 = [v2 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(HDCloudSyncRecord *)self record];
  uint64_t v5 = [v4 recordID];
  id v6 = [(HDCloudSyncRecord *)self record];
  id v7 = [v6 objectForKeyedSubscript:@"Version"];
  objc_super v8 = [(HDCloudSyncRecord *)self record];
  uint64_t v9 = [v8 modificationDate];
  char v10 = [(HDCloudSyncSharedSummaryParticipantRecord *)self printDescription];
  int v11 = [v3 stringWithFormat:@"%@ (Version %@) Last Modified: %@\n%@", v5, v7, v9, v10];

  return v11;
}

- (id)printDescription
{
  uint64_t v18 = NSString;
  BOOL v24 = [(HDCloudSyncSharedSummaryParticipantRecord *)self contactIdentifier];
  BOOL v23 = [(HDCloudSyncSharedSummaryParticipantRecord *)self UUID];
  int v22 = [(HDCloudSyncSharedSummaryParticipantRecord *)self invitationUUID];
  uint64_t v4 = [(HDCloudSyncSharedSummaryParticipantRecord *)self relationshipStatus];
  if (v4)
  {
    id v17 = [(HDCloudSyncSharedSummaryParticipantRecord *)self relationshipStatus];
    [v17 longLongValue];
    HKStringForSharingStatus();
    int64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int64_t v21 = @"<unknown>";
  }
  uint64_t v5 = [(HDCloudSyncSharedSummaryParticipantRecord *)self relationshipDirection];
  if (v5)
  {
    id v16 = [(HDCloudSyncSharedSummaryParticipantRecord *)self relationshipDirection];
    [v16 longLongValue];
    HKStringForMessageDirection();
    BOOL v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v20 = @"<unknown>";
  }
  uint64_t v19 = (void *)v4;
  id v6 = [(HDCloudSyncSharedSummaryParticipantRecord *)self relationshipType];
  if (v6)
  {
    id v15 = [(HDCloudSyncSharedSummaryParticipantRecord *)self relationshipType];
    [v15 longLongValue];
    HKStringForSharingType();
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = @"<unknown>";
  }
  objc_super v8 = [(HDCloudSyncSharedSummaryParticipantRecord *)self notificationStatus];
  if (v8)
  {
    v2 = [(HDCloudSyncSharedSummaryParticipantRecord *)self notificationStatus];
    [v2 longLongValue];
    HKStringForNotificationStatus();
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = @"<unknown>";
  }
  char v10 = [(HDCloudSyncSharedSummaryParticipantRecord *)self lastName];
  int v11 = [(HDCloudSyncSharedSummaryParticipantRecord *)self firstName];
  __int16 v12 = [(HDCloudSyncSharedSummaryParticipantRecord *)self cloudKitIdentifier];
  id v13 = [v18 stringWithFormat:@"+ %@ - %@ [IDS: %@]\n| %@ %@ %@ %@ for \"%@, %@\" <%@>\n+------------------------------------------------------------------------", v24, v23, v22, v21, v20, v7, v9, v10, v11, v12];

  if (v8)
  {
  }
  if (v6)
  {
  }
  if (v5)
  {
  }
  if (v19)
  {
  }

  return v13;
}

- (void).cxx_destruct
{
}

@end