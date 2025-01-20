@interface ASRelationship
+ (id)relationshipWithCodableRelationship:(id)a3 version:(int64_t)a4;
+ (id)relationshipWithCodableRelationshipContainer:(id)a3;
+ (id)relationshipsWithRelationshipAndEventRecords:(id)a3;
+ (void)_relationshipWithRecord:(id)a3 relationshipEventRecords:(id)a4 completion:(id)a5;
- (ASCodableCloudKitRelationship)codableRelationship;
- (ASRelationship)init;
- (ASRelationship)initWithIdentifier:(id)a3 cloudType:(unint64_t)a4;
- (BOOL)hasCompletedCompetition;
- (BOOL)hasIgnoredCompetitionRequest;
- (BOOL)hasIncomingCompetitionRequest;
- (BOOL)hasIncomingInviteRequest;
- (BOOL)hasIncomingSecureCloudRepairRequest;
- (BOOL)hasIncomingSecureCloudUpgradeRequest;
- (BOOL)hasInviteRequestEvent;
- (BOOL)hasOutgoingCompetitionRequest;
- (BOOL)hasOutgoingInviteRequest;
- (BOOL)hasOutgoingSecureCloudRepairRequest;
- (BOOL)hasOutgoingSecureCloudUpgradeRequest;
- (BOOL)isActivityDataVisible;
- (BOOL)isAwaitingCompetitionResponse;
- (BOOL)isAwaitingInviteResponse;
- (BOOL)isCompetitionActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRelationship:(id)a3;
- (BOOL)isFriendshipActive;
- (BOOL)isHidingActivityData;
- (BOOL)isMuteEnabled;
- (BOOL)needsPushForConsolidation;
- (BOOL)secureCloudDowngradeAcknowledged;
- (BOOL)secureCloudDowngradeCompleted;
- (BOOL)secureCloudDowngradeFailed;
- (BOOL)secureCloudDowngradeNeedsAcknowledgement;
- (BOOL)secureCloudDowngradeRequested;
- (BOOL)secureCloudDowngradeStarted;
- (BOOL)secureCloudMigrationAvailable;
- (BOOL)secureCloudMigrationCompleted;
- (BOOL)secureCloudMigrationStarted;
- (BOOL)secureCloudNeedsRepair;
- (BOOL)secureCloudNeedsZoneDeletion;
- (BOOL)secureCloudRepairFailed;
- (BOOL)secureCloudUpgradeAvailable;
- (BOOL)secureCloudUpgradeCompleted;
- (BOOL)secureCloudUpgradeFailed;
- (BOOL)sentInviteResponse;
- (BOOL)supportsCompetitions;
- (CKRecord)systemFieldsOnlyRecord;
- (CKRecordID)relationshipShareID;
- (CKRecordID)relationshipZoneShareID;
- (CKRecordID)remoteActivityDataShareID;
- (CKRecordID)remoteRelationshipShareID;
- (CKRecordID)remoteRelationshipZoneShareID;
- (IDSReceivedInvitation)receivedInvitation;
- (IDSSentInvitation)sentInvitation;
- (NSArray)relationshipEvents;
- (NSDate)dateActivityDataInitiallyBecameVisible;
- (NSDate)dateForLatestDataHidden;
- (NSDate)dateForLatestDowngradeCompleted;
- (NSDate)dateForLatestDowngradeNeedsAcknowledgement;
- (NSDate)dateForLatestFriendshipDidBegin;
- (NSDate)dateForLatestIgnoredCompetitionRequest;
- (NSDate)dateForLatestIncomingCompetitionRequest;
- (NSDate)dateForLatestIncomingInviteRequest;
- (NSDate)dateForLatestIncomingUpgradeRequest;
- (NSDate)dateForLatestInviteRequestEvent;
- (NSDate)dateForLatestMigrationCompleted;
- (NSDate)dateForLatestMigrationFailed;
- (NSDate)dateForLatestMigrationStarted;
- (NSDate)dateForLatestOutgoingCompetitionRequest;
- (NSDate)dateForLatestOutgoingInviteRequest;
- (NSDate)dateForLatestOutgoingUpgradeRequest;
- (NSDate)dateForLatestRelationshipEnd;
- (NSDate)dateForLatestRelationshipStart;
- (NSDate)dateForLatestRepairRequest;
- (NSDate)dateForLatestSupportedFeaturesUpdate;
- (NSDate)dateForLatestUpgradeAvailableUnavailableChange;
- (NSDate)dateForLatestUpgradeCompleted;
- (NSDate)dateForLatestUpgradeFailure;
- (NSDate)timestampForMostRecentRelationshipEvent;
- (NSSet)addresses;
- (NSString)cloudKitAddress;
- (NSString)description;
- (NSString)incomingHandshakeToken;
- (NSString)outgoingHandshakeToken;
- (NSString)preferredReachableAddress;
- (NSString)preferredReachableService;
- (NSString)secureCloudUpgradeToken;
- (NSString)secureCloudZoneName;
- (NSUUID)UUID;
- (id)codableRelationshipContainerIncludingCloudKitFields:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fullDescription;
- (id)populateRecord:(id)a3 recordEncryptionType:(int64_t)a4;
- (id)recordWithZoneID:(id)a3 recordEncryptionType:(int64_t)a4;
- (id)relationshipSnapshotForDate:(id)a3;
- (int64_t)version;
- (unint64_t)_nextAnchor;
- (unint64_t)cloudType;
- (unint64_t)currentRelationshipEventAnchor;
- (unsigned)supportedPhoneFeatures;
- (unsigned)supportedWatchFeatures;
- (void)_clearRelationshipState;
- (void)_setRelationshipEvents:(id)a3;
- (void)_updateCurrentRelationshipState;
- (void)_updateDateActivityDataBecameVisibleWithDate:(id)a3;
- (void)_updateDateFriendshipBeganWithDate:(id)a3;
- (void)consolidateIfNeeded;
- (void)insertEventWithType:(unsigned __int16)a3;
- (void)insertEventWithType:(unsigned __int16)a3 timestamp:(id)a4;
- (void)insertEvents:(id)a3;
- (void)setAddresses:(id)a3;
- (void)setCloudKitAddress:(id)a3;
- (void)setCloudType:(unint64_t)a3;
- (void)setDateActivityDataInitiallyBecameVisible:(id)a3;
- (void)setDateForLatestDataHidden:(id)a3;
- (void)setDateForLatestDowngradeCompleted:(id)a3;
- (void)setDateForLatestDowngradeNeedsAcknowledgement:(id)a3;
- (void)setDateForLatestFriendshipDidBegin:(id)a3;
- (void)setDateForLatestIgnoredCompetitionRequest:(id)a3;
- (void)setDateForLatestIncomingCompetitionRequest:(id)a3;
- (void)setDateForLatestIncomingInviteRequest:(id)a3;
- (void)setDateForLatestIncomingUpgradeRequest:(id)a3;
- (void)setDateForLatestInviteRequestEvent:(id)a3;
- (void)setDateForLatestMigrationCompleted:(id)a3;
- (void)setDateForLatestMigrationFailed:(id)a3;
- (void)setDateForLatestMigrationStarted:(id)a3;
- (void)setDateForLatestOutgoingCompetitionRequest:(id)a3;
- (void)setDateForLatestOutgoingInviteRequest:(id)a3;
- (void)setDateForLatestOutgoingUpgradeRequest:(id)a3;
- (void)setDateForLatestRelationshipEnd:(id)a3;
- (void)setDateForLatestRelationshipStart:(id)a3;
- (void)setDateForLatestRepairRequest:(id)a3;
- (void)setDateForLatestSupportedFeaturesUpdate:(id)a3;
- (void)setDateForLatestUpgradeAvailableUnavailableChange:(id)a3;
- (void)setDateForLatestUpgradeCompleted:(id)a3;
- (void)setDateForLatestUpgradeFailure:(id)a3;
- (void)setHasCompletedCompetition:(BOOL)a3;
- (void)setHasIgnoredCompetitionRequest:(BOOL)a3;
- (void)setHasIncomingCompetitionRequest:(BOOL)a3;
- (void)setHasIncomingInviteRequest:(BOOL)a3;
- (void)setHasIncomingSecureCloudRepairRequest:(BOOL)a3;
- (void)setHasIncomingSecureCloudUpgradeRequest:(BOOL)a3;
- (void)setHasOutgoingCompetitionRequest:(BOOL)a3;
- (void)setHasOutgoingInviteRequest:(BOOL)a3;
- (void)setHasOutgoingSecureCloudRepairRequest:(BOOL)a3;
- (void)setHasOutgoingSecureCloudUpgradeRequest:(BOOL)a3;
- (void)setIncomingHandshakeToken:(id)a3;
- (void)setIsAwaitingCompetitionResponse:(BOOL)a3;
- (void)setIsAwaitingInviteResponse:(BOOL)a3;
- (void)setIsCompetitionActive:(BOOL)a3;
- (void)setIsFriendshipActive:(BOOL)a3;
- (void)setIsMuteEnabled:(BOOL)a3;
- (void)setNeedsPushForConsolidation:(BOOL)a3;
- (void)setOutgoingHandshakeToken:(id)a3;
- (void)setPreferredReachableAddress:(id)a3;
- (void)setPreferredReachableService:(id)a3;
- (void)setReceivedInvitation:(id)a3;
- (void)setRelationshipEvents:(id)a3;
- (void)setRelationshipShareID:(id)a3;
- (void)setRelationshipZoneShareID:(id)a3;
- (void)setRemoteActivityDataShareID:(id)a3;
- (void)setRemoteRelationshipShareID:(id)a3;
- (void)setRemoteRelationshipZoneShareID:(id)a3;
- (void)setSecureCloudDowngradeAcknowledged:(BOOL)a3;
- (void)setSecureCloudDowngradeCompleted:(BOOL)a3;
- (void)setSecureCloudDowngradeFailed:(BOOL)a3;
- (void)setSecureCloudDowngradeNeedsAcknowledgement:(BOOL)a3;
- (void)setSecureCloudDowngradeRequested:(BOOL)a3;
- (void)setSecureCloudDowngradeStarted:(BOOL)a3;
- (void)setSecureCloudMigrationAvailable:(BOOL)a3;
- (void)setSecureCloudMigrationCompleted:(BOOL)a3;
- (void)setSecureCloudMigrationStarted:(BOOL)a3;
- (void)setSecureCloudNeedsRepair:(BOOL)a3;
- (void)setSecureCloudNeedsZoneDeletion:(BOOL)a3;
- (void)setSecureCloudRepairFailed:(BOOL)a3;
- (void)setSecureCloudUpgradeAvailable:(BOOL)a3;
- (void)setSecureCloudUpgradeCompleted:(BOOL)a3;
- (void)setSecureCloudUpgradeFailed:(BOOL)a3;
- (void)setSecureCloudUpgradeToken:(id)a3;
- (void)setSentInvitation:(id)a3;
- (void)setSentInviteResponse:(BOOL)a3;
- (void)setSupportedPhoneFeatures:(unsigned int)a3;
- (void)setSupportedWatchFeatures:(unsigned int)a3;
- (void)setSystemFieldsOnlyRecord:(id)a3;
- (void)setUUID:(id)a3;
- (void)setVersion:(int64_t)a3;
- (void)traverseRelationshipHistoryStartingAtEventWithAnchor:(unint64_t)a3 block:(id)a4;
@end

