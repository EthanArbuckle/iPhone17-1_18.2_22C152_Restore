@interface IDSDMessageStore
+ (BOOL)databaseSizeBiggerThanThreshold:(int64_t)a3;
+ (id)allExpiredOutgoingMessages:(int64_t)a3;
+ (id)allOutgoingMessagesByGUID:(id)a3;
+ (id)allOutgoingMessagesOnAccountGUID:(id)a3 localDestinationDeviceID:(id)a4;
+ (id)allOutgoingMessagesPendingDeleteWithLimit:(int64_t)a3;
+ (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 hardLimit:(int64_t)a5;
+ (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 priority:(int64_t)a5 hardLimit:(int64_t)a6;
+ (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 priority:(int64_t)a5 hardLimit:(int64_t)a6 wantsPayload:(BOOL)a7 messageType:(int64_t)a8 success:(BOOL *)a9;
+ (id)deleteExpiredIncomingRestrictedMessagesOlderThan:(double)a3;
+ (id)incomingExpiredRestrictedMessages:(double)a3 success:(BOOL *)a4;
+ (id)incomingMessagesUpToLimit:(unint64_t)a3 controlCategory:(unsigned int)a4 messageTransportType:(unsigned __int8)a5 success:(BOOL *)a6;
+ (id)incomingMessagesUpToLimit:(unint64_t)a3 messageTransportType:(unsigned __int8)a4 success:(BOOL *)a5;
+ (id)largestEnquedMessagesAccountUUIDOverThreshold:(int64_t)a3;
+ (id)largestPayloadSizeAccountUUID;
+ (id)outgoingMessagesWithEnqueueDateOlderThan:(int64_t)a3 notToDestinationDeviceID:(id)a4 andLimit:(int64_t)a5;
+ (id)sharedInstance;
+ (id)sharedInstanceForDataProtectionClass:(unsigned int)a3;
+ (id)uniqueAccountGUIDsForUnsentOutgoingMessages:(int64_t)a3;
+ (id)unsentNonUrgentAccountUUIDsRequiringDuetOverrides:(BOOL)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5;
+ (id)unsentNonUrgentAccountUUIDsRequiringDuetOverrides:(BOOL)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 withMessageTypes:(id)a6;
+ (id)unsentOutgoingMessagesUpToLimit:(unint64_t)a3 priority:(int64_t)a4 localDestinationDeviceID:(id)a5;
+ (id)unsentOutgoingMessagesUpToLimit:(unint64_t)a3 priority:(int64_t)a4 wantsPayload:(BOOL)a5 localDestinationDeviceID:(id)a6;
+ (id)unsentUrgentAccountUUIDsWithDataProtectionClass:(unsigned int)a3 withMessageTypes:(id)a4;
+ (void)checkpointAndVacuumDBWithDataProtectionClass:(unsigned int)a3;
+ (void)clearStatementCache;
+ (void)deleteAllMessagesWithAccountGUID:(id)a3;
+ (void)deleteExpiredIncomingMessagesOlderThan:(double)a3 withLimit:(int64_t)a4;
+ (void)deleteIncomingMessageWithGUID:(id)a3;
+ (void)deleteOutgoingMessageWithGUID:(id)a3 alternateGUID:(id)a4;
+ (void)deleteOutgoingMessageWithGUID:(id)a3 alternateGUID:(id)a4 dataProtectionClass:(unsigned int)a5;
+ (void)deletePostponedMessages;
+ (void)markAllMessageAsPendingDeleteForAccounts:(id)a3 withDestinationDevice:(id)a4;
+ (void)markLocalDestinationDeviceUUIDForAccounts:(id)a3 deviceUUID:(id)a4;
+ (void)markOutgoingMessagesAsUnsentForDestination:(id)a3;
+ (void)markOutgoingMessagesAsUnsentIncludingClassD:(BOOL)a3;
+ (void)updateExpirationForIncomingMessageWithGUID:(id)a3 expirationDate:(int64_t)a4;
- (IDSDMessageStore)init;
- (IDSDMessageStore)initWithDataProtectionClass:(unsigned int)a3;
- (IDSDMessageStore)initWithDatabase:(id)a3;
- (IDSDatabase)database;
- (id)_createOutgoingMessageRecordsFromSQLRecords:(__CFArray *)a3 includeMessagePayloads:(BOOL)a4;
- (id)_incomingMessageIdentifierForMessageUUID:(id)a3 messagePayload:(id)a4;
- (id)_unsentOutgoingMessagesUpToLimit:(unint64_t)a3 byteLimit:(unint64_t)a4 priority:(int64_t)a5 accountUUID:(id)a6 wantsPayload:(BOOL)a7 requireDuet:(BOOL)a8 localDestinationDeviceID:(id)a9;
- (id)_unsentOutgoingMessagesUpToLimit:(unint64_t)a3 byteLimit:(unint64_t)a4 priority:(int64_t)a5 accountUUID:(id)a6 wantsPayload:(BOOL)a7 requireDuet:(BOOL)a8 localDestinationDeviceID:(id)a9 messageTypes:(id)a10;
- (id)allExpiredOutgoingMessages:(int64_t)a3;
- (id)allOutgoingMessagesByGUID:(id)a3;
- (id)allOutgoingMessagesOnAccountGUID:(id)a3 localDestinationDeviceID:(id)a4;
- (id)allOutgoingMessagesPendingDeleteWithLimit:(int64_t)a3;
- (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 hardLimit:(int64_t)a5;
- (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 priority:(int64_t)a5 hardLimit:(int64_t)a6 wantsPayload:(BOOL)a7 messageType:(int64_t)a8 success:(BOOL *)a9;
- (id)allUnsentOutgoingMessagesForAccounts:(id)a3 priority:(int64_t)a4 localDestinationDeviceID:(id)a5 hardLimit:(int64_t)a6;
- (id)deleteExpiredIncomingRestrictedMessagesOlderThan:(double)a3;
- (id)duetIdentifiersOverrideForAccountWithGUID:(id)a3 priority:(int64_t)a4;
- (id)incomingExpiredRestrictedMessages:(double)a3 success:(BOOL *)a4;
- (id)incomingMessagesUpToLimit:(unint64_t)a3 controlCategory:(unsigned int)a4 messageTransportType:(unsigned __int8)a5 success:(BOOL *)a6;
- (id)incomingMessagesUpToLimit:(unint64_t)a3 messageTransportType:(unsigned __int8)a4 success:(BOOL *)a5;
- (id)largestEnquedMessagesAmountAccountUUID;
- (id)largestPayloadSizeAccountUUID;
- (id)outgoingMessagesWithEnqueueDateOlderThan:(int64_t)a3 notToDestinationDeviceID:(id)a4 andLimit:(int64_t)a5;
- (id)uniqueAccountGUIDsForUnsentOutgoingMessages:(int64_t)a3;
- (id)unsentNonUrgentAccountUUIDsRequiringDuetOverrides:(BOOL)a3 priority:(int64_t)a4;
- (id)unsentNonUrgentAccountUUIDsRequiringDuetOverrides:(BOOL)a3 priority:(int64_t)a4 messageTypes:(id)a5;
- (id)unsentNonUrgentMessagesForAccountUUID:(id)a3 priority:(int64_t)a4 byteLimit:(unint64_t)a5 upToLimit:(unint64_t)a6 localDestinationDeviceID:(id)a7;
- (id)unsentNonUrgentMessagesForAccountUUID:(id)a3 priority:(int64_t)a4 byteLimit:(unint64_t)a5 upToLimit:(unint64_t)a6 localDestinationDeviceID:(id)a7 messageTypes:(id)a8;
- (id)unsentOutgoingMessagesUpToLimit:(unint64_t)a3 priority:(int64_t)a4 localDestinationDeviceID:(id)a5;
- (id)unsentOutgoingMessagesUpToLimit:(unint64_t)a3 priority:(int64_t)a4 wantsPayload:(BOOL)a5 localDestinationDeviceID:(id)a6;
- (id)unsentUrgentAccountUUIDsForMessageTypes:(id)a3;
- (int)internalMigrationVersionOnDatabase;
- (int64_t)databaseSizeInMB;
- (unsigned)dataProtectionClass;
- (void)__closeDatabase;
- (void)_clearDatabaseCloseTimer;
- (void)_performInitialHousekeeping;
- (void)_setDatabaseCloseTimer;
- (void)checkpointAndVacuumDB;
- (void)clearStatementCache;
- (void)closeDatabase;
- (void)deleteAllMessagesWithAccountGUID:(id)a3;
- (void)deleteDatabase;
- (void)deleteExpiredIncomingMessagesOlderThan:(double)a3 withLimit:(int64_t)a4;
- (void)deleteIncomingMessageWithGUID:(id)a3;
- (void)deleteOutgoingMessageWithGUID:(id)a3 alternateGUID:(id)a4 classDDatabase:(id)a5;
- (void)deletePostponedMessages:(id)a3 classDDatabase:(id)a4;
- (void)markAllMessageAsPendingDeleteForAccounts:(id)a3 withDestinationDevice:(id)a4;
- (void)markAllOutgoingMessagesAsUnsent;
- (void)markAllOutgoingMessagesAsUnsentForLocalDestination:(id)a3;
- (void)markLocalDestinationDeviceUUIDForAccounts:(id)a3 deviceUUID:(id)a4;
- (void)markOutgoingMessageWithGUID:(id)a3 asSent:(BOOL)a4;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 afterDelay:(double)a4;
- (void)performBlock:(id)a3 waitUntilDone:(BOOL)a4;
- (void)storeIncomingMessage:(id)a3 forTopic:(id)a4 fromID:(id)a5 messageUUID:(id)a6 messagePayload:(id)a7 dedupBehavior:(unsigned __int8)a8 completionBlock:(id)a9;
- (void)storeIncomingMessage:(id)a3 forTopic:(id)a4 fromID:(id)a5 messageUUID:(id)a6 messagePayload:(id)a7 isLocal:(BOOL)a8 controlCategory:(unsigned int)a9 dedupBehavior:(unsigned __int8)a10 completionBlock:(id)a11;
- (void)storeIncomingMessage:(id)a3 forTopic:(id)a4 fromID:(id)a5 messageUUID:(id)a6 messagePayload:(id)a7 isLocal:(BOOL)a8 dedupBehavior:(unsigned __int8)a9 completionBlock:(id)a10;
- (void)storeOutgoingMessageWithSendParameters:(id)a3 guid:(id)a4 canSend:(BOOL)a5 canBypassSimilarMessages:(BOOL)a6 fromQueue:(id)a7 completionBlock:(id)a8;
- (void)updateExpirationForIncomingMessageWithGUID:(id)a3 expirationDate:(int64_t)a4;
- (void)updateInternalMigrationVersionOnDatabaseWithValue:(int)a3;
@end

@implementation IDSDMessageStore

+ (id)sharedInstance
{
  if (qword_100A4C758 != -1) {
    dispatch_once(&qword_100A4C758, &stru_100988CE0);
  }
  v2 = (void *)qword_100A4C760;

  return v2;
}

+ (id)sharedInstanceForDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = +[IDSDMessageStoreMap sharedInstance];
  v5 = [v4 getOrCreateMessageStoreForDataProtectionClass:v3];

  return v5;
}

+ (id)unsentNonUrgentAccountUUIDsRequiringDuetOverrides:(BOOL)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v7 = a3;
  v8 = +[IDSDMessageStoreMap sharedInstance];
  v9 = [v8 getOrCreateMessageStoreForDataProtectionClass:v5];

  v10 = [v9 unsentNonUrgentAccountUUIDsRequiringDuetOverrides:v7 priority:a4];

  return v10;
}

+ (id)unsentNonUrgentAccountUUIDsRequiringDuetOverrides:(BOOL)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 withMessageTypes:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  BOOL v8 = a3;
  id v9 = a6;
  v10 = +[IDSDMessageStoreMap sharedInstance];
  v11 = [v10 getOrCreateMessageStoreForDataProtectionClass:v6];

  v12 = [v11 unsentNonUrgentAccountUUIDsRequiringDuetOverrides:v8 priority:a4 messageTypes:v9];

  return v12;
}

+ (id)unsentUrgentAccountUUIDsWithDataProtectionClass:(unsigned int)a3 withMessageTypes:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  uint64_t v6 = +[IDSDMessageStoreMap sharedInstance];
  BOOL v7 = [v6 getOrCreateMessageStoreForDataProtectionClass:v4];

  BOOL v8 = [v7 unsentUrgentAccountUUIDsForMessageTypes:v5];

  return v8;
}

+ (void)markLocalDestinationDeviceUUIDForAccounts:(id)a3 deviceUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v7 = +[IDSDMessageStoreMap sharedInstance];
  BOOL v8 = [v7 messageStores];

  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) markLocalDestinationDeviceUUIDForAccounts:v5 deviceUUID:v6];
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

