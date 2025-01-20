@interface ADSecurityService
+ (id)sharedService;
- (ADSecurityService)init;
- (void)_accountDidChange:(id)a3;
- (void)_dispatchCallbackForProcessedData:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_dispatchCallbackForProcessedDataMap:(id)a3 errorMap:(id)a4 completion:(id)a5;
- (void)_retrieveKeyAndSaltWithCompletion:(id)a3;
- (void)internalAuthAppleConnectServiceTicket:(id)a3;
- (void)internalAuthSessionToken:(id)a3;
- (void)processData:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5;
- (void)processDataMap:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5;
- (void)setInternalAuthAppleConnectServiceTicket:(id)a3 completion:(id)a4;
- (void)setInternalAuthSessionToken:(id)a3 completion:(id)a4;
- (void)setKeychainValue:(id)a3 forKey:(id)a4 accountIdentifier:(id)a5 completion:(id)a6;
@end

@implementation ADSecurityService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inMemorySalt, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_keychainQueue, 0);
  objc_storeStrong((id *)&self->_procedureQueue, 0);
}

- (void)_accountDidChange:(id)a3
{
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    v6 = "-[ADSecurityService _accountDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  notify_post(AFSecurityEncryptionKeyDidChangeNotification);
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"ADSecurityServiceEncryptionKeyDidChangeNotification" object:0];
}

- (void)_retrieveKeyAndSaltWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = +[ADCommandCenter sharedCommandCenter];
    v6 = [v5 _queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A4AF0;
    block[3] = &unk_10050E1D8;
    id v9 = v5;
    v10 = self;
    id v11 = v4;
    id v7 = v5;
    dispatch_async(v6, block);
  }
}

- (void)_dispatchCallbackForProcessedDataMap:(id)a3 errorMap:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A4D80;
    block[3] = &unk_10050E1D8;
    id v16 = v10;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(callbackQueue, block);
  }
}

- (void)_dispatchCallbackForProcessedData:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A4E7C;
    block[3] = &unk_10050E1D8;
    id v16 = v10;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(callbackQueue, block);
  }
}

- (void)internalAuthSessionToken:(id)a3
{
  id v4 = a3;
  int v5 = +[ADPreferences sharedPreferences];
  v6 = [v5 internalAuthSessionToken];

  if (v4)
  {
    callbackQueue = self->_callbackQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001A4F70;
    v8[3] = &unk_10050E188;
    id v10 = v4;
    id v9 = v6;
    dispatch_async(callbackQueue, v8);
  }
}

- (void)internalAuthAppleConnectServiceTicket:(id)a3
{
  id v4 = a3;
  int v5 = +[ADPreferences sharedPreferences];
  v6 = [v5 internalAuthAppleConnectServiceTicket];

  if (v4)
  {
    callbackQueue = self->_callbackQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001A5064;
    v8[3] = &unk_10050E188;
    id v10 = v4;
    id v9 = v6;
    dispatch_async(callbackQueue, v8);
  }
}

- (void)setInternalAuthSessionToken:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[ADPreferences sharedPreferences];
  [v8 setInternalAuthSessionToken:v7];

  if (v6)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A5154;
    block[3] = &unk_10050D0D0;
    id v11 = v6;
    dispatch_async(callbackQueue, block);
  }
}

- (void)setInternalAuthAppleConnectServiceTicket:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[ADPreferences sharedPreferences];
  [v8 setInternalAuthAppleConnectServiceTicket:v7];

  if (v6)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A5240;
    block[3] = &unk_10050D0D0;
    id v11 = v6;
    dispatch_async(callbackQueue, block);
  }
}

- (void)setKeychainValue:(id)a3 forKey:(id)a4 accountIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  keychainQueue = self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A5364;
  block[3] = &unk_10050D3F0;
  id v20 = v10;
  id v21 = v12;
  v23 = self;
  id v24 = v13;
  id v22 = v11;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(keychainQueue, block);
}

- (void)processDataMap:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (v8)
    {
      procedureQueue = self->_procedureQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001A561C;
      block[3] = &unk_10050C278;
      int64_t v17 = a4;
      id v14 = v8;
      id v15 = self;
      id v16 = v9;
      dispatch_async(procedureQueue, block);

      id v11 = v14;
    }
    else
    {
      CFStringRef v18 = @"error";
      id v11 = +[AFError errorWithCode:1603];
      v19 = v11;
      id v12 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      [(ADSecurityService *)self _dispatchCallbackForProcessedDataMap:0 errorMap:v12 completion:v9];
    }
  }
}

- (void)processData:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (v8)
    {
      procedureQueue = self->_procedureQueue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1001A615C;
      v12[3] = &unk_10050C278;
      int64_t v16 = a4;
      id v13 = v8;
      id v14 = self;
      id v15 = v9;
      dispatch_async(procedureQueue, v12);
    }
    else
    {
      id v11 = +[AFError errorWithCode:1603];
      [(ADSecurityService *)self _dispatchCallbackForProcessedData:0 error:v11 completion:v9];
    }
  }
}

- (ADSecurityService)init
{
  v26.receiver = self;
  v26.super_class = (Class)ADSecurityService;
  v2 = [(ADSecurityService *)&v26 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.assistant.security.service.procedure", v3);

    procedureQueue = v2->_procedureQueue;
    v2->_procedureQueue = (OS_dispatch_queue *)v4;

    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.assistant.security.service.keychain", v6);

    keychainQueue = v2->_keychainQueue;
    v2->_keychainQueue = (OS_dispatch_queue *)v7;

    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.assistant.security.service.callback", v9);

    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = AFSecurityGenerateRandomData();
    inMemorySalt = v2->_inMemorySalt;
    v2->_inMemorySalt = (NSData *)v12;

    id v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v2 selector:"_accountDidChange:" name:@"ADActiveAccountIdentifierDidChangeNotification" object:0];

    id v15 = v2->_procedureQueue;
    int64_t v16 = +[ADQueueMonitor sharedMonitor];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1001A6868;
    v24[3] = &unk_10050C458;
    v25 = v15;
    int64_t v17 = v15;
    [v16 addQueue:v17 heartBeatInterval:v24 timeoutInterval:5.0 timeoutHandler:5.0];

    CFStringRef v18 = v2->_keychainQueue;
    v19 = +[ADQueueMonitor sharedMonitor];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1001A6984;
    v22[3] = &unk_10050C458;
    v23 = v18;
    id v20 = v18;
    [v19 addQueue:v20 heartBeatInterval:v22 timeoutInterval:5.0 timeoutHandler:5.0];
  }
  return v2;
}

+ (id)sharedService
{
  if (qword_100585DA0 != -1) {
    dispatch_once(&qword_100585DA0, &stru_100504F30);
  }
  v2 = (void *)qword_100585DA8;
  return v2;
}

@end