@interface IMDaemonBuddyListRequestHandler
- (void)acceptSubscriptionRequest:(BOOL)a3 from:(id)a4 account:(id)a5;
- (void)changeGroup:(id)a3 changes:(id)a4 account:(id)a5;
- (void)changeGroups:(id)a3 account:(id)a4;
- (void)renameGroup:(id)a3 to:(id)a4 account:(id)a5;
- (void)requestSubscriptionTo:(id)a3 account:(id)a4;
@end

@implementation IMDaemonBuddyListRequestHandler

- (void)changeGroups:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[IMDAccountController sharedAccountController];
  v8 = [v7 sessionForAccount:v6];

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  v10 = +[IMDAccountController sharedAccountController];
  v11 = +[IMDAccountController sharedAccountController];
  v12 = [v11 accountForAccountID:v6];
  v13 = [v12 service];
  v14 = [v13 internalName];
  v8 = [v10 anySessionForServiceName:v14];

  if (v8)
  {
LABEL_7:
    [v8 changeGroups:v5];
  }
  else if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)changeGroup:(id)a3 changes:(id)a4 account:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[IMDAccountController sharedAccountController];
  v11 = [v10 sessionForAccount:v9];

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
  v13 = +[IMDAccountController sharedAccountController];
  v14 = +[IMDAccountController sharedAccountController];
  v15 = [v14 accountForAccountID:v9];
  int v16 = [v15 service];
  id v17 = [v16 internalName];
  v11 = [v13 anySessionForServiceName:v17];

  if (v11)
  {
LABEL_7:
    [v11 changeGroup:v7 changes:v8];
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

- (void)renameGroup:(id)a3 to:(id)a4 account:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[IMDAccountController sharedAccountController];
  v11 = [v10 sessionForAccount:v9];

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
  v13 = +[IMDAccountController sharedAccountController];
  v14 = +[IMDAccountController sharedAccountController];
  v15 = [v14 accountForAccountID:v9];
  int v16 = [v15 service];
  id v17 = [v16 internalName];
  v11 = [v13 anySessionForServiceName:v17];

  if (v11)
  {
LABEL_7:
    [v11 renameGroup:v7 to:v8];
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

- (void)acceptSubscriptionRequest:(BOOL)a3 from:(id)a4 account:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = +[IMDAccountController sharedAccountController];
  v10 = [v9 sessionForAccount:v8];

  if (v10) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  v12 = +[IMDAccountController sharedAccountController];
  v13 = +[IMDAccountController sharedAccountController];
  v14 = [v13 accountForAccountID:v8];
  v15 = [v14 service];
  int v16 = [v15 internalName];
  v10 = [v12 anySessionForServiceName:v16];

  if (v10)
  {
LABEL_7:
    [v10 acceptSubscriptionRequest:v6 from:v7];
  }
  else if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)requestSubscriptionTo:(id)a3 account:(id)a4
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
  v11 = +[IMDAccountController sharedAccountController];
  v12 = [v11 accountForAccountID:v6];
  v13 = [v12 service];
  v14 = [v13 internalName];
  id v8 = [v10 anySessionForServiceName:v14];

  if (v8)
  {
LABEL_7:
    [v8 requestSubscriptionTo:v5];
  }
  else if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

@end