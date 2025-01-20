@interface IDSOffGridConnectionMonitor
- (BOOL)isConnectionSuitableForIMLOverStewie;
- (BOOL)isDeviceOnline;
- (BOOL)isIMLActive;
- (BOOL)isIMLAvailable;
- (CTStewieStateMonitor)stewieConnectionMonitor;
- (IDSOffGridConnectionMonitor)init;
- (IMNetworkConnectionMonitor)networkConnectionMonitor;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (void)setNetworkConnectionMonitor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStewieConnectionMonitor:(id)a3;
@end

@implementation IDSOffGridConnectionMonitor

- (IDSOffGridConnectionMonitor)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)IDSOffGridConnectionMonitor;
  v2 = [(IDSOffGridConnectionMonitor *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ids.connectionMonitor.ct", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_msgSend(objc_alloc((Class)MEMORY[0x192FDF3E0](@"CTStewieStateMonitor", @"CoreTelephony")), "initWithDelegate:queue:", v2, v2->_queue);
    stewieConnectionMonitor = v2->_stewieConnectionMonitor;
    v2->_stewieConnectionMonitor = (CTStewieStateMonitor *)v7;

    int v9 = [(CTStewieStateMonitor *)v2->_stewieConnectionMonitor start];
    v10 = [MEMORY[0x1E4F6B460] IDSOffGridStateManager];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = @"NO";
      v12 = v2->_stewieConnectionMonitor;
      if (v9) {
        v11 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v18 = v11;
      __int16 v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Started stewie connection monitor %@ %@", buf, 0x16u);
    }

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F6C398]) initWithRemoteHost:0 delegate:v2];
    networkConnectionMonitor = v2->_networkConnectionMonitor;
    v2->_networkConnectionMonitor = (IMNetworkConnectionMonitor *)v13;
  }
  return v2;
}

- (BOOL)isConnectionSuitableForIMLOverStewie
{
  if ([(IDSOffGridConnectionMonitor *)self isDeviceOnline]) {
    return 0;
  }

  return [(IDSOffGridConnectionMonitor *)self isIMLActive];
}

- (BOOL)isIMLAvailable
{
  v2 = [(CTStewieStateMonitor *)self->_stewieConnectionMonitor getState];
  char v3 = [v2 isAllowedService:16];

  return v3;
}

- (BOOL)isIMLActive
{
  v2 = [(CTStewieStateMonitor *)self->_stewieConnectionMonitor getState];
  char v3 = [v2 isActiveService:16];

  return v3;
}

- (BOOL)isDeviceOnline
{
  return MEMORY[0x1F4181798](self->_networkConnectionMonitor, sel_isImmediatelyReachable);
}

- (NSString)description
{
  char v3 = NSString;
  if ([(IDSOffGridConnectionMonitor *)self isIMLAvailable]) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  if ([(IDSOffGridConnectionMonitor *)self isIMLActive]) {
    dispatch_queue_t v5 = @"YES";
  }
  else {
    dispatch_queue_t v5 = @"NO";
  }
  return (NSString *)[v3 stringWithFormat:@"<IDSOffGridConnectionMonitor %p>: isIMLAvailable %@, isIMLActive %@>", self, v4, v5];
}

- (IMNetworkConnectionMonitor)networkConnectionMonitor
{
  return self->_networkConnectionMonitor;
}

- (void)setNetworkConnectionMonitor:(id)a3
{
}

- (CTStewieStateMonitor)stewieConnectionMonitor
{
  return self->_stewieConnectionMonitor;
}

- (void)setStewieConnectionMonitor:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_stewieConnectionMonitor, 0);

  objc_storeStrong((id *)&self->_networkConnectionMonitor, 0);
}

@end