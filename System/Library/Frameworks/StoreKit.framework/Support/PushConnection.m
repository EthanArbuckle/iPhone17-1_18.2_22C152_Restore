@interface PushConnection
+ (id)_newConnectionForEnvironment:(id)a3 dispatchQueue:(id)a4;
- (NSString)description;
- (NSString)environment;
- (PushConnection)init;
- (PushConnection)initWithEnvironment:(id)a3;
- (PushConnection)initWithEnvironment:(id)a3 queue:(id)a4;
- (PushConnectionDelegate)delegate;
- (id)publicToken;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)setDelegate:(id)a3;
- (void)shutdown;
@end

@implementation PushConnection

- (PushConnection)init
{
  return [(PushConnection *)self initWithEnvironment:APSEnvironmentProduction];
}

- (PushConnection)initWithEnvironment:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.storekit.PushConnection", 0);
  v6 = [(PushConnection *)self initWithEnvironment:v4 queue:v5];

  return v6;
}

- (PushConnection)initWithEnvironment:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PushConnection;
  v9 = [(PushConnection *)&v19 init];
  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    historyLock = v9->_historyLock;
    v9->_historyLock = (UnfairLock *)v10;

    uint64_t v12 = +[NSUUID lib_shortLogKey];
    logKey = v9->_logKey;
    v9->_logKey = (NSString *)v12;

    objc_storeStrong((id *)&v9->_dispatchQueue, a4);
    objc_storeStrong((id *)&v9->_environment, a3);
    v14 = objc_alloc_init(TaskQueue);
    taskQueue = v9->_taskQueue;
    v9->_taskQueue = v14;

    [(TaskQueue *)v9->_taskQueue setName:@"com.apple.storekit.PushConnectionTaskQueue"];
    v16 = +[PushConnection _newConnectionForEnvironment:v7 dispatchQueue:v8];
    connection = v9->_connection;
    v9->_connection = v16;

    [(APSConnection *)v9->_connection setDelegate:v9];
    [(APSConnection *)v9->_connection setEnabledTopics:&off_100373C98 ignoredTopics:&__NSArray0__struct];
  }

  return v9;
}

- (NSString)environment
{
  return self->_environment;
}

- (id)publicToken
{
  return [(APSConnection *)self->_connection publicToken];
}

- (void)shutdown
{
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  id v8 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  v9 = [[PushMessage alloc] initWithMessage:v8];

  if (qword_10039FD38 != -1) {
    dispatch_once(&qword_10039FD38, &stru_100359458);
  }
  uint64_t v10 = qword_10039FD10;
  if (os_log_type_enabled((os_log_t)qword_10039FD10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = v6;
    __int16 v23 = 2114;
    v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Connection: %{public}@ received incoming message: %{public}@", buf, 0x16u);
  }
  historyLock = self->_historyLock;
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_1000660A4;
  v18 = &unk_1003580D0;
  objc_super v19 = self;
  uint64_t v12 = v9;
  v20 = v12;
  sub_10006B9F0(historyLock, &v15);
  if ([(PushMessage *)v12 actionType] == -1)
  {
    if (qword_10039FD38 != -1) {
      dispatch_once(&qword_10039FD38, &stru_100359458);
    }
    v14 = qword_10039FD10;
    if (os_log_type_enabled((os_log_t)qword_10039FD10, OS_LOG_TYPE_ERROR)) {
      sub_1002C66B4((uint64_t)v12, v14);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained pushConnection:self didRecieveMessage:v12];
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (qword_10039FD38 != -1) {
    dispatch_once(&qword_10039FD38, &stru_100359458);
  }
  id v6 = (void *)qword_10039FD10;
  if (os_log_type_enabled((os_log_t)qword_10039FD10, OS_LOG_TYPE_INFO))
  {
    logKey = self->_logKey;
    id v8 = v6;
    v9 = objc_msgSend(v5, "lib_digestMD5");
    environment = self->_environment;
    int v11 = 138543874;
    uint64_t v12 = logKey;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = environment;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] Received new public token: %{public}@ for environment: %{public}@", (uint8_t *)&v11, 0x20u);
  }
}

- (NSString)description
{
  environment = self->_environment;
  v3 = [(APSConnection *)self->_connection publicToken];
  id v4 = objc_msgSend(v3, "lib_shortDigestMD5");
  id v5 = +[NSString stringWithFormat:@"%@/%@", environment, v4];

  return (NSString *)v5;
}

+ (id)_newConnectionForEnvironment:(id)a3 dispatchQueue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)APSConnection) initWithEnvironmentName:v6 namedDelegatePort:@"com.apple.aps.storekitservice" queue:v5];

  return v7;
}

- (PushConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PushConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_messageHistory, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_historyLock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end