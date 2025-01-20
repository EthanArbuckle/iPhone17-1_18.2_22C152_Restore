@interface AMSDRefreshMultiUserResult
- (AMSDRefreshMultiUserOptions)options;
- (AMSDRefreshMultiUserResult)initWithHomes:(id)a3 options:(id)a4;
- (BOOL)enabledThrottling;
- (BOOL)isScheduled;
- (NSArray)errors;
- (NSArray)homes;
- (NSString)hashedDescription;
- (void)setEnabledThrottling:(BOOL)a3;
- (void)setErrors:(id)a3;
- (void)setHomes:(id)a3;
- (void)setOptions:(id)a3;
- (void)setScheduled:(BOOL)a3;
@end

@implementation AMSDRefreshMultiUserResult

- (AMSDRefreshMultiUserResult)initWithHomes:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSDRefreshMultiUserResult;
  v9 = [(AMSDRefreshMultiUserResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homes, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (BOOL)enabledThrottling
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if (self->_enabledThrottling)
  {
    unsigned __int8 v2 = [(AMSDRefreshMultiUserResult *)self isScheduled];
    v3 = v7;
  }
  else
  {
    unsigned __int8 v2 = 0;
    v3 = &v6;
  }
  *((unsigned char *)v7 + 24) = v2;
  char v4 = *((unsigned char *)v3 + 24);
  _Block_object_dispose(&v6, 8);
  return v4;
}

- (void)setEnabledThrottling:(BOOL)a3
{
  self->_enabledThrottling = a3;
}

- (NSString)hashedDescription
{
  v3 = +[NSMutableString stringWithFormat:@"<%@: %p> {", objc_opt_class(), self];
  if ([(AMSDRefreshMultiUserResult *)self enabledThrottling]) {
    CFStringRef v4 = @"true";
  }
  else {
    CFStringRef v4 = @"false";
  }
  [v3 appendFormat:@"\n  enabledThrottling = %@", v4];
  v5 = [(AMSDRefreshMultiUserResult *)self errors];
  uint64_t v6 = AMSHashIfNeeded();
  [v3 appendFormat:@"\n  errors = %@", v6];

  if ([(AMSDRefreshMultiUserResult *)self isScheduled]) {
    CFStringRef v7 = @"true";
  }
  else {
    CFStringRef v7 = @"false";
  }
  [v3 appendFormat:@"\n  scheduled = %@", v7];
  uint64_t v8 = [(AMSDRefreshMultiUserResult *)self homes];
  char v9 = AMSHashIfNeeded();
  [v3 appendFormat:@"\n  homes = %@", v9];

  v10 = [(AMSDRefreshMultiUserResult *)self options];
  v11 = AMSHashIfNeeded();
  [v3 appendFormat:@"\n  options = %@", v11];

  [v3 appendString:@"\n}"];
  return (NSString *)v3;
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (NSArray)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
}

- (AMSDRefreshMultiUserOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (BOOL)isScheduled
{
  return self->_scheduled;
}

- (void)setScheduled:(BOOL)a3
{
  self->_scheduled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_homes, 0);
  objc_storeStrong((id *)&self->_errors, 0);
}

@end