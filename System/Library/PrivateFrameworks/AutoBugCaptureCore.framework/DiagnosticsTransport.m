@interface DiagnosticsTransport
- (DiagnosticsTransport)init;
- (void)setListeningPort:(const char *)a3;
- (void)shutdown;
@end

@implementation DiagnosticsTransport

- (DiagnosticsTransport)init
{
  v7.receiver = self;
  v7.super_class = (Class)DiagnosticsTransport;
  v2 = [(DiagnosticsTransport *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.symptoms.diagnostics_transport.queue", v3);
    transport_queue = v2->transport_queue;
    v2->transport_queue = (OS_dispatch_queue *)v4;

    [(DiagnosticsTransport *)v2 setListeningPort:"com.apple.symptom_diagnostics"];
  }
  return v2;
}

void __41__DiagnosticsTransport_setListeningPort___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 8) resume];
  v2 = xpcLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 136315138;
    uint64_t v5 = v3;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_DEFAULT, "started listener for service %s", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setListeningPort:(const char *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = xpcLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = a3;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsTransport started for service %s", buf, 0xCu);
  }

  if (self->listener)
  {
    uint64_t v6 = xpcLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      listener = self->listener;
      *(_DWORD *)buf = 134217984;
      v20 = (const char *)listener;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_ERROR, "DiagnosticsTransport: already initialized: %p", buf, 0xCu);
    }
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F08D88]);
    v9 = [NSString stringWithUTF8String:a3];
    v10 = (NSXPCListener *)[v8 initWithMachServiceName:v9];
    v11 = self->listener;
    self->listener = v10;

    v12 = [[DiagnosticsServiceImpl alloc] initWithQueue:self->transport_queue];
    service = self->service;
    self->service = v12;

    v14 = self->listener;
    if (v14 && self->service)
    {
      -[NSXPCListener setDelegate:](v14, "setDelegate:");
      dispatch_time_t v15 = dispatch_time(0, 500000000);
      transport_queue = self->transport_queue;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __41__DiagnosticsTransport_setListeningPort___block_invoke;
      v18[3] = &unk_263FC3158;
      v18[4] = self;
      v18[5] = a3;
      dispatch_after(v15, transport_queue, v18);
    }
    else
    {
      self->listener = 0;

      v17 = xpcLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_ERROR, "DiagnosticsTransport: failing to create the diagnostics channel", buf, 2u);
      }
    }
  }
}

- (void)shutdown
{
  if (self->listener)
  {
    [(DiagnosticsServiceImpl *)self->service shutdown];
    service = self->service;
    self->service = 0;

    listener = self->listener;
    self->listener = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->transport_queue, 0);
  objc_storeStrong((id *)&self->service, 0);

  objc_storeStrong((id *)&self->listener, 0);
}

@end