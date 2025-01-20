@interface DEDFollowUpNotifier
+ (BOOL)supportsSecureCoding;
+ (id)archivedClasses;
+ (void)forceRemoveNotificationWithIdentifier:(id)a3 hostIdentifier:(id)a4;
- (DEDFollowUpNotifier)initWithCoder:(id)a3;
- (DEDFollowUpNotifier)initWithConfiguration:(id)a3 session:(id)a4;
- (DEDNotifierConfiguration)config;
- (FLFollowUpController)followUpController;
- (NSString)bugSessionIdentifier;
- (id)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)presentNotificationForSession:(id)a3;
- (void)removeNotificationForSession:(id)a3;
- (void)setBugSessionIdentifier:(id)a3;
- (void)setConfig:(id)a3;
- (void)setFollowUpController:(id)a3;
@end

@implementation DEDFollowUpNotifier

- (DEDFollowUpNotifier)initWithConfiguration:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DEDFollowUpNotifier;
  v8 = [(DEDFollowUpNotifier *)&v18 init];
  if (v8)
  {
    v9 = [v6 notifierConfiguration];
    objc_storeWeak((id *)&v8->_config, v9);

    uint64_t v10 = [v7 identifier];
    bugSessionIdentifier = v8->_bugSessionIdentifier;
    v8->_bugSessionIdentifier = (NSString *)v10;

    id v12 = objc_alloc(MEMORY[0x263F35380]);
    v13 = [(DEDFollowUpNotifier *)v8 config];
    v14 = [v13 hostAppIdentifier];
    uint64_t v15 = [v12 initWithClientIdentifier:v14];
    followUpController = v8->_followUpController;
    v8->_followUpController = (FLFollowUpController *)v15;
  }
  return v8;
}

- (id)identifier
{
  v2 = [(DEDFollowUpNotifier *)self config];
  v3 = [v2 followupUniqueIdentifier];

  return v3;
}

- (void)presentNotificationForSession:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(DEDFollowUpNotifier *)self identifier];
  v5 = Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(DEDFollowUpNotifier *)self bugSessionIdentifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v70 = v4;
    __int16 v71 = 2114;
    v72 = v6;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "Scheduling followup notification: %{public}@ for session [%{public}@]", buf, 0x16u);
  }
  id v7 = objc_opt_new();
  v66 = (void *)v4;
  [v7 setUniqueIdentifier:v4];
  v8 = [(DEDFollowUpNotifier *)self config];
  v9 = [v8 followupLocalizedTitle];
  [v7 setTitle:v9];

  uint64_t v10 = [(DEDFollowUpNotifier *)self config];
  v11 = [v10 followupLocalizedInformativeText];
  [v7 setInformativeText:v11];

  [v7 setDisplayStyle:1];
  id v12 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  v13 = [(DEDFollowUpNotifier *)self config];
  v14 = [v13 reviewActionLabel];

  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x263F35378];
    v16 = [(DEDFollowUpNotifier *)self config];
    v17 = [v16 reviewActionLabel];
    objc_super v18 = [(DEDFollowUpNotifier *)self config];
    v19 = [v18 followupReviewActionURL];
    v20 = [v15 actionWithLabel:v17 url:v19];

    v21 = [(DEDFollowUpNotifier *)self config];
    v22 = [v21 followupReviewActionUserInfo];

    if (v22)
    {
      v23 = [(DEDFollowUpNotifier *)self config];
      v24 = [v23 followupReviewActionUserInfo];
      [v20 setUserInfo:v24];
    }
    [v12 addObject:v20];
  }
  v25 = [(DEDFollowUpNotifier *)self config];
  v26 = [v25 sendActionLabel];

  if (v26)
  {
    v27 = (void *)MEMORY[0x263F35378];
    v28 = [(DEDFollowUpNotifier *)self config];
    v29 = [v28 sendActionLabel];
    v30 = [(DEDFollowUpNotifier *)self config];
    v31 = [v30 followupSendActionURL];
    v32 = [v27 actionWithLabel:v29 url:v31];

    v33 = [(DEDFollowUpNotifier *)self config];
    v34 = [v33 followupSendActionUserInfo];

    if (v34)
    {
      v35 = [(DEDFollowUpNotifier *)self config];
      v36 = [v35 followupSendActionUserInfo];
      [v32 setUserInfo:v36];
    }
    [v12 addObject:v32];
  }
  [v7 setActions:v12];
  v37 = [(DEDFollowUpNotifier *)self config];
  v38 = [v37 followupExtensionIdentifier];

  if (v38)
  {
    v39 = [(DEDFollowUpNotifier *)self config];
    v40 = [v39 followupExtensionIdentifier];
    [v7 setExtensionIdentifier:v40];
  }
  v41 = objc_opt_new();
  v42 = [(DEDFollowUpNotifier *)self config];
  v43 = [v42 localizedNotificationTitle];
  [v41 setTitle:v43];

  v44 = [(DEDFollowUpNotifier *)self config];
  v45 = [v44 localizedNotificationBody];
  [v41 setInformativeText:v45];

  v46 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithObjects:", *MEMORY[0x263F35320], *MEMORY[0x263F35328], 0);
  v47 = [(DEDFollowUpNotifier *)self config];
  int v48 = [v47 followupUseSpringboardNotification];

  if (v48) {
    [v46 addObject:*MEMORY[0x263F35330]];
  }
  v49 = [(DEDFollowUpNotifier *)self config];
  uint64_t v50 = [v49 followupNotificationActionURL];
  if (!v50) {
    goto LABEL_18;
  }
  v51 = (void *)v50;
  v52 = [(DEDFollowUpNotifier *)self config];
  v53 = [v52 followupNotificationActionTitle];

  if (v53)
  {
    v54 = (void *)MEMORY[0x263F35378];
    v49 = [(DEDFollowUpNotifier *)self config];
    v55 = [v49 followupNotificationActionTitle];
    v56 = [(DEDFollowUpNotifier *)self config];
    v57 = [v56 followupNotificationActionURL];
    v58 = [v54 actionWithLabel:v55 url:v57];
    [v41 setActivateAction:v58];

LABEL_18:
  }
  [v41 setOptions:v46];
  v59 = [(DEDFollowUpNotifier *)self config];
  [v59 followupFrequency];
  objc_msgSend(v41, "setFrequency:");

  [v41 setFirstNotificationDelay:0.0];
  v60 = [(DEDFollowUpNotifier *)self config];
  v61 = [v60 followupNotificationBundlePath];
  [v7 setRepresentingBundlePath:v61];

  v62 = [(DEDFollowUpNotifier *)self config];
  v63 = [v62 followupNotificationBundleIconName];
  [v7 setBundleIconName:v63];

  [v7 setNotification:v41];
  v64 = [(DEDFollowUpNotifier *)self followUpController];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __53__DEDFollowUpNotifier_presentNotificationForSession___block_invoke;
  v67[3] = &unk_26453A9A0;
  id v68 = v66;
  id v65 = v66;
  [v64 postFollowUpItem:v7 completion:v67];
}

