@interface MigratorUpdateHistoryTask
- (MigratorUpdateHistoryTask)initWithConfiguration:(id)a3;
- (id)copyConfiguration;
- (id)migratorType;
- (void)main;
@end

@implementation MigratorUpdateHistoryTask

- (MigratorUpdateHistoryTask)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MigratorUpdateHistoryTask;
  return [(MigratorTask *)&v4 initWithConfiguration:a3];
}

- (id)copyConfiguration
{
  v2 = [MigratorConfiguration alloc];
  return sub_1002ECEFC(v2, @"UpdateHistory");
}

- (id)migratorType
{
  return @"UpdateHistory";
}

- (void)main
{
  v3 = sub_1002C924C();
  objc_super v4 = [v3 URLByAppendingPathComponent:@"Documents/AppUpdates.sqlitedb"];
  id v10 = [v4 path];

  v5 = +[NSFileManager defaultManager];
  LODWORD(v4) = [v5 fileExistsAtPath:v10];

  if (v4) {
    sub_1003E8578((uint64_t)self, v10, @"app_updates");
  }
  v6 = sub_1002C924C();
  v7 = [v6 URLByAppendingPathComponent:@"Documents/updates.sqlitedb"];
  v8 = [v7 path];

  v9 = +[NSFileManager defaultManager];
  LODWORD(v7) = [v9 fileExistsAtPath:v8];

  if (v7) {
    sub_1003E8578((uint64_t)self, v8, @"software_update");
  }
}

@end