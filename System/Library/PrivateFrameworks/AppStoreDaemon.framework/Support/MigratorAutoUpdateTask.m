@interface MigratorAutoUpdateTask
- (MigratorAutoUpdateTask)initWithConfiguration:(id)a3;
- (id)copyConfiguration;
- (id)migratorType;
- (void)main;
@end

@implementation MigratorAutoUpdateTask

- (MigratorAutoUpdateTask)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MigratorAutoUpdateTask;
  return [(MigratorTask *)&v4 initWithConfiguration:a3];
}

- (id)copyConfiguration
{
  v2 = [MigratorConfiguration alloc];
  return sub_1002ECEFC(v2, @"AutomaticUpdates");
}

- (id)migratorType
{
  return @"AutomaticUpdates";
}

- (void)main
{
  id v2 = +[UpdatesManager sharedManager];
  [v2 setupFollowingMigration];
}

@end