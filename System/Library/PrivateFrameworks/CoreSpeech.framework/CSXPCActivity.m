@interface CSXPCActivity
- (void)registerXPCActivities;
@end

@implementation CSXPCActivity

- (void)registerXPCActivities
{
  if (XPC_ACTIVITY_CHECK_IN)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_100110108;
    v2[3] = &unk_100251C70;
    v3 = &stru_100251C48;
    v4 = &stru_100251C08;
    xpc_activity_register("com.apple.siri.xpc_activity.power-logging", XPC_ACTIVITY_CHECK_IN, v2);
  }
  else
  {
    xpc_activity_unregister("com.apple.siri.xpc_activity.power-logging");
  }
}

@end