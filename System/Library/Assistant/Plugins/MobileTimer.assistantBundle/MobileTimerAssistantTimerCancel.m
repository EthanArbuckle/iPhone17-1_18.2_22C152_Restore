@interface MobileTimerAssistantTimerCancel
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantTimerCancel

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_11938(v5);
  }

  [(MobileTimerAssistantTimerCancel *)self _performWithCompletion:v4];
  v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_118B4(v6);
  }
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching timer", (uint8_t *)&buf, 0xCu);
  }

  v6 = objc_opt_new();
  v7 = [v6 currentTimer];
  objc_initWeak(&location, self);
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x3032000000;
  v36 = sub_D84C;
  v37 = sub_D85C;
  id v38 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_D864;
  v28[3] = &unk_185A0;
  objc_copyWeak(&v30, &location);
  id v9 = v6;
  id v29 = v9;
  v10 = [v7 flatMap:v28];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_DA94;
  v24[3] = &unk_185C8;
  objc_copyWeak(&v27, &location);
  p_long long buf = &buf;
  v11 = v8;
  v25 = v11;
  id v12 = [v10 addSuccessBlock:v24];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_DB7C;
  v20[3] = &unk_18550;
  objc_copyWeak(&v23, &location);
  v22 = &buf;
  v13 = v11;
  v21 = v13;
  id v14 = [v10 addFailureBlock:v20];
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  v15 = MTLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = [*(id *)(*((void *)&buf + 1) + 40) dictionary];
    sub_11A20((uint64_t)self, v16, v33);
  }

  v17 = [*(id *)(*((void *)&buf + 1) + 40) dictionary];
  v4[2](v4, v17);

  v18 = MTLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = [*(id *)(*((void *)&buf + 1) + 40) dictionary];
    sub_119BC((uint64_t)self, v19, v32);
  }

  +[MTAnalytics incrementEventCount:kMTCASiriTimerCancels];
  objc_destroyWeak(&v23);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v30);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
}

@end