@interface DMFFetchInstalledCertificatesRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (id)permittedPlatforms;
@end

@implementation DMFFetchInstalledCertificatesRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB7A8;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

@end