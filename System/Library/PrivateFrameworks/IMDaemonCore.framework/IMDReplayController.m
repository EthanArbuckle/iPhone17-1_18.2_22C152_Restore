@interface IMDReplayController
+ (IMDReplayController)sharedInstance;
+ (int64_t)batchSize;
- (BOOL)isRecordingReplayDB;
- (BOOL)storeMessage:(id)a3 type:(unsigned __int8)a4 error:(id *)a5;
- (IMDReplayController)init;
- (IMDReplayController)initWithStorageController:(id)a3;
- (IMDReplayStorageController)storageController;
- (IMDReplayStorageIterationContext)heldDeletionContext;
- (NSDictionary)syncTaskByServiceName;
- (id)automationCompletionBlock;
- (void)_fetchNexBatchOfMessagesAndReplay;
- (void)_processBatch:(id)a3;
- (void)dealloc;
- (void)deleteReplayDBIfNotUnderFirstUnlock;
- (void)endRecordingReplayDatabase;
- (void)overrideStorageControllerWithDatabaseFromPath:(id)a3;
- (void)replayMessages;
- (void)replayMessagesWithCompletion:(id)a3;
- (void)restoreDefaultStoreControllerInstance;
- (void)scheduleSyncTaskForServices:(id)a3;
- (void)setAutomationCompletionBlock:(id)a3;
- (void)setHeldDeletionContext:(id)a3;
- (void)setStorageController:(id)a3;
- (void)setSyncTaskByServiceName:(id)a3;
- (void)startRecordingReplayDatabase;
@end

@implementation IMDReplayController

+ (IMDReplayController)sharedInstance
{
  if (qword_1EBE2B8C8 != -1) {
    dispatch_once(&qword_1EBE2B8C8, &unk_1F3391B60);
  }
  return (IMDReplayController *)qword_1EBE2BA08;
}

- (IMDReplayController)init
{
  v4.receiver = self;
  v4.super_class = (Class)IMDReplayController;
  v2 = [(IMDReplayController *)&v4 init];
  if (v2) {
    v2->_storageController = [[IMDReplayStorageController alloc] initWithFilePath:@"/var/mobile/Library/SMS/replayDB.db"];
  }
  return v2;
}

- (IMDReplayController)initWithStorageController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMDReplayController;
  objc_super v4 = [(IMDReplayController *)&v6 init];
  if (v4) {
    v4->_storageController = (IMDReplayStorageController *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMDReplayController;
  [(IMDReplayController *)&v3 dealloc];
}

- (BOOL)storeMessage:(id)a3 type:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = a3;
      __int16 v23 = 1024;
      LODWORD(v24) = v6;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Request to store replay message %@ type %d", buf, 0x12u);
    }
  }
  id v10 = a3;
  if (!a3)
  {
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "IMDReplayContoller message was nil", buf, 2u);
      }
    }
    if (a5) {
      *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMDReplayControllerErrorDomain" code:0 userInfo:0];
    }
    return 0;
  }
  if (v6 >= 3)
  {
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v22) = v6;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "IMDReplayContoller Incorrect message type %d", buf, 8u);
      }
    }
    if (a5) {
      *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMDReplayControllerErrorDomain" code:1 userInfo:0];
    }
LABEL_11:

    return 0;
  }
  objc_opt_class();
  id v14 = a3;
  if (objc_opt_isKindOfClass())
  {
    id v14 = (id)[a3 dictionaryRepresentation];
    if (!v14)
    {
      if (IMOSLoggingEnabled())
      {
        v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = a3;
          _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "IMDReplayContoller Unable to archive message object: %@", buf, 0xCu);
        }
      }
      goto LABEL_11;
    }
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v16 = (const void *)[NSNumber numberWithInt:v6];
  if (v16)
  {
    CFDictionarySetValue(Mutable, @"mT", v16);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1D9904900();
  }
  CFDictionarySetValue(Mutable, @"mPL", v14);
  v20 = 0;
  BOOL v13 = [(IMDReplayStorageController *)self->_storageController storeDictionary:Mutable error:&v20];
  if (!v13)
  {
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v22 = a3;
        __int16 v23 = 2112;
        v24 = v20;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "IMDReplayMessageController. Storing message %@ failed with error %@", buf, 0x16u);
      }
    }
    if (a5) {
      *a5 = v20;
    }
  }

  return v13;
}

