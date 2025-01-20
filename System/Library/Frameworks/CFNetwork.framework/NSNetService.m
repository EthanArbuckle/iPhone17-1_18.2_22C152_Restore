@interface NSNetService
+ (NSData)dataFromTXTRecordDictionary:(NSDictionary *)txtDictionary;
+ (NSDictionary)dictionaryFromTXTRecordData:(NSData *)txtData;
- (BOOL)getInputStream:(NSInputStream *)inputStream outputStream:(NSOutputStream *)outputStream;
- (BOOL)includesPeerToPeer;
- (BOOL)isEqual:(id)a3;
- (BOOL)setTXTRecordData:(NSData *)recordData;
- (CFRunLoopRef)_scheduleInDefaultRunLoopForMode:(uint64_t)a1;
- (NSArray)addresses;
- (NSData)TXTRecordData;
- (NSInteger)port;
- (NSNetService)init;
- (NSNetService)initWithCFNetService:(__CFNetService *)a3;
- (NSNetService)initWithDomain:(NSString *)domain type:(NSString *)type name:(NSString *)name;
- (NSNetService)initWithDomain:(NSString *)domain type:(NSString *)type name:(NSString *)name port:(int)port;
- (NSString)domain;
- (NSString)hostName;
- (NSString)name;
- (NSString)type;
- (id)delegate;
- (id)description;
- (uint64_t)_dispatchCallBackWithError:(uint64_t)a3;
- (uint64_t)_internal_publishWithOptions:(uint64_t)result;
- (unint64_t)hash;
- (void)_setIncludesAWDL:(BOOL)a3;
- (void)dealloc;
- (void)publish;
- (void)publishWithOptions:(NSNetServiceOptions)options;
- (void)removeFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode;
- (void)resolve;
- (void)resolveWithTimeout:(NSTimeInterval)timeout;
- (void)scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode;
- (void)setDelegate:(id)delegate;
- (void)setIncludesPeerToPeer:(BOOL)includesPeerToPeer;
- (void)startMonitoring;
- (void)stop;
- (void)stopMonitoring;
@end

@implementation NSNetService

- (NSData)TXTRecordData
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  if (self) {
    netService = (__CFNetService *)self->_netService;
  }
  else {
    netService = 0;
  }
  v5 = (void *)[v3 initWithData:CFNetServiceGetTXTData(netService)];

  return (NSData *)v5;
}

- (BOOL)setTXTRecordData:(NSData *)recordData
{
  if (self) {
    self = (NSNetService *)self->_netService;
  }
  return _ServiceSetInfo((__CFNetService *)self, 1u, recordData, 1) != 0;
}

- (void)stopMonitoring
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self && (id reserved = self->_reserved) != 0) {
    id Property = objc_getProperty(reserved, a2, 8, 1);
  }
  else {
    id Property = 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v4 = [Property countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(Property);
        }
        CFNetServiceMonitorStop(*(CFNetServiceMonitorRef *)(*((void *)&v8 + 1) + 8 * v7++), 0);
      }
      while (v5 != v7);
      uint64_t v5 = [Property countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)startMonitoring
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self && (id reserved = self->_reserved) != 0) {
    id Property = objc_getProperty(reserved, a2, 8, 1);
  }
  else {
    id Property = 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v4 = [Property countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(Property);
        }
        CFNetServiceMonitorStart(*(CFNetServiceMonitorRef *)(*((void *)&v8 + 1) + 8 * v7++), kCFNetServiceMonitorTXT, 0);
      }
      while (v5 != v7);
      uint64_t v5 = [Property countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)resolve
{
}

