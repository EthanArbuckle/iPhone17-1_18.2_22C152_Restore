@interface DYUNIXDomainSocketTransport
- (DYUNIXDomainSocketTransport)initWithMode:(int)a3;
- (id)connect;
- (void)_connectClient:(id)a3 future:(id)a4;
- (void)_connectServer:(id)a3 future:(id)a4;
- (void)_invalidate;
- (void)setUrl:(id)a3;
@end

@implementation DYUNIXDomainSocketTransport

- (DYUNIXDomainSocketTransport)initWithMode:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DYUNIXDomainSocketTransport;
  result = [(DYBaseSocketTransport *)&v5 init];
  if (result) {
    *(_DWORD *)(&result->super._scheduledReadOnWritableSocket + 3) = a3;
  }
  return result;
}

- (void)setUrl:(id)a3
{
  if ([(DYBaseSocketTransport *)self connected]) {
    dy_abort("tried to set socket path on connected unix domain socket transport");
  }
  if (a3 && ![a3 filePathURL]) {
    dy_abort("unix domain socket url must be a file url: %s", (const char *)objc_msgSend((id)objc_msgSend(a3, "absoluteString"), "UTF8String"));
  }
  queue = self->super.super.super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__DYUNIXDomainSocketTransport_setUrl___block_invoke;
  block[3] = &unk_265335F20;
  block[4] = a3;
  block[5] = self;
  dispatch_sync(queue, block);
}

void *__38__DYUNIXDomainSocketTransport_setUrl___block_invoke(void *result)
{
  v1 = *(void **)(result[5] + 8);
  if ((void *)result[4] != v1)
  {
    v2 = result;

    result = (id)v2[4];
    *(void *)(v2[5] + 8) = result;
  }
  return result;
}

- (void)_connectServer:(id)a3 future:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  CFStringRef v7 = (const __CFString *)a3;
  if (!a3)
  {
    v8 = (__CFString *)NSTemporaryDirectory();
    if (!v8) {
      v8 = @"/tmp";
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
    v10 = @"DYErrorDomain";
    uint64_t v11 = 39;
LABEL_20:
    objc_msgSend(a4, "setError:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", v10, v11, 0));
    objc_msgSend(a4, "setResult:", objc_msgSend(NSNumber, "numberWithBool:", 0));
    return;
  }
  if (!a3)
  {
    int v12 = mkstemp(buffer);
    if (v12 == -1)
    {
      int v16 = -1;
      goto LABEL_23;
    }
    int v13 = v12;
    CFStringRef v7 = (id)CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], buffer);
    close(v13);
  }
  if (!self->super.super.super._url) {
    self->super.super.super._url = (NSURL *)[objc_alloc(NSURL) initFileURLWithPath:v7];
  }
  v24.sa_family = 1;
  strlcpy(v24.sa_data, buffer, 0x68uLL);
  int v14 = strlen(v24.sa_data);
  int v15 = socket(1, 1, 0);
  if (v15 == -1)
  {
    v19 = (__CFString *)*MEMORY[0x263F08438];
    uint64_t v11 = *__error();
    v10 = v19;
    goto LABEL_20;
  }
  int v16 = v15;
  unlink(v24.sa_data);
  if (bind(v16, &v24, v14 + 2) != -1 && listen(v16, 1) != -1)
  {
    fcntl(v16, 4, 4);
    v17 = dispatch_source_create(MEMORY[0x263EF83E8], v16, 0, (dispatch_queue_t)self->super.super.super._queue);
    *(void *)&self->_mode = v17;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __53__DYUNIXDomainSocketTransport__connectServer_future___block_invoke;
    handler[3] = &unk_265335F48;
    int v23 = v16;
    handler[4] = self;
    handler[5] = a4;
    dispatch_source_set_cancel_handler(v17, handler);
    v18 = *(NSObject **)&self->_mode;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __53__DYUNIXDomainSocketTransport__connectServer_future___block_invoke_2;
    v20[3] = &unk_265335F48;
    int v21 = v16;
    v20[4] = self;
    v20[5] = a4;
    dispatch_source_set_event_handler(v18, v20);
    dispatch_resume(*(dispatch_object_t *)&self->_mode);
    return;
  }
LABEL_23:
  objc_msgSend(a4, "setError:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", *MEMORY[0x263F08438], *__error(), 0));
  objc_msgSend(a4, "setResult:", objc_msgSend(NSNumber, "numberWithBool:", 0));
  if (v16 != -1) {
    close(v16);
  }
}

