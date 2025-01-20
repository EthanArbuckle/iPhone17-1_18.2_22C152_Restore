@interface EDTruncateMailboxUpgradeStep
+ (OS_os_log)log;
+ (int)runWithConnection:(id)a3;
+ (int64_t)countOver10kWithConnection:(id)a3;
+ (void)presentNeedlessAlertIfNecessaryWithPersistence:(id)a3;
@end

@implementation EDTruncateMailboxUpgradeStep

+ (void)presentNeedlessAlertIfNecessaryWithPersistence:(id)a3
{
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __79__EDTruncateMailboxUpgradeStep_presentNeedlessAlertIfNecessaryWithPersistence___block_invoke;
    v5[3] = &unk_1E6BFFA50;
    id v6 = v4;
    id v7 = a1;
    if (presentNeedlessAlertIfNecessaryWithPersistence__onceToken != -1) {
      dispatch_once(&presentNeedlessAlertIfNecessaryWithPersistence__onceToken, v5);
    }
  }
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__EDTruncateMailboxUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_97 != -1) {
    dispatch_once(&log_onceToken_97, block);
  }
  v2 = (void *)log_log_97;

  return (OS_os_log *)v2;
}

void __35__EDTruncateMailboxUpgradeStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_97;
  log_log_97 = (uint64_t)v1;
}

+ (int)runWithConnection:(id)a3
{
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0 || (uint64_t v5 = [a1 countOver10kWithConnection:v4], v5 < 1))
  {
    int v8 = 0;
  }
  else
  {
    id v6 = +[EDTruncateMailboxUpgradeStep log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[EDTruncateMailboxUpgradeStep runWithConnection:](v6);
    }

    id v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    [v7 setInteger:v5 forKey:@"_TruncateMailboxUpgradeStepOver10kCount"];

    int v8 = 1;
  }

  return v8;
}

+ (int64_t)countOver10kWithConnection:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v5 = [v3 preparedStatementForQueryString:@"SELECT url, count() FROM messages m JOIN mailboxes mb ON (m.mailbox = mb.rowid) GROUP BY url"];;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__EDTruncateMailboxUpgradeStep_countOver10kWithConnection___block_invoke;
  v16[3] = &unk_1E6BFF208;
  v18 = &v19;
  id v6 = v4;
  id v17 = v6;
  id v15 = 0;
  int v7 = [v5 executeUsingBlock:v16 error:&v15];
  id v8 = v15;

  if (v7)
  {
    v9 = +[EDTruncateMailboxUpgradeStep log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v20[3];
      *(_DWORD *)buf = 134218242;
      uint64_t v24 = v10;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Message counts over 10k: %lld, counts: %{public}@", buf, 0x16u);
    }

    int64_t v11 = v20[3];
  }
  else
  {
    v12 = +[EDTruncateMailboxUpgradeStep log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(v8, "ef_publicDescription");
      +[EDTruncateMailboxUpgradeStep countOver10kWithConnection:v12];
    }

    int64_t v11 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __59__EDTruncateMailboxUpgradeStep_countOver10kWithConnection___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 objectAtIndexedSubscript:0];
  id v4 = [v3 stringValue];

  if ([v4 hasPrefix:@"imap://"])
  {
    uint64_t v5 = [v7 objectAtIndexedSubscript:1];
    id v6 = [v5 numberValue];

    if ([v6 integerValue] >= 10501) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v6 integerValue];
    }
    [*(id *)(a1 + 32) addObject:v6];
  }
}

void __79__EDTruncateMailboxUpgradeStep_presentNeedlessAlertIfNecessaryWithPersistence___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v3 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__EDTruncateMailboxUpgradeStep_presentNeedlessAlertIfNecessaryWithPersistence___block_invoke_2;
  v8[3] = &unk_1E6C00900;
  id v4 = v2;
  id v9 = v4;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = (id)[v3 afterDelay:v8 performBlock:5.0];
}

void __79__EDTruncateMailboxUpgradeStep_presentNeedlessAlertIfNecessaryWithPersistence___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) integerForKey:@"_TruncateMailboxUpgradeStepOver10kCount"];
  [*(id *)(a1 + 32) removeObjectForKey:@"_TruncateMailboxUpgradeStepOver10kCount"];
  if (v2 >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    id v3 = [*(id *)(a1 + 40) database];
    id v4 = [NSString stringWithUTF8String:"+[EDTruncateMailboxUpgradeStep presentNeedlessAlertIfNecessaryWithPersistence:]_block_invoke_2"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __79__EDTruncateMailboxUpgradeStep_presentNeedlessAlertIfNecessaryWithPersistence___block_invoke_3;
    v9[3] = &unk_1E6BFFE38;
    uint64_t v5 = *(void *)(a1 + 48);
    v9[4] = &v10;
    v9[5] = v5;
    objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v9);

    if (v11[3] > 0
      || [*(id *)(a1 + 32) BOOLForKey:@"_TruncateMailboxUpgradeStepForceAlert"])
    {
      [*(id *)(a1 + 32) removeObjectForKey:@"_TruncateMailboxUpgradeStepForceAlert"];
      _EFLocalizedString();
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      _EFLocalizedString();
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      _EFLocalizedString();
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFUserNotificationDisplayNotice(30.0, 3uLL, 0, 0, 0, v6, v7, v8);
    }
    _Block_object_dispose(&v10, 8);
  }
}

uint64_t __79__EDTruncateMailboxUpgradeStep_presentNeedlessAlertIfNecessaryWithPersistence___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [*(id *)(a1 + 40) countOver10kWithConnection:v3];

  return 1;
}

+ (void)runWithConnection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Wiping message DB", v1, 2u);
}

+ (void)countOver10kWithConnection:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "failed to query for counts by mailbox: %{public}@", buf, 0xCu);
}

@end