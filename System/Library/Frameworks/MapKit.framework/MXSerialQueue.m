@interface MXSerialQueue
@end

@implementation MXSerialQueue

void __36___MXSerialQueue_taskInsertionQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MapKit._MXSerialQueue.taskInsertionQueue", v2);
  v1 = (void *)qword_1EB316168;
  qword_1EB316168 = (uint64_t)v0;
}

void __37___MXSerialQueue_taskCompletionQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MapKit._MXSerialQueue.taskCompletionQueue", v2);
  v1 = (void *)qword_1EB316178;
  qword_1EB316178 = (uint64_t)v0;
}

void __26___MXSerialQueue_addTask___block_invoke(uint64_t a1)
{
  v2 = *(id *)(*(void *)(a1 + 32) + 8);
  dispatch_group_t v3 = dispatch_group_create();
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), v3);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__25;
  v12[4] = __Block_byref_object_dispose__25;
  v4 = v3;
  v13 = v4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __26___MXSerialQueue_addTask___block_invoke_5;
  v11[3] = &unk_1E54B8310;
  v11[4] = *(void *)(a1 + 32);
  v11[5] = v12;
  v5 = (void *)MEMORY[0x18C139AE0](v11);
  dispatch_group_enter(v4);
  v6 = [(id)objc_opt_class() taskQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __26___MXSerialQueue_addTask___block_invoke_3;
  v8[3] = &unk_1E54BCB38;
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  dispatch_group_notify(v2, v6, v8);

  _Block_object_dispose(v12, 8);
}

void __26___MXSerialQueue_addTask___block_invoke_5(uint64_t a1)
{
  v2 = [(id)objc_opt_class() taskCompletionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26___MXSerialQueue_addTask___block_invoke_2;
  block[3] = &unk_1E54B8448;
  block[4] = *(void *)(a1 + 40);
  dispatch_sync(v2, block);
}

void __26___MXSerialQueue_addTask___block_invoke_2(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

uint64_t __26___MXSerialQueue_addTask___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

@end