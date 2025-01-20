@interface _LSInstallNotificationJournaller
+ (BOOL)shouldJournalNotificationType:(int)a3;
+ (BOOL)supportsSecureCoding;
+ (void)createInstallJournalDirectoryIfRequired;
- (BOOL)applicableForCurrentDatabase;
- (BOOL)entityExists;
- (BOOL)isApplicationRegisteredWithbundleID:(id)a3 placeholder:(BOOL)a4;
- (BOOL)shouldExpectEntityToExist;
- (_LSInstallNotificationJournaller)initWithCoder:(id)a3;
- (_LSInstallNotificationJournaller)initWithPrimaryBundleID:(id)a3 operation:(unint64_t)a4;
- (double)timestamp;
- (id)journalURL;
- (id)journalledNotifications;
- (id)primaryBundleID;
- (id)synthesizedPreliminaryJournalledNotifications;
- (unint64_t)installOperation;
- (void)_writeJournalUnconditionally;
- (void)applicableForCurrentDatabase;
- (void)encodeWithCoder:(id)a3;
- (void)removeJournalAfterNotificationFence;
- (void)removeJournalFile;
- (void)sendNotification:(int)a3 forApps:(id)a4 withPlugins:(BOOL)a5;
- (void)sendNotification:(int)a3 forApps:(id)a4 withPlugins:(BOOL)a5 options:(id)a6;
- (void)setPrimaryBundleID:(id)a3;
- (void)shouldExpectEntityToExist;
- (void)writeFinalJournal;
- (void)writePreliminaryJournal;
@end

@implementation _LSInstallNotificationJournaller

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)createInstallJournalDirectoryIfRequired
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_182959000, v0, OS_LOG_TYPE_FAULT, "Failed to create install journal directory with error: %@", v1, 0xCu);
}

- (_LSInstallNotificationJournaller)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LSInstallNotificationJournaller;
  v5 = [(_LSInstallNotificationJournaller *)&v15 init];
  if (v5)
  {
    v5->_preliminary = [v4 decodeBoolForKey:@"_preliminary"];
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"_primaryBundleID");
    primaryBundleID = v5->_primaryBundleID;
    v5->_primaryBundleID = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = objc_msgSend(v4, "ls_decodeObjectOfClasses:forKey:", v10, @"_journalledNotifications");
    journalledNotifications = v5->_journalledNotifications;
    v5->_journalledNotifications = (NSMutableArray *)v11;

    v5->_operationType = [v4 decodeIntegerForKey:@"_operationType"];
    [v4 decodeDoubleForKey:@"_timestamp"];
    v5->_timestamp = v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL preliminary = self->_preliminary;
  id v5 = a3;
  [v5 encodeBool:preliminary forKey:@"_preliminary"];
  [v5 encodeObject:self->_primaryBundleID forKey:@"_primaryBundleID"];
  [v5 encodeObject:self->_journalledNotifications forKey:@"_journalledNotifications"];
  [v5 encodeInteger:self->_operationType forKey:@"_operationType"];
  [v5 encodeDouble:@"_timestamp" forKey:self->_timestamp];
}

- (_LSInstallNotificationJournaller)initWithPrimaryBundleID:(id)a3 operation:(unint64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LSInstallNotificationJournaller;
  v7 = [(_LSInstallNotificationJournaller *)&v15 init];
  v8 = v7;
  if (v7)
  {
    v7->_BOOL preliminary = 1;
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    journalledNotifications = v8->_journalledNotifications;
    v8->_journalledNotifications = (NSMutableArray *)v9;

    uint64_t v11 = [v6 copy];
    primaryBundleID = v8->_primaryBundleID;
    v8->_primaryBundleID = (NSString *)v11;

    v8->_operationType = a4;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v8->_timestamp = v13;
  }

  return v8;
}

