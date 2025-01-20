@interface _CNCPPhoneNumberUtilitiesFacade
+ (NSString)currentCountryCode;
+ (NSString)homeCountryCode;
+ (id)triage_log;
+ (void)currentCountryCode;
+ (void)homeCountryCode;
@end

@implementation _CNCPPhoneNumberUtilitiesFacade

+ (NSString)homeCountryCode
{
  v2 = (void *)CPPhoneNumberCopyHomeCountryCode();
  if ([v2 isEqualToString:@"001"])
  {
    v3 = objc_msgSend((id)objc_opt_class(), "triage_log");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[_CNCPPhoneNumberUtilitiesFacade homeCountryCode];
    }

    v2 = 0;
  }

  return (NSString *)v2;
}

+ (NSString)currentCountryCode
{
  v2 = (void *)CPPhoneNumberCopyNetworkCountryCode();
  if ([v2 isEqualToString:@"001"])
  {
    v3 = objc_msgSend((id)objc_opt_class(), "triage_log");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[_CNCPPhoneNumberUtilitiesFacade currentCountryCode];
    }

    v2 = 0;
  }

  return (NSString *)v2;
}

+ (id)triage_log
{
  os_log_t v2 = os_log_create("com.apple.contacts", "triage");

  return v2;
}

+ (void)homeCountryCode
{
}

+ (void)currentCountryCode
{
}

@end