@interface AAQuotaDepletionAlert
+ (BOOL)_isDisabledDataclass:(id)a3;
- (AAQuotaDepletionAlert)init;
- (BOOL)showIfNecessaryWithHandler:(id)a3;
- (id)_deviceSpecificLocalizedString:(id)a3;
- (id)_primaryAccount;
- (id)initForDataclass:(id)a3;
- (void)showWithHandler:(id)a3;
@end

@implementation AAQuotaDepletionAlert

- (AAQuotaDepletionAlert)init
{
  v3.receiver = self;
  v3.super_class = (Class)AAQuotaDepletionAlert;
  return [(AAQuotaDepletionAlert *)&v3 init];
}

- (id)initForDataclass:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAQuotaDepletionAlert;
  v6 = [(AAQuotaDepletionAlert *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataclass, a3);
  }

  return v7;
}

+ (BOOL)_isDisabledDataclass:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F17AD8];
  v9[0] = *MEMORY[0x1E4F17B38];
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v6 = v5;
  if (v3) {
    char v7 = [v5 containsObject:v3];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)_primaryAccount
{
  if (!self->_primaryAccount)
  {
    id v3 = [MEMORY[0x1E4F179C8] defaultStore];
    accountStore = self->_accountStore;
    self->_accountStore = v3;

    id v5 = self->_accountStore;
    if (v5)
    {
      v6 = [(ACAccountStore *)v5 aa_primaryAppleAccount];
      primaryAccount = self->_primaryAccount;
      self->_primaryAccount = v6;
    }
  }
  v8 = self->_primaryAccount;

  return v8;
}

- (void)showWithHandler:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  if (+[AAQuotaDepletionAlert _isDisabledDataclass:self->_dataclass])
  {
    id v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      dataclass = self->_dataclass;
      *(_DWORD *)buf = 138412290;
      v33 = dataclass;
      _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Quota ran out for dataclass: %@. Skipping notifying user.", buf, 0xCu);
    }

    if (v4) {
      v4[2](v4, 3);
    }
  }
  else
  {
    char v7 = [(AAQuotaDepletionAlert *)self _primaryAccount];
    if (v7)
    {
      v8 = [(AAQuotaDepletionAlert *)self _primaryAccount];
      int v9 = objc_msgSend(v8, "aa_isManagedAppleID") ^ 1;
    }
    else
    {
      int v9 = 0;
    }

    v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_dataclass;
      *(_DWORD *)buf = 138412546;
      v33 = v11;
      __int16 v34 = 1024;
      int v35 = v9;
      _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Quota ran out for dataclass: %@. Notify user. Upgrade Available: %d", buf, 0x12u);
    }

    v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v13 = v12;
    if (v9) {
      v14 = @"QUOTA_ALERT_UPGRADE_BUTTON";
    }
    else {
      v14 = @"QUOTA_ALERT_MANAGE_BUTTON";
    }
    v15 = [v12 localizedStringForKey:v14 value:&stru_1EF456870 table:@"Localizable"];

    BOOL v16 = [(NSString *)self->_dataclass isEqualToString:*MEMORY[0x1E4F17A68]];
    v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v18 = v17;
    if (v16)
    {
      v19 = [v17 localizedStringForKey:@"QUOTA_ALERT_BACKUP_TITLE" value:&stru_1EF456870 table:@"Localizable"];

      v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v21 = [(AAQuotaDepletionAlert *)self _deviceSpecificLocalizedString:@"QUOTA_ALERT_BACKUP_MESSAGE"];
      v22 = [v20 localizedStringForKey:v21 value:&stru_1EF456870 table:@"Localizable"];
    }
    else
    {
      v19 = [v17 localizedStringForKey:@"QUOTA_ALERT_TITLE" value:&stru_1EF456870 table:@"Localizable"];

      v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v22 = [v20 localizedStringForKey:@"QUOTA_ALERT_MESSAGE" value:&stru_1EF456870 table:@"Localizable"];
    }

    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __41__AAQuotaDepletionAlert_showWithHandler___block_invoke;
    v29 = &unk_1E5A4A9D8;
    char v31 = v9;
    v30 = v4;
    v23 = (void *)MEMORY[0x1A622F430](&v26);
    v24 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class(), v26, v27, v28, v29);
    v25 = [v24 localizedStringForKey:@"ALERT_CLOSE" value:&stru_1EF456870 table:@"Localizable"];
    +[AAUserNotification showUserNotificationWithTitle:v19 message:v22 cancelButtonTitle:v25 otherButtonTitle:v15 withCompletionBlock:v23];
  }
}

uint64_t __41__AAQuotaDepletionAlert_showWithHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    if (*(unsigned char *)(a1 + 40)) {
      id v5 = @"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP/CHANGE_STORAGE_PLAN";
    }
    else {
      id v5 = @"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP";
    }
    v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
    char v7 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__AAQuotaDepletionAlert_showWithHandler___block_invoke_2;
    block[3] = &unk_1E5A48358;
    id v11 = v6;
    id v8 = v6;
    dispatch_async(v7, block);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

void __41__AAQuotaDepletionAlert_showWithHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openSensitiveURL:*(void *)(a1 + 32) withOptions:0];
}

- (BOOL)showIfNecessaryWithHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[AAQuotaDepletionAlert _isDisabledDataclass:self->_dataclass];
  v6 = _AALogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      dataclass = self->_dataclass;
      int v16 = 138412290;
      v17 = dataclass;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Quota ran out for dataclass: %@. Skipping notifying user.", (uint8_t *)&v16, 0xCu);
    }
LABEL_9:
    BOOL v14 = 0;
    goto LABEL_10;
  }
  if (v7)
  {
    int v9 = self->_dataclass;
    int v16 = 138412290;
    v17 = v9;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Quota ran out for dataclass: %@. Notify user.", (uint8_t *)&v16, 0xCu);
  }

  v6 = CFPreferencesCopyAppValue(@"AANextCastleQuotaAlert", @"com.apple.appleaccount");
  if (v6)
  {
    v10 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v11 = [v10 compare:v6];

    if (v11 != 1) {
      goto LABEL_9;
    }
  }
  v12 = [MEMORY[0x1E4F1C9C8] date];
  v13 = [v12 dateByAddingTimeInterval:86400.0];

  CFPreferencesSetAppValue(@"AANextCastleQuotaAlert", v13, @"com.apple.appleaccount");
  CFPreferencesSynchronize(@"com.apple.appleaccount", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  [(AAQuotaDepletionAlert *)self showWithHandler:v4];

  BOOL v14 = 1;
LABEL_10:

  return v14;
}

- (id)_deviceSpecificLocalizedString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = MGCopyAnswer();
  if (v4) {
    BOOL v5 = (__CFString *)v4;
  }
  else {
    BOOL v5 = @"iPhone";
  }
  v6 = [(__CFString *)v5 uppercaseString];
  BOOL v7 = [v6 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

  id v8 = [NSString stringWithFormat:@"%@_%@", v3, v7];

  int v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:v8 value:&stru_1EF456870 table:@"Localizable"];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);

  objc_storeStrong((id *)&self->_dataclass, 0);
}

@end