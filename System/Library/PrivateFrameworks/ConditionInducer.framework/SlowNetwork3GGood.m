@interface SlowNetwork3GGood
+ (id)description;
+ (id)profileFriendlyName;
- (SlowNetwork3GGood)init;
@end

@implementation SlowNetwork3GGood

+ (id)description
{
  return +[SlowNetworkCondition descriptionWithProfileParamsForProfile:@"3G-Good"];
}

+ (id)profileFriendlyName
{
  return @"3G Network - good";
}

- (SlowNetwork3GGood)init
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)SlowNetwork3GGood;
  v2 = [(SlowNetworkCondition *)&v6 initWithProfile:@"3G-Good"];
  if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    v3 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    id v4 = v3;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "%@ Init passed", buf, 0xCu);
  }
  return v2;
}

@end