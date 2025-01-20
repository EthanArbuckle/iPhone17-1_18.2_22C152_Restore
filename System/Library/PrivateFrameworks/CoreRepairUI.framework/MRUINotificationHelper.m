@interface MRUINotificationHelper
+ (id)sharedSingleton;
- (MRUINotificationHelper)init;
- (id)_init;
- (void)clearRepairFollowUpForClientID:(id)a3;
- (void)createRepairFollowUpWithNotification:(BOOL)a3 actionURL:(id)a4 repairTitle:(id)a5 infoText:(id)a6 itemID:(id)a7 timeInterval:(double)a8 componentName:(id)a9;
- (void)popUpNotificationNowWithMessage:(id)a3 title:(id)a4 openSensitiveURL:(id)a5 componentName:(id)a6 legacyPopup:(BOOL)a7;
- (void)updateFollowupsToNewLocale;
@end

@implementation MRUINotificationHelper

- (MRUINotificationHelper)init
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(sel_sharedSingleton);
  v9 = NSStringFromSelector(a2);
  [v4 raise:v5, @"Use +[%@ %@] instead of -%@.", v7, v8, v9 format];

  return 0;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)MRUINotificationHelper;
  v2 = [(MRUINotificationHelper *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->delay = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mobilerepaird.notificationq", 0);
    uint64_t v5 = (void *)qword_268A00EF0;
    qword_268A00EF0 = (uint64_t)v4;

    uint64_t v6 = objc_opt_new();
    clientIDtoFollowupItemCache = v3->clientIDtoFollowupItemCache;
    v3->clientIDtoFollowupItemCache = (NSMutableDictionary *)v6;
  }
  return v3;
}

+ (id)sharedSingleton
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23976F9B0;
  block[3] = &unk_264DA01F8;
  block[4] = a1;
  if (qword_268A00F00 != -1) {
    dispatch_once(&qword_268A00F00, block);
  }
  v2 = (void *)qword_268A00EF8;

  return v2;
}

- (void)createRepairFollowUpWithNotification:(BOOL)a3 actionURL:(id)a4 repairTitle:(id)a5 infoText:(id)a6 itemID:(id)a7 timeInterval:(double)a8 componentName:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v20 = qword_268A00EF0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23976FB30;
  block[3] = &unk_264DA0528;
  BOOL v33 = a3;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  id v31 = v19;
  v32 = self;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  dispatch_sync(v20, block);
}

- (void)popUpNotificationNowWithMessage:(id)a3 title:(id)a4 openSensitiveURL:(id)a5 componentName:(id)a6 legacyPopup:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = self;
  objc_sync_enter(v16);
  id v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v18 = [v17 BOOLForKey:@"settingsView"];

  id v19 = sub_239773918(0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v35) = v18;
    _os_log_impl(&dword_239757000, v19, OS_LOG_TYPE_DEFAULT, " value is:%d", buf, 8u);
  }

  if (!v18 || v7)
  {
    char v20 = BYSetupAssistantNeedsToRun();
    while ((v20 & 1) != 0)
    {
      id v21 = (void *)MEMORY[0x23ECA4550]();
      char v20 = BYSetupAssistantNeedsToRun();
      sleep(3u);
    }
    id v22 = sub_239773918(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int delay = v16->delay;
      *(_DWORD *)buf = 138412546;
      id v35 = v13;
      __int16 v36 = 1024;
      int v37 = delay;
      _os_log_impl(&dword_239757000, v22, OS_LOG_TYPE_DEFAULT, "Displaying %@ notification after %d delay", buf, 0x12u);
    }

    dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
    dispatch_time_t v25 = dispatch_time(0, 1000000000 * v16->delay);
    v26 = qword_268A00EF0;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_239770270;
    block[3] = &unk_264DA0550;
    BOOL v33 = v7;
    dispatch_semaphore_t v29 = v24;
    id v30 = v13;
    id v31 = v12;
    id v32 = v14;
    id v27 = v24;
    dispatch_after(v25, v26, block);
    dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
    v16->delay += 5;
  }
  objc_sync_exit(v16);
}

- (void)clearRepairFollowUpForClientID:(id)a3
{
  clientIDtoFollowupItemCache = self->clientIDtoFollowupItemCache;
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)clientIDtoFollowupItemCache objectForKeyedSubscript:v4];
  if (v5)
  {
    id v15 = 0;
    char v6 = [0 clearNotificationForItem:v5 error:&v15];
    id v7 = v15;
    if ((v6 & 1) == 0)
    {
      v8 = sub_239773918(1uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_239776D18(v7);
      }
    }
  }
  else
  {
    id v7 = 0;
  }
  objc_super v9 = (void *)[objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:@"com.apple.mobilerepair"];
  v10 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v4, 0);

  id v14 = v7;
  char v11 = [v9 clearPendingFollowUpItemsWithUniqueIdentifiers:v10 error:&v14];
  id v12 = v14;

  if ((v11 & 1) == 0)
  {
    id v13 = sub_239773918(1uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_239776AC4(v12);
    }
  }
}

- (void)updateFollowupsToNewLocale
{
}

- (void).cxx_destruct
{
}

@end