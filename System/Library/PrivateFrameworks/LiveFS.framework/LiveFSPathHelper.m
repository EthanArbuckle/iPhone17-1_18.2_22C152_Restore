@interface LiveFSPathHelper
+ (id)helperWithMount:(id)a3 andPath:(id)a4;
- (BOOL)resolveTrailingSymlink;
- (LiveFSPathHelper)initWithMount:(id)a3 andPath:(id)a4;
- (NSData)attributes;
- (NSError)error;
- (NSString)fileHandle;
- (id)currentFileHandle;
- (id)peekFileHandle;
- (id)popFileHandle;
- (void)dealloc;
- (void)finalizeWithErrno:(int)a3;
- (void)finalizeWithError:(id)a3;
- (void)lookupNextComponent;
- (void)lookupWithCompletionHandler:(id)a3;
- (void)processLookupReplyWithResult:(int)a3 item:(id)a4 andAttributes:(id)a5;
- (void)processReadLinkReplyForLink:(id)a3 withResult:(int)a4 linkString:(id)a5 andAttributes:(id)a6;
- (void)pushFileHandle:(id)a3 attributes:(id)a4;
- (void)reclaimItem:(id)a3 withContinuation:(id)a4;
- (void)resolveSymlink:(id)a3;
- (void)setResolveTrailingSymlink:(BOOL)a3;
@end

@implementation LiveFSPathHelper

+ (id)helperWithMount:(id)a3 andPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[LiveFSPathHelper alloc] initWithMount:v6 andPath:v5];

  return v7;
}

- (LiveFSPathHelper)initWithMount:(id)a3 andPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)LiveFSPathHelper;
  v9 = [(LiveFSPathHelper *)&v22 init];
  if (v9)
  {
    if ((unint64_t)[v8 lengthOfBytesUsingEncoding:4] < 0x401)
    {
      dispatch_queue_t v12 = dispatch_queue_create("com.apple.LiveFSPathHelper.lookup", 0);
      ourQueue = v9->ourQueue;
      v9->ourQueue = (OS_dispatch_queue *)v12;

      objc_storeStrong((id *)&v9->ourMount, a3);
      uint64_t v14 = [v8 pathComponents];
      pathComponents = v9->pathComponents;
      v9->pathComponents = (NSArray *)v14;

      v9->currentPathComponent = 0;
      uint64_t v16 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", -[NSArray count](v9->pathComponents, "count"));
      fileHandleStack = v9->fileHandleStack;
      v9->fileHandleStack = (NSMutableOrderedSet *)v16;

      uint64_t v18 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v9->pathComponents, "count"));
      attributeStack = v9->attributeStack;
      v9->attributeStack = (NSMutableArray *)v18;

      attributes = v9->_attributes;
      v9->_attributes = 0;

      v9->fileHandleStackCount = 0;
      *(_WORD *)&v9->lookupCompleted = 0;
      v9->resolveTrailingSymlink = 1;
      v9->numberOfSymlinks = 0;
    }
    else
    {
      uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:63 userInfo:0];
      error = v9->_error;
      v9->_error = (NSError *)v10;
    }
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v3 = [(LiveFSPathHelper *)self popFileHandle];
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      [(LiveFSVolumeCore *)self->ourMount reclaim:v4 requestID:-1 reply:&__block_literal_global_0];
      uint64_t v5 = [(LiveFSPathHelper *)self popFileHandle];

      v4 = (void *)v5;
    }
    while (v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)LiveFSPathHelper;
  [(LiveFSPathHelper *)&v6 dealloc];
}

- (void)finalizeWithError:(id)a3
{
  id v5 = a3;
  if (!self->lookupCompleted)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_error, a3);
    *(_WORD *)&self->lookupCompleted = 1;
    objc_super v6 = (void (**)(void *, id))_Block_copy(self->completionHandler);
    id completionHandler = self->completionHandler;
    self->id completionHandler = 0;

    v6[2](v6, v8);
    id v5 = v8;
  }
}

- (void)finalizeWithErrno:(int)a3
{
  id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:a3 userInfo:0];
  [(LiveFSPathHelper *)self finalizeWithError:v4];
}

- (id)currentFileHandle
{
  uint64_t v3 = [(LiveFSPathHelper *)self peekFileHandle];
  if (!v3) {
    uint64_t v3 = self->rootFileHandle;
  }

  return v3;
}

