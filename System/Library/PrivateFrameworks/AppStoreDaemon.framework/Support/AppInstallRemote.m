@interface AppInstallRemote
+ (Class)databaseEntityClass;
@end

@implementation AppInstallRemote

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

@end