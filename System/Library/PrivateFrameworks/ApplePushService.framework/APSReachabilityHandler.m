@interface APSReachabilityHandler
- (APSReachabilityHandler)initWithReachabilityHost:(id)a3 reachabilityBlock:(id)a4;
- (BOOL)pendingReachabilityChange;
- (NSString)reachabilityHost;
- (__SCNetworkReachability)connectionReachability;
- (double)lastReachabilityChangeHandled;
- (id)description;
- (id)reachabilityBlock;
- (unsigned)currentFlags;
- (unsigned)lastReachabilityFlags;
- (void)disable;
- (void)enable;
- (void)noteReachabilityChange:(unsigned int)a3;
- (void)raiseReachabilityChange;
- (void)setConnectionReachability:(__SCNetworkReachability *)a3;
- (void)setLastReachabilityChangeHandled:(double)a3;
- (void)setLastReachabilityFlags:(unsigned int)a3;
- (void)setPendingReachabilityChange:(BOOL)a3;
- (void)setReachabilityBlock:(id)a3;
- (void)setReachabilityHost:(id)a3;
@end

@implementation APSReachabilityHandler

- (APSReachabilityHandler)initWithReachabilityHost:(id)a3 reachabilityBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)APSReachabilityHandler;
  v9 = [(APSReachabilityHandler *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reachabilityHost, a3);
    id v11 = objc_retainBlock(v8);
    id reachabilityBlock = v10->_reachabilityBlock;
    v10->_id reachabilityBlock = v11;
  }
  return v10;
}

- (unsigned)currentFlags
{
  SCNetworkReachabilityFlags flags = 0;
  SCNetworkReachabilityGetFlags(self->_connectionReachability, &flags);
  return flags;
}

- (void)enable
{
  if (!self->_connectionReachability)
  {
    v3 = SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, [(NSString *)self->_reachabilityHost UTF8String]);
    self->_connectionReachability = v3;
    v6.version = 0;
    memset(&v6.retain, 0, 24);
    v6.info = self;
    SCNetworkReachabilitySetCallback(v3, (SCNetworkReachabilityCallBack)sub_1000796C4, &v6);
    connectionReachability = self->_connectionReachability;
    v5 = +[NSRunLoop currentRunLoop];
    SCNetworkReachabilityScheduleWithRunLoop(connectionReachability, (CFRunLoopRef)[v5 getCFRunLoop], (CFStringRef)NSDefaultRunLoopMode);

    SCNetworkReachabilityGetFlags(self->_connectionReachability, &self->_lastReachabilityFlags);
  }
}

- (void)disable
{
  connectionReachability = self->_connectionReachability;
  if (connectionReachability)
  {
    v4 = +[NSRunLoop currentRunLoop];
    SCNetworkReachabilityUnscheduleFromRunLoop(connectionReachability, (CFRunLoopRef)[v4 getCFRunLoop], (CFStringRef)NSDefaultRunLoopMode);

    CFRelease(self->_connectionReachability);
    self->_connectionReachability = 0;
  }
}

- (void)raiseReachabilityChange
{
  SCNetworkReachabilityFlags flags = 0;
  self->_pendingReachabilityChange = 0;
  SCNetworkReachabilityGetFlags(self->_connectionReachability, &flags);
  [(APSReachabilityHandler *)self noteReachabilityChange:flags];
}

- (void)noteReachabilityChange:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  unsigned int lastReachabilityFlags = self->_lastReachabilityFlags;
  id v8 = +[APSLog courier];
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (lastReachabilityFlags == v3)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      v18 = self;
      __int16 v19 = 1024;
      int v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: network reachability hasn't changed, still 0x%02x", buf, 0x12u);
    }
  }
  else
  {
    if (v9)
    {
      unsigned int v10 = self->_lastReachabilityFlags;
      *(_DWORD *)buf = 138412802;
      v18 = self;
      __int16 v19 = 1024;
      int v20 = v3;
      __int16 v21 = 1024;
      unsigned int v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: network reachability changed to 0x%02x (from 0x%02x)", buf, 0x18u);
    }

    self->_unsigned int lastReachabilityFlags = v3;
  }
  if (self->_pendingReachabilityChange)
  {
    id v11 = +[APSLog courier];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = self;
      __int16 v19 = 1024;
      int v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: Rate limiting network reachability change events, ignoring 0x%02x", buf, 0x12u);
    }
  }
  else
  {
    double v12 = v6 - self->_lastReachabilityChangeHandled;
    if (v12 >= 3.0 || v12 < 0.0)
    {
      self->_lastReachabilityChangeHandled = v6;
      v15 = [(APSReachabilityHandler *)self reachabilityBlock];
      v15[2](v15, v3);
    }
    else
    {
      v13 = +[APSLog courier];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: Rate limiting network reachability change events, rescheduling event", buf, 0xCu);
      }

      self->_pendingReachabilityChange = 1;
      dispatch_time_t v14 = dispatch_time(0, 3000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100079A4C;
      block[3] = &unk_10012A5E0;
      block[4] = self;
      dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@:%p host:%@>", objc_opt_class(), self, self->_reachabilityHost];
}

- (__SCNetworkReachability)connectionReachability
{
  return self->_connectionReachability;
}

- (void)setConnectionReachability:(__SCNetworkReachability *)a3
{
  self->_connectionReachability = a3;
}

- (unsigned)lastReachabilityFlags
{
  return self->_lastReachabilityFlags;
}

- (void)setLastReachabilityFlags:(unsigned int)a3
{
  self->_unsigned int lastReachabilityFlags = a3;
}

- (BOOL)pendingReachabilityChange
{
  return self->_pendingReachabilityChange;
}

- (void)setPendingReachabilityChange:(BOOL)a3
{
  self->_pendingReachabilityChange = a3;
}

- (double)lastReachabilityChangeHandled
{
  return self->_lastReachabilityChangeHandled;
}

- (void)setLastReachabilityChangeHandled:(double)a3
{
  self->_lastReachabilityChangeHandled = a3;
}

- (NSString)reachabilityHost
{
  return self->_reachabilityHost;
}

- (void)setReachabilityHost:(id)a3
{
}

- (id)reachabilityBlock
{
  return self->_reachabilityBlock;
}

- (void)setReachabilityBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reachabilityBlock, 0);
  objc_storeStrong((id *)&self->_reachabilityHost, 0);
}

@end