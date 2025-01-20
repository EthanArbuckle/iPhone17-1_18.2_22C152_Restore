@interface AFKEndpointInterface
+ (id)withService:(unsigned int)a3;
+ (id)withService:(unsigned int)a3 properties:(id)a4;
- (AFKEndpointInterface)initWithService:(unsigned int)a3;
- (int)compleOOBBuffer:(unint64_t)a3;
- (int)enqueueCommand:(unsigned int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5 outputPayloadSize:(unint64_t)a6 context:(void *)a7 options:(unsigned int)a8;
- (int)enqueueCommand:(unsigned int)a3 timestamp:(unint64_t)a4 inputBuffer:(const void *)a5 inputBufferSize:(unint64_t)a6 outputPayloadSize:(unint64_t)a7 context:(void *)a8 options:(unsigned int)a9;
- (int)enqueueCommandSync:(unsigned int)a3 timestamp:(unint64_t)a4 inputBuffer:(const void *)a5 inputBufferSize:(unint64_t)a6 responseTimestamp:(unint64_t *)a7 outputBuffer:(void *)a8 inOutBufferSize:(unint64_t *)a9 options:(unsigned int)a10;
- (int)enqueueDescriptor:(id)a3 packetType:(unsigned int)a4 timestamp:(unint64_t)a5 options:(unsigned int)a6;
- (int)enqueueReport:(unsigned int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5 options:(unsigned int)a6;
- (int)enqueueReport:(unsigned int)a3 timestamp:(unint64_t)a4 inputBuffer:(const void *)a5 inputBufferSize:(unint64_t)a6 options:(unsigned int)a7;
- (int)enqueueResponseForContext:(void *)a3 status:(int)a4 outputBuffer:(void *)a5 outputBufferSize:(unint64_t)a6 options:(unsigned int)a7;
- (int)enqueueResponseForContext:(void *)a3 status:(int)a4 timestamp:(unint64_t)a5 outputBuffer:(void *)a6 outputBufferSize:(unint64_t)a7 options:(unsigned int)a8;
- (int)startSession:(BOOL)a3;
- (unint64_t)regID;
- (void)_cancel;
- (void)activate;
- (void)activate:(unsigned int)a3;
- (void)cancel;
- (void)dealloc;
- (void)dequeueDataMessage:(_IODataQueueMemory *)a3;
- (void)handleCommand:(char *)a3 size:(unsigned int)a4;
- (void)handleDescriptor:(char *)a3 size:(unsigned int)a4;
- (void)handleQueue:(char *)a3 size:(unsigned int)a4;
- (void)handleReport:(char *)a3 size:(unsigned int)a4;
- (void)handleResponse:(char *)a3 size:(unsigned int)a4;
- (void)setCommandHandler:(id)a3;
- (void)setCommandHandlerWithReturn:(id)a3;
- (void)setDescriptorHandler:(id)a3;
- (void)setDescriptorManagers:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setReportHandler:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation AFKEndpointInterface

- (void)dequeueDataMessage:(_IODataQueueMemory *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint32_t dataSize = 0;
  v5 = IODataQueuePeek(a3);
  if (v5)
  {
    v6 = v5;
    do
    {
      uint32_t dataSize = v6->size;
      if (dataSize > 0xF)
      {
        int v9 = v6->data[0];
        data = v6->data;
        switch(v9)
        {
          case 1:
            -[AFKEndpointInterface handleReport:size:](self, "handleReport:size:", data);
            break;
          case 2:
            -[AFKEndpointInterface handleCommand:size:](self, "handleCommand:size:", data);
            break;
          case 3:
            -[AFKEndpointInterface handleDescriptor:size:](self, "handleDescriptor:size:", data);
            break;
          case 4:
            -[AFKEndpointInterface handleResponse:size:](self, "handleResponse:size:", data);
            break;
          case 5:
            -[AFKEndpointInterface handleQueue:size:](self, "handleQueue:size:", data);
            break;
          default:
            v7 = _AFKUserLog();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            {
              unint64_t v11 = [(AFKEndpointInterface *)self regID];
              uint32_t v12 = *data;
              *(_DWORD *)buf = 134218240;
              unint64_t v18 = v11;
              __int16 v19 = 1024;
              uint32_t v20 = v12;
              _os_log_error_impl(&dword_1DB6F4000, v7, OS_LOG_TYPE_ERROR, "0x%llx: Unknown message type:0x%x", buf, 0x12u);
            }
            goto LABEL_6;
        }
      }
      else
      {
        v7 = _AFKUserLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          unint64_t v10 = [(AFKEndpointInterface *)self regID];
          *(_DWORD *)buf = 134218240;
          unint64_t v18 = v10;
          __int16 v19 = 1024;
          uint32_t v20 = dataSize;
          _os_log_error_impl(&dword_1DB6F4000, v7, OS_LOG_TYPE_ERROR, "0x%llx: Data queue entry size:0x%x", buf, 0x12u);
        }
LABEL_6:
      }
      IODataQueueDequeue(a3, 0, &dataSize);
      v6 = IODataQueuePeek(a3);
    }
    while (v6);
  }
  v13 = (atomic_uint *)((char *)a3->queue + a3->queueSize);
  if (atomic_load((unsigned int *)v13))
  {
    atomic_fetch_add(v13, 0xFFFFFFFF);
    if (IOConnectCallScalarMethod(self->_connect, 8u, 0, 0, 0, 0))
    {
      v15 = _AFKUserLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        [(AFKEndpointInterface *)self regID];
        -[AFKEndpointInterface dequeueDataMessage:]();
      }
    }
  }
}

