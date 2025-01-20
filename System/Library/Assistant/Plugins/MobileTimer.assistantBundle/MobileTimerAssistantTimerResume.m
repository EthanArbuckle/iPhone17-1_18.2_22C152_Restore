@interface MobileTimerAssistantTimerResume
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantTimerResume

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_12224(v5);
  }

  [(MobileTimerAssistantTimerResume *)self _performWithCompletion:v4];
  v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_121A0(v6);
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
  uint64_t v39 = 0x3032000000;
  v40 = sub_FB28;
  v41 = sub_FB38;
  id v42 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_FB28;
  v33[4] = sub_FB38;
  id v34 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_FB40;
  v29[3] = &unk_18938;
  objc_copyWeak(&v32, &location);
  v31 = v33;
  id v9 = v6;
  id v30 = v9;
  v10 = [v7 flatMap:v29];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_FD94;
  v24[3] = &unk_18960;
  objc_copyWeak(&v28, &location);
  v26 = v33;
  p_long long buf = &buf;
  v11 = v8;
  v25 = v11;
  id v12 = [v10 addSuccessBlock:v24];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_FEC0;
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
    sub_1230C((uint64_t)self, v16, v37);
  }

  v17 = [*(id *)(*((void *)&buf + 1) + 40) dictionary];
  v4[2](v4, v17);

  v18 = MTLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = [*(id *)(*((void *)&buf + 1) + 40) dictionary];
    sub_122A8((uint64_t)self, v19, v36);
  }

  +[MTAnalytics incrementEventCount:kMTCASiriTimerResumes];
  objc_destroyWeak(&v23);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v32);
  _Block_object_dispose(v33, 8);

  _Block_object_dispose(&buf, 8);
  objc_destroyWeak(&location);
}

@end