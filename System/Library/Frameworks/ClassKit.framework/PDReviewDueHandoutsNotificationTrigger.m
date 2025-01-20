@interface PDReviewDueHandoutsNotificationTrigger
- (id)defaultRecurringTriggerDateComponents;
- (id)dueYesterdayUserNotificationDataFromHandouts:(id)a3;
- (id)fetchHandoutsDueYesterdayFromDate:(id)a3;
- (id)nextTriggerDateFromReferenceDate:(id)a3;
- (void)checkForTriggerAtDate:(id)a3;
@end

@implementation PDReviewDueHandoutsNotificationTrigger

- (id)nextTriggerDateFromReferenceDate:(id)a3
{
  id v4 = a3;
  v5 = [(PDUserNotificationTimeBasedTrigger *)self calendar];
  v6 = [(PDUserNotificationTimeBasedTrigger *)self recurringTriggerDateComponents];
  v7 = objc_msgSend(v5, "nextDateAfterDate:matchingHour:minute:second:options:", v4, objc_msgSend(v6, "hour"), 0, 0, 1024);

  return v7;
}

- (id)defaultRecurringTriggerDateComponents
{
  if (qword_10023E698 != -1) {
    dispatch_once(&qword_10023E698, &stru_1001F4B88);
  }
  v2 = (void *)qword_10023E6A0;

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
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "PDReviewDueHandoutsNotificationTrigger.checkForTriggerAtDate %@", (uint8_t *)&v22, 0xCu);
  }
  v6 = [(PDUserNotificationTimeBasedTrigger *)self calendar];
  v7 = [v6 components:32 fromDate:v4];
  id v8 = [v7 hour];

  v9 = [(PDUserNotificationTimeBasedTrigger *)self recurringTriggerDateComponents];
  id v10 = [v9 hour];

  if ((uint64_t)v8 >= (uint64_t)v10)
  {
    v11 = [(PDUserNotificationTrigger *)self database];
    v12 = sub_1001602E8(v11, @"reviewDueHandoutsLastTriggerDate");

    CLSInitLog();
    v13 = CLSLogNotifications;
    if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
    {
      int v22 = 138543362;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "PDReviewDueHandoutsNotificationTrigger.checkForTriggerAtDate. Last trigger time: %{public}@", (uint8_t *)&v22, 0xCu);
    }
    if (!v12
      || ([(PDUserNotificationTimeBasedTrigger *)self calendar],
          v14 = objc_claimAutoreleasedReturnValue(),
          id v15 = [v14 compareDate:v12 toDate:v4 toUnitGranularity:16],
          v14,
          v15))
    {
      v16 = [(PDUserNotificationTrigger *)self database];
      sub_100160238(v16, v4, @"reviewDueHandoutsLastTriggerDate");

      v17 = [(PDReviewDueHandoutsNotificationTrigger *)self fetchHandoutsDueYesterdayFromDate:v4];
      CLSInitLog();
      v18 = (void *)CLSLogNotifications;
      if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
      {
        v19 = v18;
        v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 count]);
        int v22 = 138543362;
        id v23 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "PDReviewDueHandoutsNotificationTrigger.checkForTriggerAtDate. Found %{public}@ handouts due yesterday", (uint8_t *)&v22, 0xCu);
      }
      v21 = [(PDReviewDueHandoutsNotificationTrigger *)self dueYesterdayUserNotificationDataFromHandouts:v17];
      [(PDUserNotificationTrigger *)self fireTriggerWithNotificationData:v21];
    }
  }
}

- (id)fetchHandoutsDueYesterdayFromDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSDateComponents);
  [v5 setHour:0];
  [v5 setMinute:0];
  [v5 setSecond:0];
  v6 = [(PDUserNotificationTimeBasedTrigger *)self calendar];
  v7 = [v6 nextDateAfterDate:v4 matchingHour:0 minute:0 second:0 options:1028];

  id v8 = [(PDUserNotificationTimeBasedTrigger *)self calendar];
  v9 = [v8 nextDateAfterDate:v7 matchingHour:0 minute:0 second:0 options:1028];

  CLSInitLog();
  id v10 = CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v9;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "PDReviewDueHandoutsNotificationTrigger.fetchHandoutsDueYesterdayFromDate. Query handouts due between %@ and %@", buf, 0x16u);
  }
  v19[0] = v9;
  v19[1] = v7;
  v19[2] = &off_10020AF38;
  v11 = +[NSArray arrayWithObjects:v19 count:3];
  v12 = objc_opt_new();
  v13 = [(PDUserNotificationTrigger *)self database];
  uint64_t v14 = objc_opt_class();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000EBDB4;
  v17[3] = &unk_1001F4BB0;
  id v15 = v12;
  id v18 = v15;
  [v13 selectAll:v14 where:@"dueDate NOT NULL AND dueDate >= ? AND dueDate < ? AND state = ? AND reviewed = 0" bindings:v11 block:v17];

  return v15;
}

- (id)dueYesterdayUserNotificationDataFromHandouts:(id)a3
{
  id v4 = a3;
  id v5 = [(PDUserNotificationTrigger *)self database];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"NOTIFICATION_TEACHER_REVIEW_HANDOUT_TITLE" value:&stru_1001F6580 table:@"ClassKit"];

  if ([v4 count] == (id)1)
  {
    id v8 = [v4 firstObject];
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"NOTIFICATION_TEACHER_REVIEW_HANDOUT_MESSAGE_FORMAT" value:&stru_1001F6580 table:@"ClassKit"];
    v11 = [v8 title];
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11);

    v13 = sub_10012691C((id *)[PDUserNotificationData alloc], (void *)3, v7, v12);
    id v15 = [v8 objectID];
    if (v13) {
      objc_setProperty_nonatomic_copy(v13, v14, v15, 24);
    }

    v17 = [(PDUserNotificationTrigger *)self classIDFromHandout:v8];
    if (v13) {
      objc_setProperty_nonatomic_copy(v13, v16, v17, 32);
    }
  }
  else if ((unint64_t)[v4 count] < 2)
  {
    v13 = 0;
  }
  else
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v18 = v4;
    id v19 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v19)
    {
      id v20 = v19;
      v33 = v7;
      int v21 = 0;
      char v22 = 0;
      uint64_t v23 = *(void *)v35;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v18);
          }
          v25 = [*(id *)(*((void *)&v34 + 1) + 8 * i) objectID];
          BOOL v26 = sub_10016B700((BOOL)v5, v25);

          v21 |= !v26;
          v22 |= v26;
          if (v21 & 1) != 0 && (v22)
          {

            v28 = +[NSBundle bundleForClass:objc_opt_class()];
            v30 = [v28 localizedStringForKey:@"NOTIFICATION_TEACHER_REVIEW_HANDOUTS_AND_ASSESSMENTS_MESSAGE_FORMAT" value:&stru_1001F6580 table:@"ClassKit"];
            v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v30, [v18 count]);
            v7 = v33;
            goto LABEL_24;
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v20) {
          continue;
        }
        break;
      }

      v7 = v33;
      if (v22)
      {
        v27 = +[NSBundle bundleForClass:objc_opt_class()];
        v28 = v27;
        CFStringRef v29 = @"NOTIFICATION_TEACHER_REVIEW_ASSESSMENTS_MESSAGE_FORMAT";
        goto LABEL_23;
      }
    }
    else
    {
    }
    v27 = +[NSBundle bundleForClass:objc_opt_class()];
    v28 = v27;
    CFStringRef v29 = @"NOTIFICATION_TEACHER_REVIEW_HANDOUTS_MESSAGE_FORMAT";
LABEL_23:
    v30 = [v27 localizedStringForKey:v29 value:&stru_1001F6580 table:@"ClassKit"];
    v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v30, [v18 count]);
LABEL_24:

    v13 = sub_10012691C((id *)[PDUserNotificationData alloc], (void *)3, v7, v31);
  }

  return v13;
}

@end