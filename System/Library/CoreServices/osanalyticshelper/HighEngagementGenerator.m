@interface HighEngagementGenerator
+ (id)_DHIDto95thPercentile;
+ (id)_DHIDtoCategoryDisplayNameMap;
+ (id)_OverrideIfNeeded:(id)a3 givenCategory:(id)a4;
+ (id)generateLastDayAppUsage;
+ (id)generateTopThreeCategories:(id)a3;
+ (id)getAppUsageArray:(id)a3 to:(id)a4;
+ (id)processDailyUsage:(id)a3 from:(id)a4 to:(id)a5;
+ (void)createBiomeFeed;
+ (void)generateTotalByCategory:(id)a3 completionHandler:(id)a4;
+ (void)setAlarm:(int64_t)a3;
@end

@implementation HighEngagementGenerator

+ (id)_DHIDtoCategoryDisplayNameMap
{
  if (qword_100026250 != -1) {
    dispatch_once(&qword_100026250, &stru_100020B78);
  }
  v2 = (void *)qword_100026248;

  return v2;
}

+ (id)_DHIDto95thPercentile
{
  if (qword_100026260 != -1) {
    dispatch_once(&qword_100026260, &stru_100020B98);
  }
  v2 = (void *)qword_100026258;

  return v2;
}

+ (id)_OverrideIfNeeded:(id)a3 givenCategory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_100026270 != -1) {
    dispatch_once(&qword_100026270, &stru_100020BB8);
  }
  id v7 = [(id)qword_100026268 objectForKeyedSubscript:v5];
  if (!v7) {
    id v7 = v6;
  }
  if (v7 == (id)CTCategoryIdentifierSystemUnblockable
    || v7 == (id)CTCategoryIdentifierSystemBlockable
    || v7 == (id)CTCategoryIdentifierSystemHidden)
  {

    id v7 = 0;
  }

  return v7;
}

+ (void)setAlarm:(int64_t)a3
{
  v4 = +[NSDate date];
  id v5 = +[NSCalendar currentCalendar];
  id v6 = +[NSTimeZone timeZoneWithName:@"UTC"];
  [v5 setTimeZone:v6];

  if (a3 == 1)
  {
    id v7 = objc_opt_new();
    [v7 setDay:1];
    uint64_t v8 = [v5 dateByAddingComponents:v7 toDate:v4 options:0];

    v4 = (void *)v8;
  }
  v9 = [v5 components:28 fromDate:v4];
  [v9 setHour:23];
  [v9 setMinute:45];
  v10 = [v5 dateFromComponents:v9];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HighEngagement: Setting Alarm for %@", (uint8_t *)&v19, 0xCu);
  }
  [v10 timeIntervalSince1970];
  double v12 = v11;
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_date(v13, "Date", (uint64_t)(ceil(v12) * 1000000000.0));
  xpc_dictionary_set_BOOL(v13, "ShouldWake", 0);
  [@"com.apple.osanalytics.highengagementtimer" UTF8String];
  xpc_set_event();
  [v9 setHour:23];
  [v9 setMinute:55];
  v14 = [v5 dateFromComponents:v9];

  v15 = v14;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HighEngagement: Setting Hard Alarm for %@", (uint8_t *)&v19, 0xCu);
  }
  [v14 timeIntervalSince1970];
  double v17 = v16;
  xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);

  xpc_dictionary_set_date(v18, "Date", (uint64_t)(ceil(v17) * 1000000000.0));
  xpc_dictionary_set_BOOL(v18, "ShouldWake", 1);
  [@"com.apple.osanalytics.hardhighengagementtimer" UTF8String];
  xpc_set_event();
}

+ (void)createBiomeFeed
{
  if (objc_opt_class() && objc_opt_class())
  {
    v3 = [a1 generateLastDayAppUsage];
    if (v3)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100006A88;
      v5[3] = &unk_100020C00;
      v5[4] = a1;
      [a1 generateTotalByCategory:v3 completionHandler:v5];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HighEngagement: Usage Data is Nil", v4, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100014A7C();
  }
}

+ (id)generateTopThreeCategories:(id)a3
{
  id v3 = a3;
  v4 = [v3 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000077C4;
  v11[3] = &unk_100020C28;
  id v5 = v3;
  id v12 = v5;
  id v6 = [v4 sortedArrayUsingComparator:v11];
  id v7 = [v6 count];
  if ((unint64_t)v7 >= 3) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = (uint64_t)v7;
  }
  v9 = objc_msgSend(v6, "subarrayWithRange:", 0, v8);

  return v9;
}

+ (void)generateTotalByCategory:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  uint64_t v8 = objc_opt_new();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HighEngagement: Entering generateTotalByCategory", buf, 2u);
  }
  if (!objc_opt_class())
  {
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    CFStringRef v26 = @"Categories framework not available.";
    v9 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v10 = +[NSError errorWithDomain:@"osanalyticshelper" code:0 userInfo:v9];

    v7[2](v7, v8, v10);
  }
  if (v6)
  {
    double v11 = +[CTCategories sharedCategories];
    id v12 = [v6 allKeys];
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    double v17 = sub_100007B98;
    xpc_object_t v18 = &unk_100020C50;
    id v22 = a1;
    id v13 = v8;
    id v19 = v13;
    id v20 = v6;
    v21 = v7;
    [v11 categoriesForBundleIDs:v12 completionHandler:&v15];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count", v15, v16, v17, v18, v19, v20));
      *(_DWORD *)buf = 138412290;
      v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HighEngagement: generateTotalByCategory outside completion handler. Categories total count: %@", buf, 0xCu);
    }
  }
}

