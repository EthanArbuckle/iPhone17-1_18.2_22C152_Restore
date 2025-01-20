@interface ADMyriadService
+ (id)sharedService;
- (ADMyriadService)init;
- (void)_handleLastWinRequest:(id)a3 completion:(id)a4;
- (void)_handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)_handleRequest:(id)a3 fromDeviceWithIdentifier:(id)a4 completion:(id)a5;
- (void)_setLastMyriadWin:(id)a3;
- (void)_setLastTimeStereoPartnerWon:(id)a3;
- (void)_setStereoPartnerIdentifier:(id)a3;
- (void)_stereoConfigurationDidChangeNotification:(id)a3;
- (void)_syncLastWinWithStereoPartner;
- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)lastMyriadWinForStereoPartner:(id)a3;
- (void)setMyriadDecisionResult:(BOOL)a3;
@end

@implementation ADMyriadService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stereoPartnerIdentifier, 0);
  objc_storeStrong((id *)&self->_lastTimeStereoPartnerWon, 0);
  objc_storeStrong((id *)&self->_lastTimeWon, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)_handleLastWinRequest:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, void, void *))a4;
  serialQueue = self->_serialQueue;
  id v8 = a3;
  dispatch_assert_queue_V2(serialQueue);
  v9 = [v8 objectForKey:@"lastWin"];

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "-[ADMyriadService _handleLastWinRequest:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Received malformed lastWin data", buf, 0xCu);
      }
      v11 = +[AFError errorWithCode:11];
      v6[2](v6, 0, v11);
      goto LABEL_11;
    }
  }
  [(ADMyriadService *)self _setLastTimeStereoPartnerWon:v9];
  if (v6)
  {
    lastTimeWon = self->_lastTimeWon;
    if (lastTimeWon)
    {
      CFStringRef v13 = @"lastWin";
      v14 = lastTimeWon;
      v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    }
    else
    {
      v11 = 0;
    }
    ((void (**)(id, void *, void *))v6)[2](v6, v11, 0);
LABEL_11:
  }
}

- (void)_handleRequest:(id)a3 fromDeviceWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v11 = [v8 objectForKey:@"methodName"];
  v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315394;
    v18 = "-[ADMyriadService _handleRequest:fromDeviceWithIdentifier:completion:]";
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v17, 0x16u);
  }
  if (![(NSString *)self->_stereoPartnerIdentifier isEqualToString:v9])
  {
    CFStringRef v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      v18 = "-[ADMyriadService _handleRequest:fromDeviceWithIdentifier:completion:]";
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Received message from device not in stereo pair: %@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v14 = 1005;
    goto LABEL_12;
  }
  if (![v11 isEqualToString:@"lastWin"])
  {
    v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      v18 = "-[ADMyriadService _handleRequest:fromDeviceWithIdentifier:completion:]";
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Received message with unknown method name: %@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v14 = 1004;
LABEL_12:
    v16 = +[AFError errorWithCode:v14];
    v10[2](v10, 0, v16);

    goto LABEL_13;
  }
  [(ADMyriadService *)self _handleLastWinRequest:v8 completion:v10];
LABEL_13:
}

- (void)_handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  CFStringRef v13 = (void (**)(id, void, void *))a6;
  uint64_t v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v20 = 136315650;
    *(void *)&v20[4] = "-[ADMyriadService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
    *(_WORD *)&v20[12] = 2112;
    *(void *)&v20[14] = v11;
    *(_WORD *)&v20[22] = 2112;
    id v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s %@ %@", v20, 0x20u);
  }
  if (([v11 isEqualToString:@"myriad"] & 1) == 0)
  {
    int v17 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
LABEL_9:
      __int16 v19 = +[AFError errorWithCode:](AFError, "errorWithCode:", 1004, *(_OWORD *)v20, *(void *)&v20[16]);
      v13[2](v13, 0, v19);

      goto LABEL_10;
    }
    *(_DWORD *)id v20 = 136315394;
    *(void *)&v20[4] = "-[ADMyriadService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
    *(_WORD *)&v20[12] = 2112;
    *(void *)&v20[14] = v11;
    v18 = "%s Received message from unknown message type: %@";
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v18, v20, 0x16u);
    goto LABEL_9;
  }
  v15 = [v10 objectForKey:@"methodType"];
  id v16 = [v15 integerValue];

  if (v16 != (id)2)
  {
    int v17 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)id v20 = 136315394;
    *(void *)&v20[4] = "-[ADMyriadService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
    *(_WORD *)&v20[12] = 2048;
    *(void *)&v20[14] = v16;
    v18 = "%s Received message with unhandled method type: %ld";
    goto LABEL_12;
  }
  [(ADMyriadService *)self _handleRequest:v10 fromDeviceWithIdentifier:v12 completion:v13];
LABEL_10:
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
  block[2] = sub_1002B40D4;
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

