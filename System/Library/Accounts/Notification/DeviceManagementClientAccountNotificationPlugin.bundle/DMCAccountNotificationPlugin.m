@interface DMCAccountNotificationPlugin
- (void)_logAccountModification:(id)a3 changeType:(int)a4 accountStore:(id)a5;
- (void)_managedAppleAccount:(id)a3 modifiedFromOldAccount:(id)a4 inStore:(id)a5;
- (void)_postNotification:(id)a3;
- (void)_updateUsernameOfRMAccountWithAppleAccount:(id)a3 inStore:(id)a4;
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation DMCAccountNotificationPlugin

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v20 = a3;
  id v10 = a5;
  id v11 = a6;
  if (a4 == 1)
  {
    v17 = self;
    id v18 = v20;
    uint64_t v19 = 1;
LABEL_10:
    [(DMCAccountNotificationPlugin *)v17 _logAccountModification:v18 changeType:v19 accountStore:v10];
    goto LABEL_11;
  }
  if (a4 == 3)
  {
    v17 = self;
    id v18 = v11;
    uint64_t v19 = 3;
    goto LABEL_10;
  }
  if (a4 == 2
    && (+[DMCMultiUserModeUtilities inSharediPadUserSession] & 1) == 0)
  {
    id v12 = v20;
    v13 = [v12 accountType];
    v14 = [v13 identifier];
    unsigned __int8 v15 = [v14 isEqualToString:ACAccountTypeIdentifierAppleAccount];

    if (v15)
    {
      v16 = objc_msgSend(v12, "dmc_remoteManagingAccountIdentifier");

      if (v16) {
        [(DMCAccountNotificationPlugin *)self _managedAppleAccount:v12 modifiedFromOldAccount:v11 inStore:v10];
      }
    }
    else
    {
    }
  }
LABEL_11:
}

- (void)_logAccountModification:(id)a3 changeType:(int)a4 accountStore:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [v7 accountType];
  id v10 = [v9 identifier];
  unsigned __int8 v11 = [v10 isEqualToString:ACAccountTypeIdentifierRemoteManagement];

  if (v11) {
    goto LABEL_4;
  }
  id v12 = v7;
  v13 = [v12 accountType];
  v14 = [v13 identifier];
  unsigned __int8 v15 = [v14 isEqualToString:ACAccountTypeIdentifierAppleAccount];

  if ((v15 & 1) == 0)
  {

    goto LABEL_14;
  }
  v16 = objc_msgSend(v12, "dmc_remoteManagingAccountIdentifier");

  if (v16)
  {
LABEL_4:
    v17 = [v7 accountType];
    uint64_t v18 = [v17 identifier];
    uint64_t v19 = (void *)v18;
    CFStringRef v20 = @"deleted";
    if (a4 == 1) {
      CFStringRef v20 = @"added";
    }
    v34 = +[NSString stringWithFormat:@"%@ account %@", v18, v20];

    v21 = objc_opt_new();
    uint64_t v22 = DMCEventsTopicAccounts;
    v35[0] = @"Account Identifier";
    uint64_t v23 = [v7 identifier];
    v24 = (void *)v23;
    if (v23) {
      CFStringRef v25 = (const __CFString *)v23;
    }
    else {
      CFStringRef v25 = &stru_41D8;
    }
    v36[0] = v25;
    v35[1] = @"Type";
    v26 = [v7 accountType];
    uint64_t v27 = [v26 identifier];
    v28 = (void *)v27;
    if (v27) {
      CFStringRef v29 = (const __CFString *)v27;
    }
    else {
      CFStringRef v29 = &stru_41D8;
    }
    v36[1] = v29;
    v35[2] = @"Total RM Account #";
    objc_msgSend(v8, "dmc_RemoteManagementAccounts");
    v31 = id v30 = v8;
    v32 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v31 count]);
    v36[2] = v32;
    v33 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];
    [v21 logRegularEventForTopic:v22 reason:v34 details:v33];

    id v8 = v30;
  }
LABEL_14:
}

- (void)_managedAppleAccount:(id)a3 modifiedFromOldAccount:(id)a4 inStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = objc_msgSend(v8, "dmc_mdmServerToken");
  id v12 = objc_msgSend(v9, "dmc_mdmServerToken");
  unsigned __int8 v13 = [v11 isEqualToString:v12];

  if (v13)
  {
    v14 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "DMC account plugin not posting notification because no relevant properties changed.", buf, 2u);
    }
  }
  else
  {
    [(DMCAccountNotificationPlugin *)self _postNotification:MDMManagedAppleAccountLongLivedTokenChangedNotification];
  }
  unsigned __int8 v15 = [v8 username];
  v16 = [v9 username];
  unsigned __int8 v17 = [v15 isEqualToString:v16];

  if ((v17 & 1) == 0)
  {
    uint64_t v18 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "DMCAccountNotificationPlugin: username of AppleAccount has changed.", v19, 2u);
    }
    [(DMCAccountNotificationPlugin *)self _updateUsernameOfRMAccountWithAppleAccount:v8 inStore:v10];
  }
}

- (void)_updateUsernameOfRMAccountWithAppleAccount:(id)a3 inStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v5, "dmc_altDSID");
  id v8 = objc_msgSend(v6, "dmc_remoteManagementAccountForAltDSID:", v7);

  if (v8)
  {
    id v9 = [v5 username];
    [v8 setUsername:v9];

    [v6 saveVerifiedAccount:v8 withCompletionHandler:&stru_4138];
  }
  else
  {
    id v10 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v11 = v10;
      id v12 = objc_msgSend(v5, "dmc_altDSID");
      int v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "DMCAccountNotificationPlugin: Failed to find RM account with altDSID: %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_postNotification:(id)a3
{
  id v3 = a3;
  v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "DMC account plugin posting notification: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  id v5 = v3;
  notify_post((const char *)[v5 UTF8String]);
  id v6 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "DMC account plugin posted notification: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

@end