- (void)resolveWithTimeout:(NSTimeInterval)timeout
{
  error.domain = 0;
  *(void *)&error.CFStreamError error = 0;
  if (self->_netService)
  {
    clientContext.version = 0;
    clientContext.info = -[_NSNetServiceWeakObject initWithObject:]([_NSNetServiceWeakObject alloc], self);
    clientContext.retain = (CFAllocatorRetainCallBack)MEMORY[0x1E4F1C280];
    clientContext.release = (CFAllocatorReleaseCallBack)MEMORY[0x1E4F1C278];
    clientContext.copyDescription = 0;
    CFNetServiceSetClient((CFNetServiceRef)self->_netService, (CFNetServiceClientCallBack)_netServiceDispatchCallbackForResolving, &clientContext);
    int v5 = CFNetServiceResolveWithTimeout((CFNetServiceRef)self->_netService, timeout, &error);
    id v6 = [(NSNetService *)self delegate];
    if (v5)
    {
      if (v6)
      {
        [(NSNetService *)self delegate];
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(-[NSNetService delegate](self, "delegate"), "netServiceWillResolve:", self);
        }
      }
    }
    else if (v6)
    {
      [(NSNetService *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v8 = [NSNumber numberWithInt:error.error];
        objc_msgSend(-[NSNetService delegate](self, "delegate"), "netService:didNotResolve:", self, objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"NSNetServicesErrorCode", objc_msgSend(NSNumber, "numberWithLong:", error.domain), @"NSNetServicesErrorDomain", 0));
      }
    }
  }
}

- (uint64_t)_dispatchCallBackWithError:(uint64_t)a3
{
  if (!result) {
    return result;
  }
  uint64_t v4 = (void *)result;
  if (a3)
  {
    if (a3 == -72002)
    {
      result = [(id)result delegate];
LABEL_15:
      if (result)
      {
        [v4 delegate];
        result = objc_opt_respondsToSelector();
        if (result)
        {
          uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = [NSNumber numberWithInt:a3];
          uint64_t v10 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, @"NSNetServicesErrorCode", objc_msgSend(NSNumber, "numberWithLong:", a2), @"NSNetServicesErrorDomain", 0);
          long long v11 = (void *)[v4 delegate];
          return [v11 netService:v4 didNotResolve:v10];
        }
      }
      return result;
    }
    if ((int)a3 == -72005)
    {
      result = [(id)result delegate];
      if (!result) {
        return result;
      }
LABEL_21:
      [v4 delegate];
      result = objc_opt_respondsToSelector();
      if (result)
      {
        v12 = (void *)[v4 delegate];
        return [v12 netServiceDidStop:v4];
      }
      return result;
    }
    if ((int)a3 == -72007)
    {
      uint64_t v6 = objc_msgSend((id)objc_msgSend((id)result, "addresses"), "count");
      result = [v4 delegate];
      if (v6)
      {
        if (!result) {
          return result;
        }
        goto LABEL_21;
      }
      goto LABEL_15;
    }
    result = [(id)result delegate];
    if (result)
    {
      [v4 delegate];
      result = objc_opt_respondsToSelector();
      if (result)
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v14 = [NSNumber numberWithInt:a3];
        uint64_t v15 = objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v14, @"NSNetServicesErrorCode", objc_msgSend(NSNumber, "numberWithLong:", a2), @"NSNetServicesErrorDomain", 0);
        v16 = (void *)[v4 delegate];
        return [v16 netService:v4 didNotPublish:v15];
      }
    }
  }
  else
  {
    result = [(id)result delegate];
    if (result)
    {
      [v4 delegate];
      result = objc_opt_respondsToSelector();
      if (result)
      {
        uint64_t v7 = (void *)[v4 delegate];
        return [v7 netServiceDidResolveAddress:v4];
      }
    }
  }
  return result;
}

- (BOOL)getInputStream:(NSInputStream *)inputStream outputStream:(NSOutputStream *)outputStream
{
  id v7 = [(NSNetService *)self delegate];
  if (self) {
    netService = (__CFNetService *)self->_netService;
  }
  else {
    netService = 0;
  }
  CFStreamCreatePairWithSocketToNetService((CFAllocatorRef)*MEMORY[0x1E4F1CF80], netService, (CFReadStreamRef *)inputStream, (CFWriteStreamRef *)outputStream);
  [(NSNetService *)self setDelegate:v7];

  return ((unint64_t)inputStream | (unint64_t)outputStream) != 0;
}

