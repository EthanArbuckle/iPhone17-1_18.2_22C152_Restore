@interface ESADelegate
- (BOOL)isNotificationDisabled;
- (BOOL)isNotificationSnoozed;
- (ESADelegate)init;
- (int)alertType;
- (void)cancelAlert;
- (void)prompt:(int)a3;
@end

@implementation ESADelegate

- (ESADelegate)init
{
  v7.receiver = self;
  v7.super_class = (Class)ESADelegate;
  v2 = [(ESADelegate *)&v7 init];
  if (v2) {
    BOOL v3 = qword_100015CA8 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    v4 = objc_alloc_init(ESALocalSettings);
    v5 = (void *)qword_100015CA8;
    qword_100015CA8 = (uint64_t)v4;
  }
  return v2;
}

- (void)prompt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (([(id)qword_100015CA8 isNotificationDisabled] & 1) == 0)
  {
    [(id)qword_100015CA8 setAlertType:v3];
    v4 = CloudServicesLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "void prompt(EscrowSecurityAlertType)";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&buf, 0xCu);
    }

    if (v3)
    {
      if (v3 == 1)
      {
        CFStringRef v45 = kCFUserNotificationAlertHeaderKey;
        v41 = +[NSBundle mainBundle];
        v40 = [v41 localizedStringForKey:@"RECORD_BURNED_ALERT_MESSAGE_TITLE" value:&stru_100010838 table:0];
        *(void *)&long long buf = v40;
        CFStringRef v46 = kCFUserNotificationAlertMessageKey;
        v39 = +[NSBundle mainBundle];
        v5 = [v39 localizedStringForKey:@"RECORD_BURNED_ALERT_MESSAGE" value:&stru_100010838 table:0];
        *((void *)&buf + 1) = v5;
        CFStringRef v47 = kCFUserNotificationDefaultButtonTitleKey;
        unsigned int v17 = [(id)qword_100015CA8 shouldAllowSnooze];
        v18 = +[NSBundle mainBundle];
        v8 = v18;
        if (v17) {
          CFStringRef v19 = @"NOTNOW";
        }
        else {
          CFStringRef v19 = @"RESETKEYCHAIN";
        }
        v10 = [v18 localizedStringForKey:v19 value:&stru_100010838 table:0];
        v55 = v10;
        CFStringRef v48 = kCFUserNotificationAlternateButtonTitleKey;
        v11 = +[NSBundle mainBundle];
        v12 = [v11 localizedStringForKey:@"UPDATECODE" value:&stru_100010838 table:0];
        v56 = v12;
        CFStringRef v49 = kCFUserNotificationOtherButtonTitleKey;
        v13 = +[NSBundle mainBundle];
        v14 = [v13 localizedStringForKey:@"LEARNMORE" value:&stru_100010838 table:0];
        v57 = v14;
        CFBooleanRef v58 = kCFBooleanTrue;
        CFStringRef v50 = kCFUserNotificationAlertTopMostKey;
        uint64_t v51 = SBUserNotificationDontDismissOnUnlock;
        v59 = &__kCFBooleanTrue;
        v60 = &__kCFBooleanFalse;
        uint64_t v52 = SBUserNotificationDismissOnLock;
        uint64_t v53 = SBUserNotificationPendInSetupIfNotAllowedKey;
        v61 = &__kCFBooleanTrue;
        CFDictionaryRef v15 = +[NSDictionary dictionaryWithObjects:&buf forKeys:&v45 count:9];
        CFOptionFlags v16 = 2;
      }
      else
      {
        if (v3 != 2)
        {
          CFDictionaryRef v15 = 0;
          CFOptionFlags v16 = 0;
LABEL_17:
          if (qword_100015CB8)
          {
            if (dword_100015CC0 >= v3)
            {
              v22 = CloudServicesLog();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v43 = 0;
                v23 = "Don't replace a ELE notification with one about a burned record";
                v25 = v22;
                uint32_t v26 = 2;
                goto LABEL_37;
              }
              goto LABEL_38;
            }
            SInt32 v20 = CFUserNotificationUpdate((CFUserNotificationRef)qword_100015CB8, 0.0, v16, v15);
            if (v20)
            {
              SInt32 v21 = v20;
              v22 = CloudServicesLog();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v43 = 67109120;
                LODWORD(v44) = v21;
                v23 = "CFUserNotificationUpdate err=%d";
LABEL_25:
                v25 = v22;
                uint32_t v26 = 8;
LABEL_37:
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v23, v43, v26);
                goto LABEL_38;
              }
              goto LABEL_38;
            }
          }
          else
          {
            SInt32 error = 0;
            v24 = CFUserNotificationCreate(0, 0.0, v16, &error, v15);
            qword_100015CB8 = (uint64_t)v24;
            if (error)
            {
              v22 = CloudServicesLog();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v43 = 67109120;
                LODWORD(v44) = error;
                v23 = "Can't make notification err=%x";
                goto LABEL_25;
              }
LABEL_38:

              return;
            }
            qword_100015CC8 = (uint64_t)CFUserNotificationCreateRunLoopSource(0, v24, (CFUserNotificationCallBack)sub_100003EE0, 0);
            Main = CFRunLoopGetMain();
            CFRunLoopAddSource(Main, (CFRunLoopSourceRef)qword_100015CC8, kCFRunLoopDefaultMode);
          }
          unsigned int add_explicit = atomic_fetch_add_explicit(dword_100015CD0, 1u, memory_order_relaxed);
          v29 = CloudServicesLog();
          v30 = v29;
          if (add_explicit)
          {
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              sub_10000A174(v30, v31, v32, v33, v34, v35, v36, v37);
            }
          }
          else
          {
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v43 = 136315138;
              v44 = "void prompt(EscrowSecurityAlertType)";
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s: starting xpc transaction", v43, 0xCu);
            }

            uint64_t v38 = os_transaction_create();
            v30 = qword_100015CB0;
            qword_100015CB0 = v38;
          }

          dword_100015CC0 = v3;
          v22 = CloudServicesLog();
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_38;
          }
          *(_DWORD *)v43 = 136315138;
          v44 = "void prompt(EscrowSecurityAlertType)";
          v23 = "Exit %s";
          v25 = v22;
          uint32_t v26 = 12;
          goto LABEL_37;
        }
        CFStringRef v45 = kCFUserNotificationAlertHeaderKey;
        v41 = +[NSBundle mainBundle];
        v40 = [v41 localizedStringForKey:@"ESCROW_ELE_ALERT_MESSAGE_TITLE" value:&stru_100010838 table:0];
        *(void *)&long long buf = v40;
        CFStringRef v46 = kCFUserNotificationAlertMessageKey;
        v39 = +[NSBundle mainBundle];
        v5 = [v39 localizedStringForKey:@"ESCROW_ELE_ALERT_MESSAGE" value:&stru_100010838 table:0];
        *((void *)&buf + 1) = v5;
        CFStringRef v47 = kCFUserNotificationDefaultButtonTitleKey;
        unsigned int v6 = [(id)qword_100015CA8 shouldAllowSnooze];
        objc_super v7 = +[NSBundle mainBundle];
        v8 = v7;
        if (v6) {
          CFStringRef v9 = @"NOTNOW";
        }
        else {
          CFStringRef v9 = @"RESETKEYCHAIN";
        }
        v10 = [v7 localizedStringForKey:v9 value:&stru_100010838 table:0];
        v55 = v10;
        CFStringRef v48 = kCFUserNotificationAlternateButtonTitleKey;
        v11 = +[NSBundle mainBundle];
        v12 = [v11 localizedStringForKey:@"CREATENEWCODE" value:&stru_100010838 table:0];
        v56 = v12;
        CFStringRef v49 = kCFUserNotificationOtherButtonTitleKey;
        v13 = +[NSBundle mainBundle];
        v14 = [v13 localizedStringForKey:@"LEARNMORE" value:&stru_100010838 table:0];
        v57 = v14;
        CFBooleanRef v58 = kCFBooleanTrue;
        CFStringRef v50 = kCFUserNotificationAlertTopMostKey;
        uint64_t v51 = SBUserNotificationDontDismissOnUnlock;
        v59 = &__kCFBooleanTrue;
        v60 = &__kCFBooleanFalse;
        uint64_t v52 = SBUserNotificationDismissOnLock;
        uint64_t v53 = SBUserNotificationPendInSetupIfNotAllowedKey;
        v61 = &__kCFBooleanTrue;
        CFDictionaryRef v15 = +[NSDictionary dictionaryWithObjects:&buf forKeys:&v45 count:9];
        CFOptionFlags v16 = 0;
      }

      goto LABEL_17;
    }
  }
}

