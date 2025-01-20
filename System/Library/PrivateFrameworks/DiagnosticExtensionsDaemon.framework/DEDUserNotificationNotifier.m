@interface DEDUserNotificationNotifier
+ (BOOL)supportsSecureCoding;
+ (id)archivedClasses;
+ (void)forceRemoveNotificationWithIdentifier:(id)a3 hostIdentifier:(id)a4;
- (DEDNotifierConfiguration)config;
- (DEDUserNotificationNotifier)initWithCoder:(id)a3;
- (DEDUserNotificationNotifier)initWithConfiguration:(id)a3 session:(id)a4;
- (NSString)bugSessionIdentifier;
- (OS_os_log)log;
- (UNUserNotificationCenter)center;
- (id)createNotificationCenter;
- (void)encodeWithCoder:(id)a3;
- (void)presentNotificationForSession:(id)a3;
- (void)removeNotificationForSession:(id)a3;
- (void)setBugSessionIdentifier:(id)a3;
- (void)setCenter:(id)a3;
- (void)setConfig:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation DEDUserNotificationNotifier

- (DEDUserNotificationNotifier)initWithConfiguration:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DEDUserNotificationNotifier;
  v8 = [(DEDUserNotificationNotifier *)&v15 init];
  if (v8)
  {
    v9 = [v6 notifierConfiguration];
    objc_storeWeak((id *)&v8->_config, v9);

    uint64_t v10 = [v7 identifier];
    bugSessionIdentifier = v8->_bugSessionIdentifier;
    v8->_bugSessionIdentifier = (NSString *)v10;

    uint64_t v12 = [(DEDUserNotificationNotifier *)v8 createNotificationCenter];
    center = v8->_center;
    v8->_center = (UNUserNotificationCenter *)v12;
  }
  return v8;
}

- (id)createNotificationCenter
{
  id v3 = objc_alloc(MEMORY[0x263F1DFB0]);
  v4 = [(DEDUserNotificationNotifier *)self config];
  v5 = [v4 hostAppIdentifier];
  id v6 = (void *)[v3 initWithBundleIdentifier:v5];

  id v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
  v8 = [(DEDUserNotificationNotifier *)self config];
  v9 = [v8 reviewActionLabel];

  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x263F1DF10];
    v11 = [(DEDUserNotificationNotifier *)self config];
    uint64_t v12 = [v11 reviewActionLabel];
    v13 = [v10 actionWithIdentifier:@"com.apple.diagnosticextensionsd.notifier.review" title:v12 options:4];

    [v7 addObject:v13];
  }
  v14 = [(DEDUserNotificationNotifier *)self config];
  objc_super v15 = [v14 sendActionLabel];

  if (v15)
  {
    v16 = (void *)MEMORY[0x263F1DF10];
    v17 = [(DEDUserNotificationNotifier *)self config];
    v18 = [v17 sendActionLabel];
    v19 = [v16 actionWithIdentifier:@"com.apple.diagnosticextensionsd.notifier.send" title:v18 options:1];

    [v7 addObject:v19];
  }
  v20 = [MEMORY[0x263F1DF28] categoryWithIdentifier:@"com.apple.diagnosticextensionsd.notifier" actions:v7 intentIdentifiers:MEMORY[0x263EFFA68] options:4];
  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __55__DEDUserNotificationNotifier_createNotificationCenter__block_invoke;
  v23[3] = &unk_26453BA68;
  objc_copyWeak(&v25, &location);
  id v21 = v20;
  id v24 = v21;
  [v6 getNotificationCategoriesWithCompletionHandler:v23];
  [v6 requestAuthorizationWithOptions:7 completionHandler:&__block_literal_global_28];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v6;
}

void __55__DEDUserNotificationNotifier_createNotificationCenter__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [WeakRetained center];
  id v6 = [v4 setByAddingObject:*(void *)(a1 + 32)];

  [v5 setNotificationCategories:v6];
}

void __55__DEDUserNotificationNotifier_createNotificationCenter__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    v5 = Log_6();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __55__DEDUserNotificationNotifier_createNotificationCenter__block_invoke_2_cold_1(v4, v5);
    }
  }
  else
  {
    if (a2) {
      goto LABEL_5;
    }
    v5 = Log_6();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "The user denied notification privileges.", v6, 2u);
    }
  }

LABEL_5:
}

