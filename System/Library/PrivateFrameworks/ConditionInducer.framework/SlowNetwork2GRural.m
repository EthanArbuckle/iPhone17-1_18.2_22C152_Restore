@interface SlowNetwork2GRural
+ (id)description;
+ (id)profileFriendlyName;
- (SlowNetwork2GRural)init;
@end

@implementation SlowNetwork2GRural

+ (id)description
{
  return +[SlowNetworkCondition descriptionWithProfileParamsForProfile:@"2G-Rural"];
}

+ (id)profileFriendlyName
{
  return @"2G Network - poor";
}

- (SlowNetwork2GRural)init
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)SlowNetwork2GRural;
  v2 = [(SlowNetworkCondition *)&v6 initWithProfile:@"2G-Rural"];
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