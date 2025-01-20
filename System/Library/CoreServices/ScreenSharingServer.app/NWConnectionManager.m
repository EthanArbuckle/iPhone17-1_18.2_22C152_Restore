@interface NWConnectionManager
- (BOOL)stopConnection;
- (NSRecursiveLock)writeLock;
- (NSString)stateString;
- (NWConnection)connection;
- (NWConnectionManager)init;
- (NWConnectionManager)initWithNWConnection:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setConnection:(id)a3;
- (void)setStopConnection:(BOOL)a3;
- (void)setWriteLock:(id)a3;
- (void)startRead:(id)a3;
- (void)waitForConnection:(unsigned int)a3;
- (void)writeData:(const void *)a3 size:(unsigned int)a4;
@end

@implementation NWConnectionManager

- (NWConnectionManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)NWConnectionManager;
  v2 = [(NWConnectionManager *)&v11 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    networkConnectionReadySemaphore = v2->networkConnectionReadySemaphore;
    v2->networkConnectionReadySemaphore = (OS_dispatch_semaphore *)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    sendSemaphore = v2->sendSemaphore;
    v2->sendSemaphore = (OS_dispatch_semaphore *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("NWConnection read queue", 0);
    readDispatchQueue = v2->readDispatchQueue;
    v2->readDispatchQueue = (OS_dispatch_queue *)v7;

    v9 = objc_opt_new();
    [(NWConnectionManager *)v2 setWriteLock:v9];
  }
  return v2;
}

- (NWConnectionManager)initWithNWConnection:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = [(NWConnectionManager *)self init];
  if (v5)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "init with initWithNWConnection", v11, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NWConnectionManager.m", 98, 60, "-[NWConnectionManager initWithNWConnection:]", 7, 0, "init with initWithNWConnection");
    [(NWConnectionManager *)v5 setConnection:v4];
    v6 = [(NWConnectionManager *)v5 connection];
    [v6 addObserver:v5 forKeyPath:@"connectionState" options:5 context:0];

    dispatch_queue_t v7 = [(NWConnectionManager *)v5 connection];
    [v7 addObserver:v5 forKeyPath:@"viable" options:5 context:0];

    v8 = [(NWConnectionManager *)v5 connection];
    [v8 addObserver:v5 forKeyPath:@"hasBetterPath" options:5 context:0];

    v9 = [(NWConnectionManager *)v5 connection];
    [v9 addObserver:v5 forKeyPath:@"error" options:5 context:0];
  }
  return v5;
}

- (void)waitForConnection:(unsigned int)a3
{
  dispatch_semaphore_t v5 = [(NWConnectionManager *)self connection];
  id v6 = [v5 connectionState];

  dispatch_queue_t v7 = [(NWConnectionManager *)self connection];
  id v8 = [(NWConnectionManager *)self stateString];
  sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NWConnectionManager.m", 98, 91, "-[NWConnectionManager waitForConnection:]", 7, 0, "connection state for %p is %s", v7, (const char *)[v8 UTF8String]);

  if (v6 != (id)3)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "going to wait for connection to be ready", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NWConnectionManager.m", 98, 94, "-[NWConnectionManager waitForConnection:]", 7, 0, "going to wait for connection to be ready");
    networkConnectionReadySemaphore = self->networkConnectionReadySemaphore;
    if (a3) {
      dispatch_time_t v10 = dispatch_time(0, 1000000 * a3);
    }
    else {
      dispatch_time_t v10 = -1;
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)networkConnectionReadySemaphore, v10);
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(NWConnectionManager *)self stateString];
      id v12 = [v11 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "done waiting connection state is %s", buf, 0xCu);
    }
    id v13 = [(NWConnectionManager *)self stateString];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NWConnectionManager.m", 98, 96, "-[NWConnectionManager waitForConnection:]", 7, 0, "done waiting connection state is %s", (const char *)[v13 UTF8String]);
  }
}

