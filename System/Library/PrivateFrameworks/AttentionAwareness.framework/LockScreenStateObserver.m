@interface LockScreenStateObserver
- (LockScreenStateObserver)initWithCallbackQueue:(id)a3 observer:(id)a4;
@end

@implementation LockScreenStateObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);

  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (LockScreenStateObserver)initWithCallbackQueue:(id)a3 observer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)LockScreenStateObserver;
  v9 = [(LockScreenStateObserver *)&v18 init];
  v10 = v9;
  if (v9)
  {
    if (!v7) {
      __assert_rtn("-[LockScreenStateObserver initWithCallbackQueue:observer:]", "LockScreenStateObserver.m", 27, "callbackQueue != nil");
    }
    if (!v8) {
      __assert_rtn("-[LockScreenStateObserver initWithCallbackQueue:observer:]", "LockScreenStateObserver.m", 28, "observer != nil");
    }
    objc_storeStrong((id *)&v9->_callbackQueue, a3);
    objc_storeStrong((id *)&v10->_observer, a4);
    v10->_lockToken = 0;
    callbackQueue = v10->_callbackQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __58__LockScreenStateObserver_initWithCallbackQueue_observer___block_invoke;
    handler[3] = &unk_1E606A7F8;
    v12 = v10;
    v17 = v12;
    notify_register_dispatch("com.apple.springboard.lockstate", &v10->_lockToken, callbackQueue, handler);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__LockScreenStateObserver_initWithCallbackQueue_observer___block_invoke_2;
    v14[3] = &unk_1E606AC70;
    v15 = v12;
    if (initWithCallbackQueue_observer__onceToken != -1) {
      dispatch_once(&initWithCallbackQueue_observer__onceToken, v14);
    }
  }
  return v10;
}

uint64_t __58__LockScreenStateObserver_initWithCallbackQueue_observer___block_invoke(uint64_t a1)
{
  uint64_t state64 = 0;
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 24), &state64);
  *(unsigned char *)(*(void *)(a1 + 32) + 28) = state64 != 0;
  return [*(id *)(*(void *)(a1 + 32) + 16) LockScreenStateChanging:*(unsigned __int8 *)(*(void *)(a1 + 32) + 28)];
}

uint64_t __58__LockScreenStateObserver_initWithCallbackQueue_observer___block_invoke_2(uint64_t a1)
{
  uint64_t state64 = 0;
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 24), &state64);
  *(unsigned char *)(*(void *)(a1 + 32) + 28) = state64 != 0;
  return [*(id *)(*(void *)(a1 + 32) + 16) LockScreenStateChanging:*(unsigned __int8 *)(*(void *)(a1 + 32) + 28)];
}

@end