- (void)reclaimItem:(id)a3 withContinuation:(id)a4
{
  id v6 = a4;
  ourMount = self->ourMount;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__LiveFSPathHelper_reclaimItem_withContinuation___block_invoke;
  v9[3] = &unk_264DC7770;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(LiveFSVolumeCore *)ourMount reclaim:a3 requestID:-1 reply:v9];
}

void __49__LiveFSPathHelper_reclaimItem_withContinuation___block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__LiveFSPathHelper_reclaimItem_withContinuation___block_invoke_2;
  block[3] = &unk_264DC7748;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __49__LiveFSPathHelper_reclaimItem_withContinuation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)processReadLinkReplyForLink:(id)a3 withResult:(int)a4 linkString:(id)a5 andAttributes:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a4) {
    goto LABEL_8;
  }
  id v13 = v11;
  uint64_t v14 = (unsigned char *)[v13 UTF8String];
  if ((unint64_t)[v13 length] < 2)
  {
    a4 = 2;
LABEL_8:
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __84__LiveFSPathHelper_processReadLinkReplyForLink_withResult_linkString_andAttributes___block_invoke;
    v21[3] = &unk_264DC7798;
    v21[4] = self;
    int v22 = a4;
    [(LiveFSPathHelper *)self reclaimItem:v10 withContinuation:v21];
    goto LABEL_9;
  }
  if ((unint64_t)([v13 length] - 1026) < 0xFFFFFFFFFFFFFBFFLL)
  {
    a4 = 63;
    goto LABEL_8;
  }
  if (*v14 == 47)
  {
    a4 = 18;
    goto LABEL_8;
  }
LABEL_9:
  v15 = [v11 pathComponents];
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v15, "count") + -[NSArray count](self->pathComponents, "count"));
  uint64_t v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  [(NSArray *)v16 addObjectsFromArray:v15];
  pathComponents = self->pathComponents;
  for (unint64_t i = self->currentPathComponent + 1; i < [(NSArray *)pathComponents count]; ++i)
  {
    v19 = [(NSArray *)self->pathComponents objectAtIndex:i];
    [(NSArray *)v16 addObject:v19];

    pathComponents = self->pathComponents;
  }
  v20 = self->pathComponents;
  self->pathComponents = v16;

  self->currentPathComponent = 0;
  [(LiveFSPathHelper *)self lookupNextComponent];
}

uint64_t __84__LiveFSPathHelper_processReadLinkReplyForLink_withResult_linkString_andAttributes___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finalizeWithErrno:*(unsigned int *)(a1 + 40)];
}

- (void)resolveSymlink:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  unint64_t numberOfSymlinks = self->numberOfSymlinks;
  self->unint64_t numberOfSymlinks = numberOfSymlinks + 1;
  if (numberOfSymlinks == 255)
  {
    [(LiveFSPathHelper *)self finalizeWithErrno:62];
  }
  else
  {
    ourMount = self->ourMount;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __35__LiveFSPathHelper_resolveSymlink___block_invoke;
    v8[3] = &unk_264DC77E8;
    v8[4] = self;
    id v9 = v4;
    [(LiveFSVolumeCore *)ourMount readLinkOf:v9 requestID:-1 reply:v8];
  }
}

void __35__LiveFSPathHelper_resolveSymlink___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__LiveFSPathHelper_resolveSymlink___block_invoke_2;
  block[3] = &unk_264DC77C0;
  void block[4] = v9;
  id v11 = *(id *)(a1 + 40);
  int v18 = a2;
  id v15 = v11;
  id v16 = v7;
  id v17 = v8;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

uint64_t __35__LiveFSPathHelper_resolveSymlink___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) processReadLinkReplyForLink:*(void *)(a1 + 40) withResult:*(unsigned int *)(a1 + 64) linkString:*(void *)(a1 + 48) andAttributes:*(void *)(a1 + 56)];
}

