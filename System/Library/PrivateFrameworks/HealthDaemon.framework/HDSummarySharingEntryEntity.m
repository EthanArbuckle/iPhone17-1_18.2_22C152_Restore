@interface HDSummarySharingEntryEntity
+ (BOOL)enumerateCodableEntriesWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)enumerateCodableEntriesWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6;
+ (BOOL)insertOrReplaceCodableEntry:(id)a3 CNContactIdentifier:(id)a4 shouldPause:(BOOL)a5 syncProvenance:(int64_t)a6 transaction:(id)a7 error:(id *)a8;
+ (BOOL)updateNotificationStatusForInvitiationWithUUID:(id)a3 newNotificationStatus:(int64_t)a4 dateModified:(id)a5 profile:(id)a6 error:(id *)a7;
+ (BOOL)updateOwnerParticipant:(id)a3 cloudKitIdentifier:(id)a4 predicate:(id)a5 profile:(id)a6 error:(id *)a7;
+ (BOOL)updateStatus:(int64_t)a3 dateModified:(id)a4 dateAccepted:(id)a5 predicate:(id)a6 profile:(id)a7 error:(id *)a8;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_pauseKeyForEntryUUIDString:(uint64_t)a1;
+ (id)_propertiesForEntity;
+ (id)anyWithUUID:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)codableWithRow:(HDSQLiteRow *)a3;
+ (id)databaseTable;
+ (id)indices;
+ (id)propertyForSyncProvenance;
+ (int64_t)protectionClass;
+ (uint64_t)_readPauseStateForEntryWithUUIDString:(uint64_t)a1;
+ (void)updatePauseStateForEntryWithUUID:(id)a3 shouldPause:(BOOL)a4;
@end

@implementation HDSummarySharingEntryEntity

+ (id)databaseTable
{
  return @"summary_sharing_entry";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 20;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_40;
}

+ (id)indices
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  v3 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:@"status"];
  v4 = [v2 stringWithFormat:@"%@ IN (%ld, %ld)", v3, 0, 1];

  id v5 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v6 = objc_opt_class();
  v11[0] = @"cloudkit_identifier";
  v11[1] = @"type";
  v11[2] = @"direction";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  v8 = (void *)[v5 initWithEntity:v6 name:@"active" columns:v7 unique:1 predicateString:v4];
  v12[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v9;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)_propertiesForEntity
{
  v4[19] = *MEMORY[0x1E4F143B8];
  v4[0] = @"uuid";
  v4[1] = @"invitation_uuid";
  v4[2] = @"CNContact_identifier";
  v4[3] = @"cloudkit_identifier";
  v4[4] = @"primary_contact_identifier";
  v4[5] = @"all_contact_identifiers";
  v4[6] = @"first_name";
  v4[7] = @"last_name";
  v4[8] = @"user_wheelchair_mode";
  v4[9] = @"type";
  v4[10] = @"status";
  v4[11] = @"date_modified";
  v4[12] = @"date_invited";
  v4[13] = @"date_accepted";
  v4[14] = @"setup_metadata";
  v4[15] = @"owner_participant";
  v4[16] = @"direction";
  v4[17] = @"notification_status";
  v4[18] = @"sync_provenance";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:19];

  return v2;
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (BOOL)insertOrReplaceCodableEntry:(id)a3 CNContactIdentifier:(id)a4 shouldPause:(BOOL)a5 syncProvenance:(int64_t)a6 transaction:(id)a7 error:(id *)a8
{
  BOOL v39 = a5;
  id v11 = a3;
  id v41 = a4;
  id v12 = a7;
  v13 = self;
  uint64_t v14 = [v12 protectedDatabase];
  id v15 = objc_alloc(MEMORY[0x1E4F29128]);
  v16 = v11;
  v17 = [v11 uuid];
  v18 = (void *)[v15 initWithUUIDString:v17];

  v19 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"uuid" equalToValue:v18];
  id v47 = 0;
  v40 = (void *)v14;
  v20 = [v13 propertyValueForAnyInDatabase:v14 property:@"date_modified" predicate:v19 error:&v47];
  id v21 = v47;
  v22 = v21;
  if (v20) {
    BOOL v23 = 1;
  }
  else {
    BOOL v23 = v21 == 0;
  }
  if (!v23)
  {
    if (a8)
    {
      BOOL v29 = 0;
      *a8 = v21;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v29 = 0;
    }
    v24 = v16;
    goto LABEL_18;
  }
  v36 = a8;
  id v37 = v12;
  v24 = v16;
  if (v20)
  {
    v25 = (void *)MEMORY[0x1E4F1C9C8];
    [v20 doubleValue];
    v26 = objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:");
    v27 = (void *)MEMORY[0x1E4F1C9C8];
    [v16 dateModified];
    v28 = objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
    if ([v26 isEqualToDate:v28] & 1) == 0 && (objc_msgSend(v26, "hk_isAfterDate:", v28))
    {

      BOOL v29 = 1;
LABEL_18:
      v34 = v41;
      goto LABEL_19;
    }
  }
  v30 = [v12 protectedDatabase];
  v31 = [v13 _propertiesForEntity];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __125__HDSummarySharingEntryEntity__insertOrReplaceCodableEntry_CNContactIdentifier_shouldPause_syncProvenance_transaction_error___block_invoke;
  v42[3] = &unk_1E62FDFC8;
  id v32 = v18;
  id v43 = v32;
  id v44 = v24;
  id v45 = v41;
  int64_t v46 = a6;
  v33 = [v13 insertOrReplaceEntity:1 database:v30 properties:v31 error:v36 bindingHandler:v42];

  if (v39) {
    [v13 updatePauseStateForEntryWithUUID:v32 shouldPause:1];
  }
  BOOL v29 = v33 != 0;

  v34 = v41;
  id v12 = v37;
