@interface IMConnectionMonitor
+ (IMConnectionMonitor)alloc;
- (BOOL)isDataConnectionActive;
- (BOOL)isImmediatelyReachable;
- (BOOL)requiresDataConnectionActivation;
- (IMConnectionMonitor)initWithRemoteHost:(id)a3 delegate:(id)a4;
- (IMConnectionMonitorDelegate)delegate;
- (NSString)remoteHost;
- (void)setDelegate:(id)a3;
@end

@implementation IMConnectionMonitor

+ (IMConnectionMonitor)alloc
{
  if ((id)objc_opt_class() == a1)
  {
    return (IMConnectionMonitor *)[IMNetworkConnectionMonitor alloc];
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___IMConnectionMonitor;
    return (IMConnectionMonitor *)objc_msgSendSuper2(&v4, sel_alloc);
  }
}

- (IMConnectionMonitor)initWithRemoteHost:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IMConnectionMonitor;
  v11 = [(IMConnectionMonitor *)&v18 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    remoteHost = v11->_remoteHost;
    v11->_remoteHost = (NSString *)v12;

    objc_storeWeak((id *)&v11->_delegate, v7);
    objc_msgSend__setup(v11, v14, v15, v16);
  }

  return v11;
}

- (BOOL)isDataConnectionActive
{
  return 1;
}

- (BOOL)requiresDataConnectionActivation
{
  return 0;
}

- (BOOL)isImmediatelyReachable
{
  return 0;
}

- (NSString)remoteHost
{
  return self->_remoteHost;
}

- (IMConnectionMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IMConnectionMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteHost, 0);
}

@end