@implementation ASRelationship

- (id)recordWithZoneID:(id)a3 recordEncryptionType:(int64_t)a4
{
  id v6 = a3;
  v7 = [(ASRelationship *)self systemFieldsOnlyRecord];
  v8 = v7;
  if (!v7
    || ([v7 recordID],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v9 zoneID],
        v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isEqual:v6],
        v10,
        v9,
        (v11 & 1) == 0))
  {
    if (ASSecureCloudEnabled())
    {
      id v12 = objc_alloc(MEMORY[0x263EFD7E8]);
      v13 = [(ASRelationship *)self UUID];
      v14 = [v13 UUIDString];
      uint64_t v15 = [v12 initWithRecordName:v14 zoneID:v6];

      uint64_t v16 = [objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"ActivitySharingRelationship" recordID:v15];
      v8 = (void *)v15;
    }
    else
    {
      uint64_t v16 = [objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"ActivitySharingRelationship" zoneID:v6];
    }

    v8 = (void *)v16;
  }
  v17 = [(ASRelationship *)self populateRecord:v8 recordEncryptionType:a4];

  return v17;
}

- (id)populateRecord:(id)a3 recordEncryptionType:(int64_t)a4
{
  id v6 = a3;
  _ASUpdateSchemaVersionOnRecord(3, v6, a4);
  uint64_t v7 = [(ASRelationship *)self remoteActivityDataShareID];
  if (v7)
  {
    v8 = (void *)v7;
    unint64_t v9 = [(ASRelationship *)self cloudType];

    if (!v9)
    {
      id v10 = objc_alloc(MEMORY[0x263EFD820]);
      char v11 = [(ASRelationship *)self remoteActivityDataShareID];
      id v12 = (void *)[v10 initWithRecordID:v11 action:0];
      [v6 setObject:v12 forKeyedSubscript:@"RemoteActivityDataShareReference"];
    }
  }
  uint64_t v13 = [(ASRelationship *)self remoteRelationshipShareID];
  if (v13)
  {
    v14 = (void *)v13;
    unint64_t v15 = [(ASRelationship *)self cloudType];

    if (!v15)
    {
      id v16 = objc_alloc(MEMORY[0x263EFD820]);
      v17 = [(ASRelationship *)self remoteRelationshipShareID];
      v18 = (void *)[v16 initWithRecordID:v17 action:0];
      [v6 setObject:v18 forKeyedSubscript:@"RemoteRelationshipShareReference"];
    }
  }
  if (ASSecureCloudEnabled())
  {
    uint64_t v19 = [(ASRelationship *)self remoteRelationshipZoneShareID];
    if (v19)
    {
      v20 = (void *)v19;
      unint64_t v21 = [(ASRelationship *)self cloudType];

      if (v21 == 1)
      {
        id v22 = objc_alloc(MEMORY[0x263EFD820]);
        v23 = [(ASRelationship *)self remoteRelationshipZoneShareID];
        v24 = (void *)[v22 initWithRecordID:v23 action:0];
        [v6 setObject:v24 forKeyedSubscript:@"RemoteRelationshipZoneShareReference"];
      }
    }
  }
  v25 = [(ASRelationship *)self codableRelationship];
  v26 = [v25 data];
  v27 = [v6 encryptedValues];
  [v27 setObject:v26 forKeyedSubscript:@"EncryptedData"];

  return v6;
}

- (ASCodableCloudKitRelationship)codableRelationship
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(ASCodableCloudKitRelationship);
  v4 = [(ASRelationship *)self UUID];
  v5 = objc_msgSend(v4, "hk_dataForUUIDBytes");
  [(ASCodableCloudKitRelationship *)v3 setUuid:v5];

  id v6 = [(ASRelationship *)self incomingHandshakeToken];
  [(ASCodableCloudKitRelationship *)v3 setIncomingHandshakeToken:v6];

  uint64_t v7 = [(ASRelationship *)self outgoingHandshakeToken];
  [(ASCodableCloudKitRelationship *)v3 setOutgoingHandshakeToken:v7];

  v8 = [(ASRelationship *)self cloudKitAddress];
  [(ASCodableCloudKitRelationship *)v3 setCloudKitAddress:v8];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  unint64_t v9 = [(ASRelationship *)self addresses];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v9);
        }
        [(ASCodableCloudKitRelationship *)v3 addAddresses:*(void *)(*((void *)&v37 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v11);
  }

  v14 = [(ASRelationship *)self preferredReachableAddress];
  [(ASCodableCloudKitRelationship *)v3 setPreferredReachableAddress:v14];

  unint64_t v15 = [(ASRelationship *)self preferredReachableService];
  [(ASCodableCloudKitRelationship *)v3 setPreferredReachableService:v15];

  id v16 = [(ASRelationship *)self relationshipEvents];
  -[ASCodableCloudKitRelationship setEventCount:](v3, "setEventCount:", [v16 count]);

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v17 = [(ASRelationship *)self relationshipEvents];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = [*(id *)(*((void *)&v33 + 1) + 8 * j) _codableRelationshipEvent];
        [(ASCodableCloudKitRelationship *)v3 addEvents:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v19);
  }

  [(ASCodableCloudKitRelationship *)v3 setSupportedPhoneFeatures:[(ASRelationship *)self supportedPhoneFeatures]];
  [(ASCodableCloudKitRelationship *)v3 setSupportedWatchFeatures:[(ASRelationship *)self supportedWatchFeatures]];
  [(ASCodableCloudKitRelationship *)v3 setCloudType:[(ASRelationship *)self cloudType]];
  v23 = [(ASRelationship *)self secureCloudUpgradeToken];
  [(ASCodableCloudKitRelationship *)v3 setSecureCloudUpgradeToken:v23];

  v24 = [(ASRelationship *)self sentInvitation];

  if (v24)
  {
    v25 = (void *)MEMORY[0x263F08910];
    v26 = [(ASRelationship *)self sentInvitation];
    v27 = [v25 archivedDataWithRootObject:v26 requiringSecureCoding:1 error:0];
    [(ASCodableCloudKitRelationship *)v3 setSentInvitation:v27];
  }
  v28 = [(ASRelationship *)self receivedInvitation];

  if (v28)
  {
    v29 = (void *)MEMORY[0x263F08910];
    v30 = [(ASRelationship *)self receivedInvitation];
    v31 = [v29 archivedDataWithRootObject:v30 requiringSecureCoding:1 error:0];
    [(ASCodableCloudKitRelationship *)v3 setReceivedInvitation:v31];
  }

  return v3;
}

+ (void)_relationshipWithRecord:(id)a3 relationshipEventRecords:(id)a4 completion:(id)a5
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = (void (**)(id, void, id))a5;
  uint64_t v10 = _ASCloudKitSchemaVersionForRecord(v7);
  if ((unint64_t)(v10 - 4) > 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v12 = [v7 encryptedValues];
    id v13 = [v12 objectForKeyedSubscript:@"EncryptedData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    if (!v14)
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
        +[ASRelationship(CloudKitCodingSupport) _relationshipWithRecord:relationshipEventRecords:completion:]();
      }
      v9[2](v9, 0, v8);
      goto LABEL_53;
    }
    v76 = [[ASCodableCloudKitRelationship alloc] initWithData:v14];
    unint64_t v15 = +[ASRelationship relationshipWithCodableRelationship:version:](ASRelationship, "relationshipWithCodableRelationship:version:");
    id v16 = [v7 objectForKeyedSubscript:@"RemoteActivityDataShareReference"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }

    id v72 = v17;
    uint64_t v18 = [v17 recordID];
    [v15 setRemoteActivityDataShareID:v18];

    id v19 = [v7 objectForKeyedSubscript:@"RemoteRelationshipShareReference"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }

    id v71 = v20;
    unint64_t v21 = [v20 recordID];
    [v15 setRemoteRelationshipShareID:v21];

    id v22 = [v7 share];
    uint64_t v23 = [v22 recordID];
    v24 = v15;
    v25 = (void *)v23;
    v77 = v24;
    [v24 setRelationshipShareID:v23];

    if (ASSecureCloudEnabled())
    {
      id v26 = [v7 objectForKeyedSubscript:@"RelationshipZoneShareReference"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v27 = v26;
      }
      else {
        id v27 = 0;
      }
      id v28 = v14;

      v29 = [v27 recordID];
      [v77 setRelationshipZoneShareID:v29];

      id v30 = [v7 objectForKeyedSubscript:@"RemoteRelationshipZoneShareReference"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v31 = v30;
      }
      else {
        id v31 = 0;
      }

      v32 = [v31 recordID];
      [v77 setRemoteRelationshipZoneShareID:v32];

      id v14 = v28;
    }
    long long v33 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
    [v7 encodeSystemFieldsWithCoder:v33];
    [v33 finishEncoding];
    id v34 = objc_alloc(MEMORY[0x263F08928]);
    v74 = v33;
    long long v35 = [v33 encodedData];
    id v86 = 0;
    uint64_t v36 = [v34 initForReadingFromData:v35 error:&v86];
    id v37 = v86;

    v75 = v37;
    if (v37)
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
        +[ASRelationship(CloudKitCodingSupport) _relationshipWithRecord:relationshipEventRecords:completion:].cold.5();
      }
    }
    v73 = (void *)v36;
    long long v38 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithCoder:v36];
    long long v39 = v77;
    [v77 setSystemFieldsOnlyRecord:v38];

    uint64_t v40 = [(ASCodableCloudKitRelationship *)v76 eventCount];
    uint64_t v41 = v40;
    if (v10 == 2)
    {
      uint64_t v70 = v40;
      id v67 = v14;
      v79 = [MEMORY[0x263EFFA08] set];
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v69 = v8;
      obuint64_t j = v8;
      uint64_t v51 = [obj countByEnumeratingWithState:&v80 objects:v87 count:16];
      v68 = v9;
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = *(void *)v81;
        v50 = (void *)MEMORY[0x263EFFA68];
        do
        {
          for (uint64_t i = 0; i != v52; ++i)
          {
            if (*(void *)v81 != v53) {
              objc_enumerationMutation(obj);
            }
            v55 = *(void **)(*((void *)&v80 + 1) + 8 * i);
            v56 = [v55 parent];
            v57 = [v56 recordID];
            id v58 = v7;
            v59 = [v7 recordID];
            int v60 = [v57 isEqual:v59];

            if (v60)
            {
              v61 = +[ASRelationshipEvent relationshipEventWithRecord:v55];
              uint64_t v62 = [v50 arrayByAddingObject:v61];

              uint64_t v63 = [v79 setByAddingObject:v55];

              v50 = (void *)v62;
              v79 = (void *)v63;
            }
            id v7 = v58;
          }
          uint64_t v52 = [obj countByEnumeratingWithState:&v80 objects:v87 count:16];
        }
        while (v52);
      }
      else
      {
        v50 = (void *)MEMORY[0x263EFFA68];
      }

      [v77 setRelationshipEvents:v50];
      v64 = [v77 relationshipEvents];
      uint64_t v65 = [v64 count];

      if (v70 != v65)
      {
        ASLoggingInitialize();
        v66 = (void *)ASLogCloudKit;
        if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
          +[ASRelationship(CloudKitCodingSupport) _relationshipWithRecord:relationshipEventRecords:completion:](v66, v77);
        }
      }
      unint64_t v9 = v68;
      ((void (**)(id, void *, id))v68)[2](v68, v77, v79);

      id v8 = v69;
      id v14 = v67;
      v44 = v71;
      uint64_t v43 = v72;
    }
    else
    {
      BOOL v42 = v10 == 3;
      v44 = v71;
      uint64_t v43 = v72;
      if (!v42) {
        goto LABEL_52;
      }
      v45 = [v77 relationshipEvents];
      uint64_t v46 = v41;
      uint64_t v47 = [v45 count];

      if (v46 != v47)
      {
        ASLoggingInitialize();
        v48 = (void *)ASLogCloudKit;
        if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
          +[ASRelationship(CloudKitCodingSupport) _relationshipWithRecord:relationshipEventRecords:completion:](v48, v77);
        }
      }
      v84[0] = MEMORY[0x263EF8330];
      v84[1] = 3221225472;
      v84[2] = __101__ASRelationship_CloudKitCodingSupport___relationshipWithRecord_relationshipEventRecords_completion___block_invoke;
      v84[3] = &unk_2644E80B0;
      id v85 = v7;
      v49 = [v8 objectsPassingTest:v84];
      ((void (**)(id, void *, id))v9)[2](v9, v77, v49);

      v50 = v85;
    }

    long long v39 = v77;