- (BOOL)isEqual:(id)a3
{
  self;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (a3) {
    int v5 = (const void *)*((void *)a3 + 1);
  }
  else {
    int v5 = 0;
  }
  return CFEqual(self->_netService, v5) != 0;
}

- (unint64_t)hash
{
  return CFHash(self->_netService);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p> %@ %@ %@ %d", objc_opt_class(), self, -[NSNetService domain](self, "domain"), -[NSNetService type](self, "type"), -[NSNetService name](self, "name"), -[NSNetService port](self, "port")];
}

- (void)dealloc
{
  netService = (__CFNetService *)self->_netService;
  if (netService)
  {
    memset(&clientContext, 0, sizeof(clientContext));
    CFNetServiceSetClient(netService, 0, &clientContext);
  }
  objc_storeWeak(&self->_delegate, 0);

  v4.receiver = self;
  v4.super_class = (Class)NSNetService;
  [(NSNetService *)&v4 dealloc];
}

- (void)stop
{
  netService = (__CFNetService *)self->_netService;
  if (netService)
  {
    CFNetServiceSetClient(netService, 0, 0);
    CFNetServiceCancel((CFNetServiceRef)self->_netService);
  }
  -[NSNetServicesInternal setListener:]((uint64_t)self->_reserved, 0);
  if ([(NSNetService *)self delegate])
  {
    [(NSNetService *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v4 = [(NSNetService *)self delegate];
      [v4 netServiceDidStop:self];
    }
  }
}

- (void)publish
{
  uint64_t v3 = [(NSString *)[(NSNetService *)self name] isEqual:&stru_1ECFAD558] ^ 1;

  [(NSNetService *)self publishWithOptions:v3];
}

- (void)publishWithOptions:(NSNetServiceOptions)options
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((options & 2) != 0)
  {
    if (self)
    {
      id v5 = [(NSArray *)[[(NSString *)[(NSNetService *)self type] lowercaseString] componentsSeparatedByString:@","] firstObject];
      if (objc_msgSend((id)objc_msgSend(v5, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @".")), "hasSuffix:", @"_tcp"))
      {
        id reserved = self->_reserved;
        if (!reserved || !reserved[2])
        {
          id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          uint64_t v8 = dispatch_queue_create("com.apple.NSNetServices.tcplistener-queue", v7);
          uint64_t v9 = tcp_listener_create();
          dispatch_release(v8);
          -[NSNetServicesInternal setListener:]((uint64_t)self->_reserved, v9);
          tcp_listener_release();
          NSInteger v10 = [(NSNetService *)self port];
          if (v10)
          {
            snprintf(__str, 0x20uLL, "%d", v10);
            tcp_listener_set_port();
          }
          if ([(NSNetService *)self includesPeerToPeer]
            || (CFBooleanRef Info = (const __CFBoolean *)CFNetServiceGetInfo((uint64_t)self->_netService, 9u)) != 0
            && CFBooleanGetValue(Info))
          {
            tcp_listener_set_interface();
          }
          *(void *)__str = MEMORY[0x1E4F143A8];
          uint64_t v22 = 3221225472;
          v23 = __34__NSNetService_publishWithServer___block_invoke;
          v24 = &unk_1E52563D8;
          v25 = self;
          tcp_listener_set_accept_handler();
          uint64_t v16 = MEMORY[0x1E4F143A8];
          uint64_t v17 = 3221225472;
          v18 = __34__NSNetService_publishWithServer___block_invoke_3;
          v19 = &unk_1E5256400;
          v20 = self;
          tcp_listener_set_error_handler();
          tcp_listener_start();
          unsigned int valuePtr = __rev16(tcp_listener_get_port());
          CFNumberRef v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
          _ServiceSetInfo((__CFNetService *)self->_netService, 8u, v12, 0);
          CFRelease(v12);
          -[NSNetService _internal_publishWithOptions:]((uint64_t)self, options);
        }
      }
      else if ([(NSNetService *)self delegate])
      {
        [(NSNetService *)self delegate];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", &unk_1ECFD1AE8, @"NSNetServicesErrorCode", objc_msgSend(NSNumber, "numberWithInt:", 10), @"NSNetServicesErrorDomain", 0);
          id v14 = [(NSNetService *)self delegate];
          [v14 netService:self didNotPublish:v13];
        }
      }
    }
  }
  else
  {
    -[NSNetService _internal_publishWithOptions:]((uint64_t)self, options);
  }
}