- (void)_stereoConfigurationDidChangeNotification:(id)a3
{
  v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADMyriadService _stereoConfigurationDidChangeNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v5 = +[ADCompanionService sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002B41FC;
  v6[3] = &unk_100509F60;
  v6[4] = self;
  [v5 getStereoPartnerIdentifierWithCompletion:v6];
}

- (void)_syncLastWinWithStereoPartner
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[ADMyriadService _syncLastWinWithStereoPartner]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_stereoPartnerIdentifier)
  {
    v4 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:&off_100523AC8, @"methodType", @"lastWin", @"methodName", 0];
    v5 = v4;
    lastTimeWon = self->_lastTimeWon;
    if (lastTimeWon) {
      [v4 setObject:lastTimeWon forKey:@"lastWin"];
    }
    v7 = self->_stereoPartnerIdentifier;
    objc_initWeak((id *)buf, self);
    id v8 = +[ADCompanionService sharedInstance];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002B4508;
    v11[3] = &unk_100509FB0;
    v11[4] = self;
    objc_copyWeak(&v13, (id *)buf);
    id v9 = v7;
    id v12 = v9;
    [v8 sendStereoPartnerMessage:v5 messageType:@"myriad" completion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[ADMyriadService _syncLastWinWithStereoPartner]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s No stereo partner", buf, 0xCu);
    }
  }
}

- (void)_setLastTimeStereoPartnerWon:(id)a3
{
  v5 = (NSDate *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  lastTimeStereoPartnerWon = self->_lastTimeStereoPartnerWon;
  p_lastTimeStereoPartnerWon = &self->_lastTimeStereoPartnerWon;
  v6 = lastTimeStereoPartnerWon;
  if (lastTimeStereoPartnerWon != v5 && ([(NSDate *)v6 isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)p_lastTimeStereoPartnerWon, a3);
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v10 = *p_lastTimeStereoPartnerWon;
      int v12 = 136315394;
      id v13 = "-[ADMyriadService _setLastTimeStereoPartnerWon:]";
      __int16 v14 = 2112;
      id v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s lastWin changed to: %@", (uint8_t *)&v12, 0x16u);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, kAFStereoPartnerMyriadDataDidChangeDarwinNotification, 0, 0, 1u);
  }
}

- (void)_setStereoPartnerIdentifier:(id)a3
{
  v4 = (NSString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  stereoPartnerIdentifier = self->_stereoPartnerIdentifier;
  if (stereoPartnerIdentifier != v4 && ![(NSString *)stereoPartnerIdentifier isEqualToString:v4])
  {
    v6 = (NSString *)[(NSString *)v4 copy];
    v7 = self->_stereoPartnerIdentifier;
    self->_stereoPartnerIdentifier = v6;

    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v9 = self->_stereoPartnerIdentifier;
      int v10 = 136315394;
      id v11 = "-[ADMyriadService _setStereoPartnerIdentifier:]";
      __int16 v12 = 2112;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s stereo partner changed to: %@", (uint8_t *)&v10, 0x16u);
    }
    if (self->_stereoPartnerIdentifier) {
      [(ADMyriadService *)self _syncLastWinWithStereoPartner];
    }
    else {
      [(ADMyriadService *)self _setLastTimeStereoPartnerWon:0];
    }
  }
}

- (void)lastMyriadWinForStereoPartner:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002B4AE4;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)_setLastMyriadWin:(id)a3
{
  v7 = (NSDate *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v5 = v7;
  lastTimeWon = self->_lastTimeWon;
  if (lastTimeWon != v7)
  {
    lastTimeWon = (NSDate *)[(NSDate *)lastTimeWon isEqual:v7];
    v5 = v7;
    if ((lastTimeWon & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lastTimeWon, a3);
      v5 = v7;
      if (self->_stereoPartnerIdentifier)
      {
        lastTimeWon = (NSDate *)[(ADMyriadService *)self _syncLastWinWithStereoPartner];
        v5 = v7;
      }
    }
  }
  _objc_release_x1(lastTimeWon, v5);
}

- (void)setMyriadDecisionResult:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[ADMyriadService setMyriadDecisionResult:]";
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }
  if (v3)
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002B4D48;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_async(serialQueue, block);
  }
}

- (ADMyriadService)init
{
  v12.receiver = self;
  v12.super_class = (Class)ADMyriadService;
  v2 = [(ADMyriadService *)&v12 init];
  if (v2)
  {
    BOOL v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("Myriad Service Queue", v3);

    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    id v6 = +[ADCompanionService sharedInstance];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1002B4EF4;
    v10[3] = &unk_100509F60;
    v7 = v2;
    BOOL v11 = v7;
    [v6 getStereoPartnerIdentifierWithCompletion:v10];
    [v6 setMessageHandler:v7 forMessageType:@"myriad"];
    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v7 selector:"_stereoConfigurationDidChangeNotification:" name:@"ADCompanionServiceStereoConfigurationDidChangeNotification" object:0];
  }
  return v2;
}

+ (id)sharedService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B504C;
  block[3] = &unk_10050E350;
  block[4] = a1;
  if (qword_100586158 != -1) {
    dispatch_once(&qword_100586158, block);
  }
  v2 = (void *)qword_100586160;
  return v2;
}

@end