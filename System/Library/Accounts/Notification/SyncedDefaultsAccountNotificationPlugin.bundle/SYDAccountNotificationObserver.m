@interface SYDAccountNotificationObserver
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation SYDAccountNotificationObserver

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  v10 = v9;
  if (v8) {
    v11 = v8;
  }
  else {
    v11 = v9;
  }
  id v12 = v11;
  v13 = [v12 accountType];
  v14 = [v13 identifier];
  if (![v14 isEqualToString:ACAccountTypeIdentifierAppleAccount])
  {

LABEL_24:
    goto LABEL_25;
  }
  if (objc_msgSend(v12, "aa_isAccountClass:", AAAccountClassPrimary))
  {

LABEL_9:
    v13 = [v12 identifier];
    v16 = SYDGetAccountsLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_34E0((uint64_t)v13, a4, v16);
    }

    switch(a4)
    {
      case 1:
        v17 = SYDGetAccountsLog();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 138412290;
        id v27 = v8;
        v18 = "User signed in to account %@";
        goto LABEL_19;
      case 2:
        uint64_t v19 = kAccountDataclassKeyValue;
        unsigned int v20 = [v10 isEnabledForDataclass:kAccountDataclassKeyValue];
        unsigned int v21 = [v8 isEnabledForDataclass:v19];
        if (v20 == v21) {
          goto LABEL_24;
        }
        unsigned int v22 = v21;
        v17 = SYDGetAccountsLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          id v27 = v13;
          __int16 v28 = 1024;
          unsigned int v29 = v22;
          __int16 v30 = 1024;
          unsigned int v31 = v20;
          _os_log_debug_impl(&dword_0, v17, OS_LOG_TYPE_DEBUG, "Enabled state for account %@ was modified, isEnabled=%d wasEnabled=%d", buf, 0x18u);
        }
LABEL_20:

LABEL_21:
        v23 = SYDGetAccountsLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v13;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Notifying daemon about account change for AppleAccount %@", buf, 0xCu);
        }

        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_345C;
        v24[3] = &unk_40E0;
        id v25 = v13;
        +[SYDClientToDaemonConnection processAccountChangesWithCompletionHandler:v24];

        break;
      case 3:
        v17 = SYDGetAccountsLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v8;
          v18 = "User signed out of account %@";
LABEL_19:
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, v18, buf, 0xCu);
        }
        goto LABEL_20;
      case 5:
        goto LABEL_21;
      default:
        goto LABEL_24;
    }
    goto LABEL_24;
  }
  unsigned __int8 v15 = objc_msgSend(v12, "aa_isAccountClass:", AAAccountClassFull);

  if (v15) {
    goto LABEL_9;
  }
LABEL_25:
}

@end