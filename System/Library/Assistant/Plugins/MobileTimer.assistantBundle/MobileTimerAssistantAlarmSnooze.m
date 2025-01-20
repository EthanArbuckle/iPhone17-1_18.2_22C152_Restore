@interface MobileTimerAssistantAlarmSnooze
- (id)_alarmManager;
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantAlarmSnooze

- (id)_alarmManager
{
  v2 = objc_opt_new();

  return v2;
}

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10330(v5);
  }

  [(MobileTimerAssistantAlarmSnooze *)self _performWithCompletion:v4];
  v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_102AC(v6);
  }
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  v5 = [(MobileTimerAssistantAlarmSnooze *)self description];
  v6 = [(MobileTimerAssistantAlarmSnooze *)self alarmIds];
  if ([v6 count])
  {
    v7 = [(MobileTimerAssistantAlarmSnooze *)self _alarmManager];
    v8 = MTLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[MobileTimerAssistantAlarmSnooze _performWithCompletion:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ fetching alarms", buf, 0x16u);
    }

    if (MTShouldHandleForEucalyptus()) {
      [v7 alarmsIncludingSleepAlarm:1];
    }
    else {
    v11 = [v7 alarms];
    }
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v41 = sub_5384;
    v42 = sub_5394;
    id v43 = 0;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_539C;
    v34[3] = &unk_18450;
    id v13 = v5;
    id v35 = v13;
    id v36 = v6;
    id v14 = v7;
    id v37 = v14;
    v15 = [v11 flatMap:v34];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_5A3C;
    v30[3] = &unk_184B8;
    id v16 = v13;
    id v31 = v16;
    v33 = buf;
    v17 = v12;
    v32 = v17;
    id v18 = [v15 addSuccessBlock:v30];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_5C28;
    v26[3] = &unk_184E0;
    id v27 = v16;
    v29 = buf;
    v19 = v17;
    v28 = v19;
    id v20 = [v15 addFailureBlock:v26];
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    if (v4)
    {
      v21 = MTLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = [*(id *)(*(void *)&buf[8] + 40) dictionary];
        sub_10418((uint64_t)self, v22, v39);
      }

      v23 = [*(id *)(*(void *)&buf[8] + 40) dictionary];
      v4[2](v4, v23);

      v24 = MTLogForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v25 = [*(id *)(*(void *)&buf[8] + 40) dictionary];
        sub_103B4((uint64_t)self, v25, v38);
      }
    }
    +[MTAnalytics incrementEventCount:kMTCASiriAlarmSnoozes];

    _Block_object_dispose(buf, 8);
  }
  else if (v4)
  {
    id v9 = [objc_alloc((Class)SACommandFailed) initWithReason:@"No alarm ID is provided."];
    [v9 setErrorCode:1];
    v10 = [v9 dictionary];
    v4[2](v4, v10);
  }
}

@end