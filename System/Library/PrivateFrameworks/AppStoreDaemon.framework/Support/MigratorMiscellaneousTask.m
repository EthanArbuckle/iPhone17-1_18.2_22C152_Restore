@interface MigratorMiscellaneousTask
- (MigratorMiscellaneousTask)initWithConfiguration:(id)a3;
- (id)copyConfiguration;
- (id)migratorType;
- (void)main;
@end

@implementation MigratorMiscellaneousTask

- (MigratorMiscellaneousTask)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MigratorMiscellaneousTask;
  return [(MigratorTask *)&v4 initWithConfiguration:a3];
}

- (id)copyConfiguration
{
  v2 = [MigratorConfiguration alloc];
  return sub_1002ECEFC(v2, @"Miscellaneous");
}

- (id)migratorType
{
  return @"Miscellaneous";
}

- (void)main
{
  v2 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Performing miscellaneous migration", v7, 2u);
  }

  sub_1003F3550();
  sub_1003F37CC((uint64_t)AppDefaultsManager, 0);
  sub_10021A338();
  v3 = sub_100420D50();
  sub_1004218B4((uint64_t)v3);

  objc_super v4 = objc_alloc_init(_TtC9appstored6LogKey);
  v5 = sub_100013C18();
  sub_10023D028((uint64_t)v5, v4);

  v6 = sub_1002D7CE8();
  sub_1002D8164((uint64_t)v6);
}

@end