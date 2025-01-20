@interface MobileTimerAssistantAlarmSearch
+ (id)sanitizeAlarmLabelForComparison:(id)a3;
- (MobileTimerAssistantAlarmSearch)searchWithAlarms:(id)a3;
- (id)sanitizedAlarmLabelForComparison;
- (id)validateCommandArguments;
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantAlarmSearch

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10EC8(v5);
  }

  [(MobileTimerAssistantAlarmSearch *)self _performWithCompletion:v4];
  v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10E44(v6);
  }
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, NSObject *))a3;
  v5 = [(MobileTimerAssistantAlarmSearch *)self validateCommandArguments];
  if (v5)
  {
    v6 = MTLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10F4C((uint64_t)self, (uint64_t)v5, v6);
    }

    v7 = [v5 dictionary];
    v4[2](v4, v7);
  }
  else
  {
    v8 = dispatch_group_create();
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    v10 = MTLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[MobileTimerAssistantAlarmSearch _performWithCompletion:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = self;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%s %{public}@ fetching alarms", buf, 0x16u);
    }

    v18 = objc_opt_new();
    v17 = [v18 alarms];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v47 = sub_95C0;
    v48 = sub_95D0;
    id v49 = 0;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3032000000;
    v44[3] = sub_95C0;
    v44[4] = sub_95D0;
    id v45 = 0;
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = sub_95C0;
    v42[4] = sub_95D0;
    id v43 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = sub_95C0;
    v40[4] = sub_95D0;
    id v41 = 0;
    if (MTShouldHandleForEucalyptus())
    {
      v11 = [(MobileTimerAssistantAlarmSearch *)self includesSleepAlarms];
      unsigned int v12 = [v11 BOOLValue];

      if (v12)
      {
        v13 = [v18 nextSleepAlarm];
        objc_initWeak(location, self);
        dispatch_group_enter(v8);
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_95D8;
        v35[3] = &unk_18748;
        objc_copyWeak(&v39, location);
        v37 = v42;
        v38 = v40;
        v36 = v8;
        id v14 = [v13 addCompletionBlock:v35];

        objc_destroyWeak(&v39);
        objc_destroyWeak(location);
      }
    }
    objc_initWeak(&from, self);
    dispatch_group_enter(v8);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_9714;
    v29[3] = &unk_18770;
    objc_copyWeak(&v33, &from);
    v31 = buf;
    v32 = v44;
    v7 = v8;
    v30 = v7;
    id v15 = [v17 addCompletionBlock:v29];
    location[0] = 0;
    location[1] = location;
    location[2] = (id)0x3032000000;
    location[3] = sub_95C0;
    location[4] = sub_95D0;
    id v28 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_984C;
    block[3] = &unk_18798;
    block[4] = self;
    v22 = v44;
    v23 = v40;
    v24 = location;
    v25 = v42;
    v26 = buf;
    dispatch_semaphore_t v20 = v9;
    v21 = v4;
    v16 = v9;
    dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, block);
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

    _Block_object_dispose(location, 8);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&from);
    _Block_object_dispose(v40, 8);

    _Block_object_dispose(v42, 8);
    _Block_object_dispose(v44, 8);

    _Block_object_dispose(buf, 8);
  }
}

- (id)validateCommandArguments
{
  id v3 = [(MobileTimerAssistantAlarmSearch *)self hour];

  if (v3)
  {
    id v4 = [(MobileTimerAssistantAlarmSearch *)self hour];
    id v24 = 0;
    BOOL v5 = MTValidateAlarmHour((unint64_t)[v4 unsignedIntegerValue], &v24);
    id v3 = v24;

    id v6 = v3;
    if (!v5) {
      goto LABEL_10;
    }
  }
  v7 = [(MobileTimerAssistantAlarmSearch *)self minute];

  if (v7)
  {
    v8 = [(MobileTimerAssistantAlarmSearch *)self minute];
    id v23 = v3;
    BOOL v9 = MTValidateAlarmMinute((unint64_t)[v8 unsignedIntegerValue], &v23);
    id v6 = v23;

    id v3 = v6;
    if (!v9) {
      goto LABEL_10;
    }
  }
  v10 = [(MobileTimerAssistantAlarmSearch *)self frequency];

  if (v10)
  {
    v11 = [(MobileTimerAssistantAlarmSearch *)self frequency];
    id v22 = v3;
    int v12 = MTValidateAlarmFrequency(v11, &v22);
    id v6 = v22;

    id v3 = v6;
    if (!v12) {
      goto LABEL_10;
    }
  }
  v13 = [(MobileTimerAssistantAlarmSearch *)self label];

  if (v13)
  {
    id v14 = [(MobileTimerAssistantAlarmSearch *)self label];
    id v21 = v3;
    BOOL v15 = MTValidateAlarmLabel(v14, &v21);
    id v6 = v21;

    if (v15)
    {
      id v16 = 0;
LABEL_11:
      id v3 = v6;
      goto LABEL_12;
    }
LABEL_10:
    id v17 = objc_alloc((Class)SACommandFailed);
    v18 = [v6 userInfo];
    v19 = [v18 objectForKeyedSubscript:NSLocalizedDescriptionKey];
    id v16 = [v17 initWithReason:v19];

    objc_msgSend(v16, "setErrorCode:", objc_msgSend(v6, "code"));
    goto LABEL_11;
  }
  id v16 = 0;
LABEL_12:

  return v16;
}

