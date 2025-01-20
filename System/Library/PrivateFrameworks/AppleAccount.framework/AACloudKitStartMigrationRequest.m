@interface AACloudKitStartMigrationRequest
+ (Class)responseClass;
- (id)urlString;
@end

@implementation AACloudKitStartMigrationRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 cloudKitStartMigrationURL];

  return v3;
}

@end