- (void)handleReport:(char *)a3 size:(unsigned int)a4
{
  kdebug_trace();
  id reportHandler = self->_reportHandler;
  if ((*(_WORD *)a3 & 0x100) != 0)
  {
    (*((void (**)(id, AFKEndpointInterface *, void, void, void, void))reportHandler + 2))(reportHandler, self, *((unsigned int *)a3 + 1), *((void *)a3 + 1), *((void *)a3 + 3), *((void *)a3 + 2));
    uint64_t v8 = *((void *)a3 + 3);
    [(AFKEndpointInterface *)self compleOOBBuffer:v8];
  }
  else
  {
    v7 = (void (*)(void))*((void *)reportHandler + 2);
    v7();
  }
}

void __33__AFKEndpointInterface_activate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = v9;
    v7 = WeakRetained;
    uint64_t v8 = v7;
    if (a2 == 8)
    {
      [v7 _cancel];
    }
    else if (a2 == 2)
    {
      [v7 dequeueDataMessage:v7[13]];
    }
  }
}

+ (id)withService:(unsigned int)a3
{
  v3 = [[AFKEndpointInterface alloc] initWithService:*(void *)&a3];
  return v3;
}

+ (id)withService:(unsigned int)a3 properties:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = [[AFKEndpointInterface alloc] initWithService:v4];
  if (v6)
  {
    uint64_t v7 = [v5 mutableCopy];
    properties = v6->_properties;
    v6->_properties = (NSMutableDictionary *)v7;
  }
  return v6;
}

- (AFKEndpointInterface)initWithService:(unsigned int)a3
{
  if (IOObjectRetain(a3))
  {
    id v5 = 0;
  }
  else
  {
    self->_service = a3;
    IORegistryEntryGetRegistryEntryID(a3, &self->_regID);
    id v5 = self;
  }

  return v5;
}

- (void)activate
{
}