LABEL_19:

  return v29;
}

void __125__HDSummarySharingEntryEntity__insertOrReplaceCodableEntry_CNContactIdentifier_shouldPause_syncProvenance_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879EF0](a2, @"uuid", *(void *)(a1 + 32));
  v4 = [*(id *)(a1 + 40) invitationUUID];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v6 = [*(id *)(a1 + 40) invitationUUID];
    v7 = (void *)[v5 initWithUUIDString:v6];
    MEMORY[0x1C1879EF0](a2, @"invitation_uuid", v7);
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"invitation_uuid");
  }
  if (*(void *)(a1 + 48)) {
    MEMORY[0x1C1879EC0](a2, @"CNContact_identifier");
  }
  else {
    MEMORY[0x1C1879E90](a2, @"CNContact_identifier");
  }
  v8 = [*(id *)(a1 + 40) cloudKitIdentifier];
  MEMORY[0x1C1879EC0](a2, @"cloudkit_identifier", v8);

  v9 = [*(id *)(a1 + 40) primaryContactIdentifier];
  MEMORY[0x1C1879EC0](a2, @"primary_contact_identifier", v9);

  v10 = [*(id *)(a1 + 40) allContactIdentifiers];
  HDSQLiteBindSecureCodingObjectToProperty();

  id v11 = [*(id *)(a1 + 40) firstName];
  MEMORY[0x1C1879EC0](a2, @"first_name", v11);

  id v12 = [*(id *)(a1 + 40) lastName];
  MEMORY[0x1C1879EC0](a2, @"last_name", v12);

  MEMORY[0x1C1879E80](a2, @"user_wheelchair_mode", (int)[*(id *)(a1 + 40) userWheelchairMode]);
  MEMORY[0x1C1879E80](a2, @"type", (int)[*(id *)(a1 + 40) type]);
  MEMORY[0x1C1879E80](a2, @"status", (int)[*(id *)(a1 + 40) status]);
  [*(id *)(a1 + 40) dateModified];
  MEMORY[0x1C1879E50](a2, @"date_modified");
  if ([*(id *)(a1 + 40) hasDateInvited]) {
    [*(id *)(a1 + 40) dateInvited];
  }
  else {
    v13.n128_f64[0] = CFAbsoluteTimeGetCurrent();
  }
  MEMORY[0x1C1879E50](a2, @"date_invited", v13);
  if ([*(id *)(a1 + 40) hasDateAccepted])
  {
    [*(id *)(a1 + 40) dateAccepted];
    MEMORY[0x1C1879E50](a2, @"date_accepted");
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"date_accepted");
  }
  uint64_t v14 = [*(id *)(a1 + 40) sharingSetupMetadata];
  HDSQLiteBindSecureCodingObjectToProperty();

  id v15 = [*(id *)(a1 + 40) shareOwnerParticipant];
  HDSQLiteBindSecureCodingObjectToProperty();

  MEMORY[0x1C1879E80](a2, @"direction", (int)[*(id *)(a1 + 40) direction]);
  MEMORY[0x1C1879E80](a2, @"notification_status", (int)[*(id *)(a1 + 40) notificationStatus]);

  JUMPOUT(0x1C1879E80);
}