- (uint64_t)_internal_publishWithOptions:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = (CFNetServiceRef *)result;
    if ([(id)result port] == -1) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: cannot publish an NSNetService created for resolution.", @"-[NSNetService _internal_publishWithOptions:" format];
    }
    error.domain = 0;
    *(void *)&error.CFStreamError error = 0;
    clientContext.version = 0;
    clientContext.info = -[_NSNetServiceWeakObject initWithObject:]([_NSNetServiceWeakObject alloc], v3);
    clientContext.retain = (CFAllocatorRetainCallBack)MEMORY[0x1E4F1C280];
    clientContext.release = (CFAllocatorReleaseCallBack)MEMORY[0x1E4F1C278];
    clientContext.copyDescription = 0;
    CFNetServiceSetClient(v3[1], (CFNetServiceClientCallBack)_netServiceDispatchCallbackForPublishing, &clientContext);
    int v4 = CFNetServiceRegisterWithOptions(v3[1], a2, &error);
    result = [(CFNetServiceRef *)v3 delegate];
    if (v4)
    {
      if (result)
      {
        [(CFNetServiceRef *)v3 delegate];
        result = objc_opt_respondsToSelector();
        if (result) {
          return objc_msgSend((id)-[CFNetServiceRef delegate](v3, "delegate"), "netServiceWillPublish:", v3);
        }
      }
    }
    else if (result)
    {
      [(CFNetServiceRef *)v3 delegate];
      result = objc_opt_respondsToSelector();
      if (result)
      {
        id v5 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v6 = [NSNumber numberWithInt:error.error];
        return objc_msgSend((id)-[CFNetServiceRef delegate](v3, "delegate"), "netService:didNotPublish:", v3, objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, @"NSNetServicesErrorCode", objc_msgSend(NSNumber, "numberWithLong:", error.domain), @"NSNetServicesErrorDomain", 0));
      }
    }
  }
  return result;
}

void __34__NSNetService_publishWithServer___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) delegate]
    && ([*(id *)(a1 + 32) delegate], (objc_opt_respondsToSelector() & 1) != 0))
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    if (TCFObject<SocketStream>::Class(void)::sOnce != -1) {
      dispatch_once(&TCFObject<SocketStream>::Class(void)::sOnce, &__block_literal_global_311);
    }
    uint64_t Instance = _CFRuntimeCreateInstance();
    if (Instance)
    {
      uint64_t v6 = (void *)Instance;
      id v7 = (SocketStream *)(Instance + 16);
      bzero((void *)(Instance + 16), 0x2B8uLL);
      SocketStream::SocketStream(v7, v8);
      SocketStream::commonInitialization(v9);
      tcp_connection_retain();
      v6[76] = a2;
      (*(void (**)(SocketStream *, uint64_t *, uint64_t *))(v6[2] + 64))(v7, &v16, &v15);
      CFRelease(v6);
    }
    else
    {
      SocketStream::SocketStream(0, v5);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    long long v11 = *(CFTypeRef **)(v10 + 24);
    if (v11)
    {
      objc_sync_enter(*(id *)(v10 + 24));
      CFTypeRef v12 = CFRetain(v11[3]);
      CFTypeRef v13 = CFRetain(v11[4]);
      objc_sync_exit(v11);
      uint64_t v10 = *(void *)(a1 + 32);
    }
    else
    {
      CFTypeRef v12 = 0;
      CFTypeRef v13 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__NSNetService_publishWithServer___block_invoke_2;
    block[3] = &unk_1E52563B0;
    block[4] = v10;
    block[5] = v16;
    block[6] = v15;
    block[7] = v13;
    block[8] = v12;
    if (v12) {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else {
      __34__NSNetService_publishWithServer___block_invoke_2((uint64_t)block);
    }
  }
  else
  {
    tcp_connection_cancel();
  }
}

uint64_t __34__NSNetService_publishWithServer___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) delegate];
  if (result)
  {
    [*(id *)(a1 + 32) delegate];
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", a2), @"NSNetServicesErrorCode", &unk_1ECFD1B00, @"NSNetServicesErrorDomain", 0);
      uint64_t v6 = (void *)[*(id *)(a1 + 32) delegate];
      uint64_t v7 = *(void *)(a1 + 32);
      return [v6 netService:v7 didNotPublish:v5];
    }
  }
  return result;
}

