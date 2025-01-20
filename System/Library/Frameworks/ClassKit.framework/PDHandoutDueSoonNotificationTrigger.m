@interface PDHandoutDueSoonNotificationTrigger
- (id)defaultRecurringTriggerDateComponents;
- (id)dueTomorrowUserNotificationDataFromHandouts:(id)a3;
- (id)fetchHandoutsDueNextDayFromDate:(id)a3;
- (id)nextTriggerDateFromReferenceDate:(id)a3;
- (void)checkForTriggerAtDate:(id)a3;
@end

@implementation PDHandoutDueSoonNotificationTrigger

- (id)nextTriggerDateFromReferenceDate:(id)a3
{
  id v4 = a3;
  v5 = [(PDUserNotificationTimeBasedTrigger *)self calendar];
  v6 = [(PDUserNotificationTimeBasedTrigger *)self recurringTriggerDateComponents];
  v7 = [v5 nextDateAfterDate:v4 matchingComponents:v6 options:1024];

  return v7;
}

- (id)defaultRecurringTriggerDateComponents
{
  if (qword_10023E540 != -1) {
    dispatch_once(&qword_10023E540, &stru_1001F3568);
  }
  v2 = (void *)qword_10023E548;

  return v2;
}

- (void)checkForTriggerAtDate:(id)a3
{
  id v4 = a3;
  CLSInitLog();
  v5 = CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
  {
    int v22 = 138412290;
    id v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "PDHandoutDueSoonNotificationTrigger.checkForTriggerAtDate %@", (uint8_t *)&v22, 0xCu);
  }
  v6 = [(PDUserNotificationTimeBasedTrigger *)self calendar];
  v7 = [v6 components:32 fromDate:v4];
  id v8 = [v7 hour];

  v9 = [(PDUserNotificationTimeBasedTrigger *)self recurringTriggerDateComponents];
  id v10 = [v9 hour];

  if ((uint64_t)v8 >= (uint64_t)v10)
  {
    v11 = [(PDUserNotificationTrigger *)self database];
    v12 = sub_1001602E8(v11, @"handoutDueSoonLastTriggerDate");

    CLSInitLog();
    v13 = CLSLogNotifications;
    if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
    {
      int v22 = 138543362;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "PDHandoutDueSoonNotificationTrigger.checkForTriggerAtDate. Last trigger time: %{public}@", (uint8_t *)&v22, 0xCu);
    }
    if (!v12
      || ([(PDUserNotificationTimeBasedTrigger *)self calendar],
          v14 = objc_claimAutoreleasedReturnValue(),
          id v15 = [v14 compareDate:v12 toDate:v4 toUnitGranularity:16],
          v14,
          v15))
    {
      v16 = [(PDUserNotificationTrigger *)self database];
      sub_100160238(v16, v4, @"handoutDueSoonLastTriggerDate");

      v17 = [(PDHandoutDueSoonNotificationTrigger *)self fetchHandoutsDueNextDayFromDate:v4];
      CLSInitLog();
      v18 = (void *)CLSLogNotifications;
      if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
      {
        v19 = v18;
        v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 count]);
        int v22 = 138543362;
        id v23 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "PDHandoutDueSoonNotificationTrigger.checkForTriggerAtDate. Found %{public}@ handouts due soon", (uint8_t *)&v22, 0xCu);
      }
      v21 = [(PDHandoutDueSoonNotificationTrigger *)self dueTomorrowUserNotificationDataFromHandouts:v17];
      [(PDUserNotificationTrigger *)self fireTriggerWithNotificationData:v21];
    }
  }
}

- (id)fetchHandoutsDueNextDayFromDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSDateComponents);
  [v5 setHour:0];
  [v5 setMinute:0];
  [v5 setSecond:0];
  v6 = [(PDUserNotificationTimeBasedTrigger *)self calendar];
  v7 = [v6 nextDateAfterDate:v4 matchingHour:0 minute:0 second:0 options:1024];

  id v8 = [(PDUserNotificationTimeBasedTrigger *)self calendar];
  v9 = [v8 nextDateAfterDate:v7 matchingHour:0 minute:0 second:0 options:1024];

  CLSInitLog();
  id v10 = CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v7;
    __int16 v24 = 2112;
    v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "PDHandoutDueSoonNotificationTrigger.fetchHandoutsDueNextDayFromDate. Query handouts due between %@ and %@", buf, 0x16u);
  }
  v21[0] = v7;
  v21[1] = v9;
  v11 = +[NSArray arrayWithObjects:v21 count:2];
  v12 = objc_opt_new();
  v13 = [(PDUserNotificationTrigger *)self database];
  uint64_t v14 = objc_opt_class();
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000771EC;
  v19[3] = &unk_1001F3590;
  v19[4] = self;
  id v15 = v12;
  id v20 = v15;
  [v13 selectAll:v14 where:@"dueDate NOT NULL AND dueDate >= ? AND dueDate < ?" bindings:v11 block:v19];

  v16 = v20;
  id v17 = v15;

  return v17;
}