LABEL_52:

LABEL_53:
    goto LABEL_54;
  }
  ASLoggingInitialize();
  uint64_t v11 = ASLogCloudKit;
  if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
    +[ASRelationship(CloudKitCodingSupport) _relationshipWithRecord:relationshipEventRecords:completion:](v10, v11);
  }
  v9[2](v9, 0, v8);
LABEL_54:
}

uint64_t __101__ASRelationship_CloudKitCodingSupport___relationshipWithRecord_relationshipEventRecords_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 parent];
  v4 = [v3 recordID];
  v5 = [*(id *)(a1 + 32) recordID];
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

+ (id)relationshipWithCodableRelationship:(id)a3 version:(int64_t)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(ASRelationship);
  [(ASRelationship *)v6 setVersion:a4];
  id v7 = (void *)MEMORY[0x263F08C38];
  id v8 = [v5 uuid];
  unint64_t v9 = objc_msgSend(v7, "hk_UUIDWithData:", v8);
  [(ASRelationship *)v6 setUUID:v9];

  uint64_t v10 = [v5 incomingHandshakeToken];
  [(ASRelationship *)v6 setIncomingHandshakeToken:v10];

  uint64_t v11 = [v5 outgoingHandshakeToken];
  [(ASRelationship *)v6 setOutgoingHandshakeToken:v11];

  uint64_t v12 = [v5 cloudKitAddress];
  [(ASRelationship *)v6 setCloudKitAddress:v12];

  id v13 = [v5 addresses];
  id v14 = ASConsolidateAddresses(v13);
  [(ASRelationship *)v6 setAddresses:v14];

  unint64_t v15 = [v5 preferredReachableAddress];
  [(ASRelationship *)v6 setPreferredReachableAddress:v15];

  id v16 = [v5 preferredReachableService];
  uint64_t v36 = v6;
  [(ASRelationship *)v6 setPreferredReachableService:v16];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v17 = [v5 events];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v38;
    unint64_t v21 = (void *)MEMORY[0x263EFFA68];
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v24 = v23;
          v25 = +[ASRelationshipEvent _relationshipEventWithCodable:v24];
          uint64_t v26 = [v21 arrayByAddingObject:v25];

          unint64_t v21 = (void *)v26;
        }
        else
        {
          ASLoggingInitialize();
          id v27 = (void *)ASLogCloudKit;
          if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
            +[ASRelationship(CloudKitCodingSupport) relationshipWithCodableRelationship:(uint64_t)v23 version:&v42];
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v19);
  }
  else
  {
    unint64_t v21 = (void *)MEMORY[0x263EFFA68];
  }

  [(ASRelationship *)v36 setRelationshipEvents:v21];
  -[ASRelationship setSupportedPhoneFeatures:](v36, "setSupportedPhoneFeatures:", [v5 supportedPhoneFeatures]);
  -[ASRelationship setSupportedWatchFeatures:](v36, "setSupportedWatchFeatures:", [v5 supportedWatchFeatures]);
  -[ASRelationship setCloudType:](v36, "setCloudType:", [v5 cloudType]);
  id v28 = [v5 secureCloudUpgradeToken];
  [(ASRelationship *)v36 setSecureCloudUpgradeToken:v28];

  v29 = (objc_class *)objc_opt_class();
  id v30 = [v5 sentInvitation];
  id v31 = ASSecureUnarchiveClassWithData(v29, v30);
  [(ASRelationship *)v36 setSentInvitation:v31];

  v32 = (objc_class *)objc_opt_class();
  long long v33 = [v5 receivedInvitation];
  id v34 = ASSecureUnarchiveClassWithData(v32, v33);
  [(ASRelationship *)v36 setReceivedInvitation:v34];

  [(ASRelationship *)v36 consolidateIfNeeded];

  return v36;
}

+ (id)relationshipsWithRelationshipAndEventRecords:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 objectsPassingTest:&__block_literal_global];
  id v16 = [v3 objectsPassingTest:&__block_literal_global_449];
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __86__ASRelationship_CloudKitCodingSupport__relationshipsWithRelationshipAndEventRecords___block_invoke_3;
        v17[3] = &unk_2644E80F8;
        id v18 = v5;
        id v19 = v6;
        +[ASRelationship _relationshipWithRecord:v11 relationshipEventRecords:v16 completion:v17];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  uint64_t v12 = (void *)[v16 mutableCopy];
  [v12 removeObjectsInArray:v6];
  if ([v12 count])
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
      +[ASRelationship(CloudKitCodingSupport) relationshipsWithRelationshipAndEventRecords:]();
    }
  }
  id v13 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];

  return v13;
}

uint64_t __86__ASRelationship_CloudKitCodingSupport__relationshipsWithRelationshipAndEventRecords___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:@"ActivitySharingRelationship"];

  return v3;
}

uint64_t __86__ASRelationship_CloudKitCodingSupport__relationshipsWithRelationshipAndEventRecords___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:@"ActivitySharingRelationshipEvent"];

  return v3;
}

void __86__ASRelationship_CloudKitCodingSupport__relationshipsWithRelationshipAndEventRecords___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = [v7 allObjects];
  [v5 addObjectsFromArray:v6];
}

- (id)codableRelationshipContainerIncludingCloudKitFields:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(ASCodableRelationshipContainer);
  uint64_t v6 = [(ASRelationship *)self codableRelationship];
  [(ASCodableRelationshipContainer *)v5 setRelationship:v6];

  [(ASCodableRelationshipContainer *)v5 setVersion:[(ASRelationship *)self version]];
  if (v3)
  {
    id v7 = [(ASRelationship *)self systemFieldsOnlyRecord];

    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x263F08910];
      uint64_t v9 = [(ASRelationship *)self systemFieldsOnlyRecord];
      uint64_t v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];
      [(ASCodableRelationshipContainer *)v5 setSystemFieldsOnlyRecord:v10];
    }
    uint64_t v11 = [(ASRelationship *)self relationshipShareID];

    if (v11)
    {
      uint64_t v12 = (void *)MEMORY[0x263F08910];
      id v13 = [(ASRelationship *)self relationshipShareID];
      id v14 = [v12 archivedDataWithRootObject:v13 requiringSecureCoding:1 error:0];
      [(ASCodableRelationshipContainer *)v5 setRelationshipShareID:v14];
    }
    unint64_t v15 = [(ASRelationship *)self remoteRelationshipShareID];

    if (v15)
    {
      id v16 = (void *)MEMORY[0x263F08910];
      id v17 = [(ASRelationship *)self remoteRelationshipShareID];
      id v18 = [v16 archivedDataWithRootObject:v17 requiringSecureCoding:1 error:0];
      [(ASCodableRelationshipContainer *)v5 setRemoteRelationshipShareID:v18];
    }
    id v19 = [(ASRelationship *)self remoteActivityDataShareID];

    if (v19)
    {
      long long v20 = (void *)MEMORY[0x263F08910];
      long long v21 = [(ASRelationship *)self remoteActivityDataShareID];
      long long v22 = [v20 archivedDataWithRootObject:v21 requiringSecureCoding:1 error:0];
      [(ASCodableRelationshipContainer *)v5 setRemoteActivityShareID:v22];
    }
    if (ASSecureCloudEnabled() && v3)
    {
      long long v23 = [(ASRelationship *)self relationshipZoneShareID];

      if (v23)
      {
        id v24 = (void *)MEMORY[0x263F08910];
        uint64_t v25 = [(ASRelationship *)self relationshipZoneShareID];
        uint64_t v26 = [v24 archivedDataWithRootObject:v25 requiringSecureCoding:1 error:0];
        [(ASCodableRelationshipContainer *)v5 setRelationshipZoneShareID:v26];
      }
      id v27 = [(ASRelationship *)self remoteRelationshipZoneShareID];

      if (v27)
      {
        id v28 = (void *)MEMORY[0x263F08910];
        v29 = [(ASRelationship *)self remoteRelationshipZoneShareID];
        id v30 = [v28 archivedDataWithRootObject:v29 requiringSecureCoding:1 error:0];
        [(ASCodableRelationshipContainer *)v5 setRemoteRelationshipZoneShareID:v30];
      }
    }
  }
  else
  {
    ASSecureCloudEnabled();
  }

  return v5;
}

