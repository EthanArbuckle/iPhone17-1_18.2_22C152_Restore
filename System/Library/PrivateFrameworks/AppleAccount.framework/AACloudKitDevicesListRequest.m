@interface AACloudKitDevicesListRequest
+ (Class)responseClass;
- (id)urlString;
@end

@implementation AACloudKitDevicesListRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 cloudKitDevicesListURL];

  return v3;
}

@end