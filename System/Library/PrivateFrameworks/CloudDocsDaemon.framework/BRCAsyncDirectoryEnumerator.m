@interface BRCAsyncDirectoryEnumerator
- (BRCRelativePath)rootPath;
- (id)initForEnumeratingBelow:(id)a3 recursive:(BOOL)a4 batchSize:(int64_t)a5 targetQueue:(id)a6;
- (void)dealloc;
- (void)scheduleWithProcessBlock:(id)a3 completion:(id)a4;
@end

@implementation BRCAsyncDirectoryEnumerator

- (id)initForEnumeratingBelow:(id)a3 recursive:(BOOL)a4 batchSize:(int64_t)a5 targetQueue:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)BRCAsyncDirectoryEnumerator;
  v13 = [(BRCAsyncDirectoryEnumerator *)&v25 init];
  v14 = v13;
  if (v13)
  {
    [v11 resolveAndKeepOpenMustExist:1 error:&v13->_error];
    objc_storeStrong((id *)&v14->_rootPath, a3);
    v14->_isRecursive = a4;
    objc_storeStrong((id *)&v14->_targetQueue, a6);
    v14->_batchSize = a5;
    v15 = NSString;
    v16 = [v11 filename];
    v17 = [v15 stringWithFormat:@"directory-enumerator/%@", v16];

    id v18 = v17;
    v19 = (const char *)[v18 UTF8String];
    v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(v20, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create(v19, v21);

    internalQueue = v14->_internalQueue;
    v14->_internalQueue = (OS_dispatch_queue *)v22;
  }
  return v14;
}

- (void)scheduleWithProcessBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__BRCAsyncDirectoryEnumerator_scheduleWithProcessBlock_completion___block_invoke;
  block[3] = &unk_1E6999CC8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __67__BRCAsyncDirectoryEnumerator_scheduleWithProcessBlock_completion___block_invoke(uint64_t a1)
{
  id v2 = [[BRCDirectoryEnumerator alloc] initForEnumeratingBelow:*(void *)(*(void *)(a1 + 32) + 40) recursive:*(unsigned __int8 *)(*(void *)(a1 + 32) + 32) error:*(void *)(a1 + 32) + 36];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v24 = 0;
  objc_super v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  do
  {
    if (!*((unsigned char *)v25 + 24)) {
      break;
    }
    v4 = (void *)MEMORY[0x1D9438760]();
    v5 = [v2 nextObject];
    if (v5)
    {
      [v3 addObject:v5];
      uint64_t v6 = [v3 count];
      uint64_t v7 = *(void *)(a1 + 32);
      if (v6 >= *(void *)(v7 + 24))
      {
        v8 = *(NSObject **)(v7 + 16);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __67__BRCAsyncDirectoryEnumerator_scheduleWithProcessBlock_completion___block_invoke_2;
        block[3] = &unk_1E699A568;
        v23 = &v24;
        id v9 = *(id *)(a1 + 40);
        uint64_t v10 = *(void *)(a1 + 32);
        id v22 = v9;
        block[4] = v10;
        id v11 = v3;
        id v21 = v11;
        dispatch_sync(v8, block);
        [v11 removeAllObjects];
      }
    }
  }
  while (v5);
  id v12 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__BRCAsyncDirectoryEnumerator_scheduleWithProcessBlock_completion___block_invoke_3;
  v15[3] = &unk_1E699A590;
  id v16 = v3;
  id v13 = *(id *)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = v13;
  id v19 = *(id *)(a1 + 48);
  id v14 = v3;
  dispatch_sync(v12, v15);

  _Block_object_dispose(&v24, 8);
}

uint64_t __67__BRCAsyncDirectoryEnumerator_scheduleWithProcessBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __67__BRCAsyncDirectoryEnumerator_scheduleWithProcessBlock_completion___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count]) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v2();
}

- (void)dealloc
{
  [(BRCRelativePath *)self->_rootPath close];
  v3.receiver = self;
  v3.super_class = (Class)BRCAsyncDirectoryEnumerator;
  [(BRCAsyncDirectoryEnumerator *)&v3 dealloc];
}

- (BRCRelativePath)rootPath
{
  return self->_rootPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end