void __34__NSNetService_publishWithServer___block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "netService:didAcceptConnectionWithInputStream:outputStream:", *(void *)(a1 + 32), *(id *)(a1 + 40), *(id *)(a1 + 48));
  v2 = *(const void **)(a1 + 56);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 64);
  if (v3)
  {
    CFRelease(v3);
  }
}

- (NSInteger)port
{
  netService = (int *)self->_netService;
  if (netService) {
    return netService[14];
  }
  else {
    return -1;
  }
}

- (NSArray)addresses
{
  uint64_t result = (NSArray *)self->_netService;
  if (result)
  {
    CFBooleanRef Info = (void *)CFNetServiceGetInfo((uint64_t)result, 3u);
    if (Info)
    {
      int v4 = (void *)[Info copy];
      return (NSArray *)v4;
    }
    else
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
      return (NSArray *)[v5 array];
    }
  }
  return result;
}

- (NSString)hostName
{
  uint64_t result = (NSString *)self->_netService;
  if (result) {
    return (NSString *)CFNetServiceGetInfo((uint64_t)result, 5u);
  }
  return result;
}

- (NSString)name
{
  uint64_t result = (NSString *)self->_netService;
  if (result) {
    return (NSString *)CFNetServiceGetInfo((uint64_t)result, 2u);
  }
  return result;
}

- (NSString)type
{
  uint64_t result = (NSString *)self->_netService;
  if (result) {
    return (NSString *)CFNetServiceGetInfo((uint64_t)result, 4u);
  }
  return result;
}

- (NSString)domain
{
  uint64_t result = (NSString *)self->_netService;
  if (result) {
    return (NSString *)CFNetServiceGetInfo((uint64_t)result, 0);
  }
  return result;
}

