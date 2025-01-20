@interface ADCoreSpeechService
+ (id)sharedService;
- (ADCoreSpeechService)init;
- (void)_handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)sendMessageWithPayload:(id)a3 toPeer:(id)a4 withReply:(id)a5;
@end

@implementation ADCoreSpeechService

- (void).cxx_destruct
{
}

- (void)sendMessageWithPayload:(id)a3 toPeer:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[ADCoreSpeechService sendMessageWithPayload:toPeer:withReply:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v12 = +[ADCompanionService sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A7D58;
  v14[3] = &unk_100504BB8;
  v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v12 sendMessage:v8 messageType:@"corespeech" toDeviceWithIDSIdentifier:v9 completion:v14];
}

- (void)_handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void, void *))a6;
  id v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315650;
    v17 = "-[ADCoreSpeechService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v16, 0x20u);
  }
  if ([v10 isEqualToString:@"corespeech"])
  {
    v14 = +[CSP2PService sharedInstance];
    [v14 processRemoteCommandWithPayload:v9 fromPeer:v11 withReply:v12];
  }
  else
  {
    id v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      v17 = "-[ADCoreSpeechService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Received message from unknown message type: %@", (uint8_t *)&v16, 0x16u);
    }
    v14 = +[AFError errorWithCode:1004];
    v12[2](v12, 0, v14);
  }
}

- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A813C;
  block[3] = &unk_10050D3F0;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(serialQueue, block);
}

- (ADCoreSpeechService)init
{
  v9.receiver = self;
  v9.super_class = (Class)ADCoreSpeechService;
  v2 = [(ADCoreSpeechService *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("Core Speech Service Queue", v3);

    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    v6 = +[ADCompanionService sharedInstance];
    [v6 setMessageHandler:v2 forMessageType:@"corespeech"];

    v7 = +[CSP2PService sharedInstance];
    [v7 setAdCompanionServiceProvider:v2];
  }
  return v2;
}

+ (id)sharedService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A82C4;
  block[3] = &unk_10050E350;
  block[4] = a1;
  if (qword_100585900 != -1) {
    dispatch_once(&qword_100585900, block);
  }
  v2 = (void *)qword_100585908;
  return v2;
}

@end