+ (BOOL)updateStatus:(int64_t)a3 dateModified:(id)a4 dateAccepted:(id)a5 predicate:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = [a7 database];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __94__HDSummarySharingEntryEntity_updateStatus_dateModified_dateAccepted_predicate_profile_error___block_invoke;
  v22[3] = &unk_1E62F4188;
  id v23 = v16;
  id v24 = v14;
  id v25 = v15;
  id v26 = a1;
  int64_t v27 = a3;
  id v18 = v15;
  id v19 = v14;
  id v20 = v16;
  LOBYTE(a8) = [a1 performWriteTransactionWithHealthDatabase:v17 error:a8 block:v22];

  return (char)a8;
}

uint64_t __94__HDSummarySharingEntryEntity_updateStatus_dateModified_dateAccepted_predicate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a2;
  id v7 = [v5 alloc];
  v21[0] = @"date_modified";
  v21[1] = @"date_accepted";
  v21[2] = @"status";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  v9 = (void *)[v7 initWithArray:v8];

  v10 = *(void **)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = [v6 protectedDatabase];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __94__HDSummarySharingEntryEntity_updateStatus_dateModified_dateAccepted_predicate_profile_error___block_invoke_2;
  v17[3] = &unk_1E62F3388;
  id v18 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 64);
  id v19 = v13;
  uint64_t v20 = v14;
  uint64_t v15 = [v10 updateProperties:v9 predicate:v11 database:v12 error:a3 bindingHandler:v17];

  return v15;
}

void __94__HDSummarySharingEntryEntity_updateStatus_dateModified_dateAccepted_predicate_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  MEMORY[0x1C1879E50](a2, @"date_modified");
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    [v4 timeIntervalSinceReferenceDate];
    MEMORY[0x1C1879E50](a2, @"date_accepted");
  }
  else
  {
    MEMORY[0x1C1879E90](a2, @"date_accepted");
  }

  JUMPOUT(0x1C1879E80);
}

+ (BOOL)updateOwnerParticipant:(id)a3 cloudKitIdentifier:(id)a4 predicate:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = [a6 database];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __97__HDSummarySharingEntryEntity_updateOwnerParticipant_cloudKitIdentifier_predicate_profile_error___block_invoke;
  v20[3] = &unk_1E62F2E18;
  id v21 = v14;
  id v22 = v12;
  id v23 = v13;
  id v24 = a1;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  LOBYTE(a7) = [a1 performWriteTransactionWithHealthDatabase:v15 error:a7 block:v20];

  return (char)a7;
}

uint64_t __97__HDSummarySharingEntryEntity_updateOwnerParticipant_cloudKitIdentifier_predicate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 56);
  v16[0] = @"owner_participant";
  v16[1] = @"cloudkit_identifier";
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a2;
  v8 = [v6 arrayWithObjects:v16 count:2];
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = [v7 protectedDatabase];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__HDSummarySharingEntryEntity_updateOwnerParticipant_cloudKitIdentifier_predicate_profile_error___block_invoke_2;
  v13[3] = &unk_1E62F3A88;
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  uint64_t v11 = [v5 updateProperties:v8 predicate:v9 database:v10 error:a3 bindingHandler:v13];

  return v11;
}

void __97__HDSummarySharingEntryEntity_updateOwnerParticipant_cloudKitIdentifier_predicate_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32)) {
    HDSQLiteBindSecureCodingObjectToProperty();
  }
  else {
    MEMORY[0x1C1879E90](a2, @"owner_participant");
  }
  if (*(void *)(a1 + 40))
  {
    JUMPOUT(0x1C1879EC0);
  }

  JUMPOUT(0x1C1879E90);
}