void __53__DEDFollowUpNotifier_presentNotificationForSession___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id v6 = Log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v16 = 138543362;
      uint64_t v17 = v7;
      _os_log_impl(&dword_21FE04000, v6, OS_LOG_TYPE_DEFAULT, "Followup item posted: %{public}@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    id v6 = Log();
    BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v8) {
        __53__DEDFollowUpNotifier_presentNotificationForSession___block_invoke_cold_2(v5, v6);
      }
    }
    else if (v8)
    {
      __53__DEDFollowUpNotifier_presentNotificationForSession___block_invoke_cold_1(v6, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)removeNotificationForSession:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(DEDFollowUpNotifier *)self identifier];
  id v5 = Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(DEDFollowUpNotifier *)self bugSessionIdentifier];
    *(_DWORD *)buf = 138543618;
    v21 = v4;
    __int16 v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling followup notification: %{public}@ for bug session [%{public}@]", buf, 0x16u);
  }
  uint64_t v7 = [(DEDFollowUpNotifier *)self followUpController];
  v19 = v4;
  BOOL v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
  id v18 = 0;
  [v7 clearPendingFollowUpItemsWithUniqueIdentifiers:v8 error:&v18];
  id v9 = v18;

  if (v9)
  {
    uint64_t v10 = Log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DEDFollowUpNotifier removeNotificationForSession:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

+ (id)archivedClasses
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDFollowUpNotifier *)self config];
  [v4 encodeObject:v5 forKey:@"config"];

  id v6 = [(DEDFollowUpNotifier *)self bugSessionIdentifier];
  [v4 encodeObject:v6 forKey:@"bugSessionIdentifier"];
}

- (DEDFollowUpNotifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DEDFollowUpNotifier;
  id v5 = [(DEDFollowUpNotifier *)&v15 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"config"];
    objc_storeWeak((id *)&v5->_config, v6);

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bugSessionIdentifier"];
    bugSessionIdentifier = v5->_bugSessionIdentifier;
    v5->_bugSessionIdentifier = (NSString *)v7;

    id v9 = objc_alloc(MEMORY[0x263F35380]);
    uint64_t v10 = [(DEDFollowUpNotifier *)v5 config];
    uint64_t v11 = [v10 hostAppIdentifier];
    uint64_t v12 = [v9 initWithClientIdentifier:v11];
    followUpController = v5->_followUpController;
    v5->_followUpController = (FLFollowUpController *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)forceRemoveNotificationWithIdentifier:(id)a3 hostIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = Log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v23 = v5;
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_impl(&dword_21FE04000, v7, OS_LOG_TYPE_DEFAULT, "Will force remove notification with identifier [%{public}@] for app [%{public}@]", buf, 0x16u);
  }

  BOOL v8 = (void *)[objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:v6];
  id v21 = v5;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  id v20 = 0;
  [v8 clearPendingFollowUpItemsWithUniqueIdentifiers:v9 error:&v20];
  id v10 = v20;

  uint64_t v11 = Log();
  uint64_t v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[DEDFollowUpNotifier removeNotificationForSession:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v23 = v5;
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "Removed notification with identifier [%{public}@] for app [%{public}@]", buf, 0x16u);
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

- (FLFollowUpController)followUpController
{
  return (FLFollowUpController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFollowUpController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_bugSessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_config);
}

void __53__DEDFollowUpNotifier_presentNotificationForSession___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __53__DEDFollowUpNotifier_presentNotificationForSession___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 description];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "Followup item was not posted.\n[error info] %{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)removeNotificationForSession:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end