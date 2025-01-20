@interface FAPushDetailRequest
+ (Class)responseClass;
- (NSDictionary)pushPayload;
- (id)urlRequest;
- (id)urlString;
- (void)setPushPayload:(id)a3;
@end

@implementation FAPushDetailRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 getFamilyPushDetailsURL];

  return v3;
}

- (id)urlRequest
{
  v11.receiver = self;
  v11.super_class = (Class)FAPushDetailRequest;
  v3 = [(FAPushDetailRequest *)&v11 urlRequest];
  id v4 = [v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  id v5 = [(NSDictionary *)self->_pushPayload mutableCopy];
  [v5 removeObjectForKey:@"aps"];
  id v10 = 0;
  v6 = +[NSJSONSerialization dataWithJSONObject:v5 options:0 error:&v10];
  id v7 = v10;
  if (v7)
  {
    v8 = _FALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100034F7C((uint64_t)v7, (uint64_t)v5, v8);
    }
  }
  else
  {
    [v4 setHTTPBody:v6];
  }
  [v4 addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

  return v4;
}

- (NSDictionary)pushPayload
{
  return self->_pushPayload;
}

- (void)setPushPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end