+ (id)relationshipWithCodableRelationshipContainer:(id)a3
{
  id v3 = a3;
  v4 = [v3 relationship];
  id v5 = +[ASRelationship relationshipWithCodableRelationship:version:](ASRelationship, "relationshipWithCodableRelationship:version:", v4, [v3 version]);
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = [v3 systemFieldsOnlyRecord];
  uint64_t v8 = ASSecureUnarchiveClassWithDataAndStrictness(v6, v7, 0);
  [v5 setSystemFieldsOnlyRecord:v8];

  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = [v3 relationshipShareID];
  uint64_t v11 = ASSecureUnarchiveClassWithDataAndStrictness(v9, v10, 0);
  [v5 setRelationshipShareID:v11];

  uint64_t v12 = (objc_class *)objc_opt_class();
  id v13 = [v3 remoteRelationshipShareID];
  id v14 = ASSecureUnarchiveClassWithDataAndStrictness(v12, v13, 0);
  [v5 setRemoteRelationshipShareID:v14];

  unint64_t v15 = (objc_class *)objc_opt_class();
  id v16 = [v3 remoteActivityShareID];
  id v17 = ASSecureUnarchiveClassWithDataAndStrictness(v15, v16, 0);
  [v5 setRemoteActivityDataShareID:v17];

  if (ASSecureCloudEnabled())
  {
    id v18 = (objc_class *)objc_opt_class();
    id v19 = [v3 relationshipZoneShareID];
    long long v20 = ASSecureUnarchiveClassWithDataAndStrictness(v18, v19, 0);
    [v5 setRelationshipZoneShareID:v20];

    long long v21 = (objc_class *)objc_opt_class();
    long long v22 = [v3 remoteRelationshipZoneShareID];
    long long v23 = ASSecureUnarchiveClassWithDataAndStrictness(v21, v22, 0);
    [v5 setRemoteRelationshipZoneShareID:v23];
  }

  return v5;
}

- (ASRelationship)initWithIdentifier:(id)a3 cloudType:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASRelationship;
  uint64_t v8 = [(ASRelationship *)&v12 init];
  uint64_t v9 = v8;
  if (v8)
  {
    relationshipEvents = v8->_relationshipEvents;
    v8->_relationshipEvents = (NSArray *)MEMORY[0x263EFFA68];

    objc_storeStrong((id *)&v9->_UUID, a3);
    v9->_supportedPhoneFeatures = ASSupportedPhoneFeaturesForCurrentDevice();
    v9->_supportedWatchFeatures = ASSupportedWatchFeaturesForCurrentDevice();
    v9->_cloudType = a4;
  }

  return v9;
}

- (ASRelationship)init
{
  id v3 = [MEMORY[0x263F08C38] UUID];
  v4 = [(ASRelationship *)self initWithIdentifier:v3 cloudType:0];

  return v4;
}

- (NSString)secureCloudZoneName
{
  v2 = NSString;
  id v3 = [(NSUUID *)self->_UUID UUIDString];
  v4 = [v2 stringWithFormat:@"RelationshipZone-%@", v3];

  return (NSString *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 56) = self->_version;
  objc_storeStrong((id *)(v5 + 64), self->_UUID);
  objc_storeStrong((id *)(v5 + 80), self->_outgoingHandshakeToken);
  objc_storeStrong((id *)(v5 + 72), self->_incomingHandshakeToken);
  objc_storeStrong((id *)(v5 + 88), self->_cloudKitAddress);
  uint64_t v6 = [(NSSet *)self->_addresses copyWithZone:a3];
  id v7 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v6;

  objc_storeStrong((id *)(v5 + 104), self->_preferredReachableAddress);
  objc_storeStrong((id *)(v5 + 112), self->_preferredReachableService);
  objc_storeStrong((id *)(v5 + 120), self->_systemFieldsOnlyRecord);
  objc_storeStrong((id *)(v5 + 128), self->_relationshipShareID);
  objc_storeStrong((id *)(v5 + 136), self->_remoteRelationshipShareID);
  objc_storeStrong((id *)(v5 + 144), self->_remoteActivityDataShareID);
  uint64_t v8 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_relationshipEvents copyItems:0];
  uint64_t v9 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v8;

  *(_DWORD *)(v5 + 44) = self->_supportedPhoneFeatures;
  *(_DWORD *)(v5 + 48) = self->_supportedWatchFeatures;
  *(unsigned char *)(v5 + 40) = self->_needsPushForConsolidation;
  *(void *)(v5 + 160) = self->_cloudType;
  objc_storeStrong((id *)(v5 + 168), self->_relationshipZoneShareID);
  objc_storeStrong((id *)(v5 + 176), self->_remoteRelationshipZoneShareID);
  objc_storeStrong((id *)(v5 + 200), self->_secureCloudUpgradeToken);
  objc_storeStrong((id *)(v5 + 184), self->_sentInvitation);
  objc_storeStrong((id *)(v5 + 192), self->_receivedInvitation);
  [(id)v5 _updateCurrentRelationshipState];
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ASRelationship *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(ASRelationship *)self isEqualToRelationship:v4];
  }

  return v5;
}

- (BOOL)isEqualToRelationship:(id)a3
{
  id v4 = a3;
  int64_t version = self->_version;
  if (version == [v4 version]
    && (unsigned int supportedPhoneFeatures = self->_supportedPhoneFeatures,
        supportedPhoneFeatures == [v4 supportedPhoneFeatures])
    && (unsigned int supportedWatchFeatures = self->_supportedWatchFeatures,
        supportedWatchFeatures == [v4 supportedWatchFeatures]))
  {
    UUID = self->_UUID;
    uint64_t v9 = [v4 UUID];
    if (ASObjectsAreEqual(UUID, v9))
    {
      incomingHandshakeToken = self->_incomingHandshakeToken;
      uint64_t v11 = [v4 incomingHandshakeToken];
      if (ASStringsAreEqual(incomingHandshakeToken, v11))
      {
        outgoingHandshakeToken = self->_outgoingHandshakeToken;
        id v13 = [v4 outgoingHandshakeToken];
        if (ASStringsAreEqual(outgoingHandshakeToken, v13))
        {
          cloudKitAddress = self->_cloudKitAddress;
          unint64_t v15 = [v4 cloudKitAddress];
          if (ASStringsAreEqual(cloudKitAddress, v15))
          {
            preferredReachableAddress = self->_preferredReachableAddress;
            id v17 = [v4 preferredReachableAddress];
            if (ASStringsAreEqual(preferredReachableAddress, v17))
            {
              preferredReachableService = self->_preferredReachableService;
              id v19 = [v4 preferredReachableService];
              if (ASStringsAreEqual(preferredReachableService, v19))
              {
                long long v20 = [(CKRecord *)self->_systemFieldsOnlyRecord recordID];
                uint64_t v44 = [v4 systemFieldsOnlyRecord];
                long long v21 = [v44 recordID];
                if (ASObjectsAreEqual(v20, v21))
                {
                  uint64_t v42 = v20;
                  relationshipShareID = self->_relationshipShareID;
                  uint64_t v43 = [v4 relationshipShareID];
                  if (ASObjectsAreEqual(relationshipShareID, v43))
                  {
                    remoteRelationshipShareID = self->_remoteRelationshipShareID;
                    uint64_t v41 = [v4 remoteRelationshipShareID];
                    if (ASObjectsAreEqual(remoteRelationshipShareID, v41))
                    {
                      remoteActivityDataShareID = self->_remoteActivityDataShareID;
                      long long v40 = [v4 remoteActivityDataShareID];
                      if (ASObjectsAreEqual(remoteActivityDataShareID, v40))
                      {
                        relationshipEvents = self->_relationshipEvents;
                        long long v39 = [v4 relationshipEvents];
                        if (-[NSArray isEqualToArray:](relationshipEvents, "isEqualToArray:")
                          && (unint64_t cloudType = self->_cloudType, cloudType == [v4 cloudType]))
                        {
                          relationshipZoneShareID = self->_relationshipZoneShareID;
                          long long v38 = [v4 relationshipZoneShareID];
                          if (ASObjectsAreEqual(relationshipZoneShareID, v38))
                          {
                            remoteRelationshipZoneShareID = self->_remoteRelationshipZoneShareID;
                            long long v37 = [v4 remoteRelationshipZoneShareID];
                            if (ASObjectsAreEqual(remoteRelationshipZoneShareID, v37))
                            {
                              secureCloudUpgradeToken = self->_secureCloudUpgradeToken;
                              uint64_t v36 = [v4 secureCloudUpgradeToken];
                              if (ASStringsAreEqual(secureCloudUpgradeToken, v36))
                              {
                                sentInvitation = self->_sentInvitation;
                                long long v35 = [v4 sentInvitation];
                                if (ASObjectsAreEqual(sentInvitation, v35))
                                {
                                  receivedInvitation = self->_receivedInvitation;
                                  v32 = objc_msgSend(v4, "receivedInvitation", v35, v36, v37, v38);
                                  char v33 = ASObjectsAreEqual(receivedInvitation, v32);
                                }
                                else
                                {
                                  char v33 = 0;
                                }
                              }
                              else
                              {
                                char v33 = 0;
                              }
                            }
                            else
                            {
                              char v33 = 0;
                            }
                          }
                          else
                          {
                            char v33 = 0;
                          }
                        }
                        else
                        {
                          char v33 = 0;
                        }
                      }
                      else
                      {
                        char v33 = 0;
                      }
                      long long v20 = v42;
                    }
                    else
                    {
                      char v33 = 0;
                      long long v20 = v42;
                    }
                  }
                  else
                  {
                    char v33 = 0;
                    long long v20 = v42;
                  }
                }
                else
                {
                  char v33 = 0;
                }
              }
              else
              {
                char v33 = 0;
              }
            }
            else
            {
              char v33 = 0;
            }
          }
          else
          {
            char v33 = 0;
          }
        }
        else
        {
          char v33 = 0;
        }
      }
      else
      {
        char v33 = 0;
      }
    }
    else
    {
      char v33 = 0;
    }
  }
  else
  {
    char v33 = 0;
  }

  return v33;
}

