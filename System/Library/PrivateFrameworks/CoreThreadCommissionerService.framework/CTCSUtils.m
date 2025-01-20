@interface CTCSUtils
- (BOOL)ctcsCheckIfUIBuild;
- (BOOL)ctcsUtilIsCHIPEnabled;
- (BOOL)ctcsUtilIsThreadCommissioningEnabled;
- (CTCSUtils)init;
@end

@implementation CTCSUtils

- (CTCSUtils)init
{
  v3.receiver = self;
  v3.super_class = (Class)CTCSUtils;
  return [(CTCSUtils *)&v3 init];
}

- (BOOL)ctcsCheckIfUIBuild
{
  if (qword_10007D618 != -1) {
    dispatch_once(&qword_10007D618, &stru_100074918);
  }
  return byte_10007D610;
}

- (BOOL)ctcsUtilIsCHIPEnabled
{
  return 1;
}

- (BOOL)ctcsUtilIsThreadCommissioningEnabled
{
  return _os_feature_enabled_impl();
}

@end