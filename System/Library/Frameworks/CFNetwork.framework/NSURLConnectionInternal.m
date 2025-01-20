@interface NSURLConnectionInternal
- (NSURLConnectionInternal)initWithInfo:(const InternalInit *)a3;
- (id)_timingData;
- (void)_setDelegateQueue:(id)a3;
- (void)_withActiveConnectionAndDelegate:(uint64_t)a1;
- (void)_withConnectionAndDelegate:(char)a3 onlyActive:;
- (void)_withConnectionAndDelegate:(uint64_t)a1;
- (void)dealloc;
@end

@implementation NSURLConnectionInternal

- (id)_timingData
{
  return 0;
}

- (void)_setDelegateQueue:(id)a3
{
  delegateQueue = self->_delegateQueue;
  if (delegateQueue != a3)
  {

    self->_delegateQueue = (NSOperationQueue *)a3;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLConnectionInternal;
  [(NSURLConnectionInternal *)&v3 dealloc];
}

- (NSURLConnectionInternal)initWithInfo:(const InternalInit *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSURLConnectionInternal;
  v4 = [(NSURLConnectionInternal *)&v6 init];
  if (v4)
  {
    v4->_connection = (NSURLConnection *)CFRetain(a3->var0);
    v4->_originalRequest = (NSURLRequest *)a3->var1;
    v4->_currentRequest = (NSURLRequest *)a3->var1;
    v4->_delegate = a3->var2;
    v4->_url = (NSURL *)(id)[a3->var1 URL];
    v4->_connectionProperties = (NSDictionary *)a3->var3;
  }
  return v4;
}

void __66__NSURLConnectionInternal__withConnectionDisconnectFromConnection__block_invoke(uint64_t a1, const void *a2, void *a3)
{
  *(void *)(*(void *)(a1 + 32) + 48) = 0;
  *(void *)(*(void *)(a1 + 32) + 8) = 0;

  [*(id *)(a1 + 32) _invalidate];

  CFRelease(a2);
}

- (void)_withConnectionAndDelegate:(char)a3 onlyActive:
{
  objc_super v6 = (void *)MEMORY[0x18531D6D0]();
  if (*(unsigned char *)(a1 + 64) || (a3 & 1) == 0)
  {
    id v7 = *(id *)(a1 + 8);
    id v8 = *(id *)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__NSURLConnectionInternal__withConnectionAndDelegate_onlyActive___block_invoke;
    v9[3] = &unk_1E5258430;
    v9[4] = v7;
    v9[5] = v8;
    char v10 = a3;
    v9[6] = a1;
    v9[7] = a2;
    [(id)a1 invokeForDelegate:v9];
  }
}

void __65__NSURLConnectionInternal__withConnectionAndDelegate_onlyActive___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 48) + 64) || !*(unsigned char *)(a1 + 64)) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }

  v2 = *(void **)(a1 + 40);
}

- (void)_withConnectionAndDelegate:(uint64_t)a1
{
  if (a1)
  {
    v4 = (void *)MEMORY[0x18531D6D0]();
    -[NSURLConnectionInternal _withConnectionAndDelegate:onlyActive:](a1, a2, 0);
  }
}

- (void)_withActiveConnectionAndDelegate:(uint64_t)a1
{
  if (a1)
  {
    v4 = (void *)MEMORY[0x18531D6D0]();
    -[NSURLConnectionInternal _withConnectionAndDelegate:onlyActive:](a1, a2, 1);
  }
}

@end