- (NSString)description
{
  id v3 = _MostRecentEventsWithCount(self->_relationshipEvents, 0xFuLL);
  id v4 = NSString;
  long long v13 = *(_OWORD *)&self->_version;
  cloudKitAddress = self->_cloudKitAddress;
  preferredReachableAddress = self->_preferredReachableAddress;
  uint64_t supportedPhoneFeatures = self->_supportedPhoneFeatures;
  uint64_t supportedWatchFeatures = self->_supportedWatchFeatures;
  uint64_t v9 = [(CKRecord *)self->_systemFieldsOnlyRecord recordChangeTag];
  uint64_t v10 = NSStringFromASCloudType(self->_cloudType);
  uint64_t v11 = [v4 stringWithFormat:@"Relationship v%ld uuid=%@ cloudKitAddress=[%@], preferredAddress=[%@], supportedFeatures=[iOS:%d, wOS:%d] recent events=%@, etag=%@, cloud type=%@", v13, cloudKitAddress, preferredReachableAddress, supportedPhoneFeatures, supportedWatchFeatures, v3, v9, v10];

  return (NSString *)v11;
}

- (id)fullDescription
{
  id v3 = _MostRecentEventsWithCount(self->_relationshipEvents, 0x19uLL);
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v4 appendFormat:@"Relationship v%ld %@ (%@)\n", self->_version, self->_cloudKitAddress, self->_UUID];
  [v4 appendFormat:@"CloudKit Address: %@\n", self->_cloudKitAddress];
  [v4 appendFormat:@"Preferred Reachable Address: %@\n", self->_preferredReachableAddress];
  [v4 appendFormat:@"Preferred Service Identifier: %@\n", self->_preferredReachableService];
  [v4 appendFormat:@"All Addresses: %@\n", self->_addresses];
  [v4 appendFormat:@"Incoming Handshake Token: %@\n", self->_incomingHandshakeToken];
  [v4 appendFormat:@"Outgoing Handshake Token: %@\n", self->_outgoingHandshakeToken];
  BOOL v5 = NSStringFromASCloudType(self->_cloudType);
  [v4 appendFormat:@"Cloud Type: %@\n", v5];

  [v4 appendFormat:@"Sent Invitation: %@\n", self->_sentInvitation];
  [v4 appendFormat:@"Received Invitation: %@\n", self->_receivedInvitation];
  uint64_t v6 = [(CKRecord *)self->_systemFieldsOnlyRecord recordID];
  id v7 = [(CKRecord *)self->_systemFieldsOnlyRecord recordChangeTag];
  [v4 appendFormat:@"Record: %@, etag %@\n", v6, v7];

  [v4 appendFormat:@"Remote Zone Share ID: %@\n", self->_remoteRelationshipZoneShareID];
  [v4 appendFormat:@"Events: %@\n", v3];
  uint64_t v8 = (void *)[v4 copy];

  return v8;
}

- (BOOL)isActivityDataVisible
{
  return (self->_isFriendshipActive || self->_hasOutgoingInviteRequest || self->_sentInviteResponse)
      && !self->_isHidingActivityData;
}

- (BOOL)hasInviteRequestEvent
{
  if ([(ASRelationship *)self hasOutgoingInviteRequest]) {
    return 1;
  }

  return [(ASRelationship *)self hasIncomingInviteRequest];
}

- (void)setRelationshipEvents:(id)a3
{
  id v4 = [a3 sortedArrayUsingComparator:&__block_literal_global_2];
  [(ASRelationship *)self _setRelationshipEvents:v4];
}

- (void)insertEventWithType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [MEMORY[0x263EFF910] date];
  [(ASRelationship *)self insertEventWithType:v3 timestamp:v5];
}

- (void)insertEventWithType:(unsigned __int16)a3 timestamp:(id)a4
{
  uint64_t v4 = a3;
  v9[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [[ASRelationshipEvent alloc] initWithType:v4 anchor:(unsigned __int16)[(ASRelationship *)self _nextAnchor] timestamp:v6];

  v9[0] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [(ASRelationship *)self insertEvents:v8];
}

- (void)insertEvents:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ASLoggingInitialize();
  id v5 = ASLogRelationships;
  if (os_log_type_enabled((os_log_t)ASLogRelationships, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_21EC60000, v5, OS_LOG_TYPE_DEFAULT, "Inserting events: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  id v6 = [(NSArray *)self->_relationshipEvents arrayByAddingObjectsFromArray:v4];
  id v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_2];
  uint64_t v8 = _ConsolidatedEvents(v7);
  [(ASRelationship *)self _setRelationshipEvents:v8];
}

- (NSDate)timestampForMostRecentRelationshipEvent
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NSArray *)self->_relationshipEvents firstObject];
  id v4 = [v3 timestamp];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_relationshipEvents;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "timestamp", (void)v15);
        uint64_t v12 = [v11 compare:v4];

        if (v12 == 1)
        {
          uint64_t v13 = [v10 timestamp];

          id v4 = (void *)v13;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return (NSDate *)v4;
}

- (id)relationshipSnapshotForDate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(ASRelationship *)self copy];
  uint64_t v6 = [v5 relationshipEvents];
  uint64_t v7 = (void *)MEMORY[0x263F08A98];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = ___EventsPriorToDate_block_invoke;
  v12[3] = &unk_2644E82C8;
  id v13 = v4;
  id v8 = v4;
  int v9 = [v7 predicateWithBlock:v12];
  id v10 = [v6 filteredArrayUsingPredicate:v9];

  [v5 setRelationshipEvents:v10];

  return v5;
}

- (void)traverseRelationshipHistoryStartingAtEventWithAnchor:(unint64_t)a3 block:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  while (a3 <= [(ASRelationship *)self currentRelationshipEventAnchor])
  {
    uint64_t v7 = (void *)[(ASRelationship *)self copy];
    relationshipEvents = self->_relationshipEvents;
    ++a3;
    int v9 = (void *)MEMORY[0x263F08A98];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ___EventsPriorToAnchor_block_invoke;
    v13[3] = &__block_descriptor_40_e46_B24__0__ASRelationshipEvent_8__NSDictionary_16l;
    v13[4] = a3;
    id v10 = relationshipEvents;
    uint64_t v11 = [v9 predicateWithBlock:v13];
    uint64_t v12 = [(NSArray *)v10 filteredArrayUsingPredicate:v11];

    [v7 setRelationshipEvents:v12];
    v6[2](v6, v7);
  }
}

- (unint64_t)currentRelationshipEventAnchor
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_relationshipEvents;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        unsigned int v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "anchor", (void)v10);
        if (v5 <= v8) {
          int64_t v5 = v8;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)supportsCompetitions
{
  if (self->_supportedPhoneFeatures) {
    return 1;
  }
  else {
    return self->_supportedWatchFeatures & 1;
  }
}

- (void)consolidateIfNeeded
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_relationshipEvents;
  if ([(NSArray *)v3 count] >= 0x32)
  {
    ASLoggingInitialize();
    uint64_t v4 = ASLogRelationships;
    if (os_log_type_enabled((os_log_t)ASLogRelationships, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      int v9 = self;
      _os_log_impl(&dword_21EC60000, v4, OS_LOG_TYPE_DEFAULT, "Relationship needs consolidation %@", (uint8_t *)&v8, 0xCu);
    }
    int64_t v5 = _ConsolidatedEvents(v3);
    [(ASRelationship *)self _setRelationshipEvents:v5];
    uint64_t v6 = [(NSArray *)v3 count];
    if ((unint64_t)(v6 - [v5 count]) >= 0x15)
    {
      ASLoggingInitialize();
      uint64_t v7 = ASLogRelationships;
      if (os_log_type_enabled((os_log_t)ASLogRelationships, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        int v9 = self;
        _os_log_impl(&dword_21EC60000, v7, OS_LOG_TYPE_DEFAULT, "Relationship needs push for significant consolidation %@", (uint8_t *)&v8, 0xCu);
      }
      self->_needsPushForConsolidation = 1;
    }
  }
}

- (void)_setRelationshipEvents:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipEvents, a3);

  [(ASRelationship *)self _updateCurrentRelationshipState];
}

- (unint64_t)_nextAnchor
{
  return [(ASRelationship *)self currentRelationshipEventAnchor] + 1;
}

- (void)_clearRelationshipState
{
  self->_isHidingActivityData = 0;
  *(void *)&self->_isFriendshipActive = 0;
  *(_DWORD *)&self->_hasOutgoingCompetitionRequest = 0;
  dateForLatestOutgoingInviteRequest = self->_dateForLatestOutgoingInviteRequest;
  self->_dateForLatestOutgoingInviteRequest = 0;

  dateForLatestDataHidden = self->_dateForLatestDataHidden;
  self->_dateForLatestDataHidden = 0;

  dateForLatestRelationshipStart = self->_dateForLatestRelationshipStart;
  self->_dateForLatestRelationshipStart = 0;

  dateForLatestRelationshipEnd = self->_dateForLatestRelationshipEnd;
  self->_dateForLatestRelationshipEnd = 0;

  dateForLatestSupportedFeaturesUpdate = self->_dateForLatestSupportedFeaturesUpdate;
  self->_dateForLatestSupportedFeaturesUpdate = 0;

  dateActivityDataInitiallyBecameVisible = self->_dateActivityDataInitiallyBecameVisible;
  self->_dateActivityDataInitiallyBecameVisible = 0;

  dateForLatestIncomingCompetitionRequest = self->_dateForLatestIncomingCompetitionRequest;
  self->_dateForLatestIncomingCompetitionRequest = 0;

  dateForLatestOutgoingCompetitionRequest = self->_dateForLatestOutgoingCompetitionRequest;
  self->_dateForLatestOutgoingCompetitionRequest = 0;

  dateForLatestIgnoredCompetitionRequest = self->_dateForLatestIgnoredCompetitionRequest;
  self->_dateForLatestIgnoredCompetitionRequest = 0;

  dateForLatestFriendshipDidBegin = self->_dateForLatestFriendshipDidBegin;
  self->_dateForLatestFriendshipDidBegin = 0;

  *(void *)&self->_secureCloudUpgradeAvailable = 0;
  *(void *)&self->_secureCloudDowngradeRequested = 0;
  *(_DWORD *)&self->_secureCloudNeedsRepair = 0;
  dateForLatestUpgradeCompleted = self->_dateForLatestUpgradeCompleted;
  self->_dateForLatestUpgradeCompleted = 0;

  dateForLatestUpgradeAvailableUnavailableChange = self->_dateForLatestUpgradeAvailableUnavailableChange;
  self->_dateForLatestUpgradeAvailableUnavailableChange = 0;

  dateForLatestUpgradeFailure = self->_dateForLatestUpgradeFailure;
  self->_dateForLatestUpgradeFailure = 0;

  dateForLatestOutgoingUpgradeRequest = self->_dateForLatestOutgoingUpgradeRequest;
  self->_dateForLatestOutgoingUpgradeRequest = 0;

  dateForLatestIncomingUpgradeRequest = self->_dateForLatestIncomingUpgradeRequest;
  self->_dateForLatestIncomingUpgradeRequest = 0;

  dateForLatestMigrationStarted = self->_dateForLatestMigrationStarted;
  self->_dateForLatestMigrationStarted = 0;

  dateForLatestMigrationCompleted = self->_dateForLatestMigrationCompleted;
  self->_dateForLatestMigrationCompleted = 0;

  dateForLatestMigrationFailed = self->_dateForLatestMigrationFailed;
  self->_dateForLatestMigrationFailed = 0;

  dateForLatestInviteRequestEvent = self->_dateForLatestInviteRequestEvent;
  self->_dateForLatestInviteRequestEvent = 0;

  dateForLatestRepairRequest = self->_dateForLatestRepairRequest;
  self->_dateForLatestRepairRequest = 0;

  dateForLatestDowngradeCompleted = self->_dateForLatestDowngradeCompleted;
  self->_dateForLatestDowngradeCompleted = 0;

  dateForLatestDowngradeNeedsAcknowledgement = self->_dateForLatestDowngradeNeedsAcknowledgement;
  self->_dateForLatestDowngradeNeedsAcknowledgement = 0;
}