- (void)removeFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(NSRunLoop *)aRunLoop getCFRunLoop];
  if (v6)
  {
    uint64_t v7 = v6;
    if (self)
    {
      CFNetServiceUnscheduleFromRunLoop((CFNetServiceRef)self->_netService, v6, (CFStringRef)mode);
      id reserved = self->_reserved;
      self = reserved ? (NSNetService *)objc_getProperty(reserved, v8, 8, 1) : 0;
    }
    else
    {
      CFNetServiceUnscheduleFromRunLoop(0, v6, (CFStringRef)mode);
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v10 = [(NSNetService *)self countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(self);
          }
          CFNetServiceMonitorUnscheduleFromRunLoop(*(CFNetServiceMonitorRef *)(*((void *)&v14 + 1) + 8 * i), v7, (CFStringRef)mode);
        }
        uint64_t v11 = [(NSNetService *)self countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(NSRunLoop *)aRunLoop getCFRunLoop];
  if (v6)
  {
    uint64_t v7 = v6;
    -[NSNetServicesInternal setScheduledRunLoop:andMode:]((void *)self->_reserved, v6, mode);
    CFNetServiceScheduleWithRunLoop((CFNetServiceRef)self->_netService, v7, (CFStringRef)mode);
    id reserved = self->_reserved;
    id v10 = reserved ? objc_getProperty(reserved, v8, 8, 1) : 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          CFNetServiceMonitorScheduleWithRunLoop(*(CFNetServiceMonitorRef *)(*((void *)&v15 + 1) + 8 * v14++), v7, (CFStringRef)mode);
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
}

- (void)_setIncludesAWDL:(BOOL)a3
{
  if (self) {
    self = (NSNetService *)self->_netService;
  }
  uint64_t v3 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    uint64_t v3 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  _ServiceSetInfo((__CFNetService *)self, 9u, *v3, 0);
}

- (void)setIncludesPeerToPeer:(BOOL)includesPeerToPeer
{
  if (self) {
    self = (NSNetService *)self->_netService;
  }
  uint64_t v3 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!includesPeerToPeer) {
    uint64_t v3 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  _ServiceSetInfo((__CFNetService *)self, 7u, *v3, 0);
}

- (BOOL)includesPeerToPeer
{
  if (self) {
    self = (NSNetService *)self->_netService;
  }
  CFBooleanRef Info = (const __CFBoolean *)CFNetServiceGetInfo((uint64_t)self, 7u);
  if (Info) {
    LOBYTE(Info) = CFBooleanGetValue(Info) != 0;
  }
  return (char)Info;
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (NSNetService)initWithDomain:(NSString *)domain type:(NSString *)type name:(NSString *)name
{
  return [(NSNetService *)self initWithDomain:domain type:type name:name port:0xFFFFFFFFLL];
}

- (NSNetService)initWithDomain:(NSString *)domain type:(NSString *)type name:(NSString *)name port:(int)port
{
  v22.receiver = self;
  v22.super_class = (Class)NSNetService;
  id v10 = [(NSNetService *)&v22 init];
  if (!v10) {
    goto LABEL_11;
  }
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFNetServiceRef v12 = CFNetServiceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)domain, (CFStringRef)type, (CFStringRef)name, port);
  *((void *)v10 + 1) = v12;
  if (!v12)
  {
    *((void *)v10 + 1) = 0;
LABEL_11:

    return 0;
  }
  *((void *)v10 + 3) = objc_alloc_init(NSNetServicesInternal);
  uint64_t v14 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  long long v15 = (void *)*((void *)v10 + 3);
  if (v15) {
    objc_setProperty_atomic(v15, v13, v14, 8);
  }
  clientContext.version = 0;
  clientContext.info = -[_NSNetServiceWeakObject initWithObject:]([_NSNetServiceWeakObject alloc], v10);
  clientContext.retain = (CFAllocatorRetainCallBack)MEMORY[0x1E4F1C280];
  clientContext.release = (CFAllocatorReleaseCallBack)MEMORY[0x1E4F1C278];
  clientContext.copyDescription = 0;
  CFNetServiceMonitorRef v16 = CFNetServiceMonitorCreate(v11, *((CFNetServiceRef *)v10 + 1), (CFNetServiceMonitorClientCallBack)_netServiceMonitorCallBack, &clientContext);
  if (v16)
  {
    CFNetServiceMonitorRef v18 = v16;
    id Property = (id)*((void *)v10 + 3);
    if (Property) {
      id Property = objc_getProperty(Property, v17, 8, 1);
    }
    [Property addObject:v18];
    CFRelease(v18);
  }
  -[NSNetService _scheduleInDefaultRunLoopForMode:]((uint64_t)v10, (const __CFString *)*MEMORY[0x1E4F1D410]);
  return (NSNetService *)v10;
}