- (void)processLookupReplyWithResult:(int)a3 item:(id)a4 andAttributes:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  if (v6)
  {
    id v10 = self;
    uint64_t v11 = v6;
  }
  else if ([(NSMutableOrderedSet *)self->fileHandleStack containsObject:v8])
  {
    id v10 = self;
    uint64_t v11 = 62;
  }
  else
  {
    id v12 = v9;
    uint64_t v13 = [v12 bytes];
    if (*(unsigned char *)(v13 + 8))
    {
      uint64_t v14 = v13;
      unint64_t currentPathComponent = self->currentPathComponent;
      NSUInteger v16 = [(NSArray *)self->pathComponents count];
      int v17 = *(_DWORD *)(v14 + 24);
      if (currentPathComponent == v16 - 1)
      {
        if (v17 != 3 || !self->resolveTrailingSymlink)
        {
          [(LiveFSPathHelper *)self pushFileHandle:v8 attributes:v12];
          [(LiveFSPathHelper *)self finalizeWithError:0];
          goto LABEL_8;
        }
      }
      else
      {
        if (v17 == 2)
        {
          [(LiveFSPathHelper *)self pushFileHandle:v8 attributes:v12];
          ++self->currentPathComponent;
          [(LiveFSPathHelper *)self lookupNextComponent];
          goto LABEL_8;
        }
        if (v17 != 3)
        {
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __68__LiveFSPathHelper_processLookupReplyWithResult_item_andAttributes___block_invoke;
          v18[3] = &unk_264DC7810;
          v18[4] = self;
          [(LiveFSPathHelper *)self reclaimItem:v8 withContinuation:v18];
          goto LABEL_8;
        }
      }
      [(LiveFSPathHelper *)self resolveSymlink:v8];
      goto LABEL_8;
    }
    id v10 = self;
    uint64_t v11 = 5;
  }
  [(LiveFSPathHelper *)v10 finalizeWithErrno:v11];
LABEL_8:
}

uint64_t __68__LiveFSPathHelper_processLookupReplyWithResult_item_andAttributes___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finalizeWithErrno:20];
}

- (void)lookupNextComponent
{
  unint64_t currentPathComponent = self->currentPathComponent;
  if (currentPathComponent >= [(NSArray *)self->pathComponents count])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = 0;
    while (1)
    {
      id v5 = v4;
      id v13 = [(NSArray *)self->pathComponents objectAtIndex:self->currentPathComponent];

      if ([v13 length])
      {
        if (([v13 isEqualToString:@"."] & 1) == 0
          && ![v13 isEqualToString:@"/"])
        {
          break;
        }
      }
      pathComponents = self->pathComponents;
      unint64_t v7 = self->currentPathComponent + 1;
      self->unint64_t currentPathComponent = v7;
      BOOL v8 = v7 >= [(NSArray *)pathComponents count];
      id v4 = v13;
      if (v8) {
        goto LABEL_10;
      }
    }
    if ([v13 isEqualToString:@".."])
    {
      ++self->currentPathComponent;
      id v12 = [(LiveFSPathHelper *)self popFileHandle];
      if (v12)
      {
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __39__LiveFSPathHelper_lookupNextComponent__block_invoke;
        v15[3] = &unk_264DC7810;
        v15[4] = self;
        [(LiveFSPathHelper *)self reclaimItem:v12 withContinuation:v15];
      }
      else
      {
        [(LiveFSPathHelper *)self finalizeWithErrno:18];
      }

      goto LABEL_28;
    }
    id v4 = v13;
  }
LABEL_10:
  id v13 = v4;
  unint64_t v9 = self->currentPathComponent;
  if (v9 == [(NSArray *)self->pathComponents count])
  {
    [(LiveFSPathHelper *)self finalizeWithError:0];
LABEL_14:

    return;
  }
  if ((unint64_t)[v13 lengthOfBytesUsingEncoding:4] >= 0x100)
  {
    [(LiveFSPathHelper *)self finalizeWithErrno:63];
    goto LABEL_14;
  }
  if (v13)
  {
    ourMount = self->ourMount;
    uint64_t v11 = [(LiveFSPathHelper *)self currentFileHandle];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __39__LiveFSPathHelper_lookupNextComponent__block_invoke_2;
    v14[3] = &unk_264DC7860;
    v14[4] = self;
    [(LiveFSVolumeCore *)ourMount lookupIn:v11 name:v13 usingFlags:0 requestID:-1 reply:v14];

LABEL_28:
    return;
  }

  [(LiveFSPathHelper *)self finalizeWithErrno:22];
}

uint64_t __39__LiveFSPathHelper_lookupNextComponent__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) lookupNextComponent];
}

void __39__LiveFSPathHelper_lookupNextComponent__block_invoke_2(uint64_t a1, int a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(NSObject **)(v10 + 8);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __39__LiveFSPathHelper_lookupNextComponent__block_invoke_3;
  v14[3] = &unk_264DC7838;
  int v17 = a2;
  v14[4] = v10;
  id v15 = v8;
  id v16 = v9;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(v11, v14);
}