- (void)_updateDateActivityDataBecameVisibleWithDate:(id)a3
{
  id v5 = a3;
  if (!self->_dateActivityDataInitiallyBecameVisible)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_dateActivityDataInitiallyBecameVisible, a3);
    id v5 = v6;
  }
}

- (void)_updateDateFriendshipBeganWithDate:(id)a3
{
  id v5 = a3;
  if (!self->_dateForLatestRelationshipStart)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_dateForLatestRelationshipStart, a3);
    id v5 = v6;
  }
}

- (void)_updateCurrentRelationshipState
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  [(ASRelationship *)self _clearRelationshipState];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v3 = self->_relationshipEvents;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        int v9 = objc_msgSend(v8, "type", (void)v41);
        if (v9 <= 199)
        {
          switch(v9)
          {
            case 1:
LABEL_10:
              uint64_t v10 = [v8 timestamp];
              dateForLatestInviteRequestEvent = self->_dateForLatestInviteRequestEvent;
              self->_dateForLatestInviteRequestEvent = v10;

              self->_hasOutgoingInviteRequest = 1;
              long long v12 = [v8 timestamp];
              dateForLatestOutgoingInviteRequest = self->_dateForLatestOutgoingInviteRequest;
              self->_dateForLatestOutgoingInviteRequest = v12;

              goto LABEL_52;
            case 2:
              *(_WORD *)&self->_isAwaitingInviteResponse = 256;
LABEL_52:
              long long v39 = [v8 timestamp];
              [(ASRelationship *)self _updateDateActivityDataBecameVisibleWithDate:v39];

              continue;
            case 3:
LABEL_15:
              [(ASRelationship *)self _clearRelationshipState];
              continue;
            case 4:
LABEL_16:
              [(ASRelationship *)self _clearRelationshipState];
              uint64_t v20 = [v8 timestamp];
              dateForLatestRelationshipEnd = self->_dateForLatestRelationshipEnd;
              self->_dateForLatestRelationshipEnd = v20;
              goto LABEL_54;
            case 5:
              self->_isHidingActivityData = 1;
              long long v22 = [v8 timestamp];
              dateForLatestRelationshipEnd = self->_dateForLatestDataHidden;
              self->_dateForLatestDataHidden = v22;
              goto LABEL_54;
            case 6:
              self->_isHidingActivityData = 0;
              continue;
            case 7:
              self->_hasIncomingInviteRequest = 0;
              self->_isAwaitingInviteResponse = 0;
              continue;
            case 8:
              self->_isMuteEnabled = 1;
              continue;
            case 9:
              self->_isMuteEnabled = 0;
              continue;
            case 10:
              self->_hasOutgoingCompetitionRequest = 1;
              self->_isAwaitingCompetitionResponse = 1;
              self->_hasCompletedCompetition = 0;
              long long v23 = [v8 timestamp];
              dateForLatestRelationshipEnd = self->_dateForLatestOutgoingCompetitionRequest;
              self->_dateForLatestOutgoingCompetitionRequest = v23;
              goto LABEL_54;
            case 11:
LABEL_17:
              *(_WORD *)&self->_isAwaitingCompetitionResponse = 256;
              continue;
            case 12:
              self->_hasIncomingCompetitionRequest = 0;
              self->_hasIgnoredCompetitionRequest = 1;
              uint64_t v26 = [v8 timestamp];
              dateForLatestRelationshipEnd = self->_dateForLatestIgnoredCompetitionRequest;
              self->_dateForLatestIgnoredCompetitionRequest = v26;
              goto LABEL_54;
            case 13:
              continue;
            case 14:
              *(_WORD *)&self->_hasIncomingCompetitionRequest = 0;
              self->_hasCompletedCompetition = 1;
              *(_WORD *)&self->_isAwaitingCompetitionResponse = 0;
              dateForLatestOutgoingCompetitionRequest = self->_dateForLatestOutgoingCompetitionRequest;
              self->_dateForLatestOutgoingCompetitionRequest = 0;

              dateForLatestRelationshipEnd = self->_dateForLatestIncomingCompetitionRequest;
              self->_dateForLatestIncomingCompetitionRequest = 0;
              goto LABEL_54;
            case 15:
              uint64_t v25 = [v8 timestamp];
              dateForLatestRelationshipEnd = self->_dateForLatestSupportedFeaturesUpdate;
              self->_dateForLatestSupportedFeaturesUpdate = v25;
LABEL_54:

              break;
            default:
              switch(v9)
              {
                case 'd':
LABEL_14:
                  long long v16 = [v8 timestamp];
                  long long v17 = self->_dateForLatestInviteRequestEvent;
                  self->_dateForLatestInviteRequestEvent = v16;

                  self->_hasIncomingInviteRequest = 1;
                  long long v18 = [v8 timestamp];
                  dateForLatestIncomingInviteRequest = self->_dateForLatestIncomingInviteRequest;
                  self->_dateForLatestIncomingInviteRequest = v18;

                  self->_isAwaitingInviteResponse = 1;
                  break;
                case 'f':
                  goto LABEL_15;
                case 'g':
                  self->_isFriendshipActive = 1;
                  *(_DWORD *)&self->_hasIncomingInviteRequest = 0;
                  uint64_t v36 = [v8 timestamp];
                  dateForLatestFriendshipDidBegin = self->_dateForLatestFriendshipDidBegin;
                  self->_dateForLatestFriendshipDidBegin = v36;

                  long long v38 = [v8 timestamp];
                  [(ASRelationship *)self _updateDateFriendshipBeganWithDate:v38];

                  goto LABEL_52;
                case 'h':
                  goto LABEL_16;
                case 'i':
                  self->_hasIncomingCompetitionRequest = 1;
                  self->_hasCompletedCompetition = 0;
                  self->_hasIgnoredCompetitionRequest = 0;
                  long long v40 = [v8 timestamp];
                  dateForLatestRelationshipEnd = self->_dateForLatestIncomingCompetitionRequest;
                  self->_dateForLatestIncomingCompetitionRequest = v40;
                  goto LABEL_54;
                case 'j':
                  goto LABEL_17;
                default:
                  continue;
              }
              break;
          }
        }
        else
        {
          switch(v9)
          {
            case 200:
              goto LABEL_10;
            case 201:
              self->_secureCloudUpgradeAvailable = 1;
              goto LABEL_32;
            case 202:
              self->_secureCloudUpgradeAvailable = 0;
LABEL_32:
              id v28 = [v8 timestamp];
              dateForLatestRelationshipEnd = self->_dateForLatestUpgradeAvailableUnavailableChange;
              self->_dateForLatestUpgradeAvailableUnavailableChange = v28;
              goto LABEL_54;
            case 203:
              self->_secureCloudUpgradeFailed = 0;
              self->_hasOutgoingSecureCloudUpgradeRequest = 1;
              v29 = [v8 timestamp];
              dateForLatestRelationshipEnd = self->_dateForLatestOutgoingUpgradeRequest;
              self->_dateForLatestOutgoingUpgradeRequest = v29;
              goto LABEL_54;
            case 204:
LABEL_18:
              *(_DWORD *)&self->_hasOutgoingSecureCloudUpgradeRequest = 0x1000000;
              long long v21 = [v8 timestamp];
              dateForLatestRelationshipEnd = self->_dateForLatestUpgradeFailure;
              self->_dateForLatestUpgradeFailure = v21;
              goto LABEL_54;
            case 205:
              *(_DWORD *)&self->_secureCloudMigrationAvailable = 1;
              self->_secureCloudDowngradeAcknowledged = 0;
              continue;
            case 206:
              *(_WORD *)&self->_secureCloudMigrationStarted = 1;
              self->_secureCloudDowngradeCompleted = 0;
              id v30 = [v8 timestamp];
              dateForLatestRelationshipEnd = self->_dateForLatestMigrationStarted;
              self->_dateForLatestMigrationStarted = v30;
              goto LABEL_54;
            case 207:
              *(_WORD *)&self->_secureCloudMigrationStarted = 0;
              id v31 = [v8 timestamp];
              dateForLatestRelationshipEnd = self->_dateForLatestMigrationFailed;
              self->_dateForLatestMigrationFailed = v31;
              goto LABEL_54;
            case 208:
              self->_secureCloudMigrationAvailable = 0;
              self->_secureCloudDowngradeRequested = 1;
              continue;
            case 209:
              *(_WORD *)&self->_secureCloudDowngradeStarted = 1;
              goto LABEL_40;
            case 210:
              *(_WORD *)&self->_secureCloudDowngradeStarted = 256;
LABEL_40:
              self->_secureCloudDowngradeCompleted = 0;
              break;
            case 211:
              self->_secureCloudDowngradeNeedsAcknowledgement = 1;
              v32 = [v8 timestamp];
              dateForLatestRelationshipEnd = self->_dateForLatestDowngradeNeedsAcknowledgement;
              self->_dateForLatestDowngradeNeedsAcknowledgement = v32;
              goto LABEL_54;
            case 212:
              *(_WORD *)&self->_secureCloudDowngradeNeedsAcknowledgement = 256;
              break;
            case 213:
              *(_WORD *)&self->_secureCloudDowngradeNeedsAcknowledgement = 0;
              break;
            case 214:
              self->_secureCloudNeedsZoneDeletion = 1;
              break;
            case 215:
              *(_WORD *)&self->_secureCloudNeedsZoneDeletion = 256;
              break;
            case 216:
              self->_hasOutgoingSecureCloudRepairRequest = 1;
              id v27 = [v8 timestamp];
              dateForLatestRelationshipEnd = self->_dateForLatestRepairRequest;
              self->_dateForLatestRepairRequest = v27;
              goto LABEL_54;
            case 217:
              self->_secureCloudRepairFailed = 1;
              *(_WORD *)&self->_hasOutgoingSecureCloudRepairRequest = 0;
              break;
            case 218:
              *(_DWORD *)&self->_secureCloudNeedsRepair = 0;
              break;
            default:
              switch(v9)
              {
                case 300:
                  goto LABEL_14;
                case 301:
                  self->_secureCloudUpgradeFailed = 0;
                  self->_hasIncomingSecureCloudUpgradeRequest = 1;
                  id v14 = [v8 timestamp];
                  dateForLatestRelationshipEnd = self->_dateForLatestIncomingUpgradeRequest;
                  self->_dateForLatestIncomingUpgradeRequest = v14;
                  goto LABEL_54;
                case 302:
                  goto LABEL_18;
                case 303:
                  *(_DWORD *)&self->_hasOutgoingSecureCloudUpgradeRequest = 0x10000;
                  char v33 = [v8 timestamp];
                  dateForLatestRelationshipEnd = self->_dateForLatestUpgradeCompleted;
                  self->_dateForLatestUpgradeCompleted = v33;
                  goto LABEL_54;
                case 304:
                  self->_secureCloudDowngradeAcknowledged = 0;
                  self->_secureCloudDowngradeCompleted = 0;
                  *(_DWORD *)&self->_secureCloudMigrationAvailable = 0x10000;
                  id v34 = [v8 timestamp];
                  dateForLatestRelationshipEnd = self->_dateForLatestMigrationCompleted;
                  self->_dateForLatestMigrationCompleted = v34;
                  goto LABEL_54;
                case 305:
                  self->_secureCloudMigrationAvailable = 0;
                  *(_DWORD *)&self->_secureCloudMigrationCompleted = 0;
                  *(_WORD *)&self->_secureCloudDowngradeStarted = 0;
                  self->_secureCloudDowngradeCompleted = 1;
                  long long v35 = [v8 timestamp];
                  dateForLatestRelationshipEnd = self->_dateForLatestDowngradeCompleted;
                  self->_dateForLatestDowngradeCompleted = v35;
                  goto LABEL_54;
                case 306:
                  self->_hasIncomingSecureCloudRepairRequest = 1;
                  break;
                default:
                  continue;
              }
              break;
          }
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v5);
  }
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_int64_t version = a3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSString)incomingHandshakeToken
{
  return self->_incomingHandshakeToken;
}