- (void)activate:(unsigned int)a3
{
  kern_return_t v7;
  NSMutableDictionary *properties;
  void *v9;
  NSSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  size_t v15;
  IONotificationPort *v16;
  unint64_t v17;
  mach_port_t NotificationPort;
  OS_dispatch_mach *v19;
  OS_dispatch_mach *dataQueueMachChannel;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *queue;
  uint64_t v25;
  unint64_t v26;
  NSMutableDictionary *v27;
  void *v28;
  void block[6];
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  void v34[4];
  id v35;
  id location;
  unint64_t v37;
  _IODataQueueMemory *v38;
  long long v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  AFKEndpointInterface *v43;
  unsigned char v44[128];
  void v45[4];
  uint8_t buf[32];
  long long v47;
  long long v48;
  long long v49;
  uint64_t input[5];

  input[2] = *MEMORY[0x1E4F143B8];
  input[0] = 0;
  input[1] = a3;
  v37 = 0;
  v38 = 0;
  objc_initWeak(&location, self);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __33__AFKEndpointInterface_activate___block_invoke;
  v34[3] = &unk_1E6C14EF8;
  objc_copyWeak(&v35, &location);
  v28 = (void *)MEMORY[0x1E01910F0](v34);
  if (atomic_fetch_or((atomic_uint *volatile)&self->_state, 1u)) {
    goto LABEL_32;
  }
  uint64_t v4 = self->_queue;
  if (!v4)
  {
    v45[0] = 0;
    v48 = 0u;
    v49 = 0u;
    v47 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    LODWORD(v39) = 134217984;
    *(void *)((char *)&v39 + 4) = 0;
    _os_log_send_and_compose_impl();
    uint64_t v21 = _os_crash_msg();
    -[AFKEndpointInterface activate:](v21);
  }

  id v5 = (unsigned int *)MEMORY[0x1E4F14960];
  p_connect = &self->_connect;
  uint64_t v7 = IOServiceOpen(self->_service, *MEMORY[0x1E4F14960], 0x696F706Bu, &self->_connect);
  if (v7)
  {
    v22 = _AFKUserLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      [(AFKEndpointInterface *)self regID];
      -[AFKMemoryDescriptorManager initWithService:]();
    }
    goto LABEL_52;
  }
  properties = self->_properties;
  if (properties)
  {
    uint64_t v7 = IOConnectSetCFProperties(*p_connect, properties);
    if (v7)
    {
      v22 = _AFKUserLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v26 = [(AFKEndpointInterface *)self regID];
        v27 = self->_properties;
        *(_DWORD *)buf = 134218498;
        *(void *)&uint8_t buf[4] = v26;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v7;
        *(_WORD *)&buf[18] = 2112;
        *(void *)&buf[20] = v27;
        _os_log_error_impl(&dword_1DB6F4000, v22, OS_LOG_TYPE_ERROR, "0x%llx: Set IOConnectSetCFProperties:0x%x for:%@", buf, 0x1Cu);
      }
LABEL_52:
      id v9 = 0;
      goto LABEL_53;
    }
  }
  if (self->_reportHandler) {
    input[0] |= 1uLL;
  }
  if (self->_commandHandlerWithReturn || self->_commandHandler) {
    input[0] |= 2uLL;
  }
  if (self->_descriptorHandler) {
    input[0] |= 3uLL;
  }
  if ([(NSSet *)self->_descriptorManagers count])
  {
    if ([(NSSet *)self->_descriptorManagers count] >= 0x10000)
    {
      v45[0] = 0;
      v48 = 0u;
      v49 = 0u;
      v47 = 0u;
      memset(buf, 0, sizeof(buf));
      os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      LODWORD(v39) = 134217984;
      *(void *)((char *)&v39 + 4) = 0;
      _os_log_send_and_compose_impl();
      v25 = _os_crash_msg();
      -[AFKEndpointInterface activate:](v25);
    }
    id v9 = malloc_type_calloc([(NSSet *)self->_descriptorManagers count], 8uLL, 0x100004000313F17uLL);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    unint64_t v10 = self->_descriptorManagers;
    unint64_t v11 = [(NSSet *)v10 countByEnumeratingWithState:&v30 objects:v44 count:16];
    if (v11)
    {
      uint32_t v12 = 0;
      v13 = *(void *)v31;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v10);
          }
          v9[v12 + i] = [*(id *)(*((void *)&v30 + 1) + 8 * i) regID];
        }
        unint64_t v11 = [(NSSet *)v10 countByEnumeratingWithState:&v30 objects:v44 count:16];
        v12 += i;
      }
      while (v11);
    }

    v15 = 8 * [(NSSet *)self->_descriptorManagers count];
  }
  else
  {
    v15 = 0;
    id v9 = 0;
  }
  v16 = IONotificationPortCreate(*MEMORY[0x1E4F2EEF0]);
  self->_asyncPort = v16;
  if (v16)
  {
    IONotificationPortSetDispatchQueue(v16, (dispatch_queue_t)self->_queue);
    uint64_t v7 = MEMORY[0x1E0190D80](*p_connect, 0, *v5, &v38, &v37, 1);
    if (!v7)
    {
      v17 = v37;
      self->_dataQueue = v38;
      self->_dataQueueSize = v17;
      NotificationPort = IODataQueueAllocateNotificationPort();
      self->_dataQueuePort = NotificationPort;
      if (NotificationPort)
      {
        __int16 v19 = (OS_dispatch_mach *)dispatch_mach_create();
        dataQueueMachChannel = self->_dataQueueMachChannel;
        self->_dataQueueMachChannel = v19;

        if (self->_dataQueueMachChannel)
        {
          dispatch_mach_connect();
          objc_storeStrong(&self->me, self);
          uint64_t v7 = MEMORY[0x1E0190DA0](self->_connect, 0, self->_dataQueuePort, 0);
          if (v7)
          {
            v22 = _AFKUserLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              [(AFKEndpointInterface *)self regID];
              -[AFKEndpointInterface activate:].cold.6();
            }
          }
          else
          {
            uint64_t v7 = IOConnectCallMethod(*p_connect, 0, input, 2u, v9, v15, 0, 0, 0, 0);
            if (!v7) {
              goto LABEL_30;
            }
            v22 = _AFKUserLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              [(AFKEndpointInterface *)self regID];
              -[AFKEndpointInterface activate:].cold.5();
            }
          }
          goto LABEL_53;
        }
        v23 = _AFKUserLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          [(AFKEndpointInterface *)(uint64_t)buf activate:v23];
        }
      }
      else
      {
        v23 = _AFKUserLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          [(AFKEndpointInterface *)(uint64_t)buf activate:v23];
        }
      }

      goto LABEL_30;
    }
    v22 = _AFKUserLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      [(AFKEndpointInterface *)self regID];
      -[AFKMemoryDescriptor mapDescriptor]();
    }
  }
  else
  {
    v22 = _AFKUserLog();
    uint64_t v7 = -536870210;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      [(AFKEndpointInterface *)(uint64_t)v45 activate:v22];
    }
  }
