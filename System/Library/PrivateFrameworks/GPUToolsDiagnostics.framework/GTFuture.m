@interface GTFuture
@end

@implementation GTFuture

id __40__GTFuture__addDependency_REQUIRESLOCK___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) lock];
  [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 16) broadcast];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v2 unlock];
}

void __24__GTFuture_notifyGroup___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v2 = *(NSObject **)(a1 + 32);

  dispatch_release(v2);
}

void __34__GTFuture_notifyOnQueue_handler___block_invoke(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
  v2 = *(NSObject **)(a1 + 32);

  dispatch_release(v2);
}

void __30__GTFuture_resolveWithFuture___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) lock];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 32);
  uint64_t v4 = *(void *)(v2 + 40);
  [*(id *)(v2 + 16) unlock];
  objc_msgSend(*(id *)(a1 + 40), "_setResult:error:notify_NOLOCK:", v3, v4, 1);
  v5 = *(void **)(a1 + 32);
}

id __31__GTFuture_timeoutAfter_label___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) lock];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 24);
  id result = [*(id *)(v2 + 16) unlock];
  if (!v3)
  {
    id v5 = +[GTError_tools_diagnostics errorWithDomain:@"DYErrorDomain" code:5 userInfo:0];
    v6 = *(void **)(a1 + 32);
    return objc_msgSend(v6, "_setResult:error:notify_NOLOCK:", 0, v5, 1);
  }
  return result;
}

void __29__GTFuture_addResultHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(void **)(a1 + 48);
}

void __29__GTFuture_addResultHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) lock];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 32);
  uint64_t v4 = *(void *)(v2 + 40);
  [*(id *)(v2 + 16) unlock];
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __29__GTFuture_addResultHandler___block_invoke_3;
  block[3] = &unk_24970;
  uint64_t v6 = *(void *)(a1 + 40);
  block[5] = v4;
  block[6] = v6;
  block[4] = v3;
  dispatch_async(global_queue, block);
}

void __29__GTFuture_addResultHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(void **)(a1 + 48);
}

void __26__GTFuture_logPerformance__block_invoke(id a1)
{
  +[GTFuture logPerformance]::log = [+[NSUserDefaults standardUserDefaults] BOOLForKey:@"GPUDebugger.DYFuture.LogPerformance"];
}

@end