- (MobileTimerAssistantAlarmSearch)searchWithAlarms:(id)a3
{
  id v4 = a3;
  v81 = objc_opt_new();
  uint64_t v5 = [(MobileTimerAssistantAlarmSearch *)self sanitizedAlarmLabelForComparison];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v6 = v4;
  v7 = (void *)v5;
  id obj = v6;
  id v8 = [v6 countByEnumeratingWithState:&v91 objects:v97 count:16];
  v80 = (void *)v5;
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v92;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v92 != v10) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        if (MTShouldHandleForEucalyptus() && [v12 isSleepAlarm])
        {
          if (![v12 isSingleTimeAlarm]) {
            goto LABEL_42;
          }
          id v13 = objc_alloc_init((Class)NSDateComponents);
          objc_msgSend(v13, "setMinute:", objc_msgSend(v12, "bedtimeMinute"));
          objc_msgSend(v13, "setHour:", objc_msgSend(v12, "bedtimeHour"));
          objc_msgSend(v13, "setDay:", objc_msgSend(v12, "day"));
          objc_msgSend(v13, "setMonth:", objc_msgSend(v12, "month"));
          objc_msgSend(v13, "setYear:", objc_msgSend(v12, "year"));
          id v14 = +[NSCalendar currentCalendar];
          BOOL v15 = [v14 dateFromComponents:v13];

          id v16 = +[NSDate date];
          id v17 = [v15 compare:v16];

          if (v17 != (id)-1) {
            [v81 addObject:v12];
          }

          continue;
        }
        uint64_t v18 = [(MobileTimerAssistantAlarmSearch *)self identifier];
        if (v18)
        {
          v19 = (void *)v18;
          dispatch_semaphore_t v20 = [(MobileTimerAssistantAlarmSearch *)self identifier];
          id v21 = [v12 alarmURL];
          unsigned int v22 = [v20 isEqual:v21];

          if (!v22) {
            continue;
          }
        }
        uint64_t v23 = [(MobileTimerAssistantAlarmSearch *)self hour];
        if (v23)
        {
          id v24 = (void *)v23;
          v25 = [(MobileTimerAssistantAlarmSearch *)self hour];
          id v26 = [v25 unsignedIntegerValue];
          id v27 = [v12 hour];

          if (v26 != v27) {
            continue;
          }
        }
        uint64_t v28 = [(MobileTimerAssistantAlarmSearch *)self minute];
        if (v28)
        {
          v29 = (void *)v28;
          v30 = [(MobileTimerAssistantAlarmSearch *)self minute];
          id v31 = [v30 unsignedIntegerValue];
          id v32 = [v12 minute];

          if (v31 != v32) {
            continue;
          }
        }
        uint64_t v33 = [(MobileTimerAssistantAlarmSearch *)self enabled];
        if (v33)
        {
          v34 = (void *)v33;
          v35 = [(MobileTimerAssistantAlarmSearch *)self enabled];
          unsigned int v36 = [v35 BOOLValue];
          unsigned int v37 = [v12 isEnabled];

          if (v36 != v37) {
            continue;
          }
        }
        v38 = [(MobileTimerAssistantAlarmSearch *)self frequency];

        if (v38)
        {
          id v39 = [(MobileTimerAssistantAlarmSearch *)self frequency];
          if ([v39 count] != (char *)&dword_0 + 1)
          {

LABEL_26:
            long long v89 = 0u;
            long long v90 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            id v43 = [(MobileTimerAssistantAlarmSearch *)self frequency];
            v44 = (char *)[v43 countByEnumeratingWithState:&v87 objects:v96 count:16];
            if (v44)
            {
              id v45 = v44;
              uint64_t v46 = 0;
              uint64_t v47 = *(void *)v88;
              do
              {
                for (j = 0; j != v45; ++j)
                {
                  if (*(void *)v88 != v47) {
                    objc_enumerationMutation(v43);
                  }
                  unsigned int v49 = SAAlarmDayOfWeekForString();
                  v46 |= MTAlarmRepeatDayFromSAAlarmDayOfWeek(v49);
                }
                id v45 = (char *)[v43 countByEnumeratingWithState:&v87 objects:v96 count:16];
              }
              while (v45);
            }
            else
            {
              uint64_t v46 = 0;
            }

            BOOL v50 = ((unint64_t)[v12 repeatSchedule] & v46) == 0;
            v7 = v80;
            if (v50) {
              continue;
            }
            goto LABEL_36;
          }
          v40 = [(MobileTimerAssistantAlarmSearch *)self frequency];
          id v41 = [v40 objectAtIndexedSubscript:0];
          int v42 = SAAlarmDayOfWeekForString();

          if (v42 != 1) {
            goto LABEL_26;
          }
          if ([v12 repeatSchedule]) {
            continue;
          }
        }