- (void)_processBatch:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v20 = (void *)[MEMORY[0x1E4F1CA48] array];
  v21 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(a3);
        }
        v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1E016A370]();
        unsigned __int8 v9 = objc_msgSend((id)objc_msgSend(v7, "valueForKey:", @"mT"), "integerValue");
        uint64_t v10 = [v7 valueForKey:@"mPL"];
        if (v10)
        {
          uint64_t v11 = [MEMORY[0x1E4F6ABC0] transactionLogMessageFromDictionaryRepresentation:v10];
          if (v11) {
            uint64_t v12 = v11;
          }
          else {
            uint64_t v12 = v10;
          }
          if (v9 - 1 >= 2)
          {
            if (v9)
            {
              if (IMOSLoggingEnabled())
              {
                id v14 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v7;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = v9;
                  _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "IMDReplayContoller Trying to replay message of unknown type %@ %d", buf, 0x12u);
                }
              }
            }
            else
            {
              [v20 addObject:v12];
            }
          }
          else
          {
            [v21 addObject:v12];
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            BOOL v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "IMDReplayContoller: Found an empty message payload while replaying", buf, 2u);
            }
          }
        }
      }
      uint64_t v4 = [a3 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v4);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v28 = 0;
  if ([v20 count]) {
    ++*(void *)(*(void *)&buf[8] + 24);
  }
  if ([v21 count]) {
    ++*(void *)(*(void *)&buf[8] + 24);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1D97F35A0;
  v22[3] = &unk_1E6B770F0;
  v22[4] = self;
  v22[5] = buf;
  id v15 = [(NSDictionary *)self->_syncTaskByServiceName valueForKey:*MEMORY[0x1E4F6E1B0]];
  uint64_t v16 = [v15 batchProcessingBlock];
  if ([v20 count] && v15 && objc_msgSend(v15, "batchProcessingBlock") && v16) {
    (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v20, v22);
  }
  id v17 = [(NSDictionary *)self->_syncTaskByServiceName valueForKey:*MEMORY[0x1E4F6E1A0]];
  uint64_t v18 = [v17 batchProcessingBlock];
  if ([v21 count] && v17 && objc_msgSend(v17, "batchProcessingBlock") && v18) {
    (*(void (**)(uint64_t, void *, void *))(v18 + 16))(v18, v21, v22);
  }
  _Block_object_dispose(buf, 8);
}

- (void)replayMessages
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "Request received to replay messages.", v4, 2u);
    }
  }
  objc_super v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:IMDMessageHistorySyncNotifyReplayControllerWantsSync object:0];
}

- (void)scheduleSyncTaskForServices:(id)a3
{
  [(IMDReplayController *)self setHeldDeletionContext:0];
  [(IMDReplayController *)self setSyncTaskByServiceName:a3];

  MEMORY[0x1F4181798](self, sel__fetchNexBatchOfMessagesAndReplay);
}

- (void)_fetchNexBatchOfMessagesAndReplay
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(IMDReplayController *)self heldDeletionContext];
  uint64_t v4 = (void *)MEMORY[0x1E016A370]();
  id v17 = v3;
  id v5 = [(IMDReplayStorageController *)self->_storageController copyNextBatchWithSize:200 iterationContext:&v17];
  if (v3 != v17) {
    -[IMDReplayController setHeldDeletionContext:](self, "setHeldDeletionContext:");
  }
  if (v5 && [v5 count])
  {
    [(IMDReplayController *)self _processBatch:v5];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [(NSDictionary *)self->_syncTaskByServiceName allKeys];
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = objc_msgSend(-[NSDictionary valueForKey:](self->_syncTaskByServiceName, "valueForKey:", *(void *)(*((void *)&v13 + 1) + 8 * v9)), "completionBlock");
          if (v10) {
            (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v7);
    }
    if ([(IMDReplayController *)self automationCompletionBlock])
    {
      (*(void (**)(void))([(IMDReplayController *)self automationCompletionBlock] + 16))();
      [(IMDReplayController *)self setAutomationCompletionBlock:0];
    }

    [(IMDReplayController *)self setHeldDeletionContext:0];
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Deleting replay DB after replaying messages", v12, 2u);
      }
    }
    [(IMDReplayStorageController *)self->_storageController deleteReplayDB];
  }
}

