@interface QLThumbnailConnectionHandler
+ (id)hostXPCInterface;
+ (id)serviceXPCInterface;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)generationQueue;
- (OS_dispatch_queue)replyQueue;
- (QLThumbnailConnectionHandler)initWithPrincipalObject:(id)a3;
- (id)principalObject;
- (void)generateThumbnailForRequest:(id)a3 completionHandler:(id)a4;
- (void)setConnection:(id)a3;
- (void)setGenerationQueue:(id)a3;
- (void)setPrincipalObject:(id)a3;
- (void)setReplyQueue:(id)a3;
@end

@implementation QLThumbnailConnectionHandler

+ (id)serviceXPCInterface
{
  if (serviceXPCInterface_onceToken != -1) {
    dispatch_once(&serviceXPCInterface_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)serviceXPCInterface___interface;

  return v2;
}

void __51__QLThumbnailConnectionHandler_serviceXPCInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0A9B9F0];
  v1 = (void *)serviceXPCInterface___interface;
  serviceXPCInterface___interface = v0;

  v2 = (void *)serviceXPCInterface___interface;
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_generateThumbnailForRequest_completionHandler_ argumentIndex:0 ofReply:0];

  v4 = (void *)serviceXPCInterface___interface;
  id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v4 setClasses:v5 forSelector:sel_generateThumbnailForRequest_completionHandler_ argumentIndex:0 ofReply:1];
}

+ (id)hostXPCInterface
{
  if (hostXPCInterface_onceToken != -1) {
    dispatch_once(&hostXPCInterface_onceToken, &__block_literal_global_49);
  }
  v2 = (void *)hostXPCInterface___interface;

  return v2;
}

uint64_t __48__QLThumbnailConnectionHandler_hostXPCInterface__block_invoke()
{
  hostXPCInterface___interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0AA0438];

  return MEMORY[0x1F41817F8]();
}

- (QLThumbnailConnectionHandler)initWithPrincipalObject:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)QLThumbnailConnectionHandler;
  v6 = [(QLThumbnailConnectionHandler *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_principalObject, a3);
    v8 = MEMORY[0x1E4F14430];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.quicklook.thumbnail.connectionhandler.generation", v9);
    generationQueue = v7->_generationQueue;
    v7->_generationQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.quicklook.thumbnail.connectionhandler.reply", v12);
    replyQueue = v7->_replyQueue;
    v7->_replyQueue = (OS_dispatch_queue *)v13;
  }
  return v7;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  id v5 = +[QLThumbnailConnectionHandler serviceXPCInterface];
  [v4 setExportedInterface:v5];

  [v4 setExportedObject:self];
  v6 = +[QLThumbnailConnectionHandler hostXPCInterface];
  [v4 setRemoteObjectInterface:v6];

  [v4 activate];
  return 1;
}

- (void)generateThumbnailForRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F29268] currentConnection];
  v9 = [(QLThumbnailConnectionHandler *)self generationQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__QLThumbnailConnectionHandler_generateThumbnailForRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E6009E88;
  id v14 = v6;
  v15 = self;
  id v16 = v8;
  id v17 = v7;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, v13);
}

void __78__QLThumbnailConnectionHandler_generateThumbnailForRequest_completionHandler___block_invoke(id *a1)
{
  v2 = [a1[4] item];
  [v2 startAccessingIfNeeded];

  v3 = [a1[5] principalObject];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__QLThumbnailConnectionHandler_generateThumbnailForRequest_completionHandler___block_invoke_2;
  v6[3] = &unk_1E6009E60;
  int8x16_t v5 = *((int8x16_t *)a1 + 2);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  id v9 = a1[7];
  id v8 = a1[6];
  [v3 provideThumbnailForFileRequest:v4 completionHandler:v6];
}

void __78__QLThumbnailConnectionHandler_generateThumbnailForRequest_completionHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int8x16_t v7 = [a1[4] replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__QLThumbnailConnectionHandler_generateThumbnailForRequest_completionHandler___block_invoke_3;
  block[3] = &unk_1E6009E38;
  id v11 = v6;
  id v12 = a1[5];
  id v15 = a1[7];
  id v13 = v5;
  id v14 = a1[6];
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __78__QLThumbnailConnectionHandler_generateThumbnailForRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(a1 + 40) item];
    [v2 cleanup];

    v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    id v4 = [[QLServiceThumbnailRenderer alloc] initWithRequest:*(void *)(a1 + 40) reply:*(void *)(a1 + 48) connection:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
    [(QLServiceThumbnailRenderer *)v4 generateThumbnailAndPerformCompletionHandler];
  }
}

- (id)principalObject
{
  return self->_principalObject;
}

- (void)setPrincipalObject:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)generationQueue
{
  return self->_generationQueue;
}

- (void)setGenerationQueue:(id)a3
{
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void)setReplyQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_generationQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong(&self->_principalObject, 0);
}

@end