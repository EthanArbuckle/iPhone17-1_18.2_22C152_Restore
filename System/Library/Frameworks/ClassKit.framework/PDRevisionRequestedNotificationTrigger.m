@interface PDRevisionRequestedNotificationTrigger
- (BOOL)shouldTriggerNotificationFromCurrentState:(id)a3 toNextState:(id)a4;
- (PDRevisionRequestedNotificationTrigger)initWithDatabase:(id)a3;
- (id)notificationDataWithDatabase:(id)a3 recipient:(id)a4 attachmentID:(id)a5;
- (void)collaborationStateWillChange:(id)a3;
- (void)dealloc;
@end

@implementation PDRevisionRequestedNotificationTrigger

- (PDRevisionRequestedNotificationTrigger)initWithDatabase:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDRevisionRequestedNotificationTrigger;
  v3 = [(PDUserNotificationTrigger *)&v6 initWithDatabase:a3];
  if (v3)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"collaborationStateWillChange:" name:@"PDDatabaseEntityCollaborationWillChangeNotification" object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PDRevisionRequestedNotificationTrigger;
  [(PDRevisionRequestedNotificationTrigger *)&v4 dealloc];
}

- (id)notificationDataWithDatabase:(id)a3 recipient:(id)a4 attachmentID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  CLSInitLog();
  v9 = (void *)CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = [v7 classID];
    *(_DWORD *)buf = 138412546;
    v46 = v11;
    __int16 v47 = 2112;
    id v48 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "PDRevisionRequestedNotificationTrigger.notificationDataWithDatabase. Class: %@ AttachmentID: %@.", buf, 0x16u);
  }
  v12 = [(PDUserNotificationTrigger *)self database];
  uint64_t v13 = objc_opt_class();
  v14 = [v7 classID];
  v15 = [v12 select:v13 identity:v14];

  v16 = [v15 displayName];
  v17 = [v12 select:objc_opt_class() identity:v8];
  uint64_t v18 = objc_opt_class();
  v19 = [v17 parentObjectID];
  v20 = [v12 select:v18 identity:v19];

  v21 = [v20 title];
  v44 = v16;
  if ([v16 length])
  {
    v42 = v15;
    id v43 = v8;
    v22 = +[NSBundle bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"NOTIFICATION_STUDENT_REVISION_NEEDED_MESSAGE_FORMAT" value:&stru_1001F6580 table:@"ClassKit"];

    v24 = [v20 objectID];
    BOOL v25 = sub_10016B700((BOOL)v12, v24);

    v26 = +[NSBundle bundleForClass:objc_opt_class()];
    v27 = v26;
    if (v25) {
      CFStringRef v28 = @"NOTIFICATION_STUDENT_REVISION_ASSESSMENT_NEEDED_TITLE";
    }
    else {
      CFStringRef v28 = @"NOTIFICATION_STUDENT_REVISION_NEEDED_TITLE";
    }
    v34 = [v26 localizedStringForKey:v28 value:&stru_1001F6580 table:@"ClassKit"];

    v35 = [v17 title];
    v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v35, v21);

    v33 = sub_10012691C((id *)[PDUserNotificationData alloc], 0, v34, v36);
    v38 = [v7 classID];
    if (v33) {
      objc_setProperty_nonatomic_copy(v33, v37, v38, 32);
    }

    v40 = [v20 objectID];
    if (v33) {
      objc_setProperty_nonatomic_copy(v33, v39, v40, 24);
    }

    v15 = v42;
    id v8 = v43;
  }
  else
  {
    CLSInitLog();
    v29 = (void *)CLSLogNotifications;
    if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
    {
      v30 = v29;
      v31 = [v7 classID];
      v32 = [v20 objectID];
      *(_DWORD *)buf = 138412546;
      v46 = v31;
      __int16 v47 = 2112;
      id v48 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "PDRevisionRequestedNotificationTrigger.notificationDataWithDatabase. Could not find class or empty class name. ClassID: %@ HandoutID: %@", buf, 0x16u);
    }
    v33 = 0;
  }

  return v33;
}