LABEL_53:

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy_;
  *(void *)&v47 = __Block_byref_object_dispose_;
  *((void *)&v47 + 1) = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.IOKit" code:v7 userInfo:0];
  *(void *)&v39 = 0;
  *((void *)&v39 + 1) = &v39;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  v43 = self;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__AFKEndpointInterface_activate___block_invoke_25;
  block[3] = &unk_1E6C14F20;
  block[4] = &v39;
  block[5] = buf;
  dispatch_async(queue, block);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(buf, 8);
LABEL_30:
  if (v9) {
    free(v9);
  }
LABEL_32:

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

uint64_t __33__AFKEndpointInterface_activate___block_invoke_25(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 96);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)cancel
{
}

uint64_t __30__AFKEndpointInterface_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (void)_cancel
{
}

- (void)setDispatchQueue:(id)a3
{
  uint64_t v4 = (OS_dispatch_queue *)a3;
  if (self->_queue)
  {
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v5 = _os_crash_msg();
    -[AFKEndpointInterface activate:](v5);
  }
  self->_queue = v4;
}

- (void)setResponseHandler:(id)a3
{
  id v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:](v6);
  }
  uint64_t v4 = (void *)MEMORY[0x1E01910F0]();
  id responseHandler = self->_responseHandler;
  self->_id responseHandler = v4;
}

- (void)setReportHandler:(id)a3
{
  id v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:](v6);
  }
  uint64_t v4 = (void *)MEMORY[0x1E01910F0]();
  id reportHandler = self->_reportHandler;
  self->_id reportHandler = v4;
}

- (void)setCommandHandlerWithReturn:(id)a3
{
  id v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:](v6);
  }
  uint64_t v4 = (void *)MEMORY[0x1E01910F0]();
  id commandHandlerWithReturn = self->_commandHandlerWithReturn;
  self->_id commandHandlerWithReturn = v4;
}

