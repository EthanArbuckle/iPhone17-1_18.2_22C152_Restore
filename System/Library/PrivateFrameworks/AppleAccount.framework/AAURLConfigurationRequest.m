@interface AAURLConfigurationRequest
+ (Class)responseClass;
- (id)urlRequest;
- (id)urlString;
@end

@implementation AAURLConfigurationRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v2 = (void *)CFPreferencesCopyAppValue(@"ConfigurationPlistURL", @"com.apple.appleaccount");
  v3 = v2;
  if (!v2 || [v2 isEqualToString:&stru_1EF456870])
  {
    v4 = (void *)CFPreferencesCopyAppValue(@"ConfigurationDomain", @"com.apple.appleaccount");
    v5 = v4;
    if (v4 && ([v4 isEqualToString:&stru_1EF456870] & 1) == 0) {
      v6 = v5;
    }
    else {
      v6 = @"icloud.com";
    }
    uint64_t v7 = [NSString stringWithFormat:@"https://setup.%@/configurations/init", v6];

    v3 = (void *)v7;
  }
  v8 = [v3 stringByAppendingString:@"?context=settings"];

  return v8;
}

- (id)urlRequest
{
  v5.receiver = self;
  v5.super_class = (Class)AAURLConfigurationRequest;
  v2 = [(AARequest *)&v5 urlRequest];
  v3 = (void *)[v2 mutableCopy];

  objc_msgSend(v3, "aa_addMultiUserDeviceHeaderIfEnabled");

  return v3;
}

@end