unsigned char *__53__DYUNIXDomainSocketTransport__connectServer_future___block_invoke(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 272));
  *(void *)(*(void *)(a1 + 32) + 272) = 0;
  result = *(unsigned char **)(a1 + 32);
  if (result[52])
  {
    objc_msgSend(*(id *)(a1 + 40), "setError:", objc_msgSend(result, "error"));
    uint64_t v3 = [NSNumber numberWithBool:0];
    v4 = *(void **)(a1 + 40);
    return (unsigned char *)[v4 setResult:v3];
  }
  return result;
}

intptr_t __53__DYUNIXDomainSocketTransport__connectServer_future___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  intptr_t result = dispatch_source_testcancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 272));
  if (!result)
  {
    socklen_t v9 = 106;
    uint64_t v3 = accept(*(_DWORD *)(a1 + 48), &v10, &v9);
    if (v3 == -1)
    {
      CFStringRef v7 = +[DYError errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
      v8 = *(void **)(a1 + 40);
      v6 = (id *)(a1 + 40);
      [v8 setError:v7];
      uint64_t v5 = [NSNumber numberWithBool:0];
    }
    else
    {
      uint64_t v4 = v3;
      dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 272));
      [*(id *)(a1 + 32) runWithSocket:v4];
      uint64_t v5 = [NSNumber numberWithBool:1];
      v6 = (id *)(a1 + 40);
    }
    return [*v6 setResult:v5];
  }
  return result;
}

- (void)_connectClient:(id)a3 future:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
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
        int v15 = strlen(v19.sa_data);
        if (connect(v8, &v19, v15 + 2) != -1)
        {
          [(DYBaseSocketTransport *)self runWithSocket:v8];
          uint64_t v16 = 1;
LABEL_14:
          objc_msgSend(a4, "setResult:", objc_msgSend(NSNumber, "numberWithBool:", v16));
          return;
        }
        v17 = (__CFString *)*MEMORY[0x263F08438];
        uint64_t v10 = *__error();
        socklen_t v9 = v17;
      }
      else
      {
        socklen_t v9 = @"DYErrorDomain";
        uint64_t v10 = 1;
      }
      objc_msgSend(a4, "setError:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", v9, v10, 0));
      uint64_t v16 = 0;
      goto LABEL_14;
    }
    int v13 = (__CFString *)*MEMORY[0x263F08438];
    uint64_t v12 = *__error();
    uint64_t v11 = v13;
  }
  else
  {
    uint64_t v11 = @"DYErrorDomain";
    uint64_t v12 = 38;
  }
  objc_msgSend(a4, "setError:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", v11, v12, 0));
  uint64_t v14 = [NSNumber numberWithBool:0];

  [a4 setResult:v14];
}

- (id)connect
{
  id v3 = +[DYFuture future];
  queue = self->super.super.super._queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__DYUNIXDomainSocketTransport_connect__block_invoke;
  v6[3] = &unk_265335F20;
  v6[4] = self;
  v6[5] = v3;
  dispatch_async(queue, v6);
  return v3;
}

uint64_t __38__DYUNIXDomainSocketTransport_connect__block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[52])
  {
    uint64_t v3 = 32;
LABEL_3:
    objc_msgSend(*(id *)(a1 + 40), "setError:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", @"DYErrorDomain", v3, 0));
    uint64_t v4 = NSNumber;
    uint64_t v5 = 0;
LABEL_6:
    uint64_t v6 = [v4 numberWithBool:v5];
    uint64_t v7 = *(void **)(a1 + 40);
    return [v7 setResult:v6];
  }
  if ([v2 connected])
  {
    uint64_t v4 = NSNumber;
    uint64_t v5 = 1;
    goto LABEL_6;
  }
  socklen_t v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) filePathURL];
  if (*(void *)(*(void *)(a1 + 32) + 8)) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    uint64_t v3 = 257;
    goto LABEL_3;
  }
  uint64_t v11 = [v9 path];
  uint64_t v12 = *(_DWORD **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  if (v12[67] == 2)
  {
    return [v12 _connectServer:v11 future:v13];
  }
  else
  {
    return [v12 _connectClient:v11 future:v13];
  }
}

- (void)_invalidate
{
  uint64_t v3 = *(NSObject **)&self->_mode;
  if (v3) {
    dispatch_source_cancel(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)DYUNIXDomainSocketTransport;
  [(DYBaseSocketTransport *)&v4 _invalidate];
}

@end