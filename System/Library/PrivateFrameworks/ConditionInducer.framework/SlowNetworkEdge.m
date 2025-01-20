@interface SlowNetworkEdge
+ (id)description;
+ (id)profileFriendlyName;
- (SlowNetworkEdge)init;
@end

@implementation SlowNetworkEdge

+ (id)description
{
  return +[SlowNetworkCondition descriptionWithProfileParamsForProfile:@"Edge"];
}

+ (id)profileFriendlyName
{
  return @"Edge Network - best";
}

- (SlowNetworkEdge)init
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)SlowNetworkEdge;
  v2 = [(SlowNetworkCondition *)&v6 initWithProfile:@"Edge"];
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