LABEL_36:
        if (v7)
        {
          id v51 = v7;
          v52 = objc_opt_class();
          v53 = [v12 displayTitle];
          v54 = [v52 sanitizeAlarmLabelForComparison:v53];

          if ([&stru_18A80 isEqualToString:v51]
            && [&stru_18A80 isEqualToString:v54])
          {
            v55 = [(MobileTimerAssistantAlarmSearch *)self label];

            uint64_t v56 = [v12 displayTitle];

            v54 = (void *)v56;
          }
          else
          {
            v55 = v51;
          }
          id v57 = [v51 length];
          v58 = +[NSLocale currentLocale];
          id v59 = objc_msgSend(v55, "compare:options:range:locale:", v54, 129, 0, v57, v58);

          if (v59) {
            continue;
          }
        }
LABEL_42:
        [v81 addObject:v12];
        continue;
      }
      id v9 = [obj countByEnumeratingWithState:&v91 objects:v97 count:16];
    }
    while (v9);
  }

  id v60 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v81, "count"));
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v61 = v81;
  id v62 = [v61 countByEnumeratingWithState:&v83 objects:v95 count:16];
  if (v62)
  {
    id v63 = v62;
    uint64_t v64 = *(void *)v84;
    do
    {
      for (k = 0; k != v63; k = (char *)k + 1)
      {
        if (*(void *)v84 != v64) {
          objc_enumerationMutation(v61);
        }
        v66 = *(void **)(*((void *)&v83 + 1) + 8 * (void)k);
        if ([v66 isSleepAlarm])
        {
          id v67 = objc_alloc_init((Class)SAAlarmSleepAlarm);
          v68 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 bedtimeHour]);
          [v67 setBedtimeHour:v68];

          v69 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 bedtimeMinute]);
          [v67 setBedtimeMinute:v69];

          [v67 setIsFiringNext:&__kCFBooleanFalse];
          if (MTShouldHandleForEucalyptus())
          {
            v70 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v66 isSingleTimeAlarm]);
            [v67 setIsOverride:v70];
          }
          else
          {
            [v67 setIsOverride:&__kCFBooleanFalse];
          }
        }
        else
        {
          id v67 = objc_alloc_init((Class)SAAlarmObject);
        }
        v71 = [v66 alarmURL];
        [v67 setIdentifier:v71];

        v72 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 hour]);
        [v67 setHour:v72];

        v73 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 minute]);
        [v67 setMinute:v73];

        v74 = SAAlarmFrequencyFromRepeatSchedule((uint64_t)[v66 repeatSchedule]);
        [v67 setFrequency:v74];

        v75 = [v66 displayTitle];
        [v67 setLabel:v75];

        v76 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v66 isEnabled]);
        [v67 setEnabled:v76];

        v77 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v66 isFiring]);
        [v67 setFiring:v77];

        [v60 addObject:v67];
      }
      id v63 = [v61 countByEnumeratingWithState:&v83 objects:v95 count:16];
    }
    while (v63);
  }

  id v78 = [objc_alloc((Class)SAAlarmSearchCompleted) initWithResults:v60];

  return (MobileTimerAssistantAlarmSearch *)v78;
}

- (id)sanitizedAlarmLabelForComparison
{
  id v3 = objc_opt_class();
  id v4 = [(MobileTimerAssistantAlarmSearch *)self label];
  uint64_t v5 = [v3 sanitizeAlarmLabelForComparison:v4];

  return v5;
}

+ (id)sanitizeAlarmLabelForComparison:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (qword_20708 != -1) {
      dispatch_once(&qword_20708, &stru_187D8);
    }
    id v4 = [v3 componentsSeparatedByCharactersInSet:qword_206F8];
    uint64_t v5 = [v4 componentsJoinedByString:&stru_18A80];

    id v6 = [v5 componentsSeparatedByCharactersInSet:qword_20700];
    v7 = +[NSMutableArray arrayWithArray:v6];

    [v7 removeObject:&stru_18A80];
    id v8 = [v7 componentsJoinedByString:@" "];

    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end