uint64_t __39__LiveFSPathHelper_lookupNextComponent__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) processLookupReplyWithResult:*(unsigned int *)(a1 + 56) item:*(void *)(a1 + 40) andAttributes:*(void *)(a1 + 48)];
}

- (void)lookupWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void))v4;
  if (self->lookupCompleted)
  {
    (*((void (**)(id, NSError *))v4 + 2))(v4, self->_error);
  }
  else if (self->lookupInProgress)
  {
    uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:16 userInfo:0];
    ((void (**)(void, void *))v5)[2](v5, v6);
  }
  else
  {
    self->lookupInProgress = 1;
    unint64_t v7 = _Block_copy(v4);
    id completionHandler = self->completionHandler;
    self->id completionHandler = v7;

    ourMount = self->ourMount;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__LiveFSPathHelper_lookupWithCompletionHandler___block_invoke;
    v10[3] = &unk_264DC7888;
    v10[4] = self;
    uint64_t v11 = v5;
    [(LiveFSVolumeCore *)ourMount getRootFileHandleWithError:v10];
  }
}

void __48__LiveFSPathHelper_lookupWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a2);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(NSObject **)(v7 + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__LiveFSPathHelper_lookupWithCompletionHandler___block_invoke_2;
    block[3] = &unk_264DC7810;
    void block[4] = v7;
    dispatch_async(v8, block);
  }
}

uint64_t __48__LiveFSPathHelper_lookupWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) lookupNextComponent];
}

- (void)pushFileHandle:(id)a3 attributes:(id)a4
{
  id v6 = (NSData *)a4;
  [(NSMutableOrderedSet *)self->fileHandleStack addObject:a3];
  [(NSMutableArray *)self->attributeStack addObject:v6];
  attributes = self->_attributes;
  self->_attributes = v6;

  ++self->fileHandleStackCount;
}

- (id)popFileHandle
{
  id v3 = [(LiveFSPathHelper *)self peekFileHandle];
  if (v3)
  {
    [(NSMutableOrderedSet *)self->fileHandleStack removeObject:v3];
    unint64_t fileHandleStackCount = self->fileHandleStackCount;
    self->unint64_t fileHandleStackCount = fileHandleStackCount - 1;
    if (fileHandleStackCount == 1)
    {
      attributes = self->_attributes;
      self->_attributes = 0;
    }
    else
    {
      id v5 = [(NSMutableArray *)self->attributeStack objectAtIndex:fileHandleStackCount - 2];
      attributes = self->_attributes;
      self->_attributes = v5;
    }
  }

  return v3;
}

- (id)peekFileHandle
{
  unint64_t fileHandleStackCount = self->fileHandleStackCount;
  if (fileHandleStackCount)
  {
    id v3 = [(NSMutableOrderedSet *)self->fileHandleStack objectAtIndex:fileHandleStackCount - 1];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (NSData)attributes
{
  attributes = self->_attributes;
  if (self->fileHandleStackCount) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = attributes == 0;
  }
  if (v3)
  {
    ourQueue = self->ourQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__LiveFSPathHelper_attributes__block_invoke;
    block[3] = &unk_264DC7810;
    void block[4] = self;
    dispatch_sync(ourQueue, block);
    attributes = self->_attributes;
  }
  id v6 = attributes;

  return v6;
}

uint64_t __30__LiveFSPathHelper_attributes__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__LiveFSPathHelper_attributes__block_invoke_2;
  v5[3] = &unk_264DC78B0;
  v5[4] = v1;
  return [v2 fileAttributes:v3 requestID:-1 reply:v5];
}

void __30__LiveFSPathHelper_attributes__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a3);
    id v6 = v7;
  }
}

- (BOOL)resolveTrailingSymlink
{
  return self->resolveTrailingSymlink;
}

- (void)setResolveTrailingSymlink:(BOOL)a3
{
  if (!self->lookupInProgress && !self->lookupCompleted) {
    self->resolveTrailingSymlink = a3;
  }
}

- (NSString)fileHandle
{
  if (self->lookupCompleted && !self->_error)
  {
    v2 = [(LiveFSPathHelper *)self currentFileHandle];
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->completionHandler, 0);
  objc_storeStrong((id *)&self->attributeStack, 0);
  objc_storeStrong((id *)&self->fileHandleStack, 0);
  objc_storeStrong((id *)&self->pathComponents, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->rootFileHandle, 0);
  objc_storeStrong((id *)&self->ourMount, 0);

  objc_storeStrong((id *)&self->ourQueue, 0);
}

@end