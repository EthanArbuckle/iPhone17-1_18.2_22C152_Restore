@interface INAccountNotificationPlugin
- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
- (void)notifyCloudSubscriptionFeatures;
@end

@implementation INAccountNotificationPlugin

- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  switch(a4)
  {
    case 1:
      v19 = _INLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v10;
        _os_log_impl(&dword_2405B5000, v19, OS_LOG_TYPE_DEFAULT, "iCloud account %@ will be added! Will notify ind...", buf, 0xCu);
      }

      [(INAccountNotificationPlugin *)self notifyCloudSubscriptionFeatures];
      BOOL v18 = 0;
      uint64_t v20 = 1;
      break;
    case 2:
      v21 = [v10 dirtyProperties];
      int v22 = [v21 containsObject:*MEMORY[0x263EFB148]];

      v23 = _INLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = @"NO";
        if (v22) {
          v24 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        id v38 = v10;
        __int16 v39 = 2112;
        v40 = v24;
        _os_log_impl(&dword_2405B5000, v23, OS_LOG_TYPE_DEFAULT, "iCloud account %@ will be modifed! enabled dataclasses changed %@", buf, 0x16u);
      }

      id v15 = [v10 accountPropertyForKey:@"iCloudNotificationLastRegisterDate"];
      if (v15)
      {
        v25 = [MEMORY[0x263EFF910] date];
        [v25 timeIntervalSinceDate:v15];
        double v27 = v26;

        int v28 = v27 > 86400.0 ? 1 : v22;
        if (v28 != 1)
        {
          BOOL v18 = 0;
          goto LABEL_24;
        }
      }
      v29 = _INLogSystem();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v10;
        _os_log_impl(&dword_2405B5000, v29, OS_LOG_TYPE_DEFAULT, "iCloud account %@ will change, and it has been 24 hours! Will notify ind...", buf, 0xCu);
      }

      v30 = [MEMORY[0x263EFF910] date];
      [v10 setAccountProperty:v30 forKey:@"iCloudNotificationLastRegisterDate"];

      BOOL v18 = 1;
      uint64_t v20 = 3;
      break;
    case 3:
      v13 = _INLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v12;
        _os_log_impl(&dword_2405B5000, v13, OS_LOG_TYPE_DEFAULT, "iCloud account %@ is going away! Will notify ind...", buf, 0xCu);
      }

      v14 = (void *)os_transaction_create();
      id v15 = objc_alloc_init(MEMORY[0x263F887B8]);
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = nullsub_1;
      v35[3] = &unk_2650C46C0;
      v16 = &v36;
      v36 = v14;
      id v17 = v14;
      [v15 unregisterAccount:v12 fromiCloudNotificationsWithCompletion:v35];
      BOOL v18 = 0;
      goto LABEL_23;
    default:
      BOOL v18 = 0;
      goto LABEL_26;
  }
  v31 = (void *)os_transaction_create();
  id v15 = objc_alloc_init(MEMORY[0x263F887B8]);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = nullsub_2;
  v33[3] = &unk_2650C46C0;
  v16 = &v34;
  v34 = v31;
  id v17 = v31;
  [v15 registerAccount:v10 foriCloudNotificationsWithReason:v20 completion:v33];
LABEL_23:

LABEL_24:
LABEL_26:

  return v18;
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v8 = a6;
  if (a4 == 3)
  {
    v9 = _INLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl(&dword_2405B5000, v9, OS_LOG_TYPE_DEFAULT, "iCloud account %@ was removed! Will notify ind", (uint8_t *)&v11, 0xCu);
    }

    [(INAccountNotificationPlugin *)self notifyCloudSubscriptionFeatures];
    id v10 = objc_alloc_init(MEMORY[0x263F887B8]);
    [v10 teardownOffersForAccount:v8 withCompletion:&unk_26F4B1C60];
  }
}

- (void)notifyCloudSubscriptionFeatures
{
}

@end