- (id)dueTomorrowUserNotificationDataFromHandouts:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  v6 = [(PDUserNotificationTrigger *)self database];
  if (v5)
  {
    if (v5 == (id)1)
    {
      v7 = [v4 firstObject];
      id v8 = [v7 objectID];
      BOOL v9 = sub_10016B700((BOOL)v6, v8);

      id v10 = +[NSBundle bundleForClass:objc_opt_class()];
      v11 = v10;
      if (v9)
      {
        v12 = [v10 localizedStringForKey:@"NOTIFICATION_STUDENT_SINGLE_ASSESSMENT_DUE_TOMORROW_TITLE" value:&stru_1001F6580 table:@"ClassKit"];

        v13 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v14 = v13;
        CFStringRef v15 = @"NOTIFICATION_STUDENT_ASSESSMENT_DUE_TOMORROW_MESSAGE_FORMAT";
      }
      else
      {
        v12 = [v10 localizedStringForKey:@"NOTIFICATION_STUDENT_SINGLE_HANDOUT_DUE_TOMORROW_TITLE" value:&stru_1001F6580 table:@"ClassKit"];

        v13 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v14 = v13;
        CFStringRef v15 = @"NOTIFICATION_STUDENT_HANDOUT_DUE_TOMORROW_MESSAGE_FORMAT";
      }
      v32 = [v13 localizedStringForKey:v15 value:&stru_1001F6580 table:@"ClassKit"];
      v33 = [v7 title];
      v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v33);

      v16 = sub_10012691C((id *)[PDUserNotificationData alloc], (void *)1, v12, v34);
      v36 = [v7 objectID];
      if (v16) {
        objc_setProperty_nonatomic_copy(v16, v35, v36, 24);
      }

      v38 = [(PDUserNotificationTrigger *)self classIDFromHandout:v7];
      if (v16) {
        objc_setProperty_nonatomic_copy(v16, v37, v38, 32);
      }
    }
    else
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v43 = v4;
      id v17 = v4;
      id v18 = [v17 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v18)
      {
        id v19 = v18;
        char v20 = 0;
        int v21 = 0;
        uint64_t v22 = *(void *)v45;
        while (2)
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v45 != v22) {
              objc_enumerationMutation(v17);
            }
            __int16 v24 = [*(id *)(*((void *)&v44 + 1) + 8 * i) objectID];
            BOOL v25 = sub_10016B700((BOOL)v6, v24);

            v20 |= v25;
            v21 |= !v25;
            if (v21 & 1) != 0 && (v20)
            {

              v31 = +[NSBundle bundleForClass:objc_opt_class()];
              v27 = [v31 localizedStringForKey:@"NOTIFICATION_STUDENT_MULTIPLE_ASSESSMENTS_AND_ASSIGNMENTS_DUE_TOMORROW_TITLE" value:&stru_1001F6580 table:@"ClassKit"];

              v28 = +[NSBundle bundleForClass:objc_opt_class()];
              v29 = v28;
              CFStringRef v30 = @"NOTIFICATION_STUDENT_ASSESSMENTS_AND_ASSIGNMENTS_DUE_TOMORROW_MESSAGE_FORMAT";
              goto LABEL_26;
            }
          }
          id v19 = [v17 countByEnumeratingWithState:&v44 objects:v48 count:16];
          if (v19) {
            continue;
          }
          break;
        }

        if (v20)
        {
          v26 = +[NSBundle bundleForClass:objc_opt_class()];
          v27 = [v26 localizedStringForKey:@"NOTIFICATION_STUDENT_MULTIPLE_ASSESSMENTS_DUE_TOMORROW_TITLE" value:&stru_1001F6580 table:@"ClassKit"];

          v28 = +[NSBundle bundleForClass:objc_opt_class()];
          v29 = v28;
          CFStringRef v30 = @"NOTIFICATION_STUDENT_ASSESSMENTS_DUE_TOMORROW_MESSAGE_FORMAT";
          goto LABEL_26;
        }
      }
      else
      {
      }
      v39 = +[NSBundle bundleForClass:objc_opt_class()];
      v27 = [v39 localizedStringForKey:@"NOTIFICATION_STUDENT_MULTIPLE_HANDOUTS_DUE_TOMORROW_TITLE" value:&stru_1001F6580 table:@"ClassKit"];

      v28 = +[NSBundle bundleForClass:objc_opt_class()];
      v29 = v28;
      CFStringRef v30 = @"NOTIFICATION_STUDENT_HANDOUTS_DUE_TOMORROW_MESSAGE_FORMAT";
LABEL_26:
      v40 = [v28 localizedStringForKey:v30 value:&stru_1001F6580 table:@"ClassKit"];
      v41 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v40, v5);

      v16 = sub_10012691C((id *)[PDUserNotificationData alloc], (void *)1, v27, v41);
      id v4 = v43;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end