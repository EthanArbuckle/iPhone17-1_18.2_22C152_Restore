@interface AppInstallRemoteEntity
+ (id)databaseTable;
@end

@implementation AppInstallRemoteEntity

+ (id)databaseTable
{
  return @"app_install_remote";
}

@end