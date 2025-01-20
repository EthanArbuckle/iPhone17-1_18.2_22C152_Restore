@interface MobileTimerAssistantAlarmCreate
- (id)validateCommandArguments;
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantAlarmCreate

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1067C(v5);
  }

  [(MobileTimerAssistantAlarmCreate *)self _performWithCompletion:v4];
  v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_105F8(v6);
  }
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  v52 = [(MobileTimerAssistantAlarmCreate *)self validateCommandArguments];
  if (v52)
  {
    v5 = MTLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_107C8();
    }

    v6 = [v52 dictionary];
    v4[2](v4, v6);
    goto LABEL_34;
  }
  v6 = [(MobileTimerAssistantAlarmCreate *)self alarmToCreate];
  v7 = objc_opt_new();
  v8 = [v6 relativeOffsetMinutes];

  if (v8)
  {
    id v9 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    v10 = +[NSTimeZone defaultTimeZone];
    [v9 setTimeZone:v10];

    id v11 = objc_alloc_init((Class)NSDateComponents);
    v12 = [v6 relativeOffsetMinutes];
    objc_msgSend(v11, "setMinute:", objc_msgSend(v12, "unsignedIntValue"));

    if ((uint64_t)[v11 minute] <= 4) {
      [v11 setSecond:40];
    }
    v13 = +[NSDate date];
    v14 = [v9 dateByAddingComponents:v11 toDate:v13 options:0];

    v15 = [v9 components:96 fromDate:v14];
    objc_msgSend(v7, "setHour:", objc_msgSend(v15, "hour"));
    objc_msgSend(v7, "setMinute:", objc_msgSend(v15, "minute"));
  }
  else
  {
    v16 = [v6 hour];

    if (v16)
    {
      v17 = [v6 hour];
      objc_msgSend(v7, "setHour:", objc_msgSend(v17, "unsignedIntValue"));
    }
    v18 = [v6 minute];

    if (!v18) {
      goto LABEL_14;
    }
    id v9 = [v6 minute];
    objc_msgSend(v7, "setMinute:", objc_msgSend(v9, "unsignedIntValue"));
  }

LABEL_14:
  v19 = [v6 frequency];

  if (v19)
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v20 = [v6 frequency];
    uint64_t v21 = 0;
    v22 = (char *)[v20 countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v64;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(void *)v64 != v23) {
            objc_enumerationMutation(v20);
          }
          unsigned int v25 = SAAlarmDayOfWeekForString();
          v21 |= MTAlarmRepeatDayFromSAAlarmDayOfWeek(v25);
        }
        v22 = (char *)[v20 countByEnumeratingWithState:&v63 objects:v73 count:16];
      }
      while (v22);
    }

    [v7 setRepeatSchedule:v21];
  }
  v26 = [v6 label];
  BOOL v27 = v26 == 0;

  if (!v27)
  {
    v28 = [v6 label];
    [v7 setTitle:v28];
  }
  v29 = [v7 sound];
  unsigned int v30 = [v29 isSilent];

  if (v30)
  {
    v31 = +[TLToneManager sharedToneManager];
    v32 = [v31 defaultToneIdentifierForAlertType:13];

    v33 = [v7 sound];
    v34 = [v33 vibrationIdentifier];
    v35 = [v7 sound];
    v36 = [v35 soundVolume];
    v37 = +[MTSound toneSoundWithIdentifier:v32 vibrationIdentifer:v34 volume:v36];

    [v7 setSound:v37];
  }
  v51 = objc_opt_new();
  v38 = MTLogForCategory();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ adding alarm: %{public}@", buf, 0x16u);
  }

  v39 = [v51 addAlarm:v7];
  objc_initWeak(&location, self);
  dispatch_semaphore_t v40 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v70 = sub_6588;
  v71 = sub_6598;
  id v72 = 0;
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_65A0;
  v57[3] = &unk_18528;
  objc_copyWeak(&v61, &location);
  id v41 = v7;
  id v58 = v41;
  v60 = buf;
  v42 = v40;
  v59 = v42;
  id v43 = [v39 addSuccessBlock:v57];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_66D0;
  v53[3] = &unk_18550;
  objc_copyWeak(&v56, &location);
  v55 = buf;
  v44 = v42;
  v54 = v44;
  id v45 = [v39 addFailureBlock:v53];
  dispatch_semaphore_wait(v44, 0xFFFFFFFFFFFFFFFFLL);
  v46 = MTLogForCategory();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    v47 = [*(id *)(*(void *)&buf[8] + 40) dictionary];
    sub_10764((uint64_t)self, v47, v68);
  }

  v48 = [*(id *)(*(void *)&buf[8] + 40) dictionary];
  v4[2](v4, v48);

  v49 = MTLogForCategory();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    v50 = [*(id *)(*(void *)&buf[8] + 40) dictionary];
    sub_10700((uint64_t)self, v50, v67);
  }

  objc_destroyWeak(&v56);
  objc_destroyWeak(&v61);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
LABEL_34:
}

- (id)validateCommandArguments
{
  v2 = [(MobileTimerAssistantAlarmCreate *)self alarmToCreate];
  id v3 = [v2 relativeOffsetMinutes];

  if (v3)
  {
    id v4 = [v2 relativeOffsetMinutes];
    id v28 = 0;
    int v5 = MTValidateAlarmRelativeOffsetMinutes((unint64_t)[v4 unsignedIntegerValue], &v28);
    id v3 = v28;

    id v6 = v3;
    if (!v5) {
      goto LABEL_12;
    }
  }
  v7 = [v2 hour];

  if (v7)
  {
    v8 = [v2 hour];
    id v27 = v3;
    BOOL v9 = MTValidateAlarmHour((unint64_t)[v8 unsignedIntegerValue], &v27);
    id v6 = v27;

    id v3 = v6;
    if (!v9) {
      goto LABEL_12;
    }
  }
  v10 = [v2 minute];

  if (v10)
  {
    id v11 = [v2 minute];
    id v26 = v3;
    BOOL v12 = MTValidateAlarmMinute((unint64_t)[v11 unsignedIntegerValue], &v26);
    id v6 = v26;

    id v3 = v6;
    if (!v12) {
      goto LABEL_12;
    }
  }
  v13 = [v2 frequency];

  if (v13)
  {
    v14 = [v2 frequency];
    id v25 = v3;
    int v15 = MTValidateAlarmFrequency(v14, &v25);
    id v6 = v25;

    id v3 = v6;
    if (!v15) {
      goto LABEL_12;
    }
  }
  v16 = [v2 label];

  if (v16)
  {
    v17 = [v2 label];
    id v24 = v3;
    BOOL v18 = MTValidateAlarmLabel(v17, &v24);
    id v6 = v24;

    if (v18)
    {
      id v19 = 0;
LABEL_13:
      id v3 = v6;
      goto LABEL_14;
    }
LABEL_12:
    id v20 = objc_alloc((Class)SACommandFailed);
    uint64_t v21 = [v6 userInfo];
    v22 = [v21 objectForKeyedSubscript:NSLocalizedDescriptionKey];
    id v19 = [v20 initWithReason:v22];

    objc_msgSend(v19, "setErrorCode:", objc_msgSend(v6, "code"));
    goto LABEL_13;
  }
  id v19 = 0;
LABEL_14:

  return v19;
}

@end