+ (BOOL)updateNotificationStatusForInvitiationWithUUID:(id)a3 newNotificationStatus:(int64_t)a4 dateModified:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = [a6 database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __127__HDSummarySharingEntryEntity_updateNotificationStatusForInvitiationWithUUID_newNotificationStatus_dateModified_profile_error___block_invoke;
  v18[3] = &unk_1E62F5200;
  id v21 = a1;
  int64_t v22 = a4;
  id v19 = v12;
  id v20 = v13;
  id v15 = v13;
  id v16 = v12;
  LOBYTE(a7) = [a1 performWriteTransactionWithHealthDatabase:v14 error:a7 block:v18];

  return (char)a7;
}

uint64_t __127__HDSummarySharingEntryEntity_updateNotificationStatusForInvitiationWithUUID_newNotificationStatus_dateModified_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (void *)MEMORY[0x1E4F65D00];
  id v7 = a2;
  v8 = [v6 predicateWithProperty:@"invitation_uuid" equalToValue:v5];
  uint64_t v9 = *(void **)(a1 + 48);
  v17[0] = @"notification_status";
  v17[1] = @"date_modified";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v11 = [v7 protectedDatabase];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __127__HDSummarySharingEntryEntity_updateNotificationStatusForInvitiationWithUUID_newNotificationStatus_dateModified_profile_error___block_invoke_2;
  v14[3] = &unk_1E62F67E8;
  uint64_t v16 = *(void *)(a1 + 56);
  id v15 = *(id *)(a1 + 40);
  uint64_t v12 = [v9 updateProperties:v10 predicate:v8 database:v11 error:a3 bindingHandler:v14];

  return v12;
}

void __127__HDSummarySharingEntryEntity_updateNotificationStatusForInvitiationWithUUID_newNotificationStatus_dateModified_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"notification_status", *(void *)(a1 + 40));
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];

  JUMPOUT(0x1C1879E50);
}

+ (void)updatePauseStateForEntryWithUUID:(id)a3 shouldPause:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 UUIDString];
  +[HDSummarySharingEntryEntity _pauseKeyForEntryUUIDString:]((uint64_t)a1, v6);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v8 = v7;
  if (v4)
  {
    uint64_t v9 = [NSNumber numberWithBool:1];
    [v8 setObject:v9 forKey:v10];
  }
  else
  {
    [v7 removeObjectForKey:v10];
  }
}

+ (id)_pauseKeyForEntryUUIDString:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [NSString stringWithFormat:@"PausedSharing-%@", v2];

  return v3;
}

+ (uint64_t)_readPauseStateForEntryWithUUIDString:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  BOOL v4 = +[HDSummarySharingEntryEntity _pauseKeyForEntryUUIDString:](v3, v2);

  uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 BOOLValue];
  return v7;
}

+ (BOOL)enumerateCodableEntriesWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  uint64_t v12 = [a4 protectedDatabase];
  id v13 = [a1 queryWithDatabase:v12 predicate:v11];

  id v14 = [a1 _propertiesForEntity];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __94__HDSummarySharingEntryEntity_enumerateCodableEntriesWithPredicate_transaction_error_handler___block_invoke;
  void v17[3] = &unk_1E62F87F8;
  id v18 = v10;
  id v19 = a1;
  id v15 = v10;
  LOBYTE(a5) = [v13 enumerateProperties:v14 error:a5 enumerationHandler:v17];

  return (char)a5;
}

