@interface UNNotification(HealthKit)
- (id)wd_url;
- (id)wd_userInfo;
- (uint64_t)wd_domain;
@end

@implementation UNNotification(HealthKit)

- (uint64_t)wd_domain
{
  v1 = objc_msgSend(a1, "wd_userInfo");
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x263F0ADA8]];

  uint64_t v3 = [v2 integerValue];
  return v3;
}

- (id)wd_url
{
  v1 = NSURL;
  v2 = objc_msgSend(a1, "wd_userInfo");
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F0ADB0]];
  v4 = [v1 URLWithString:v3];

  return v4;
}

- (id)wd_userInfo
{
  v1 = [a1 request];
  v2 = [v1 content];
  uint64_t v3 = [v2 userInfo];

  return v3;
}

@end