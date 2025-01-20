@interface CRKCancelableServer
- (CRKCancelable)cachedCancelable;
- (CRKCancelableServer)initWithCancelableGenerator:(id)a3;
- (id)generator;
- (id)makeCountedCancelable;
- (int64_t)clientCount;
- (void)decrementClientCount;
- (void)performBlockOnMainThreadIfNeeded:(id)a3;
- (void)setCachedCancelable:(id)a3;
- (void)setClientCount:(int64_t)a3;
@end

@implementation CRKCancelableServer

- (CRKCancelableServer)initWithCancelableGenerator:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKCancelableServer;
  v5 = [(CRKCancelableServer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x22A620AF0](v4);
    id generator = v5->_generator;
    v5->_id generator = (id)v6;
  }
  return v5;
}

- (id)makeCountedCancelable
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    objc_super v9 = [MEMORY[0x263F08690] currentHandler];
    v10 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, @"CRKCancelableServer.m", 35, @"%@ must be called from the main thread", v10 object file lineNumber description];
  }
  id v4 = [(CRKCancelableServer *)self cachedCancelable];

  if (!v4)
  {
    v5 = [(CRKCancelableServer *)self generator];
    uint64_t v6 = v5[2]();
    [(CRKCancelableServer *)self setCachedCancelable:v6];
  }
  [(CRKCancelableServer *)self setClientCount:[(CRKCancelableServer *)self clientCount] + 1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__CRKCancelableServer_makeCountedCancelable__block_invoke;
  v11[3] = &unk_2646F35C0;
  v11[4] = self;
  v7 = +[CRKBlockCancelable cancelableWithBlock:v11];

  return v7;
}

uint64_t __44__CRKCancelableServer_makeCountedCancelable__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__CRKCancelableServer_makeCountedCancelable__block_invoke_2;
  v3[3] = &unk_2646F35C0;
  v3[4] = v1;
  return [v1 performBlockOnMainThreadIfNeeded:v3];
}

uint64_t __44__CRKCancelableServer_makeCountedCancelable__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) decrementClientCount];
}

- (void)performBlockOnMainThreadIfNeeded:(id)a3
{
  v3 = (void *)MEMORY[0x263F08B88];
  block = (void (**)(void))a3;
  if ([v3 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (void)decrementClientCount
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v6 = NSStringFromSelector(a2);
    [v5 handleFailureInMethod:a2, self, @"CRKCancelableServer.m", 64, @"%@ must be called from the main thread", v6 object file lineNumber description];
  }
  if ([(CRKCancelableServer *)self clientCount] <= 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CRKCancelableServer.m", 66, @"Invalid client count: %ld", -[CRKCancelableServer clientCount](self, "clientCount"));
  }
  [(CRKCancelableServer *)self setClientCount:[(CRKCancelableServer *)self clientCount] - 1];
  if (![(CRKCancelableServer *)self clientCount])
  {
    id v4 = [(CRKCancelableServer *)self cachedCancelable];
    [v4 cancel];

    [(CRKCancelableServer *)self setCachedCancelable:0];
  }
}

- (id)generator
{
  return self->_generator;
}

- (CRKCancelable)cachedCancelable
{
  return self->_cachedCancelable;
}

- (void)setCachedCancelable:(id)a3
{
}

- (int64_t)clientCount
{
  return self->_clientCount;
}

- (void)setClientCount:(int64_t)a3
{
  self->_clientCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCancelable, 0);

  objc_storeStrong(&self->_generator, 0);
}

@end