- (void)setCommandHandler:(id)a3
{
  id v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:](v6);
  }
  uint64_t v4 = (void *)MEMORY[0x1E01910F0]();
  id commandHandler = self->_commandHandler;
  self->_id commandHandler = v4;
}

- (void)setDescriptorHandler:(id)a3
{
  id v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:](v6);
  }
  uint64_t v4 = (void *)MEMORY[0x1E01910F0]();
  id descriptorHandler = self->_descriptorHandler;
  self->_id descriptorHandler = v4;
}

- (void)setDescriptorManagers:(id)a3
{
  uint64_t v4 = (NSSet *)a3;
  uint64_t v5 = v4;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v7 = _os_crash_msg();
    -[AFKEndpointInterface activate:](v7);
  }
  if ([(NSSet *)v4 count] >= 0x10000)
  {
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v8 = _os_crash_msg();
    -[AFKEndpointInterface activate:](v8);
  }
  descriptorManagers = self->_descriptorManagers;
  self->_descriptorManagers = v5;
}

- (void)setEventHandler:(id)a3
{
  id v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    uint64_t v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:](v6);
  }
  uint64_t v4 = (void *)MEMORY[0x1E01910F0]();
  id eventHandler = self->_eventHandler;
  self->_id eventHandler = v4;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_queue && self->_state != 7)
  {
    uint64_t v8 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    unsigned int state = self->_state;
    int v9 = 67109120;
    unsigned int v10 = state;
    _os_log_send_and_compose_impl();
    uint64_t v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:](v6);
  }
  mach_port_name_t dataQueuePort = self->_dataQueuePort;
  if (dataQueuePort) {
    mach_port_mod_refs(*MEMORY[0x1E4F14960], dataQueuePort, 1u, -1);
  }
  io_object_t service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_io_object_t service = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)AFKEndpointInterface;
  [(AFKEndpointInterface *)&v7 dealloc];
}

- (int)enqueueCommand:(unsigned int)a3 timestamp:(unint64_t)a4 inputBuffer:(const void *)a5 inputBufferSize:(unint64_t)a6 outputPayloadSize:(unint64_t)a7 context:(void *)a8 options:(unsigned int)a9
{
  kern_return_t v17;
  uint64_t v19;
  uint64_t input[11];

  input[10] = *MEMORY[0x1E4F143B8];
  if (self->_state != 1) {
    -[AFKEndpointInterface enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:](&v19, input);
  }
  kdebug_trace();
  uint64_t v16 = malloc_type_calloc(0x18uLL, 1uLL, 0x3EB6965uLL);
  v16[2] = a7;
  *uint64_t v16 = a8;
  input[0] = a3;
  input[1] = a4;
  input[2] = (uint64_t)a5;
  input[3] = a6;
  input[4] = (uint64_t)v16;
  input[5] = a7;
  input[6] = ~(a9 >> 2) & 8 | a9;
  v17 = IOConnectCallMethod(self->_connect, 2u, input, 7u, 0, 0, 0, 0, 0, 0);
  if (v17) {
    free(v16);
  }
  return v17;
}