- (void)dealloc
{
  dispatch_semaphore_t v3 = [(NWConnectionManager *)self connection];
  [v3 removeObserver:self forKeyPath:@"connectionState"];

  id v4 = [(NWConnectionManager *)self connection];
  [v4 removeObserver:self forKeyPath:@"viable"];

  dispatch_semaphore_t v5 = [(NWConnectionManager *)self connection];
  [v5 removeObserver:self forKeyPath:@"hasBetterPath"];

  id v6 = [(NWConnectionManager *)self connection];
  [v6 removeObserver:self forKeyPath:@"error"];

  [(NWConnectionManager *)self setConnection:0];
  readDispatchQueue = self->readDispatchQueue;
  if (readDispatchQueue)
  {
    self->readDispatchQueue = 0;
  }
  [(NWConnectionManager *)self setWriteLock:0];
  v8.receiver = self;
  v8.super_class = (Class)NWConnectionManager;
  [(NWConnectionManager *)&v8 dealloc];
}

- (NSString)stateString
{
  v2 = [(NWConnectionManager *)self connection];
  dispatch_semaphore_t v3 = (char *)[v2 connectionState];

  if ((unint64_t)(v3 - 1) > 4) {
    return (NSString *)@"Invalid";
  }
  else {
    return &off_100054AC8[(void)(v3 - 1)]->isa;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NWConnectionManager *)self connection];

  if (v10 != v9)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v9 description];
      *(_DWORD *)buf = 136315138;
      v36 = (const char *)[v11 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Connection %s not recognized", buf, 0xCu);
    }
    id v12 = [v9 description];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NWConnectionManager.m", 98, 151, "-[NWConnectionManager observeValueForKeyPath:ofObject:change:context:]", 5, 0, "Connection %s not recognized", (const char *)[v12 UTF8String]);
LABEL_6:

    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"connectionState"])
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(NWConnectionManager *)self stateString];
      id v14 = [v13 UTF8String];
      id v15 = [(NWConnectionManager *)self connection];
      *(_DWORD *)buf = 134218498;
      v36 = (const char *)v9;
      __int16 v37 = 2080;
      id v38 = v14;
      __int16 v39 = 2048;
      id v40 = [v15 connectionState];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NWConnection State for %p: %s %ld", buf, 0x20u);
    }
    id v16 = [(NWConnectionManager *)self stateString];
    v17 = (const char *)[v16 UTF8String];
    v18 = [(NWConnectionManager *)self connection];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NWConnectionManager.m", 98, 157, "-[NWConnectionManager observeValueForKeyPath:ofObject:change:context:]", 7, 0, "NWConnection State for %p: %s %ld", v9, v17, [v18 connectionState]);

    if ([v9 connectionState] == (id)3)
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v9 connectedLocalEndpoint];
        id v20 = [v19 description];
        v21 = (const char *)[v20 UTF8String];
        *(_DWORD *)buf = 136315138;
        v36 = v21;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Local Endpoint: %s", buf, 0xCu);
      }
      v22 = [v9 connectedLocalEndpoint];
      id v23 = [v22 description];
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NWConnectionManager.m", 98, 161, "-[NWConnectionManager observeValueForKeyPath:ofObject:change:context:]", 7, 0, "Local Endpoint: %s", (const char *)[v23 UTF8String]);

      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [v9 connectedRemoteEndpoint];
        id v25 = [v24 description];
        v26 = (const char *)[v25 UTF8String];
        *(_DWORD *)buf = 136315138;
        v36 = v26;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Remote Endpoint: %s", buf, 0xCu);
      }
      v27 = [v9 connectedRemoteEndpoint];
      id v28 = [v27 description];
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NWConnectionManager.m", 98, 162, "-[NWConnectionManager observeValueForKeyPath:ofObject:change:context:]", 7, 0, "Remote Endpoint: %s", (const char *)[v28 UTF8String]);

      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "signal semaphore", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NWConnectionManager.m", 98, 163, "-[NWConnectionManager observeValueForKeyPath:ofObject:change:context:]", 7, 0, "signal semaphore");
      dispatch_semaphore_signal((dispatch_semaphore_t)self->networkConnectionReadySemaphore);
    }
  }
  else if ([v8 isEqualToString:@"hasBetterPath"])
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v29 = [v9 hasBetterPath];
      v30 = "No";
      if (v29) {
        v30 = "Yes";
      }
      *(_DWORD *)buf = 136315138;
      v36 = v30;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Better Path Available: %s", buf, 0xCu);
    }
    [v9 hasBetterPath];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NWConnectionManager.m", 98, 170, "-[NWConnectionManager observeValueForKeyPath:ofObject:change:context:]", 7, 0, "Better Path Available: %s");
  }
  else
  {
    if (![v8 isEqualToString:@"viable"])
    {
      if (![v8 isEqualToString:@"error"]) {
        goto LABEL_7;
      }
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v32 = [v9 error];
        id v33 = [v32 description];
        *(_DWORD *)buf = 136315138;
        v36 = (const char *)[v33 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error: %s", buf, 0xCu);
      }
      id v12 = [v9 error];
      id v34 = [v12 description];
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NWConnectionManager.m", 98, 178, "-[NWConnectionManager observeValueForKeyPath:ofObject:change:context:]", 7, 0, "Error: %s", (const char *)[v34 UTF8String]);

      goto LABEL_6;
    }
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      if ([v9 isViable]) {
        v31 = "Yes";
      }
      else {
        v31 = "No";
      }
      *(_DWORD *)buf = 136315138;
      v36 = v31;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Viable: %s", buf, 0xCu);
    }
    [v9 isViable];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NWConnectionManager.m", 98, 174, "-[NWConnectionManager observeValueForKeyPath:ofObject:change:context:]", 7, 0, "Viable: %s");
  }