- (void)deleteReplayDBIfNotUnderFirstUnlock
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6EAB8], "sharedInstance"), "isUnderFirstDataProtectionLock");
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = @"NO";
      if (v3) {
        id v5 = @"YES";
      }
      int v9 = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "deleteReplayDBIfNotUnderFirstUnlock isUnderFirstUnlock %@", (uint8_t *)&v9, 0xCu);
    }
  }
  int v6 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v6)
    {
      uint64_t v7 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Not deleting replay DB", (uint8_t *)&v9, 2u);
      }
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v8 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Deleting replay DB on imagent launch after first unlock", (uint8_t *)&v9, 2u);
      }
    }
    [(IMDReplayStorageController *)self->_storageController deleteReplayDB];
  }
}

- (void)overrideStorageControllerWithDatabaseFromPath:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = a3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Setting up new replay database at path: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  int v6 = [[IMDReplayStorageController alloc] initWithFilePath:a3];
  if (v6)
  {
    if (self->_suspendedStorageController)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v7 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v10) = 0;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "An replay database was already overriding the default, ending previous override", (uint8_t *)&v10, 2u);
        }
      }
    }
    else
    {
      self->_suspendedStorageController = self->_storageController;
    }
    self->_storageController = v6;
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = [(IMDReplayStorageController *)self->_storageController filePath];
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Unable to setup replayStorageController, previous store controller with database at path %@ remains active", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)restoreDefaultStoreControllerInstance
{
  suspendedStorageController = self->_suspendedStorageController;
  int v4 = IMOSLoggingEnabled();
  if (suspendedStorageController)
  {
    if (v4)
    {
      id v5 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Restoring default replay database", buf, 2u);
      }
    }
    if (self->_isRecordingReplayDB) {
      [(IMDReplayController *)self endRecordingReplayDatabase];
    }

    self->_storageController = self->_suspendedStorageController;
    self->_suspendedStorageController = 0;
  }
  else if (v4)
  {
    int v6 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Attempted to restore a database when no override database was set", v7, 2u);
    }
  }
}

- (void)startRecordingReplayDatabase
{
  if (!self->_isRecordingReplayDB)
  {
    if (IMOSLoggingEnabled())
    {
      int v3 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v4 = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Starting to recording replay database", v4, 2u);
      }
    }
    self->_isRecordingReplayDB = 1;
  }
}

- (void)endRecordingReplayDatabase
{
  if (self->_isRecordingReplayDB)
  {
    if (IMOSLoggingEnabled())
    {
      int v3 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v4 = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "End recording replay database", v4, 2u);
      }
    }
    self->_isRecordingReplayDB = 0;
  }
}

- (void)replayMessagesWithCompletion:(id)a3
{
  if (a3) {
    -[IMDReplayController setAutomationCompletionBlock:](self, "setAutomationCompletionBlock:");
  }

  [(IMDReplayController *)self replayMessages];
}

+ (int64_t)batchSize
{
  return 200;
}

- (BOOL)isRecordingReplayDB
{
  return self->_isRecordingReplayDB;
}

- (NSDictionary)syncTaskByServiceName
{
  return self->_syncTaskByServiceName;
}

- (void)setSyncTaskByServiceName:(id)a3
{
}

- (IMDReplayStorageIterationContext)heldDeletionContext
{
  return self->_heldDeletionContext;
}

- (void)setHeldDeletionContext:(id)a3
{
}

- (id)automationCompletionBlock
{
  return self->_automationCompletionBlock;
}

- (void)setAutomationCompletionBlock:(id)a3
{
}

- (IMDReplayStorageController)storageController
{
  return self->_storageController;
}

- (void)setStorageController:(id)a3
{
}

@end