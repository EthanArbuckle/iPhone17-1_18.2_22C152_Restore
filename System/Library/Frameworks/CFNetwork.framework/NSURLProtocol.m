@interface NSURLProtocol
+ (BOOL)canInitWithRequest:(NSURLRequest *)request;
+ (BOOL)canInitWithTask:(NSURLSessionTask *)task;
+ (BOOL)registerClass:(Class)protocolClass;
+ (BOOL)requestIsCacheEquivalent:(NSURLRequest *)a toRequest:(NSURLRequest *)b;
+ (Class)_protocolClassForRequest:(id)a3;
+ (Class)_protocolClassForRequest:(id)a3 skipAppSSO:(BOOL)a4;
+ (NSURLRequest)canonicalRequestForRequest:(NSURLRequest *)request;
+ (id)_makeRequestCanonicalByMakingRequestURLCanonical:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3 task:(id)a4;
+ (id)propertyForKey:(NSString *)key inRequest:(NSURLRequest *)request;
+ (void)removePropertyForKey:(NSString *)key inRequest:(NSMutableURLRequest *)request;
+ (void)setProperty:(id)value forKey:(NSString *)key inRequest:(NSMutableURLRequest *)request;
+ (void)unregisterClass:(Class)protocolClass;
- (NSCachedURLResponse)cachedResponse;
- (NSURLProtocol)init;
- (NSURLProtocol)initWithRequest:(NSURLRequest *)request cachedResponse:(NSCachedURLResponse *)cachedResponse client:(id)client;
- (NSURLProtocol)initWithTask:(NSURLSessionTask *)task cachedResponse:(NSCachedURLResponse *)cachedResponse client:(id)client;
- (NSURLRequest)request;
- (NSURLSessionTask)task;
- (id)client;
- (void)dealloc;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation NSURLProtocol

+ (BOOL)registerClass:(Class)protocolClass
{
  self;
  uint64_t v4 = [(objc_class *)protocolClass superclass];
  if (v4)
  {
    v5 = (void *)v4;
    while (v5 != self)
    {
      uint64_t v4 = [v5 superclass];
      v5 = (void *)v4;
      if (!v4) {
        return v4;
      }
    }
    os_unfair_lock_lock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
    if (_localProtocolClassesForDefaultSession) {
      [(id)_localProtocolClassesForDefaultSession insertObject:protocolClass atIndex:0];
    }
    else {
      _localProtocolClassesForDefaultSession = (uint64_t)(id)[MEMORY[0x1E4F1CA48] arrayWithObject:protocolClass];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
    LOBYTE(v4) = 1;
  }
  return v4;
}

+ (id)propertyForKey:(NSString *)key inRequest:(NSURLRequest *)request
{
  if (!key && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "assertion failure", buf, 2u);
    if (request) {
      return [(NSURLRequest *)request _propertyForKey:key];
    }
  }
  else if (request)
  {
    return [(NSURLRequest *)request _propertyForKey:key];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "assertion failure", v7, 2u);
  }
  return [(NSURLRequest *)request _propertyForKey:key];
}

- (NSURLSessionTask)task
{
  v2 = self->_task;

  return v2;
}

- (NSURLProtocol)initWithTask:(NSURLSessionTask *)task cachedResponse:(NSCachedURLResponse *)cachedResponse client:(id)client
{
  if (self->_inInitWithTask)
  {
    v12.receiver = self;
    v12.super_class = (Class)NSURLProtocol;
    v9 = [(NSURLProtocol *)&v12 init];
    if (v9) {
      v9->_internal = (NSURLProtocolInternal *)-[NSURLProtocolInternal initWithRequest:cachedResponse:client:]([NSURLProtocolInternal alloc], [(NSURLSessionTask *)task currentRequest], cachedResponse, client);
    }
    return v9;
  }
  else
  {
    self->_task = task;
    self->_inInitWithTask = 1;
    v11 = [(NSURLSessionTask *)task currentRequest];
    return [(NSURLProtocol *)self initWithRequest:v11 cachedResponse:cachedResponse client:client];
  }
}

- (void)stopLoading
{
  uint64_t v4 = (objc_class *)objc_opt_class();

  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)startLoading
{
  uint64_t v4 = (objc_class *)objc_opt_class();

  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLProtocol;
  [(NSURLProtocol *)&v3 dealloc];
}

- (NSCachedURLResponse)cachedResponse
{
  internal = self->_internal;
  if (internal) {
    return internal->cachedResponse;
  }
  else {
    return 0;
  }
}

- (NSURLRequest)request
{
  internal = self->_internal;
  if (internal) {
    return internal->request;
  }
  else {
    return 0;
  }
}

