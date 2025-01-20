@interface _ANEStorageMaintainer
+ (void)initialize;
- (void)purgeDanglingModelsAt:(id)a3 withReply:(id)a4;
@end

@implementation _ANEStorageMaintainer

+ (void)initialize
{
  qword_100042EC8 = +[_ANELog maintenance];
  _objc_release_x1();
}

- (void)purgeDanglingModelsAt:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, BOOL))a4;
  v8 = (void *)qword_100042EC8;
  if (os_log_type_enabled((os_log_t)qword_100042EC8, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = NSStringFromSelector(a2);
    int v16 = 138412546;
    v17 = v10;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@: START: pathURL=%@", (uint8_t *)&v16, 0x16u);
  }
  BOOL v11 = +[_ANEStorageHelper garbageCollectDanglingModelsAtPath:v6];
  if (!v11)
  {
    v12 = (void *)qword_100042EC8;
    if (os_log_type_enabled((os_log_t)qword_100042EC8, OS_LOG_TYPE_ERROR)) {
      sub_100027658(v12, a2);
    }
  }
  v7[2](v7, v11);
  v13 = (void *)qword_100042EC8;
  if (os_log_type_enabled((os_log_t)qword_100042EC8, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v15 = NSStringFromSelector(a2);
    int v16 = 138412546;
    v17 = v15;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@: END: pathURL=%@", (uint8_t *)&v16, 0x16u);
  }
}

@end