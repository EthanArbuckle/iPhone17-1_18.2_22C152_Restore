@interface GTUNIXDomainSocketTransport_replayer
- (GTUNIXDomainSocketTransport_replayer)initWithMode:(int)a3;
- (id)connect;
- (void)_connectClient:(id)a3 future:(id)a4;
- (void)_connectServer:(id)a3 future:(id)a4;
- (void)_invalidate;
- (void)setUrl:(id)a3;
@end

@implementation GTUNIXDomainSocketTransport_replayer

- (void)_invalidate
{
  v3 = *(NSObject **)&self->_mode;
  if (v3) {
    dispatch_source_cancel(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)GTUNIXDomainSocketTransport_replayer;
  [(GTBaseSocketTransport_replayer *)&v4 _invalidate];
}

- (id)connect
{
  id v3 = +[GTFuture_replayer future];
  queue = self->super.super.super._queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __38__GTUNIXDomainSocketTransport_connect__block_invoke;
  v6[3] = &unk_7451D8;
  v6[4] = self;
  v6[5] = v3;
  dispatch_async(queue, v6);
  return v3;
}

- (void)_connectClient:(id)a3 future:(id)a4
{
  if (a3)
  {
    uint64_t v7 = socket(1, 1, 0);
    if (v7 != -1)
    {
      uint64_t v8 = v7;
      long long v23 = 0u;
      memset(v24, 0, sizeof(v24));
      long long v21 = 0u;
      long long v22 = 0u;
      sockaddr v19 = (sockaddr)0;
      long long v20 = 0u;
      CFStringGetFileSystemRepresentation((CFStringRef)a3, v18, 1024);
      if (strlen(v18) - 103 > 0xFFFFFFFFFFFFFF97)
      {
        v19.sa_family = 1;
        strlcpy(v19.sa_data, v18, 0x68uLL);
        int v16 = strlen(v19.sa_data);
        if (connect(v8, &v19, v16 + 2) != -1)
        {
          [(GTBaseSocketTransport_replayer *)self runWithSocket:v8];
          uint64_t v17 = 1;
LABEL_14:
          [a4 setResult:[NSNumber numberWithBool:v17]];
          return;
        }
        uint64_t v11 = *__error();
        v9 = (__objc2_class *)NSError;
        CFStringRef v10 = (const __CFString *)NSPOSIXErrorDomain;
      }
      else
      {
        v9 = GTError_replayer;
        CFStringRef v10 = @"DYErrorDomain";
        uint64_t v11 = 1;
      }
      [a4 setError:[errorWithDomain:code:userInfo:v10, v11, 0]];
      uint64_t v17 = 0;
      goto LABEL_14;
    }
    uint64_t v14 = *__error();
    v12 = (__objc2_class *)NSError;
    CFStringRef v13 = (const __CFString *)NSPOSIXErrorDomain;
  }
  else
  {
    v12 = GTError_replayer;
    CFStringRef v13 = @"DYErrorDomain";
    uint64_t v14 = 38;
  }
  [a4 setError:[errorWithDomain:code:userInfo:](v12, "errorWithDomain:code:userInfo:", v13, v14, 0)];
  v15 = +[NSNumber numberWithBool:0];

  [a4 setResult:v15];
}

- (void)_connectServer:(id)a3 future:(id)a4
{
  CFStringRef v7 = (const __CFString *)a3;
  if (!a3)
  {
    uint64_t v8 = (__CFString *)NSTemporaryDirectory();
    if (!v8) {
      uint64_t v8 = @"/tmp";
    }
    CFStringRef v7 = (const __CFString *)[(__CFString *)v8 stringByAppendingPathComponent:@"dysonXXXXXX"];
  }
  CFStringGetFileSystemRepresentation(v7, buffer, 1024);
  size_t v9 = strlen(buffer) + 1;
  long long v28 = 0u;
  memset(v29, 0, sizeof(v29));
  long long v26 = 0u;
  long long v27 = 0u;
  sockaddr v24 = (sockaddr)0;
  long long v25 = 0u;
  if (!a3 && v9 >= 0x69)
  {
    CFStringRef v7 = (const __CFString *)[@"/tmp" stringByAppendingPathComponent:@"dysonXXXXXX"];
    CFStringGetFileSystemRepresentation(v7, buffer, 1024);
    size_t v9 = strlen(buffer) + 1;
  }
  if (v9 >= 0x69)
  {
    CFStringRef v10 = GTError_replayer;
    CFStringRef v11 = @"DYErrorDomain";
    uint64_t v12 = 39;
LABEL_20:
    [a4 setError:[errorWithDomain:code:userInfo:v11, v12, 0]];
    [a4 setResult:[NSNumber numberWithBool:0]];
    return;
  }
  if (!a3)
  {
    int v13 = mkstemp(buffer);
    if (v13 == -1)
    {
      int v17 = -1;
      goto LABEL_23;
    }
    int v14 = v13;
    CFStringRef v7 = (id)CFStringCreateWithFileSystemRepresentation(kCFAllocatorDefault, buffer);
    close(v14);
  }
  if (!self->super.super.super._url) {
    self->super.super.super._url = (NSURL *)[objc_alloc((Class)NSURL) initFileURLWithPath:v7];
  }
  v24.sa_family = 1;
  strlcpy(v24.sa_data, buffer, 0x68uLL);
  int v15 = strlen(v24.sa_data);
  int v16 = socket(1, 1, 0);
  if (v16 == -1)
  {
    uint64_t v12 = *__error();
    CFStringRef v10 = (__objc2_class *)NSError;
    CFStringRef v11 = (const __CFString *)NSPOSIXErrorDomain;
    goto LABEL_20;
  }
  int v17 = v16;
  unlink(v24.sa_data);
  if (bind(v17, &v24, v15 + 2) != -1 && listen(v17, 1) != -1)
  {
    fcntl(v17, 4, 4);
    v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v17, 0, (dispatch_queue_t)self->super.super.super._queue);
    *(void *)&self->_mode = v18;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __53__GTUNIXDomainSocketTransport__connectServer_future___block_invoke;
    handler[3] = &unk_745278;
    int v23 = v17;
    handler[4] = self;
    handler[5] = a4;
    dispatch_source_set_cancel_handler(v18, handler);
    sockaddr v19 = *(NSObject **)&self->_mode;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __53__GTUNIXDomainSocketTransport__connectServer_future___block_invoke_2;
    v20[3] = &unk_745278;
    int v21 = v17;
    v20[4] = self;
    v20[5] = a4;
    dispatch_source_set_event_handler(v19, v20);
    dispatch_resume(*(dispatch_object_t *)&self->_mode);
    return;
  }
LABEL_23:
  [a4 setError:[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0]];
  [a4 setResult:[NSNumber numberWithBool:0]];
  if (v17 != -1) {
    close(v17);
  }
}

