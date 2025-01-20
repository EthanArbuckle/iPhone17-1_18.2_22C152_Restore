@interface MobileTimerAssistantAlarmUpdate
- (id)updateAlarm:(id)a3 withModification:(id)a4;
- (id)updateAlarmsWithManager:(id)a3;
- (id)validateCommandArguments;
- (void)_performWithCompletion:(id)a3;
- (void)dealloc;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantAlarmUpdate

- (void)dealloc
{
  v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MobileTimerAssistantAlarmUpdate;
  [(MobileTimerAssistantAlarmUpdate *)&v4 dealloc];
}

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10B74(v5);
  }

  [(MobileTimerAssistantAlarmUpdate *)self _performWithCompletion:v4];
  v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10AF0(v6);
  }
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  v5 = [(MobileTimerAssistantAlarmUpdate *)self validateCommandArguments];
  if (v5)
  {
    v6 = MTLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10CC0();
    }

    v7 = [v5 dictionary];
    v4[2](v4, v7);
  }
  else
  {
    objc_initWeak(&location, self);
    v8 = objc_opt_new();
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = sub_7AAC;
    v32 = sub_7ABC;
    id v33 = 0;
    v10 = [(MobileTimerAssistantAlarmUpdate *)self updateAlarmsWithManager:v8];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_7AC4;
    v24[3] = &unk_18630;
    objc_copyWeak(&v27, &location);
    v26 = &v28;
    v11 = v9;
    v25 = v11;
    id v12 = [v10 addSuccessBlock:v24];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_7C04;
    v20[3] = &unk_18550;
    objc_copyWeak(&v23, &location);
    v22 = &v28;
    v13 = v11;
    v21 = v13;
    id v14 = [v10 addFailureBlock:v20];
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    v15 = MTLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = [(id)v29[5] dictionary];
      sub_10C5C((uint64_t)self, v16, v36);
    }

    v17 = [(id)v29[5] dictionary];
    v4[2](v4, v17);

    v18 = MTLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = [(id)v29[5] dictionary];
      sub_10BF8((uint64_t)self, v19, v35);
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v27);

    _Block_object_dispose(&v28, 8);
    objc_destroyWeak(&location);
  }
}

- (id)validateCommandArguments
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_7AAC;
  v13 = sub_7ABC;
  id v14 = 0;
  v2 = [(MobileTimerAssistantAlarmUpdate *)self modifications];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_7EBC;
  v8[3] = &unk_18680;
  v8[4] = &v15;
  v8[5] = &v9;
  [v2 enumerateObjectsUsingBlock:v8];

  if (*((unsigned char *)v16 + 24))
  {
    id v3 = 0;
  }
  else
  {
    id v4 = objc_alloc((Class)SACommandFailed);
    v5 = [(id)v10[5] userInfo];
    v6 = [v5 objectForKeyedSubscript:NSLocalizedDescriptionKey];
    id v3 = [v4 initWithReason:v6];

    objc_msgSend(v3, "setErrorCode:", objc_msgSend((id)v10[5], "code"));
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v3;
}

- (id)updateAlarmsWithManager:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[MobileTimerAssistantAlarmUpdate updateAlarmsWithManager:]";
    __int16 v15 = 2114;
    v16 = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@ fetching alarms", buf, 0x16u);
  }

  v6 = [v4 alarms];
  objc_initWeak((id *)buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_8530;
  v10[3] = &unk_18720;
  objc_copyWeak(&v12, (id *)buf);
  id v7 = v4;
  id v11 = v7;
  v8 = [v6 flatMap:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

  return v8;
}

- (id)updateAlarm:(id)a3 withModification:(id)a4
{
  id v5 = a4;
  id v6 = [a3 mutableCopy];
  id v7 = [v5 hour];
  BOOL v8 = v7 != 0;

  if (v7)
  {
    uint64_t v9 = [v5 hour];
    objc_msgSend(v6, "setHour:", objc_msgSend(v9, "unsignedIntegerValue"));
  }
  v10 = [v5 minute];

  if (v10)
  {
    id v11 = [v5 minute];
    objc_msgSend(v6, "setMinute:", objc_msgSend(v11, "unsignedIntegerValue"));

    BOOL v8 = 1;
  }
  id v12 = [v5 addedFrequency];

  if (v12)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v13 = [v5 addedFrequency];
    id v14 = (char *)[v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v14)
    {
      __int16 v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v44;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(v13);
          }
          unsigned int v19 = SAAlarmDayOfWeekForString();
          v16 |= MTAlarmRepeatDayFromSAAlarmDayOfWeek(v19);
        }
        __int16 v15 = (char *)[v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v15);
    }
    else
    {
      uint64_t v16 = 0;
    }

    objc_msgSend(v6, "setRepeatSchedule:", (unint64_t)objc_msgSend(v6, "repeatSchedule") | v16);
    BOOL v8 = 1;
  }
  v20 = [v5 removedFrequency];

  if (v20)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v40 = 0u;
    v21 = objc_msgSend(v5, "removedFrequency", 0, 0);
    v22 = (char *)[v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v40;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          unsigned int v26 = SAAlarmDayOfWeekForString();
          uint64_t v27 = MTAlarmRepeatDayFromSAAlarmDayOfWeek(v26);
        }
        uint64_t v28 = v27;
        id v23 = (char *)[v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v23);
      uint64_t v29 = ~v28;
    }
    else
    {
      uint64_t v29 = -1;
    }

    objc_msgSend(v6, "setRepeatSchedule:", (unint64_t)objc_msgSend(v6, "repeatSchedule") & v29);
    BOOL v8 = 1;
  }
  uint64_t v30 = [v5 label];

  if (v30)
  {
    v31 = [v5 label];
    [v6 setTitle:v31];

LABEL_30:
    v32 = [v5 enabled];
    if (v32)
    {
      id v33 = [v5 enabled];
      objc_msgSend(v6, "setEnabled:", objc_msgSend(v33, "BOOLValue"));
    }
    else
    {
      [v6 setEnabled:1];
    }

    goto LABEL_34;
  }
  if (v8) {
    goto LABEL_30;
  }
  v35 = [v5 enabled];

  if (v35)
  {
    v36 = [v5 enabled];
    id v37 = [v36 BOOLValue];

    [v6 setEnabled:v37];
    v38 = &kMTCASiriAlarmDeactivations;
    if (v37) {
      v38 = &kMTCASiriAlarmActivations;
    }
    +[MTAnalytics incrementEventCount:*v38];
  }
LABEL_34:

  return v6;
}

@end