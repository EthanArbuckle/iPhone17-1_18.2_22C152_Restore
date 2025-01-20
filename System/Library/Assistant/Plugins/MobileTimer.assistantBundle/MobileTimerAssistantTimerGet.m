@interface MobileTimerAssistantTimerGet
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantTimerGet

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_111A8(v5);
  }

  [(MobileTimerAssistantTimerGet *)self _performWithCompletion:v4];
  v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_11124(v6);
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
  uint64_t v30 = 0x3032000000;
  v31 = sub_ABB0;
  v32 = sub_ABC0;
  id v33 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_ABC8;
  v22[3] = &unk_18800;
  objc_copyWeak(&v25, &location);
  p_long long buf = &buf;
  v9 = v8;
  v23 = v9;
  id v10 = [v7 addSuccessBlock:v22];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_ACFC;
  v18[3] = &unk_18550;
  objc_copyWeak(&v21, &location);
  v20 = &buf;
  v11 = v9;
  v19 = v11;
  id v12 = [v7 addFailureBlock:v18];
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v13 = MTLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = [*(id *)(*((void *)&buf + 1) + 40) dictionary];
    sub_11290((uint64_t)self, v14, v28);
  }

  v15 = [*(id *)(*((void *)&buf + 1) + 40) dictionary];
  v4[2](v4, v15);

  v16 = MTLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = [*(id *)(*((void *)&buf + 1) + 40) dictionary];
    sub_1122C((uint64_t)self, v17, v27);
  }

  +[MTAnalytics incrementEventCount:kMTCASiriTimerSearches];
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v25);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
}

@end