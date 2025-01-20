@interface BackboneNetworkMonitor
- (BOOL)isConnected;
- (NSString)interfaceName;
- (NSString)mBackhaulName;
- (OS_dispatch_queue)monitorQueue;
- (OS_nw_path_monitor)monitor;
- (const)getInterfaceName;
- (void)setInterfaceName:(id)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setMBackhaulName:(id)a3;
- (void)setMonitor:(id)a3;
- (void)setMonitorQueue:(id)a3;
- (void)startNetworkMonitoring;
- (void)stopNetworkMonitoring;
@end

@implementation BackboneNetworkMonitor

- (void)startNetworkMonitoring
{
  nw_path_monitor_t v4 = nw_path_monitor_create();
  [(BackboneNetworkMonitor *)self setMonitor:v4];

  v5 = [(BackboneNetworkMonitor *)self monitor];
  nw_path_monitor_prohibit_interface_type(v5, nw_interface_type_other);

  v6 = [(BackboneNetworkMonitor *)self monitor];
  v7 = [(BackboneNetworkMonitor *)self monitorQueue];
  nw_path_monitor_set_queue(v6, v7);

  v8 = [(BackboneNetworkMonitor *)self monitor];
  update_handler[0] = _NSConcreteStackBlock;
  update_handler[1] = 3221225472;
  update_handler[2] = __48__BackboneNetworkMonitor_startNetworkMonitoring__block_invoke;
  update_handler[3] = &unk_100495560;
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(v8, update_handler);

  v9 = [(BackboneNetworkMonitor *)self monitor];
  nw_path_monitor_start(v9);
}

void __48__BackboneNetworkMonitor_startNetworkMonitoring__block_invoke(uint64_t a1, void *a2)
{
  path = a2;
  v3 = nw_path_copy_interface();
  name = nw_interface_get_name(v3);
  if (name)
  {
    v5 = name;
    v6 = +[NSString stringWithUTF8String:name];
    v7 = [*(id *)(a1 + 32) interfaceName];
    if ([v7 length])
    {
      v8 = [*(id *)(a1 + 32) interfaceName];
      unsigned __int8 v9 = [v6 isEqualToString:v8];

      if ((v9 & 1) == 0)
      {
        v10 = [*(id *)(a1 + 32) interfaceName];
        NSLog(@"BackboneInterfaceNetworkMonitor:Backbone interface was switched, old intf = %@, new intf = %@\n. Clean up the old interface", v10, v6);

        if ([*(id *)(a1 + 32) isConnected]) {
          [*(id *)(a1 + 32) stopTimeAndCalculateCurrentDuration];
        }
        [*(id *)(a1 + 32) setIsConnected:0];
        id v11 = [*(id *)(a1 + 32) interfaceName];
        updateInterfaceName([v11 UTF8String], objc_msgSend(*(id *)(a1 + 32), "isConnected"), 1);

        if (v3)
        {
          unsigned __int8 type = nw_interface_get_type(v3);
        }
        else
        {
          NSLog(@"BackboneInterfaceNetworkMonitor:%s interface is NULL\n", "-[BackboneNetworkMonitor startNetworkMonitoring]_block_invoke");
          unsigned __int8 type = 0;
        }
        [*(id *)(a1 + 32) setInterfaceNameEnum:type];
      }
    }
    else
    {
    }
    v13 = +[NSString stringWithUTF8String:v5];
    [*(id *)(a1 + 32) setInterfaceName:v13];

    if (nw_path_get_status(path) == nw_path_status_satisfied)
    {
      NSLog(@"BackboneInterfaceNetworkMonitor:%s interface: %s... is connected\n", "-[BackboneNetworkMonitor startNetworkMonitoring]_block_invoke", v5);
      if (([*(id *)(a1 + 32) isConnected] & 1) == 0)
      {
        [*(id *)(a1 + 32) stopTimeAndCalculateCurrentDuration];
        updateInterfaceName(v5, [*(id *)(a1 + 32) isConnected], 0);
        if (v3)
        {
          unsigned __int8 v14 = nw_interface_get_type(v3);
        }
        else
        {
          NSLog(@"BackboneInterfaceNetworkMonitor:%s interface is NULL\n", "-[BackboneNetworkMonitor startNetworkMonitoring]_block_invoke");
          unsigned __int8 v14 = 0;
        }
        [*(id *)(a1 + 32) setInterfaceNameEnum:v14];
        if (!strcmp(v5, "ir0")) {
          [*(id *)(a1 + 32) setInterfaceNameEnum:5];
        }
        [*(id *)(a1 + 32) startTimeAndGetCurrentDimension];
      }
      [*(id *)(a1 + 32) setIsConnected:1];
      updateInterfaceName(v5, [*(id *)(a1 + 32) isConnected], 0);
    }
    else
    {
      NSLog(@"BackboneInterfaceNetworkMonitor:%s interface: %s... is disconnected\n", "-[BackboneNetworkMonitor startNetworkMonitoring]_block_invoke", v5);
      if ([*(id *)(a1 + 32) isConnected]) {
        [*(id *)(a1 + 32) stopTimeAndCalculateCurrentDuration];
      }
      [*(id *)(a1 + 32) setIsConnected:0];
      updateInterfaceName(v5, [*(id *)(a1 + 32) isConnected], 0);
      if (v3)
      {
        unsigned __int8 v15 = nw_interface_get_type(v3);
      }
      else
      {
        NSLog(@"BackboneInterfaceNetworkMonitor:%s interface is NULL\n", "-[BackboneNetworkMonitor startNetworkMonitoring]_block_invoke");
        unsigned __int8 v15 = 0;
      }
      [*(id *)(a1 + 32) setInterfaceNameEnum:v15];
    }
  }
  else
  {
    NSLog(@"BackboneInterfaceNetworkMonitor:name is NULL\n");
    if ([*(id *)(a1 + 32) isConnected])
    {
      NSLog(@"BackboneInterfaceNetworkMonitor:name is NULL, previously connected interface is now disconnected\n");
      [*(id *)(a1 + 32) stopTimeAndCalculateCurrentDuration];
      [*(id *)(a1 + 32) setIsConnected:0];
      updateInterfaceName(0, [*(id *)(a1 + 32) isConnected], 0);
      [*(id *)(a1 + 32) setInterfaceNameEnum:0];
    }
  }
}

- (void)stopNetworkMonitoring
{
  nw_path_monitor_t v4 = [(BackboneNetworkMonitor *)self monitor];

  if (v4)
  {
    v5 = [(BackboneNetworkMonitor *)self monitor];
    nw_path_monitor_cancel(v5);
  }
  [(BackboneNetworkMonitor *)self setMonitor:0];
}

- (const)getInterfaceName
{
  id v2 = [(BackboneNetworkMonitor *)self interfaceName];
  v3 = (const char *)[v2 cStringUsingEncoding:4];

  return v3;
}

- (OS_nw_path_monitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
}

- (OS_dispatch_queue)monitorQueue
{
  return self->_monitorQueue;
}

- (void)setMonitorQueue:(id)a3
{
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (NSString)interfaceName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInterfaceName:(id)a3
{
}

- (NSString)mBackhaulName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMBackhaulName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mBackhaulName, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_monitorQueue, 0);

  objc_storeStrong((id *)&self->_monitor, 0);
}

@end