- (BOOL)isApplicationRegisteredWithbundleID:(id)a3 placeholder:(BOOL)a4
{
  id v5 = a3;
  uint64_t v14 = 0;
  objc_super v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  _LSServer_DatabaseExecutionContext();
  id v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84___LSInstallNotificationJournaller_isApplicationRegisteredWithbundleID_placeholder___block_invoke;
  v10[3] = &unk_1E5231C10;
  id v7 = v5;
  BOOL v13 = a4;
  id v11 = v7;
  v12 = &v14;
  -[LSDBExecutionContext syncRead:](v6, v10);

  char v8 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (BOOL)shouldExpectEntityToExist
{
  unint64_t v3 = [(_LSInstallNotificationJournaller *)self installOperation];
  if (v3 >= 9)
  {
    id v5 = _LSInstallLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[_LSInstallNotificationJournaller shouldExpectEntityToExist](self);
    }

    LOBYTE(v4) = 0;
  }
  else
  {
    return (0x7Fu >> v3) & 1;
  }
  return v4;
}

- (BOOL)entityExists
{
  uint64_t v2 = self;
  BOOL v3 = (([(_LSInstallNotificationJournaller *)self installOperation] - 2) & 0xFFFFFFFFFFFFFFFALL) == 0;
  BOOL v4 = [(_LSInstallNotificationJournaller *)v2 primaryBundleID];
  LOBYTE(v2) = [(_LSInstallNotificationJournaller *)v2 isApplicationRegisteredWithbundleID:v4 placeholder:v3];

  return (char)v2;
}

- (BOOL)applicableForCurrentDatabase
{
  BOOL v3 = [(_LSInstallNotificationJournaller *)self shouldExpectEntityToExist];
  BOOL v4 = [(_LSInstallNotificationJournaller *)self entityExists];
  int v5 = !v4;
  if (v3) {
    int v6 = v4;
  }
  else {
    int v6 = !v4;
  }
  if (v6 != 1) {
    return 0;
  }
  BOOL v7 = v4;
  BOOL result = 1;
  if ((!v3 | v5) == 1 && (v3 || v7))
  {
    uint64_t v9 = _LSInstallLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      [(_LSInstallNotificationJournaller *)v3 applicableForCurrentDatabase];
    }

    return 0;
  }
  return result;
}

- (id)synthesizedPreliminaryJournalledNotifications
{
  v12[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_LSInstallNotificationJournaller *)self installOperation] == 8;
  uint64_t v4 = +[_LSInstallProgressService notificationTypeForOperation:[(_LSInstallNotificationJournaller *)self installOperation]];
  int v5 = [_LSJournalledNotification alloc];
  int v6 = [(_LSInstallNotificationJournaller *)self primaryBundleID];
  id v11 = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  char v8 = [(_LSJournalledNotification *)v5 initWithNotification:v4 bundleIDs:v7 plugins:v3 options:0];
  v12[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v9;
}

- (id)journalledNotifications
{
  if (self->_preliminary)
  {
    uint64_t v2 = [(_LSInstallNotificationJournaller *)self synthesizedPreliminaryJournalledNotifications];
  }
  else
  {
    uint64_t v2 = self->_journalledNotifications;
  }

  return v2;
}

- (id)primaryBundleID
{
  return self->_primaryBundleID;
}

- (unint64_t)installOperation
{
  return self->_operationType;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (id)journalURL
{
  BOOL v3 = [(id)__LSDefaultsGetSharedInstance() installJournalDirectoryURL];
  uint64_t v4 = [NSString stringWithFormat:@"%@.%f.%d", self->_primaryBundleID, *(void *)&self->_timestamp, self->_operationType];
  int v5 = [v3 URLByAppendingPathComponent:v4];
  int v6 = [v5 URLByAppendingPathExtension:@"notejournal"];

  return v6;
}

- (void)removeJournalFile
{
  v1 = [a1 journalURL];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_1(&dword_182959000, v2, v3, "Couldn't remove journal file at %@", v4, v5, v6, v7, v8);
}

- (void)_writeJournalUnconditionally
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 journalURL];
  OUTLINED_FUNCTION_2_8();
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_182959000, a3, OS_LOG_TYPE_FAULT, "couldn't write data to journal file %@: %@", v6, 0x16u);
}