- (void)setUrl:(id)a3
{
  if ([(GTBaseSocketTransport_replayer *)self connected])
  {
    if (s_logUsingOsLog)
    {
      v6 = gt_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        CFStringRef v7 = "fail: tried to set socket path on connected unix domain socket transport";
        uint64_t v8 = v6;
        uint32_t v9 = 2;
        goto LABEL_11;
      }
    }
    else
    {
      CFStringRef v11 = __stderrp;
      [+[NSString stringWithFormat:@"fail: tried to set socket path on connected unix domain socket transport"] UTF8String];
      fprintf(v11, "%s\n");
    }
LABEL_14:
    abort();
  }
  if (a3 && ![a3 filePathURL])
  {
    if (s_logUsingOsLog)
    {
      CFStringRef v10 = gt_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v15 = objc_msgSend(objc_msgSend(a3, "absoluteString"), "UTF8String");
        CFStringRef v7 = "fail: unix domain socket url must be a file url: %s";
        uint64_t v8 = v10;
        uint32_t v9 = 12;
LABEL_11:
        _os_log_fault_impl(&def_1C1270, v8, OS_LOG_TYPE_FAULT, v7, buf, v9);
        abort();
      }
    }
    else
    {
      uint64_t v12 = __stderrp;
      -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"fail: unix domain socket url must be a file url: %s", objc_msgSend(objc_msgSend(a3, "absoluteString"), "UTF8String")), "UTF8String");
      fprintf(v12, "%s\n");
    }
    goto LABEL_14;
  }
  queue = self->super.super.super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __38__GTUNIXDomainSocketTransport_setUrl___block_invoke;
  block[3] = &unk_7451D8;
  block[4] = a3;
  block[5] = self;
  dispatch_sync(queue, block);
}

- (GTUNIXDomainSocketTransport_replayer)initWithMode:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTUNIXDomainSocketTransport_replayer;
  result = [(GTBaseSocketTransport_replayer *)&v5 init];
  if (result) {
    *(_DWORD *)(&result->super._scheduledReadOnWritableSocket + 3) = a3;
  }
  return result;
}

@end