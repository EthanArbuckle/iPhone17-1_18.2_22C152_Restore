@interface MigratorValidateAppleIDsTask
- (MigratorValidateAppleIDsTask)initWithConfiguration:(id)a3;
- (id)copyConfiguration;
- (id)migratorType;
- (void)main;
@end

@implementation MigratorValidateAppleIDsTask

- (MigratorValidateAppleIDsTask)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MigratorValidateAppleIDsTask;
  return [(MigratorTask *)&v4 initWithConfiguration:a3];
}

- (id)copyConfiguration
{
  v2 = [MigratorConfiguration alloc];
  return sub_1002ECEFC(v2, @"ValidateAppleIDs");
}

- (id)migratorType
{
  return @"ValidateAppleIDs";
}

- (void)main
{
  v3 = objc_opt_new();
  uint64_t v6 = 0;
  unsigned int v4 = [(Task *)self runSubTask:v3 returningError:&v6];

  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ValidateAppleIDsTask complete with result: %d", buf, 8u);
  }
}

@end