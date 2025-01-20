@interface _NSCFURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)canInitWithTask:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (const)_cf_internalImpl;
+ (id)canonicalRequestForRequest:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3 task:(id)a4;
- (_NSCFURLProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5;
- (void)dealloc;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation _NSCFURLProtocol

+ (id)canonicalRequestForRequest:(id)a3
{
  v5 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:]([NSURLSessionTask alloc], "initWithOriginalRequest:ident:taskGroup:", a3, 0, [(id)+[NSURLSession _sharedSessionForConnection]() defaultTaskGroup]);
  v6 = (void *)[a1 canonicalRequestForRequest:a3 task:v5];

  return v6;
}

+ (id)canonicalRequestForRequest:(id)a3 task:(id)a4
{
  uint64_t v6 = objc_msgSend(a1, "_cf_internalImpl");
  v7 = (const void *)(*(uint64_t (**)(void, id, id, void))(v6 + 48))(*MEMORY[0x1E4F1CF80], a3, a4, 0);
  id v8 = [[NSURLRequest alloc] _initWithCFURLRequest:v7];
  if (v7) {
    CFRelease(v7);
  }

  return v8;
}

+ (BOOL)canInitWithTask:(id)a3
{
  uint64_t v4 = objc_msgSend(a1, "_cf_internalImpl");
  v5 = *(uint64_t (**)(id, void))(v4 + 72);
  if (v5) {
    int v6 = v5(a3, 0);
  }
  else {
    int v6 = (*(uint64_t (**)(uint64_t, void))(v4 + 40))([a3 currentRequest], 0);
  }
  return v6 != 0;
}

+ (BOOL)canInitWithRequest:(id)a3
{
  return (*(unsigned int (**)(id, void))(objc_msgSend(a1, "_cf_internalImpl") + 40))(a3, 0) != 0;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  return (*(unsigned int (**)(id, id, void))(objc_msgSend(a1, "_cf_internalImpl") + 56))(a3, a4, 0) != 0;
}

- (void)stopLoading
{
  prot = self->_prot;
  if (TCFObject<URLProtocol>::Class(void)::sOnce != -1) {
    dispatch_once(&TCFObject<URLProtocol>::Class(void)::sOnce, &__block_literal_global_3848);
  }
  v3 = *(void (**)(char *))(*((void *)prot + 2) + 96);

  v3((char *)prot + 16);
}

- (void)startLoading
{
  prot = self->_prot;
  if (prot)
  {
    if (TCFObject<URLProtocol>::Class(void)::sOnce != -1) {
      dispatch_once(&TCFObject<URLProtocol>::Class(void)::sOnce, &__block_literal_global_3848);
    }
    prot = (_CFURLProtocol *)((char *)prot + 16);
  }
  uint64_t v4 = [(NSCachedURLResponse *)[(NSURLProtocol *)self cachedResponse] _CFCachedURLResponse];
  v5 = *(void (**)(_CFURLProtocol *, _CFCachedURLResponse *))(*(void *)prot + 88);

  v5(prot, v4);
}

- (void)dealloc
{
  prot = self->_prot;
  if (prot) {
    CFRelease(prot);
  }
  client = self->_client;
  if (client) {
    (*((void (**)(NSCFURLProtocolClient *, SEL))client->var0 + 1))(client, a2);
  }
  v5.receiver = self;
  v5.super_class = (Class)_NSCFURLProtocol;
  [(NSURLProtocol *)&v5 dealloc];
}

- (_NSCFURLProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)_NSCFURLProtocol;
  if (-[NSURLProtocol initWithRequest:cachedResponse:client:](&v6, sel_initWithRequest_cachedResponse_client_))
  {
    objc_msgSend((id)objc_opt_class(), "_cf_internalImpl");
    operator new();
  }
  return 0;
}

+ (const)_cf_internalImpl
{
}

@end