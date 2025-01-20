@interface MigratorTask
- (MigratorTask)initWithConfiguration:(id)a3;
- (NSString)migratorType;
- (id)copyConfiguration;
- (void)main;
@end

@implementation MigratorTask

- (MigratorTask)initWithConfiguration:(id)a3
{
  return [(Task *)self initWithoutKeepAlive];
}

- (id)copyConfiguration
{
  return 0;
}

- (NSString)migratorType
{
  return 0;
}

- (void)main
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[KeepAlive keepAliveWithFormat:@"com.apple.appstored.%@", v4];

  v6.receiver = self;
  v6.super_class = (Class)MigratorTask;
  [(MigratorTask *)&v6 main];
}

- (void).cxx_destruct
{
}

@end