@interface MFMarkLibraryPurgeableActivityManager
+ (OS_os_log)log;
+ (void)_registerLibraryPurgeableUpgrader;
+ (void)_unregisterXPCActivity;
+ (void)scheduleIfNeeded;
@end

@implementation MFMarkLibraryPurgeableActivityManager

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075E00;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BB88 != -1) {
    dispatch_once(&qword_10016BB88, block);
  }
  v2 = (void *)qword_10016BB80;

  return (OS_os_log *)v2;
}

+ (void)scheduleIfNeeded
{
  unsigned __int8 v3 = +[MFMarkLibraryPurgeableUpgrader isComplete];
  v4 = +[MFMarkLibraryPurgeableActivityManager log];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Library purgeable upgrader has not been scheduled. (Not needed)", v6, 2u);
    }

    [a1 _unregisterXPCActivity];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Library purgeable upgrader has been scheduled.", buf, 2u);
    }

    [a1 _registerLibraryPurgeableUpgrader];
  }
}

+ (void)_registerLibraryPurgeableUpgrader
{
  unsigned __int8 v3 = [MFMarkLibraryPurgeableUpgrader alloc];
  v4 = +[MailAccount allPurgeableMailboxUids];
  BOOL v5 = [(MFMarkLibraryPurgeableUpgrader *)v3 initWithMailboxUIDs:v4];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100076148;
  v8[3] = &unk_10013AF28;
  v9 = v5;
  id v10 = a1;
  v6 = v5;
  v7 = objc_retainBlock(v8);
  ef_xpc_activity_register();
}

+ (void)_unregisterXPCActivity
{
}

@end