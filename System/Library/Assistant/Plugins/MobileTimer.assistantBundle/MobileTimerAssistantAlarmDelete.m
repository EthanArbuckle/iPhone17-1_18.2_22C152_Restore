@interface MobileTimerAssistantAlarmDelete
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantAlarmDelete

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_11400(v5);
  }

  [(MobileTimerAssistantAlarmDelete *)self _performWithCompletion:v4];
  v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1137C(v6);
  }
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[MobileTimerAssistantAlarmDelete _performWithCompletion:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@ fetching alarms", buf, 0x16u);
  }

  v6 = objc_opt_new();
  v7 = [v6 alarms];
  objc_initWeak(&location, self);
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v32 = sub_BBC4;
  v33 = sub_BBD4;
  id v34 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_BBDC;
  v25[3] = &unk_18720;
  objc_copyWeak(&v27, &location);
  id v9 = v6;
  id v26 = v9;
  v10 = [v7 flatMap:v25];
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_C384;
  v21 = &unk_18630;
  objc_copyWeak(&v24, &location);
  v23 = buf;
  v11 = v8;
  v22 = v11;
  id v12 = [v10 addSuccessBlock:&v18];
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v13 = MTLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "dictionary", v18, v19, v20, v21);
    sub_114E8((uint64_t)self, v14, v30);
  }

  v15 = [*(id *)(*(void *)&buf[8] + 40) dictionary];
  v4[2](v4, v15);

  v16 = MTLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = [*(id *)(*(void *)&buf[8] + 40) dictionary];
    sub_11484((uint64_t)self, v17, v29);
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v27);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

@end