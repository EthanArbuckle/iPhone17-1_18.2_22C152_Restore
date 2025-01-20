@interface CalDAVPropPatchWithFallbackTaskGroup
- (CalDAVPropPatchWithFallbackTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4 primaryPropertiesToSet:(id)a5 fallbackPropertiesToSet:(id)a6 atURL:(id)a7;
- (CoreDAVResponseItem)responseItem;
- (void)_proppatchAfterFailureCount:(unint64_t)a3;
- (void)setResponseItem:(id)a3;
- (void)startTaskGroup;
@end

@implementation CalDAVPropPatchWithFallbackTaskGroup

- (CalDAVPropPatchWithFallbackTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4 primaryPropertiesToSet:(id)a5 fallbackPropertiesToSet:(id)a6 atURL:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)CalDAVPropPatchWithFallbackTaskGroup;
  v16 = [(CoreDAVTaskGroup *)&v19 initWithAccountInfoProvider:a3 taskManager:a4];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_primaryElements, a5);
    objc_storeStrong((id *)&v17->_fallbackElements, a6);
    objc_storeStrong((id *)&v17->_url, a7);
  }

  return v17;
}

- (void)_proppatchAfterFailureCount:(unint64_t)a3
{
  v5 = &OBJC_IVAR___CalDAVPropPatchWithFallbackTaskGroup__fallbackElements;
  if (!a3) {
    v5 = &OBJC_IVAR___CalDAVPropPatchWithFallbackTaskGroup__primaryElements;
  }
  id v6 = *(id *)((char *)&self->super.super.isa + *v5);
  v7 = (void *)[objc_alloc(MEMORY[0x263F34B88]) initWithPropertiesToSet:v6 andRemove:0 atURL:self->_url];
  v8 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [v7 setAccountInfoProvider:v8];

  objc_initWeak(&location, v7);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __68__CalDAVPropPatchWithFallbackTaskGroup__proppatchAfterFailureCount___block_invoke;
  id v13 = &unk_2641EC2E8;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a3;
  id v14 = self;
  [v7 setCompletionBlock:&v10];
  v9 = [(CoreDAVTaskGroup *)self taskManager];
  [v9 submitQueuedCoreDAVTask:v7];

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void __68__CalDAVPropPatchWithFallbackTaskGroup__proppatchAfterFailureCount___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained error];
  v5 = v4;
  if (!v4 || *(void *)(a1 + 48))
  {

LABEL_4:
    id v6 = objc_loadWeakRetained(v2);
    v7 = [v6 responseItem];
    [*(id *)(a1 + 32) setResponseItem:v7];

    v8 = *(void **)(a1 + 32);
    id v13 = objc_loadWeakRetained(v2);
    v9 = [v13 error];
    [v8 finishCoreDAVTaskGroupWithError:v9 delegateCallbackBlock:0];

    return;
  }
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 104) count];

  if (!v10) {
    goto LABEL_4;
  }
  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 48) + 1;
  [v11 _proppatchAfterFailureCount:v12];
}

- (void)startTaskGroup
{
}

- (CoreDAVResponseItem)responseItem
{
  return self->_responseItem;
}

- (void)setResponseItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseItem, 0);
  objc_storeStrong((id *)&self->_fallbackElements, 0);
  objc_storeStrong((id *)&self->_primaryElements, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end