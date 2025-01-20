@interface CHCWorkloop
+ (OS_dispatch_queue)sharedDaemonWorkloop;
+ (id)serialQueueTargetingSharedWorkloop:(id)a3;
+ (id)serialQueueTargetingSharedWorkloop:(id)a3 withQoS:(unsigned int)a4;
@end

@implementation CHCWorkloop

+ (id)serialQueueTargetingSharedWorkloop:(id)a3
{
  v3 = (const char *)[a3 UTF8String];
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = +[CHCWorkloop sharedDaemonWorkloop];
  dispatch_queue_t v6 = dispatch_queue_create_with_target_V2(v3, v4, v5);

  return v6;
}

+ (OS_dispatch_queue)sharedDaemonWorkloop
{
  if (sharedDaemonWorkloop_onceToken != -1) {
    dispatch_once(&sharedDaemonWorkloop_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedDaemonWorkloop_workloop;

  return (OS_dispatch_queue *)v2;
}

void __35__CHCWorkloop_sharedDaemonWorkloop__block_invoke()
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("com.apple.chrono.daemon_workloop");
  v1 = (void *)sharedDaemonWorkloop_workloop;
  sharedDaemonWorkloop_workloop = (uint64_t)inactive;

  dispatch_workloop_set_autorelease_frequency((dispatch_workloop_t)sharedDaemonWorkloop_workloop, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_set_qos_class_fallback();
  v2 = sharedDaemonWorkloop_workloop;

  dispatch_activate(v2);
}

+ (id)serialQueueTargetingSharedWorkloop:(id)a3 withQoS:(unsigned int)a4
{
  v5 = (const char *)[a3 UTF8String];
  dispatch_queue_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = dispatch_queue_attr_make_with_qos_class(v6, (dispatch_qos_class_t)a4, 0);
  v8 = +[CHCWorkloop sharedDaemonWorkloop];
  dispatch_queue_t v9 = dispatch_queue_create_with_target_V2(v5, v7, v8);

  return v9;
}

@end