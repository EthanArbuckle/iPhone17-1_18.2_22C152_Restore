@interface BRNWPathMonitorWrapper
+ (BOOL)pathHasDNS:(id)a3;
+ (id)createPathMonitorWithQueue:(id)a3 changeHandler:(id)a4;
+ (int)getStatusOfPath:(id)a3;
+ (void)cancelPathMonitor:(id)a3;
@end

@implementation BRNWPathMonitorWrapper

+ (id)createPathMonitorWithQueue:(id)a3 changeHandler:(id)a4
{
  id v5 = a4;
  v6 = a3;
  v7 = nw_path_monitor_create();
  nw_path_monitor_set_queue(v7, v6);

  nw_path_monitor_set_update_handler(v7, v5);
  nw_path_monitor_start(v7);

  return v7;
}

+ (int)getStatusOfPath:(id)a3
{
  return nw_path_get_status((nw_path_t)a3);
}

+ (BOOL)pathHasDNS:(id)a3
{
  return nw_path_has_dns((nw_path_t)a3);
}

+ (void)cancelPathMonitor:(id)a3
{
}

@end