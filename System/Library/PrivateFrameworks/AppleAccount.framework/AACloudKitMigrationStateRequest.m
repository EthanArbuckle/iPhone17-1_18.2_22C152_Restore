@interface AACloudKitMigrationStateRequest
+ (Class)responseClass;
- (id)urlString;
@end

@implementation AACloudKitMigrationStateRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 cloudKitMigrationStateURL];

  return v3;
}

@end