+ (void)markAllMessageAsPendingDeleteForAccounts:(id)a3 withDestinationDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v7 = +[IDSDMessageStoreMap sharedInstance];
  BOOL v8 = [v7 messageStores];

  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) markAllMessageAsPendingDeleteForAccounts:v5 withDestinationDevice:v6];
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

+ (id)allOutgoingMessagesPendingDeleteWithLimit:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = +[IDSDMessageStoreMap sharedInstance];
  id v6 = [v5 messageStores];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
      if (a3 - (uint64_t)[v4 count] < 1) {
        break;
      }
      v12 = objc_msgSend(v11, "allOutgoingMessagesPendingDeleteWithLimit:");
      [v4 addObjectsFromArray:v12];

      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v4;
}

+ (id)outgoingMessagesWithEnqueueDateOlderThan:(int64_t)a3 notToDestinationDeviceID:(id)a4 andLimit:(int64_t)a5
{
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = +[IDSDMessageStoreMap sharedInstance];
  uint64_t v10 = [v9 messageStores];

  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v10);
      }
      long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
      if (a5 - (uint64_t)[v8 count] < 1) {
        break;
      }
      long long v16 = objc_msgSend(v15, "outgoingMessagesWithEnqueueDateOlderThan:notToDestinationDeviceID:andLimit:", a3, v7);
      [v8 addObjectsFromArray:v16];

      if (v12 == (id)++v14)
      {
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v8;
}

+ (void)deletePostponedMessages
{
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_10031E700;
  v41 = sub_10031E710;
  id v42 = (id)0xAAAAAAAAAAAAAAAALL;
  id v42 = objc_alloc_init((Class)NSMutableDictionary);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = -1;
  v2 = +[IDSDMessageStoreMap sharedInstance];
  uint64_t v3 = [v2 getOrCreateMessageStoreForDataProtectionClass:2];
  id v4 = [v3 database];

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10031E718;
  v30[3] = &unk_100988E48;
  v32 = &v43;
  v33 = v36;
  v34 = &v37;
  CFStringRef v35 = @"SELECT ROWID, data_protection_class, guid, alternate_guid FROM outgoing_messages_to_delete;";
  id v5 = v4;
  id v31 = v5;
  sub_1003E5954(v30, 1, v5);
  if (v44[3])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = +[IDSDMessageStoreMap sharedInstance];
    id v7 = [v6 messageStores];

    int v8 = 0;
    int v9 = 0;
    id v10 = [v7 countByEnumeratingWithState:&v26 objects:v47 count:16];
    if (v10)
    {
      int v21 = 0;
      uint64_t v11 = *(void *)v27;
      while (1)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v13 dataProtectionClass] == 1)
          {
            uint64_t v14 = (void *)v38[5];
            long long v15 = IDSDataProtectionClassStringFromDataProtectionClass();
            long long v16 = [v14 objectForKey:v15];
            [v13 deletePostponedMessages:v16 classDDatabase:v5];
            int v8 = 1;
          }
          else if ([v13 dataProtectionClass])
          {
            if ([v13 dataProtectionClass] != 2) {
              continue;
            }
            long long v17 = (void *)v38[5];
            long long v15 = IDSDataProtectionClassStringFromDataProtectionClass();
            long long v16 = [v17 objectForKey:v15];
            [v13 deletePostponedMessages:v16 classDDatabase:v5];
            int v21 = 1;
          }
          else
          {
            long long v18 = (void *)v38[5];
            long long v15 = IDSDataProtectionClassStringFromDataProtectionClass();
            long long v16 = [v18 objectForKey:v15];
            [v13 deletePostponedMessages:v16 classDDatabase:v5];
            int v9 = 1;
          }
        }
        id v10 = [v7 countByEnumeratingWithState:&v26 objects:v47 count:16];
        if (!v10) {
          goto LABEL_18;
        }
      }
    }
    int v21 = 0;
LABEL_18:

    long long v19 = (void *)v38[5];
    v38[5] = 0;

    if (v8 & v9 & v21)
    {
      long long v20 = +[IDSFoundationLog IDSMessageStore];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Clearing postponed messages", buf, 2u);
      }

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10031E9DC;
      v22[3] = &unk_100980390;
      v24 = v36;
      id v23 = v5;
      sub_1003E5954(v22, 1, v23);
    }
  }

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
}

+ (void)deleteIncomingMessageWithGUID:(id)a3
{
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = +[IDSDMessageStoreMap sharedInstance];
  id v5 = [v4 messageStores];

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      int v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) deleteIncomingMessageWithGUID:v3];
        int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

+ (void)clearStatementCache
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = +[IDSDMessageStoreMap sharedInstance];
  id v3 = [v2 messageStores];

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) clearStatementCache];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)clearStatementCache
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10031ED28;
  v2[3] = &unk_10097E4D0;
  v2[4] = self;
  [(IDSDMessageStore *)self performBlock:v2];
}

+ (void)deleteExpiredIncomingMessagesOlderThan:(double)a3 withLimit:(int64_t)a4
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = +[IDSDMessageStoreMap sharedInstance];
  id v7 = [v6 messageStores];

  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) deleteExpiredIncomingMessagesOlderThan:a4 withLimit:a3];
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

+ (id)deleteExpiredIncomingRestrictedMessagesOlderThan:(double)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = +[IDSDMessageStoreMap sharedInstance];
  uint64_t v6 = [v5 messageStores];

  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) deleteExpiredIncomingRestrictedMessagesOlderThan:a3];
        [v4 addObjectsFromArray:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v4;
}

+ (void)deleteOutgoingMessageWithGUID:(id)a3 alternateGUID:(id)a4 dataProtectionClass:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = +[IDSDMessageStoreMap sharedInstance];
  uint64_t v10 = [v9 getOrCreateMessageStoreForDataProtectionClass:2];
  id v13 = [v10 database];

  long long v11 = +[IDSDMessageStoreMap sharedInstance];
  long long v12 = [v11 getOrCreateMessageStoreForDataProtectionClass:v5];

  [v12 deleteOutgoingMessageWithGUID:v8 alternateGUID:v7 classDDatabase:v13];
}

