@interface GEOResourceRequester
+ (GEOResourceRequester)sharedRequester;
+ (void)setProxyClass:(Class)a3;
- (GEOResourceRequester)init;
- (GEOResourceRequester)initWithProxy:(id)a3;
- (void)fetchResources:(id)a3 force:(BOOL)a4 manifestConfiguration:(id)a5 auditToken:(id)a6 queue:(id)a7 handler:(id)a8;
- (void)fetchResources:(id)a3 force:(BOOL)a4 unpack:(BOOL)a5 manifestConfiguration:(id)a6 auditToken:(id)a7 queue:(id)a8 handler:(id)a9;
- (void)fetchResources:(id)a3 force:(BOOL)a4 unpack:(BOOL)a5 manifestConfiguration:(id)a6 auditToken:(id)a7 signpostID:(unint64_t)a8 queue:(id)a9 handler:(id)a10;
@end

@implementation GEOResourceRequester

- (void)fetchResources:(id)a3 force:(BOOL)a4 unpack:(BOOL)a5 manifestConfiguration:(id)a6 auditToken:(id)a7 queue:(id)a8 handler:(id)a9
{
}

+ (GEOResourceRequester)sharedRequester
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__GEOResourceRequester_sharedRequester__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB2A0250 != -1) {
    dispatch_once(&qword_1EB2A0250, block);
  }
  v2 = (void *)qword_1EB2A0248;

  return (GEOResourceRequester *)v2;
}

- (void)fetchResources:(id)a3 force:(BOOL)a4 unpack:(BOOL)a5 manifestConfiguration:(id)a6 auditToken:(id)a7 signpostID:(unint64_t)a8 queue:(id)a9 handler:(id)a10
{
}

uint64_t __92__GEOResourceRequester_fetchResources_force_manifestConfiguration_auditToken_queue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39__GEOResourceRequester_sharedRequester__block_invoke(uint64_t a1)
{
  if (!_MergedGlobals_296) {
    [*(id *)(a1 + 32) setProxyClass:objc_opt_class()];
  }
  id v2 = objc_alloc(*(Class *)(a1 + 32));
  id v5 = objc_alloc_init((Class)_MergedGlobals_296);
  uint64_t v3 = [v2 initWithProxy:v5];
  v4 = (void *)qword_1EB2A0248;
  qword_1EB2A0248 = v3;
}

- (GEOResourceRequester)initWithProxy:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOResourceRequester;
  v6 = [(GEOResourceRequester *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_proxy, a3);
  }

  return v7;
}

+ (void)setProxyClass:(Class)a3
{
  if (!_MergedGlobals_296) {
    _MergedGlobals_296 = (uint64_t)a3;
  }
}

- (void)fetchResources:(id)a3 force:(BOOL)a4 manifestConfiguration:(id)a5 auditToken:(id)a6 queue:(id)a7 handler:(id)a8
{
  BOOL v11 = a4;
  id v14 = a8;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__GEOResourceRequester_fetchResources_force_manifestConfiguration_auditToken_queue_handler___block_invoke;
  v16[3] = &unk_1E53EA708;
  id v17 = v14;
  id v15 = v14;
  [(GEOResourceRequester *)self fetchResources:a3 force:v11 unpack:0 manifestConfiguration:a5 auditToken:a6 signpostID:0 queue:a7 handler:v16];
}

- (GEOResourceRequester)init
{
  result = (GEOResourceRequester *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end