- (void)presentNotificationForSession:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = [(DEDUserNotificationNotifier *)self identifier];
  v5 = Log_6();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(DEDUserNotificationNotifier *)self bugSessionIdentifier];
    *(_DWORD *)buf = 138543618;
    v20 = v4;
    __int16 v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "Scheduling user notification: %{public}@ for bug session [%{public}@]", buf, 0x16u);
  }
  id v7 = objc_opt_new();
  v8 = [(DEDUserNotificationNotifier *)self config];
  v9 = [v8 localizedNotificationTitle];
  [v7 setTitle:v9];

  uint64_t v10 = [(DEDUserNotificationNotifier *)self config];
  v11 = [v10 localizedNotificationBody];
  [v7 setBody:v11];

  uint64_t v12 = [(DEDUserNotificationNotifier *)self config];
  LODWORD(v11) = [v12 userNotificationShouldPlaySound];

  if (v11)
  {
    v13 = [MEMORY[0x263F1DF68] defaultSound];
    [v7 setSound:v13];
  }
  [v7 setCategoryIdentifier:@"com.apple.diagnosticextensionsd.notifier"];
  v14 = [MEMORY[0x263F1DF48] requestWithIdentifier:v4 content:v7 trigger:0];
  objc_super v15 = [(DEDUserNotificationNotifier *)self center];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __61__DEDUserNotificationNotifier_presentNotificationForSession___block_invoke;
  v17[3] = &unk_26453B2D8;
  id v18 = v4;
  id v16 = v4;
  [v15 addNotificationRequest:v14 withCompletionHandler:v17];
}

void __61__DEDUserNotificationNotifier_presentNotificationForSession___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = Log_6();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__DEDUserNotificationNotifier_presentNotificationForSession___block_invoke_cold_1(a1, v3, v4);
    }
  }
}

- (void)removeNotificationForSession:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = [(DEDUserNotificationNotifier *)self identifier];
  v5 = Log_6();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(DEDUserNotificationNotifier *)self bugSessionIdentifier];
    *(_DWORD *)buf = 138543618;
    v14 = v4;
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling user notification: %{public}@ for bug session [%{public}@]", buf, 0x16u);
  }
  id v7 = [(DEDUserNotificationNotifier *)self center];
  uint64_t v12 = v4;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
  [v7 removeDeliveredNotificationsWithIdentifiers:v8];

  v9 = [(DEDUserNotificationNotifier *)self center];
  v11 = v4;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  [v9 removePendingNotificationRequestsWithIdentifiers:v10];
}

+ (id)archivedClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEDUserNotificationNotifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DEDUserNotificationNotifier;
  v5 = [(DEDUserNotificationNotifier *)&v12 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"config"];
    objc_storeWeak((id *)&v5->_config, v6);

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bugSessionIdentifier"];
    bugSessionIdentifier = v5->_bugSessionIdentifier;
    v5->_bugSessionIdentifier = (NSString *)v7;

    uint64_t v9 = [(DEDUserNotificationNotifier *)v5 createNotificationCenter];
    center = v5->_center;
    v5->_center = (UNUserNotificationCenter *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DEDUserNotificationNotifier *)self config];
  [v4 encodeObject:v5 forKey:@"config"];

  id v6 = [(DEDUserNotificationNotifier *)self bugSessionIdentifier];
  [v4 encodeObject:v6 forKey:@"bugSessionIdentifier"];
}

+ (void)forceRemoveNotificationWithIdentifier:(id)a3 hostIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = Log_6();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v5;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl(&dword_21FE04000, v7, OS_LOG_TYPE_DEFAULT, "Will force remove notification with identifier [%{public}@] for app [%{public}@]", buf, 0x16u);
  }

  v8 = (void *)[objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:v6];
  id v13 = v5;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  [v8 removeDeliveredNotificationsWithIdentifiers:v9];

  id v12 = v5;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
  [v8 removePendingNotificationRequestsWithIdentifiers:v10];

  v11 = Log_6();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v5;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEFAULT, "Removed notification with identifier [%{public}@] for app [%{public}@]", buf, 0x16u);
  }
}

- (DEDNotifierConfiguration)config
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_config);
  return (DEDNotifierConfiguration *)WeakRetained;
}

- (void)setConfig:(id)a3
{
}

- (NSString)bugSessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBugSessionIdentifier:(id)a3
{
}

- (UNUserNotificationCenter)center
{
  return (UNUserNotificationCenter *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCenter:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_bugSessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_config);
}

void __55__DEDUserNotificationNotifier_createNotificationCenter__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "Error requesting authorization\nPlease make sure you read instructions in DEDUserNotificationNotifier.h\n[error info] %{public}@", (uint8_t *)&v4, 0xCu);
}

void __61__DEDUserNotificationNotifier_presentNotificationForSession___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [a2 description];
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_21FE04000, a3, OS_LOG_TYPE_ERROR, "Error scheduling notification: %{public}@\nError info: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end