+ (void)deleteOutgoingMessageWithGUID:(id)a3 alternateGUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IDSDMessageStoreMap sharedInstance];
  id v8 = [v7 getOrCreateMessageStoreForDataProtectionClass:2];
  uint64_t v9 = [v8 database];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = +[IDSDMessageStoreMap sharedInstance];
  long long v11 = [v10 messageStores];

  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      long long v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) deleteOutgoingMessageWithGUID:v5 alternateGUID:v6 classDDatabase:v9];
        long long v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

+ (id)incomingMessagesUpToLimit:(unint64_t)a3 controlCategory:(unsigned int)a4 messageTransportType:(unsigned __int8)a5 success:(BOOL *)a6
{
  long long v18 = a6;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = +[IDSDMessageStoreMap sharedInstance];
  uint64_t v9 = [v8 messageStores];

  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    char v13 = 1;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(v9);
      }
      long long v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
      if ((uint64_t)(a3 - (void)objc_msgSend(v7, "count", v18)) < 1) {
        break;
      }
      long long v16 = objc_msgSend(v15, "incomingMessagesUpToLimit:controlCategory:messageTransportType:success:");
      [v7 addObjectsFromArray:v16];

      char v13 = 0;
      if (v11 == (id)++v14)
      {
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    char v13 = 1;
  }

  if (v18) {
    *long long v18 = v13 & 1;
  }

  return v7;
}

+ (id)incomingMessagesUpToLimit:(unint64_t)a3 messageTransportType:(unsigned __int8)a4 success:(BOOL *)a5
{
  return +[IDSDMessageStore incomingMessagesUpToLimit:a3 controlCategory:0 messageTransportType:a4 success:a5];
}

+ (id)incomingExpiredRestrictedMessages:(double)a3 success:(BOOL *)a4
{
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = +[IDSDMessageStoreMap sharedInstance];
  id v8 = [v7 messageStores];

  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    char v12 = 1;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v17 = 0;
        long long v15 = [v14 incomingExpiredRestrictedMessages:&v17 success:a3];
        [v6 addObjectsFromArray:v15];

        v12 &= v17 != 0;
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
  else
  {
    char v12 = 1;
  }

  if (a4) {
    *a4 = v12;
  }

  return v6;
}

+ (id)unsentOutgoingMessagesUpToLimit:(unint64_t)a3 priority:(int64_t)a4 wantsPayload:(BOOL)a5 localDestinationDeviceID:(id)a6
{
  id v7 = a6;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = +[IDSDMessageStoreMap sharedInstance];
  id v10 = [v9 messageStores];

  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v10);
      }
      long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
      if ((uint64_t)(a3 - (void)[v8 count]) < 1) {
        break;
      }
      long long v16 = objc_msgSend(v15, "unsentOutgoingMessagesUpToLimit:priority:wantsPayload:localDestinationDeviceID:");
      [v8 addObjectsFromArray:v16];

      if (v12 == (id)++v14)
      {
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v8;
}

+ (id)unsentOutgoingMessagesUpToLimit:(unint64_t)a3 priority:(int64_t)a4 localDestinationDeviceID:(id)a5
{
  id v6 = a5;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = +[IDSDMessageStoreMap sharedInstance];
  id v9 = [v8 messageStores];

  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
      if ((uint64_t)(a3 - (void)[v7 count]) < 1) {
        break;
      }
      long long v15 = objc_msgSend(v14, "unsentOutgoingMessagesUpToLimit:priority:localDestinationDeviceID:");
      [v7 addObjectsFromArray:v15];

      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v7;
}

+ (void)markOutgoingMessagesAsUnsentIncludingClassD:(BOOL)a3
{
  BOOL v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = +[IDSDMessageStoreMap sharedInstance];
  id v5 = [v4 messageStores];

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 dataProtectionClass] != 2 || v3) {
          [v10 markAllOutgoingMessagesAsUnsent];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

+ (void)markOutgoingMessagesAsUnsentForDestination:(id)a3
{
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = +[IDSDMessageStoreMap sharedInstance];
  id v5 = [v4 messageStores];

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) markAllOutgoingMessagesAsUnsentForLocalDestination:v3];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

+ (BOOL)databaseSizeBiggerThanThreshold:(int64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = +[IDSDMessageStoreMap sharedInstance];
  id v5 = [v4 messageStores];

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += (int64_t)[*(id *)(*((void *)&v12 + 1) + 8 * i) databaseSizeInMB];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8 >= a3;
}

+ (id)largestPayloadSizeAccountUUID
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v2 = +[IDSDMessageStoreMap sharedInstance];
  id v3 = [v2 messageStores];

  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    signed int v6 = 0;
    id v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v3);
        }
        long long v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) largestPayloadSizeAccountUUID];
        if ([v10 count] == (id)2)
        {
          long long v11 = [v10 objectAtIndex:0];
          long long v12 = [v10 objectAtIndex:1];
          signed int v13 = [v12 intValue];

          if (v6 < v13)
          {
            id v14 = v11;

            signed int v6 = v13;
            id v7 = v14;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)largestEnquedMessagesAccountUUIDOverThreshold:(int64_t)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = +[IDSDMessageStoreMap sharedInstance];
  id v5 = [v4 messageStores];

  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "largestEnquedMessagesAmountAccountUUID", v15, v16);
        if ([v9 count] == (id)2)
        {
          long long v10 = [v9 objectAtIndex:0];
          long long v11 = [v9 objectAtIndex:1];
          id v12 = [v11 intValue];

          signed int v13 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            long long v22 = v10;
            __int16 v23 = 1024;
            int v24 = (int)v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "RunawayCheck: Account Guid %@ has %d messages", buf, 0x12u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            long long v15 = v10;
            id v16 = v12;
            _IDSLogV();
          }
          if ((int)v12 > a3)
          {

            goto LABEL_18;
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  long long v10 = 0;
LABEL_18:

  return v10;
}

+ (void)deleteAllMessagesWithAccountGUID:(id)a3
{
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = +[IDSDMessageStoreMap sharedInstance];
  id v5 = [v4 messageStores];

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) deleteAllMessagesWithAccountGUID:v3];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

+ (id)allOutgoingMessagesByGUID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = +[IDSDMessageStoreMap sharedInstance];
  id v6 = [v5 messageStores];

  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) allOutgoingMessagesByGUID:v3];
        [v4 addObjectsFromArray:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v4;
}

+ (id)allOutgoingMessagesOnAccountGUID:(id)a3 localDestinationDeviceID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = +[IDSDMessageStoreMap sharedInstance];
  uint64_t v9 = [v8 messageStores];

  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) allOutgoingMessagesOnAccountGUID:v5 localDestinationDeviceID:v6];
        [v7 addObjectsFromArray:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v7;
}

+ (id)allExpiredOutgoingMessages:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = +[IDSDMessageStoreMap sharedInstance];
  id v6 = [v5 messageStores];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
      if (a3 - (uint64_t)[v4 count] < 1) {
        break;
      }
      uint64_t v12 = objc_msgSend(v11, "allExpiredOutgoingMessages:");
      [v4 addObjectsFromArray:v12];

      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v4;
}

+ (id)uniqueAccountGUIDsForUnsentOutgoingMessages:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = +[IDSDMessageStoreMap sharedInstance];
  id v6 = [v5 messageStores];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
      if (a3 - (uint64_t)[v4 count] < 1) {
        break;
      }
      uint64_t v12 = objc_msgSend(v11, "uniqueAccountGUIDsForUnsentOutgoingMessages:");
      [v4 addObjectsFromArray:v12];

      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v4;
}

+ (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 hardLimit:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)NSMutableArray);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = +[IDSDMessageStoreMap sharedInstance];
  id v11 = [v10 messageStores];

  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v20 != v14) {
        objc_enumerationMutation(v11);
      }
      long long v16 = *(void **)(*((void *)&v19 + 1) + 8 * v15);
      if (a5 - (uint64_t)[v9 count] < 1) {
        break;
      }
      long long v17 = objc_msgSend(v16, "allUnsentOutgoingMessagesForAccounts:localDestinationDeviceID:hardLimit:", v7, v8);
      [v9 addObjectsFromArray:v17];

      if (v13 == (id)++v15)
      {
        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v9;
}

+ (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 priority:(int64_t)a5 hardLimit:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = +[IDSDMessageStoreMap sharedInstance];
  id v13 = [v12 messageStores];

  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
LABEL_3:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v22 != v16) {
        objc_enumerationMutation(v13);
      }
      long long v18 = *(void **)(*((void *)&v21 + 1) + 8 * v17);
      if (a6 - (uint64_t)[v11 count] < 1) {
        break;
      }
      long long v19 = objc_msgSend(v18, "allUnsentOutgoingMessagesForAccounts:priority:localDestinationDeviceID:hardLimit:", v9, a5, v10);
      [v11 addObjectsFromArray:v19];

      if (v15 == (id)++v17)
      {
        id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v15) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v11;
}

+ (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 priority:(int64_t)a5 hardLimit:(int64_t)a6 wantsPayload:(BOOL)a7 messageType:(int64_t)a8 success:(BOOL *)a9
{
  id v25 = a3;
  id v12 = a4;
  id v13 = objc_alloc_init((Class)NSMutableArray);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = +[IDSDMessageStoreMap sharedInstance];
  id v15 = [v14 messageStores];

  id obj = v15;
  id v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v28;
    char v19 = 1;
LABEL_3:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v28 != v18) {
        objc_enumerationMutation(obj);
      }
      long long v21 = *(void **)(*((void *)&v27 + 1) + 8 * v20);
      if (a6 - (uint64_t)[v13 count] < 1) {
        break;
      }
      char v26 = 0;
      long long v22 = objc_msgSend(v21, "allUnsentOutgoingMessagesForAccounts:localDestinationDeviceID:priority:hardLimit:wantsPayload:messageType:success:", v25, v12, a5, &v26);
      [v13 addObjectsFromArray:v22];

      v19 &= v26 != 0;
      if (v17 == (id)++v20)
      {
        id v17 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v17) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    char v19 = 1;
  }

  if (a9) {
    *a9 = v19 & 1;
  }

  return v13;
}