- (void)writePreliminaryJournal
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  primaryBundleID = self->_primaryBundleID;
  uint64_t v5 = _LSInstallLog();
  uint64_t v6 = v5;
  if (primaryBundleID)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = self->_primaryBundleID;
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_INFO, "writing preliminary journal for %@", (uint8_t *)&v10, 0xCu);
    }

    if (!self->_preliminary)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"_LSInstallProgressService.m" lineNumber:2224 description:@"writing preliminary journal but journaller no longer preliminary?"];
    }
    if ([(NSMutableArray *)self->_journalledNotifications count])
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"_LSInstallProgressService.m" lineNumber:2225 description:@"writing preliminary journal but more than 0 journalled notifications?"];
    }
    [(_LSInstallNotificationJournaller *)self _writeJournalUnconditionally];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEFAULT, "not writing preliminary journal for install operation with no known bundle ID.", (uint8_t *)&v10, 2u);
    }
  }
}

- (void)writeFinalJournal
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  primaryBundleID = self->_primaryBundleID;
  uint64_t v4 = _LSInstallLog();
  uint64_t v5 = v4;
  if (primaryBundleID)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = self->_primaryBundleID;
      int v9 = 138412290;
      int v10 = v6;
      _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_INFO, "writing final journal for %@", (uint8_t *)&v9, 0xCu);
    }

    self->_BOOL preliminary = 0;
    if (![(NSMutableArray *)self->_journalledNotifications count])
    {
      uint64_t v7 = _LSInstallLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = self->_primaryBundleID;
        int v9 = 138412290;
        int v10 = v8;
        _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "journal for %@ had no logs but was the final journal... that's suspicious.", (uint8_t *)&v9, 0xCu);
      }
    }
    [(_LSInstallNotificationJournaller *)self _writeJournalUnconditionally];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEFAULT, "not writing final journal for install operation with no known bundle ID.", (uint8_t *)&v9, 2u);
    }
  }
}

- (void)setPrimaryBundleID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  primaryBundleID = self->_primaryBundleID;
  uint64_t v6 = _LSInstallLog();
  uint64_t v7 = v6;
  if (primaryBundleID)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_LSInstallNotificationJournaller setPrimaryBundleID:](v7);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "Setting bundleID of journaller to %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v8 = (NSString *)[v4 copy];
    uint64_t v7 = self->_primaryBundleID;
    self->_primaryBundleID = v8;
  }
}

- (void)removeJournalAfterNotificationFence
{
  uint64_t v3 = (void *)os_transaction_create();
  id v4 = +[_LSInstallProgressService sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71___LSInstallNotificationJournaller_removeJournalAfterNotificationFence__block_invoke;
  v6[3] = &unk_1E522BBD8;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [v4 addSendNotificationFenceWithTimeout:v6 fenceBlock:60.0];
}

+ (BOOL)shouldJournalNotificationType:(int)a3
{
  return a3 != 3 && a3 != 0;
}

- (void)sendNotification:(int)a3 forApps:(id)a4 withPlugins:(BOOL)a5 options:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a3;
  id v13 = a4;
  id v10 = a6;
  if ([(id)objc_opt_class() shouldJournalNotificationType:v8])
  {
    uint64_t v11 = [[_LSJournalledNotification alloc] initWithNotification:v8 bundleIDs:v13 plugins:v7 options:v10];
    [(NSMutableArray *)self->_journalledNotifications addObject:v11];
  }
  uint64_t v12 = +[_LSInstallProgressService sharedInstance];
  [v12 sendNotification:v8 forApps:v13 withPlugins:v7 completion:0];
}

- (void)sendNotification:(int)a3 forApps:(id)a4 withPlugins:(BOOL)a5
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_journalledNotifications, 0);

  objc_storeStrong((id *)&self->_primaryBundleID, 0);
}

- (void)shouldExpectEntityToExist
{
  [a1 installOperation];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_1(&dword_182959000, v1, v2, "bogus install operation %lu?", v3, v4, v5, v6, v7);
}

- (void)applicableForCurrentDatabase
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  int v5 = a2 & 1;
  _os_log_fault_impl(&dword_182959000, log, OS_LOG_TYPE_FAULT, "Unreachable code reached. This is a bug. %d %d", (uint8_t *)v3, 0xEu);
}

- (void)setPrimaryBundleID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Attempt to set primary bundle id for journaller that already has a primary bundle ID", v1, 2u);
}

@end