@interface MFLibraryCompressionActivityManager
+ (id)log;
+ (void)_registerLibraryCompression;
+ (void)_unregisterXPCActivity;
+ (void)scheduleLibraryCompressionIfNeeded;
@end

@implementation MFLibraryCompressionActivityManager

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F69C;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BB20 != -1) {
    dispatch_once(&qword_10016BB20, block);
  }
  v2 = (void *)qword_10016BB18;

  return v2;
}

+ (void)scheduleLibraryCompressionIfNeeded
{
  unsigned __int8 v3 = +[MFLibraryCompressor libraryCompressionComplete];
  v4 = +[MFLibraryCompressionActivityManager log];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Library upgrade compression has not been scheduled. (Not needed)", v6, 2u);
    }

    [a1 _unregisterXPCActivity];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Library upgrade compression has been scheduled.", buf, 2u);
    }

    [a1 _registerLibraryCompression];
  }
}

+ (void)_registerLibraryCompression
{
  unsigned __int8 v3 = [MFLibraryCompressor alloc];
  v4 = +[MailAccount allMailboxUids];
  BOOL v5 = [(MFLibraryCompressor *)v3 initWithMailboxUIDs:v4];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006F9E4;
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