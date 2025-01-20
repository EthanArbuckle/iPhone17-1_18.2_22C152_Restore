@interface SlowNetwork100PctLoss
+ (id)description;
+ (id)profileFriendlyName;
- (SlowNetwork100PctLoss)init;
@end

@implementation SlowNetwork100PctLoss

+ (id)description
{
  return +[SlowNetworkCondition descriptionWithProfileParamsForProfile:@"100% Loss"];
}

+ (id)profileFriendlyName
{
  return @"100% packet loss";
}

- (SlowNetwork100PctLoss)init
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)SlowNetwork100PctLoss;
  v2 = [(SlowNetworkCondition *)&v6 initWithProfile:@"100% Loss"];
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