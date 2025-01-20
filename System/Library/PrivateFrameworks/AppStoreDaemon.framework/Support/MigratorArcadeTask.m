@interface MigratorArcadeTask
- (MigratorArcadeTask)initWithConfiguration:(id)a3;
- (id)copyConfiguration;
- (id)migratorType;
- (void)main;
@end

@implementation MigratorArcadeTask

- (MigratorArcadeTask)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MigratorArcadeTask;
  return [(MigratorTask *)&v4 initWithConfiguration:a3];
}

- (id)copyConfiguration
{
  v2 = [MigratorConfiguration alloc];
  return sub_1002ECEFC(v2, @"Arcade");
}

- (id)migratorType
{
  return @"Arcade";
}

- (void)main
{
  v2 = objc_alloc_init(_TtC9appstored6LogKey);
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    v22 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%@] Performing arcade migration", (uint8_t *)&v21, 0xCu);
  }

  objc_super v4 = sub_10037B958();
  sub_10038009C((uint64_t)v4, @"Migration");

  uint64_t v5 = sub_10020E0BC();
  v6 = (void *)v5;
  if (v5) {
    sub_10020F654(v5, 5, @"Migration", 1, 0);
  }

  uint64_t v7 = sub_10020E0BC();
  v8 = (void *)v7;
  if (v7) {
    sub_10020F654(v7, 1, @"Migration", 1, 0);
  }

  uint64_t v9 = sub_10020E0BC();
  v10 = (void *)v9;
  if (v9) {
    sub_10020F654(v9, 2, @"Migration", 1, 0);
  }

  uint64_t v11 = sub_10020E0BC();
  v12 = (void *)v11;
  if (v11) {
    sub_10020F654(v11, 7, @"Migration", 1, 0);
  }

  v13 = +[ACAccountStore ams_sharedAccountStore];
  v14 = objc_msgSend(v13, "ams_activeiTunesAccount");

  if (v14)
  {
    v15 = +[KatanaSubscriptionCoordinator shared];
    unsigned int v16 = [v15 migrateSubscriptionStateWithAccount:v14 logKey:v2];

    v17 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412546;
      v22 = v2;
      __int16 v23 = 1024;
      unsigned int v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%@] Migrated arcade subscription state with result: %{BOOL}d", (uint8_t *)&v21, 0x12u);
    }
  }
  v18 = +[KatanaSubscriptionCoordinator shared];
  unsigned int v19 = [v18 removeStaleSubscriptionInfoWithLogKey:v2];

  v20 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    int v21 = 138412546;
    v22 = v2;
    __int16 v23 = 1024;
    unsigned int v24 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%@] Cleaned up subscription state with result: %{BOOL}d", (uint8_t *)&v21, 0x12u);
  }
}

@end