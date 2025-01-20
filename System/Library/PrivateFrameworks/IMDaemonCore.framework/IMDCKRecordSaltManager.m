@interface IMDCKRecordSaltManager
+ (id)sharedInstance;
- (IMDCKRecordSaltManager)init;
- (NSString)cachedSalt;
- (OS_dispatch_queue)ckQueue;
- (id)_CKUtilitiesSharedInstance;
- (id)_container;
- (void)_fetchLatestSaltFromCloudKitAndPersistWithCompletion:(id)a3;
- (void)_scheduleOperation:(id)a3;
- (void)clearLocalSyncState;
- (void)deleteDeDupeRecordZone;
- (void)fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:(id)a3;
- (void)fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:(id)a3 forceFetch:(BOOL)a4;
- (void)setCachedSalt:(id)a3;
@end

@implementation IMDCKRecordSaltManager

+ (id)sharedInstance
{
  if (qword_1EBE2B878 != -1) {
    dispatch_once(&qword_1EBE2B878, &unk_1F3391540);
  }
  v2 = (void *)qword_1EBE2B9B0;

  return v2;
}

- (IMDCKRecordSaltManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)IMDCKRecordSaltManager;
  v2 = [(IMDCKRecordSaltManager *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.private.Messages.IMDCKRecordSaltManager", 0);
    ckQueue = v2->_ckQueue;
    v2->_ckQueue = (OS_dispatch_queue *)v3;

    cachedSalt = v2->_cachedSalt;
    v2->_cachedSalt = 0;
  }
  return v2;
}

- (id)_CKUtilitiesSharedInstance
{
  return +[IMDCKUtilities sharedInstance];
}

- (void)_scheduleOperation:(id)a3
{
  id v3 = a3;
  id v5 = +[IMDCKDatabaseManager sharedInstance];
  v4 = [v5 truthDatabase];
  [v4 addOperation:v3];
}

- (id)_container
{
  v2 = +[IMDCKDatabaseManager sharedInstance];
  id v3 = [v2 truthContainer];

  return v3;
}

- (void)_fetchLatestSaltFromCloudKitAndPersistWithCompletion:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Starting salt fetch on internal queue", buf, 2u);
    }
  }
  v6 = [(IMDCKRecordSaltManager *)self _container];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D9796F98;
  v8[3] = &unk_1E6B76218;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 fetchUserRecordIDWithCompletionHandler:v8];
}

- (void)fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:(id)a3
{
}

- (void)fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:(id)a3 forceFetch:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(IMDCKRecordSaltManager *)self _CKUtilitiesSharedInstance];
  int v8 = [v7 cloudKitSyncingEnabled];

  id v9 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  int v10 = [v9 isUnderFirstDataProtectionLock];

  int v11 = IMOSLoggingEnabled();
  if ((v8 | v4) != 1 || v10)
  {
    if (v11)
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = @"NO";
        if (v8) {
          v17 = @"YES";
        }
        else {
          v17 = @"NO";
        }
        if (v10) {
          v16 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v25 = v17;
        __int16 v26 = 2112;
        v27 = v16;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "CloudKit Salt not fetched: syncing enabled %@ first unlock %@", buf, 0x16u);
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D9797650;
    block[3] = &unk_1E6B76240;
    id v22 = v6;
    char v23 = v10;
    id v18 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (v11)
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Request to fetch salt", buf, 2u);
      }
    }
    v13 = [(IMDCKRecordSaltManager *)self ckQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1D97976F0;
    v19[3] = &unk_1E6B73AB0;
    v19[4] = self;
    id v20 = v6;
    id v14 = v6;
    dispatch_async(v13, v19);
  }
}

- (void)clearLocalSyncState
{
}

- (void)deleteDeDupeRecordZone
{
  [(IMDCKRecordSaltManager *)self clearLocalSyncState];
  id v2 = +[IMDRecordZoneManager sharedInstance];
  [v2 deleteDeDupeSaltZone];
}

- (NSString)cachedSalt
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCachedSalt:(id)a3
{
}

- (OS_dispatch_queue)ckQueue
{
  return self->_ckQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckQueue, 0);

  objc_storeStrong((id *)&self->_cachedSalt, 0);
}

@end