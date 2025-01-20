@interface EKObjectChange
+ (id)CADObjectChangeIDsFromEKObjectChanges:(id)a3;
+ (id)objectChangeWithProperties:(id)a3;
+ (id)processFetchResults:(id)a3;
+ (int)entityType;
+ (int64_t)objectType;
+ (void)callClientResultsHandler:(id)a3 changesTruncated:(BOOL)a4 latestToken:(int64_t)a5 changes:(id)a6;
+ (void)fetchChangesToObjectsOfTypes:(id)a3 inCalendar:(id)a4 resultHandler:(id)a5;
+ (void)fetchChangesToObjectsOfTypes:(id)a3 inSource:(id)a4 resultHandler:(id)a5;
+ (void)fetchChangesToObjectsOfTypes:(id)a3 inStore:(id)a4 resultHandler:(id)a5;
+ (void)fetchObjectChangesInCalendar:(id)a3 resultHandler:(id)a4;
+ (void)fetchObjectChangesInSource:(id)a3 resultHandler:(id)a4;
+ (void)fetchObjectChangesInStore:(id)a3 resultHandler:(id)a4;
+ (void)objectChangesInCalendar:(id)a3 resultHandler:(id)a4;
+ (void)objectChangesInSource:(id)a3 resultHandler:(id)a4;
+ (void)objectChangesInStore:(id)a3 resultHandler:(id)a4;
+ (void)objectChangesOfType:(id)a3 inCalendar:(id)a4 resultHandler:(id)a5;
+ (void)objectChangesOfType:(id)a3 inSource:(id)a4 resultHandler:(id)a5;
+ (void)objectChangesOfType:(id)a3 inStore:(id)a4 resultHandler:(id)a5;
- (BOOL)isEqual:(id)a3;
- (EKObjectChange)initWithChangeProperties:(id)a3;
- (EKObjectID)changedObjectID;
- (id)description;
- (id)serializedPropertiesForConsumingChange;
- (int)changeType;
- (int64_t)changeID;
- (int64_t)sequenceNumber;
- (unint64_t)hash;
@end

@implementation EKObjectChange

- (EKObjectChange)initWithChangeProperties:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKObjectChange;
  v5 = [(EKObjectChange *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"record"];
    changedObjectID = v5->_changedObjectID;
    v5->_changedObjectID = (EKObjectID *)v6;

    v8 = [v4 objectForKeyedSubscript:@"type"];
    v5->_changeType = [v8 integerValue];

    v9 = [v4 objectForKeyedSubscript:@"ROWID"];
    v5->_changeID = [v9 integerValue];

    v10 = [v4 objectForKeyedSubscript:@"sequence_number"];
    v5->_sequenceNumber = [v10 integerValue];
  }
  return v5;
}

+ (id)CADObjectChangeIDsFromEKObjectChanges:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "changedObjectID", (void)v18);
        uint64_t v12 = [v11 databaseID];
        v13 = [NSNumber numberWithInt:v12];
        v14 = [v4 objectForKeyedSubscript:v13];

        if (!v14)
        {
          v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
          v15 = [NSNumber numberWithInt:v12];
          [v4 setObject:v14 forKeyedSubscript:v15];
        }
        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F57418]), "initWithEntityType:changeID:", objc_msgSend((id)objc_opt_class(), "entityType"), objc_msgSend(v10, "changeID"));
        [v14 addObject:v16];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (void)objectChangesInStore:(id)a3 resultHandler:(id)a4
{
}

+ (void)objectChangesInSource:(id)a3 resultHandler:(id)a4
{
}

+ (void)objectChangesInCalendar:(id)a3 resultHandler:(id)a4
{
}

+ (void)objectChangesOfType:(id)a3 inStore:(id)a4 resultHandler:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v12 = [a1 processFetchResults:a5];
  v10 = [v8 connection];

  v11 = [v10 CADOperationProxySync];
  [v11 CADDatabaseFetchObjectChangesForEntityTypes:v9 insideObject:0 reply:v12];
}

+ (void)objectChangesOfType:(id)a3 inSource:(id)a4 resultHandler:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v14 = [a1 processFetchResults:a5];
  v10 = [v8 eventStore];
  v11 = [v10 connection];
  id v12 = [v11 CADOperationProxySync];
  v13 = [v8 CADObjectID];

  [v12 CADDatabaseFetchObjectChangesForEntityTypes:v9 insideObject:v13 reply:v14];
}