- (int)enqueueCommand:(unsigned int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5 outputPayloadSize:(unint64_t)a6 context:(void *)a7 options:(unsigned int)a8
{
  LODWORD(v9) = a8;
  return [(AFKEndpointInterface *)self enqueueCommand:*(void *)&a3 timestamp:0 inputBuffer:a4 inputBufferSize:a5 outputPayloadSize:a6 context:a7 options:v9];
}

- (int)enqueueCommandSync:(unsigned int)a3 timestamp:(unint64_t)a4 inputBuffer:(const void *)a5 inputBufferSize:(unint64_t)a6 responseTimestamp:(unint64_t *)a7 outputBuffer:(void *)a8 inOutBufferSize:(unint64_t *)a9 options:(unsigned int)a10
{
  input[10] = *MEMORY[0x1E4F143B8];
  if (self->_state != 1) {
    -[AFKEndpointInterface enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:](&outputCnt, input);
  }
  kdebug_trace();
  input[0] = a3;
  input[1] = a4;
  input[2] = a10;
  input[3] = (uint64_t)a8;
  input[4] = *a9;
  LODWORD(outputCnt) = 2;
  int result = IOConnectCallMethod(self->_connect, 7u, input, 5u, a5, a6, &v18, (uint32_t *)&outputCnt, 0, 0);
  if (!result)
  {
    int result = -536870210;
    if (outputCnt == 2)
    {
      if (v19 <= *a9)
      {
        *a9 = v19;
        int result = 0;
        if (a7) {
          *a7 = v18;
        }
      }
    }
    else
    {
      return -536870199;
    }
  }
  return result;
}

- (int)enqueueReport:(unsigned int)a3 timestamp:(unint64_t)a4 inputBuffer:(const void *)a5 inputBufferSize:(unint64_t)a6 options:(unsigned int)a7
{
  input[10] = *MEMORY[0x1E4F143B8];
  if (self->_state != 1) {
    -[AFKEndpointInterface enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:](&v14, input);
  }
  kdebug_trace();
  input[0] = a3;
  input[1] = a4;
  input[2] = ~(4 * a7) & 0x20 | a7;
  return IOConnectCallMethod(self->_connect, 4u, input, 3u, a5, a6, 0, 0, 0, 0);
}

- (int)enqueueReport:(unsigned int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5 options:(unsigned int)a6
{
  return [(AFKEndpointInterface *)self enqueueReport:*(void *)&a3 timestamp:0 inputBuffer:a4 inputBufferSize:a5 options:*(void *)&a6];
}

- (int)enqueueResponseForContext:(void *)a3 status:(int)a4 timestamp:(unint64_t)a5 outputBuffer:(void *)a6 outputBufferSize:(unint64_t)a7 options:(unsigned int)a8
{
  input[10] = *MEMORY[0x1E4F143B8];
  if (self->_state != 1) {
    -[AFKEndpointInterface enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:](&v16, input);
  }
  kdebug_trace();
  input[0] = (uint64_t)a3;
  input[1] = a4;
  input[2] = a5;
  input[3] = a8 | 8;
  return IOConnectCallMethod(self->_connect, 3u, input, 4u, a6, a7, 0, 0, 0, 0);
}

- (int)enqueueResponseForContext:(void *)a3 status:(int)a4 outputBuffer:(void *)a5 outputBufferSize:(unint64_t)a6 options:(unsigned int)a7
{
  return [(AFKEndpointInterface *)self enqueueResponseForContext:a3 status:*(void *)&a4 timestamp:0 outputBuffer:a5 outputBufferSize:a6 options:*(void *)&a7];
}

- (int)enqueueDescriptor:(id)a3 packetType:(unsigned int)a4 timestamp:(unint64_t)a5 options:(unsigned int)a6
{
  kern_return_t v13;
  uint64_t v15;
  uint64_t input[2];
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  uint64_t v21;

  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  long long v11 = v10;
  if (self->_state != 1)
  {
    unint64_t v19 = 0u;
    uint32_t v20 = 0u;
    v17 = 0u;
    uint64_t v18 = 0u;
    *(_OWORD *)input = 0u;
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    long long v15 = _os_crash_msg();
    -[AFKEndpointInterface activate:](v15);
  }
  [v10 token];
  kdebug_trace();
  if (v11)
  {
    input[0] = a4;
    input[1] = a5;
    *(void *)&v17 = [v11 token];
    long long v12 = [v11 manager];
    *((void *)&v17 + 1) = [v12 regID];
    *(void *)&uint64_t v18 = ~(a6 >> 2) & 8 | a6;

    long long v13 = IOConnectCallScalarMethod(self->_connect, 6u, input, 5u, 0, 0);
    if (!v13) {
      [v11 handleEnqueue];
    }
  }
  else
  {
    long long v13 = -536870206;
  }

  return v13;
}

- (void)handleCommand:(char *)a3 size:(unsigned int)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((*(_WORD *)a3 & 0x100) != 0)
  {
    if (a4 <= 7) {
      -[AFKEndpointInterface handleCommand:size:](&v10, v11);
    }
    kdebug_trace();
    id commandHandlerWithReturn = self->_commandHandlerWithReturn;
    if (commandHandlerWithReturn || (id commandHandlerWithReturn = self->_commandHandler) != 0) {
      (*((void (**)(id, AFKEndpointInterface *, void, void, void, void, void, void))commandHandlerWithReturn
    }
       + 2))(commandHandlerWithReturn, self, *((void *)a3 + 3), *((unsigned int *)a3 + 1), *((void *)a3 + 1), *((void *)a3 + 5), *((void *)a3 + 4), *((unsigned int *)a3 + 4));
    uint64_t v9 = *((void *)a3 + 5);
    [(AFKEndpointInterface *)self compleOOBBuffer:v9];
  }
  else
  {
    if (a4 <= 7) {
      -[AFKEndpointInterface handleCommand:size:](&v10, v11);
    }
    kdebug_trace();
    id commandHandler = self->_commandHandlerWithReturn;
    if (commandHandler || (id commandHandler = self->_commandHandler) != 0)
    {
      objc_super v7 = (void (*)(void))*((void *)commandHandler + 2);
      v7();
    }
  }
}

- (void)handleResponse:(char *)a3 size:(unsigned int)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((*(_WORD *)a3 & 0x100) != 0)
  {
    if (a4 <= 7) {
      -[AFKEndpointInterface handleResponse:size:](&v7, v8);
    }
    uint64_t v6 = (void *)*((void *)a3 + 2);
    kdebug_trace();
    (*((void (**)(void))self->_responseHandler + 2))();
    [(AFKEndpointInterface *)self compleOOBBuffer:*((void *)a3 + 5)];
  }
  else
  {
    if (a4 <= 7) {
      -[AFKEndpointInterface handleResponse:size:](&v7, v8);
    }
    uint64_t v6 = (void *)*((void *)a3 + 2);
    kdebug_trace();
    (*((void (**)(void))self->_responseHandler + 2))();
  }
  free(v6);
}

