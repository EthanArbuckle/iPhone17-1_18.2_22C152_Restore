@interface MigratorTestFlightFeedbackTask
- (MigratorTestFlightFeedbackTask)initWithConfiguration:(id)a3;
- (id)copyConfiguration;
- (id)migratorType;
- (void)main;
@end

@implementation MigratorTestFlightFeedbackTask

- (MigratorTestFlightFeedbackTask)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MigratorTestFlightFeedbackTask;
  return [(MigratorTask *)&v4 initWithConfiguration:a3];
}

- (id)copyConfiguration
{
  v2 = [MigratorConfiguration alloc];
  return sub_1002ECEFC(v2, @"TestFlightFeedback");
}

- (id)migratorType
{
  return @"TestFlightFeedback";
}

- (void)main
{
  v2 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Performing test flight feedback migration", v5, 2u);
  }

  v3 = [[KeepAlive alloc] initWithName:@"com.apple.migrator.TestFlightFeedback"];
  objc_super v4 = sub_1002705B4();
  sub_100273C2C((uint64_t)v4);
}

@end