- (void)cancelAlert
{
  [(id)qword_100015CA8 reset];
  if (qword_100015CB8)
  {
    v2 = CloudServicesLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "canceling alert", (uint8_t *)&v13, 2u);
    }

    CFUserNotificationCancel((CFUserNotificationRef)qword_100015CB8);
    dword_100015CC0 = 0;
    if (qword_100015CC8)
    {
      CFRunLoopSourceInvalidate((CFRunLoopSourceRef)qword_100015CC8);
      CFRelease((CFTypeRef)qword_100015CC8);
      qword_100015CC8 = 0;
    }
    if (qword_100015CB8)
    {
      CFRelease((CFTypeRef)qword_100015CB8);
      qword_100015CB8 = 0;
    }
    unsigned int add_explicit = atomic_fetch_add_explicit(dword_100015CD0, 0xFFFFFFFF, memory_order_relaxed);
    v4 = CloudServicesLog();
    v5 = v4;
    if (add_explicit == 1)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315138;
        v14 = "void cancelAlert(void)";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: ending xpc transaction", (uint8_t *)&v13, 0xCu);
      }

      v5 = qword_100015CB0;
      qword_100015CB0 = 0;
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      sub_10000A1EC(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (BOOL)isNotificationSnoozed
{
  unsigned int v2 = [(id)qword_100015CA8 alertType];
  if (v2) {
    LOBYTE(v2) = [(id)qword_100015CA8 alertType] < 3;
  }
  return v2;
}

- (BOOL)isNotificationDisabled
{
  return [(id)qword_100015CA8 isNotificationDisabled];
}

- (int)alertType
{
  return [(id)qword_100015CA8 alertType];
}

@end