- (void)setIncomingHandshakeToken:(id)a3
{
}

- (NSString)outgoingHandshakeToken
{
  return self->_outgoingHandshakeToken;
}

- (void)setOutgoingHandshakeToken:(id)a3
{
}

- (NSString)cloudKitAddress
{
  return self->_cloudKitAddress;
}

- (void)setCloudKitAddress:(id)a3
{
}

- (NSSet)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
}

- (NSString)preferredReachableAddress
{
  return self->_preferredReachableAddress;
}

- (void)setPreferredReachableAddress:(id)a3
{
}

- (NSString)preferredReachableService
{
  return self->_preferredReachableService;
}

- (void)setPreferredReachableService:(id)a3
{
}

- (CKRecord)systemFieldsOnlyRecord
{
  return self->_systemFieldsOnlyRecord;
}

- (void)setSystemFieldsOnlyRecord:(id)a3
{
}

- (CKRecordID)relationshipShareID
{
  return self->_relationshipShareID;
}

- (void)setRelationshipShareID:(id)a3
{
}

- (CKRecordID)remoteRelationshipShareID
{
  return self->_remoteRelationshipShareID;
}

- (void)setRemoteRelationshipShareID:(id)a3
{
}

- (CKRecordID)remoteActivityDataShareID
{
  return self->_remoteActivityDataShareID;
}

- (void)setRemoteActivityDataShareID:(id)a3
{
}

- (NSArray)relationshipEvents
{
  return self->_relationshipEvents;
}

- (unsigned)supportedPhoneFeatures
{
  return self->_supportedPhoneFeatures;
}

- (void)setSupportedPhoneFeatures:(unsigned int)a3
{
  self->_uint64_t supportedPhoneFeatures = a3;
}

- (unsigned)supportedWatchFeatures
{
  return self->_supportedWatchFeatures;
}

- (void)setSupportedWatchFeatures:(unsigned int)a3
{
  self->_uint64_t supportedWatchFeatures = a3;
}

- (unint64_t)cloudType
{
  return self->_cloudType;
}

- (void)setCloudType:(unint64_t)a3
{
  self->_unint64_t cloudType = a3;
}

- (CKRecordID)relationshipZoneShareID
{
  return self->_relationshipZoneShareID;
}

- (void)setRelationshipZoneShareID:(id)a3
{
}

- (CKRecordID)remoteRelationshipZoneShareID
{
  return self->_remoteRelationshipZoneShareID;
}

- (void)setRemoteRelationshipZoneShareID:(id)a3
{
}

- (IDSSentInvitation)sentInvitation
{
  return self->_sentInvitation;
}

- (void)setSentInvitation:(id)a3
{
}

- (IDSReceivedInvitation)receivedInvitation
{
  return self->_receivedInvitation;
}

- (void)setReceivedInvitation:(id)a3
{
}

- (BOOL)secureCloudUpgradeAvailable
{
  return self->_secureCloudUpgradeAvailable;
}

- (void)setSecureCloudUpgradeAvailable:(BOOL)a3
{
  self->_secureCloudUpgradeAvailable = a3;
}

- (BOOL)hasOutgoingSecureCloudUpgradeRequest
{
  return self->_hasOutgoingSecureCloudUpgradeRequest;
}

- (void)setHasOutgoingSecureCloudUpgradeRequest:(BOOL)a3
{
  self->_hasOutgoingSecureCloudUpgradeRequest = a3;
}

- (BOOL)hasIncomingSecureCloudUpgradeRequest
{
  return self->_hasIncomingSecureCloudUpgradeRequest;
}

- (void)setHasIncomingSecureCloudUpgradeRequest:(BOOL)a3
{
  self->_hasIncomingSecureCloudUpgradeRequest = a3;
}

- (BOOL)secureCloudUpgradeCompleted
{
  return self->_secureCloudUpgradeCompleted;
}

- (void)setSecureCloudUpgradeCompleted:(BOOL)a3
{
  self->_secureCloudUpgradeCompleted = a3;
}

- (BOOL)secureCloudUpgradeFailed
{
  return self->_secureCloudUpgradeFailed;
}

- (void)setSecureCloudUpgradeFailed:(BOOL)a3
{
  self->_secureCloudUpgradeFailed = a3;
}

- (BOOL)secureCloudMigrationAvailable
{
  return self->_secureCloudMigrationAvailable;
}

- (void)setSecureCloudMigrationAvailable:(BOOL)a3
{
  self->_secureCloudMigrationAvailable = a3;
}

- (BOOL)secureCloudMigrationStarted
{
  return self->_secureCloudMigrationStarted;
}

- (void)setSecureCloudMigrationStarted:(BOOL)a3
{
  self->_secureCloudMigrationStarted = a3;
}

- (BOOL)secureCloudMigrationCompleted
{
  return self->_secureCloudMigrationCompleted;
}

- (void)setSecureCloudMigrationCompleted:(BOOL)a3
{
  self->_secureCloudMigrationCompleted = a3;
}

- (BOOL)secureCloudDowngradeRequested
{
  return self->_secureCloudDowngradeRequested;
}

- (void)setSecureCloudDowngradeRequested:(BOOL)a3
{
  self->_secureCloudDowngradeRequested = a3;
}

- (BOOL)secureCloudDowngradeNeedsAcknowledgement
{
  return self->_secureCloudDowngradeNeedsAcknowledgement;
}

- (void)setSecureCloudDowngradeNeedsAcknowledgement:(BOOL)a3
{
  self->_secureCloudDowngradeNeedsAcknowledgement = a3;
}

- (BOOL)secureCloudDowngradeAcknowledged
{
  return self->_secureCloudDowngradeAcknowledged;
}

- (void)setSecureCloudDowngradeAcknowledged:(BOOL)a3
{
  self->_secureCloudDowngradeAcknowledged = a3;
}

- (BOOL)secureCloudDowngradeStarted
{
  return self->_secureCloudDowngradeStarted;
}

- (void)setSecureCloudDowngradeStarted:(BOOL)a3
{
  self->_secureCloudDowngradeStarted = a3;
}

- (BOOL)secureCloudDowngradeFailed
{
  return self->_secureCloudDowngradeFailed;
}

- (void)setSecureCloudDowngradeFailed:(BOOL)a3
{
  self->_secureCloudDowngradeFailed = a3;
}

- (BOOL)secureCloudDowngradeCompleted
{
  return self->_secureCloudDowngradeCompleted;
}

- (void)setSecureCloudDowngradeCompleted:(BOOL)a3
{
  self->_secureCloudDowngradeCompleted = a3;
}

- (BOOL)secureCloudNeedsZoneDeletion
{
  return self->_secureCloudNeedsZoneDeletion;
}

- (void)setSecureCloudNeedsZoneDeletion:(BOOL)a3
{
  self->_secureCloudNeedsZoneDeletion = a3;
}

- (BOOL)secureCloudNeedsRepair
{
  return self->_secureCloudNeedsRepair;
}

- (void)setSecureCloudNeedsRepair:(BOOL)a3
{
  self->_secureCloudNeedsRepair = a3;
}

- (BOOL)hasOutgoingSecureCloudRepairRequest
{
  return self->_hasOutgoingSecureCloudRepairRequest;
}

- (void)setHasOutgoingSecureCloudRepairRequest:(BOOL)a3
{
  self->_hasOutgoingSecureCloudRepairRequest = a3;
}

- (BOOL)hasIncomingSecureCloudRepairRequest
{
  return self->_hasIncomingSecureCloudRepairRequest;
}

- (void)setHasIncomingSecureCloudRepairRequest:(BOOL)a3
{
  self->_hasIncomingSecureCloudRepairRequest = a3;
}

- (BOOL)secureCloudRepairFailed
{
  return self->_secureCloudRepairFailed;
}

- (void)setSecureCloudRepairFailed:(BOOL)a3
{
  self->_secureCloudRepairFailed = a3;
}

- (NSString)secureCloudUpgradeToken
{
  return self->_secureCloudUpgradeToken;
}

- (void)setSecureCloudUpgradeToken:(id)a3
{
}

- (NSDate)dateForLatestUpgradeAvailableUnavailableChange
{
  return self->_dateForLatestUpgradeAvailableUnavailableChange;
}

- (void)setDateForLatestUpgradeAvailableUnavailableChange:(id)a3
{
}

- (NSDate)dateForLatestUpgradeFailure
{
  return self->_dateForLatestUpgradeFailure;
}

