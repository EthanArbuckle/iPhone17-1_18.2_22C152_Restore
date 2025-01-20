@interface ConnectionInfo
- (BOOL)onCellular;
- (ConnectionInfo)init;
- (NSString)connectionType;
- (void)dealloc;
- (void)reachabilityCallback:(id)a3;
@end

@implementation ConnectionInfo

- (ConnectionInfo)init
{
  v11.receiver = self;
  v11.super_class = (Class)ConnectionInfo;
  v2 = [(ConnectionInfo *)&v11 init];
  if (v2)
  {
    sockaddr address = (sockaddr)xmmword_100003120;
    v3 = SCNetworkReachabilityCreateWithAddress(0, &address);
    v2->_reachabilityRef = v3;
    context.version = 0;
    context.info = v2;
    context.retain = 0;
    context.release = 0;
    context.copyDescription = (CFStringRef (__cdecl *)(const void *))&CFCopyDescription;
    SCNetworkReachabilitySetCallback(v3, (SCNetworkReachabilityCallBack)sub_100001818, &context);
    reachabilityRef = v2->_reachabilityRef;
    Main = CFRunLoopGetMain();
    if (!SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, Main, kCFRunLoopDefaultMode)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to schedule reachability monitor", (uint8_t *)&v9, 2u);
    }
    SCNetworkReachabilityFlags v9 = 0;
    if (SCNetworkReachabilityGetFlags(v2->_reachabilityRef, &v9))
    {
      if ((v9 & 0x40000) != 0) {
        CFStringRef v6 = @"cellular";
      }
      else {
        CFStringRef v6 = @"wifi";
      }
      if ((v9 & 6) == 2) {
        CFStringRef v7 = v6;
      }
      else {
        CFStringRef v7 = @"<none>";
      }
      [(ConnectionInfo *)v2 reachabilityCallback:v7];
    }
  }
  return v2;
}

- (void)dealloc
{
  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef) {
    CFRelease(reachabilityRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)ConnectionInfo;
  [(ConnectionInfo *)&v4 dealloc];
}

- (BOOL)onCellular
{
  return [(NSString *)self->_connectionType isEqualToString:@"cellular"];
}

- (void)reachabilityCallback:(id)a3
{
}

- (NSString)connectionType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end