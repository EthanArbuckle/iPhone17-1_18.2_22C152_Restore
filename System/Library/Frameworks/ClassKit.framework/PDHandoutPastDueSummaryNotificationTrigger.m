@interface PDHandoutPastDueSummaryNotificationTrigger
- (id)defaultRecurringTriggerDateComponents;
- (id)fetchActiveHandoutsPastDueFromDate:(id)a3;
- (id)nextTriggerDateFromReferenceDate:(id)a3;
- (id)pastDueUserNotificationDataFromHandouts:(id)a3;
- (void)checkForTriggerAtDate:(id)a3;
@end

@implementation PDHandoutPastDueSummaryNotificationTrigger

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
  if (qword_10023E4F0 != -1) {
    dispatch_once(&qword_10023E4F0, &stru_1001F2F48);
  }
  v2 = (void *)qword_10023E4F8;

  return v2;
}

- (void)checkForTriggerAtDate:(id)a3
{
  id v4 = a3;
  CLSInitLog();
  v5 = CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
  {
    int v23 = 138412290;
    id v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "PDHandoutPastDueSummaryNotificationTrigger.checkForTriggerAtDate %@", (uint8_t *)&v23, 0xCu);
  }
  v6 = [(PDUserNotificationTimeBasedTrigger *)self calendar];
  v7 = [v6 components:544 fromDate:v4];

  id v8 = [v7 hour];
  id v9 = [v7 weekday];
  v10 = [(PDUserNotificationTimeBasedTrigger *)self recurringTriggerDateComponents];
  if (v9 != [v10 weekday]) {
    goto LABEL_12;
  }
  v11 = [(PDUserNotificationTimeBasedTrigger *)self recurringTriggerDateComponents];
  id v12 = [v11 hour];

  if ((uint64_t)v8 >= (uint64_t)v12)
  {
    v13 = [(PDUserNotificationTrigger *)self database];
    v10 = sub_1001602E8(v13, @"handoutPastDueSummaryLastTriggerDate");

    CLSInitLog();
    v14 = CLSLogNotifications;
    if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
    {
      int v23 = 138543362;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "PDHandoutPastDueSummaryNotificationTrigger.checkForTriggerAtDate. Last trigger time: %{public}@", (uint8_t *)&v23, 0xCu);
    }
    if (!v10
      || ([(PDUserNotificationTimeBasedTrigger *)self calendar],
          v15 = objc_claimAutoreleasedReturnValue(),
          id v16 = [v15 compareDate:v10 toDate:v4 toUnitGranularity:16],
          v15,
          v16))
    {
      v17 = [(PDUserNotificationTrigger *)self database];
      sub_100160238(v17, v4, @"handoutPastDueSummaryLastTriggerDate");

      v18 = [(PDHandoutPastDueSummaryNotificationTrigger *)self fetchActiveHandoutsPastDueFromDate:v4];
      CLSInitLog();
      v19 = (void *)CLSLogNotifications;
      if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
      {
        v20 = v19;
        v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v18 count]);
        int v23 = 138543362;
        id v24 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "PDHandoutPastDueSummaryNotificationTrigger.checkForTriggerAtDate. Found %{public}@ handouts past due", (uint8_t *)&v23, 0xCu);
      }
      v22 = [(PDHandoutPastDueSummaryNotificationTrigger *)self pastDueUserNotificationDataFromHandouts:v18];
      [(PDUserNotificationTrigger *)self fireTriggerWithNotificationData:v22];
    }
LABEL_12:
  }
}

- (id)fetchActiveHandoutsPastDueFromDate:(id)a3
{
  id v4 = a3;
  CLSInitLog();
  v5 = CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "PDHandoutPastDueSummaryNotificationTrigger.fetchActiveHandoutsPastDueFromDate. Query handouts due before %@", (uint8_t *)&v11, 0xCu);
  }
  v6 = [(PDUserNotificationTrigger *)self database];
  v7 = sub_10016B3DC(v6, v4);

  id v8 = [(PDUserNotificationTrigger *)self database];
  id v9 = sub_100156BC8(v8, v7);

  return v9;
}