- (id)client
{
  internal = self->_internal;
  if (internal) {
    return internal->client;
  }
  else {
    return 0;
  }
}

- (NSURLProtocol)initWithRequest:(NSURLRequest *)request cachedResponse:(NSCachedURLResponse *)cachedResponse client:(id)client
{
  v10.receiver = self;
  v10.super_class = (Class)NSURLProtocol;
  v8 = [(NSURLProtocol *)&v10 init];
  if (v8) {
    v8->_internal = (NSURLProtocolInternal *)-[NSURLProtocolInternal initWithRequest:cachedResponse:client:]([NSURLProtocolInternal alloc], request, cachedResponse, client);
  }
  return v8;
}

- (NSURLProtocol)init
{
  objc_super v3 = +[NSURLRequest requestWithURL:0];

  return [(NSURLProtocol *)self initWithRequest:v3 cachedResponse:0 client:0];
}

+ (BOOL)canInitWithTask:(NSURLSessionTask *)task
{
  uint64_t v4 = [(NSURLSessionTask *)task currentRequest];

  return [a1 canInitWithRequest:v4];
}

+ (void)removePropertyForKey:(NSString *)key inRequest:(NSMutableURLRequest *)request
{
  if (!key && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "assertion failure", buf, 2u);
    if (request) {
      goto LABEL_6;
    }
  }
  else if (request)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "assertion failure", v6, 2u);
  }
LABEL_6:
  [(NSURLRequest *)request _removePropertyForKey:key];
}

+ (void)setProperty:(id)value forKey:(NSString *)key inRequest:(NSMutableURLRequest *)request
{
  if (!key && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "assertion failure", buf, 2u);
    if (request) {
      goto LABEL_6;
    }
  }
  else if (request)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "assertion failure", v8, 2u);
  }
LABEL_6:
  [(NSURLRequest *)request _setProperty:value forKey:key];
}

+ (void)unregisterClass:(Class)protocolClass
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
  if (_localProtocolClassesForDefaultSession)
  {
    [(id)_localProtocolClassesForDefaultSession removeObject:protocolClass];
    if (![(id)_localProtocolClassesForDefaultSession count])
    {

      _localProtocolClassesForDefaultSession = 0;
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
}

+ (BOOL)requestIsCacheEquivalent:(NSURLRequest *)a toRequest:(NSURLRequest *)b
{
  if (!a && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "assertion failure", buf, 2u);
    if (b) {
      goto LABEL_6;
    }
  }
  else if (b)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "assertion failure", v8, 2u);
  }
LABEL_6:
  if (a == b) {
    return 1;
  }
  uint64_t v6 = +[NSURLSession _sharedSessionForConnection]();
  return -[__NSURLSessionLocal _request:isCacheEquivalentTo:](v6, (uint64_t)a, (uint64_t)b);
}

+ (id)canonicalRequestForRequest:(id)a3 task:(id)a4
{
  if (self == a1)
  {
    uint64_t v8 = [a4 session];
    if (v8 && (v9 = -[__NSURLSessionLocal _protocolClassForTask:skipAppSSO:](v8, a4, 0)) != 0)
    {
      return (id)[v9 canonicalRequestForRequest:a3 task:a4];
    }
    else
    {
      return a3;
    }
  }
  else
  {
    return (id)[a1 canonicalRequestForRequest:a3];
  }
}

+ (NSURLRequest)canonicalRequestForRequest:(NSURLRequest *)request
{
  if (self != a1)
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    NSRequestConcreteImplementation((uint64_t)a1, a2, v8);
    return request;
  }
  uint64_t v6 = (void *)[a1 _protocolClassForRequest:request];
  if (!v6) {
    return request;
  }

  return (NSURLRequest *)[v6 canonicalRequestForRequest:request];
}

+ (BOOL)canInitWithRequest:(NSURLRequest *)request
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)a1, a2, v5);
  return 0;
}

+ (id)_makeRequestCanonicalByMakingRequestURLCanonical:(id)a3
{
  return a3;
}

+ (Class)_protocolClassForRequest:(id)a3 skipAppSSO:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (void *)+[NSURLSession _sharedSessionForConnection]();
  v7 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:]([NSURLSessionTask alloc], "initWithOriginalRequest:ident:taskGroup:", a3, 0, [v6 defaultTaskGroup]);
  uint64_t v8 = (objc_class *)-[__NSURLSessionLocal _protocolClassForTask:skipAppSSO:]((uint64_t)v6, v7, v4);

  return v8;
}

+ (Class)_protocolClassForRequest:(id)a3
{
  return +[NSURLProtocol _protocolClassForRequest:a3 skipAppSSO:0];
}

@end