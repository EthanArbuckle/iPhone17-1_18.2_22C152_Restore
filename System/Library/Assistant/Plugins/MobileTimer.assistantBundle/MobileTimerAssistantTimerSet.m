@interface MobileTimerAssistantTimerSet
- (id)validateCommandArguments;
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantTimerSet

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1091C(v5);
  }

  [(MobileTimerAssistantTimerSet *)self _performWithCompletion:v4];
  v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10898(v6);
  }
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  v5 = [(MobileTimerAssistantTimerSet *)self validateCommandArguments];
  v6 = MTLogForCategory();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10A68((uint64_t)self, (uint64_t)v5, v7);
    }

    id v8 = [v5 dictionary];
    v4[2](v4, v8);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching timer", (uint8_t *)&buf, 0xCu);
    }

    v9 = objc_opt_new();
    v21 = [v9 currentTimer];
    objc_initWeak(&location, self);
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v37 = 0x3032000000;
    v38 = sub_6F44;
    v39 = sub_6F54;
    id v40 = 0;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_6F5C;
    v30[3] = &unk_185A0;
    objc_copyWeak(&v32, &location);
    id v8 = v9;
    id v31 = v8;
    v11 = [v21 flatMap:v30];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_71C8;
    v26[3] = &unk_185C8;
    objc_copyWeak(&v29, &location);
    p_long long buf = &buf;
    v12 = v10;
    v27 = v12;
    id v13 = [v11 addSuccessBlock:v26];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_72B0;
    v22[3] = &unk_18550;
    objc_copyWeak(&v25, &location);
    v24 = &buf;
    v14 = v12;
    v23 = v14;
    id v15 = [v11 addFailureBlock:v22];
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    v16 = MTLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = [*(id *)(*((void *)&buf + 1) + 40) dictionary];
      sub_10A04((uint64_t)self, v17, v35);
    }

    v18 = [*(id *)(*((void *)&buf + 1) + 40) dictionary];
    v4[2](v4, v18);

    v19 = MTLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = [*(id *)(*((void *)&buf + 1) + 40) dictionary];
      sub_109A0((uint64_t)self, v20, v34);
    }

    +[MTAnalytics incrementEventCount:kMTCASiriTimerSets];
    objc_destroyWeak(&v25);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v32);
    _Block_object_dispose(&buf, 8);

    objc_destroyWeak(&location);
  }
}

- (id)validateCommandArguments
{
  v3 = [(MobileTimerAssistantTimerSet *)self timer];
  id v4 = [v3 state];
  unsigned __int8 v5 = [v4 isEqualToString:SATimerStateUndefinedValue];

  if ((v5 & 1) == 0)
  {
    v6 = [(MobileTimerAssistantTimerSet *)self timer];
    v7 = [v6 state];
    NSLog(@"Unexpected timer state: %@", v7);
  }
  id v8 = [(MobileTimerAssistantTimerSet *)self timer];
  v9 = [v8 timerValue];

  if (!v9) {
    goto LABEL_7;
  }
  dispatch_semaphore_t v10 = [(MobileTimerAssistantTimerSet *)self timer];
  v11 = [v10 timerValue];
  id v12 = [v11 integerValue];
  double v13 = (double)(uint64_t)v12;

  if ((uint64_t)v12 < 86400)
  {
    if ((uint64_t)v12 <= 0)
    {
      +[NSString stringWithFormat:@"SATimerSet.timer.timerValue: Duration must be greater than 0. Value = %f", *(void *)&v13, v18, v19, v20];
      goto LABEL_9;
    }
LABEL_7:
    id v15 = 0;
    goto LABEL_10;
  }
  double v14 = v13 - (double)(unint64_t)(v13 / 3600.0) * 3600.0;
  +[NSString stringWithFormat:@"SATimerSet.timer.timerValue: Duration must be less than 24 hours. Value = %f (%ld:%02ld:%02ld)", *(void *)&v13, (unint64_t)(v13 / 3600.0), (unint64_t)(v14 / 60.0), (unint64_t)(v14 - (double)(unint64_t)(v14 / 60.0) * 60.0)];
  v16 = LABEL_9:;
  id v15 = [objc_alloc((Class)SACommandFailed) initWithReason:v16];

LABEL_10:

  return v15;
}

@end