- (void)handleDescriptor:(char *)a3 size:(unsigned int)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a4 <= 7) {
    -[AFKEndpointInterface handleDescriptor:size:](&v22, buf);
  }
  kdebug_trace();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = self->_descriptorManagers;
  uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
LABEL_4:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
      if (objc_msgSend(v10, "regID", (void)v18) == *((void *)a3 + 3)) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v7) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
    id v11 = v10;

    if (!v11) {
      goto LABEL_17;
    }
    if (a3[36]) {
      uint64_t v12 = off_1E6C14E58;
    }
    else {
      uint64_t v12 = off_1E6C14E68;
    }
    long long v13 = [(__objc2_class *)*v12 withManager:v11 capacity:*((unsigned int *)a3 + 8) token:*((void *)a3 + 2)];
    if (v13)
    {
      (*((void (**)(void))self->_descriptorHandler + 2))();
      goto LABEL_21;
    }
    uint64_t v14 = _AFKUserLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unint64_t v15 = [(AFKEndpointInterface *)self regID];
      uint64_t v17 = *((void *)a3 + 2);
      uint64_t v16 = *((void *)a3 + 3);
      *(_DWORD *)buf = 134218496;
      unint64_t v25 = v15;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      __int16 v28 = 2048;
      uint64_t v29 = v17;
      _os_log_error_impl(&dword_1DB6F4000, v14, OS_LOG_TYPE_ERROR, "0x%llx: Couldn't create descriptor for AFKDescMsg (regID:0x%llx token:0x%llx)", buf, 0x20u);
    }
  }
  else
  {
LABEL_10:

LABEL_17:
    uint64_t v14 = _AFKUserLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      [(AFKEndpointInterface *)(uint64_t)a3 handleDescriptor:[(AFKEndpointInterface *)self regID] size:v14];
    }
    id v11 = 0;
  }

  long long v13 = 0;
LABEL_21:
}

- (void)handleQueue:(char *)a3 size:(unsigned int)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a4 <= 7) {
    -[AFKEndpointInterface handleQueue:size:](&v11, v12, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7, v11, *(size_t **)&v12[0]);
  }
  [(AFKEndpointInterface *)self dequeueDataMessage:*((void *)a3 + 3)];
  uint64_t v10 = *((void *)a3 + 3);
  [(AFKEndpointInterface *)self compleOOBBuffer:v10];
}