+ (id)generateLastDayAppUsage
{
  id v3 = +[NSDate date];
  v4 = [v3 dateByAddingTimeInterval:-86400.0];
  BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v5) {
    sub_100014B78(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  id v13 = [a1 getAppUsageArray:v4 to:v3];
  BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v14) {
    sub_100014B3C(v14, v15, v16, v17, v18, v19, v20, v21);
  }
  id v22 = [a1 processDailyUsage:v13 from:v4 to:v3];

  return v22;
}

+ (id)getAppUsageArray:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_class())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v5;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HighEngagement: getAppUsageArray from: %@ to: %@", buf, 0x16u);
    }
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = +[_DKSystemEventStreams appInFocusStream];
    id v22 = v8;
    uint64_t v9 = +[NSArray arrayWithObjects:&v22 count:1];
    [v7 setEventStreams:v9];

    uint64_t v10 = +[_DKQuery predicateForEventsIntersectingDateRangeFrom:v5 to:v6];
    [v7 setPredicate:v10];

    uint64_t v11 = +[_DKQuery startDateSortDescriptorAscending:1];
    v21[0] = v11;
    uint64_t v12 = +[_DKQuery endDateSortDescriptorAscending:1];
    v21[1] = v12;
    id v13 = +[NSArray arrayWithObjects:v21 count:2];
    [v7 setSortDescriptors:v13];

    BOOL v14 = +[_DKKnowledgeStore knowledgeStore];
    id v20 = 0;
    uint64_t v15 = [v14 executeQuery:v7 error:&v20];
    id v16 = v20;

    if (v16)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [v16 description];
        sub_100014BFC(v17, buf);
      }
      id v18 = 0;
    }
    else
    {
      id v18 = v15;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100014BB4();
    }
    id v18 = 0;
  }

  return v18;
}

+ (id)processDailyUsage:(id)a3 from:(id)a4 to:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v41 = v7;
  id v42 = a5;
  id v43 = (id)objc_opt_new();
  if (v7)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v45;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v45 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          BOOL v14 = objc_msgSend(v13, "startDate", v41);
          if (!v14
            || ([v13 endDate],
                uint64_t v15 = objc_claimAutoreleasedReturnValue(),
                BOOL v16 = v15 == 0,
                v15,
                v14,
                v16))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              id v24 = [v13 stringValue];
              *(_DWORD *)buf = 138412290;
              v49 = v24;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HighEngagement: Skipping event for %@ due to missing start or end date", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v17 = [v13 endDate];
            id v18 = [v13 startDate];
            [v17 timeIntervalSinceDate:v18];
            double v20 = v19;

            id v21 = [v13 startDate];
            LODWORD(v17) = v21 < v8;

            if (v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              id v22 = [v13 startDate];
              *(_DWORD *)buf = 138412546;
              v49 = v22;
              __int16 v50 = 2112;
              double v51 = *(double *)&v8;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HighEngagement: Start date before from dates event.startDate :%@ fromDate %@", buf, 0x16u);
            }
            if (v20 >= 0.0)
            {
              __int16 v25 = [v13 endDate];
              [v42 timeIntervalSinceDate:v25];
              BOOL v27 = v26 < 0.0;

              if (v27)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  v38 = [v13 stringValue];
                  v39 = [v13 endDate];
                  *(_DWORD *)buf = 138412546;
                  v49 = v38;
                  __int16 v50 = 2112;
                  double v51 = *(double *)&v39;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HighEngagement: Stopping iteration with %@ that ends in the future at %@", buf, 0x16u);
                }
                goto LABEL_34;
              }
              v28 = [v13 stringValue];
              id v29 = [v28 copy];

              if ([v29 containsString:@"/"])
              {
                id v30 = [v29 lastPathComponent];
              }
              else
              {
                id v30 = v29;
              }
              v31 = v30;
              if (v30)
              {
                v32 = [v43 objectForKeyedSubscript:v30];
                BOOL v33 = v32 == 0;

                if (v33)
                {
                  v35 = +[NSNumber numberWithDouble:v20];
                  [v43 setObject:v35 forKeyedSubscript:v31];
                }
                else
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    v34 = +[NSNumber numberWithDouble:v20];
                    *(_DWORD *)buf = 138412546;
                    v49 = v31;
                    __int16 v50 = 2112;
                    double v51 = *(double *)&v34;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HighEngagement: Adding bundle to appUsage bundleID: %@  duration: %@", buf, 0x16u);
                  }
                  v35 = [v43 objectForKeyedSubscript:v31];
                  [v35 doubleValue];
                  v37 = +[NSNumber numberWithDouble:v20 + v36];
                  [v43 setObject:v37 forKeyedSubscript:v31];
                }
              }
            }
            else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v23 = [v13 stringValue];
              *(_DWORD *)buf = 138412546;
              v49 = v23;
              __int16 v50 = 2048;
              double v51 = v20;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HighEngagement: Skipping event for %@ with negative time interval of %f", buf, 0x16u);
            }
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_34:
  }

  return v43;
}

@end