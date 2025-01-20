@interface ImportJobsForDemotedAppsTask
- (ImportJobsForDemotedAppsTask)init;
- (void)main;
@end

@implementation ImportJobsForDemotedAppsTask

- (ImportJobsForDemotedAppsTask)init
{
  return (ImportJobsForDemotedAppsTask *)sub_1002AD490(self, 0);
}

- (void)main
{
  v3 = objc_alloc_init(_TtC9appstored6LogKey);
  v4 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    bundleIDs = self->_bundleIDs;
    id v7 = v5;
    v8 = [(NSArray *)bundleIDs componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v3;
    *(_WORD *)&buf[22] = 2114;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Checking for demoted placeholders for bundleIDs: [%{public}@]", buf, 0x20u);
  }
  +[NSMutableArray array];
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_1002AD868;
  v21 = &unk_100525810;
  v22 = self;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v23 = v9;
  v10 = &v18;
  if (self)
  {
    v11 = +[LSDatabaseContext sharedDatabaseContext];
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1002ADC38;
    v25 = &unk_100525860;
    v26 = self;
    v27 = v10;
    [v11 accessUsingBlock:buf];
  }
  if ([v9 count])
  {
    v12 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v9 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Hydrating apps: [%{public}@]", buf, 0xCu);
    }
    v14 = sub_1002B3410();
    sub_1002B53E8((uint64_t)v14, v9);

    if (self) {
      self->super._success = 1;
    }
  }
  v15 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v3;
    id v17 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@] Check for demoted placeholders complete", buf, 0x16u);
  }
}

- (void).cxx_destruct
{
}

@end