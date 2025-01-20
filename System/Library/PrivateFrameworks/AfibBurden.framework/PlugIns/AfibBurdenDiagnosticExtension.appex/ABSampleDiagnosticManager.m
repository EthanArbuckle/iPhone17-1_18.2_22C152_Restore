@interface ABSampleDiagnosticManager
- (ABSampleDiagnosticManager)initWithLoggingDirectoryPath:(id)a3 healthStore:(id)a4 numberOfWeeks:(int64_t)a5;
- (id)_determineQueryInterval;
- (id)_formattedDateInterval:(id)a3 timeZone:(id)a4;
- (id)_queryForAFibBurdenSamplesWithinDateInterval:(id)a3;
- (id)extractDiagnosticContent;
@end

@implementation ABSampleDiagnosticManager

- (ABSampleDiagnosticManager)initWithLoggingDirectoryPath:(id)a3 healthStore:(id)a4 numberOfWeeks:(int64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ABSampleDiagnosticManager;
  v10 = [(ABDiagnosticManager *)&v13 initWithDiagnosticName:@"Samples" loggingDirectoryPath:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_healthStore, a4);
    v11->_numberOfWeeks = a5;
  }

  return v11;
}

- (id)extractDiagnosticContent
{
  v3 = [(ABSampleDiagnosticManager *)self _determineQueryInterval];
  v4 = [(ABSampleDiagnosticManager *)self _queryForAFibBurdenSamplesWithinDateInterval:v3];
  if (v4)
  {
    v5 = +[NSCalendar currentCalendar];
    v6 = [v5 timeZone];
    v7 = [(ABSampleDiagnosticManager *)self _formattedDateInterval:v3 timeZone:v6];

    if ([v4 count])
    {
      id v8 = [objc_alloc((Class)NSMutableString) initWithFormat:@"Samples within range %@:\n\n", v7];
      if ([v4 count])
      {
        v39 = self;
        v37 = v7;
        v38 = v3;
        id v9 = 0;
        v40 = v4;
        do
        {
          objc_msgSend(v8, "appendFormat:", @"------------ Sample %ld/%ld ------------\n", v9 + 1, objc_msgSend(v4, "count"));
          v10 = [v4 objectAtIndexedSubscript:v9];
          v11 = [v10 quantity];
          v12 = +[HKUnit percentUnit];
          [v11 doubleValueForUnit:v12];
          objc_msgSend(v8, "appendFormat:", @"Value: %f\n", v13);

          v14 = [v10 metadata];
          v15 = [v14 objectForKeyedSubscript:HKMetadataKeyTimeZone];
          v16 = v15;
          v43 = v9;
          unint64_t v44 = (unint64_t)(v9 + 1);
          if (v15)
          {
            id v17 = v15;
          }
          else
          {
            v18 = +[NSCalendar currentCalendar];
            v19 = [v18 timeZone];
            id v17 = [v19 name];
          }
          v42 = v17;
          uint64_t v20 = +[NSTimeZone timeZoneWithName:v17];
          id v21 = objc_alloc((Class)NSDateInterval);
          v22 = [v10 startDate];
          v23 = [v10 endDate];
          id v24 = [v21 initWithStartDate:v22 endDate:v23];
          v41 = (void *)v20;
          v25 = [(ABSampleDiagnosticManager *)v39 _formattedDateInterval:v24 timeZone:v20];
          [v8 appendFormat:@"Date Range: %@\n", v25];

          [v8 appendString:@"Metadata:\n"];
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          v26 = [v10 metadata];
          v27 = [v26 allKeys];

          id v28 = [v27 countByEnumeratingWithState:&v45 objects:v49 count:16];
          if (v28)
          {
            id v29 = v28;
            uint64_t v30 = *(void *)v46;
            do
            {
              for (i = 0; i != v29; i = (char *)i + 1)
              {
                if (*(void *)v46 != v30) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v32 = *(void *)(*((void *)&v45 + 1) + 8 * i);
                v33 = [v10 metadata];
                v34 = [v33 objectForKeyedSubscript:v32];
                [v8 appendFormat:@"%@: %@\n", v32, v34];
              }
              id v29 = [v27 countByEnumeratingWithState:&v45 objects:v49 count:16];
            }
            while (v29);
          }

          v4 = v40;
          if (v43 < (char *)[v40 count] - 1) {
            [v8 appendString:@"\n\n"];
          }

          id v9 = (char *)v44;
        }
        while (v44 < (unint64_t)[v40 count]);
        v7 = v37;
        v3 = v38;
      }
    }
    else
    {
      v35 = ab_get_framework_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v51 = self;
        __int16 v52 = 2112;
        v53 = v7;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No samples within range %@", buf, 0x16u);
      }

      id v8 = +[NSString stringWithFormat:@"(No samples found within range %@)", v7];
    }
  }
  else
  {
    v7 = ab_get_framework_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v51 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Nil samples given, not writing file", buf, 0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

- (id)_determineQueryInterval
{
  v3 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
  v4 = +[NSDate now];
  v5 = [v3 dateByAddingUnit:0x2000 value:~self->_numberOfWeeks toDate:v4 options:0];
  id v6 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v5 endDate:v4];

  return v6;
}

- (id)_formattedDateInterval:(id)a3 timeZone:(id)a4
{
  uint64_t v4 = qword_10000C790;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_10000C790, &stru_1000082D8);
  }
  id v6 = [(id)qword_10000C798 stringFromDateInterval:v5];

  return v6;
}

- (id)_queryForAFibBurdenSamplesWithinDateInterval:(id)a3
{
  id v4 = a3;
  id v5 = [v4 startDate];
  id v6 = [v4 endDate];
  v7 = +[HKQuery predicateForSamplesWithStartDate:v5 endDate:v6 options:1];

  id v8 = [objc_alloc((Class)NSSortDescriptor) initWithKey:HKSampleSortIdentifierStartDate ascending:1];
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_1000056F8;
  v26 = sub_100005708;
  id v27 = 0;
  id v10 = objc_alloc((Class)HKSampleQuery);
  v11 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierAtrialFibrillationBurden];
  id v30 = v8;
  v12 = +[NSArray arrayWithObjects:&v30 count:1];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100005710;
  v19[3] = &unk_100008300;
  v19[4] = self;
  id v21 = &v22;
  uint64_t v13 = v9;
  uint64_t v20 = v13;
  id v14 = [v10 initWithSampleType:v11 predicate:v7 limit:0 sortDescriptors:v12 resultsHandler:v19];

  v15 = ab_get_framework_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = self;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Executing query for samples", buf, 0xCu);
  }

  [(HKHealthStore *)self->_healthStore executeQuery:v14];
  dispatch_time_t v16 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v13, v16);
  id v17 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v17;
}

- (void).cxx_destruct
{
}

@end