@interface FMDAVRouteControllerFactory
+ (BOOL)isAutomationActive;
+ (id)routeController;
@end

@implementation FMDAVRouteControllerFactory

+ (BOOL)isAutomationActive
{
  if (qword_10002D6D0 != -1) {
    dispatch_once(&qword_10002D6D0, &stru_100021098);
  }
  v2 = sub_100006668();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = byte_10002D6C8;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMDAutomationAVRouteController: isAutomationActive: %d", (uint8_t *)v4, 8u);
  }

  return byte_10002D6C8;
}

+ (id)routeController
{
  if (+[FMDAVRouteControllerFactory isAutomationActive])
  {
    v2 = +[FMDAutomationHelperFactory sharedFactory];
    id v3 = [v2 automationHelperClassWithName:@"FMDAutomationAVRouteController"];

    v4 = sub_100006668();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDAVRouteController: switching to automation", buf, 2u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005DE8;
    block[3] = &unk_1000210B8;
    block[4] = v3;
    if (qword_10002D6E0 != -1) {
      dispatch_once(&qword_10002D6E0, block);
    }
  }
  else
  {
    v5 = objc_alloc_init(FMDAVRouteController);
    v6 = (void *)qword_10002D6D8;
    qword_10002D6D8 = (uint64_t)v5;
  }
  v7 = (void *)qword_10002D6D8;

  return v7;
}

@end