@interface DYLaunchdCheckin
- (DYLaunchdCheckin)checkinWithBlock:(id)a3;
- (DYLaunchdCheckin)initWithSocketPath:(id)a3;
- (id)_connectToSocketDescriptor:(int)a3;
- (int)_tcpListenSocketDescriptor;
- (int)_unixListenSocketDescriptor;
@end

@implementation DYLaunchdCheckin

- (DYLaunchdCheckin)initWithSocketPath:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DYLaunchdCheckin;
  v5 = [(DYLaunchdCheckin *)&v14 init];
  v6 = NSString;
  v7 = [NSString stringWithUTF8String:object_getClassName(v5)];
  id v8 = [v6 stringWithFormat:@"gputools.%@.%p", v7, v5];
  dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v9;

  uint64_t v11 = [v4 copy];
  socketPath = v5->_socketPath;
  v5->_socketPath = (NSString *)v11;

  return v5;
}

- (id)_connectToSocketDescriptor:(int)a3
{
  v5 = objc_opt_new();
  fcntl(a3, 4, 4);
  v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83E8], a3, 0, (dispatch_queue_t)self->_queue);
  connSource = self->_connSource;
  self->_connSource = v6;

  id v8 = self->_connSource;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __47__DYLaunchdCheckin__connectToSocketDescriptor___block_invoke;
  handler[3] = &unk_2653335D0;
  int v18 = a3;
  handler[4] = self;
  dispatch_source_set_cancel_handler(v8, handler);
  dispatch_queue_t v9 = self->_connSource;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__DYLaunchdCheckin__connectToSocketDescriptor___block_invoke_2;
  v14[3] = &unk_2653335F8;
  v14[4] = self;
  int v16 = a3;
  id v10 = v5;
  id v15 = v10;
  dispatch_source_set_event_handler(v9, v14);
  dispatch_resume((dispatch_object_t)self->_connSource);
  uint64_t v11 = v15;
  id v12 = v10;

  return v12;
}

void __47__DYLaunchdCheckin__connectToSocketDescriptor___block_invoke(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

void __47__DYLaunchdCheckin__connectToSocketDescriptor___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!dispatch_source_testcancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 8)))
  {
    socklen_t v4 = 0;
    if (accept(*(_DWORD *)(a1 + 48), &v5, &v4) == -1)
    {
      v3 = [MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
      [*(id *)(a1 + 40) setError:v3];

      [NSNumber numberWithBool:0];
    }
    else
    {
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
      [NSNumber numberWithBool:1];
    uint64_t v2 = };
    [*(id *)(a1 + 40) setResult:v2];
  }
}

- (int)_tcpListenSocketDescriptor
{
  return -1;
}

- (int)_unixListenSocketDescriptor
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = socket(1, 1, 0);
  bzero(&v6, 0x6AuLL);
  v6.sa_family = 1;
  socklen_t v4 = [(NSString *)self->_socketPath fileSystemRepresentation];
  v6.sa_len = strlen(v4);
  strncpy(v6.sa_data, v4, 0x67uLL);
  if (bind(v3, &v6, 0x6Au)) {
    return -1;
  }
  if (listen(v3, 1)) {
    return -1;
  }
  return v3;
}

- (DYLaunchdCheckin)checkinWithBlock:(id)a3
{
  id v9 = a3;
  socklen_t v4 = (void *)[v9 copy];
  id block = self->_block;
  self->_id block = v4;

  uint64_t v6 = [(DYLaunchdCheckin *)self _unixListenSocketDescriptor];
  if (v6 != -1) {
    id v7 = [(DYLaunchdCheckin *)self _connectToSocketDescriptor:v6];
  }

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socketPath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_connSource, 0);
}

@end