uint64_t __94__HDSummarySharingEntryEntity_enumerateCodableEntriesWithPredicate_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = objc_msgSend(*(id *)(a1 + 40), "codableWithRow:");
  uint64_t v7 = HDSQLiteColumnWithNameAsString();
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = [v6 uuid];
  uint64_t v10 = +[HDSummarySharingEntryEntity _readPauseStateForEntryWithUUIDString:](v8, v9);

  id v11 = [[HDSummarySharingEntry alloc] initWithCodableEntry:v6 CNContactIdentifier:v7 isPaused:v10];
  uint64_t v12 = *(void *)(a1 + 32);
  id v18 = 0;
  uint64_t v13 = (*(uint64_t (**)(void))(v12 + 16))();
  id v14 = v18;
  id v15 = v14;
  if ((v13 & 1) == 0)
  {
    id v16 = v14;
    if (v16)
    {
      if (a4) {
        *a4 = v16;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v13;
}

+ (BOOL)enumerateCodableEntriesWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [a4 database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__HDSummarySharingEntryEntity_enumerateCodableEntriesWithPredicate_profile_error_handler___block_invoke;
  void v16[3] = &unk_1E62FB698;
  id v18 = v11;
  id v19 = a1;
  id v17 = v10;
  id v13 = v11;
  id v14 = v10;
  LOBYTE(a5) = [a1 performReadTransactionWithHealthDatabase:v12 error:a5 block:v16];

  return (char)a5;
}

uint64_t __90__HDSummarySharingEntryEntity_enumerateCodableEntriesWithPredicate_profile_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 48);
  id v6 = [a2 protectedDatabase];
  uint64_t v7 = [v5 queryWithDatabase:v6 predicate:*(void *)(a1 + 32)];

  uint64_t v8 = [*(id *)(a1 + 48) _propertiesForEntity];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__HDSummarySharingEntryEntity_enumerateCodableEntriesWithPredicate_profile_error_handler___block_invoke_2;
  v13[3] = &unk_1E62F87F8;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v12;
  long long v14 = v12;
  uint64_t v10 = [v7 enumerateProperties:v8 error:a3 enumerationHandler:v13];

  return v10;
}

uint64_t __90__HDSummarySharingEntryEntity_enumerateCodableEntriesWithPredicate_profile_error_handler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = objc_msgSend(*(id *)(a1 + 40), "codableWithRow:");
  uint64_t v7 = HDSQLiteColumnWithNameAsString();
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [v6 uuid];
  uint64_t v10 = +[HDSummarySharingEntryEntity _readPauseStateForEntryWithUUIDString:](v8, v9);

  id v11 = [[HDSummarySharingEntry alloc] initWithCodableEntry:v6 CNContactIdentifier:v7 isPaused:v10];
  uint64_t v12 = *(void *)(a1 + 32);
  id v18 = 0;
  uint64_t v13 = (*(uint64_t (**)(void))(v12 + 16))();
  id v14 = v18;
  id v15 = v14;
  if ((v13 & 1) == 0)
  {
    id v16 = v14;
    if (v16)
    {
      if (a4) {
        *a4 = v16;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v13;
}

+ (id)codableWithRow:(HDSQLiteRow *)a3
{
  id v15 = HDSQLiteColumnWithNameAsUUID();
  id v14 = HDSQLiteColumnWithNameAsUUID();
  id v21 = HDSQLiteColumnWithNameAsString();
  id v20 = HDSQLiteColumnWithNameAsString();
  objc_opt_class();
  id v19 = HDSQLiteColumnWithNameAsArrayOfClass();
  id v18 = HDSQLiteColumnWithNameAsString();
  uint64_t v3 = HDSQLiteColumnWithNameAsString();
  uint64_t v16 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v4 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v5 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v6 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v7 = HDSQLiteColumnWithNameAsInt64();
  objc_opt_class();
  uint64_t v13 = HDSQLiteColumnWithNameAsObject();
  objc_opt_class();
  uint64_t v12 = HDSQLiteColumnWithNameAsObject();
  uint64_t v8 = HDSQLiteColumnWithNameAsDate();
  id v9 = HDSQLiteColumnWithNameAsDate();
  uint64_t v10 = HDSQLiteColumnWithNameAsDate();
  id v17 = -[HDCodableSummarySharingEntry initWithUUID:invitationUUID:cloudKitIdentifier:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:sharingAuthorizations:userWheelchairMode:type:direction:status:notificationStatus:dateModified:dateInvited:dateAccepted:setupMetadata:ownerParticipant:]([HDCodableSummarySharingEntry alloc], "initWithUUID:invitationUUID:cloudKitIdentifier:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:sharingAuthorizations:userWheelchairMode:type:direction:status:notificationStatus:dateModified:dateInvited:dateAccepted:setupMetadata:ownerParticipant:", v15, v14, v21, v20, v19, v18, v3, 0, v16, v4, v6, v5, v7, v8, v9,
          v10,
          v13,
          v12);

  return v17;
}

+ (id)anyWithUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F65D00];
  id v9 = a4;
  uint64_t v10 = [v8 predicateWithProperty:@"uuid" equalToValue:a3];
  id v11 = [v9 databaseForEntityClass:objc_opt_class()];

  uint64_t v12 = [a1 anyInDatabase:v11 predicate:v10 error:a5];

  return v12;
}

@end