@interface ADFMIPListener
+ (id)sharedListener;
- (ADFMIPListener)init;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)startListening;
@end

@implementation ADFMIPListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[ADFMIPListener connection:didReceiveIncomingMessage:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }
  v8 = [v6 topic];
  unsigned int v9 = [v8 isEqualToString:@"com.apple.icloud.fmip.voiceassistantsync"];

  if (v9)
  {
    id v10 = [objc_alloc((Class)NSString) initWithFormat:@"%@%s", @"com.apple.icloud.fmip", ".siri_data_changed"];
    notify_post((const char *)[v10 UTF8String]);
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[ADFMIPListener connection:didReceivePublicToken:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
}

- (void)startListening
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E6998;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (ADFMIPListener)init
{
  v10.receiver = self;
  v10.super_class = (Class)ADFMIPListener;
  v2 = [(ADFMIPListener *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ADFMIPListener", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc((Class)APSConnection);
    v7 = (APSConnection *)[v6 initWithEnvironmentName:APSEnvironmentProduction namedDelegatePort:@"com.apple.aps.assistantd.fmip" queue:v2->_queue];
    connection = v2->_connection;
    v2->_connection = v7;
  }
  return v2;
}

+ (id)sharedListener
{
  if (qword_100586208 != -1) {
    dispatch_once(&qword_100586208, &stru_10050B1A8);
  }
  v2 = (void *)qword_100586210;
  return v2;
}

@end