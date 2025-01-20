@interface SBSRemoteContentHostInterfaceShim
+ (void)getContentBoundsWithBlock:(id)a3 interface:(id)a4;
@end

@implementation SBSRemoteContentHostInterfaceShim

+ (void)getContentBoundsWithBlock:(id)a3 interface:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[LockScreenViewController] calling getContentBoundsWithReplyBlock from ObjC shim...", buf, 2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000103DC;
  v9[3] = &unk_100014F60;
  id v10 = v5;
  id v8 = v5;
  [v6 getContentBoundsWithReplyBlock:v9];
}

@end