- (int)compleOOBBuffer:(unint64_t)a3
{
  kern_return_t v5;
  NSObject *v6;
  uint8_t buf[4];
  unint64_t v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  kern_return_t v13;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a3;
  uint64_t v5 = IOConnectCallMethod(self->_connect, 9u, input, 1u, 0, 0, 0, 0, 0, 0);
  if (v5)
  {
    uint64_t v6 = _AFKUserLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v9 = [(AFKEndpointInterface *)self regID];
      uint64_t v10 = 2048;
      id v11 = a3;
      uint64_t v12 = 1024;
      uint64_t v13 = v5;
      _os_log_error_impl(&dword_1DB6F4000, v6, OS_LOG_TYPE_ERROR, "0x%llx: kDataQueueFreeOOBMsgMethod (%llx):0x%x", buf, 0x1Cu);
    }
  }
  return v5;
}

- (int)startSession:(BOOL)a3
{
  input[10] = *MEMORY[0x1E4F143B8];
  if (self->_state != 1) {
    -[AFKEndpointInterface enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:](&v4, input);
  }
  input[0] = a3;
  return IOConnectCallMethod(self->_connect, 5u, input, 1u, 0, 0, 0, 0, 0, 0);
}

- (unint64_t)regID
{
  return self->_regID;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->me, 0);
  objc_storeStrong((id *)&self->_descriptorManagers, 0);
  objc_storeStrong((id *)&self->_dataQueueMachChannel, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong(&self->_descriptorHandler, 0);
  objc_storeStrong(&self->_commandHandler, 0);
  objc_storeStrong(&self->_commandHandlerWithReturn, 0);
  objc_storeStrong(&self->_reportHandler, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)activate:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_8(&dword_1DB6F4000, a2, a3, "0x%llx: _asyncPort", (uint8_t *)a1);
}

- (void)activate:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_8(&dword_1DB6F4000, a2, a3, "0x%llx: IODataQueueAllocateNotificationPort", (uint8_t *)a1);
}

- (void)activate:(NSObject *)a3 .cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_8(&dword_1DB6F4000, a2, a3, "0x%llx: dispatch_mach_create", (uint8_t *)a1);
}

- (void)activate:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_1(&dword_1DB6F4000, "0x%llx: kOpenMethod:0x%x", v3, v4);
}

- (void)activate:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_1(&dword_1DB6F4000, "0x%llx: IOConnectSetNotificationPort:0x%x", v3, v4);
}

- (void)enqueueCommand:(void *)a1 timestamp:(_OWORD *)a2 inputBuffer:inputBufferSize:outputPayloadSize:context:options:.cold.1(void *a1, _OWORD *a2)
{
}

- (void)dequeueDataMessage:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_1(&dword_1DB6F4000, "0x%llx: kDataQueueSpaceAvailableMethod:0x%x", v3, v4);
}

- (void)handleCommand:(void *)a1 size:(_OWORD *)a2 .cold.1(void *a1, _OWORD *a2)
{
}

- (void)handleResponse:(void *)a1 size:(_OWORD *)a2 .cold.1(void *a1, _OWORD *a2)
{
}

- (void)handleDescriptor:(uint64_t)a3 size:(os_log_t)log .cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  uint64_t v4 = *(void *)(a1 + 24);
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = v4;
  _os_log_error_impl(&dword_1DB6F4000, log, OS_LOG_TYPE_ERROR, "0x%llx: Couldn't find manager for AFKDescMsg (regID:0x%llx)", buf, 0x16u);
}

- (void)handleDescriptor:(void *)a1 size:(_OWORD *)a2 .cold.2(void *a1, _OWORD *a2)
{
}

- (void)handleQueue:(uint64_t)a3 size:(uint64_t)a4 .cold.1(void *a1, _OWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, size_t *a10)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  mach_port_t v10 = OUTLINED_FUNCTION_5();
  __break(1u);
  IOConnectCallMethod(v10, v11, v12, v13, v14, v15, v16, v17, a9, a10);
}

@end