- (CFRunLoopRef)_scheduleInDefaultRunLoopForMode:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFRunLoopRef result = CFRunLoopGetCurrent();
  if (result)
  {
    uint64_t v5 = result;
    -[NSNetServicesInternal setScheduledRunLoop:andMode:](*(void **)(a1 + 24), result, a2);
    CFNetServiceScheduleWithRunLoop(*(CFNetServiceRef *)(a1 + 8), v5, a2);
    uint64_t v7 = *(void **)(a1 + 24);
    id v8 = v7 ? objc_getProperty(v7, v6, 8, 1) : 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    CFRunLoopRef result = (CFRunLoopRef)[v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (result)
    {
      CFRunLoopRef v9 = result;
      uint64_t v10 = *(void *)v13;
      do
      {
        CFAllocatorRef v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          CFNetServiceMonitorScheduleWithRunLoop(*(CFNetServiceMonitorRef *)(*((void *)&v12 + 1) + 8 * (void)v11), v5, a2);
          CFAllocatorRef v11 = (__CFRunLoop *)((char *)v11 + 1);
        }
        while (v9 != v11);
        CFRunLoopRef result = (CFRunLoopRef)[v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
        CFRunLoopRef v9 = result;
      }
      while (result);
    }
  }
  return result;
}

- (NSNetService)initWithCFNetService:(__CFNetService *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)NSNetService;
  int v4 = [(NSNetService *)&v15 init];
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    if (a3)
    {
      v4->_netService = a3;
      *(void *)(v5 + 24) = objc_alloc_init(NSNetServicesInternal);
      uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      id v8 = *(void **)(v5 + 24);
      if (v8) {
        objc_setProperty_atomic(v8, v6, v7, 8);
      }
      clientContext.version = 0;
      clientContext.info = -[_NSNetServiceWeakObject initWithObject:]([_NSNetServiceWeakObject alloc], (void *)v5);
      clientContext.retain = (CFAllocatorRetainCallBack)MEMORY[0x1E4F1C280];
      clientContext.release = (CFAllocatorReleaseCallBack)MEMORY[0x1E4F1C278];
      clientContext.copyDescription = 0;
      CFNetServiceMonitorRef v9 = CFNetServiceMonitorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFNetServiceRef *)(v5 + 8), (CFNetServiceMonitorClientCallBack)_netServiceMonitorCallBack, &clientContext);
      if (v9)
      {
        CFNetServiceMonitorRef v11 = v9;
        id Property = *(id *)(v5 + 24);
        if (Property) {
          id Property = objc_getProperty(Property, v10, 8, 1);
        }
        [Property addObject:v11];
        CFRelease(v11);
      }
      -[NSNetService _scheduleInDefaultRunLoopForMode:](v5, (const __CFString *)*MEMORY[0x1E4F1D410]);
    }
    else
    {

      return 0;
    }
  }
  return (NSNetService *)v5;
}

- (NSNetService)init
{
  v4.receiver = self;
  v4.super_class = (Class)NSNetService;
  v2 = [(NSNetService *)&v4 init];
  if (v2) {

  }
  return 0;
}

+ (NSData)dataFromTXTRecordDictionary:(NSDictionary *)txtDictionary
{
  if (txtDictionary)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    objc_super v4 = txtDictionary;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: cannot convert nil to a TXT record.", @"+[NSNetService dataFromTXTRecordDictionary:]" format];
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    objc_super v4 = 0;
  }
  CFDataRef TXTDataWithDictionary = CFNetServiceCreateTXTDataWithDictionary(v3, (CFDictionaryRef)v4);

  return (NSData *)TXTDataWithDictionary;
}

+ (NSDictionary)dictionaryFromTXTRecordData:(NSData *)txtData
{
  if (txtData)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    objc_super v4 = txtData;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: cannot convert nil to a dictionary.", @"+[NSNetService dictionaryFromTXTRecordData:" format];
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    objc_super v4 = 0;
  }
  CFDictionaryRef DictionaryWithTXTData = CFNetServiceCreateDictionaryWithTXTData(v3, (CFDataRef)v4);

  return (NSDictionary *)DictionaryWithTXTData;
}

@end