- (id)pastDueUserNotificationDataFromHandouts:(id)a3
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

      v10 = +[NSBundle bundleForClass:objc_opt_class()];
      int v11 = v10;
      if (v9)
      {
        id v12 = [v10 localizedStringForKey:@"NOTIFICATION_STUDENT_SINGLE_ASSESSMENT_PAST_DUE_TITLE" value:&stru_1001F6580 table:@"ClassKit"];

        v13 = +[NSBundle bundleForClass:objc_opt_class()];
        v14 = v13;
        CFStringRef v15 = @"NOTIFICATION_STUDENT_ASSESSMENT_PAST_DUE_MESSAGE_FORMAT";
      }
      else
      {
        id v12 = [v10 localizedStringForKey:@"NOTIFICATION_STUDENT_SINGLE_HANDOUT_PAST_DUE_TITLE" value:&stru_1001F6580 table:@"ClassKit"];

        v13 = +[NSBundle bundleForClass:objc_opt_class()];
        v14 = v13;
        CFStringRef v15 = @"NOTIFICATION_STUDENT_HANDOUT_PAST_DUE_MESSAGE_FORMAT";
      }
      v32 = [v13 localizedStringForKey:v15 value:&stru_1001F6580 table:@"ClassKit"];
      v33 = [v7 title];
      v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v33);

      id v16 = sub_10012691C((id *)[PDUserNotificationData alloc], (void *)2, v12, v34);
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
            id v24 = [*(id *)(*((void *)&v44 + 1) + 8 * i) objectID];
            BOOL v25 = sub_10016B700((BOOL)v6, v24);

            v20 |= v25;
            v21 |= !v25;
            if (v21 & 1) != 0 && (v20)
            {

              v31 = +[NSBundle bundleForClass:objc_opt_class()];
              v27 = [v31 localizedStringForKey:@"NOTIFICATION_STUDENT_MULTIPLE_ASSESSMENTS_AND_ASSIGNMENTS_PAST_DUE_TITLE" value:&stru_1001F6580 table:@"ClassKit"];

              v28 = +[NSBundle bundleForClass:objc_opt_class()];
              v29 = v28;
              CFStringRef v30 = @"NOTIFICATION_STUDENT_ASSESSMENTS_AND_ASSIGNMENTS_PAST_DUE_MESSAGE_FORMAT";
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
          v27 = [v26 localizedStringForKey:@"NOTIFICATION_STUDENT_MULTIPLE_ASSESSMENTS_PAST_DUE_TITLE" value:&stru_1001F6580 table:@"ClassKit"];

          v28 = +[NSBundle bundleForClass:objc_opt_class()];
          v29 = v28;
          CFStringRef v30 = @"NOTIFICATION_STUDENT_ASSESSMENTS_PAST_DUE_MESSAGE_FORMAT";
          goto LABEL_26;
        }
      }
      else
      {
      }
      v39 = +[NSBundle bundleForClass:objc_opt_class()];
      v27 = [v39 localizedStringForKey:@"NOTIFICATION_STUDENT_MULTIPLE_HANDOUTS_PAST_DUE_TITLE" value:&stru_1001F6580 table:@"ClassKit"];

      v28 = +[NSBundle bundleForClass:objc_opt_class()];
      v29 = v28;
      CFStringRef v30 = @"NOTIFICATION_STUDENT_HANDOUTS_PAST_DUE_MESSAGE_FORMAT";
LABEL_26:
      v40 = [v28 localizedStringForKey:v30 value:&stru_1001F6580 table:@"ClassKit"];
      v41 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v40, v5);

      id v16 = sub_10012691C((id *)[PDUserNotificationData alloc], (void *)2, v27, v41);
      id v4 = v43;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

@end