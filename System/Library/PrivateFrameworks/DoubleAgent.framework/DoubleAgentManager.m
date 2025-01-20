@interface DoubleAgentManager
+ (id)defaultManager;
- (DoubleAgentManager)init;
- (void)allocateXattrIn:(int)a3 fileSize:(int64_t)a4 named:(id)a5 sized:(unint64_t)a6 how:(unsigned int)a7 reply:(id)a8;
- (void)listXattrsIn:(int)a3 fileSize:(int64_t)a4 reply:(id)a5;
- (void)lookupXattrIn:(int)a3 fileSize:(int64_t)a4 named:(id)a5 reply:(id)a6;
- (void)removeXattrOf:(int)a3 fileSize:(int64_t)a4 named:(id)a5 reply:(id)a6;
@end

@implementation DoubleAgentManager

+ (id)defaultManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__DoubleAgentManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_once != -1) {
    dispatch_once(&defaultManager_once, block);
  }
  v2 = (void *)defaultManager_manager;
  return v2;
}

uint64_t __36__DoubleAgentManager_defaultManager__block_invoke(uint64_t a1)
{
  defaultManager_manager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (DoubleAgentManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)DoubleAgentManager;
  return [(DoubleAgentManager *)&v3 init];
}

- (void)lookupXattrIn:(int)a3 fileSize:(int64_t)a4 named:(id)a5 reply:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a5;
  id v10 = a6;
  v11 = [[AppleDoubleParser alloc] initWithFileDescriptor:v8 fileSize:a4 isAllocateXattr:0];
  if (v11)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __57__DoubleAgentManager_lookupXattrIn_fileSize_named_reply___block_invoke;
    v12[3] = &unk_2652FB080;
    id v13 = v10;
    [(AppleDoubleParser *)v11 lookupXattrNamed:v9 reply:v12];
  }
  else
  {
    (*((void (**)(id, uint64_t, void, void))v10 + 2))(v10, 93, 0, 0);
  }
}

uint64_t __57__DoubleAgentManager_lookupXattrIn_fileSize_named_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allocateXattrIn:(int)a3 fileSize:(int64_t)a4 named:(id)a5 sized:(unint64_t)a6 how:(unsigned int)a7 reply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v12 = *(void *)&a3;
  id v13 = a5;
  id v14 = a8;
  v15 = [[AppleDoubleParser alloc] initWithFileDescriptor:v12 fileSize:a4 isAllocateXattr:1];
  if (v15)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __69__DoubleAgentManager_allocateXattrIn_fileSize_named_sized_how_reply___block_invoke;
    v16[3] = &unk_2652FB0A8;
    id v17 = v14;
    [(AppleDoubleParser *)v15 allocateXattrNamed:v13 sized:a6 how:v9 reply:v16];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v14 + 2))(v14, 93, 0);
  }
}

uint64_t __69__DoubleAgentManager_allocateXattrIn_fileSize_named_sized_how_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)listXattrsIn:(int)a3 fileSize:(int64_t)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v10[4365] = *MEMORY[0x263EF8340];
  v7 = (void (**)(id, void, void *))a5;
  uint64_t v8 = [[AppleDoubleParser alloc] initWithFileDescriptor:v6 fileSize:a4 isAllocateXattr:0];
  if (v8)
  {
    bzero(v10, 0x8868uLL);
    [(AppleDoubleParser *)v8 listXattrs:v10];
    uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithBytes:v10 length:34920];
    v7[2](v7, 0, v9);
  }
  else
  {
    v7[2](v7, 93, 0);
  }
}

- (void)removeXattrOf:(int)a3 fileSize:(int64_t)a4 named:(id)a5 reply:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a5;
  id v10 = a6;
  v11 = [[AppleDoubleParser alloc] initWithFileDescriptor:v8 fileSize:a4 isAllocateXattr:0];
  if (v11)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __57__DoubleAgentManager_removeXattrOf_fileSize_named_reply___block_invoke;
    v12[3] = &unk_2652FB038;
    id v13 = v10;
    [(AppleDoubleParser *)v11 removeXattrNamed:v9 reply:v12];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 93, 0);
  }
}

uint64_t __57__DoubleAgentManager_removeXattrOf_fileSize_named_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end