+ (void)updateExpirationForIncomingMessageWithGUID:(id)a3 expirationDate:(int64_t)a4
{
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = +[IDSDMessageStoreMap sharedInstance];
  id v7 = [v6 messageStores];

  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) updateExpirationForIncomingMessageWithGUID:v5 expirationDate:a4];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

+ (void)checkpointAndVacuumDBWithDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = +[IDSDMessageStoreMap sharedInstance];
  id v5 = [v4 getOrCreateMessageStoreForDataProtectionClass:v3];

  [v5 checkpointAndVacuumDB];
}

- (IDSDMessageStore)init
{
  return [(IDSDMessageStore *)self initWithDataProtectionClass:0];
}

- (IDSDMessageStore)initWithDataProtectionClass:(unsigned int)a3
{
  id v4 = [[IDSDatabase alloc] initWithDataProtectionClass:*(void *)&a3];
  id v5 = [(IDSDMessageStore *)self initWithDatabase:v4];

  return v5;
}

- (IDSDMessageStore)initWithDatabase:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSDMessageStore;
  id v6 = [(IDSDMessageStore *)&v15 init];
  if (v6)
  {
    v6->_dataProtectionClass = [v5 dataProtectionClass];
    objc_storeStrong((id *)&v6->_database, a3);
    id v7 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    recursiveLock = v6->_recursiveLock;
    v6->_recursiveLock = v7;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100320F88;
    v11[3] = &unk_100988E98;
    long long v12 = v6;
    objc_copyWeak(&v13, &location);
    id v9 = im_primary_queue();
    sub_1003319E8(v11, @"IDS-DB-List", (uint64_t)v9);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)_performInitialHousekeeping
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100321374;
  v2[3] = &unk_10097E4D0;
  v2[4] = self;
  [(IDSDMessageStore *)self performBlock:v2];
}

- (unsigned)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (id)incomingMessagesUpToLimit:(unint64_t)a3 controlCategory:(unsigned int)a4 messageTransportType:(unsigned __int8)a5 success:(BOOL *)a6
{
  +[NSMutableArray array];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003214F4;
  v15[3] = &unk_100988EC0;
  unsigned int v19 = a4;
  v15[4] = self;
  unint64_t v17 = a3;
  uint64_t v18 = a6;
  unsigned __int8 v20 = a5;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v11;
  [(IDSDMessageStore *)self performBlock:v15 waitUntilDone:1];
  long long v12 = v16;
  id v13 = v11;

  return v13;
}

- (id)incomingMessagesUpToLimit:(unint64_t)a3 messageTransportType:(unsigned __int8)a4 success:(BOOL *)a5
{
  return [(IDSDMessageStore *)self incomingMessagesUpToLimit:a3 controlCategory:0 messageTransportType:a4 success:a5];
}

- (id)incomingExpiredRestrictedMessages:(double)a3 success:(BOOL *)a4
{
  +[NSMutableArray array];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100321980;
  v11[3] = &unk_10097F280;
  void v11[4] = self;
  double v13 = a3;
  long long v14 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v7;
  [(IDSDMessageStore *)self performBlock:v11 waitUntilDone:1];
  id v8 = v12;
  id v9 = v7;

  return v9;
}

