@interface CarPlayStateObserver
- (BOOL)getCarPlayState;
- (CarPlayStateObserver)initWithCallbackQueue:(id)a3 observer:(id)a4;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setCarPlayState:(BOOL)a3;
@end

@implementation CarPlayStateObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_observer, 0);
}

- (void)sessionDidDisconnect:(id)a3
{
}

- (void)sessionDidConnect:(id)a3
{
}

- (void)setCarPlayState:(BOOL)a3
{
  if (self->_carPlayConnected != a3)
  {
    self->_carPlayConnected = a3;
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__CarPlayStateObserver_setCarPlayState___block_invoke;
    block[3] = &unk_1E606AC70;
    block[4] = self;
    dispatch_async(callbackQueue, block);
  }
}

uint64_t __40__CarPlayStateObserver_setCarPlayState___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) carPlayStateChanging:*(unsigned __int8 *)(*(void *)(a1 + 32) + 8)];
}

- (BOOL)getCarPlayState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  callbackQueue = self->_callbackQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__CarPlayStateObserver_getCarPlayState__block_invoke;
  v5[3] = &unk_1E606AB38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async(callbackQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __39__CarPlayStateObserver_getCarPlayState__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 32) currentSession];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (CarPlayStateObserver)initWithCallbackQueue:(id)a3 observer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CarPlayStateObserver;
  char v9 = [(CarPlayStateObserver *)&v14 init];
  v10 = v9;
  if (v9)
  {
    if (!v7) {
      __assert_rtn("-[CarPlayStateObserver initWithCallbackQueue:observer:]", "CarPlayStateObserver.m", 26, "callbackQueue != nil");
    }
    if (!v8) {
      __assert_rtn("-[CarPlayStateObserver initWithCallbackQueue:observer:]", "CarPlayStateObserver.m", 27, "observer != nil");
    }
    objc_storeStrong((id *)&v9->_observer, a4);
    objc_storeStrong((id *)&v10->_callbackQueue, a3);
    v10->_carPlayConnected = 0;
    uint64_t v11 = objc_opt_new();
    carSessionStatus = v10->_carSessionStatus;
    v10->_carSessionStatus = (CARSessionStatus *)v11;

    [(CARSessionStatus *)v10->_carSessionStatus addSessionObserver:v10];
    [(CarPlayStateObserver *)v10 setCarPlayState:[(CarPlayStateObserver *)v10 getCarPlayState]];
  }

  return v10;
}

@end