+ (void)objectChangesOfType:(id)a3 inCalendar:(id)a4 resultHandler:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v14 = [a1 processFetchResults:a5];
  v10 = [v8 eventStore];
  v11 = [v10 connection];
  id v12 = [v11 CADOperationProxySync];
  v13 = [v8 CADObjectID];

  [v12 CADDatabaseFetchObjectChangesForEntityTypes:v9 insideObject:v13 reply:v14];
}

+ (void)fetchObjectChangesInStore:(id)a3 resultHandler:(id)a4
{
}

+ (void)fetchObjectChangesInSource:(id)a3 resultHandler:(id)a4
{
}

+ (void)fetchObjectChangesInCalendar:(id)a3 resultHandler:(id)a4
{
}

+ (void)fetchChangesToObjectsOfTypes:(id)a3 inStore:(id)a4 resultHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__EKObjectChange_fetchChangesToObjectsOfTypes_inStore_resultHandler___block_invoke;
  v12[3] = &unk_1E5B97DD8;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [a1 objectChangesOfType:a3 inStore:v11 resultHandler:v12];
}

void __69__EKObjectChange_fetchChangesToObjectsOfTypes_inStore_resultHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v7 = a4;
  [*(id *)(a1 + 32) recordSequenceTokenForLegacyClients:v10];
  uint64_t v8 = *(void *)(a1 + 40);
  if (v10) {
    uint64_t v9 = (int)[v10 legacyToken];
  }
  else {
    uint64_t v9 = -1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v9, v7);
}

+ (void)fetchChangesToObjectsOfTypes:(id)a3 inSource:(id)a4 resultHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__EKObjectChange_fetchChangesToObjectsOfTypes_inSource_resultHandler___block_invoke;
  v12[3] = &unk_1E5B97DD8;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [a1 objectChangesOfType:a3 inSource:v11 resultHandler:v12];
}

void __70__EKObjectChange_fetchChangesToObjectsOfTypes_inSource_resultHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a3;
  id v6 = a4;
  if (v8) {
    [v8 legacyToken];
  }
  id v7 = [*(id *)(a1 + 32) eventStore];
  [v7 recordSequenceTokenForLegacyClients:v8];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)fetchChangesToObjectsOfTypes:(id)a3 inCalendar:(id)a4 resultHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__EKObjectChange_fetchChangesToObjectsOfTypes_inCalendar_resultHandler___block_invoke;
  v12[3] = &unk_1E5B97DD8;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [a1 objectChangesOfType:a3 inCalendar:v11 resultHandler:v12];
}

void __72__EKObjectChange_fetchChangesToObjectsOfTypes_inCalendar_resultHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v11 = a3;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) eventStore];
  [v8 recordSequenceTokenForLegacyClients:v11];

  uint64_t v9 = *(void *)(a1 + 40);
  if (v11) {
    uint64_t v10 = (int)[v11 legacyToken];
  }
  else {
    uint64_t v10 = -1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v10, v7);
}

+ (id)processFetchResults:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__EKObjectChange_processFetchResults___block_invoke;
  v7[3] = &unk_1E5B97E00;
  id v8 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1A6266730](v7);

  return v5;
}

void __38__EKObjectChange_processFetchResults___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, void *a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (a2)
  {
    id v11 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __38__EKObjectChange_processFetchResults___block_invoke_cold_1(v11, a2);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    unsigned int v21 = a3;
    id v12 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = +[EKObjectChange objectChangeWithProperties:*(void *)(*((void *)&v22 + 1) + 8 * v17)];
          if (v18) {
            [v12 addObject:v18];
          }

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    uint64_t v19 = *(void *)(a1 + 32);
    long long v20 = [[EKSequenceToken alloc] initWithCADSequenceToken:v9];
    (*(void (**)(uint64_t, void, EKSequenceToken *, void *))(v19 + 16))(v19, v21, v20, v12);
  }
}

+ (void)callClientResultsHandler:(id)a3 changesTruncated:(BOOL)a4 latestToken:(int64_t)a5 changes:(id)a6
{
}

- (unint64_t)hash
{
  int64_t changeID = self->_changeID;
  return [(EKObjectID *)self->_changedObjectID hash] ^ changeID;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EKObjectChange *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class() && self->_changeID == v4->_changeID;
  }

  return v6;
}