- (id)_incomingMessageIdentifierForMessageUUID:(id)a3 messagePayload:(id)a4
{
  id v5 = a3;
  id v6 = 0;
  if (v5 && a4)
  {
    id v7 = [a4 SHA256Data];
    id v8 = objc_msgSend(v7, "__imHexString");

    if (v8)
    {
      id v6 = [v5 stringByAppendingString:v8];
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (void)storeIncomingMessage:(id)a3 forTopic:(id)a4 fromID:(id)a5 messageUUID:(id)a6 messagePayload:(id)a7 isLocal:(BOOL)a8 controlCategory:(unsigned int)a9 dedupBehavior:(unsigned __int8)a10 completionBlock:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v28 = a5;
  id v19 = a6;
  id v20 = a7;
  id v27 = a11;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v39 = _os_activity_create((void *)&_mh_execute_header, "Storing incoming message", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v39, &state);
  if ([v18 length])
  {
    long long v21 = JWEncodeDictionary();
    if (v21)
    {
      id v22 = v17;
      if (a10)
      {
        id v23 = v19;
        long long v24 = -[IDSDMessageStore _incomingMessageIdentifierForMessageUUID:messagePayload:](self, "_incomingMessageIdentifierForMessageUUID:messagePayload:", v19, v20, v27);
        id v25 = v20;
      }
      else
      {
        id v25 = v20;
        id v23 = v19;
        long long v24 = 0;
      }
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1003220CC;
      v29[3] = &unk_100988F10;
      v29[4] = self;
      id v30 = v18;
      id v31 = v28;
      v32 = v21;
      BOOL v36 = a8;
      char v26 = v24;
      v33 = v26;
      unsigned int v35 = a9;
      unsigned __int8 v37 = a10;
      id v34 = v27;
      [(IDSDMessageStore *)self performBlock:v29];
      id v20 = v25;

      id v19 = v23;
      id v17 = v22;
    }
    else
    {
      char v26 = +[IDSFoundationLog IDSMessageStore];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10071EE0C();
      }
    }
  }
  else
  {
    long long v21 = +[IDSFoundationLog IDSMessageStore];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v41 = v17;
      __int16 v42 = 2112;
      id v43 = v18;
      __int16 v44 = 2112;
      id v45 = v28;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Ignoring storeMessage: %@ forTopic: %@ fromID: %@", buf, 0x20u);
    }
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)storeIncomingMessage:(id)a3 forTopic:(id)a4 fromID:(id)a5 messageUUID:(id)a6 messagePayload:(id)a7 isLocal:(BOOL)a8 dedupBehavior:(unsigned __int8)a9 completionBlock:(id)a10
{
}

- (void)storeIncomingMessage:(id)a3 forTopic:(id)a4 fromID:(id)a5 messageUUID:(id)a6 messagePayload:(id)a7 dedupBehavior:(unsigned __int8)a8 completionBlock:(id)a9
{
  LOBYTE(v9) = a8;
  [(IDSDMessageStore *)self storeIncomingMessage:a3 forTopic:a4 fromID:a5 messageUUID:a6 messagePayload:a7 isLocal:0 dedupBehavior:v9 completionBlock:a9];
}

- (id)_createOutgoingMessageRecordsFromSQLRecords:(__CFArray *)a3 includeMessagePayloads:(BOOL)a4
{
  if (a3 && (BOOL v4 = a4, Count = CFArrayGetCount(a3), Count >= 1))
  {
    id v65 = 0;
    CFIndex idx = 0;
    uint64_t v7 = Count;
    id v8 = &v162;
    if (!v4) {
      id v8 = 0;
    }
    uint64_t v61 = (uint64_t)v8;
    theArray = a3;
    if (v4) {
      uint64_t v9 = &v161;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = &v160;
    if (!v4) {
      uint64_t v10 = 0;
    }
    uint64_t v59 = (uint64_t)v10;
    uint64_t v60 = (uint64_t)v9;
    id v11 = &v158;
    if (!v4) {
      id v11 = 0;
    }
    if (Count <= 1uLL) {
      uint64_t v7 = 1;
    }
    uint64_t v57 = v7;
    uint64_t v58 = (uint64_t)v11;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, idx);
      uint64_t v165 = 0;
      CFTypeRef v166 = 0;
      CFTypeRef v164 = 0;
      CFTypeRef v163 = 0;
      CFTypeRef v162 = 0;
      CFTypeRef v161 = 0;
      CFTypeRef v160 = 0;
      CFTypeRef v159 = 0;
      CFTypeRef v158 = 0;
      unsigned __int8 v157 = -86;
      unsigned __int8 v156 = -86;
      unsigned __int8 v155 = -86;
      unsigned __int8 v154 = -86;
      memset(v153, 170, 17);
      CFTypeRef v152 = 0;
      CFTypeRef v151 = 0;
      uint64_t v150 = 0;
      CFTypeRef v149 = 0;
      CFTypeRef v148 = 0;
      CFTypeRef cf = 0;
      unsigned __int8 v146 = -86;
      unsigned __int8 v145 = -86;
      unsigned __int8 v144 = -86;
      unsigned __int8 v143 = -86;
      unsigned __int8 v142 = -86;
      unsigned __int8 v141 = -86;
      memset(v140, 170, 17);
      unsigned __int8 v139 = -86;
      CFTypeRef v138 = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      char v137 = -86;
      memset(v136, 170, sizeof(v136));
      unsigned __int8 v135 = -86;
      memset(v134, 170, 17);
      unsigned __int8 v133 = -86;
      unsigned __int8 v132 = -86;
      unsigned __int8 v131 = -86;
      unsigned __int8 v130 = -86;
      unsigned __int8 v129 = -86;
      unsigned __int8 v128 = -86;
      unsigned __int8 v127 = -86;
      unint64_t v126 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v125 = 0;
      unsigned __int8 v124 = -86;
      memset(v123, 170, sizeof(v123));
      double v13 = [(IDSDMessageStore *)self database];
      sub_100045460((uint64_t)ValueAtIndex, 0, (uint64_t)&v166, (uint64_t)&v165, (uint64_t)&v164, (uint64_t)&v163, v61, v60, v59, (uint64_t)&v159, v58, (uint64_t)&v157, (uint64_t)&v156, (uint64_t)&v155, (uint64_t)&v154, (uint64_t)&v153[9], (uint64_t)&v153[1], (uint64_t)v153, (uint64_t)&v152,
        (uint64_t)&v151,
        (uint64_t)&v150,
        (uint64_t)v136,
        (uint64_t)&v135,
        (uint64_t)&v149,
        (uint64_t)&v145,
        (uint64_t)&v148,
        (uint64_t)&v146,
        (uint64_t)&v144,
        (uint64_t)&v143,
        (uint64_t)&v142,
        (uint64_t)&v141,
        (uint64_t)&v140[9],
        (uint64_t)&v140[1],
        (uint64_t)v140,
        (uint64_t)&cf,
        (uint64_t)&v139,
        (uint64_t)&v138,
        (uint64_t)&v137,
        (uint64_t)&v136[2],
        (uint64_t)&v136[1],
        (uint64_t)&v134[9],
        (uint64_t)v134,
        (uint64_t)&v133,
        (uint64_t)&v134[1],
        (uint64_t)&v132,
        (uint64_t)&v131,
        (uint64_t)&v130,
        (uint64_t)&v129,
        (uint64_t)&v128,
        (uint64_t)&v127,
        (uint64_t)&v126,
        (uint64_t)&v125,
        (uint64_t)&v124,
        (uint64_t)&v123[2],
        (uint64_t)&v123[1],
        (uint64_t)v123,
        v13);

      if (v162)
      {
        v116 = JWDecodeDictionary();
      }
      else
      {
        v116 = 0;
      }
      if (v160)
      {
        v117 = JWDecodeDictionary();
      }
      else
      {
        v117 = 0;
      }
      if (v125)
      {
        id v14 = objc_alloc_init((Class)NSMutableDictionary);
        objc_super v15 = JWDecodeDictionary();
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        id v16 = v15;
        id v17 = [v16 countByEnumeratingWithState:&v119 objects:v167 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v120;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v120 != v18) {
                objc_enumerationMutation(v16);
              }
              uint64_t v20 = *(void *)(*((void *)&v119 + 1) + 8 * i);
              id v21 = objc_alloc((Class)NSUUID);
              id v22 = [v16 objectForKey:v20];
              id v23 = [v21 initWithUUIDString:v22];

              [v14 setObject:v23 forKey:v20];
            }
            id v17 = [v16 countByEnumeratingWithState:&v119 objects:v167 count:16];
          }
          while (v17);
        }

        id v118 = v14;
      }
      else
      {
        id v118 = 0;
      }
      if (v159)
      {
        uint64_t v24 = +[NSKeyedUnarchiver ids_secureUnarchiveObjectOfClass:objc_opt_class() withData:v159];
      }
      else
      {
        uint64_t v24 = 0;
      }
      if (v152)
      {
        uint64_t v25 = JWDecodeDictionary();
      }
      else
      {
        uint64_t v25 = 0;
      }
      if (*(void *)&v140[1])
      {
        v108 = JWDecodeArray();
      }
      else
      {
        v108 = 0;
      }
      v107 = (void *)v25;
      v106 = (void *)v24;
      if (*(uint64_t *)&v153[9] < 1)
      {
        v109 = 0;
      }
      else
      {
        v109 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)*(uint64_t *)&v153[9]];
      }
      if (v136[1] < 1)
      {
        v110 = 0;
      }
      else
      {
        v110 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)v136[1]];
      }
      v104 = [IDSDOutgoingMessage alloc];
      CFTypeRef v99 = v161;
      CFTypeRef v100 = v163;
      CFTypeRef v101 = v164;
      int v26 = v155;
      CFTypeRef v98 = v158;
      int v27 = v157;
      int v28 = v156;
      int v103 = v154;
      int v102 = v139;
      v114 = +[NSNumber numberWithInteger:*(void *)&v153[1]];
      int v97 = v153[0];
      CFTypeRef v88 = v151;
      uint64_t v87 = v150;
      CFTypeRef v86 = v166;
      uint64_t v85 = v165;
      CFTypeRef v84 = v149;
      int v95 = v145;
      CFTypeRef v83 = v148;
      int v93 = v146;
      int v92 = v144;
      int v91 = v141;
      int v90 = v143;
      int v89 = v142;
      v113 = +[NSNumber numberWithUnsignedInteger:*(void *)&v140[9]];
      int v82 = v140[0];
      CFTypeRef v81 = v138;
      uint64_t v80 = v136[2];
      v112 = +[NSNumber numberWithLongLong:*(void *)&v134[9]];
      int v79 = v134[0];
      int v78 = v133;
      uint64_t v72 = *(void *)&v134[1];
      if (*(uint64_t *)&v134[1] < 1)
      {
        v75 = 0;
      }
      else
      {
        v68 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:");
        v75 = v68;
      }
      CFTypeRef v74 = cf;
      int v77 = v132;
      int v76 = v131;
      int v29 = v130;
      int v30 = v135;
      int v31 = v129;
      int v32 = v128;
      int v33 = v127;
      v111 = +[NSNumber numberWithLongLong:v126];
      int v34 = v124;
      uint64_t v70 = v123[2];
      if (v123[2] < 1)
      {
        v73 = 0;
      }
      else
      {
        v67 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:");
        v73 = v67;
      }
      uint64_t v69 = v123[1];
      if (v123[1] < 1)
      {
        v71 = 0;
      }
      else
      {
        v66 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:");
        v71 = v66;
      }
      if (v123[0] <= 0)
      {
        LOBYTE(v56) = v34 != 0;
        BYTE6(v55) = v33 != 0;
        BYTE5(v55) = v32 != 0;
        BYTE4(v55) = v31 != 0;
        BYTE3(v55) = v30 != 0;
        BYTE2(v55) = v29 != 0;
        BYTE1(v55) = v76 != 0;
        LOBYTE(v55) = v77 != 0;
        BYTE1(v54) = v78 != 0;
        LOBYTE(v54) = v79 != 0;
        LOBYTE(v53) = v82 != 0;
        BYTE4(v52) = v89 != 0;
        BYTE3(v52) = v90 != 0;
        BYTE2(v52) = v91 != 0;
        BYTE1(v52) = v92 != 0;
        LOBYTE(v52) = v93 != 0;
        LOBYTE(v51) = v95 != 0;
        LOBYTE(v50) = v97 != 0;
        LOBYTE(v49) = v102 != 0;
        BYTE2(v48) = v103 != 0;
        BYTE1(v48) = v28 != 0;
        LOBYTE(v48) = v27 != 0;
        LOBYTE(v47) = v26 != 0;
        id v43 = -[IDSDOutgoingMessage initWithMessage:data:protobuf:fromID:toDestinations:accountGUID:useDictAsTopLevel:dataToEncrypt:encryptPayload:compressPayload:wantsResponse:expirationDate:enforceRemoteTimeouts:command:wantsDeliveryStatus:deliveryStatusContext:messageUUID:priority:guid:alternateGUID:identifier:forcedLocal:peerResponseIdentifier:expectsPeerResponse:wantsAppAck:fireAndForget:nonWaking:nonCloudWaking:storedSize:duetIdentifiersOverride:bypassDuet:mainAccountGuid:localDestinationDeviceUUID:enqueuedDate:messageType:alwaysSkipSelf:alwaysIncludeSelf:pushPriority:queueOneIdentifier:liveMessageDelivery:requireBluetooth:requireLocalWiFi:sent:wantsProgress:ignoreMaxRetryCount:wantsCertifiedDelivery:originalTimestamp:ktUriVerificationMap:wantsFirewallDonation:sendMode:deliveryMinimumTimeDelay:deliveryMinimumTime:](v104, "initWithMessage:data:protobuf:fromID:toDestinations:accountGUID:useDictAsTopLevel:dataToEncrypt:encryptPayload:compressPayload:wantsResponse:expirationDate:enforceRemoteTimeouts:command:wantsDeliveryStatus:deliveryStatusContext:messageUUID:priority:guid:alternateGUID:identifier:forcedLocal:peerResponseIdentifier:expectsPeerResponse:wantsAppAck:fireAndForget:nonWaking:nonCloudWaking:storedSize:duetIdentifiersOverride:bypassDuet:mainAccountGuid:localDestinationDeviceUUID:enqueuedDate:messageType:alwaysSkipSelf:alwaysIncludeSelf:pushPriority:queueOneIdentifier:liveMessageDelivery:requireBluetooth:requireLocalWiFi:sent:wantsProgress:ignoreMaxRetryCount:wantsCertifiedDelivery:originalTimestamp:ktUriVerificationMap:wantsFirewallDonation:sendMode:deliveryMinimumTimeDelay:deliveryMinimumTime:", v116, v99, v117, v100, v106, v101, v47, v98, v48, v109,
                v49,
                v114,
                v50,
                v107,
                v88,
                v87,
                v86,
                v85,
                v84,
                v51,
                v83,
                v52,
                v113,
                v108,
                v53,
                v81,
                v80,
                v110,
                v112,
                v54,
                v75,
                v74,
                v55,
                v111,
                v118,
                v56,
                v73,
                v71,
                0);
      }
      else
      {
        BOOL v64 = v34 != 0;
        BOOL v35 = v32 != 0;
        int v36 = v28;
        BOOL v37 = v31 != 0;
        int v38 = v27;
        BOOL v39 = v30 != 0;
        BOOL v40 = v93 != 0;
        BOOL v41 = v95 != 0;
        BOOL v96 = v36 != 0;
        BOOL v94 = v38 != 0;
        __int16 v42 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:");
        LOBYTE(v56) = v64;
        BYTE6(v55) = v33 != 0;
        BYTE5(v55) = v35;
        BYTE4(v55) = v37;
        BYTE3(v55) = v39;
        BYTE2(v55) = v29 != 0;
        BYTE1(v55) = v76 != 0;
        LOBYTE(v55) = v77 != 0;
        BYTE1(v54) = v78 != 0;
        LOBYTE(v54) = v79 != 0;
        LOBYTE(v53) = v82 != 0;
        BYTE4(v52) = v89 != 0;
        BYTE3(v52) = v90 != 0;
        BYTE2(v52) = v91 != 0;
        BYTE1(v52) = v92 != 0;
        LOBYTE(v52) = v40;
        LOBYTE(v51) = v41;
        LOBYTE(v50) = v97 != 0;
        LOBYTE(v49) = v102 != 0;
        BYTE2(v48) = v103 != 0;
        BYTE1(v48) = v96;
        LOBYTE(v48) = v94;
        LOBYTE(v47) = v26 != 0;
        id v43 = -[IDSDOutgoingMessage initWithMessage:data:protobuf:fromID:toDestinations:accountGUID:useDictAsTopLevel:dataToEncrypt:encryptPayload:compressPayload:wantsResponse:expirationDate:enforceRemoteTimeouts:command:wantsDeliveryStatus:deliveryStatusContext:messageUUID:priority:guid:alternateGUID:identifier:forcedLocal:peerResponseIdentifier:expectsPeerResponse:wantsAppAck:fireAndForget:nonWaking:nonCloudWaking:storedSize:duetIdentifiersOverride:bypassDuet:mainAccountGuid:localDestinationDeviceUUID:enqueuedDate:messageType:alwaysSkipSelf:alwaysIncludeSelf:pushPriority:queueOneIdentifier:liveMessageDelivery:requireBluetooth:requireLocalWiFi:sent:wantsProgress:ignoreMaxRetryCount:wantsCertifiedDelivery:originalTimestamp:ktUriVerificationMap:wantsFirewallDonation:sendMode:deliveryMinimumTimeDelay:deliveryMinimumTime:](v104, "initWithMessage:data:protobuf:fromID:toDestinations:accountGUID:useDictAsTopLevel:dataToEncrypt:encryptPayload:compressPayload:wantsResponse:expirationDate:enforceRemoteTimeouts:command:wantsDeliveryStatus:deliveryStatusContext:messageUUID:priority:guid:alternateGUID:identifier:forcedLocal:peerResponseIdentifier:expectsPeerResponse:wantsAppAck:fireAndForget:nonWaking:nonCloudWaking:storedSize:duetIdentifiersOverride:bypassDuet:mainAccountGuid:localDestinationDeviceUUID:enqueuedDate:messageType:alwaysSkipSelf:alwaysIncludeSelf:pushPriority:queueOneIdentifier:liveMessageDelivery:requireBluetooth:requireLocalWiFi:sent:wantsProgress:ignoreMaxRetryCount:wantsCertifiedDelivery:originalTimestamp:ktUriVerificationMap:wantsFirewallDonation:sendMode:deliveryMinimumTimeDelay:deliveryMinimumTime:", v116, v99, v117, v100, v106, v101, v47, v98, v48, v109,
                v49,
                v114,
                v50,
                v107,
                v88,
                v87,
                v86,
                v85,
                v84,
                v51,
                v83,
                v52,
                v113,
                v108,
                v53,
                v81,
                v80,
                v110,
                v112,
                v54,
                v75,
                v74,
                v55,
                v111,
                v118,
                v56,
                v73,
                v71,
                v42);
      }
      if (v69 >= 1) {

      }
      if (v70 >= 1) {
      if (v72 > 0)
      }

      if (v43)
      {
        id v44 = v65;
        if (!v65) {
          id v44 = objc_alloc_init((Class)NSMutableArray);
        }
        id v65 = v44;
        [v44 addObject:v43];
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      if (v161)
      {
        CFRelease(v161);
        CFTypeRef v161 = 0;
      }
      if (v160)
      {
        CFRelease(v160);
        CFTypeRef v160 = 0;
      }
      if (v149)
      {
        CFRelease(v149);
        CFTypeRef v149 = 0;
      }
      if (v148)
      {
        CFRelease(v148);
        CFTypeRef v148 = 0;
      }
      if (v166)
      {
        CFRelease(v166);
        CFTypeRef v166 = 0;
      }
      if (v164)
      {
        CFRelease(v164);
        CFTypeRef v164 = 0;
      }
      if (v163)
      {
        CFRelease(v163);
        CFTypeRef v163 = 0;
      }
      if (v162)
      {
        CFRelease(v162);
        CFTypeRef v162 = 0;
      }
      if (v159)
      {
        CFRelease(v159);
        CFTypeRef v159 = 0;
      }
      if (v158)
      {
        CFRelease(v158);
        CFTypeRef v158 = 0;
      }
      if (v152)
      {
        CFRelease(v152);
        CFTypeRef v152 = 0;
      }
      if (v151)
      {
        CFRelease(v151);
        CFTypeRef v151 = 0;
      }
      if (*(void *)&v140[1])
      {
        CFRelease(*(CFTypeRef *)&v140[1]);
        *(void *)&v140[1] = 0;
      }
      if (v138)
      {
        CFRelease(v138);
        CFTypeRef v138 = 0;
      }
      if (v136[2])
      {
        CFRelease((CFTypeRef)v136[2]);
        v136[2] = 0;
      }

      ++idx;
    }
    while (idx != v57);
  }
  else
  {
    id v65 = 0;
  }
  id v45 = v65;

  return v45;
}

