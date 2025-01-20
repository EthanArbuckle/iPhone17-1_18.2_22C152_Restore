@interface IMDaemonAccountsRequestHandler
- (void)activateAccounts:(id)a3;
- (void)addAccount:(id)a3 defaults:(id)a4 service:(id)a5;
- (void)addAliases:(id)a3 account:(id)a4;
- (void)authenticateAccount:(id)a3;
- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4;
- (void)deactivateAccounts:(id)a3;
- (void)enrollDeviceForSMSRelay:(id)a3 account:(id)a4;
- (void)enrollSelfDeviceForSMSRelay:(id)a3;
- (void)passwordUpdatedAccount:(id)a3;
- (void)registerAccount:(id)a3;
- (void)removeAccount:(id)a3;
- (void)removeAliases:(id)a3 account:(id)a4;
- (void)setAllowList:(id)a3 account:(id)a4;
- (void)setBlockIdleStatus:(BOOL)a3 account:(id)a4;
- (void)setBlockList:(id)a3 account:(id)a4;
- (void)setBlockingMode:(unsigned int)a3 account:(id)a4;
- (void)unEnrollDeviceForSMSRelay:(id)a3 account:(id)a4;
- (void)unregisterAccount:(id)a3;
- (void)unvalidateAliases:(id)a3 account:(id)a4;
- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4 account:(id)a5;
- (void)validateAliases:(id)a3 account:(id)a4;
- (void)validateProfileAccount:(id)a3;
- (void)writeAccount:(id)a3 defaults:(id)a4;
@end

@implementation IMDaemonAccountsRequestHandler

- (void)addAccount:(id)a3 defaults:(id)a4 service:(id)a5
{
  id v13 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = +[IMDServiceController sharedController];
  v10 = [v9 serviceWithName:v8];

  if (v10)
  {
    id v11 = [v10 newAccountWithAccountDefaults:v7 accountID:v13];
    if (v11)
    {
      v12 = +[IMDAccountController sharedAccountController];
      [v12 addAccount:v11];
    }
  }
}

- (void)removeAccount:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Removing account: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  v5 = +[IMDAccountController sharedAccountController];
  v6 = [v5 accountForAccountID:v3];

  if (v6)
  {
    id v7 = +[IMDAccountController sharedAccountController];
    [v7 removeAccount:v6];
  }
}

- (void)activateAccounts:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Activating accounts: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  v5 = +[IMDAccountController sharedAccountController];
  [v5 activateAccounts:v3];
}

- (void)deactivateAccounts:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Deactivating accounts: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  v5 = +[IMDAccountController sharedAccountController];
  [v5 deactivateAccounts:v3];
}

- (void)writeAccount:(id)a3 defaults:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = +[IMDAccountController sharedAccountController];
  id v7 = [v8 accountForAccountID:v6];

  [v7 writeAccountDefaults:v5];
}

