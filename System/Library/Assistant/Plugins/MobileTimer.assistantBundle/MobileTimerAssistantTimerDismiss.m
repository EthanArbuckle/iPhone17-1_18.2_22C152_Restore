@interface MobileTimerAssistantTimerDismiss
- (id)_timerManager;
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantTimerDismiss

- (id)_timerManager
{
  v2 = objc_opt_new();

  return v2;
}

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_11C08(v5);
  }

  [(MobileTimerAssistantTimerDismiss *)self _performWithCompletion:v4];
  v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_11B84(v6);
  }
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  v5 = [(MobileTimerAssistantTimerDismiss *)self description];
  v6 = [(MobileTimerAssistantTimerDismiss *)self timerIds];
  if ([v6 count])
  {
    v7 = MTLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching timers", (uint8_t *)&buf, 0xCu);
    }

    v8 = [(MobileTimerAssistantTimerDismiss *)self _timerManager];
    v9 = [v8 timers];
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v44 = 0x3032000000;
    v45 = sub_E164;
    v46 = sub_E174;
    id v47 = 0;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_E17C;
    v37[3] = &unk_188F0;
    v37[4] = self;
    id v38 = v6;
    id v11 = v5;
    id v39 = v11;
    id v12 = v8;
    id v40 = v12;
    v13 = [v9 flatMap:v37];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_E830;
    v33[3] = &unk_184B8;
    id v14 = v11;
    id v34 = v14;
    p_long long buf = &buf;
    v15 = v10;
    v35 = v15;
    id v16 = [v13 addSuccessBlock:v33];
    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    v28 = sub_EA1C;
    v29 = &unk_184E0;
    id v30 = v14;
    v32 = &buf;
    v17 = v15;
    v31 = v17;
    id v18 = [v13 addFailureBlock:&v26];
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    v19 = MTLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "dictionary", v26, v27, v28, v29, v30);
      sub_11CF0((uint64_t)self, v20, v42);
    }

    v21 = [*(id *)(*((void *)&buf + 1) + 40) dictionary];
    v4[2](v4, v21);

    v22 = MTLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = [*(id *)(*((void *)&buf + 1) + 40) dictionary];
      sub_11C8C((uint64_t)self, v23, v41);
    }

    +[MTAnalytics incrementEventCount:kMTCASiriTimerDismisses];
    _Block_object_dispose(&buf, 8);
  }
  else if (v4)
  {
    id v24 = [objc_alloc((Class)SACommandFailed) initWithReason:@"No timer ID is provided."];
    [v24 setErrorCode:1];
    v25 = [v24 dictionary];
    v4[2](v4, v25);
  }
}

@end