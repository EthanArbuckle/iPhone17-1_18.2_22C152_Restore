@interface EDUserNotificationMailboxCutoffController
+ (OS_os_log)log;
- (BOOL)_shouldUpdateCutoffForMessage:(id)a3;
- (BOOL)_updateCutoffForMailbox:(id)a3 date:(id)a4;
- (BOOL)isMessageAboveMailboxCutoff:(id)a3;
- (NSMutableDictionary)mailboxCutoffs;
- (id)cutoffDateForMailbox:(id)a3;
- (void)_initializeIfNeeded;
- (void)_readFromDefaults;
- (void)_writeToDefaults;
- (void)clearCutoffForMailbox:(id)a3;
- (void)setMailboxCutoffs:(id)a3;
- (void)updateCutoffForMailboxesWithMessages:(id)a3;
@end

@implementation EDUserNotificationMailboxCutoffController

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__EDUserNotificationMailboxCutoffController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_100 != -1) {
    dispatch_once(&log_onceToken_100, block);
  }
  v2 = (void *)log_log_100;

  return (OS_os_log *)v2;
}

void __48__EDUserNotificationMailboxCutoffController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_100;
  log_log_100 = (uint64_t)v1;
}

- (id)cutoffDateForMailbox:(id)a3
{
  id v4 = a3;
  [(EDUserNotificationMailboxCutoffController *)self _initializeIfNeeded];
  v5 = [v4 URL];
  v6 = [v5 absoluteString];

  if (v6)
  {
    v7 = [(EDUserNotificationMailboxCutoffController *)self mailboxCutoffs];
    v8 = [v7 objectForKeyedSubscript:v6];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isMessageAboveMailboxCutoff:(id)a3
{
  id v4 = a3;
  [(EDUserNotificationMailboxCutoffController *)self _initializeIfNeeded];
  v5 = [v4 mailbox];
  v6 = [v5 URL];
  v7 = [v6 absoluteString];

  v8 = [(EDUserNotificationMailboxCutoffController *)self mailboxCutoffs];
  v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    v10 = [v4 dateReceived];
    char v11 = objc_msgSend(v10, "ef_isLaterThanDate:", v9);
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (void)updateCutoffForMailboxesWithMessages:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(EDUserNotificationMailboxCutoffController *)self _initializeIfNeeded];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    char v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([(EDUserNotificationMailboxCutoffController *)self _shouldUpdateCutoffForMessage:v10])
        {
          char v11 = [v10 mailbox];
          v12 = [v11 URL];
          v13 = [v12 absoluteString];

          if (v13)
          {
            v14 = [v10 dateReceived];
            BOOL v15 = [(EDUserNotificationMailboxCutoffController *)self _updateCutoffForMailbox:v13 date:v14];

            v7 |= v15;
          }
          else
          {
            v16 = +[EDUserNotificationMailboxCutoffController log];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v17 = [v10 remoteID];
              -[EDUserNotificationMailboxCutoffController updateCutoffForMailboxesWithMessages:](v17, buf, &v23, v16);
            }
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v6);

    if (v7) {
      [(EDUserNotificationMailboxCutoffController *)self _writeToDefaults];
    }
  }
  else
  {
  }
}

- (void)clearCutoffForMailbox:(id)a3
{
  id v9 = a3;
  [(EDUserNotificationMailboxCutoffController *)self _initializeIfNeeded];
  id v4 = [v9 URL];
  id v5 = [v4 absoluteString];

  if (v5)
  {
    uint64_t v6 = [(EDUserNotificationMailboxCutoffController *)self mailboxCutoffs];
    char v7 = [v6 objectForKeyedSubscript:v5];

    if (v7)
    {
      uint64_t v8 = [(EDUserNotificationMailboxCutoffController *)self mailboxCutoffs];
      [v8 setObject:0 forKeyedSubscript:v5];

      [(EDUserNotificationMailboxCutoffController *)self _writeToDefaults];
    }
  }
}

- (BOOL)_shouldUpdateCutoffForMessage:(id)a3
{
  id v3 = [a3 flags];
  char v4 = [v3 read];

  return v4;
}

- (BOOL)_updateCutoffForMailbox:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(EDUserNotificationMailboxCutoffController *)self mailboxCutoffs];
  id v9 = [v8 objectForKeyedSubscript:v6];

  if (v9 && !objc_msgSend(v7, "ef_isLaterThanDate:", v9))
  {
    BOOL v11 = 0;
  }
  else
  {
    v10 = [(EDUserNotificationMailboxCutoffController *)self mailboxCutoffs];
    [v10 setObject:v7 forKeyedSubscript:v6];

    BOOL v11 = 1;
  }

  return v11;
}

- (void)_initializeIfNeeded
{
  id v3 = [(EDUserNotificationMailboxCutoffController *)self mailboxCutoffs];

  if (!v3)
  {
    [(EDUserNotificationMailboxCutoffController *)self _readFromDefaults];
  }
}

- (void)_readFromDefaults
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v6 objectForKey:@"UserNotificationMailboxCutoffs"];
  if (v3) {
    char v4 = (void *)v3;
  }
  else {
    char v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v4];
  [(EDUserNotificationMailboxCutoffController *)self setMailboxCutoffs:v5];
}

- (void)_writeToDefaults
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(EDUserNotificationMailboxCutoffController *)self mailboxCutoffs];
  [v4 setObject:v3 forKey:@"UserNotificationMailboxCutoffs"];
}

- (NSMutableDictionary)mailboxCutoffs
{
  return self->_mailboxCutoffs;
}

- (void)setMailboxCutoffs:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)updateCutoffForMailboxesWithMessages:(void *)a3 .cold.1(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Message %{public}@ has a nil mailbox identifier", buf, 0xCu);
}

@end