- (id)description
{
  uint64_t changeType = self->_changeType;
  if (changeType > 2) {
    id v3 = 0;
  }
  else {
    id v3 = off_1E5B97E20[changeType];
  }
  return (id)[NSString stringWithFormat:@"[<%@: %p>: type=%@, row=%i, seq=%li, changeID=%li]", objc_opt_class(), self, v3, -[EKObjectID rowID](self->_changedObjectID, "rowID"), self->_sequenceNumber, self->_changeID];
}

+ (int)entityType
{
  v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"entityType must be implemented by an EKObjectChange inheriting class." userInfo:0];
  [v2 raise];

  return -1;
}

+ (int64_t)objectType
{
  return (int)[a1 entityType];
}

+ (id)objectChangeWithProperties:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"record"];
  if (v4)
  {
    uint64_t v5 = +[EKObjectID objectIDWithCADObjectID:v4];
    BOOL v6 = (void *)[v3 mutableCopy];
    [v6 setObject:v5 forKeyedSubscript:@"record"];
    id v7 = v6;

    int v8 = [v5 entityType];
    int v9 = v8;
    switch(v8)
    {
      case -1:
      case 3:
      case 12:
      case 13:
      case 14:
      case 18:
      case 20:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
        goto LABEL_3;
      case 0:
      case 22:
        goto LABEL_8;
      case 1:
        id v13 = EKCalendarChange;
        goto LABEL_25;
      case 2:
        id v13 = EKEventChange;
        goto LABEL_25;
      case 4:
        id v13 = EKAlarmChange;
        goto LABEL_25;
      case 5:
        id v13 = EKRecurrenceChange;
        goto LABEL_25;
      case 6:
        id v13 = EKSourceChange;
        goto LABEL_25;
      case 7:
        id v13 = EKAttendeeChange;
        goto LABEL_25;
      case 8:
        id v13 = EKOrganizerChange;
        goto LABEL_25;
      case 9:
        id v13 = EKEventActionChange;
        goto LABEL_25;
      case 10:
        id v13 = EKExceptionDateChange;
        goto LABEL_25;
      case 11:
        id v13 = EKAttachmentChange;
        goto LABEL_25;
      case 15:
        id v13 = EKShareeChange;
        goto LABEL_25;
      case 16:
        id v13 = EKInviteReplyNotificationChange;
        goto LABEL_25;
      case 17:
        id v13 = EKResourceChangeNotificationChange;
        goto LABEL_25;
      case 19:
        id v13 = EKSuggestionNotificationChange;
        goto LABEL_25;
      case 21:
        id v13 = EKContactChange;
LABEL_25:
        id v11 = (void *)[[v13 alloc] initWithChangeProperties:v7];
        break;
      default:
        if ((v8 - 100) < 3)
        {
LABEL_3:
          id v10 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
            +[EKObjectChange objectChangeWithProperties:](v9, v10);
          }
        }
        else
        {
LABEL_8:
          id v12 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
            +[EKObjectChange objectChangeWithProperties:](v9, v12);
          }
        }
        id v11 = 0;
        break;
    }
  }
  else
  {
    id v11 = 0;
    id v7 = v3;
  }

  return v11;
}

- (id)serializedPropertiesForConsumingChange
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"consumed_entity_class";
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[EKObjectID entityType](self->_changedObjectID, "entityType"));
  v10[0] = v3;
  v9[1] = @"consumed_entity_id";
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[EKObjectID rowID](self->_changedObjectID, "rowID"));
  v10[1] = v4;
  v9[2] = @"consumed_change_id";
  uint64_t v5 = [NSNumber numberWithInteger:self->_changeID];
  v10[2] = v5;
  v9[3] = @"sequence_number";
  BOOL v6 = [NSNumber numberWithInteger:self->_sequenceNumber];
  v10[3] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (EKObjectID)changedObjectID
{
  return self->_changedObjectID;
}

- (int)changeType
{
  return self->_changeType;
}

- (int64_t)changeID
{
  return self->_changeID;
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void).cxx_destruct
{
}

void __38__EKObjectChange_processFetchResults___block_invoke_cold_1(void *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = a1;
  uint64_t v5 = [v3 errorWithCADResult:a2];
  int v6 = 138412290;
  id v7 = v5;
  _os_log_error_impl(&dword_1A4E47000, v4, OS_LOG_TYPE_ERROR, "Error fetching changed object IDs: %@", (uint8_t *)&v6, 0xCu);
}

+ (void)objectChangeWithProperties:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Invalid entity type: %d", (uint8_t *)v2, 8u);
}

+ (void)objectChangeWithProperties:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Unsupported entity type: %d", (uint8_t *)v2, 8u);
}

@end