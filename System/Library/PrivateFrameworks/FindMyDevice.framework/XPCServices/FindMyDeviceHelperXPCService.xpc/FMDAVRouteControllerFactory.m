@interface FMDAVRouteControllerFactory
+ (BOOL)isAutomationActive;
+ (id)routeController;
@end

@implementation FMDAVRouteControllerFactory

+ (BOOL)isAutomationActive
{
  if (qword_100027690 != -1) {
    dispatch_once(&qword_100027690, &stru_10001CFE8);
  }
  v2 = sub_10000CD44();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = byte_100027688;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMDAutomationAVRouteController: isAutomationActive: %d", (uint8_t *)v4, 8u);
  }

  return byte_100027688;
}

+ (id)routeController
{
  if (+[FMDAVRouteControllerFactory isAutomationActive])
  {
    v2 = +[FMDAutomationHelperFactory sharedFactory];
    id v3 = [v2 automationHelperClassWithName:@"FMDAutomationAVRouteController"];

    v4 = sub_10000CD44();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDAVRouteController: switching to automation", buf, 2u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006D28;
    block[3] = &unk_10001D008;
    block[4] = v3;
    if (qword_1000276A0 != -1) {
      dispatch_once(&qword_1000276A0, block);
    }
  }
  else
  {
    v5 = objc_alloc_init(FMDAVRouteController);
    v6 = (void *)qword_100027698;
    qword_100027698 = (uint64_t)v5;
  }
  v7 = (void *)qword_100027698;

  return v7;
}

@end