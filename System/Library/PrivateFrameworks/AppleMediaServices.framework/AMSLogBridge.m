@interface AMSLogBridge
+ (id)amsLogConfigWithCategory:(int64_t)a3;
- (_TtC18AppleMediaServices12AMSLogBridge)init;
@end

@implementation AMSLogBridge

+ (id)amsLogConfigWithCategory:(int64_t)a3
{
  id v3 = static AMSLogBridge.amsLogConfig(category:)(a3);
  return v3;
}

- (_TtC18AppleMediaServices12AMSLogBridge)init
{
  return (_TtC18AppleMediaServices12AMSLogBridge *)AMSLogBridge.init()();
}

@end