- (int64_t)databaseSizeInMB
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10032345C;
  v4[3] = &unk_100980368;
  v4[4] = self;
  v4[5] = &v5;
  [(IDSDMessageStore *)self performBlock:v4 waitUntilDone:1];
  int64_t v2 = v6[3] / 0x100000;
  v6[3] = v2;
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)largestPayloadSizeAccountUUID
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_10031E700;
  uint64_t v9 = sub_10031E710;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003235D4;
  v4[3] = &unk_100980368;
  v4[4] = self;
  v4[5] = &v5;
  [(IDSDMessageStore *)self performBlock:v4 waitUntilDone:1];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)allOutgoingMessagesByGUID:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = sub_10031E700;
  id v14 = sub_10031E710;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100323780;
  v6[3] = &unk_100987908;
  uint64_t v7 = self;
  id v3 = a3;
  id v8 = v3;
  uint64_t v9 = &v10;
  [(IDSDMessageStore *)v7 performBlock:v6 waitUntilDone:1];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

- (id)allOutgoingMessagesOnAccountGUID:(id)a3 localDestinationDeviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_10031E700;
  uint64_t v20 = sub_10031E710;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100323998;
  v12[3] = &unk_100988F38;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v15 = &v16;
  [(IDSDMessageStore *)self performBlock:v12 waitUntilDone:1];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)allExpiredOutgoingMessages:(int64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10031E700;
  id v10 = sub_10031E710;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100323B60;
  v5[3] = &unk_10097F2C8;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  [(IDSDMessageStore *)self performBlock:v5 waitUntilDone:1];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)uniqueAccountGUIDsForUnsentOutgoingMessages:(int64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10031E700;
  id v10 = sub_10031E710;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100323D24;
  v5[3] = &unk_10097F2C8;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  [(IDSDMessageStore *)self performBlock:v5 waitUntilDone:1];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 hardLimit:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = sub_10031E700;
    id v21 = sub_10031E710;
    id v22 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100323F30;
    v12[3] = &unk_100988F60;
    v12[4] = self;
    id v13 = v8;
    id v15 = &v17;
    int64_t v16 = a5;
    id v14 = v9;
    [(IDSDMessageStore *)self performBlock:v12 waitUntilDone:1];
    id v10 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v10 = +[NSArray array];
  }

  return v10;
}

- (id)allUnsentOutgoingMessagesForAccounts:(id)a3 priority:(int64_t)a4 localDestinationDeviceID:(id)a5 hardLimit:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_10031E700;
  int v26 = sub_10031E710;
  id v27 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10032417C;
  v16[3] = &unk_100988F88;
  v16[4] = self;
  id v12 = v10;
  id v17 = v12;
  int64_t v20 = a4;
  id v13 = v11;
  int64_t v21 = a6;
  id v18 = v13;
  uint64_t v19 = &v22;
  [(IDSDMessageStore *)self performBlock:v16 waitUntilDone:1];
  id v14 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v14;
}