- (void)setDateForLatestUpgradeFailure:(id)a3
{
}

- (NSDate)dateForLatestOutgoingUpgradeRequest
{
  return self->_dateForLatestOutgoingUpgradeRequest;
}

- (void)setDateForLatestOutgoingUpgradeRequest:(id)a3
{
}

- (NSDate)dateForLatestIncomingUpgradeRequest
{
  return self->_dateForLatestIncomingUpgradeRequest;
}

- (void)setDateForLatestIncomingUpgradeRequest:(id)a3
{
}

- (NSDate)dateForLatestUpgradeCompleted
{
  return self->_dateForLatestUpgradeCompleted;
}

- (void)setDateForLatestUpgradeCompleted:(id)a3
{
}

- (NSDate)dateForLatestMigrationStarted
{
  return self->_dateForLatestMigrationStarted;
}

- (void)setDateForLatestMigrationStarted:(id)a3
{
}

- (NSDate)dateForLatestMigrationCompleted
{
  return self->_dateForLatestMigrationCompleted;
}

- (void)setDateForLatestMigrationCompleted:(id)a3
{
}

- (NSDate)dateForLatestMigrationFailed
{
  return self->_dateForLatestMigrationFailed;
}

- (void)setDateForLatestMigrationFailed:(id)a3
{
}

- (NSDate)dateForLatestInviteRequestEvent
{
  return self->_dateForLatestInviteRequestEvent;
}

- (void)setDateForLatestInviteRequestEvent:(id)a3
{
}

- (NSDate)dateForLatestRepairRequest
{
  return self->_dateForLatestRepairRequest;
}

- (void)setDateForLatestRepairRequest:(id)a3
{
}

- (NSDate)dateForLatestDowngradeCompleted
{
  return self->_dateForLatestDowngradeCompleted;
}

- (void)setDateForLatestDowngradeCompleted:(id)a3
{
}

- (NSDate)dateForLatestDowngradeNeedsAcknowledgement
{
  return self->_dateForLatestDowngradeNeedsAcknowledgement;
}

- (void)setDateForLatestDowngradeNeedsAcknowledgement:(id)a3
{
}

- (BOOL)isFriendshipActive
{
  return self->_isFriendshipActive;
}

- (void)setIsFriendshipActive:(BOOL)a3
{
  self->_isFriendshipActive = a3;
}

- (BOOL)isMuteEnabled
{
  return self->_isMuteEnabled;
}

- (void)setIsMuteEnabled:(BOOL)a3
{
  self->_isMuteEnabled = a3;
}

- (BOOL)hasIncomingInviteRequest
{
  return self->_hasIncomingInviteRequest;
}

- (void)setHasIncomingInviteRequest:(BOOL)a3
{
  self->_hasIncomingInviteRequest = a3;
}

- (BOOL)hasOutgoingInviteRequest
{
  return self->_hasOutgoingInviteRequest;
}

- (void)setHasOutgoingInviteRequest:(BOOL)a3
{
  self->_hasOutgoingInviteRequest = a3;
}

- (BOOL)isAwaitingInviteResponse
{
  return self->_isAwaitingInviteResponse;
}

- (void)setIsAwaitingInviteResponse:(BOOL)a3
{
  self->_isAwaitingInviteResponse = a3;
}

- (BOOL)sentInviteResponse
{
  return self->_sentInviteResponse;
}

- (void)setSentInviteResponse:(BOOL)a3
{
  self->_sentInviteResponse = a3;
}

- (BOOL)hasIncomingCompetitionRequest
{
  return self->_hasIncomingCompetitionRequest;
}

- (void)setHasIncomingCompetitionRequest:(BOOL)a3
{
  self->_hasIncomingCompetitionRequest = a3;
}

- (BOOL)hasOutgoingCompetitionRequest
{
  return self->_hasOutgoingCompetitionRequest;
}

- (void)setHasOutgoingCompetitionRequest:(BOOL)a3
{
  self->_hasOutgoingCompetitionRequest = a3;
}

- (BOOL)hasIgnoredCompetitionRequest
{
  return self->_hasIgnoredCompetitionRequest;
}

- (void)setHasIgnoredCompetitionRequest:(BOOL)a3
{
  self->_hasIgnoredCompetitionRequest = a3;
}

- (BOOL)isAwaitingCompetitionResponse
{
  return self->_isAwaitingCompetitionResponse;
}

- (void)setIsAwaitingCompetitionResponse:(BOOL)a3
{
  self->_isAwaitingCompetitionResponse = a3;
}

- (BOOL)isCompetitionActive
{
  return self->_isCompetitionActive;
}

- (void)setIsCompetitionActive:(BOOL)a3
{
  self->_isCompetitionActive = a3;
}

- (BOOL)hasCompletedCompetition
{
  return self->_hasCompletedCompetition;
}

- (void)setHasCompletedCompetition:(BOOL)a3
{
  self->_hasCompletedCompetition = a3;
}

- (NSDate)dateForLatestOutgoingCompetitionRequest
{
  return self->_dateForLatestOutgoingCompetitionRequest;
}

- (void)setDateForLatestOutgoingCompetitionRequest:(id)a3
{
}

- (NSDate)dateForLatestIncomingCompetitionRequest
{
  return self->_dateForLatestIncomingCompetitionRequest;
}

- (void)setDateForLatestIncomingCompetitionRequest:(id)a3
{
}

- (NSDate)dateForLatestIgnoredCompetitionRequest
{
  return self->_dateForLatestIgnoredCompetitionRequest;
}

- (void)setDateForLatestIgnoredCompetitionRequest:(id)a3
{
}

- (BOOL)isHidingActivityData
{
  return self->_isHidingActivityData;
}

- (NSDate)dateForLatestDataHidden
{
  return self->_dateForLatestDataHidden;
}

- (void)setDateForLatestDataHidden:(id)a3
{
}

- (NSDate)dateForLatestIncomingInviteRequest
{
  return self->_dateForLatestIncomingInviteRequest;
}

- (void)setDateForLatestIncomingInviteRequest:(id)a3
{
}

- (NSDate)dateForLatestOutgoingInviteRequest
{
  return self->_dateForLatestOutgoingInviteRequest;
}

- (void)setDateForLatestOutgoingInviteRequest:(id)a3
{
}

- (NSDate)dateForLatestRelationshipStart
{
  return self->_dateForLatestRelationshipStart;
}

- (void)setDateForLatestRelationshipStart:(id)a3
{
}

- (NSDate)dateForLatestFriendshipDidBegin
{
  return self->_dateForLatestFriendshipDidBegin;
}

- (void)setDateForLatestFriendshipDidBegin:(id)a3
{
}

- (NSDate)dateActivityDataInitiallyBecameVisible
{
  return self->_dateActivityDataInitiallyBecameVisible;
}

- (void)setDateActivityDataInitiallyBecameVisible:(id)a3
{
}

- (NSDate)dateForLatestRelationshipEnd
{
  return self->_dateForLatestRelationshipEnd;
}

- (void)setDateForLatestRelationshipEnd:(id)a3
{
}

- (NSDate)dateForLatestSupportedFeaturesUpdate
{
  return self->_dateForLatestSupportedFeaturesUpdate;
}

- (void)setDateForLatestSupportedFeaturesUpdate:(id)a3
{
}

- (BOOL)needsPushForConsolidation
{
  return self->_needsPushForConsolidation;
}

- (void)setNeedsPushForConsolidation:(BOOL)a3
{
  self->_needsPushForConsolidation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateForLatestSupportedFeaturesUpdate, 0);
  objc_storeStrong((id *)&self->_dateForLatestRelationshipEnd, 0);
  objc_storeStrong((id *)&self->_dateActivityDataInitiallyBecameVisible, 0);
  objc_storeStrong((id *)&self->_dateForLatestFriendshipDidBegin, 0);
  objc_storeStrong((id *)&self->_dateForLatestRelationshipStart, 0);
  objc_storeStrong((id *)&self->_dateForLatestOutgoingInviteRequest, 0);
  objc_storeStrong((id *)&self->_dateForLatestIncomingInviteRequest, 0);
  objc_storeStrong((id *)&self->_dateForLatestDataHidden, 0);
  objc_storeStrong((id *)&self->_dateForLatestIgnoredCompetitionRequest, 0);
  objc_storeStrong((id *)&self->_dateForLatestIncomingCompetitionRequest, 0);
  objc_storeStrong((id *)&self->_dateForLatestOutgoingCompetitionRequest, 0);
  objc_storeStrong((id *)&self->_dateForLatestDowngradeNeedsAcknowledgement, 0);
  objc_storeStrong((id *)&self->_dateForLatestDowngradeCompleted, 0);
  objc_storeStrong((id *)&self->_dateForLatestRepairRequest, 0);
  objc_storeStrong((id *)&self->_dateForLatestInviteRequestEvent, 0);
  objc_storeStrong((id *)&self->_dateForLatestMigrationFailed, 0);
  objc_storeStrong((id *)&self->_dateForLatestMigrationCompleted, 0);
  objc_storeStrong((id *)&self->_dateForLatestMigrationStarted, 0);
  objc_storeStrong((id *)&self->_dateForLatestUpgradeCompleted, 0);
  objc_storeStrong((id *)&self->_dateForLatestIncomingUpgradeRequest, 0);
  objc_storeStrong((id *)&self->_dateForLatestOutgoingUpgradeRequest, 0);
  objc_storeStrong((id *)&self->_dateForLatestUpgradeFailure, 0);
  objc_storeStrong((id *)&self->_dateForLatestUpgradeAvailableUnavailableChange, 0);
  objc_storeStrong((id *)&self->_secureCloudUpgradeToken, 0);
  objc_storeStrong((id *)&self->_receivedInvitation, 0);
  objc_storeStrong((id *)&self->_sentInvitation, 0);
  objc_storeStrong((id *)&self->_remoteRelationshipZoneShareID, 0);
  objc_storeStrong((id *)&self->_relationshipZoneShareID, 0);
  objc_storeStrong((id *)&self->_relationshipEvents, 0);
  objc_storeStrong((id *)&self->_remoteActivityDataShareID, 0);
  objc_storeStrong((id *)&self->_remoteRelationshipShareID, 0);
  objc_storeStrong((id *)&self->_relationshipShareID, 0);
  objc_storeStrong((id *)&self->_systemFieldsOnlyRecord, 0);
  objc_storeStrong((id *)&self->_preferredReachableService, 0);
  objc_storeStrong((id *)&self->_preferredReachableAddress, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_cloudKitAddress, 0);
  objc_storeStrong((id *)&self->_outgoingHandshakeToken, 0);
  objc_storeStrong((id *)&self->_incomingHandshakeToken, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end