- (void)collaborationStateWillChange:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  objc_super v6 = [v5 objectForKeyedSubscript:@"newEntity"];

  CLSInitLog();
  id v7 = CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v53 = "/Library/Caches/com.apple.xbs/Sources/ClassKitSwift/progressd/UserNotifications/PDRevisionRequestedNotificationTrigger.m";
    __int16 v54 = 2080;
    v55 = "-[PDRevisionRequestedNotificationTrigger collaborationStateWillChange:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s.%s.", buf, 0x16u);
  }
  id v8 = [v4 object];

  if (sub_1000510B8(v8))
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v6 objectID];
    v11 = [v8 select:v9 identity:v10];

    if ([(PDRevisionRequestedNotificationTrigger *)self shouldTriggerNotificationFromCurrentState:v11 toNextState:v6])
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = [v6 parentObjectID];
      v14 = [v8 select:v12 identity:v13];

      if (v14)
      {
        v15 = [v14 title];
        id newValue = [v14 objectID];
        uint64_t v16 = objc_opt_class();
        v17 = [v14 parentObjectID];
        uint64_t v18 = [v8 select:v16 identity:v17];

        if (v18)
        {
          v19 = [v18 title];
          v20 = [v18 objectID];
          v21 = [(PDUserNotificationTrigger *)self classIDFromHandout:v18];

          if (v15 && v19)
          {
            BOOL v22 = sub_10016B700((BOOL)v8, v20);
            v50 = v15;
            v23 = +[NSBundle bundleForClass:objc_opt_class()];
            v24 = v23;
            if (v22) {
              CFStringRef v25 = @"NOTIFICATION_STUDENT_REVISION_ASSESSMENT_NEEDED_TITLE";
            }
            else {
              CFStringRef v25 = @"NOTIFICATION_STUDENT_REVISION_NEEDED_TITLE";
            }
            __int16 v47 = [v23 localizedStringForKey:v25 value:&stru_1001F6580 table:@"ClassKit"];

            v26 = +[NSBundle bundleForClass:objc_opt_class()];
            v27 = [v26 localizedStringForKey:@"NOTIFICATION_STUDENT_REVISION_NEEDED_MESSAGE_FORMAT" value:&stru_1001F6580 table:@"ClassKit"];
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v50, v19);
            uint64_t v28 = v48 = v21;

            v29 = [PDUserNotificationData alloc];
            v49 = (void *)v28;
            v30 = (void *)v28;
            v21 = v48;
            v31 = sub_10012691C((id *)&v29->super.isa, (void *)4, v47, v30);
            v33 = v31;
            if (v31)
            {
              objc_setProperty_nonatomic_copy(v31, v32, v20, 24);
              objc_setProperty_nonatomic_copy(v33, v34, v48, 32);
              objc_setProperty_nonatomic_copy(v33, v35, newValue, 48);
            }
            [(PDUserNotificationTrigger *)self fireTriggerWithNotificationData:v33];

            v15 = v50;
          }
        }
        else
        {
          CLSInitLog();
          v38 = (void *)CLSLogNotifications;
          if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_ERROR))
          {
            id v43 = v38;
            v44 = objc_opt_class();
            id v45 = v44;
            v46 = [v14 parentObjectID];
            *(_DWORD *)buf = 138543618;
            v53 = (const char *)v44;
            __int16 v54 = 2112;
            v55 = v46;
            _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "'%{public}@': Failed to find handout with object ID: %@", buf, 0x16u);
          }
          v19 = 0;
          v20 = 0;
          v21 = 0;
        }
        v37 = newValue;
      }
      else
      {
        CLSInitLog();
        v36 = (void *)CLSLogNotifications;
        if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_ERROR))
        {
          v39 = v36;
          v40 = objc_opt_class();
          id v41 = v40;
          v42 = [v6 parentObjectID];
          *(_DWORD *)buf = 138543618;
          v53 = (const char *)v40;
          __int16 v54 = 2112;
          v55 = v42;
          _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "'%{public}@': Failed to find attachment from Collaboration State parent object ID: %@", buf, 0x16u);
        }
        v15 = 0;
        v19 = 0;
        v20 = 0;
        v21 = 0;
        v37 = 0;
      }
    }
  }
}

- (BOOL)shouldTriggerNotificationFromCurrentState:(id)a3 toNextState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 domain];
  char v9 = [v7 state] != (id)1 || ((unint64_t)objc_msgSend(v7, "flags") & 2) == 0;
  if ([v6 state] == (id)2) {
    unint64_t v10 = (unint64_t)[v6 flags] & 1;
  }
  else {
    LOBYTE(v10) = 0;
  }
  v11 = [v7 senderPersonID];
  if (v11 || ([v7 recipientPersonID], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v12 = [v7 senderPersonID];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      uint64_t v14 = [v7 recipientPersonID];
      if (v14)
      {
        v15 = (void *)v14;
        [v7 senderPersonID];
        v16 = id v25 = v8;
        [v7 recipientPersonID];
        id v24 = v6;
        v17 = v4;
        char v18 = v10;
        v20 = char v19 = v9;
        unsigned int v21 = [v16 isEqualToString:v20] ^ 1;

        char v9 = v19;
        LOBYTE(v10) = v18;
        id v4 = v17;
        id v6 = v24;

        id v8 = v25;
        if (v11) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
    }
    LOBYTE(v21) = 1;
    if (v11) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  LOBYTE(v21) = 0;
LABEL_17:

LABEL_18:
  CLSInitLog();
  BOOL v22 = CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "PDRevisionRequestedNotificationTrigger.shouldTriggerNotificationFromCurrentState. CurrentState: %@ NextState: %@", buf, 0x16u);
  }

  return (v8 == (id)1) & ~v9 & v10 & v21;
}

@end