- (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 priority:(int64_t)a5 hardLimit:(int64_t)a6 wantsPayload:(BOOL)a7 messageType:(int64_t)a8 success:(BOOL *)a9
{
  id v15 = a3;
  id v16 = a4;
  uint64_t v30 = 0;
  int v31 = &v30;
  uint64_t v32 = 0x3032000000;
  int v33 = sub_10031E700;
  int v34 = sub_10031E710;
  id v35 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1003243E8;
  v21[3] = &unk_100988FB0;
  v21[4] = self;
  id v17 = v15;
  id v22 = v17;
  int64_t v25 = a5;
  id v18 = v16;
  BOOL v29 = a7;
  int64_t v26 = a6;
  int64_t v27 = a8;
  int v28 = a9;
  id v23 = v18;
  uint64_t v24 = &v30;
  [(IDSDMessageStore *)self performBlock:v21 waitUntilDone:1];
  id v19 = (id)v31[5];

  _Block_object_dispose(&v30, 8);

  return v19;
}

- (id)unsentNonUrgentAccountUUIDsRequiringDuetOverrides:(BOOL)a3 priority:(int64_t)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_10031E700;
  id v12 = sub_10031E710;
  id v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003245D0;
  v6[3] = &unk_100988FD8;
  void v6[4] = self;
  v6[5] = &v8;
  v6[6] = a4;
  BOOL v7 = a3;
  [(IDSDMessageStore *)self performBlock:v6 waitUntilDone:1];
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (id)unsentNonUrgentAccountUUIDsRequiringDuetOverrides:(BOOL)a3 priority:(int64_t)a4 messageTypes:(id)a5
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_10031E700;
  id v18 = sub_10031E710;
  id v19 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003247B0;
  v8[3] = &unk_100989000;
  id v9 = self;
  id v11 = &v14;
  int64_t v12 = a4;
  BOOL v13 = a3;
  id v5 = a5;
  id v10 = v5;
  [(IDSDMessageStore *)v9 performBlock:v8 waitUntilDone:1];
  id v6 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v6;
}

- (id)unsentUrgentAccountUUIDsForMessageTypes:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  BOOL v13 = sub_10031E700;
  uint64_t v14 = sub_10031E710;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10032497C;
  v6[3] = &unk_100989028;
  BOOL v7 = self;
  id v9 = &v10;
  id v3 = a3;
  id v8 = v3;
  [(IDSDMessageStore *)v7 performBlock:v6 waitUntilDone:1];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

- (id)unsentOutgoingMessagesUpToLimit:(unint64_t)a3 priority:(int64_t)a4 localDestinationDeviceID:(id)a5
{
  return [(IDSDMessageStore *)self _unsentOutgoingMessagesUpToLimit:a3 byteLimit:0 priority:a4 accountUUID:0 wantsPayload:1 requireDuet:0 localDestinationDeviceID:a5];
}

- (id)unsentOutgoingMessagesUpToLimit:(unint64_t)a3 priority:(int64_t)a4 wantsPayload:(BOOL)a5 localDestinationDeviceID:(id)a6
{
  return [(IDSDMessageStore *)self _unsentOutgoingMessagesUpToLimit:a3 byteLimit:0 priority:a4 accountUUID:0 wantsPayload:a5 requireDuet:0 localDestinationDeviceID:a6];
}

- (id)_unsentOutgoingMessagesUpToLimit:(unint64_t)a3 byteLimit:(unint64_t)a4 priority:(int64_t)a5 accountUUID:(id)a6 wantsPayload:(BOOL)a7 requireDuet:(BOOL)a8 localDestinationDeviceID:(id)a9
{
  id v15 = a6;
  id v16 = a9;
  uint64_t v30 = 0;
  int v31 = &v30;
  uint64_t v32 = 0x3032000000;
  int v33 = sub_10031E700;
  int v34 = sub_10031E710;
  id v35 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100324C14;
  v21[3] = &unk_100989050;
  BOOL v28 = a7;
  v21[4] = self;
  unint64_t v25 = a4;
  unint64_t v26 = a3;
  int64_t v27 = a5;
  id v17 = v15;
  id v22 = v17;
  BOOL v29 = a8;
  id v18 = v16;
  id v23 = v18;
  uint64_t v24 = &v30;
  [(IDSDMessageStore *)self performBlock:v21 waitUntilDone:1];
  id v19 = (id)v31[5];

  _Block_object_dispose(&v30, 8);

  return v19;
}

- (id)_unsentOutgoingMessagesUpToLimit:(unint64_t)a3 byteLimit:(unint64_t)a4 priority:(int64_t)a5 accountUUID:(id)a6 wantsPayload:(BOOL)a7 requireDuet:(BOOL)a8 localDestinationDeviceID:(id)a9 messageTypes:(id)a10
{
  id v15 = a6;
  id v16 = a9;
  id v17 = a10;
  uint64_t v32 = 0;
  int v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_10031E700;
  int v36 = sub_10031E710;
  id v37 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100324F00;
  v23[3] = &unk_100989078;
  v23[4] = self;
  unint64_t v28 = a4;
  unint64_t v29 = a3;
  int64_t v30 = a5;
  id v18 = v15;
  id v24 = v18;
  BOOL v31 = a8;
  id v19 = v16;
  id v25 = v19;
  id v20 = v17;
  id v26 = v20;
  int64_t v27 = &v32;
  [(IDSDMessageStore *)self performBlock:v23 waitUntilDone:1];
  id v21 = (id)v33[5];

  _Block_object_dispose(&v32, 8);

  return v21;
}

- (id)unsentNonUrgentMessagesForAccountUUID:(id)a3 priority:(int64_t)a4 byteLimit:(unint64_t)a5 upToLimit:(unint64_t)a6 localDestinationDeviceID:(id)a7 messageTypes:(id)a8
{
  return [(IDSDMessageStore *)self _unsentOutgoingMessagesUpToLimit:a6 byteLimit:a5 priority:a4 accountUUID:a3 wantsPayload:1 requireDuet:1 localDestinationDeviceID:a7 messageTypes:a8];
}

- (id)unsentNonUrgentMessagesForAccountUUID:(id)a3 priority:(int64_t)a4 byteLimit:(unint64_t)a5 upToLimit:(unint64_t)a6 localDestinationDeviceID:(id)a7
{
  return [(IDSDMessageStore *)self _unsentOutgoingMessagesUpToLimit:a6 byteLimit:a5 priority:a4 accountUUID:a3 wantsPayload:1 requireDuet:0 localDestinationDeviceID:a7];
}

- (id)duetIdentifiersOverrideForAccountWithGUID:(id)a3 priority:(int64_t)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10032519C;
  v10[3] = &unk_100987EB0;
  id v11 = self;
  id v12 = a3;
  int64_t v14 = a4;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  id v13 = v5;
  id v6 = v12;
  [(IDSDMessageStore *)v11 performBlock:v10 waitUntilDone:1];
  BOOL v7 = v13;
  id v8 = v5;

  return v8;
}

- (void)markLocalDestinationDeviceUUIDForAccounts:(id)a3 deviceUUID:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003254A0;
  v7[3] = &unk_10097E418;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(IDSDMessageStore *)v8 performBlock:v7];
}

- (void)markAllMessageAsPendingDeleteForAccounts:(id)a3 withDestinationDevice:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100325664;
  v7[3] = &unk_10097E418;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(IDSDMessageStore *)v8 performBlock:v7];
}

- (id)allOutgoingMessagesPendingDeleteWithLimit:(int64_t)a3
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10031E700;
  id v10 = sub_10031E710;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100325864;
  v5[3] = &unk_10097F2C8;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  [(IDSDMessageStore *)self performBlock:v5 waitUntilDone:1];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)outgoingMessagesWithEnqueueDateOlderThan:(int64_t)a3 notToDestinationDeviceID:(id)a4 andLimit:(int64_t)a5
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_10031E700;
  id v19 = sub_10031E710;
  id v20 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100325A60;
  v9[3] = &unk_1009890A0;
  id v10 = self;
  int64_t v13 = a3;
  id v6 = a4;
  int64_t v14 = a5;
  id v11 = v6;
  id v12 = &v15;
  [(IDSDMessageStore *)v10 performBlock:v9 waitUntilDone:1];
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v7;
}

- (id)largestEnquedMessagesAmountAccountUUID
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_10031E700;
  id v9 = sub_10031E710;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100325C34;
  v4[3] = &unk_100980368;
  v4[4] = self;
  v4[5] = &v5;
  [(IDSDMessageStore *)self performBlock:v4 waitUntilDone:1];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)deleteAllMessagesWithAccountGUID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100325D50;
    v5[3] = &unk_10097E440;
    v5[4] = self;
    id v6 = v4;
    [(IDSDMessageStore *)self performBlock:v5];
  }
}

- (void)updateInternalMigrationVersionOnDatabaseWithValue:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100325E30;
  v3[3] = &unk_10097FDE8;
  v3[4] = self;
  int v4 = a3;
  [(IDSDMessageStore *)self performBlock:v3];
}

- (int)internalMigrationVersionOnDatabase
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = -1431655766;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100325F68;
  v4[3] = &unk_100980368;
  v4[4] = self;
  v4[5] = &v5;
  [(IDSDMessageStore *)self performBlock:v4 waitUntilDone:1];
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)checkpointAndVacuumDB
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10032604C;
  v2[3] = &unk_10097E4D0;
  v2[4] = self;
  [(IDSDMessageStore *)self performBlock:v2 waitUntilDone:1];
}

