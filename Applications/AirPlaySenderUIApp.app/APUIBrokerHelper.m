@interface APUIBrokerHelper
+ (id)sharedInstance;
- (APUIBrokerHelper)init;
- (void)_handleAuthenticationResponse:(id)a3 requestUUID:(id)a4 error:(id)a5 completion:(id)a6;
- (void)_handleBrokerResponse:(id)a3;
- (void)_handleGetInfoResponse:(id)a3 requestUUID:(id)a4 error:(id)a5 completion:(id)a6;
- (void)_sendBrokerRequest:(id)a3 params:(id)a4 timeout:(unint64_t)a5 completion:(id)a6;
- (void)getBrokerGroupInfo:(id)a3 completion:(id)a4;
- (void)performBrokerAuthenticationForBrokerGroup:(id)a3 withBrokerAuth:(id)a4 completion:(id)a5;
@end

@implementation APUIBrokerHelper

- (APUIBrokerHelper)init
{
  v10.receiver = self;
  v10.super_class = (Class)APUIBrokerHelper;
  v2 = [(APUIBrokerHelper *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("APUIBrokerHelper.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("APUIBrokerHelper.notification", 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = (NSMutableDictionary *)v7;
  }
  if (dword_10001EB68 <= 50 && (dword_10001EB68 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return v2;
}

- (void)_handleGetInfoResponse:(id)a3 requestUUID:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (dword_10001EB68 <= 50 && (dword_10001EB68 != -1 || _LogCategory_Initialize()))
  {
    if (v10) {
      IsAppleInternalBuild();
    }
    LogPrintF();
  }
  int v14 = NSErrorToOSStatus();
  if (v14)
  {
    int v16 = v14;
    APSLogErrorAt();
    v15 = 0;
  }
  else
  {
    v15 = [v10 objectForKeyedSubscript:@"BrokerGroupInfo"];
    if (v15)
    {
      if (dword_10001EB68 <= 50 && (dword_10001EB68 != -1 || _LogCategory_Initialize()))
      {
        IsAppleInternalBuild();
        LogPrintF();
      }
      int v16 = 0;
    }
    else
    {
      APSLogErrorAt();
      int v16 = -6705;
    }
  }
  if (v13)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004B98;
    block[3] = &unk_100018638;
    id v20 = v13;
    int v21 = v16;
    id v19 = v15;
    dispatch_async((dispatch_queue_t)notificationQueue, block);
  }
}

- (void)getBrokerGroupInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004D18;
  block[3] = &unk_100018688;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_handleAuthenticationResponse:(id)a3 requestUUID:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (dword_10001EB68 <= 50 && (dword_10001EB68 != -1 || _LogCategory_Initialize()))
  {
    if (v10) {
      IsAppleInternalBuild();
    }
    LogPrintF();
  }
  int v14 = NSErrorToOSStatus();
  if (v14)
  {
    int v16 = v14;
    APSLogErrorAt();
    v15 = 0;
    goto LABEL_15;
  }
  if (!v10)
  {
    APSLogErrorAt();
    v15 = 0;
LABEL_21:
    int v16 = -6705;
    goto LABEL_15;
  }
  v15 = [v10 objectForKeyedSubscript:@"AuthTargetReceiverDeviceID"];
  if (!v15)
  {
    APSLogErrorAt();
    goto LABEL_21;
  }
  if (dword_10001EB68 <= 50 && (dword_10001EB68 != -1 || _LogCategory_Initialize()))
  {
    IsAppleInternalBuild();
    LogPrintF();
  }
  int v16 = 0;
LABEL_15:
  if (v13)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005080;
    block[3] = &unk_100018638;
    id v20 = v13;
    int v21 = v16;
    id v19 = v15;
    dispatch_async((dispatch_queue_t)notificationQueue, block);
  }
}

- (void)performBrokerAuthenticationForBrokerGroup:(id)a3 withBrokerAuth:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100005220;
  v15[3] = &unk_1000186B0;
  id v16 = v9;
  id v17 = v8;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async((dispatch_queue_t)queue, v15);
}

- (void)_sendBrokerRequest:(id)a3 params:(id)a4 timeout:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005418;
  block[3] = &unk_100018700;
  void block[4] = self;
  id v18 = v11;
  id v20 = v12;
  unint64_t v21 = a5;
  id v19 = v10;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_handleBrokerResponse:(id)a3
{
  v4 = (__CFString *)a3;
  unint64_t v21 = v4;
  if (!v4)
  {
    APSLogErrorAt();
LABEL_27:
    id v10 = 0;
    goto LABEL_16;
  }
  dispatch_queue_t v5 = v4;
  if (dword_10001EB68 <= 50)
  {
    if (dword_10001EB68 != -1 || (v8 = _LogCategory_Initialize(), dispatch_queue_t v5 = v21, v8))
    {
      int v6 = IsAppleInternalBuild();
      CFStringRef v7 = @"#Redacted#";
      if (v6) {
        CFStringRef v7 = v21;
      }
      id v19 = self;
      CFStringRef v20 = v7;
      LogPrintF();
      dispatch_queue_t v5 = v21;
    }
  }
  uint64_t v9 = [(__CFString *)v5 objectForKeyedSubscript:@"RequestType", v19, v20];
  if (!v9)
  {
    if (dword_10001EB68 <= 90 && (dword_10001EB68 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_27;
  }
  id v10 = (void *)v9;
  uint64_t v11 = [(__CFString *)v21 objectForKeyedSubscript:@"RequestUUID"];
  if (v11)
  {
    id v12 = (void *)v11;
    id v13 = [(__CFString *)v21 objectForKeyedSubscript:@"Status"];
    id v14 = [v13 intValue];

    if (v14) {
      APSLogErrorAt();
    }
    id v15 = self;
    objc_sync_enter(v15);
    id v16 = [(NSMutableDictionary *)v15->_pendingRequests objectForKeyedSubscript:v12];
    if (v16)
    {
      id v17 = v16;
      objc_sync_enter(v17);
      [v17 setResponse:v21];
      [v17 setStatus:v14];
      objc_sync_exit(v17);

      objc_sync_exit(v15);
      id v18 = [v17 semaphore];
      dispatch_semaphore_signal(v18);
    }
    else
    {
      objc_sync_exit(v15);
    }
  }
  else if (dword_10001EB68 <= 90 && (dword_10001EB68 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_16:
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005CC4;
  block[3] = &unk_100018720;
  void block[4] = a1;
  if (qword_10001F048 != -1) {
    dispatch_once(&qword_10001F048, block);
  }
  v2 = (void *)qword_10001F050;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end