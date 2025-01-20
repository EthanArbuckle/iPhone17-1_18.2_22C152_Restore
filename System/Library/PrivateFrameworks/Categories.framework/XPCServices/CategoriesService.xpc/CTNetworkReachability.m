@interface CTNetworkReachability
+ (BOOL)_isReachableWithFlags:(unsigned int)a3;
+ (BOOL)networkReachable;
+ (BOOL)networkReachableWithTargetURL:(id)a3;
@end

@implementation CTNetworkReachability

+ (BOOL)networkReachable
{
  v2 = objc_opt_class();
  v3 = +[NSURL URLWithString:@"http://www.apple.com"];
  LOBYTE(v2) = [v2 networkReachableWithTargetURL:v3];

  return (char)v2;
}

+ (BOOL)networkReachableWithTargetURL:(id)a3
{
  id v3 = [a3 host];
  SCNetworkReachabilityRef v4 = SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, (const char *)[v3 UTF8String]);

  SCNetworkReachabilityFlags flags = 0;
  if (SCNetworkReachabilityGetFlags(v4, &flags))
  {
    unsigned __int8 v5 = [(id)objc_opt_class() _isReachableWithFlags:flags];
    if (v4) {
LABEL_3:
    }
      CFRelease(v4);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100007860();
    }
    unsigned __int8 v5 = 0;
    if (v4) {
      goto LABEL_3;
    }
  }
  return v5;
}

+ (BOOL)_isReachableWithFlags:(unsigned int)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "_isReachableWithFlags %d", (uint8_t *)v7, 8u);
  }
  BOOL v4 = (a3 & 0x28) != 0 && (a3 & 0x10) == 0;
  BOOL v5 = (a3 & 4) == 0 || v4;
  return (a3 & 2) != 0 && v5;
}

@end