- (void)storeOutgoingMessageWithSendParameters:(id)a3 guid:(id)a4 canSend:(BOOL)a5 canBypassSimilarMessages:(BOOL)a6 fromQueue:(id)a7 completionBlock:(id)a8
{
  id v11 = a3;
  id v62 = a4;
  uint64_t v60 = a7;
  uint64_t v61 = (void (**)(id, id, uint64_t, uint64_t))a8;
  dispatch_assert_queue_V2(v60);
  id v12 = [v11 destinations];
  int64_t v13 = [v12 destinationURIs];
  if ([v13 count])
  {
    int64_t v14 = [v11 accountUUID];
    id v15 = [v14 length];

    if (v15)
    {
      if ([v11 bypassStorage])
      {
        id v16 = +[IDSFoundationLog IDSMessageStore];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v84 = v62;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Asked to bypass storage for message with GUID %@", buf, 0xCu);
        }

        v61[2](v61, v62, 1, 1);
      }
      else
      {
        id v20 = [v11 message];
        if (v20)
        {
          id v21 = [v11 message];
          uint64_t v22 = JWEncodeDictionary();

          uint64_t v55 = (void *)v22;
        }
        else
        {
          uint64_t v55 = 0;
        }

        uint64_t v56 = [v11 data];
        id v23 = [v11 protobuf];
        if (v23)
        {
          id v24 = [v11 protobuf];
          uint64_t v25 = JWEncodeDictionary();

          uint64_t v53 = v25;
        }
        else
        {
          uint64_t v53 = 0;
        }

        id v26 = [v11 keyTransparencyURIVerificationMap];

        if (v26)
        {
          id v27 = objc_alloc_init((Class)NSMutableDictionary);
          long long v80 = 0u;
          long long v81 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          unint64_t v28 = [v11 keyTransparencyURIVerificationMap];
          id v29 = [v28 countByEnumeratingWithState:&v78 objects:v82 count:16];
          if (v29)
          {
            uint64_t v30 = *(void *)v79;
            do
            {
              for (i = 0; i != v29; i = (char *)i + 1)
              {
                if (*(void *)v79 != v30) {
                  objc_enumerationMutation(v28);
                }
                uint64_t v32 = *(void *)(*((void *)&v78 + 1) + 8 * i);
                int v33 = objc_msgSend(v11, "keyTransparencyURIVerificationMap", v53);
                uint64_t v34 = [v33 objectForKey:v32];
                id v35 = [v34 UUIDString];
                [v27 setObject:v35 forKey:v32];
              }
              id v29 = [v28 countByEnumeratingWithState:&v78 objects:v82 count:16];
            }
            while (v29);
          }

          int v36 = JWEncodeDictionary();
        }
        else
        {
          int v36 = 0;
        }
        id v37 = objc_msgSend(v11, "destinations", v53);
        id v77 = 0;
        int v38 = +[NSKeyedArchiver archivedDataWithRootObject:v37 requiringSecureCoding:0 error:&v77];
        id v39 = v77;

        if (!v38)
        {
          BOOL v40 = +[IDSFoundationLog IDSMessageStore];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            BOOL v41 = [v11 destinations];
            sub_10071EEDC(v41, (uint64_t)v39, buf, v40);
          }
        }
        __int16 v42 = [v11 deliveryStatusContext];
        id v43 = JWEncodeDictionary();

        id v44 = [v11 duetIdentifiersOverride];
        id v45 = JWEncodeArray();

        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_100326800;
        v63[3] = &unk_1009890F0;
        v63[4] = self;
        BOOL v75 = a5;
        BOOL v76 = a6;
        id v64 = v11;
        id v65 = v62;
        id v66 = v55;
        id v67 = v56;
        id v68 = v54;
        id v69 = v38;
        id v70 = v43;
        id v71 = v45;
        id v72 = v36;
        CFTypeRef v74 = v61;
        v73 = v60;
        id v46 = v36;
        id v47 = v45;
        id v48 = v43;
        id v49 = v38;
        id v50 = v54;
        id v51 = v56;
        id v52 = v55;
        [(IDSDMessageStore *)self performBlock:v63];
      }
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v17 = +[IDSFoundationLog IDSMessageStore];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v11 destinations];
    id v19 = [v11 accountUUID];
    *(_DWORD *)buf = 138412802;
    id v84 = v11;
    __int16 v85 = 2112;
    CFTypeRef v86 = v18;
    __int16 v87 = 2112;
    CFTypeRef v88 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Ignoring storeOutgoingMessageWithSendParameters: %@ destinations: %@ accountID: %@", buf, 0x20u);
  }
LABEL_32:
}

- (void)markOutgoingMessageWithGUID:(id)a3 asSent:(BOOL)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100327098;
    v7[3] = &unk_1009802F0;
    void v7[4] = self;
    id v8 = v6;
    BOOL v9 = a4;
    [(IDSDMessageStore *)self performBlock:v7];
  }
}

- (void)markAllOutgoingMessagesAsUnsent
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100327184;
  v2[3] = &unk_10097E4D0;
  v2[4] = self;
  [(IDSDMessageStore *)self performBlock:v2];
}

- (void)markAllOutgoingMessagesAsUnsentForLocalDestination:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100327280;
  v4[3] = &unk_10097E440;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(IDSDMessageStore *)v5 performBlock:v4];
}

- (void)deletePostponedMessages:(id)a3 classDDatabase:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003273AC;
  v8[3] = &unk_10097E418;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(IDSDMessageStore *)self performBlock:v8];
}

- (void)deleteOutgoingMessageWithGUID:(id)a3 alternateGUID:(id)a4 classDDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length])
  {
    id v11 = +[IDSFoundationLog IDSMessageStore];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "deleteOutgoingMessageWithGUID:alternateGUID: {guid: %@, alternateGUID: %@}", buf, 0x16u);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10032758C;
    v12[3] = &unk_10097E5A8;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    [(IDSDMessageStore *)self performBlock:v12];
  }
}

- (void)deleteIncomingMessageWithGUID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100327780;
    v5[3] = &unk_10097E440;
    v5[4] = self;
    id v6 = v4;
    [(IDSDMessageStore *)self performBlock:v5];
  }
}

- (void)deleteExpiredIncomingMessagesOlderThan:(double)a3 withLimit:(int64_t)a4
{
  if (a3 != 0.0)
  {
    void v6[7] = v4;
    v6[8] = v5;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100327874;
    v6[3] = &unk_100989118;
    void v6[4] = self;
    *(double *)&v6[5] = a3;
    v6[6] = a4;
    [(IDSDMessageStore *)self performBlock:v6];
  }
}

- (id)deleteExpiredIncomingRestrictedMessagesOlderThan:(double)a3
{
  if (a3 == 0.0)
  {
    id v3 = &__NSArray0__struct;
  }
  else
  {
    +[NSMutableArray array];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1003279E8;
    v9[3] = &unk_1009875C8;
    void v9[4] = self;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v6;
    double v11 = a3;
    [(IDSDMessageStore *)self performBlock:v9];
    id v7 = v10;
    id v3 = v6;
  }

  return v3;
}

- (void)updateExpirationForIncomingMessageWithGUID:(id)a3 expirationDate:(int64_t)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100327B3C;
    v7[3] = &unk_1009875C8;
    void v7[4] = self;
    id v8 = v6;
    int64_t v9 = a4;
    [(IDSDMessageStore *)self performBlock:v7];
  }
}

- (void)__closeDatabase
{
  [(IDSDMessageStore *)self _clearDatabaseCloseTimer];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100327C54;
  v4[3] = &unk_10097E4D0;
  void v4[4] = self;
  id v3 = [(IDSDMessageStore *)self database];
  sub_1003E5954(v4, 1, v3);
}

- (void)_clearDatabaseCloseTimer
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  databaseCloseTimer = self->_databaseCloseTimer;
  if (databaseCloseTimer)
  {
    dispatch_source_cancel(databaseCloseTimer);
    uint64_t v4 = self->_databaseCloseTimer;
    self->_databaseCloseTimer = 0;
  }
  recursiveLock = self->_recursiveLock;

  [(NSRecursiveLock *)recursiveLock unlock];
}

- (void)_setDatabaseCloseTimer
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  self->_databaseLastUpdateTime = CFAbsoluteTimeGetCurrent();
  if (self->_databaseCloseTimer)
  {
    recursiveLock = self->_recursiveLock;
    [(NSRecursiveLock *)recursiveLock unlock];
  }
  else
  {
    uint64_t v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, 0);
    databaseCloseTimer = self->_databaseCloseTimer;
    self->_databaseCloseTimer = v4;

    id v6 = self->_databaseCloseTimer;
    dispatch_time_t v7 = dispatch_time(0, 0x8BB2C90000);
    dispatch_source_set_timer(v6, v7, 0x7FFFFFFFFFFFFFFFuLL, 0xDF8474CCCuLL);
    id v8 = self->_databaseCloseTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100327E08;
    handler[3] = &unk_10097E4D0;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume((dispatch_object_t)self->_databaseCloseTimer);
    [(NSRecursiveLock *)self->_recursiveLock unlock];
  }
}

- (void)closeDatabase
{
  [(IDSDMessageStore *)self _clearDatabaseCloseTimer];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100327F6C;
  v3[3] = &unk_10097E4D0;
  v3[4] = self;
  [(IDSDMessageStore *)self performBlock:v3 waitUntilDone:1];
}

- (void)deleteDatabase
{
  [(IDSDMessageStore *)self closeDatabase];
  id v3 = [(IDSDMessageStore *)self database];
  [v3 deleteDatabase];
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = [v4 copy];

    id v10 = v6;
    id v7 = v6;
    id v8 = [(IDSDMessageStore *)self database];
    sub_1003E5954(&v9, 0, v8);
  }
}

- (void)performBlock:(id)a3 afterDelay:(double)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    id v7 = [v5 copy];

    id v11 = v7;
    id v8 = v7;
    uint64_t v9 = [(IDSDMessageStore *)self database];
    sub_1003E59C4(&v10, v9);
  }
}

- (void)performBlock:(id)a3 waitUntilDone:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    id v8 = [v6 copy];

    id v12 = v8;
    id v9 = v8;
    uint64_t v10 = [(IDSDMessageStore *)self database];
    sub_1003E5954(&v11, v4, v10);
  }
}

- (IDSDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_databaseCloseTimer, 0);

  objc_storeStrong((id *)&self->_recursiveLock, 0);
}

@end