- (void)authenticateAccount:(id)a3
{
  id v3 = a3;
  v4 = +[IMDAccountController sharedAccountController];
  id v5 = [v4 sessionForAccount:v3];

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = +[IMDAccountController sharedAccountController];
  id v9 = [v8 accountForAccountID:v3];
  v10 = [v9 service];
  id v11 = [v10 internalName];
  id v5 = [v7 anySessionForServiceName:v11];

  if (v5)
  {
LABEL_7:
    [v5 authenticateAccount:v3];
  }
  else if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)registerAccount:(id)a3
{
  id v3 = a3;
  v4 = +[IMDAccountController sharedAccountController];
  id v5 = [v4 sessionForAccount:v3];

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = +[IMDAccountController sharedAccountController];
  id v9 = [v8 accountForAccountID:v3];
  v10 = [v9 service];
  id v11 = [v10 internalName];
  id v5 = [v7 anySessionForServiceName:v11];

  if (v5)
  {
LABEL_7:
    [v5 registerAccount:v3];
  }
  else if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)unregisterAccount:(id)a3
{
  id v3 = a3;
  v4 = +[IMDAccountController sharedAccountController];
  id v5 = [v4 sessionForAccount:v3];

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = +[IMDAccountController sharedAccountController];
  id v9 = [v8 accountForAccountID:v3];
  v10 = [v9 service];
  id v11 = [v10 internalName];
  id v5 = [v7 anySessionForServiceName:v11];

  if (v5)
  {
LABEL_7:
    [v5 unregisterAccount:v3];
  }
  else if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4 account:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[IMDAccountController sharedAccountController];
  id v11 = [v10 sessionForAccount:v9];

  if (v11) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  int v13 = +[IMDAccountController sharedAccountController];
  id v14 = +[IMDAccountController sharedAccountController];
  v15 = [v14 accountForAccountID:v9];
  v16 = [v15 service];
  v17 = [v16 internalName];
  id v11 = [v13 anySessionForServiceName:v17];

  if (v11)
  {
LABEL_7:
    [v11 updateAuthorizationCredentials:v7 token:v8 account:v9];
  }
  else if (IMOSLoggingEnabled())
  {
    v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)setBlockingMode:(unsigned int)a3 account:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = +[IMDAccountController sharedAccountController];
  id v7 = [v6 sessionForAccount:v5];

  if (v7) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  id v9 = +[IMDAccountController sharedAccountController];
  v10 = +[IMDAccountController sharedAccountController];
  id v11 = [v10 accountForAccountID:v5];
  v12 = [v11 service];
  int v13 = [v12 internalName];
  id v7 = [v9 anySessionForServiceName:v13];

  if (v7)
  {
LABEL_7:
    [v7 setBlockingMode:v4];
  }
  else if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)setAllowList:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = [v7 sessionForAccount:v6];

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  v10 = +[IMDAccountController sharedAccountController];
  id v11 = +[IMDAccountController sharedAccountController];
  v12 = [v11 accountForAccountID:v6];
  int v13 = [v12 service];
  id v14 = [v13 internalName];
  id v8 = [v10 anySessionForServiceName:v14];

  if (v8)
  {
LABEL_7:
    [v8 setAllowList:v5];
  }
  else if (IMOSLoggingEnabled())
  {
    int v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)setBlockList:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = [v7 sessionForAccount:v6];

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  v10 = +[IMDAccountController sharedAccountController];
  id v11 = +[IMDAccountController sharedAccountController];
  v12 = [v11 accountForAccountID:v6];
  int v13 = [v12 service];
  id v14 = [v13 internalName];
  id v8 = [v10 anySessionForServiceName:v14];

  if (v8)
  {
LABEL_7:
    [v8 setBlockList:v5];
  }
  else if (IMOSLoggingEnabled())
  {
    int v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)setBlockIdleStatus:(BOOL)a3 account:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = +[IMDAccountController sharedAccountController];
  id v7 = [v6 sessionForAccount:v5];

  if (v7) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  id v9 = +[IMDAccountController sharedAccountController];
  v10 = +[IMDAccountController sharedAccountController];
  id v11 = [v10 accountForAccountID:v5];
  v12 = [v11 service];
  int v13 = [v12 internalName];
  id v7 = [v9 anySessionForServiceName:v13];

  if (v7)
  {
LABEL_7:
    [v7 setBlockIdleStatus:v4];
  }
  else if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)passwordUpdatedAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[IMDAccountController sharedAccountController];
  id v5 = [v4 sessionForAccount:v3];

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = +[IMDAccountController sharedAccountController];
  id v9 = [v8 accountForAccountID:v3];
  v10 = [v9 service];
  id v11 = [v10 internalName];
  id v5 = [v7 anySessionForServiceName:v11];

  if (v5)
  {
LABEL_7:
    [v5 passwordUpdatedWithAccount:v3];
  }
  else if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)addAliases:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = [v7 sessionForAccount:v6];

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  v10 = +[IMDAccountController sharedAccountController];
  id v11 = +[IMDAccountController sharedAccountController];
  v12 = [v11 accountForAccountID:v6];
  int v13 = [v12 service];
  id v14 = [v13 internalName];
  id v8 = [v10 anySessionForServiceName:v14];

  if (v8)
  {
LABEL_7:
    [v8 addAliases:v5 account:v6];
  }
  else if (IMOSLoggingEnabled())
  {
    int v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)removeAliases:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = [v7 sessionForAccount:v6];

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  v10 = +[IMDAccountController sharedAccountController];
  id v11 = +[IMDAccountController sharedAccountController];
  v12 = [v11 accountForAccountID:v6];
  int v13 = [v12 service];
  id v14 = [v13 internalName];
  id v8 = [v10 anySessionForServiceName:v14];

  if (v8)
  {
LABEL_7:
    [v8 removeAliases:v5 account:v6];
  }
  else if (IMOSLoggingEnabled())
  {
    int v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)validateAliases:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = [v7 sessionForAccount:v6];

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  v10 = +[IMDAccountController sharedAccountController];
  id v11 = +[IMDAccountController sharedAccountController];
  v12 = [v11 accountForAccountID:v6];
  int v13 = [v12 service];
  id v14 = [v13 internalName];
  id v8 = [v10 anySessionForServiceName:v14];

  if (v8)
  {
LABEL_7:
    [v8 validateAliases:v5 account:v6];
  }
  else if (IMOSLoggingEnabled())
  {
    int v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)unvalidateAliases:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = [v7 sessionForAccount:v6];

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  v10 = +[IMDAccountController sharedAccountController];
  id v11 = +[IMDAccountController sharedAccountController];
  v12 = [v11 accountForAccountID:v6];
  int v13 = [v12 service];
  id v14 = [v13 internalName];
  id v8 = [v10 anySessionForServiceName:v14];

  if (v8)
  {
LABEL_7:
    [v8 unvalidateAliases:v5 account:v6];
  }
  else if (IMOSLoggingEnabled())
  {
    int v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)validateProfileAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[IMDAccountController sharedAccountController];
  id v5 = [v4 sessionForAccount:v3];

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = +[IMDAccountController sharedAccountController];
  id v9 = [v8 accountForAccountID:v3];
  v10 = [v9 service];
  id v11 = [v10 internalName];
  id v5 = [v7 anySessionForServiceName:v11];

  if (v5)
  {
LABEL_7:
    [v5 validateProfileWithAccount:v3];
  }
  else if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)enrollDeviceForSMSRelay:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = [v7 sessionForAccount:v6];

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  v10 = +[IMDAccountController sharedAccountController];
  id v11 = +[IMDAccountController sharedAccountController];
  v12 = [v11 accountForAccountID:v6];
  int v13 = [v12 service];
  id v14 = [v13 internalName];
  id v8 = [v10 anySessionForServiceName:v14];

  if (v8)
  {
LABEL_7:
    [v8 enrollDeviceInSMSRelay:v5];
  }
  else if (IMOSLoggingEnabled())
  {
    int v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)unEnrollDeviceForSMSRelay:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = [v7 sessionForAccount:v6];

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  v10 = +[IMDAccountController sharedAccountController];
  id v11 = +[IMDAccountController sharedAccountController];
  v12 = [v11 accountForAccountID:v6];
  int v13 = [v12 service];
  id v14 = [v13 internalName];
  id v8 = [v10 anySessionForServiceName:v14];

  if (v8)
  {
LABEL_7:
    [v8 unEnrollDeviceInSMSRelay:v5];
  }
  else if (IMOSLoggingEnabled())
  {
    int v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)enrollSelfDeviceForSMSRelay:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[IMDAccountController sharedAccountController];
  id v5 = [v4 sessionForAccount:v3];

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = +[IMDAccountController sharedAccountController];
  id v9 = [v8 accountForAccountID:v3];
  v10 = [v9 service];
  id v11 = [v10 internalName];
  id v5 = [v7 anySessionForServiceName:v11];

  if (v5)
  {
LABEL_7:
    [v5 enrollSelfDeviceInSMSRelay];
  }
  else if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = (void (**)(char *, uint64_t))a3;
  swift_unknownObjectRetain();
  id v7 = self;
  IMDaemonAccountsRequestHandler.calculateReachability(with:responseHandler:)(v6, a4);

  swift_unknownObjectRelease();
}

@end