LABEL_7:
}

- (void)startRead:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = [(NWConnectionManager *)self connection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000066C8;
  v8[3] = &unk_100054A80;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(v4) = [v5 readDatagramsWithMinimumCount:1 maximumCount:1 completionHandler:v8];

  if ((v4 & 1) == 0)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unable to read data", v7, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NWConnectionManager.m", 98, 210, "-[NWConnectionManager startRead:]", 7, 0, "unable to read data");
  }
}

- (void)writeData:(const void *)a3 size:(unsigned int)a4
{
  dispatch_queue_t v7 = [(NWConnectionManager *)self writeLock];
  [v7 lock];

  uint64_t v8 = +[NSMutableArray array];
  id v9 = +[NSData dataWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
  [(id)v8 addObject:v9];

  id v10 = [(NWConnectionManager *)self connection];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100006AFC;
  v14[3] = &unk_100054AA8;
  id v11 = (id)v8;
  id v15 = v11;
  id v16 = self;
  LOBYTE(v8) = [v10 writeDatagrams:v11 completionHandler:v14];

  dispatch_semaphore_wait((dispatch_semaphore_t)self->sendSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  id v12 = [(NWConnectionManager *)self writeLock];
  [v12 unlock];

  if ((v8 & 1) == 0)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "error when writing ", v13, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NWConnectionManager.m", 98, 245, "-[NWConnectionManager writeData:size:]", 7, 0, "error when writing ");
  }
}

- (NWConnection)connection
{
  return (NWConnection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConnection:(id)a3
{
}

- (NSRecursiveLock)writeLock
{
  return (NSRecursiveLock *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWriteLock:(id)a3
{
}

- (BOOL)stopConnection
{
  return self->_stopConnection;
}

- (void)setStopConnection:(BOOL)a3
{
  self->_stopConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->writeLock, 0);
  objc_storeStrong((id *)&self->connection, 0);
  objc_storeStrong((id *)&self->readDispatchQueue, 0);
  objc_storeStrong((id *)&self->sendSemaphore, 0);

  objc_storeStrong((id *)&self->networkConnectionReadySemaphore, 0);
}

@end